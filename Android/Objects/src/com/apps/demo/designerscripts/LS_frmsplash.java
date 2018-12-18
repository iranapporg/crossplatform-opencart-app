package com.apps.demo.designerscripts;
import anywheresoftware.b4a.objects.TextViewWrapper;
import anywheresoftware.b4a.objects.ImageViewWrapper;
import anywheresoftware.b4a.BA;


public class LS_frmsplash{

public static void LS_general(java.util.LinkedHashMap<String, anywheresoftware.b4a.keywords.LayoutBuilder.ViewWrapperAndAnchor> views, int width, int height, float scale) {
anywheresoftware.b4a.keywords.LayoutBuilder.setScaleRate(0.3);
anywheresoftware.b4a.keywords.LayoutBuilder.scaleAll(views);
views.get("pnlheader").vw.setHeight((int)((33d / 100 * height)));
views.get("pnlprogress").vw.setLeft((int)((50d / 100 * width) - (views.get("pnlprogress").vw.getWidth() / 2)));
views.get("pnlprogress").vw.setTop((int)((83d / 100 * height) - (views.get("pnlprogress").vw.getHeight() / 2)));
views.get("pb1").vw.setLeft((int)((views.get("pnlprogress").vw.getWidth())/2d - (views.get("pb1").vw.getWidth() / 2)));
views.get("pnllogo").vw.setLeft((int)((50d / 100 * width) - (views.get("pnllogo").vw.getWidth() / 2)));
views.get("pnllogo").vw.setTop((int)((38d / 100 * height) - (views.get("pnllogo").vw.getHeight() / 2)));

}
}