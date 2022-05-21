{extends file="layout.tpl"}

{block name=heading}

	<h2>{$MOVE_TOPIC}</h2>

{/block}

{block name=content}

	<div class="card">
		<div class="card-body">
			<div class="row justify-content-center">
				<div class="col-lg-6">
					<form action="" method="post">
						<div class="form-group">
							<label class="form-label" for="input-forum">{$MOVE_TO}</label>
							<select class="form-control" id="input-forum" name="forum">
								{foreach from=$FORUMS item=forum}
									<option value="{$forum->id}">{$forum->forum_title|escape}</option>
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