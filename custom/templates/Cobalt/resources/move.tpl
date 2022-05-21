{include file='header.tpl'} {include file='navbar.tpl'}
<div class="container">
    <div class="card">
        <div class="card-header header-theme">{$MOVE_RESOURCE}</div>
        <div class="card-body">
            {if !isset($NO_CATEGORIES)}
            <form action="" method="post">
                <div class="form-group">
                    <label for="InputCategory">{$MOVE_TO}</label>
                    <select class="form-control" name="category_id" id="InputCategory">
                            {foreach from=$CATEGORIES item=category}
                                <option value="{$category->id}">{$category->name|escape}</option>
                            {/foreach}
                        </select>
                </div>
                <div class="form-group">
                    <input type="hidden" name="token" value="{$TOKEN}">
                    <button type="submit" class="btn btn-theme">{$SUBMIT}</button>
                    <a class="btn btn-secondary" href="{$CANCEL_LINK}" onclick="return confirm('{$CONFIRM_CANCEL}')">{$CANCEL}</a>
                </div>
            </form>
            {else}
            <div class="alert alert-danger">{$NO_CATEGORIES}</div>
            {/if}
        </div>
    </div>
</div>
{include file='footer.tpl'}