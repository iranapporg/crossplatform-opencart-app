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
			processBA = new BA(this.getApplicationContext(), null, null, "com.apps.demo", "com.apps.demo.actlogin");
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
		activityBA = new BA(this, layout, processBA, "com.apps.demo", "com.apps.demo.actlogin");
        
        processBA.sharedProcessBA.activityBA = new java.lang.ref.WeakReference<BA>(activityBA);
        anywheresoftware.b4a.objects.ViewWrapper.lastId = 0;
        _activity = new ActivityWrapper(activityBA, "activity");
        anywheresoftware.b4a.Msgbox.isDismissing = false;
        if (BA.isShellModeRuntimeCheck(processBA)) {
			if (isFirst)
				processBA.raiseEvent2(null, true, "SHELL", false);
			processBA.raiseEvent2(null, true, "CREATE", true, "com.apps.demo.actlogin", processBA, activityBA, _activity, anywheresoftware.b4a.keywords.Common.Density, mostCurrent);
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
public static String _username = "";
public static String _password = "";
public anywheresoftware.b4a.objects.LabelWrapper _lblpb = null;
public anywheresoftware.b4a.objects.LabelWrapper _lbltitle = null;
public anywheresoftware.b4a.objects.ButtonWrapper _btnlogin = null;
public anywheresoftware.b4a.objects.PanelWrapper _pnlheader = null;
public anywheresoftware.b4a.objects.PanelWrapper _pnlloading = null;
public com.apps.demo.opencart _op1 = null;
public anywheresoftware.b4a.objects.LabelWrapper _lblforgot = null;
public com.apps.demo.mytoastmessageshow _mytoastmessageshow = null;
public anywheresoftware.b4a.objects.EditTextWrapper _txtusername = null;
public anywheresoftware.b4a.objects.EditTextWrapper _txtpassword = null;
public anywheresoftware.b4a.objects.LabelWrapper _lblregister = null;
public anywheresoftware.b4a.objects.ButtonWrapper _btnguest = null;
public anywheresoftware.b4a.objects.ButtonWrapper _btnsms = null;
public static String _basket = "";
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

public static void initializeProcessGlobals() {
             try {
                Class.forName(BA.applicationContext.getPackageName() + ".main").getMethod("initializeProcessGlobals").invoke(null, null);
            } catch (Exception e) {
                throw new RuntimeException(e);
            }
}
public static String  _activity_create(boolean _firsttime) throws Exception{
anywheresoftware.b4a.objects.drawable.ColorDrawable _cd = null;
 //BA.debugLineNum = 27;BA.debugLine="Sub Activity_Create(FirstTime As Boolean)";
 //BA.debugLineNum = 29;BA.debugLine="Activity.LoadLayout(\"frmlogin\")";
mostCurrent._activity.LoadLayout("frmlogin",mostCurrent.activityBA);
 //BA.debugLineNum = 30;BA.debugLine="MyToastMessageShow.Initialize(Activity)";
mostCurrent._mytoastmessageshow._initialize(mostCurrent.activityBA,(anywheresoftware.b4a.objects.PanelWrapper) anywheresoftware.b4a.AbsObjectWrapper.ConvertToWrapper(new anywheresoftware.b4a.objects.PanelWrapper(), (android.view.ViewGroup)(mostCurrent._activity.getObject())));
 //BA.debugLineNum = 31;BA.debugLine="Library.setLocalApp(Library.currLang)";
mostCurrent._library._setlocalapp(mostCurrent.activityBA,mostCurrent._library._currlang);
 //BA.debugLineNum = 33;BA.debugLine="Library.ChangeStatusColor";
mostCurrent._library._changestatuscolor(mostCurrent.activityBA);
 //BA.debugLineNum = 35;BA.debugLine="lbltitle.Text = Library.GetStringResourse(\"login\"";
mostCurrent._lbltitle.setText(BA.ObjectToCharSequence(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"login")));
 //BA.debugLineNum = 36;BA.debugLine="lblpb.Text = Library.GetStringResourse(\"loading\")";
mostCurrent._lblpb.setText(BA.ObjectToCharSequence(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"loading")));
 //BA.debugLineNum = 37;BA.debugLine="lblforgot.Text = Library.GetStringResourse(\"forgo";
mostCurrent._lblforgot.setText(BA.ObjectToCharSequence(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"forgot")));
 //BA.debugLineNum = 38;BA.debugLine="btnlogin.Text = Library.GetStringResourse(\"reques";
mostCurrent._btnlogin.setText(BA.ObjectToCharSequence(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"request_login")));
 //BA.debugLineNum = 39;BA.debugLine="btnsms.Text = Library.GetStringResourse(\"send_sms";
mostCurrent._btnsms.setText(BA.ObjectToCharSequence(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"send_sms")));
 //BA.debugLineNum = 40;BA.debugLine="btnsms.Background = Library.GetButtonState";
mostCurrent._btnsms.setBackground((android.graphics.drawable.Drawable)(mostCurrent._library._getbuttonstate(mostCurrent.activityBA).getObject()));
 //BA.debugLineNum = 41;BA.debugLine="lblregister.Text = Library.GetStringResourse(\"req";
mostCurrent._lblregister.setText(BA.ObjectToCharSequence(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"request_register")+" "+mostCurrent._library._getstringresourse(mostCurrent.activityBA,"app_title")));
 //BA.debugLineNum = 42;BA.debugLine="btnguest.Text  = Library.GetStringResourse(\"reuqu";
mostCurrent._btnguest.setText(BA.ObjectToCharSequence(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"reuquest_guest")));
 //BA.debugLineNum = 43;BA.debugLine="pnlheader.Color = Library.Theme_Header";
mostCurrent._pnlheader.setColor(mostCurrent._library._theme_header);
 //BA.debugLineNum = 44;BA.debugLine="btnlogin.Background = Library.GetButtonState";
mostCurrent._btnlogin.setBackground((android.graphics.drawable.Drawable)(mostCurrent._library._getbuttonstate(mostCurrent.activityBA).getObject()));
 //BA.debugLineNum = 45;BA.debugLine="txtusername.Hint = Library.GetStringResourse(\"lbl";
mostCurrent._txtusername.setHint(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"lblemail").replace(":",""));
 //BA.debugLineNum = 46;BA.debugLine="txtpassword.Hint = Library.GetStringResourse(\"lbl";
mostCurrent._txtpassword.setHint(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"lblpassword").replace(":",""));
 //BA.debugLineNum = 48;BA.debugLine="Library.EditTextIcon(txtusername,\"ic_menu_cc\")";
mostCurrent._library._edittexticon(mostCurrent.activityBA,mostCurrent._txtusername,"ic_menu_cc");
 //BA.debugLineNum = 49;BA.debugLine="Library.EditTextIcon(txtpassword,\"ic_menu_login\")";
mostCurrent._library._edittexticon(mostCurrent.activityBA,mostCurrent._txtpassword,"ic_menu_login");
 //BA.debugLineNum = 50;BA.debugLine="Library.UnderLineString(lblregister)";
mostCurrent._library._underlinestring(mostCurrent.activityBA,mostCurrent._lblregister);
 //BA.debugLineNum = 52;BA.debugLine="txtusername.InputType = 33";
mostCurrent._txtusername.setInputType((int) (33));
 //BA.debugLineNum = 54;BA.debugLine="If username.Length > 0 Then";
if (_username.length()>0) { 
 //BA.debugLineNum = 55;BA.debugLine="txtusername.Text = username";
mostCurrent._txtusername.setText(BA.ObjectToCharSequence(_username));
 //BA.debugLineNum = 56;BA.debugLine="txtpassword.Text = password";
mostCurrent._txtpassword.setText(BA.ObjectToCharSequence(_password));
 }else {
 //BA.debugLineNum = 58;BA.debugLine="txtusername.Text = Library.manager.GetString(\"us";
mostCurrent._txtusername.setText(BA.ObjectToCharSequence(mostCurrent._library._manager.GetString("username")));
 //BA.debugLineNum = 59;BA.debugLine="txtpassword.Text = Library.manager.GetString(\"pa";
mostCurrent._txtpassword.setText(BA.ObjectToCharSequence(mostCurrent._library._manager.GetString("password")));
 };
 //BA.debugLineNum = 62;BA.debugLine="op1.Initialize";
mostCurrent._op1._initialize(processBA);
 //BA.debugLineNum = 64;BA.debugLine="Dim cd As ColorDrawable";
_cd = new anywheresoftware.b4a.objects.drawable.ColorDrawable();
 //BA.debugLineNum = 65;BA.debugLine="cd.Initialize2(Library.ConvertHex2Int(Library.Get";
_cd.Initialize2((int)(Double.parseDouble(mostCurrent._library._converthex2int(mostCurrent.activityBA,mostCurrent._library._getstringresourse(mostCurrent.activityBA,"category_button")))),(int) (0),(int) (0),anywheresoftware.b4a.keywords.Common.Colors.Gray);
 //BA.debugLineNum = 66;BA.debugLine="btnlogin.Background = cd";
mostCurrent._btnlogin.setBackground((android.graphics.drawable.Drawable)(_cd.getObject()));
 //BA.debugLineNum = 68;BA.debugLine="btnsms.Visible = False";
mostCurrent._btnsms.setVisible(anywheresoftware.b4a.keywords.Common.False);
 //BA.debugLineNum = 70;BA.debugLine="Dim op1 As OpenCart";
mostCurrent._op1 = new com.apps.demo.opencart();
 //BA.debugLineNum = 71;BA.debugLine="op1.Initialize";
mostCurrent._op1._initialize(processBA);
 //BA.debugLineNum = 72;BA.debugLine="op1.Logout(Me,\"Logout_receive\")";
mostCurrent._op1._logout(actlogin.getObject(),"Logout_receive");
 //BA.debugLineNum = 74;BA.debugLine="If Library.Config.Get(\"show_gurest_register\") = F";
if ((mostCurrent._library._config.Get((Object)("show_gurest_register"))).equals((Object)(anywheresoftware.b4a.keywords.Common.False))) { 
 //BA.debugLineNum = 75;BA.debugLine="btnguest.Visible = False";
mostCurrent._btnguest.setVisible(anywheresoftware.b4a.keywords.Common.False);
 //BA.debugLineNum = 76;BA.debugLine="lblregister.Top = btnguest.Top - btnguest.Height";
mostCurrent._lblregister.setTop((int) (mostCurrent._btnguest.getTop()-mostCurrent._btnguest.getHeight()/(double)2));
 };
 //BA.debugLineNum = 79;BA.debugLine="End Sub";
return "";
}
public static boolean  _activity_keypress(int _keycode) throws Exception{
 //BA.debugLineNum = 296;BA.debugLine="Sub Activity_KeyPress (KeyCode As Int) As Boolean";
 //BA.debugLineNum = 298;BA.debugLine="If KeyCode = KeyCodes.KEYCODE_BACK Then";
if (_keycode==anywheresoftware.b4a.keywords.Common.KeyCodes.KEYCODE_BACK) { 
 //BA.debugLineNum = 299;BA.debugLine="Activity.Finish";
mostCurrent._activity.Finish();
 //BA.debugLineNum = 300;BA.debugLine="Return True";
if (true) return anywheresoftware.b4a.keywords.Common.True;
 };
 //BA.debugLineNum = 303;BA.debugLine="End Sub";
return false;
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
public static String  _btnguest_click() throws Exception{
 //BA.debugLineNum = 309;BA.debugLine="Sub btnguest_Click";
 //BA.debugLineNum = 310;BA.debugLine="actRegister.Guest = True";
mostCurrent._actregister._guest = anywheresoftware.b4a.keywords.Common.True;
 //BA.debugLineNum = 311;BA.debugLine="StartActivity(actRegister)";
anywheresoftware.b4a.keywords.Common.StartActivity(mostCurrent.activityBA,(Object)(mostCurrent._actregister.getObject()));
 //BA.debugLineNum = 312;BA.debugLine="End Sub";
return "";
}
public static String  _btnlogin_click() throws Exception{
anywheresoftware.b4a.objects.collections.Map _data = null;
anywheresoftware.b4a.objects.IME _ime = null;
 //BA.debugLineNum = 115;BA.debugLine="Sub btnlogin_Click";
 //BA.debugLineNum = 117;BA.debugLine="If Library.InternetState = False Then";
if (mostCurrent._library._internetstate(mostCurrent.activityBA)==anywheresoftware.b4a.keywords.Common.False) { 
 //BA.debugLineNum = 118;BA.debugLine="MyToastMessageShow.ShowToastMessageShow(Library.";
mostCurrent._mytoastmessageshow._showtoastmessageshow(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"error_net_details"),(long) (1.5),anywheresoftware.b4a.keywords.Common.False);
 //BA.debugLineNum = 119;BA.debugLine="Return";
if (true) return "";
 };
 //BA.debugLineNum = 122;BA.debugLine="Dim data As Map";
_data = new anywheresoftware.b4a.objects.collections.Map();
 //BA.debugLineNum = 123;BA.debugLine="data.Initialize";
_data.Initialize();
 //BA.debugLineNum = 125;BA.debugLine="If txtpassword.Text.Length < 5 Then";
if (mostCurrent._txtpassword.getText().length()<5) { 
 //BA.debugLineNum = 126;BA.debugLine="MyToastMessageShow.ShowToastMessageShow(Library.";
mostCurrent._mytoastmessageshow._showtoastmessageshow(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"error_password"),(long) (1.5),anywheresoftware.b4a.keywords.Common.False);
 //BA.debugLineNum = 127;BA.debugLine="Return";
if (true) return "";
 };
 //BA.debugLineNum = 130;BA.debugLine="data.Put(\"password\",txtpassword.Text)";
_data.Put((Object)("password"),(Object)(mostCurrent._txtpassword.getText()));
 //BA.debugLineNum = 132;BA.debugLine="If Library.ValidEmail(txtusername.Text) = False T";
if (mostCurrent._library._validemail(mostCurrent.activityBA,mostCurrent._txtusername.getText())==anywheresoftware.b4a.keywords.Common.False) { 
 //BA.debugLineNum = 133;BA.debugLine="MyToastMessageShow.ShowToastMessageShow(Library.";
mostCurrent._mytoastmessageshow._showtoastmessageshow(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"error_email"),(long) (1.5),anywheresoftware.b4a.keywords.Common.False);
 //BA.debugLineNum = 134;BA.debugLine="Return";
if (true) return "";
 };
 //BA.debugLineNum = 138;BA.debugLine="data.Put(\"email\",txtusername.Text)";
_data.Put((Object)("email"),(Object)(mostCurrent._txtusername.getText()));
 //BA.debugLineNum = 140;BA.debugLine="pnlloading.SetVisibleAnimated(500,True)";
mostCurrent._pnlloading.SetVisibleAnimated((int) (500),anywheresoftware.b4a.keywords.Common.True);
 //BA.debugLineNum = 142;BA.debugLine="Dim ime As IME";
_ime = new anywheresoftware.b4a.objects.IME();
 //BA.debugLineNum = 143;BA.debugLine="ime.Initialize(\"\")";
_ime.Initialize("");
 //BA.debugLineNum = 144;BA.debugLine="ime.HideKeyboard";
_ime.HideKeyboard(mostCurrent.activityBA);
 //BA.debugLineNum = 146;BA.debugLine="op1.Login(Me,\"login_receive\",data.Get(\"email\"),da";
mostCurrent._op1._login(actlogin.getObject(),"login_receive",BA.ObjectToString(_data.Get((Object)("email"))),BA.ObjectToString(_data.Get((Object)("password"))));
 //BA.debugLineNum = 148;BA.debugLine="End Sub";
return "";
}
public static String  _btnsms_click() throws Exception{
com.apps.demo.opencart _op = null;
 //BA.debugLineNum = 314;BA.debugLine="Sub btnsms_Click";
 //BA.debugLineNum = 315;BA.debugLine="pnlloading.SetVisibleAnimated(500,True)";
mostCurrent._pnlloading.SetVisibleAnimated((int) (500),anywheresoftware.b4a.keywords.Common.True);
 //BA.debugLineNum = 316;BA.debugLine="Dim op As OpenCart";
_op = new com.apps.demo.opencart();
 //BA.debugLineNum = 317;BA.debugLine="op.Initialize";
_op._initialize(processBA);
 //BA.debugLineNum = 318;BA.debugLine="op.GetCarts(Me,\"Carts_receive\")";
_op._getcarts(actlogin.getObject(),"Carts_receive");
 //BA.debugLineNum = 319;BA.debugLine="End Sub";
return "";
}
public static String  _carts_receive(anywheresoftware.b4a.objects.collections.Map _res,String _cat) throws Exception{
anywheresoftware.b4a.objects.collections.List _l1 = null;
anywheresoftware.b4a.objects.collections.Map _images = null;
String _rs = "";
int _i = 0;
anywheresoftware.b4a.objects.collections.Map _temp = null;
int _qu = 0;
 //BA.debugLineNum = 321;BA.debugLine="Sub Carts_receive(res As Map,cat As String)";
 //BA.debugLineNum = 323;BA.debugLine="pnlloading.SetVisibleAnimated(600,False)";
mostCurrent._pnlloading.SetVisibleAnimated((int) (600),anywheresoftware.b4a.keywords.Common.False);
 //BA.debugLineNum = 325;BA.debugLine="If res.IsInitialized = False Then";
if (_res.IsInitialized()==anywheresoftware.b4a.keywords.Common.False) { 
 //BA.debugLineNum = 326;BA.debugLine="ToastMessageShow(Library.GetStringResourse(\"no_c";
anywheresoftware.b4a.keywords.Common.ToastMessageShow(BA.ObjectToCharSequence(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"no_cart")),anywheresoftware.b4a.keywords.Common.False);
 //BA.debugLineNum = 327;BA.debugLine="Activity.Finish";
mostCurrent._activity.Finish();
 //BA.debugLineNum = 328;BA.debugLine="Return";
if (true) return "";
 };
 //BA.debugLineNum = 331;BA.debugLine="If res.ContainsKey(\"products\") Then";
if (_res.ContainsKey((Object)("products"))) { 
 //BA.debugLineNum = 333;BA.debugLine="Dim l1 As List";
_l1 = new anywheresoftware.b4a.objects.collections.List();
 //BA.debugLineNum = 334;BA.debugLine="l1.Initialize";
_l1.Initialize();
 //BA.debugLineNum = 335;BA.debugLine="l1 = res.Get(\"products\")";
_l1.setObject((java.util.List)(_res.Get((Object)("products"))));
 //BA.debugLineNum = 337;BA.debugLine="Dim images As Map";
_images = new anywheresoftware.b4a.objects.collections.Map();
 //BA.debugLineNum = 338;BA.debugLine="images.Initialize";
_images.Initialize();
 //BA.debugLineNum = 340;BA.debugLine="Dim rs As String";
_rs = "";
 //BA.debugLineNum = 341;BA.debugLine="rs = Library.GetStringResourse(\"order_title\").Re";
_rs = mostCurrent._library._getstringresourse(mostCurrent.activityBA,"order_title").replace("ها","").replace("s","")+anywheresoftware.b4a.keywords.Common.CRLF;
 //BA.debugLineNum = 343;BA.debugLine="For i = 0 To l1.Size - 1";
{
final int step15 = 1;
final int limit15 = (int) (_l1.getSize()-1);
for (_i = (int) (0) ; (step15 > 0 && _i <= limit15) || (step15 < 0 && _i >= limit15); _i = ((int)(0 + _i + step15)) ) {
 //BA.debugLineNum = 345;BA.debugLine="Dim temp As Map";
_temp = new anywheresoftware.b4a.objects.collections.Map();
 //BA.debugLineNum = 346;BA.debugLine="temp = l1.Get(i)";
_temp.setObject((anywheresoftware.b4a.objects.collections.Map.MyMap)(_l1.Get(_i)));
 //BA.debugLineNum = 348;BA.debugLine="Dim qu As Int";
_qu = 0;
 //BA.debugLineNum = 349;BA.debugLine="qu = temp.Get(\"quantity\")";
_qu = (int)(BA.ObjectToNumber(_temp.Get((Object)("quantity"))));
 //BA.debugLineNum = 351;BA.debugLine="rs = rs & temp.Get(\"name\") & \" ( \" & qu & \" \" &";
_rs = _rs+BA.ObjectToString(_temp.Get((Object)("name")))+" ( "+BA.NumberToString(_qu)+" "+mostCurrent._library._getstringresourse(mostCurrent.activityBA,"adad")+" )"+anywheresoftware.b4a.keywords.Common.CRLF;
 }
};
 //BA.debugLineNum = 356;BA.debugLine="Basket = rs";
mostCurrent._basket = _rs;
 //BA.debugLineNum = 359;BA.debugLine="actSMS.Basket = Basket";
mostCurrent._actsms._basket = mostCurrent._basket;
 //BA.debugLineNum = 360;BA.debugLine="StartActivity(actSMS)";
anywheresoftware.b4a.keywords.Common.StartActivity(mostCurrent.activityBA,(Object)(mostCurrent._actsms.getObject()));
 };
 //BA.debugLineNum = 365;BA.debugLine="End Sub";
return "";
}
public static String  _forgot_receive(anywheresoftware.b4a.objects.collections.Map _res,String _cat) throws Exception{
anywheresoftware.b4a.objects.collections.List _rs = null;
String _err = "";
int _i = 0;
 //BA.debugLineNum = 268;BA.debugLine="Sub forgot_receive(res As Map,cat As String)";
 //BA.debugLineNum = 270;BA.debugLine="pnlloading.SetVisibleAnimated(500,False)";
mostCurrent._pnlloading.SetVisibleAnimated((int) (500),anywheresoftware.b4a.keywords.Common.False);
 //BA.debugLineNum = 272;BA.debugLine="If res.ContainsKey(\"success\") Then";
if (_res.ContainsKey((Object)("success"))) { 
 //BA.debugLineNum = 273;BA.debugLine="If res.Get(\"success\") = True Then";
if ((_res.Get((Object)("success"))).equals((Object)(anywheresoftware.b4a.keywords.Common.True))) { 
 //BA.debugLineNum = 274;BA.debugLine="MyToastMessageShow.ShowToastMessageShow(Library";
mostCurrent._mytoastmessageshow._showtoastmessageshow(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"send_forgot"),(long) (1.5),anywheresoftware.b4a.keywords.Common.True);
 //BA.debugLineNum = 275;BA.debugLine="Return";
if (true) return "";
 };
 };
 //BA.debugLineNum = 279;BA.debugLine="If res.ContainsKey(\"error\") Then";
if (_res.ContainsKey((Object)("error"))) { 
 //BA.debugLineNum = 281;BA.debugLine="Dim rs As List";
_rs = new anywheresoftware.b4a.objects.collections.List();
 //BA.debugLineNum = 282;BA.debugLine="rs = res.Get(\"error\")";
_rs.setObject((java.util.List)(_res.Get((Object)("error"))));
 //BA.debugLineNum = 284;BA.debugLine="Dim err As String";
_err = "";
 //BA.debugLineNum = 286;BA.debugLine="For i = 0 To rs.Size - 1";
{
final int step12 = 1;
final int limit12 = (int) (_rs.getSize()-1);
for (_i = (int) (0) ; (step12 > 0 && _i <= limit12) || (step12 < 0 && _i >= limit12); _i = ((int)(0 + _i + step12)) ) {
 //BA.debugLineNum = 287;BA.debugLine="err = err & rs.Get(i) & CRLF";
_err = _err+BA.ObjectToString(_rs.Get(_i))+anywheresoftware.b4a.keywords.Common.CRLF;
 }
};
 //BA.debugLineNum = 290;BA.debugLine="Msgbox(err,Library.GetStringResourse(\"alert\"))";
anywheresoftware.b4a.keywords.Common.Msgbox(BA.ObjectToCharSequence(_err),BA.ObjectToCharSequence(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"alert")),mostCurrent.activityBA);
 };
 //BA.debugLineNum = 294;BA.debugLine="End Sub";
return "";
}
public static String  _globals() throws Exception{
 //BA.debugLineNum = 10;BA.debugLine="Sub Globals";
 //BA.debugLineNum = 11;BA.debugLine="Private lblpb As Label";
mostCurrent._lblpb = new anywheresoftware.b4a.objects.LabelWrapper();
 //BA.debugLineNum = 12;BA.debugLine="Private lbltitle As Label";
mostCurrent._lbltitle = new anywheresoftware.b4a.objects.LabelWrapper();
 //BA.debugLineNum = 13;BA.debugLine="Private btnlogin As Button";
mostCurrent._btnlogin = new anywheresoftware.b4a.objects.ButtonWrapper();
 //BA.debugLineNum = 14;BA.debugLine="Private pnlheader As Panel";
mostCurrent._pnlheader = new anywheresoftware.b4a.objects.PanelWrapper();
 //BA.debugLineNum = 15;BA.debugLine="Private pnlloading As Panel";
mostCurrent._pnlloading = new anywheresoftware.b4a.objects.PanelWrapper();
 //BA.debugLineNum = 16;BA.debugLine="Private op1 As OpenCart";
mostCurrent._op1 = new com.apps.demo.opencart();
 //BA.debugLineNum = 17;BA.debugLine="Private lblforgot As Label";
mostCurrent._lblforgot = new anywheresoftware.b4a.objects.LabelWrapper();
 //BA.debugLineNum = 18;BA.debugLine="Private MyToastMessageShow As MyToastMessageShow";
mostCurrent._mytoastmessageshow = new com.apps.demo.mytoastmessageshow();
 //BA.debugLineNum = 19;BA.debugLine="Private txtusername As EditText";
mostCurrent._txtusername = new anywheresoftware.b4a.objects.EditTextWrapper();
 //BA.debugLineNum = 20;BA.debugLine="Private txtpassword As EditText";
mostCurrent._txtpassword = new anywheresoftware.b4a.objects.EditTextWrapper();
 //BA.debugLineNum = 21;BA.debugLine="Private lblregister As Label";
mostCurrent._lblregister = new anywheresoftware.b4a.objects.LabelWrapper();
 //BA.debugLineNum = 22;BA.debugLine="Private btnguest As Button";
mostCurrent._btnguest = new anywheresoftware.b4a.objects.ButtonWrapper();
 //BA.debugLineNum = 23;BA.debugLine="Private btnsms As Button";
mostCurrent._btnsms = new anywheresoftware.b4a.objects.ButtonWrapper();
 //BA.debugLineNum = 24;BA.debugLine="Private Basket As String";
mostCurrent._basket = "";
 //BA.debugLineNum = 25;BA.debugLine="End Sub";
return "";
}
public static String  _lblforgot_click() throws Exception{
anywheresoftware.b4a.agraham.dialogs.InputDialog _in1 = null;
int _res = 0;
com.apps.demo.opencart _op2 = null;
 //BA.debugLineNum = 248;BA.debugLine="Sub lblforgot_Click";
 //BA.debugLineNum = 250;BA.debugLine="Dim in1 As InputDialog";
_in1 = new anywheresoftware.b4a.agraham.dialogs.InputDialog();
 //BA.debugLineNum = 251;BA.debugLine="Dim res As Int";
_res = 0;
 //BA.debugLineNum = 252;BA.debugLine="res = in1.Show(Library.GetStringResourse(\"error_e";
_res = _in1.Show(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"error_email"),mostCurrent._library._getstringresourse(mostCurrent.activityBA,"alert"),mostCurrent._library._getstringresourse(mostCurrent.activityBA,"send_pass"),mostCurrent._library._getstringresourse(mostCurrent.activityBA,"cancel"),"",mostCurrent.activityBA,(android.graphics.Bitmap)(anywheresoftware.b4a.keywords.Common.Null));
 //BA.debugLineNum = 254;BA.debugLine="If res = DialogResponse.POSITIVE Then";
if (_res==anywheresoftware.b4a.keywords.Common.DialogResponse.POSITIVE) { 
 //BA.debugLineNum = 255;BA.debugLine="If in1.Input.IndexOf(\"@\") = -1 Then";
if (_in1.getInput().indexOf("@")==-1) { 
 //BA.debugLineNum = 256;BA.debugLine="MyToastMessageShow.ShowToastMessageShow(Library";
mostCurrent._mytoastmessageshow._showtoastmessageshow(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"error_email"),(long) (1.5),anywheresoftware.b4a.keywords.Common.False);
 //BA.debugLineNum = 257;BA.debugLine="Return";
if (true) return "";
 }else {
 //BA.debugLineNum = 259;BA.debugLine="Dim op2 As OpenCart";
_op2 = new com.apps.demo.opencart();
 //BA.debugLineNum = 260;BA.debugLine="op2.Initialize";
_op2._initialize(processBA);
 //BA.debugLineNum = 261;BA.debugLine="pnlloading.SetVisibleAnimated(500,True)";
mostCurrent._pnlloading.SetVisibleAnimated((int) (500),anywheresoftware.b4a.keywords.Common.True);
 //BA.debugLineNum = 262;BA.debugLine="op2.ForgotPassword(Me,\"forgot_receive\",in1.Inpu";
_op2._forgotpassword(actlogin.getObject(),"forgot_receive",_in1.getInput());
 };
 };
 //BA.debugLineNum = 266;BA.debugLine="End Sub";
return "";
}
public static String  _lblregister_click() throws Exception{
 //BA.debugLineNum = 305;BA.debugLine="Sub lblregister_Click";
 //BA.debugLineNum = 306;BA.debugLine="StartActivity(actRegister)";
anywheresoftware.b4a.keywords.Common.StartActivity(mostCurrent.activityBA,(Object)(mostCurrent._actregister.getObject()));
 //BA.debugLineNum = 307;BA.debugLine="End Sub";
return "";
}
public static String  _login_receive(anywheresoftware.b4a.objects.collections.Map _res,String _cat) throws Exception{
anywheresoftware.b4a.objects.collections.Map _rs = null;
String _err = "";
int _i = 0;
anywheresoftware.b4a.objects.collections.Map _data = null;
String _need_to_login_site = "";
 //BA.debugLineNum = 150;BA.debugLine="Sub login_receive(res As Map,cat As String)";
 //BA.debugLineNum = 152;BA.debugLine="pnlloading.SetVisibleAnimated(500,False)";
mostCurrent._pnlloading.SetVisibleAnimated((int) (500),anywheresoftware.b4a.keywords.Common.False);
 //BA.debugLineNum = 154;BA.debugLine="If res = Null Then";
if (_res== null) { 
 //BA.debugLineNum = 155;BA.debugLine="MyToastMessageShow.ShowToastMessageShow(Library.";
mostCurrent._mytoastmessageshow._showtoastmessageshow(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"error_net_title"),(long) (1.5),anywheresoftware.b4a.keywords.Common.False);
 //BA.debugLineNum = 156;BA.debugLine="Return";
if (true) return "";
 };
 //BA.debugLineNum = 159;BA.debugLine="If res.IsInitialized = False Then";
if (_res.IsInitialized()==anywheresoftware.b4a.keywords.Common.False) { 
 //BA.debugLineNum = 160;BA.debugLine="MyToastMessageShow.ShowToastMessageShow(Library.";
mostCurrent._mytoastmessageshow._showtoastmessageshow(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"error_net_title"),(long) (1.5),anywheresoftware.b4a.keywords.Common.False);
 //BA.debugLineNum = 161;BA.debugLine="Return";
if (true) return "";
 };
 //BA.debugLineNum = 164;BA.debugLine="If res.ContainsKey(\"error\") Then";
if (_res.ContainsKey((Object)("error"))) { 
 //BA.debugLineNum = 166;BA.debugLine="If res.Get(\"error\") = \"User already is logged\" T";
if ((_res.Get((Object)("error"))).equals((Object)("User already is logged"))) { 
 //BA.debugLineNum = 168;BA.debugLine="Return";
if (true) return "";
 };
 //BA.debugLineNum = 171;BA.debugLine="Dim rs As Map";
_rs = new anywheresoftware.b4a.objects.collections.Map();
 //BA.debugLineNum = 172;BA.debugLine="rs = res.Get(\"error\")";
_rs.setObject((anywheresoftware.b4a.objects.collections.Map.MyMap)(_res.Get((Object)("error"))));
 //BA.debugLineNum = 174;BA.debugLine="Dim err As String";
_err = "";
 //BA.debugLineNum = 176;BA.debugLine="For i = 0 To rs.Size - 1";
{
final int step17 = 1;
final int limit17 = (int) (_rs.getSize()-1);
for (_i = (int) (0) ; (step17 > 0 && _i <= limit17) || (step17 < 0 && _i >= limit17); _i = ((int)(0 + _i + step17)) ) {
 //BA.debugLineNum = 177;BA.debugLine="err = err & rs.GetValueAt(i) & CRLF";
_err = _err+BA.ObjectToString(_rs.GetValueAt(_i))+anywheresoftware.b4a.keywords.Common.CRLF;
 }
};
 //BA.debugLineNum = 180;BA.debugLine="Msgbox(err,Library.GetStringResourse(\"alert\"))";
anywheresoftware.b4a.keywords.Common.Msgbox(BA.ObjectToCharSequence(_err),BA.ObjectToCharSequence(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"alert")),mostCurrent.activityBA);
 }else {
 //BA.debugLineNum = 184;BA.debugLine="Dim data As Map";
_data = new anywheresoftware.b4a.objects.collections.Map();
 //BA.debugLineNum = 185;BA.debugLine="data = res.Get(\"data\")";
_data.setObject((anywheresoftware.b4a.objects.collections.Map.MyMap)(_res.Get((Object)("data"))));
 //BA.debugLineNum = 187;BA.debugLine="Dim need_to_login_site As String";
_need_to_login_site = "";
 //BA.debugLineNum = 188;BA.debugLine="need_to_login_site = Library.GetStringResourse(\"";
_need_to_login_site = mostCurrent._library._getstringresourse(mostCurrent.activityBA,"need_to_login_site").toLowerCase();
 //BA.debugLineNum = 190;BA.debugLine="Library.manager.SetString(\"username\",txtusername";
mostCurrent._library._manager.SetString("username",mostCurrent._txtusername.getText());
 //BA.debugLineNum = 191;BA.debugLine="Library.manager.SetString(\"password\",txtpassword";
mostCurrent._library._manager.SetString("password",mostCurrent._txtpassword.getText());
 //BA.debugLineNum = 193;BA.debugLine="If res.ContainsKey(\"data\") = False Then";
if (_res.ContainsKey((Object)("data"))==anywheresoftware.b4a.keywords.Common.False) { 
 //BA.debugLineNum = 195;BA.debugLine="Library.loginDetails.Initialize";
mostCurrent._library._logindetails.Initialize();
 //BA.debugLineNum = 196;BA.debugLine="Library.loginDetails.Put(\"address_id\",\"1\")";
mostCurrent._library._logindetails.Put((Object)("address_id"),(Object)("1"));
 //BA.debugLineNum = 197;BA.debugLine="Library.loginDetails.Put(\"login\",True)";
mostCurrent._library._logindetails.Put((Object)("login"),(Object)(anywheresoftware.b4a.keywords.Common.True));
 //BA.debugLineNum = 199;BA.debugLine="Library.loginDetails.put(\"expire\",DateTime.Now";
mostCurrent._library._logindetails.Put((Object)("expire"),(Object)(anywheresoftware.b4a.keywords.Common.DateTime.getNow()));
 //BA.debugLineNum = 201;BA.debugLine="If Library.GuestLogin.IsInitialized Then";
if (mostCurrent._library._guestlogin.IsInitialized()) { 
 //BA.debugLineNum = 202;BA.debugLine="Library.GuestLogin.Put(\"login\",False)";
mostCurrent._library._guestlogin.Put((Object)("login"),(Object)(anywheresoftware.b4a.keywords.Common.False));
 };
 //BA.debugLineNum = 205;BA.debugLine="ToastMessageShow(Library.GetStringResourse(\"lo";
anywheresoftware.b4a.keywords.Common.ToastMessageShow(BA.ObjectToCharSequence(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"login_success")),anywheresoftware.b4a.keywords.Common.False);
 //BA.debugLineNum = 207;BA.debugLine="Activity.Finish";
mostCurrent._activity.Finish();
 //BA.debugLineNum = 209;BA.debugLine="If need_to_login_site = \"1\" Or need_to_login_s";
if ((_need_to_login_site).equals("1") || (_need_to_login_site).equals("on")) { 
 //BA.debugLineNum = 210;BA.debugLine="Library.CacheSystem.ClearCache";
mostCurrent._library._cachesystem._clearcache();
 //BA.debugLineNum = 211;BA.debugLine="StartActivity(Main)";
anywheresoftware.b4a.keywords.Common.StartActivity(mostCurrent.activityBA,(Object)(mostCurrent._main.getObject()));
 };
 //BA.debugLineNum = 214;BA.debugLine="Return";
if (true) return "";
 };
 //BA.debugLineNum = 217;BA.debugLine="If Library.loginDetails.IsInitialized = False Th";
if (mostCurrent._library._logindetails.IsInitialized()==anywheresoftware.b4a.keywords.Common.False) { 
mostCurrent._library._logindetails.Initialize();};
 //BA.debugLineNum = 219;BA.debugLine="Try";
try { //BA.debugLineNum = 220;BA.debugLine="Library.loginDetails = data";
mostCurrent._library._logindetails = _data;
 //BA.debugLineNum = 221;BA.debugLine="Library.loginDetails.Put(\"address_id\",data.Get(";
mostCurrent._library._logindetails.Put((Object)("address_id"),_data.Get((Object)("address_id")));
 //BA.debugLineNum = 222;BA.debugLine="Library.loginDetails.Put(\"login\",True)";
mostCurrent._library._logindetails.Put((Object)("login"),(Object)(anywheresoftware.b4a.keywords.Common.True));
 //BA.debugLineNum = 223;BA.debugLine="Library.loginDetails.put(\"session\",data.Get(\"se";
mostCurrent._library._logindetails.Put((Object)("session"),_data.Get((Object)("session")));
 //BA.debugLineNum = 224;BA.debugLine="Library.loginDetails.put(\"expire\",DateTime.Now)";
mostCurrent._library._logindetails.Put((Object)("expire"),(Object)(anywheresoftware.b4a.keywords.Common.DateTime.getNow()));
 } 
       catch (Exception e52) {
			processBA.setLastException(e52); };
 //BA.debugLineNum = 229;BA.debugLine="Library.ChoosenAddress = 0";
mostCurrent._library._choosenaddress = (int) (0);
 //BA.debugLineNum = 231;BA.debugLine="If Library.GuestLogin.IsInitialized Then";
if (mostCurrent._library._guestlogin.IsInitialized()) { 
 //BA.debugLineNum = 232;BA.debugLine="Library.GuestLogin.Put(\"login\",False)";
mostCurrent._library._guestlogin.Put((Object)("login"),(Object)(anywheresoftware.b4a.keywords.Common.False));
 };
 //BA.debugLineNum = 235;BA.debugLine="ToastMessageShow(Library.GetStringResourse(\"logi";
anywheresoftware.b4a.keywords.Common.ToastMessageShow(BA.ObjectToCharSequence(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"login_success")),anywheresoftware.b4a.keywords.Common.False);
 //BA.debugLineNum = 237;BA.debugLine="Activity.Finish";
mostCurrent._activity.Finish();
 //BA.debugLineNum = 239;BA.debugLine="If need_to_login_site = \"1\" Or need_to_login_sit";
if ((_need_to_login_site).equals("1") || (_need_to_login_site).equals("on")) { 
 //BA.debugLineNum = 240;BA.debugLine="Library.CacheSystem.ClearCache";
mostCurrent._library._cachesystem._clearcache();
 //BA.debugLineNum = 241;BA.debugLine="CallSubDelayed(actMenu,\"RefreshData\")";
anywheresoftware.b4a.keywords.Common.CallSubDelayed(mostCurrent.activityBA,(Object)(mostCurrent._actmenu.getObject()),"RefreshData");
 };
 };
 //BA.debugLineNum = 246;BA.debugLine="End Sub";
return "";
}
public static String  _logout_receive(anywheresoftware.b4a.objects.collections.Map _res,String _cat) throws Exception{
 //BA.debugLineNum = 81;BA.debugLine="Sub Logout_receive(res As Map,cat As String)";
 //BA.debugLineNum = 83;BA.debugLine="btnsms.BringToFront";
mostCurrent._btnsms.BringToFront();
 //BA.debugLineNum = 84;BA.debugLine="btnsms.Visible = True";
mostCurrent._btnsms.setVisible(anywheresoftware.b4a.keywords.Common.True);
 //BA.debugLineNum = 86;BA.debugLine="If res = Null Then Return";
if (_res== null) { 
if (true) return "";};
 //BA.debugLineNum = 87;BA.debugLine="If res.IsInitialized = False Then Return";
if (_res.IsInitialized()==anywheresoftware.b4a.keywords.Common.False) { 
if (true) return "";};
 //BA.debugLineNum = 89;BA.debugLine="If res.ContainsKey(\"success\") Then";
if (_res.ContainsKey((Object)("success"))) { 
 //BA.debugLineNum = 91;BA.debugLine="If res.Get(\"success\") = True Then";
if ((_res.Get((Object)("success"))).equals((Object)(anywheresoftware.b4a.keywords.Common.True))) { 
 //BA.debugLineNum = 92;BA.debugLine="If Library.loginDetails.IsInitialized Then";
if (mostCurrent._library._logindetails.IsInitialized()) { 
 //BA.debugLineNum = 93;BA.debugLine="Library.loginDetails.Put(\"login\",False)";
mostCurrent._library._logindetails.Put((Object)("login"),(Object)(anywheresoftware.b4a.keywords.Common.False));
 };
 }else {
 //BA.debugLineNum = 96;BA.debugLine="MyToastMessageShow.ShowToastMessageShow(Library";
mostCurrent._mytoastmessageshow._showtoastmessageshow(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"error_net_title"),(long) (1.5),anywheresoftware.b4a.keywords.Common.False);
 };
 };
 //BA.debugLineNum = 101;BA.debugLine="End Sub";
return "";
}
public static String  _process_globals() throws Exception{
 //BA.debugLineNum = 6;BA.debugLine="Sub Process_Globals";
 //BA.debugLineNum = 7;BA.debugLine="Public username,password As String";
_username = "";
_password = "";
 //BA.debugLineNum = 8;BA.debugLine="End Sub";
return "";
}
}
