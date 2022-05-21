<!DOCTYPE html>
<html {if "HTML_CLASS"|defined}{$smarty.const.HTML_CLASS} {/if}lang="{if "HTML_LANG"|defined}{$smarty.const.HTML_LANG}{else}en{/if}"{if "HTML_RTL"|defined && $smarty.const.HTML_RTL eq true} dir="rtl"{/if} class="dark" id="html">
	<head>
	  
		<!-- Optimization -->
		<link rel="preload" href="{$THEME_MOD_PATH}" as="script">
		<link rel="preconnect" href="https://fonts.googleapis.com">
		<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
		{if $THEME_SERVE_LIB_CDN == "yes"}
		<link rel="preload" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous" as="style">
		{/if}

		<!-- Early loading scripts -->
		<script src="{$THEME_MOD_PATH}"></script>

		<title>{$TITLE} &bull; {$smarty.const.SITE_NAME}</title>
		<meta name="title" content="{$TITLE} &bull; {$smarty.const.SITE_NAME}">
        <meta charset="{if "LANG_CHARSET"|defined}{$smarty.const.LANG_CHARSET}{else}utf-8{/if}"/>
        <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
		<meta name="theme-color" content="#1d1d1d">
		{if isset($PAGE_KEYWORDS) && $PAGE_KEYWORDS|count_characters > 0}
			<meta name="keywords" content="{$PAGE_KEYWORDS}"/>
		{/if}
		{if isset($PAGE_DESCRIPTION) && $PAGE_DESCRIPTION|count_characters > 0}
			<meta name="description" content="{$PAGE_DESCRIPTION}"/>
		{/if}
		{if isset($FAVICON)}
			<link rel="shortcut icon" href="{$FAVICON}" type="image/x-icon"/>
		{/if}

		<!-- Opengraph / Facebook -->
		<meta property="og:type" content="website" />
        <meta property="og:url" content="{$OG_URL}"/>
		<meta property="og:site_name" content="{$smarty.const.SITE_NAME}"/>
		{if isset($post_name)}
			<meta property="og:title" content="{$post_name}"/>
			<meta property="og:description" content="{$post_content_filtered}"/>
			<meta property="og:image" content="{$post_image}"/>
		{else}
			<meta property="og:title" content="{$TITLE} &bull; {$smarty.const.SITE_NAME}"/>
			{if isset($PAGE_DESCRIPTION) && $PAGE_DESCRIPTION|count_characters > 0}
				<meta property="og:description" content="{$PAGE_DESCRIPTION}"/>
			{/if} 
			{if isset($FAVICON)}
				<meta property="og:image" content="{$FAVICON}"/>
			{/if}
		{/if}

		<!-- Twitter -->
		<meta property="twitter:url" content="{$OG_URL}">
		{if isset($post_name)}
			<meta property="twitter:title" content="{$post_name}">
			<meta property="twitter:card" content="summary_large_image"/>
			<meta property="twitter:description" content="{$post_content_filtered}" />
			<meta property="twitter:image" content="{$post_image}" />
		{else}
			<meta property="twitter:title" content="{$TITLE} &bull; {$smarty.const.SITE_NAME}">
			{if isset($PAGE_DESCRIPTION) && $PAGE_DESCRIPTION|count_characters > 0}
				<meta property="twitter:description" content="{$PAGE_DESCRIPTION}"/>
			{/if} 
			{if isset($FAVICON)}
				<meta property="twitter:image" content="{$FAVICON}"/>
			{/if}
		{/if}

		{foreach from=$TEMPLATE_CSS item=css}
			{$css}
		{/foreach}
		{if isset($THEME_CUSTOM_CSS_STYLES) && $THEME_CUSTOM_CSS_STYLES|count_characters > 0}
			{$THEME_CUSTOM_CSS_STYLES}
		{/if}
		{if isset($ANALYTICS_ID)}
			{literal}
			  <script async src="https://www.googletagmanager.com/gtag/js?id={/literal}{$ANALYTICS_ID}{literal}"></script>
			  <script>
				window.dataLayer = window.dataLayer || [];
				function gtag(){dataLayer.push(arguments);}
				gtag('js', new Date());
	  
				gtag('config', '{/literal}{$ANALYTICS_ID}{literal}');
			  </script>
			{/literal}
		{/if}