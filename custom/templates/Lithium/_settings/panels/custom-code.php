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
			Custom Code
		</div>
	</div>
	<div class="lithium-panel-body">
		<form>
			<?php 

			createInput('customCss', 'code', [
				'label' => 'Custom CSS',
				'description' => 'No need to put the &lt;style&gt; tag',
				'value' => ''
			]);

			createInput('customJsAInHeader', 'code', [
				'label' => 'Custom scripts in header',
				'value' => ''
			]);

			createInput('customJsInBody', 'code', [
				'label' => 'Custom scripts in body',
				'value' => ''
			]);

			?>
		</form>
	</div>
</div>