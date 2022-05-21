{extends file="layout.tpl"}

{block name=heading}

	<h2>{$NEW_TICKET}</h2>
	
{/block}

{block name=content}

	{if !empty($ERROR)}
		<div class="alert alert-danger">
			{foreach from=$ERROR item=error}
				<li>{$error}</li>
			{/foreach}
		</div>
	{/if}

	<div class="card">
		<div class="card-body">
			<form action="" method="post">
				<div class="form-group">
					<label class="form-label" for="input-ticketTitle">{$TICKET_TITLE}</label>
					<input type="text" class="form-control" id="input-ticketTitle" name="ticket_title" maxlength="64" required>
				</div>
				{if !empty($CATEGORIES)}
					<div class="form-group">
						<label class="form-label" for="input-ticketCategories">{$CATEGORIES_TITLE}</label>
						<div class="form-check form-check-inline">
							{foreach from=$CATEGORIES item=category}
								<input type="checkbox" class="form-check-input" id="input-ticketCategory-{$category->id}" name="ticket_categories[]" value="{$category->id}">
								<label class="form-check-label" for="input-ticketCategory-{$category->id}">
									<span class="badge" style="background: #{$category->color}; color: #fff;">{$category->text}</span>
								</label>
							{/foreach}
						</div>
					</div>
				{/if}
				<div class="form-group">
					<label class="form-label" for="input-ticketContent">{$YOUR_ISSUE}</label>
					<textarea class="form-control" id="input-ticketContent" name="ticket_content" placeholder="{$DESCRIBE_ISSUE}" required></textarea>
				</div>
				<div class="form-actions">
					<a href="{$TICKETS_URL}" class="btn btn-secondary">{$CANCEL}</a>
					<button type="submit" class="btn btn-primary">{$CREATE}</button>
				</div>
				<input type="hidden" name="token" value="{$TOKEN}">
			</form>
		</div>
	</div>

{/block}