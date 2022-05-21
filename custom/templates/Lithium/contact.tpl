{extends file="layout.tpl"}

{block name=heading}

	<h2>{$CONTACT}</h2>

{/block}

{block name=content}

	{if isset($SUCCESS)}
		<div class="alert alert-success">
			{$SUCCESS}
		</div>
	{/if}

	{if isset($ERROR)}
		<div class="alert alert-danger">
			{$ERROR}
		</div>
	{/if}

	{if isset($ERROR_EMAIL)}
		<div class="alert alert-danger">
			{$ERROR_EMAIL}
		</div>
	{/if}

	{if isset($ERROR_CONTENT)}
		<div class="alert alert-danger">
			{$ERROR_CONTENT}
		</div>
	{/if}

	<div class="card">
		<div class="card-body">
			<div class="row justify-content-center">
				<div class="col-lg-6">
					<form action="" method="post" id="form-contact">
						<div class="form-group">
							<label class="form-label" for="input-email">{$EMAIL}</label>
							<input type="email" class="form-control" id="input-email" name="email">
						</div>
						<div class="form-group">
							<label class="form-label" for="input-message">{$MESSAGE}</label>
							<textarea class="form-control" id="input-message" name="content"></textarea>
						</div>
						{if isset($CAPTCHA)}
							<div class="form-group">
								{$CAPTCHA}
							</div>
						{/if}
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