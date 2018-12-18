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

public class main extends Activity implements B4AActivity{
	public static main mostCurrent;
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
			processBA = new BA(this.getApplicationContext(), null, null, "com.apps.demo", "com.apps.demo.main");
			processBA.loadHtSubs(this.getClass());
	        float deviceScale = getApplicationContext().getResources().getDisplayMetrics().density;
	        BALayout.setDeviceScale(deviceScale);
            
		}
		else if (previousOne != null) {
			Activity p = previousOne.get();
			if (p != null && p != this) {
                BA.LogInfo("Killing previous instance (main).");
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
		activityBA = new BA(this, layout, processBA, "com.apps.demo", "com.apps.demo.main");
        
        processBA.sharedProcessBA.activityBA = new java.lang.ref.WeakReference<BA>(activityBA);
        anywheresoftware.b4a.objects.ViewWrapper.lastId = 0;
        _activity = new ActivityWrapper(activityBA, "activity");
        anywheresoftware.b4a.Msgbox.isDismissing = false;
        if (BA.isShellModeRuntimeCheck(processBA)) {
			if (isFirst)
				processBA.raiseEvent2(null, true, "SHELL", false);
			processBA.raiseEvent2(null, true, "CREATE", true, "com.apps.demo.main", processBA, activityBA, _activity, anywheresoftware.b4a.keywords.Common.Density, mostCurrent);
			_activity.reinitializeForShell(activityBA, "activity");
		}
        initializeProcessGlobals();		
        initializeGlobals();
        
        BA.LogInfo("** Activity (main) Create, isFirst = " + isFirst + " **");
        processBA.raiseEvent2(null, true, "activity_create", false, isFirst);
		isFirst = false;
		if (this != mostCurrent)
			return;
        processBA.setActivityPaused(false);
        BA.LogInfo("** Activity (main) Resume **");
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
		return main.class;
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
        BA.LogInfo("** Activity (main) Pause, UserClosed = " + activityBA.activity.isFinishing() + " **");
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
            BA.LogInfo("** Activity (main) Resume **");
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
public static anywheresoftware.b4a.objects.Timer _timer1 = null;
public static boolean _first = false;
public static String _username = "";
public static String _password = "";
public anywheresoftware.b4a.objects.ProgressBarWrapper _pb1 = null;
public anywheresoftware.b4a.objects.LabelWrapper _lbldetails = null;
public anywheresoftware.b4a.objects.LabelWrapper _lbltitle = null;
public anywheresoftware.b4a.objects.PanelWrapper _pnllogo = null;
public anywheresoftware.b4a.objects.LabelWrapper _lblpb = null;
public anywheresoftware.b4a.objects.PanelWrapper _pnlprogress = null;
public com.apps.demo.opencart _opencart = null;
public anywheresoftware.b4a.objects.ImageViewWrapper _imglogo = null;
public anywheresoftware.b4a.objects.PanelWrapper _pnlheader = null;
public anywheresoftware.b4a.objects.PanelWrapper _pnlfooter = null;
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
public com.apps.demo.actpicture _actpicture = null;
public com.apps.demo.actsms _actsms = null;
public com.apps.demo.actshow _actshow = null;
public com.apps.demo.actweb _actweb = null;
public com.apps.demo.dateutils _dateutils = null;
public com.apps.demo.imagedownloader _imagedownloader = null;
public com.apps.demo.updater _updater = null;
public com.apps.demo.starter _starter = null;

public static boolean isAnyActivityVisible() {
    boolean vis = false;
vis = vis | (main.mostCurrent != null);
vis = vis | (actproduct.mostCurrent != null);
vis = vis | (actcompare.mostCurrent != null);
vis = vis | (actmenu.mostCurrent != null);
vis = vis | (actdoorder.mostCurrent != null);
vis = vis | (actbasket.mostCurrent != null);
vis = vis | (actpayment.mostCurrent != null);
vis = vis | (actproducts.mostCurrent != null);
vis = vis | (actsearch.mostCurrent != null);
vis = vis | (actreview.mostCurrent != null);
vis = vis | (acterrorintrenet.mostCurrent != null);
vis = vis | (actcontact.mostCurrent != null);
vis = vis | (actcategory.mostCurrent != null);
vis = vis | (actnotification.mostCurrent != null);
vis = vis | (actabout.mostCurrent != null);
vis = vis | (actorderdetails.mostCurrent != null);
vis = vis | (actregister.mostCurrent != null);
vis = vis | (actlogin.mostCurrent != null);
vis = vis | (actupdate.mostCurrent != null);
vis = vis | (actsetting.mostCurrent != null);
vis = vis | (actdisableshop.mostCurrent != null);
vis = vis | (actaccount.mostCurrent != null);
vis = vis | (googlevoices.mostCurrent != null);
vis = vis | (actpicture.mostCurrent != null);
vis = vis | (actsms.mostCurrent != null);
vis = vis | (actshow.mostCurrent != null);
vis = vis | (actweb.mostCurrent != null);
return vis;}
public static String  _activity_create(boolean _firsttime) throws Exception{
 //BA.debugLineNum = 40;BA.debugLine="Sub Activity_Create(FirstTime As Boolean)";
 //BA.debugLineNum = 42;BA.debugLine="Library.setLocalApp(Library.currLang)";
mostCurrent._library._setlocalapp(mostCurrent.activityBA,mostCurrent._library._currlang);
 //BA.debugLineNum = 44;BA.debugLine="Library.CacheSystem.Initialize";
mostCurrent._library._cachesystem._initialize(processBA);
 //BA.debugLineNum = 45;BA.debugLine="Library.ListProductIDForCompare.Initialize";
mostCurrent._library._listproductidforcompare.Initialize();
 //BA.debugLineNum = 47;BA.debugLine="Library.wishlist = \"\"";
mostCurrent._library._wishlist = "";
 //BA.debugLineNum = 49;BA.debugLine="If File.Exists(File.DirInternal,\"noimage1.png\") =";
if (anywheresoftware.b4a.keywords.Common.File.Exists(anywheresoftware.b4a.keywords.Common.File.getDirInternal(),"noimage1.png")==anywheresoftware.b4a.keywords.Common.False) { 
 //BA.debugLineNum = 50;BA.debugLine="File.Copy(File.DirAssets,\"noimage.png\",File.DirI";
anywheresoftware.b4a.keywords.Common.File.Copy(anywheresoftware.b4a.keywords.Common.File.getDirAssets(),"noimage.png",anywheresoftware.b4a.keywords.Common.File.getDirInternal(),"noimage1.png");
 };
 //BA.debugLineNum = 53;BA.debugLine="FirstLogin";
_firstlogin();
 //BA.debugLineNum = 55;BA.debugLine="Library.currLang = Library.manager.GetString(\"lan";
mostCurrent._library._currlang = mostCurrent._library._manager.GetString("lang");
 //BA.debugLineNum = 56;BA.debugLine="Library.currCurrency = Library.manager.GetString(";
mostCurrent._library._currcurrency = mostCurrent._library._manager.GetString("curr");
 //BA.debugLineNum = 58;BA.debugLine="Activity.LoadLayout(\"frmsplash\")";
mostCurrent._activity.LoadLayout("frmsplash",mostCurrent.activityBA);
 //BA.debugLineNum = 60;BA.debugLine="imglogo.Bitmap = Library.GetResourceBitmap(\"logo\"";
mostCurrent._imglogo.setBitmap((android.graphics.Bitmap)(mostCurrent._library._getresourcebitmap(mostCurrent.activityBA,"logo").getObject()));
 //BA.debugLineNum = 61;BA.debugLine="pnlfooter.Width = 100%x";
mostCurrent._pnlfooter.setWidth(anywheresoftware.b4a.keywords.Common.PerXToCurrent((float) (100),mostCurrent.activityBA));
 //BA.debugLineNum = 63;BA.debugLine="Library.LoadTheme";
mostCurrent._library._loadtheme(mostCurrent.activityBA);
 //BA.debugLineNum = 64;BA.debugLine="pnlheader.Color = Library.Theme_Header";
mostCurrent._pnlheader.setColor(mostCurrent._library._theme_header);
 //BA.debugLineNum = 65;BA.debugLine="pnlfooter.Color = Library.Theme_Footer";
mostCurrent._pnlfooter.setColor(mostCurrent._library._theme_footer);
 //BA.debugLineNum = 66;BA.debugLine="Activity.Color  = Library.Theme_Background";
mostCurrent._activity.setColor(mostCurrent._library._theme_background);
 //BA.debugLineNum = 68;BA.debugLine="lbltitle.Text = Library.GetStringResourse(\"app_ti";
mostCurrent._lbltitle.setText(BA.ObjectToCharSequence(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"app_title")));
 //BA.debugLineNum = 69;BA.debugLine="lbldetails.Text = Library.GetStringResourse(\"shop";
mostCurrent._lbldetails.setText(BA.ObjectToCharSequence(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"shop_details")));
 //BA.debugLineNum = 70;BA.debugLine="lblpb.Text = Library.GetStringResourse(\"loading\")";
mostCurrent._lblpb.setText(BA.ObjectToCharSequence(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"loading")));
 //BA.debugLineNum = 72;BA.debugLine="Library.ChangeStatusColor";
mostCurrent._library._changestatuscolor(mostCurrent.activityBA);
 //BA.debugLineNum = 74;BA.debugLine="Library.setLocalApp(Library.currLang)";
mostCurrent._library._setlocalapp(mostCurrent.activityBA,mostCurrent._library._currlang);
 //BA.debugLineNum = 75;BA.debugLine="Library.wishlist = Library.GetStringResourse(\"boo";
mostCurrent._library._wishlist = mostCurrent._library._getstringresourse(mostCurrent.activityBA,"bookmark");
 //BA.debugLineNum = 76;BA.debugLine="Library.comparelist = Library.GetStringResourse(\"";
mostCurrent._library._comparelist = mostCurrent._library._getstringresourse(mostCurrent.activityBA,"comparelist")+" ( 0 )";
 //BA.debugLineNum = 77;BA.debugLine="Library.Coupons.Initialize";
mostCurrent._library._coupons.Initialize();
 //BA.debugLineNum = 78;BA.debugLine="Library.Bookmarked.Initialize";
mostCurrent._library._bookmarked.Initialize();
 //BA.debugLineNum = 80;BA.debugLine="pnllogo.Visible = True";
mostCurrent._pnllogo.setVisible(anywheresoftware.b4a.keywords.Common.True);
 //BA.debugLineNum = 82;BA.debugLine="username = Library.manager.GetString(\"username\")";
mostCurrent._username = mostCurrent._library._manager.GetString("username");
 //BA.debugLineNum = 83;BA.debugLine="password = Library.manager.GetString(\"password\")";
mostCurrent._password = mostCurrent._library._manager.GetString("password");
 //BA.debugLineNum = 85;BA.debugLine="If Library.InternetState = True Then";
if (mostCurrent._library._internetstate(mostCurrent.activityBA)==anywheresoftware.b4a.keywords.Common.True) { 
 //BA.debugLineNum = 86;BA.debugLine="timer1.Initialize(\"tmr1\",1100)";
_timer1.Initialize(processBA,"tmr1",(long) (1100));
 }else {
 //BA.debugLineNum = 88;BA.debugLine="timer1.Initialize(\"tmr1\",500)";
_timer1.Initialize(processBA,"tmr1",(long) (500));
 };
 //BA.debugLineNum = 91;BA.debugLine="If Library.InternetState = False Then";
if (mostCurrent._library._internetstate(mostCurrent.activityBA)==anywheresoftware.b4a.keywords.Common.False) { 
 //BA.debugLineNum = 92;BA.debugLine="First = True";
_first = anywheresoftware.b4a.keywords.Common.True;
 //BA.debugLineNum = 93;BA.debugLine="Activity.Finish";
mostCurrent._activity.Finish();
 //BA.debugLineNum = 94;BA.debugLine="actErrorIntrenet.module = Activity";
mostCurrent._acterrorintrenet._module = (Object)(mostCurrent._activity.getObject());
 //BA.debugLineNum = 95;BA.debugLine="StartActivity(actErrorIntrenet)";
anywheresoftware.b4a.keywords.Common.StartActivity(mostCurrent.activityBA,(Object)(mostCurrent._acterrorintrenet.getObject()));
 //BA.debugLineNum = 96;BA.debugLine="Return";
if (true) return "";
 };
 //BA.debugLineNum = 99;BA.debugLine="OpenCart.Initialize";
mostCurrent._opencart._initialize(processBA);
 //BA.debugLineNum = 101;BA.debugLine="timer1.Enabled = True";
_timer1.setEnabled(anywheresoftware.b4a.keywords.Common.True);
 //BA.debugLineNum = 103;BA.debugLine="pb1.Progress = 0";
mostCurrent._pb1.setProgress((int) (0));
 //BA.debugLineNum = 105;BA.debugLine="InstallServices";
_installservices();
 //BA.debugLineNum = 109;BA.debugLine="End Sub";
return "";
}
public static String  _activity_pause(boolean _userclosed) throws Exception{
 //BA.debugLineNum = 216;BA.debugLine="Sub Activity_Pause (UserClosed As Boolean)";
 //BA.debugLineNum = 217;BA.debugLine="Activity.Finish";
mostCurrent._activity.Finish();
 //BA.debugLineNum = 218;BA.debugLine="End Sub";
return "";
}
public static String  _activity_resume() throws Exception{
 //BA.debugLineNum = 209;BA.debugLine="Sub Activity_Resume";
 //BA.debugLineNum = 210;BA.debugLine="If IsPaused(updater) Then";
if (anywheresoftware.b4a.keywords.Common.IsPaused(mostCurrent.activityBA,(Object)(mostCurrent._updater.getObject()))) { 
 //BA.debugLineNum = 211;BA.debugLine="StartService(updater)";
anywheresoftware.b4a.keywords.Common.StartService(mostCurrent.activityBA,(Object)(mostCurrent._updater.getObject()));
 };
 //BA.debugLineNum = 213;BA.debugLine="Library.ChangeProgressColor(pb1)";
mostCurrent._library._changeprogresscolor(mostCurrent.activityBA,mostCurrent._pb1);
 //BA.debugLineNum = 214;BA.debugLine="End Sub";
return "";
}
public static String  _downloadconfig() throws Exception{
anywheresoftware.b4a.samples.httputils2.httpjob _hu = null;
 //BA.debugLineNum = 200;BA.debugLine="Sub DownloadConfig";
 //BA.debugLineNum = 202;BA.debugLine="Dim hu As HttpJob";
_hu = new anywheresoftware.b4a.samples.httputils2.httpjob();
 //BA.debugLineNum = 203;BA.debugLine="hu.Initialize(\"config\",Me)";
_hu._initialize(processBA,"config",main.getObject());
 //BA.debugLineNum = 204;BA.debugLine="hu.Download(Library.GetStringResourse(\"url\") & \"/";
_hu._download(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"url")+"/app/config");
 //BA.debugLineNum = 205;BA.debugLine="hu.GetRequest.SetHeader(\"Cache-Control\",\"no-store";
_hu._getrequest().SetHeader("Cache-Control","no-store, no-cache, must-revalidate, max-age=0");
 //BA.debugLineNum = 207;BA.debugLine="End Sub";
return "";
}
public static String  _firstlogin() throws Exception{
String _cur = "";
 //BA.debugLineNum = 319;BA.debugLine="Sub FirstLogin";
 //BA.debugLineNum = 321;BA.debugLine="If Library.manager.GetBoolean(\"firsts\") = False T";
if (mostCurrent._library._manager.GetBoolean("firsts")==anywheresoftware.b4a.keywords.Common.False) { 
 //BA.debugLineNum = 323;BA.debugLine="Library.FirstRun = True";
mostCurrent._library._firstrun = anywheresoftware.b4a.keywords.Common.True;
 //BA.debugLineNum = 325;BA.debugLine="If Library.GetStringResourse(\"default_language\")";
if ((mostCurrent._library._getstringresourse(mostCurrent.activityBA,"default_language")).equals("fa")) { 
 //BA.debugLineNum = 326;BA.debugLine="Library.manager.SetString(\"lang\",\"فارسی\")";
mostCurrent._library._manager.SetString("lang","فارسی");
 //BA.debugLineNum = 328;BA.debugLine="Dim cur As String";
_cur = "";
 //BA.debugLineNum = 329;BA.debugLine="cur = Library.GetStringResourse(\"default_curren";
_cur = mostCurrent._library._getstringresourse(mostCurrent.activityBA,"default_currency");
 //BA.debugLineNum = 331;BA.debugLine="If cur.Length = 0 Then cur = \"RLS\"";
if (_cur.length()==0) { 
_cur = "RLS";};
 //BA.debugLineNum = 333;BA.debugLine="Library.manager.SetString(\"curr\",cur)";
mostCurrent._library._manager.SetString("curr",_cur);
 }else if((mostCurrent._library._getstringresourse(mostCurrent.activityBA,"default_language")).equals("en")) { 
 //BA.debugLineNum = 337;BA.debugLine="Library.manager.SetString(\"lang\",\"English\")";
mostCurrent._library._manager.SetString("lang","English");
 //BA.debugLineNum = 338;BA.debugLine="Library.manager.SetString(\"curr\",\"USD\")";
mostCurrent._library._manager.SetString("curr","USD");
 };
 //BA.debugLineNum = 341;BA.debugLine="Library.manager.SetBoolean(\"cache\",False)";
mostCurrent._library._manager.SetBoolean("cache",anywheresoftware.b4a.keywords.Common.False);
 //BA.debugLineNum = 342;BA.debugLine="Library.manager.SetBoolean(\"firsts\",True)";
mostCurrent._library._manager.SetBoolean("firsts",anywheresoftware.b4a.keywords.Common.True);
 //BA.debugLineNum = 343;BA.debugLine="Library.manager.SetBoolean(\"push\",True)";
mostCurrent._library._manager.SetBoolean("push",anywheresoftware.b4a.keywords.Common.True);
 };
 //BA.debugLineNum = 347;BA.debugLine="End Sub";
return "";
}
public static String  _getchecksum_receive() throws Exception{
anywheresoftware.b4a.objects.collections.List _ls = null;
 //BA.debugLineNum = 232;BA.debugLine="Sub GetChecksum_receive";
 //BA.debugLineNum = 234;BA.debugLine="Library.NewProduct.Initialize";
mostCurrent._library._newproduct.Initialize();
 //BA.debugLineNum = 235;BA.debugLine="Library.NewProduct = Library.CacheSystem.GetCache";
mostCurrent._library._newproduct = mostCurrent._library._cachesystem._getcacheaslist("new","product_main");
 //BA.debugLineNum = 237;BA.debugLine="Library.SpecialProduct.Initialize";
mostCurrent._library._specialproduct.Initialize();
 //BA.debugLineNum = 238;BA.debugLine="Library.SpecialProduct = Library.CacheSystem.GetC";
mostCurrent._library._specialproduct = mostCurrent._library._cachesystem._getcacheaslist("special","product_main");
 //BA.debugLineNum = 240;BA.debugLine="Library.FeatureProduct.Initialize";
mostCurrent._library._featureproduct.Initialize();
 //BA.debugLineNum = 241;BA.debugLine="Library.FeatureProduct = Library.CacheSystem.GetC";
mostCurrent._library._featureproduct = mostCurrent._library._cachesystem._getcacheaslist("feature","product_main");
 //BA.debugLineNum = 243;BA.debugLine="Library.BestProduct.Initialize";
mostCurrent._library._bestproduct.Initialize();
 //BA.debugLineNum = 244;BA.debugLine="Library.BestProduct = Library.CacheSystem.GetCach";
mostCurrent._library._bestproduct = mostCurrent._library._cachesystem._getcacheaslist("best","product_main");
 //BA.debugLineNum = 246;BA.debugLine="Library.listManufacturers.Initialize";
mostCurrent._library._listmanufacturers.Initialize();
 //BA.debugLineNum = 247;BA.debugLine="Library.listManufacturers = Library.CacheSystem.G";
mostCurrent._library._listmanufacturers = mostCurrent._library._cachesystem._getcacheaslist("manufacturers","manufacturers");
 //BA.debugLineNum = 249;BA.debugLine="Library.listBanners.Initialize";
mostCurrent._library._listbanners.Initialize();
 //BA.debugLineNum = 250;BA.debugLine="Library.listBanners = Library.CacheSystem.GetCach";
mostCurrent._library._listbanners = mostCurrent._library._cachesystem._getcacheaslist("banners","banners");
 //BA.debugLineNum = 252;BA.debugLine="If Library.listSlideshow = Null Then";
if (mostCurrent._library._listslideshow== null) { 
 //BA.debugLineNum = 253;BA.debugLine="Dim ls As List";
_ls = new anywheresoftware.b4a.objects.collections.List();
 //BA.debugLineNum = 254;BA.debugLine="ls.Initialize";
_ls.Initialize();
 //BA.debugLineNum = 255;BA.debugLine="Library.listSlideshow = ls";
mostCurrent._library._listslideshow = _ls;
 };
 //BA.debugLineNum = 258;BA.debugLine="Library.listSlideshow.Initialize";
mostCurrent._library._listslideshow.Initialize();
 //BA.debugLineNum = 259;BA.debugLine="Library.imagesSlideshow.Initialize";
mostCurrent._library._imagesslideshow.Initialize();
 //BA.debugLineNum = 260;BA.debugLine="Library.listSlideshow = Library.CacheSystem.GetCa";
mostCurrent._library._listslideshow = mostCurrent._library._cachesystem._getcacheaslist("slideshow","slideshow");
 //BA.debugLineNum = 262;BA.debugLine="Library.listInformation.Initialize";
mostCurrent._library._listinformation.Initialize();
 //BA.debugLineNum = 263;BA.debugLine="Library.listInformation = Library.CacheSystem.Get";
mostCurrent._library._listinformation = mostCurrent._library._cachesystem._getcacheaslist("informations","information");
 //BA.debugLineNum = 265;BA.debugLine="If Library.CacheSystem.ExistType(\"language\") = Fa";
if (mostCurrent._library._cachesystem._existtype("language")==anywheresoftware.b4a.keywords.Common.False) { 
 //BA.debugLineNum = 266;BA.debugLine="GetProductClass";
_getproductclass();
 }else {
 //BA.debugLineNum = 268;BA.debugLine="pnlprogress.SetVisibleAnimated(500,False)";
mostCurrent._pnlprogress.SetVisibleAnimated((int) (500),anywheresoftware.b4a.keywords.Common.False);
 //BA.debugLineNum = 269;BA.debugLine="StartActivity(actMenu)";
anywheresoftware.b4a.keywords.Common.StartActivity(mostCurrent.activityBA,(Object)(mostCurrent._actmenu.getObject()));
 };
 //BA.debugLineNum = 272;BA.debugLine="End Sub";
return "";
}
public static String  _getlanguages() throws Exception{
com.apps.demo.opencart _op1 = null;
 //BA.debugLineNum = 303;BA.debugLine="Sub GetLanguages";
 //BA.debugLineNum = 305;BA.debugLine="Dim op1 As OpenCart";
_op1 = new com.apps.demo.opencart();
 //BA.debugLineNum = 306;BA.debugLine="op1.Initialize";
_op1._initialize(processBA);
 //BA.debugLineNum = 307;BA.debugLine="op1.GetLanguages(Me,\"languages_receive\")";
_op1._getlanguages(main.getObject(),"languages_receive");
 //BA.debugLineNum = 309;BA.debugLine="End Sub";
return "";
}
public static String  _getproductclass() throws Exception{
com.apps.demo.opencart _op1 = null;
 //BA.debugLineNum = 274;BA.debugLine="Sub GetProductClass";
 //BA.debugLineNum = 276;BA.debugLine="Dim op1 As OpenCart";
_op1 = new com.apps.demo.opencart();
 //BA.debugLineNum = 277;BA.debugLine="op1.Initialize";
_op1._initialize(processBA);
 //BA.debugLineNum = 278;BA.debugLine="op1.GetProductClass(Me,\"productclass_receive\")";
_op1._getproductclass(main.getObject(),"productclass_receive");
 //BA.debugLineNum = 280;BA.debugLine="End Sub";
return "";
}
public static String  _gettoken() throws Exception{
 //BA.debugLineNum = 220;BA.debugLine="Sub GetToken";
 //BA.debugLineNum = 221;BA.debugLine="OpenCart.GetToken(Me,\"Token_Receive\")";
mostCurrent._opencart._gettoken(main.getObject(),"Token_Receive");
 //BA.debugLineNum = 222;BA.debugLine="End Sub";
return "";
}
public static String  _globals() throws Exception{
 //BA.debugLineNum = 26;BA.debugLine="Sub Globals";
 //BA.debugLineNum = 27;BA.debugLine="Dim username,password As String";
mostCurrent._username = "";
mostCurrent._password = "";
 //BA.debugLineNum = 28;BA.debugLine="Private pb1 As ProgressBar";
mostCurrent._pb1 = new anywheresoftware.b4a.objects.ProgressBarWrapper();
 //BA.debugLineNum = 29;BA.debugLine="Private lbldetails As Label";
mostCurrent._lbldetails = new anywheresoftware.b4a.objects.LabelWrapper();
 //BA.debugLineNum = 30;BA.debugLine="Private lbltitle As Label";
mostCurrent._lbltitle = new anywheresoftware.b4a.objects.LabelWrapper();
 //BA.debugLineNum = 31;BA.debugLine="Private pnllogo As Panel";
mostCurrent._pnllogo = new anywheresoftware.b4a.objects.PanelWrapper();
 //BA.debugLineNum = 32;BA.debugLine="Private lblpb As Label";
mostCurrent._lblpb = new anywheresoftware.b4a.objects.LabelWrapper();
 //BA.debugLineNum = 33;BA.debugLine="Private pnlprogress As Panel";
mostCurrent._pnlprogress = new anywheresoftware.b4a.objects.PanelWrapper();
 //BA.debugLineNum = 34;BA.debugLine="Private OpenCart As OpenCart";
mostCurrent._opencart = new com.apps.demo.opencart();
 //BA.debugLineNum = 35;BA.debugLine="Private imglogo As ImageView";
mostCurrent._imglogo = new anywheresoftware.b4a.objects.ImageViewWrapper();
 //BA.debugLineNum = 36;BA.debugLine="Private pnlheader As Panel";
mostCurrent._pnlheader = new anywheresoftware.b4a.objects.PanelWrapper();
 //BA.debugLineNum = 37;BA.debugLine="Private pnlfooter As Panel";
mostCurrent._pnlfooter = new anywheresoftware.b4a.objects.PanelWrapper();
 //BA.debugLineNum = 38;BA.debugLine="End Sub";
return "";
}
public static String  _installservices() throws Exception{
anywheresoftware.b4a.objects.IntentWrapper _shortcutintent = null;
anywheresoftware.b4a.objects.IntentWrapper _in = null;
anywheresoftware.b4a.phone.Phone _p = null;
 //BA.debugLineNum = 426;BA.debugLine="Sub InstallServices";
 //BA.debugLineNum = 429;BA.debugLine="If Library.manager.GetBoolean(\"shortcutinstall\")";
if (mostCurrent._library._manager.GetBoolean("shortcutinstall")==anywheresoftware.b4a.keywords.Common.False) { 
 //BA.debugLineNum = 431;BA.debugLine="Dim shortcutIntent As Intent";
_shortcutintent = new anywheresoftware.b4a.objects.IntentWrapper();
 //BA.debugLineNum = 432;BA.debugLine="shortcutIntent.Initialize(\"\", \"\")";
_shortcutintent.Initialize("","");
 //BA.debugLineNum = 433;BA.debugLine="shortcutIntent.SetComponent(Application.PackageN";
_shortcutintent.SetComponent(anywheresoftware.b4a.keywords.Common.Application.getPackageName()+"/.main");
 //BA.debugLineNum = 435;BA.debugLine="Dim In As Intent";
_in = new anywheresoftware.b4a.objects.IntentWrapper();
 //BA.debugLineNum = 436;BA.debugLine="In.Initialize(\"\", \"\")";
_in.Initialize("","");
 //BA.debugLineNum = 437;BA.debugLine="In.PutExtra(\"android.intent.extra.shortcut.INTEN";
_in.PutExtra("android.intent.extra.shortcut.INTENT",(Object)(_shortcutintent.getObject()));
 //BA.debugLineNum = 438;BA.debugLine="In.PutExtra(\"android.intent.extra.shortcut.NAME\"";
_in.PutExtra("android.intent.extra.shortcut.NAME",(Object)(mostCurrent._lbltitle.getText()));
 //BA.debugLineNum = 439;BA.debugLine="In.PutExtra(\"android.intent.extra.shortcut.ICON\"";
_in.PutExtra("android.intent.extra.shortcut.ICON",(Object)(mostCurrent._library._getresourcebitmap(mostCurrent.activityBA,"shortcut_icon").getObject()));
 //BA.debugLineNum = 440;BA.debugLine="In.Action = \"com.android.launcher.action.INSTALL";
_in.setAction("com.android.launcher.action.INSTALL_SHORTCUT");
 //BA.debugLineNum = 442;BA.debugLine="Dim p As Phone";
_p = new anywheresoftware.b4a.phone.Phone();
 //BA.debugLineNum = 443;BA.debugLine="p.SendBroadcastIntent(In)";
_p.SendBroadcastIntent((android.content.Intent)(_in.getObject()));
 //BA.debugLineNum = 444;BA.debugLine="DoEvents";
anywheresoftware.b4a.keywords.Common.DoEvents();
 //BA.debugLineNum = 446;BA.debugLine="Library.manager.SetBoolean(\"shortcutinstall\", Tr";
mostCurrent._library._manager.SetBoolean("shortcutinstall",anywheresoftware.b4a.keywords.Common.True);
 };
 //BA.debugLineNum = 451;BA.debugLine="End Sub";
return "";
}
public static String  _jobdone(anywheresoftware.b4a.samples.httputils2.httpjob _job) throws Exception{
anywheresoftware.b4a.objects.collections.JSONParser _js = null;
anywheresoftware.b4a.objects.collections.Map _d1 = null;
anywheresoftware.b4a.objects.collections.Map _checksum = null;
String _ch = "";
anywheresoftware.b4a.objects.collections.Map _temp = null;
 //BA.debugLineNum = 349;BA.debugLine="Sub JobDone(Job As HttpJob)";
 //BA.debugLineNum = 351;BA.debugLine="If Job.Success Then";
if (_job._success) { 
 //BA.debugLineNum = 353;BA.debugLine="If Job.JobName = \"config\" Then";
if ((_job._jobname).equals("config")) { 
 //BA.debugLineNum = 355;BA.debugLine="Dim js As JSONParser";
_js = new anywheresoftware.b4a.objects.collections.JSONParser();
 //BA.debugLineNum = 356;BA.debugLine="js.Initialize(Job.GetString2(\"UTF8\"))";
_js.Initialize(_job._getstring2("UTF8"));
 //BA.debugLineNum = 358;BA.debugLine="Dim d1 As Map";
_d1 = new anywheresoftware.b4a.objects.collections.Map();
 //BA.debugLineNum = 359;BA.debugLine="d1 = js.NextObject";
_d1 = _js.NextObject();
 //BA.debugLineNum = 361;BA.debugLine="Dim checksum As Map";
_checksum = new anywheresoftware.b4a.objects.collections.Map();
 //BA.debugLineNum = 362;BA.debugLine="checksum.Initialize";
_checksum.Initialize();
 //BA.debugLineNum = 363;BA.debugLine="checksum.Put(\"banner\",Library.List2Json(d1.Get(";
_checksum.Put((Object)("banner"),(Object)(mostCurrent._library._list2json(mostCurrent.activityBA,(anywheresoftware.b4a.objects.collections.List) anywheresoftware.b4a.AbsObjectWrapper.ConvertToWrapper(new anywheresoftware.b4a.objects.collections.List(), (java.util.List)(_d1.Get((Object)("banner")))))));
 //BA.debugLineNum = 364;BA.debugLine="checksum.Put(\"menu\",Library.List2Json(d1.Get(\"m";
_checksum.Put((Object)("menu"),(Object)(mostCurrent._library._list2json(mostCurrent.activityBA,(anywheresoftware.b4a.objects.collections.List) anywheresoftware.b4a.AbsObjectWrapper.ConvertToWrapper(new anywheresoftware.b4a.objects.collections.List(), (java.util.List)(_d1.Get((Object)("menus")))))));
 //BA.debugLineNum = 365;BA.debugLine="checksum.Put(\"feature_id\",d1.Get(\"feature_modul";
_checksum.Put((Object)("feature_id"),_d1.Get((Object)("feature_module")));
 //BA.debugLineNum = 367;BA.debugLine="Dim ch As String";
_ch = "";
 //BA.debugLineNum = 368;BA.debugLine="ch = Library.Map2Json(checksum)";
_ch = mostCurrent._library._map2json(mostCurrent.activityBA,_checksum);
 //BA.debugLineNum = 370;BA.debugLine="If File.Exists(File.DirInternal,\"checksum_modul";
if (anywheresoftware.b4a.keywords.Common.File.Exists(anywheresoftware.b4a.keywords.Common.File.getDirInternal(),"checksum_modules")==anywheresoftware.b4a.keywords.Common.False) { 
anywheresoftware.b4a.keywords.Common.File.WriteString(anywheresoftware.b4a.keywords.Common.File.getDirInternal(),"checksum_modules",_ch);};
 //BA.debugLineNum = 372;BA.debugLine="If File.ReadString(File.DirInternal,\"checksum_m";
if ((anywheresoftware.b4a.keywords.Common.File.ReadString(anywheresoftware.b4a.keywords.Common.File.getDirInternal(),"checksum_modules")).equals(_ch) == false) { 
 //BA.debugLineNum = 373;BA.debugLine="File.WriteString(File.DirInternal,\"checksum_mo";
anywheresoftware.b4a.keywords.Common.File.WriteString(anywheresoftware.b4a.keywords.Common.File.getDirInternal(),"checksum_modules",_ch);
 //BA.debugLineNum = 374;BA.debugLine="Library.CacheSystem.ClearCache2(\"product_main\"";
mostCurrent._library._cachesystem._clearcache2("product_main");
 //BA.debugLineNum = 375;BA.debugLine="Library.CacheSystem.ClearCache2(\"topic_product";
mostCurrent._library._cachesystem._clearcache2("topic_products");
 //BA.debugLineNum = 376;BA.debugLine="Library.CacheSystem.ClearCache2(\"product_of_ca";
mostCurrent._library._cachesystem._clearcache2("product_of_category");
 //BA.debugLineNum = 377;BA.debugLine="Library.CacheSystem.ClearCache2(\"slideshow\")";
mostCurrent._library._cachesystem._clearcache2("slideshow");
 //BA.debugLineNum = 378;BA.debugLine="Library.CacheSystem.ClearCache2(\"banners\")";
mostCurrent._library._cachesystem._clearcache2("banners");
 };
 //BA.debugLineNum = 382;BA.debugLine="If d1.Get(\"shop_state\") = False Then";
if ((_d1.Get((Object)("shop_state"))).equals((Object)(anywheresoftware.b4a.keywords.Common.False))) { 
 //BA.debugLineNum = 383;BA.debugLine="Library.ShopState = False";
mostCurrent._library._shopstate = anywheresoftware.b4a.keywords.Common.False;
 //BA.debugLineNum = 384;BA.debugLine="Library.manager.SetBoolean(\"disactive_shop\",Tr";
mostCurrent._library._manager.SetBoolean("disactive_shop",anywheresoftware.b4a.keywords.Common.True);
 //BA.debugLineNum = 385;BA.debugLine="Activity.Finish";
mostCurrent._activity.Finish();
 //BA.debugLineNum = 386;BA.debugLine="StartActivity(actDisableShop)";
anywheresoftware.b4a.keywords.Common.StartActivity(mostCurrent.activityBA,(Object)(mostCurrent._actdisableshop.getObject()));
 //BA.debugLineNum = 387;BA.debugLine="Return";
if (true) return "";
 };
 //BA.debugLineNum = 390;BA.debugLine="If d1.ContainsKey(\"show_gurest_register\") = Fal";
if (_d1.ContainsKey((Object)("show_gurest_register"))==anywheresoftware.b4a.keywords.Common.False) { 
_d1.Put((Object)("show_gurest_register"),(Object)(anywheresoftware.b4a.keywords.Common.True));};
 //BA.debugLineNum = 392;BA.debugLine="Library.Config = d1";
mostCurrent._library._config = _d1;
 //BA.debugLineNum = 393;BA.debugLine="Library.CacheSystem.AddMap2Cache(\"config\",d1,\"c";
mostCurrent._library._cachesystem._addmap2cache("config",_d1,"config");
 //BA.debugLineNum = 395;BA.debugLine="GetToken";
_gettoken();
 }else {
 //BA.debugLineNum = 398;BA.debugLine="Library.manager.SetBoolean(\"register\",True)";
mostCurrent._library._manager.SetBoolean("register",anywheresoftware.b4a.keywords.Common.True);
 };
 }else {
 //BA.debugLineNum = 403;BA.debugLine="If Job.JobName = \"config\" Then";
if ((_job._jobname).equals("config")) { 
 //BA.debugLineNum = 404;BA.debugLine="Dim temp As Map";
_temp = new anywheresoftware.b4a.objects.collections.Map();
 //BA.debugLineNum = 405;BA.debugLine="temp.Initialize";
_temp.Initialize();
 //BA.debugLineNum = 406;BA.debugLine="temp.Put(\"shop_state\",True)";
_temp.Put((Object)("shop_state"),(Object)(anywheresoftware.b4a.keywords.Common.True));
 //BA.debugLineNum = 407;BA.debugLine="temp.Put(\"force_update\",True)";
_temp.Put((Object)("force_update"),(Object)(anywheresoftware.b4a.keywords.Common.True));
 //BA.debugLineNum = 408;BA.debugLine="temp.Put(\"title\",Library.GetStringResourse(\"app";
_temp.Put((Object)("title"),(Object)(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"app_title")));
 //BA.debugLineNum = 409;BA.debugLine="temp.Put(\"color\",Library.ar.GetApplicationStrin";
_temp.Put((Object)("color"),(Object)(mostCurrent._library._ar.GetApplicationString("theme_header")));
 //BA.debugLineNum = 410;BA.debugLine="temp.Put(\"version\",Library.Sign.getPackageVersi";
_temp.Put((Object)("version"),(Object)(mostCurrent._library._sign.getPackageVersionCode(processBA)));
 //BA.debugLineNum = 411;BA.debugLine="temp.Put(\"banner\",\"\")";
_temp.Put((Object)("banner"),(Object)(""));
 //BA.debugLineNum = 412;BA.debugLine="temp.Put(\"menus\",\"\")";
_temp.Put((Object)("menus"),(Object)(""));
 //BA.debugLineNum = 414;BA.debugLine="Library.Config = temp";
mostCurrent._library._config = _temp;
 //BA.debugLineNum = 415;BA.debugLine="Library.CacheSystem.AddMap2Cache(\"config\",d1,\"c";
mostCurrent._library._cachesystem._addmap2cache("config",_d1,"config");
 //BA.debugLineNum = 417;BA.debugLine="GetToken";
_gettoken();
 };
 };
 //BA.debugLineNum = 422;BA.debugLine="Job.Release";
_job._release();
 //BA.debugLineNum = 424;BA.debugLine="End Sub";
return "";
}
public static String  _languages_receive(anywheresoftware.b4a.objects.collections.Map _res,String _cat) throws Exception{
 //BA.debugLineNum = 311;BA.debugLine="Sub languages_receive(res As Map,cat As String)";
 //BA.debugLineNum = 313;BA.debugLine="Library.CacheSystem.AddMap2Cache(\"language\",res,\"";
mostCurrent._library._cachesystem._addmap2cache("language",_res,"language");
 //BA.debugLineNum = 315;BA.debugLine="StartActivity(actMenu)";
anywheresoftware.b4a.keywords.Common.StartActivity(mostCurrent.activityBA,(Object)(mostCurrent._actmenu.getObject()));
 //BA.debugLineNum = 317;BA.debugLine="End Sub";
return "";
}
public static String  _login_receive(anywheresoftware.b4a.objects.collections.Map _res,String _cat) throws Exception{
com.apps.demo.opencart _checksum = null;
anywheresoftware.b4a.objects.collections.Map _data = null;
String _need_to_login_site = "";
 //BA.debugLineNum = 111;BA.debugLine="Sub login_receive(res As Map,cat As String)";
 //BA.debugLineNum = 113;BA.debugLine="Dim checksum As OpenCart";
_checksum = new com.apps.demo.opencart();
 //BA.debugLineNum = 114;BA.debugLine="checksum.Initialize";
_checksum._initialize(processBA);
 //BA.debugLineNum = 115;BA.debugLine="checksum.CheckSumOnline(Me,\"GetChecksum_receive\")";
_checksum._checksumonline(main.getObject(),"GetChecksum_receive");
 //BA.debugLineNum = 117;BA.debugLine="If res = Null Then";
if (_res== null) { 
 //BA.debugLineNum = 118;BA.debugLine="Return";
if (true) return "";
 };
 //BA.debugLineNum = 121;BA.debugLine="If res.IsInitialized = False Then";
if (_res.IsInitialized()==anywheresoftware.b4a.keywords.Common.False) { 
 //BA.debugLineNum = 122;BA.debugLine="Return";
if (true) return "";
 };
 //BA.debugLineNum = 125;BA.debugLine="If res.ContainsKey(\"error\") Then";
if (_res.ContainsKey((Object)("error"))) { 
 //BA.debugLineNum = 126;BA.debugLine="Return";
if (true) return "";
 }else {
 //BA.debugLineNum = 129;BA.debugLine="Dim data As Map";
_data = new anywheresoftware.b4a.objects.collections.Map();
 //BA.debugLineNum = 130;BA.debugLine="data = res.Get(\"data\")";
_data.setObject((anywheresoftware.b4a.objects.collections.Map.MyMap)(_res.Get((Object)("data"))));
 //BA.debugLineNum = 132;BA.debugLine="Dim need_to_login_site As String";
_need_to_login_site = "";
 //BA.debugLineNum = 133;BA.debugLine="need_to_login_site = Library.GetStringResourse(\"";
_need_to_login_site = mostCurrent._library._getstringresourse(mostCurrent.activityBA,"need_to_login_site").toLowerCase();
 //BA.debugLineNum = 135;BA.debugLine="If res.ContainsKey(\"data\") = False Then";
if (_res.ContainsKey((Object)("data"))==anywheresoftware.b4a.keywords.Common.False) { 
 //BA.debugLineNum = 136;BA.debugLine="Library.loginDetails.Initialize";
mostCurrent._library._logindetails.Initialize();
 //BA.debugLineNum = 137;BA.debugLine="Library.loginDetails.Put(\"address_id\",\"1\")";
mostCurrent._library._logindetails.Put((Object)("address_id"),(Object)("1"));
 //BA.debugLineNum = 138;BA.debugLine="Library.loginDetails.Put(\"login\",True)";
mostCurrent._library._logindetails.Put((Object)("login"),(Object)(anywheresoftware.b4a.keywords.Common.True));
 //BA.debugLineNum = 140;BA.debugLine="Library.loginDetails.put(\"expire\",DateTime.Now)";
mostCurrent._library._logindetails.Put((Object)("expire"),(Object)(anywheresoftware.b4a.keywords.Common.DateTime.getNow()));
 //BA.debugLineNum = 142;BA.debugLine="If Library.GuestLogin.IsInitialized Then";
if (mostCurrent._library._guestlogin.IsInitialized()) { 
 //BA.debugLineNum = 143;BA.debugLine="Library.GuestLogin.Put(\"login\",False)";
mostCurrent._library._guestlogin.Put((Object)("login"),(Object)(anywheresoftware.b4a.keywords.Common.False));
 };
 //BA.debugLineNum = 146;BA.debugLine="Return";
if (true) return "";
 };
 //BA.debugLineNum = 150;BA.debugLine="If Library.loginDetails.IsInitialized = False Th";
if (mostCurrent._library._logindetails.IsInitialized()==anywheresoftware.b4a.keywords.Common.False) { 
mostCurrent._library._logindetails.Initialize();};
 //BA.debugLineNum = 152;BA.debugLine="Try";
try { //BA.debugLineNum = 153;BA.debugLine="Library.loginDetails = data";
mostCurrent._library._logindetails = _data;
 //BA.debugLineNum = 154;BA.debugLine="Library.loginDetails.Put(\"address_id\",data.Get(";
mostCurrent._library._logindetails.Put((Object)("address_id"),_data.Get((Object)("address_id")));
 //BA.debugLineNum = 155;BA.debugLine="Library.loginDetails.Put(\"login\",True)";
mostCurrent._library._logindetails.Put((Object)("login"),(Object)(anywheresoftware.b4a.keywords.Common.True));
 //BA.debugLineNum = 156;BA.debugLine="Library.loginDetails.put(\"session\",data.Get(\"se";
mostCurrent._library._logindetails.Put((Object)("session"),_data.Get((Object)("session")));
 //BA.debugLineNum = 157;BA.debugLine="Library.loginDetails.put(\"expire\",DateTime.Now)";
mostCurrent._library._logindetails.Put((Object)("expire"),(Object)(anywheresoftware.b4a.keywords.Common.DateTime.getNow()));
 } 
       catch (Exception e35) {
			processBA.setLastException(e35); };
 //BA.debugLineNum = 162;BA.debugLine="Library.ChoosenAddress = 0";
mostCurrent._library._choosenaddress = (int) (0);
 //BA.debugLineNum = 164;BA.debugLine="If Library.GuestLogin.IsInitialized Then";
if (mostCurrent._library._guestlogin.IsInitialized()) { 
 //BA.debugLineNum = 165;BA.debugLine="Library.GuestLogin.Put(\"login\",False)";
mostCurrent._library._guestlogin.Put((Object)("login"),(Object)(anywheresoftware.b4a.keywords.Common.False));
 };
 };
 //BA.debugLineNum = 170;BA.debugLine="End Sub";
return "";
}

public static void initializeProcessGlobals() {
    
    if (main.processGlobalsRun == false) {
	    main.processGlobalsRun = true;
		try {
		        anywheresoftware.b4a.samples.httputils2.httputils2service._process_globals();
JHSBarcodes.V1.azteccode._process_globals();
JHSBarcodes.V1.qrcode._process_globals();
JHSBarcodes.V1.code25i._process_globals();
JHSBarcodes.V1.ean13._process_globals();
JHSBarcodes.V1.ean8._process_globals();
JHSBarcodes.V1.code128._process_globals();
JHSBarcodes.V1.pdf417._process_globals();
JHSBarcodes.V1.code39._process_globals();
JHSBarcodes.V1.code93._process_globals();
JHSBarcodes.V1.code11._process_globals();
main._process_globals();
actproduct._process_globals();
actcompare._process_globals();
actmenu._process_globals();
library._process_globals();
actdoorder._process_globals();
actbasket._process_globals();
actpayment._process_globals();
actproducts._process_globals();
actsearch._process_globals();
actreview._process_globals();
acterrorintrenet._process_globals();
actcontact._process_globals();
actcategory._process_globals();
actnotification._process_globals();
actabout._process_globals();
actorderdetails._process_globals();
actregister._process_globals();
actlogin._process_globals();
actupdate._process_globals();
actsetting._process_globals();
actdisableshop._process_globals();
bookmark._process_globals();
actaccount._process_globals();
googlevoices._process_globals();
actpicture._process_globals();
actsms._process_globals();
actshow._process_globals();
actweb._process_globals();
dateutils._process_globals();
imagedownloader._process_globals();
updater._process_globals();
starter._process_globals();
		
        } catch (Exception e) {
			throw new RuntimeException(e);
		}
    }
}public static String  _process_globals() throws Exception{
 //BA.debugLineNum = 21;BA.debugLine="Sub Process_Globals";
 //BA.debugLineNum = 22;BA.debugLine="Private timer1 As Timer";
_timer1 = new anywheresoftware.b4a.objects.Timer();
 //BA.debugLineNum = 23;BA.debugLine="Public First As Boolean";
_first = false;
 //BA.debugLineNum = 24;BA.debugLine="End Sub";
return "";
}
public static String  _productclass_receive(anywheresoftware.b4a.objects.collections.Map _res,String _cat) throws Exception{
anywheresoftware.b4a.objects.collections.Map _data = null;
 //BA.debugLineNum = 282;BA.debugLine="Sub productclass_receive(res As Map,cat As String)";
 //BA.debugLineNum = 284;BA.debugLine="Try";
try { //BA.debugLineNum = 285;BA.debugLine="If res <> Null Then";
if (_res!= null) { 
 //BA.debugLineNum = 287;BA.debugLine="Dim data As Map";
_data = new anywheresoftware.b4a.objects.collections.Map();
 //BA.debugLineNum = 288;BA.debugLine="data = res.Get(\"data\")";
_data.setObject((anywheresoftware.b4a.objects.collections.Map.MyMap)(_res.Get((Object)("data"))));
 //BA.debugLineNum = 290;BA.debugLine="Library.CacheSystem.AddList2Cache(\"currencies\",";
mostCurrent._library._cachesystem._addlist2cache("currencies",(anywheresoftware.b4a.objects.collections.List) anywheresoftware.b4a.AbsObjectWrapper.ConvertToWrapper(new anywheresoftware.b4a.objects.collections.List(), (java.util.List)(_data.Get((Object)("currencies")))),"currencies");
 //BA.debugLineNum = 291;BA.debugLine="Library.CacheSystem.AddMap2Cache(\"product_class";
mostCurrent._library._cachesystem._addmap2cache("product_classes",_res,"product_classes");
 };
 } 
       catch (Exception e9) {
			processBA.setLastException(e9); };
 //BA.debugLineNum = 297;BA.debugLine="pnlprogress.SetVisibleAnimated(500,False)";
mostCurrent._pnlprogress.SetVisibleAnimated((int) (500),anywheresoftware.b4a.keywords.Common.False);
 //BA.debugLineNum = 299;BA.debugLine="GetLanguages";
_getlanguages();
 //BA.debugLineNum = 301;BA.debugLine="End Sub";
return "";
}
public static String  _tmr1_tick() throws Exception{
 //BA.debugLineNum = 172;BA.debugLine="Sub tmr1_Tick";
 //BA.debugLineNum = 174;BA.debugLine="timer1.Enabled = False";
_timer1.setEnabled(anywheresoftware.b4a.keywords.Common.False);
 //BA.debugLineNum = 176;BA.debugLine="If Library.InternetState = False And Library.Cach";
if (mostCurrent._library._internetstate(mostCurrent.activityBA)==anywheresoftware.b4a.keywords.Common.False && mostCurrent._library._cachesystem._existtype("product_main")==anywheresoftware.b4a.keywords.Common.False) { 
 //BA.debugLineNum = 177;BA.debugLine="First = True";
_first = anywheresoftware.b4a.keywords.Common.True;
 //BA.debugLineNum = 178;BA.debugLine="Activity.Finish";
mostCurrent._activity.Finish();
 //BA.debugLineNum = 179;BA.debugLine="actErrorIntrenet.module = Activity";
mostCurrent._acterrorintrenet._module = (Object)(mostCurrent._activity.getObject());
 //BA.debugLineNum = 180;BA.debugLine="StartActivity(actErrorIntrenet)";
anywheresoftware.b4a.keywords.Common.StartActivity(mostCurrent.activityBA,(Object)(mostCurrent._acterrorintrenet.getObject()));
 }else if(mostCurrent._library._cachesystem._existtype("product_main")==anywheresoftware.b4a.keywords.Common.True && mostCurrent._library._internetstate(mostCurrent.activityBA)==anywheresoftware.b4a.keywords.Common.False) { 
 //BA.debugLineNum = 184;BA.debugLine="Library.token.Initialize";
mostCurrent._library._token.Initialize();
 //BA.debugLineNum = 185;BA.debugLine="Library.token.Put(\"token_type\",\"\")";
mostCurrent._library._token.Put((Object)("token_type"),(Object)(""));
 //BA.debugLineNum = 186;BA.debugLine="Library.token.Put(\"access_token\",\"\")";
mostCurrent._library._token.Put((Object)("access_token"),(Object)(""));
 //BA.debugLineNum = 188;BA.debugLine="If Library.Config.IsInitialized = False Then Lib";
if (mostCurrent._library._config.IsInitialized()==anywheresoftware.b4a.keywords.Common.False) { 
mostCurrent._library._config.Initialize();};
 //BA.debugLineNum = 189;BA.debugLine="Library.Config = Library.CacheSystem.GetCacheAsM";
mostCurrent._library._config = mostCurrent._library._cachesystem._getcacheasmap("config","config");
 //BA.debugLineNum = 191;BA.debugLine="GetChecksum_receive";
_getchecksum_receive();
 }else {
 //BA.debugLineNum = 194;BA.debugLine="DownloadConfig";
_downloadconfig();
 };
 //BA.debugLineNum = 198;BA.debugLine="End Sub";
return "";
}
public static String  _token_receive(anywheresoftware.b4a.objects.collections.Map _data,Object _state) throws Exception{
com.apps.demo.opencart _op1 = null;
 //BA.debugLineNum = 224;BA.debugLine="Sub Token_Receive(data As Map,state As Object)";
 //BA.debugLineNum = 226;BA.debugLine="Dim op1 As OpenCart";
_op1 = new com.apps.demo.opencart();
 //BA.debugLineNum = 227;BA.debugLine="op1.Initialize";
_op1._initialize(processBA);
 //BA.debugLineNum = 228;BA.debugLine="op1.Login(Me,\"login_receive\",username,password)";
_op1._login(main.getObject(),"login_receive",mostCurrent._username,mostCurrent._password);
 //BA.debugLineNum = 230;BA.debugLine="End Sub";
return "";
}
}
