{if isset($COUNTDOWN_TITLE)}
<div class="card" id="widget-countdown">
    <div class="card-header header-theme">{$COUNTDOWN_TITLE}</div>
    <div class="card-body">
        {$COUNTDOWN_DESCRIPTION}
        <div class="card server text-white mt-2">
            <div class="card-body p-2">
                <pre id="countdown-value" data-expires="{$COUNTDOWN_EXPIRES}"></pre>
            </div>
        </div>
    </div>
</div>
{else}
<div class="alert alert-danger">{$NO_COUNTDOWN_AVAILABLE}</div>
{/if}
