{extends file="layout.tpl"}

{block name=heading}

	<h2>{$VIEW_POLL->subject}</h2>

{/block}

{block name=content}

	<ul class="nav nav-tabs">
		{foreach from=$VIEW_POLL_OPTIONS item=option key=key}
			<li class="nav-item">
				<a href="#tab-{$option->id}" class="nav-link{if ($key == 0)} active{/if}" data-bs-toggle="tab">{$option->name}</a>
			</li>
		{/foreach}
	</ul>
	
	<div class="tab-content">
		{foreach from=$VIEW_POLL_OPTIONS item=option key=key}
			<div class="tab-pane fade{if ($key == 0)} show active{/if}" id="tab-{$option->id}">
				<div class="card">
					<div class="card-body">
						{', '|implode:$VIEW_POLL_VOTES[$option->id]}
					</div>
				</div>
			</div>
		{/foreach}
	</div>

{/block}