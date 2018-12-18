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

public class actmenu extends Activity implements B4AActivity{
	public static actmenu mostCurrent;
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
			processBA = new BA(this.getApplicationContext(), null, null, "com.apps.manageropencart", "com.apps.manageropencart.actmenu");
			processBA.loadHtSubs(this.getClass());
	        float deviceScale = getApplicationContext().getResources().getDisplayMetrics().density;
	        BALayout.setDeviceScale(deviceScale);
            
		}
		else if (previousOne != null) {
			Activity p = previousOne.get();
			if (p != null && p != this) {
                BA.LogInfo("Killing previous instance (actmenu).");
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
		activityBA = new BA(this, layout, processBA, "com.apps.manageropencart", "com.apps.manageropencart.actmenu");
        
        processBA.sharedProcessBA.activityBA = new java.lang.ref.WeakReference<BA>(activityBA);
        anywheresoftware.b4a.objects.ViewWrapper.lastId = 0;
        _activity = new ActivityWrapper(activityBA, "activity");
        anywheresoftware.b4a.Msgbox.isDismissing = false;
        if (BA.isShellModeRuntimeCheck(processBA)) {
			if (isFirst)
				processBA.raiseEvent2(null, true, "SHELL", false);
			processBA.raiseEvent2(null, true, "CREATE", true, "com.apps.manageropencart.actmenu", processBA, activityBA, _activity, anywheresoftware.b4a.keywords.Common.Density, mostCurrent);
			_activity.reinitializeForShell(activityBA, "activity");
		}
        initializeProcessGlobals();		
        initializeGlobals();
        
        BA.LogInfo("** Activity (actmenu) Create, isFirst = " + isFirst + " **");
        processBA.raiseEvent2(null, true, "activity_create", false, isFirst);
		isFirst = false;
		if (this != mostCurrent)
			return;
        processBA.setActivityPaused(false);
        BA.LogInfo("** Activity (actmenu) Resume **");
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
		return actmenu.class;
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
        BA.LogInfo("** Activity (actmenu) Pause, UserClosed = " + activityBA.activity.isFinishing() + " **");
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
            BA.LogInfo("** Activity (actmenu) Resume **");
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
public anywheresoftware.b4a.objects.ScrollViewWrapper _sv1 = null;
public anywheresoftware.b4a.objects.PanelWrapper _pnlover = null;
public static int _vvvvvvvvvvvv4 = 0;
public anywheresoftware.b4a.objects.LabelWrapper _lbltitle1 = null;
public anywheresoftware.b4a.objects.LabelWrapper _lbltitle2 = null;
public anywheresoftware.b4a.objects.LabelWrapper _lblversion = null;
public anywheresoftware.b4a.objects.PanelWrapper _pnlabout = null;
public com.apps.manageropencart.mytoastmessageshow _vvvvvvvvv0 = null;
public com.apps.manageropencart.showprogress _vvvvvvvvv7 = null;
public anywheresoftware.b4a.objects.LabelWrapper _lblicon = null;
public anywheresoftware.b4a.objects.LabelWrapper _lblabout_title = null;
public anywheresoftware.b4a.objects.LabelWrapper _lblabout_subtitle = null;
public anywheresoftware.b4a.objects.LabelWrapper _lblheader1 = null;
public anywheresoftware.b4a.objects.LabelWrapper _lblheader2 = null;
public anywheresoftware.b4a.objects.PanelWrapper _pnlheader = null;
public anywheresoftware.b4a.objects.LabelWrapper _lblicomoon = null;
public anywheresoftware.b4a.objects.PanelWrapper _pnlversion = null;
public com.apps.manageropencart.opencart _vvvvvvvvvvvv3 = null;
public anywheresoftware.b4a.samples.httputils2.httputils2service _vvvvvv0 = null;
public com.apps.manageropencart.main _vvvvvvv1 = null;
public com.apps.manageropencart.actlogin _vvvvvvv2 = null;
public com.apps.manageropencart.updater _vvvvvvv3 = null;
public com.apps.manageropencart.actsendpush _vvvvvvv4 = null;
public com.apps.manageropencart.actdetailsofreportitem _vvvvvvv5 = null;
public com.apps.manageropencart.library _vvvvvvv6 = null;
public com.apps.manageropencart.actfeaturemodule _vvvvvvv7 = null;
public com.apps.manageropencart.actbanners _vvvvvvv0 = null;
public com.apps.manageropencart.actstatistic _vvvvvvvv1 = null;
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
wrap.Wrap _status = null;
 //BA.debugLineNum = 31;BA.debugLine="Sub Activity_Create(FirstTime As Boolean)";
 //BA.debugLineNum = 33;BA.debugLine="Activity.LoadLayout(\"frmmeny\")";
mostCurrent._activity.LoadLayout("frmmeny",mostCurrent.activityBA);
 //BA.debugLineNum = 35;BA.debugLine="pnlheader.Color = Library.ThemeColor";
mostCurrent._pnlheader.setColor(mostCurrent._vvvvvvv6._vvv3);
 //BA.debugLineNum = 36;BA.debugLine="lblabout_title.Color = Library.ThemeColor";
mostCurrent._lblabout_title.setColor(mostCurrent._vvvvvvv6._vvv3);
 //BA.debugLineNum = 38;BA.debugLine="Dim cd As ColorDrawable";
_cd = new anywheresoftware.b4a.objects.drawable.ColorDrawable();
 //BA.debugLineNum = 39;BA.debugLine="cd.Initialize(Colors.White,25)";
_cd.Initialize(anywheresoftware.b4a.keywords.Common.Colors.White,(int) (25));
 //BA.debugLineNum = 40;BA.debugLine="pnlversion.Background = cd";
mostCurrent._pnlversion.setBackground((android.graphics.drawable.Drawable)(_cd.getObject()));
 //BA.debugLineNum = 41;BA.debugLine="lblversion.TextColor = Colors.Black";
mostCurrent._lblversion.setTextColor(anywheresoftware.b4a.keywords.Common.Colors.Black);
 //BA.debugLineNum = 43;BA.debugLine="Library.setLocalApp";
mostCurrent._vvvvvvv6._vvvv0(mostCurrent.activityBA);
 //BA.debugLineNum = 45;BA.debugLine="Dim status As StatusBarCompat";
_status = new wrap.Wrap();
 //BA.debugLineNum = 46;BA.debugLine="status.Initialize";
_status.Initialize(mostCurrent.activityBA);
 //BA.debugLineNum = 47;BA.debugLine="status.StatusBarColor = Library.ThemeColor";
_status.setStatusBarColor(mostCurrent._vvvvvvv6._vvv3);
 //BA.debugLineNum = 49;BA.debugLine="lblversion.Tag = Library.GetStringResourse(\"curre";
mostCurrent._lblversion.setTag((Object)(mostCurrent._vvvvvvv6._vvvv2(mostCurrent.activityBA,"current_version")));
 //BA.debugLineNum = 50;BA.debugLine="lblabout_subtitle.Text = Library.GetStringResours";
mostCurrent._lblabout_subtitle.setText(BA.ObjectToCharSequence(mostCurrent._vvvvvvv6._vvvv2(mostCurrent.activityBA,"about").replace("\\n",anywheresoftware.b4a.keywords.Common.CRLF)));
 //BA.debugLineNum = 51;BA.debugLine="lblabout_title.Text = Library.GetStringResourse(\"";
mostCurrent._lblabout_title.setText(BA.ObjectToCharSequence(mostCurrent._vvvvvvv6._vvvv2(mostCurrent.activityBA,"about_title")));
 //BA.debugLineNum = 52;BA.debugLine="lblabout_subtitle.Gravity = Library.GetStringReso";
mostCurrent._lblabout_subtitle.setGravity((int)(Double.parseDouble(mostCurrent._vvvvvvv6._vvvv2(mostCurrent.activityBA,"direction"))));
 //BA.debugLineNum = 54;BA.debugLine="lblheader1.Text = Library.GetStringResourse(\"head";
mostCurrent._lblheader1.setText(BA.ObjectToCharSequence(mostCurrent._vvvvvvv6._vvvv2(mostCurrent.activityBA,"header1").replace("0",mostCurrent._vvvvvvv6._vvv4)));
 //BA.debugLineNum = 55;BA.debugLine="lblheader2.Text = Library.GetStringResourse(\"head";
mostCurrent._lblheader2.setText(BA.ObjectToCharSequence(mostCurrent._vvvvvvv6._vvvv2(mostCurrent.activityBA,"header2")));
 //BA.debugLineNum = 57;BA.debugLine="toast.Initialize(Activity)";
mostCurrent._vvvvvvvvv0._initialize(mostCurrent.activityBA,(anywheresoftware.b4a.objects.PanelWrapper) anywheresoftware.b4a.AbsObjectWrapper.ConvertToWrapper(new anywheresoftware.b4a.objects.PanelWrapper(), (android.view.ViewGroup)(mostCurrent._activity.getObject())));
 //BA.debugLineNum = 58;BA.debugLine="Progress.Initialize(Activity)";
mostCurrent._vvvvvvvvv7._initialize(mostCurrent.activityBA,mostCurrent._activity);
 //BA.debugLineNum = 60;BA.debugLine="Progress.ShowProgress(Library.GetStringResourse(\"";
mostCurrent._vvvvvvvvv7._vvvvvvvvv1(mostCurrent._vvvvvvv6._vvvv2(mostCurrent.activityBA,"prepare"));
 //BA.debugLineNum = 62;BA.debugLine="Opencart.Initialize";
mostCurrent._vvvvvvvvvvvv3._initialize(processBA);
 //BA.debugLineNum = 63;BA.debugLine="Opencart.GetToken(Me,\"Token_Receive\")";
mostCurrent._vvvvvvvvvvvv3._vvvvvv4(actmenu.getObject(),"Token_Receive");
 //BA.debugLineNum = 65;BA.debugLine="End Sub";
return "";
}
public static String  _activity_pause(boolean _userclosed) throws Exception{
 //BA.debugLineNum = 113;BA.debugLine="Sub Activity_Pause (UserClosed As Boolean)";
 //BA.debugLineNum = 115;BA.debugLine="End Sub";
return "";
}
public static String  _activity_resume() throws Exception{
String _rs = "";
 //BA.debugLineNum = 77;BA.debugLine="Sub Activity_Resume";
 //BA.debugLineNum = 79;BA.debugLine="Library.setLocalApp";
mostCurrent._vvvvvvv6._vvvv0(mostCurrent.activityBA);
 //BA.debugLineNum = 81;BA.debugLine="Dim rs As String";
_rs = "";
 //BA.debugLineNum = 82;BA.debugLine="rs = lblversion.Tag";
_rs = BA.ObjectToString(mostCurrent._lblversion.getTag());
 //BA.debugLineNum = 83;BA.debugLine="lblversion.Text = rs.Replace(\"0\",Library.ShopAppV";
mostCurrent._lblversion.setText(BA.ObjectToCharSequence(_rs.replace("0",mostCurrent._vvvvvvv6._vv1)));
 //BA.debugLineNum = 85;BA.debugLine="sv1.Panel.RemoveAllViews";
mostCurrent._sv1.getPanel().RemoveAllViews();
 //BA.debugLineNum = 86;BA.debugLine="top = 0";
_vvvvvvvvvvvv4 = (int) (0);
 //BA.debugLineNum = 88;BA.debugLine="AddItem(Library.GetStringResourse(\"menu_push_titl";
_vvvvvvvvvvvv5(mostCurrent._vvvvvvv6._vvvv2(mostCurrent.activityBA,"menu_push_title")+" [ "+BA.ObjectToString(mostCurrent._vvvvvvv6._vvv1.Get((Object)("push_count")))+" ]",mostCurrent._vvvvvvv6._vvvv2(mostCurrent.activityBA,"menu_push_subtitle"),"1","");
 //BA.debugLineNum = 89;BA.debugLine="AddItem(Library.GetStringResourse(\"menu_statistic";
_vvvvvvvvvvvv5(mostCurrent._vvvvvvv6._vvvv2(mostCurrent.activityBA,"menu_statistic_title"),mostCurrent._vvvvvvv6._vvvv2(mostCurrent.activityBA,"menu_statistic_subtitle"),"2","");
 //BA.debugLineNum = 90;BA.debugLine="AddItem(Library.GetStringResourse(\"menu_banner_ti";
_vvvvvvvvvvvv5(mostCurrent._vvvvvvv6._vvvv2(mostCurrent.activityBA,"menu_banner_title"),mostCurrent._vvvvvvv6._vvvv2(mostCurrent.activityBA,"menu_banner_subtitle"),BA.NumberToString(8),"");
 //BA.debugLineNum = 91;BA.debugLine="AddItem(Library.GetStringResourse(\"menu_menu_titl";
_vvvvvvvvvvvv5(mostCurrent._vvvvvvv6._vvvv2(mostCurrent.activityBA,"menu_menu_title"),mostCurrent._vvvvvvv6._vvvv2(mostCurrent.activityBA,"menu_menu_subtitle"),BA.NumberToString(9),"");
 //BA.debugLineNum = 92;BA.debugLine="AddItem(Library.GetStringResourse(\"menu_feature_t";
_vvvvvvvvvvvv5(mostCurrent._vvvvvvv6._vvvv2(mostCurrent.activityBA,"menu_feature_title"),mostCurrent._vvvvvvv6._vvvv2(mostCurrent.activityBA,"menu_feature_subtitle"),BA.NumberToString(10),"");
 //BA.debugLineNum = 94;BA.debugLine="If Library.IsActiveShop Then";
if (mostCurrent._vvvvvvv6._vv4) { 
 //BA.debugLineNum = 95;BA.debugLine="AddItem(Library.GetStringResourse(\"menu_activesh";
_vvvvvvvvvvvv5(mostCurrent._vvvvvvv6._vvvv2(mostCurrent.activityBA,"menu_activeshop_title"),mostCurrent._vvvvvvv6._vvvv2(mostCurrent.activityBA,"menu_activeshop_subtitle"),"7","");
 }else {
 //BA.debugLineNum = 97;BA.debugLine="AddItem(Library.GetStringResourse(\"menu_disactiv";
_vvvvvvvvvvvv5(mostCurrent._vvvvvvv6._vvvv2(mostCurrent.activityBA,"menu_disactiveshop_title"),mostCurrent._vvvvvvv6._vvvv2(mostCurrent.activityBA,"menu_disactiveshop_subtitle"),"7","");
 };
 //BA.debugLineNum = 100;BA.debugLine="If Library.IsHttps = False Then";
if (mostCurrent._vvvvvvv6._vv5==anywheresoftware.b4a.keywords.Common.False) { 
 //BA.debugLineNum = 101;BA.debugLine="AddItem(Library.GetStringResourse(\"menu_https_ti";
_vvvvvvvvvvvv5(mostCurrent._vvvvvvv6._vvvv2(mostCurrent.activityBA,"menu_https_title"),mostCurrent._vvvvvvv6._vvvv2(mostCurrent.activityBA,"menu_https_subtitle"),"https","");
 }else {
 //BA.debugLineNum = 103;BA.debugLine="AddItem(Library.GetStringResourse(\"menu_nohttps_";
_vvvvvvvvvvvv5(mostCurrent._vvvvvvv6._vvvv2(mostCurrent.activityBA,"menu_nohttps_title"),mostCurrent._vvvvvvv6._vvvv2(mostCurrent.activityBA,"menu_nohttps_subtitle"),"https","");
 };
 //BA.debugLineNum = 106;BA.debugLine="AddItem(Library.GetStringResourse(\"menu_password_";
_vvvvvvvvvvvv5(mostCurrent._vvvvvvv6._vvvv2(mostCurrent.activityBA,"menu_password_title"),mostCurrent._vvvvvvv6._vvvv2(mostCurrent.activityBA,"menu_password_subtitle"),"4","");
 //BA.debugLineNum = 107;BA.debugLine="AddItem(Library.GetStringResourse(\"menu_download_";
_vvvvvvvvvvvv5(mostCurrent._vvvvvvv6._vvvv2(mostCurrent.activityBA,"menu_download_title"),mostCurrent._vvvvvvv6._vvvv2(mostCurrent.activityBA,"menu_download_subtitle"),"3","");
 //BA.debugLineNum = 108;BA.debugLine="AddItem(Library.GetStringResourse(\"menu_about_tit";
_vvvvvvvvvvvv5(mostCurrent._vvvvvvv6._vvvv2(mostCurrent.activityBA,"menu_about_title"),mostCurrent._vvvvvvv6._vvvv2(mostCurrent.activityBA,"menu_about_subtitle"),"6","");
 //BA.debugLineNum = 109;BA.debugLine="AddItem(Library.GetStringResourse(\"menu_exit_titl";
_vvvvvvvvvvvv5(mostCurrent._vvvvvvv6._vvvv2(mostCurrent.activityBA,"menu_exit_title"),mostCurrent._vvvvvvv6._vvvv2(mostCurrent.activityBA,"menu_exit_subtitle"),"5","");
 //BA.debugLineNum = 111;BA.debugLine="End Sub";
return "";
}
public static String  _vvvvvvvvvvvv5(String _title,String _subtitle,String _id,String _icon) throws Exception{
anywheresoftware.b4a.objects.PanelWrapper _p = null;
 //BA.debugLineNum = 117;BA.debugLine="Sub AddItem(Title As String,SubTitle As String,ID";
 //BA.debugLineNum = 119;BA.debugLine="Dim p As Panel";
_p = new anywheresoftware.b4a.objects.PanelWrapper();
 //BA.debugLineNum = 120;BA.debugLine="p.Initialize(\"\")";
_p.Initialize(mostCurrent.activityBA,"");
 //BA.debugLineNum = 121;BA.debugLine="sv1.Panel.AddView(p,0,top,100%x,0)";
mostCurrent._sv1.getPanel().AddView((android.view.View)(_p.getObject()),(int) (0),_vvvvvvvvvvvv4,anywheresoftware.b4a.keywords.Common.PerXToCurrent((float) (100),mostCurrent.activityBA),(int) (0));
 //BA.debugLineNum = 123;BA.debugLine="If File.ReadString(File.DirInternal,Library.Langu";
if ((anywheresoftware.b4a.keywords.Common.File.ReadString(anywheresoftware.b4a.keywords.Common.File.getDirInternal(),mostCurrent._vvvvvvv6._vv7)).equals("fa")) { 
 //BA.debugLineNum = 124;BA.debugLine="p.LoadLayout(\"frmitem\")";
_p.LoadLayout("frmitem",mostCurrent.activityBA);
 }else {
 //BA.debugLineNum = 126;BA.debugLine="p.LoadLayout(\"frmitem_en\")";
_p.LoadLayout("frmitem_en",mostCurrent.activityBA);
 };
 //BA.debugLineNum = 129;BA.debugLine="lblicomoon.TextColor = Library.ThemeColor";
mostCurrent._lblicomoon.setTextColor(mostCurrent._vvvvvvv6._vvv3);
 //BA.debugLineNum = 130;BA.debugLine="lblicon.TextColor = Library.ThemeColor";
mostCurrent._lblicon.setTextColor(mostCurrent._vvvvvvv6._vvv3);
 //BA.debugLineNum = 132;BA.debugLine="p.Height = pnlover.Height+1dip";
_p.setHeight((int) (mostCurrent._pnlover.getHeight()+anywheresoftware.b4a.keywords.Common.DipToCurrent((int) (1))));
 //BA.debugLineNum = 133;BA.debugLine="top = top + p.Height";
_vvvvvvvvvvvv4 = (int) (_vvvvvvvvvvvv4+_p.getHeight());
 //BA.debugLineNum = 135;BA.debugLine="lbltitle1.Text = Title";
mostCurrent._lbltitle1.setText(BA.ObjectToCharSequence(_title));
 //BA.debugLineNum = 136;BA.debugLine="lbltitle2.Text = SubTitle";
mostCurrent._lbltitle2.setText(BA.ObjectToCharSequence(_subtitle));
 //BA.debugLineNum = 137;BA.debugLine="pnlover.Tag = ID";
mostCurrent._pnlover.setTag((Object)(_id));
 //BA.debugLineNum = 138;BA.debugLine="lblicon.Text = Icon";
mostCurrent._lblicon.setText(BA.ObjectToCharSequence(_icon));
 //BA.debugLineNum = 140;BA.debugLine="sv1.Panel.Height = top";
mostCurrent._sv1.getPanel().setHeight(_vvvvvvvvvvvv4);
 //BA.debugLineNum = 142;BA.debugLine="p.Left = -p.Width";
_p.setLeft((int) (-_p.getWidth()));
 //BA.debugLineNum = 143;BA.debugLine="p.SetLayoutAnimated(1000,0,p.Top,p.Width,p.Height";
_p.SetLayoutAnimated((int) (1000),(int) (0),_p.getTop(),_p.getWidth(),_p.getHeight());
 //BA.debugLineNum = 144;BA.debugLine="DoEvents";
anywheresoftware.b4a.keywords.Common.DoEvents();
 //BA.debugLineNum = 146;BA.debugLine="End Sub";
return "";
}
public static String  _globals() throws Exception{
 //BA.debugLineNum = 10;BA.debugLine="Sub Globals";
 //BA.debugLineNum = 11;BA.debugLine="Private sv1 As ScrollView";
mostCurrent._sv1 = new anywheresoftware.b4a.objects.ScrollViewWrapper();
 //BA.debugLineNum = 12;BA.debugLine="Private pnlover As Panel";
mostCurrent._pnlover = new anywheresoftware.b4a.objects.PanelWrapper();
 //BA.debugLineNum = 13;BA.debugLine="Private top As Int";
_vvvvvvvvvvvv4 = 0;
 //BA.debugLineNum = 14;BA.debugLine="Private lbltitle1 As Label";
mostCurrent._lbltitle1 = new anywheresoftware.b4a.objects.LabelWrapper();
 //BA.debugLineNum = 15;BA.debugLine="Private lbltitle2 As Label";
mostCurrent._lbltitle2 = new anywheresoftware.b4a.objects.LabelWrapper();
 //BA.debugLineNum = 16;BA.debugLine="Private lblversion As Label";
mostCurrent._lblversion = new anywheresoftware.b4a.objects.LabelWrapper();
 //BA.debugLineNum = 17;BA.debugLine="Private pnlabout As Panel";
mostCurrent._pnlabout = new anywheresoftware.b4a.objects.PanelWrapper();
 //BA.debugLineNum = 18;BA.debugLine="Private toast As MyToastMessageShow";
mostCurrent._vvvvvvvvv0 = new com.apps.manageropencart.mytoastmessageshow();
 //BA.debugLineNum = 19;BA.debugLine="Private Progress As ShowProgress";
mostCurrent._vvvvvvvvv7 = new com.apps.manageropencart.showprogress();
 //BA.debugLineNum = 20;BA.debugLine="Private lblicon As Label";
mostCurrent._lblicon = new anywheresoftware.b4a.objects.LabelWrapper();
 //BA.debugLineNum = 21;BA.debugLine="Private lblabout_title As Label";
mostCurrent._lblabout_title = new anywheresoftware.b4a.objects.LabelWrapper();
 //BA.debugLineNum = 22;BA.debugLine="Private lblabout_subtitle As Label";
mostCurrent._lblabout_subtitle = new anywheresoftware.b4a.objects.LabelWrapper();
 //BA.debugLineNum = 23;BA.debugLine="Private lblheader1 As Label";
mostCurrent._lblheader1 = new anywheresoftware.b4a.objects.LabelWrapper();
 //BA.debugLineNum = 24;BA.debugLine="Private lblheader2 As Label";
mostCurrent._lblheader2 = new anywheresoftware.b4a.objects.LabelWrapper();
 //BA.debugLineNum = 25;BA.debugLine="Private pnlheader As Panel";
mostCurrent._pnlheader = new anywheresoftware.b4a.objects.PanelWrapper();
 //BA.debugLineNum = 26;BA.debugLine="Private lblicomoon As Label";
mostCurrent._lblicomoon = new anywheresoftware.b4a.objects.LabelWrapper();
 //BA.debugLineNum = 27;BA.debugLine="Private pnlversion As Panel";
mostCurrent._pnlversion = new anywheresoftware.b4a.objects.PanelWrapper();
 //BA.debugLineNum = 28;BA.debugLine="Private Opencart As OpenCart";
mostCurrent._vvvvvvvvvvvv3 = new com.apps.manageropencart.opencart();
 //BA.debugLineNum = 29;BA.debugLine="End Sub";
return "";
}
public static String  _jobdone(anywheresoftware.b4a.samples.httputils2.httpjob _job) throws Exception{
anywheresoftware.b4a.objects.streams.File.OutputStreamWrapper _ou = null;
anywheresoftware.b4a.objects.collections.Map _data = null;
 //BA.debugLineNum = 236;BA.debugLine="Sub JobDone(Job As HttpJob)";
 //BA.debugLineNum = 238;BA.debugLine="Progress.HideProgress";
mostCurrent._vvvvvvvvv7._vvvvvvvv0();
 //BA.debugLineNum = 240;BA.debugLine="If Job.Success Then";
if (_job._success) { 
 //BA.debugLineNum = 242;BA.debugLine="If Job.JobName = \"download\" Then";
if ((_job._jobname).equals("download")) { 
 //BA.debugLineNum = 243;BA.debugLine="Dim ou As OutputStream";
_ou = new anywheresoftware.b4a.objects.streams.File.OutputStreamWrapper();
 //BA.debugLineNum = 244;BA.debugLine="ou = File.OpenOutput(File.DirRootExternal,\"app.";
_ou = anywheresoftware.b4a.keywords.Common.File.OpenOutput(anywheresoftware.b4a.keywords.Common.File.getDirRootExternal(),"app.apk",anywheresoftware.b4a.keywords.Common.False);
 //BA.debugLineNum = 245;BA.debugLine="File.Copy2(Job.GetInputStream,ou)";
anywheresoftware.b4a.keywords.Common.File.Copy2((java.io.InputStream)(_job._getinputstream().getObject()),(java.io.OutputStream)(_ou.getObject()));
 //BA.debugLineNum = 246;BA.debugLine="ou.Close";
_ou.Close();
 //BA.debugLineNum = 247;BA.debugLine="Library.InstallApp(File.DirRootExternal,\"app.ap";
mostCurrent._vvvvvvv6._vvvv3(mostCurrent.activityBA,anywheresoftware.b4a.keywords.Common.File.getDirRootExternal(),"app.apk");
 }else if((_job._jobname).equals("change_state")) { 
 //BA.debugLineNum = 250;BA.debugLine="Dim data As Map";
_data = new anywheresoftware.b4a.objects.collections.Map();
 //BA.debugLineNum = 251;BA.debugLine="data = Library.Json2Map(Job.GetString)";
_data = mostCurrent._vvvvvvv6._vvvv5(mostCurrent.activityBA,_job._getstring());
 //BA.debugLineNum = 253;BA.debugLine="If data.Get(\"state\") = False Then";
if ((_data.Get((Object)("state"))).equals((Object)(anywheresoftware.b4a.keywords.Common.False))) { 
 //BA.debugLineNum = 254;BA.debugLine="Library.IsActiveShop = False";
mostCurrent._vvvvvvv6._vv4 = anywheresoftware.b4a.keywords.Common.False;
 //BA.debugLineNum = 255;BA.debugLine="Activity_Resume";
_activity_resume();
 //BA.debugLineNum = 256;BA.debugLine="toast.ShowToastMessageShow(Library.GetStringRe";
mostCurrent._vvvvvvvvv0._vvvvvvvvv3(mostCurrent._vvvvvvv6._vvvv2(mostCurrent.activityBA,"shop_is_disactive"),(long) (2),anywheresoftware.b4a.keywords.Common.True);
 }else if((_data.Get((Object)("state"))).equals((Object)(anywheresoftware.b4a.keywords.Common.True))) { 
 //BA.debugLineNum = 259;BA.debugLine="Library.IsActiveShop = True";
mostCurrent._vvvvvvv6._vv4 = anywheresoftware.b4a.keywords.Common.True;
 //BA.debugLineNum = 260;BA.debugLine="Activity_Resume";
_activity_resume();
 //BA.debugLineNum = 261;BA.debugLine="toast.ShowToastMessageShow(Library.GetStringRe";
mostCurrent._vvvvvvvvv0._vvvvvvvvv3(mostCurrent._vvvvvvv6._vvvv2(mostCurrent.activityBA,"shop_is_active"),(long) (2),anywheresoftware.b4a.keywords.Common.True);
 };
 }else if((_job._jobname).equals("change_state_https")) { 
 //BA.debugLineNum = 266;BA.debugLine="Dim data As Map";
_data = new anywheresoftware.b4a.objects.collections.Map();
 //BA.debugLineNum = 267;BA.debugLine="data = Library.Json2Map(Job.GetString)";
_data = mostCurrent._vvvvvvv6._vvvv5(mostCurrent.activityBA,_job._getstring());
 //BA.debugLineNum = 269;BA.debugLine="If data.Get(\"https\") = False Then";
if ((_data.Get((Object)("https"))).equals((Object)(anywheresoftware.b4a.keywords.Common.False))) { 
 //BA.debugLineNum = 270;BA.debugLine="Library.IsHttps = False";
mostCurrent._vvvvvvv6._vv5 = anywheresoftware.b4a.keywords.Common.False;
 //BA.debugLineNum = 271;BA.debugLine="Activity_Resume";
_activity_resume();
 //BA.debugLineNum = 272;BA.debugLine="toast.ShowToastMessageShow(Library.GetStringRe";
mostCurrent._vvvvvvvvv0._vvvvvvvvv3(mostCurrent._vvvvvvv6._vvvv2(mostCurrent.activityBA,"shop_is_http"),(long) (2),anywheresoftware.b4a.keywords.Common.True);
 }else if((_data.Get((Object)("https"))).equals((Object)(anywheresoftware.b4a.keywords.Common.True))) { 
 //BA.debugLineNum = 275;BA.debugLine="Library.IsActiveShop = True";
mostCurrent._vvvvvvv6._vv4 = anywheresoftware.b4a.keywords.Common.True;
 //BA.debugLineNum = 276;BA.debugLine="Activity_Resume";
_activity_resume();
 //BA.debugLineNum = 277;BA.debugLine="toast.ShowToastMessageShow(Library.GetStringRe";
mostCurrent._vvvvvvvvv0._vvvvvvvvv3(mostCurrent._vvvvvvv6._vvvv2(mostCurrent.activityBA,"shop_is_https"),(long) (2),anywheresoftware.b4a.keywords.Common.True);
 };
 };
 };
 //BA.debugLineNum = 284;BA.debugLine="End Sub";
return "";
}
public static String  _lblexitabout_click() throws Exception{
 //BA.debugLineNum = 232;BA.debugLine="Sub lblexitabout_Click";
 //BA.debugLineNum = 233;BA.debugLine="pnlabout.SetLayoutAnimated(1100,pnlabout.Left,pnl";
mostCurrent._pnlabout.SetLayoutAnimated((int) (1100),mostCurrent._pnlabout.getLeft(),(int) (mostCurrent._pnlabout.getTop()+mostCurrent._pnlabout.getHeight()),mostCurrent._pnlabout.getWidth(),mostCurrent._pnlabout.getHeight());
 //BA.debugLineNum = 234;BA.debugLine="End Sub";
return "";
}
public static String  _pnlover_click() throws Exception{
anywheresoftware.b4a.objects.PanelWrapper _pn = null;
String _id = "";
anywheresoftware.b4a.samples.httputils2.httpjob _hu = null;
anywheresoftware.b4a.samples.httputils2.httpjob _jo = null;
 //BA.debugLineNum = 148;BA.debugLine="Sub pnlover_Click";
 //BA.debugLineNum = 150;BA.debugLine="Dim pn As Panel";
_pn = new anywheresoftware.b4a.objects.PanelWrapper();
 //BA.debugLineNum = 151;BA.debugLine="pn = Sender";
_pn.setObject((android.view.ViewGroup)(anywheresoftware.b4a.keywords.Common.Sender(mostCurrent.activityBA)));
 //BA.debugLineNum = 153;BA.debugLine="pn.SetColorAnimated(700,Colors.White,Colors.Trans";
_pn.SetColorAnimated((int) (700),anywheresoftware.b4a.keywords.Common.Colors.White,anywheresoftware.b4a.keywords.Common.Colors.Transparent);
 //BA.debugLineNum = 155;BA.debugLine="Dim id As String";
_id = "";
 //BA.debugLineNum = 156;BA.debugLine="id = pn.Tag";
_id = BA.ObjectToString(_pn.getTag());
 //BA.debugLineNum = 158;BA.debugLine="Select id";
switch (BA.switchObjectToInt(_id,"1","https","2","3","4","5","6","7","8","9","10")) {
case 0: {
 //BA.debugLineNum = 160;BA.debugLine="StartActivity(actSendPush)";
anywheresoftware.b4a.keywords.Common.StartActivity(processBA,(Object)(mostCurrent._vvvvvvv4.getObject()));
 break; }
case 1: {
 //BA.debugLineNum = 163;BA.debugLine="If Msgbox2(Library.GetStringResourse(\"change_st";
if (anywheresoftware.b4a.keywords.Common.Msgbox2(BA.ObjectToCharSequence(mostCurrent._vvvvvvv6._vvvv2(mostCurrent.activityBA,"change_state_https")),BA.ObjectToCharSequence(mostCurrent._vvvvvvv6._vvvv2(mostCurrent.activityBA,"alert")),mostCurrent._vvvvvvv6._vvvv2(mostCurrent.activityBA,"yes"),mostCurrent._vvvvvvv6._vvvv2(mostCurrent.activityBA,"no"),"",(android.graphics.Bitmap)(anywheresoftware.b4a.keywords.Common.Null),mostCurrent.activityBA)==anywheresoftware.b4a.keywords.Common.DialogResponse.POSITIVE) { 
 //BA.debugLineNum = 164;BA.debugLine="Progress.ShowProgress(Library.GetStringResours";
mostCurrent._vvvvvvvvv7._vvvvvvvvv1(mostCurrent._vvvvvvv6._vvvv2(mostCurrent.activityBA,"during_apply"));
 //BA.debugLineNum = 165;BA.debugLine="Dim hu As HttpJob";
_hu = new anywheresoftware.b4a.samples.httputils2.httpjob();
 //BA.debugLineNum = 166;BA.debugLine="hu.Initialize(\"change_state_https\",Me)";
_hu._initialize(processBA,"change_state_https",actmenu.getObject());
 //BA.debugLineNum = 167;BA.debugLine="hu.Download(Library.URL & \"method=change_state";
_hu._download(mostCurrent._vvvvvvv6._vv2+"method=change_state_https");
 };
 break; }
case 2: {
 //BA.debugLineNum = 171;BA.debugLine="StartActivity(actStatistic)";
anywheresoftware.b4a.keywords.Common.StartActivity(processBA,(Object)(mostCurrent._vvvvvvvv1.getObject()));
 break; }
case 3: {
 //BA.debugLineNum = 175;BA.debugLine="If Library.InternetState = False Then";
if (mostCurrent._vvvvvvv6._vvvv4(mostCurrent.activityBA)==anywheresoftware.b4a.keywords.Common.False) { 
 //BA.debugLineNum = 176;BA.debugLine="toast.ShowToastMessageShow(Library.GetStringRe";
mostCurrent._vvvvvvvvv0._vvvvvvvvv3(mostCurrent._vvvvvvv6._vvvv2(mostCurrent.activityBA,"no_internet"),(long) (2),anywheresoftware.b4a.keywords.Common.False);
 //BA.debugLineNum = 177;BA.debugLine="Return";
if (true) return "";
 };
 //BA.debugLineNum = 180;BA.debugLine="Progress.ShowProgress(Library.GetStringResourse";
mostCurrent._vvvvvvvvv7._vvvvvvvvv1(mostCurrent._vvvvvvv6._vvvv2(mostCurrent.activityBA,"downloading"));
 //BA.debugLineNum = 182;BA.debugLine="Dim Jo As HttpJob";
_jo = new anywheresoftware.b4a.samples.httputils2.httpjob();
 //BA.debugLineNum = 183;BA.debugLine="Jo.Initialize(\"download\",Me)";
_jo._initialize(processBA,"download",actmenu.getObject());
 //BA.debugLineNum = 184;BA.debugLine="Jo.Download(Library.BaseURL & \"app/updater/app.";
_jo._download(mostCurrent._vvvvvvv6._vv3+"app/updater/app.apk");
 break; }
case 4: {
 //BA.debugLineNum = 187;BA.debugLine="StartActivity(actPassword)";
anywheresoftware.b4a.keywords.Common.StartActivity(processBA,(Object)(mostCurrent._vvvvvvvv5.getObject()));
 break; }
case 5: {
 //BA.debugLineNum = 190;BA.debugLine="Library.Token = \"\"";
mostCurrent._vvvvvvv6._v0 = "";
 //BA.debugLineNum = 191;BA.debugLine="Library.ShopAppVersion = \"\"";
mostCurrent._vvvvvvv6._vv1 = "";
 //BA.debugLineNum = 192;BA.debugLine="Library.URL = \"\"";
mostCurrent._vvvvvvv6._vv2 = "";
 //BA.debugLineNum = 193;BA.debugLine="Activity.Finish";
mostCurrent._activity.Finish();
 //BA.debugLineNum = 194;BA.debugLine="StartActivity(Main)";
anywheresoftware.b4a.keywords.Common.StartActivity(processBA,(Object)(mostCurrent._vvvvvvv1.getObject()));
 break; }
case 6: {
 //BA.debugLineNum = 197;BA.debugLine="pnlabout.SetLayoutAnimated(1100,pnlabout.Left,p";
mostCurrent._pnlabout.SetLayoutAnimated((int) (1100),mostCurrent._pnlabout.getLeft(),(int) (mostCurrent._pnlabout.getTop()-mostCurrent._pnlabout.getHeight()),mostCurrent._pnlabout.getWidth(),mostCurrent._pnlabout.getHeight());
 break; }
case 7: {
 //BA.debugLineNum = 200;BA.debugLine="If Msgbox2(Library.GetStringResourse(\"change_st";
if (anywheresoftware.b4a.keywords.Common.Msgbox2(BA.ObjectToCharSequence(mostCurrent._vvvvvvv6._vvvv2(mostCurrent.activityBA,"change_state_shop")),BA.ObjectToCharSequence(mostCurrent._vvvvvvv6._vvvv2(mostCurrent.activityBA,"alert")),mostCurrent._vvvvvvv6._vvvv2(mostCurrent.activityBA,"yes"),mostCurrent._vvvvvvv6._vvvv2(mostCurrent.activityBA,"no"),"",(android.graphics.Bitmap)(anywheresoftware.b4a.keywords.Common.Null),mostCurrent.activityBA)==anywheresoftware.b4a.keywords.Common.DialogResponse.POSITIVE) { 
 //BA.debugLineNum = 201;BA.debugLine="Progress.ShowProgress(Library.GetStringResours";
mostCurrent._vvvvvvvvv7._vvvvvvvvv1(mostCurrent._vvvvvvv6._vvvv2(mostCurrent.activityBA,"during_apply"));
 //BA.debugLineNum = 202;BA.debugLine="Dim hu As HttpJob";
_hu = new anywheresoftware.b4a.samples.httputils2.httpjob();
 //BA.debugLineNum = 203;BA.debugLine="hu.Initialize(\"change_state\",Me)";
_hu._initialize(processBA,"change_state",actmenu.getObject());
 //BA.debugLineNum = 204;BA.debugLine="hu.Download(Library.URL & \"method=change_state";
_hu._download(mostCurrent._vvvvvvv6._vv2+"method=change_state");
 };
 break; }
case 8: {
 //BA.debugLineNum = 208;BA.debugLine="If Library.Token.Length = 0 Then";
if (mostCurrent._vvvvvvv6._v0.length()==0) { 
 //BA.debugLineNum = 209;BA.debugLine="toast.ShowToastMessageShow(Library.GetStringRe";
mostCurrent._vvvvvvvvv0._vvvvvvvvv3(mostCurrent._vvvvvvv6._vvvv2(mostCurrent.activityBA,"error_client_id"),(long) (2),anywheresoftware.b4a.keywords.Common.False);
 //BA.debugLineNum = 210;BA.debugLine="Return";
if (true) return "";
 };
 //BA.debugLineNum = 212;BA.debugLine="StartActivity(actBanners)";
anywheresoftware.b4a.keywords.Common.StartActivity(processBA,(Object)(mostCurrent._vvvvvvv0.getObject()));
 break; }
case 9: {
 //BA.debugLineNum = 215;BA.debugLine="If Library.Token.Length = 0 Then";
if (mostCurrent._vvvvvvv6._v0.length()==0) { 
 //BA.debugLineNum = 216;BA.debugLine="toast.ShowToastMessageShow(Library.GetStringRe";
mostCurrent._vvvvvvvvv0._vvvvvvvvv3(mostCurrent._vvvvvvv6._vvvv2(mostCurrent.activityBA,"error_client_id"),(long) (2),anywheresoftware.b4a.keywords.Common.False);
 //BA.debugLineNum = 217;BA.debugLine="Return";
if (true) return "";
 };
 //BA.debugLineNum = 219;BA.debugLine="StartActivity(actMenus)";
anywheresoftware.b4a.keywords.Common.StartActivity(processBA,(Object)(mostCurrent._vvvvvvvv3.getObject()));
 break; }
case 10: {
 //BA.debugLineNum = 222;BA.debugLine="If Library.Token.Length = 0 Then";
if (mostCurrent._vvvvvvv6._v0.length()==0) { 
 //BA.debugLineNum = 223;BA.debugLine="toast.ShowToastMessageShow(Library.GetStringRe";
mostCurrent._vvvvvvvvv0._vvvvvvvvv3(mostCurrent._vvvvvvv6._vvvv2(mostCurrent.activityBA,"error_client_id"),(long) (2),anywheresoftware.b4a.keywords.Common.False);
 //BA.debugLineNum = 224;BA.debugLine="Return";
if (true) return "";
 };
 //BA.debugLineNum = 226;BA.debugLine="StartActivity(actFeatureModule)";
anywheresoftware.b4a.keywords.Common.StartActivity(processBA,(Object)(mostCurrent._vvvvvvv7.getObject()));
 break; }
}
;
 //BA.debugLineNum = 230;BA.debugLine="End Sub";
return "";
}
public static String  _process_globals() throws Exception{
 //BA.debugLineNum = 6;BA.debugLine="Sub Process_Globals";
 //BA.debugLineNum = 8;BA.debugLine="End Sub";
return "";
}
public static String  _token_receive(boolean _success) throws Exception{
 //BA.debugLineNum = 67;BA.debugLine="Sub Token_Receive(Success As Boolean)";
 //BA.debugLineNum = 69;BA.debugLine="Progress.HideProgress";
mostCurrent._vvvvvvvvv7._vvvvvvvv0();
 //BA.debugLineNum = 71;BA.debugLine="If Success = False Then";
if (_success==anywheresoftware.b4a.keywords.Common.False) { 
 //BA.debugLineNum = 72;BA.debugLine="toast.ShowToastMessageShow(Library.GetStringReso";
mostCurrent._vvvvvvvvv0._vvvvvvvvv3(mostCurrent._vvvvvvv6._vvvv2(mostCurrent.activityBA,"error_client_id"),(long) (2),anywheresoftware.b4a.keywords.Common.False);
 };
 //BA.debugLineNum = 75;BA.debugLine="End Sub";
return "";
}
}
