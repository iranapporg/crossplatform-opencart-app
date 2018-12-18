package com.apps.demo.designerscripts;
import anywheresoftware.b4a.objects.TextViewWrapper;
import anywheresoftware.b4a.objects.ImageViewWrapper;
import anywheresoftware.b4a.BA;


public class LS_frmaccounts{

public static void LS_general(java.util.LinkedHashMap<String, anywheresoftware.b4a.keywords.LayoutBuilder.ViewWrapperAndAnchor> views, int width, int height, float scale) {
anywheresoftware.b4a.keywords.LayoutBuilder.setScaleRate(0.3);
anywheresoftware.b4a.keywords.LayoutBuilder.scaleAll(views);
anywheresoftware.b4a.keywords.LayoutBuilder.setScaleRate(0d);
views.get("pnlloading1").vw.setLeft((int)((50d / 100 * width) - (views.get("pnlloading1").vw.getWidth() / 2)));
//BA.debugLineNum = 5;BA.debugLine="pnlloading1.VerticalCenter = 50%y"[frmaccounts/General script]
views.get("pnlloading1").vw.setTop((int)((50d / 100 * height) - (views.get("pnlloading1").vw.getHeight() / 2)));
//BA.debugLineNum = 6;BA.debugLine="Panel1.HorizontalCenter = 50%x"[frmaccounts/General script]
views.get("panel1").vw.setLeft((int)((50d / 100 * width) - (views.get("panel1").vw.getWidth() / 2)));

}
}