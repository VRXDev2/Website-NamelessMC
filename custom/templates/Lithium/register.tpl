{assign var="layout" value="layout.tpl"}
{if ($LITHIUM_SETTINGS.useCustomLayout)}
	{assign var="layout" value="layout.fluid.tpl"}
{/if}

{extends file=$layout}

{block name=heading}

	<h2>{$CREATE_AN_ACCOUNT}</h2>

{/block}

{block name=content}

	{if isset($REGISTRATION_ERROR) && !empty($REGISTRATION_ERROR)}
		<div class="alert alert-danger">
			{foreach from=$REGISTRATION_ERROR item=error}
				<li>{$error}</li>
			{/foreach}
		</div>
	{/if}

	<div class="card">
		<div class="card-body">
			<div class="row justify-content-center">
				<div class="col-lg-5">
					<form action="" method="post" id="form-register">
						{if isset($NICKNAMES)}
							<div class="form-group">
								<label class="form-label" for="input-username">{$NICKNAME}</label>
								{if isset($MINECRAFT)}
									<input type="text" class="form-control" id="input-username" name="nickname" value="{$NICKNAME_VALUE}">
								{else}
									<input type="text" class="form-control" id="input-username" name="username" value="{$USERNAME_VALUE}">
								{/if}
							</div>
							{if isset($MINECRAFT)}
								<div class="form-group">
									<label class="form-label" for="input-mcName">{$MINECRAFT_USERNAME}</label>
									<input type="text" class="form-control" id="input-mcName" name="username" value="{$USERNAME_VALUE}">
								</div>
							{/if}
						{else}
							{if isset($MINECRAFT)}
								<div class="form-group">
									<label class="form-label" for="input-mcName">{$MINECRAFT_USERNAME}</label>
									<input type="text" class="form-control" id="input-mcName" name="username" value="{$USERNAME_VALUE}">
								</div>
							{else}
								<div class="form-group">
									<label class="form-label" for="input-mcName">{$USERNAME}</label>
									<input type="text" name="username" class="form-control" id="input-mcName" value="{$USERNAME_VALUE}">
								</div>
							{/if}
						{/if}
						<div class="form-group">
							<label class="form-label" for="input-email">{$EMAIL}</label>
							<input type="email" class="form-control" id="input-email" name="email" value="{$EMAIL_VALUE}">
						</div>
						<div class="form-group">
							<label class="form-label" for="input-password">{$PASSWORD}</label>
							<input type="password" class="form-control" id="input-password" name="password">
						</div>
						<div class="form-group">
							<label class="form-label" for="input-passwordAgain">{$CONFIRM_PASSWORD}</label>
							<input type="password" class="form-control" id="input-passwordAgain" name="password_again">
						</div>
						{if !empty($CUSTOM_FIELDS)}
							{foreach from=$CUSTOM_FIELDS item=field}
								<div class="form-group">
									<label class="form-label" for="input-custom-{$field.name}">{$field.name}</label>
									{if $field.type == 1}
										<input type="text" class="form-control" id="input-custom-{$field.name}" name="{$field.name}" value="{$field.value}" placeholder="{$field.description}">
									{else if $field.type == 2}
										<textarea class="form-control" id="input-custom-{$field.name}" name="{$field.name}" placeholder="{$field.description}">{$field.value}</textrea>
									{else if $field.type == 3}
										<input type="date" class="form-control" id="input-custom-{$field.name}" name="{$field.name}" value="{$field.value}">
									{/if}
								</div>
							{/foreach}
						{/if}
						{if isset($CAPTCHA)}
							<div class="form-group">
								{$CAPTCHA}
							</div>
						{/if}
						<div class="form-group">
							<div class="form-check">
								<input type="checkbox" class="form-check-input" id="input-tac" name="t_and_c" value="1">
								<label class="form-check-label" for="input-tac">{$AGREE_TO_TERMS}</label>
							</div>
						</div>
						<div class="form-actions">
							<button type="submit" class="btn btn-primary btn-block">{$REGISTER}</button>
						</div>
						<input type="hidden" name="token" value="{$TOKEN}">
					</form>
					<div>
						<div class="separator">
							{$ALREADY_REGISTERED}
						</div>
						<a href="{$LOGIN_URL}" class="btn btn-success btn-block">{$LOG_IN}</a>
					</div>
				</div>
			</div>
		</div>
	</div>
	
{/block}