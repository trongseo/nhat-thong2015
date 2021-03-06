/**
 * $Id: editor_plugin_src.js 520 2008-01-07 16:30:32Z spocke $
 *
 * @author Moxiecode
 * @copyright Copyright © 2004-2008, Moxiecode Systems AB, All rights reserved.
 */

(function() {
	tinymce.create('tinymce.plugins.eBizImagePlugin', {
		init : function(ed, url) {
			// Register commands
			ed.addCommand('cm_eBizImage', function() {
				ed.windowManager.open({
					file : url + '/link.htm',
					width : '300px',
					height : '100px',
					inline : 1
				}, {
					plugin_url : url
				});
			});

			// Register buttons
			ed.addButton('eBizImage', {title : 'Thêm hình', cmd : 'cm_eBizImage', 'class' : 'mybutton_class mce_image'});
		},

		getInfo : function() {
			return {
				longname : 'eBizImage',
				author : 'Moxiecode Systems AB',
				authorurl : 'http://tinymce.moxiecode.com',
				infourl : 'http://wiki.moxiecode.com/index.php/TinyMCE:Plugins/emotions',
				version : tinymce.majorVersion + "." + tinymce.minorVersion
			};
		}
	});
	
	// Register plugin
	tinymce.PluginManager.add('eBizImage', tinymce.plugins.eBizImagePlugin);
})();