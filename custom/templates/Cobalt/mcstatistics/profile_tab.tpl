{$INGAME_STATISTICS_TITLE}
<br />

{if isset($MCSTATISTICS_ERROR)}
<div class="alert alert-danger">
  {$MCSTATISTICS_ERROR}
</div>
{else}
<div class="row">
  {foreach from=$MCSTATISTICS_FIELDS key=key item=field}
  <div class="col-md-4">
    <div class="card">
      <div class="card-body">
        <b>{$field.title}</b><br />
        {$field.value}
      </div>
    </div>
  </div>
  {/foreach}
</div>

<br />

<div class="text-center">Statistics provided by <a class="white-link" href="https://mcstatistics.org/"
    target="_blank">MCStatistics</a></div>
{/if}