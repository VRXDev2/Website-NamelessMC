{assign var="WIDGETS_PAGE" value=true}
{extends file="store/layout.tpl"}

{block name=sHeading}

	<h2>{$STORE}</h2>

{/block}

{block name=sContent}

	{if isset($SUCCESS)}
		<div class="alert alert-success">
			{$SUCCESS}
		</div>
	{/if}

	{if !empty($ERRORS)}
		<div class="alert alert-danger">
			{foreach from=$ERRORS item=error}
				<li>{$error}</li>
			{/foreach}
		</div>
	{/if}

	<div class="card">
		<div class="card-body">
			<h3>{$PRODUCT_NAME}</h3>
			<div class="row justify-content-center">
				<div class="col-lg-8">
					<form action="" method="post">
						{foreach from=$PRODUCT_FIELDS  item=field}
							<div class="form-group">
								<label for="input-{$field.id}" class="form-label">
									{$field.description}
									{if ($field.required)}
										<span class="text-danger" title="Required">*</span>
									{/if}
								</label>
								{if ($field.type == "1")}
									<input type="text" class="form-control" id="input-{$field.id}" name="{$field.id}">
								{else if ($field.type == "2")}
									<select class="form-control" name="{$field.id}" id="input-{$field.id}">
										{foreach from=$field.options item=option}
											<option value="{$option}">{$option}</option>
										{/foreach}
									</select>
								{else if ($field.type == "3")}
									<textarea class="form-control" id="input-{$field.id}" name="{$field.id}"></textarea>
								{else if ($field.type == "4")}
									<input type="number" class="form-control" id="input-{$field.id}" name="{$field.id}">
								{else if ($field.type == "5")}
									<input type="email" class="form-control" id="input-{$field.id}" name="{$field.id}">
								{else if ($field.type == "6")}
									{foreach from=$field.options item=option}
										<div class="form-check">
											<input type="radio" class="form-check-input" id="input-{$field.id}-{$option|escape:"url"}" name="{$field.id}" value="{$option}"{if ($field.required)} required{/if}>
											<label for="input-{$field.id}-{$option|escape:"url"}" class="form-check-label">{$option}</label>
										</div>
									{/foreach}
								{else if ($field.type == "7")}
									{foreach from=$field.options item=option}
										<div class="form-check">
											<input type="checkbox" class="form-check-input" id="input-{$field.id}-{$option|escape:"url"}" name="{$field.id}[]" value="{$option}"{if ($field.required)} required{/if}>
											<label for="input-{$field.id}-{$option|escape:"url"}" class="form-check-label">{$option}</label>
										</div>
									{/foreach}
								{/if}
							</div>
						{/foreach}
						<div class="form-actions">
							<button type="submit" class="btn btn-primary">{$CONTINUE}</button>
						</div>
						<input type="hidden" name="token" value="{$TOKEN}">
					</form>
				</div>
			</div>
		</div>
	</div>

{/block}