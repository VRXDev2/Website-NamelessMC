<?php

/**
 *	LITHIUM TEMPLATE
 *	By Xemah | https://xemah.com
 *
**/

if (!function_exists('getPanels')) {

	function getPanels()
	{
		ob_start();
	
		$panelFiles = array_filter(scandir(__DIR__ . '/panels'), function($file) {
			return (!is_dir($file) && $file !== '.' && $file !== '..');
		});
	
		$panels = [];
		foreach ($panelFiles as $panel) {
			require(__DIR__ . '/panels/' . $panel);
			$panelName = pathinfo($panel, PATHINFO_FILENAME);
			$panels[$panelName] = ob_get_contents();
			ob_clean();
		}
	
		ob_end_flush();
		return $panels;
	}	

}

if (!function_exists('createInput')) {

	function createInput($name, $type, $attributes)
	{
		$data = LithiumTemplate::getConfig();
		if (isset($data[$name])) {
			$attributes['value'] = $data[$name];
		} else if (isset($attributes['value'])) {
			LithiumTemplate::saveConfig([$name => $attributes['value']]);
		}

		if ($type != 'groups') {

			$attributes['id'] = 'input-' . sanitizeString($name) . '-' . substr(md5(mt_rand()), 0, 6);
			echo createInputHtml($name, $type, $attributes);
			return;

		}

		extract($attributes);
		
		$items = $value;
		$totalItems = count(array_values($items)[0]);

		$inputsArr = [];
		for ($i = 0; $i < $totalItems; $i++) {
			$inputsArr[$i] = $template;
			foreach ($template as $key => $input) {
				$inputsArr[$i][$key][2]['value'] = $items[$input[0]][$i];
			}
		}

		$inputsHtml = '';
		foreach ($inputsArr as $key => $inputs) {

			$inputId = substr(md5(mt_rand()), 0, 6);
			
			$_inputsHtml = '';
			foreach ($inputs as $input) {
				$input[2]['id'] = 'input-' . sanitizeString("{$name}-{$input[0]}") . '-' . $inputId;
				$_inputsHtml .= createInputHtml("{$name}[{$input[0]}][]", $input[1], $input[2]);
			}

			$inputsHtml .= "
				<div class=\"lithium-input-group\">
					<div class=\"lithium-input-group-divider\">
						{$attributes['label']}
						-&nbsp;<span class=\"lithium-input-group-counter\"></span>
						<div class=\"lithium-input-group-actions\">
							<a href=\"#\" class=\"lithium-input-group-remove\">
								<i class=\"fas fa-times-circle\"></i>
							</a>
						</div>
					</div>
					{$_inputsHtml}
				</div>
			";

		}

		$templateInputsHtml = '';
		foreach ($template as $input) {
			$input[2]['id'] = 'input-' . sanitizeString("{$name}-{$input[0]}") . '-{inputId}';
			$templateInputsHtml .= createInputHtml("{$name}[{$input[0]}][]", $input[1], $input[2]);
		}

		$finalHtml = "
			<div class=\"lithium-input-groups\">
				{$inputsHtml}
				<template>
					<div class=\"lithium-input-group-divider\">
						{$label}
						-&nbsp;<span class=\"lithium-input-group-counter\"></span>
						<div class=\"lithium-input-group-actions\">
							<a href=\"#\" class=\"lithium-input-group-remove\">
								<i class=\"fas fa-times-circle\"></i>
							</a>
						</div>
					</div>
					{$templateInputsHtml}
				</template>
				<div class=\"lithium-input-group-divider\">
					<a href=\"#\" class=\"lithium-button lithium-button-more\">Add New Item</a>
				</div>
			</div>
		";

		echo $finalHtml;
	}

}

if (!function_exists('createInputHtml')) {

	function createInputHtml($name, $type, $attributes)
	{
		$attributes = array_merge([
			'label' => '',
			'description' => '',
			'id' => '',
			'value' => '',
			'options' => []
		], $attributes);

		extract($attributes);

		if (isset($options) && $options == 'pages') {

			global $pages;

			$pagesOptions = array_filter($pages->returnPages(), function($p) {
				return $p['widgets'] == true;
			});

			$options = [];
			foreach ($pagesOptions as $option) {
				$options[$option['name']] = ucfirst($option['name']);
			}

		}

		if (is_string($value)) {
			$value = htmlentities($value);
		}

		if ($type == 'text') {

			$inputHtml = "<input type=\"text\" class=\"lithium-input-text\" id=\"{$id}\" name=\"{$name}\" value=\"{$value}\">";

		}

		if ($type == 'textShort') {

			$inputHtml = "<input type=\"text\" class=\"lithium-input-text-short\" id=\"{$id}\" name=\"{$name}\" value=\"{$value}\">";

		}

		if ($type == 'textarea') {

			$inputHtml = "<textarea class=\"lithium-input-textarea\" id=\"{$id}\" name=\"{$name}\">{$value}</textarea>";

		}

		if ($type == 'code') {

			$inputHtml = "<textarea class=\"lithium-input-code\" id=\"{$id}\" name=\"{$name}\">{$value}</textarea>";

		}

		if ($type == 'select') {

			$optionsHtml = '';
			if (isset($options) && !empty($options)) {
				foreach ($options as $optionValue => $optionLabel) {
					$optionSelected = ($optionValue == $value ? ' selected' : '');
					$optionsHtml .= "<option value=\"{$optionValue}\"{$optionSelected}>{$optionLabel}</option>";
				}
			}

			$inputHtml = "<select class=\"lithium-input-select\" id=\"{$id}\" name=\"{$name}\">{$optionsHtml}</select>";

		}

		if ($type == 'selectMultiple') {

			$optionsHtml = '';
			if (isset($options) && !empty($options)) {
				foreach ($options as $optionValue => $optionLabel) {
					$optionSelected = (!empty($value) && in_array($optionValue, $value) ? ' selected' : '');
					$optionsHtml .= "<option value=\"{$optionValue}\"{$optionSelected}>{$optionLabel}</option>";
				}
			}

			$inputHtml = "
				<input type=\"hidden\" name=\"{$name}\" value=\"\">
				<select class=\"lithium-input-select-multiple\" id=\"{$id}\" name=\"{$name}[]\" multiple>{$optionsHtml}</select>
			";

		}

		if ($type == 'checkbox' || $type == 'switch') {

			$inputChecked = ($value == '1' ? ' checked' : '');
			$inputHtml = "
				<input type=\"hidden\" name=\"{$name}\" value=\"0\">
				<input type=\"checkbox\" class=\"lithium-input-switch\" id=\"{$id}\" name=\"{$name}\" value=\"1\"{$inputChecked}>
			";

		}

		if ($type == 'color') {

			$inputHtml = "<input type=\"color\" class=\"lithium-input-color\" id=\"{$id}\" name=\"{$name}\" value=\"{$value}\">";

		}

		if ($type == 'number') {

			$inputHtml = "<input type=\"number\" class=\"lithium-input-number\" id=\"{$id}\" name=\"{$name}\" value=\"{$value}\">";

		}

		if ($type == 'image') {

			$inputUploadHtml = "<label class=\"lithium-input-image-label\" for=\"upload-{$id}\"></label>";
			if (!empty($value)) {
				$inputUploadHtml = "<label class=\"lithium-input-image-label\" for=\"upload-{$id}\" data-status=\"uploaded\" style=\"--value: url('{$value}');\"></label>";
			}
			
			$inputActionsHtml = "
				<li class=\"lithium-input-action-remove-image\">
					<a href=\"#\">Remove Image</a>
				</li>
			";

			$inputActionsHtml .= '</ul>';

			$inputHtml = "
				<input type=\"hidden\" id=\"{$id}\" name=\"{$name}\" value=\"{$value}\">
				<input type=\"file\" class=\"lithium-input-image\" id=\"upload-{$id}\" accept=\"image/*\">
				{$inputUploadHtml}
				<div class=\"lithium-input-actions\">
					{$inputActionsHtml}
				</div>
				<div class=\"lithium-input-error\"></div>
			";

		}

		$labelHtml = '';
		if (isset($label) && !empty($label)) {
			$labelHtml = "<label class=\"lithium-input-label\" for=\"{$id}\">{$label}</label>";
		}

		$descriptionHtml = "";
		if (isset($description) && !empty($description)) {
			$descriptionHtml = "<div class=\"lithium-input-meta\">{$description}</div>";
		}

		$finalHtml = "
			<div class=\"lithium-input\" data-input-id=\"{$id}\">
				{$labelHtml}
				{$inputHtml}
				{$descriptionHtml}
			</div>
		";

		return $finalHtml;
	}

}

if (!function_exists('sanitizeString')) {
	
	function sanitizeString($string)
	{
		$string = preg_replace('/[A-Z]([A-Z](?![a-z]))*/', '-$0', $string);
		$string = ltrim($string, '-');
		$string = strtolower($string);
		return $string;
	}

}