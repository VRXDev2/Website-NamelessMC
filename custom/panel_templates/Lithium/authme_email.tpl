{assign var="layout" value="layout.tpl"}
{if ($LITHIUM_SETTINGS.useCustomLayout)}
	{assign var="layout" value="layout.fluid.tpl"}
{/if}

{extends file=$layout}

{block name=heading}

	<h2>{$CONNECT_WITH_AUTHME}</h2>

{/block}

{block name=content}

	{if isset($AUTHME_SUCCESS)}
		<div class="alert alert-info">
			<strong>{$AUTHME_SUCCESS}</strong>
			{$AUTHME_INFO}
		</div>
	{/if}

	{if !empty($ERRORS)}
		<div class="alert alert-danger">
			{foreach from=$ERRORS item=error}
				<li>{$error}</li>
			{/foreach}
		</div>
	{/if}

	<div class="card">
		<div class="card-body">
			<div class="row justify-content-center">
				<div class="col-lg-5">
					<form action="" method="post">
						<div class="form-group">
							<label class="form-label" for="input-email">{$EMAIL}</label>
							<input type="email" class="form-control" id="input-email" name="email">
						</div>
						{if isset($NICKNAME)}
							<div class="form-group">
								<label class="form-label" for="input-nickname">{$NICKNAME}</label>
								<input type="text" class="form-control" id="input-nickname" name="nickname">
							</div>
						{/if}
						{* <div class="form-group">
							<div class="form-check">
								<input type="checkbox" class="form-check-input" id="input-tac" name="t_and_c" value="1">
								<label class="form-check-label" for="input-tac">{$AGREE_TO_TERMS}</label>
							</div>
						</div> *}
						<div class="form-actions">
							<button type="submit" class="btn btn-primary">{$SUBMIT}</button>
						</div>
						<input type="hidden" name="token" value="{$TOKEN}">
					</form>
				</div>
			</div>
		</div>
	</div>

{/block}