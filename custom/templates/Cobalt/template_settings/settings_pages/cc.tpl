{foreach from=$custom_code_settings item=setting name=custom_code}
<label>{${$setting|upper}}</label><span class="float-right">{$BLANK}</span>
<textarea name="{$setting}" rows="8" class="form-control">{${$setting|upper}_VALUE}</textarea>
{if !$smarty.foreach.custom_code.last}<br />{/if}
{/foreach}