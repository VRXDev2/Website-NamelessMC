{include file='header.tpl'} {include file='navbar.tpl'}
<div class="container">
    <div class="row">
        <div class="col-md-9">
            <div class="card">
                <div class="card-header header-theme">
                    <div class="d-flex">
                        <img src="{$RESOURCE_ICON}" alt="{$RESOURCE_NAME}" style="height: 60px">
                        <div class="flex-grow-1 ml-3">
                            {$VIEWING_ALL_RELEASES}<br />[{$RELEASE_TAG}] {$RESOURCE_SHORT_DESCRIPTION}
                        </div>
                    </div>
                </div>
                <div class="card-body">

                    <ul class="nav nav-tabs resource-tabs mb-2" id="myTab" role="tablist">
                        <li class="nav-item">
                            <a class="btn btn-secondary profile-btn mr-2" href="{$OVERVIEW_LINK}">{$OVERVIEW_TITLE}</a>
                        </li>
                        <li class="nav-item">
                            <a class="btn btn-secondary profile-btn mr-2 active"
                                href="{$OTHER_RELEASES_LINK}">{$RELEASES_TITLE}</a>
                        </li>
                        <li class="nav-item">
                            <a class="btn btn-secondary profile-btn mr-2" href="{$VERSIONS_LINK}">{$VERSIONS_TITLE}</a>
                        </li>
                        <li class="nav-item">
                            <a class="btn btn-secondary profile-btn mr-2" href="{$REVIEWS_LINK}">{$REVIEWS_TITLE}</a>
                        </li>
                    </ul>

                    {foreach from=$RELEASES item=release}
                        <div class="card">
                            <div class="card-body">
                                <a class="white-link" href="{$release.url}">{$release.name}</a>
                                <span class="float-right" data-toggle="tooltip" data-trigger="hover"
                                    data-original-title="{$release.date_full}">{$release.date}</span>
                                <hr />
                                {$release.description}
                                <br /> {$release.downloads} &bull;
                                <div class="star-rating view d-inline">
                                    <span class="far fa-star" data-rating="1"></span>
                                    <span class="far fa-star" data-rating="2"></span>
                                    <span class="far fa-star" data-rating="3"></span>
                                    <span class="far fa-star" data-rating="4"></span>
                                    <span class="far fa-star" data-rating="5"></span>
                                    <input type="hidden" name="rating" class="rating-value" value="{$release.rating}">
                                </div>
                            </div>
                        </div>
                    {/foreach} {$PAGINATION}
                </div>
            </div>
        </div>
        <div class="col-md-3">

            <div class="card">
                <div class="card-header header-theme">{$RESOURCE}</div>
                <div class="card-body" style="font-size: 0.9rem;">
                    <div class="item">
                        <span class="text">{$VIEWS}</span>
                        <div class="description float-right"><b>{$VIEWS_VALUE}</b></div>
                    </div>
                    <div class="item">
                        <span class="text">{$TOTAL_DOWNLOADS}</span>
                        <div class="description float-right"><b>{$TOTAL_DOWNLOADS_VALUE}</b></div>
                    </div>
                    <div class="item">
                        <span class="text">{$FIRST_RELEASE}</span>
                        <div class="description float-right"><b>{$FIRST_RELEASE_DATE}</b></div>
                    </div>
                    <div class="item">
                        <span class="text">{$LAST_RELEASE}</span>
                        <div class="description float-right"><b>{$LAST_RELEASE_DATE}</b></div>
                    </div>
                    <div class="item">
                        <span class="text">{$CATEGORY}</span>
                        <div class="description float-right"><b>{$CATEGORY_VALUE}</b></div>
                    </div>
                    <div class="item">
                        <span class="text">{$RATING}</span>
                        <div class="description float-right">
                            <div class="star-rating view">
                                <span class="far fa-star" data-rating="1" style="color:gold;"></span>
                                <span class="far fa-star" data-rating="2" style="color:gold"></span>
                                <span class="far fa-star" data-rating="3" style="color:gold;"></span>
                                <span class="far fa-star" data-rating="4" style="color:gold;"></span>
                                <span class="far fa-star" data-rating="5" style="color:gold;"></span>
                                <input type="hidden" name="rating" class="rating-value" value="{$RATING_VALUE}">
                            </div>
                        </div>
                    </div>

                </div>
            </div>

            <div class="card">
                <div class="card-header header-theme">{$RELEASE_VERSION}</div>
                <div class="card-body" style="font-size: 0.9rem;">

                    <div class="item">
                        <span class="text">{$DOWNLOADS}</span>
                        <div class="description float-right"><b>{$RELEASE_DOWNLOADS}</b></div>
                    </div>
                    <div class="item">
                        <span class="text">{$RELEASE}</span>
                        <div class="description float-right"><b>{$RELEASE_DATE_FULL}</b></div>
                    </div>
                    <div class="item">
                        <span class="text">{$RATING}</span>
                        <div class="description float-right">
                            <div class="star-rating view">
                                <span class="far fa-star" data-rating="1" style="color:gold;"></span>
                                <span class="far fa-star" data-rating="2" style="color:gold"></span>
                                <span class="far fa-star" data-rating="3" style="color:gold;"></span>
                                <span class="far fa-star" data-rating="4" style="color:gold;"></span>
                                <span class="far fa-star" data-rating="5" style="color:gold;"></span>
                                <input type="hidden" name="rating" class="rating-value" value="{$RELEASE_RATING}">
                            </div>
                        </div>
                    </div>
                </div>
            </div>


            <div class="card">
                <div class="card-header header-theme">{$AUTHOR}</div>
                <div class="card-body text-center">
                    <a href="{$AUTHOR_PROFILE}"><img src="{$AUTHOR_AVATAR}" class="avatar-img"
                                alt="{$AUTHOR_NICKNAME}" style="max-height:80px; max-width:80px;" /></a><br />
                        <a class="username d-inline-block mt-2 mb-4" href="{$AUTHOR_PROFILE}" style="{$AUTHOR_STYLE}">{$AUTHOR_NICKNAME}</a>
                    <a class="btn btn-secondary btn-block" href="{$AUTHOR_RESOURCES}">&raquo; {$VIEW_OTHER_RESOURCES}</a>
                </div>
            </div>
        </div>
    </div>
</div>

{include file='footer.tpl'}