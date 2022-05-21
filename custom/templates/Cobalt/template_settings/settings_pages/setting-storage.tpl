<a class="btn btn-primary mb-2" href="{$SETTINGS_DOWNLOAD_URL}" download>{$DOWNLOAD_SETTINGS_FILE}</a><br />

<div class="d-flex flex-row align-items-center" style="margin-top: 5px;">
    <input type="file" name="cobalt-upload-settings" id="cobalt-upload-settings" class="position-absolute"
        style="margin-left: -500rem;" onchange="switchToSubmitUploadSettings()" />
    <label for="cobalt-upload-settings" class="btn btn-primary mb-0" style="min-width: 130px;"
        id="cobalt-upload-settings-label">{$UPLOAD_SETTINGS}</label>
    <button type="submit" class="btn btn-success d-none" id="cobalt-upload-settings-submit">{$IU_UPLOAD}</button>
    <span class="ml-3">{$UPLOAD_SETTINGS_2}</span>
</div>
<br />
<span class="d-inline-block mb-2">{$BACKUPS}</span>

{foreach from=$backups item=backup}

    <div class="backup-card">
        <div class="backup-name">{$SETTINGS_BACKUP_{$backup}}</div>
        {if $SETTINGS_BACKUP_{$backup}_VALUE !== ""}
            <div class="backup-timestamp">
                {$CREATED} {$BACKUP_{$backup}_TIMESTAMP_VALUE}
            </div>
        {/if}
        <div class="backup-buttons text-right">
            {if $SETTINGS_BACKUP_{$backup}_VALUE == ""}
                <input class="btn btn-primary" name="backup{$backup}-create-btn" type="submit" value="{$CREATE_BACKUP}" />
            {else}
                <button class="btn btn-primary mr-2" data-toggle="modal" data-target="#restore{$backup}Modal"
                    type="button">{$RESTORE_BACKUP}</button>
                <button class="btn btn-danger" data-toggle="modal" data-target="#delete{$backup}Modal" type="button"><i
                        class="fas fa-trash"></i></button>
            {/if}
        </div>
    </div>

    <div class="modal fade" id="restore{$backup}Modal" tabindex="-1" role="dialog">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">{$RESTORE_BACKUP}</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    {$RESTORE_BACKUP_2}
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">{$CANCEL}</button>
                    <button class="btn btn-primary mr-2" name="backup{$backup}-restore-btn"
                        type="submit">{$RESTORE_BACKUP}</button>
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="delete{$backup}Modal" tabindex="-1" role="dialog">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">{$DELETE_BACKUP}</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    {$DELETE_BACKUP_2}
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">{$CANCEL}</button>
                    <button class="btn btn-primary mr-2" name="backup{$backup}-delete-btn"
                        type="submit">{$DELETE_BACKUP}</button>
                </div>
            </div>
        </div>
    </div>

{/foreach}