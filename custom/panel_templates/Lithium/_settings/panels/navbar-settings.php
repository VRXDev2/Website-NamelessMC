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
			Navbar Settings
		</div>
	</div>
	<div class="lithium-panel-body">
		<form>
			<?php

			createInput('navbarStyle', 'select', [
				'label' => 'Navbar Style',
				'description' => '
					&bull; Modern style might break if you have too many items in the navbar.
					<br />
					&bull; Sticky navbar doesn\'t work with modern style.
					<br />
					&bull; Icons of nav items doesn\'t work in modern style.
				',
				'value' => 'default',
				'options' => [
					'default' => 'Default',
					'modern' => 'Modern',
				]
			]);

			createInput('stickyNavbar', 'switch', [
				'label' => 'Sticky Navbar',
				'value' => '0'
			]);

			createInput('invertNavSidebar', 'switch', [
				'label' => 'Invert Navigation Sidebar',
				'value' => '1',
				'description' => 'If inverted, the sidebar will open from right side.'
			]);

			echo('<hr />');

			createInput('enableNavbarCustomStoreButton', 'switch', [
				'label' => 'Enable Custom Store Button',
				'value' => '1'
			]);

			createInput('navbarCustomStoreButtonLink', 'text', [
				'label' => 'Custom Store Button Link',
				'value' => '#'
			]);

			?>
		</form>
	</div>
</div>