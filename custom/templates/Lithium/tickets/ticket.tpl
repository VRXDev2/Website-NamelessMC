{extends file="layout.tpl"}

{block name=heading}

	<div id="ticketsApp">

	<h2>
		<status-badge></status-badge>
		{$TICKET[0]->title}
		<div class="meta">
			Started by
			<a href="{$SITE_HOME}profile/{$TICKET[0]->username}/">{$TICKET[0]->username}</a>
			&bull;
			Category:
			<assigned-categories></assigned-categories>
		</div>
	</h2>
	
{/block}

{block name=content}

	{if !empty($PERMISSIONS)}
		<div class="action-bar">
			<div class="action-bar-buttons">
				<div class="dropdown">
					<a href="#" class="btn btn-primary btn-sm dropdown-toggle" data-bs-toggle="dropdown">{$ACTIONS}</a>
					<ul class="dropdown-menu dropdown-menu-end">
						<li>
							<a class="dropdown-header">{$ACTIONS}</a>
						</li>
						{if isset($PERMISSIONS.categories) && $PERMISSIONS.categories === true}
							<li>
								<a href="#modal-editCategories" class="dropdown-item" data-bs-toggle="modal">{$EDIT_CATEG}</a>
							</li>
						{/if}
						{if isset($PERMISSIONS.status) && $PERMISSIONS.status === true}
							<li>
								<a href="#modal-editStatus" class="dropdown-item" data-bs-toggle="modal">{$EDIT_STATUS}</a>
							</li>
						{/if}
						{if isset($PERMISSIONS.assign) && $PERMISSIONS.assign === true}
							<li>
								<a href="#modal-assignGroups" class="dropdown-item" data-bs-toggle="modal">{$ASSIGN_TICKET}</a>
							</li>
						{/if}
						{if isset($PERMISSIONS.delete) && $PERMISSIONS.delete === true}
							<li>
								<hr class="dropdown-divider" />
							</li>
							<li>
								<a href="#modal-delete" class="dropdown-item" data-bs-toggle="modal">{$DELETE_TICKET}</a>
							</li>
						{/if}
					</ul>
				</div>
			</div>
		</div>
	{/if}
	
	<answers></answers>
	<reply></reply>

	{if isset($PERMISSIONS.status) && $PERMISSIONS.status === true}
		<div class="modal fade" id="modal-editStatus">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<div class="modal-title">
							{$EDIT_STATUS}
						</div>
					</div>
					<div class="modal-body">
						<input-status></input-status>
					</div>
					<div class="modal-footer">
						<button class="btn btn-secondary btn-sm" data-bs-dismiss="modal">{$CLOSE}</button>
						<button type="submit" class="btn btn-primary btn-sm" id="button-editStatus">{$SAVE}</button>
					</div>
				</div>
			</div>
		</div>
	{/if}

	{if isset($PERMISSIONS.categories) && $PERMISSIONS.categories === true}
		<div class="modal fade" id="modal-editCategories">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<div class="modal-title">
							{$EDIT_CATEG}
						</div>
					</div>
					<div class="modal-body">
						<div class="form-group">
							<label class="form-label" for="input-assignCategories">{$ADD} {$CATEGORIES}</label>
							<select class="form-control" id="input-assignCategories" name="assignCateg[]" multiple></select>
						</div>
						<div class="form-group">
							<label class="form-label" for="input-unassignCategories">{$REMOVE} {$CATEGORIES}</label>
							<input-unassign-categories></input-unassign-categories>
						</div>
					</div>
					<div class="modal-footer">
						<button class="btn btn-secondary btn-sm" data-bs-dismiss="modal">{$CLOSE}</button>
						<button type="submit" class="btn btn-primary btn-sm" id="button-addCategories">{$ADD}</button>
					</div>
				</div>
			</div>
		</div>
	{/if}

	{if isset($PERMISSIONS.assign) && $PERMISSIONS.assign === true}
		<div class="modal fade" id="modal-assignGroups">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<div class="modal-title">
							{$ASSIGN_TICKET}
						</div>
					</div>
					<div class="modal-body">
						<div class="form-group">
							<label class="form-label" for="input-assignGroups">{$ASSIGN} {$GROUPS}</label>
							<select class="form-control" id="input-assignGroups" name="assignGroups[]" multiple></select>
						</div>
						<div class="form-group">
							<label class="form-label" for="input-unassignGroups">{$REMOVE} {$GROUPS}</label>
							<input-unassign-groups></input-unassign-groups>
						</div>
					</div>
					<div class="modal-footer">
						<button class="btn btn-secondary btn-sm" data-bs-dismiss="modal">{$CLOSE}</button>
						<button type="submit" class="btn btn-primary btn-sm" id="button-addGroups">{$ADD}</button>
					</div>
				</div>
			</div>
		</div>
	{/if}

	{if isset($PERMISSIONS.delete) && $PERMISSIONS.delete === true}
		<div class="modal fade" id="modal-delete">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<div class="modal-title">
							{$DELETE}
						</div>
					</div>
					<div class="modal-body">
						{$ARE_YOU_SURE}
					</div>
					<div class="modal-footer">
						<button class="btn btn-secondary btn-sm" data-bs-dismiss="modal">{$CLOSE}</button>
						<button type="submit" class="btn btn-primary btn-sm" id="button-deleteTicket">{$DELETE}</button>
					</div>
				</div>
			</div>
		</div>
	{/if}

	</div>

{/block}

{block name=script}

	{include file='./_vue.tpl'}
	{include file='./_js.tpl'}

{/block}
