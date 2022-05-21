<div class="card">
    <div class="card-header header-theme">{$FEATURED_PACKAGE}</div>
    <div class="card-body text-center">
        {$PACKAGE.name} &bull; {$CURRENCY}{$PACKAGE.real_price}<br />
        {if $PACKAGE.image}
        <img src="{$PACKAGE.image}" alt="{$PACKAGE.name}" style="max-width: 100%"><br /> {/if}
        <a class="btn btn-theme btn-block" href="{$PACKAGE.link}">{$VIEW}</a>
    </div>
</div>