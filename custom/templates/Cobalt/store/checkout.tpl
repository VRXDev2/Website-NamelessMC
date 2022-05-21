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
                <div class="card-header header-theme">{$STORE} &raquo; {$CHECKOUT}</div>
                <div class="card-body">
                    <form action="" method="post" id="forms">
                        <span style="display: inline-block; font-size: 1.1rem; font-weight: 500; margin-bottom: 0.5rem">{$SHOPPING_CART}</span>
                        <div class="table-responsive">
                            <table class="table table-striped">
                                <thead>
                                    <tr>
                                        <th>{$NAME}</th>
                                        <th>{$OPTIONS}</th>
                                        <th>{$QUANTITY}</th>
                                        <th>{$PRICE}</th>
                                        <th></th>
                                    </tr>
                                </thead>
                                <tbody>
                                    {foreach from=$SHOPPING_CART_LIST item=item}
                                        <tr>
                                            <td>{$item.name}</td>
                                            <td>{if count($item.fields)}
                                                    {foreach from=$item.fields item=field name=fields}<strong>{$field.description}</strong>:
                                                        {$field.value}{if not $smarty.foreach.fields.last}<br />{/if}{/foreach} {/if}
                                                    </td>
                                                    <td>{$item.quantity}</td>
                                                    <td>{$CURRENCY_SYMBOL}{$item.price} {$CURRENCY}</td>
                                                    <td><a href="{$item.remove_link}"
                                                            class="btn btn-secondary"><i class="fas fa-trash"></i></a></td>
                                                </tr>
                                            {/foreach}
                                        </tbody>
                                    </table>
                                </div>
                                <span style="display: inline-block; font-size: 0.9rem; font-weight: 500; margin-bottom: 1.5rem; color: rgba(255,255,255,0.6)">{$TOTAL_PRICE}
                                    {$TOTAL_PRICE_VALUE} {$CURRENCY}</span>
                                <div class="card">
                                    <div class="card-header">{$PAYMENT_METHOD}</div>
                                    <div class="card-body">
                                        {foreach from=$PAYMENT_METHODS item=gateway}
                                            <div class="mt-1 mb-1">
                                                <input type="radio" name="payment_method" value="{$gateway.name}" required>
                                                <label>{$gateway.displayname}</label>
                                            </div>
                                        {/foreach}
                                    </div>
                                </div>
                                <div class="ui checkbox" style="display:inline;">
                                    <input type="hidden" name="token" value="{$TOKEN}">
                                    <input type="checkbox" name="t_and_c" value="1" required>
                                    <label>{$AGREE_T_AND_C_PURCHASE}</label><br />
                                    <button type="submit" class="btn btn-theme">{$PURCHASE} &raquo;</button>
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