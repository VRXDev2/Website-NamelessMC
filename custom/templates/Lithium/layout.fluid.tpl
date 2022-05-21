{extends file="layout_container.tpl"}

{block name=layout}
	
	<div class="wrapper wrapper-fluid" id="wrapper"{if !empty($LITHIUM_SETTINGS.customLayoutBackground)} style="background: url('{$LITHIUM_SETTINGS.customLayoutBackground}') no-repeat center center / cover;"{/if}>
	
		<header class="header">
			<div class="container">
				<a href="{$SITE_HOME}" class="header-logo{if ($LITHIUM_SETTINGS.enableLogoAnimation)} animated{/if}">
					<img src="{$LITHIUM_SETTINGS.headerLogo}" alt="{$SITE_NAME}">
				</a>
			</div>
		</header>

		<main class="main">
			<div class="container">
				<div class="content">
					{block name=heading}{/block}
					{block name=content}{/block}
				</div>
			</div>
		</main>

	</div>

{/block}