{extends file="layout.tpl"}

{block name=heading}

	<h2>{$NEW_RESOURCE}</h2>

{/block}

{block name=content}

	{if isset($ERROR)}
		<div class="alert alert-danger">
			{$ERROR}
		</div>
	{/if}

	<div class="card">
		<div class="card-body">
			<form action="" method="post">
				<div class="form-group">
					<label class="form-label" for="input-type">{$TYPE}</label>
					<select class="form-control" id="input-type" name="type">
						<option value="free">{$FREE_RESOURCE}</option>
						<option value="premium">{$PREMIUM_RESOURCE}</option>
					</select>
				</div>
				<div class="form-group" id="inputGroup-price">
					<label class="form-label" for="input-price">{$PREMIUM_RESOURCE_PRICE}</label>
					<div class="input-group">
						<input type="number" class="form-control" id="input-price" name="price" step="0.01" min="0.01" placeholder="{$PRICE}">
						<span class="input-group-text">{$CURRENCY}</span>
					</div>
				</div>
				<div class="form-actions">
					<a href="{$CANCEL_LINK}" class="btn btn-secondary" onclick="return confirm('{$CONFIRM_CANCEL}')">{$CANCEL}</a>
					<button type="submit" class="btn btn-primary">{$SUBMIT}</button>
				</div>
				<input type="hidden" name="token" value="{$TOKEN}">
			</form>
		</div>
	</div>
	
	<script type="text/javascript">

	</script>

{/block}

{block name=script}

	<script>
		const priceInput = document.querySelector('#inputGroup-price');
		const typeInput = document.querySelector('#input-type');
		priceInput.style.display = 'none';
		typeInput.addEventListener('input', (event) => {
			if (typeInput.value === 'premium') {
				priceInput.style.removeProperty('display');
			} else {
				priceInput.style.display = 'none';
			}
		});
	</script>
	
{/block}