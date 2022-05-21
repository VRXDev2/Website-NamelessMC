{extends file="layout.tpl"}

{block name=heading}

	<h2>{$TITLE}</h2>

{/block}

{block name=content}

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
			{if isset($CONTENT)}
				<p>{$CONTENT}</p>
				<hr />
			{/if}
			<form action="" method="post">
				{foreach from=$FIELDS item=field}
					<div class="form-group">
						{if ($field.type != "4" && $field.type != "5")}
							<label for="input-{$field.id}" class="form-label">
								{$field.name}
								{if ($field.required)}
									<span class="text-danger" title="Required">*</span>
								{/if}
							</label>
						{/if}
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
							<p>{'<br />'|implode:$field.options}</p>
						{else if ($field.type == "5")}
							<hr />
						{else if ($field.type == "6")}
							<input type="number" class="form-control" id="input-{$field.id}" name="{$field.id}">
						{else if ($field.type == "7")}
							<input type="email" class="form-control" id="input-{$field.id}" name="{$field.id}">
						{else if $field.type == "8"}
							{foreach from=$field.options item=option}
								<div class="form-check">
									<input type="radio" class="form-check-input" id="input-{$field.id}-{$option|escape:"url"}" name="{$field.id}" value="{$option}"{if ($field.required)} required{/if}>
									<label for="input-{$field.id}-{$option|escape:"url"}" class="form-check-label">{$option}</label>
								</div>
							{/foreach}
						{else if $field.type == "9"}
							{foreach from=$field.options item=option}
								<div class="form-check">
									<input type="checkbox" class="form-check-input" id="input-{$field.id}-{$option|escape:"url"}" name="{$field.id}[]" value="{$option}"{if ($field.required)} required{/if}>
									<label for="input-{$field.id}-{$option|escape:"url"}" class="form-check-label">{$option}</label>
								</div>
							{/foreach}
						{/if}
					</div>
					{if !empty($field.info)}
						<div class="form-meta mb-3">
							{$field.info}
						</div>
					{/if}
				{/foreach}
				{if ($CAPTCHA)}
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

{/block}