<?php

/**
 *	LITHIUM TEMPLATE
 *	By Xemah | https://xemah.com
 *
**/

$uploadsDir = LithiumTemplate::$PATH . '/uploads';
if (!is_writable($uploadsDir)) {
	die('The directory <strong>' . $uploadsDir . '</strong> is not writable.');
}

$storageDir = LithiumTemplate::$PATH . '/_settings/storage';
if (!is_writable($storageDir)) {
	die('The directory <strong>' . $storageDir . '</strong> is not writable.');
}

require('_functions.php');

if (isset($_GET['process'])) {

	if ($_SERVER['REQUEST_METHOD'] === 'POST' && $_GET['process'] === 'update_config') {
		try {
			LithiumTemplate::saveConfig($_POST);
			echo json_encode(['success' => true]);
		} catch (Exception $e) {
			echo json_encode(['success' => false, 'error' => $e->getMessage()]);
		}
		die();
	}

	if ($_SERVER['REQUEST_METHOD'] === 'POST' && $_GET['process'] === 'image_upload') {
		require('image_upload.php');
		die();
	}

}

$current_template->addCSSFiles([
	'https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700&display=swap' => [],
	LithiumTemplate::$PUBLIC_PATH . '/_settings/assets/style.css' => []
]);

$current_template->addJSFiles([
	LithiumTemplate::$PUBLIC_PATH . '/_settings/assets/script.js' => []
]);

$smarty->assign([
	'LITHIUM_PANELS' => getPanels(),
	'SETTINGS_TEMPLATE' => __DIR__ . '/index.tpl'
]);