{include file='header.tpl'} {include file='navbar.tpl'}
<div class="container">
    <div class="row">
        <div class="col-lg-3">
            {include file='store/navbar.tpl'}
            {if count($WIDGETS_LEFT)}
                {foreach from=$WIDGETS_LEFT item=widget}
                    {$widget}
                {/foreach}
            {/if}
        </div>
        <div class="{if count($WIDGETS_LEFT) && count($WIDGETS_RIGHT) }col-lg-6{else}col-lg-9{/if}">
            {if isset($SUCCESS)}
                <div class="alert alert-success">
                    {$SUCCESS}
                </div>
            {/if}
            {if isset($ERRORS)}
                <div class="alert alert-danger">
                    {foreach from=$ERRORS item=error}
                        {$error}<br />
                    {/foreach}
                </div>
            {/if}
            <div class="card">
                <div class="card-header header-theme">{$PRODUCT_NAME}</div>
                <div class="card-body">
                    <form action="" method="post" id="forms">
                        {foreach from=$PRODUCT_FIELDS item=field}
                            <div class="form-group">
                                <label for="{$field.id}">{$field.description} {if $field.required} <span
                                        class="text-danger"><strong>*</strong></span>{/if}</label>

                                {if $field.type == "1"}
                                    <input class="form-control" type="text" name="{$field.id}" id="{$field.id}"
                                        value="{$field.value}" placeholder="{$field.description}"
                                        {if $field.required}required{/if}>
                                {elseif $field.type == "2"}
                                    <select class="form-control" name="{$field.id}" id="{$field.id}"
                                        {if $field.required}required{/if}>
                                        {foreach from=$field.options item=option}
                                            <option value="{$option}" {if $option eq $field.value} selected{/if}>{$option}</option>
                                        {/foreach}
                                    </select>
                                {elseif $field.type == "3"}
                                    <textarea class="form-control" name="{$field.id}" id="{$field.id}"
                                        {if $field.required}required{/if}>{$field.value}</textarea>
                                {elseif $field.type == "4"}
                                    <input class="form-control" type="number" name="{$field.id}" id="{$field.id}"
                                        value="{$field.value}" placeholder="{$field.description}"
                                        {if $field.required}required{/if}>
                                {elseif $field.type == "5"}
                                    <input class="form-control" type="email" name="{$field.id}" id="{$field.id}"
                                        value="{$field.value}" placeholder="{$field.description}"
                                        {if $field.required}required{/if}>
                                {elseif $field.type == "6"}
                                    {foreach from=$field.options item=option}
                                        <div class="mb-1 mt-1">
                                            <input class="form-control" type="radio" name="{$field.id}" value="{$option}"
                                                {if $field.required}required{/if}>
                                            <label>{$option}</label>
                                        </div>
                                    {/foreach}
                                {elseif $field.type == "7"}
                                    {foreach from=$field.options item=option}
                                        <div class="mb-1 mt-1">
                                            <input class="form-control" type="checkbox" name="{$field.id}[]" value="{$option}">
                                            <label>{$option}</label>
                                        </div>
                                    {/foreach}
                                {/if}
                            </div>
                        {/foreach}
                        <div class="form-group">
                            <input type="hidden" name="token" value="{$TOKEN}">
                            <button type="submit" class="btn btn-theme">{$CONTINUE}</button>
                        </div>
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