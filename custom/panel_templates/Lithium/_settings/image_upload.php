<?php

/**
 *	LITHIUM TEMPLATE
 *	By Xemah | https://xemah.com
 *
**/

header('Content-Type: application/json');

if (!isset($_FILES['file'])) {
	return;
}

$uploadedFile = $_FILES['file'];
$file = pathinfo($uploadedFile['name']);

if ($uploadedFile['error'] !== UPLOAD_ERR_OK) {
	die(json_encode(['success' => false]));
}

$uploadsPathAbs = '/custom/templates/Lithium/uploads';
$uploadsPath = ROOT_PATH . $uploadsPathAbs;
$extensions = ['jpg', 'jpeg', 'png', 'gif', 'webp'];

$fileName = $file['filename'];
$fileExtension = $file['extension'];

if (!in_array($fileExtension, $extensions)) {
	die(json_encode(['success' => false, 'error' => 'Incorrect uploaded file type.']));
}

if (!is_writable($uploadsPath)) {
	die(json_encode(['success' => false, 'error' => 'The directory ' . (defined('CONFIG_PATH') ? CONFIG_PATH : '') . $uploadsPathAbs . ' is not writable.']));
}

$finalFileName = $fileName;
if (file_exists("{$uploadsPath}/{$fileName}.{$fileExtension}")) {
	$i = 1;
	while (file_exists("{$uploadsPath}/{$finalFileName}.{$fileExtension}")) {
		$finalFileName = "{$fileName}-{$i}";
		$i++;
	}
}

$filePath = "{$uploadsPath}/{$finalFileName}.{$fileExtension}";

if (!move_uploaded_file($uploadedFile['tmp_name'], $filePath)) {
	die(json_encode(['success' => false, 'error' => 'An unknown error occured while moving the file.']));
}

$finalUrl = (defined('CONFIG_PATH') ? CONFIG_PATH : '') . "/custom/templates/Lithium/uploads/{$finalFileName}.{$fileExtension}";

die(json_encode(['success' => true, 'data' => ['url' => $finalUrl]]));