/**
 *	LITHIUM TEMPLATE
 *	By Xemah | https://xemah.com
 *
**/

(() => {

	document.title = 'Lithium Template Settings';

	let activePanel;

	const body = document.querySelector('.lithium-body');
	const panels = document.querySelectorAll('.lithium-panel');
	const updateButton = document.querySelector('.lithium-button-update');
	const updateInfo = document.querySelector('.lithium-info-update');
	const previewFrame = document.querySelector('.lithium-preview-frame');

	const findAncestor = (el, sel) => {

		if ((el.matches || el.matchesSelector).call(el, sel)) {
			return el;
		}
	
		while ((el = el.parentElement) && !((el.matches || el.matchesSelector).call(el, sel)));
		return el;
	
	}

	const switchPanel = (targetPanelId) => {
	
		for (let panel of panels) {
			if (panel.id == targetPanelId) {
				activePanel = panel;
				panel.classList.add('lithium-panel-active');
				if (panel.querySelector('form')) {
					updateButton.classList.remove('lithium-button-disabled');
				} else {
					updateButton.classList.add('lithium-button-disabled');
				}
			} else {
				panel.classList.remove('lithium-panel-active');
			}
		}
	
	}

	const update = async () => {
		
		const panelForm = activePanel.querySelector('form');
		if (panelForm) {
			const panelFormData = new FormData(panelForm);
			updateButton.classList.add('lithium-button-disabled');
			updateInfo.innerHTML = '<i class="fas fa-sync fa-spin"></i> &nbsp; Updating...';
			const response = await fetch(`${location.href.replace(location.hash, '')}&process=update_config`, { method: 'POST', body: panelFormData });
			const responseText = await response.text();
			let responseJson = null;
			try { responseJson = JSON.parse(responseText) } catch (err) { };
			updateButton.classList.remove('lithium-button-disabled');
			if (responseJson && responseJson.success == true) {
				updateInfo.innerHTML = '<i class="fas fa-check-circle"></i> &nbsp; All changes saved!';
				previewFrame.src = previewFrame.contentWindow.location.href;
			} else {
				updateInfo.innerHTML = '<i class="fas fa-exclamation-circle"></i> &nbsp; An error occured!';
				console.error('An error occured while updating the settings.\nResponse text: \n', responseText);
			}
			setTimeout(() => {
				updateInfo.innerHTML = '';
			}, 5000);
		}
	
	}

	document.addEventListener('click', (event) => {

		const updateButton = findAncestor(event.target, '.lithium-button-update');
		if (updateButton) {
			event.preventDefault();
			update();
		}
	
		const panelTrigger = findAncestor(event.target, '[href^="#lithium-panel"]');
		if (panelTrigger) {
			event.preventDefault();
			switchPanel(panelTrigger.getAttribute('href').substring(1));
		}
	
		const inputGroupRemoveButton = findAncestor(event.target, '.lithium-input-group-remove');
		if (inputGroupRemoveButton) {
			event.preventDefault();
			const inputGroup = findAncestor(inputGroupRemoveButton, '.lithium-input-group');
			if (inputGroup) {
				inputGroup.remove();
			}
		}
	
		const inputGroupMoreButton = findAncestor(event.target, '.lithium-button-more');
		if (inputGroupMoreButton) {
			event.preventDefault();
			const inputId = Math.random().toString(36).substr(2, 6);
			const inputGroups = findAncestor(inputGroupMoreButton, '.lithium-input-groups');
			const inputGroupTemplate = inputGroups.querySelector('template');
			const inputGroupTemplateFormed = document.createElement('div');
			inputGroupTemplateFormed.classList.add('lithium-input-group');
			inputGroupTemplateFormed.innerHTML = inputGroupTemplate.innerHTML.split('{inputId}').join(inputId);
			inputGroups.insertBefore(inputGroupTemplateFormed, inputGroupTemplate);
		}
	
		const inputRemoveImageAction = findAncestor(event.target, '.lithium-input-action-remove-image a');
		if (inputRemoveImageAction) {
			event.preventDefault();
			const mainInput = findAncestor(event.target, '.lithium-input');
			const inputId = mainInput.dataset.inputId;
			const fileInput = mainInput.querySelector(`#${inputId}`);
			fileInput.value = '';
			const inputLabel = mainInput.querySelector('.lithium-input-image-label');
			inputLabel.style.setProperty('--value', 'none');
			inputLabel.dataset.status = '';
		}
	
	});
	
	document.addEventListener('change', async (event) => {
	
		const imageInput = findAncestor(event.target, '.lithium-input-image')
		if (imageInput) {
			event.preventDefault();
			const mainInput = findAncestor(event.target, '.lithium-input');
			const inputId = mainInput.dataset.inputId;
			const fileInput = mainInput.querySelector(`#${inputId}`);
			const file = imageInput.files[0];
			const inputLabel = mainInput.querySelector(`.lithium-input-image-label`);
			const reader = new FileReader();
			reader.addEventListener('load', (e) => inputLabel.style.setProperty('--value', `url('${e.target.result}')`));
			reader.readAsDataURL(file);
			const formData = new FormData();
			formData.append('file', file);
			inputLabel.dataset.status = 'uploading';
			const response = await fetch(`${location.href.replace(location.hash, '')}&process=image_upload`, { method: 'POST', body: formData });
			const responseText = await response.text();
			let responseJson = null;
			try { responseJson = JSON.parse(responseText) } catch (err) { };
			const inputError = mainInput.querySelector(`.lithium-input-error`);
			if (responseJson && responseJson.success == true) {
				inputError.innerHTML = '';
				fileInput.value = responseJson.data.url;
				inputLabel.dataset.status = 'uploaded';
			} else {
				inputError.innerHTML = responseJson.error;
				inputLabel.style.setProperty('--value', 'none');
				inputLabel.dataset.status = '';
				console.error('An error occured while uploading the image.\nResponse text: \n', responseText);
				if (responseJson && responseJson.error) {
					inputError.innerHTML = responseJson.error;
				} else {
					inputError.innerHTML = 'An error occured while uploading the image.';
				}
			}
		}
	
	});
	
	document.addEventListener('keydown', (event) => {
	
		const codeInput = findAncestor(event.target, '.lithium-input-code');
		if (codeInput) {
			if (event.keyCode == 9) {
				event.preventDefault();
				document.execCommand('insertText', false, '	');
			}
		}
		
		if ((event.keyCode == 17 || event.ctrlKey) && (event.keyCode == 83)) {
			event.preventDefault();
			update(event);
		};
	
	});
	
	document.addEventListener('readystatechange', () => {
		if (document.readyState === 'complete') {
			body.classList.add('lithium-loaded');
		}
	});
	
	switchPanel('lithium-panel-menu');

})();