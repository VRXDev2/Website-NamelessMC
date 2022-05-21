{include file='header.tpl'} {include file='navbar.tpl'}
<div class="container">
    <div class="card">
        <div class="card-header header-theme">{$NEW_RESOURCE}</div>
        <div class="card-body">
            {if isset($ERROR)}
            <div class="alert alert-danger">
                {$ERROR}
            </div>
            {/if}
            <form action="" method="post">
                <div class="form-group">
                    <label for="inputGitHubUsername">{$GITHUB_USERNAME} <small>{$REQUIRED}</small></label>
                    <input type="text" class="form-control" name="github_username" id="inputGitHubUsername">
                </div>
                <div class="form-group">
                    <label for="inputGitHubRepo">{$GITHUB_REPO_NAME} <small>{$REQUIRED}</small></label>
                    <input type="text" class="form-control" name="github_repo" id="inputGitHubRepo">
                </div>
                <div class="form-group">
                    <input type="hidden" name="token" value="{$TOKEN}">
                    <button type="submit" class="btn btn-theme">{$SUBMIT}</button>
                    <a href="{$CANCEL_LINK}" class="btn btn-secondary" onclick="return confirm('{$CONFIRM_CANCEL}');">{$CANCEL}</a>
                </div>
            </form>
        </div>
    </div>
</div>
{include file='footer.tpl'}