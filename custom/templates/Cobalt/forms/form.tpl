{include file='header.tpl'} {include file='navbar.tpl'}
<div class="container">
    {if isset($SUCCESS)}
        <div class="alert alert-success">
            {$SUCCESS}
        </div>
        {/if} {if isset($ERRORS)}
        <div class="alert alert-danger">
            {foreach from=$ERRORS item=error} {$error}
            <br /> {/foreach}
        </div>
    {/if}
    <div class="row">
        {if count($WIDGETS_LEFT)}
            <div class="col-lg-3">
                {foreach from=$WIDGETS_LEFT item=widget}
                    {$widget}
                {/foreach}
            </div>
        {/if}

        <div
            class="{if count($WIDGETS_LEFT) && count($WIDGETS_RIGHT)}col-lg-6{elseif count($WIDGETS_LEFT) || count($WIDGETS_RIGHT)}col-lg-9{else}col-lg-12{/if}">
            <div class="card">
                <div class="card-header header-theme">{$TITLE}</div>
                <div class="card-body">
                    {if isset($CONTENT)}
                        <div class="card">
                            <div class="card-body d-flex p-3">
                                <div>
                                    <i class="fa-solid fa-circle-info fa-2x"></i>
                                </div>
                                <div class="ml-3 mt-1 flex-grow-1">
                                    {$CONTENT}
                                </div>
                            </div>
                        </div>
                    {/if}
                    <form action="" method="post" id="forms" enctype="multipart/form-data">
                        {foreach from=$FIELDS item=field}
                            <div class="form-group">
                                {if $field.type == 5}
                                    <hr />
                                {elseif $field.type == 4}
                                    {', '|implode:$field.options}
                                {else}
                                    <label for="{$field.id}">
                                        {$field.name} {if $field.required} <span class="text-danger"><strong>*</strong></span>{/if}
                                        {if $field.info}
                                            <div class="d-inline-block ml-1" data-toggle="tooltip" data-placement="top" title="{$field.info}">
                                                <i class="fa-solid fa-circle-question"></i>
                                            </div>
                                        {/if}
                                    </label>
                                {/if}
                                {if $field.type == "1"}
                                    <input class="form-control" type="text" name="{$field.id}" id="{$field.id}" placeholder="{$field.name}"{if $field.required} required{/if}>
                                {elseif $field.type == "2"}
                                    <select class="form-control"  name="{$field.id}" id="{$field.id}"{if $field.required} required{/if}>
                                        {foreach from=$field.options item=option}
                                            <option value="{$option}">{$option}</option>
                                        {/foreach}
                                    </select>
                                {elseif $field.type == "3"}
                                    <textarea class="form-control" name="{$field.id}" id="{$field.id}"{if $field.required} required{/if}></textarea>
                                {elseif $field.type == "6"}
                                    <input type="number" class="form-control" name="{$field.id}" id="{$field.id}" placeholder="{$field.name}"{if $field.required} required{/if}>
                                {elseif $field.type == "7"}
                                    <input type="email" class="form-control" name="{$field.id}" id="{$field.id}" placeholder="{$field.name}"{if $field.required} required{/if}>

                                {elseif $field.type == "8"}
                                    {foreach from=$field.options item=option}
                                        <div class="form-check">
                                            <input class="form-check-input" type="radio" name="{$field.id}" value="{$option}" id="{$option|replace:' ':''}"{if $field.required} required{/if}>
                                            <label class="form-check-label" for="{$option|replace:' ':''}">{$option}</label>
                                        </div>
                                    {/foreach}
                                {elseif $field.type == "9"}
                                    {foreach from=$field.options item=option}
                                        <div class="form-check">
                                            <input type="checkbox" class="form-check-input" name="{$field.id}[]" value="{$option}" id="{$option|replace:' ':''}">
                                            <label class="form-check-label" for="{$option|replace:' ':''}">{$option}</label>
                                        </div>
                                    {/foreach}
                                {elseif $field.type == "10"}
                                    <div class="form-group">
                                          <input type="file" class="inputFile" name="{$field.id}" id="uploadFileButton{$field.id}" value="{$field.value}" hidden onchange="$('#fileName{$field.id}').html(this.files[0].name);" />
                                          <label class="btn btn-theme" for="uploadFileButton{$field.id}">
                                            <i class="fa-solid fa-cloud-arrow-up"></i> <span id="fileName{$field.id}">{$CHOOSE_FILE}</span>
                                          </label>
                                    </div>
                                
                                {/if}
                            </div>
                        {/foreach}
                        {if $CAPTCHA}
                            <div class="form-group">
                              {$CAPTCHA}
                            </div>
                        {/if}
                        <input type="hidden" name="token" value="{$TOKEN}">
                        <button type="submit" class="btn btn-theme">{$SUBMIT}</button>
                    </form>
                </div>
            </div>
        </div>

        {if count($WIDGETS_RIGHT)}
            <div class="col-lg-3">
                {foreach from=$WIDGETS_RIGHT item=widget}
                    {$widget}
                {/foreach}
            </div>
        {/if}

    </div>
</div>
{include file='footer.tpl'}