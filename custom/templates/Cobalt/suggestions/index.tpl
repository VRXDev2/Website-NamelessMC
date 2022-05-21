{include file='header.tpl'}
{include file='navbar.tpl'}

<div class="container">
    <div class="row">
        <div class="col-lg-9">
            <div class="card">
                <div class="card-header header-theme">
                    {$SUGGESTIONS}
                    <a class="btn btn-theme float-right" href="{$NEW_SUGGESTION_LINK}">{$NEW_SUGGESTION}</a>

                    <div class="btn-group float-right" style="margin-right: 10px">
                        <button type="button" class="btn dropdown-toggle btn-theme" data-toggle="dropdown">{$SORT_BY} {$SORT_BY_VALUE} <span class="caret"></span></button>
                        <ul class="dropdown-menu" role="menu">
                            <li><a rel="noopener nofollow" class="dropdown-item"
                                    href="{$SORT_NEWEST_LINK}">{$NEWEST}</a></li>
                            <li><a rel="noopener nofollow" class="dropdown-item"
                                    href="{$SORT_RECENT_ACTIVITY_LINK}">{$RECENT_ACTIVITY}</a></li>
                            <li><a rel="noopener nofollow" class="dropdown-item" 
                                    href="{$SORT_LIKES_LINK}">{$LIKES}</a></li>
                        </ul>
                    </div>
                </div>
                <div class="card-body">
                    {if isset($SUGGESTIONS_LIST)}
                        <div class="table-responsive">
                            <table class="table table-striped">
                                <thead>
                                    <tr>
                                        <th style="width: 15%">{$STATUS}</th>
                                        <th style="width: 40%">{$SUGGESTION_TITLE}</th>
                                        <th style="width: 20%">{$STATS}</th>
                                        <th style="width: 25%">{$LAST_REPLY}</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    {foreach from=$SUGGESTIONS_LIST item=suggestion}
                                        <tr>
                                            <td>
                                                {$suggestion.status}
                                            </td>
                                            <td>
                                                <a class="white-link" href="{$suggestion.link}">{$suggestion.title}</a><br />
                                                <span data-toggle="tooltip" data-content="{$suggestion.created}">{$suggestion.created_rough}</span>
                                                {$BY} <a class="username" style="{$suggestion.author_style}"
                                                    href="{$suggestion.author_link}">{$suggestion.author_username}</a>
                                            </td>

                                            <td>
                                                <strong>{$suggestion.likes}</strong> {$LIKES}<br />
                                                <strong>{$suggestion.dislikes}</strong> {$DISLIKES}
                                            </td>

                                            <td>
                                                <span data-toggle="tooltip"
                                                    data-content="{$suggestion.updated}">{$suggestion.updated_rough}</span>
                                                {$BY} <a class="username" style="{$suggestion.updated_by_style}"
                                                    href="{$suggestion.updated_by_link}">{$suggestion.updated_by_username}</a>
                                            </td>
                                        </tr>
                                    {/foreach}
                                </tbody>
                            </table>
                        </div>
                        {$PAGINATION}
                    {else}
                        {$NO_SUGGESTIONS}
                    {/if}
                </div>
            </div>
        </div>
        <div class="col-lg-3">
            {include file='suggestions/search.tpl'}
            {include file='suggestions/categories.tpl'}
            {include file='suggestions/recent_activity.tpl'}
        </div>
    </div>
</div>

{include file='footer.tpl'}