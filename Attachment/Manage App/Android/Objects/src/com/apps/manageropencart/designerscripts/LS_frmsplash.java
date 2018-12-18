package com.apps.manageropencart.designerscripts;
import anywheresoftware.b4a.objects.TextViewWrapper;
import anywheresoftware.b4a.objects.ImageViewWrapper;
import anywheresoftware.b4a.BA;


public class LS_frmsplash{

public static void LS_general(java.util.LinkedHashMap<String, anywheresoftware.b4a.keywords.LayoutBuilder.ViewWrapperAndAnchor> views, int width, int height, float scale) {
anywheresoftware.b4a.keywords.LayoutBuilder.setScaleRate(0.3);
anywheresoftware.b4a.keywords.LayoutBuilder.scaleAll(views);
views.get("pnl1").vw.setLeft((int)((50d / 100 * width) - (views.get("pnl1").vw.getWidth() / 2)));
views.get("pnl1").vw.setTop((int)((50d / 100 * height) - (views.get("pnl1").vw.getHeight() / 2)));

}
}