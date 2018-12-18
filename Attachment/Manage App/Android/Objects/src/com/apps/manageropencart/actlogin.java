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

public class actlogin extends Activity implements B4AActivity{
	public static actlogin mostCurrent;
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
			processBA = new BA(this.getApplicationContext(), null, null, "com.apps.manageropencart", "com.apps.manageropencart.actlogin");
			processBA.loadHtSubs(this.getClass());
	        float deviceScale = getApplicationContext().getResources().getDisplayMetrics().density;
	        BALayout.setDeviceScale(deviceScale);
            
		}
		else if (previousOne != null) {
			Activity p = previousOne.get();
			if (p != null && p != this) {
                BA.LogInfo("Killing previous instance (actlogin).");
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
		activityBA = new BA(this, layout, processBA, "com.apps.manageropencart", "com.apps.manageropencart.actlogin");
        
        processBA.sharedProcessBA.activityBA = new java.lang.ref.WeakReference<BA>(activityBA);
        anywheresoftware.b4a.objects.ViewWrapper.lastId = 0;
        _activity = new ActivityWrapper(activityBA, "activity");
        anywheresoftware.b4a.Msgbox.isDismissing = false;
        if (BA.isShellModeRuntimeCheck(processBA)) {
			if (isFirst)
				processBA.raiseEvent2(null, true, "SHELL", false);
			processBA.raiseEvent2(null, true, "CREATE", true, "com.apps.manageropencart.actlogin", processBA, activityBA, _activity, anywheresoftware.b4a.keywords.Common.Density, mostCurrent);
			_activity.reinitializeForShell(activityBA, "activity");
		}
        initializeProcessGlobals();		
        initializeGlobals();
        
        BA.LogInfo("** Activity (actlogin) Create, isFirst = " + isFirst + " **");
        processBA.raiseEvent2(null, true, "activity_create", false, isFirst);
		isFirst = false;
		if (this != mostCurrent)
			return;
        processBA.setActivityPaused(false);
        BA.LogInfo("** Activity (actlogin) Resume **");
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
		return actlogin.class;
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
        BA.LogInfo("** Activity (actlogin) Pause, UserClosed = " + activityBA.activity.isFinishing() + " **");
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
            BA.LogInfo("** Activity (actlogin) Resume **");
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
public static boolean _v5 = false;
public anywheresoftware.b4a.objects.EditTextWrapper _txtusername = null;
public anywheresoftware.b4a.objects.EditTextWrapper _txtpassword = null;
public com.apps.manageropencart.showprogress _vvvvvvvvv7 = null;
public com.apps.manageropencart.mytoastmessageshow _vvvvvvvvv0 = null;
public anywheresoftware.b4a.objects.LabelWrapper _lblheader1 = null;
public anywheresoftware.b4a.objects.LabelWrapper _lblheader2 = null;
public anywheresoftware.b4a.objects.ButtonWrapper _btnlogin = null;
public anywheresoftware.b4a.objects.PanelWrapper _pnllog = null;
public anywheresoftware.b4a.objects.LabelWrapper _lbllog = null;
public anywheresoftware.b4a.samples.httputils2.httputils2service _vvvvvv0 = null;
public com.apps.manageropencart.main _vvvvvvv1 = null;
public com.apps.manageropencart.updater _vvvvvvv3 = null;
public com.apps.manageropencart.actsendpush _vvvvvvv4 = null;
public com.apps.manageropencart.actdetailsofreportitem _vvvvvvv5 = null;
public com.apps.manageropencart.library _vvvvvvv6 = null;
public com.apps.manageropencart.actfeaturemodule _vvvvvvv7 = null;
public com.apps.manageropencart.actbanners _vvvvvvv0 = null;
public com.apps.manageropencart.actstatistic _vvvvvvvv1 = null;
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
anywheresoftware.b4a.phone.Phone _p = null;
wrap.Wrap _status = null;
 //BA.debugLineNum = 22;BA.debugLine="Sub Activity_Create(FirstTime As Boolean)";
 //BA.debugLineNum = 24;BA.debugLine="Dim p As Phone";
_p = new anywheresoftware.b4a.phone.Phone();
 //BA.debugLineNum = 25;BA.debugLine="If p.SdkVersion >=21 Then";
if (_p.getSdkVersion()>=21) { 
 //BA.debugLineNum = 26;BA.debugLine="Dim status As StatusBarCompat";
_status = new wrap.Wrap();
 //BA.debugLineNum = 27;BA.debugLine="status.Initialize";
_status.Initialize(mostCurrent.activityBA);
 //BA.debugLineNum = 28;BA.debugLine="status.StatusBarColor = Colors.RGB(33,33,33)";
_status.setStatusBarColor(anywheresoftware.b4a.keywords.Common.Colors.RGB((int) (33),(int) (33),(int) (33)));
 };
 //BA.debugLineNum = 31;BA.debugLine="Library.setLocalApp";
mostCurrent._vvvvvvv6._vvvv0(mostCurrent.activityBA);
 //BA.debugLineNum = 33;BA.debugLine="Activity.LoadLayout(\"frmlogin\")";
mostCurrent._activity.LoadLayout("frmlogin",mostCurrent.activityBA);
 //BA.debugLineNum = 34;BA.debugLine="txtpassword.Color = Colors.White";
mostCurrent._txtpassword.setColor(anywheresoftware.b4a.keywords.Common.Colors.White);
 //BA.debugLineNum = 35;BA.debugLine="txtusername.Color = Colors.White";
mostCurrent._txtusername.setColor(anywheresoftware.b4a.keywords.Common.Colors.White);
 //BA.debugLineNum = 37;BA.debugLine="progress.Initialize(Activity)";
mostCurrent._vvvvvvvvv7._initialize(mostCurrent.activityBA,mostCurrent._activity);
 //BA.debugLineNum = 38;BA.debugLine="toast.Initialize(Activity)";
mostCurrent._vvvvvvvvv0._initialize(mostCurrent.activityBA,(anywheresoftware.b4a.objects.PanelWrapper) anywheresoftware.b4a.AbsObjectWrapper.ConvertToWrapper(new anywheresoftware.b4a.objects.PanelWrapper(), (android.view.ViewGroup)(mostCurrent._activity.getObject())));
 //BA.debugLineNum = 40;BA.debugLine="lblheader1.Text = Library.GetStringResourse(\"titl";
mostCurrent._lblheader1.setText(BA.ObjectToCharSequence(mostCurrent._vvvvvvv6._vvvv2(mostCurrent.activityBA,"title1")));
 //BA.debugLineNum = 41;BA.debugLine="lblheader2.Text = Library.GetStringResourse(\"titl";
mostCurrent._lblheader2.setText(BA.ObjectToCharSequence(mostCurrent._vvvvvvv6._vvvv2(mostCurrent.activityBA,"title2")));
 //BA.debugLineNum = 43;BA.debugLine="txtusername.Hint = Library.GetStringResourse(\"use";
mostCurrent._txtusername.setHint(mostCurrent._vvvvvvv6._vvvv2(mostCurrent.activityBA,"username"));
 //BA.debugLineNum = 44;BA.debugLine="txtpassword.Hint = Library.GetStringResourse(\"pas";
mostCurrent._txtpassword.setHint(mostCurrent._vvvvvvv6._vvvv2(mostCurrent.activityBA,"password"));
 //BA.debugLineNum = 46;BA.debugLine="btnlogin.Text = Library.GetStringResourse(\"login\"";
mostCurrent._btnlogin.setText(BA.ObjectToCharSequence(mostCurrent._vvvvvvv6._vvvv2(mostCurrent.activityBA,"login")));
 //BA.debugLineNum = 48;BA.debugLine="lblheader1.TextColor = Colors.RGB(41,150,221)";
mostCurrent._lblheader1.setTextColor(anywheresoftware.b4a.keywords.Common.Colors.RGB((int) (41),(int) (150),(int) (221)));
 //BA.debugLineNum = 49;BA.debugLine="lblheader2.TextColor = Colors.RGB(41,150,221)";
mostCurrent._lblheader2.setTextColor(anywheresoftware.b4a.keywords.Common.Colors.RGB((int) (41),(int) (150),(int) (221)));
 //BA.debugLineNum = 51;BA.debugLine="lblheader1.SetTextColorAnimated(3000,Colors.White";
mostCurrent._lblheader1.SetTextColorAnimated((int) (3000),anywheresoftware.b4a.keywords.Common.Colors.White);
 //BA.debugLineNum = 52;BA.debugLine="lblheader2.SetTextColorAnimated(3000,Colors.rgb(2";
mostCurrent._lblheader2.SetTextColorAnimated((int) (3000),anywheresoftware.b4a.keywords.Common.Colors.RGB((int) (218),(int) (217),(int) (217)));
 //BA.debugLineNum = 54;BA.debugLine="Library.EditTextIcon(txtusername,\"ic_menu_cc\")";
mostCurrent._vvvvvvv6._vvv0(mostCurrent.activityBA,mostCurrent._txtusername,"ic_menu_cc");
 //BA.debugLineNum = 55;BA.debugLine="Library.EditTextIcon(txtpassword,\"ic_menu_login\")";
mostCurrent._vvvvvvv6._vvv0(mostCurrent.activityBA,mostCurrent._txtpassword,"ic_menu_login");
 //BA.debugLineNum = 57;BA.debugLine="If File.Exists(File.DirInternal,\"code\") Then";
if (anywheresoftware.b4a.keywords.Common.File.Exists(anywheresoftware.b4a.keywords.Common.File.getDirInternal(),"code")) { 
 //BA.debugLineNum = 58;BA.debugLine="txtpassword.Text = File.ReadString(File.DirInter";
mostCurrent._txtpassword.setText(BA.ObjectToCharSequence(anywheresoftware.b4a.keywords.Common.File.ReadString(anywheresoftware.b4a.keywords.Common.File.getDirInternal(),"code")));
 };
 //BA.debugLineNum = 61;BA.debugLine="If File.Exists(File.DirInternal,\"user\") Then";
if (anywheresoftware.b4a.keywords.Common.File.Exists(anywheresoftware.b4a.keywords.Common.File.getDirInternal(),"user")) { 
 //BA.debugLineNum = 62;BA.debugLine="txtusername.Text = File.ReadString(File.DirInter";
mostCurrent._txtusername.setText(BA.ObjectToCharSequence(anywheresoftware.b4a.keywords.Common.File.ReadString(anywheresoftware.b4a.keywords.Common.File.getDirInternal(),"user")));
 };
 //BA.debugLineNum = 65;BA.debugLine="If isChangedPassword = True Then";
if (_v5==anywheresoftware.b4a.keywords.Common.True) { 
 //BA.debugLineNum = 66;BA.debugLine="toast.ShowToastMessageShow(Library.GetStringReso";
mostCurrent._vvvvvvvvv0._vvvvvvvvv3(mostCurrent._vvvvvvv6._vvvv2(mostCurrent.activityBA,"changed_password"),(long) (0),anywheresoftware.b4a.keywords.Common.True);
 //BA.debugLineNum = 67;BA.debugLine="isChangedPassword = False";
_v5 = anywheresoftware.b4a.keywords.Common.False;
 };
 //BA.debugLineNum = 70;BA.debugLine="If File.Exists(File.DirInternal,\"log\") Then";
if (anywheresoftware.b4a.keywords.Common.File.Exists(anywheresoftware.b4a.keywords.Common.File.getDirInternal(),"log")) { 
 //BA.debugLineNum = 71;BA.debugLine="lbllog.Text = Library.GetStringResourse(\"changel";
mostCurrent._lbllog.setText(BA.ObjectToCharSequence(mostCurrent._vvvvvvv6._vvvv2(mostCurrent.activityBA,"changelog")+anywheresoftware.b4a.keywords.Common.CRLF+anywheresoftware.b4a.keywords.Common.CRLF+anywheresoftware.b4a.keywords.Common.CRLF+anywheresoftware.b4a.keywords.Common.File.ReadString(anywheresoftware.b4a.keywords.Common.File.getDirInternal(),"log")));
 //BA.debugLineNum = 72;BA.debugLine="File.Delete(File.DirInternal,\"log\")";
anywheresoftware.b4a.keywords.Common.File.Delete(anywheresoftware.b4a.keywords.Common.File.getDirInternal(),"log");
 //BA.debugLineNum = 73;BA.debugLine="pnllog.Visible = True";
mostCurrent._pnllog.setVisible(anywheresoftware.b4a.keywords.Common.True);
 //BA.debugLineNum = 74;BA.debugLine="pnllog.Left = -pnllog.Width";
mostCurrent._pnllog.setLeft((int) (-mostCurrent._pnllog.getWidth()));
 //BA.debugLineNum = 75;BA.debugLine="pnllog.SetLayoutAnimated(650,0,0,pnllog.Width,pn";
mostCurrent._pnllog.SetLayoutAnimated((int) (650),(int) (0),(int) (0),mostCurrent._pnllog.getWidth(),mostCurrent._pnllog.getHeight());
 };
 //BA.debugLineNum = 78;BA.debugLine="End Sub";
return "";
}
public static String  _activity_pause(boolean _userclosed) throws Exception{
 //BA.debugLineNum = 84;BA.debugLine="Sub Activity_Pause (UserClosed As Boolean)";
 //BA.debugLineNum = 85;BA.debugLine="Activity.Finish";
mostCurrent._activity.Finish();
 //BA.debugLineNum = 86;BA.debugLine="End Sub";
return "";
}
public static String  _activity_resume() throws Exception{
 //BA.debugLineNum = 80;BA.debugLine="Sub Activity_Resume";
 //BA.debugLineNum = 82;BA.debugLine="End Sub";
return "";
}
public static String  _btnlogin_click() throws Exception{
anywheresoftware.b4a.samples.httputils2.httpjob _ht = null;
 //BA.debugLineNum = 88;BA.debugLine="Sub btnlogin_Click";
 //BA.debugLineNum = 90;BA.debugLine="If Library.InternetState = False Then";
if (mostCurrent._vvvvvvv6._vvvv4(mostCurrent.activityBA)==anywheresoftware.b4a.keywords.Common.False) { 
 //BA.debugLineNum = 91;BA.debugLine="toast.ShowToastMessageShow(Library.GetStringReso";
mostCurrent._vvvvvvvvv0._vvvvvvvvv3(mostCurrent._vvvvvvv6._vvvv2(mostCurrent.activityBA,"no_internet"),(long) (0),anywheresoftware.b4a.keywords.Common.False);
 //BA.debugLineNum = 92;BA.debugLine="Return";
if (true) return "";
 };
 //BA.debugLineNum = 95;BA.debugLine="If txtusername.Text = \"demo\" Then txtusername.Tex";
if ((mostCurrent._txtusername.getText()).equals("demo")) { 
mostCurrent._txtusername.setText(BA.ObjectToCharSequence("api.kharidaram.com"));};
 //BA.debugLineNum = 97;BA.debugLine="If Regex.IsMatch(\"^(http|https)://[\\w-]+\\.\\S+$\",t";
if (anywheresoftware.b4a.keywords.Common.Regex.IsMatch("^(http|https)://[\\w-]+\\.\\S+$",mostCurrent._txtusername.getText())==anywheresoftware.b4a.keywords.Common.False) { 
 //BA.debugLineNum = 98;BA.debugLine="toast.ShowToastMessageShow(Library.GetStringReso";
mostCurrent._vvvvvvvvv0._vvvvvvvvv3(mostCurrent._vvvvvvv6._vvvv2(mostCurrent.activityBA,"error_username"),(long) (0),anywheresoftware.b4a.keywords.Common.False);
 //BA.debugLineNum = 99;BA.debugLine="Return";
if (true) return "";
 };
 //BA.debugLineNum = 102;BA.debugLine="If txtpassword.Text.Length < 5 Then";
if (mostCurrent._txtpassword.getText().length()<5) { 
 //BA.debugLineNum = 103;BA.debugLine="toast.ShowToastMessageShow(Library.GetStringReso";
mostCurrent._vvvvvvvvv0._vvvvvvvvv3(mostCurrent._vvvvvvv6._vvvv2(mostCurrent.activityBA,"error_password"),(long) (0),anywheresoftware.b4a.keywords.Common.False);
 //BA.debugLineNum = 104;BA.debugLine="Return";
if (true) return "";
 };
 //BA.debugLineNum = 107;BA.debugLine="progress.ShowProgress(Library.GetStringResourse(\"";
mostCurrent._vvvvvvvvv7._vvvvvvvvv1(mostCurrent._vvvvvvv6._vvvv2(mostCurrent.activityBA,"during_login"));
 //BA.debugLineNum = 109;BA.debugLine="Dim ht As HttpJob";
_ht = new anywheresoftware.b4a.samples.httputils2.httpjob();
 //BA.debugLineNum = 110;BA.debugLine="ht.Initialize(\"login\",Me)";
_ht._initialize(processBA,"login",actlogin.getObject());
 //BA.debugLineNum = 111;BA.debugLine="ht.Download($\"${txtusername.Text}/app/ws.php?user";
_ht._download((""+anywheresoftware.b4a.keywords.Common.SmartStringFormatter("",(Object)(mostCurrent._txtusername.getText()))+"/app/ws.php?username="+anywheresoftware.b4a.keywords.Common.SmartStringFormatter("",(Object)(mostCurrent._txtusername.getText()))+"&password="+anywheresoftware.b4a.keywords.Common.SmartStringFormatter("",(Object)(mostCurrent._txtpassword.getText()))+"&method=login"));
 //BA.debugLineNum = 113;BA.debugLine="End Sub";
return "";
}
public static String  _globals() throws Exception{
 //BA.debugLineNum = 10;BA.debugLine="Sub Globals";
 //BA.debugLineNum = 11;BA.debugLine="Private txtusername As EditText";
mostCurrent._txtusername = new anywheresoftware.b4a.objects.EditTextWrapper();
 //BA.debugLineNum = 12;BA.debugLine="Private txtpassword As EditText";
mostCurrent._txtpassword = new anywheresoftware.b4a.objects.EditTextWrapper();
 //BA.debugLineNum = 13;BA.debugLine="Private progress As ShowProgress";
mostCurrent._vvvvvvvvv7 = new com.apps.manageropencart.showprogress();
 //BA.debugLineNum = 14;BA.debugLine="Private toast As MyToastMessageShow";
mostCurrent._vvvvvvvvv0 = new com.apps.manageropencart.mytoastmessageshow();
 //BA.debugLineNum = 15;BA.debugLine="Private lblheader1 As Label";
mostCurrent._lblheader1 = new anywheresoftware.b4a.objects.LabelWrapper();
 //BA.debugLineNum = 16;BA.debugLine="Private lblheader2 As Label";
mostCurrent._lblheader2 = new anywheresoftware.b4a.objects.LabelWrapper();
 //BA.debugLineNum = 17;BA.debugLine="Private btnlogin As Button";
mostCurrent._btnlogin = new anywheresoftware.b4a.objects.ButtonWrapper();
 //BA.debugLineNum = 18;BA.debugLine="Private pnllog As Panel";
mostCurrent._pnllog = new anywheresoftware.b4a.objects.PanelWrapper();
 //BA.debugLineNum = 19;BA.debugLine="Private lbllog As Label";
mostCurrent._lbllog = new anywheresoftware.b4a.objects.LabelWrapper();
 //BA.debugLineNum = 20;BA.debugLine="End Sub";
return "";
}
public static String  _jobdone(anywheresoftware.b4a.samples.httputils2.httpjob _job) throws Exception{
anywheresoftware.b4a.objects.collections.Map _res = null;
 //BA.debugLineNum = 115;BA.debugLine="Sub JobDone(Job As HttpJob)";
 //BA.debugLineNum = 117;BA.debugLine="If Job.Success Then";
if (_job._success) { 
 //BA.debugLineNum = 118;BA.debugLine="If Job.JobName = \"login\" Then";
if ((_job._jobname).equals("login")) { 
 //BA.debugLineNum = 119;BA.debugLine="Dim res As Map";
_res = new anywheresoftware.b4a.objects.collections.Map();
 //BA.debugLineNum = 120;BA.debugLine="res = Library.Json2Map(Job.GetString)";
_res = mostCurrent._vvvvvvv6._vvvv5(mostCurrent.activityBA,_job._getstring());
 //BA.debugLineNum = 121;BA.debugLine="If res.Get(\"result\") = False Or res.Get(\"result";
if ((_res.Get((Object)("result"))).equals((Object)(anywheresoftware.b4a.keywords.Common.False)) || (_res.Get((Object)("result"))).equals((Object)("-1"))) { 
 //BA.debugLineNum = 122;BA.debugLine="toast.ShowToastMessageShow(Library.GetStringRe";
mostCurrent._vvvvvvvvv0._vvvvvvvvv3(mostCurrent._vvvvvvv6._vvvv2(mostCurrent.activityBA,"error_up"),(long) (0),anywheresoftware.b4a.keywords.Common.False);
 }else {
 //BA.debugLineNum = 125;BA.debugLine="If res.Get(\"config\") = False Then";
if ((_res.Get((Object)("config"))).equals((Object)(anywheresoftware.b4a.keywords.Common.False))) { 
 //BA.debugLineNum = 126;BA.debugLine="toast.ShowToastMessageShow(Library.GetStringR";
mostCurrent._vvvvvvvvv0._vvvvvvvvv3(mostCurrent._vvvvvvv6._vvvv2(mostCurrent.activityBA,"error_config"),(long) (2),anywheresoftware.b4a.keywords.Common.False);
 //BA.debugLineNum = 127;BA.debugLine="Return";
if (true) return "";
 };
 //BA.debugLineNum = 130;BA.debugLine="Library.Token			= res.Get(\"token\")";
mostCurrent._vvvvvvv6._v0 = BA.ObjectToString(_res.Get((Object)("token")));
 //BA.debugLineNum = 131;BA.debugLine="Library.ShopAppVersion	= res.Get(\"version\")";
mostCurrent._vvvvvvv6._vv1 = BA.ObjectToString(_res.Get((Object)("version")));
 //BA.debugLineNum = 132;BA.debugLine="Library.URL				= $\"${txtusername.Text}/app/ws.";
mostCurrent._vvvvvvv6._vv2 = (""+anywheresoftware.b4a.keywords.Common.SmartStringFormatter("",(Object)(mostCurrent._txtusername.getText()))+"/app/ws.php?username="+anywheresoftware.b4a.keywords.Common.SmartStringFormatter("",(Object)(mostCurrent._txtusername.getText()))+"&password="+anywheresoftware.b4a.keywords.Common.SmartStringFormatter("",(Object)(mostCurrent._txtpassword.getText()))+"&token="+anywheresoftware.b4a.keywords.Common.SmartStringFormatter("",(Object)(mostCurrent._vvvvvvv6._v0))+"&");
 //BA.debugLineNum = 133;BA.debugLine="Library.BaseURL			= $\"${txtusername.Text}/\"$";
mostCurrent._vvvvvvv6._vv3 = (""+anywheresoftware.b4a.keywords.Common.SmartStringFormatter("",(Object)(mostCurrent._txtusername.getText()))+"/");
 //BA.debugLineNum = 134;BA.debugLine="Library.ClientID		= res.Get(\"client_id\")";
mostCurrent._vvvvvvv6._vv0 = BA.ObjectToString(_res.Get((Object)("client_id")));
 //BA.debugLineNum = 135;BA.debugLine="Library.Config			= Library.Json2Map(res.Get(\"c";
mostCurrent._vvvvvvv6._vvv1 = mostCurrent._vvvvvvv6._vvvv5(mostCurrent.activityBA,BA.ObjectToString(_res.Get((Object)("config"))));
 //BA.debugLineNum = 136;BA.debugLine="Library.IsActiveShop	= Library.Config.Get(\"sho";
mostCurrent._vvvvvvv6._vv4 = BA.ObjectToBoolean(mostCurrent._vvvvvvv6._vvv1.Get((Object)("shop_state")));
 //BA.debugLineNum = 137;BA.debugLine="If Library.Config.ContainsKey(\"https\") Then";
if (mostCurrent._vvvvvvv6._vvv1.ContainsKey((Object)("https"))) { 
 //BA.debugLineNum = 138;BA.debugLine="Library.IsHttps			= Library.Config.Get(\"https";
mostCurrent._vvvvvvv6._vv5 = BA.ObjectToBoolean(mostCurrent._vvvvvvv6._vvv1.Get((Object)("https")));
 }else {
 //BA.debugLineNum = 140;BA.debugLine="Library.IsHttps			= False";
mostCurrent._vvvvvvv6._vv5 = anywheresoftware.b4a.keywords.Common.False;
 };
 //BA.debugLineNum = 142;BA.debugLine="Library.ThemeColor		= Library.ConvertHex2Int(L";
mostCurrent._vvvvvvv6._vvv3 = (int)(Double.parseDouble(mostCurrent._vvvvvvv6._vvv6(mostCurrent.activityBA,BA.ObjectToString(mostCurrent._vvvvvvv6._vvv1.Get((Object)("color"))))));
 //BA.debugLineNum = 143;BA.debugLine="Library.ShopTitle		= Library.Config.Get(\"title";
mostCurrent._vvvvvvv6._vvv4 = BA.ObjectToString(mostCurrent._vvvvvvv6._vvv1.Get((Object)("title")));
 //BA.debugLineNum = 144;BA.debugLine="Library.Config.Put(\"push_count\",res.Get(\"push_";
mostCurrent._vvvvvvv6._vvv1.Put((Object)("push_count"),_res.Get((Object)("push_count")));
 //BA.debugLineNum = 146;BA.debugLine="File.WriteString(File.DirInternal,\"code\",txtpa";
anywheresoftware.b4a.keywords.Common.File.WriteString(anywheresoftware.b4a.keywords.Common.File.getDirInternal(),"code",mostCurrent._txtpassword.getText());
 //BA.debugLineNum = 147;BA.debugLine="File.WriteString(File.DirInternal,\"user\",txtus";
anywheresoftware.b4a.keywords.Common.File.WriteString(anywheresoftware.b4a.keywords.Common.File.getDirInternal(),"user",mostCurrent._txtusername.getText());
 //BA.debugLineNum = 150;BA.debugLine="StartActivity(actMenu)";
anywheresoftware.b4a.keywords.Common.StartActivity(processBA,(Object)(mostCurrent._vvvvvvvv2.getObject()));
 };
 };
 }else {
 //BA.debugLineNum = 155;BA.debugLine="If Job.ErrorMessage.IndexOf(\"java.net.UnknownHos";
if (_job._errormessage.indexOf("java.net.UnknownHostException")>-1) { 
 //BA.debugLineNum = 156;BA.debugLine="toast.ShowToastMessageShow(Library.GetStringRes";
mostCurrent._vvvvvvvvv0._vvvvvvvvv3(mostCurrent._vvvvvvv6._vvvv2(mostCurrent.activityBA,"no_domain"),(long) (0),anywheresoftware.b4a.keywords.Common.False);
 };
 };
 //BA.debugLineNum = 160;BA.debugLine="progress.HideProgress";
mostCurrent._vvvvvvvvv7._vvvvvvvv0();
 //BA.debugLineNum = 162;BA.debugLine="End Sub";
return "";
}
public static String  _lbllog_click() throws Exception{
 //BA.debugLineNum = 172;BA.debugLine="Sub lbllog_Click";
 //BA.debugLineNum = 173;BA.debugLine="pnllog.SetLayoutAnimated(800,-pnllog.Width,0,pnll";
mostCurrent._pnllog.SetLayoutAnimated((int) (800),(int) (-mostCurrent._pnllog.getWidth()),(int) (0),mostCurrent._pnllog.getWidth(),mostCurrent._pnllog.getHeight());
 //BA.debugLineNum = 174;BA.debugLine="End Sub";
return "";
}
public static String  _pnllog_click() throws Exception{
 //BA.debugLineNum = 176;BA.debugLine="Sub pnllog_Click";
 //BA.debugLineNum = 177;BA.debugLine="pnllog.SetLayoutAnimated(800,-pnllog.Width,0,pnll";
mostCurrent._pnllog.SetLayoutAnimated((int) (800),(int) (-mostCurrent._pnllog.getWidth()),(int) (0),mostCurrent._pnllog.getWidth(),mostCurrent._pnllog.getHeight());
 //BA.debugLineNum = 178;BA.debugLine="End Sub";
return "";
}
public static String  _process_globals() throws Exception{
 //BA.debugLineNum = 6;BA.debugLine="Sub Process_Globals";
 //BA.debugLineNum = 7;BA.debugLine="Public isChangedPassword As Boolean";
_v5 = false;
 //BA.debugLineNum = 8;BA.debugLine="End Sub";
return "";
}
public static String  _txtpassword_enterpressed() throws Exception{
 //BA.debugLineNum = 168;BA.debugLine="Sub txtpassword_EnterPressed";
 //BA.debugLineNum = 169;BA.debugLine="btnlogin_Click";
_btnlogin_click();
 //BA.debugLineNum = 170;BA.debugLine="End Sub";
return "";
}
public static String  _txtusername_enterpressed() throws Exception{
 //BA.debugLineNum = 164;BA.debugLine="Sub txtusername_EnterPressed";
 //BA.debugLineNum = 165;BA.debugLine="txtpassword.RequestFocus";
mostCurrent._txtpassword.RequestFocus();
 //BA.debugLineNum = 166;BA.debugLine="End Sub";
return "";
}
}
