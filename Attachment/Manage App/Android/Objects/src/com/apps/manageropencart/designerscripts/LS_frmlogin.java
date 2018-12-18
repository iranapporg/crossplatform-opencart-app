package com.apps.manageropencart.designerscripts;
import anywheresoftware.b4a.objects.TextViewWrapper;
import anywheresoftware.b4a.objects.ImageViewWrapper;
import anywheresoftware.b4a.BA;


public class LS_frmlogin{

public static void LS_general(java.util.LinkedHashMap<String, anywheresoftware.b4a.keywords.LayoutBuilder.ViewWrapperAndAnchor> views, int width, int height, float scale) {
anywheresoftware.b4a.keywords.LayoutBuilder.setScaleRate(0.3);
anywheresoftware.b4a.keywords.LayoutBuilder.scaleAll(views);
views.get("pnlfield").vw.setLeft((int)((50d / 100 * width) - (views.get("pnlfield").vw.getWidth() / 2)));
//BA.debugLineNum = 4;BA.debugLine="pnlfield.VerticalCenter = 65%y"[frmlogin/General script]
views.get("pnlfield").vw.setTop((int)((65d / 100 * height) - (views.get("pnlfield").vw.getHeight() / 2)));
//BA.debugLineNum = 5;BA.debugLine="lbllog.HorizontalCenter = 50%x"[frmlogin/General script]
views.get("lbllog").vw.setLeft((int)((50d / 100 * width) - (views.get("lbllog").vw.getWidth() / 2)));
//BA.debugLineNum = 6;BA.debugLine="lbllog.VerticalCenter = 50%y"[frmlogin/General script]
views.get("lbllog").vw.setTop((int)((50d / 100 * height) - (views.get("lbllog").vw.getHeight() / 2)));

}
}