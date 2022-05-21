<?php

/**
 *	LITHIUM TEMPLATE
 *	By Xemah | https://xemah.com
 *
**/

class LithiumTemplate extends TemplateBase
{
	public static $NAME = 'Lithium';
	public static $AUTHOR = '<a href="https://xemah.com" target=_blank">Xemah</a>';
	public static $VERSION = '1.14';
	public static $NAMELESS_VERSION = '2.0.0-pr12';

	public static $PATH;
	public static $PUBLIC_PATH;

	public function __construct($user, $pages, $queries, $smarty, $language)
	{
		$info = self::getInfo();
		if (!isset($info['version']) || version_compare($info['version'], self::$VERSION) != 0) {
			self::updateInfo(['version' => self::$VERSION]);
			self::initConfig();
		}

		$script = "
			<script>
				try {
					var lithiumIconElement = document.createElement('img');
					lithiumIconElement.src = 'https://cdn.xemah.com/lithium/template-icon.png';
					lithiumIconElement.style.cssText = 'float: left; width: 45px; height: 45px; margin-right: 0.75rem; border-radius: 50%;';
					var lithiumColumnElement = document.currentScript.parentElement.parentElement;
					lithiumColumnElement.insertBefore(lithiumIconElement, lithiumColumnElement.childNodes[0]);
				} catch (error) { }
			</script>
		";

		parent::__construct(self::$NAME, self::$VERSION, self::$NAMELESS_VERSION, $script . self::$AUTHOR);

		self::$PATH = ROOT_PATH . '/custom/templates/' . self::$NAME;
		self::$PUBLIC_PATH = (defined('CONFIG_PATH') ? CONFIG_PATH : '') . '/custom/templates/' . self::$NAME;
		
		$this->addCSSFiles([
			'https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.0.1/css/bootstrap.min.css' => [],
			'https://cdnjs.cloudflare.com/ajax/libs/toastr.js/2.1.4/toastr.min.css' => []
		]);

		$this->addJSFiles([
			'https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js' => [],
			'https://cdnjs.cloudflare.com/ajax/libs/jquery-cookie/1.4.1/jquery.cookie.min.js' => [],
			'https://cdnjs.cloudflare.com/ajax/libs/popper.js/2.9.1/umd/popper.min.js' => [],
			'https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.0.1/js/bootstrap.min.js' => [],
			'https://cdnjs.cloudflare.com/ajax/libs/toastr.js/2.1.4/toastr.min.js' => []
		]);

		$smarty->assign('FORUM_SPAM_WARNING_TITLE', $language->get('general', 'warning'));

		$lithiumSettings = self::getConfig();

		define('CHATBOX_SCRIPT', self::$PUBLIC_PATH . '/assets/js/chatbox.js');

		$darkMode = '0';
		if (Cookie::exists('dark-mode')) {
			if (Cookie::get('dark-mode') == '1') {
				$darkMode = '1';
			}
		} else {
			if ($lithiumSettings['enableDarkMode']) {
				$darkMode = '1';
			}
		}

		if ($darkMode) {
			define('TEMPLATE_TINY_EDITOR_STYLE', '../../../../../../custom/templates/' . self::$NAME . '/assets/css/tinymce/ui/dark');
		}

		if (defined('TEMPLATE_TINY_EDITOR_STYLE')) {
			$smarty->assign('TINY_EDITOR_STYLE', TEMPLATE_TINY_EDITOR_STYLE);
		} else {
			$smarty->assign('TINY_EDITOR_STYLE', 'oxide');
		}
		
		$this->_settings = __DIR__ . '/_settings/index.php';

		$this->_user = $user;
		$this->_pages = $pages;
		$this->_queries = $queries;
		$this->_smarty = $smarty;
		$this->_language = $language;
	}
	
	public function onPageLoad()
	{
		array_push($this->_smarty->security_policy->php_modifiers, 
			'array_filter',
			'in_array',
			'array_key_exists',
			'stripslashes',
			'trim',
			'strstr'
		);

		array_push($this->_smarty->security_policy->php_functions, 
			'json_encode'
		);

		$uploadsDir = LithiumTemplate::$PATH . '/uploads';
		if (!is_writable($uploadsDir)) {
			die('The directory <strong>' . $uploadsDir . '</strong> is not writable.');
		}
		
		$storageDir = LithiumTemplate::$PATH . '/_settings/storage';
		if (!is_writable($storageDir)) {
			die('The directory <strong>' . $storageDir . '</strong> is not writable.');
		}

		$this->_smarty->assign('LITHIUM', []);

		$lithiumSettings = self::getConfig();
		$this->_smarty->assign('LITHIUM_SETTINGS', $lithiumSettings);

		$lithiumLanguage = new Language(__DIR__ . '/_language', LANGUAGE);
		require($lithiumLanguage->getActiveLanguageDirectory() . '/general.php');
		$this->_smarty->assign('LITHIUM_LOCALE', $language);

		$route = '/';
		if (isset($_GET['route'])) {
			$route = rtrim($_GET['route'], '/');
		}

		$preloader = false;
		if ($lithiumSettings['enablePreloader']) {

			$preloader = true;
			
			$referer = null;
			if (isset($_SERVER['HTTP_REFERER'])) {
				$referer = $_SERVER['HTTP_REFERER'];
			}
	
			if ($referer) {
				$refererHost = parse_url($referer, PHP_URL_HOST);
				if ($refererHost === $_SERVER['HTTP_HOST']) {
					$preloader = false;
				}
			}

		}
		
		$this->_smarty->append('LITHIUM', ['preloader' => $preloader], true);

		$darkMode = '0';
		if (Cookie::exists('dark-mode')) {
			if (Cookie::get('dark-mode') == '1') {
				$darkMode = '1';
			}
		} else {
			if ($lithiumSettings['enableDarkMode']) {
				$darkMode = '1';
			}
		}

		$this->_smarty->append('LITHIUM', ['darkMode' => $darkMode], true);

		if ($this->_user->hasPermission('admincp.styles.templates.edit')) {

			$templateQuery = $this->_queries->getWhere('templates', ['name', '=', TEMPLATE]);
			if ($templateQuery) {
				$this->_smarty->append('LITHIUM', ['settingsUrl' => URL::build('/panel/core/templates/', 'action=settings&template=' . $templateQuery[0]->id)], true);
			}

		}

		$jsVariables = [
			'siteName' => SITE_NAME,
			'siteURL' => URL::build('/'),
			'fullSiteURL' => Util::getSelfURL() . ltrim(URL::build('/'), '/'),
			'page' => PAGE,
			'route' => $route,
			'avatarSource' => Util::getAvatarSource(),
			'debugging' => defined('DEBUGGING') && DEBUGGING == 1,
			'loggedIn' => $this->_user->isLoggedIn(),
			'cookieNotice'  => defined('COOKIE_NOTICE') && COOKIE_NOTICE == 1,
			'loadingTime' => defined('PAGE_LOAD_TIME') ? PAGE_LOAD_TIME : null,
			'collapsibleForums' => $lithiumSettings['collapsibleForums'] == 1,
			'prefetchForms' => $lithiumSettings['prefetchForms'] == 1,
			'stickyNavbar' => $lithiumSettings['stickyNavbar'] == 1,
			'darkMode' => $lithiumSettings['enableDarkMode'] == 1,
			'darkModeToggle' => $lithiumSettings['allowUsersToToggleDarkMode'] == 1,
			'headerZoomOnScroll' => $lithiumSettings['enableHeaderZoomOnScroll'] == 1,
			'headerParticles' => $lithiumSettings['enableHeaderParticles'] == 1,
			'headerParticlesColor' => $lithiumSettings['headerParticlesColor'],
			'portalParticles' => $lithiumSettings['enablePortalParticles'] == 1,
			'portalParticlesColor' => $lithiumSettings['portalParticlesColor'],
			'chroma' => $lithiumSettings['enableChroma'] == 1,
			'chromaSaturation' => $lithiumSettings['chromaSaturation'],
			'chromaLightness' => $lithiumSettings['chromaLightness'],
			'chromaMultiplier' => (float) $lithiumSettings['chromaMultiplier'],
			'locale' => [
				'submit' => $this->_language->get('general', 'submit'),
				'cancel' => $this->_language->get('general', 'cancel'),
				'close' => $this->_language->get('general', 'close'),
				'confirmDelete' => $this->_language->get('general', 'confirm_deletion'),
				'copied' => $this->_language->get('general', 'copied'),
				'cookieNotice' => $this->_language->get('general', 'cookie_notice'),
				'noMessages' => $this->_language->get('user', 'no_messages'),
				'newMessage1' => $this->_language->get('user', '1_new_message'),
				'newMessagesX' => $this->_language->get('user', 'x_new_messages'),
				'noAlerts' => $this->_language->get('user', 'no_alerts'),
				'newAlert1' => $this->_language->get('user', '1_new_alert'),
				'newAlertsX' => $this->_language->get('user', 'x_new_alerts'),
				'andMoreX' => $this->_language->get('general', 'and_x_more'),
				'bungeeInstance' => $this->_language->get('general', 'bungee_instance'),
				'noPlayersOnline' => $this->_language->get('general', 'no_players_online'),
				'offline' => $this->_language->get('general', 'offline'),
			]
		];

		if (defined('PAGE') && PAGE === 'cc_messaging') {
			$this->addCSSFiles([
				'https://cdnjs.cloudflare.com/ajax/libs/bootstrap-tokenfield/0.12.0/css/bootstrap-tokenfield.min.css' => [],
				'https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.css' =>[]
			]);
			$this->addJSFiles([
				'https://cdnjs.cloudflare.com/ajax/libs/bootstrap-tokenfield/0.12.0/bootstrap-tokenfield.min.js' => [],
				'https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js' => []
			]);
		}

		$this->addJSScript(PHP_EOL . implode(array_map(function($key, $value) {
			return 'var ' . $key . ' = ' . json_encode($value, JSON_PRETTY_PRINT) . ';' . PHP_EOL;
		}, array_keys($jsVariables), $jsVariables)), '');

		$this->addCSSFiles([
			'https://fonts.googleapis.com/css2?family=Montserrat:wght@200;300;400;500;600;700;800;900&display=swap' => [],
		]);

		if ($lithiumSettings['enableLineAwesomeIcons'] == 1) {
			$this->addCSSFiles([
				'https://cdnjs.cloudflare.com/ajax/libs/line-awesome/1.3.0/font-awesome-line-awesome/css/all.min.css' => [],
			]);
		} else {
			$this->addCSSFiles([
				'https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css' => [],
			]);
		}

		$this->addCSSFiles([
			self::$PUBLIC_PATH . '/assets/css/lithium.css?v=' . self::$VERSION => []
		]);

		if ($darkMode) {
			$this->addCSSFiles([
				self::$PUBLIC_PATH . '/assets/css/lithium-dark.css?v=' . self::$VERSION => []
			]);
		}

		$this->addJSFiles([
			self::$PUBLIC_PATH . '/assets/js/lithium.js?v=' . self::$VERSION => []
		]);

		if ($this->_user->isLoggedIn()) {
			$this->addJSFiles([
				self::$PUBLIC_PATH . '/assets/js/user.js?v=' . self::$VERSION => []
			]);
		}

		if (defined('PAGE') && PAGE == 'status') {
			$this->addJSFiles([
				self::$PUBLIC_PATH . '/assets/js/server.js?v=' . self::$VERSION => []
			]);
		}

		if ((PAGE === 'portal' && $lithiumSettings['enablePortalParticles'])
		|| (PAGE !== 'portal' && $lithiumSettings['enableHeaderParticles'])) {
			$this->addJSFiles([
				'https://cdnjs.cloudflare.com/ajax/libs/particles.js/2.0.0/particles.min.js' => [],
				self::$PUBLIC_PATH . '/assets/js/particles.js?v=' . self::$VERSION => []
			]);
		}

		if (!empty($this->_pages->getAjaxScripts())) {
			foreach ($this->_pages->getAjaxScripts() as $script) {
				$this->addJSScript('fetch(\'' . $script . '\')');
			}
		}
	}

	public static function getConfig()
	{
		$configFile = __DIR__ . '/_settings/storage/config.json';

		$configData = file_get_contents($configFile);
		if (!$configData) {
			$configData = '{}';
		}

		return json_decode($configData, 1);
	}

	public static function saveConfig($data)
	{
		$configFile = __DIR__ . '/_settings/storage/config.json';

		$configData = self::getConfig();
		$configData = json_encode(array_merge($configData, $data), JSON_PRETTY_PRINT);

		return file_put_contents($configFile, $configData);
	}

	public static function initConfig()
	{
		ob_start();
		require(__DIR__ . '/_settings/_functions.php');
		getPanels();
		ob_end_clean();
	}

	public static function getInfo()
	{
		$infoFile = __DIR__ . '/_settings/storage/info.json';

		$infoData = file_get_contents($infoFile);
		if (!$infoData) {
			$infoData = '{}';
		}

		return json_decode($infoData, 1);
	}

	public static function updateInfo($data)
	{
		$infoFile = __DIR__ . '/_settings/storage/info.json';

		$infoData = self::getInfo();
		$infoData = json_encode(array_merge($infoData, $data), JSON_PRETTY_PRINT);

		return file_put_contents($infoFile, $infoData);
	}
}

$template = new LithiumTemplate($user, $pages, $queries, $smarty, $language);