{extends file="layout.tpl"}

{block name=heading}

	<ol class="breadcrumb">
		{if ($PAGE_RESULT == 0)}
			<li class="breadcrumb-item">
				<a href="{$WIKI_HOME_LINK}">{$WIKI}</a>
			</li>
		{else if ($PAGE_RESULT == 1)}
			{if ($WP_TYPE)}
				<li class="breadcrumb-item">
					<a href="{$WIKI_HOME_LINK}">{$WIKI}</a>
				</li>
				<li class="breadcrumb-item">
					<a href="{$WIKI_HOME_LINK}{$WP_CATID}">{$WP_PARENT}</a>
				</li>
				<li class="breadcrumb-item active">
					<a href="{$WIKI_HOME_LINK}{$WP_CATID}/{$WP_NAMEID}">{$WP_TITLE}</a>
				</li>
			{else}
				<li class="breadcrumb-item">
					<a href="{$WIKI_HOME_LINK}">{$WIKI}</a>
				</li>
				<li class="breadcrumb-item active">
					<a href="{$WP_NAMEID}">{$WP_TITLE}</a>
				</li>
			{/if}
		{else if ($PAGE_RESULT == 2)}
			<li class="breadcrumb-item active">
				<a href="{$WIKI_HOME_LINK}">{$WIKI}</a>
			</li>
		{/if}
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
					{if ($PAGE_RESULT == 0)}
						<div class="post">
							{$HOME_PAGE_CONTEXT}
						</div>
					{else if ($PAGE_RESULT == 1)}
						<div class="post">
							{$WP_CONTEXT}
						</div>
						<hr />
						<div class="d-flex align-items-center">
							<div class="me-auto">
								{if isset($LIKEABLE) && $LIKEABLE == '1'}
									<a href="#"
										id="button-likeWiki"
										class="btn btn-{if isset($LIKED) && $LIKED == 'true'}primary{else}secondary{/if} btn-sm{if !isset($LOGGED)} disabled{/if}"
										data-status="{if isset($LIKED) && $LIKED == 'true'}liked{elseif !isset($LIKED) || $LIKED == 'false'}unliked{/if}"
										data-id="{$WP_NAMEID}"
										title="{if isset($LIKED) && $LIKED == 'true'}Unlike{elseif !isset($LIKED) || $LIKED == 'false'}Like{/if}"
										style="width: 90px;"
									>
										<i class="fas fa-thumbs-up"></i>
										<span class="ms-2">
											{if isset($LIKED) && $LIKED == 'true'}Unlike{elseif !isset($LIKED) || $LIKED == 'false'}Like{/if}
										</span>
									</a>
									{if isset($PANEL)}
										<a href="/panel/wiki/?action=edit&id={$WP_ID}" target="_blank" class="btn btn-sm btn-secondary">
											<i class="fas fa-pen"></i>
											<span class="ms-2">Edit</span>
										</a>
									{/if}
								{/if}
							</div>
							<div class="ms-auto">
								<a href="#" class="btn btn-secondary btn-sm disabled" style="width: 60px;">
									<i class="fas fa-eye"></i>
									<span class="ms-2">{$WP_VIEWS}</span>
								</a>
								<a href="#modal-likes" class="btn btn-secondary btn-sm" data-bs-toggle="modal" style="width: 60px;">
									<i class="fas fa-thumbs-up"></i>
									<span class="ms-2" id="count-wikiLikes">{$WP_LIKES}</span>
								</a>
							</div>
						</div>
						<div class="text-end">
						</div>
					{elseif ($PAGE_RESULT == 2)}
						{$WP_404_MESSAGE}
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

	
	<div class="modal fade" id="modal-likes">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<div class="modal-title">
						{$ALL_LIKES} {$WP_TITLE}
					</div>
					<a href="#" class="close" data-bs-dismiss="modal">
						<i class="fas fa-times"></i>
					</a>
				</div>
				<div class="modal-body">
					{if !empty($LIKES)}
						<div class="list">
							{foreach from=$LIKES item=liker}
								<div class="list-item align-items-center">
									<div class="list-icon">
										<a href="{$liker.link}">
											<img src="{$liker.avatar}" alt="{$liker.username}">
										</a>
									</div>
									<div class="list-content">
										<a href="{$liker.link}">{$liker.username}</a>
									</div>
								</div>
							{/foreach}
						</div>
					{else}
						{$NO_LIKES_MESSAGE}
					{/if}
				</div>
			</div>
		</div>
	</div>

{/block}

{block name=script}
	
	<script>
	
		const likeButton = document.querySelector('#button-likeWiki');
		const likesCount = document.querySelector('#count-wikiLikes');

		if (likeButton) {

			likeButton.addEventListener('click', (event) => {
				
				event.preventDefault();

				const pageId = likeButton.dataset.id;
				const status = likeButton.dataset.status;

				const actionUrl = buildUrl('/queries/like');

				if (status == 'unliked') {

					likeButton.classList.add('disabled');

					fetch(actionUrl, {
						method: 'POST',
						headers: {
							'Accept': 'application/json',
							'Content-Type': 'application/json'
						},
						body: JSON.stringify({
							liked: 1,
							pageid: pageId
						})
					})
						.then((res) => {

							likeButton.querySelector('span').innerHTML = 'Unlike';
							likeButton.dataset.status = 'liked';
							likeButton.classList.remove('btn-secondary');
							likeButton.classList.add('btn-primary');
							likesCount.innerHTML = parseInt(likesCount.innerHTML) + 1;
							likeButton.classList.remove('disabled');

						})
						.catch((error) => {

							console.error(error);
							likeButton.classList.remove('disabled');

						});

				} else if (status == 'liked') {

					likeButton.classList.add('disabled');

					fetch(actionUrl, {
						method: 'POST',
						headers: {
							'Content-Type': 'application/json'
						},
						body: JSON.stringify({
							unliked: 1,
							pageid: pageId
						})
					})
						.then((res) => {

							likeButton.querySelector('span').innerHTML = 'Like';
							likeButton.dataset.status = 'unliked';
							likeButton.classList.remove('btn-primary');
							likeButton.classList.add('btn-secondary');
							likesCount.innerHTML = parseInt(likesCount.innerHTML) - 1;
							likeButton.classList.remove('disabled');

						})
						.catch((error) => {

							console.error(error);
							likeButton.classList.remove('disabled');

						});

				}


			})

		}
	
	</script>

{/block}