<div class="lithium-body">
	<div class="lithium-loader">
		<span class="lithium-loader-icon"></span>
	</div>
	<div class="lithium-wrapper">
		<div class="lithium-sidebar">
			<div class="lithium-sidebar-header">
				<h1>Lithium</h1>
			</div>
			<div class="lithium-sidebar-body">
				{if !empty($LITHIUM_PANELS)}
					<div class="lithium-panels">
						{foreach from=$LITHIUM_PANELS item=panel key=panelKey}
							<div class="lithium-panel" id="lithium-panel-{$panelKey}">
								{$panel}
							</div>
						{/foreach}
					</div>
				{/if}
			</div>
			<div class="lithium-sidebar-footer">
				<div class="lithium-sidebar-footer-content">
					<span class="lithium-info-update"></span>
				</div>
				<div class="lithium-sidebar-footer-actions">
					<a class="lithium-button lithium-button-update" href="#">Update</a>
				</div>
			</div>
		</div>
		<div class="lithium-preview">
			<iframe class="lithium-preview-frame" src="{$SITE_HOME}"></iframe>
		</div>
	</div>
</div>