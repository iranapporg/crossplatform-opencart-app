package com.apps.manageropencart;


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

public class actstatistic extends Activity implements B4AActivity{
	public static actstatistic mostCurrent;
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
			processBA = new BA(this.getApplicationContext(), null, null, "com.apps.manageropencart", "com.apps.manageropencart.actstatistic");
			processBA.loadHtSubs(this.getClass());
	        float deviceScale = getApplicationContext().getResources().getDisplayMetrics().density;
	        BALayout.setDeviceScale(deviceScale);
            
		}
		else if (previousOne != null) {
			Activity p = previousOne.get();
			if (p != null && p != this) {
                BA.LogInfo("Killing previous instance (actstatistic).");
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
		activityBA = new BA(this, layout, processBA, "com.apps.manageropencart", "com.apps.manageropencart.actstatistic");
        
        processBA.sharedProcessBA.activityBA = new java.lang.ref.WeakReference<BA>(activityBA);
        anywheresoftware.b4a.objects.ViewWrapper.lastId = 0;
        _activity = new ActivityWrapper(activityBA, "activity");
        anywheresoftware.b4a.Msgbox.isDismissing = false;
        if (BA.isShellModeRuntimeCheck(processBA)) {
			if (isFirst)
				processBA.raiseEvent2(null, true, "SHELL", false);
			processBA.raiseEvent2(null, true, "CREATE", true, "com.apps.manageropencart.actstatistic", processBA, activityBA, _activity, anywheresoftware.b4a.keywords.Common.Density, mostCurrent);
			_activity.reinitializeForShell(activityBA, "activity");
		}
        initializeProcessGlobals();		
        initializeGlobals();
        
        BA.LogInfo("** Activity (actstatistic) Create, isFirst = " + isFirst + " **");
        processBA.raiseEvent2(null, true, "activity_create", false, isFirst);
		isFirst = false;
		if (this != mostCurrent)
			return;
        processBA.setActivityPaused(false);
        BA.LogInfo("** Activity (actstatistic) Resume **");
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
		return actstatistic.class;
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
        BA.LogInfo("** Activity (actstatistic) Pause, UserClosed = " + activityBA.activity.isFinishing() + " **");
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
            BA.LogInfo("** Activity (actstatistic) Resume **");
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
public flm.b4a.ultimatelistview.UltimateListViewWrapper _vvvvvvvvvvv5 = null;
public com.apps.manageropencart.showprogress _vvvvvvvvv7 = null;
public anywheresoftware.b4a.objects.ButtonWrapper _vvvvvvvvvvv7 = null;
public anywheresoftware.b4a.objects.collections.Map _vvvvvvvvvvv6 = null;
public anywheresoftware.b4a.objects.collections.List _vvvvvvvvvvv0 = null;
public static String _vvvvvvvvvvv4 = "";
public anywheresoftware.b4a.objects.LabelWrapper _lblcity2 = null;
public anywheresoftware.b4a.objects.LabelWrapper _lblregister2 = null;
public anywheresoftware.b4a.objects.LabelWrapper _lblip2 = null;
public anywheresoftware.b4a.objects.LabelWrapper _lblname2 = null;
public anywheresoftware.b4a.objects.LabelWrapper _lblnumber2 = null;
public anywheresoftware.b4a.objects.LabelWrapper _lblheader1 = null;
public anywheresoftware.b4a.objects.LabelWrapper _lblheader2 = null;
public anywheresoftware.b4a.objects.PanelWrapper _pnlulv = null;
public anywheresoftware.b4a.objects.PanelWrapper _pnlheader = null;
public anywheresoftware.b4a.samples.httputils2.httputils2service _vvvvvv0 = null;
public com.apps.manageropencart.main _vvvvvvv1 = null;
public com.apps.manageropencart.actlogin _vvvvvvv2 = null;
public com.apps.manageropencart.updater _vvvvvvv3 = null;
public com.apps.manageropencart.actsendpush _vvvvvvv4 = null;
public com.apps.manageropencart.actdetailsofreportitem _vvvvvvv5 = null;
public com.apps.manageropencart.library _vvvvvvv6 = null;
public com.apps.manageropencart.actfeaturemodule _vvvvvvv7 = null;
public com.apps.manageropencart.actbanners _vvvvvvv0 = null;
public com.apps.manageropencart.actmenu _vvvvvvvv2 = null;
public com.apps.manageropencart.actmenus _vvvvvvvv3 = null;
public com.apps.manageropencart.actnewversion _vvvvvvvv4 = null;
public com.apps.manageropencart.actpassword _vvvvvvvv5 = null;
public com.apps.manageropencart.starter _vvvvvvvv6 = null;
public com.apps.manageropencart.firebasemessaging _vvvvvvvv7 = null;

public static void initializeProcessGlobals() {
             try {
                Class.forName(BA.applicationContext.getPackageName() + ".main").getMethod("initializeProcessGlobals").invoke(null, null);
            } catch (Exception e) {
                throw new RuntimeException(e);
            }
}
public static String  _activity_create(boolean _firsttime) throws Exception{
anywheresoftware.b4a.objects.drawable.ColorDrawable _cd = null;
anywheresoftware.b4a.samples.httputils2.httpjob _hu = null;
 //BA.debugLineNum = 28;BA.debugLine="Sub Activity_Create(FirstTime As Boolean)";
 //BA.debugLineNum = 30;BA.debugLine="Library.setLocalApp";
mostCurrent._vvvvvvv6._vvvv0(mostCurrent.activityBA);
 //BA.debugLineNum = 32;BA.debugLine="Activity.LoadLayout(\"frmstatistic\")";
mostCurrent._activity.LoadLayout("frmstatistic",mostCurrent.activityBA);
 //BA.debugLineNum = 34;BA.debugLine="lang = File.ReadString(File.DirInternal,Library.L";
mostCurrent._vvvvvvvvvvv4 = anywheresoftware.b4a.keywords.Common.File.ReadString(anywheresoftware.b4a.keywords.Common.File.getDirInternal(),mostCurrent._vvvvvvv6._vv7);
 //BA.debugLineNum = 36;BA.debugLine="ulv.Initialize(0, 0, \"\", \"ULV\")";
mostCurrent._vvvvvvvvvvv5.Initialize(mostCurrent.activityBA,(byte) (0),(int) (0),"","ULV");
 //BA.debugLineNum = 37;BA.debugLine="ulv.FastScroller(True)";
mostCurrent._vvvvvvvvvvv5.FastScroller(anywheresoftware.b4a.keywords.Common.True);
 //BA.debugLineNum = 39;BA.debugLine="Dim cd As ColorDrawable";
_cd = new anywheresoftware.b4a.objects.drawable.ColorDrawable();
 //BA.debugLineNum = 40;BA.debugLine="cd.Initialize(Colors.Transparent,0)";
_cd.Initialize(anywheresoftware.b4a.keywords.Common.Colors.Transparent,(int) (0));
 //BA.debugLineNum = 41;BA.debugLine="ulv.PressedDrawable = cd";
mostCurrent._vvvvvvvvvvv5.setPressedDrawable((android.graphics.drawable.Drawable)(_cd.getObject()));
 //BA.debugLineNum = 43;BA.debugLine="pnlulv.AddView(ulv, 0,0,pnlulv.Width,pnlulv.Heigh";
mostCurrent._pnlulv.AddView((android.view.View)(mostCurrent._vvvvvvvvvvv5.getObject()),(int) (0),(int) (0),mostCurrent._pnlulv.getWidth(),mostCurrent._pnlulv.getHeight());
 //BA.debugLineNum = 44;BA.debugLine="ulv.Visible = False";
mostCurrent._vvvvvvvvvvv5.setVisible(anywheresoftware.b4a.keywords.Common.False);
 //BA.debugLineNum = 46;BA.debugLine="RowsLabelViews.Initialize";
mostCurrent._vvvvvvvvvvv6.Initialize();
 //BA.debugLineNum = 47;BA.debugLine="progress.Initialize(Activity)";
mostCurrent._vvvvvvvvv7._initialize(mostCurrent.activityBA,mostCurrent._activity);
 //BA.debugLineNum = 49;BA.debugLine="progress.ShowProgress(Library.GetStringResourse(\"";
mostCurrent._vvvvvvvvv7._vvvvvvvvv1(mostCurrent._vvvvvvv6._vvvv2(mostCurrent.activityBA,"downloading"));
 //BA.debugLineNum = 51;BA.debugLine="Dim hu As HttpJob";
_hu = new anywheresoftware.b4a.samples.httputils2.httpjob();
 //BA.debugLineNum = 52;BA.debugLine="hu.Initialize(\"statistics\",Me)";
_hu._initialize(processBA,"statistics",actstatistic.getObject());
 //BA.debugLineNum = 53;BA.debugLine="hu.Download(Library.URL & \"method=statistics\")";
_hu._download(mostCurrent._vvvvvvv6._vv2+"method=statistics");
 //BA.debugLineNum = 55;BA.debugLine="button.Initialize(\"btnclose\")";
mostCurrent._vvvvvvvvvvv7.Initialize(mostCurrent.activityBA,"btnclose");
 //BA.debugLineNum = 56;BA.debugLine="button.Typeface = Typeface.LoadFromAssets(\"icomoo";
mostCurrent._vvvvvvvvvvv7.setTypeface(anywheresoftware.b4a.keywords.Common.Typeface.LoadFromAssets("icomoon.ttf"));
 //BA.debugLineNum = 57;BA.debugLine="button.Text = \"\"";
mostCurrent._vvvvvvvvvvv7.setText(BA.ObjectToCharSequence(""));
 //BA.debugLineNum = 58;BA.debugLine="button.TextColor = Colors.White";
mostCurrent._vvvvvvvvvvv7.setTextColor(anywheresoftware.b4a.keywords.Common.Colors.White);
 //BA.debugLineNum = 59;BA.debugLine="button.Visible = False";
mostCurrent._vvvvvvvvvvv7.setVisible(anywheresoftware.b4a.keywords.Common.False);
 //BA.debugLineNum = 61;BA.debugLine="Dim cd As ColorDrawable";
_cd = new anywheresoftware.b4a.objects.drawable.ColorDrawable();
 //BA.debugLineNum = 62;BA.debugLine="cd.Initialize(Library.ThemeColor,50)";
_cd.Initialize(mostCurrent._vvvvvvv6._vvv3,(int) (50));
 //BA.debugLineNum = 63;BA.debugLine="button.Background = cd";
mostCurrent._vvvvvvvvvvv7.setBackground((android.graphics.drawable.Drawable)(_cd.getObject()));
 //BA.debugLineNum = 65;BA.debugLine="Activity.AddView(button,100%x-60dip,100%y-60dip,5";
mostCurrent._activity.AddView((android.view.View)(mostCurrent._vvvvvvvvvvv7.getObject()),(int) (anywheresoftware.b4a.keywords.Common.PerXToCurrent((float) (100),mostCurrent.activityBA)-anywheresoftware.b4a.keywords.Common.DipToCurrent((int) (60))),(int) (anywheresoftware.b4a.keywords.Common.PerYToCurrent((float) (100),mostCurrent.activityBA)-anywheresoftware.b4a.keywords.Common.DipToCurrent((int) (60))),anywheresoftware.b4a.keywords.Common.DipToCurrent((int) (50)),anywheresoftware.b4a.keywords.Common.DipToCurrent((int) (50)));
 //BA.debugLineNum = 67;BA.debugLine="End Sub";
return "";
}
public static String  _activity_pause(boolean _userclosed) throws Exception{
 //BA.debugLineNum = 73;BA.debugLine="Sub Activity_Pause (UserClosed As Boolean)";
 //BA.debugLineNum = 75;BA.debugLine="End Sub";
return "";
}
public static String  _activity_resume() throws Exception{
 //BA.debugLineNum = 69;BA.debugLine="Sub Activity_Resume";
 //BA.debugLineNum = 71;BA.debugLine="End Sub";
return "";
}
public static String  _btnclose_click() throws Exception{
 //BA.debugLineNum = 171;BA.debugLine="Sub btnClose_Click";
 //BA.debugLineNum = 172;BA.debugLine="Activity.Finish";
mostCurrent._activity.Finish();
 //BA.debugLineNum = 173;BA.debugLine="End Sub";
return "";
}
public static String  _globals() throws Exception{
 //BA.debugLineNum = 10;BA.debugLine="Sub Globals";
 //BA.debugLineNum = 11;BA.debugLine="Private ulv As UltimateListView";
mostCurrent._vvvvvvvvvvv5 = new flm.b4a.ultimatelistview.UltimateListViewWrapper();
 //BA.debugLineNum = 12;BA.debugLine="Private progress As ShowProgress";
mostCurrent._vvvvvvvvv7 = new com.apps.manageropencart.showprogress();
 //BA.debugLineNum = 13;BA.debugLine="Dim button As Button";
mostCurrent._vvvvvvvvvvv7 = new anywheresoftware.b4a.objects.ButtonWrapper();
 //BA.debugLineNum = 14;BA.debugLine="Private RowsLabelViews As Map";
mostCurrent._vvvvvvvvvvv6 = new anywheresoftware.b4a.objects.collections.Map();
 //BA.debugLineNum = 15;BA.debugLine="Dim Reports As List ' collection of data";
mostCurrent._vvvvvvvvvvv0 = new anywheresoftware.b4a.objects.collections.List();
 //BA.debugLineNum = 16;BA.debugLine="Dim lang As String";
mostCurrent._vvvvvvvvvvv4 = "";
 //BA.debugLineNum = 17;BA.debugLine="Private lblcity2 As Label";
mostCurrent._lblcity2 = new anywheresoftware.b4a.objects.LabelWrapper();
 //BA.debugLineNum = 18;BA.debugLine="Private lblregister2 As Label";
mostCurrent._lblregister2 = new anywheresoftware.b4a.objects.LabelWrapper();
 //BA.debugLineNum = 19;BA.debugLine="Private lblip2 As Label";
mostCurrent._lblip2 = new anywheresoftware.b4a.objects.LabelWrapper();
 //BA.debugLineNum = 20;BA.debugLine="Private lblname2 As Label";
mostCurrent._lblname2 = new anywheresoftware.b4a.objects.LabelWrapper();
 //BA.debugLineNum = 21;BA.debugLine="Private lblnumber2 As Label";
mostCurrent._lblnumber2 = new anywheresoftware.b4a.objects.LabelWrapper();
 //BA.debugLineNum = 22;BA.debugLine="Private lblheader1 As Label";
mostCurrent._lblheader1 = new anywheresoftware.b4a.objects.LabelWrapper();
 //BA.debugLineNum = 23;BA.debugLine="Private lblheader2 As Label";
mostCurrent._lblheader2 = new anywheresoftware.b4a.objects.LabelWrapper();
 //BA.debugLineNum = 24;BA.debugLine="Private pnlulv As Panel";
mostCurrent._pnlulv = new anywheresoftware.b4a.objects.PanelWrapper();
 //BA.debugLineNum = 25;BA.debugLine="Private pnlheader As Panel";
mostCurrent._pnlheader = new anywheresoftware.b4a.objects.PanelWrapper();
 //BA.debugLineNum = 26;BA.debugLine="End Sub";
return "";
}
public static String  _items_contentfiller(long _itemid,String _layoutname,anywheresoftware.b4a.objects.PanelWrapper _layoutpanel,int _position) throws Exception{
anywheresoftware.b4a.objects.LabelWrapper _lblnumber = null;
anywheresoftware.b4a.objects.LabelWrapper _lblname = null;
anywheresoftware.b4a.objects.LabelWrapper _lblip = null;
anywheresoftware.b4a.objects.LabelWrapper _lblcity = null;
anywheresoftware.b4a.objects.LabelWrapper _lblregister = null;
anywheresoftware.b4a.objects.ImageViewWrapper _imgsimcard = null;
anywheresoftware.b4a.objects.PanelWrapper _parent = null;
anywheresoftware.b4a.objects.collections.Map _da = null;
String _sim = "";
String _date = "";
String[] _te = null;
String _name = "";
String[] _t = null;
anywheresoftware.b4a.objects.collections.Map _ip_info = null;
 //BA.debugLineNum = 179;BA.debugLine="Sub Items_ContentFiller(ItemID As Long, LayoutName";
 //BA.debugLineNum = 181;BA.debugLine="Dim lblnumber,lblname,lblip,lblcity,lblregister A";
_lblnumber = new anywheresoftware.b4a.objects.LabelWrapper();
_lblname = new anywheresoftware.b4a.objects.LabelWrapper();
_lblip = new anywheresoftware.b4a.objects.LabelWrapper();
_lblcity = new anywheresoftware.b4a.objects.LabelWrapper();
_lblregister = new anywheresoftware.b4a.objects.LabelWrapper();
 //BA.debugLineNum = 182;BA.debugLine="Dim imgsimcard As ImageView";
_imgsimcard = new anywheresoftware.b4a.objects.ImageViewWrapper();
 //BA.debugLineNum = 184;BA.debugLine="Dim parent As Panel";
_parent = new anywheresoftware.b4a.objects.PanelWrapper();
 //BA.debugLineNum = 185;BA.debugLine="parent = LayoutPanel";
_parent = _layoutpanel;
 //BA.debugLineNum = 187;BA.debugLine="lblnumber	= parent.GetView(0)";
_lblnumber.setObject((android.widget.TextView)(_parent.GetView((int) (0)).getObject()));
 //BA.debugLineNum = 188;BA.debugLine="lblname		= parent.GetView(1)";
_lblname.setObject((android.widget.TextView)(_parent.GetView((int) (1)).getObject()));
 //BA.debugLineNum = 189;BA.debugLine="lblip		= parent.GetView(2)";
_lblip.setObject((android.widget.TextView)(_parent.GetView((int) (2)).getObject()));
 //BA.debugLineNum = 190;BA.debugLine="lblregister = parent.GetView(3)";
_lblregister.setObject((android.widget.TextView)(_parent.GetView((int) (3)).getObject()));
 //BA.debugLineNum = 191;BA.debugLine="imgsimcard	= parent.GetView(4)";
_imgsimcard.setObject((android.widget.ImageView)(_parent.GetView((int) (4)).getObject()));
 //BA.debugLineNum = 192;BA.debugLine="lblcity		= parent.GetView(5)";
_lblcity.setObject((android.widget.TextView)(_parent.GetView((int) (5)).getObject()));
 //BA.debugLineNum = 194;BA.debugLine="Dim da As Map";
_da = new anywheresoftware.b4a.objects.collections.Map();
 //BA.debugLineNum = 195;BA.debugLine="da = Reports.Get(Position)";
_da.setObject((anywheresoftware.b4a.objects.collections.Map.MyMap)(mostCurrent._vvvvvvvvvvv0.Get(_position)));
 //BA.debugLineNum = 197;BA.debugLine="Dim sim As String";
_sim = "";
 //BA.debugLineNum = 198;BA.debugLine="Dim date As String";
_date = "";
 //BA.debugLineNum = 200;BA.debugLine="sim = da.Get(\"sSIM\")";
_sim = BA.ObjectToString(_da.Get((Object)("sSIM")));
 //BA.debugLineNum = 201;BA.debugLine="date = da.Get(\"sDateTime\")";
_date = BA.ObjectToString(_da.Get((Object)("sDateTime")));
 //BA.debugLineNum = 203;BA.debugLine="If lang = \"fa\" Then";
if ((mostCurrent._vvvvvvvvvvv4).equals("fa")) { 
 //BA.debugLineNum = 204;BA.debugLine="da.Put(\"sDateTime\",ParseDate(date))";
_da.Put((Object)("sDateTime"),(Object)(_vvvvvvvvvvvv1(_date)));
 }else {
 //BA.debugLineNum = 206;BA.debugLine="Dim te() As String";
_te = new String[(int) (0)];
java.util.Arrays.fill(_te,"");
 //BA.debugLineNum = 207;BA.debugLine="te = Regex.Split(\" \",date)";
_te = anywheresoftware.b4a.keywords.Common.Regex.Split(" ",_date);
 //BA.debugLineNum = 208;BA.debugLine="da.Put(\"sDateTime\",te(0))";
_da.Put((Object)("sDateTime"),(Object)(_te[(int) (0)]));
 };
 //BA.debugLineNum = 211;BA.debugLine="lblnumber.Text = Position + 1";
_lblnumber.setText(BA.ObjectToCharSequence(_position+1));
 //BA.debugLineNum = 213;BA.debugLine="Select sim.ToLowerCase";
switch (BA.switchObjectToInt(_sim.toLowerCase(),"irancell","mtn irancell","ir-tci","rightel")) {
case 0: {
 break; }
case 1: {
 //BA.debugLineNum = 217;BA.debugLine="imgsimcard.SetBackgroundImage(LoadBitmap(File.D";
_imgsimcard.SetBackgroundImage((android.graphics.Bitmap)(anywheresoftware.b4a.keywords.Common.LoadBitmap(anywheresoftware.b4a.keywords.Common.File.getDirAssets(),"irancell.png").getObject()));
 break; }
case 2: {
 //BA.debugLineNum = 220;BA.debugLine="imgsimcard.SetBackgroundImage(LoadBitmap(File.D";
_imgsimcard.SetBackgroundImage((android.graphics.Bitmap)(anywheresoftware.b4a.keywords.Common.LoadBitmap(anywheresoftware.b4a.keywords.Common.File.getDirAssets(),"ir-tci.png").getObject()));
 break; }
case 3: {
 //BA.debugLineNum = 223;BA.debugLine="imgsimcard.SetBackgroundImage(LoadBitmap(File.D";
_imgsimcard.SetBackgroundImage((android.graphics.Bitmap)(anywheresoftware.b4a.keywords.Common.LoadBitmap(anywheresoftware.b4a.keywords.Common.File.getDirAssets(),"rightel.png").getObject()));
 break; }
default: {
 //BA.debugLineNum = 226;BA.debugLine="imgsimcard.SetBackgroundImage(LoadBitmap(File.D";
_imgsimcard.SetBackgroundImage((android.graphics.Bitmap)(anywheresoftware.b4a.keywords.Common.LoadBitmap(anywheresoftware.b4a.keywords.Common.File.getDirAssets(),"simcard.png").getObject()));
 break; }
}
;
 //BA.debugLineNum = 230;BA.debugLine="Dim name As String";
_name = "";
 //BA.debugLineNum = 231;BA.debugLine="name = da.Get(\"sDeviceName\")";
_name = BA.ObjectToString(_da.Get((Object)("sDeviceName")));
 //BA.debugLineNum = 232;BA.debugLine="If name.IndexOf(\" : \") > -1 Then";
if (_name.indexOf(" : ")>-1) { 
 //BA.debugLineNum = 233;BA.debugLine="Dim t() As String";
_t = new String[(int) (0)];
java.util.Arrays.fill(_t,"");
 //BA.debugLineNum = 234;BA.debugLine="t = Regex.Split(\" : \",name)";
_t = anywheresoftware.b4a.keywords.Common.Regex.Split(" : ",_name);
 //BA.debugLineNum = 235;BA.debugLine="name = t(0)";
_name = _t[(int) (0)];
 };
 //BA.debugLineNum = 238;BA.debugLine="lblname.Text	= name & $\" Android ${da.Get(\"sAndro";
_lblname.setText(BA.ObjectToCharSequence(_name+(" Android "+anywheresoftware.b4a.keywords.Common.SmartStringFormatter("",_da.Get((Object)("sAndroidVersion")))+"")));
 //BA.debugLineNum = 239;BA.debugLine="lblip.Text		= da.Get(\"sIP\")";
_lblip.setText(BA.ObjectToCharSequence(_da.Get((Object)("sIP"))));
 //BA.debugLineNum = 240;BA.debugLine="lblregister.Text = da.Get(\"sDateTime\")";
_lblregister.setText(BA.ObjectToCharSequence(_da.Get((Object)("sDateTime"))));
 //BA.debugLineNum = 242;BA.debugLine="Dim ip_info As Map";
_ip_info = new anywheresoftware.b4a.objects.collections.Map();
 //BA.debugLineNum = 243;BA.debugLine="ip_info = Library.Json2Map(da.Get(\"sIPInfo\"))";
_ip_info = mostCurrent._vvvvvvv6._vvvv5(mostCurrent.activityBA,BA.ObjectToString(_da.Get((Object)("sIPInfo"))));
 //BA.debugLineNum = 244;BA.debugLine="lblcity.Text	= ip_info.Get(\"country\") & \":\" & ip_";
_lblcity.setText(BA.ObjectToCharSequence(BA.ObjectToString(_ip_info.Get((Object)("country")))+":"+BA.ObjectToString(_ip_info.Get((Object)("city")))));
 //BA.debugLineNum = 246;BA.debugLine="End Sub";
return "";
}
public static String  _items_layoutcreator(String _layoutname,anywheresoftware.b4a.objects.PanelWrapper _layoutpanel) throws Exception{
 //BA.debugLineNum = 175;BA.debugLine="Sub Items_LayoutCreator(LayoutName As String, Layo";
 //BA.debugLineNum = 176;BA.debugLine="LayoutPanel.LoadLayout(\"frmitem_report\")";
_layoutpanel.LoadLayout("frmitem_report",mostCurrent.activityBA);
 //BA.debugLineNum = 177;BA.debugLine="End Sub";
return "";
}
public static String  _jobdone(anywheresoftware.b4a.samples.httputils2.httpjob _job) throws Exception{
anywheresoftware.b4a.objects.collections.JSONParser _js = null;
anywheresoftware.b4a.objects.collections.Map _ma = null;
 //BA.debugLineNum = 96;BA.debugLine="Sub JobDone(Job As HttpJob)";
 //BA.debugLineNum = 98;BA.debugLine="If Job.Success Then";
if (_job._success) { 
 //BA.debugLineNum = 99;BA.debugLine="If Job.JobName = \"statistics\" Then";
if ((_job._jobname).equals("statistics")) { 
 //BA.debugLineNum = 101;BA.debugLine="Dim js As JSONParser";
_js = new anywheresoftware.b4a.objects.collections.JSONParser();
 //BA.debugLineNum = 102;BA.debugLine="Dim ma As Map";
_ma = new anywheresoftware.b4a.objects.collections.Map();
 //BA.debugLineNum = 104;BA.debugLine="js.Initialize(Job.GetString2(\"UTF8\"))";
_js.Initialize(_job._getstring2("UTF8"));
 //BA.debugLineNum = 105;BA.debugLine="ma = js.NextObject";
_ma = _js.NextObject();
 //BA.debugLineNum = 106;BA.debugLine="Reports = ma.Get(\"data\")";
mostCurrent._vvvvvvvvvvv0.setObject((java.util.List)(_ma.Get((Object)("data"))));
 //BA.debugLineNum = 108;BA.debugLine="ShowHeader";
_vvvvvvvvvvvv2();
 //BA.debugLineNum = 110;BA.debugLine="progress.HideProgress";
mostCurrent._vvvvvvvvv7._vvvvvvvv0();
 //BA.debugLineNum = 111;BA.debugLine="button.Visible = True";
mostCurrent._vvvvvvvvvvv7.setVisible(anywheresoftware.b4a.keywords.Common.True);
 //BA.debugLineNum = 113;BA.debugLine="ulv.AddLayout(\"Items\",\"Items_LayoutCreator\",\"It";
mostCurrent._vvvvvvvvvvv5.AddLayout("Items","Items_LayoutCreator","Items_ContentFiller",anywheresoftware.b4a.keywords.Common.DipToCurrent((int) (40)),anywheresoftware.b4a.keywords.Common.True);
 //BA.debugLineNum = 114;BA.debugLine="ulv.BulkAddItems(Reports.Size,\"Items\",1)";
mostCurrent._vvvvvvvvvvv5.BulkAddItems(mostCurrent._vvvvvvvvvvv0.getSize(),"Items",(int) (1));
 //BA.debugLineNum = 116;BA.debugLine="ulv.Visible = True";
mostCurrent._vvvvvvvvvvv5.setVisible(anywheresoftware.b4a.keywords.Common.True);
 };
 };
 //BA.debugLineNum = 122;BA.debugLine="End Sub";
return "";
}
public static String  _lblitem_click() throws Exception{
anywheresoftware.b4a.objects.LabelWrapper _lb = null;
anywheresoftware.b4a.objects.collections.List _ls = null;
int _i = 0;
anywheresoftware.b4a.objects.LabelWrapper _l2 = null;
anywheresoftware.b4a.objects.collections.Map _res = null;
 //BA.debugLineNum = 149;BA.debugLine="Sub lblitem_Click";
 //BA.debugLineNum = 151;BA.debugLine="Dim lb As Label";
_lb = new anywheresoftware.b4a.objects.LabelWrapper();
 //BA.debugLineNum = 152;BA.debugLine="lb = Sender";
_lb.setObject((android.widget.TextView)(anywheresoftware.b4a.keywords.Common.Sender(mostCurrent.activityBA)));
 //BA.debugLineNum = 154;BA.debugLine="Dim ls As List";
_ls = new anywheresoftware.b4a.objects.collections.List();
 //BA.debugLineNum = 155;BA.debugLine="ls = RowsLabelViews.Get(lb.Tag)";
_ls.setObject((java.util.List)(mostCurrent._vvvvvvvvvvv6.Get(_lb.getTag())));
 //BA.debugLineNum = 157;BA.debugLine="For i = 0 To ls.Size - 1";
{
final int step5 = 1;
final int limit5 = (int) (_ls.getSize()-1);
_i = (int) (0) ;
for (;(step5 > 0 && _i <= limit5) || (step5 < 0 && _i >= limit5) ;_i = ((int)(0 + _i + step5))  ) {
 //BA.debugLineNum = 158;BA.debugLine="Dim l2 As Label";
_l2 = new anywheresoftware.b4a.objects.LabelWrapper();
 //BA.debugLineNum = 159;BA.debugLine="l2 = ls.Get(i)";
_l2.setObject((android.widget.TextView)(_ls.Get(_i)));
 //BA.debugLineNum = 160;BA.debugLine="l2.SetColorAnimated(300,Library.ThemeColor,Color";
_l2.SetColorAnimated((int) (300),mostCurrent._vvvvvvv6._vvv3,anywheresoftware.b4a.keywords.Common.Colors.White);
 }
};
 //BA.debugLineNum = 163;BA.debugLine="Dim res As Map";
_res = new anywheresoftware.b4a.objects.collections.Map();
 //BA.debugLineNum = 164;BA.debugLine="res = Reports.Get(lb.Tag)";
_res.setObject((anywheresoftware.b4a.objects.collections.Map.MyMap)(mostCurrent._vvvvvvvvvvv0.Get((int)(BA.ObjectToNumber(_lb.getTag())))));
 //BA.debugLineNum = 166;BA.debugLine="actDetailsOfReportItem.Data = res";
mostCurrent._vvvvvvv5._v7 = _res;
 //BA.debugLineNum = 167;BA.debugLine="StartActivity(actDetailsOfReportItem)";
anywheresoftware.b4a.keywords.Common.StartActivity(processBA,(Object)(mostCurrent._vvvvvvv5.getObject()));
 //BA.debugLineNum = 169;BA.debugLine="End Sub";
return "";
}
public static String  _vvvvvvvvvvvv1(String _date) throws Exception{
String[] _t = null;
String[] _sa = null;
String[] _da = null;
anywheresoftware.b4a.student.PersianDate _per = null;
 //BA.debugLineNum = 124;BA.debugLine="Sub ParseDate(Date As String) As String";
 //BA.debugLineNum = 126;BA.debugLine="If Date.StartsWith(\"0000-00-00\") Then";
if (_date.startsWith("0000-00-00")) { 
 //BA.debugLineNum = 127;BA.debugLine="If Date.IndexOf(\" \") > -1 Then";
if (_date.indexOf(" ")>-1) { 
 //BA.debugLineNum = 128;BA.debugLine="Dim t() As String";
_t = new String[(int) (0)];
java.util.Arrays.fill(_t,"");
 //BA.debugLineNum = 129;BA.debugLine="t = Regex.Split(\" \",Date)";
_t = anywheresoftware.b4a.keywords.Common.Regex.Split(" ",_date);
 //BA.debugLineNum = 130;BA.debugLine="Return t(0)";
if (true) return _t[(int) (0)];
 }else {
 //BA.debugLineNum = 132;BA.debugLine="Return Date";
if (true) return _date;
 };
 };
 //BA.debugLineNum = 136;BA.debugLine="Dim sa(),da() As String";
_sa = new String[(int) (0)];
java.util.Arrays.fill(_sa,"");
_da = new String[(int) (0)];
java.util.Arrays.fill(_da,"");
 //BA.debugLineNum = 137;BA.debugLine="sa = Regex.Split(\" \",Date)";
_sa = anywheresoftware.b4a.keywords.Common.Regex.Split(" ",_date);
 //BA.debugLineNum = 138;BA.debugLine="da = Regex.Split(\"-\",sa(0))";
_da = anywheresoftware.b4a.keywords.Common.Regex.Split("-",_sa[(int) (0)]);
 //BA.debugLineNum = 140;BA.debugLine="Try";
try { //BA.debugLineNum = 141;BA.debugLine="Dim per As PersianDate";
_per = new anywheresoftware.b4a.student.PersianDate();
 //BA.debugLineNum = 142;BA.debugLine="Return per.getDate(da(0),da(1),da(2),\"/\")";
if (true) return _per.getDate((int)(Double.parseDouble(_da[(int) (0)])),(int)(Double.parseDouble(_da[(int) (1)])),(int)(Double.parseDouble(_da[(int) (2)])),"/");
 } 
       catch (Exception e17) {
			processBA.setLastException(e17); //BA.debugLineNum = 144;BA.debugLine="Return Date";
if (true) return _date;
 };
 //BA.debugLineNum = 147;BA.debugLine="End Sub";
return "";
}
public static String  _process_globals() throws Exception{
 //BA.debugLineNum = 6;BA.debugLine="Sub Process_Globals";
 //BA.debugLineNum = 8;BA.debugLine="End Sub";
return "";
}
public static String  _vvvvvvvvvvvv2() throws Exception{
 //BA.debugLineNum = 77;BA.debugLine="Sub ShowHeader";
 //BA.debugLineNum = 79;BA.debugLine="lblheader1.Text = Library.GetStringResourse(\"stat";
mostCurrent._lblheader1.setText(BA.ObjectToCharSequence(mostCurrent._vvvvvvv6._vvvv2(mostCurrent.activityBA,"statistic_title")+" [ "+BA.NumberToString(mostCurrent._vvvvvvvvvvv0.getSize())+" ]"));
 //BA.debugLineNum = 80;BA.debugLine="lblheader2.Text = Library.GetStringResourse(\"extr";
mostCurrent._lblheader2.setText(BA.ObjectToCharSequence(mostCurrent._vvvvvvv6._vvvv2(mostCurrent.activityBA,"extra")));
 //BA.debugLineNum = 81;BA.debugLine="lblname2.Text = \" \" & Library.GetStringResourse(\"";
mostCurrent._lblname2.setText(BA.ObjectToCharSequence(" "+mostCurrent._vvvvvvv6._vvvv2(mostCurrent.activityBA,"name")));
 //BA.debugLineNum = 82;BA.debugLine="lblregister2.Text = \" \" & Library.GetStringResour";
mostCurrent._lblregister2.setText(BA.ObjectToCharSequence(" "+mostCurrent._vvvvvvv6._vvvv2(mostCurrent.activityBA,"time")));
 //BA.debugLineNum = 83;BA.debugLine="lblip2.Text = \" \" & Library.GetStringResourse(\"ip";
mostCurrent._lblip2.setText(BA.ObjectToCharSequence(" "+mostCurrent._vvvvvvv6._vvvv2(mostCurrent.activityBA,"ip")));
 //BA.debugLineNum = 84;BA.debugLine="lblcity2.Text = \" \" & Library.GetStringResourse(\"";
mostCurrent._lblcity2.setText(BA.ObjectToCharSequence(" "+mostCurrent._vvvvvvv6._vvvv2(mostCurrent.activityBA,"city")));
 //BA.debugLineNum = 86;BA.debugLine="lblcity2.Color = Library.ThemeColor";
mostCurrent._lblcity2.setColor(mostCurrent._vvvvvvv6._vvv3);
 //BA.debugLineNum = 87;BA.debugLine="lblip2.Color = Library.ThemeColor";
mostCurrent._lblip2.setColor(mostCurrent._vvvvvvv6._vvv3);
 //BA.debugLineNum = 88;BA.debugLine="lblregister2.Color = Library.ThemeColor";
mostCurrent._lblregister2.setColor(mostCurrent._vvvvvvv6._vvv3);
 //BA.debugLineNum = 89;BA.debugLine="lblname2.Color = Library.ThemeColor";
mostCurrent._lblname2.setColor(mostCurrent._vvvvvvv6._vvv3);
 //BA.debugLineNum = 90;BA.debugLine="lblheader2.Color = Library.ThemeColor";
mostCurrent._lblheader2.setColor(mostCurrent._vvvvvvv6._vvv3);
 //BA.debugLineNum = 91;BA.debugLine="lblheader1.Color = Library.ThemeColor";
mostCurrent._lblheader1.setColor(mostCurrent._vvvvvvv6._vvv3);
 //BA.debugLineNum = 92;BA.debugLine="lblnumber2.Color = Library.ThemeColor";
mostCurrent._lblnumber2.setColor(mostCurrent._vvvvvvv6._vvv3);
 //BA.debugLineNum = 94;BA.debugLine="End Sub";
return "";
}
public static String  _ulv_itemclick(long _itemid,int _position,anywheresoftware.b4a.objects.PanelWrapper _clickedpanel) throws Exception{
anywheresoftware.b4a.objects.collections.Map _res = null;
 //BA.debugLineNum = 248;BA.debugLine="Sub ULV_ItemClick(ItemID As Long, Position As Int,";
 //BA.debugLineNum = 250;BA.debugLine="ClickedPanel.Visible = False";
_clickedpanel.setVisible(anywheresoftware.b4a.keywords.Common.False);
 //BA.debugLineNum = 251;BA.debugLine="ClickedPanel.SetVisibleAnimated(600,True)";
_clickedpanel.SetVisibleAnimated((int) (600),anywheresoftware.b4a.keywords.Common.True);
 //BA.debugLineNum = 253;BA.debugLine="Dim res As Map";
_res = new anywheresoftware.b4a.objects.collections.Map();
 //BA.debugLineNum = 254;BA.debugLine="res = Reports.Get(Position)";
_res.setObject((anywheresoftware.b4a.objects.collections.Map.MyMap)(mostCurrent._vvvvvvvvvvv0.Get(_position)));
 //BA.debugLineNum = 256;BA.debugLine="actDetailsOfReportItem.Data = res";
mostCurrent._vvvvvvv5._v7 = _res;
 //BA.debugLineNum = 257;BA.debugLine="StartActivity(actDetailsOfReportItem)";
anywheresoftware.b4a.keywords.Common.StartActivity(processBA,(Object)(mostCurrent._vvvvvvv5.getObject()));
 //BA.debugLineNum = 259;BA.debugLine="End Sub";
return "";
}
public static String  _ulv_scrolled(int _firstvisibleitem,int _visibleitemcount,int _totalitemcount,boolean _isattop,boolean _isatbottom) throws Exception{
 //BA.debugLineNum = 261;BA.debugLine="Sub ULV_Scrolled(FirstVisibleItem As Int, VisibleI";
 //BA.debugLineNum = 263;BA.debugLine="If IsAtTop Then";
if (_isattop) { 
 //BA.debugLineNum = 264;BA.debugLine="If pnlheader.Top = -pnlheader.Height	Then";
if (mostCurrent._pnlheader.getTop()==-mostCurrent._pnlheader.getHeight()) { 
 //BA.debugLineNum = 265;BA.debugLine="pnlheader.SetLayoutAnimated(600,0,0,pnlheader.W";
mostCurrent._pnlheader.SetLayoutAnimated((int) (600),(int) (0),(int) (0),mostCurrent._pnlheader.getWidth(),mostCurrent._pnlheader.getHeight());
 //BA.debugLineNum = 266;BA.debugLine="pnlulv.SetLayoutAnimated(600,0,pnlheader.Height";
mostCurrent._pnlulv.SetLayoutAnimated((int) (600),(int) (0),mostCurrent._pnlheader.getHeight(),mostCurrent._pnlulv.getWidth(),(int) (anywheresoftware.b4a.keywords.Common.PerYToCurrent((float) (100),mostCurrent.activityBA)-mostCurrent._pnlheader.getHeight()));
 //BA.debugLineNum = 267;BA.debugLine="ulv.Height = 100%y - pnlheader.Height";
mostCurrent._vvvvvvvvvvv5.setHeight((int) (anywheresoftware.b4a.keywords.Common.PerYToCurrent((float) (100),mostCurrent.activityBA)-mostCurrent._pnlheader.getHeight()));
 };
 //BA.debugLineNum = 269;BA.debugLine="Return";
if (true) return "";
 };
 //BA.debugLineNum = 272;BA.debugLine="If VisibleItemCount > 6 And TotalItemCount > 10 T";
if (_visibleitemcount>6 && _totalitemcount>10) { 
 //BA.debugLineNum = 273;BA.debugLine="If pnlheader.Top <> -pnlheader.Height	Then";
if (mostCurrent._pnlheader.getTop()!=-mostCurrent._pnlheader.getHeight()) { 
 //BA.debugLineNum = 274;BA.debugLine="pnlheader.SetLayoutAnimated(600,0,-pnlheader.He";
mostCurrent._pnlheader.SetLayoutAnimated((int) (600),(int) (0),(int) (-mostCurrent._pnlheader.getHeight()),mostCurrent._pnlheader.getWidth(),mostCurrent._pnlheader.getHeight());
 //BA.debugLineNum = 275;BA.debugLine="pnlulv.SetLayoutAnimated(600,0,0,pnlulv.Width,1";
mostCurrent._pnlulv.SetLayoutAnimated((int) (600),(int) (0),(int) (0),mostCurrent._pnlulv.getWidth(),anywheresoftware.b4a.keywords.Common.PerYToCurrent((float) (100),mostCurrent.activityBA));
 //BA.debugLineNum = 276;BA.debugLine="ulv.Height = 100%y";
mostCurrent._vvvvvvvvvvv5.setHeight(anywheresoftware.b4a.keywords.Common.PerYToCurrent((float) (100),mostCurrent.activityBA));
 };
 };
 //BA.debugLineNum = 280;BA.debugLine="End Sub";
return "";
}
}
