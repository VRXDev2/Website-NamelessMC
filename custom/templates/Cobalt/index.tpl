{include file='header.tpl'} {include file='navbar.tpl'}
<div class="container">
    {if isset($THEME_ENABLE_SLIDER) && $THEME_ENABLE_SLIDER|count_characters > 2}
        <div class="carousel slide cobalt-carousel" id="carousel" data-ride="carousel">
            <ol class="carousel-indicators">
                <li data-target="#carousel" data-slide-to="0" class="active"></li>
                {if isset($THEME_ENABLE_SLIDER2) && $THEME_ENABLE_SLIDER2|count_characters > 2}
                    <li data-target="#carousel" data-slide-to="1"></li>
                {/if} {if isset($THEME_ENABLE_SLIDER3) && $THEME_ENABLE_SLIDER3|count_characters > 2}
                    <li data-target="#carousel" data-slide-to="2"></li>
                {/if} {if isset($THEME_ENABLE_SLIDER4) && $THEME_ENABLE_SLIDER4|count_characters > 2}
                    <li data-target="#carousel" data-slide-to="3"></li>
                {/if} {if isset($THEME_ENABLE_SLIDER5) && $THEME_ENABLE_SLIDER5|count_characters > 2}
                    <li data-target="#carousel" data-slide-to="4"></li>
                {/if}
            </ol>
            <div class="carousel-inner">
                
                    <div class="carousel-item active">
                        {if isset($THEME_SLIDER1_LINK) && $THEME_SLIDER1_LINK|count_characters > 0}
                            <a href="{$THEME_SLIDER1_LINK}" {if isset($THEME_SLIDER1_LINK_OPEN) && $THEME_SLIDER1_LINK_OPEN eq 'yes'}target="_blank"{/if}>
                            {/if}
                            <picture>
                                {if isset($THEME_SLIDER1_IMAGE_WEBP) && $THEME_SLIDER1_IMAGE_WEBP|count_characters > 4}
                                <source srcset="{$THEME_SLIDER1_IMAGE_WEBP}" type="image/webp">{/if}
                                <source srcset="{$THEME_SLIDER1_IMAGE}">
                                <img class="d-block w-100" alt="Slide #1" src='{$THEME_SLIDER1_IMAGE}'>
                            </picture>
                            <div class="carousel-caption d-none d-md-block">
                                {if isset($THEME_SLIDER1_TITLE) && $THEME_SLIDER1_TITLE|count_characters > 0}
                                <h1 class="slider-title">{$THEME_SLIDER1_TITLE}</h1>
                                {/if}
                                {if isset($THEME_SLIDER1_DESCRIPTION) && $THEME_SLIDER1_DESCRIPTION|count_characters > 0}
                                    <p class="col-inv slider-desc">{$THEME_SLIDER1_DESCRIPTION}</p>
                                {/if}
                            </div>
                            {if isset($THEME_SLIDER1_LINK) && $THEME_SLIDER1_LINK|count_characters > 0}
                        </a> {/if}
                    </div>
                    {if isset($THEME_ENABLE_SLIDER2) && $THEME_ENABLE_SLIDER2|count_characters > 2}
                    <div class="carousel-item">
                        {if isset($THEME_SLIDER2_LINK) && $THEME_SLIDER2_LINK|count_characters > 0}
                            <a href="{$THEME_SLIDER2_LINK}" {if isset($THEME_SLIDER2_LINK_OPEN) && $THEME_SLIDER2_LINK_OPEN eq 'yes'}target="_blank"{/if}>
                            {/if}
                            <picture>
                                {if isset($THEME_SLIDER2_IMAGE_WEBP) && $THEME_SLIDER2_IMAGE_WEBP|count_characters > 4}
                                <source srcset="{$THEME_SLIDER2_IMAGE_WEBP}" type="image/webp">{/if}
                                <source srcset="{$THEME_SLIDER2_IMAGE}">
                                <img class="d-block w-100" alt="Slide #2" src='{$THEME_SLIDER2_IMAGE}'>
                            </picture>
                            <div class="carousel-caption d-none d-md-block">
                                {if isset($THEME_SLIDER2_TITLE) && $THEME_SLIDER2_TITLE|count_characters > 0}
                                <h1 class="slider-title">{$THEME_SLIDER2_TITLE}</h1>
                                {/if}
                                {if isset($THEME_SLIDER2_DESCRIPTION) && $THEME_SLIDER2_DESCRIPTION|count_characters > 0}
                                    <p class="col-inv slider-desc">{$THEME_SLIDER2_DESCRIPTION}</p>
                                {/if}
                            </div>
                            {if isset($THEME_SLIDER2_LINK) && $THEME_SLIDER2_LINK|count_characters > 0}
                        </a> {/if}
                    </div>
                    {/if} {if isset($THEME_ENABLE_SLIDER3) && $THEME_ENABLE_SLIDER3|count_characters > 2}
                    <div class="carousel-item">
                        {if isset($THEME_SLIDER3_LINK) && $THEME_SLIDER3_LINK|count_characters > 0}
                            <a href="{$THEME_SLIDER3_LINK}" {if isset($THEME_SLIDER3_LINK_OPEN) && $THEME_SLIDER3_LINK_OPEN eq 'yes'}target="_blank"{/if}>
                            {/if}
                            <picture>
                                {if isset($THEME_SLIDER3_IMAGE_WEBP) && $THEME_SLIDER3_IMAGE_WEBP|count_characters > 4}
                                <source srcset="{$THEME_SLIDER3_IMAGE_WEBP}" type="image/webp">{/if}
                                <source srcset="{$THEME_SLIDER3_IMAGE}">
                                <img class="d-block w-100" alt="Slide #3" src='{$THEME_SLIDER3_IMAGE}'>
                            </picture>
                            <div class="carousel-caption d-none d-md-block">
                                {if isset($THEME_SLIDER3_TITLE) && $THEME_SLIDER3_TITLE|count_characters > 0}
                                <h1 class="slider-title">{$THEME_SLIDER3_TITLE}</h1>
                                {/if}
                                {if isset($THEME_SLIDER3_DESCRIPTION) && $THEME_SLIDER3_DESCRIPTION|count_characters > 0}
                                    <p class="col-inv slider-desc">{$THEME_SLIDER3_DESCRIPTION}</p>
                                {/if}
                            </div>
                            {if isset($THEME_SLIDER3_LINK) && $THEME_SLIDER3_LINK|count_characters > 0}
                        </a> {/if}
                    </div>
                    {/if} {if isset($THEME_ENABLE_SLIDER4) && $THEME_ENABLE_SLIDER4|count_characters > 2}
                    <div class="carousel-item">
                        {if isset($THEME_SLIDER4_LINK) && $THEME_SLIDER4_LINK|count_characters > 0}
                            <a href="{$THEME_SLIDER4_LINK}" {if isset($THEME_SLIDER4_LINK_OPEN) && $THEME_SLIDER4_LINK_OPEN eq 'yes'}target="_blank"{/if}>
                            {/if}
                            <picture>
                                {if isset($THEME_SLIDER4_IMAGE_WEBP) && $THEME_SLIDER4_IMAGE_WEBP|count_characters > 4}
                                <source srcset="{$THEME_SLIDER4_IMAGE_WEBP}" type="image/webp">{/if}
                                <source srcset="{$THEME_SLIDER4_IMAGE}">
                                <img class="d-block w-100" alt="Slide #4" src='{$THEME_SLIDER4_IMAGE}'>
                            </picture>
                            <div class="carousel-caption d-none d-md-block">
                                {if isset($THEME_SLIDER4_TITLE) && $THEME_SLIDER4_TITLE|count_characters > 0}
                                <h1 class="slider-title">{$THEME_SLIDER4_TITLE}</h1>
                                {/if}
                                {if isset($THEME_SLIDER4_DESCRIPTION) && $THEME_SLIDER4_DESCRIPTION|count_characters > 0}
                                    <p class="col-inv slider-desc">{$THEME_SLIDER4_DESCRIPTION}</p>
                                {/if}
                            </div>
                            {if isset($THEME_SLIDER4_LINK) && $THEME_SLIDER4_LINK|count_characters > 0}
                        </a> {/if}
                    </div>
                    {/if} {if isset($THEME_ENABLE_SLIDER5) && $THEME_ENABLE_SLIDER5|count_characters > 2}
                    <div class="carousel-item">
                        {if isset($THEME_SLIDER5_LINK) && $THEME_SLIDER5_LINK|count_characters > 0}
                            <a href="{$THEME_SLIDER5_LINK}" {if isset($THEME_SLIDER5_LINK_OPEN) && $THEME_SLIDER5_LINK_OPEN eq 'yes'}target="_blank"{/if}>
                            {/if}
                            <picture>
                                {if isset($THEME_SLIDER5_IMAGE_WEBP) && $THEME_SLIDER5_IMAGE_WEBP|count_characters > 4}
                                <source srcset="{$THEME_SLIDER5_IMAGE_WEBP}" type="image/webp">{/if}
                                <source srcset="{$THEME_SLIDER5_IMAGE}">
                                <img class="d-block w-100" alt="Slide #5" src='{$THEME_SLIDER5_IMAGE}'>
                            </picture>
                            <div class="carousel-caption d-none d-md-block">
                                {if isset($THEME_SLIDER5_TITLE) && $THEME_SLIDER5_TITLE|count_characters > 0}
                                <h1 class="slider-title">{$THEME_SLIDER5_TITLE}</h1>
                                {/if}
                                {if isset($THEME_SLIDER5_DESCRIPTION) && $THEME_SLIDER5_DESCRIPTION|count_characters > 0}
                                    <p class="col-inv slider-desc">{$THEME_SLIDER5_DESCRIPTION}</p>
                                {/if}
                            </div>
                            {if isset($THEME_SLIDER5_LINK) && $THEME_SLIDER5_LINK|count_characters > 0}
                        </a> {/if}
                    </div>
                {/if}
            </div>
        </div>
    {/if}

    {if isset($HOME_SESSION_FLASH)}
        <div class="alert alert-info">
            {$HOME_SESSION_FLASH}
        </div>
        {/if} {if isset($HOME_SESSION_ERROR_FLASH)}
        <div class="alert alert-danger">
            {$HOME_SESSION_ERROR_FLASH}
        </div>
    {/if}
    {if isset($GHOST)}
        {include file='ghost/index.tpl'}
    {else}
    <div class="row">

        {if count($WIDGETS_LEFT)}
            <div class="col-lg-3">
                {foreach from=$WIDGETS_LEFT item=widget}
                    {$widget}
                {/foreach}
            </div>
        {/if}

        <div class="{if count($WIDGETS_LEFT) && count($WIDGETS_RIGHT)}col-lg-6{elseif count($WIDGETS_LEFT) || count($WIDGETS_RIGHT)}col-lg-9{else}col-lg-12{/if}">

            {if $NEWS != null && count($NEWS)}
                {foreach from=$NEWS item=item}
                    <a href="{$item.url}">
                    <div class="card">
                        <div class="card-header news-header">
                            <div class="news-flex">
                                {if $item.label}
                                <div class="news-badge-col">
                                    <div class="news-badge">{$item.label}</div>
                                </div>
                                {/if}
                                <div class="news-text">
                                    <a class="news-title" href="{$item.url}">{$item.title}</a>
                                </div>
                                <div class="info{if $THEME_FULL_BODY_AVATARS == "no"} pt-1{/if}">
                                    <div class="news-info">
                                        <div class="author">
                                            <a class="username" data-poload="{$USER_INFO_URL}{$item.author_id}" data-html="true" data-placement="top" href="{$item.author_url}" style="{$item.author_style}">{$item.author_name}</a>
                                        </div>
                                        <div class="time">
                                            <span data-toggle="tooltip" title="{$item.date}">{$item.time_ago}</span>
                                        </div>
                                    </div>
                                </div>
                                <div class="avatar">
                                    <a href="{$item.author_url}" data-poload="{$USER_INFO_URL}{$item.author_id}"
                                        data-html="true" data-placement="top">
                                        {if $THEME_FULL_BODY_AVATARS == "yes"}
                                            <img class="full-body" src="https://mc-heads.net/body/{$item.author_name}/left" alt="{$item.author_name}" />
                                        {else}
                                            <img class="avatar-img" style="height: 50px" src="{$item.author_avatar}" alt="{$item.author_name}">
                                        {/if}
                                    </a>
                                </div>
                            </div>
                        </div>
                        <div class="card-body forum_post">
                            {$item.content}
                            <div class="views-box"><i class="fa-solid fa-eye"></i> {$item.views}</div>
                            <div class="replies-box"><i class="fa-solid fa-comments"></i> {$item.replies}</div>
                            <a class="btn btn-secondary btn-read-more-news float-right" href="{$item.url}">{$READ_FULL_POST} <i class="fa-solid fa-share"></i></a>
                        </div>
                    </div>
                    </a>
                {/foreach}

            {/if}
            {if $NEWS|@count < 1} <div class="alert alert-danger">
                    {$NEWS_ERROR_TITLE} {$NEWS_ERROR_DESC}
                </div>
            {else}
                {if isset($THEME_NEWS_BTN) && $THEME_NEWS_BTN|count_characters > 2}
                    <div class="text-center">
                        <a class="btn btn-theme btn-read-more-news mb-4" href="{$THEME_NEWS_LINK}">{$NEWS_BUTTON}</a>
                    </div>
                {/if}
            {/if}
            
        </div>
        
        {if count($WIDGETS_RIGHT)}
            <div class="col-lg-3">
                {foreach from=$WIDGETS_RIGHT item=widget}
                    {$widget}
                {/foreach}
            </div>
        {/if}

    </div>
    {/if}
</div>
{include file='footer.tpl'}