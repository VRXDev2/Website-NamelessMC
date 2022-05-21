{extends file="./layout.tpl"}

{block name=sHeading}

	<h2>{$MESSAGING}</h2>

{/block}

{block name=sContent}

	{if !empty($MESSAGES)}
		<div class="action-bar">
			<div class="action-bar-pagination">
				{$PAGINATION}
			</div>
			<div class="action-bar-buttons">
				<a href="{$NEW_MESSAGE_LINK}" class="btn btn-primary btn-sm">{$NEW_MESSAGE}</a>
			</div>
		</div>
	{/if}

	{if !empty($MESSAGES)}
		<div class="card">
			<div class="card-body">
				<div class="list list-relaxed list-divided">
					{foreach from=$MESSAGES item=message}
						<div class="list-item">
							<div class="list-content">
								<a href="{$message.link}">{$message.title}</a>
								<div class="list-meta">
									<div>
										{$PARTICIPANTS}: {$message.participants}
									</div>
									<div class="d-sm-none">
										{$LAST_MESSAGE}: <a href="{$message.last_message_user_profile}" style="{$message.last_message_user_style}" data-poload="{$USER_INFO_URL}{$message.last_message_user_id}">{$message.last_message_user}</a>
										&bull;
										<span title="{$message.last_message_date_full}">{$message.last_message_date}</span>
									</div>
								</div>
							</div>
							<div class="list-extra text-end align-self-center d-none d-sm-block">
								<div class="user-item user-item-right">
									<div class="user-item-avatar">
										<a href="{$message.last_message_user_profile}">
											<img src="{$message.last_message_user_avatar}" alt="{$message.last_message_user}">
										</a>
									</div>
									<div class="user-item-content">
										<a href="{$message.last_message_user_profile}" style="{$message.last_message_user_style}" data-poload="{$USER_INFO_URL}{$message.last_message_user_id}">{$message.last_message_user}</a>
										<div class="user-item-meta">
											<span title="{$message.last_message_date_full}">{$message.last_message_date}</span>
										</div>
									</div>
								</div>
							</div>
						</div>
					{/foreach}
				</div>
			</div>
		</div>
	{else}
		<div class="card">
			<div class="card-body">
				{$NO_MESSAGES}
			</div>
			<div class="card-footer">
				<a href="{$NEW_MESSAGE_LINK}" class="btn btn-primary">{$NEW_MESSAGE}</a>
			</div>
		</div>
	{/if}

	{if !empty($MESSAGES)}
		<div class="action-bar">
			<div class="action-bar-pagination">
				{$PAGINATION}
			</div>
			<div class="action-bar-buttons">
				<a href="{$NEW_MESSAGE_LINK}" class="btn btn-primary btn-sm">{$NEW_MESSAGE}</a>
			</div>
		</div>
	{/if}
	
{/block}