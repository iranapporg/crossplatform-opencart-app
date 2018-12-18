package com.apps.manageropencart.designerscripts;
import anywheresoftware.b4a.objects.TextViewWrapper;
import anywheresoftware.b4a.objects.ImageViewWrapper;
import anywheresoftware.b4a.BA;


public class LS_frmloading{

public static void LS_general(java.util.LinkedHashMap<String, anywheresoftware.b4a.keywords.LayoutBuilder.ViewWrapperAndAnchor> views, int width, int height, float scale) {
anywheresoftware.b4a.keywords.LayoutBuilder.setScaleRate(0.3);
anywheresoftware.b4a.keywords.LayoutBuilder.scaleAll(views);
views.get("pnlloading").vw.setLeft((int)((50d / 100 * width) - (views.get("pnlloading").vw.getWidth() / 2)));
//BA.debugLineNum = 4;BA.debugLine="pnlloading.VerticalCenter = 50%y"[frmloading/General script]
views.get("pnlloading").vw.setTop((int)((50d / 100 * height) - (views.get("pnlloading").vw.getHeight() / 2)));

}
}