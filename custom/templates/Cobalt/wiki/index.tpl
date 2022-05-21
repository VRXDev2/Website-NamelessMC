{include file='header.tpl'}
{include file='navbar.tpl'}
<div class="container">
    <div class="row">
        <div class="col-lg-9">
            {if $PAGE_RESULT == 1}
            <ol class="breadcrumb">
                    {if $WP_TYPE}
                        <li><a href="{$WIKI_HOME_LINK}" class="white-link">{$WIKI}</a></li>
                        <div class="divider" style="margin: 0 12px"> / </div>
                        <li class="active"><a href="../{$WP_CATID}" class="white-link">{$WP_PARENT}</a></li>
                        <div class="divider" style="margin: 0 12px"> / </div>
                        <li class="active"><a href="{$WP_NAMEID}" class="white-link">{$WP_TITLE}</a></li>
                    {else}
                        <li><a href="{$WIKI_HOME_LINK}" class="white-link">{$WIKI}</a></li>
                        <div class="divider" style="margin: 0 12px"> / </div>
                        <li class="active"><a href="{$WP_NAMEID}" class="white-link">{$WP_TITLE}</a></li>
                    {/if}
            </ol>
            {/if}
            {if $PAGE_RESULT !== 1}
            <div class="card">
                <div class="card-header header-theme">{$WIKI}</div>
                <div class="card-body">
                    {if $PAGE_RESULT == 0}
                        {$HOME_PAGE_CONTEXT}
                    {elseif $PAGE_RESULT == 2}
                        {$WP_404_MESSAGE}
                    {/if}
                </div>
            </div>
            {else}
            
            <div class="card wiki-page-card">
                <div class="card-body pt-0">
            
                    {$WP_CONTEXT}<hr />
                    <div class="views-box wiki-views mt-0"><i class="fa-solid fa-eye"></i> {$WP_VIEWS}</div>
                    {if isset($LIKEABLE) && $LIKEABLE == '1'}
                        <div class="replies-box wiki-replies mt-0">
                        <span style="cursor:pointer" class="{if !isset($LOGGED)}disabled{/if} {if isset($LIKED) && $LIKED == 'true'}text-white unlike{elseif !isset($LIKED) || $LIKED == 'false'}like{/if}" id="like" aria-pressed="false" data-id="{$WP_NAMEID}">
                            <i class="fa-solid fa-thumbs-up"></i> <span id="likes_counter">{$WP_LIKES}</span>
                        </span>  
                        </div>
                    {/if}
                    {if isset($PANEL)}
                        <a class="btn btn-theme float-right" href="/panel/wiki/?action=edit&id={$WP_ID}" target="_blank">Edit</a>
                    {/if}
                </div>
            </div>
            {/if}
        </div>
        <div class="col-lg-3">
            {include file='wiki/widgets/search-box.tpl'}
            {include file='wiki/widgets/side-menu.tpl'}
        </div>
    </div>
</div>
{*
<div class="ui mini modal">
        <div class="header">{$ALL_LIKES} {$WP_TITLE}</div>
        <div class="list content">
            <div class="description">
                {if {$LIKES|@count} == 0}
                    {$NO_LIKES_MESSAGE}
                {elseif {$LIKES|@count} >= 1}
                    <ul>
                        {foreach from=$LIKES item=liker}
                            <li>{$liker->username}</li>
                        {/foreach}
                    </ul>
                {/if}
            </div>
        </div>
    </div>
*}
{include file='footer.tpl'}
<script>

$(document).ready(function() {
  
  var likeButton = $('#like');
  var ajaxActionUrl = "/queries/like";

  $(likeButton).on('click', function(e){
    var pageid = $(this).data('id');
    $post = $(this);
    if(likeButton.hasClass("like")){
      $.ajax({
        url: ajaxActionUrl,
        type: 'POST',
        contentType: 'application/json',
        data: JSON.stringify({
          liked: 1,
          pageid: pageid
        }),
        success: function(response){
          var likesNum = parseInt($('#likes_counter').text());
          $('#likes_counter').text(likesNum+1);
          $post.addClass('primary');
          likeButton.removeClass('like');
          likeButton.addClass('unlike');
          likeButton.addClass('text-white');
          
        
          	Swal.fire({
		titleText: 'You liked the ' + pageid + ' page successfully!',
		icon: 'success',
		toast: true,
		position: 'bottom-start',
		timer: 3000,
		showConfirmButton: false,
		customClass: {
		    container: 'wiki-toast'
		}
	});
	
	
        },
        error: function (result) {
            alert("failure" + result);
        }
      });
    } else if(likeButton.hasClass("unlike")){
      $.ajax({
        url: ajaxActionUrl,
        type: 'POST',
        contentType: 'application/json',
        data: JSON.stringify({
          unliked: 1,
          pageid: pageid
        }),
        success: function(response){
          var likesNum = parseInt($('#likes_counter').text());
          $('#likes_counter').text(likesNum-1);
          $post.removeClass('primary');
          likeButton.removeClass('text-white');
          likeButton.addClass('like');
          likeButton.removeClass('unlike');
         
                    	Swal.fire({
		titleText: 'You unliked the ' + pageid + ' page successfully!',
		icon: 'success',
		toast: true,
		position: 'bottom-start',
		timer: 3000,
		showConfirmButton: false,
		customClass: {
		    container: 'wiki-toast'
		}
	});
          
          
        },
        error: function (result) {
            alert("failure" + result);
        }
      });
    }
  });
});

</script>