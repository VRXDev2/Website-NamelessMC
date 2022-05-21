{include file='header.tpl'} {include file='navbar.tpl'}
<div class="container">
    <div class="row">
        <div class="col-lg-9">
            <ol class="breadcrumb">
                {foreach from=$BREADCRUMBS item=breadcrumb}
                    <li {if isset($breadcrumb.active)}class="active" {/if}>{if !isset($breadcrumb.active)}<a
                            class="white-link"
                            href="{$breadcrumb.link}">{/if}{$breadcrumb.forum_title}{if !isset($breadcrumb.active)}</a>{/if}
                    </li>
                {/foreach}
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

        <div
            class="{if count($WIDGETS_LEFT) && count($WIDGETS_RIGHT)}col-lg-6{elseif count($WIDGETS_LEFT) || count($WIDGETS_RIGHT)}col-lg-9{else}col-lg-12{/if}">
            {if !empty($SUBFORUMS)}
                <div class="card">
                    <div class="card-header header-theme">{$SUBFORUM_LANGUAGE}</div>
                    <div class="card-body">
                        <div class="card forum-index-card">
                            <div class="card-body">

                                {foreach from=$SUBFORUMS item=subforum name=subforums}
                                    <div class="row">
                                        <div class="col-9 col-md-4">
                                            <a class="forum-link white-link" href="{$subforum.link}">{$subforum.title}</a>
                                        </div>
                                        <div class="col-3 col-md-2">
                                            {$TOPICS|@ucfirst}: <b>{$subforum.topics}</b>
                                        </div>
                                        <div class="col-8 col-md-6 col-inv">
                                            {if count($subforum.latest_post)}
                                                <a class="white-link"
                                                    href="{$subforum.latest_post.link}">{$subforum.latest_post.title}</a>
                                                <br /><small><span data-toggle="tooltip" data-trigger="hover"
                                                        data-original-title="{$subforum.latest_post.time}">{$subforum.latest_post.timeago}</span>
                                                    {$BY} <a style="{$subforum.latest_post.last_user_style}"
                                                        href="{$subforum.latest_post.last_user_link}"
                                                        data-poload="{$USER_INFO_URL}{$subforum.latest_post.last_user_id}"
                                                        data-html="true"
                                                    data-placement="top">{$subforum.latest_post.last_user}</a></small> {else}
                                            {$NO_TOPICS} {/if}
                                        </div>
                                    </div>
                                    {if !$smarty.foreach.subforums.last}
                                    <hr />{/if}
                                {/foreach}
                            </div>
                        </div>
                    </div>
                </div>
            {/if}
            <div class="card">
                <div class="card-header header-theme">{$TOPICS|@ucfirst}{if $NEW_TOPIC_BUTTON}<span
                            class="float-right"><a href="{$NEW_TOPIC_BUTTON}"
                            class="btn btn-theme btn-sm">{$NEW_TOPIC}</a></span>{/if}</div>
                <div class="card-body">
                    {$NO_TOPICS}
                </div>
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
{include file='footer.tpl'}