<ul class="nav nav-pills mb-3" id="pills-tab" role="tablist">
    <li class="nav-item">
        <a class="nav-link active" id="pills-bgelr-tab" data-toggle="pill" href="#pills-bgelr" role="tab" aria-controls="pills-bgelr" aria-selected="true">{$BACKGROUNDS_TAB}</a>
    </li>
    <li class="nav-item">
        <a class="nav-link" id="pills-wblr-tab" data-toggle="pill" href="#pills-wblr" role="tab" aria-controls="pills-wblr" aria-selected="false">{$WB}</a>
    </li>
</ul>
<div class="tab-content" id="pills-tabContent">
    <div class="tab-pane fade show active" id="pills-bgelr" role="tabpanel" aria-labelledby="pills-bgelr-tab">
        {include file="./parts/image_uploader.tpl" name=lbg} {include file="./parts/image_uploader.tpl" name=rbg} {include file="./parts/switch.tpl" name=lr_modal_image right=no last=no} {include file="./parts/switch.tpl" name=lr_coverlay
        right=$LR_COVERLAY_2 last=no}

        {include file="./parts/range.tpl" name=lr_coverlay_opacity right=$COVERLAY_OPACITY_2 last=yes}
    </div>
    <div class="tab-pane fade" id="pills-wblr" role="tabpanel" aria-labelledby="pills-wblr-tab">
        <label>{$WB_T}</label><span class="float-right">{$WB_T_1}</span> <input type="text" name="wb_t" value="{$WB_T_VALUE}" class="form-control" /><br />

        <label>{$WB_D}</label>
        <input type="text" name="wb_d" value="{$WB_D_VALUE}" class="form-control" /><br />

        <label>{$WB_SKIN_ID}</label>
        <input type="text" name="wb_skin_id" value="{$WB_SKIN_ID_VALUE}" class="form-control" />

        <div class="card img-card mt-3">
            <i class="fas fa-info-circle"></i> <b>{$INFO}</b><br />
            {$WB_SKIN_ID_2}<br />
            <ol>
                <li>{$WB_SKIN_ID_3} <a href="https://namemc.com" target="_blank" rel="nofollow noopener">{$WB_SKIN_ID_4}</a></li>
                <li>{$WB_SKIN_ID_5}</li>
                <li>{$WB_SKIN_ID_6}</li>
                <li>{$WB_SKIN_ID_7}</li>
            </ol>
            {$WB_SKIN_ID_8}
        </div>
    </div>
</div>