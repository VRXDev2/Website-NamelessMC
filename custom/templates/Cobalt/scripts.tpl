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
            	$(document).ready(function(){
                $('#closeUpdate').click(function(event){
                    event.preventDefault();
                    let expiry = new Date();
                    let length = 3600000;
                    expiry.setTime(expiry.getTime() + length);
                    $.cookie('update-alert-closed', 'true', { path: '/', expires: expiry });
                });
                if($.cookie('update-alert-closed') === 'true'){
                    $('#updateAlert').hide();
                }
            });
		</script>
	{/if}
{/if}

{$INSTANT_PAGE_SCRIPT}