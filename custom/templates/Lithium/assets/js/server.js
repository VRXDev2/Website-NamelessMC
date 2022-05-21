/**
 *	LITHIUM TEMPLATE
 *	By Xemah | https://xemah.com
 *
**/

const servers = document.querySelectorAll('[id^="serverQuery"]');

for (const server of servers) {

	const serverId = server.dataset.id;

	(async () => {

		const rawData = await fetch(buildUrl('/queries/server', `id=${serverId}`));
		const data = await rawData.json();

		let serverPlayersCount;
		let serverPlayersList;

		if (data.status_value === 1) {

			server.dataset.status = 'online'
			serverPlayersCount = data.player_count + ' / ' + data.player_count_max;

			if (server.dataset.bungee == 1) {

				serverPlayersList = locale.bungeeInstance;

			} else {

				if (server.dataset.players == 1) {

					if (data.player_list.length > 0) {

						serverPlayersList = '<div class="list list-players">';

						for (const player of data.player_list) {
							serverPlayersList += `<div class="list-item">
								<a href="${buildUrl(`/profile/${player.name}`)}" class="list-icon" data-bs-toggle="tooltip" title="${player.name} ">
									<img src="${avatarSource.replace('{x}', (player.id ? player.id : player.name)).replace('{y}', 64)}" alt="${player.name}">
								</a>
							</div>`;
						}

						if (data.player_list.length < data.player_count) {
							serverPlayersList += `<div class="list-item list-item-more">
								+${(data.player_count - data.player_list.length)}
							</div>`;
						}

						serverPlayersList += '</div>';

					} else {

						if (data.player_count > 0) {
							serverPlayersList = 'Players are hidden.';
						} else {
							serverPlayersList = locale.noPlayersOnline;
						}

					}

				}

			}

		} else {

			server.dataset.status = 'offline'
			serverPlayersCount = locale.offline;
			serverPlayersList = locale.noPlayersOnline;

		}

		document.querySelector(`#serverPlayersCount-${serverId}`).innerHTML = serverPlayersCount;
		document.querySelector(`#serverPlayersList-${serverId}`).innerHTML = serverPlayersList;

	})();

}