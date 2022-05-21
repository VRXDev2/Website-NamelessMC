<div class="card" id="widget-new-resources">
    <div class="card-header header-theme">{$UPDATED_RESOURCES_TITLE}</div>
    <div class="card-body">
        {if count($UPDATED_RESOURCES)}
            {foreach from=$UPDATED_RESOURCES item=resource}
                <div class="card">
                    <div class="card-body p-3">
                        <div class="d-flex">
                            <img class="d-md-none d-lg-none d-xl-block" style="height: 50px" src="{$resource.icon}"
                                alt="{$resource.name}" />
                            <div class="flex-grow-1 ml-2 text-truncate">
                                <a class="white-link" href="{$resource.link}">{$resource.name}</a><br />
                                {$BY|capitalize} <a href="{$resource.creator_profile}"
                                    style="{$resource.creator_style}">{$resource.creator_username}</a><br />{$resource.released_full}
                            </div>
                        </div>
                    </div>
                </div>
            {/foreach}
        {else}
            {$NO_UPDATED_RESOURCES}
        {/if}
    </div>
</div>