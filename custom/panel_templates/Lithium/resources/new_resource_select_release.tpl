{extends file="layout.tpl"}

{block name=heading}

	<h2>{$NEW_RESOURCE}</h2>

{/block}

{block name=content}

	{if isset($ERROR)}
		<div class="alert alert-danger">
			{$ERROR}
		</div>
	{/if}

	<div class="card">
		<div class="card-body">
			<form action="" method="post">
				<div class="form-group">
					<label class="form-label" for="input-release">{$SELECT_RELEASE}</label>
					<select class="form-control" id="input-release" name="release">
						{foreach from=$RELEASES item=release}
							<option value="{$release.id}">{$release.name} [{$release.tag}]</option>
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

{/block}