{extends file="layout.tpl"}

{block name=heading}

	<h2>{$TITLE}</h2>

{/block}

{block name=content}

	{if !empty($SUCCESS)}
		<div class="alert alert-success">
			{foreach from=$SUCCESS item=success}
				<li>{$success}</li>
			{/foreach}
		</div>
	{/if}

	{if !empty($ERRORS)}
		<div class="alert alert-danger">
			{foreach from=$ERRORS item=error}
				<li>{$error}</li>
			{/foreach}
		</div>
	{/if}

	{if !isset($MSG)}
		<div class="card">
			<div class="card-body">
				<h3>{$PAYMENT_TITLE}</h3>
				<div class="row justify-content-center">
					<div class="col-lg-6">
						<form action="" method="POST" id="form-payment">
							<div class="form-group">
								<label class="form-label" for="input-payment">{$PAYMENT_CURRENCY}</label>
								<input type="number" class="form-control" id="input-payment" name="amount" value="20">
							</div>
							<div class="form-group">
								<label class="form-label" for="input-method">{$PAYMENT_METHOD}</label>
								<input type="hidden" name="url" value="{$HOST_URL}">
								{foreach from=$PAYMENT_LIST item=payment}
									{if ($payment.enabled == 1)}
										<input type="submit" class="btn btn-primary" value="{$payment.name}" onclick="{$payment.name}()">
									{/if}
								{/foreach}
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	{else}
		<p>{$MSG}</p>
	{/if}

{/block}

{block name=script}
	
	<script>

		function PayPal() {
			document.querySelector('#form-payment').action = {json_encode($PAYPAL_PROCESS_URL)};
		}

		function WebMoney() {
			document.querySelector('#form-payment').action = {json_encode($WEBMONEY_PROCESS_URL)};
		}

		function Enot() {
			document.querySelector('#form-payment').action = {json_encode($ENOT_PROCESS_URL)};
		}

		function FreeKassa() {
			document.querySelector('#form-payment').action = {json_encode($FREEKASSA_PROCESS_URL)};
		}

		function UnitPay() {
			document.querySelector('#form-payment').action = {json_encode($UNITPAY_PROCESS_URL)};
		}

	</script>

{/block}