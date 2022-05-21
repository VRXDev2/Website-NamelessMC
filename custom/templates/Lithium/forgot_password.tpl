{assign var="layout" value="layout.tpl"}
{if ($LITHIUM_SETTINGS.useCustomLayout)}
	{assign var="layout" value="layout.fluid.tpl"}
{/if}

{extends file=$layout}

{block name=heading}

	<h2>{$FORGOT_PASSWORD}</h2>

{/block}

{block name=content}

	{if isset($ERROR)}
		<div class="alert alert-danger">
			{$ERROR}
		</div>
	{/if}

	{if isset($SUCCESS)}
		<div class="alert alert-success">
			{$SUCCESS}
		</div>
	{/if}

	<div class="card">
		<div class="card-body">
			<p class="mb-3">{$FORGOT_PASSWORD_INSTRUCTIONS}</p>
			<div class="row justify-content-center">
				<div class="col-lg-5">
					<form action="" method="post">
						<div class="form-group">
							<label class="form-label" for="input-email">{$EMAIL_ADDRESS}</label>
							<input type="email" class="form-control" id="input-email" name="email">
						</div>
						<div class="form-actions">
							<button type="submit" class="btn btn-primary btn-block">{$SUBMIT}</button>
						</div>
						<input type="hidden" name="token" value="{$TOKEN}">
					</form>
				</div>
			</div>
		</div>
	</div>

{/block}