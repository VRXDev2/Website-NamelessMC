<script type="text/javascript" src="/core/assets/plugins/prism/prism.js"></script>
<script type="text/javascript" src="/core/assets/plugins/tinymce/tinymce.min.js"></script>

{include file='header.tpl'}
{include file='navbar.tpl'}

<div class="container">
    <div class="row">
        <div class="col-lg-3">
        {if $TRENDING_STATUS == 1}
            <div class="card" id="">
                <div class="card-header header-theme"><i class="fas fa-fire"></i> {$LANG.trending_title}</div>
                <div class="card-body">
                    {if $TRENDING == 'Empty'}
                        {$LANG.top_rending_undefined}
                    {else}
                        {foreach from=$TRENDING item=item}
                            <div class="d-flex">
                                <div class="flex-grow-1 mr-3">{$item.name}</div>
                                <div><b>{$item.value}</b></div>
                            </div>
                        {/foreach}
                    {/if}
                </div>
            </div>
            {/if}
            {if $TOP_USERS_STATUS == 1}
            <div class="card" id="">
                <div class="card-header header-theme"><i class="fas fa-medal"></i> {$LANG.top_users_title}</div>
                <div class="card-body">
                    {foreach from=$TOPUSERS item=item}
                        <div class="d-flex">
                            <div class="flex-grow-1 mr-3">{$item.type}</div>
                            <div>
                                <a class="username" href="/profile/{$item.authorUsername}/"
                                    data-poload="/queries/user/?id={$item.authorId}" data-html="true" data-placement="top"
                                    style="{$item.authorStyle}">{$item.authorUsername}</a>
                            </div>
                        </div>
                    {/foreach}
                </div>
            </div>
            {/if}

            {if $CHANNELS_ENABLED == 1}
                <div class="card" id="">
                <div class="card-header header-theme"><i class="far fa-comment-dots"></i> Channels</div>
                  <div class="card-body">
                    <a href="/socialize/home"class="btn btn-theme btn-block" type="button" name="button"><i class="fas fa-home"></i></a>
                        {foreach $CHANNELS as $item}
                          <a class="btn btn-theme btn-block mt-2" href="/socialize/home?channel_id={$item.id}">
                            <span>{$item.name}</span>
                            <b class="badge badge-dark ml-2" style="background-color: rgba(0, 0, 0, 0.2); text-decoration: none;">{$item.posts_count}</b>
                        </a>
                        {/foreach}
                </div>
                </div>
            {/if}
        </div>
        <div class="col-lg-6" id="socialize_post_list">

                <div id="postsSection">
                    {foreach from=$POSTS item=item}
                        <div class="card" id="socialize-post-{$item.id}">
                            <div class="card-header d-flex">
                            <img class="avatar-img mr-3 mt-1 d-inline-block" style="height: 50px; width: auto" src="{$item.authorAvatar}">
                            <div class="flex-grow-1">
                                <a class="username socialize-user" style="{$item.authorStyle}" href="/profile/{$item.authorUsername}/" data-poload="/queries/user/?id={$item.authorId}" data-html="true" data-placement="top">{$item.authorUsername}</a><br />
                                <span data-toggle="tooltip" data-original-title="{$item.time}">{$item.timeAgo}</span>
                            </div>
                            {if $CHANNELS_ENABLED == 1}
                                <style>
                                #ctag-{$item.channel} {
                                  background: {$item.channel_color} !important;
                                  color: {$item.channel_text_color} !important;
                                    padding: .35rem .6rem;
                                    height: 1.5rem;
                                }
                                  </style>
                                  <span id="ctag-{$item.channel}" class="badge">
                                    {$item.channel_name}
                                  </span>
                                {/if}
                            </div>
                            <div class="card-body">
                                {$item.content}

                                {$totalImages=0}
                    {foreach from=$item.images item=image}
                      {if $totalImages >= 2}
                      <br />
                        <a href="/socialize/post?id={$item.id}">
                          <div class="alert alert-info">
                            {$LANG.post_total_media_content|replace:'{x}':{count($item.images)}}
                          </div>
                        </a>
                        {break}
                      {/if}
                      {if $image.ext != 'mp4'}
                        <img class="mediaFile" src="{$image.url_media}{$image.normal_name}{$image.ext}" alt=""><br>
                      {else}
                        <video class="mediaFile" loop="true" autoplay="autoplay" controls muted style="">
                         <source src="{$image.url_media}{$image.normal_name}{$image.ext}" type="video/mp4">
                           {$LANG.video_no_support}
                        </video><br>
                      {/if}
                      {$totalImages=$totalImages+1}
                    {/foreach}

                                <div class="socialize-bottom">
                                <span data-toggle="modal" data-target="#postLikes" onclick="return 0;" style="" class="soc-like cursor-pointer"><span> <i class="fas fa-grin-hearts"></i></span></span>

                                {if $USERINFO.loggeduser.loggedin == 'true'}
                                    {if $item.ownPost == true}
                                        <span onclick="likePost(this, {$item.id}, {$item.authorId}, 1)" style="cursor: not-allowed;"
                                            class="soc-like {if $item.isLiked == true}active{/if} no_selection">{$item.likesCount}
                                                <i class="{if $item.isLiked == true}fas {else} far{/if} fa-heart"></i></span>
                                    {else}
                                        <span onclick="likePost(this, {$item.id}, {$item.authorId}, 0)" style=""
                                            class="cursor-pointer soc-like {if $item.isLiked == true}active{/if} no_selection">{$item.likesCount}
                                                <i class="{if $item.isLiked == true}fas {else} far{/if} fa-heart"></i></span>
                                    {/if}
                                {else}
                                    <span onclick="return false;" style="cursor: not-allowed;"
                                        class="soc-like no_selection">{$item.likesCount} <i
                                                class="{if $item.isLiked == true}fas {else} far{/if} fa-heart"></i></span>
                                {/if}
                                <a href="/socialize/post?id={$item.id}"
                                    class="soc-comment no_selection"><span>{$item.commentsCount} <i
                                            class="far fa-comment"></i></span></a>
                                {if $USERINFO.loggeduser.canDeletePost == 'true' or $item.ownPost == true}
                                    <span onclick="return deletePost({if $USERINFO.loggeduser.canDeletePost == 'true'}1{else}0{/if}, {$item.id})"
                                        class="soc-comment cursor-pointer no_selection"><i class="far fa-trash-alt"></i></span>
                                {/if}
                            </div>

                            </div>
                        </div>
                    {/foreach}

                    {if {$POSTS[0].settingsComments} == 2}
                        <div class="alert alert-danger">
                          {$LANG.comments_disabled_desc}
                        </div>
                        {/if}

                    {if $USERINFO.loggeduser.loggedin == 'true' && {$POSTS[0].settingsComments} != 2}
                      <div class="card" id="socialize-post-comment">
                      <div class="card-header d-flex align-items-center">
                        <img class="avatar-img mr-3 d-inline-block" style="height: 40px; width: auto" src="{$USERINFO.loggeduser.avatar}">
                        <div>
                            <span class="socialize-user" style="font-weight: 500; {$USERINFO.loggeduser.style}">{$USERINFO.loggeduser.username}</span>
                        </div>
                      </div>
                        <div class="card-body">
                
                          {if $USERINFO.loggeduser.haveCommentPerm == true}
                              <form class="form" action="" method="post" id="newSocializeCommentForm">
                                <div class="field">
                                  <textarea id="socializeComment" style="resize:none;width:100%;height:8rem" name="content" rows="2"></textarea>
                                </div>
                                <input type="hidden" name="token" id="formtoken" value="{$USERINFO.loggeduser.token}">
                                <input type="hidden" name="comment" value="1">
                                <input type="hidden" name="action" value="newComment">
                              </form>
                                <a onclick="submitComment()" class="btn btn-theme">{$LANG.comment_button_submit}</a>
                            {else}
                                {$LANG.no_perm_comment}
                            {/if}
                          </div>
                      </div>
                      {/if}

                      {if count($POSTCOMMENTS)}
                        <div class="card" id="socialize-post-{$item.id}">
                        <div class="card-body">
                        {foreach from=$POSTCOMMENTS item=item}
                          <div class="d-flex mb-4 socialize-comment" id="socialize-post-comment-{$item.id}">
                            <img class="avatar-img" style="height:30px; width: auto" src="{$item.authorAvatar}" />
                            <div class="ml-3 flex-grow-1">
                                   <a class="username" href="/profile/{$item.authorUsername}/" data-poload="/queries/user/?id={$item.authorId}" data-html="true" data-placement="top" style="{$item.authorStyle}">{$item.authorUsername}</a> <span class="socialize-date" data-toggle="tooltip" data-original-title="{$item.time}">{$item.timeAgo}</span>
                                   <div class="forum_post">
                                      {$item.content}
                                   </div>
                                   {if $USERINFO.loggeduser.canDeleteComment == 'true' || $item.ownComment == 'true'}
                                   <div class="actions">
                                     <span onclick="return deleteComment({$item.id}, {if $USERINFO.loggeduser.canDeleteComment == 'true'}1{else}0{/if})">{$LANG.delete}</span>
                                   </div>
                                   {/if}
                            </div>
                          </div>
                        {/foreach}
                      </div>
                      </div>
                      {/if}
                </div>

        </div>
        <div class="col-lg-3">
            <div class="card">
                <div class="card-body">
                    <div class="text-center">
                        {if $USERINFO.loggeduser.loggedin == 'false'}
                            <p>{$LANG.login_warning}</p>
                            <a class="btn btn-theme mr-3" href="/login/">{$LANG.login_btn}</a>
                            <a class="btn btn-theme" href="/register/">{$LANG.register_btn}</a>
                        {else}
                            <img class="avatar-img socialize-av-large" src="{$USERINFO.loggeduser.avatar}">
                            <a class="username socialize-user-large mb-0" href="/profile/{$USERINFO.loggeduser.username}/"
                                data-poload="/queries/user/?id={$USERINFO.loggeduser.id}" data-html="true" data-placement="top"
                                style="{$USERINFO.loggeduser.style}">{$USERINFO.loggeduser.username}</a>
                        {/if}
                    </div>
                </div>
            </div>
            {if $USERINFO.loggeduser.loggedin == 'true'}
                <div class="card">
                    <div class="card-header header-theme"><i class="fas fa-chart-bar"></i> {$LANG.stats_title}</div>
                    <div class="card-body">
                        <div class="d-flex">
                            <div class="flex-grow-1 mr-3"><i class="far fa-paper-plane"></i>
                                {$LANG.stats_total_published_posts}</div>
                            <div><b>{$USERINFO.loggeduser.totalPosts}</b></div>
                        </div>
                        <div class="d-flex">
                            <div class="flex-grow-1 mr-3"><i class="far fa-comment"></i> {$LANG.stats_total_commented_posts}
                            </div>
                            <div><b>{$USERINFO.loggeduser.totalCommentedPosts}</b></div>
                        </div>
                        <div class="d-flex">
                            <div class="flex-grow-1 mr-3"><i class="far fa-heart"></i> {$LANG.stats_total_liked_posts}</div>
                            <div><b>{$USERINFO.loggeduser.totalLikes}</b></div>
                        </div>
                        <div class="d-flex">
                            <div class="flex-grow-1 mr-3"><i class="far fa-heart"></i> {$LANG.stats_total_received_likes}
                            </div>
                            <div><b>{$USERINFO.loggeduser.totalReceivedLikes}</b></div>
                        </div>
                    </div>
                </div>
            {/if}
        </div>
    </div>
</div>

<div class="modal fade" id="postLikes" tabindex="-1" role="dialog" aria-labelledby="postLikesLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <span class="modal-title" id="postLikesLabel">{$LANG.liked_by_post}</span>
            </div>
            <div class="modal-body">
                
            {if $LIKEDLIST.error == 1}
              <p>{$LIKEDLIST.message}</p>
            {/if}
            {if $LIKEDLIST.error != 1}
              {foreach from=$LIKEDLIST item=item}
              <a class="username" href="/profile/{$item.authorUsername}/" data-poload="/queries/user/?id={$item.authorId}" data-html="true" data-placement="top">
                <img class="avatar-img" src="{$item.authorAvatar}" alt="{$item.authorUsername}" style="height: 25px; width: auto"> {$item.authorUsername}
              </a><br />
              {/foreach}
            {/if}

                <button class="btn btn-secondary mt-3" type="button" data-dismiss="modal">{$LANG.close_btn}</button>
            </div>
        </div>
    </div>
</div>


{include file='footer.tpl'}