<ul class="nav nav-pills mb-3" id="pills-tab" role="tablist">
    <li class="nav-item">
        <a class="nav-link active" id="pills-gp-tab" data-toggle="pill" href="#pills-gp" role="tab" aria-controls="pills-gp" aria-selected="true">{$GENERAL}</a>
    </li>
    <li class="nav-item">
        <a class="nav-link" id="pills-iconimage-tab" data-toggle="pill" href="#pills-iconimage" role="tab" aria-controls="pills-iconimage" aria-selected="false">{$ICONIMAGE_TAB}</a>
    </li>
    {foreach from=$portal_icons item=icon}
    <li class="nav-item">
        <a class="nav-link" id="pills-image{$icon}p-tab" data-toggle="pill" href="#pills-image{$icon}p" role="tab" aria-controls="pills-image{$icon}p" aria-selected="false">{$IMAGE{$icon}_TAB}</a>
    </li>
    {/foreach}
</ul>
<div class="tab-content" id="pills-tabContent">
    <div class="tab-pane fade show active" id="pills-gp" role="tabpanel" aria-labelledby="pills-gp-tab">
        {include file="./parts/image_uploader.tpl" name=portal_bg}

        <label>{$PORTAL_IM}</label>
        <input type="text" name="portal_im" value="{$PORTAL_IM_VALUE}" class="form-control" /><br />
        <label>{$PORTAL_IMM}</label>
        <input type="text" name="portal_imm" value="{$PORTAL_IMM_VALUE}" class="form-control" /><br />

        {include file="./parts/switch.tpl" name=portal_particles right=no last=no} {include file="./parts/switch.tpl" name=portal_color_overlay right=no last=no}
        
        {include file="./parts/range.tpl" name=portal_color_overlay_opacity right=$COVERLAY_OPACITY_2 last=no}

        {include file="./parts/switch.tpl" name=portal_ds_texts right=no last=yes}
    </div>
    <div class="tab-pane fade" id="pills-iconimage" role="tabpanel" aria-labelledby="pills-iconimage-tab">
        <label>{$PORTAL_ICON_WIDTH}</label>
        <input type="text" name="portal_icon_width" value="{$PORTAL_ICON_WIDTH_VALUE}" class="form-control" /><br />

        <label>{$PORTAL_ICON_WIDTH_M}</label>
        <input type="text" name="portal_icon_width_m" value="{$PORTAL_ICON_WIDTH_M_VALUE}" class="form-control" /><br />

        {include file="./parts/switch.tpl" name=portal_enable_fourth_icon right=no last=no} {include file="./parts/switch.tpl" name=portal_icon_names right=no last=no} {include file="./parts/switch.tpl" name=portal_fa_icons right=no
        last=yes}
    </div>

    {foreach from=$portal_icons item=icon}

    <div class="tab-pane fade" id="pills-image{$icon}p" role="tabpanel" aria-labelledby="pills-image{$icon}p-tab">
        <label>{$PORTAL{$icon}_NAME}</label>
        <input type="text" name="portal{$icon}_name" value="{$PORTAL{$icon}_NAME_VALUE}" class="form-control" /><br />

        {if isset($PORTAL_FA_ICONS_VALUE) && $PORTAL_FA_ICONS_VALUE|count_characters < 3} {include file="./parts/image_uploader.tpl" name="portal"|cat:$icon|cat:"_icon"} {else}
        <label>{$PORTAL{$icon}_ICON}</label>
        <input type="text" name="portal{$icon}_fa_icon" value="{$PORTAL{$icon}_FA_ICON_VALUE}" class="form-control" /><br />
        {/if}

        <label>{$PORTAL{$icon}_LINK}</label>
        <input type="text" name="portal{$icon}_link" value="{$PORTAL{$icon}_LINK_VALUE}" class="form-control" />
    </div>

    {/foreach}
</div>