<label>{${$name|upper}}</label>{if $right !== "no"}<span class="float-right">{$right}</span>{/if}<br />
<input type="range" name='{$name}' value="{${$name|upper}_VALUE}" min="0" max="1" step="0.05" oninput="this.nextElementSibling.value = this.value">
<output>{${$name|upper}_VALUE}</output>
{if $last !== "yes"}<br /><br />{/if}