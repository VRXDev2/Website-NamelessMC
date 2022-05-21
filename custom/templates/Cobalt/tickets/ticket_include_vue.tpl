<script>
    // Needed const
    const userToken = '{$TOKEN}';
    const ticketId = '{$TICKET_ID}';
    const ticketApp = Vue.createApp({
        el: '#ticket',
    });

    // Answers reactive init
    const reactive = Vue.reactive({
        answers: [],
        status: parseInt('{$TICKET[0]->status}'),
    });

    // Status component
    ticketApp.component('status', {
        delimiters: ['%%', '%%'],
        data() {
            return reactive
        },
        template: `
        <i v-if="status == 1" class="fas fa-sync-alt ticket-status-icon mt-0" style="background:#FAE800;color:#FFF;"> </i>
        <i v-if="status == 2" class="fas fa-exclamation ticket-status-icon mt-0" style="background:#FAB513;color:#FFF;"> </i>
        <i v-if="status == 3" class="fas fa-question ticket-status-icon mt-0" style="background:#7AAEFA;color:#FFF;"> </i>
        <i v-if="status == 4" class="fas fa-times ticket-status-icon mt-0" style="background:#FA533D;color:#FFF;"> </i>
        <i v-if="status == 5" class="fas fa-check ticket-status-icon mt-0" style="background:#6BDB4A;color:#FFF;"> </i>`
    });

    // Answers component
    ticketApp.component('answers', {
        delimiters: ['%%', '%%'],
        data() {
            return reactive
        },
        template: `
        <div v-for="answer in answers" id="topic-post" class="card">
                <div class="row no-gutters">
                    <div class="col-lg-3 col-xl-2 forum-author-col">
                        <div class="forum-left-col text-center">
                            <img class="avatar-img" style="max-width:100px; max-height:100px;" v-bind:src="'https://cravatar.eu/helmavatar/' + answer.username + '/200.png'" v-bind:alt="answer.username">
                            <br><br>
                            <a class="username" style="color:#F90404; " v-bind:href="'/profile/' + answer.username + '/'" data-html="true" data-placement="top">%% answer.username %%</a>
                            <br> <span v-html="answer.group_html"></span>
                            <br>
                            <hr> {$IGN}: %% answer.username %%<br>
                        </div>
                    </div>
                    <div class="col-lg-9 col-xl-10">
                        <div class="forum-right-col d-flex flex-column align-items-start h-100">
                            <div class="forum-right-top w-100">
                                <div class="ticket-mobile-author">
                                    <img class="avatar-img d-inline-block mr-1" style="width: 20px; height:20px;" v-bind:src="'https://cravatar.eu/helmavatar/' + answer.username + '/30.png'" v-bind:alt="answer.username">
                                    <a class="username" style="color:#F90404; " v-bind:href="'/profile/' + answer.username + '/'" data-html="true" data-placement="top">%% answer.username %%</a>
                                </div>
                                <span>%% answer.date %%</span>
                            </div>
                            <div class="forum-post-content mb-auto w-100">
                                <span v-html="answer.content.replaceAll('\\r\\n', '<br>')">%% answer.content %%</span>
                            </div>
                        </div>
                    </div>
                </div>
        </div>`,
    });

    ticketApp.component('reply', {
        delimiters: ['%%', '%%'],
        data() {
            return reactive
        },
        template: `
        <div id="answerContainer" class="card" v-if="status < 4">
            <div class="card-header header-theme">{$ANSWER}</div>
            <div class="card-body">
                <div id="reply_section">
                    <textarea class="form-control w-100 mb-4" rows="2" style="height: 100px;" maxlength="1024" id="answerContent"></textarea>
                    <button type="submit" class="btn btn-theme addAnswer" id="addAnswer">{$ANSWER}</button>
                </div>
            </div>
        </div>`
    });

    // -- VueJS assigned & not assigned categories --

    // Assigned categories list init
    reactive.aCategs = {$ASSIGNED_CATEGORIES};

    // Assigned categories component for users
    ticketApp.component('assigned-categs', {
        delimiters: ['%%', '%%'],
        data() {
            return reactive
        },
        template: `
        <span v-for="categ in aCategs" class="badge scale-in-center" v-bind:style="'background:#' + categ.color + ';color:#F0F0F0;margin-bottom:0.2rem;margin-right:0.2rem;'">
            %% categ.text %%
        </span>`
    });

    {if isset($PERMISSIONS['categories']) && $PERMISSIONS['categories']}
        // Not assigned categories list init
        reactive.naCategs = {$NOT_ASSIGNED_CATEGORIES};

        // Assigned categories component
        ticketApp.component('a-categ', {
            delimiters: ['%%', '%%'],
            data() {
                return reactive
            },
            template: `
            <div id="assignedCategories" class="ui segments" style="max-height:50vh;overflow:hidden scroll;">
                <div v-if="aCategs.length < 1">
                    {$NO} {$CATEGORIES} {$ASSIGNED}
                </div>
                <div class="table-responsive">
                    <table class="table table-striped">
                        <tr v-for="categ in aCategs">
                            <td>
                                <div class="d-flex">
                                    <span class="my-auto">%% categ.text %%</span>
                                    <div v-bind:id="categ.id" class="ml-auto btn btn-danger removeCateg">
                                        <i class="fa fa-trash"></i>
                                    </div>
                                </div>
                            </td>
                        </tr>
                    </table>
                </div>
            </div>`
        });
    {/if}

    {if isset($PERMISSIONS['assign']) && $PERMISSIONS['assign']}
        // -- VueJS assigned & not assigned groups --

        // Assigned categories list init
        reactive.aGroups = {$ASSIGNED_GROUPS};
        // Not assigned categories list init
        reactive.naGroups = {$NOT_ASSIGNED_GROUPS};

        // Assigned categories component
        ticketApp.component('a-groups', {
            delimiters: ['%%', '%%'],
            data() {
                return reactive
            },
            template: `
            <div id="assignedGroups" style="max-height:50vh;overflow:hidden scroll;">
                <div v-if="aGroups.length < 1">
                    {$NO} {$GROUPS} {$ASSIGNED}
                </div>
                <div class="table-responsive" style="margin-top: 10px">
                    <table class="table table-striped">
                        <tr v-for="group in aGroups">
                            <td>
                                <div class="d-flex">
                                    <span class="my-auto">%% group.text %%</span>
                                    <div v-bind:id="group.id" class="ml-auto btn btn-danger removeGroup">
                                        <i class="fa fa-trash"></i>
                                    </div>
                                </div>
                            </td>
                        </tr>
                    </table>
                </div>
            </div>`
        });
    {/if}

    {if isset($PERMISSIONS['status']) && $PERMISSIONS['status']}
        // Status modal component
        ticketApp.component('status-modal', {
            delimiters: ['%%', '%%'],
            data() {
                return reactive
            },
            template: `
            <div class="input-group mb-3">
                <div class="input-group-prepend">
                    <div class="input-group-text">
                        <input id="in-progress" type="radio" value="1" class="btn-check" name="status" autocomplete="off" v-bind:checked="status == 1">
                    </div>
                </div>
                <label class="form-control" for="in-progress"><i class="fas fa-sync-alt status-icon" style="background:#FAE800;color:#FFF;margin-right:0.8rem;"> </i>{$IN_PROGRESS}</label>
            </div>
            <div class="input-group mb-3">
                <div class="input-group-prepend">
                    <div class="input-group-text">
                        <input id="important" type="radio" class="btn-check" name="status" value="2" autocomplete="off" v-bind:checked="status == 2">
                    </div>
                </div>
                <label class="form-control" for="important"><i class="fas fa-exclamation status-icon" style="background:#FAB513;color:#FFF;margin-right:0.8rem;"> </i>{$IMPORTANT}</label>
            </div>
            <div class="input-group mb-3">
                <div class="input-group-prepend">
                    <div class="input-group-text">
                        <input id="pending" type="radio" class="btn-check" name="status" value="3" autocomplete="off" v-bind:checked="status == 3">
                    </div>
                </div>
                <label class="form-control" for="pending"><i class="fas fa-question status-icon" style="background:#7AAEFA;color:#FFF;margin-right:0.8rem;"> </i>{$PENDING}</label>
            </div>
            <div class="input-group mb-3">
                <div class="input-group-prepend">
                    <div class="input-group-text">
                        <input id="closed" type="radio" class="btn-check" name="status" value="4" autocomplete="off" v-bind:checked="status == 4">
                    </div>
                </div>
                <label class="form-control" for="closed"><i class="fas fa-times status-icon" style="background:#FA533D;color:#FFF;margin-right:0.8rem;"> </i>{$CLOSED}</label>
            </div>
            <div class="input-group mb-3">
                <div class="input-group-prepend">
                    <div class="input-group-text">
                        <input id="solved" type="radio" class="btn-check" name="status" value="5" autocomplete="off" v-bind:checked="status == 5">
                    </div>
                </div>
                <label class="form-control" for="solved"><i class="fas fa-check status-icon" style="background:#6BDB4A;color:#FFF;margin-right:0.8rem;"> </i>{$SOLVED}</label>
            </div>`
        });
    {/if}

    ticketApp.mount('#ticket');
</script>


