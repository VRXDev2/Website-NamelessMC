<div class="card">
    <div class="card-body">
        {foreach from=$WIKI_PAGES item=page}
            {if isset($page->getSubPages()) && !empty($page->getSubPages()) && count($page->getSubPages()) >= 1}
                {if isset($page->isEnabled()) && $page->isEnabled() == "1"}
                <div class="dropdown">
                    <button class="btn btn-block btn-theme dropdown-toggle{if $WP_CATID == $page->getNameID()} active{/if}" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="margin-bottom: 8px">
                        {if isset($page->getIcon()) && $page->getIcon()|count_characters > 0}<i class="{$page->getIcon()}"></i> {/if}{$page->getButton()} <a href="{$WIKI_HOME_LINK}{$page->getNameID()}" class="badge float-right badge-dark" style="background-color: rgb(0,0,0,0.2); margin-top: 3px" onmouseover='this.style.textDecoration="underline"' onmouseout='this.style.textDecoration="none"'>{count($page->getSubPages())}</a></h5>
                    </button>
                    <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                        {foreach from=$page->getSubPages() item=subpage}
                            {if isset($subpage.enabled) && $subpage.enabled == "1"}
                            <a href="{$WIKI_HOME_LINK}{$subpage.parent}/{$subpage.nameid}" class="dropdown-item">
                                {if isset($subpage.icon) && $subpage.icon|count_characters > 0}<i class="{$subpage.icon}"></i> {/if}{$subpage.button}
                            </a>
                            {/if}
                        {/foreach}
                    </div>
                </div>
                {/if}
            {elseif $page->getParent() == "null"}
                {if isset($page->isEnabled()) && $page->isEnabled() == "1"}
                <a href="{$WIKI_HOME_LINK}{$page->getNameID()}" class="btn btn-block btn-theme" style="margin-bottom: 8px">
                    {if isset($page->getIcon()) && $page->getIcon()|count_characters > 0}<i class="{$page->getIcon()}"></i> {/if}{$page->getButton()}
                </a>
                {/if}
            {/if}
        {/foreach}
    </div>
</div>