{extends file="layout.tpl"}

{block name=heading}

	<ol class="breadcrumb">
		<li class="breadcrumb-item">
			<a href="{$WIKI_HOME_LINK}">{$WIKI}</a>
		</li>
		<li class="breadcrumb-item">
			<a>{$SEARCH_RESULTS_LANG} {$SEARCH_RESULT}</a>
		</li>
	</ol>

	<div class="d-flex align-items-center flex-wrap mb-4">
		<h2>{$WIKI}</h2>
		<div class="forum-search-bar">
			<form action="{if $PAGE_RESULT == 1}{if $WP_TYPE}{else}wiki/{/if}../{else}{/if}" method="get">
				<div class="input-group">
					<input type="text" class="form-control" name="search" placeholder="{$SEARCH_PLACEHOLDER}">
					<button type="submit" class="btn btn-primary btn-sq">
						<i class="fas fa-search"></i>
					</button>
				</div>
			</form>
		</div>
	</div>

{/block}

{block name=content}

	<div class="row">
		<div class="col-xl-9 col-lg-8">
			<div class="card">
				<div class="card-body">
					{if !empty($SEARCH_RESULTS)}
						<div class="list">
							{foreach from=$SEARCH_RESULTS item=result}
								<div class="list-item">
									<div class="list-content">
										<a href="../wiki/{$result->nameid}">
											<i class="{$result->icon}"></i>
											{$result->button}
										</a>
									</div>
								</div>
							{/foreach}
						</div>
					{else}    
						{$SEARCH_NO_RESULTS}
					{/if}
				</div>
			</div>
		</div>
		<div class="col-xl-3 col-lg-4">
			<div class="card card-secondary">
				<div class="card-header">
					{$WIKI}
				</div>
				<div class="card-body">
					<ul class="nav nav-vertical">
						{foreach from=$WIKI_PAGES item=page}
							{if isset($page->getSubPages()) && !empty($page->getSubPages()) && count($page->getSubPages()) >= 1}
								{if isset($page->isEnabled()) && $page->isEnabled() == "1" && isset($page->isVisible()) && $page->isVisible() == "1"}
									<li class="nav-item">
										<a href="#collapse-nav-{$page->getNameID()}" class="nav-link{if $WP_CATID == $page->getNameID()} active{/if}" data-bs-toggle="collapse">
											<span class="badge bg-secondary bg-sq float-end" style="transform: translateY(-1px);">{count($page->getSubPages())}</span>
											{if isset($page->getIcon()) && $page->getIcon()|count_characters > 0}
												<i class="{$page->getIcon()}"></i>
											{/if}
											{$page->getButton()}
										</a>
									</li>
									<div class="collapse{if $WP_CATID == $page->getNameID()} show{/if}" id="collapse-nav-{$page->getNameID()}">
										{foreach from=$page->getSubPages() item=subpage}
											{if isset($subpage.enabled) && $subpage.enabled == "1"}
												<li class="nav-item nested">
													<a href="{$WIKI_HOME_LINK}{$subpage.parent}/{$subpage.nameid}" class="nav-link">
														{if isset($subpage.icon) && $subpage.icon|count_characters > 0}
															<i class="{$subpage.icon}"></i>
														{/if}
														{$subpage.button}
													</a>
												</li>
											{/if}
										{/foreach}
									</div>
								{/if}
							{else if $page->getParent() == "null"}
								{if isset($page->isEnabled()) && $page->isEnabled() == "1" && isset($page->isVisible()) && $page->isVisible() == "1"}
									<li class="nav-item">
										<a href="{$WIKI_HOME_LINK}{$page->getNameID()}" class="nav-link">
											{if isset($page->getIcon()) && $page->getIcon()|count_characters > 0}
												<i class="{$page->getIcon()}"></i>
											{/if}
											{$page->getButton()}
										</a>
									</li>
								{/if}
							{/if}
						{/foreach}
					</ul>
				</div>
			</div>
		</div>
	</div>

{/block}