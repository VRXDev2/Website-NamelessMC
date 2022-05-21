{assign var="layout" value="layout.tpl"}
{if ($LITHIUM_SETTINGS.useCustomLayout)}
	{assign var="layout" value="layout.fluid.tpl"}
{/if}

{extends file=$layout}

{block name=heading}

	<h2>{$REGISTER}</h2>

{/block}

{block name=content}

	{if !empty($ERRORS)}
		<div class="alert alert-danger">
			{foreach from=$ERRORS item=error}
				<li>{$error}</li>
			{/foreach}
		</div>
	{/if}

	<div class="card">
		<div class="card-body">
			<p class="mb-3">{$ENTER_NEW_PASSWORD}</p>
			<div class="row justify-content-center">
				<div class="col-lg-5">
					<form action="" method="post">
						<div class="form-group">
							<label class="form-label" for="input-password">{$PASSWORD}</label>
							<input type="password" class="form-control" id="input-password" name="password">
						</div>
						<div class="form-group">
							<label class="form-label" for="input-passwordAgain">{$CONFIRM_PASSWORD}</label>
							<input type="password" class="form-control" id="input-passwordAgain" name="password_again">
						</div>
						<div class="form-group">
							<div class="form-check">
								<input type="checkbox" class="form-check-input" id="input-tac" name="t_and_c" value="1">
								<label class="form-check-label" for="input-tac">{$AGREE_TO_TERMS}</label>
							</div>
						</div>
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