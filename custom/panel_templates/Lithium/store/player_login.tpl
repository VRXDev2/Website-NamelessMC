{assign var="WIDGETS_PAGE" value=true}
{extends file="store/layout.tpl"}

{block name=sHeading}

	<h2>{$STORE}</h2>

{/block}

{block name=sContent}

	{if !empty($ERRORS)}
		<div class="alert alert-danger">
			{foreach from=$ERRORS item=error}
				<li>{$error}</li>
			{/foreach}
		</div>
	{/if}

	<div class="card">
		<div class="card-header">
			{$PLEASE_ENTER_USERNAME}
		</div>
		<div class="card-body">
			<form action="" method="post">
				<div class="form-group">
					<input type="text" class="form-control" id="username" name="username" placeholder="{$PLEASE_ENTER_USERNAME}">
				</div>
				<div class="form-group">
					<button type="submit" class="btn btn-primary">{$CONTINUE}</button>
				</div>
				<input type="hidden" name="token" value="{$TOKEN}">
				<input type="hidden" name="type" value="store_login">
			</form>
		</div>
	</div>

{/block}