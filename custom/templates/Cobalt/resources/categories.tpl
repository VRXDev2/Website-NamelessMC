<div class="card">
    <div class="card-header header-theme">{$CATEGORIES_TITLE}</div>
    <div class="card-body">
        {foreach from=$CATEGORIES item=item}
        <a class="btn btn-theme btn-block" href="{$item.link}">{$item.name} <span class="badge badge-dark d-inline-block ml-2" style="background-color: rgb(0,0,0,0.2);">{$item.count}</span></a> {/foreach}
    </div>
</div>