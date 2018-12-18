package com.apps.demo.designerscripts;
import anywheresoftware.b4a.objects.TextViewWrapper;
import anywheresoftware.b4a.objects.ImageViewWrapper;
import anywheresoftware.b4a.BA;


public class LS_frmdisactiveshop{

public static void LS_general(java.util.LinkedHashMap<String, anywheresoftware.b4a.keywords.LayoutBuilder.ViewWrapperAndAnchor> views, int width, int height, float scale) {
anywheresoftware.b4a.keywords.LayoutBuilder.setScaleRate(0.3);
anywheresoftware.b4a.keywords.LayoutBuilder.scaleAll(views);
views.get("btnok").vw.setLeft((int)((50d / 100 * width) - (views.get("btnok").vw.getWidth() / 2)));
views.get("lblalert").vw.setLeft((int)((views.get("pnlmain").vw.getWidth())/2d - (views.get("lblalert").vw.getWidth() / 2)));
views.get("pnlmain").vw.setLeft((int)((50d / 100 * width) - (views.get("pnlmain").vw.getWidth() / 2)));
//BA.debugLineNum = 6;BA.debugLine="pnlmain.VerticalCenter = 50%y"[frmdisactiveshop/General script]
views.get("pnlmain").vw.setTop((int)((50d / 100 * height) - (views.get("pnlmain").vw.getHeight() / 2)));

}
}