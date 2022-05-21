<?php

/**
 *	LITHIUM TEMPLATE
 *	By Xemah | https://xemah.com
 *
**/

$ch = curl_init();
curl_setopt($ch, CURLOPT_URL, 'https://rms.xemah.com/check_update?template=lithium&version=' . LithiumTemplate::$VERSION);
curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
$update = curl_exec($ch);
$update = json_decode($update, true);
curl_close($ch);

?>

<div class="lithium-panel-content">
	<div class="lithium-panel-header">
		<a href="#lithium-panel-menu">
			<i class="fas fa-angle-left"></i>
		</a>
		<div class="lithium-panel-title">
			Update
		</div>
	</div>
	<div class="lithium-panel-body">
		<div class="lithium-update">
			<div class="lithium-update-status">
				<?php if ($update['status'] == 'updateAvailable') { ?>
					<span class="text-warning">
						<i class="fas fa-exclamation-circle"></i>
					</span>
					Update available!
				<?php } else if ($update['status'] == 'upToDate') { ?>
					<span class="text-success">
						<i class="fas fa-check-circle"></i>
					</span>
					Up to date!
				<?php } else if ($update['status'] == 'unknownVersion') { ?>
					<span class="text-danger">
						<i class="fas fa-exclamation-circle"></i>
					</span>
					Unknown version!
				<?php } else { ?>
					<span class="text-danger">
						<i class="fas fa-exclamation-circle"></i>
					</span>
					Unknown error occured!
				<?php } ?>
			</div>
			<div class="lithium-update-section">
				<div class="lithium-update-section-description">
					<dl>
						<dt>Current Version</dt>
						<?php if (isset($update['currentVersion'])) { ?>
							<dd><?php echo $update['currentVersion']; ?></dd>
						<?php } else { ?>
							<dd>??</dd>
						<?php } ?>
					</dl>
					<dl>
						<dt>Latest Version</dt>
						<?php if (isset($update['latestVersion'])) { ?>
							<dd><?php echo $update['latestVersion']; ?></dd>
						<?php } else { ?>
							<dd>??</dd>
						<?php } ?>
					</dl>
				</div>
			</div>
			<?php if (isset($update['updateLink']) && $update['updateLink']) { ?>
				<div class="lithium-update-section">
					<a class="lithium-button lithium-button-download" href="<?php echo $update['updateLink']; ?>" target="_blank">Download Update</a>
				</div>
			<?php } ?>
			<?php if ($update['status'] == 'updateAvailable') { ?>
				<div class="lithium-update-section">
					<div class="lithium-update-section-title">
						Instructions:
					</div>
					<div class="lithium-update-section-description">
						<ul>
							<li>Download the latest version of the Lithium template.</li>
							<li>Upload the files and make sure it merges with the existing files.</li>
							<li>If you've modified any source file, make sure to back it up first before updating.</li>
						</ul>
					</div>
				</div>
			<?php } ?>
			<?php if (!empty($update['updates'])) { ?>
				<div class="lithium-update-section">
					<div class="lithium-update-section-title">
						Changelogs:
					</div>
					<div class="lithium-update-section-description">
						<ul class="lithium-update-changelogs">
							<?php foreach ($update['updates'] as $key => $val) { ?>
								<?php foreach ($val['changelogs'] as $sKey => $sVal) { ?>
									<li><span title="<?php echo $sVal; ?>"><?php echo $sVal; ?></span> <small>[<?php echo $key; ?>]</small></li>
								<?php } ?>
							<?php } ?>
						</ul>
					</div>
				</div>
			<?php } ?>
		</div>
	</div>
</div>