{if isset($FRIENDS)}
	{if !empty($FRIENDS.list)}
		<div class="card">
			<div clss="card-body">
				<div class="list list-friends">
					{foreach from=$FRIENDS.list item=friend}
						<div class="list-item align-items-center">
							<div class="list-icon">
								<a href="{$friend.profile}">
									<img src="{$friend.avatar}">
								</a>
							</div>
							<div class="list-content">
								<a href="{$friend.profile}" style="{$friend.style}">{$friend.nickname}</a>
							</div>
						</div>
					{/foreach}
				</div>
			</div>
		</div>
	{else}
		<div class="alert alert-danger">
			<p>{$FRIENDS.no_friends}</p>
		</div>
	{/if}
{/if}