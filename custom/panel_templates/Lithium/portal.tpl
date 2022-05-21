{extends file="layout_container.tpl"}

{block name=layout}
	
	<div class="wrapper wrapper-portal" id="wrapper"{if !empty($LITHIUM_SETTINGS.portalBackground)} style="background: url('{$LITHIUM_SETTINGS.portalBackground}') no-repeat center center / cover;"{/if}>
		{if ($LITHIUM_SETTINGS.enablePortalParticles)}
			<div class="portal-particles" id="particles-portal"></div>
		{/if}
		<div class="portal">
			<div class="container">
				<div class="portal-logo{if ($LITHIUM_SETTINGS.enablePortalLogoAnimation)} animated{/if}">
					<a href="{$SITE_HOME}">
						<img src="{$LITHIUM_SETTINGS.portalLogo}" alt="{$SITE_NAME}">
					</a>
				</div>
				{if ($LITHIUM_SETTINGS.displayMinecraftServer)}
					<a href="#" class="portal-status" id="status-minecraft" onclick="return copy('#ip-minecraftServer');" data-ip="{$LITHIUM_SETTINGS.minecraftServerIp}" data-bs-toggle="tooltip" title="{$LITHIUM_LOCALE.clickToCopy}">
						<div class="portal-status-content">
							{$LITHIUM_LOCALE.joinMinecraftServer}
							&bull;
							{$LITHIUM_LOCALE.xPlayersOnline|replace:'{x}':'<span id="count-minecraftServerPlayers">??</span>'}
							<span class="d-none" id="ip-minecraftServer">{$LITHIUM_SETTINGS.minecraftServerIp}</span>
						</div>
					</a>
				{/if}
				{if ($LITHIUM_SETTINGS.displayDiscordServer)}
					<a href="{$LITHIUM_SETTINGS.discordServerInviteLink}" class="portal-status" id="status-discord" data-id="{$LITHIUM_SETTINGS.discordServerId}" data-bs-toggle="tooltip" title="{$LITHIUM_LOCALE.clickToJoin}">
						<div class="portal-status-content">
							{$LITHIUM_LOCALE.joinDiscordServer}
							&bull;
							{$LITHIUM_LOCALE.xUsersOnline|replace:'{x}':'<span id="count-discordServerUsers">??</span>'}
						</div>
					</a>
				{/if}
				{if !empty($LITHIUM_SETTINGS.portalButtons)}
					<div class="portal-buttons">
						{for $i=0 to count($LITHIUM_SETTINGS.portalButtons.title) - 1}
							<a href="{$LITHIUM_SETTINGS.portalButtons.link.$i}" class="portal-button">
								<div class="portal-button-icon">
									{$LITHIUM_SETTINGS.portalButtons.icon.$i}
								</div>
								<div class="portal-button-title">
									{$LITHIUM_SETTINGS.portalButtons.title.$i}
								</div>
							</a>
						{/for}
					</div>
				{/if}
			</div>
		</div>

	</div>

{/block}