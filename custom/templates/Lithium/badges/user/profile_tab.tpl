{if !empty($BADGES_LIST)}
	<div class="card">
		<div class="card-body">
			<div class="profile-badges">
				{foreach from=$BADGES_LIST item=badge}
					{if ($badge.status == 1)}
						<div class="profile-badge" style="--badge-color: {$badge.bdg_color};">
							<div class="profile-badge-inner">
								<div class="profile-badge-icon">
									{$badge.bdg_icon}
								</div>
								<div class="profile-badge-ribbon">
									{$badge.bdg_ribbon}
								</div>
							</div>
						</div>
					{else}
						<div class="profile-badge">
							<div class="profile-badge-inner">
								<div class="profile-badge-icon">
									{$badge.bdg_icon}
								</div>
								<div class="profile-badge-ribbon">
									{$POSTS} {$USER_POSTS}/{$badge.require_posts}
								</div>
							</div>
						</div>
					{/if}
				{/foreach}
			</div>
		</div>
	</div>
{else}
	<div class="alert alert-danger">
		No badges.
	</div>
{/if}