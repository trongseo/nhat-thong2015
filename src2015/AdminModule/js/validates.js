//document.all('image_type').style.display='none';
 function  isEmailYahoo(s)
 {
    if(!isEmail(s)) return false ;
	var ar_=  s.split("@");
	
	if( ar_[1]!='yahoo.com' )
	 return false ;
	 
	 return true ;
	
	
 }
 
 
function isEmail (s)
{   
	if (isEmpty(s)) 
		if (isEmail.arguments.length == 1) return false;
		else return (isEmail.arguments[1] == true);
		
  if (isWhitespace(s)) return false;
  
  var i = 1;
  var sLength = s.length;

  while ((i < sLength) && (s.charAt(i) != "@"))
  { i++
  }

  if ((i >= sLength) || (s.charAt(i) != "@")) return false;
  else i += 2;

  while ((i < sLength) && (s.charAt(i) != "."))
  { i++
  }
  		
	/*if ((s.indexOf(".com")<5)&&(s.indexOf(".org")<5)
		&&(s.indexOf(".gov")<5)&&(s.indexOf(".net")<5)
		&&(s.indexOf(".mil")<5)&&(s.indexOf(".edu")<5))
	{
		return false;
	}*/

  if ((i >= sLength - 1) || (s.charAt(i) != ".")) return false;
  else return true;
}
function isempty(s)
{

	 return isWhitespace (s);
}
function iswhitespace(s)
{
  return isWhitespace (s);
}
function isWhitespace (s)
{   
	var whitespace = " \t\n\r";
	var i;

  if (isEmpty(s)) return true;
  for (i = 0; i < s.length; i++)
  {   
    var c = s.charAt(i);
    if (whitespace.indexOf(c) == -1) return false;
  }
  return true;
}

function isDigit (c)
{	return ((c >= "0") && (c <= "9"))
}

function isAllDigit (s)
{   
  var i;
  if (isEmpty(s)) 
     if (isAllDigit.arguments.length == 1) return false;
     else return (isDigital.arguments[1] == true);
  for (i = 0; i < s.length; i++)
  {   
    var c = s.charAt(i);
    if (isDigit(c)==false)
    return false;
  }
  return true;
}

function isEmpty(s)
{   
	return ((s == null) || (s.length == 0))
}

function isStateCode(s)
{
	if (s.length !=2) return false;
	s = s.toUpperCase();
	var USStateCodeDelimiter = "|";
	var USStateCodes = "AL|AK|AS|AZ|AR|CA|CO|CT|DE|DC|FM|FL|GA|GU|HI|ID|IL|IN|IA|KS|KY|LA|ME|MH|MD|MA|MI|MN|MS|MO|MT|NE|NV|NH|NJ|NM|NY|NC|ND|MP|OH|OK|OR|PW|PA|PR|RI|SC|SD|TN|TX|UT|VT|VI|VA|WA|WV|WI|WY|AE|AA|AE|AE|AP"
	if (isEmpty(s)) 
		if (isStateCode.arguments.length == 1) return false;
    else return (isStateCode.arguments[1] == true);
	return ((USStateCodes.indexOf(s) != -1) && (s.indexOf(USStateCodeDelimiter) == -1))
}


function isPhone(s)
{
	if ( s.indexOf("+")>=0 && s.indexOf("+")!=0 ){
		return false;
	}
	var temp1 = s.split("(")
	var temp2 = s.split(")")
	var temp3 = s.split("-")
	var temp4 = s.split(".")
	if ( temp1.length >=3 || temp2.length>=3){
		return false
	}
/*	if (temp3.length+ temp4.length >=4){
		return false
	}*/
	if ( temp1.length != temp2.length ){
		return false;
	}
	if ( s.indexOf("(")>= 0 && s.indexOf(")")>=0 && s.indexOf(")") <= s.indexOf("(") ){
		return false;
	}
	if ( s.indexOf (")") >=0 && s.indexOf("-")>=0 && s.indexOf("-") <= s.indexOf(")") )
	{
		return false;
	}
	if ( s.indexOf (")") >=0 && s.indexOf(".")>=0 && s.indexOf(".") <= s.indexOf(")") )
	{
		return false;
	}
	for (var i=0;i < s.length;i++){
		var c= s.charAt(i);
		if (!isDigit(c) && c!="+"&& c!="("&& c!=")"&& c!="."&& c!="-"&& c!=" "){
			return false
		}
	}
	return true;
}

function checkDate(strdate,type)
  
  // TestDate(StringdateToChange,TypeOfFormat,StringOut)
  // StringdateToChange : Ngay muon kiem tra hop le
  // TypeOfFormat : Dang truyen vao cua ngay muon kiem tra hop le:
  // TypeOfFormat =1 : Truyen vao dd/mm/yyyy
  // TypeOfFormat =2 : Truyen vao mm/dd/yyyy
  // Tri tra ve cua ham 1: Ngay hop le
  //		      0: Ngay khong hop le rterretret
  {
 alert("strdate");
   return true;//chua lam xong nen return vay truoc
	var m,d,y;

	var t=new Array(0,31,28,31,30,31,30,31,31,30,31,30,31);
	var s, pos1,pos2;
	var s = strdate;
	if (s.length==0) return 1;
	pos1=s.indexOf("/",0);
	pos2=s.indexOf("/",pos1+1);
	if ((pos1<0)||(pos2<0))
		return false;
	d=parseInt(s.substr(0,pos1),10);
	m=parseInt(s.substr(pos1+1,pos2-pos1-1),10);
	y=parseInt(s.substr(pos2+1,s.length-pos2-1),10);
	var y1=s.substr(pos2+1,s.length-pos2-1);
	if (y1.length!=4) 
	 {
	   return false;
	 }
	if (y%4==0){
		if ((y%100) ==0 && (y%400) != 0){
			t[2]=28;
		}
		//Nam nhuan
		else{
			t[2]=29;
		    }
		}
	if (type == 1) {
		if ( (t[m]<d)||(d<1) || (m<1) || (m>12)){
			return false;
		}
		}	
	if (type == 2){
		if ((t[d]<m)||(m<1) || (d<1) || (d>12)){
			return false;
		}
		}
	return true;	
   }// end Testday
function checkNumber(str){
	var a, st;
	st= str;
	for (var i=0;i< st.length; i++){
		if (st.charAt(i) < '0' || st.charAt(i)>'9'){
			if (st.charAt(i) != '.') {
				return false;
			} 
		}
	}
	return true;
}
//chuoi dua vao la ki tu so
function ischeckNumber(str){
	var a, st;
	st= str;
	for (var i=0;i< st.length; i++){
		if (st.charAt(i) < '0' || st.charAt(i)>'9')
		{
				return false;
		}
	}
	return true;
}

function webdialog_(url,width_,height_){
	var cSearchValue=showModalDialog(url,0,"dialogWidth:width_;dialogHeight:height_");
	
	if (cSearchValue == -1 || cSearchValue == null)
        {
	   alert('You clicked cancel or the close box');	
	}
	else if (cSearchValue=="")
        {
	   alert('You didn\'t enter a value');
	}
	else
	{
	   alert('You want to search for ' + cSearchValue);
	}
}
//10 digit -- 090 091 098 095
function isMobilePhone(s)
{
  
	if( s.length !=10)
	{
	 return false ;
	}
	var head_ =	s.substr(0,3) ;
  if ( !((head_ =='090')||(head_ =='091')||(head_ =='098')||(head_ =='095')) ) 
  {
    return false ;
  }
 if(  ischeckNumber(s) == false)
 {
   return false ;
 }
 return true ;

}
// template : 08-7535841 or 066-753584
function checkPhoneNumber_( phone_)
{

  //08-222441232

	  if(phone_.length != 10)
	  return false ;

	
	if (! ((phone_.indexOf("-") ==2) ||(phone_.indexOf("-") ==3) )  )
	{
	  return false ;
	}
	var array_ = phone_.split("-");
	for( var i = 0 ; i <array_.length  ; i++)
	{

	 if( ischeckNumber(array_[i])  == false)
	 {
	  return false ;
	 }
	}
	
	return true ;

}

function IsMonth(month)
{

var monthx=parseInt(month);
if(monthx.toString()=='NaN')
return false;
    if(monthx<1 || monthx>12)
        return false;
    return true;
   
}

function IsYear(year)
{var Year=parseInt(year);
if(Year.toString()=='NaN')
return false;
    if(Year<1900 || Year>2300)
        return false;
    return true;
}

function checkDate(day,month,year)
{
   var monthLength = new Array(31,28,31,30,31,30,31,31,30,31,30,31);
	var dateExists = true;	
	var day = parseInt(day);
	var month = parseInt(month);
	var year = parseInt(year);
	if(day < 0 || day > 31)
	{
		
		return false;
	}
	if(month < 0 || month > 12){
		
		return false ;
	}
	if(year < 1900 || year > 2099){
		
		return false ;
	}
	if (!day || !month || !year)
	{
		
		return false ;
	}

	if (year/4 == parseInt(year/4))
		monthLength[1] = 29;		
	
	if (day > monthLength[month-1])
		dateExists = false;		

	monthLength[1] = 28;
	if (!dateExists) 
	{
		
		return false;
	}else
	{	
	   return	true;
	}
	
}
// xxx xu ly chuoi
function Trim(TRIM_VALUE)
{

  if(TRIM_VALUE.length < 1)
  {
   return"";
  }
TRIM_VALUE = RTrim(TRIM_VALUE);
TRIM_VALUE = LTrim(TRIM_VALUE);
if(TRIM_VALUE=="")
{
 return "";
}
  else
  {
   return TRIM_VALUE;
   }
} //End Function

function RTrim(VALUE){
var w_space = String.fromCharCode(32);
var v_length = VALUE.length;
var strTemp = "";
if(v_length < 0){
return"";
}
var iTemp = v_length -1;

while(iTemp > -1){
if(VALUE.charAt(iTemp) == w_space){
}
else{
strTemp = VALUE.substring(0,iTemp +1);
break;
}
iTemp = iTemp-1;

} //End While
return strTemp;

} //End Function

function LTrim(VALUE){
var w_space = String.fromCharCode(32);
if(v_length < 1){
return"";
}
var v_length = VALUE.length;
var strTemp = "";

var iTemp = 0;

while(iTemp < v_length){
if(VALUE.charAt(iTemp) == w_space){
}
else{
strTemp = VALUE.substring(iTemp,v_length);
break;
}
iTemp = iTemp + 1;
} //End While
return strTemp;
} //End Function

//vi trong's <b></b>
function trimandremove(velx)
{
   velx	= Trim(velx)
 return removehtml(velx);
}

function removehtml(valuex)
{
		var regEx = /<[^>]*>/g; 
		return  valuex.replace(regEx, "");
	
}

function gete(vle)
{
 return	 document.getElementById(vle);
}
// kiểm tra selecbox xem có đang chọn 1 giá trị nào đó không
function checkselect(selectobj,value_ )
{
	 for( var i=0;i<selectobj.length;i++)
	{
		  if(selectobj.options[i].selected==true)
		  {
			 if(selectobj.options[i].value==value_)
			 {
			   
				return false;
			 }
		   
		  }
	}
					
return true;
					
}

//hàm chuyển con trỏ nhảy 
function change_focus(f,o){

 var ret1 = "";
 var j=0;
 var i=0;
 var b=0;
 first_object_id = -1;
 //try{
  keyCode = window.event.keyCode;
  // Neu la phim Enter, Down, Up
  if (keyCode=='13' || keyCode=='40' || keyCode=='38') {
   b=0;
   while (i>=0&&(i<f.length)&&(j<2)){
    var e=f.elements[i];
    // Xac dinh ID cua field dau tien co kieu khong phai la hidden
    if (e.type!='hidden' && first_object_id==-1) first_object_id = i;
    // Tim de vi tri cua doi tuong hien tai
    if ((b==0)&&(e.name==o.name)&&(e.type!='hidden')){
     o.blur();
     b=1;
     if (keyCode!='38'){
      i=i+1;
      if (i==f.length) i = first_object_id;
     }else{
      if (i==first_object_id) i=f.length-1;else i=i-1;
     }
     var e=f.elements[i];
    }
    if (b==1){
     if ((e.type!='hidden')&&(!e.readOnly)&&(!e.disabled)&&(e.hide!='true')){
      e.focus();
      return true;
     }
    }
    if (keyCode!='38'){ 
     i=i+1
	
     if (i==f.length) {i=0;j=j+1;}
    }else{
     i=i-1;
     if (i==first_object_id){i=f.length-1;j=j+1;}
    }
   }
  }
  return true;
 //}catch(e){}
}
/// fileex = .gif ,.ag.g
function CheckImage(path)
{
    var userFile = path;
		if (userFile != '') 
		{
			arr = userFile .split('.');
			len = arr.length;
			str = arr[len - 1];
			result = false;		
			str = str.toLowerCase();			
			switch (str) 
			{
				case "jpg":
					result = true;		
					break;
				case "gif":
					result = true;			
					break;
				case "png":
					result = true;			
					break;	
				case "jpe":
					result = true;			
					break;
				case "jpeg":
					result = true;			
					break;		
				case "bmp":
					result = true;			
					break;							
			}
			if (!result) 
			{
				return false;
			}
		}
		return true;
}

function CheckMusic(path)
{
 var userFile = path;
		if (userFile != '') 
		{
			var arr = userFile .split('.');//v:/as.hi
			len = arr.length;
			str = arr[len - 1];
			result = false;		
			str = str.toLowerCase();			
			switch (str) 
			{
				case "mp3":
					result = true;		
					break;
				case "wma":
					result = true;			
					break;
				case "wav":
					result = true;			
					break;
			}
			if (!result) 
			{
				return false;
			}
		}
		return true;
}


function getobj(a)
{
   return document.getElementById(a);
}

function getvalue(a)
{
   return document.getElementById(a).value;
}