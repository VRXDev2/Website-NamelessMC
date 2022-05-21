{extends file="layout.tpl"}

{block name=heading}

	<h2>{$VIEWING_RELEASE}</h2>

{/block}

{block name=content}

	<div class="action-bar">
		<div class="action-bar-buttons">
			<a href="{$BACK_LINK}" class="btn btn-secondary btn-sm">{$BACK}</a>
			{if isset($LOG_IN_TO_DOWNLOAD) && !isset($LOGGED_IN_USER)}
				<a href="{$CONFIG_PATH}login" class="btn btn-primary btn-sm">{$LOG_IN_TO_DOWNLOAD}</a>
			{else if isset($DOWNLOAD_URL)}
				<a href="{$DOWNLOAD_URL}" class="btn btn-primary btn-sm">{$DOWNLOAD}</a>
			{else if isset($PURCHASE_FOR_PRICE)}
				<a href="{if isset($PURCHASE_LINK)}{$PURCHASE_LINK}{else}#{/if}" class="btn btn-primary btn-sm{if !isset($PURCHASE_LINK)} disabled{/if}">{$PURCHASE_FOR_PRICE}</a>
			{else if isset($PAYMENT_PENDING)}
				<a class="btn btn-primary disabled">{$PAYMENT_PENDING}</a>
			{/if}
		</div>
	</div>

	<div class="card">
		<div class="card-body">
			{if !empty($DESCRIPTION)}
				<div class="post">
					{$DESCRIPTION}
				</div>
			{/if}
			<div class="meta-block meta-block-bottom">
				<div class="meta">
					<span title="{$DATE_FULL}">{$DATE}</span>
				</div>
			</div>
		</div>
	</div>

{/block}