<!-- Modals Categories -->
{if isset($PERMISSIONS['categories']) && $PERMISSIONS['categories'] === true}
    <div class="modal fade show" id="modal-edit-categ" tabindex="-1" role="dialog" aria-labelledby="assignedCategories"
         aria-hidden="true">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <span class="modal-title" id="assignedCategoriesLabel">{$EDIT_CATEG}</span>
                </div>
                <div class="modal-body">
                    <!-- Vue not assigned category list -->
                    <div class="ui horizontal divider">
                        {$REMOVE} {$CATEGORIES}
                    </div>
                    <div id="assignedCategories">
                        <a-categ></a-categ>
                    </div>
                    <div class="ui horizontal divider">
                        {$ADD} {$CATEGORIES}
                    </div>
                    <select class="select-2" name="assignCateg[]" id="notAssignedCategories" multiple=""></select>
                    <button class="btn btn-theme mt-3" id="addCateg">{$ADD}</button>
                    <button type="button" class="btn btn-secondary mt-3" data-dismiss="modal">{$CLOSE}</button>
                </div>
            </div>
        </div>
    </div>
{/if}

<!-- Modals Status -->
{if isset($PERMISSIONS['status']) && $PERMISSIONS['status'] === true}
    <div class="modal fade show" id="modal-edit-status" tabindex="-1" role="dialog" aria-labelledby="status"
         aria-hidden="true">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <span class="modal-title" id="editStatusLabel">{$EDIT_STATUS}</span>
                </div>
                <div class="modal-body">
                    <!-- Vue not assigned category list -->
                    <span class="mb-2 d-inline-block">{$STATUS}</span>
                    <status-modal></status-modal>
                    <button class="btn btn-theme mt-3" id="editStatus">{$SAVE}</button>
                    <button type="button" class="btn btn-secondary mt-3" data-dismiss="modal">{$CLOSE}</button>
                </div>
            </div>
        </div>
    </div>
{/if}

<!-- Modals Assign -->
{if isset($PERMISSIONS['assign']) && $PERMISSIONS['assign'] === true}
    <div class="modal fade show" id="modal-assign" tabindex="-1" role="dialog" aria-labelledby="assignedGroups"
         aria-hidden="true">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <span class="modal-title" id="assignedGroupsLabel">{$ASSIGN_TICKET}</span>
                </div>
                <div class="modal-body">
                    <!-- Vue not assigned groups list -->
                        {$REMOVE} {$GROUPS}
                    <div id="assignedCategories">
                        <a-groups></a-groups>
                    </div>
                    <div class="ui horizontal divider">
                        {$ASSIGN} {$GROUPS}
                    </div>
                    <select class="select-2" name="assignGroups[]" id="notAssignedGroups" multiple=""></select>
                    <button class="btn btn-theme mt-3" id="assignGroups">{$ADD}</button>
                    <button type="button" class="btn btn-secondary mt-3" data-dismiss="modal">{$CLOSE}</button>
                </div>
            </div>
        </div>
    </div>
{/if}

<!-- Modals Delete -->
{if isset($PERMISSIONS['delete']) && $PERMISSIONS['delete'] === true}
    <div class="modal fade show" id="modal-delete" tabindex="-1" role="dialog" aria-labelledby="deleteTicket"
         aria-hidden="true">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <span class="modal-title" id="deleteLabel">{$DELETE}</span>
                </div>
                <div class="modal-body">
                    {$ARE_YOU_SURE}
                    <button class="btn btn-theme mt-3 assignCateg"
                id="deleteTicket">{$DELETE}</button>
                    <button type="button" class="btn btn-secondary mt-3" data-dismiss="modal">{$CLOSE}</button>
                </div>
            </div>
        </div>
    </div>
{/if}
