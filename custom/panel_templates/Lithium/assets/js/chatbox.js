/**
 *	LITHIUM TEMPLATE
 *	By Xemah | https://xemah.com
 *
**/

chatbox.templates = {
	container: `
		<div class="card card-chatbox" id="chatbox" data-position="{position}">
			<div class="card-header">
				{title}
			</div>
			<div class="card-body">
				<div id="log-chat">
					<span class="ms-2">{loading}</span>
				</div>
			</div>
			<div class="card-footer">
				<form class="disabled" id="form-chat" autocomplete="off">
					<div class="input-group">
						<input type="text" class="form-control" id="input-chat" placeholder="{messagePlaceholder}" />
						<button type="submit" class="btn btn-primary">
							<i class="fas fa-share fa-fw"></i>
						</button>
					</div>
				</form>
			</div>
		</div>
	`,
	item: `
		<div class="message message-chat" id="chatMessage-{messageId}">
			<div class="message-icon">
				<a href="{authorProfile}">
					<img src="{authorAvatar}">
				</a>
			</div>
			<div class="message-content">
				<div class="message-title">
					<a href="{authorProfile}" style="{authorStyle}">{authorUsername}</a>:
				</div>
				<div class="message-post">
					{messageContent}
				</div>
				<div class="message-meta">
					<div>
						{messageTime}
					</div>
					<div class="message-actions">
						{messageActions}
					</div>
				</div>
			</div>
		</div>
	`
};

chatbox.elements = {
	containerTop: '#chatbox-top',
	containerBottom: '#chatbox-bottom',
	root: '#chatbox',
	log: '#log-chat',
	form: '#form-chat',
	input: '#input-chat'
};

document.addEventListener('DOMContentLoaded', () => {
	chatbox.instance = new Chatbox(chatbox);
});