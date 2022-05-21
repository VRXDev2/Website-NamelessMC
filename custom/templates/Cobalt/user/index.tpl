{include file='header.tpl'} {include file='navbar.tpl'}
<div class="container">
    <div class="row">
        <div class="col-lg-3">
            {include file='user/navigation.tpl'}
        </div>
        <div class="col-lg-9">
            <div class="card">
                <div class="card-header header-theme">{$OVERVIEW}</div>
                <div class="card-body">
                    {nocache} {foreach from=$USER_DETAILS_VALUES key=name item=value} {$name}: <strong>{$value}</strong><br /> {/foreach} {/nocache}
                </div>
            </div>
            {if isset($FORUM_GRAPH)}
            <div class="card">
                <div class="card-header header-theme">{$FORUM_GRAPH}</div>
                <div class="card-body">
                    <canvas id="dataChart" width="100%" height="40"></canvas>
                </div>
            </div>
            {/if}
        </div>
    </div>
</div>
{include file='footer.tpl'}