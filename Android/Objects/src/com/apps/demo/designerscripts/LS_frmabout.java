package com.apps.demo.designerscripts;
import anywheresoftware.b4a.objects.TextViewWrapper;
import anywheresoftware.b4a.objects.ImageViewWrapper;
import anywheresoftware.b4a.BA;


public class LS_frmabout{

public static void LS_general(java.util.LinkedHashMap<String, anywheresoftware.b4a.keywords.LayoutBuilder.ViewWrapperAndAnchor> views, int width, int height, float scale) {
anywheresoftware.b4a.keywords.LayoutBuilder.setScaleRate(0.3);
//BA.debugLineNum = 2;BA.debugLine="AutoScaleAll"[frmabout/General script]
anywheresoftware.b4a.keywords.LayoutBuilder.scaleAll(views);
//BA.debugLineNum = 3;BA.debugLine="AutoScaleRate(0)"[frmabout/General script]
anywheresoftware.b4a.keywords.LayoutBuilder.setScaleRate(0d);
//BA.debugLineNum = 4;BA.debugLine="pnlloading1.HorizontalCenter = 50%x"[frmabout/General script]
views.get("pnlloading1").vw.setLeft((int)((50d / 100 * width) - (views.get("pnlloading1").vw.getWidth() / 2)));
//BA.debugLineNum = 5;BA.debugLine="pnlloading1.VerticalCenter = 38%y"[frmabout/General script]
views.get("pnlloading1").vw.setTop((int)((38d / 100 * height) - (views.get("pnlloading1").vw.getHeight() / 2)));

}
}