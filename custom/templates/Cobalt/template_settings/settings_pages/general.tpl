{include file="./parts/switch.tpl" name=serve_lib_cdn right=$SERVE_LIB_CDN_2 last=no}

<label>{$P_COLOR}</label>
<div class="input-group color">
    <span class="input-group-prepend">
        <span class="input-group-text colorpicker-input-addon"><i></i></span>
    </span>
    <input type="text" name="p_color" value="{$P_COLOR_VALUE}" class="form-control" />
</div>
<br />

<label>{$WEBP_COMPRESSION}</label><br />
<div class="card img-card">
    <i class="fas fa-info-circle"></i> <b>{$INFO}</b><br />
    {$WEBP_COMPRESSION_2}<br />
    <br />
    <b>{$NOTE}</b> {$WEBP_COMPRESSION_3}
</div>
<input type="text" name="webp_compression" value="{$WEBP_COMPRESSION_VALUE}" class="form-control" /><br />

{include file="./parts/switch.tpl" name=full_body_avatars right=no last=yes}