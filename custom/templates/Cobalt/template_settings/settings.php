<?php
/*
 *	Made by Coldfire - https://coldfiredzn.com
 *
 *  Cobalt Template Settings
 */
 
 /*  
 *  ValentinXD
 *  21683
 *  83139
 *  1649870447
 *  a054306a9a3fd032ded20ec917c6e6a0
 *  9c4a5c8b321ac5507c4f7aa2484c8867
 */

$cobalt_language = new Language(ROOT_PATH . '/custom/templates/Cobalt/template_settings/language', LANGUAGE);

require(ROOT_PATH . '/custom/templates/Cobalt/template_settings/vars.php');

$images_array = ["logo", "headerbg", "rbg", "lbg", "portal1_icon", "portal2_icon", "portal3_icon", "portal4_icon", "portal_bg", "slider1_image", "slider2_image", "slider3_image", "slider4_image", "slider5_image", "store_box_img", "vote_rewards_icon"];
$backups_array = ["1", "2", "3"];

if (Input::exists()) {
    if (Token::check()) {

        foreach ($cobalt_settings_array as $value) {
            if (isset($_POST[$value[0]]) && ($_POST[$value[0]] != getSetting($value[0]))) {
                storeSetting($value[0], $_POST[$value[0]]);
            }
        }

        if (isset($_POST['cobalt-recheck-update'])) {
            $cobalt_api = file_get_contents('https://cdn.coldfiredzn.com/cobalt/updater.json');
            $cobalt_api_decode = json_decode($cobalt_api, true);
            $cobalt_version = $cobalt_api_decode["cobalt_version"];
            $cache->store('cobalt_version', $cobalt_version, 86400);
        }
        
        foreach ($backups_array as $value) {
            if (isset($_POST['backup' . $value . '-create-btn'])) {
                createSettingsBackup($value);
            }
            if (isset($_POST['backup' . $value . '-delete-btn'])) {
                deleteSettingsBackup($value);
            }
            if (isset($_POST['backup' . $value . '-restore-btn'])) {
                restoreSettingsBackup($value);
            }
        }

        foreach ($images_array as $value) {
            if (!empty($_FILES['cobalt-' . $value]['name'])) {
                updateImage($value);
            }
            if (isset($_POST[$value . '-delete-btn'])) {
                if ($value == "headerbg") {
                    $image_delete_url = getSetting('header_bg');
                    $image_webp_delete_url = getSetting('header_bg_webp');
                } else {
                    $image_delete_url = getSetting($value);
                    $image_webp_delete_url = getSetting($value . '_webp');
                }
                $fixed_image_delete_url = ROOT_PATH . $image_delete_url;
                $fixed_image_webp_delete_url = ROOT_PATH . $image_webp_delete_url;
                unlink($fixed_image_delete_url);
                unlink($fixed_image_webp_delete_url);
                if ($value == "headerbg") {
                    storeSetting('header_bg', '');
                    storeSetting('header_bg_webp', '');
                } else {
                    storeSetting($value, '');
                    storeSetting($value . '_webp', '');
                }
            }
        }

        if (!empty($_FILES['cobalt-update']['name'])) {
            updateCobalt();
            $cobalt_api = file_get_contents('https://cdn.coldfiredzn.com/cobalt/updater.json');
            $cobalt_api_decode = json_decode($cobalt_api, true);
            $cobalt_version = $cobalt_api_decode["cobalt_version"];
            $cache->store('cobalt_version', $cobalt_version, 86400);
        }
        
        if (!empty($_FILES['cobalt-upload-settings']['name'])) {
            if (!updateCobaltUploadSettings()) {
                $upload_failed = "yes";
            } else {
                $upload_failed = "no";
            }
        }

        // Declare error if image upload fails
        foreach ($images_array as $value) {
            if ($value !== "headerbg") {
                if (!empty($_FILES['cobalt-' . $value]['name']) && getSetting($value) == "") {
                    $image_error = array($cobalt_language->get('language', 'image_error'));
                }
            } else {
                if (!empty($_FILES['cobalt-' . $value]['name']) && getSetting("header_bg") == "") {
                    $image_error = array($cobalt_language->get('language', 'image_error'));
                }
            }
        }

        if (isset($image_error)) {
            $errors = $image_error;
        } else if (!empty($_FILES['cobalt-upload-settings']['name']) && $upload_failed == "yes") {
            $errors = array($cobalt_language->get('language', 'settings_error'));
        } else if (isset($cobalt_settings_error)) {
            $errors = array($cobalt_settings_error);
        } else if (isset($_POST['cobalt-recheck-update'])) {
            Session::flash('admin_templates', $cobalt_language->get('language', 'update_success'));
        } else {
            Session::flash('admin_templates', $language->get('admin', 'successfully_updated'));
        }

    } else {
        $errors = array($language->get('general', 'invalid_token'));
    }
}

foreach ($cobalt_settings_array as $value) {
    $setting_name = $value[0];
    if (isSettingStored($value[0])) {
        $$setting_name = getSetting($value[0]);
    } else {  
		$$setting_name = $value[1];
		storeSetting($value[0], $value[1]);
    }
}

$current_template->addJSFiles(array(
    (defined('CONFIG_PATH') ? CONFIG_PATH : '') . '/core/assets/plugins/bootstrap-colorpicker/js/bootstrap-colorpicker.min.js' => array(),
    (defined('CONFIG_PATH') ? CONFIG_PATH : '') . '/core/assets/plugins/switchery/switchery.min.js' => array(),
));

$current_template->addCSSFiles(array(
    (defined('CONFIG_PATH') ? CONFIG_PATH : '') . '/core/assets/plugins/bootstrap-colorpicker/css/bootstrap-colorpicker.min.css' => array(),
    (defined('CONFIG_PATH') ? CONFIG_PATH : '') . '/core/assets/plugins/switchery/switchery.min.css' => array()
));

$current_template->addJSScript('
    $(\'.color\').colorpicker({ format: \'hex\', autoInputFallback: false, color: "'. $p_color .'" });
    $(\'.loader-color\').colorpicker({ format: \'hex\', autoInputFallback: false, color: "'. $loader_color .'" });
	var elems = Array.prototype.slice.call(document.querySelectorAll(\'.js-switch\'));
	elems.forEach(function(elem) {
		var switchery = new Switchery(elem, {color: \'#23923d\', secondaryColor: \'#e56464\'});
    });
    
    function switchToSubmit() {
        if ($("#cobalt-update").val()) {
            $("#cobalt-update-label").addClass("d-none");
            $("#cobalt-submit").removeClass("d-none");
        }
    }
    
    function switchToSubmitUploadSettings() {
        if ($("#cobalt-upload-settings").val()) {
            $("#cobalt-upload-settings-label").addClass("d-none");
            $("#cobalt-upload-settings-submit").removeClass("d-none");
        }
    }
');

foreach ($images_array as $value) {
    $current_template->addJSScript('
        function switchToSubmit' . $value . '() {
            if ($("#cobalt-' . $value . '").val()) {
                $("#cobalt-' . $value . '-label").addClass("d-none");
                $("#cobalt-' . $value . '-submit").removeClass("d-none");
            }
        }
    ');
}

$current_template->addCSSStyle('
    .card.img-card {
        background-color: rgb(0,0,0,0.1) !important;
        display: block;
        padding: .75rem;
        margin-bottom: 20px;
        min-height: 60px;
    }
    .img-card span {
        display: inline-block;
        margin-left: 15px;
    }
    .img-card img {
        max-width: 100px;
        max-height: 40px;
    }
    .backup-card {
        display: flex;
        background-color: rgb(0,0,0,0.1) !important;
        padding: .75rem;
        margin-bottom: 15px;
        border-radius: .25rem;
    }
    .backup-name {
        font-weight: 600;
        margin: auto 0;
    }
    .backup-buttons {
        flex-grow: 1;
    }
    .backup-timestamp {
        margin: auto 0;
        margin-left: 25px;
    }
    .dark .card {
        border-color: #585858 !important
    }
    .card.nested-card {
        background-color: rgba(0,0,0,0.05) !important;
        transition: .25s;
        color: #56575b
    }
    .dark .card.nested-card {
        color: #cecece
    }
    a:hover {
        text-decoration: none !important;
    }
    a:hover .card.nested-card {
        background-color: rgba(0,0,0,0.1) !important;
    }
    .dark .cobalt-row .card {
        border: none !important;
        background-color: rgba(0,0,0,0.05) !important;
    }
    input[type=range] {
        width: 50%;
        margin-right: 10px;
        display: inline-block;
    }
');

foreach ($cobalt_settings_array as $value) {
    $first_value = strtoupper($value[0]) . "_VALUE";
    $output_value = $value[0];
    
    $smarty->assign($first_value, $$output_value);
    
    $output_lang = strtoupper($value[0]);
    if ($value[0] == 'slider1_link_open' || $value[0] == 'slider2_link_open' || $value[0] == 'slider3_link_open' || $value[0] == 'slider4_link_open' || $value[0] == 'slider5_link_open' || strpos($value[0], "_webp") == true || $value[0] == 'portal1_fa_icon' || $value[0] == 'portal2_fa_icon' || $value[0] == 'portal3_fa_icon' || $value[0] == 'portal4_fa_icon' || strpos($value[0], "_timestamp") == true) {

    } else {
        $smarty->assign($output_lang, $cobalt_language->get('language', $value[0]));
    }
}

$extra_lang = ["home_1", "home_2", "home_3", "home_4", "home_5", "ext_update_info", "ez_update_1", "ez_update_2", "ez_update_3", "ez_update_4", "ez_update_5", "note", "update_check_tab", "update_settings_tab", "update_check_no_update", "update_check_no_update_2", "update_recheck", "update_available", "update_available_2", "serve_lib_cdn_2", "webp_compression_2", "webp_compression_3", "info", "bg_tab", "bgo_tab", "logo_tab", "navbar_tab", "ds_texts_tab", "loader_tab", "iu_upload_new", "iu_choose_image", "iu_upload", "iu_click_upload", "top", "center", "bottom", "left", "coverlay_2", "coverlay_opacity_2", "header_bg_shading_2", "blur_header_bg_2", "navbar_alignment_2", "navbar_offset_2", "navbar_offset_3", "store_url_2", "ds_breakpoint_2", "discord_server_1", "slider_link_open", "blank", "lr_tab", "backgrounds_tab", "wb", "lr_coverlay_2", "wb_t_1", "wb_skin_id_2", "wb_skin_id_3", "wb_skin_id_4", "wb_skin_id_5", "wb_skin_id_6", "wb_skin_id_7", "wb_skin_id_8", "pnf_tab", "other_section_tab", "small", "large", "iconimage_tab", "upload_settings", "upload_settings_2", "backups", "created", "restore_backup", "restore_backup_2", "delete_backup", "delete_backup_2", "create_backup", "download_settings_file", "store_box_note", "vote", "rules"];

foreach ($extra_lang as $value) {
    $smarty->assign(strtoupper($value), $cobalt_language->get('language', $value));
}

// Categories
$categories_array = array(
    'HOME' => array('icon' => '<i class="fas fa-home fa-fw"></i>', 'filtered_name' => 'home'),
    'UPDATE' => array('icon' => '<i class="fas fa-cloud-upload-alt fa-fw"></i>', 'filtered_name' => 'update'),
    'GENERAL' => array('icon' => '<i class="fas fa-cogs fa-fw"></i>', 'filtered_name' => 'general'),
    'HEADER' => array('icon' => '<i class="fas fa-arrow-circle-up fa-fw"></i>', 'filtered_name' => 'header'),
    'NEWS' => array('icon' => '<i class="fas fa-newspaper fa-fw"></i>', 'filtered_name' => 'news'),
    'MODULES' => array('icon' => '<i class="fas fa-puzzle-piece fa-fw"></i>', 'filtered_name' => 'modules'),
    'STORE_BOX' => array('icon' => '<i class="fas fa-shopping-basket fa-fw"></i>', 'filtered_name' => 'store-box'),
    'SLIDER' => array('icon' => '<i class="fas fa-sliders-h fa-fw"></i>', 'filtered_name' => 'slider'),
    'LR_TAB' => array('icon' => '<i class="fas fa-sign-in-alt fa-fw"></i>', 'filtered_name' => 'elr'),
    'FOOTER' => array('icon' => '<i class="fas fa-arrow-circle-down fa-fw"></i>', 'filtered_name' => 'footer'),
    'CUSTOM_CODE' => array('icon' => '<i class="fas fa-code fa-fw"></i>', 'filtered_name' => 'cc'),
    'PORTAL' => array('icon' => '<i class="fas fa-door-open fa-fw"></i>', 'filtered_name' => 'portal'),
    'SETTINGS_STORAGE_TAB' => array('icon' => '<i class="fas fa-database fa-fw"></i>', 'filtered_name' => 'setting-storage'),
);
foreach ($categories_array as $key => $item) {
    $smarty->assign($key, $cobalt_language->get('language', strtolower($key)));
}
$smarty->assign('CATEGORIES', $categories_array);

// Portal icons
$portal_icons = ['1', '2', '3', '4'];
foreach ($portal_icons as $value) {
    $smarty->assign('IMAGE' . $value . "_TAB", $cobalt_language->get('language', 'image' . $value . '_tab'));
}
$smarty->assign('portal_icons', $portal_icons);

// Sliders
$sliders = ['1', '2', '3', '4', '5'];
foreach ($sliders as $value) {
    $smarty->assign('SLIDER' . $value, $cobalt_language->get('language', 'slider' . $value));
}
$smarty->assign('sliders', $sliders);

// Custom code
$cc = ['custom_css', 'custom_css_styles', 'custom_js', 'custom_js_scripts'];
$smarty->assign('custom_code_settings', $cc);

// Backups
$smarty->assign('backups', $backups_array);

$smarty->assign(array(
    'SUPPORT_URL' => $support_url,
    'LOCAL_VERSION' => $cobalt_local_version,
    'SUBMIT' => $language->get('general', 'submit'),
    'CANCEL' => $language->get('general', 'cancel'),
    'INFO' => $language->get('general', 'info'),
    'COBALT' => $cobalt_language->get('language', 'cobalt_title'),
    'SETTINGS_TEMPLATE' => ROOT_PATH . '/custom/templates/Cobalt/template_settings/settings.tpl',
    'SETTINGS_DOWNLOAD_URL' => (defined('CONFIG_PATH') ? CONFIG_PATH : '') . '/cobalt-settings.json'
));

if($ext_update == "yes"){
	$cache->setCache('cobalt_template');

	if(!$cache->isCached('cobalt_version') || $cache->retrieve('cobalt_version') == ""){
  		$cobalt_api = file_get_contents('https://cdn.coldfiredzn.com/cobalt/updater.json');
  		$cobalt_api_decode = json_decode($cobalt_api, true);
  		$cobalt_version = $cobalt_api_decode["cobalt_version"];
  		$cache->store('cobalt_version', $cobalt_version, 86400);
	} else {
  		$cobalt_version = $cache->retrieve('cobalt_version');
	}

	$smarty->assign('COBALT_VERSION', $cobalt_version);
}

function createSettingsBackup($id) {
    storeSetting("settings_backup_" . $id, ROOT_PATH . "/settings-backup-" . $id . ".json");
    storeSetting("backup_" . $id . "_timestamp", date("m/d/Y"));
    $new_backup_file = fopen(ROOT_PATH . "/settings-backup-" . $id . ".json", 'w');
    $current_settings = file_get_contents(ROOT_PATH . '/cobalt-settings.json');
    fwrite($new_backup_file, $current_settings);
    fclose($new_backup_file);
}

function restoreSettingsBackup($id) {
    $old_settings = fopen(ROOT_PATH . "/cobalt-settings.json", 'w');
    $new_settings = file_get_contents(ROOT_PATH . "/settings-backup-" . $id . ".json");
    fwrite($old_settings, $new_settings);
    fclose($old_settings);
    
    fixInvalidSettings();
}

function fixInvalidSettings() {
    global $images_array;
    foreach ($images_array as $value) {
        if (!file_exists(ROOT_PATH . getSetting($value)) || !file_exists(ROOT_PATH . getSetting($value . '_webp'))) {
            storeSetting($value, '');
            storeSetting($value . '_webp', '');
        }
    }
    global $backups_array;
    foreach ($backups_array as $value) {
        if (!file_exists(getSetting("settings_backup_" . $value))) {
            storeSetting("settings_backup_" . $value, '');
            storeSetting("backup_" . $value . "_timestamp", '');
        }
    }
}

function deleteSettingsBackup($id) {
    $backup_url = getSetting("settings_backup_" . $id);
    unlink($backup_url);
    storeSetting("settings_backup_" . $id, "");
    storeSetting("backup_" . $id . "_timestamp", "");
}

function updateCobaltUploadSettings() {
    $target_path = basename($_FILES['cobalt-upload-settings']['name']); 
    
    $file_parts = pathinfo($target_path);
    
    if ($file_parts['extension'] !== 'json' ||  $_FILES['cobalt-upload-settings']['name'] !== 'cobalt-settings.json') {
        return false;
    }
    
    if(move_uploaded_file($_FILES['cobalt-upload-settings']['tmp_name'], $target_path)) {
        fixInvalidSettings();
        return true;
    } else {
        return false;
    }
}

function updateImage($image) {

    $target_path = ROOT_PATH . '/uploads/';
    $target_path = $target_path . basename($_FILES['cobalt-' . $image]['name']); 
    $img_url = (defined('CONFIG_PATH') ? CONFIG_PATH : '') . 'uploads/' . basename($_FILES['cobalt-' . $image]['name']);

    $file_parts = pathinfo($target_path);

    if ($file_parts['extension'] !== 'png' && $file_parts['extension'] !== 'jpg' && $file_parts['extension'] !== 'jpeg') {
        return;
    }
    
    if(move_uploaded_file($_FILES['cobalt-' . $image]['tmp_name'], $target_path)) {
        // success
    } else{
        return;
    }
    
    if ($image == "headerbg") {
        storeSetting("header_bg", '/' . $img_url);
    } else {
        storeSetting($image, '/' . $img_url);
    }

    $dir = ROOT_PATH . '/uploads/';
    $name = $_FILES['cobalt-' . $image]['name'];
    $newName = bin2hex(openssl_random_pseudo_bytes(20)) . $image . '.webp';

    if ($file_parts['extension'] == 'png') {
        $img = imagecreatefrompng($dir . $name);
    } elseif ($file_parts['extension'] == 'jpg' || $file_parts['extension'] == 'jpeg') {
        $img = imagecreatefromjpeg($dir . $name);
    }

    imagepalettetotruecolor($img);
    imagealphablending($img, true);
    imagesavealpha($img, true);
    imagewebp($img, $dir . $newName, getSetting('webp_compression'));
    imagedestroy($img);
    
    if ($image == "headerbg") {
        storeSetting('header_bg_webp', (defined('CONFIG_PATH') ? CONFIG_PATH : '') . '/uploads/' . $newName);
    } else {
        storeSetting($image . '_webp', (defined('CONFIG_PATH') ? CONFIG_PATH : '') . '/uploads/' . $newName);
    }

    return;
}

// Cobalt Easy Updater
// Made by Skyrowl for Skyfall Theme, Adapted for Cobalt Theme
function updateCobalt() {
    $cobalt_language = new Language(ROOT_PATH . '/custom/templates/Cobalt/template_settings/language', LANGUAGE);

    $currentDirectory2 = getcwd();
    $sfpath = $currentDirectory2.'/custom/templates/Cobalt';
    chmod_r($sfpath);

    $currentDirectory = getcwd();
    $uploadDirectory = $currentDirectory . '/uploads/';
    $cobaltDir = $currentDirectory.'/custom/templates/Cobalt';
    $cobaltTempDir = $uploadDirectory . 'cobalt';

    $errors = array();

    $fileExtensionsAllowed = ['zip'];

    $fileName = $_FILES['cobalt-update']['name'];
    $fileSize = $_FILES['cobalt-update']['size'];
    $fileTmpName = $_FILES['cobalt-update']['tmp_name'];
    $fileExtension = strtolower(end(explode('.', $fileName)));
    $uploadPath = $uploadDirectory . basename($fileName);

    $responseTemplate = '<style>
                          .hidden {
                              visibility: hidden;
                              opacity: 0;
                              transition: visibility 0s 1s, opacity 1s linear;
                            }
                          </style>
                          <div class="position-fixed w-100 h-100" style="top:0;left:0;z-index:50000;" id="updateBackground">
                            <div class="d-flex flex-column h-100 text-center">
                              <div class="mx-auto my-auto d-flex flex-column" style="color:#f0f0f0">
                                <div class="d-flex flex-column mx-auto my-auto" id="updateResponse"></div>
                                <btn class="btn btn-secondary mt-5 mx-auto" onclick="dismiss(); window.location.reload();" style="width:max-content;">' . $cobalt_language->get('language', 'ez_msg_3') . '</btn>
                              </div>
                            </div>
                          </div>
                          <script>
                            var container = document.getElementById("updateResponse");
                            responseIcon.style.fontSize = "6rem";
                            container.appendChild(responseIcon);
                            var responseMessageNode = document.createElement("h3");
                            container.appendChild(responseMessageNode.appendChild(responseMessage));
                            var background = document.getElementById("updateBackground");
                            background.style.background = backgroundColor;
                            function dismiss() {
                              background.classList.add("hidden");
                            }
                            if ( window.history.replaceState ) {
                                window.history.replaceState( null, null, window.location.href );
                            }
                          </script>';

    if (!in_array($fileExtension, $fileExtensionsAllowed)) {
        array_push($errors, $cobalt_language->get('language', 'ez_msg_1'));
    }
    if ($fileSize > 15000000) {
        array_push($errors, $cobalt_language->get('language', 'ez_msg_2'));
    }
    if (empty($errors)) {
        if (move_uploaded_file($fileTmpName, $uploadPath)) {
            $zip = new ZipArchive;
            if ($zip->open($uploadPath)) {
                deleteDirectory($cobaltDir);
                mkdir($cobaltTempDir);
                $zip->extractTo($cobaltTempDir);
                $zip->close();
                rename($cobaltTempDir.'/upload/custom/templates/Cobalt', $cobaltDir);
                deleteDirectory($cobaltTempDir);
                echo '<script>
                        var responseIcon = document.createElement("i");
                        responseIcon.classList.add("fas", "fa-check-circle")
                        var responseMessage = document.createTextNode("' . $cobalt_language->get('language', 'ez_msg_4') . '");
                        var backgroundColor = "rgba(40, 167, 69, 0.8)";
                      </script>';
            } else {
                echo '<script>
                      var responseIcon = document.createElement("i");
                      responseIcon.classList.add("fas", "fa-times-circle");
                      var responseMessage = document.createTextNode("' . $cobalt_language->get('language', 'ez_msg_5') . '");
                      var backgroundColor = "rgba(220, 53, 69, 0.8)";
                    </script>';
            }
            unlink($uploadPath);
        } else {
            echo '<script>
                  var responseIcon = document.createElement("i");
                  responseIcon.classList.add("fas", "fa-times-circle");
                  var responseMessage = document.createTextNode("' . $cobalt_language->get('language', 'ez_msg_6') . '");
                  var backgroundColor = "rgba(220, 53, 69, 0.8)";
                </script>';
        }
    } else {
        echo '<script>
              var responseIcon = document.createElement("i");
              responseIcon.classList.add("fas", "fa-times-circle");
              var backgroundColor = "rgba(220, 53, 69, 0.8)";
              var responseMessage = document.createTextNode("' . $cobalt_language->get('language', 'ez_msg_7') . '");
            </script>';
    }
    echo $responseTemplate;
}

function chmod_r($path) {
    $dir = new DirectoryIterator($path);
    foreach ($dir as $item) {
        chmod($item->getPathname(), 0777);
        if ($item->isDir() && !$item->isDot()) {
            chmod_r($item->getPathname());
        }
    }
}

function deleteDirectory($dir) {
    if (!file_exists($dir)) {
        return true;
    }
    if (!is_dir($dir)) {
        return unlink($dir);
    }
    foreach (scandir($dir) as $item) {
        if ($item == '.' || $item == '..') {
            continue;
        }
        if (!deleteDirectory($dir . DIRECTORY_SEPARATOR . $item)) {
            return false;
        }
    }

    return rmdir($dir);
}