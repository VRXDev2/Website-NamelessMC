{if (isset($COBALT_VERSION) && $COBALT_VERSION|count_characters > 0) && ($COBALT_VERSION != $THEME_LOCAL_VERSION) && ($THEME_EXT_UPDATE eq "yes") && ($STAFF_USER == "yes") && isset($LOGGED_IN_USER) && isset($THEME_UPDATE_NOTIF) && ($THEME_UPDATE_NOTIF eq "yes")}
    <div class="cobalt-update-box">
        <div class="update-icon">
            <i class="fa-solid fa-triangle-exclamation"></i>
        </div>
        <div class="update-text">
            <div class="top-row">
                Cobalt {$UPDATE_AVAILABLE}
            </div>
            <div class="bottom-row">
                <span class="current">{$THEME_LOCAL_VERSION}</span> <i class="fa-solid fa-arrow-right-long"></i> <span class="new">{$COBALT_VERSION}</span>
            </div>
        </div>
    </div>
{/if}
{if isset($MAINTENANCE_ENABLED)}
    <div class="maintenance-icon" data-toggle="tooltip" data-placement="top" title="{$MAINTENANCE_ENABLED}">
        <i class="fa-solid fa-triangle-exclamation"></i>
    </div>
{/if} 
<div class="container">
    <div class="chatbox" id="chatbox-bottom"></div>
</div>
{if isset($GLOBAL_WARNING_TITLE)}
<div class="modal fade show-punishment" data-keyboard="false" data-backdrop="static" id="acknowledgeModal" tabindex="-1"
    role="dialog" aria-labelledby="acknowledgeModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title" id="acknowledgeModalLabel">{$GLOBAL_WARNING_TITLE}</h4>
            </div>
            <div class="modal-body">
                {$GLOBAL_WARNING_REASON}
            </div>
            <div class="modal-footer">
                <a href="{$GLOBAL_WARNING_ACKNOWLEDGE_LINK}" class="btn btn-warning">{$GLOBAL_WARNING_ACKNOWLEDGE}</a>
            </div>
        </div>
    </div>
</div>
{/if}
<div class="footer-spacer"></div>
{if isset($THEME_FOOTER_SIZE) && $THEME_FOOTER_SIZE eq 'large'}
<div class="footer large-footer">
    <div class="top-section">

        <div class="container">
            <div class="row">
                <div class="col-lg-4 footer-col footer-about">
                    <div class="footer-text-header">{$THEME_PLAY_T}</div>
                    <p>{$THEME_PLAY_D}</p>
                    {if isset($THEME_PLAY_B) && $THEME_PLAY_B eq 'yes'}
                        <button class="btn btn-play" onclick="copyToClipboard('#play-ip')" data-toggle="tooltip"
                            title="{$COPY}"><span id="play-ip">{$THEME_MC_SERVER}</span> <i class="fa-solid fa-angles-right"></i></button>
                    {/if}
                </div>
                <div class="col-lg-4 footer-col">
                    <div class="footer-text-header">{$FOOTER_LINKS}</div>
                    <a class="footer-link terms-link" href="{$TERMS_LINK}">{$TERMS_TEXT}</a>
                    <a class="footer-link privacy-policy-link" href="{$PRIVACY_LINK}">{$PRIVACY_TEXT}</a>{foreach
                    from=$FOOTER_NAVIGATION key=name item=item} {if isset($item.items)}
                    <a class="dropdown-toggle footer-link" data-toggle="dropdown" href="#" role="button"
                        aria-haspopup="true" aria-expanded="false">{$item.icon} {$item.title}</a>
                    <div class="dropdown-menu">
                        {foreach from=$item.items item=dropdown}
                        <a href="{$dropdown.link}" target="{$dropdown.target}">{$dropdown.icon} {$dropdown.title}</a>
                        {/foreach}
                    </div>
                    {else}
                    <a class="footer-link" href="{$item.link}" target="{$item.target}">{$item.icon}
                        {$item.title}</a> {/if} {/foreach}
                </div>
                <div class="col-lg-4 footer-col">
                    <div class="footer-text-header">{$THEME_OTHER_T}</div>
                    <p>{$THEME_OTHER_D}</p>
                    <a href="{$THEME_OTHER_BL}" class="btn btn-theme other-btn">{$THEME_OTHER_BT}{if isset($THEME_OTHER_BI) && $THEME_OTHER_BI|count_characters > 0} {$THEME_OTHER_BI}{/if}</a>
                </div>
            </div>
        </div>
    </div>

    <div class="bottom-bar">
        <div class="container">
            <div class="footer-copyright">
                <span class="copyright-txt"><i class="fa-solid fa-copyright"></i> {'Y'|date} <span class="site">{$SITE_NAME}</span></span>
                <div class="icon-box">
                    {if $PAGE_LOAD_TIME}
                    <a class="icon" href="#" onClick="return false;" data-toggle="tooltip" id="page_load_tooltip"
                        title="Page loading.."><i class="fa-solid fa-gauge-high"></i></a>
                    {/if}
                    {if !empty($SOCIAL_MEDIA_ICONS)}
                    {foreach from=$SOCIAL_MEDIA_ICONS item=icon}
                    <a class="icon" href="{$icon.link}" target="_blank"><i id="social-{$icon.short}" class="{if $icon.long neq 'envelope'}fab{else}fas{/if} fa-{$icon.long}-square"></i></a>
                    {/foreach}
                    {/if}
                </div>
            </div>
            <a href="{$THEME_COLDFIRE_URL}" rel="noopener" target="_blank">
                <picture>
                    <source srcset="{$THEME_COLDFIRE_CREDIT_IMG_WEBP}" type="image/webp">
                    <source srcset="{$THEME_COLDFIRE_CREDIT_IMG}">
                    <img class="credit-img" alt="Coldfire Design" src='{$THEME_COLDFIRE_CREDIT_IMG}' />
                </picture>
            </a>
        </div>
    </div>

</div>

{else}

<div class="footer small-footer">
    <div class="small-section">
        <div class="container d-flex">
            <div class="footer-copyright flex-grow-1">
                <span class="copyright-txt"><i class="fa-solid fa-copyright"></i> {'Y'|date} {$SITE_NAME}</span>
                <div class="icon-box">
                    {if $PAGE_LOAD_TIME}
                    <a class="icon" href="#" onClick="return false;" data-toggle="tooltip" id="page_load_tooltip"
                        title="Page loading.."><i class="fa-solid fa-gauge-high"></i></a>
                    {/if}
                    {if !empty($SOCIAL_MEDIA_ICONS)}
                    {foreach from=$SOCIAL_MEDIA_ICONS item=icon}
                    <a class="icon" href="{$icon.link}" target="_blank"><i id="social-{$icon.short}"
                            class="{if $icon.long neq 'envelope'}fab{else}fas{/if} fa-{$icon.long}-square"></i></a>
                    {/foreach}
                    {/if}
                </div>
            </div>
            <div class="right">
                <a class="footer-link terms-link" href="{$TERMS_LINK}">{$TERMS_TEXT}</a>
                <a class="footer-link privacy-policy-link" href="{$PRIVACY_LINK}">{$PRIVACY_TEXT}</a>
                <a href="{$THEME_COLDFIRE_URL}" rel="noopener" target="_blank">
                    <picture>
                        <source srcset="{$THEME_COLDFIRE_CREDIT_IMG_WEBP}" type="image/webp">
                        <source srcset="{$THEME_COLDFIRE_CREDIT_IMG}">
                        <img class="credit-img" alt="Coldfire Design" src='{$THEME_COLDFIRE_CREDIT_IMG}' />
                    </picture>
                </a>
            </div>
        </div>
    </div>
</div>

{/if}

{foreach from=$TEMPLATE_JS item=script}
{$script}
{/foreach}
{if isset($THEME_CUSTOM_JS_SCRIPTS) && $THEME_CUSTOM_JS_SCRIPTS|count_characters > 0}
{$THEME_CUSTOM_JS_SCRIPTS}
{/if}
{if isset($THEME_CUSTOM_JS) && $THEME_CUSTOM_JS|count_characters > 0}
<script>
    {$THEME_CUSTOM_JS}
</script>
{/if}
{if isset($NEW_UPDATE)}
{if $NEW_UPDATE_URGENT ne true}
<script>
    $(document).ready(function () {
        $('#closeUpdate').click(function (event) {
            event.preventDefault();
            let expiry = new Date();
            let length = 3600000;
            expiry.setTime(expiry.getTime() + length);
            $.cookie('update-alert-closed', 'true', {
                path: '/',
                expires: expiry
            });
        });
        if ($.cookie('update-alert-closed') === 'true') {
            $('#updateAlert').hide();
        }
    });
</script>
{/if}
{/if}

{$INSTANT_PAGE_SCRIPT}

{if !isset($EXCLUDE_END_BODY)}
  </body>
  </html>
{/if}