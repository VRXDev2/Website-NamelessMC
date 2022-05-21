<ul class="nav nav-pills mb-3" id="pills-tab" role="tablist">
    <li class="nav-item">
        <a class="nav-link active" id="pills-sliderg-tab" data-toggle="pill" href="#pills-sliderg" role="tab" aria-controls="pills-sliderg" aria-selected="true">{$GENERAL}</a>
    </li>
    {foreach from=$sliders item=slider}
    <li class="nav-item">
        <a class="nav-link" id="pills-slider{$slider}-tab" data-toggle="pill" href="#pills-slider{$slider}" role="tab" aria-controls="pills-slider{$slider}" aria-selected="false">{$SLIDER{$slider}}</a>
    </li>
    {/foreach}
</ul>
<div class="tab-content" id="pills-tabContent">
    <div class="tab-pane fade show active" id="pills-sliderg" role="tabpanel" aria-labelledby="pills-sliderg-tab">
        {include file="./parts/switch.tpl" name=enable_slider right=no last=no}
        <label>{$SLIDER_HEIGHT}</label><span class="float-right">{$BLANK}</span>
        <input type="text" name="slider_height" value="{$SLIDER_HEIGHT_VALUE}" class="form-control" /><br />
        <label>{$SLIDER_HEIGHT_M}</label><span class="float-right">{$BLANK}</span>
        <input type="text" name="slider_height_m" value="{$SLIDER_HEIGHT_M_VALUE}" class="form-control" />
    </div>
    {foreach from=$sliders item=slider name=sliders}

    <div class="tab-pane fade" id="pills-slider{$slider}" role="tabpanel" aria-labelledby="pills-slider{$slider}-tab">
        {if !$smarty.foreach.sliders.first} {include file="./parts/switch.tpl" name="enable_slider"|cat:$slider|cat:"" right=no last=no} {/if}

        <label>{$SLIDER{$slider}_TITLE}</label><span class="float-right">{$BLANK}</span>
        <input type="text" name="slider{$slider}_title" value="{$SLIDER{$slider}_TITLE_VALUE}" class="form-control" />
        <br />
        <label>{$SLIDER{$slider}_DESC}</label><span class="float-right">{$BLANK}</span>
        <input type="text" name="slider{$slider}_desc" value="{$SLIDER{$slider}_DESC_VALUE}" class="form-control" />
        <br />

        {include file="./parts/image_uploader.tpl" name="slider"|cat:$slider|cat:"_image"}

        <label>{$SLIDER{$slider}_LINK}</label><span class="float-right">{$BLANK}</span>
        <input type="text" name="slider{$slider}_link" value="{$SLIDER{$slider}_LINK_VALUE}" class="form-control" />
        <br />
        <input type="hidden" name="slider{$slider}_link_open" value="no" />
        <input type="checkbox" name="slider{$slider}_link_open" class="js-switch js-check-change" value="yes" {if $SLIDER{$slider}_LINK_OPEN_VALUE eq 'yes'}checked{/if}> <label>{$SLIDER_LINK_OPEN}</label>
    </div>

    {/foreach}
</div>