{assign var="layout" value="layout.tpl"}
{if ($LITHIUM_SETTINGS.useCustomLayout)}
	{assign var="layout" value="layout.fluid.tpl"}
{/if}

{extends file=$layout}

{block name=heading}

	<h2>{$SIGN_IN}</h2>

{/block}

{block name=content}

	{if isset($ERROR) && !empty($ERROR)}
		<div class="alert alert-danger">
			{foreach from=$ERROR item=error}
				<li>{$error}</li>
			{/foreach}
		</div>
	{/if}

	{if isset($SUCCESS)}
		<div class="alert alert-success">
			{$SUCCESS}
		</div>
	{/if}

	<div class="card">
		<div class="card-body">
			<div class="row justify-content-center">
				<div class="col-lg-5">
					<form action="" method="post" id="form-login">
						{if isset($EMAIL)}
							<div class="form-group">
								<label class="form-label" for="input-email">{$EMAIL}</label>
								<input type="email" class="form-control" id="input-email" name="email" value="{$USERNAME_INPUT}">
							</div>
						{else}
							<div class="form-group">
								<label class="form-label" for="input-username">{$USERNAME}</label>
								<input type="text" class="form-control" id="input-username" name="username" value="{$USERNAME_INPUT}">
							</div>
						{/if}
						<div class="form-group">
							<label class="form-label" for="input-password">{$PASSWORD}</label>
							<input type="password" class="form-control" id="input-password" name="password">
						</div>
						{if isset($CAPTCHA)}
							<div class="form-group">
								{$CAPTCHA}
							</div>
						{/if}
						<div class="form-group d-flex">
							<div class="form-check">
								<input type="checkbox" class="form-check-input" id="input-remember" name="remember" value="1">
								<label class="form-check-label" for="input-remember">{$REMEMBER_ME}</label>
							</div>
							<a href="{$FORGOT_PASSWORD_URL}" class="form-meta mt-0 ms-auto">{$FORGOT_PASSWORD}</a>
						</div>
						<div class="form-actions">
							<button type="submit" class="btn btn-primary btn-block">{$SIGN_IN}</button>
						</div>
						<input type="hidden" name="token" value="{$FORM_TOKEN}">
					</form>
					<div>
						<div class="separator">
							{$NOT_REGISTERED_YET}
						</div>
						<a href="{$REGISTER_URL}" class="btn btn-success btn-block">{$REGISTER}</a>
					</div>
				</div>
			</div>
		</div>
	</div>

{/block}