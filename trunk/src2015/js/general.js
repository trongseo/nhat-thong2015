// JavaScript Document
function MM_preloadImages() { //v3.0
  var d=document; if(d.images){ if(!d.MM_p) d.MM_p=new Array();
    var i,j=d.MM_p.length,a=MM_preloadImages.arguments; for(i=0; i<a.length; i++)
    if (a[i].indexOf("#")!=0){ d.MM_p[j]=new Image; d.MM_p[j++].src=a[i];}}
}

function MM_swapImgRestore() { //v3.0
  var i,x,a=document.MM_sr; for(i=0;a&&i<a.length&&(x=a[i])&&x.oSrc;i++) x.src=x.oSrc;
}

function MM_findObj(n, d) { //v4.01
  var p,i,x;  if(!d) d=document; if((p=n.indexOf("?"))>0&&parent.frames.length) {
    d=parent.frames[n.substring(p+1)].document; n=n.substring(0,p);}
  if(!(x=d[n])&&d.all) x=d.all[n]; for (i=0;!x&&i<d.forms.length;i++) x=d.forms[i][n];
  for(i=0;!x&&d.layers&&i<d.layers.length;i++) x=MM_findObj(n,d.layers[i].document);
  if(!x && d.getElementById) x=d.getElementById(n); return x;
}
function MM_swapImage() { //v3.0
  var i,j=0,x,a=MM_swapImage.arguments; document.MM_sr=new Array; for(i=0;i<(a.length-2);i+=3)
   if ((x=MM_findObj(a[i]))!=null){document.MM_sr[j++]=x; if(!x.oSrc) x.oSrc=x.src; x.src=a[i+2];}
}

//User function
function MoveItem(sourceID,desID,option){
	var source = document.getElementById(sourceID);
	var destination = document.getElementById(desID);
	if(option=='all') //move all
		while(source.length>0){
			newoption = new Option(source.options[0].text, source.options[0].value);
			destination.options[destination.length]=newoption;
			source.options[0]=null;
		}
	else//move selected ones
		for (i=0; i<source.length; i++)
			if(source.options[i].selected==true){
				newoption = new Option(source.options[i].text, source.options[i].value);
				destination.options[destination.length]=newoption;
				source.options[i]=null;
				i--;
			}
	Sort(destination);
}
function Sort(obj)
{
		var content = new Array();
		var values = new Array();
		var tmpc;
		for (i=0;i<obj.length;i++) 
		{
		  content.push(obj.options[i].text);
		  values.push(obj.options[i].value);
		}
		for (i=0; i<obj.length -1; i++)
		  for (j=i+1; j<obj.length; j++)		  
		    if (content[i].toUpperCase() > content[j].toUpperCase())
		    {
		      tmpc = content[i];
		      content[i]=content[j];
		      content[j]=tmpc;
		      tmpc = values[i];
		      values[i]=values[j];
		      values[j]=tmpc;
		    }
		//content.sort();
		for(i=0;i<content.length;i++) 
		{
		  obj.options[i].text=content[i];	
      obj.options[i].value=values[i];			
    }
}
function ChangeCheckAll(objSource){
	var form = document.forms[0];	
	try
	{
	    for(i=0;i<form.length;i++)	
	    {   
		    if(form[i].id.indexOf("chkItem")!=-1 && form[i].disabled==false) 
		    {			    
			    form[i].checked=objSource.checked;			    
		    }
	    }
    }
    catch(er){}	
}
function CheckItemClick(chkAllItemName, chkItemName)
{
    var form = document.forms[0];
    var chkAllItem = document.getElementById(chkAllItemName);
    if (chkAllItem == null)return;    
    for(i=0;i<form.length;i++)	
    {   
	    if(form[i].id.indexOf(chkItemName)!=-1 && form[i].disabled==false && form[i].checked==false)
	    {
	        chkAllItem.checked = false; 
	        return;
	    }
    }
    chkAllItem.checked = true; 
}
//function OpenWindow(theURL,winName,features,width,height) { //v2.0
//	cusFeatures = "center:yes;status:no;dialogWidth:" + width + "px;dialogHeight:" + height + "px";
//	features += (features=='') ? cusFeatures : ";"+cusFeatures;

//	return showModalDialog(theURL,winName,features);
//}
function OpenWindow(theURL,winName,features,width,height) { //v2.0
	position = "width=" + width + ",height=" + height + ",top=" + (screen.height-height)/2 + ",left=" + (screen.width-width)/2;
	features += (features=='') ? position : ","+position;
	window.open(theURL,winName,features);
}
function ShowMenu(menuID,posLeft,posTop)
{
	timerID = setTimeout('HideMenu(\''+menuID+'\')',2000);

    menu=MM_findObj(menuID);  	
  	
    menu.style.top = posTop;
    menu.style.left = posLeft;	
	document.getElementById("mask").height=menu.offsetHeight+"px";
	iframe = MM_findObj("iFrameMenu");
    iframe.style.top = posTop;
   	iframe.style.left = posLeft;
    iframe.style.width = menu.style.width;
	iframe.style.visibility="visible";
    menu.style.visibility="visible";
}
function HideMenu(menuID)
{
	menu=MM_findObj(menuID); 	
	menu.style.visibility="hidden";
	iframe = MM_findObj("iFrameMenu");
	iframe.style.visibility="hidden";
}
function ShowHideObject(objID,classShowHide)
{
	obj = document.getElementById(objID);
	obj.className = classShowHide;
}
function VerifyDelete(messageAlert, messageConfirm)
{
    var form = document.forms[0];
    for(i=0;i<form.length;i++)
    {
        if(form[i].checked==true && form[i].type=="checkbox" && form[i].name.indexOf('$chkItem')>0) return confirm(messageConfirm);
    }
    alert(messageAlert);
    return false;
}
function Disable(desID,value){
	des = document.getElementById(desID);
	for(i=0; i<des.all.length; i++)	des.all[i].disabled = value;
}
function MaxLength(selObject,maxlength)
{
	if(selObject.value.length>maxlength)
	{
		selObject.value=selObject.value.slice(0,maxlength);
		//selObject.focus();
		return false;
	}
}
         
function ShowHideObject(obj)
{
    if(document.getElementById(obj).style.display=='')
    {
        document.getElementById(obj).style.display='none';
    }else
    {
        document.getElementById(obj).style.display='';
    }
}
function ShowObject(status,obj)
{
    document.getElementById(obj).style.display=status;
}
function getURL(strParamName){
  var strReturn = "";
  var strHref = window.location.href;
  if ( strHref.indexOf("?") > -1 ){
    var strQueryString = strHref.substr(strHref.indexOf("?")).toLowerCase();
    var aQueryString = strQueryString.split("&");
    for ( var iParam = 0; iParam < aQueryString.length; iParam++ ){
      if (
aQueryString[iParam].indexOf(strParamName.toLowerCase() + "=") > -1 ){
        var aParam = aQueryString[iParam].split("=");
        strReturn = aParam[1];
        break;
      }
    }
  }
  return unescape(strReturn);
} 