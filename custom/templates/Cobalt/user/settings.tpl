{include file='header.tpl'} {include file='navbar.tpl'}
<div class="container">
    <div class="row">
        <div class="col-lg-3">
            {include file='user/navigation.tpl'}
        </div>
        <div class="col-lg-9">
            {if isset($ERRORS)}
                <div class="alert alert-danger">
                    {foreach from=$ERRORS item=error} {$error}
                    <br /> {/foreach}
                </div>
            {/if}
            {if !empty($SUCCESS)}
                <div class="alert alert-success">
                    {$SUCCESS}
                </div>
            {/if}
            <div class="card">
                <div class="card-header header-theme">{$SETTINGS}</div>
                <div class="card-body">
                    <form action="" method="post">
                        {nocache}

                        {if isset($TOPIC_UPDATES)}
                            <div class="form-group">
                                <label for="inputTopicUpdates">{$TOPIC_UPDATES}</label>
                                <select class="form-control" name="topicUpdates" id="inputTopicUpdates">
                                    <option value="1" {if ($TOPIC_UPDATES_ENABLED==true)} selected {/if}>{$ENABLED}</option>
                                    <option value="0" {if ($TOPIC_UPDATES_ENABLED==false)} selected {/if}>{$DISABLED}
                                    </option>
                                </select>
                            </div>
                        {/if}

                        <div class="form-group">
                            <label for="inputLanguage">{$ACTIVE_LANGUAGE}</label>
                            <select name="language" id="inputLanguage" class="form-control">
                                {foreach from=$LANGUAGES item=language}
                                    <option value="{$language.name}" {if $language.active == true} selected{/if}>
                                        {$language.name}</option>
                                {/foreach}
                            </select>
                        </div>

                        {if isset($CUSTOM_AVATARS)}
                            <div class="form-group">
                                <label for="inputGravatar">{$GRAVATAR}</label>
                                <select class="form-control" name="gravatar" id="inputGravatar">
                                    <option value="0" {if ($GRAVATAR_VALUE == '0')} selected{/if}>{$DISABLED}</option>
                                    <option value="1" {if ($GRAVATAR_VALUE == '1')} selected{/if}>{$ENABLED}</option>
                                </select>
                            </div>
                        {/if}

                        {if count($TEMPLATES) > 1}
                            <div class="form-group">
                                <label for="inputTemplate">{$ACTIVE_TEMPLATE}</label>
                                <select class="form-control" name="template" id="inputTemplate">
                                    {foreach from=$TEMPLATES item=template}
                                        <option value="{$template.id}" {if $template.active == true} selected{/if}>
                                            {$template.name}</option>
                                    {/foreach}
                                </select>
                            </div>
                        {/if}

                        <div class="form-group">
                            <label for="inputTimezone">{$TIMEZONE}</label>
                            <select name="timezone" class="form-control" id="inputTimezone">
                                {foreach from=$TIMEZONES key=KEY item=ITEM}
                                    <option value="{$KEY}" {if $SELECTED_TIMEZONE eq $KEY} selected{/if}>
                                        ({$ITEM.offset}) - {$ITEM.name} ({$ITEM.time})
                                    </option>
                                {/foreach}
                            </select>
                        </div>
                        {if isset($PRIVATE_PROFILE)}
                            <div class="form-group">
                                <label for="inputPrivateProfile">{$PRIVATE_PROFILE}</label>
                                <select name="privateProfile" class="form-control" id="inputPrivateProfile">
                                    <option value="1" {if $PRIVATE_PROFILE_ENABLED == true} selected {/if}>{$ENABLED}
                                    </option>
                                    <option value="0" {if $PRIVATE_PROFILE_ENABLED == false} selected {/if}>{$DISABLED}
                                    </option>
                                </select>
                            </div>
                        {/if}
                        {foreach from=$PROFILE_FIELDS item=field}
                            <div class="form-group">
                                {if !isset($field.disabled)}
                                    <label for="input{$field.id}">{$field.name}</label> {if $field.type == "text"}
                                        <input type="text" class="form-control" name="{$field.id}" id="input{$field.id}"
                                        value="{$field.value}" placeholder="{$field.name}"> {else if $field.type == "textarea"}
                                        <textarea class="form-control" name="{$field.id}"
                                        id="input{$field.id}">{$field.value}</textarea> {else if $field.type == "date"}
                                        <input name="{$field.id}" id="input{$field.id}" value="{$field.value}" type="text"
                                        class="form-control datepicker"> {/if}
                                {/if}
                            </div>
                        {/foreach}
                        {if isset($SIGNATURE)}
                            <label for="inputSignature">{$SIGNATURE}</label> {if !isset($MARKDOWN)}
                                <textarea style="width:100%" name="signature" id="inputSignature"
                                rows="15">{$SIGNATURE_VALUE}</textarea><br /> {else}
                                <div class="form-group">
                                    <textarea class="form-control" style="width:100%" id="inputSignature" name="signature"
                                        rows="20">{$SIGNATURE_VALUE}</textarea>
                                    <span class="float-right"><i data-toggle="popover" data-placement="top" data-html="true"
                                            data-content="{$MARKDOWN_HELP}" class="fa fa-question-circle text-info"
                                            aria-hidden="true"></i></span>
                                </div>
                            {/if}
                        {/if}
                        {/nocache}
                        <div class="form-group">
                            <input type="hidden" name="action" value="settings">
                            <input type="hidden" name="token" value="{$TOKEN}">
                            <button type="submit" class="btn btn-theme">{$SUBMIT}</button>
                        </div>
                    </form>
                </div>
            </div>
            <div class="card">
                <div class="card-header header-theme">{$CHANGE_EMAIL_ADDRESS}</div>
                <div class="card-body">
                    <form action="" method="post" id="form-user-email">
                        <div class="form-group">
                            <label for="inputPassword">{$CURRENT_PASSWORD}</label>
                            <input type="password" name="password" id="inputPassword" class="form-control">
                        </div>
                        <div class="form-group">
                            <label for="inputEmail">{$EMAIL_ADDRESS}</label>
                            <input type="email" name="email" id="inputEmail" value="{$CURRENT_EMAIL}"
                                class="form-control">
                        </div>
                        <input type="hidden" name="action" value="email">
                        <input type="hidden" name="token" value="{$TOKEN}">
                        <button type="submit" class="btn btn-theme">{$SUBMIT}</button>
                    </form>
                </div>
            </div>
            <div class="card">
                <div class="card-header header-theme">{$CHANGE_PASSWORD}</div>
                <div class="card-body">
                    <form action="" method="post">
                        <div class="form-group">
                            <label for="inputOldPassword">{$CURRENT_PASSWORD}</label>
                            <input type="password" name="old_password" id="inputOldPassword" class="form-control">
                        </div>

                        <div class="form-group">
                            <label for="inputNewPassword">{$NEW_PASSWORD}</label>
                            <input type="password" name="new_password" id="inputNewPassword" class="form-control">
                        </div>

                        <div class="form-group">
                            <label for="inputNewPasswordAgain">{$CONFIRM_NEW_PASSWORD}</label>
                            <input type="password" name="new_password_again" id="inputNewPasswordAgain"
                                class="form-control">
                        </div>

                        <input type="hidden" name="action" value="password">
                        <input type="hidden" name="token" value="{$TOKEN}">
                        <button type="submit" class="btn btn-theme">{$SUBMIT}</button>
                    </form>
                </div>
            </div>
            {if $DISCORD_INTEGRATION}
                <div class="card">
                    <div class="card-header header-theme">
                        {$DISCORD_LINK}
                        {if $DISCORD_LINKED}
                            <span class="badge badge-success float-right">{$LINKED}</span>
                        {else if isset($PENDING_LINK)}
                            <span class="badge badge-warning float-right">{$PENDING_LINK}</span>
                        {else}
                            <span class="badge badge-danger float-right">{$NOT_LINKED}</span>
                        {/if}
                    </div>
                    <div class="card-body">
                        {if $DISCORD_LINKED}
                            <p><strong>{$DISCORD_USERNAME}:</strong> {$DISCORD_USERNAME_VALUE}</p>
                        {/if}
                        <form action="" method="post">
                            <input type="hidden" name="action" value="discord">
                            <input type="hidden" name="token" value="{$TOKEN}">
                            {if $DISCORD_LINKED}
                                <input type="hidden" name="unlink" value="true">
                                <button type="submit" class="btn btn-secondary">{$UNLINK}</button>
                            {else}
                                <button type="submit" class="btn btn-theme">{$LINK}</button>
                            {/if}
                        </form>
                    </div>
                </div>
            {/if}
            <div class="card">
                <div class="card-header header-theme">{$TWO_FACTOR_AUTH}</div>
                <div class="card-body">
                    {nocache}
                    {if isset($ENABLE)}
                        <a class="btn btn-theme" href="{$ENABLE_LINK}">{$ENABLE}</a>
                    {elseif isset($FORCED)}
                        <button class="btn btn-secondary" disabled>{$DISABLE}</button>
                    {else}
                        <a class="btn btn-secondary" href="{$DISABLE_LINK}">{$DISABLE}</a>
                    {/if}
                    {/nocache}
                </div>
            </div>
            {if isset($CUSTOM_AVATARS)}
                <div class="card">
                    <div class="card-header header-theme">{$UPLOAD_NEW_PROFILE_IMAGE}</div>
                    <div class="card-body">
                        <form action="{$CUSTOM_AVATARS_SCRIPT}" method="post" enctype="multipart/form-data">
                            <div class="form-group">
                                <label class="btn btn-secondary">
                                    {$BROWSE} <input type="file" name="file" hidden />
                                </label>
                            </div>
                            <div class="form-group">
                                <input type="hidden" name="token" value="{$TOKEN}">
                                <input type="hidden" name="type" value="avatar">
                                <button type="submit" class="btn btn-theme">{$SUBMIT}</button>
                            </div>
                        </form>
                    </div>
                </div>
            {/if}
        </div>
    </div>
</div>
{include file='footer.tpl'}