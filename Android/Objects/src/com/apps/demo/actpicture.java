package com.apps.demo;


import anywheresoftware.b4a.B4AMenuItem;
import android.app.Activity;
import android.os.Bundle;
import anywheresoftware.b4a.BA;
import anywheresoftware.b4a.BALayout;
import anywheresoftware.b4a.B4AActivity;
import anywheresoftware.b4a.ObjectWrapper;
import anywheresoftware.b4a.objects.ActivityWrapper;
import java.lang.reflect.InvocationTargetException;
import anywheresoftware.b4a.B4AUncaughtException;
import anywheresoftware.b4a.debug.*;
import java.lang.ref.WeakReference;

public class actpicture extends Activity implements B4AActivity{
	public static actpicture mostCurrent;
	static boolean afterFirstLayout;
	static boolean isFirst = true;
    private static boolean processGlobalsRun = false;
	BALayout layout;
	public static BA processBA;
	BA activityBA;
    ActivityWrapper _activity;
    java.util.ArrayList<B4AMenuItem> menuItems;
	public static final boolean fullScreen = false;
	public static final boolean includeTitle = false;
    public static WeakReference<Activity> previousOne;

	@Override
	public void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		if (isFirst) {
			processBA = new BA(this.getApplicationContext(), null, null, "com.apps.demo", "com.apps.demo.actpicture");
			processBA.loadHtSubs(this.getClass());
	        float deviceScale = getApplicationContext().getResources().getDisplayMetrics().density;
	        BALayout.setDeviceScale(deviceScale);
            
		}
		else if (previousOne != null) {
			Activity p = previousOne.get();
			if (p != null && p != this) {
                BA.LogInfo("Killing previous instance (actpicture).");
				p.finish();
			}
		}
        processBA.runHook("oncreate", this, null);
		if (!includeTitle) {
        	this.getWindow().requestFeature(android.view.Window.FEATURE_NO_TITLE);
        }
        if (fullScreen) {
        	getWindow().setFlags(android.view.WindowManager.LayoutParams.FLAG_FULLSCREEN,   
        			android.view.WindowManager.LayoutParams.FLAG_FULLSCREEN);
        }
		mostCurrent = this;
        processBA.sharedProcessBA.activityBA = null;
		layout = new BALayout(this);
		setContentView(layout);
		afterFirstLayout = false;
        WaitForLayout wl = new WaitForLayout();
        if (anywheresoftware.b4a.objects.ServiceHelper.StarterHelper.startFromActivity(processBA, wl, false))
		    BA.handler.postDelayed(wl, 5);

	}
	static class WaitForLayout implements Runnable {
		public void run() {
			if (afterFirstLayout)
				return;
			if (mostCurrent == null)
				return;
            
			if (mostCurrent.layout.getWidth() == 0) {
				BA.handler.postDelayed(this, 5);
				return;
			}
			mostCurrent.layout.getLayoutParams().height = mostCurrent.layout.getHeight();
			mostCurrent.layout.getLayoutParams().width = mostCurrent.layout.getWidth();
			afterFirstLayout = true;
			mostCurrent.afterFirstLayout();
		}
	}
	private void afterFirstLayout() {
        if (this != mostCurrent)
			return;
		activityBA = new BA(this, layout, processBA, "com.apps.demo", "com.apps.demo.actpicture");
        
        processBA.sharedProcessBA.activityBA = new java.lang.ref.WeakReference<BA>(activityBA);
        anywheresoftware.b4a.objects.ViewWrapper.lastId = 0;
        _activity = new ActivityWrapper(activityBA, "activity");
        anywheresoftware.b4a.Msgbox.isDismissing = false;
        if (BA.isShellModeRuntimeCheck(processBA)) {
			if (isFirst)
				processBA.raiseEvent2(null, true, "SHELL", false);
			processBA.raiseEvent2(null, true, "CREATE", true, "com.apps.demo.actpicture", processBA, activityBA, _activity, anywheresoftware.b4a.keywords.Common.Density, mostCurrent);
			_activity.reinitializeForShell(activityBA, "activity");
		}
        initializeProcessGlobals();		
        initializeGlobals();
        
        BA.LogInfo("** Activity (actpicture) Create, isFirst = " + isFirst + " **");
        processBA.raiseEvent2(null, true, "activity_create", false, isFirst);
		isFirst = false;
		if (this != mostCurrent)
			return;
        processBA.setActivityPaused(false);
        BA.LogInfo("** Activity (actpicture) Resume **");
        processBA.raiseEvent(null, "activity_resume");
        if (android.os.Build.VERSION.SDK_INT >= 11) {
			try {
				android.app.Activity.class.getMethod("invalidateOptionsMenu").invoke(this,(Object[]) null);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

	}
	public void addMenuItem(B4AMenuItem item) {
		if (menuItems == null)
			menuItems = new java.util.ArrayList<B4AMenuItem>();
		menuItems.add(item);
	}
	@Override
	public boolean onCreateOptionsMenu(android.view.Menu menu) {
		super.onCreateOptionsMenu(menu);
        try {
            if (processBA.subExists("activity_actionbarhomeclick")) {
                Class.forName("android.app.ActionBar").getMethod("setHomeButtonEnabled", boolean.class).invoke(
                    getClass().getMethod("getActionBar").invoke(this), true);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        if (processBA.runHook("oncreateoptionsmenu", this, new Object[] {menu}))
            return true;
		if (menuItems == null)
			return false;
		for (B4AMenuItem bmi : menuItems) {
			android.view.MenuItem mi = menu.add(bmi.title);
			if (bmi.drawable != null)
				mi.setIcon(bmi.drawable);
            if (android.os.Build.VERSION.SDK_INT >= 11) {
				try {
                    if (bmi.addToBar) {
				        android.view.MenuItem.class.getMethod("setShowAsAction", int.class).invoke(mi, 1);
                    }
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
			mi.setOnMenuItemClickListener(new B4AMenuItemsClickListener(bmi.eventName.toLowerCase(BA.cul)));
		}
        
		return true;
	}   
 @Override
 public boolean onOptionsItemSelected(android.view.MenuItem item) {
    if (item.getItemId() == 16908332) {
        processBA.raiseEvent(null, "activity_actionbarhomeclick");
        return true;
    }
    else
        return super.onOptionsItemSelected(item); 
}
@Override
 public boolean onPrepareOptionsMenu(android.view.Menu menu) {
    super.onPrepareOptionsMenu(menu);
    processBA.runHook("onprepareoptionsmenu", this, new Object[] {menu});
    return true;
    
 }
 protected void onStart() {
    super.onStart();
    processBA.runHook("onstart", this, null);
}
 protected void onStop() {
    super.onStop();
    processBA.runHook("onstop", this, null);
}
    public void onWindowFocusChanged(boolean hasFocus) {
       super.onWindowFocusChanged(hasFocus);
       if (processBA.subExists("activity_windowfocuschanged"))
           processBA.raiseEvent2(null, true, "activity_windowfocuschanged", false, hasFocus);
    }
	private class B4AMenuItemsClickListener implements android.view.MenuItem.OnMenuItemClickListener {
		private final String eventName;
		public B4AMenuItemsClickListener(String eventName) {
			this.eventName = eventName;
		}
		public boolean onMenuItemClick(android.view.MenuItem item) {
			processBA.raiseEventFromUI(item.getTitle(), eventName + "_click");
			return true;
		}
	}
    public static Class<?> getObject() {
		return actpicture.class;
	}
    private Boolean onKeySubExist = null;
    private Boolean onKeyUpSubExist = null;
	@Override
	public boolean onKeyDown(int keyCode, android.view.KeyEvent event) {
        if (processBA.runHook("onkeydown", this, new Object[] {keyCode, event}))
            return true;
		if (onKeySubExist == null)
			onKeySubExist = processBA.subExists("activity_keypress");
		if (onKeySubExist) {
			if (keyCode == anywheresoftware.b4a.keywords.constants.KeyCodes.KEYCODE_BACK &&
					android.os.Build.VERSION.SDK_INT >= 18) {
				HandleKeyDelayed hk = new HandleKeyDelayed();
				hk.kc = keyCode;
				BA.handler.post(hk);
				return true;
			}
			else {
				boolean res = new HandleKeyDelayed().runDirectly(keyCode);
				if (res)
					return true;
			}
		}
		return super.onKeyDown(keyCode, event);
	}
	private class HandleKeyDelayed implements Runnable {
		int kc;
		public void run() {
			runDirectly(kc);
		}
		public boolean runDirectly(int keyCode) {
			Boolean res =  (Boolean)processBA.raiseEvent2(_activity, false, "activity_keypress", false, keyCode);
			if (res == null || res == true) {
                return true;
            }
            else if (keyCode == anywheresoftware.b4a.keywords.constants.KeyCodes.KEYCODE_BACK) {
				finish();
				return true;
			}
            return false;
		}
		
	}
    @Override
	public boolean onKeyUp(int keyCode, android.view.KeyEvent event) {
        if (processBA.runHook("onkeyup", this, new Object[] {keyCode, event}))
            return true;
		if (onKeyUpSubExist == null)
			onKeyUpSubExist = processBA.subExists("activity_keyup");
		if (onKeyUpSubExist) {
			Boolean res =  (Boolean)processBA.raiseEvent2(_activity, false, "activity_keyup", false, keyCode);
			if (res == null || res == true)
				return true;
		}
		return super.onKeyUp(keyCode, event);
	}
	@Override
	public void onNewIntent(android.content.Intent intent) {
        super.onNewIntent(intent);
		this.setIntent(intent);
        processBA.runHook("onnewintent", this, new Object[] {intent});
	}
    @Override 
	public void onPause() {
		super.onPause();
        if (_activity == null) //workaround for emulator bug (Issue 2423)
            return;
		anywheresoftware.b4a.Msgbox.dismiss(true);
        BA.LogInfo("** Activity (actpicture) Pause, UserClosed = " + activityBA.activity.isFinishing() + " **");
        processBA.raiseEvent2(_activity, true, "activity_pause", false, activityBA.activity.isFinishing());		
        processBA.setActivityPaused(true);
        mostCurrent = null;
        if (!activityBA.activity.isFinishing())
			previousOne = new WeakReference<Activity>(this);
        anywheresoftware.b4a.Msgbox.isDismissing = false;
        processBA.runHook("onpause", this, null);
	}

	@Override
	public void onDestroy() {
        super.onDestroy();
		previousOne = null;
        processBA.runHook("ondestroy", this, null);
	}
    @Override 
	public void onResume() {
		super.onResume();
        mostCurrent = this;
        anywheresoftware.b4a.Msgbox.isDismissing = false;
        if (activityBA != null) { //will be null during activity create (which waits for AfterLayout).
        	ResumeMessage rm = new ResumeMessage(mostCurrent);
        	BA.handler.post(rm);
        }
        processBA.runHook("onresume", this, null);
	}
    private static class ResumeMessage implements Runnable {
    	private final WeakReference<Activity> activity;
    	public ResumeMessage(Activity activity) {
    		this.activity = new WeakReference<Activity>(activity);
    	}
		public void run() {
			if (mostCurrent == null || mostCurrent != activity.get())
				return;
			processBA.setActivityPaused(false);
            BA.LogInfo("** Activity (actpicture) Resume **");
		    processBA.raiseEvent(mostCurrent._activity, "activity_resume", (Object[])null);
		}
    }
	@Override
	protected void onActivityResult(int requestCode, int resultCode,
	      android.content.Intent data) {
		processBA.onActivityResult(requestCode, resultCode, data);
        processBA.runHook("onactivityresult", this, new Object[] {requestCode, resultCode});
	}
	private static void initializeGlobals() {
		processBA.raiseEvent2(null, true, "globals", false, (Object[])null);
	}
    public void onRequestPermissionsResult(int requestCode,
        String permissions[], int[] grantResults) {
        for (int i = 0;i < permissions.length;i++) {
            Object[] o = new Object[] {permissions[i], grantResults[i] == 0};
            processBA.raiseEventFromDifferentThread(null,null, 0, "activity_permissionresult", true, o);
        }
            
    }

public anywheresoftware.b4a.keywords.Common __c = null;
public static String _link = "";
public static anywheresoftware.b4a.objects.collections.List _images = null;
public anywheresoftware.b4a.objects.PanelWrapper _pnl1 = null;
public uk.co.martinpearman.b4a.touchimageview.TouchImageViewWrapper _touch = null;
public anywheresoftware.b4a.objects.HorizontalScrollViewWrapper _svh = null;
public anywheresoftware.b4a.objects.ScrollViewWrapper _svv = null;
public anywheresoftware.b4a.objects.ButtonWrapper _btnclose = null;
public anywheresoftware.b4a.samples.httputils2.httputils2service _httputils2service = null;
public JHSBarcodes.V1.azteccode _azteccode = null;
public JHSBarcodes.V1.qrcode _qrcode = null;
public JHSBarcodes.V1.code25i _code25i = null;
public JHSBarcodes.V1.ean13 _ean13 = null;
public JHSBarcodes.V1.ean8 _ean8 = null;
public JHSBarcodes.V1.code128 _code128 = null;
public JHSBarcodes.V1.pdf417 _pdf417 = null;
public JHSBarcodes.V1.code39 _code39 = null;
public JHSBarcodes.V1.code93 _code93 = null;
public JHSBarcodes.V1.code11 _code11 = null;
public com.apps.demo.main _main = null;
public com.apps.demo.actproduct _actproduct = null;
public com.apps.demo.actcompare _actcompare = null;
public com.apps.demo.actmenu _actmenu = null;
public com.apps.demo.library _library = null;
public com.apps.demo.actdoorder _actdoorder = null;
public com.apps.demo.actbasket _actbasket = null;
public com.apps.demo.actpayment _actpayment = null;
public com.apps.demo.actproducts _actproducts = null;
public com.apps.demo.actsearch _actsearch = null;
public com.apps.demo.actreview _actreview = null;
public com.apps.demo.acterrorintrenet _acterrorintrenet = null;
public com.apps.demo.actcontact _actcontact = null;
public com.apps.demo.actcategory _actcategory = null;
public com.apps.demo.actnotification _actnotification = null;
public com.apps.demo.actabout _actabout = null;
public com.apps.demo.actorderdetails _actorderdetails = null;
public com.apps.demo.actregister _actregister = null;
public com.apps.demo.actlogin _actlogin = null;
public com.apps.demo.actupdate _actupdate = null;
public com.apps.demo.actsetting _actsetting = null;
public com.apps.demo.actdisableshop _actdisableshop = null;
public com.apps.demo.bookmark _bookmark = null;
public com.apps.demo.actaccount _actaccount = null;
public com.apps.demo.googlevoices _googlevoices = null;
public com.apps.demo.actsms _actsms = null;
public com.apps.demo.actshow _actshow = null;
public com.apps.demo.actweb _actweb = null;
public com.apps.demo.dateutils _dateutils = null;
public com.apps.demo.imagedownloader _imagedownloader = null;
public com.apps.demo.updater _updater = null;
public com.apps.demo.starter _starter = null;

public static void initializeProcessGlobals() {
             try {
                Class.forName(BA.applicationContext.getPackageName() + ".main").getMethod("initializeProcessGlobals").invoke(null, null);
            } catch (Exception e) {
                throw new RuntimeException(e);
            }
}
public static String  _activity_create(boolean _firsttime) throws Exception{
ariagp.amin.shahedi.AriaGlideWrapper _glide = null;
anywheresoftware.b4a.objects.drawable.CanvasWrapper.RectWrapper _sourceimagerect = null;
anywheresoftware.b4a.objects.drawable.CanvasWrapper.RectWrapper _touchimageviewrect = null;
int _left = 0;
int _top = 0;
int _i = 0;
anywheresoftware.b4a.objects.ImageViewWrapper _img = null;
String _filename = "";
anywheresoftware.b4a.objects.drawable.CanvasWrapper.BitmapWrapper _b1 = null;
 //BA.debugLineNum = 19;BA.debugLine="Sub Activity_Create(FirstTime As Boolean)";
 //BA.debugLineNum = 21;BA.debugLine="Library.setLocalApp(Library.currLang)";
mostCurrent._library._setlocalapp(mostCurrent.activityBA,mostCurrent._library._currlang);
 //BA.debugLineNum = 23;BA.debugLine="Activity.LoadLayout(\"frmpicture\")";
mostCurrent._activity.LoadLayout("frmpicture",mostCurrent.activityBA);
 //BA.debugLineNum = 25;BA.debugLine="Library.ChangeStatusColor";
mostCurrent._library._changestatuscolor(mostCurrent.activityBA);
 //BA.debugLineNum = 27;BA.debugLine="Dim glide As AriaGlide";
_glide = new ariagp.amin.shahedi.AriaGlideWrapper();
 //BA.debugLineNum = 29;BA.debugLine="touch.Initialize(\"touchme\")";
mostCurrent._touch.Initialize(mostCurrent.activityBA,"touchme");
 //BA.debugLineNum = 30;BA.debugLine="touch.TouchEnabled = True";
mostCurrent._touch.setTouchEnabled(anywheresoftware.b4a.keywords.Common.True);
 //BA.debugLineNum = 31;BA.debugLine="touch.MaxScale = 5";
mostCurrent._touch.setMaxScale((float) (5));
 //BA.debugLineNum = 32;BA.debugLine="touch.MinScale = 0.5";
mostCurrent._touch.setMinScale((float) (0.5));
 //BA.debugLineNum = 33;BA.debugLine="Activity.AddView(touch,10dip,10dip,100%x-10dip,10";
mostCurrent._activity.AddView((android.view.View)(mostCurrent._touch.getObject()),anywheresoftware.b4a.keywords.Common.DipToCurrent((int) (10)),anywheresoftware.b4a.keywords.Common.DipToCurrent((int) (10)),(int) (anywheresoftware.b4a.keywords.Common.PerXToCurrent((float) (100),mostCurrent.activityBA)-anywheresoftware.b4a.keywords.Common.DipToCurrent((int) (10))),(int) (anywheresoftware.b4a.keywords.Common.PerYToCurrent((float) (100),mostCurrent.activityBA)-anywheresoftware.b4a.keywords.Common.DipToCurrent((int) (10))));
 //BA.debugLineNum = 35;BA.debugLine="pnl1.Color = Colors.Transparent";
mostCurrent._pnl1.setColor(anywheresoftware.b4a.keywords.Common.Colors.Transparent);
 //BA.debugLineNum = 36;BA.debugLine="Activity.Color = Colors.White";
mostCurrent._activity.setColor(anywheresoftware.b4a.keywords.Common.Colors.White);
 //BA.debugLineNum = 38;BA.debugLine="touch.PreScale(1,pnl1.Width,pnl1.Height)";
mostCurrent._touch.PreScale((float) (1),mostCurrent._pnl1.getWidth(),mostCurrent._pnl1.getHeight());
 //BA.debugLineNum = 39;BA.debugLine="Dim SourceImageRect, TouchImageViewRect As Rect";
_sourceimagerect = new anywheresoftware.b4a.objects.drawable.CanvasWrapper.RectWrapper();
_touchimageviewrect = new anywheresoftware.b4a.objects.drawable.CanvasWrapper.RectWrapper();
 //BA.debugLineNum = 40;BA.debugLine="touch.TranslatePadding=128dip";
mostCurrent._touch.setTranslatePadding(anywheresoftware.b4a.keywords.Common.DipToCurrent((int) (128)));
 //BA.debugLineNum = 41;BA.debugLine="touch.Gravity=Gravity.FILL";
mostCurrent._touch.setGravity(anywheresoftware.b4a.keywords.Common.Gravity.FILL);
 //BA.debugLineNum = 43;BA.debugLine="svH.BringToFront";
mostCurrent._svh.BringToFront();
 //BA.debugLineNum = 44;BA.debugLine="btnclose.BringToFront";
mostCurrent._btnclose.BringToFront();
 //BA.debugLineNum = 45;BA.debugLine="svV.BringToFront";
mostCurrent._svv.BringToFront();
 //BA.debugLineNum = 47;BA.debugLine="Dim left,top As Int = 10";
_left = 0;
_top = (int) (10);
 //BA.debugLineNum = 48;BA.debugLine="left = 20";
_left = (int) (20);
 //BA.debugLineNum = 50;BA.debugLine="svH.Panel.Color = Colors.Transparent";
mostCurrent._svh.getPanel().setColor(anywheresoftware.b4a.keywords.Common.Colors.Transparent);
 //BA.debugLineNum = 52;BA.debugLine="For i = 0 To images.Size - 1";
{
final int step22 = 1;
final int limit22 = (int) (_images.getSize()-1);
for (_i = (int) (0) ; (step22 > 0 && _i <= limit22) || (step22 < 0 && _i >= limit22); _i = ((int)(0 + _i + step22)) ) {
 //BA.debugLineNum = 54;BA.debugLine="Dim link As String";
_link = "";
 //BA.debugLineNum = 55;BA.debugLine="link = images.Get(i)";
_link = BA.ObjectToString(_images.Get(_i));
 //BA.debugLineNum = 56;BA.debugLine="link = link.Replace(\" \",\"%20\")";
_link = _link.replace(" ","%20");
 //BA.debugLineNum = 58;BA.debugLine="Dim img As ImageView";
_img = new anywheresoftware.b4a.objects.ImageViewWrapper();
 //BA.debugLineNum = 59;BA.debugLine="img.Initialize(\"imgclick\")";
_img.Initialize(mostCurrent.activityBA,"imgclick");
 //BA.debugLineNum = 61;BA.debugLine="If Activity.Height > Activity.Width Then";
if (mostCurrent._activity.getHeight()>mostCurrent._activity.getWidth()) { 
 //BA.debugLineNum = 62;BA.debugLine="svH.Panel.AddView(img,left,0,svH.Height-10,svH.";
mostCurrent._svh.getPanel().AddView((android.view.View)(_img.getObject()),_left,(int) (0),(int) (mostCurrent._svh.getHeight()-10),(int) (mostCurrent._svh.getHeight()-10));
 //BA.debugLineNum = 63;BA.debugLine="left = left + svH.Height + 4dip";
_left = (int) (_left+mostCurrent._svh.getHeight()+anywheresoftware.b4a.keywords.Common.DipToCurrent((int) (4)));
 }else {
 //BA.debugLineNum = 65;BA.debugLine="svV.Panel.AddView(img,0,top,svV.Width-10,svV.Wi";
mostCurrent._svv.getPanel().AddView((android.view.View)(_img.getObject()),(int) (0),_top,(int) (mostCurrent._svv.getWidth()-10),(int) (mostCurrent._svv.getWidth()-10));
 //BA.debugLineNum = 66;BA.debugLine="top = top + svV.Width + 4dip";
_top = (int) (_top+mostCurrent._svv.getWidth()+anywheresoftware.b4a.keywords.Common.DipToCurrent((int) (4)));
 };
 //BA.debugLineNum = 69;BA.debugLine="Dim filename As String";
_filename = "";
 //BA.debugLineNum = 70;BA.debugLine="filename = Library.GetFilename(link)";
_filename = mostCurrent._library._getfilename(mostCurrent.activityBA,_link);
 //BA.debugLineNum = 72;BA.debugLine="If filename = \"null\" Or filename.Length = 0 Then";
if ((_filename).equals("null") || _filename.length()==0) { 
 //BA.debugLineNum = 73;BA.debugLine="img.Gravity = Gravity.FILL";
_img.setGravity(anywheresoftware.b4a.keywords.Common.Gravity.FILL);
 //BA.debugLineNum = 74;BA.debugLine="img.SetBackgroundImage(LoadBitmap(File.DirAsset";
_img.SetBackgroundImage((android.graphics.Bitmap)(anywheresoftware.b4a.keywords.Common.LoadBitmap(anywheresoftware.b4a.keywords.Common.File.getDirAssets(),"alert.png").getObject()));
 }else if(anywheresoftware.b4a.keywords.Common.File.Exists(anywheresoftware.b4a.keywords.Common.File.getDirInternal(),_filename)==anywheresoftware.b4a.keywords.Common.True) { 
 //BA.debugLineNum = 77;BA.debugLine="glide.Load($\"${File.DirInternal}/${filename}\"$)";
_glide.Load((Object)((""+anywheresoftware.b4a.keywords.Common.SmartStringFormatter("",(Object)(anywheresoftware.b4a.keywords.Common.File.getDirInternal()))+"/"+anywheresoftware.b4a.keywords.Common.SmartStringFormatter("",(Object)(_filename))+""))).AsBitmap().Resize((int) (anywheresoftware.b4a.keywords.Common.Abs(_img.getWidth())),(int) (anywheresoftware.b4a.keywords.Common.Abs(_img.getHeight()))).CenterCrop().IntoImageView(_img);
 //BA.debugLineNum = 78;BA.debugLine="If i = 0 Then";
if (_i==0) { 
 //BA.debugLineNum = 79;BA.debugLine="Try";
try { //BA.debugLineNum = 80;BA.debugLine="Dim b1 As Bitmap";
_b1 = new anywheresoftware.b4a.objects.drawable.CanvasWrapper.BitmapWrapper();
 //BA.debugLineNum = 81;BA.debugLine="b1.Initialize(File.DirInternal,filename)";
_b1.Initialize(anywheresoftware.b4a.keywords.Common.File.getDirInternal(),_filename);
 //BA.debugLineNum = 82;BA.debugLine="SourceImageRect.Initialize(0, 0, b1.Width, b1";
_sourceimagerect.Initialize((int) (0),(int) (0),_b1.getWidth(),_b1.getHeight());
 //BA.debugLineNum = 83;BA.debugLine="TouchImageViewRect.Initialize(0, 0, touch.Wid";
_touchimageviewrect.Initialize((int) (0),(int) (0),mostCurrent._touch.getWidth(),mostCurrent._touch.getHeight());
 //BA.debugLineNum = 84;BA.debugLine="touch.ScaleSrcRectToDestRect(SourceImageRect,";
mostCurrent._touch.ScaleSrcRectToDestRect((android.graphics.Rect)(_sourceimagerect.getObject()),(android.graphics.Rect)(_touchimageviewrect.getObject()),"CENTER");
 //BA.debugLineNum = 85;BA.debugLine="touch.SetBitmap(LoadBitmap(File.DirInternal,f";
mostCurrent._touch.SetBitmap(mostCurrent.activityBA,(android.graphics.Bitmap)(anywheresoftware.b4a.keywords.Common.LoadBitmap(anywheresoftware.b4a.keywords.Common.File.getDirInternal(),_filename).getObject()));
 } 
       catch (Exception e51) {
			processBA.setLastException(e51); };
 };
 }else {
 //BA.debugLineNum = 90;BA.debugLine="img.Tag = filename";
_img.setTag((Object)(_filename));
 //BA.debugLineNum = 91;BA.debugLine="glide.Load(link).AsBitmap.Resize(Abs(img.Width)";
_glide.Load((Object)(_link)).AsBitmap().Resize((int) (anywheresoftware.b4a.keywords.Common.Abs(_img.getWidth())),(int) (anywheresoftware.b4a.keywords.Common.Abs(_img.getHeight()))).CenterCrop().IntoTarget(processBA,"target",(Object)(_img.getObject()));
 };
 //BA.debugLineNum = 94;BA.debugLine="img.Tag = filename";
_img.setTag((Object)(_filename));
 }
};
 //BA.debugLineNum = 98;BA.debugLine="svH.Panel.Width = left";
mostCurrent._svh.getPanel().setWidth(_left);
 //BA.debugLineNum = 99;BA.debugLine="svV.Panel.Height = top";
mostCurrent._svv.getPanel().setHeight(_top);
 //BA.debugLineNum = 101;BA.debugLine="End Sub";
return "";
}
public static String  _activity_pause(boolean _userclosed) throws Exception{
 //BA.debugLineNum = 107;BA.debugLine="Sub Activity_Pause (UserClosed As Boolean)";
 //BA.debugLineNum = 108;BA.debugLine="Library.AnimationFromLeft2Right";
mostCurrent._library._animationfromleft2right(mostCurrent.activityBA);
 //BA.debugLineNum = 109;BA.debugLine="End Sub";
return "";
}
public static String  _activity_resume() throws Exception{
 //BA.debugLineNum = 103;BA.debugLine="Sub Activity_Resume";
 //BA.debugLineNum = 105;BA.debugLine="End Sub";
return "";
}
public static String  _btnclose_click() throws Exception{
 //BA.debugLineNum = 111;BA.debugLine="Sub btnclose_Click";
 //BA.debugLineNum = 112;BA.debugLine="Activity.Finish";
mostCurrent._activity.Finish();
 //BA.debugLineNum = 113;BA.debugLine="End Sub";
return "";
}
public static String  _globals() throws Exception{
 //BA.debugLineNum = 11;BA.debugLine="Sub Globals";
 //BA.debugLineNum = 12;BA.debugLine="Private pnl1 As Panel";
mostCurrent._pnl1 = new anywheresoftware.b4a.objects.PanelWrapper();
 //BA.debugLineNum = 13;BA.debugLine="Dim touch As TouchImageView";
mostCurrent._touch = new uk.co.martinpearman.b4a.touchimageview.TouchImageViewWrapper();
 //BA.debugLineNum = 14;BA.debugLine="Private svH As HorizontalScrollView";
mostCurrent._svh = new anywheresoftware.b4a.objects.HorizontalScrollViewWrapper();
 //BA.debugLineNum = 15;BA.debugLine="Private svV As ScrollView";
mostCurrent._svv = new anywheresoftware.b4a.objects.ScrollViewWrapper();
 //BA.debugLineNum = 16;BA.debugLine="Private btnclose As Button";
mostCurrent._btnclose = new anywheresoftware.b4a.objects.ButtonWrapper();
 //BA.debugLineNum = 17;BA.debugLine="End Sub";
return "";
}
public static String  _imgclick_click() throws Exception{
anywheresoftware.b4a.objects.ImageViewWrapper _im = null;
 //BA.debugLineNum = 125;BA.debugLine="Sub imgclick_Click";
 //BA.debugLineNum = 127;BA.debugLine="Dim im As ImageView";
_im = new anywheresoftware.b4a.objects.ImageViewWrapper();
 //BA.debugLineNum = 128;BA.debugLine="im = Sender";
_im.setObject((android.widget.ImageView)(anywheresoftware.b4a.keywords.Common.Sender(mostCurrent.activityBA)));
 //BA.debugLineNum = 130;BA.debugLine="touch.SetBitmap(LoadBitmap(File.DirInternal,im.Ta";
mostCurrent._touch.SetBitmap(mostCurrent.activityBA,(android.graphics.Bitmap)(anywheresoftware.b4a.keywords.Common.LoadBitmap(anywheresoftware.b4a.keywords.Common.File.getDirInternal(),BA.ObjectToString(_im.getTag())).getObject()));
 //BA.debugLineNum = 132;BA.debugLine="End Sub";
return "";
}
public static String  _process_globals() throws Exception{
 //BA.debugLineNum = 6;BA.debugLine="Sub Process_Globals";
 //BA.debugLineNum = 7;BA.debugLine="Public link As String";
_link = "";
 //BA.debugLineNum = 8;BA.debugLine="Public images As List";
_images = new anywheresoftware.b4a.objects.collections.List();
 //BA.debugLineNum = 9;BA.debugLine="End Sub";
return "";
}
public static String  _target_success(anywheresoftware.b4a.objects.drawable.CanvasWrapper.BitmapWrapper _bitmap1,Object _tag) throws Exception{
anywheresoftware.b4a.objects.ImageViewWrapper _im = null;
ariagp.amin.shahedi.AriaGlideWrapper _glide = null;
anywheresoftware.b4a.objects.streams.File.OutputStreamWrapper _ou = null;
anywheresoftware.b4a.objects.drawable.CanvasWrapper.BitmapWrapper _b1 = null;
anywheresoftware.b4a.objects.drawable.CanvasWrapper.RectWrapper _sourceimagerect = null;
anywheresoftware.b4a.objects.drawable.CanvasWrapper.RectWrapper _touchimageviewrect = null;
 //BA.debugLineNum = 134;BA.debugLine="Sub target_Success(Bitmap1 As Bitmap, Tag As Objec";
 //BA.debugLineNum = 136;BA.debugLine="Dim im As ImageView";
_im = new anywheresoftware.b4a.objects.ImageViewWrapper();
 //BA.debugLineNum = 137;BA.debugLine="im = Tag";
_im.setObject((android.widget.ImageView)(_tag));
 //BA.debugLineNum = 139;BA.debugLine="Dim glide As AriaGlide";
_glide = new ariagp.amin.shahedi.AriaGlideWrapper();
 //BA.debugLineNum = 141;BA.debugLine="If File.Exists(File.DirInternal,im.Tag) = False T";
if (anywheresoftware.b4a.keywords.Common.File.Exists(anywheresoftware.b4a.keywords.Common.File.getDirInternal(),BA.ObjectToString(_im.getTag()))==anywheresoftware.b4a.keywords.Common.False) { 
 //BA.debugLineNum = 142;BA.debugLine="Dim ou As OutputStream";
_ou = new anywheresoftware.b4a.objects.streams.File.OutputStreamWrapper();
 //BA.debugLineNum = 143;BA.debugLine="ou = File.OpenOutput(File.DirInternal,im.Tag,Fal";
_ou = anywheresoftware.b4a.keywords.Common.File.OpenOutput(anywheresoftware.b4a.keywords.Common.File.getDirInternal(),BA.ObjectToString(_im.getTag()),anywheresoftware.b4a.keywords.Common.False);
 //BA.debugLineNum = 144;BA.debugLine="Bitmap1.WriteToStream(ou,100,\"PNG\")";
_bitmap1.WriteToStream((java.io.OutputStream)(_ou.getObject()),(int) (100),BA.getEnumFromString(android.graphics.Bitmap.CompressFormat.class,"PNG"));
 //BA.debugLineNum = 145;BA.debugLine="ou.Close";
_ou.Close();
 };
 //BA.debugLineNum = 148;BA.debugLine="glide.Load($\"${File.DirInternal}/${im.Tag}\"$).AsB";
_glide.Load((Object)((""+anywheresoftware.b4a.keywords.Common.SmartStringFormatter("",(Object)(anywheresoftware.b4a.keywords.Common.File.getDirInternal()))+"/"+anywheresoftware.b4a.keywords.Common.SmartStringFormatter("",_im.getTag())+""))).AsBitmap().Resize((int) (anywheresoftware.b4a.keywords.Common.Abs(_im.getWidth())),(int) (anywheresoftware.b4a.keywords.Common.Abs(_im.getHeight()))).CenterCrop().IntoImageView(_im);
 //BA.debugLineNum = 150;BA.debugLine="Dim b1 As Bitmap";
_b1 = new anywheresoftware.b4a.objects.drawable.CanvasWrapper.BitmapWrapper();
 //BA.debugLineNum = 151;BA.debugLine="Dim SourceImageRect, TouchImageViewRect As Rect";
_sourceimagerect = new anywheresoftware.b4a.objects.drawable.CanvasWrapper.RectWrapper();
_touchimageviewrect = new anywheresoftware.b4a.objects.drawable.CanvasWrapper.RectWrapper();
 //BA.debugLineNum = 152;BA.debugLine="b1.Initialize(File.DirInternal,im.Tag)";
_b1.Initialize(anywheresoftware.b4a.keywords.Common.File.getDirInternal(),BA.ObjectToString(_im.getTag()));
 //BA.debugLineNum = 153;BA.debugLine="SourceImageRect.Initialize(0, 0, b1.Width, b1.Hei";
_sourceimagerect.Initialize((int) (0),(int) (0),_b1.getWidth(),_b1.getHeight());
 //BA.debugLineNum = 154;BA.debugLine="TouchImageViewRect.Initialize(0, 0, touch.Width,";
_touchimageviewrect.Initialize((int) (0),(int) (0),mostCurrent._touch.getWidth(),mostCurrent._touch.getHeight());
 //BA.debugLineNum = 155;BA.debugLine="touch.ScaleSrcRectToDestRect(SourceImageRect, Tou";
mostCurrent._touch.ScaleSrcRectToDestRect((android.graphics.Rect)(_sourceimagerect.getObject()),(android.graphics.Rect)(_touchimageviewrect.getObject()),"CENTER");
 //BA.debugLineNum = 156;BA.debugLine="touch.SetBitmap(LoadBitmap(File.DirInternal,im.Ta";
mostCurrent._touch.SetBitmap(mostCurrent.activityBA,(android.graphics.Bitmap)(anywheresoftware.b4a.keywords.Common.LoadBitmap(anywheresoftware.b4a.keywords.Common.File.getDirInternal(),BA.ObjectToString(_im.getTag())).getObject()));
 //BA.debugLineNum = 158;BA.debugLine="End Sub";
return "";
}
public static String  _touchme_click(int _x,int _y) throws Exception{
 //BA.debugLineNum = 115;BA.debugLine="Sub touchme_Click(X As Int, Y As Int)";
 //BA.debugLineNum = 117;BA.debugLine="If svH.Visible = False Then";
if (mostCurrent._svh.getVisible()==anywheresoftware.b4a.keywords.Common.False) { 
 //BA.debugLineNum = 118;BA.debugLine="svH.SetVisibleAnimated(500,True)";
mostCurrent._svh.SetVisibleAnimated((int) (500),anywheresoftware.b4a.keywords.Common.True);
 }else {
 //BA.debugLineNum = 120;BA.debugLine="svH.SetVisibleAnimated(500,False)";
mostCurrent._svh.SetVisibleAnimated((int) (500),anywheresoftware.b4a.keywords.Common.False);
 };
 //BA.debugLineNum = 123;BA.debugLine="End Sub";
return "";
}
}
