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

public class actsendpush extends Activity implements B4AActivity{
	public static actsendpush mostCurrent;
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
			processBA = new BA(this.getApplicationContext(), null, null, "com.apps.manageropencart", "com.apps.manageropencart.actsendpush");
			processBA.loadHtSubs(this.getClass());
	        float deviceScale = getApplicationContext().getResources().getDisplayMetrics().density;
	        BALayout.setDeviceScale(deviceScale);
            
		}
		else if (previousOne != null) {
			Activity p = previousOne.get();
			if (p != null && p != this) {
                BA.LogInfo("Killing previous instance (actsendpush).");
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
		activityBA = new BA(this, layout, processBA, "com.apps.manageropencart", "com.apps.manageropencart.actsendpush");
        
        processBA.sharedProcessBA.activityBA = new java.lang.ref.WeakReference<BA>(activityBA);
        anywheresoftware.b4a.objects.ViewWrapper.lastId = 0;
        _activity = new ActivityWrapper(activityBA, "activity");
        anywheresoftware.b4a.Msgbox.isDismissing = false;
        if (BA.isShellModeRuntimeCheck(processBA)) {
			if (isFirst)
				processBA.raiseEvent2(null, true, "SHELL", false);
			processBA.raiseEvent2(null, true, "CREATE", true, "com.apps.manageropencart.actsendpush", processBA, activityBA, _activity, anywheresoftware.b4a.keywords.Common.Density, mostCurrent);
			_activity.reinitializeForShell(activityBA, "activity");
		}
        initializeProcessGlobals();		
        initializeGlobals();
        
        BA.LogInfo("** Activity (actsendpush) Create, isFirst = " + isFirst + " **");
        processBA.raiseEvent2(null, true, "activity_create", false, isFirst);
		isFirst = false;
		if (this != mostCurrent)
			return;
        processBA.setActivityPaused(false);
        BA.LogInfo("** Activity (actsendpush) Resume **");
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
		return actsendpush.class;
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
        BA.LogInfo("** Activity (actsendpush) Pause, UserClosed = " + activityBA.activity.isFinishing() + " **");
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
            BA.LogInfo("** Activity (actsendpush) Resume **");
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
public anywheresoftware.b4a.objects.EditTextWrapper _txtbuttontext = null;
public anywheresoftware.b4a.objects.EditTextWrapper _txtval = null;
public anywheresoftware.b4a.objects.SpinnerWrapper _txttype = null;
public anywheresoftware.b4a.objects.EditTextWrapper _txtmessage = null;
public anywheresoftware.b4a.objects.EditTextWrapper _txttitle = null;
public com.apps.manageropencart.mytoastmessageshow _vvvvvvvvv0 = null;
public com.apps.manageropencart.showprogress _vvvvvvvvv7 = null;
public anywheresoftware.b4a.objects.ScrollViewWrapper _vvvvvvvvvv2 = null;
public anywheresoftware.b4a.objects.IME _vvvvvvvvvv1 = null;
public anywheresoftware.b4a.objects.LabelWrapper _lblheader1 = null;
public anywheresoftware.b4a.objects.LabelWrapper _lblheader2 = null;
public anywheresoftware.b4a.objects.ButtonWrapper _btnsend = null;
public anywheresoftware.b4a.objects.ButtonWrapper _btncancel = null;
public anywheresoftware.b4a.objects.LabelWrapper _lblbuttontext = null;
public anywheresoftware.b4a.objects.LabelWrapper _lblval = null;
public anywheresoftware.b4a.objects.LabelWrapper _lbltype = null;
public anywheresoftware.b4a.objects.LabelWrapper _lblmessage = null;
public anywheresoftware.b4a.objects.LabelWrapper _lbltitle = null;
public anywheresoftware.b4a.samples.httputils2.httputils2service _vvvvvv0 = null;
public com.apps.manageropencart.main _vvvvvvv1 = null;
public com.apps.manageropencart.actlogin _vvvvvvv2 = null;
public com.apps.manageropencart.updater _vvvvvvv3 = null;
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
anywheresoftware.b4a.objects.ConcreteViewWrapper _v1 = null;
anywheresoftware.b4a.objects.EditTextWrapper _t = null;
wrap.Wrap _status = null;
 //BA.debugLineNum = 31;BA.debugLine="Sub Activity_Create(FirstTime As Boolean)";
 //BA.debugLineNum = 33;BA.debugLine="ime.Initialize(\"\")";
mostCurrent._vvvvvvvvvv1.Initialize("");
 //BA.debugLineNum = 34;BA.debugLine="sv.Initialize(2900)";
mostCurrent._vvvvvvvvvv2.Initialize(mostCurrent.activityBA,(int) (2900));
 //BA.debugLineNum = 36;BA.debugLine="Library.setLocalApp";
mostCurrent._vvvvvvv6._vvvv0(mostCurrent.activityBA);
 //BA.debugLineNum = 38;BA.debugLine="Activity.AddView(sv,0,0,100%x,100%y)";
mostCurrent._activity.AddView((android.view.View)(mostCurrent._vvvvvvvvvv2.getObject()),(int) (0),(int) (0),anywheresoftware.b4a.keywords.Common.PerXToCurrent((float) (100),mostCurrent.activityBA),anywheresoftware.b4a.keywords.Common.PerYToCurrent((float) (100),mostCurrent.activityBA));
 //BA.debugLineNum = 39;BA.debugLine="sv.Panel.LoadLayout(\"frmsendpush\")";
mostCurrent._vvvvvvvvvv2.getPanel().LoadLayout("frmsendpush",mostCurrent.activityBA);
 //BA.debugLineNum = 40;BA.debugLine="sv.Color = Library.ThemeColor";
mostCurrent._vvvvvvvvvv2.setColor(mostCurrent._vvvvvvv6._vvv3);
 //BA.debugLineNum = 41;BA.debugLine="sv.Panel.Color = Library.ThemeColor";
mostCurrent._vvvvvvvvvv2.getPanel().setColor(mostCurrent._vvvvvvv6._vvv3);
 //BA.debugLineNum = 43;BA.debugLine="For Each v1 As View In sv.Panel.GetAllViewsRecurs";
_v1 = new anywheresoftware.b4a.objects.ConcreteViewWrapper();
{
final anywheresoftware.b4a.BA.IterableList group8 = mostCurrent._vvvvvvvvvv2.getPanel().GetAllViewsRecursive();
final int groupLen8 = group8.getSize()
;int index8 = 0;
;
for (; index8 < groupLen8;index8++){
_v1.setObject((android.view.View)(group8.Get(index8)));
 //BA.debugLineNum = 44;BA.debugLine="If v1 Is EditText Then";
if (_v1.getObjectOrNull() instanceof android.widget.EditText) { 
 //BA.debugLineNum = 45;BA.debugLine="Dim t As EditText";
_t = new anywheresoftware.b4a.objects.EditTextWrapper();
 //BA.debugLineNum = 46;BA.debugLine="t = v1";
_t.setObject((android.widget.EditText)(_v1.getObject()));
 //BA.debugLineNum = 47;BA.debugLine="t.Color = Colors.White";
_t.setColor(anywheresoftware.b4a.keywords.Common.Colors.White);
 //BA.debugLineNum = 48;BA.debugLine="t.TextColor = Colors.Black";
_t.setTextColor(anywheresoftware.b4a.keywords.Common.Colors.Black);
 };
 }
};
 //BA.debugLineNum = 52;BA.debugLine="Dim status As StatusBarCompat";
_status = new wrap.Wrap();
 //BA.debugLineNum = 53;BA.debugLine="status.Initialize";
_status.Initialize(mostCurrent.activityBA);
 //BA.debugLineNum = 54;BA.debugLine="status.StatusBarColor = Library.ThemeColor";
_status.setStatusBarColor(mostCurrent._vvvvvvv6._vvv3);
 //BA.debugLineNum = 56;BA.debugLine="lblheader1.Text = Library.GetStringResourse(\"push";
mostCurrent._lblheader1.setText(BA.ObjectToCharSequence(mostCurrent._vvvvvvv6._vvvv2(mostCurrent.activityBA,"push_title1")));
 //BA.debugLineNum = 57;BA.debugLine="lblheader2.Text = Library.GetStringResourse(\"push";
mostCurrent._lblheader2.setText(BA.ObjectToCharSequence(mostCurrent._vvvvvvv6._vvvv2(mostCurrent.activityBA,"push_title2")));
 //BA.debugLineNum = 59;BA.debugLine="lbltitle.Text = Library.GetStringResourse(\"push_l";
mostCurrent._lbltitle.setText(BA.ObjectToCharSequence(mostCurrent._vvvvvvv6._vvvv2(mostCurrent.activityBA,"push_label")));
 //BA.debugLineNum = 60;BA.debugLine="lbltitle.Gravity = Library.GetStringResourse(\"dir";
mostCurrent._lbltitle.setGravity((int)(Double.parseDouble(mostCurrent._vvvvvvv6._vvvv2(mostCurrent.activityBA,"direction"))));
 //BA.debugLineNum = 62;BA.debugLine="lblbuttontext.Text = Library.GetStringResourse(\"p";
mostCurrent._lblbuttontext.setText(BA.ObjectToCharSequence(mostCurrent._vvvvvvv6._vvvv2(mostCurrent.activityBA,"push_button_text")));
 //BA.debugLineNum = 63;BA.debugLine="lblbuttontext.Gravity = Library.GetStringResourse";
mostCurrent._lblbuttontext.setGravity((int)(Double.parseDouble(mostCurrent._vvvvvvv6._vvvv2(mostCurrent.activityBA,"direction"))));
 //BA.debugLineNum = 65;BA.debugLine="lblmessage.Text = Library.GetStringResourse(\"push";
mostCurrent._lblmessage.setText(BA.ObjectToCharSequence(mostCurrent._vvvvvvv6._vvvv2(mostCurrent.activityBA,"push_message")));
 //BA.debugLineNum = 66;BA.debugLine="lblmessage.Gravity = Library.GetStringResourse(\"d";
mostCurrent._lblmessage.setGravity((int)(Double.parseDouble(mostCurrent._vvvvvvv6._vvvv2(mostCurrent.activityBA,"direction"))));
 //BA.debugLineNum = 68;BA.debugLine="lbltype.Text = Library.GetStringResourse(\"push_ty";
mostCurrent._lbltype.setText(BA.ObjectToCharSequence(mostCurrent._vvvvvvv6._vvvv2(mostCurrent.activityBA,"push_type")));
 //BA.debugLineNum = 69;BA.debugLine="lbltype.Gravity = Library.GetStringResourse(\"dire";
mostCurrent._lbltype.setGravity((int)(Double.parseDouble(mostCurrent._vvvvvvv6._vvvv2(mostCurrent.activityBA,"direction"))));
 //BA.debugLineNum = 71;BA.debugLine="lblval.Text = Library.GetStringResourse(\"push_val";
mostCurrent._lblval.setText(BA.ObjectToCharSequence(mostCurrent._vvvvvvv6._vvvv2(mostCurrent.activityBA,"push_value")));
 //BA.debugLineNum = 72;BA.debugLine="lblval.Gravity = Library.GetStringResourse(\"direc";
mostCurrent._lblval.setGravity((int)(Double.parseDouble(mostCurrent._vvvvvvv6._vvvv2(mostCurrent.activityBA,"direction"))));
 //BA.debugLineNum = 74;BA.debugLine="btncancel.Text = Library.GetStringResourse(\"back\"";
mostCurrent._btncancel.setText(BA.ObjectToCharSequence(mostCurrent._vvvvvvv6._vvvv2(mostCurrent.activityBA,"back")));
 //BA.debugLineNum = 75;BA.debugLine="btnsend.Text = Library.GetStringResourse(\"send_pu";
mostCurrent._btnsend.setText(BA.ObjectToCharSequence(mostCurrent._vvvvvvv6._vvvv2(mostCurrent.activityBA,"send_push")));
 //BA.debugLineNum = 77;BA.debugLine="txttype.Add(Library.GetStringResourse(\"push_type_";
mostCurrent._txttype.Add(mostCurrent._vvvvvvv6._vvvv2(mostCurrent.activityBA,"push_type_site"));
 //BA.debugLineNum = 78;BA.debugLine="txttype.Add(Library.GetStringResourse(\"push_type_";
mostCurrent._txttype.Add(mostCurrent._vvvvvvv6._vvvv2(mostCurrent.activityBA,"push_type_product"));
 //BA.debugLineNum = 79;BA.debugLine="txttype.Add(Library.GetStringResourse(\"push_type_";
mostCurrent._txttype.Add(mostCurrent._vvvvvvv6._vvvv2(mostCurrent.activityBA,"push_type_picture"));
 //BA.debugLineNum = 81;BA.debugLine="txttype.DropdownBackgroundColor = Library.ThemeCo";
mostCurrent._txttype.setDropdownBackgroundColor(mostCurrent._vvvvvvv6._vvv3);
 //BA.debugLineNum = 82;BA.debugLine="txttype.TextColor = Colors.Black";
mostCurrent._txttype.setTextColor(anywheresoftware.b4a.keywords.Common.Colors.Black);
 //BA.debugLineNum = 83;BA.debugLine="txttype.Color = Colors.White";
mostCurrent._txttype.setColor(anywheresoftware.b4a.keywords.Common.Colors.White);
 //BA.debugLineNum = 84;BA.debugLine="txttype.DropdownTextColor = Colors.White";
mostCurrent._txttype.setDropdownTextColor(anywheresoftware.b4a.keywords.Common.Colors.White);
 //BA.debugLineNum = 86;BA.debugLine="Toast.Initialize(Activity)";
mostCurrent._vvvvvvvvv0._initialize(mostCurrent.activityBA,(anywheresoftware.b4a.objects.PanelWrapper) anywheresoftware.b4a.AbsObjectWrapper.ConvertToWrapper(new anywheresoftware.b4a.objects.PanelWrapper(), (android.view.ViewGroup)(mostCurrent._activity.getObject())));
 //BA.debugLineNum = 87;BA.debugLine="progress.Initialize(Activity)";
mostCurrent._vvvvvvvvv7._initialize(mostCurrent.activityBA,mostCurrent._activity);
 //BA.debugLineNum = 89;BA.debugLine="End Sub";
return "";
}
public static String  _activity_pause(boolean _userclosed) throws Exception{
 //BA.debugLineNum = 95;BA.debugLine="Sub Activity_Pause (UserClosed As Boolean)";
 //BA.debugLineNum = 97;BA.debugLine="End Sub";
return "";
}
public static String  _activity_resume() throws Exception{
 //BA.debugLineNum = 91;BA.debugLine="Sub Activity_Resume";
 //BA.debugLineNum = 93;BA.debugLine="End Sub";
return "";
}
public static String  _btncancel_click() throws Exception{
 //BA.debugLineNum = 175;BA.debugLine="Sub btncancel_Click";
 //BA.debugLineNum = 176;BA.debugLine="Activity.Finish";
mostCurrent._activity.Finish();
 //BA.debugLineNum = 177;BA.debugLine="End Sub";
return "";
}
public static String  _btnsend_click() throws Exception{
String _push_type = "";
anywheresoftware.b4a.objects.StringUtils _su = null;
anywheresoftware.b4a.samples.httputils2.httpjob _hu = null;
 //BA.debugLineNum = 99;BA.debugLine="Sub btnsend_Click";
 //BA.debugLineNum = 101;BA.debugLine="ime.HideKeyboard";
mostCurrent._vvvvvvvvvv1.HideKeyboard(mostCurrent.activityBA);
 //BA.debugLineNum = 103;BA.debugLine="If txttitle.Text.Length < 3 Then";
if (mostCurrent._txttitle.getText().length()<3) { 
 //BA.debugLineNum = 104;BA.debugLine="Toast.ShowToastMessageShow(Library.GetStringReso";
mostCurrent._vvvvvvvvv0._vvvvvvvvv3(mostCurrent._vvvvvvv6._vvvv2(mostCurrent.activityBA,"error_push_title"),(long) (0),anywheresoftware.b4a.keywords.Common.False);
 //BA.debugLineNum = 105;BA.debugLine="Return";
if (true) return "";
 };
 //BA.debugLineNum = 108;BA.debugLine="If txtmessage.Text.Length < 20 Then";
if (mostCurrent._txtmessage.getText().length()<20) { 
 //BA.debugLineNum = 109;BA.debugLine="Toast.ShowToastMessageShow(Library.GetStringReso";
mostCurrent._vvvvvvvvv0._vvvvvvvvv3(mostCurrent._vvvvvvv6._vvvv2(mostCurrent.activityBA,"error_push_message"),(long) (0),anywheresoftware.b4a.keywords.Common.False);
 //BA.debugLineNum = 110;BA.debugLine="Return";
if (true) return "";
 };
 //BA.debugLineNum = 113;BA.debugLine="Dim push_type As String";
_push_type = "";
 //BA.debugLineNum = 115;BA.debugLine="If txttype.SelectedIndex = 0 Then";
if (mostCurrent._txttype.getSelectedIndex()==0) { 
 //BA.debugLineNum = 116;BA.debugLine="push_type = \"link\"";
_push_type = "link";
 }else if(mostCurrent._txttype.getSelectedIndex()==1) { 
 //BA.debugLineNum = 122;BA.debugLine="push_type = \"product\"";
_push_type = "product";
 //BA.debugLineNum = 123;BA.debugLine="If IsNumber(txtval.Text) = False Then";
if (anywheresoftware.b4a.keywords.Common.IsNumber(mostCurrent._txtval.getText())==anywheresoftware.b4a.keywords.Common.False) { 
 //BA.debugLineNum = 124;BA.debugLine="Toast.ShowToastMessageShow(Library.GetStringRes";
mostCurrent._vvvvvvvvv0._vvvvvvvvv3(mostCurrent._vvvvvvv6._vvvv2(mostCurrent.activityBA,"no_push_type_product"),(long) (0),anywheresoftware.b4a.keywords.Common.False);
 //BA.debugLineNum = 125;BA.debugLine="Return";
if (true) return "";
 };
 }else if(mostCurrent._txttype.getSelectedIndex()==2) { 
 //BA.debugLineNum = 128;BA.debugLine="push_type = \"picture\"";
_push_type = "picture";
 //BA.debugLineNum = 129;BA.debugLine="If txtval.Text.IndexOf(\".\") = -1 And txtval.Text";
if (mostCurrent._txtval.getText().indexOf(".")==-1 && mostCurrent._txtval.getText().indexOf("www")==-1) { 
 //BA.debugLineNum = 130;BA.debugLine="Toast.ShowToastMessageShow(Library.GetStringRes";
mostCurrent._vvvvvvvvv0._vvvvvvvvv3(mostCurrent._vvvvvvv6._vvvv2(mostCurrent.activityBA,"no_push_type_site"),(long) (0),anywheresoftware.b4a.keywords.Common.False);
 //BA.debugLineNum = 131;BA.debugLine="Return";
if (true) return "";
 };
 };
 //BA.debugLineNum = 135;BA.debugLine="If txtbuttontext.Text = \"\" Then txtbuttontext.Tex";
if ((mostCurrent._txtbuttontext.getText()).equals("")) { 
mostCurrent._txtbuttontext.setText(BA.ObjectToCharSequence(mostCurrent._vvvvvvv6._vvvv2(mostCurrent.activityBA,"ok")));};
 //BA.debugLineNum = 137;BA.debugLine="progress.ShowProgress(Library.GetStringResourse(\"";
mostCurrent._vvvvvvvvv7._vvvvvvvvv1(mostCurrent._vvvvvvv6._vvvv2(mostCurrent.activityBA,"sending"));
 //BA.debugLineNum = 139;BA.debugLine="Dim su As StringUtils";
_su = new anywheresoftware.b4a.objects.StringUtils();
 //BA.debugLineNum = 141;BA.debugLine="Dim hu As HttpJob";
_hu = new anywheresoftware.b4a.samples.httputils2.httpjob();
 //BA.debugLineNum = 142;BA.debugLine="hu.Initialize(\"send_push\",Me)";
_hu._initialize(processBA,"send_push",actsendpush.getObject());
 //BA.debugLineNum = 143;BA.debugLine="hu.Download(Library.URL & $\"method=push&title=${s";
_hu._download(mostCurrent._vvvvvvv6._vv2+("method=push&title="+anywheresoftware.b4a.keywords.Common.SmartStringFormatter("",(Object)(_su.EncodeUrl(mostCurrent._txttitle.getText(),"UTF8")))+"&message="+anywheresoftware.b4a.keywords.Common.SmartStringFormatter("",(Object)(_su.EncodeUrl(mostCurrent._txtmessage.getText(),"UTF8")))+"&button_text="+anywheresoftware.b4a.keywords.Common.SmartStringFormatter("",(Object)(_su.EncodeUrl(mostCurrent._txtbuttontext.getText(),"UTF8")))+"&push_type="+anywheresoftware.b4a.keywords.Common.SmartStringFormatter("",(Object)(_push_type))+"&push_val="+anywheresoftware.b4a.keywords.Common.SmartStringFormatter("",(Object)(_su.EncodeUrl(mostCurrent._txtval.getText(),"UTF8")))+""));
 //BA.debugLineNum = 144;BA.debugLine="sv.ScrollPosition = 0";
mostCurrent._vvvvvvvvvv2.setScrollPosition((int) (0));
 //BA.debugLineNum = 146;BA.debugLine="End Sub";
return "";
}
public static String  _globals() throws Exception{
 //BA.debugLineNum = 10;BA.debugLine="Sub Globals";
 //BA.debugLineNum = 11;BA.debugLine="Private txtbuttontext As EditText";
mostCurrent._txtbuttontext = new anywheresoftware.b4a.objects.EditTextWrapper();
 //BA.debugLineNum = 12;BA.debugLine="Private txtval As EditText";
mostCurrent._txtval = new anywheresoftware.b4a.objects.EditTextWrapper();
 //BA.debugLineNum = 13;BA.debugLine="Private txttype As Spinner";
mostCurrent._txttype = new anywheresoftware.b4a.objects.SpinnerWrapper();
 //BA.debugLineNum = 14;BA.debugLine="Private txtmessage As EditText";
mostCurrent._txtmessage = new anywheresoftware.b4a.objects.EditTextWrapper();
 //BA.debugLineNum = 15;BA.debugLine="Private txttitle As EditText";
mostCurrent._txttitle = new anywheresoftware.b4a.objects.EditTextWrapper();
 //BA.debugLineNum = 16;BA.debugLine="Private Toast As MyToastMessageShow";
mostCurrent._vvvvvvvvv0 = new com.apps.manageropencart.mytoastmessageshow();
 //BA.debugLineNum = 17;BA.debugLine="Private progress As ShowProgress";
mostCurrent._vvvvvvvvv7 = new com.apps.manageropencart.showprogress();
 //BA.debugLineNum = 18;BA.debugLine="Dim sv As ScrollView";
mostCurrent._vvvvvvvvvv2 = new anywheresoftware.b4a.objects.ScrollViewWrapper();
 //BA.debugLineNum = 19;BA.debugLine="Dim ime As IME";
mostCurrent._vvvvvvvvvv1 = new anywheresoftware.b4a.objects.IME();
 //BA.debugLineNum = 20;BA.debugLine="Private lblheader1 As Label";
mostCurrent._lblheader1 = new anywheresoftware.b4a.objects.LabelWrapper();
 //BA.debugLineNum = 21;BA.debugLine="Private lblheader2 As Label";
mostCurrent._lblheader2 = new anywheresoftware.b4a.objects.LabelWrapper();
 //BA.debugLineNum = 22;BA.debugLine="Private btnsend As Button";
mostCurrent._btnsend = new anywheresoftware.b4a.objects.ButtonWrapper();
 //BA.debugLineNum = 23;BA.debugLine="Private btncancel As Button";
mostCurrent._btncancel = new anywheresoftware.b4a.objects.ButtonWrapper();
 //BA.debugLineNum = 24;BA.debugLine="Private lblbuttontext As Label";
mostCurrent._lblbuttontext = new anywheresoftware.b4a.objects.LabelWrapper();
 //BA.debugLineNum = 25;BA.debugLine="Private lblval As Label";
mostCurrent._lblval = new anywheresoftware.b4a.objects.LabelWrapper();
 //BA.debugLineNum = 26;BA.debugLine="Private lbltype As Label";
mostCurrent._lbltype = new anywheresoftware.b4a.objects.LabelWrapper();
 //BA.debugLineNum = 27;BA.debugLine="Private lblmessage As Label";
mostCurrent._lblmessage = new anywheresoftware.b4a.objects.LabelWrapper();
 //BA.debugLineNum = 28;BA.debugLine="Private lbltitle As Label";
mostCurrent._lbltitle = new anywheresoftware.b4a.objects.LabelWrapper();
 //BA.debugLineNum = 29;BA.debugLine="End Sub";
return "";
}
public static String  _jobdone(anywheresoftware.b4a.samples.httputils2.httpjob _job) throws Exception{
anywheresoftware.b4a.objects.collections.Map _data = null;
 //BA.debugLineNum = 148;BA.debugLine="Sub JobDone(Job As HttpJob)";
 //BA.debugLineNum = 150;BA.debugLine="progress.HideProgress";
mostCurrent._vvvvvvvvv7._vvvvvvvv0();
 //BA.debugLineNum = 151;BA.debugLine="sv.ScrollPosition = 0";
mostCurrent._vvvvvvvvvv2.setScrollPosition((int) (0));
 //BA.debugLineNum = 153;BA.debugLine="If Job.Success Then";
if (_job._success) { 
 //BA.debugLineNum = 154;BA.debugLine="If Job.JobName = \"send_push\" Then";
if ((_job._jobname).equals("send_push")) { 
 //BA.debugLineNum = 156;BA.debugLine="Dim data As Map";
_data = new anywheresoftware.b4a.objects.collections.Map();
 //BA.debugLineNum = 157;BA.debugLine="data = Library.Json2Map(Job.GetString)";
_data = mostCurrent._vvvvvvv6._vvvv5(mostCurrent.activityBA,_job._getstring());
 //BA.debugLineNum = 159;BA.debugLine="If data.Get(\"result\") > -1 Then";
if ((double)(BA.ObjectToNumber(_data.Get((Object)("result"))))>-1) { 
 //BA.debugLineNum = 160;BA.debugLine="Toast.ShowToastMessageShow(Library.GetStringRe";
mostCurrent._vvvvvvvvv0._vvvvvvvvv3(mostCurrent._vvvvvvv6._vvvv2(mostCurrent.activityBA,"sent_push").replace("0",BA.ObjectToString(_data.Get((Object)("result")))),(long) (2),anywheresoftware.b4a.keywords.Common.True);
 //BA.debugLineNum = 161;BA.debugLine="txtmessage.Text = \"\"";
mostCurrent._txtmessage.setText(BA.ObjectToCharSequence(""));
 //BA.debugLineNum = 162;BA.debugLine="txttitle.Text = \"\"";
mostCurrent._txttitle.setText(BA.ObjectToCharSequence(""));
 //BA.debugLineNum = 163;BA.debugLine="txttype.SelectedIndex = 0";
mostCurrent._txttype.setSelectedIndex((int) (0));
 //BA.debugLineNum = 164;BA.debugLine="txtval.Text = \"\"";
mostCurrent._txtval.setText(BA.ObjectToCharSequence(""));
 //BA.debugLineNum = 165;BA.debugLine="txtbuttontext.Text = \"\"";
mostCurrent._txtbuttontext.setText(BA.ObjectToCharSequence(""));
 }else {
 //BA.debugLineNum = 167;BA.debugLine="Toast.ShowToastMessageShow(Library.GetStringRe";
mostCurrent._vvvvvvvvv0._vvvvvvvvv3(mostCurrent._vvvvvvv6._vvvv2(mostCurrent.activityBA,"error_data"),(long) (0),anywheresoftware.b4a.keywords.Common.False);
 };
 };
 };
 //BA.debugLineNum = 173;BA.debugLine="End Sub";
return "";
}
public static String  _process_globals() throws Exception{
 //BA.debugLineNum = 6;BA.debugLine="Sub Process_Globals";
 //BA.debugLineNum = 8;BA.debugLine="End Sub";
return "";
}
public static String  _txtbuttontext_focuschanged(boolean _hasfocus) throws Exception{
 //BA.debugLineNum = 191;BA.debugLine="Sub txtbuttontext_FocusChanged (HasFocus As Boolea";
 //BA.debugLineNum = 192;BA.debugLine="sv.ScrollPosition = txtbuttontext.Top";
mostCurrent._vvvvvvvvvv2.setScrollPosition(mostCurrent._txtbuttontext.getTop());
 //BA.debugLineNum = 193;BA.debugLine="End Sub";
return "";
}
public static String  _txtmessage_focuschanged(boolean _hasfocus) throws Exception{
 //BA.debugLineNum = 183;BA.debugLine="Sub txtmessage_FocusChanged (HasFocus As Boolean)";
 //BA.debugLineNum = 184;BA.debugLine="sv.ScrollPosition = txtmessage.Top";
mostCurrent._vvvvvvvvvv2.setScrollPosition(mostCurrent._txtmessage.getTop());
 //BA.debugLineNum = 185;BA.debugLine="End Sub";
return "";
}
public static String  _txttitle_focuschanged(boolean _hasfocus) throws Exception{
 //BA.debugLineNum = 179;BA.debugLine="Sub txttitle_FocusChanged (HasFocus As Boolean)";
 //BA.debugLineNum = 180;BA.debugLine="sv.ScrollPosition = txttitle.Top";
mostCurrent._vvvvvvvvvv2.setScrollPosition(mostCurrent._txttitle.getTop());
 //BA.debugLineNum = 181;BA.debugLine="End Sub";
return "";
}
public static String  _txtval_focuschanged(boolean _hasfocus) throws Exception{
 //BA.debugLineNum = 187;BA.debugLine="Sub txtval_FocusChanged (HasFocus As Boolean)";
 //BA.debugLineNum = 188;BA.debugLine="sv.ScrollPosition = txtval.Top";
mostCurrent._vvvvvvvvvv2.setScrollPosition(mostCurrent._txtval.getTop());
 //BA.debugLineNum = 189;BA.debugLine="End Sub";
return "";
}
}
