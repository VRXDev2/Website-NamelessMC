{include file='header-top.tpl'}
<meta name="robots" content="noindex">
</head>
<body>
    <div class="container">
        <div class="row">
            <div class="col-md-6 offset-md-3">
                <div class="card error-card text-center">
                    <div class="card-body">
                        <span class="error-title">403</span>
                        <br />
                        <span>{$403_TITLE} {$CONTENT}</span>
                        <br /><br />
                        <div class="row">
                            <div class="col-6">
                                <button class="btn btn-theme float-right"
                                    onclick="javascript:history.go(-1)">{$BACK}</button>
                            </div>
                            <div class="col-6">
                                <a href="{$SITE_HOME}" class="btn btn-theme float-left">{$HOME}</a>
                            </div>
                        </div>
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