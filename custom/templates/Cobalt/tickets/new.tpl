{include file='header.tpl'}
{include file='navbar.tpl'}
<link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css" rel="stylesheet" />
<script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>
<div class="container">
    <div class="card">
        <div class="card-header header-theme">
            {$NEW_TICKET}
        </div>
        <div class="card-body">
            <form action="" method="post">
                <input type="hidden" name="token" value="{$TOKEN}">
                <div class="form-group">
                    <label>{$TICKET_TITLE}</label>
                    <input class="w-100 mb-2 form-control" type="text" placeholder="{$TICKET_TITLE}"
                       maxlength="64"
                       name="ticket_title" required>
                </div>
                <div class="form-group">
                    <label>{$CATEGORIES_TITLE}</label>
                    <select class="form-control dropdown select2" name="ticket_categories[]" multiple="multiple">
                    {if count($CATEGORIES) > 0}
                        {foreach from=$CATEGORIES item=category}
                            <option value="{$category->id}">{$category->text}</option>
                        {/foreach}
                    {/if}
                    </select>
                </div>
                <div class="form-group">
                    <label>{$YOUR_ISSUE}</label>
                    <textarea class="w-100 my-2 form-control" placeholder="{$DESCRIBE_ISSUE}" maxlength="1024"
                                  style="height:7rem;resize:vertical;" name="ticket_content" required></textarea>
                </div>
                <button type="submit" class="btn btn-theme">{$CREATE}</button>
                <a href="{$TICKETS_URL}" class="btn btn-secondary">{$CANCEL}</a>
            </form>
        </div>
    </div>
</div>
{include file='footer.tpl'}

<style>
    .select2-search__field {
        width: calc(100% - 10px) !important;
    }
</style>
<script>
$(".select2").select2({
    placeholder: "Categories"
});
    $(document).ready(

    );
</script>
