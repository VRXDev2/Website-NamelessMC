{extends file="layout.tpl"}

{block name=heading}

	<h2>{$MERGE_TOPICS}</h2>

{/block}

{block name=content}

	<div class="card">
		<div class="card-body">
			<div class="row justify-content-center">
				<div class="col-lg-6">
					<form action="" method="post">
						<div class="form-group">
							<label class="form-label" for="input-topic">{$MERGE_INSTRUCTIONS}</label>
							<select class="form-select" id="input-topic" name="merge">
								{foreach from=$TOPICS item=topic}
									<option value="{$topic->id}">{$topic->topic_title|escape}</option>
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
		</div>
	</div>

{/block}