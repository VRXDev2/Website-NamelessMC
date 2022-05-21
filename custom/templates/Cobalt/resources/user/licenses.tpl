{include file='header.tpl'} {include file='navbar.tpl'}
<div class="container">
    <div class="row">
        <div class="col-md-3">
            {include file='user/navigation.tpl'}
        </div>
        <div class="col-md-9">
            <div class="card">
                <div class="card-header header-theme">
                    {$MANAGING_LICENSES}
                    <button type="button" data-toggle="modal" data-target="#modal-addLicense" class="btn btn-theme float-right">{$ADD_LICENSE}</button>
                </div>
                <div class="card-body">
                    {if isset($SUCCESS)}
                    <div class="alert alert-success">
                        {$SUCCESS}
                    </div>
                    {/if} {if isset($ERROR)}
                    <div class="alert alert-danger">
                        {$ERROR}
                    </div>
                    {/if}

                    {if count($LICENSES)}
                    <div class="table-responsive">
                    <table id="resourceLicenses" class="table table-striped">
                        <thead>
                            <tr>
                                <th>{$USER}</th>
                                <th>{$PURCHASED}</th>
                                <th>{$STATUS}</th>
                                <th>{$ACTIONS}</th>
                            </tr>
                        </thead>
                        <tbody>
                            {foreach from=$LICENSES item=license}
                            <tr>
                                <td>
                                    <a href="{$license.profile}" style="{$license.style}"><img src="{$license.avatar}"
                                            class="avatar-img" style="max-height:25px;max-width:25px;"
                                            alt="{$license.username}" /> {$license.username}</a>
                                    <br />
                                    <small style="margin-left: 32px">{$license.transaction_id}</small>
                                </td>
                                <td>
                                    {$license.date}
                                </td>
                                <td>
                                    <span
                                        class="badge {if $license.status eq '0'}badge-warning{elseif $license.status eq '1'}badge-success{else}badge-danger{/if}">{$license.status_text}</span>
                                </td>
                                <td>
                                    {if $license.can_revoke}
                                    <form action="" method="post">
                                        <input type="hidden" name="action" value="revoke" />
                                        <input type="hidden" name="token" value="{$TOKEN}" />
                                        <input type="hidden" name="license" value="{$license.id}" />
                                        <input type="submit" class="btn btn-theme" value="{$REVOKE}" />
                                    </form>
                                    {/if}
                                    {if $license.can_reinstate}
                                    <form action="" method="post">
                                        <input type="hidden" name="action" value="reinstate" />
                                        <input type="hidden" name="token" value="{$TOKEN}" />
                                        <input type="hidden" name="license" value="{$license.id}" />
                                        <input type="submit" class="btn btn-theme" value="{$REINSTATE}" />
                                    </form>
                                    {/if}
                                </td>
                            </tr>
                            {/foreach}
                        </tbody>
                    </table>
                    </div>
                    {else}
                    <div class="alert alert-info">{$NO_LICENSES}</div>
                    {/if}


                </div>
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="modal-addLicense">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <div class="modal-title">{$ADD_LICENSE}</div>
            </div>
            <form action="" method="post" id="addLicense">
                <div class="modal-body">
                    <input id="userLookup" class="typeahead form-control" type="text" placeholder="{$FIND_USER}">
                    <input type="hidden" id="userInput" name="user" value="" />
                    <input type="hidden" name="action" value="add" />
                    <input type="hidden" name="token" value="{$TOKEN}" />
                    <input type="button" class="btn btn-secondary mt-3" data-dismiss="modal" value="{$CANCEL}">
                    <button type="submit" class="btn btn-theme mt-3" id="submitAddLicense" disabled>{$SUBMIT}</button>
                </div>
            </form>
        </div>
    </div>
</div>

{include file='footer.tpl' EXCLUDE_END_BODY=true}

{literal}
<script type="text/javascript">
  const tokenizer = (datum) => {
    const nicknameTokenizer = Bloodhound.tokenizers.whitespace(datum.nickname);
    const usernameTokenizer = Bloodhound.tokenizers.whitespace(datum.username);
    return nicknameTokenizer.concat(usernameTokenizer);
  }

  const userResults = new Bloodhound({
    datumTokenizer: tokenizer,
    queryTokenizer: Bloodhound.tokenizers.whitespace,
    identify: (obj) => obj.nickname,
    remote: {
      url: '{/literal}{$ADD_LICENSE_USERS_ENDPOINT}{literal}%QUERY',
      wildcard: '%QUERY',
      filter: (response) => response.results
    }
  });

  $('#userLookup').typeahead(null, {
    name: 'userLookup',
    display: 'nickname',
    source: userResults
  }).on('typeahead:change', (e, selected) => {
    userResults.search(selected, () => {}, (data) => {
      if (!data.length) {
        $('#submitAddLicense').attr('disabled', true);
        return;
      }

      const match = data.find((item) => item.nickname === selected);

      $('input#userInput').val(match.length ? match[0].id : data[0].id);
      $('#submitAddLicense').removeAttr('disabled');
    });
  }).on('typeahead:select', (e, selected) => {
    $('input#userInput').val(selected.id);
    $('#submitAddLicense').removeAttr('disabled');
  }).on('typeahead:autocomplete', (e, selected) => {
    $('input#userInput').val(selected.id);
    $('#submitAddLicense').removeAttr('disabled');
  });
</script>
{/literal}

</body>

</html>