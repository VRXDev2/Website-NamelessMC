{extends file="user/layout.tpl"}

{block name=sHeading}

	<h2>{$MC_TITLE}</h2>

{/block}

{block name=sContent}

	{if !empty($SUCCESS)}
		<div class="alert alert-success">
			{foreach from=$SUCCESS item=success}
				<li>{$ok}</li>
			{/foreach}
		</div>
	{/if}

	{if !empty($ERRORS)}
		<div class="alert alert-danger">
			{foreach from=$ERRORS item=error}
				<li>{$error}</li>
			{/foreach}
		</div>
	{/if}

	<div class="action-bar">
		<div class="action-bar-buttons">
			<a href="#modal-transferMoney" class="btn btn-default btn-sm" data-bs-toggle="modal">{$TRANSFER_MONEY}</a>
			<a href="{$PAY_URL}" class="btn btn-primary btn-sm">{$PAY}</a>
		</div>
	</div>

	<div class="card">
		<div class="card-body">
			<div class="list">
				<div class="list-item">
					{$MC_ACCOUNT}
					<div class="list-meta">
						{$USER_DATA->mc_name}
					</div>
				</div>
				<div class="list-item">
					{$BALANCE}
					<div class="list-meta">
						{$USER_DATA->bal}
					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="card">
		<div class="card-body">
			<h3>{$BUY_TITLE}</h3>
			{if !empty($PRODUCT_LOGS)}
				<table class="table">
					<colgroup>
						<col width="50%">
						<col width="10%">
						<col width="30%">
						<col width="10%">
					</colgroup>
					<tbody>
						{foreach from=$PRODUCT_LOGS item=log}
							<tr>
								<td class="{if ($log.status != 1)}text-danger{/if}">{$log.product_name}</td>
								<td class="{if ($log.status != 1)}text-danger{/if}">{if ($log.status != 1)}Error{else}Success{/if}</td>
								<td class="{if ($log.status != 1)}text-danger{/if}">{$log.datetime}</td>
								<td class="{if ($log.status != 1)}text-danger{/if}">{$log.product_price}</td>
							</tr>
						{/foreach}
					</tbody>
				</table>
			{else}
				No logs.
			{/if}
		</div>
	</div>

	<div class="modal fade" id="modal-transferMoney">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<div class="modal-title">
						{$TRANSFER_MONEY}
					</div>
					<a href="#" class="close" data-bs-dismiss="modal">
						<i class="fas fa-times"></i>
					</a>
				</div>
				<form action="" method="post">
					<div class="modal-body">
						<div class="form-group">
							<label class="form-label" for="input-balance">{$BALANCE} {$USER_DATA->bal}</label>
							<input type="number" class="form-control" id="input-balance" name="trade_bal_send" placeholder="{$COUNT_TITLE}">
						</div>
						<div class="form-group">
							<label class="form-label" for="input-recipient">{$RECIPIENT}</label>
							<input type="text" class="form-control" id="input-recipient" name="to_user" list="list-recipients">
							<datalist id="list-recipients">
								{foreach from=$USERS_LIST item=user}
									<option value="{$user.mc_name}">
								{/foreach}
							</datalist>
						</div>
					</div>
					<div class="modal-footer">
						<button class="btn btn-secondary btn-sm" data-bs-dismiss="modal">{$CANCEL}</button>
						<button type="submit" class="btn btn-primary btn-sm">{$SUBMIT}</button>
						<input type="hidden" name="token" value="{$TOKEN}">
					</div>
				</form>
			</div>
		</div>
	</div>

{/block}