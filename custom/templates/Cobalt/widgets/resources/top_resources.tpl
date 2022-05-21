<div class="card" id="widget-new-resources">
    <div class="card-header header-theme">{$TOP_RESOURCES_TITLE}</div>
    <div class="card-body">
        {if count($TOP_RESOURCES)}
            {foreach from=$TOP_RESOURCES item=resource}
                <div class="card">
                    <div class="card-body p-3">
                        <div class="d-flex">
                            <img class="d-md-none d-lg-none d-xl-block" style="height: 50px" src="{$resource.icon}"
                                alt="{$resource.name}" />
                            <div class="flex-grow-1 ml-2 text-truncate">
                                <a class="white-link" href="{$resource.link}">{$resource.name}</a><br />
                                {$BY|capitalize} <a href="{$resource.creator_profile}"
                                    style="{$resource.creator_style}">{$resource.creator_username}</a><br />
                                <div class="star-rating view" style="display:inline;">
                                    <span class="far fa-star" data-rating="1" style="color:gold;"></span>
                                    <span class="far fa-star" data-rating="2" style="color:gold"></span>
                                    <span class="far fa-star" data-rating="3" style="color:gold;"></span>
                                    <span class="far fa-star" data-rating="4" style="color:gold;"></span>
                                    <span class="far fa-star" data-rating="5" style="color:gold;"></span>
                                    <input type="hidden" name="rating" class="rating-value" value="{$resource.rating}">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            {/foreach}
        {else}
            {$NO_TOP_RESOURCES}
        {/if}
    </div>
</div>