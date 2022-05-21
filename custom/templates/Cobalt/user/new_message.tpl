{include file='header.tpl'} {include file='navbar.tpl'}
<div class="container">
    <div class="row">
        <div class="col-lg-3">
            {include file='user/navigation.tpl'}
        </div>
        <div class="col-lg-9">
            {if isset($ERROR)}
            <div class="alert alert-danger">
                {$ERROR}
            </div>
            {/if}
            <div class="card">
                <div class="card-header header-theme">{$NEW_MESSAGE}</div>
                <div class="card-body">
                    <form action="" method="post">
                        <div class="form-group">
                            <label for="inputTitle">{$MESSAGE_TITLE}</label>
                            <input type="text" id="inputTitle" class="form-control" name="title"
                                value="{$MESSAGE_TITLE_VALUE}">
                        </div>
                        <div class="form-group">
                            <label for="InputTo">{$TO} <small><em>{$SEPARATE_USERS_WITH_COMMAS}</em></small></label>
                            <input class="form-control" type="text" id="InputTo" name="to" {if
                                isset($TO_USER)}value="{$TO_USER}" {/if}> </div> <script type="text/javascript">
                            let allUsers = [{$ALL_USERS}];
                            </script>
                            {if !isset($MARKDOWN)}
                            <div class="form-group">
                                <textarea style="width:100%" name="content" id="reply" rows="15">{$CONTENT}</textarea>
                            </div>
                            {else}
                            <div class="form-group">
                                <textarea class="form-control" style="width:100%" id="markdown" name="content"
                                    rows="15">{$CONTENT}</textarea>
                                <span class="float-right"><i data-toggle="popover" data-placement="top" data-html="true"
                                        data-content="{$MARKDOWN_HELP}" class="fa fa-question-circle text-info"
                                        aria-hidden="true"></i></span>
                            </div>
                            {/if}
                            <div class="form-group mb-0">
                                <input type="hidden" name="token" value="{$TOKEN}">
                                <button type="submit" class="btn btn-theme">{$SUBMIT}</button>
                                <a href="{$CANCEL_LINK}" onclick="return confirm('{$CONFIRM_CANCEL}');"
                                    class="btn btn-secondary">{$CANCEL}</a>
                            </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
{include file='footer.tpl'}