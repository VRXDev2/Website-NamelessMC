{assign var="WIDGETS_PAGE" value=true}
{extends file="store/layout.tpl"}

{block name=sHeading}

	<h2>{$SHOPPING_CART}</h2>

{/block}

{block name=sContent}

	{if isset($SUCCESS)}
		<div class="alert alert-success">
			{$SUCCESS}
		</div>
	{/if}

	{if !empty($ERRORS)}
		<div class="alert alert-danger">
			{foreach from=$ERRORS item=error}
				<li>{$error}</li>
			{/foreach}
		</div>
	{/if}

	<div class="row">
		<div class="col-lg-9">
			<div class="card">
				<div class="card-body">
					<div class="table-responsive">
						<table class="table">
							<thead>
								<tr>
									<th>{$NAME}</th>
									<th>{$OPTIONS}</th>
									<th>{$QUANTITY}</th>
									<th>{$PRICE}</th>
									<th></th>
								</tr>
							</thead>
							<colgroup>
								<col width="30%">
								<col width="25%">
								<col width="20%">
								<col width="20%">
								<col width="5%">
							</colgroup>
							<tbody>
								{foreach from=$SHOPPING_CART_LIST item=item}
									<tr>
										<td>{$item.name}</td>
										<td>
											{if !empty($item.fields)}
												{foreach from=$item.fields item=field name=fields}
													<div class="meta">
														{$field.description}:
														<strong>{$field.value}</strong>
													</div>
												{/foreach}
											{/if}
										</td>
										<td>{$item.quantity}</td>
										<td>{$CURRENCY_SYMBOL}{$item.price} {$CURRENCY}</td>
										<td class="text-end">
											<a href="{$item.remove_link}" class="btn btn-danger btn-sm btn-sq">
												<i class="fas fa-times"></i>
											</a>
										</td>
									</tr>
								{/foreach}
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
		<div class="col-lg-3">
			<div class="card">
				<form action="" method="POST">
					<div class="card-header">
						{$TOTAL_PRICE} <span class="float-end">{$CURRENCY_SYMBOL}{$TOTAL_PRICE_VALUE} {$CURRENCY}</span>
					</div>
					<div class="card-body">
						<hr>
						<h6 class="mt-4">{$PAYMENT_METHOD}</h6>
						<div class="form-group">
							{foreach from=$PAYMENT_METHODS item=gateway}
								<div class="form-check">
									<input type="radio" class="form-check-input" id="input-label-gateway-{$gateway.name}" name="payment_method" value="{$gateway.name}">
									<label class="form-check-label" for="input-label-gateway-{$gateway.name}">{$gateway.displayname}</label>
								</div>
							{/foreach}
						</div>
						<h6 class="mt-4">{$PURCHASE}</h6>
						<div class="form-group">
							<div class="form-check">
								<input type="checkbox" class="form-check-input" id="input-tac" name="t_and_c" value="1">
								<label class="form-check-label" for="input-tac">{$AGREE_T_AND_C_PURCHASE}</label>
							</div>
						</div>
						<button type="submit" class="btn btn-primary btn-block mt-4">{$PURCHASE}</button>
					</div>
					<input type="hidden" name="token" value="{$TOKEN}">
				</form>
			</div>
		</div>
	</div>

{/block}