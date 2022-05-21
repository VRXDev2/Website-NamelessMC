<div class="card img-card">
<i class="fas fa-info-circle"></i> <b>{$INFO}</b><br>
{$STORE_BOX_NOTE}
</div>

{include file="./parts/switch.tpl" name=store_box_enable right=no last=no}

{include file="./parts/image_uploader.tpl" name=store_box_img}

<label>{$STORE_BOX_TITLE}</label>
<input type='text' name='store_box_title' value='{$STORE_BOX_TITLE_VALUE}' class='form-control'><br />

<label>{$STORE_BOX_SUBTITLE}</label>
<input type='text' name='store_box_subtitle' value='{$STORE_BOX_SUBTITLE_VALUE}' class='form-control'><br />

<label>{$STORE_BOX_ICON}</label>
<input type='text' name='store_box_icon' value='{$STORE_BOX_ICON_VALUE}' class='form-control'><br />

<label>{$STORE_BOX_LINK}</label>
<input type='text' name='store_box_link' value='{$STORE_BOX_LINK_VALUE}' class='form-control'>