/**
 *	LITHIUM TEMPLATE
 *	By Xemah | https://xemah.com
 *
**/

var alertsData = [];
var messagesData = [];

async function fetchAlerts() {

	const rawData = await fetch(buildUrl('/queries/alerts'));
	const data = await rawData.json();

	data.alerts.reverse();
	return data.alerts;

}

async function fetchMessages() {

	const rawData = await fetch(buildUrl('/queries/pms'));
	const data = await rawData.json();

	data.pms.reverse();
	return data.pms;

}

function updateAlerts(alerts) {

	let alertsList = '';

	if (alerts.length > 0) {

		document.querySelector('#button-alerts').classList.add('inc');

		for (const alert of alerts) {
			alertsList += `<li>
				<a href="${buildUrl('/user/alerts/', `view=${alert.id}`)}" class="dropdown-item">${alert.content_short}</a>
			</li>`;
		}

	} else {

		document.querySelector('#button-alerts').classList.remove('inc');

		alertsList = `<li>
			<span class="dropdown-item">${locale.noAlerts}</span>
		</li>`;

	}

	document.querySelector('#list-alerts').innerHTML = alertsList;

}

function updateMessages(messages) {

	let messagesList = '';

	if (messages.length > 0) {

		document.querySelector('#button-pms').classList.add('inc');

		for (const message of messages) {
			messagesList += `<li>
				<a href="${buildUrl('/user/messaging/', `action=view&message=${message.id}`)}" class="dropdown-item">${message.title}</a>
			</li>`;
		}

	} else {

		document.querySelector('#button-pms').classList.remove('inc');

		messagesList = `<li>
			<span class="dropdown-item">${locale.noMessages}</span>
		</li>`;

	}

	document.querySelector('#list-pms').innerHTML = messagesList;

}

function notifyAlerts(alerts) {

	if (alerts.length == 0) {
		return;
	}

	if (JSON.stringify(alerts) == JSON.stringify(alertsData)) {
		return;
	}

	if (btoa(JSON.stringify(alerts)) == sessionStorage.alerts) {
		return;
	}

	if (alerts.length == 1) {
		
		toastr.info(locale.newAlert1, null, {
			onclick: () => redirect(buildUrl('/user/alerts'))
		});

	} else {

		toastr.info(locale.newAlertsX.replace('{x}', alerts.length), null, {
			onclick: () => redirect(buildUrl('/user/alerts'))
		});

	}

}

function notifyMessages(messages) {

	if (messages.length == 0) {
		return;
	}

	if (JSON.stringify(messages) == JSON.stringify(messagesData)) {
		return;
	}

	if (btoa(JSON.stringify(messages)) == sessionStorage.messages) {
		return;
	}

	if (messages.length == 1) {
		
		toastr.info(locale.newMessage1, null, {
			onclick: () => redirect(buildUrl('/user/messaging'))
		});

	} else {

		toastr.info(locale.newMessagesX.replace('{x}', messages.length), null, {
			onclick: () => redirect(buildUrl('/user/messaging'))
		});

	}

}

async function updateAndNotifyAlertsAndMessages() {

	const alerts = await fetchAlerts();
	updateAlerts(alerts);
	notifyAlerts(alerts);

	alertsData = alerts;
	sessionStorage.alerts = btoa(JSON.stringify(alerts));

	const messages = await fetchMessages();
	updateMessages(messages);
	notifyAlerts(messages);

	messagesData = messages;
	sessionStorage.messages = btoa(JSON.stringify(messages));

}

const userbar = document.querySelector('.navbar-user');
if (userbar) {
	updateAndNotifyAlertsAndMessages();
	setInterval(updateAndNotifyAlertsAndMessages, 10000);
}