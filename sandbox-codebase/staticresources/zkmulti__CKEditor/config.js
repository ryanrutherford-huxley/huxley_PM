/**
 * @license Copyright (c) 2003-2017, CKSource - Frederico Knabben. All rights reserved.
 * For licensing, see LICENSE.md or http://ckeditor.com/license
 */

CKEDITOR.editorConfig = function( config ) {
	// Define changes to default configuration here. For example:
	// config.language = 'fr';
	// config.uiColor = '#AADC6E';
	removeButtons = 'About';
	config.toolbar = [
		{ name: 'clipboard', items: [ 'Undo', 'Redo' ] },
		{ name: 'basicstyles', items: [ 'Bold', 'Italic', 'Underline', 'Strike', '-', 'RemoveFormat', 'CopyFormatting' ] },
		{ name: 'styles', items: [ 'Format' ] },
		{ name: 'colors', items: [ 'TextColor', 'BGColor' ] },
		{ name: 'align', items: [ 'JustifyLeft', 'JustifyCenter', 'JustifyRight', 'JustifyBlock' ] },
		{ name: 'paragraph', items: [ 'NumberedList', 'BulletedList', '-', 'Blockquote' ] },
		{ name: 'links', items: [ 'Link', 'Unlink' ] },
		{ name: 'insert', items: [ 'Image' ] },
		{ name: 'tools', items: [ 'Maximize' ] }
	];
	// Disable Automatic Advanced Content Filter 
	config.allowedContent = true;
	// config.disallowedContent = 'img{width,height,float}';
	// config.extraAllowedContent = 'img[width,height,align]';
	config.bodyClass = 'article-editor';
	config.removeDialogTabs = 'image:advanced;link:advanced';
};
