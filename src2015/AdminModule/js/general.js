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
			newoption = new Option(source.options[0].text);
			destination.options[destination.length]=newoption;
			source.options[0]=null;
		}
	else//move selected ones
		for (i=0; i<source.length; i++)
			if(source.options[i].selected==true){
				newoption = new Option(source.options[i].text);
				destination.options[destination.length]=newoption;
				source.options[i]=null;
				i--;
			}
	Sort(destination);
}
function Sort(obj)
{
		var content = new Array();
		for (i=0;i<obj.length;i++) content.push(obj.options[i].text);
		content.sort();
		for(i=0;i<content.length;i++) obj.options[i].text=content[i];	
}
function ChangeCheckAll(objSource,desID){
	var des = document.getElementById(desID);
	for(i=0;i<des.all.length;i++) if(des.all[i].type=="checkbox") des.all[i].checked = objSource.checked;
}
function OpenWindow(theURL,winName,features,width,height) { //v2.0
	cusFeatures = "center:yes;status:no;dialogWidth:" + width + "px;dialogHeight:" + height + "px";
	features += (features=='') ? cusFeatures : ";"+cusFeatures;

	showModalDialog(theURL,winName,features);
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
// 1:date1>date2
//dd/mm/yyyy
function Date1GrDate2(date1,date2)
{

   if(!(IsValidDate(date1) &&IsValidDate(date2))) return false ;
   var date_= date1.split("/");
   var Day =date_[0];
   var Mn = date_[1];
   var Yr = date_[2];
   var dt = new Date(Mn+'/'+Day+'/'+Yr);
   
   var date_2= date2.split("/");
   var Day2 =date_2[0];
   var Mn2 = date_2[1];
   var Yr2 = date_2[2];
   var dt2 = new Date(Mn2+'/'+Day2+'/'+Yr2);
  
   if(dt>dt2)
   return true;
   
   return false;
   

}
//dd/mm/yyyy
function IsValidDate(DateVal)
{
   
   var date_= DateVal.split("/");
   if(date_.length!=3) return false;
   
   var Day =date_[0];
   var Mn = date_[1];
   var Yr = date_[2];
   var dt = new Date(Mn+'/'+Day+'/'+Yr);

    if(dt.getDate()!=Day){
        return(false);
        }
    else if(dt.getMonth()!=Mn-1){
 
        return(false);
        }
    else if(dt.getFullYear()!=Yr){
        return(false);
        }
        
    return(true);
 }
//----------------------------------------------
function getof(obj)
{
 return getObjectForm(obj);
}
function getObjectForm(objname)
{
    var form1 = document.forms[0];
    for(var i=0;i<form1.elements.length;i++)
    {
        if( document.forms[0].elements[i].id.indexOf(objname)>-1)
        return document.forms[0].elements[i];
    }
    return null;
}
//----------------------------------------------