{extends file="layout.tpl"}

{block name=heading}

	<h2>{$MOVE_RESOURCE}</h2>

{/block}

{block name=content}

	<div class="card">
		<div class="card-body">
			{if !empty($CATEGORIES)}
				<div class="row justify-content-center">
					<div class="col-lg-6">
						<form action="" method="post">
							<div class="form-group">
								<label class="form-label" for="input-category">{$MOVE_TO}</label>
								<select class="form-control" id="input-category"name="category_id">
									{foreach from=$CATEGORIES item=category}
										<option value="{$category->id}">{$category->name|escape}</option>
									{/foreach}
								</select>
							</div>
							<div class="form-actions">
								<a href="{$CANCEL_LINK}" class="btn btn-secondary" onclick="return confirm('{$CONFIRM_CANCEL}')">{$CANCEL}</a>
								<button type="submit" class="btn btn-primary">{$SUBMIT}</button>
							</div>
							<input type="hidden" name="token" value="{$TOKEN}">
						</form>
					</div>
				</div>
			{else}
				{$NO_CATEGORIES}
			{/if}
		</div>
	</div>

{/block}