{extends file="user/layout.tpl"}

{block name=sHeading}

	<div class="d-flex align-items-center mb-4">
		<h2>{$MANAGING_LICENSES}</h2>
		<a href="#modal-addLicense" class="btn btn-secondary ms-auto" data-bs-toggle="modal">{$ADD_LICENSE}</a>
	</div>

{/block}

{block name=sContent}

	{if isset($SUCCESS)}
		<div class="alert alert-success">
			{$SUCCESS}
		</div>
	{/if}

	{if isset($ERROR)}
		<div class="alert alert-danger">
			{$ERROR}
		</div>
	{/if}

	<div class="card">
		<div class="card-body">
			{if !empty($LICENSES)}
				<div class="list list-relaxed list-divided">
					{foreach from=$LICENSES item=license}
						<div class="list-item align-items-center">
							<div class="list-icon">
								<a href="{$license.profile}" style="{$license.style}">
									<img src="{$license.avatar}" alt="{$license.username}">
								</a>
							</div>
							<div class="list-content">
								{if ($license.status == '0')}
									<span class="badge bg-warning">{$license.status_text}</span>
								{else if ($license.status == '1')}
									<span class="badge bg-success">{$license.status_text}</span>
								{else}
									<span class="badge bg-danger">{$license.status_text}</span>
								{/if}
								<a href="{$license.profile}" style="{$license.style}">{$license.username}</a>
								<div class="list-meta">
									{$license.transaction_id}
									&bull;
									{$PURCHASED} {$license.date}
								</div>
							</div>
							<div class="list-extra">
								{if ($license.can_revoke)}
									<form action="" method="post">
										<input type="hidden" name="token" value="{$TOKEN}">
										<input type="hidden" name="action" value="revoke">
										<input type="hidden" name="license" value="{$license.id}">
										<button type="submit" class="btn btn-secondary btn-sm">{$REVOKE}</button>
									</form>
								{/if}
								{if ($license.can_reinstate)}
									<form action="" method="post">
										<input type="hidden" name="token" value="{$TOKEN}">
										<input type="hidden" name="action" value="reinstate">
										<input type="hidden" name="license" value="{$license.id}">
										<button type="submit" class="btn btn-secondary btn-sm">{$REINSTATE}</button>
									</form>
								{/if}
							</div>
						</div>
					{/foreach}
				</div>
			{else}
				{$NO_LICENSES}
			{/if}
		</div>
	</div>

	<div class="modal fade" id="modal-addLicense">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<div class="modal-title">
						{$ADD_LICENSE}
					</div>
					<a href="#" class="close" data-bs-dismiss="modal">
						<i class="fas fa-times"></i>
					</a>
				</div>
				<form action="" method="post">
					<div class="modal-body">
						<div class="form-group dropdown w-100" id="dropdown-findUser">
							<div class="input-group" data-bs-toggle="dropdown">
								<input type="text" class="form-control" id="input-findUser" placeholder="{$FIND_USER}" autocomplete="off">
								<span class="input-group-text" id="icon-findUser">
									<i class="fas fa-search fa-fw"></i>
								</span>
							</div>
							<div class="dropdown-menu"></div>
						</div>
					</div>
					<div class="modal-footer">
						<button class="btn btn-secondary btn-sm" data-bs-dismiss="modal">{$CANCEL}</button>
						<button type="submit" class="btn btn-primary btn-sm">{$SUBMIT}</button>
					</div>
					<input type="hidden" name="token" value="{$TOKEN}">
					<input type="hidden" name="action" value="add">
					<input type="hidden" name="user" id="input-user">
				</form>
			</div>
		</div>
	</div>

{/block}

{block name=script}

	{literal}
	
		<script>

			const userInput = document.querySelector('#input-user');
			const findUserInput = document.querySelector('#input-findUser');
			const findUserIcon = document.querySelector('#icon-findUser');
			const findUserDropdown = document.querySelector('#dropdown-findUser');
			const findUserDropdownMenu = findUserDropdown.querySelector('.dropdown-menu');
			const findUserDropdownToggler = findUserDropdown.querySelector('[data-bs-toggle="dropdown"]');

			let findUserDropdownInstance = bootstrap.Dropdown.getInstance(findUserDropdownToggler);
			if (!findUserDropdownInstance) {
				findUserDropdownInstance = new bootstrap.Dropdown(findUserDropdownToggler);
			}

			findUserDropdown.addEventListener('show.bs.dropdown', (event) => {
				if (findUserDropdownMenu && findUserDropdownMenu.innerHTML.trim() == '') {
					event.preventDefault();
				}
			});

			if (findUserDropdownMenu) {
				findUserDropdownMenu.addEventListener('click', (event) => {
					const targetElement = event.target;
					if (targetElement.matches('.dropdown-item')) {
						findUserInput.value = targetElement.dataset.username;
						userInput.value = targetElement.dataset.id;
					}
				});
			}

			let searchTimeout = null;

			findUserInput.addEventListener('input', (event) => {

				findUserDropdownInstance.hide();

				if (findUserInput.value.length > 2) {
					
					if (searchTimeout) {
						clearTimeout(searchTimeout);
					}

					playerSearchTimeout = setTimeout(async () => {

						findUserIcon.innerHTML = '<i class="fas fa-fw fa-circle-notch fa-spin"></i>'

						let searchQuery = await fetch('{/literal}{$ADD_LICENSE_USERS_ENDPOINT}{literal}' + findUserInput.value);
						let searchQueryJson = await searchQuery.json();

						let dropdownHtml = '';
						for (const result of searchQueryJson.results) {
							dropdownHtml += `<a href="#" class="dropdown-item" data-id="${result.id}" data-username="${result.username}" data-nickname="${result.nickname}">${result.username}</div>`;
						}

						findUserDropdownMenu.innerHTML = dropdownHtml;

						if (findUserDropdownInstance && findUserDropdownMenu.innerHTML.trim() != '') {
							findUserDropdownInstance.show();
						}

						findUserIcon.innerHTML = '<i class="fas fa-fw fa-search"></i>'

					}, 250);
					
				}

			});
			
		</script>
		
	{/literal}

{/block}