package com.apps.manageropencart.designerscripts;
import anywheresoftware.b4a.objects.TextViewWrapper;
import anywheresoftware.b4a.objects.ImageViewWrapper;
import anywheresoftware.b4a.BA;


public class LS_frmchangepassword{

public static void LS_general(java.util.LinkedHashMap<String, anywheresoftware.b4a.keywords.LayoutBuilder.ViewWrapperAndAnchor> views, int width, int height, float scale) {
anywheresoftware.b4a.keywords.LayoutBuilder.setScaleRate(0.3);
//BA.debugLineNum = 2;BA.debugLine="AutoScaleAll"[frmchangepassword/General script]
anywheresoftware.b4a.keywords.LayoutBuilder.scaleAll(views);
//BA.debugLineNum = 3;BA.debugLine="btnok.HorizontalCenter = 50%x"[frmchangepassword/General script]
views.get("btnok").vw.setLeft((int)((50d / 100 * width) - (views.get("btnok").vw.getWidth() / 2)));
//BA.debugLineNum = 4;BA.debugLine="btncancel.HorizontalCenter = 50%x"[frmchangepassword/General script]
views.get("btncancel").vw.setLeft((int)((50d / 100 * width) - (views.get("btncancel").vw.getWidth() / 2)));

}
}