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


        {if isset($CHANNEL_ID_VIEW)}
            <div class="alert alert-info">
              <div class="content">
                  {$LANG.channel_view_desc} <b>{$CHANNEL_ID_VIEW}</b>
              </div>
            </div>
          {/if}
    
    
          <div class="alert alert-info" id="socializeUploadingIndicator" style="display:none;">
                Please wait! We're creating and uploading media content for your post, if files are bigger size it may take some minutes.
          </div>

            {if $POSTS != null && count($POSTS)}
                {if $USERINFO.userposts.status == 'POST_PUBLISHED'}
                    <div class="alert alert-success">
                        {$LANG.success_post_published_title}
                    </div>
                {/if}

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
                </div>
                
                {if $PAGE_LOAD_MORE == true && empty($CHANNEL_ID_VIEW)}
                    <a href="/socialize/home?page={$PAGE}" class="btn btn-theme">Next page</a>
                {/if}

            {else}
                <div class="alert alert-warning">
                    {$LANG.warning_no_posts_found_title}
                    {$LANG.warning_no_posts_found_desc}
                </div>
            {/if}

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
                            <a class="username socialize-user-large" href="/profile/{$USERINFO.loggeduser.username}/"
                                data-poload="/queries/user/?id={$USERINFO.loggeduser.id}" data-html="true" data-placement="top"
                                style="{$USERINFO.loggeduser.style}">{$USERINFO.loggeduser.username}</a>
                            {if $USERINFO.loggeduser.havePostPerm == true}
                                <button id="newPostButton" class="btn btn-theme btn-block" type="button" href="#"
                                    data-toggle="modal" data-target="#newPost"><i class="fas fa-plus"></i>
                                    {$LANG.new_post_button}</button>
                            {/if}
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

<div class="modal fade" id="newPost" tabindex="-1" role="dialog" aria-labelledby="newPostLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <span class="modal-title" id="newPostLabel">{$LANG.creating_new_post_title}</span>
            </div>
            <div class="modal-body">
                

            <form class="form" action="" method="post" id="newSocializePostForm" enctype="multipart/form-data">
      
            {if $POST_TYPE == 5 || $POST_TYPE == 1}
            <div class="form-group">
              <textarea class="form-control" id="newSocializePostInput" style="resize:none;"rows="6" name="content" placeholder="{$LANG.creating_new_post_placeholder}"></textarea>
            </div>
            {/if}
            {if $POST_TYPE != 5}
              <div class="form-group">
                    <label for="file" class="btn btn-theme">
                        <span id="socializeMediaNum">0</span> {$LANG.file_selected}</label>
                <input class="form-control-file" type="file" id="file" name="mediaFiles[]" multiple style="display:none">
              </div>
            {/if}
            <script type="text/javascript">
            </script>
      
            {if $CHANNELS_ENABLED == 1}
            <div class="form-group">
                <label>{$LANG.Channel}</label>
              <select class="form-control" name="channel">
                {foreach $CHANNELS as $item}
                <option value="{$item.id}">{$item.name}</option>
                {/foreach}
              </select>
            </div>
            {/if}
      
            <div class="form-group">
                <label>{$LANG.sett_visibility_post}</label>
              <select class="form-control" name="optionVisibility">
                <option value="1">{$LANG.sett_opt_everyone}</option>
                <option value="2">{$LANG.sett_opt_loggedin}</option>
              </select>
            </div>
            <div class="form-group mb-4">
            <label>{$LANG.sett_comment_post}</label>
              <select class="form-control" name="optionComment">
                <option value="1">{$LANG.sett_opt_loggedin}</option>
                <option value="2">{$LANG.sett_opt_disabled_comments}</option>
              </select>
            </div>
      
            <input type="hidden" name="token" id="formtoken" value="{$USERINFO.loggeduser.token}">
            <input type="hidden" name="post" value="1">
            <input type="hidden" name="action" value="newPost">
          </form>




                <button class="btn btn-secondary" type="button" data-dismiss="modal">{$LANG.cancel_btn}</button>
                <button class="btn btn-theme" type="button" onclick="submitPost()">{$LANG.post_btn}</button>
            </div>
        </div>
    </div>
</div>


{include file='footer.tpl'}