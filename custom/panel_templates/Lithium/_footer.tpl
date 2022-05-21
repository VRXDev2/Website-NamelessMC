<footer class="footer">
	<div class="footer-main">
		<div class="container">
			<div class="row">
				<div class="col-xl-2">
					<div class="footer-logo">
						<img src="{$LITHIUM_SETTINGS.footerLogo}" alt="{$SITE_NAME}">
					</div>
				</div>
				<div class="col-xl-4 col-lg-4">
					<div class="footer-section footer-section-about">
						<div class="footer-section-title">
							<span>{$LITHIUM_SETTINGS.footerAboutSectionTitle}</span>
						</div>
						<div class="footer-section-content">
							<p>{$LITHIUM_SETTINGS.footerAboutSectionContent}</p>
						</div>
					</div>
				</div>
				<div class="col-xl-3 col-lg-4">
					<div class="footer-section footer-section-links">
						<div class="footer-section-title">
							<span>{$LITHIUM_LOCALE.links}</span>
						</div>
						<div class="footer-section-content">
							<ul class="footer-links">
								{foreach from=$FOOTER_NAVIGATION item=item}
									{if empty($item.items)}
										<li>
											<a href="{$item.link}" target="{$item.target}" class="footer-link">
												{if !empty($item.icon)}
													<div class="footer-link-icon">
														{$item.icon}
													</div>
												{/if}
												{$item.title}
											</a>
										</li>
									{else}
										<li class="dropdown">
											<a href="#" class="footer-link dropdown-toggle" data-bs-toggle="dropdown">
												{if !empty($item.icon)}
													<div class="footer-link-icon">
														{$item.icon}
													</div>
												{/if}
												{$item.title}
											</a>
											<ul class="dropdown-menu">
												<li>
													<a class="dropdown-header">{$item.title}</a>
												</li>
												{foreach from=$item.items item=dropdownItem}
													<li>
														{if !isset($dropdownItem.separator)}
															<a href="{$dropdownItem.link}" target="{$dropdownItem.target}" class="dropdown-item">
																{if !empty($dropdownItem.icon)}
																	{$dropdownItem.icon}
																{/if}
																{$dropdownItem.title}
															</a>
														{else}
															<hr class="dropdown-divider" />
														{/if}
													</li>
												{/foreach}
											</ul>
										</li>
									{/if}
								{/foreach}
								<li>
									<a href="{$TERMS_LINK}" class="footer-link">{$TERMS_TEXT}</a>
								</li>
								<li>
									<a href="{$PRIVACY_LINK}" class="footer-link">{$PRIVACY_TEXT}</a>
								</li>
							</ul>
						</div>
					</div>
				</div>
				{if ($LITHIUM_SETTINGS.enableFooterSupportSection == 1)}
					<div class="col-xl-3 col-lg-4">
						<div class="footer-section footer-section-store">
							<div class="footer-section-title">
								<span>{$LITHIUM_SETTINGS.footerSupportSectionTitle}</span>
							</div>
							<div class="footer-section-content">
								<p>{$LITHIUM_SETTINGS.footerSupportSectionContent}</p>
							</div>
							{if ($LITHIUM_SETTINGS.enableFooterSupportButton == 1)}
								<div class="footer-section-footer">
									<a href="{$LITHIUM_SETTINGS.footerSupportButtonLink}" class="btn btn-primary btn-lg btn-block">{$LITHIUM_SETTINGS.footerSupportButtonTitle}</a>
								</div>
							{/if}
						</div>
					</div>
				{/if}
			</div>
		</div>
	</div>
	<div class="footer-extra">
		<div class="container">
			<div class="footer-info">
				{if ($LITHIUM_SETTINGS.enableFooterCopyright)}
					<div class="footer-copyright">
						{$LITHIUM_SETTINGS.footerCopyrightContent}
					</div>
				{/if}
				<div class="footer-credits">
					Powered by <a href="https://namelessmc.com">NamelessMC</a>
				</div>
				{if ($PAGE_LOAD_TIME)}
					<div class="footer-meta">
						<div id="loadingTime"></div>
					</div>
				{/if}
			</div>
			<ul class="footer-buttons">
				{if ($LITHIUM_SETTINGS.enableFooterCustomIcons)}
					{for $i=0 to count($LITHIUM_SETTINGS.footerCustomIcons.title) - 1}
						<li>
							<a href="{$LITHIUM_SETTINGS.footerCustomIcons.link.$i}" class="footer-button footer-button-sq" data-bs-toggle="tooltip" title="{$LITHIUM_SETTINGS.footerCustomIcons.title.$i}">
								{$LITHIUM_SETTINGS.footerCustomIcons.icon.$i}
							</a>
						</li>
					{/for}
				{else}
					{if !empty($SOCIAL_MEDIA_ICONS)}
						{foreach from=$SOCIAL_MEDIA_ICONS item=icon}
							<li>
								<a href="{$icon.link}" class="footer-button footer-button-sq" data-bs-toggle="tooltip" title="{$icon.text}">
									<i class="{($icon.long == "envelope") ? 'fas' : 'fab'} fa-{$icon.long}"></i>
								</a>
							</li>
						{/foreach}
					{/if}
				{/if}
				{if ($LITHIUM_SETTINGS.allowUsersToToggleDarkMode)}
					<li>
						<a href="#" class="footer-button" id="button-darkModeToggler">{$LITHIUM_LOCALE.toggleDarkMode}</a>
					</li>
				{/if}
			</ul>
			<div class="footer-design-credit">
				<a href="https://xemah.com" target="_blank">
					<img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAADIAAAAyCAYAAAAeP4ixAAAAAXNSR0IArs4c6QAAAqZJREFUaEPdmjGIFTEQhv//QBCtbEQObOxEOLA7C+0FEbEVewst7zo7Oy3Pwt7+sBBsbbQUQe3stBDB6kQQJLLH20duN9lMkj+7x73mPXjJzHzzJ5NkN8Tq45z70P/O+D4ged3SvtB+0DTJq8M/6IHsA7hjCcpvQ3JtY6qvc87l2g61j/k7EkShsx8kL8wB0fmwgrwEcC83cylVChM0CmPKz2hYFDr9SfJ8KAGF9mJzIzqMQyCvANxWqaICSakeJCx1PnRWaidnkvdtYyDvAWzXqqICSalxWARiwRYG8Y3kxc5mYf/suTGpyCqQjwC2SlVRgVjUmFSkIqufAVzJTUCsvQrkHYBrqqBy7VghkopUqJIbc/HcSM6RvoFz7i2AG5LIMozkqGFSZClVWoF8Uk7glDC5EGZF5lalNcgvAOdS2az9vwQiS5G5VJkL5DuAzdqs1y5+of6mY6rfUbX1CAZjPDarQL4AuKxWpXRImRfEUMAtVFkK5CuASypVaiGyq1aruXIiQBQQxYo45/4B2FAMraVBmj41LEnQouuISo2iodWi9CoWxyxF5oJYge2TvGsdZscZJPrAumqLMrMafaxvSN60qGJWZCEQsyomEOfcXwCnLJlp0OY1yVspu1YQybqRCqbmnJIEUa7ipSAAXpB8MNXfArKoGuvzRuLQNQlyTNToWZ6R3IkOvym5VJWq24oobGW9Q+zBFI6Hw0Jg8ynJ3awFUeD00J+fRYVN0+tpT40DAGcrqsy66wCkO8N0Z5maz3OSD4cGpC9DR8YDlaaVKqHX078BnKlJWapkCmCekHzsx6i6MDDinqowApDRHmx4F+UPgNMt1RBWxUck99bq+0ErMjWsVLGkKHz5qvvXnGRbEetZXABzn2R3ESh+YUAxvOa08R8a2iNCcwx+NwAAAABJRU5ErkJggg==">
				</a>
			</div>
		</div>
	</div>
</footer>