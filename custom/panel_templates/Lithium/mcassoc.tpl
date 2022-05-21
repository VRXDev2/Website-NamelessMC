{extends file="layout.tpl"}

{block name=heading}

	<h2>{$VERIFY_ACCOUNT}</h2>

{/block}

{block name=content}

	{if isset($SUCCESS)}
		<div class="alert alert-success">
			{$SUCCESS}
			<a class="btn btn-primary btn-sm mt-2 ml-2" href="{$LOGIN_LINK}">{$LOGIN_TEXT}</a>
		</div>
	{/if}

	{if isset($ERROR)}
		<div class="alert alert-danger">
			{$ERROR}
			<a class="btn btn-danger btn-sm mt-2 ml-2" href="{$RETRY_LINK}">{$RETRY_TEXT}</a>
		</div>
	{/if}

	{if !isset($STEP)}
		<div class="card">
			<div class="card-body">
				<p class="mb-3">{$VERIFY_ACCOUNT_HELP}</p>
				<div class="row justify-content-center">
					<div class="col-lg-6">
						<div id="mcassoc-body">
							{$MCASSOC}
						</div>
					</div>
				</div>
			</div>
		</div>
	{/if}

{/block}