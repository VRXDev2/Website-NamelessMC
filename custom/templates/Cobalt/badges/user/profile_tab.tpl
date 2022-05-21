{foreach from=$BADGES_LIST item=$badges}
	{if $badges.status == 1}
		<div class="bdg text-center" style="background: linear-gradient(to bottom right, {$badges.bdg_color} 0%, {$badges.bdg_color} 100%); color: {$badges.bdg_color};">
			<div class="circle"> {$badges.bdg_icon}</div>
			<div class="ribbon">{$badges.bdg_ribbon}</div>
		</div>
	{else}
		<div class="bdg text-center" style="background: linear-gradient(to bottom right, rgb(148, 148, 184) 0%, rgb(148, 148, 184) 100%); color: rgb(148, 148, 184);">
			<div class="circle"> {$badges.bdg_icon}</div>
			<div class="ribbon">{$POSTS} {$USER_POSTS}/{$badges.require_posts}</div>
		</div>
	{/if}
{/foreach}