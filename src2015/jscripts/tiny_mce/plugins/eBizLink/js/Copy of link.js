var eBizLinkDialog = {
	init : function(ed) {
		tinyMCEPopup.resizeToInnerSize();
	},

	insert : function(imageLink) {  
	    
		lnkName = document.getElementById("linkName").value;
		
		lnkPath = document.getElementById("linkPath").value;
		
		if (lnkPath != '')
		{  
			var ed = tinyMCEPopup.editor, dom = ed.dom;

			tinyMCEPopup.execCommand('mceInsertContent', false, '[url=' + lnkPath + ']' + (lnkName == '' ? 'link' : lnkName) + '[/url]');

			tinyMCEPopup.close();
		}
		else
		{
			tinyMCEPopup.close();
		}
	}
};

tinyMCEPopup.onInit.add(eBizLinkDialog .init, eBizLinkDialog);
