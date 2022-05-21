<script src="https://unpkg.com/vue@next"></script>

<script>

	const userToken = '{$TOKEN}';
	const ticketId = '{$TICKET_ID}';
	const ticketApp = Vue.createApp({ el: '#ticketsApp' });

	const reactive = Vue.reactive({
		status: parseInt('{$TICKET[0]->status}'),
		answers: []
	});

	ticketApp.component('status-badge', {
		delimiters: ['%%', '%%'],
		data() { return reactive },
		template: `
			<span v-if="status == 1" class="badge bg-info">{$IN_PROGRESS}</span>
			<span v-if="status == 2" class="badge bg-warning">{$IMPORTANT}</span>
			<span v-if="status == 3" class="badge bg-secondary">{$PENDING}</span>
			<span v-if="status == 4" class="badge bg-danger">{$CLOSED}</span>
			<span v-if="status == 5" class="badge bg-success">{$SOLVED}</span>
		`
	});

	ticketApp.component('answers', {
		delimiters: ['%%', '%%'],
		data() { return reactive },
		template: `
			<div v-if="answers.length > 0" class="card card-post">
				<div class="card-body">
					<div class="row">
						<div class="col-lg-3 col-xl-2">
							<div class="forum-post-sidebar">
								<div class="forum-post-user-avatar">
									<img v-bind:src="'https://cravatar.eu/helmavatar/' + answers[0].username + '/500.png'" v-bind:alt="answers[0].username">
								</div>
								<div class="forum-post-user-info">
									<div class="forum-post-user-name">
										<a v-bind:href="'{$SITE_HOME}profile/' + answers[0].username + '/'" v-bind:style="'color:' + answers[0].group_username_color + ';'">%% answers[0].username %%</a>
									</div>
									<div class="forum-post-user-badge" v-html="answers[0].group_html">
									</div>
									<div class="forum-post-user-stats">
										<div class="pairs">
											<dl>
												<dt>{$IGN}</dt>
												<dd>%% answers[0].username %%</dd>
											</dl>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="col-lg-9 col-xl-10">
							<div class="forum-post-main">
								<div class="forum-post-attributes">
									<div class="forum-post-meta">
										%% answers[0].date %%
									</div>
								</div>
								<div class="post">
									<p v-html="answers[0].content.replaceAll('\\r\\n', '<br>')"></p>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div v-if="answers.length > 1" class="card">
				<div class="card-body">
					<div v-for="(answer, index) in answers.filter((answer, index) => index != 0)" class="message">
						<div class="message-icon">
							<a v-bind:href="'{$SITE_HOME}profile/' + answer.username + '/'">
								<img v-bind:src="'https://cravatar.eu/helmavatar/' + answer.username + '/500.png'" v-bind:alt="answer.username">
							</a>
						</div>
						<div class="message-content">
							<div class="message-title">
								<a v-bind:style="'color:' + answer.group_username_color + ';'" v-bind:href="'{$SITE_HOME}profile/' + answer.username + '/'">%% answer.username %%</a>
							</div>
							<div class="message-post">
								<p v-html="answer.content.replaceAll('\\r\\n', '<br>')"></p>
							</div>
							<div class="message-meta">
								%% answer.date %%
							</div>
						</div>
					</div>
				</div>
			</div>
		`,
	});

	ticketApp.component('reply', {
		delimiters: ['%%', '%%'],
		data() { return reactive },
		template: `
			<div v-if="status < 4" class="card" id="answerContainer">
				<div class="card-body">
					<div class="message">
						<div class="message-icon">
							<a href="{$LOGGED_IN_USER.profile}">
								<img src="{$LOGGED_IN_USER.avatar}" alt="{$LOGGED_IN_USER.username}">
							</a>
						</div>
						<div class="message-content">
							<div class="message-post">
								<div class="form-group">
									<textarea class="form-control" id="input-answerContent" name="answerContent" placeholder="Reply..."></textarea>
								</div>
								<div class="form-actions">
									<button type="submit" class="btn btn-primary" id="button-addAnswer">{$ANSWER}</button>
								</div>
								<input type="hidden" name="token" value="{$TOKEN}">
							</div>
						</div>
					</div>
				</div>
			</div>
		`
	});

	reactive.aCategories = JSON.parse('{$ASSIGNED_CATEGORIES}');
	ticketApp.component('assigned-categories', {
		delimiters: ['%%', '%%'],
		data() { return reactive },
		template: `
			<span v-for="category in aCategories" class="badge ms-1" v-bind:style="'background: #' + category.color + '; color: #fff;'">
				%% category.text %%
			</span>
		`
	});

	{if (isset($PERMISSIONS.categories) && $PERMISSIONS.categories)}
		reactive.naCategories = {$NOT_ASSIGNED_CATEGORIES};
		ticketApp.component('input-unassign-categories', {
			delimiters: ['%%', '%%'],
			data() { return reactive },
			template: `
				<div class="card card-compact" id="assignedCategories">
					<div class="card-body" style="max-height: 50vh; overflow: hidden scroll;">
						<div v-if="aCategories.length > 0" class="list">
							<div v-for="category in aCategories" class="list-item align-items-center">
								<div class="list-content">
									<div class="list-meta">
										%% category.text %%
									</div>
								</div>
								<div class="list-extra">
									<a href="#" class="btn btn-danger btn-sm btn-sq" v-bind:id="'button-removeCategory-' + category.id">
										<i class="fa fa-trash fa-fw"></i>
									</a>
								</div>
							</div>
						</div>
						<div v-else class="meta">
							{$NO} {$CATEGORIES} {$ASSIGNED}
						</div>
					</div>
				</div>
			`
		});
	{/if}

	{if isset($PERMISSIONS.assign) && $PERMISSIONS.assign}
		reactive.aGroups = {$ASSIGNED_GROUPS};
		reactive.naGroups = {$NOT_ASSIGNED_GROUPS};
		ticketApp.component('input-unassign-groups', {
			delimiters: ['%%', '%%'],
			data() { return reactive },
			template: `
				<div class="card card-compact" id="assignedGroups">
					<div class="card-body" style="max-height: 50vh; overflow: hidden scroll;">
						<div v-if="aGroups.length > 0" class="list">
							<div v-for="group in aGroups" class="list-item align-items-center">
								<div class="list-content">
									<div class="list-meta">
										%% group.text %%
									</div>
								</div>
								<div class="list-extra">
									<a href="#" class="btn btn-danger btn-sm btn-sq" v-bind:id="'button-removeGroup-' + group.id">
										<i class="fa fa-trash fa-fw"></i>
									</a>
								</div>
							</div>
						</div>
						<div v-else class="meta">
							{$NO} {$GROUPS} {$ASSIGNED}
						</div>
					</div>
				</div>
			`
		});
	{/if}

	{if isset($PERMISSIONS.status) && $PERMISSIONS.status}
		ticketApp.component('input-status', {
			delimiters: ['%%', '%%'],
			data() { return reactive },
			template: `
				<div class="form-group">
					<label class="form-label" for="input-status">Status</label>
					<select class="form-control" id="input-status" name="status">
						<option v-bind:selected="status == 1" value="1">{$IN_PROGRESS}</option>
						<option v-bind:selected="status == 2" value="2">{$IMPORTANT}</option>
						<option v-bind:selected="status == 3" value="3">{$PENDING}</option>
						<option v-bind:selected="status == 4" value="4">{$CLOSED}</option>
						<option v-bind:selected="status == 5" value="5">{$SOLVED}</option>
					</select>
				</div>
			`
		});
	{/if}

	ticketApp.mount('#ticketsApp');

</script>


