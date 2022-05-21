<form class='form-group' method='post' enctype='multipart/form-data' id="option-form">
    <div class="row cobalt-row">
        <div class="col-md-3">
            <div class="card" style="border: 1px solid #e3e6f0">
                <div class="card-body">
                    <ul class="nav nav-pills mb-3 flex-column" id="pills-tab" role="tablist">
                        {foreach $CATEGORIES key=category item=cat name=categories}
                            <li class="nav-item">
                                <a class="nav-link{if $smarty.foreach.categories.first} active{/if}"
                                    id="pills-{$cat.filtered_name}-tab" data-toggle="pill"
                                    href="#pills-{$cat.filtered_name}" role="tab" aria-controls="pills-{$cat.filtered_name}"
                                    aria-selected="{if $smarty.foreach.categories.first}true{else}false{/if}">{$cat.icon}
                                    {${$category}}</a>
                            </li>
                        {/foreach}
                    </ul>
                </div>
            </div>
        </div>
        <div class="col-md-9">
            <div class="card" style="border: 1px solid #e3e6f0">
                <div class="card-body">
                    <div class="tab-content" id="pills-tabContent">
                        {foreach $CATEGORIES key=category item=cat name=categories}
                            <div class="tab-pane fade{if $smarty.foreach.categories.first} show active{/if}"
                                id="pills-{$cat.filtered_name}" role="tabpanel"
                                aria-labelledby="pills-{$cat.filtered_name}-tab">
                                <h1><b>{${$category}}</b></h1>
                                <hr />
                                {include file="./settings_pages/"|cat:$cat.filtered_name|cat:".tpl"}
                                {if $cat.filtered_name !== "home" && $cat.filtered_name !== "update"}
                                    <hr />
                                    <input type="hidden" name="token" value="{$TOKEN}">
                                    <button type='submit' class='btn btn-primary'>{$SUBMIT}</button>
                                {/if}
                            </div>
                        {/foreach}
                    </div>
                </div>
            </div>
        </div>
    </div>
</form>