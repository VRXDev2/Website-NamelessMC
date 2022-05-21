{include file='header.tpl'} {include file='navbar.tpl'}
<div class="container">
    <div class="row">


        <div class="col-lg-3">
            <div class="rules-menu">
                <div class="menu-title theme-text">{$RULES}</div>
                <ul class="nav nav-tabs mb-2" id="myTab" role="tablist">
                    <li class="nav-item">
                        <a class="rules-menu-link active" id="home-tab" data-toggle="tab" href="#home" role="tab" aria-controls="home" aria-selected="true">
                            {if isset($THEME_RULES_HOME_ICON) && $THEME_RULES_HOME_ICON|count_characters > 0}
                                {if isset($THEME_RULES_FA_ICONS) && $THEME_RULES_FA_ICONS|count_characters > 2}
                                    {$THEME_RULES_HOME_ICON}
                                {else}
                                    <img src="{$THEME_RULES_HOME_ICON}" alt="Home" class="rules_image_icon" />
                                {/if}
                            {/if}
                            <span>{$HOME}</span>
                        </a>
                    </li>
                    {foreach from=$CATAGORIES item=catagory}
                        <li class="nav-item">
                            <a class="rules-menu-link" id="id-{$catagory.id}-tab" data-toggle="tab" href="#id-{$catagory.id}" role="tab" aria-controls="id-{$catagory.id}" aria-selected="false">
                                {if isset($catagory.icon) && $catagory.icon|count_characters > 0}
                                    {if isset($THEME_RULES_FA_ICONS) && $THEME_RULES_FA_ICONS|count_characters > 2}
                                        {$catagory.icon}
                                    {else}
                                       <img src="{$catagory.icon|strip_tags}" alt="{$catagory.name}" class="rules_image_icon" />
                                    {/if}
                                {/if}
                                <span>{$catagory.name}</span>
                            </a>
                        </li>
                    {/foreach}
                </ul>
            </div>
            {if count($WIDGETS_LEFT)}
                {foreach from=$WIDGETS_LEFT item=widget}
                    {$widget}
                {/foreach}
            {/if}
        </div>

        <div class="{if count($WIDGETS_RIGHT)}col-lg-6{else}col-lg-9{/if}">
            <div class="card">
                <div class="card-body pt-4 pb-4">
                    <div class="tab-content rules-tabs" id="myTabContent">
                        <div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">
                            {$MESSAGE}
                            {if !empty($BUTTONS)}
                                <div class="text-center">
                                    {foreach from=$BUTTONS item=button}
                                        <a class="btn btn-theme btn-rules mt-2 mr-1 ml-1"
                                            href="{$button.link}">{$button.name}</a>
                                    {/foreach}
                                </div>
                            {/if}
                        </div>
                        {foreach from=$CATAGORIES item=catagory}
                            <div class="tab-pane fade" id="id-{$catagory.id}" role="tabpanel"
                            aria-labelledby="id-{$catagory.id}-tab">{$catagory.rules}</div>{/foreach}
                    </div>
                </div>
            </div>
        </div>

        {if count($WIDGETS_RIGHT)}
            <div class="col-lg-3">
                {foreach from=$WIDGETS_RIGHT item=widget}
                    {$widget}
                {/foreach}
            </div>
        {/if}

    </div>
</div>
{include file='footer.tpl'}