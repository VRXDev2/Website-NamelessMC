{include file='header-top.tpl'}
    </head>
	<body>
    {if (isset($THEME_LOADING_ANIMATION) && $THEME_LOADING_ANIMATION|count_characters > 2)}
        <div class="load-wrapper"><div class="loader"><div class="loader-inner line-scale"><div></div><div></div><div></div><div></div><div></div></div></div></div>
    {/if}