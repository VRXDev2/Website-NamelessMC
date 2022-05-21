{include file='header-top.tpl'}
<meta name="robots" content="noindex">
</head>
<body>
    <div class="container">
        <div class="row">
            <div class="col-md-6 offset-md-3">
                <div class="card error-card text-center">
                    <div class="card-body">
                        <span class="error-title">{$MAINTENANCE_TITLE}</span>
                        <br />
                        <span>{$MAINTENANCE_MESSAGE}</span>
                        <br /><br />
                        {if isset($LOGIN)}
                            <div class="row">
                                <div class="col-6">
                                    <a href="#" class="btn btn-theme float-right" onclick="window.location.reload()">{$RETRY}</a>
                                </div>
                                <div class="col-6">
                                    <a href="{$LOGIN_LINK}" class="btn btn-theme float-left">{$LOGIN}</a>
                                </div>
                            </div>
                        {else}
                            <a href="#" class="btn btn-theme" onclick="window.location.reload()">{$RETRY}</a>
                        {/if}
                        <br />{$ERROR}
                    </div>
                </div>
            </div>
        </div>
    </div>
	{include file='scripts.tpl'}
{if !isset($EXCLUDE_END_BODY)}
  </body>
  </html>
{/if}