<form class="form-horizontal" role="form" method="post" action="{$form_submit}">
    <div class="input-group">
        <input type="text" class="form-control input-sm" name="forum_search" placeholder="{$SEARCH}" minlength="3"
            maxlength="128">
        <input type="hidden" name="token" value="{$TOKEN}">
        <span class="input-group-btn">
            <button type="submit" class="btn btn-theme">
                <i class="fa-solid fa-magnifying-glass"></i>
            </button>
        </span>
    </div>
</form>