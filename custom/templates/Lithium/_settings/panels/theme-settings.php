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
			Theme Settings
		</div>
	</div>
	<div class="lithium-panel-body">
		<form>
			<?php

			createInput('enableDarkMode', 'switch', [
				'label' => 'Enable Dark Mode',
				'value' => '0',
				'description' => 'This will enable the dark mode by default.'
			]);

			createInput('allowUsersToToggleDarkMode', 'switch', [
				'label' => 'Allow users to toggle dark mode',
				'value' => '0'
			]);

			createInput('primaryColor', 'color', [
				'label' => 'Primary Color',
				'value' => '#2196F3'
			]);

			createInput('avatarsType', 'select', [
				'label' => 'Avatars type',
				'value' => 'circle',
				'options' => [
					'normal' => 'Normal',
					'rounded' => 'Rounded',
					'circle' => 'Circle'
				]
			]);

			echo('<hr />');

			createInput('useCustomPrimaryTextColor', 'switch', [
				'label' => 'Use custom primary text color',
				'value' => '0'
			]);

			createInput('primaryTextColor', 'color', [
				'label' => 'Primary Text Color',
				'value' => '#2196F3'
			]);

			echo('<hr />');

			createInput('enableChroma', 'switch', [
				'label' => 'Enable Chroma',
				'value' => '0'
			]);

			createInput('chromaMultiplier', 'textShort', [
				'label' => 'Chroma Multiplier',
				'value' => '0.5'
			]);

			createInput('chromaSaturation', 'textShort', [
				'label' => 'Chroma Saturation',
				'value' => '50%'
			]);

			createInput('chromaLightness', 'textShort', [
				'label' => 'Chroma Lightness',
				'value' => '50%'
			]);

			?>
		</form>
	</div>
</div>