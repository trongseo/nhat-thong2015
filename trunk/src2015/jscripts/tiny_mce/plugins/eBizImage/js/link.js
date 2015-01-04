var eBizLinkDialog = {
	init : function(ed) {
		tinyMCEPopup.resizeToInnerSize();
	},

	insert : function(imageLink) {
		imageLink = document.getElementById("imageLink").value;
		if (imageLink != '')
		{
			var ed = tinyMCEPopup.editor, dom = ed.dom;

			tinyMCEPopup.execCommand('mceInsertContent', false, '[img]' + imageLink + '[/img]');

			tinyMCEPopup.close();
		}
		else
		{
			tinyMCEPopup.close();
		}
	}
};

tinyMCEPopup.onInit.add(eBizLinkDialog .init, eBizLinkDialog);
