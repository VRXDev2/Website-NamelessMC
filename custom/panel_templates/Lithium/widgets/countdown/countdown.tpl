{if isset($COUNTDOWN_TITLE)}
	<div class="card card-secondary">
		<div class="card-header">
			{$COUNTDOWN_TITLE}
		</div>
		<div class="card-body text-center">
			{$COUNTDOWN_DESCRIPTION}
			<div class="countdown" id="countdown-value" data-expires="{$COUNTDOWN_EXPIRES}"></div>
			<style>
				.countdown {
					background: var(--background-secondary);
					margin-top: 0.75rem;
					padding: 0.5rem 0;
					border-radius: 0.5rem;
					font-size: 1.5rem;
					font-weight: 600;
				}
			</style>
		</div>
	</div>
{/if}