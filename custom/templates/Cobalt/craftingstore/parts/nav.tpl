<div class="user-nav">
                <a href="{$HOME_URL}" class="user-nav-link">{$HOME}</a>
                {foreach from=$CATEGORIES item=category}
                    {if count($category.subCategories)}
                        <div class="dropdown">
                            <a class="user-nav-link dropdown-toggle" href="#" id="dropdownMenuButton" data-toggle="dropdown"
                                aria-haspopup="true" aria-expanded="false">
                                {$category.name}
                            </a>
                            <div class="dropdown-menu ml-3" aria-labelledby="dropdownMenuButton">
                                <a class="dropdown-item" href="{$category.link}">{$category.title}</a>
                                {foreach from=$category.subCategories item=subcategory}
                                <a class="dropdown-item" href="{$subcategory.link}">{$subcategory.name}</a> {/foreach}
                            </div>
                        </div>
                    {else}
                    <a href="{$category.link}" class="user-nav-link">{$category.name}</a> {/if}
                {/foreach}
                <a class="btn btn-theme d-block mt-3 ml-3 mr-3" href="{$STORE_URL}"
                    target="_blank">{$VIEW_FULL_STORE}</a>
            </div>