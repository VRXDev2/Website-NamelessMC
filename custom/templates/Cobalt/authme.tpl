{include file='header-top.tpl'}
</head>

<body>



    <div class="container">
        <div class="card register-page-card">

            <div class="register-menu">

                {if $THEME_LR_MODAL_IMAGE == "yes"}

                    {if $THEME_LR_COVERLAY == "yes"}<div class="register-overlay"></div>{/if}
                    <div class="container-fluid">
                        <div class="row no-margin-row">
                            <div class="col-lg-6">
                                <div class="card lr-card">
                                    <div class="card-body">
                                        <div class="lr-import-container">

                                            <span class="lr-title">{$CONNECT_WITH_AUTHME}</span>
                                            <br /><br />
                                            
                          
                              {if isset($ERRORS)}
        <div class="alert alert-danger">
            {foreach from=$ERRORS item=error} {$error}
            <br /> {/foreach}
        </div>
    {/if}                  
                                            
                                            
                                            <form id="register-form" action="" method="post">
                <div class="alert alert-info">
                    {$AUTHME_INFO}
                </div>
                <div class="form-group">
                    <label for="inputUsername">{$USERNAME}</label>
                    <input type="text" id="inputUsername" name="username" class="form-control"
                        placeholder="{$USERNAME}">
                </div>
                <div class="form-group">
                    <label for="inputPassword">{$PASSWORD}</label>
                    <input type="password" id="inputPassword" name="password" class="form-control"
                        placeholder="{$PASSWORD}">
                </div>
                                            {if $CAPTCHA}
                                                        <div id="captcha" class="form-group"
                                                            style="width: 100%; justify-content: center; display: flex;">
                                                            {$CAPTCHA}
                                                        </div>
                                                    {/if}
                <hr /> {$AGREE_TO_TERMS}
                <br />
                <span class="button-checkbox">
                    <button type="button" class="btn" data-color="info" tabindex="7"> {$I_AGREE}</button>
                    <input type="checkbox" name="t_and_c" id="t_and_c" style="display:none;" value="1">
                </span>
                <br />
                <input type="hidden" name="token" value="{$TOKEN}">
                <br />
                <button type="submit" class="btn btn-theme">{$SUBMIT}</button>
            </form>
                                            


                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-6 bg-col">
                                {if isset($THEME_R_BG) && $THEME_R_BG|count_characters > 4}
                                    <picture>
                                        <source srcset="none" media="(max-width: 767px)">
                                        {if isset($THEME_R_BG_WEBP) && $THEME_R_BG_WEBP|count_characters > 4}
                                            <source srcset="{$THEME_R_BG_WEBP}" type="image/webp">
                                        {/if}
                                        <source srcset="{$THEME_R_BG}">
                                        <img class="lr-bg-img" alt="logo" src='{$THEME_R_BG}'>
                                    </picture>
                                {/if}
                            </div>
                        </div>
                    </div>

                {else}

                    <div class="container-fluid">
                        <div class="card lr-card">
                            <div class="card-body">
                                <div class="lr-import-container">

                                    <span class="lr-title">{$CONNECT_WITH_AUTHME}</span>
                                    <br /><br />
 
 
     {if isset($ERRORS)}
        <div class="alert alert-danger">
            {foreach from=$ERRORS item=error} {$error}
            <br /> {/foreach}
        </div>
    {/if}
 
 <form id="register-form" action="" method="post">
                <div class="alert alert-info">
                    {$AUTHME_INFO}
                </div>
                <div class="form-group">
                    <label for="inputUsername">{$USERNAME}</label>
                    <input type="text" id="inputUsername" name="username" class="form-control"
                        placeholder="{$USERNAME}">
                </div>
                <div class="form-group">
                    <label for="inputPassword">{$PASSWORD}</label>
                    <input type="password" id="inputPassword" name="password" class="form-control"
                        placeholder="{$PASSWORD}">
                </div>
                                                    {if $CAPTCHA}
                                                        <div id="captcha" class="form-group"
                                                            style="width: 100%; justify-content: center; display: flex;">
                                                            {$CAPTCHA}
                                                        </div>
                                                    {/if}
                <hr /> {$AGREE_TO_TERMS}
                <br />
                <span class="button-checkbox">
                    <button type="button" class="btn" data-color="info" tabindex="7"> {$I_AGREE}</button>
                    <input type="checkbox" name="t_and_c" id="t_and_c" style="display:none;" value="1">
                </span>
                <br />
                <input type="hidden" name="token" value="{$TOKEN}">
                <br />
                <button type="submit" class="btn btn-theme">{$SUBMIT}</button>
            </form>
 
 

                                </div>
                            </div>
                        </div>
                    </div>

                {/if}
            </div>

        </div>
    </div>

    {include file='scripts.tpl'}
    {if !isset($EXCLUDE_END_BODY)}
    </body>

    </html>
{/if}

{*  
 *  ValentinXD
 *  21683
 *  83139
 *  1649870447
 *  a054306a9a3fd032ded20ec917c6e6a0
 *  9c4a5c8b321ac5507c4f7aa2484c8867
 *}