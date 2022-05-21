{include file='header.tpl'} {include file='navbar.tpl'}
<div class="container">
    <div class="card">
        <div class="card-header header-theme">{$NEW_RESOURCE}</div>
        <div class="card-body">
            {if isset($ERROR)}
            <div class="alert alert-danger">
                {$ERROR}
            </div>
            {/if} {if isset($NO_PAYMENT_EMAIL)}
            <div class="alert alert-warning">
                {$NO_PAYMENT_EMAIL}
            </div>
            {/if}
            <form action="" method="post">
                <div class="form-group">
                    <label for="inputType">{$TYPE}</label>
                    <select class="form-control" name="type" id="inputType">
                        <option value="free">{$FREE_RESOURCE}</option>
                        <option value="premium">{$PREMIUM_RESOURCE}</option>
                    </select>
                </div>
                <div class="form-group" id="priceFormGroup">
                    <label for="inputPrice">{$PREMIUM_RESOURCE_PRICE}</label>
                    <div class="input-group mb-3">
                        <input type="number" step="0.01" min="0.01" class="form-control" id="inputPrice" name="price" placeholder="{$PRICE}">
                        <div class="input-group-append">
                            <span class="input-group-text">{$CURRENCY}</span>
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <input type="hidden" name="token" value="{$TOKEN}">
                    <button type="submit" class="btn btn-theme">{$SUBMIT}</button>
                    <a href="{$CANCEL_LINK}" class="btn btn-secondary" onclick="return confirm('{$CONFIRM_CANCEL}');">{$CANCEL}</a>
                </div>
            </form>
        </div>
    </div>
</div>
{include file='footer.tpl'}