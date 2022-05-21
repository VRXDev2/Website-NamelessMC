{extends file="layout.tpl"}

{block name=heading}

	<h2>{$FORUM_SEARCH}</h2>

{/block}

{block name=content}

	{if isset($ERROR)}
		<div class="alert alert-danger">
			{$ERROR}
		</div>
	{/if}

	<div class="card">
		<div class="card-body">
			<div class="row justify-content-center">
				<div class="col-lg-6">
					<form action="{$FORM_ACTION}" method="post">
						<div class="form-group">
							<label class="form-label" for="input-search">{$SEARCH}</label>
							<input type="text" class="form-control" id="input-search" name="forum_search">
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