{extends file="layout.tpl"}

{block name=heading}

	<div class="d-flex align-items-center flex-wrap mb-4">
		<div class="d-flex align-items-center">
			<div class="me-3">
				<img src="{$RESOURCE_ICON}" alt="{$RESOURCE_NAME}" style="width: 64px; height: 64px; border-radius: var(--avatars-border-radius);">
			</div>
			<div>
				<h2>{$VIEWING_ALL_RELEASES}</h2>
				<div class="meta">
					{$RESOURCE_SHORT_DESCRIPTION}
				</div>
			</div>
		</div>
	</div>

{/block}

{block name=content}

	<div class="action-bar">
		<div class="action-bar-pagination">
			{$PAGINATION}
		</div>
		<div class="action-bar-buttons">
			<a href="{$BACK_LINK}" class="btn btn-secondary btn-sm">{$BACK}</a>
		</div>
	</div>

	<ul class="nav nav-tabs">
		<li class="nav-item">
			<a href="{$OVERVIEW_LINK}" class="nav-link">{$OVERVIEW_TITLE}</a>
		</li>
		<li class="nav-item">
			<a href="{$OTHER_RELEASES_LINK}" class="nav-link active">{$RELEASES_TITLE}</a>
		</li>
		<li class="nav-item">
			<a href="{$VERSIONS_LINK}" class="nav-link">{$VERSIONS_TITLE}</a>
		</li>
		<li class="nav-item">
			<a href="{$REVIEWS_LINK}" class="nav-link">{$REVIEWS_TITLE}</a>
		</li>
	</ul>

	{foreach from=$RELEASES item=release}
		<div class="card">
			<div class="card-body">
				<div class="d-flex align-items-center mb-4">
					<h3>
						<a href="{$release.url}">{$release.name}</a>
					</h3>
					<div class="star-rating view ms-auto">
						<span class="far fa-star" data-rating="1"></span>
						<span class="far fa-star" data-rating="2"></span>
						<span class="far fa-star" data-rating="3"></span>
						<span class="far fa-star" data-rating="4"></span>
						<span class="far fa-star" data-rating="5"></span>
						<input type="hidden" name="rating" class="rating-value" value="{$release.rating}">
					</div>
				</div>
				{if !empty($release.description)}
					<div class="post">
						{$release.description}
					</div>
				{/if}
				<div class="meta-block meta-block-bottom">
					<div class="meta">
						<span title="{$release.date_full}">{$release.date}</span>
						&bull;
						{$release.downloads}
					</div>
				</div>
			</div>
		</div>
	{/foreach}

	<div class="action-bar">
		<div class="action-bar-pagination">
			{$PAGINATION}
		</div>
		<div class="action-bar-buttons">
			<a href="{$BACK_LINK}" class="btn btn-secondary btn-sm">{$BACK}</a>
		</div>
	</div>

{/block}