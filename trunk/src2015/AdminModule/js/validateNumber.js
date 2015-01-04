function FormatNumber(num,nCountryCode)
{       
        var sVal='';
        var CommaDelimiter='';

        try 
       {

           CommaDelimiter = GetCommaDelimiter(nCountryCode);
           num = FormatClean(num);
			if (null==num || num == ''){
				return '';
			}
    		num = parseFloat(num);		

           var samount = new String(num);
             
           for (var i = 0; i < Math.floor((samount.length-(1+i))/3); i++)
          {
             samount = samount.substring(0,samount.length-(4*i+3)) + CommaDelimiter + samount.substring(samount.length-(4*i+3));
           }
		  
        }
         catch (exception) { AlertError("Format Number",e); }
        return samount;
}
function unFormatNumber(num)
{
  return FormatClean(num)
}
function FormatClean(num)
{
     var sVal='';
     var nVal = num.length;
     var sChar='';     
   try
   {
       for(i=0;i<nVal;i++)
      {
         sChar = num.charAt(i);
         nChar = sChar.charCodeAt(0);
         if ((nChar >=48) && (nChar <=57))  { sVal += num.charAt(i);   }
      }	  
   }
    catch (exception) { AlertError("Format Clean",e); }
    return sVal;
}

function GetDecimalDelimiter(nCountryCode)
{

       var sRet='';

       switch (nCountryCode)
       {

            case 3:   
                           
                           sRet = '#';
                           break;
            
            case 2:   
                           
                           sRet = ',';
                           break;
            default:
                           sRet = '.';
                           break;
 
        }

      return sRet;

}

function GetCommaDelimiter(nCountryCode)
{

       var sRet='';

       switch (nCountryCode)
       {
            
            case 3:   
                           
                           sRet = '*';
                           break;
            case 2:   
                           
                           sRet = ',';
                           break;
            default:
                           sRet = ',';
                           break;
 
        }

      return sRet;

}





 

function FormatCurrency(num,nCountryCode)
{       
        var sVal='';
        var minus='';
        var Decimal='';
        Decimal = GetDecimalDelimiter(nCountryCode);
        if (num.lastIndexOf("-") == 0) { minus='-'; }
        if (num.lastIndexOf(Decimal) < 0) { num = num + '00'; }
        num = FormatClean(num);
        sVal = minus + FormatDollar(num,GetCommaDelimiter(nCountryCode)) + GetDecimalDelimiter(nCountryCode) + FormatCents(num); 
        return sVal;
}




function AlertError(MethodName,e)
 {
            if (e.description == null) { alert(MethodName + " Exception: " + e.message); }
            else {  alert(MethodName + " Exception: " + e.description); }
 }