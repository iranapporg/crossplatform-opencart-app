package com.apps.demo.designerscripts;
import anywheresoftware.b4a.objects.TextViewWrapper;
import anywheresoftware.b4a.objects.ImageViewWrapper;
import anywheresoftware.b4a.BA;


public class LS_frmupdate{

public static void LS_general(java.util.LinkedHashMap<String, anywheresoftware.b4a.keywords.LayoutBuilder.ViewWrapperAndAnchor> views, int width, int height, float scale) {
anywheresoftware.b4a.keywords.LayoutBuilder.setScaleRate(0.3);
anywheresoftware.b4a.keywords.LayoutBuilder.scaleAll(views);
views.get("panel1").vw.setLeft((int)((50d / 100 * width) - (views.get("panel1").vw.getWidth() / 2)));
views.get("pnlloading1").vw.setLeft((int)((50d / 100 * width) - (views.get("pnlloading1").vw.getWidth() / 2)));
views.get("pnlloading1").vw.setTop((int)((50d / 100 * width) - (views.get("pnlloading1").vw.getHeight() / 2)));
views.get("panel1").vw.setTop((int)((36d / 100 * height) - (views.get("panel1").vw.getHeight() / 2)));
views.get("imageview1").vw.setLeft((int)((views.get("panel1").vw.getWidth())/2d - (views.get("imageview1").vw.getWidth() / 2)));
views.get("btnlog").vw.setLeft((int)((views.get("panel1").vw.getWidth())/2d - (views.get("btnlog").vw.getWidth() / 2)));

}
}