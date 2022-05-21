{include file='header.tpl'}
{include file='navbar.tpl'}
<style>
    .scale-in-center{ -webkit-animation:scale-in-center .5s cubic-bezier(.25,.46,.45,.94) both;animation:scale-in-center .5s cubic-bezier(.25,.46,.45,.94) both }
    @-webkit-keyframes scale-in-center{ 0% { -webkit-transform:scale(0);transform:scale(0);opacity:1 } 100% { -webkit-transform:scale(1);transform:scale(1);opacity:1 } }@keyframes scale-in-center{ 0% { -webkit-transform:scale(0);transform:scale(0);opacity:1 } 100% { -webkit-transform:scale(1);transform:scale(1);opacity:1 } }
    .ticket-status-icon{
        border-radius: 100%;
        width: 1.5rem !important;
        font-size: 0.92rem;
        height: 1.5rem;
        line-height: 1.65;
        text-align: center;
        margin-right: 0.5rem;
    }
</style>

<!-- Core page -->
<div class="container" id="tickets">
    <div class="card">
        <div class="card-header header-theme">
            {$TICKETS}
            {if $CAN_OPEN}
                <a class="btn btn-theme float-right" href="{$URL}new">
                    {$OPEN_TICKET}
                </a>
            {/if}
        </div>
        <div class="card-body">
            <tickets-page></tickets-page>
        </div>
    </div>
</div>

{include file='footer.tpl'}
<!-- VueJS Script -->
<script src="https://unpkg.com/vue@next"></script>
<script>
    // Needed const
    const userToken = '{$TOKEN}';
    const ticketsUrl = '{$URL}';
    const ticketsApp = Vue.createApp({
        el: '#tickets',
    });

    let searchParams = new URLSearchParams(window.location.search);
    // let param = searchParams.get('p')
    // param.split('/')[0]
    // window.history.pushState('page2', 'Title', searchParams.get('route'));

    // Answers reactive init
    const reactive = Vue.reactive({
        tickets: [],
        ticketsCount: parseInt('{$COUNT}'),
    });

    reactive.page = 1;
    if (searchParams.has('p') && Number.isInteger(parseInt(searchParams.get('p')))) {
        reactive.page = parseInt(searchParams.get('p'));
    }

    // Page component
    ticketsApp.component('tickets-page', {
        delimiters: ['%%', '%%'],
        data() {
            return reactive
        },
        template: `
        <div v-if="tickets.length > 0">
            <tickets></tickets>
            <pagination></pagination>
        </div>
        <div v-else>
                {$EMPTY}
        </div>`,
    });

    // Tickets component
    ticketsApp.component('tickets', {
        delimiters: ['%%', '%%'],
        data() {
            return reactive
        },
        template: `
        <div class="table-responsive">
            <table class="table table-striped">
            <tbody>
            <tr v-for="ticket in tickets">
                <td>
                    <div class="row">
                        <div class="col-5">
                            <a v-bind:href="'{$TICKET_URL}' + ticket.id">
                            <i v-if="ticket.status === '1'" class="fas fa-sync-alt ticket-status-icon" style="background:#FAE800;color:#FFF;"> </i>
                            <i v-if="ticket.status === '2'" class="fas fa-exclamation ticket-status-icon" style="background:#FAB513;color:#FFF;"> </i>
                            <i v-if="ticket.status === '3'" class="fas fa-question ticket-status-icon" style="background:#7AAEFA;color:#FFF;"> </i>
                            <i v-if="ticket.status === '4'" class="fas fa-times ticket-status-icon" style="background:#FA533D;color:#FFF;"> </i>
                            <i v-if="ticket.status === '5'" class="fas fa-check ticket-status-icon" style="background:#6BDB4A;color:#FFF;"> </i>
                            <span class="white-link">%% ticket.title %%</span>
                            </a>
                        </div>
                        <div class="col-7">
                        <span class="float-right">
                            <a class="white-link" v-bind:href="'/profile/' + ticket.username + '/'">%% ticket.username %%</a> - %% ticket.date %%
                        </span>
                        </div>
                    </div>

                </td>
            </tr>
            </tbody>
            </table>
        </div>`,
    });

    // Pagination component
    ticketsApp.component('pagination', {
        delimiters: ['%%', '%%'],
        data() {
            return reactive
        },
        template: `
        <ul class="pagination d-inline-flex">
            <li class="page-item">
            <a v-bind:class="'page-link ' + (page < 2 ? 'disabled' : '')" v-bind:data-page="page-1" href="#" id="previous-page">«</a>
            </li>
            <li class="page-item">
            <a v-if="page == ticketsCount && ticketsCount > 2" class="page-link" v-bind:data-page="page-2" href="#">%% page-2 %%</a>
            </li>
            <li class="page-item">
            <a v-if="page > 1" class="page-link" v-bind:data-page="page-1" href="#">%% page-1 %%</a>
            </li>
            <li class="page-item active">
            <a class="page-link" v-bind:data-page="page" href="#">%% page %%</a>
            </li>
            <li class="page-item">
            <a v-if="page < ticketsCount" class="page-link" v-bind:data-page="page+1" href="#">%% page+1 %%</a>
            </li>
            <li class="page-item">
            <a v-if="page == 1 && ticketsCount > 2" class="page-link" v-bind:data-page="page+2" href="#">%% page+2 %%</a>
            </li>
            <li class="page-item">
            <a v-bind:class="'page-link ' + (ticketsCount == page ? 'disabled' : '')" v-bind:data-page="page+1" href="#" id="next-page">»</a>
            </li>
        </ul>`,
    });

    ticketsApp.mount('#tickets');

    function handleErrors(queryResult) {
        if (queryResult.errors && queryResult.errors.length > 0) {
            $.each(queryResult.errors, function(index, value) {
                toastr["error"](value, "{$ERROR_OCCURED}");
            });
        } else {
            return queryResult.content;
        }
        return null;
    }

    $(document).ready(function () {
        handleErrors({$ERRORS});

        getTickets(reactive.page);

        $('#tickets').on('click', '.page-link:not(.disabled):not(.active)', function() {
            getTickets($(this).attr('data-page'));
            window.history.pushState('Tickets', 'Tickets', '?p=' + reactive.page);
        });
    });

    function getTickets(page) {
        reactive.page = parseInt(page);
        $.ajax({
            type: 'POST',
            data: {
                ajax: 1,
                token: userToken,
                action: 'getTickets',
                parameters: JSON.stringify({
                    page: page,
                }),
            }
        }).done(function (result) {
            if(result && (tickets = handleErrors(JSON.parse(result)))) {
                reactive.tickets = tickets;
            } else {

            }
        }).fail(function () {

        });
    }

</script>
