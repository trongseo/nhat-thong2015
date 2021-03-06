/**
 * $Id: editor_plugin_src.js 520 2008-01-07 16:30:32Z spocke $
 *
 * @author Moxiecode
 * @copyright Copyright © 2004-2008, Moxiecode Systems AB, All rights reserved.
 */

(function() {
	tinymce.create('tinymce.plugins.eBizIconPlugin', {
		init : function(ed, url) {
			// Register commands
			ed.addCommand('cmEbizIcon', function() {
				ed.windowManager.open({
					file : url + '/emotions.htm',
					width : 420 + parseInt(ed.getLang('emotions.delta_width', 0)),
					height : 360 + parseInt(ed.getLang('emotions.delta_height', 0)),
					inline : 1
				}, {
					plugin_url : url
				});
			});

			// Register buttons
			ed.addButton('eBizIcon', {title : 'Chèn hình vui', cmd : 'cmEbizIcon', 'class' : 'mybutton_class mce_emotions'});
		},

		getInfo : function() {
			return {
				longname : 'Emotions',
				author : 'Moxiecode Systems AB',
				authorurl : 'http://tinymce.moxiecode.com',
				infourl : 'http://wiki.moxiecode.com/index.php/TinyMCE:Plugins/emotions',
				version : tinymce.majorVersion + "." + tinymce.minorVersion
			};
		}
	});

	// Register plugin
	tinymce.PluginManager.add('eBizIcon', tinymce.plugins.eBizIconPlugin);
})();