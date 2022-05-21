{if !empty($POLL_DATA)}
	{foreach from=$POLL_DATA item=poll_data key=key}
		<div class="card card-secondary">
			<a href="{$VIEW_URL}{$POLL_DATA[$key]['poll']['id']}" class="card-header">
				{$POLL_DATA[$key]['poll']['subject']}
			</a>
			<div class="card-body">
				<form action="" method="post">
					<div class="poll">
						{foreach from=$poll_data.options item=option}
							{assign var="pollOptionValue" value=((int)(($POLL_RESULT.$key[$option.id] / $TOTAL_VOTES.$key) * 100))}
							<input type="radio" class="poll-option-input" id="input-pollOption-{$option.id}" name="voteOpt" value="{$option.id}"{if isset($NO_LOGIN_TEXT)} disabled{/if}>
							<label class="poll-option-label" for="input-pollOption-{$option.id}">
								<div class="poll-option-bar" style="width: {$pollOptionValue}%;"></div>
								<div class="poll-option-value">
									{if empty($pollOptionValue)}0{else}{$pollOptionValue}{/if}%
								</div>
								<div class="poll-option-name">
									{$option.name}
								</div>
							</label>
							<input type="hidden" id="proc" value="{$option.id}">
						{/foreach}
					</div>
					{if isset($NO_LOGIN_TEXT)}
						<div class="meta mt-3">{$NO_LOGIN_TEXT}</button>
					{else}
						<input type="hidden" name="pollID" value="{$poll_data.poll.id}">
						<input type="hidden" name="voteSubmit" value="1">
						<button type="submit" class="btn btn-success btn-sm btn-block mt-3">{$VOTE_LABEL}</button>
					{/if}
				</form>
			</div>
		</div>
	{/foreach}
{/if}

