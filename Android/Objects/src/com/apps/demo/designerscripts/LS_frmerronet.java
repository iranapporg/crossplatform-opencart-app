package com.apps.demo.designerscripts;
import anywheresoftware.b4a.objects.TextViewWrapper;
import anywheresoftware.b4a.objects.ImageViewWrapper;
import anywheresoftware.b4a.BA;


public class LS_frmerronet{

public static void LS_general(java.util.LinkedHashMap<String, anywheresoftware.b4a.keywords.LayoutBuilder.ViewWrapperAndAnchor> views, int width, int height, float scale) {
anywheresoftware.b4a.keywords.LayoutBuilder.setScaleRate(0.3);
anywheresoftware.b4a.keywords.LayoutBuilder.scaleAll(views);
if ((BA.ObjectToBoolean( String.valueOf(anywheresoftware.b4a.keywords.LayoutBuilder.isPortrait())))) { 
;
views.get("lblalert").vw.setLeft((int)((views.get("pnlmain").vw.getWidth())/2d - (views.get("lblalert").vw.getWidth() / 2)));
views.get("btnsetting").vw.setLeft((int)((views.get("pnlmain").vw.getWidth())/2d - (views.get("btnsetting").vw.getWidth() / 2)));
//BA.debugLineNum = 6;BA.debugLine="btnretry.HorizontalCenter = pnlmain.Width / 2"[frmerronet/General script]
views.get("btnretry").vw.setLeft((int)((views.get("pnlmain").vw.getWidth())/2d - (views.get("btnretry").vw.getWidth() / 2)));
//BA.debugLineNum = 7;BA.debugLine="pnlmain.HorizontalCenter = 50%x"[frmerronet/General script]
views.get("pnlmain").vw.setLeft((int)((50d / 100 * width) - (views.get("pnlmain").vw.getWidth() / 2)));
//BA.debugLineNum = 8;BA.debugLine="pnlmain.VerticalCenter = 53%y"[frmerronet/General script]
views.get("pnlmain").vw.setTop((int)((53d / 100 * height) - (views.get("pnlmain").vw.getHeight() / 2)));
//BA.debugLineNum = 9;BA.debugLine="Else"[frmerronet/General script]
;}else{ 
;
//BA.debugLineNum = 10;BA.debugLine="lblalert.HorizontalCenter = 50%x"[frmerronet/General script]
views.get("lblalert").vw.setLeft((int)((50d / 100 * width) - (views.get("lblalert").vw.getWidth() / 2)));
//BA.debugLineNum = 11;BA.debugLine="End If"[frmerronet/General script]
;};

}
}