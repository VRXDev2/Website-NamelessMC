<script>

	function postRequest(url, data) {

		if (!url || url === '') {
			url = location.href.replace(location.hash, '');
		}

		const formData = new FormData();
		for (const [key, value] of Object.entries(data)) {
			formData.append(key, value);
		}

		return new Promise(async (resolve, reject) => {

			const response = await fetch(url, { method: 'post', body: formData });
			const responseJson = await response.json();

			if (responseJson.errors && responseJson.errors.length > 0) {

				for (const error of responseJson.errors) {
					toastr.error(error, '{$ERROR_OCCURED}');
				}

				reject();

			}

			resolve(responseJson.content);

		});

	}

	function initSelect2(el, data) {

		el.innerHTML = '';
		for (const item of data) {
			el.innerHTML += '<option value="' + item.id + '">' + item.text + '</option>';
		}

	}

	document.addEventListener('DOMContentLoaded', async () => {
		
		const ticketsApp = document.querySelector('#ticketsApp');
		
		postRequest(null, {
			ajax: 1,
			token: userToken,
			action: 'getAnswers',
			parameters: JSON.stringify({ })
		}).then((results) => {

			for (const answer of results) {
				reactive.answers.push(answer);
			}

		}).catch(() => {
			redirect(urlBuild('/tickets'));
		});

		{if isset($PERMISSIONS.categories) && $PERMISSIONS.categories}

			const assignCategoriesInput = document.querySelector('#input-assignCategories');
			initSelect2(assignCategoriesInput, reactive.naCategories);

		{/if}

		{if isset($PERMISSIONS.assign) && $PERMISSIONS.assign}

			const assignGroupsInput = document.querySelector('#input-assignGroups');
			initSelect2(assignGroupsInput, reactive.naGroups);

		{/if}

		ticketsApp.addEventListener('click', (event) => {

			const addAnswerButton = findAncestor(event.target, '#button-addAnswer');
			if (addAnswerButton) {
				event.preventDefault();

				addAnswerButton.classList.add('disabled');
				const answerContentInput = document.querySelector('#input-answerContent');

				postRequest(null, {
					ajax: 1,
					token: userToken,
					action: 'addAnswer',
					parameters: JSON.stringify({ content: answerContentInput.value })
				}).then((results) => {

					for (const answer of results) {
						reactive.answers.push(answer);
					}

				}).catch(() => {
					redirect(urlBuild('/tickets'));
				});

				answerContentInput.value = '';
				addAnswerButton.classList.remove('disabled');
			}

			{if isset($PERMISSIONS.categories) && $PERMISSIONS.categories}

				const addCategoriesButton = findAncestor(event.target, '#button-addCategories');
				if (addCategoriesButton) {
					event.preventDefault();

					addCategoriesButton.classList.add('disabled');
					const assignCategoryInput = document.querySelector('#input-assignCategories');
					const assignCategoryInputValue = Array.from(assignCategoryInput.querySelectorAll('option:checked')).map((option) => option.value);
					
					postRequest(null, {
						ajax: 1,
						token: userToken,
						action: 'assignCategories',
						parameters: JSON.stringify({ categories: assignCategoryInputValue }),
					}).then((results) => {

						for (const category of assignCategoryInputValue) {
							const index = reactive.naCategories.map((item) => item.id).indexOf(category);
							reactive.aCategories.push(reactive.naCategories[index]);
							reactive.naCategories.splice(index, 1);
						}

						initSelect2(assignCategoryInput, reactive.naCategories);

					}).catch(() => { });

					addCategoriesButton.classList.remove('disabled');
				}

				const removeCategoryButton = findAncestor(event.target, '[id^="button-removeCategory"]');
				if (removeCategoryButton) {
					event.preventDefault();

					removeCategoryButton.classList.add('disabled');
					const assignCategoryInput = document.querySelector('#input-assignCategories');
					const categoryId = removeCategoryButton.id.split('-').pop();

					postRequest(null, {
						ajax: 1,
						token: userToken,
						action: 'unassignCategory',
						parameters: JSON.stringify({ category: categoryId })
					}).then((results) => {
						
						const index = reactive.aCategories.map((item) => item.id).indexOf(categoryId);
						reactive.naCategories.push(reactive.aCategories[index]);
						reactive.aCategories.splice(index, 1);

						initSelect2(assignCategoryInput, reactive.naCategories);

					}).catch(() => { });

					removeCategoryButton.classList.remove('disabled');
				}

			{/if}

			{if isset($PERMISSIONS.assign) && $PERMISSIONS.assign}

				const addGroupsButton = findAncestor(event.target, '#button-addGroups');
				if (addGroupsButton) {
					event.preventDefault();

					addGroupsButton.classList.add('disabled');
					const assignGroupsInput = document.querySelector('#input-assignGroups');
					const assignGroupsInputValue = Array.from(assignGroupsInput.querySelectorAll('option:checked')).map((option) => option.value);

					postRequest(null, {
						ajax: 1,
						token: userToken,
						action: 'assignTicket',
						parameters: JSON.stringify({ groups_id: assignGroupsInputValue })
					}).then((results) => {

						for (const group of assignGroupsInputValue) {
							const index = reactive.naGroups.map((item) => item.id).indexOf(group);
							reactive.aGroups.push(reactive.naGroups[index]);
							reactive.naGroups.splice(index, 1);
						}

						initSelect2(assignGroupsInput, reactive.naGroups);

					}).catch(() => { });

					addGroupsButton.classList.remove('disabled');
				}
				
				const removeGroupButton = findAncestor(event.target, '[id^="button-removeGroup"]');
				if (removeGroupButton) {
					event.preventDefault();

					removeGroupButton.classList.add('disabled');
					const assignGroupsInput = document.querySelector('#input-assignGroups');
					const groupId = removeGroupButton.id.split('-').pop();

					postRequest(null, {
						ajax: 1,
						token: userToken,
						action: 'unassignTicket',
						parameters: JSON.stringify({ group_id: groupId })
					}).then((results) => {
						
						const index = reactive.aGroups.map((item) => item.id).indexOf(groupId);
						reactive.naGroups.push(reactive.aGroups[index]);
						reactive.aGroups.splice(index, 1);

						initSelect2(assignGroupsInput, reactive.naGroups);

					}).catch(() => { });

					removeGroupButton.classList.remove('disabled');
				}

			{/if}

			{if isset($PERMISSIONS.status) && $PERMISSIONS.status}

				const editStatusButton = findAncestor(event.target, '#button-editStatus');
				if (editStatusButton) {
					event.preventDefault();

					const statusInput = document.querySelector('#input-status');
					if (statusInput.value != reactive.status) {
						editStatusButton.classList.add('disabled');

						postRequest(null, {
							ajax: 1,
							token: userToken,
							action: 'editStatus',
							parameters: JSON.stringify({ status: statusInput.value })
						}).then((results) => {
							
							reactive.status = statusInput.value;

						}).catch(() => { });

						editStatusButton.classList.remove('disabled');
					}
				}

			{/if}

			{if isset($PERMISSIONS.delete) && $PERMISSIONS.delete}

				const deleteTicketButton = findAncestor(event.target, '#button-deleteTicket');
				if (deleteTicketButton) {
					event.preventDefault();

					deleteTicketButton.classList.add('disabled');

					postRequest(null, {
						ajax: 1,
						token: userToken,
						action: 'deleteTicket',
						parameters: JSON.stringify({ })
					}).then((results) => {
						
						redirect(buildUrl('/tickets'));

					}).catch(() => { });

					deleteTicketButton.classList.remove('disabled');
				}

			{/if}

		});

	});

</script>
