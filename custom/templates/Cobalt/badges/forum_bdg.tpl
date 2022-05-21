<div class="btn btn-theme mt-2 btn-block" data-toggle="modal" data-target="#badges{$reply.user_id}Modal">
    <i class="fas fa-shield-alt"></i> {$BDG_TITLE}:
    {if empty($USER_BDG_COUNT[$reply.user_id]['count'])}<b>0</b>{else}<b>{$USER_BDG_COUNT[$reply.user_id]['count']}</b>{/if}
</div>