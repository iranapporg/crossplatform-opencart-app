package com.apps.demo.designerscripts;
import anywheresoftware.b4a.objects.TextViewWrapper;
import anywheresoftware.b4a.objects.ImageViewWrapper;
import anywheresoftware.b4a.BA;


public class LS_frmteplate_slideshow{

public static void LS_general(java.util.LinkedHashMap<String, anywheresoftware.b4a.keywords.LayoutBuilder.ViewWrapperAndAnchor> views, int width, int height, float scale) {
anywheresoftware.b4a.keywords.LayoutBuilder.setScaleRate(0.3);
anywheresoftware.b4a.keywords.LayoutBuilder.scaleAll(views);
views.get("imgads").vw.setHeight((int)((views.get("pnlads").vw.getHeight())));
views.get("imgads").vw.setWidth((int)((views.get("pnlads").vw.getWidth())));
views.get("panel1").vw.setLeft((int)((views.get("pnlads").vw.getWidth())/2d - (views.get("panel1").vw.getWidth() / 2)));
views.get("panel1").vw.setTop((int)((views.get("pnlads").vw.getHeight())-(views.get("panel1").vw.getHeight())));
views.get("pbslideshow").vw.setLeft((int)((views.get("pnlads").vw.getWidth())/2d - (views.get("pbslideshow").vw.getWidth() / 2)));
views.get("pbslideshow").vw.setTop((int)((views.get("pnlads").vw.getHeight())/2d - (views.get("pbslideshow").vw.getHeight() / 2)));

}
}