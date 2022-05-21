{include file='header-top.tpl'}
<style>
    .no-webp .p-image-frame {
        background: url('{$PORTAL_BG}') no-repeat center;
    }

    .webp .p-image-frame {
        background: url('{$PORTAL_BG_WEBP}') no-repeat center;
    }

    .p-image {
        width: {$PORTAL_ICON_WIDTH};
    }

    .p-container {
        margin-top: {$PORTAL_IMAGE_MARGIN};
    }

    @media only screen and (max-width: 767px) {
        .p-container {
            margin-top: {$PORTAL_IMAGE_MARGIN_M};
        }
        .p-image {
            width: {$PORTAL_ICON_WIDTH_M};
        }
    }
</style>
{if isset($PORTAL_FA_ICONS) && $PORTAL_FA_ICONS|count_characters > 2}
<style>
    .p-column {
        flex: 1 1 0px;
    }
</style>
{/if}
</head>

<body>
    <div class="p-color-overlay">
        <div class="p-image-frame" id="p-particles"></div>
    </div>

    <div class="logo-ds-flex">

        {if isset($PORTAL_DS_TEXTS) && $PORTAL_DS_TEXTS|count_characters > 2}
        <div class="status-box-container">
            <div class="status-text" onclick="copyToClipboard('#ip')">
                <div class="text">
                    <div class="top-text"><span class="server-status">{$LOADING}</span></div>
                    <div class="bottom-text">
                        <div class="reel-1"><span id="ip">{$THEME_MC_SERVER}</span></div>
                        <div class="reel-1">Click to copy IP</div>
                    </div>
                </div>
                <div class="icon">
                    <div class="icon-wrapper">
                        <svg class="creeper" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                            <path
                                d="M4,2H20A2,2 0 0,1 22,4V20A2,2 0 0,1 20,22H4A2,2 0 0,1 2,20V4A2,2 0 0,1 4,2M6,6V10H10V12H8V18H10V16H14V18H16V12H14V10H18V6H14V10H10V6H6Z">
                            </path>
                        </svg>
                    </div>
                </div>
            </div>
        </div>
        {/if}

        <div class="logo-container">
            <a href="/">
                <picture>
                    {if isset($THEME_LOGO_WEBP) && $THEME_LOGO_WEBP|count_characters > 4}
                    <source srcset="{$THEME_LOGO_WEBP}" type="image/webp">{/if}
                    <source srcset="{$THEME_LOGO}">
                    <img class="logo{if isset($THEME_AL) && $THEME_AL|count_characters > 2} animated-logo{/if}"
                        alt="logo" src='{$THEME_LOGO}'>
                </picture>
            </a>
        </div>

        {if isset($PORTAL_DS_TEXTS) && $PORTAL_DS_TEXTS|count_characters > 2}
        <div class="discord-box-container">
            <a href="http://{$THEME_DISCORD_SERVER}" target="_blank">
                <div class="discord-text">
                    <div class="icon">
                        <div class="icon-wrapper">
                            <svg class="discord" id="Layer_1" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 245 240">
                                <path class="st0"
                                    d="M104.4 103.9c-5.7 0-10.2 5-10.2 11.1s4.6 11.1 10.2 11.1c5.7 0 10.2-5 10.2-11.1.1-6.1-4.5-11.1-10.2-11.1zM140.9 103.9c-5.7 0-10.2 5-10.2 11.1s4.6 11.1 10.2 11.1c5.7 0 10.2-5 10.2-11.1s-4.5-11.1-10.2-11.1z">
                                </path>
                                <path class="st0"
                                    d="M189.5 20h-134C44.2 20 35 29.2 35 40.6v135.2c0 11.4 9.2 20.6 20.5 20.6h113.4l-5.3-18.5 12.8 11.9 12.1 11.2 21.5 19V40.6c0-11.4-9.2-20.6-20.5-20.6zm-38.6 130.6s-3.6-4.3-6.6-8.1c13.1-3.7 18.1-11.9 18.1-11.9-4.1 2.7-8 4.6-11.5 5.9-5 2.1-9.8 3.5-14.5 4.3-9.6 1.8-18.4 1.3-25.9-.1-5.7-1.1-10.6-2.7-14.7-4.3-2.3-.9-4.8-2-7.3-3.4-.3-.2-.6-.3-.9-.5-.2-.1-.3-.2-.4-.3-1.8-1-2.8-1.7-2.8-1.7s4.8 8 17.5 11.8c-3 3.8-6.7 8.3-6.7 8.3-22.1-.7-30.5-15.2-30.5-15.2 0-32.2 14.4-58.3 14.4-58.3 14.4-10.8 28.1-10.5 28.1-10.5l1 1.2c-18 5.2-26.3 13.1-26.3 13.1s2.2-1.2 5.9-2.9c10.7-4.7 19.2-6 22.7-6.3.6-.1 1.1-.2 1.7-.2 6.1-.8 13-1 20.2-.2 9.5 1.1 19.7 3.9 30.1 9.6 0 0-7.9-7.5-24.9-12.7l1.4-1.6s13.7-.3 28.1 10.5c0 0 14.4 26.1 14.4 58.3 0 0-8.5 14.5-30.6 15.2z">
                                </path>
                            </svg>
                        </div>
                    </div>
                    <div class="text">
                        <div class="top-text"><span class="discord-status">{$LOADING}</span></div>
                        <div class="bottom-text">
                            <div class="reel-1">{$THEME_DISCORD_SERVER}</div>
                            <div class="reel-1">Click to join</div>
                        </div>
                    </div>
                </div>
            </a>
        </div>
        {/if}

    </div>

    <div class="container p-container">
        <div class="p-row">
            <div class="p-column">
                <a href="{$PORTAL_1_LINK}">
                    {if isset($PORTAL_FA_ICONS) && $PORTAL_FA_ICONS|count_characters < 3} <picture>
                        {if isset($PORTAL_1_ICON_WEBP) && $PORTAL_1_ICON_WEBP|count_characters > 4}
                        <source srcset="{$PORTAL_1_ICON_WEBP}" type="image/webp">{/if}
                        <source srcset="{$PORTAL_1_ICON}">
                        <img class="p-image" alt="Portal Image 1" src='{$PORTAL_1_ICON}'>
                        </picture>
                        {else}
                        <div class="p-icon">{$PORTAL_1_FA_ICON}</div>
                        {/if}
                        {if isset($PORTAL_ICON_NAMES) && $PORTAL_ICON_NAMES|count_characters > 2}
                        <div class="p-icon-name">{$PORTAL_1_NAME}</div>
                        {/if}
                </a>
            </div>
            <div class="p-column">
                <a href="{$PORTAL_2_LINK}">
                    {if isset($PORTAL_FA_ICONS) && $PORTAL_FA_ICONS|count_characters < 3} <picture>
                        {if isset($PORTAL_2_ICON_WEBP) && $PORTAL_2_ICON_WEBP|count_characters > 4}
                        <source srcset="{$PORTAL_2_ICON_WEBP}" type="image/webp">{/if}
                        <source srcset="{$PORTAL_2_ICON}">
                        <img class="p-image" alt="Portal Image 2" src='{$PORTAL_2_ICON}'>
                        </picture>
                        {else}
                        <div class="p-icon">{$PORTAL_2_FA_ICON}</div>
                        {/if}
                        {if isset($PORTAL_ICON_NAMES) && $PORTAL_ICON_NAMES|count_characters > 2}
                        <div class="p-icon-name">{$PORTAL_2_NAME}</div>
                        {/if}
                </a>
            </div>
            <div class="p-column">
                <a href="{$PORTAL_3_LINK}">
                    {if isset($PORTAL_FA_ICONS) && $PORTAL_FA_ICONS|count_characters < 3} <picture>
                        {if isset($PORTAL_3_ICON_WEBP) && $PORTAL_3_ICON_WEBP|count_characters > 4}
                        <source srcset="{$PORTAL_3_ICON_WEBP}" type="image/webp">{/if}
                        <source srcset="{$PORTAL_3_ICON}">
                        <img class="p-image" alt="Portal Image 3" src='{$PORTAL_3_ICON}'>
                        </picture>
                        {else}
                        <div class="p-icon">{$PORTAL_3_FA_ICON}</div>
                        {/if}
                        {if isset($PORTAL_ICON_NAMES) && $PORTAL_ICON_NAMES|count_characters > 2}
                        <div class="p-icon-name">{$PORTAL_3_NAME}</div>
                        {/if}
                </a>
            </div>
            {if $PORTAL_ENABLE_FOURTH_ICON eq 'yes'}
            <div class="p-column">
                <a href="{$PORTAL_4_LINK}">
                    {if isset($PORTAL_FA_ICONS) && $PORTAL_FA_ICONS|count_characters < 3} <picture>
                        {if isset($PORTAL_4_ICON_WEBP) && $PORTAL_4_ICON_WEBP|count_characters > 4}
                        <source srcset="{$PORTAL_4_ICON_WEBP}" type="image/webp">{/if}
                        <source srcset="{$PORTAL_4_ICON}">
                        <img class="p-image" alt="Portal Image 4" src='{$PORTAL_4_ICON}'>
                        </picture>
                        {else}
                        <div class="p-icon">{$PORTAL_4_FA_ICON}</div>
                        {/if}
                        {if isset($PORTAL_ICON_NAMES) && $PORTAL_ICON_NAMES|count_characters > 2}
                        <div class="p-icon-name">{$PORTAL_4_NAME}</div>
                        {/if}
                </a>
            </div>
            {/if}
        </div>
    </div>
    {include file='scripts.tpl'}
    {if $PORTAL_PARTICLES == "yes"}
    {$THEME_PARTICLES_SCRIPT}
    <script>
        $(window).on("load", function () {
            tsParticles.loadJSON("p-particles", pjsPath);
        });
    </script>
    {/if}
    {if !isset($EXCLUDE_END_BODY)}
</body>

</html>
{/if}