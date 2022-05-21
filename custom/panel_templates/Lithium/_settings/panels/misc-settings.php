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
			Miscellaneous Settings
		</div>
	</div>
	<div class="lithium-panel-body">
		<form>
			<?php

			createInput('enableLineAwesomeIcons', 'switch', [
				'label' => 'Use LineAwesome Icons',
				'value' => '1'
			]);

			echo('<hr />');

			createInput('enableWelcomeMessage', 'switch', [
				'label' => 'Enable Welcome Message',
				'description' => 'Will only be shown when user is not logged in.',
				'value' => '1'
			]);

			createInput('welcomeMessageTitle', 'text', [
				'label' => 'Welcome Message Title',
				'value' => 'Welcome'
			]);

			createInput('welcomeMessageDescription', 'text', [
				'label' => 'Welcome Message Description',
				'value' => 'To join our community, please login or register!'
			]);

			echo('<hr />');

			createInput('enablePreloader', 'switch', [
				'label' => 'Enable Preloader',
				'value' => '0'
			]);

			createInput('preloaderIconColor', 'color', [
				'label' => 'Preloader Icon Color',
				'value' => '#2196F3'
			]);

			echo('<hr />');

			createInput('useCustomLayout', 'switch', [
				'label' => 'Use custom layout',
				'description' => 'Uses custom layout for some pages like login, register, 404 and 403.',
				'value' => '1'
			]);

			createInput('customLayoutBackground', 'image',[
				'label' => 'Custom Layout Background',
				'value' => ''
			]);

			echo('<hr />');

			createInput('enableMorePostsButton', 'switch', [
				'label' => 'Enable more posts button',
				'value' => '1'
			]);

			createInput('morePostsUrl', 'text', [
				'label' => 'More Posts URL',
				'value' => '#'
			]);

			echo('<hr />');

			createInput('prefetchForms', 'switch', [
				'label' => 'Prefetch Forms',
				'description' => 'Fetches the forms like login/register and show them in a modal box.',
				'value' => '1'
			]);

			createInput('enableNewsDateBlock', 'switch', [
				'label' => 'Enable news date block',
				'value' => '0'
			]);

			createInput('enableScrollToTopButton', 'switch', [
				'label' => 'Enable scroll to top button',
				'value' => '1'
			]);

			createInput('collapsibleForums', 'switch', [
				'label' => 'Collapsible Forums',
				'value' => '1'
			]);

			createInput('separateStickyTopics', 'switch', [
				'label' => 'Separate sticky topics in their own block',
				'value' => '0'
			]);

			?>
		</form>
	</div>
</div>