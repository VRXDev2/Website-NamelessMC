{include file='header.tpl'}
{include file='navbar.tpl'}

<div class="container">

{if count($ERRORS)}
	<div class="alert alert-danger">
		{foreach from=$ERRORS item=error}
			<li>{$error}</li>
		{/foreach}
	</div>
{/if}

{if count($SUCCESS)}
	<div class="alert alert-success">
		{foreach from=$SUCCESS item=ok}
			<li>{$ok}</li>
		{/foreach}
	</div>
{/if}
<div class="card">
<div class="card-body">
{if !isset($MSG)}
	<div class="col form-group d-flex justify-content-center">
		<form id="payment_form" method="POST">
			<div class="form-group">
				<h6 class="text-center">{$PAYMENT_TITLE}</h6>
				<h6 class="text-center">{$PAYMENT_CURRENCY}</h6>
				<input class="form-control" type="number" name="amount" value="20">
			</div>
			<div class="form-group">
				<h6 class="text-center">{$PAYMENT_METHOD}</h6>
				<input type="hidden" name="url" value="{$HOST_URL}">


				{foreach from=$PAYMENT_LIST item=payment}
					{if $payment.enabled == 1}
						<div class="form-group">
							<input onclick="{$payment.name}()" class="btn btn-primary" type="submit" value="{$payment.name}"
								style="width: 100%;">
						</div>
					{/if}

				{/foreach}

			</div>
		</form>
	</div>



	<script>
		function PayPal() {
			document.getElementById('payment_form').action = '{$PAYPAL_PROCESS_URL}';
		}

		function WebMoney() {
			document.getElementById('payment_form').action = '{$WEBMONEY_PROCESS_URL}';
		}

		function Enot() {
			document.getElementById('payment_form').action = '{$ENOT_PROCESS_URL}';
		}

		function FreeKassa() {
			document.getElementById('payment_form').action = '{$FREEKASSA_PROCESS_URL}';
		}

		function UnitPay() {
			document.getElementById('payment_form').action = '{$UNITPAY_PROCESS_URL}';
		}
	</script>
{else}
	<h3 class="text-center">{$MSG}</h3>
{/if}
</div>
</div>

</div>

{include file='footer.tpl'}