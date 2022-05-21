{foreach from=$POLL_DATA item=item key=key}
	<div class="card widget-card">
		<div class="card-header header-theme widget-header">
			<div class="widget-header-txt">{$POLL_DATA[$key]['poll']['subject']}</div>
			<div><a class="btn btn-theme btn-sm" href="{$VIEW_URL}{$POLL_DATA[$key]['poll']['id']}"><i class="fa-solid fa-share"></i></a></div>
		</div>


		<form id="pollFrm" action="" method="post" name="pollFrm">
			<div class="card-body">


				{foreach from=$POLL_DATA[$key]['options'] item=opt}

					{$val = (int)($POLL_RESULT[$key][$opt['id']] / $TOTAL_VOTES[$key] * 100)}

					<div class="poll-field{if !isset($NO_LOGIN_TEXT)} loggedin{/if}" id="field{$opt['id']}" onclick="radioSelect({$opt['id']});">
						<label for="proccccess{$opt['id']}">{$opt['name']}</label>
						<div id="proccccess{$opt['id']}" class="progress">
							<div class="progress-bar" role="progressbar" style="width: {$val}%;" aria-valuenow="{$val}" aria-valuemin="0"
								aria-valuemax="{$TOTAL_VOTES[$key]}">
								{if empty($val)}0
								{else}{$val}
								{/if}%
							</div>
						</div>
					</div>

					<input class="radio-select" style="display: none;" id="radio{$opt['id']}" type="radio" value="{$opt['id']}"
						name="voteOpt">

					<input type="hidden" id="proc" value="{$opt['id']}">

				{/foreach}


				<input type="hidden" name="pollID" value="{$POLL_DATA[$key]['poll']['id']}">
				{if isset($NO_LOGIN_TEXT)}
					<span>{$NO_LOGIN_TEXT}</span>
				{else}
					<button type="submit" name="voteSubmit" class="btn btn-sm btn-theme btn-block mt-3">{$VOTE_LABEL}</button>
				{/if}
			</div>
		</form>
	</div>

{/foreach}


<script>
	function radioSelect(id) {
		var radio = document.getElementById('radio' + id);
		var field = document.getElementById('field' + id);
		radio.checked = true;
		document.querySelectorAll('.poll-field').forEach(n => n.classList.remove('select-proc'));
		field.classList.add('select-proc');
	}
</script>