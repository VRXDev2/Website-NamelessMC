{include file='header.tpl'} {include file='navbar.tpl'}
<div class="container">
    <ol class="breadcrumb">
        {foreach from=$BREADCRUMBS item=breadcrumb}
        <li{if isset($breadcrumb.active)} class="active"{/if}>{if !isset($breadcrumb.active)}<a class="white-link" href="{$breadcrumb.link}">{/if}{$breadcrumb.forum_title}{if !isset($breadcrumb.active)}</a>{/if}
            </li>
        {/foreach}
    </ol>
    <div class="mb-3">
        <div class="theme-text d-inline-block forum-topic-title mt-1">
            {if count($TOPIC_LABELS)}{foreach from=$TOPIC_LABELS item=label}{$label} {/foreach}{/if}
            {$TOPIC_TITLE}
        </div>
        <span class="float-lg-right d-inline-block post-btns">
            {if isset($CAN_REPLY)}
            <a {if isset($LOCKED) && !isset($CAN_MODERATE)} disabled="disabled" {else} href="#reply_section" {/if}
            class="btn btn-theme{if isset($LOCKED) && !isset($CAN_MODERATE)} disabled{/if}" >{if isset($LOCKED) && !isset($CAN_MODERATE)}<i class="fa-solid fa-lock"></i>
            {/if}{$NEW_REPLY}</a>
            {/if}
            {if isset($UNFOLLOW)}
                <form action="{$UNFOLLOW_URL}" method="post" style="display: inline">
                    <input type="hidden" value="{$TOKEN}" name="token" />
                    <button class="btn btn-secondary">{$UNFOLLOW}</button>
                </form>
              {elseif isset($FOLLOW)}
                <form action="{$FOLLOW_URL}" method="post" style="display: inline">
                    <input type="hidden" value="{$TOKEN}" name="token" />
                    <button class="btn btn-theme">{$FOLLOW}</button>
                </form>
            {/if}
            <div class="btn-group">
            	<button type="button" class="btn dropdown-toggle btn-theme" data-toggle="dropdown" style="vertical-align:baseline;">{$SHARE} <span class="caret"></span></button>
            	    <ul class="dropdown-menu dropdown-menu-right" role="menu">
                    <li><a target="_blank" class="dropdown-item" href="{$SHARE_TWITTER_URL}"><i class="fa-brands fa-twitter"></i> {$SHARE_TWITTER}</a></li>
                    <li><a target="_blank" class="dropdown-item" href="{$SHARE_FACEBOOK_URL}"><i class="fa-brands fa-facebook"></i> {$SHARE_FACEBOOK}</a></li>
            	</ul>
            </div>
            {if isset($CAN_MODERATE)}
            <form action="{$LOCK_URL}" method="post" id="lockTopic" style="display: none">
                <input type="hidden" value="{$TOKEN}" name="token" />
            </form>
            <form action="{$STICK_URL}" method="post" id="stickTopic" style="display: none">
                <input type="hidden" value="{$TOKEN}" name="token" />
            </form>
            <div class="btn-group">
                <button type="button" class="btn dropdown-toggle btn-theme" data-toggle="dropdown">{$MOD_ACTIONS} <span class="caret"></span></button>
            	<ul class="dropdown-menu" role="menu">
                	<li><a class="dropdown-item" type="submit" onclick="document.getElementById('lockTopic').submit()"><i class="fa-solid fa-lock"></i> {$LOCK}</a></li>
                	<li><a class="dropdown-item" href="{$MERGE_URL}"><i class="fa-solid fa-down-left-and-up-right-to-center"></i> {$MERGE}</a></li>
                	<li><a class="dropdown-item" href="#" data-toggle="modal" data-target="#deleteModal"><i class="fa-solid fa-trash"></i> {$DELETE}</a></li>
                	<li><a class="dropdown-item" href="{$MOVE_URL}"><i class="fa-solid fa-arrow-right"></i> {$MOVE}</a></li>
                	<li><a class="dropdown-item" type="submit" onclick="document.getElementById('stickTopic').submit()"><i class="fa-solid fa-thumbtack"></i> {$STICK}</a></li>
            	</ul>
            </div>
            {/if}
        </span>
    </div>
    {if isset($SESSION_SUCCESS_POST)}
        <div class="alert alert-success">
            {$SESSION_SUCCESS_POST}
        </div>
    {/if} {if isset($SESSION_FAILURE_POST)}
        <div class="alert alert-danger">
            {$SESSION_FAILURE_POST}
        </div>
    {/if}
      
      {if isset($ERRORS)}
        <div class="alert alert-danger">
            {foreach from=$ERRORS item=error}
                {$error}<br />
            {/foreach}
        </div>
      {/if}
      {if isset($TOPIC_LOCKED_NOTICE)}
        <div class="alert alert-danger">
            {$TOPIC_LOCKED_NOTICE}
        </div>
    {/if}
    {foreach from=$REPLIES item=reply name=arr}
    <div class="card" id="post-{$reply.id}">
        <div class="row no-gutters">
            <div class="col-lg-3 forum-author-col">
                <div class="forum-left-col text-center">
                    <img class="avatar-img d-block ml-auto mr-auto" style="width:85px; height:85px;" src="{$reply.avatar}" />
                    <a class="username d-block mt-2 mb-2" style="font-size: 1.2rem; {$reply.user_style}" href="{$reply.profile}" data-poload="{$USER_INFO_URL}{$reply.user_id}" data-html="true" data-placement="top">{$reply.username}</a>
                    {if $reply.user_title}
                        <small>{$reply.user_title}</small><br/>
                    {/if}
                    {foreach from=$reply.user_groups item=group}{$group} {/foreach}
                    <div class="card mt-4 text-left">
                        <div class="card-body">
                            {$reply.user_posts_count}<br/> {$reply.user_topics_count}<br />
                            {if count($reply.fields)} {foreach from=$reply.fields item=field} {$field.name}: {$field.value}<br/> {/foreach} {/if}

							{* Badges Module *}
							{if isset($USER_BADGES_LIST)}
								{include file='badges/forum_bdg.tpl'}
							{/if}
							{* /Badges Module *}
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-9">
                <div class="forum-right-col d-flex flex-column align-items-start h-100">
                    <div class="forum-right-top w-100">
                        <span data-toggle="tooltip" data-trigger="hover" data-original-title="{$reply.post_date}">{$reply.post_date_rough}</span>
                        <span class="float-right sm-btns">
                        {if isset($reply.buttons.edit)}
                            <a class="btn btn-secondary" data-toggle="tooltip" data-trigger="hover" data-original-title="{$reply.buttons.edit.TEXT}" href="{$reply.buttons.edit.URL}"><i class="fa-solid fa-pen fa-fw"></i></a>
                        {/if}
                        {if isset($reply.buttons.quote)}
                            <button class="btn btn-secondary" data-toggle="tooltip" data-trigger="hover" data-original-title="{$reply.buttons.quote.TEXT}" onclick="quote({$reply.id});"><i class="fa-solid fa-quote-left fa-fw"></i></button>
                        {/if}
                        {if isset($reply.buttons.report)}
                            <button class="btn btn-secondary" rel="tooltip" data-trigger="hover" data-original-title="{$reply.buttons.report.TEXT}" data-toggle="modal" data-target="#report{$reply.id}Modal"><i class="fa-solid fa-triangle-exclamation fa-fw"></i></button>
                        {/if}
                        {if isset($reply.buttons.spam)}
                            <button class="btn btn-secondary" rel="tooltip" data-trigger="hover" data-original-title="{$reply.buttons.spam.TEXT}" data-toggle="modal" data-target="#spam{$reply.id}Modal"><i class="fa-solid fa-flag fa-fw"></i></button>
                        {/if}
                        {if isset($reply.buttons.delete)}
                        <button class="btn btn-secondary" rel="tooltip" data-trigger="hover" data-original-title="{$reply.buttons.delete.TEXT}" data-toggle="modal" data-target="#delete{$reply.id}Modal"><i class="fa-solid fa-trash fa-fw"></i></button>
                        {/if}
                        </span>
                    </div>
                    <div class="forum-post-content mb-auto w-100">
                        {$reply.content}<br /><br />
                        {if $reply.edited !== null}
                            <small><span rel="tooltip" data-toggle="hover" data-original-title="{$reply.edited_full}">{$reply.edited}</span></small>
                        {/if}
                        {if count($reply.post_reactions)}
                            <span class="float-right" data-toggle="modal" data-target="#reactions{$reply.id}Modal">
                                {foreach from=$reply.post_reactions name="reactions" item=reaction}
                                    {$reaction.html} x {$reaction.count}
                                    {if !($smarty.foreach.reactions.last)} | {/if}
                                {/foreach}
                            </span>
                        {/if}
                        {if $reply.user_id !== $USER_ID} {if isset($REACTIONS) && count($REACTIONS)}
                            <br/>
                            {foreach from=$REACTIONS item=reaction}
                            <form class="d-inline" action="{$REACTIONS_URL}" method="post">
                                <input type="hidden" name="token" value="{$TOKEN}">
                                <input type="hidden" name="reaction" value="{$reaction->id}">
                                <input type="hidden" name="post" value="{$reply.id}">
                                <a href="#" onclick="$(this).closest('form').submit();" style="padding:10px;" rel="tooltip" data-toggle="hover" data-original-title="{$reaction->name}">{$reaction->html}</a>
                            </form>
                            {/foreach}
                        {/if}{/if}
                    </div>
                    <div class="signature w-100 mb-2">
                        {$reply.signature}
                    </div>
                    <div class="post-author-mobile w-100">
                        <img class="avatar-img d-block" style="width:60px; height:60px;" src="{$reply.avatar}" />
                        <div class="ml-3 flex-grow-1">
                            <a class="username d-block mt-1 mb-1" style="font-size: 1.2rem; {$reply.user_style}" href="{$reply.profile}" data-poload="{$USER_INFO_URL}{$reply.user_id}" data-html="true" data-placement="top">{$reply.username}</a>
                            {foreach from=$reply.user_groups item=group}{$group} {/foreach}
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
{/foreach} {$PAGINATION} {if isset($TOPIC_LOCKED_NOTICE)}
<div class="alert alert-info">{$TOPIC_LOCKED_NOTICE}</div>
{/if} {if isset($CAN_REPLY)}
<div class="card">
    <div class="card-header header-theme">{$NEW_REPLY}</div>
    <div class="card-body">
        <div id="reply_section">
            <form action="" method="post">

                {if isset($MARKDOWN)}
                    <div class="form-group">
                      <textarea class="form-control" name="content" id="markdown" >{$CONTENT}</textarea>
                    </div>
                {else}
                    <div class="form-group">
                      <textarea class="form-control" name="content" id="quickreply">{$CONTENT}</textarea>
                    </div>
                {/if}

                <input type="hidden" name="token" value="{$TOKEN}">
                <button type="submit" class="btn btn-theme">{$SUBMIT}</button>
                <button type="button" class="btn btn-secondary" id="quoteButton" onclick="insertQuotes();">
               {$INSERT_QUOTES}
               </button>
            </form>
        </div>
    </div>
</div>
{/if}
</div>
</div>
</div>
</div>

{foreach from=$REPLIES item=reply name=arr}
    
{if count($reply.post_reactions)}
<div class="modal fade" id="reactions{$reply.id}Modal" tabindex="-1" role="dialog" aria-labelledby="reactions{$reply.id}ModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <span class="modal-title" id="reactions{$reply.id}ModalLabel">{$REACTIONS_TEXT}</span>
            </div>
            <div class="modal-body">
                {foreach from=$reply.post_reactions name=reactions item=reaction}
                <strong>{$reaction.html} x {$reaction.count}:</strong>
                <br />{foreach from=$reaction.users item=user}
                <a style="{$user.style}" href="{$user.profile}"><img src="{$user.avatar}" class="avatar-img" style="height:20px;width:20px;" alt="{$user.username}"/> {$user.nickname}</a>
                <br/> {/foreach} {if !($smarty.foreach.reactions.last)}
                <hr/> {/if} {/foreach}
            </div>
        </div>
    </div>
</div>
{/if} {if isset($reply.buttons.report)}
<div class="modal fade" id="report{$reply.id}Modal" tabindex="-1" role="dialog" aria-labelledby="report{$reply.id}ModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <span class="modal-title" id="report{$reply.id}ModalLabel">{$reply.buttons.report.TEXT}</span>
            </div>
            <form action="{$reply.buttons.report.URL}" method="post">
                <div class="modal-body">
                    <div class="form-group">
                        <label for="InputReason">{$reply.buttons.report.REPORT_TEXT} </label>
                        <textarea class="form-control" id="InputReason" name="reason"></textarea>
                    </div>
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">{$CANCEL}</button>
                    <input type="hidden" name="post" value="{$reply.id}">
                    <input type="hidden" name="topic" value="{$TOPIC_ID}">
                    <input type="hidden" name="token" value="{$TOKEN}">
                    <button type="submit" class="btn btn-theme">{$reply.buttons.report.TEXT}</button>
                </div>
            </form>
        </div>
    </div>
</div>
{/if} {if isset($CAN_MODERATE)}
<div class="modal fade" id="spam{$reply.id}Modal" tabindex="-1" role="dialog" aria-labelledby="spam{$reply.id}ModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <span class="modal-title" id="spam{$reply.id}ModalLabel">{$MARK_AS_SPAM}</span>
            </div>
            <div class="modal-body">
                {$CONFIRM_SPAM_POST}
                <form action="{$reply.buttons.spam.URL}" method="post">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">{$CANCEL}</button>
                    <input type="hidden" name="post" value="{$reply.id}">
                    <input type="hidden" name="token" value="{$TOKEN}">
                    <button type="submit" class="btn btn-theme">{$MARK_AS_SPAM}</button>
                </form>
            </div>
        </div>
    </div>
</div>
<div class="modal fade" id="delete{$reply.id}Modal" tabindex="-1" role="dialog" aria-labelledby="delete{$reply.id}ModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <span class="modal-title" id="delete{$reply.id}ModalLabel">{$CONFIRM_DELETE_SHORT}</span>
            </div>
            <div class="modal-body">
                {$CONFIRM_DELETE_POST}<br /><br />
                <form action="{$reply.buttons.delete.URL}" method="post">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">{$CANCEL}</button>
                    <input type="hidden" name="tid" value="{$TOPIC_ID}">
                    <input type="hidden" name="number" value="{$reply.buttons.delete.NUMBER}">
                    <input type="hidden" name="pid" value="{$reply.id}">
                    <input type="hidden" name="token" value="{$TOKEN}">
                    <button type="submit" class="btn btn-theme">{$reply.buttons.delete.TEXT}</button>
                </form>
            </div>
        </div>
    </div>
</div>
{/if} {/foreach}

{if isset($CAN_MODERATE)}
<div class="modal fade" id="deleteModal" tabindex="-1" role="dialog" aria-labelledby="deleteModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <span class="modal-title" id="deleteModalLabel">{$CONFIRM_DELETE_SHORT}</span>
            </div>
            <div class="modal-body">
                {$CONFIRM_DELETE}<br /><br />
                <button type="button" class="btn btn-secondary" data-dismiss="modal">{$CANCEL}</button>
                <form action="{$DELETE_URL}" method="post" id="deleteTopic" style="display: none">
                    <input type="hidden" value="{$TOKEN}" name="token" />
                </form>
                <a type="submit" class="btn btn-theme" onclick="document.getElementById('deleteTopic').submit()">{$DELETE}</a>
            </div>
        </div>
    </div>
</div>
{/if}

{foreach from=$REPLIES item=reply name=arr}{if isset($USER_BADGES_LIST)}
<div class="modal fade" id="badges{$reply.user_id}Modal" tabindex="-1" role="dialog" aria-labelledby="badges{$reply.user_id}ModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <span class="modal-title" id="badges{$reply.user_id}ModalLabel">{$BDG_TITLE} - {$reply.username}</span>
            </div>
            <div class="modal-body">
                <div>
			{foreach from=$USER_BADGES_LIST item=$badges}
				{if $badges.user_id == $reply.user_id}
					<div class="bdg text-center"
						style="background: linear-gradient(to bottom right, {$badges.bdg_color} 0%, {$badges.bdg_color} 100%); color: {$badges.bdg_color};">
						>
						<div class="circle"> {$badges.bdg_icon}</div>
						<div class="ribbon">{$badges.bdg_ribbon}</div>
					</div>
				{/if}
			{/foreach}
			</div>
			<button type="button" class="btn btn-secondary mt-2" data-dismiss="modal">Close</button>
            </div>
        </div>
    </div>
</div>
{/if}{/foreach}
{include file='footer.tpl'}