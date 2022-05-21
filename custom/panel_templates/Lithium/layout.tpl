{extends file="layout_container.tpl"}

{block name=layout}

	<div class="wrapper" id="wrapper">
	
		<header class="header{if ($LITHIUM_SETTINGS.headerFadeEffect == 'on' || ($LITHIUM_SETTINGS.headerFadeEffect == 'onlyOnLightMode' && !$LITHIUM.darkMode) || ($LITHIUM_SETTINGS.headerFadeEffect == 'onlyOnDarkMode' && $LITHIUM.darkMode))} faded{/if}" id="header" {if !empty($LITHIUM_SETTINGS.headerBackground)} style="background: url('{$LITHIUM_SETTINGS.headerBackground}') no-repeat center center / cover;"{/if}>
			{if ($LITHIUM_SETTINGS.enableHeaderParticles)}
				<div class="header-particles" id="particles-header"></div>
			{/if}
			{include file="_navbar.tpl"}
			{if ($LITHIUM_SETTINGS.enableHeader && (!$LITHIUM_SETTINGS.displayHeaderOnOnlyHomepage || $smarty.const.PAGE === 'index'))}
				<div class="container">
					<div class="header-logo{if ($LITHIUM_SETTINGS.enableHeaderLogoAnimation)} animated{/if}">
						<a href="{$SITE_HOME}">
							<img src="{$LITHIUM_SETTINGS.headerLogo}" alt="{$SITE_NAME}">
						</a>
					</div>
					{if ($LITHIUM_SETTINGS.displayMinecraftServer)}
						<a href="#" class="header-status header-status-left" id="status-minecraft" onclick="return copy('#ip-minecraftServer');" data-ip="{$LITHIUM_SETTINGS.minecraftServerIp}" data-bs-toggle="tooltip" title="{$LITHIUM_LOCALE.clickToCopy}">
							<div class="header-status-icon">
								{$LITHIUM_SETTINGS.minecraftServerIcon}
							</div>
							<div class="header-status-content">
								<div class="header-status-title">
									<span id="ip-minecraftServer">{$LITHIUM_SETTINGS.minecraftServerIp}</span>
								</div>
								<div class="header-status-description">
									{$LITHIUM_LOCALE.xPlayersOnline|replace:'{x}':'<span id="count-minecraftServerPlayers">??</span>'}
								</div>
							</div>
						</a>
					{/if}
					{if ($LITHIUM_SETTINGS.displayDiscordServer)}
						<a href="{$LITHIUM_SETTINGS.discordServerInviteLink}" class="header-status header-status-right" id="status-discord" data-id="{$LITHIUM_SETTINGS.discordServerId}" data-bs-toggle="tooltip" title="{$LITHIUM_LOCALE.clickToJoin}">
							<div class="header-status-icon">
								{$LITHIUM_SETTINGS.discordServerIcon}
							</div>
							<div class="header-status-content">
								<div class="header-status-title">
									{$LITHIUM_LOCALE.joinDiscordServer}
								</div>
								<div class="header-status-description">
									{$LITHIUM_LOCALE.xUsersOnline|replace:'{x}':'<span id="count-discordServerUsers">??</span>'}
								</div>
							</div>
						</a>
					{/if}
				</div>
			{/if}
		</header>

		<main class="main">
			<div class="container">
				{if ($LITHIUM_SETTINGS.enableWelcomeMessage && !isset($LOGGED_IN_USER))}
					<div class="announcement announcement-success">
						<div class="announcement-icon">
							<i class="fas fa-user"></i>
						</div>
						<div class="announcement-content">
							<div class="announcement-title">
								{$LITHIUM_SETTINGS.welcomeMessageTitle}
							</div>
							<div class="announcement-description">
								{$LITHIUM_SETTINGS.welcomeMessageDescription}
							</div>
							<div class="announcement-actions">
								<a href="{$SITE_HOME}login" class="btn btn-secondary btn-sm" data-request-modal="login">{$LITHIUM_LOCALE.login}</a>
								<a href="{$SITE_HOME}register" class="btn btn-success btn-sm" data-request-modal="register">{$LITHIUM_LOCALE.register}</a>
							</div>
						</div>
					</div>
				{/if}
				{if !empty($ANNOUNCEMENTS)}
					{foreach from=$ANNOUNCEMENTS item=announcement}
						<div class="announcement" id="announcement-{$announcement->id}" style="--announcement-background-color: {$announcement->background_colour}; --announcement-text-color: {$announcement->text_colour};">
							{if !empty($announcement->icon)}
								<div class="announcement-icon">
									<i class="{$announcement->icon}"></i>
								</div>
							{/if}
							<div class="announcement-content">
								{if ($announcement->closable)}
									<a href="#" class="close">
										<i class="fas fa-times"></i>
									</a>
								{/if}
								<div class="announcement-title">
									{$announcement->header}
								</div>
								<div class="announcement-description">
									{$announcement->message|htmlspecialchars_decode}
								</div>
							</div>
						</div>
					{/foreach}
				{/if}
				{if ($LITHIUM_SETTINGS.enableCarousel && !empty($LITHIUM_SETTINGS.carouselItems))}
					{if ($LITHIUM_SETTINGS.enableCarouselGlobally || (('PAGE'|defined && !empty($LITHIUM_SETTINGS.carouselPages) && $smarty.const.PAGE|in_array:$LITHIUM_SETTINGS.carouselPages)))}
						<div class="carousel slide" id="carousel" data-bs-ride="carousel" style="--carousel-max-height: {$LITHIUM_SETTINGS.carouselMaxHeight};">
							<div class="carousel-inner">
								{for $i=0 to count($LITHIUM_SETTINGS.carouselItems.image) - 1}
									<a{if !empty($LITHIUM_SETTINGS.carouselItems.link.$i)} href="{$LITHIUM_SETTINGS.carouselItems.link.$i}"{/if} class="carousel-item{if ($i == 0)} active{/if}" data-bs-interval="{$LITHIUM_SETTINGS.carouselSlideInterval * 1000}">
										<img src="{$LITHIUM_SETTINGS.carouselItems.image.$i}" alt="{$LITHIUM_SETTINGS.carouselItems.title.$i}">
										<div class="carousel-caption d-none d-md-block">
											<h5>{$LITHIUM_SETTINGS.carouselItems.title.$i}</h5>
											<p>{$LITHIUM_SETTINGS.carouselItems.description.$i}</p>
										</div>
									</a>
								{/for}
							</div>
							{if ($LITHIUM_SETTINGS.enableCarouselControls)}
								<div class="carousel-indicators">
									{for $i=0 to count($LITHIUM_SETTINGS.carouselItems.image) - 1}
										<button type="button" data-bs-target="#carousel" data-bs-slide-to="{$i}"{if ($i == 0)} class="active"{/if}></button>
									{/for}
								</div>
								<button type="button" class="carousel-control-prev" data-bs-target="#carousel" data-bs-slide="prev">
									<span class="carousel-control-prev-icon"></span>
								</button>
								<button type="button" class="carousel-control-next" data-bs-target="#carousel" data-bs-slide="next">
									<span class="carousel-control-next-icon"></span>
								</button>
							{/if}
						</div>
					{/if}
				{/if}
				{if isset($NEW_UPDATE)}
					<div class="alert alert-{($NEW_UPDATE_URGENT == true) ? 'danger' : 'info alert-dismissible fade show'}" id="alert-update">
						{if ($NEW_UPDATE_URGENT !== true)}
							<a href="#" class="close" data-bs-dismiss="alert">
								<i class="fas fa-times"></i>
							</a>
						{/if}
						<div class="alert-heading">
							{$NEW_UPDATE}
						</div>
						<ul>
							<li>{$CURRENT_VERSION}</li>
							<li>{$NEW_VERSION}</li>
						</ul>
						<div>
							<a href="{$UPDATE_LINK}" class="btn btn-info btn-sm">{$UPDATE}</a>
						</div>
					</div>
				{/if}
				{if isset($MAINTENANCE_ENABLED)}
					<div class="alert alert-danger alert-dismissible fade show">
						<a href="#" class="close" data-bs-dismiss="alert">
							<i class="fas fa-times"></i>
						</a>
						{$MAINTENANCE_ENABLED}
					</div>
				{/if}
				{if isset($MUST_VALIDATE_ACCOUNT)}
					<div class="alert alert-info">
						{$MUST_VALIDATE_ACCOUNT}
					</div>
				{/if}
				{if isset($HOME_SESSION_FLASH)}
					<div class="alert alert-info">
						{$HOME_SESSION_FLASH}
					</div>
				{/if}
				{if isset($HOME_SESSION_ERROR_FLASH)}
					<div class="alert alert-danger">
						{$HOME_SESSION_ERROR_FLASH}
					</div>
				{/if}
				{block name=heading}{/block}
				<div class="row">
					{if isset($WIDGETS_PAGE) && $WIDGETS_PAGE == true}
						{if !empty($WIDGETS_LEFT) && !empty($WIDGETS_RIGHT)}
							<div class="col-xl-6 col-lg-8">
						{else if !empty($WIDGETS_LEFT) || !empty($WIDGETS_RIGHT)}
							<div class="col-xl-9 col-lg-8">
						{else}
							<div class="col-lg-12">
						{/if}
					{else}
						<div class="col">
					{/if}
						<div class="content">
							<div id="chatbox-top"></div>
							{block name=content}{/block}
							<div id="chatbox-bottom"></div>
						</div>
					</div>
					{if isset($WIDGETS_PAGE) && $WIDGETS_PAGE == true}
						{if !empty($WIDGETS_LEFT)}
							<div class="col-xl-3 col-lg-4 order-first d-none d-xl-block">
								<div>
									{foreach from=$WIDGETS_LEFT item=widget}
										<div class="widget">
											{$widget}
										</div>
									{/foreach}
								</div>
							</div>
						{/if}
						{if !empty($WIDGETS_LEFT) || !empty($WIDGETS_RIGHT)}
							<div class="col-xl-3 col-lg-4{if empty($WIDGETS_RIGHT)} d-xl-none order-first{/if}">
								{if !empty($WIDGETS_LEFT)}
									<div class="d-xl-none{if !empty($WIDGETS_RIGHT)} mb-4{/if}">
										{foreach from=$WIDGETS_LEFT item=widget}
											<div class="widget">
												{$widget}
											</div>
										{/foreach}
									</div>
								{/if}
								{if !empty($WIDGETS_RIGHT)}
									<div>
										{foreach from=$WIDGETS_RIGHT item=widget}
											<div class="widget">
												{$widget}
											</div>
										{/foreach}
									</div>
								{/if}
							</div>
						{/if}
					{/if}
				</div>
			</div>
		</main>

		{include file="_footer.tpl"}

		{if isset($GLOBAL_WARNING_TITLE)}
			<div class="modal fade show show-punishment" id="modal-acknowledge">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<div class="modal-title">
								{$GLOBAL_WARNING_TITLE}
							</div>
						</div>
						<div class="modal-body">
							<p>{$GLOBAL_WARNING_REASON}</p>
						</div>
						<div class="modal-footer">
							<a href="{$GLOBAL_WARNING_ACKNOWLEDGE_LINK}" class="btn btn-warning btn-sm">{$GLOBAL_WARNING_ACKNOWLEDGE}</a>
						</div>
					</div>
				</div>
			</div>
			<script>
				document.addEventListener('DOMContentLoaded', () => {
					const acknowledgeModal = new bootstrap.Modal(document.querySelector('#modal-acknowledge'));
					acknowledgeModal.show();
				});
			</script>
		{/if}

		<div class="loading-bar"></div>

		{if ($LITHIUM_SETTINGS.enableScrollToTopButton)}
			<div class="scroll-to-top" id="button-scrollToTop">
				<a href="#" data-bs-toggle="tooltip" title="{$LITHIUM_LOCALE.scrollToTop}">
					<i class="fas fa-angle-up"></i>
				</a>
			</div>
		{/if}

	</div>
	
{/block}