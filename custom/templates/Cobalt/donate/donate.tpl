{include file='header.tpl'}
{include file='navbar.tpl'}
<div class="container">
   {if isset($SUCCESS)}
   <div class="alert alert-success">
      {$SUCCESS_TITLE}: {$SUCCESS}
   </div>
   {/if}
   {if isset($ERRORS)}
   <div class="alert alert-danger">
      {$ERRORS_TITLE}
      <ul>
         {foreach from=$ERRORS item=error}
         <li>{$error}</li>
         {/foreach}
      </ul>
   </div>
   {/if}
   <div class="row">
      <div class="col-lg-9">
         <div class="card">
            <div class="card-header header-theme">{$DONATE}</div>
            <div class="card-body">
               {if isset($CONTENT)}
               <p>{$CONTENT}</p>
               {/if}
               <form id="payment_form" action="{$PROCESS_URL}" method="POST">
                  <div class="form-group">
                     <label for="amount">{$AMOUNT} ({$CURRENCY})</label>
                     <input class="form-control" type="number" min="{$MIN_AMOUNT}" name="amount" id="amount" value="10" placeholder="10">
                  </div>
                  <div class="form-group">
                     <label for="amount">{$DONATE_AS}</label>
                     <select class="form-control" name="anonymous" id="anonymous">
                        {if $LOGGED_IN_USER}
                        <option value="0">{$LOGGED_IN_USER.nickname}</option>
                        {/if}
                        <option value="1">{$ANONYMOUS}</option>
                     </select>
                  </div>
                  <button type="submit" class="btn btn-theme">Donate Now (via Paypal)</button>
               </form>
            </div>
         </div>
      </div>
      <div class="col-lg-3">
         <div class="card">
            <div class="card-header header-theme">{$LATEST_DONATIONS}</div>
            <div class="card-body">
               {foreach from=$LATEST_DONATIONS_LIST item=donator}
               <div class="d-flex mb-3">
                  <img class="avatar-img" style="height: 40px; width: 40px" src="{$donator.avatar_url}" alt="{$donator.username}">
                  <div class="flex-grow-1 ml-3">
                     <a class="white-link" href="{$donator.profile_url}">{$donator.username}</a><br />
                     ${$donator.amount} {$donator.currency}<br />
                     <span data-toggle="tooltip" data-placement="top" title="{$donator.date}">{$donator.date_rough}</span>
                  </div>
               </div>
               {/foreach}
            </div>
         </div>
      </div>
   </div>
</div>
{include file='footer.tpl'}