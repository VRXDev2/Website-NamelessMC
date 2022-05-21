<div class="user-nav">
{foreach from=$CC_NAV_LINKS key=name item=item}
	<a class="user-nav-link{if isset($item.active)} active{/if}" href="{$item.link}" target="{$item.target}">{$item.title}</a>
{/foreach}
</div>
