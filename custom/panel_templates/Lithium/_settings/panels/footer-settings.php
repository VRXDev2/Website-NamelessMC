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
			Footer Settings
		</div>
	</div>
	<div class="lithium-panel-body">
		<form>
			<?php

			createInput('enableFooterCopyright', 'switch', [
				'label' => 'Enable Footer Copyright',
				'value' => '1'
			]);

			createInput('footerCopyrightContent', 'text', [
				'label' => 'Footer Copyright Content',
				'value' => 'Copyright © ' . SITE_NAME . ' ' . date('Y') . '.'
			]);

			createInput('footerLogo', 'image', [
				'label' => 'Logo',
				'value' => 'data:image/png;base64,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'
			]);

			echo('<hr />');

			createInput('footerAboutSectionTitle', 'text', [
				'label' => 'About Section Title',
				'value' => 'About Us'
			]);

			createInput('footerAboutSectionContent', 'textarea', [
				'label' => 'About Section Content',
				'value' => 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer lectus sem, pulvinar at elit eu, aliquet dignissim nisl. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas.'
			]);

			echo('<hr />');

			createInput('enableFooterSupportSection', 'switch', [
				'label' => 'Enable Support Section',
				'value' => '1'
			]);

			createInput('footerSupportSectionTitle', 'text', [
				'label' => 'Support Section Title',
				'value' => 'Support Us'
			]);

			createInput('footerSupportSectionContent', 'textarea', [
				'label' => 'Support Section Content',
				'value' => 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer lectus sem, pulvinar at elit eu, aliquet dignissim nisl.'
			]);

			echo('<hr />');

			createInput('enableFooterSupportButton', 'switch', [
				'label' => 'Enable Support Button',
				'value' => '1'
			]);

			createInput('footerSupportButtonTitle', 'text', [
				'label' => 'Support Button Title',
				'value' => 'Store'
			]);

			createInput('footerSupportButtonLink', 'text', [
				'label' => 'Support Button Link',
				'value' => '#'
			]);

			echo('<hr />');

			createInput('enableFooterCustomIcons', 'switch', [
				'label' => 'Enable Custom Social Icons',
				'value' => '1'
			]);

			createInput('footerCustomIcons', 'groups', [
				'label' => 'Social Icon',
				'value' => [
					'title' => [
						'Twitter',
						'Instagram'
					],
					'icon' => [
						'<i class="fab fa-twitter"></i>',
						'<i class="fab fa-instagram"></i>'
					],
					'link' => [
						'#',
						'#'
					]
				],'template' => [
					[
						'title', 'text', [
							'label' => 'Title',
							'value' => ''
						],
					],
					[
						'icon', 'text', [
							'label' => 'Icon',
							'value' => ''
						],
					],
					[
						'link', 'text', [
							'label' => 'Link',
							'value' => ''
						],
					]
				]
			]);

			?>
		</form>
	</div>
</div>