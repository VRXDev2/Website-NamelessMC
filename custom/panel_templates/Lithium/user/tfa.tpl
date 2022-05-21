{extends file="./layout.tpl"}

{block name=sHeading}

	<h2>{$TWO_FACTOR_AUTH}</h2>

{/block}

{block name=sContent}

	{if isset($ERROR)}
		<div class="alert alert-danger">
			{$ERROR}
		</div>
	{/if}

	{if !empty($ERRORS)}
		<div class="alert alert-danger">
			{foreach from=$ERRORS item=error}
				<li>{$error}</li>
			{/foreach}
		</div>
	{/if}

	{if isset($TFA_SCAN_CODE_TEXT)}
		<div class="card">
			<div class="card-body">
				<div class="form-group text-center">
					<p>{$TFA_SCAN_CODE_TEXT}</p>
					<img src="{$IMG_SRC}" />
					<p>{$TFA_CODE_TEXT}</p>
					<strong>{$TFA_CODE}</strong>
				</div>
				<div class="form-actions">
					<a href="{$CANCEL_LINK}" class="btn btn-secondary">{$CANCEL}</a>
					<a href="{$LINK}" class="btn btn-primary">{$NEXT}</a>
				</div>
			</div>
		</div>
	{else}
		<div class="card">
			<form action="" method="post">
				<div class="card-body">
					<div class="row justify-content-center">
						<div class="col-lg-6">
							<div class="form-group">
								<label class="form-label" for="input-tfaCode">{$TFA_ENTER_CODE}</label>
								<input type="text" class="form-control" id="input-tfaCode" name="tfa_code">
							</div>
						</div>
					</div>
					<div class="form-actions">
						<a href="{$CANCEL_LINK}" class="btn btn-secondary">{$CANCEL}</a>
						<button type="submit" class="btn btn-primary">{$SUBMIT}</button>
					</div>
				</div>
				<input type="hidden" name="token" value="{$TOKEN}">
			</form>
		</div>
	{/if}

{/block}