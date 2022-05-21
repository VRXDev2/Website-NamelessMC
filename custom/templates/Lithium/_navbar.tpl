<nav class="navbar navbar-user navbar-expand">
	<div class="container">
		<div class="collapse navbar-collapse" id="nav-user">
			<ul class="navbar-nav">
				{if isset($USER_SECTION.panel)}
					<li class="nav-item">
						<a href="{$USER_SECTION.panel.link}" target="_blank" class="nav-link">
							<div class="nav-link-icon">
								<i class="fas fa-cog"></i>
							</div>
							<div class="nav-link-text">
								{$USER_SECTION.panel.title}
							</div>
						</a>
					</li>
				{/if}
				{if isset($LITHIUM.settingsUrl)}
					<li class="nav-item">
						<a href="{$LITHIUM.settingsUrl}" target="_blank" class="nav-link">
							<div class="nav-link-icon">
								<i class="fas fa-brush"></i>
							</div>
							<div class="nav-link-text">
								Lithium Settings
							</div>
						</a>
					</li>
				{/if}
			</ul>
			<ul class="navbar-nav ms-auto">
				{foreach from=$USER_SECTION item=item key=key}
					{if ($key !== 'panel')}
						{if empty($item.items)}
							<li class="nav-item">
								{if ($key == 'login' || $key == 'register')}
									<a href="{$item.link}" target="{$item.target}" class="nav-link" data-request-modal="{$key}">
								{else}
									<a href="{$item.link}" target="{$item.target}" class="nav-link">
								{/if}
									{if !empty($item.icon)}
										<div class="nav-link-icon">
											{$item.icon}
										</div>
									{/if}
									<div class="nav-link-text">
										{$item.title}
									</div>
								</a>
							</li>
						{else}
							<li class="nav-item dropdown dropdown-hover">
								<a href="#" class="nav-link dropdown-toggle no-caret" id="button-{$key}" data-bs-toggle="dropdown">
									{if !empty($item.icon)}
										<div class="nav-link-icon">
											{$item.icon}
										</div>
									{/if}
									<div class="nav-link-text">
										{$item.title}
									</div>
								</a>
								<ul class="dropdown-menu dropdown-menu-end">
									<li>
										<span class="dropdown-header">{$item.title}</span>
									</li>
									<div id="list-{$key}">
										{foreach from=$item.items item=dropdownItem}
											<li>
												{if !isset($dropdownItem.separator)}
													{if !empty($dropdownItem.link)}
														<a href="{$dropdownItem.link}" target="{$dropdownItem.target}" class="dropdown-item">
															{if !empty($dropdownItem.icon)}
																{$dropdownItem.icon}
															{/if}
															{$dropdownItem.title}
														</a>
													{else}
														<span class="dropdown-item">
															{if !empty($dropdownItem.icon)}
																{$dropdownItem.icon}
															{/if}
															{$dropdownItem.title}
														</span>
													{/if}
												{else}
													<hr class="dropdown-divider" />
												{/if}
											</li>
										{/foreach}
									</div>
								</ul>
							</li>
						{/if}
					{/if}
				{/foreach}
			</ul>
		</div>
	</div>
</nav>

{$RAW_NAV_LINKS = $NAV_LINKS}
{$NAV_LINKS.buycraft = null}
{$NAV_LINKS.craftingstore = null}
{$NAV_LINKS.store = null}
{$NAV_LINKS = $NAV_LINKS|array_filter}

{if ($LITHIUM_SETTINGS.navbarStyle == 'modern')}
	
	<nav class="navbar navbar-modern navbar-expand-lg" id="navbar">
		<div class="container">
			<div class="navbar-brand">
				<a href="{$SITE_HOME}">{$LITHIUM_SETTINGS.siteTitle}</a>
			</div>
			<a href="#" class="navbar-toggler" id="button-ocNavToggler">
				<i class="fas fa-bars"></i>
			</a>
			<div class="collapse navbar-collapse">
				<div class="navbar-nav-container{if (!$LITHIUM_SETTINGS.enableNavbarStoreLink)} perfectly-centered{/if}">
					<ul class="navbar-nav navbar-nav-left">
						{foreach from=$NAV_LINKS item=item name=nav_links}
							{if ($smarty.foreach.nav_links.iteration <= (count($NAV_LINKS) / 2 + count($NAV_LINKS) % 2))}
								{if !isset($item.items) || empty($item.items)}
									<li class="nav-item">
										<a href="{$item.link}" target="{$item.target}" class="nav-link{if isset($item.active)} active{/if}">
											{if !empty($item.icon)}
												<div class="nav-link-icon">
													{$item.icon}
												</div>
											{/if}
											<div class="nav-link-text">
												{$item.title}
											</div>
										</a>
									</li>
								{else}
									<li class="nav-item dropdown">
										<a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">
											{if !empty($item.icon)}
												<div class="nav-link-icon">
													{$item.icon}
												</div>
											{/if}
											<div class="nav-link-text">
												{$item.title}
											</div>
										</a>
										<ul class="dropdown-menu">
											<li>
												<a class="dropdown-header">{$item.title}</a>
											</li>
											{foreach from=$item.items item=dropdownItem}
												<li>
													{if !isset($dropdownItem.separator)}
														<a href="{$dropdownItem.link}" target="{$dropdownItem.target}" class="dropdown-item">{$dropdownItem.title}</a>
													{else}
														<hr class="dropdown-divider" />
													{/if}
												</li>
											{/foreach}
										</ul>
									</li>
								{/if}
							{/if}
						{/foreach}
					</ul>
					{if ($LITHIUM_SETTINGS.enableNavbarCustomStoreButton)}
						<ul class="navbar-nav navbar-nav-center">
							<li class="nav-item">
								<a href="{$LITHIUM_SETTINGS.navbarCustomStoreButtonLink}" class="nav-link highlighted">
									<div class="nav-link-text">
										{$LITHIUM_LOCALE.store}
									</div>
								</a>
							</li>
						</ul>
					{else if ('buycraft'|array_key_exists:$RAW_NAV_LINKS)}
						<ul class="navbar-nav navbar-nav-center">
							<li class="nav-item">
								<a href="{$RAW_NAV_LINKS.buycraft.link}" target="{$RAW_NAV_LINKS.buycraft.target}" class="nav-link highlighted">
									{if !empty($RAW_NAV_LINKS.buycraft.icon)}
										<div class="nav-link-icon">
											{$RAW_NAV_LINKS.buycraft.icon}
										</div>
									{/if}
									<div class="nav-link-text">
										{$RAW_NAV_LINKS.buycraft.title}
									</div>
								</a>
							</li>
						</ul>
					{else if ('craftingstore'|array_key_exists:$RAW_NAV_LINKS)}
						<ul class="navbar-nav navbar-nav-center">
							<li class="nav-item">
								<a href="{$RAW_NAV_LINKS.craftingstore.link}" target="{$RAW_NAV_LINKS.craftingstore.target}" class="nav-link highlighted">
									{if !empty($RAW_NAV_LINKS.craftingstore.icon)}
										<div class="nav-link-icon">
											{$RAW_NAV_LINKS.craftingstore.icon}
										</div>
									{/if}
									<div class="nav-link-text">
										{$RAW_NAV_LINKS.craftingstore.title}
									</div>
								</a>
							</li>
						</ul>
					{else if ('store'|array_key_exists:$RAW_NAV_LINKS)}
						<ul class="navbar-nav navbar-nav-center">
							<li class="nav-item">
								<a href="{$RAW_NAV_LINKS.store.link}" target="{$RAW_NAV_LINKS.store.target}" class="nav-link highlighted">
									{if !empty($RAW_NAV_LINKS.store.icon)}
										<div class="nav-link-icon">
											{$RAW_NAV_LINKS.store.icon}
										</div>
									{/if}
									<div class="nav-link-text">
										{$RAW_NAV_LINKS.store.title}
									</div>
								</a>
							</li>
						</ul>
					{/if}
					<ul class="navbar-nav navbar-nav-right">
						{foreach from=$NAV_LINKS item=item name=nav_links}
							{if ($smarty.foreach.nav_links.iteration > (count($NAV_LINKS) / 2 + count($NAV_LINKS) % 2))}
								{if !isset($item.items) || empty($item.items)}
									<li class="nav-item">
										<a href="{$item.link}" target="{$item.target}" class="nav-link{if isset($item.active)} active{/if}">
											{if !empty($item.icon)}
												<div class="nav-link-icon">
													{$item.icon}
												</div>
											{/if}
											<div class="nav-link-text">
												{$item.title}
											</div>
										</a>
									</li>
								{else}
									<li class="nav-item dropdown">
										<a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">
											{if !empty($item.icon)}
												<div class="nav-link-icon">
													{$item.icon}
												</div>
											{/if}
											<div class="nav-link-text">
												{$item.title}
											</div>
										</a>
										<ul class="dropdown-menu">
											<li>
												<a class="dropdown-header">{$item.title}</a>
											</li>
											{foreach from=$item.items item=dropdownItem}
												<li>
													{if !isset($dropdownItem.separator)}
														<a href="{$dropdownItem.link}" target="{$dropdownItem.target}" class="dropdown-item">{$dropdownItem.title}</a>
													{else}
														<hr class="dropdown-divider" />
													{/if}
												</li>
											{/foreach}
										</ul>
									</li>
								{/if}
							{/if}
						{/foreach}
					</ul>
				</div>
			</div>
		</div>
	</nav>

{else}

	<nav class="navbar navbar-default navbar-expand-lg" id="navbar">
		<div class="container">
			<div class="navbar-brand">
				<a href="{$SITE_HOME}">{$LITHIUM_SETTINGS.siteTitle}</a>
			</div>
			<a href="#" class="navbar-toggler" id="button-ocNavToggler">
				<i class="fas fa-bars"></i>
			</a>
			<div class="collapse navbar-collapse">
				<div class="navbar-nav-container">
					<ul class="navbar-nav">
						{foreach from=$NAV_LINKS item=item}
							{if !isset($item.items) || empty($item.items)}
								<li class="nav-item">
									<a href="{$item.link}" target="{$item.target}" class="nav-link{if isset($item.active)} active{/if}">
										{if !empty($item.icon)}
											<div class="nav-link-icon">
												{$item.icon}
											</div>
										{/if}
										<div class="nav-link-text">
											{$item.title}
										</div>
									</a>
								</li>
							{else}
								<li class="nav-item dropdown">
									<a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">
										{if !empty($item.icon)}
											<div class="nav-link-icon">
												{$item.icon}
											</div>
										{/if}
										<div class="nav-link-text">
											{$item.title}
										</div>
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
					</ul>
				</div>
				<ul class="navbar-nav ms-4">
					{if ($LITHIUM_SETTINGS.enableNavbarCustomStoreButton)}
						<li class="nav-item">
							<a href="{$LITHIUM_SETTINGS.navbarCustomStoreButtonLink}" class="nav-link highlighted">
								<div class="nav-link-text">
									{$LITHIUM_LOCALE.store}
								</div>
							</a>
						</li>
					{else if ('buycraft'|array_key_exists:$RAW_NAV_LINKS)}
						<li class="nav-item">
							<a href="{$RAW_NAV_LINKS.buycraft.link}" target="{$RAW_NAV_LINKS.buycraft.target}" class="nav-link highlighted">
								{if !empty($RAW_NAV_LINKS.buycraft.icon)}
									<div class="nav-link-icon">
										{$RAW_NAV_LINKS.buycraft.icon}
									</div>
								{/if}
								<div class="nav-link-text">
									{$RAW_NAV_LINKS.buycraft.title}
								</div>
							</a>
						</li>
					{else if ('craftingstore'|array_key_exists:$RAW_NAV_LINKS)}
						<li class="nav-item">
							<a href="{$RAW_NAV_LINKS.craftingstore.link}" target="{$RAW_NAV_LINKS.craftingstore.target}" class="nav-link highlighted">
								{if !empty($RAW_NAV_LINKS.craftingstore.icon)}
									<div class="nav-link-icon">
										{$RAW_NAV_LINKS.craftingstore.icon}
									</div>
								{/if}
								<div class="nav-link-text">
									{$RAW_NAV_LINKS.craftingstore.title}
								</div>
							</a>
						</li>
					{else if ('store'|array_key_exists:$RAW_NAV_LINKS)}
						<li class="nav-item">
							<a href="{$RAW_NAV_LINKS.store.link}" target="{$RAW_NAV_LINKS.store.target}" class="nav-link highlighted">
								{if !empty($RAW_NAV_LINKS.store.icon)}
									<div class="nav-link-icon">
										{$RAW_NAV_LINKS.store.icon}
									</div>
								{/if}
								<div class="nav-link-text">
									{$RAW_NAV_LINKS.store.title}
								</div>
							</a>
						</li>
					{/if}
				</ul>
			</div>
		</div>
	</nav>

{/if}

<nav class="oc-nav{if ($LITHIUM_SETTINGS.invertNavSidebar)} inverted{/if}" id="nav-oc">
	<div class="oc-nav-container">
		<div class="oc-nav-header">
			<span>Menu</span>
			<a href="#" class="close" id="button-ocNavToggler">
				<i class="fas fa-times"></i>
			</a>
		</div>
		<div class="oc-nav-body">
			<ul class="oc-nav-items">
				{foreach from=$NAV_LINKS item=link}
					{if empty($link.items)}
						<li class="oc-nav-item">
							<a href="{$link.link}" target="{$link.target}" class="oc-nav-link">
								{if !empty($link.icon)}
									{$link.icon}
								{/if}
								{$link.title}
							</a>
						</li>
					{else}
						{foreach from=$link.items item=item}
							<li class="oc-nav-item">
								<a href="{$item.link}" target="{$item.target}" class="oc-nav-link">
								{if !empty($item.icon)}
									{$item.icon}
								{/if}
								{$item.title}</a>
							</li>
						{/foreach}
					{/if}
				{/foreach}
			</ul>
		</div>
	</div>
</nav>