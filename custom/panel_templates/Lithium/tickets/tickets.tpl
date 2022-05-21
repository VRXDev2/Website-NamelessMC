{extends file="layout.tpl"}

{block name=heading}

	<h2>{$TICKETS}</h2>
	
{/block}

{block name=content}

	<div id="ticketsApp">
		<tickets-page></tickets-page>
	</div>

{/block}

{block name=script}

	<script src="https://unpkg.com/vue@next"></script>

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

		const userToken = '{$TOKEN}';
		const ticketsUrl = '{$URL}';
		const ticketsApp = Vue.createApp({ el: '#ticketsApp' });

		let searchParams = new URLSearchParams(window.location.search);

		const reactive = Vue.reactive({
			tickets: [],
			ticketsCount: parseInt('{$COUNT}')
		});

		reactive.page = 1;
		if (searchParams.has('p') && Number.isInteger(parseInt(searchParams.get('p')))) {
			reactive.page = parseInt(searchParams.get('p'));
		}

		ticketsApp.component('tickets-page', {
			delimiters: ['%%', '%%'],
			data() { return reactive },
			template: `
				<div v-if="tickets.length > 0" class="action-bar">
					<div class="action-bar-pagination">
						<pagination></pagination>
					</div>
					{if ($CAN_OPEN)}
						<div class="action-bar-buttons">
							<a href="{$URL}new" class="btn btn-primary btn-sm" data-request-modal="new-ticket">Open a Ticket</a>
						</div>
					{/if}
				</div>
				<div v-if="tickets.length > 0">
					<tickets></tickets>
				</div>
				<div v-else class="card">
					<div class="card-body">
						{$EMPTY}
					</div>
					<div class="card-footer">
						<a href="{$URL}new" class="btn btn-primary">Open a Ticket</a>
					</div>
				</div>
				<div v-if="tickets.length > 0" class="action-bar">
					<div class="action-bar-pagination">
						<pagination></pagination>
					</div>
					{if ($CAN_OPEN)}
						<div class="action-bar-buttons">
							<a href="{$URL}new" class="btn btn-primary btn-sm" data-request-modal="new-ticket">Open a Ticket</a>
						</div>
					{/if}
				</div>
			`
		});

		ticketsApp.component('tickets', {
			delimiters: ['%%', '%%'],
			data() { return reactive },
			template: `	
				<div class="card">
					<div class="card-body">
						<div class="list list-relaxed list-divided">
							<div v-for="ticket in tickets" class="list-item align-items-center">
								<div class="list-content">
									<span v-if="ticket.status === '1'" style="display: inline-block; width: 10px; height: 10px; margin-right: 8px; background: var(--info); border-radius: 50%;"></span>
									<span v-if="ticket.status === '2'" style="display: inline-block; width: 10px; height: 10px; margin-right: 8px; background: var(--warning); border-radius: 50%;"></span>
									<span v-if="ticket.status === '3'" style="display: inline-block; width: 10px; height: 10px; margin-right: 8px; background: var(--secondary); border-radius: 50%;"></span>
									<span v-if="ticket.status === '4'" style="display: inline-block; width: 10px; height: 10px; margin-right: 8px; background: var(--danger); border-radius: 50%;"></span>
									<span v-if="ticket.status === '5'" style="display: inline-block; width: 10px; height: 10px; margin-right: 8px; background: var(--success); border-radius: 50%;"></span>
									<a v-bind:href="'{$URL}ticket/' + ticket.id">%% ticket.title %%</a>
									<div class="list-meta">
										<div>
											Status:
											<span v-if="ticket.status === '1'">In progress</span>
											<span v-if="ticket.status === '2'">Important</span>
											<span v-if="ticket.status === '3'">Pending</span>
											<span v-if="ticket.status === '4'">Closed</span>
											<span v-if="ticket.status === '5'">Solved</span>
										</div>
										<div class="d-sm-none">
											Opened By:
											<a v-bind:href="'{$SITE_HOME}profile/' + ticket.username + '/'">%% ticket.username %%</a>
											&bull;
											%% ticket.date %%
										</div>
									</div>
								</div>
								<div class="list-extra d-none d-sm-block">
									<div class="user-item user-item-right">
										<div class="user-item-content">
											<a v-bind:href="'{$SITE_HOME}profile/' + ticket.username + '/'">%% ticket.username %%</a>
											<div class="user-item-meta">
												%% ticket.date %%
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			`
		});

		ticketsApp.component('pagination', {
			delimiters: ['%%', '%%'],
			data() { return reactive },
			template: `
				<ul class="pagination d-inline-flex">
					<li v-bind:class="'page-item' + (page < 2 ? ' disabled' : '')">
						<a v-bind:data-page="page-1" href="#" class="page-link">«</a>
					</li>
					<li class="page-item" v-if="page == ticketsCount && ticketsCount > 2">
						<a v-bind:data-page="page-2" href="#" class="page-link">%% page-2 %%</a>
					</li>
					<li class="page-item" v-if="page > 1">
						<a v-bind:data-page="page-1" href="#" class="page-link">%% page-1 %%</a>
					</li>
					<li class="page-item active">
						<a v-bind:data-page="page" href="#" class="page-link">%% page %%</a>
					</li>
					<li v-if="page < ticketsCount" class="page-item">
						<a v-bind:data-page="page+1" href="#" class="page-link">%% page+1 %%</a>
					</li>
					<li v-if="page == 1 && ticketsCount > 2" class="page-item">
						<a v-bind:data-page="page+2" href="#" class="page-link">%% page+2 %%</a>
					</li>
					<li v-bind:class="'page-item' + (ticketsCount == page ? ' disabled' : '')">
						<a v-bind:data-page="page+1" href="#" class="page-link" id="next-page">»</a>
					</li>
				</ul>
			`,
		});

		ticketsApp.mount('#ticketsApp');

		document.addEventListener('DOMContentLoaded', () => {
			
			const ticketsApp = document.querySelector('#ticketsApp');

			reactive.page = parseInt(reactive.page);

			postRequest(null, {
				ajax: 1,
				token: userToken,
				action: 'getTickets',
				parameters: JSON.stringify({ page: reactive.page })
			}).then((results) => {

				reactive.tickets = results;

			}).catch(() => { });

			ticketsApp.addEventListener('click', (event) => {

				const pageLink = findAncestor(event.target, '.page-item:not(.disabled):not(.active) .page-link');
				if (pageLink) {
					event.preventDefault();

					reactive.page = parseInt(pageLink.dataset.page);

					postRequest(null, {
						ajax: 1,
						token: userToken,
						action: 'getTickets',
						parameters: JSON.stringify({ page: reactive.page })
					}).then((results) => {

						reactive.tickets = results;
						history.pushState('Tickets', 'Tickets', '?p=' + reactive.page);

					}).catch(() => { });
				}

			});

		});

	</script>
	
{/block}