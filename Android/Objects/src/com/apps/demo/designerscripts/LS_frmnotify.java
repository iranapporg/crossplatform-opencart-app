package com.apps.demo.designerscripts;
import anywheresoftware.b4a.objects.TextViewWrapper;
import anywheresoftware.b4a.objects.ImageViewWrapper;
import anywheresoftware.b4a.BA;


public class LS_frmnotify{

public static void LS_general(java.util.LinkedHashMap<String, anywheresoftware.b4a.keywords.LayoutBuilder.ViewWrapperAndAnchor> views, int width, int height, float scale) {
anywheresoftware.b4a.keywords.LayoutBuilder.setScaleRate(0.3);
anywheresoftware.b4a.keywords.LayoutBuilder.setScaleRate(1d);
views.get("pnlnotify").vw.setLeft((int)((50d / 100 * width) - (views.get("pnlnotify").vw.getWidth() / 2)));
views.get("pnlnotify").vw.setTop((int)((50d / 100 * height) - (views.get("pnlnotify").vw.getHeight() / 2)));
views.get("btnok").vw.setLeft((int)((views.get("pnlnotify").vw.getWidth())/2d - (views.get("btnok").vw.getWidth() / 2)));

}
}