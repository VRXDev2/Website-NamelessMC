







{include file='header.tpl'}
{include file='navbar.tpl'}

<div class="container">
    <div class="card">
        <div class="card-header header-theme">
            {$UPDATE_RESOURCE}
            <a href="{$CANCEL_LINK}" class="btn btn-theme btn-sm float-right" onclick="return confirm('{$CONFIRM_CANCEL}');">{$CANCEL}</a>
        </div>
        <div class="card-body">


        {if isset($ERROR)}
            <div class="alert alert-danger">
                {$ERROR}
            </div>
        {/if}

        <form action="" method="post" enctype="multipart/form-data">
            <div class="form-group">
                <label>{$RELEASE_TYPE}:</label>
            </div>
            <div class="form-group">
                <div class="ui radio checkbox">
                    <input type="radio" name="type" id="local" value="local" checked="checked" hidden>
                    <label for="local">{$ZIP_FILE}</label>
                </div>
            </div>
            <div class="form-group">
                <input type="file" class="inputFile" name="resourceFile" id="uploadFileButton" accept=".zip,application/zip" hidden onchange="$('#fileName').html(this.files[0].name)" />
                <label class="btn btn-theme" for="uploadFileButton">
                    <span id="fileName">{$CHOOSE_FILE} ({$ZIP_ONLY})</span>
                </label>
            </div>
            
            {if $GITHUB_LINKED}
            <div class="form-group">
                <div class="ui radio checkbox">
                    <input type="radio" name="type" id="github" value="github" hidden>
                    <label for="github">{$GITHUB_RELEASE}</label>
                </div>
            </div>
            <div class="form-group">
              <select name="release" class="ui selection dropdown" id="inputRelease">
                {foreach from=$RELEASES item=release}
                <option value="{$release.id}">{$release.tag} - {$release.name}</option>
                {/foreach}
              </select>
            </div>
            {/if}
                
            <div class="form-group">
                <div class="ui radio checkbox">
                    <input type="radio" name="type" id="external_link" value="external_link" hidden>
                    <label for="external_link">{$EXTERNAL_LINK}</label>
                </div>
            </div>
            <div class="form-group">
                <input class="form-control" type="text" name="link" id="inputLink" placeholder="{$EXTERNAL_LINK}">
            </div>

            <div class="form-group">
                <label for="inputVersion">{$VERSION_TAG}</label>
                <input class="form-control" type="text" name="version" id="inputVersion" value="{$VERSION_VALUE}">
            </div>
            
            <div class="form-group">
                <label for="inputTitle">{$UPDATE_TITLE}</label>
                <input class="form-control" type="text" name="title" id="inputTitle" value="{$TITLE_VALUE}">
            </div>

            <div class="form-group">
                <label for="{if isset($MARKDOWN)}markdown{else}content{/if}">{$UPDATE_INFORMATION}</label>
                {if !isset($MARKDOWN)}
                    <textarea style="width:100%" name="content" id="content" rows="15">{$CONTENT_VALUE}</textarea>
                {else}
                    <textarea style="width:100%" id="markdown" name="content" rows="15">{$CONTENT_VALUE}</textarea>
                    <span class="float-right"><i data-toggle="popover" data-placement="top" data-html="true" data-content="{$MARKDOWN_HELP}" class="fa fa-question-circle text-info" aria-hidden="true"></i></span>
                {/if}
            </div>

            <div class="form-group">
                <input type="hidden" name="token" value="{$TOKEN}">
                <button type="submit" class="btn btn-theme">{$SUBMIT}</button>
            </div>

        </form>
        </div>
    </div>
</div>


{include file='footer.tpl'}