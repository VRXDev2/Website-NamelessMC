chatbox.templates = {

    container: `
		<div class="card card-chatbox" id="chatbox" data-position="{position}">
			<div class="card-header header-theme">
				{title}
			</div>
			<div class="card-body">
				<div class="list chat-list" id="chatLog">
					{loading}
				</div>
				<form action="" class="disabled" id="chatForm" autocomplete="off">
					<div class="input-group">
						   <input type="text" class="form-control" id="chatInput" placeholder="{messagePlaceholder}" />
						   <span class="input-group-btn">
								<button type="submit" class="btn btn-theme float-right ml-1" id="chatInputSubmit">
									<i class="fas fa-share fa-fw"></i>
								</button>
						   </span>
					</div>
				</form>
			</div>
		</div>
	`,

    item: `
		<div class="chat-flex chat-item" id="chatMessage-{messageId}">
			<div class="author-img">
				<a href="{authorProfile}"><img src="{authorAvatar}" class="avatar-img"></a>
			</div>
			<div class="message-text">
				<a class="username" href="{authorProfile}" style="{authorStyle}">{authorUsername}</a><div class="float-right">{messageActions}</div>
				<small>{messageTime}</small><br />{messageContent}
			</div>
		</div>
	`
};

chatbox.elements = {
    containerTop: '#chatbox-top',
    containerBottom: '#chatbox-bottom',
    root: '#chatbox',
    log: '#chatbox #chatLog',
    form: '#chatbox #chatForm',
    input: '#chatbox #chatInput'
};

chatbox.style = `

`;

document.addEventListener('DOMContentLoaded', () => {
    chatbox.instance = new Chatbox(chatbox);
});