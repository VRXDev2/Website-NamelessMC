{include file='header.tpl'}
{include file='navbar.tpl'}


<div class="container">
    
        <a class="btn mt-2 {if !isset($SELECT_CATEGORY_ID)}btn-theme{else}btn-secondary{/if}" id="cat" href="{$ALL_LINK}">{$SHOW_ALL}</a>
      {foreach from=$CATEGORY_LIST item=category}
        <a class="btn mt-2 {if $SELECT_CATEGORY_ID === $category.id}btn-theme{else}btn-secondary{/if}" id="cat{$category.id}" href="{$category.link}">{$category.name}</a>
      {/foreach}
    
  <div class="row">

    {foreach from=$VIDEO_LIST item=video}

    <div class="col-lg-6 col-xl-4 mb-4 mt-4 text-center">
      
      <div style="cursor: pointer" class="d-inline-block">
        <div class="text-center theme-text mb-2" style="font-size: 1.2rem; font-weight: 500">{$video.name}</div>
        <img class="rounded d-block" src="http://img.youtube.com/vi/{$video.code}/mqdefault.jpg" alt="video" data-toggle="modal" data-target="#modal{$video.id}">
      </div>
    </div>

    {/foreach}

  </div>
  {$PAGINATION}

</div>


{foreach from=$VIDEO_LIST item=video}

      <div class="modal fade" id="modal{$video.id}" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg" role="document">
          <div class="modal-content">
            <div class="modal-body">

              <div class="embed-responsive embed-responsive-16by9 z-depth-1-half">
                <iframe class="embed-responsive-item" src="https://youtube.com/embed/{$video.code}"
                allowfullscreen></iframe>
              </div>
              <div class="caption text-center mt-3">{$video.description}</div>
            </div>
          </div>
        </div>
      </div>
{/foreach}


{include file='footer.tpl'}