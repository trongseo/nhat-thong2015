var lnkFirstEnabled = true;
var lnkPreviousEnabled = true;
var lnkNextEnabled = true;
var lnkLastEnabled = true;

var lnkFirstNavigateUrl;
var lnkPreviousNavigateUrl;
var lnkNextNavigateUrl;
var lnkLastNavigateUrl;
var LinkPreviousText;
var LinkNextText;

function CreateNavigationPanel(currentPage, pageSize, pageCount, navigateGroupSize, baseNavigateURL, adder)
{
    //alert("htmlString");
    if (pageCount <= 1)
        return;
    AssignNavigationLinks(currentPage, pageCount, adder);
    var linkIndexGroup = IndexGroupString(navigateGroupSize, currentPage, pageCount, baseNavigateURL, adder);
    
    var linkFirst = "<a id='lnkFirst' href='"+lnkFirstNavigateUrl+"'><img class='imgtext' src='images/btnFirst.jpg' /></a>";
    var linkPrevious = "<a id='lnkPrevious' href='"+lnkPreviousNavigateUrl+"'><img class='imgtext' src='images/btnPrev.jpg' /></a>";
    var linkNext = "<a id='lnkNext' href='"+lnkNextNavigateUrl+"'><img class='imgtext' src='images/btnNext.jpg' /></a>";
    var linkLast = "<a id='lnkLast' href='"+lnkLastNavigateUrl+"'><img class='imgtext' src='images/btnLast.jpg' /></a>";
    
    var htmlString = "";
    if (currentPage != 1)
    {
        htmlString += linkFirst + "&nbsp;";
        htmlString += linkPrevious + "&nbsp;";
    }
    htmlString += linkIndexGroup;
    if (currentPage != pageCount)
    {
        htmlString += linkNext + "&nbsp;";
        htmlString += linkLast;
    }
   
    document.write(htmlString);
}
function NavigationGroupFirstIndex(navigateGroupSize)
{
    var firstIndex = 1;
    if (currentPage > navigateGroupSize)
    {
        firstIndex = Math.floor(currentPage / navigateGroupSize) + 1;
        if (currentPage % navigateGroupSize == 0)
            firstIndex--;
    }
    return (firstIndex - 1) * navigateGroupSize + 1;
}

function IndexGroupString(navigateGroupSize, currentPage, pageCount, baseNavigateURL, adder)
{
    var groupFirstIndex = NavigationGroupFirstIndex(navigateGroupSize);
    var linkString = "";
    for (var i = groupFirstIndex; i < groupFirstIndex + navigateGroupSize; i++)
    {
        if (i != currentPage)
            linkString += "<a class='alphabet' style='text-decoration:none' href='" + baseNavigateURL + adder + "page=" + i + "'>" + i + "</a>&nbsp;";
        else
            linkString += "<span class='find'>" + i + "</span>&nbsp;";
        if (i == pageCount)
            break;
    }
    return linkString;
}        
function AssignNavigationLinks(currentPage, pageCount, adder)
{
    lnkFirstEnabled = lnkPreviousEnabled = (currentPage != 1);
    lnkLastEnabled = lnkNextEnabled = (currentPage != pageCount);
    if (lnkFirstEnabled) 
        lnkFirstNavigateUrl = baseNavigateURL + adder + "page=" + 1;
    else
        lnkFirstNavigateUrl = "javascript:void(0)";
    if (lnkPreviousEnabled)
        lnkPreviousNavigateUrl = baseNavigateURL + adder + "page=" + (currentPage - 1);
    else
        lnkPreviousNavigateUrl = "javascript:void(0)";
    if (lnkNextEnabled)
        lnkNextNavigateUrl = baseNavigateURL + adder + "page=" + (currentPage+1);
    else
        lnkNextNavigateUrl = "javascript:void(0)";
    if (lnkLastEnabled)
        lnkLastNavigateUrl = baseNavigateURL + adder + "page=" + pageCount;
    else
        lnkLastNavigateUrl = "javascript:void(0)";
    LinkPreviousText += " " + pageSize;
    LinkNextText += " " + pageSize;
}