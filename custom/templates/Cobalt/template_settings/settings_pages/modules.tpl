<ul class="nav nav-pills mb-3" id="pills-tab" role="tablist">
    <li class="nav-item">
        <a class="nav-link active" id="pills-mvote-tab" data-toggle="pill" href="#pills-mvote" role="tab" aria-controls="pills-mvote" aria-selected="true">{$VOTE}</a>
    </li>
    <li class="nav-item">
        <a class="nav-link" id="pills-mrules-tab" data-toggle="pill" href="#pills-mrules" role="tab" aria-controls="pills-mrules" aria-selected="false">{$RULES}</a>
    </li>
</ul>
<div class="tab-content" id="pills-tabContent">
    <div class="tab-pane fade show active" id="pills-mvote" role="tabpanel" aria-labelledby="pills-mvote-tab">

        {include file="./parts/image_uploader.tpl" name=vote_rewards_icon}
                            
        <label>{$VOTE_REWARDS}</label><span class="float-right">{$BLANK}</span>
        <input type='text' name='vote_rewards' value='{$VOTE_REWARDS_VALUE}' class='form-control'>
    </div>
    <div class="tab-pane fade" id="pills-mrules" role="tabpanel" aria-labelledby="pills-mrules-tab">
        {include file="./parts/switch.tpl" name=rules_fa_icons right=no last=no}

        <label>{$RULES_HOME_ICON}</label>
        <input type='text' name='rules_home_icon' value='{$RULES_HOME_ICON_VALUE}' class='form-control'>
    </div>
</div>