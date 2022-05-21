{extends file="./layout.tpl"}

{block name=sHeading}

	<h2>{$SETTINGS}</h2>

{/block}

{block name=sContent}
	
	{if !empty($SUCCESS)}
		<div class="alert alert-success">
			{$SUCCESS}
		</div>
	{/if}

	{if !empty($ERROR)}
		<div class="alert alert-danger">
			{$ERROR}
		</div>
	{/if}

	<div class="card">
		<div class="card-body">
			<form action="" method="post">
				<div class="row g-3">
					<div class="col-xl-6">
						<div class="form-group">
							<label class="form-label" for="input-language">{$ACTIVE_LANGUAGE}</label>
							<select class="form-control" id="inputlanguage" name="language">
								{foreach from=$LANGUAGES item=language}
									<option value="{$language.name}"{if ($language.active == true)} selected{/if}>{$language.name}</option>
								{/foreach}
							</select>
						</div>
					</div>
					<div class="col-xl-6">
						<div class="form-group">
							<label class="form-label" for="input-timezone">{$TIMEZONE}</label>
							<select class="form-control" id="input-timezone" name="timezone">
								{foreach from=$TIMEZONES item=timezone key=key}
									<option value="{$key}"{if ($SELECTED_TIMEZONE == $key)} selected{/if}>
										[{$timezone.offset}] {$timezone.name} &bull; {$timezone.time}
									</option>
								{/foreach}
							</select>
						</div>
					</div>
					{if isset($TEMPLATES) && count($TEMPLATES) > 1}
						<div class="col-xl-6">
							<div class="form-group">
								<label class="form-label" for="input-template">{$ACTIVE_TEMPLATE}</label>
								<select class="form-control" id="input-template" name="template">
									{foreach from=$TEMPLATES item=template}
										<option value="{$template.id}"{if ($template.active == true)} selected{/if}>{$template.name}</option>
									{/foreach}
								</select>
							</div>
						</div>
					{/if}
					{if isset($GRAVATAR)}
						<div class="col-xl-6">
							<div class="form-group">
								<label class="form-label" for="input-gravatar">{$GRAVATAR}</label>
								<select class="form-control" id="input-gravatar" name="gravatar">
									<option value="1"{if ($GRAVATAR_VALUE == '1')} selected{/if}>{$ENABLED}</option>
									<option value="0"{if ($GRAVATAR_VALUE == '0')} selected{/if}>{$DISABLED}</option>
								</select>
							</div>
						</div>
					{/if}
					{if isset($TOPIC_UPDATES)}
						<div class="col-xl-6">
							<div class="form-group">
								<label class="form-label" for="input-topicUpdates">{$TOPIC_UPDATES}</label>
								<select class="form-control" id="input-topicUpdates" name="topicUpdates">
									<option value="1"{if ($TOPIC_UPDATES_ENABLED == true)} selected{/if}>{$ENABLED}</option>
									<option value="0"{if ($TOPIC_UPDATES_ENABLED == false)} selected{/if}>{$DISABLED}</option>
								</select>
							</div>
						</div>
					{/if}
					{if isset($PRIVATE_PROFILE)}
						<div class="col-xl-6">
							<div class="form-group">
								<label class="form-label" for="input-privateProfile">{$PRIVATE_PROFILE}</label>
								<select class="form-control" id="input-privateProfile" name="privateProfile">
									<option value="1"{if $PRIVATE_PROFILE_ENABLED == true} selected {/if}>{$ENABLED}</option>
									<option value="0"{if $PRIVATE_PROFILE_ENABLED == false} selected {/if}>{$DISABLED}</option>
								</select>
							</div>
						</div>
					{/if}
					{foreach from=$PROFILE_FIELDS item=field}
						<div class="col-xl-6">
							<div class="form-group">
								{if !isset($field.disabled)}
									<label class="form-label" for="input-custom-{$field.id}">{$field.name}</label>
									{if ($field.type == "text")}
										<input type="text" class="form-control" id="input-custom-{$field.id}" name="{$field.id}" value="{$field.value}">
									{else if ($field.type == "textarea")}
										<textarea class="form-control" id="input-custom-{$field.id}" name="{$field.id}">{$field.value}</textarea>
									{else if ($field.type == "date")}
										<input type="text" class="form-control" id="input-custom-{$field.id}" name="{$field.id}" value="{$field.value}" onfocus="(this.type='date')" onblur="(this.type='text')">
									{/if}
								{/if}
							</div>
						</div>
					{/foreach}
					{if isset($SIGNATURE)}
						<div class="col-xl-12">
							<div class="form-group">
								<label class="form-label" for="inputSignature">{$SIGNATURE}</label>
								{if !isset($MARKDOWN)}
									<textarea class="form-control" id="inputSignature" name="signature">{$SIGNATURE_VALUE}</textarea>
								{else}
									<div class="form-group">
										<textarea class="form-control" id="inputSignature" name="signature">{$SIGNATURE_VALUE}</textarea>
										<div class="form-meta">
											{$MARKDOWN_HELP}
										</div>
									</div>
								{/if}
							</div>
						</div>
					{/if}
					<div class="form-actions">
						<button type="submit" class="btn btn-primary">{$SUBMIT}</button>
					</div>
				</div>
				<input type="hidden" name="token" value="{$TOKEN}">
				<input type="hidden" name="action" value="settings">
			</form>
		</div>
	</div>

	{if ($DISCORD_INTEGRATION)}
		<div class="card">
			<div class="card-body">
				<span class="float-end">
					{if ($DISCORD_LINKED)}
						<span class="badge bg-success">{$LINKED}</span>
					{else if isset($PENDING_LINK)}
						<span class="badge bg-warning">{$PENDING_LINK}</span>
					{else}
						<span class="badge bg-error">{$NOT_LINKED}</span>
					{/if}
				</span>
				<h3>{$DISCORD_LINK}</h3>
				{if ($DISCORD_LINKED)}
					<p>
						<strong>{$DISCORD_USERNAME}:</strong> {$DISCORD_USERNAME_VALUE}
					</p>
				{/if}
				<form action="" method="post">
					<div class="form-group">
						{if ($DISCORD_LINKED)} 
							<button type="submit" class="btn btn-danger">{$UNLINK}</button>
							<input type="hidden" name="unlink" value="true">
						{else}
							<button type="submit" class="btn btn-success">{$LINK}</button>
						{/if}
					</div>
					<input type="hidden" name="token" value="{$TOKEN}">
					<input type="hidden" name="action" value="discord">
				</form>
			</div>
		</div>
	{/if}

	<div class="card">
		<form action="" method="post">
			<div class="card-body">
				<h3>{$CHANGE_EMAIL_ADDRESS}</h3>
				<div class="form-group">
					<label class="form-label" for="input-password">{$CURRENT_PASSWORD}</label>
					<input type="password" class="form-control" id="input-password" name="password">
				</div>
				<div class="form-group">
					<label class="form-label" for="inputEmail">{$EMAIL_ADDRESS}</label>
					<input type="email" class="form-control" id="input-email" name="email" value="{$CURRENT_EMAIL}">
				</div>
				<div class="form-actions">
					<input type="submit" class="btn btn-primary" value="{$SUBMIT}">
				</div>
			</div>
			<input type="hidden" name="token" value="{$TOKEN}">
			<input type="hidden" name="action" value="email">
		</form>
	</div>

	<div class="card">
		<form action="" method="post">
			<div class="card-body">
				<h3>{$CHANGE_PASSWORD}</h3>
				<div class="form-group">
					<label class="form-label" for="input-oldPassword">{$CURRENT_PASSWORD}</label>
					<input type="password" class="form-control" id="input-oldPassword" name="old_password">
				</div>
				<div class="form-group">
					<label class="form-label" for="input-newPassword">{$NEW_PASSWORD}</label>
					<input type="password" class="form-control" id="inputNewPassword" name="new_password">
				</div>
				<div class="form-group">
					<label class="form-label" for="input-newPasswordAgain">{$CONFIRM_NEW_PASSWORD}</label>
					<input type="password" class="form-control" id="input-newPasswordAgain" name="new_password_again">
				</div>
				<div class="form-actions">
					<input type="submit" class="btn btn-primary" value="{$SUBMIT}">
				</div>
			</div>
			<input type="hidden" name="token" value="{$TOKEN}">
			<input type="hidden" name="action" value="password">
		</form>
	</div>

	<div class="card">
		<div class="card-body">
			<h3>{$TWO_FACTOR_AUTH}</h3>
			{if isset($ENABLE)}
				<a href="{$ENABLE_LINK}" class="btn btn-success">{$ENABLE}</a>
			{else if isset($FORCED)}
				<a href="#" class="btn btn-danger disabled" disabled>{$DISABLE}</a>
			{else}
				<a href="{$DISABLE_LINK}" class="btn btn-danger">{$DISABLE}</a>
			{/if}
		</div>
	</div>

	{if isset($CUSTOM_AVATARS)}
		<div class="card">
			<div class="card-body">
				<h3>{$UPLOAD_NEW_PROFILE_IMAGE}</h3>
				<form action="{$CUSTOM_AVATARS_SCRIPT}" method="post" enctype="multipart/form-data">
					<div class="form-group">
						<div class="input-group">
							<input type="file" class="form-control" id="input-avatar" name="file">
							<button type="submit" class="btn btn-primary">{$SUBMIT}</button>
						</div>
					</div>
					<input type="hidden" name="token" value="{$TOKEN}">
					<input type="hidden" name="type" value="avatar">
				</form>
			</div>
		</div>
	{/if}

{/block}