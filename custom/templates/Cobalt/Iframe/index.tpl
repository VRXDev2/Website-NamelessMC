{include file='header.tpl'}
{include file='navbar.tpl'}

<div class="container">
    {foreach from=$IFRAME_LIST item=iframe}
    <div class="card">
        <div class="card-header header-theme">{$iframe.name}</div>
        <div class="card-body">
	        <span class="text-center">{$iframe.description}</span>
	        <div class="module-iframe embed-responsive embed-responsive-{$iframe.size} mb-3">
                <iframe src="{$iframe.src}" frameborder="0"></iframe>
	        </div>
	        <span class="text-center">{$iframe.footer_description}</span>
	    </div>
	</div>
	{/foreach}
</div>

{include file='footer.tpl'}