<input type="hidden" name="{$name}" value="no">
<input type="checkbox" name="{$name}" class="js-switch js-check-change" value="yes" {if ${$name|upper}_VALUE eq 'yes'}checked{/if}> <label>{${$name|upper}}</label>
{if $right !== "no"}<span class="float-right">{$right}</span>{/if}
{if $last !== "yes"}<br /><br />{/if}