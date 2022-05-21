{if !empty($USER_BDG_COUNT[$reply.user_id]['count'])}
	<a href="#modal-profileBadges-{$reply.user_id}" class="btn btn-primary btn-sm btn-block" data-bs-toggle="modal">
		{$USER_BDG_COUNT[$reply.user_id]['count']} {$BDG_TITLE}
	</a>
{else}
	<a href="#" class="btn btn-primary btn-sm btn-block disabled">
		0 {$BDG_TITLE}
	</a>
{/if}

{if !empty($USER_BADGES_LIST)}
	<div class="modal fade" id="modal-profileBadges-{$reply.user_id}">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<div class="modal-title">{$reply.username}'s {$BDG_TITLE}</div>
					<a href="#" class="close" data-bs-dismiss="modal">
						<i class="fas fa-times"></i>
					</a>
				</div>
				<div class="modal-body">
					<div class="profile-badges">
						{foreach from=$USER_BADGES_LIST item=badge}
							{if ($badge.user_id == $reply.user_id)}
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
							{/if}
						{/foreach}
					</div>
				</div>
			</div>
		</div>
	</div>
{/if}