{assign var="layout" value="layout.tpl"}
{if ($LITHIUM_SETTINGS.useCustomLayout)}
	{assign var="layout" value="layout.fluid.tpl"}
{/if}

{extends file=$layout}

{block name=heading}

	<h2>{$TWO_FACTOR_AUTH}</h2>

{/block}

{block name=content}

	{if !empty($ERRORS)}
		<div class="alert alert-danger">
			{$ERRORR}
		</div>
	{/if}

	<div class="card">
		<div class="card-body">
			<div class="row justify-content-center">
				<div class="col-lg-6">
					<form action="" method="post">
						<div class="form-group">
							<label class="form-label" for="input-tfaCode">{$TFA_ENTER_CODE}</label>
							<input type="text" class="form-control" id="input-tfaCode" name="tfa_code">
						</div>
						<div class="form-actions">
							<button type="submit" class="btn btn-primary">{$SUBMIT}</button>
						</div>
						<input type="hidden" name="token" value="{$TOKEN}">
						<input type="hidden" name="tfa" value="true">
					</form>
				</div>
			</div>
		</div>
	</div>

{/block}