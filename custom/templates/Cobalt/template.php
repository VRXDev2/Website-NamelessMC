<?php
/*
 *	Made by Coldfire - https://coldfiredzn.com
 *
 *  Cobalt Template
 */
 
/*  
 *  ValentinXD
 *  21683
 *  83139
 *  1649870447
 *  a054306a9a3fd032ded20ec917c6e6a0
 *  9c4a5c8b321ac5507c4f7aa2484c8867
 */

class Cobalt_Template extends TemplateBase {
	private $_language, $_user, $_pages, $_template;

	public function __construct($cache, $smarty, $language, $user, $pages, $widgets){

		$cobalt_language = new Language(ROOT_PATH . '/custom/templates/Cobalt/template_settings/language', LANGUAGE);

		require(ROOT_PATH . '/custom/templates/Cobalt/template_settings/access_settings.php');
		require(ROOT_PATH . '/custom/templates/Cobalt/template_settings/vars.php');

		$template = array(
			'name' => 'Cobalt',
			'version' => Output::getClean($cobalt_local_version),
			'nl_version' => '2.0.0-pr12',
			'author' => '<a href="' . Output::getClean($coldfire_url) . '" target="_blank" rel="nofollow noopener">Coldfire</a>',
		);
		
		$template['path'] = (defined('CONFIG_PATH') ? CONFIG_PATH : '') . '/custom/templates/' . $template['name'] . '/';

		parent::__construct($template['name'], $template['version'], $template['nl_version'], $template['author']);

		$this->_settings = ROOT_PATH . '/custom/templates/Cobalt/template_settings/settings.php';
		
		foreach ($cobalt_settings_array as $value) {
    		$setting_name = $value[0];
    		if (isSettingStored($value[0])) {
        		$$setting_name = getSetting($value[0]);
    		} else {  
				$$setting_name = $value[1];
				storeSetting($value[0], $value[1]);
    		}
		}

		if ($serve_lib_cdn == "yes") {
		    
		    $this->addCSSFiles(array(
				'https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css' => array('integrity' => 'sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn', 'crossorigin' => 'anonymous')
			));
			
			$this->addJSFiles(array(
				'https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.min.js' => array('integrity' => 'sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=', 'crossorigin' => 'anonymous'),
				'https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js' => array('integrity' => 'sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF', 'crossorigin' => 'anonymous'),
				'https://cdn.jsdelivr.net/npm/sweetalert2@11.2.0/dist/sweetalert2.all.min.js' => array('integrity' => 'sha256-tGZXBB9uK3MK1zLsI8b/1gZYQcBl8TMTi52kA2RmEKc=', 'crossorigin' => 'anonymous')
			));
			
			$smarty->assign('INSTANT_PAGE_SCRIPT', '<script src="//instant.page/5.1.0" type="module" integrity="sha384-by67kQnR+pyfy8yWP4kPO12fHKRLHZPfEsiSXR8u2IKcTdxD805MGUXBzVPnkLHw"></script>');
			
		} else {
		    
		    $this->addCSSFiles(array(
				$template['path'] . 'css/bootstrap.min.css' => array()
			));
			
			$this->addJSFiles(array(
				$template['path'] . 'js/lib/jquery.min.js' => array(),
				$template['path'] . 'js/lib/bootstrap.bundle.min.js' => array(),
				$template['path'] . 'js/lib/sweetalert2.all.min.js' => array()
			));
			
			$smarty->assign('INSTANT_PAGE_SCRIPT', '<script src="' . $template['path'] . 'js/lib/instantpage.min.js" type="module"></script>');
			
		}
		
		$this->addCSSFiles(array(
			$template['path'] . 'css/cobalt.css?v=' . Output::getClean($cobalt_local_version) => array(),
			'https://use.fontawesome.com/releases/v6.0.0/css/all.css' => array('rel' => 'preload', 'as' => 'style', 'onload' => "this.onload=null;this.rel='stylesheet'"),
			'https://fonts.googleapis.com/css2?family=Montserrat:wght@400;500;600&display=swap' => array('rel' => 'preload', 'as' => 'style', 'onload' => "this.onload=null;this.rel='stylesheet'")
		));

		$this->addJSFiles(array(
			(defined('CONFIG_PATH') ? CONFIG_PATH : '') . '/core/assets/js/jquery.cookie.js' => array()
		));

		if((null !== Output::getClean($particles)) && Output::getClean($particles) == "yes"){
		    if ($serve_lib_cdn == "no") {
			    $this->addJSFiles(array(
				    $template['path'] . 'js/lib/tsparticles.min.js' => array()
			    ));
			    $smarty->assign('THEME_PARTICLES_SCRIPT', '<script src="' . $template['path'] . 'js/lib/tsparticles.min.js' . '"></script>');
		    } else {
		        $this->addJSFiles(array(
				    'https://cdn.jsdelivr.net/npm/tsparticles@1.39.3/tsparticles.min.js' => array('integrity' => 'sha256-CGTXk49NPei0eRo1PL2NVebBLfmfE7PQlx0ktUIpM+o=', 'crossorigin' => 'anonymous')
			    ));
			    $smarty->assign('THEME_PARTICLES_SCRIPT', '<script src="https://cdn.jsdelivr.net/npm/tsparticles@1.39.3/tsparticles.min.js" integrity="sha256-CGTXk49NPei0eRo1PL2NVebBLfmfE7PQlx0ktUIpM+o=" crossorigin="anonymous"></script>');
		    }
		}
		
		$this->addJSScript('
			var particles = "' . Output::getClean($particles) .'";
			var swal_server_copy = "' . $cobalt_language->get('language', 'swal_server_copy') .'";
			var discord_server = "' . Output::getClean($discord_server_id) . '";
			var mc_server = "' . Output::getClean($mc_server) . '";
			var ds_box = "' . Output::getClean($ds_box) . '";
			var ds_breakpoint = "' . Output::getClean(trim($ds_breakpoint, 'px')) . '";
			var users_online = "' . $cobalt_language->get('language', 'users_online') .'";
			var user_online = "' . $cobalt_language->get('language', 'user_online') .'";
			var players_online = "' . $cobalt_language->get('language', 'players_online') .'";
			var player_online = "' . $cobalt_language->get('language', 'player_online') .'";
			var server_offline = "' . $cobalt_language->get('language', 'server_offline') .'";
		');

		define('TEMPLATE_TINY_EDITOR_STYLE', 'default-revamp');
		define('CHATBOX_SCRIPT', $template['path'] . 'js/core/chatbox.js?v=1');

		$logo_size_trimmed = trim($logo_size, 'px');
		$bg_height_trimmed = trim($bg_height, 'px');
		$logo_size_m_trimmed = trim($logo_size_m, 'px');
		$bg_height_m_trimmed = trim($bg_height_m, 'px');

		if (Output::getClean($navbar) == "bottom") {
			$box_margin_final = (($bg_height_trimmed - 48 - 100) / 2);
			$header_size_after = (($bg_height_trimmed - 100) / 2);
		} else {
			$box_margin_final = ((($bg_height_trimmed - 100 + 80 - 48)) / 2);		
			$header_size_after = ((($bg_height_trimmed - 100 + 80)) / 2);	
		}

		if (Output::getClean($al) == "yes") {
			if (Output::getClean($navbar) == "top") {
				$logo_margin_final = ((($bg_height_trimmed - $logo_size_trimmed - 100 + 80) / 2) - 5);
				$logo_margin_m_final = ((($bg_height_m_trimmed - $logo_size_m_trimmed - 100 + 70) / 2) - 5);
			} else {
				$logo_margin_final = ((($bg_height_trimmed - $logo_size_trimmed - 100) / 2) - 5);
				$logo_margin_m_final = ((($bg_height_m_trimmed - $logo_size_m_trimmed - 100) / 2) - 5);
			}
		} else {
			if (Output::getClean($navbar) == "top") {
				$logo_margin_final = (($bg_height_trimmed - $logo_size_trimmed - 100 + 80) / 2);
				$logo_margin_m_final = (($bg_height_m_trimmed - $logo_size_m_trimmed - 100 + 70) / 2);
			} else {
				$logo_margin_final = (($bg_height_trimmed - $logo_size_trimmed - 100) / 2);
				$logo_margin_m_final = (($bg_height_m_trimmed - $logo_size_m_trimmed - 100) / 2);
			}
		}
		
		$this->addCSSStyle('
		
			:root {
		        --p-color: '. Output::getClean($p_color) .';
		    }
		
		    /* Primary Color */
		    .discord-text .st0, .status-text path, .discord-icon .st0, .status-icon path {fill: var(--p-color) !important;}
			.swal2-icon.swal2-info, .cobalt-update-box .update-icon, .header-theme, .news-title, .top-text, .error-title, .lr-title, .p-icon, .theme-text, .other-btn:after, .other-btn:focus:after, .footer-text-header:after, .widget-header-txt:after, .discord-text .icon:after, .status-text .icon:after, .wiki-page-card span strong, .dropdown-item.d-header, .rules-menu .active span, .rules-menu .active i, .welcome-title {color: var(--p-color) !important;}
			a, a:hover, a:focus {color: var(--p-color)}
			.color-overlay {background: linear-gradient(var(--p-color), #101010);}
			.swal2-icon.swal2-info, .page-item.active .page-link, .user-nav-link.active, .profile-about-box, .rules-menu-link.active {border-color: '. Output::getClean($p_color) .' !important;}
			.swal2-styled.swal2-confirm, .widget-header-txt:after, .discord-text .icon:after, .status-text .icon:after, .nav-link.store-link, .footer-text-header:after, .badge-theme, #toast-container, .progress-bar, .login-overlay, .register-overlay, .vote-tabs .btn.btn-theme.active, .p-color-overlay, .modal-header, .btn-theme, .button-checkbox>.active, .spoiler .spoiler-toggle, .spoiler .spoiler-title, .page-item.active .page-link, .btn.profile-btn.active:after {background-color: var(--p-color) !important;}
			.swal2-styled.swal2-confirm:hover, .spoiler .spoiler-toggle:hover, .spoiler .spoiler-title:hover, .btn-theme:hover {background-color: var(--p-color) !important; filter: brightness(0.85)}
			
			/* Header */
			.header:after {height: '. Output::getClean($header_size_after) .'px; background: linear-gradient(rgba(0, 0, 0, '. Output::getClean($header_bg_shading) .'), transparent);} .header:before {background: linear-gradient(rgba(0, 0, 0, '. Output::getClean($header_bg_shading) .'), #101010);}
			.header {background-position: center ' . Output::getClean($header_bg_position) . ' !important}
			@media (min-width: 769px) {.header {height: '. Output::getClean($bg_height) .'}}
			@media (max-width: 768px) {.header {height: '. Output::getClean($bg_height_m) .'}}
		    @media (min-width: 769px) {.logo {height: '. Output::getClean($logo_size) .'; margin-top: '. $logo_margin_final .'px}}
		    @media (max-width: 768px) {.logo {height: '. Output::getClean($logo_size_m) .'; margin-top: '. $logo_margin_m_final .'px}}
		    .status-text, .discord-text {margin-top: '. $box_margin_final .'px}
		    @media (max-width: ' . $ds_breakpoint .') {.status-box-container .text, .discord-box-container .text {display: none}}
		    .line-scale > div {background-color: '. Output::getClean($loader_color) .';}
		    
		    /* Other */
		    .login-overlay, .register-overlay {opacity: ' . Output::getClean($lr_coverlay_opacity) . ' !important}
		
		');
		
		if (Output::getClean($navbar_alignment) !== "left" && Output::getClean($navbar) !== "bottom") {
			$this->addCSSStyle('.navbar-nav .nav-item:first-child {margin-left: ' . Output::getClean($navbar_offset) . ' !important}');
		}

		if((null !== Output::getClean($blur_header_bg)) && Output::getClean($blur_header_bg) !== "no"){
			$this->addCSSStyle('.header {filter: blur(3px)}');
		}

		if (Output::getClean($header_bg) != null) {
			$this->addCSSStyle('.webp .header {background: url(\'' . Output::getClean($header_bg_webp) . '\') no-repeat;}');
			$this->addCSSStyle('.no-webp .header {background: url(\'' . Output::getClean($header_bg) . '\') no-repeat;}');
		}
	
		if((null !== Output::getClean($nav_store_glow)) && Output::getClean($nav_store_glow) !== "no"){
		    $this->addCSSStyle('.navbar-bottom .store-link:after, .navbar-bottom .store-link:focus:after, .navbar-top-new .store-link:after, .navbar-top-new .store-link:focus:after {box-shadow: 0px 0px 12px 0px '. Output::getClean($p_color) .'}');
		}
		
		if((null !== Output::getClean($slider_height)) && Output::getClean($enable_slider) == "yes") {
			$this->addCSSStyle('.cobalt-carousel .carousel-item {height: ' . $slider_height . '}');
		}
		
		if((null !== Output::getClean($slider_height_m)) && Output::getClean($enable_slider) == "yes") {
			$this->addCSSStyle('@media (max-width: 768px) {.cobalt-carousel .carousel-item {height: ' . $slider_height_m . ' !important}}');
		}
		
		if((null !== Output::getClean($portal_color_overlay)) && Output::getClean($portal_color_overlay) !== "no"){
			$this->addCSSStyle('.p-image-frame {z-index: 1; opacity: ' . $portal_color_overlay_opacity . '}');
		} else {
			$this->addCSSStyle('.p-image-frame {z-index: 4; opacity: 1}');
		}

		if((null !== Output::getClean($rules_fa_icons)) && Output::getClean($rules_fa_icons) == "no"){
			$this->addCSSStyle('.rules-menu-link span {margin-left: 1rem}');
		}

		/* Store Widget */
		list($r, $g, $b) = sscanf($p_color, "#%02x%02x%02x");
		$rgb_color = "$r $g $b";
		if (isset($store_box_img) && $store_box_img != null) {
			$this->addCSSStyle('
				.store-box {
					border: 3px solid ' . $p_color . ';
					box-shadow: 0 0 10px rgb(' . $rgb_color . ' / 50%);
				}
				.webp .store-box {
					background: linear-gradient(to bottom, rgba(' . $rgb_color . ' / 70%), rgba(' . $rgb_color . ' / 70%)), url(' . $store_box_img_webp . ') no-repeat center;
				}
				.no-webp .store-box {
					background: linear-gradient(to bottom, rgba(' . $rgb_color . ' / 70%), rgba(' . $rgb_color . ' / 70%)), url(' . $store_box_img . ') no-repeat center;
				}
			');
		} else {
			$this->addCSSStyle('
				.store-box {
					border: 3px solid ' . $p_color . ';
					box-shadow: 0 0 10px rgb(' . $rgb_color . ' / 50%);
				}
				.webp .store-box {
					background: linear-gradient(to bottom, rgba(' . $rgb_color . ' / 70%), rgba(' . $rgb_color . ' / 70%));
				}
				.no-webp .store-box {
					background: linear-gradient(to bottom, rgba(' . $rgb_color . ' / 70%), rgba(' . $rgb_color . ' / 70%));
				}
		');
		}
		
		if((null !== Output::getClean($custom_css)) && Output::getClean($custom_css) !== ""){
			$this->addCSSStyle($custom_css);
		}

  		if($cache->isCached('cobalt_rn') && $cache->retrieve('cobalt_rn') == "yes"){
  		    die("Your website has been blocked because it has been detected as using a leaked version of cobalt. If your copy is not leaked, visit https://coldfiredzn.com/discord for help");
  		}

		foreach ($cobalt_settings_array as $value) {
            if ($value[2] !== '') {
				$output_value = $value[0];
				$smarty->assign($value[2], $$output_value);
            }
        }

		$smarty->assign('THEME_COLDFIRE_URL', Output::getClean($coldfire_url));
		$smarty->assign('THEME_COLDFIRE_CREDIT_IMG', $template['path'] . 'template_settings/coldfire.png');
		$smarty->assign('THEME_COLDFIRE_CREDIT_IMG_WEBP', $template['path'] . 'template_settings/coldfire.webp');
		$smarty->assign('THEME_LOCAL_VERSION', Output::getClean($cobalt_local_version));
		$smarty->assign('THEME_MOD_PATH', $template['path'] . 'js/core/mod.min.js');

		$smarty->assign('LOADING', $language->get('general', 'loading'));
		$smarty->assign('HOME', $language->get('general', 'home'));
		$smarty->assign('STATUS', $language->get('general', 'status'));
		$smarty->assign('LOGIN', $language->get('general', 'sign_in'));
		$smarty->assign('REGISTER', $language->get('general', 'register'));
		$smarty->assign('NEWS_BUTTON', $cobalt_language->get('language', 'news_button'));
		$smarty->assign('NEWS_ERROR_TITLE', $cobalt_language->get('language', 'news_error_title'));
		$smarty->assign('NEWS_ERROR_DESC', $cobalt_language->get('language', 'news_error_desc'));
		$smarty->assign('FOOTER_LINKS', $cobalt_language->get('language', 'links_footer'));
		$smarty->assign('MC_SERVER_CLICK', $cobalt_language->get('language', 'mc_server_click'));
		$smarty->assign('DISCORD_SERVER_CLICK', $cobalt_language->get('language', 'discord_server_click'));
		$smarty->assign('MENU', $cobalt_language->get('language', 'menu'));
		$smarty->assign('UPDATE_AVAILABLE', $cobalt_language->get('language', 'update_available'));

		if ($user->canViewStaffCP()) {
			$smarty->assign('STAFF_USER', "yes");
		} else {
			$smarty->assign('STAFF_USER', "no");
		}

		// External Updater
		$cache->setCache('cobalt_template');

		if($ext_update == "yes"){

			if(!$cache->isCached('cobalt_version')){
  				$cobalt_api = file_get_contents('https://cdn.coldfiredzn.com/cobalt/updater.json');
  				$cobalt_api_decode = json_decode($cobalt_api, true);
  				$cobalt_version = $cobalt_api_decode["cobalt_version"];
  				$cache->store('cobalt_version', $cobalt_version, 86400);
			} else {
  				$cobalt_version = $cache->retrieve('cobalt_version');
			}

			$smarty->assign('COBALT_VERSION', $cobalt_version);
		}
  			
  		$local_rn = "282332";
		if(!$cache->isCached('cobalt_r_number_match')){
  			$cobalt_rn_api = file_get_contents('https://cdn.coldfiredzn.com/cobalt/al.json');
  			$cobalt_rn_api_decode = json_decode($cobalt_rn_api, true);
  			
  			for($i=0; $i<count($cobalt_rn_api_decode['random_numbers']); $i++) {
  			    if ($cobalt_rn_api_decode['random_numbers'][$i] == $local_rn) {
  			        $cache->store('cobalt_rn', "yes");
  			    }
  			}
  			
  			$cache->store('cobalt_r_number_match', "Checked", 86400);
		}
		
		$smarty->assign('COPY', $language->get('general', 'click_to_copy_tooltip'));
		$smarty->assign('TEMPLATE', $template);

		$this->_template = $template;
		$this->_language = $language;
		$this->_user = $user;
		$this->_pages = $pages;
		$this->_widgets = $widgets;
		$this->_cache = $cache;
		$this->_smarty = $smarty;

	}

	public function onPageLoad(){
	    
		$route = (isset($_GET['route']) ? rtrim($_GET['route'], '/') : '/');

		$JSVariables = array(
		    'siteName' => SITE_NAME,
		    'siteURL' => URL::build('/'),
		    'fullSiteUrl' => Util::getSelfURL() . ltrim(URL::build('/'), '/'),
			'page' => PAGE,
			'pjsPath' => $this->_template['path'] . 'js/particles-settings.json',
			'copied' => $this->_language->get('general', 'copied'),
			'close' => $this->_language->get('general', 'close'),
		    'loading' => $this->_language->get('general', 'loading'),
		    'cookieNotice' => $this->_language->get('general', 'cookie_notice'),
			'cookieAgree' => $this->_language->get('general', 'cookie_agree'),
		    'noMessages' => $this->_language->get('user', 'no_messages'),
		    'newMessage1' => $this->_language->get('user', '1_new_message'),
		    'newMessagesX' => $this->_language->get('user', 'x_new_messages'),
		    'noAlerts' => $this->_language->get('user', 'no_alerts'),
		    'newAlert1' => $this->_language->get('user', '1_new_alert'),
		    'newAlertsX' => $this->_language->get('user', 'x_new_alerts'),
		    'debugging' => ((defined('DEBUGGING') && DEBUGGING == 1) ? '1' : '0'),
		    'loggedIn' => ($this->_user->isLoggedIn() ? '1' : '0'),
		    'cookie'  => (defined('COOKIE_NOTICE') ? '1' : '0'),
		    'confirmDelete' => $this->_language->get('general', 'confirm_deletion'),
		    'offline' => $this->_language->get('general', 'offline'),
		    'noPlayersOnline' => $this->_language->get('general', 'no_players_online'),
		    'bungeeInstance' => $this->_language->get('general', 'bungee_instance'),
		    'online' => $this->_language->get('general', 'online'),
		    'avatarSource' => Util::getAvatarSource(),
		    'andMoreX' => $this->_language->get('general', 'and_x_more'),
		    'loadingTime' => ((defined('PAGE_LOADING') && PAGE_LOADING == 1) ? PAGE_LOAD_TIME : ''),
		    'route' => $route
		);

 		$JSVars = '';
	    $i = 0;
		foreach ($JSVariables as $var => $value) {
		    $JSVars .= ($i == 0 ? 'var ' : ', ') . $var . ' = "' . $value . '"';
		    $i++;
		}
		
		$this->addJSScript($JSVars);

		if(defined('PAGE')){
			if(PAGE == 'cc_messaging'){
				$this->addCSSFiles(array(
					$this->_template['path'] . 'css/bootstrap-tokenfield.min.css' => array(),
					(defined('CONFIG_PATH') ? CONFIG_PATH : '') . '/core/assets/css/jquery-ui.min.css' => array()
				));
				$this->addJSFiles(array(
					'https://cdn.jsdelivr.net/npm/bootstrap-tokenfield@0.12.0/dist/bootstrap-tokenfield.min.js' => array(),
					(defined('CONFIG_PATH') ? CONFIG_PATH : '') . '/core/assets/js/jquery-ui.min.js' => array()
				));
			}
			if (PAGE == 'resources_licenses') {
				$this->addCSSFiles(array(
					$this->_template['path'] . 'css/typeaheadjs.css' => array(),
				));

				$this->addJSFiles(array(
					$this->_template['path'] . 'js/lib/typeahead.bundle.min.js' => array(),
				));
			}
		}

		$this->addJSFiles(array(
			$this->_template['path'] . 'js/core/core.js?v=7' => array(),
			$this->_template['path'] . 'js/core/user.js?v=1' => array(),
			$this->_template['path'] . 'js/core/pages.js?v=1' => array()
		));

		if(strpos($route, '/forum/topic/') !== false){
			$this->addJSFiles(array(
				(defined('CONFIG_PATH') ? CONFIG_PATH : '') . '/core/assets/js/jquery-ui.min.js' => array(),
				'https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js' => array('integrity' => 'sha512-VEd+nq25CkR676O+pLBnDW09R7VQX9Mdiij052gVCp5yVH3jGtH70Ho/UUv4mJDsEdTvqRCFZg0NKGiojGnUCw==', 'crossorigin' => 'anonymous'),
			));
			$this->addCSSFiles(array(
				'https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css' => array('integrity' => 'sha512-vKMx8UnXk60zUwyUnUPM3HbQo8QfmNx7+ltw8Pm5zLusl1XIfwcxo8DbWCqMGKaWeNxWA8yrx5v3SaVpMvR3CA==', 'crossorigin' => 'anonymous'),
			));

		}

		if(count($this->_pages->getAjaxScripts())){
			foreach($this->_pages->getAjaxScripts() as $script)
		    	$this->addJSScript('$.getJSON(\'' . $script . '\', function(data) {});');
		}

	}
}

$template = new Cobalt_Template($cache, $smarty, $language, $user, $pages, $widgets);