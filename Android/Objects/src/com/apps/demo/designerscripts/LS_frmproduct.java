package com.apps.demo.designerscripts;
import anywheresoftware.b4a.objects.TextViewWrapper;
import anywheresoftware.b4a.objects.ImageViewWrapper;
import anywheresoftware.b4a.BA;


public class LS_frmproduct{

public static void LS_general(java.util.LinkedHashMap<String, anywheresoftware.b4a.keywords.LayoutBuilder.ViewWrapperAndAnchor> views, int width, int height, float scale) {
anywheresoftware.b4a.keywords.LayoutBuilder.setScaleRate(0.3);
anywheresoftware.b4a.keywords.LayoutBuilder.scaleAll(views);
views.get("btnreviews").vw.setWidth((int)((100d / 100 * width)/2d));
views.get("btnattributes").vw.setWidth((int)((100d / 100 * width)/2d));
views.get("btnattributes").vw.setLeft((int)((views.get("btnreviews").vw.getWidth())+1d));
views.get("lblreview").vw.setLeft((int)((views.get("btnreviews").vw.getWidth())-(views.get("lblreview").vw.getWidth())-6d));
views.get("pnllistnumb").vw.setLeft((int)((50d / 100 * width) - (views.get("pnllistnumb").vw.getWidth() / 2)));

}
}