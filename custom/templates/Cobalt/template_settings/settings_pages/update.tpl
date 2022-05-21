<ul class="nav nav-pills mb-3" id="pills-tab" role="tablist">
    {if $EXT_UPDATE_VALUE eq 'yes'}
    <li class="nav-item">
        <a class="nav-link active" id="pills-updatecheck-tab" data-toggle="pill" href="#pills-updatecheck" role="tab" aria-controls="pills-updatecheck" aria-selected="true">{$UPDATE_CHECK_TAB}</a>
    </li>
    {/if}
    <li class="nav-item">
        <a class="nav-link{if $EXT_UPDATE_VALUE eq 'no'} active{/if}" id="pills-updater-tab" data-toggle="pill" href="#pills-updater" role="tab" aria-controls="pills-updater" aria-selected="{if $EXT_UPDATE_VALUE eq 'no'}true{else}false{/if}">{$EZ_UPDATE_1}</a>
    </li>
    <li class="nav-item">
        <a class="nav-link" id="pills-updatesettings-tab" data-toggle="pill" href="#pills-updatesettings" role="tab" aria-controls="pills-updatesettings" aria-selected="false">{$UPDATE_SETTINGS_TAB}</a>
    </li>
</ul>

<div class="tab-content" id="pills-tabContent">
    {if $EXT_UPDATE_VALUE eq 'yes'}
    <div class="tab-pane fade show active" id="pills-updatecheck" role="tabpanel" aria-labelledby="pills-updatecheck-tab">
        {if $LOCAL_VERSION == $COBALT_VERSION}
        <div class="alert bg-success text-white alert-dismissible mb-3">
            <h5><i class="icon fa fa-check"></i> {$UPDATE_CHECK_NO_UPDATE}</h5>
            {$UPDATE_CHECK_NO_UPDATE_2}
        </div>
        {else}
        <div class="alert bg-danger text-white alert-dismissible">
            <h5><i class="icon fas fa-exclamation-triangle"></i> {$UPDATE_AVAILABLE}</h5>
            <span class="current">{$THEME_LOCAL_VERSION}</span> <i class="fas fa-long-arrow-alt-right"></i> <span class="new">{$COBALT_VERSION}</span>
        </div>
        <span>{$UPDATE_AVAILABLE_2}</span>
        {/if}
        <button type="submit" class="btn btn-primary" name="cobalt-recheck-update" id="cobalt-recheck-update">{$UPDATE_RECHECK}</button>
    </div>
    {/if}

    <div class="tab-pane fade{if $EXT_UPDATE_VALUE eq 'no'} show active{/if}" id="pills-updater" role="tabpanel" aria-labelledby="pills-updater-tab">
        <a class="btn btn-info mr-1" href="https://www.mc-market.org/resources/21683" target="_blank"><i class="fas fa-download"></i></a>
        {$EZ_UPDATE_2}<br />

        <div class="d-flex flex-row align-items-center" style="margin-top: 15px;">
            <input type="file" accept=".zip" name="cobalt-update" id="cobalt-update" class="position-absolute" style="margin-left: -500rem;" onchange="switchToSubmit()" />
            <label for="cobalt-update" class="btn btn-primary mb-0" style="min-width: 110px;" id="cobalt-update-label">{$EZ_UPDATE_5}</label>
            <button type="submit" class="btn btn-success d-none" id="cobalt-submit">{$UPDATE}</button>
            <span class="ml-3">{$EZ_UPDATE_3}</span>
        </div>
        <br />
        <span><b>{$NOTE}</b> {$EZ_UPDATE_4}</span>
    </div>

    <div class="tab-pane fade" id="pills-updatesettings" role="tabpanel" aria-labelledby="pills-updatesettings-tab">
        {include file="./parts/switch.tpl" name=ext_update right=$EXT_UPDATE_INFO last=no} {include file="./parts/switch.tpl" name=update_notif right=no last=yes}

        <input type="hidden" name="view" value="update" />
        <hr />
        <input type="hidden" name="token" value="{$TOKEN}" />
        <button type="submit" class="btn btn-primary">{$SUBMIT}</button>
    </div>
</div>