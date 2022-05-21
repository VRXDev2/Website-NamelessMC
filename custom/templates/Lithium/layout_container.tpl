<!DOCTYPE html>

<html

	{if ('HTML_LANG'|defined)}
		lang="{$smarty.const.HTML_LANG}"
	{else}
		lang="en"
	{/if}

	{if ('HTML_RTL'|defined && $smarty.const.HTML_RTL)}
		dir="rtl"
	{/if}

	class=""

	{if !is_numeric($smarty.const.PAGE)}
		data-page="{$smarty.const.PAGE}"
	{else}
		data-page="{$TITLE}"
	{/if}

	{if ($LITHIUM.darkMode)}
		data-theme="dark"
	{else}
		data-theme="light"
	{/if}

	{if ($LITHIUM.preloader)}
		data-preloader="true"
	{else}
		data-preloader="false"
	{/if}

>

<head>

	{if ('LANG_CHARSET'|defined)}
		<meta charset="{$smarty.const.LANG_CHARSET}">
	{else}
		<meta charset="UTF-8">
	{/if}

	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">

	<title>{$LITHIUM_SETTINGS.pageTitleFormat|replace:'[pageTitle]':$TITLE|replace:'[siteName]':$SITE_NAME}</title>

	<meta name="author" content="{$SITE_NAME}">
	<meta name="keywords" content="{($PAGE_KEYWORDS) ? $PAGE_KEYWORDS : ''}">
	<meta name="theme-color" content="{$LITHIUM_SETTINGS.primaryColor}">

	{if !empty($PAGE_DESCRIPTION)}
		<meta name="description" content="{$PAGE_DESCRIPTION}">
	{else}
		<meta name="description" content="{$LITHIUM_SETTINGS.siteDescription}">
	{/if}

	<meta property="og:title" content="{$LITHIUM_SETTINGS.pageTitleFormat|replace:'[pageTitle]':$TITLE|replace:'[siteName]':$SITE_NAME}">
	<meta property="og:type" content="website">
	<meta property="og:url" content="{$OG_URL}">
	<meta property="og:image" content="{$LITHIUM_SETTINGS.siteIcon|stripslashes}">

	{if !empty($PAGE_DESCRIPTION)}
		<meta property="og:description" content="{$PAGE_DESCRIPTION}">
	{else}
		<meta property="og:description" content="{$LITHIUM_SETTINGS.siteDescription}">
	{/if}

	{if isset($FAVICON)}
		<link rel="shortcut icon" type="image/x-icon" href="{$FAVICON}">
	{/if}
	
	{foreach from=$TEMPLATE_CSS item=css}
		{$css}
	{/foreach}

	{if ($LITHIUM_SETTINGS.useCustomFont == 1)}
		<link rel="stylesheet" href="{$LITHIUM_SETTINGS.customFontLink}">
	{/if}

	<style>

		:root {
			{if ($LITHIUM_SETTINGS.enableChroma)}
				--primary: hsl(0, {$LITHIUM_SETTINGS.chromaSaturation}, {$LITHIUM_SETTINGS.chromaLightness});
				--primary-text: var(--primary);
			{else}
				--primary: {$LITHIUM_SETTINGS.primaryColor};
				{if ($LITHIUM_SETTINGS.useCustomPrimaryTextColor)}
					--primary-text: {$LITHIUM_SETTINGS.primaryTextColor};
				{else}
					--primary-text: var(--primary);
				{/if}
			{/if}
			--header-height: {$LITHIUM_SETTINGS.headerHeight};
			--header-logo-height: {$LITHIUM_SETTINGS.headerLogoHeight};
			--portal-logo-height: {$LITHIUM_SETTINGS.portalLogoHeight};
			{if ($LITHIUM_SETTINGS.avatarsType === 'circle')}
				--avatars-border-radius: 50%;
			{else if ($LITHIUM_SETTINGS.avatarsType === 'rounded')}
				--avatars-border-radius: 0.5rem;
			{else}
				--avatars-border-radius: 0;
			{/if}
			{if ($LITHIUM_SETTINGS.useCustomFont == 1)}
				--font-family: '{$LITHIUM_SETTINGS.customFontFamily}';
				--font-weight-regular: {$LITHIUM_SETTINGS.customFontWeightRegular};
				--font-weight-medium: {$LITHIUM_SETTINGS.customFontWeightMedium};
				--font-weight-bold: {$LITHIUM_SETTINGS.customFontWeightBold};
				--font-weight-heavy: {$LITHIUM_SETTINGS.customFontWeightHeavy};
				--font-weight-heaviest: {$LITHIUM_SETTINGS.customFontWeightHeaviest};
			{/if}
		}

		{if ($LITHIUM_SETTINGS.enableLineAwesomeIcons != 1)}
			.fa, .fab, .fad, .fal, .far, .fas {
				font-size: 0.75em;
				transform: translateY(-10%);
			}
		{/if}

		

	</style>

	{if !empty($LITHIUM_SETTINGS.customCss)}
		<style>
			{$LITHIUM_SETTINGS.customCss}
		</style>
	{/if}

	{if isset($ANALYTICS_ID)}
		{literal}
			<script type="text/javascript" src="https://www.googletagmanager.com/gtag/js?id={/literal}{$ANALYTICS_ID}{literal}" async></script>
			<script>
				window.dataLayer = window.dataLayer || [];
				function gtag() { dataLayer.push(arguments) }
				gtag('js', new Date());
				gtag('config', '{/literal}{$ANALYTICS_ID}{literal}');
			</script>
		{/literal}
	{/if}

	{if !empty($LITHIUM_SETTINGS.customScriptsInHeader)}
		{$LITHIUM_SETTINGS.customScriptsInHeader}
	{/if}

</head>

<body>

	{if ($LITHIUM.preloader)}
		<div class="preloader" style="--preloader-icon-color: {$LITHIUM_SETTINGS.preloaderIconColor};">
			<div class="preloader-icon"></div>
			<div class="preloader-title">{$LITHIUM_SETTINGS.siteTitle}</div>
		</div>
	{/if}

	{block name=layout}{/block}

	{foreach from=$TEMPLATE_JS item=script}
		{$script}
	{/foreach}

	{block name=script}{/block}

	{if !empty($LITHIUM_SETTINGS.customScriptsInBody)}
		{$LITHIUM_SETTINGS.customScriptsInBody}
	{/if}

</body>

</html>