<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default2.aspx.cs" Inherits="Default2" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Untitled Page</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <embed type="application/x-mplayer2" pluginspage="http://www.microsoft.com/Windows/MediaPlayer/" name="mediaplayer1" ShowStatusBar="true"
     EnableContextMenu="false" autostart="true" width="500" height="320" loop="false" src="video/test.MPG" />344444
     <%--<object classid="CLSID:6BF52A52-394A-11D3-B153-00C04F79FAA6" codebase="http://activex.microsoft.com/activex/controls/mplayer/en/nsmp2inf.cab#Version=5,1,52,701"
                                height="320" type="application/x-oleobject" width="500">
                                <param name="url" value="video/quehuong.wma">
                                <param name="EnableContextMenu" value="0">
                                <param name="volume" value="100">
                                <param name="rate" value="1">
                                <param name="balance" value="0">
                                <param name="currentPosition" value="0">
                                <param name="defaultFrame" value="">
                                <param name="playCount" value="1">
                                <param name="autoStart" value="-1">
                                <param name="currentMarker" value="0">
                                <param name="invokeURLs" value="-1">
                                <param name="baseURL" value="">
                                <param name="mute" value="0">
                                <param name="uiMode" value="full">
                                <param name="stretchToFit" value="-1">
                                <param name="windowlessVideo" value="0">
                                <param name="enabled" value="-1">
                                <param name="fullScreen" value="0">
                                <param name="SAMIStyle" value="">
                                <param name="SAMILang" value="">
                                <param name="SAMIFilename" value="">
                                <param name="captioningID" value="">
                                <param name="enableErrorDialogs" value="0">
                                <embed autostart="1" enablecontextmenu="0" file="quehuong.wma" height="320"
                                    mute="0" pluginspage="http://www.microsoft.com/Windows/MediaPlayer/" quality="high"
                                    showstatusbar="1" src="video/quehuong.wma" type="application/x-mplayer2"
                                    width="350"></embed>
                            </object>--%><
    </div>
    </form>
</body>
</html>
