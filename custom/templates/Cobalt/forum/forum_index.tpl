{include file='header.tpl'} {include file='navbar.tpl'}
<div class="container">
    <div class="row">
        <div class="col-lg-9">
            <ol class="breadcrumb">
                <li><a class="grey-link" href="{$BREADCRUMB_URL}">{$BREADCRUMB_TEXT}</a></li>
            </ol>
        </div>
        <div class="col-lg-3">
            {include file='forum/search_box.tpl' form_submit=$SEARCH_URL}
        </div>
    </div>

    <div class="row">
        {if count($WIDGETS_LEFT)}
            <div class="col-lg-3">
                {foreach from=$WIDGETS_LEFT item=widget}
                    {$widget}
                {/foreach}
            </div>
        {/if}

        <div class="{if count($WIDGETS_LEFT) && count($WIDGETS_RIGHT)}col-lg-6{elseif count($WIDGETS_LEFT) || count($WIDGETS_RIGHT)}col-lg-9{else}col-lg-12{/if}">

            {if isset($SPAM_INFO)}
                <div class="alert alert-info">{$SPAM_INFO}</div>
            {/if}
            <div class="card forum-index-card">
            {foreach from=$FORUMS key=category item=forum}
                {assign var=counter value=1}
                    {if !empty($forum.subforums)}
                        <div class="card-header header-theme">
                            {if empty({$forum.icon})}<i class="fa-solid fa-folder-open"></i>{else}{$forum.icon}{/if}
                            <a class="theme-text" href="{$forum.link}">{$forum.title}</a>
                        </div>
                        <div class="card-body">
                            <div class="card">
                                <div class="card-body">
                            {foreach from=$forum.subforums item=subforum}
                                <div class="row">
                                    <div class="col-2 col-md-1 col-md-1_5 forum-icon-col">
                                        {if empty($subforum->icon)}<i class="fa-solid fa-comment"></i>{else}{$subforum->icon}{/if}
                                    </div>
                                    <div class="col-10 col-md-5">
                                        <a class="forum-link white-link" href="{if !isset($subforum->redirect_confirm)}{$subforum->link}
                                                                    {else}#" data-toggle="modal"
                                                data-target="#confirmRedirectModal{$subforum->id}{/if}">{$subforum->forum_title}</a><br /><span
                                            class="subforum-description">{$subforum->forum_description}</span>
                                    </div>
                                    <div class="col-4 col-md-2 col-inv">
                                        {$TOPICS|@ucfirst}: <b>{$subforum->topics}</b><br />
                                        {$POSTS|@ucfirst}: <b>{$subforum->posts}</b>
                                    </div>
                                    {if $subforum->redirect_forum neq 1}
                                        <div class="col-8 col-md-4 col-md-4_5 col-inv">
                                            {if isset($subforum->last_post)}
                                                <div class="d-flex">
                                                    <div>
                                                        <a href="{$subforum->last_post->profile}"><img alt="{$subforum->last_post->profile}"
                                                    style="height:45px; width:45px;" class="avatar-img"
                                                    src="{$subforum->last_post->avatar}" /></a>
                                                    </div>
                                                    <div class="flex-grow-1 ml-2">
                                                        <a class="white-link" href="{$subforum->last_post->link}">{$subforum->last_post->title}</a><br />
                                                        <a style="{$subforum->last_post->user_style}" href="{$subforum->last_post->profile}"
                                                        data-poload="{$USER_INFO_URL}{$subforum->last_post->post_creator}" data-html="true"
                                                        data-placement="top">{$subforum->last_post->username}</a> &bull; <span data-toggle="tooltip" data-trigger="hover"
                                                        data-original-title="{$subforum->last_post->post_date}">{$subforum->last_post->date_friendly}</span>
                                                    </div>
                                                </div>
                                            {else} 
                                                {$NO_TOPICS}
                                            {/if}
                                        </div>
                                    {/if}
                                </div>
                                {if isset($subforum->subforums)}
                                    <br /> {assign var=sf_counter value=1}
                                    <div class="row">
                                        {foreach from=$subforum->subforums item=sub_subforum}
                                            <div class="col-md-6 col-lg-4">
                                                <div class="card mb-0" style="background-color: rgba(0,0,0,0.05);">
                                                    <div class="card-body pt-2 pb-2 pl-3 pr-3">
                                                        <i class="fa-solid fa-folder-open"></i>&nbsp;&nbsp;<a class="white-link"
                                                    href="{$sub_subforum->link}">{$sub_subforum->title}</a>
                                                    </div>
                                                </div>

                                                {assign var=sf_counter value=$sf_counter+1}

                                            </div>
                                            {if $sf_counter eq 4}
                                            </div>
                                            <div class="row">
                                            {/if}
                                        {/foreach}
                                    </div>
                                    {/if} {if ($forum.subforums|@count) != $counter}
                                <hr /> {/if}
                                {assign var=counter value=$counter+1}
                            {/foreach}
                                </div>
                            </div>
                        </div>
                    {/if}
            {/foreach}
            </div>
        </div>

        {if count($WIDGETS_RIGHT)}
            <div class="col-lg-3">
                {foreach from=$WIDGETS_RIGHT item=widget}
                    {$widget}
                {/foreach}
            </div>
        {/if}

    </div>
</div>

{if $subforum->redirect_forum neq 1}
{else}
    <div class="modal fade" id="confirmRedirectModal{$subforum->id}" tabindex="-1" role="dialog"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-body">
                    {$subforum->redirect_confirm}
                    <button type="button" class="btn btn-secondary mt-4"
                        data-dismiss="modal">{$NO}</button>
                    <a class="btn btn-theme mt-4" href="{$subforum->redirect_url}" target="_blank"
                        rel="noopener nofollow">{$YES}</a>
                </div>
            </div>
        </div>
    </div>
{/if}

{include file='footer.tpl'}