<?php

/**
 *	LITHIUM TEMPLATE
 *	By Xemah | https://xemah.com
 *
**/

?>

<div class="lithium-panel-content">
	<div class="lithium-panel-header">
		<a href="#lithium-panel-menu">
			<i class="fas fa-angle-left"></i>
		</a>
		<div class="lithium-panel-title">
			Advanced Theme Settings
		</div>
	</div>
	<div class="lithium-panel-body">
		<form>
			<?php 

			createInput('useCustomFont', 'switch', [
				'label' => 'Use Custom Font',
				'value' => '0'
			]);

			createInput('customFontFamily', 'text', [
				'label' => 'Font Family',
				'value' => ''
			]);

			createInput('customFontLink', 'text', [
				'label' => 'Font Link',
				'value' => ''
			]);

			createInput('customFontWeightRegular', 'textShort', [
				'label' => 'Regular Font Weight',
				'value' => '300'
			]);

			createInput('customFontWeightMedium', 'textShort', [
				'label' => 'Medium Font Weight',
				'value' => '400'
			]);

			createInput('customFontWeightBold', 'textShort', [
				'label' => 'Bold Font Weight',
				'value' => '500'
			]);

			createInput('customFontWeightHeavy', 'textShort', [
				'label' => 'Heavy Font Weight',
				'value' => '600'
			]);

			createInput('customFontWeightHeaviest', 'textShort', [
				'label' => 'Heaviest Font Weight',
				'value' => '800'
			]);

			?>
		</form>
	</div>
</div>