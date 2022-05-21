<?php

    // Generate settings file if it doesn't exist
    if (!file_exists(ROOT_PATH . "/cobalt-settings.json")) { 
        generateSettingsFile();
    }
    
    // Prevent null settings files from clogging log files and causing massive memory leaks
    $settings_file_contents = file_get_contents(ROOT_PATH . "/cobalt-settings.json");
    if ($settings_file_contents == null || $settings_file_contents == "null") {
        unlink(ROOT_PATH . "/cobalt-settings.json");
        $cobalt_language = new Language(ROOT_PATH . '/custom/templates/Cobalt/template_settings/language', LANGUAGE);
        ErrorHandler::logCustomError($cobalt_language->get('language', 'settings_file_reset'));
        generateSettingsFile();
    }
    
    function generateSettingsFile() {
        $fp = fopen(ROOT_PATH . "/cobalt-settings.json", 'w');
        fwrite($fp, "{}");
        fclose($fp);
    }

    function isSettingStored($setting) {

        $setting_directory = ROOT_PATH . "/cobalt-settings.json";

        $str = file_get_contents($setting_directory);
        $json = json_decode($str, true);

        if (array_key_exists($setting, $json)) {
            return true;
        } else {
            return false;
        }
    }

    function storeSetting($setting, $value) {
        $setting_directory = ROOT_PATH . "/cobalt-settings.json";

        $str = file_get_contents($setting_directory);
        $json = json_decode($str, true);

        if (isSettingStored($setting)) {
            $json[$setting] = $value;
            $newjson = json_encode($json, true);
        } else {
            $newsetting = array($setting => $value);
            $newsettingarray = array_merge($json, $newsetting);
            $newjson = json_encode($newsettingarray, true);
        }
        
        if ($newjson != null && $newjson != "null") {
            file_put_contents($setting_directory, $newjson);
        } else {
            $cobalt_language = new Language(ROOT_PATH . '/custom/templates/Cobalt/template_settings/language', LANGUAGE);
            $error = str_replace("{x}", $setting, $cobalt_language->get('language', 'saving_setting_error'));
            $full_error = str_replace("{y}", $value, $error);
            ErrorHandler::logCustomError($full_error);
            global $cobalt_settings_error;
            $cobalt_settings_error = $full_error . '<br />' . $cobalt_language->get('language', 'try_again');
        }
    }

    function getSetting($setting) {
        $setting_directory = ROOT_PATH . "/cobalt-settings.json";

        $str = file_get_contents($setting_directory);
        $json = json_decode($str, true);

        if (isSettingStored($setting)) {
            return htmlspecialchars_decode($json[$setting]);
        }
    }