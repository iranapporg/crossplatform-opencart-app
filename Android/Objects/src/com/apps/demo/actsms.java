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

public class actsms extends Activity implements B4AActivity{
	public static actsms mostCurrent;
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
			processBA = new BA(this.getApplicationContext(), null, null, "com.apps.demo", "com.apps.demo.actsms");
			processBA.loadHtSubs(this.getClass());
	        float deviceScale = getApplicationContext().getResources().getDisplayMetrics().density;
	        BALayout.setDeviceScale(deviceScale);
            
		}
		else if (previousOne != null) {
			Activity p = previousOne.get();
			if (p != null && p != this) {
                BA.LogInfo("Killing previous instance (actsms).");
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
		activityBA = new BA(this, layout, processBA, "com.apps.demo", "com.apps.demo.actsms");
        
        processBA.sharedProcessBA.activityBA = new java.lang.ref.WeakReference<BA>(activityBA);
        anywheresoftware.b4a.objects.ViewWrapper.lastId = 0;
        _activity = new ActivityWrapper(activityBA, "activity");
        anywheresoftware.b4a.Msgbox.isDismissing = false;
        if (BA.isShellModeRuntimeCheck(processBA)) {
			if (isFirst)
				processBA.raiseEvent2(null, true, "SHELL", false);
			processBA.raiseEvent2(null, true, "CREATE", true, "com.apps.demo.actsms", processBA, activityBA, _activity, anywheresoftware.b4a.keywords.Common.Density, mostCurrent);
			_activity.reinitializeForShell(activityBA, "activity");
		}
        initializeProcessGlobals();		
        initializeGlobals();
        
        BA.LogInfo("** Activity (actsms) Create, isFirst = " + isFirst + " **");
        processBA.raiseEvent2(null, true, "activity_create", false, isFirst);
		isFirst = false;
		if (this != mostCurrent)
			return;
        processBA.setActivityPaused(false);
        BA.LogInfo("** Activity (actsms) Resume **");
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
		return actsms.class;
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
        BA.LogInfo("** Activity (actsms) Pause, UserClosed = " + activityBA.activity.isFinishing() + " **");
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
            BA.LogInfo("** Activity (actsms) Resume **");
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
public static String _basket = "";
public anywheresoftware.b4a.objects.EditTextWrapper _txtname = null;
public anywheresoftware.b4a.objects.ButtonWrapper _btnsend = null;
public anywheresoftware.b4a.objects.LabelWrapper _lblphone = null;
public anywheresoftware.b4a.objects.LabelWrapper _lbltitle = null;
public com.apps.demo.mytoastmessageshow _mytoastmessageshow1 = null;
public anywheresoftware.b4a.objects.EditTextWrapper _txtcomment = null;
public anywheresoftware.b4a.objects.LabelWrapper _lblcomment = null;
public anywheresoftware.b4a.objects.ButtonWrapper _btnproduts = null;
public anywheresoftware.b4a.objects.PanelWrapper _pnlheader = null;
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
public com.apps.demo.actpicture _actpicture = null;
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
 //BA.debugLineNum = 22;BA.debugLine="Sub Activity_Create(FirstTime As Boolean)";
 //BA.debugLineNum = 24;BA.debugLine="Activity.LoadLayout(\"frmsms\")";
mostCurrent._activity.LoadLayout("frmsms",mostCurrent.activityBA);
 //BA.debugLineNum = 25;BA.debugLine="MyToastMessageShow1.Initialize(Activity)";
mostCurrent._mytoastmessageshow1._initialize(mostCurrent.activityBA,(anywheresoftware.b4a.objects.PanelWrapper) anywheresoftware.b4a.AbsObjectWrapper.ConvertToWrapper(new anywheresoftware.b4a.objects.PanelWrapper(), (android.view.ViewGroup)(mostCurrent._activity.getObject())));
 //BA.debugLineNum = 26;BA.debugLine="lbltitle.Text = Library.GetStringResourse(\"send_s";
mostCurrent._lbltitle.setText(BA.ObjectToCharSequence(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"send_sms")));
 //BA.debugLineNum = 27;BA.debugLine="txtname.Hint = Library.GetStringResourse(\"sms_nam";
mostCurrent._txtname.setHint(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"sms_name"));
 //BA.debugLineNum = 28;BA.debugLine="txtcomment.Hint = Library.GetStringResourse(\"sms_";
mostCurrent._txtcomment.setHint(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"sms_order_comment"));
 //BA.debugLineNum = 30;BA.debugLine="Library.ChangeStatusColor";
mostCurrent._library._changestatuscolor(mostCurrent.activityBA);
 //BA.debugLineNum = 32;BA.debugLine="pnlheader.Color = Library.Theme_Header";
mostCurrent._pnlheader.setColor(mostCurrent._library._theme_header);
 //BA.debugLineNum = 34;BA.debugLine="btnsend.Text = Library.GetStringResourse(\"send_re";
mostCurrent._btnsend.setText(BA.ObjectToCharSequence(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"send_request")));
 //BA.debugLineNum = 35;BA.debugLine="btnproduts.Text = Library.GetStringResourse(\"my_p";
mostCurrent._btnproduts.setText(BA.ObjectToCharSequence(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"my_product")));
 //BA.debugLineNum = 36;BA.debugLine="txtname.Gravity = Library.GetStringResourse(\"dire";
mostCurrent._txtname.setGravity((int)(Double.parseDouble(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"direction"))));
 //BA.debugLineNum = 37;BA.debugLine="txtcomment.Gravity = Library.GetStringResourse(\"d";
mostCurrent._txtcomment.setGravity((int)(Double.parseDouble(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"direction"))));
 //BA.debugLineNum = 38;BA.debugLine="lblphone.Text = Library.GetStringResourse(\"sms_co";
mostCurrent._lblphone.setText(BA.ObjectToCharSequence(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"sms_contact")+" "+mostCurrent._library._getstringresourse(mostCurrent.activityBA,"shop_phone")));
 //BA.debugLineNum = 39;BA.debugLine="lblcomment.Text = Library.GetStringResourse(\"sms_";
mostCurrent._lblcomment.setText(BA.ObjectToCharSequence(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"sms_help")));
 //BA.debugLineNum = 41;BA.debugLine="Library.EditTextIcon(txtname,\"ic_menu_edit\")";
mostCurrent._library._edittexticon(mostCurrent.activityBA,mostCurrent._txtname,"ic_menu_edit");
 //BA.debugLineNum = 42;BA.debugLine="Library.EditTextIcon(txtcomment,\"ic_menu_edit\")";
mostCurrent._library._edittexticon(mostCurrent.activityBA,mostCurrent._txtcomment,"ic_menu_edit");
 //BA.debugLineNum = 44;BA.debugLine="Dim cd As ColorDrawable";
_cd = new anywheresoftware.b4a.objects.drawable.ColorDrawable();
 //BA.debugLineNum = 45;BA.debugLine="cd.Initialize2(Library.ConvertHex2Int(Library.Get";
_cd.Initialize2((int)(Double.parseDouble(mostCurrent._library._converthex2int(mostCurrent.activityBA,mostCurrent._library._getstringresourse(mostCurrent.activityBA,"category_button")))),(int) (0),(int) (0),anywheresoftware.b4a.keywords.Common.Colors.Gray);
 //BA.debugLineNum = 46;BA.debugLine="btnsend.Background = cd";
mostCurrent._btnsend.setBackground((android.graphics.drawable.Drawable)(_cd.getObject()));
 //BA.debugLineNum = 48;BA.debugLine="End Sub";
return "";
}
public static boolean  _activity_keypress(int _keycode) throws Exception{
 //BA.debugLineNum = 106;BA.debugLine="Sub Activity_KeyPress (KeyCode As Int) As Boolean";
 //BA.debugLineNum = 107;BA.debugLine="If KeyCode = KeyCodes.KEYCODE_BACK Then";
if (_keycode==anywheresoftware.b4a.keywords.Common.KeyCodes.KEYCODE_BACK) { 
 //BA.debugLineNum = 108;BA.debugLine="Activity.Finish";
mostCurrent._activity.Finish();
 //BA.debugLineNum = 109;BA.debugLine="Return True";
if (true) return anywheresoftware.b4a.keywords.Common.True;
 };
 //BA.debugLineNum = 111;BA.debugLine="End Sub";
return false;
}
public static String  _activity_pause(boolean _userclosed) throws Exception{
 //BA.debugLineNum = 54;BA.debugLine="Sub Activity_Pause (UserClosed As Boolean)";
 //BA.debugLineNum = 55;BA.debugLine="Library.AnimationFromLeft2Right";
mostCurrent._library._animationfromleft2right(mostCurrent.activityBA);
 //BA.debugLineNum = 57;BA.debugLine="End Sub";
return "";
}
public static String  _activity_resume() throws Exception{
 //BA.debugLineNum = 50;BA.debugLine="Sub Activity_Resume";
 //BA.debugLineNum = 52;BA.debugLine="End Sub";
return "";
}
public static String  _btnproduts_click() throws Exception{
 //BA.debugLineNum = 102;BA.debugLine="Sub btnproduts_Click";
 //BA.debugLineNum = 103;BA.debugLine="StartActivity(actBasket)";
anywheresoftware.b4a.keywords.Common.StartActivity(mostCurrent.activityBA,(Object)(mostCurrent._actbasket.getObject()));
 //BA.debugLineNum = 104;BA.debugLine="End Sub";
return "";
}
public static String  _btnsend_click() throws Exception{
 //BA.debugLineNum = 59;BA.debugLine="Sub btnsend_Click";
 //BA.debugLineNum = 61;BA.debugLine="If txtname.Text.Length = 0 Then";
if (mostCurrent._txtname.getText().length()==0) { 
 //BA.debugLineNum = 62;BA.debugLine="MyToastMessageShow1.ShowToastMessageShow(Library";
mostCurrent._mytoastmessageshow1._showtoastmessageshow(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"error_name"),(long) (1.6),anywheresoftware.b4a.keywords.Common.False);
 //BA.debugLineNum = 63;BA.debugLine="Return";
if (true) return "";
 };
 //BA.debugLineNum = 66;BA.debugLine="Basket = Basket & CRLF & txtname.Text";
_basket = _basket+anywheresoftware.b4a.keywords.Common.CRLF+mostCurrent._txtname.getText();
 //BA.debugLineNum = 67;BA.debugLine="SendSms(Basket,True)";
_sendsms(_basket,anywheresoftware.b4a.keywords.Common.True);
 //BA.debugLineNum = 69;BA.debugLine="End Sub";
return "";
}
public static String  _globals() throws Exception{
 //BA.debugLineNum = 10;BA.debugLine="Sub Globals";
 //BA.debugLineNum = 11;BA.debugLine="Private txtname As EditText";
mostCurrent._txtname = new anywheresoftware.b4a.objects.EditTextWrapper();
 //BA.debugLineNum = 12;BA.debugLine="Private btnsend As Button";
mostCurrent._btnsend = new anywheresoftware.b4a.objects.ButtonWrapper();
 //BA.debugLineNum = 13;BA.debugLine="Private lblphone As Label";
mostCurrent._lblphone = new anywheresoftware.b4a.objects.LabelWrapper();
 //BA.debugLineNum = 14;BA.debugLine="Private lbltitle As Label";
mostCurrent._lbltitle = new anywheresoftware.b4a.objects.LabelWrapper();
 //BA.debugLineNum = 15;BA.debugLine="Private MyToastMessageShow1 As MyToastMessageShow";
mostCurrent._mytoastmessageshow1 = new com.apps.demo.mytoastmessageshow();
 //BA.debugLineNum = 16;BA.debugLine="Private txtcomment As EditText";
mostCurrent._txtcomment = new anywheresoftware.b4a.objects.EditTextWrapper();
 //BA.debugLineNum = 17;BA.debugLine="Private lblcomment As Label";
mostCurrent._lblcomment = new anywheresoftware.b4a.objects.LabelWrapper();
 //BA.debugLineNum = 18;BA.debugLine="Private btnproduts As Button";
mostCurrent._btnproduts = new anywheresoftware.b4a.objects.ButtonWrapper();
 //BA.debugLineNum = 19;BA.debugLine="Private pnlheader As Panel";
mostCurrent._pnlheader = new anywheresoftware.b4a.objects.PanelWrapper();
 //BA.debugLineNum = 20;BA.debugLine="End Sub";
return "";
}
public static String  _phoneevents_smsdelivered(String _phonenumber,anywheresoftware.b4a.objects.IntentWrapper _intent) throws Exception{
 //BA.debugLineNum = 97;BA.debugLine="Sub phoneevents_SmsDelivered (PhoneNumber As Strin";
 //BA.debugLineNum = 98;BA.debugLine="MyToastMessageShow1.ShowToastMessageShow(Library.";
mostCurrent._mytoastmessageshow1._showtoastmessageshow(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"deliver_sms").replace("\\n",anywheresoftware.b4a.keywords.Common.CRLF),(long) (2),anywheresoftware.b4a.keywords.Common.True);
 //BA.debugLineNum = 99;BA.debugLine="End Sub";
return "";
}
public static String  _phoneevents_smssentstatus(boolean _success,String _errormessage,String _phonenumber,anywheresoftware.b4a.objects.IntentWrapper _intent) throws Exception{
 //BA.debugLineNum = 91;BA.debugLine="Sub phoneevents_SmsSentStatus (Success As Boolean,";
 //BA.debugLineNum = 92;BA.debugLine="If Success Then";
if (_success) { 
 //BA.debugLineNum = 93;BA.debugLine="MyToastMessageShow1.ShowToastMessageShow(Library";
mostCurrent._mytoastmessageshow1._showtoastmessageshow(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"send_order"),(long) (2),anywheresoftware.b4a.keywords.Common.True);
 };
 //BA.debugLineNum = 95;BA.debugLine="End Sub";
return "";
}
public static String  _process_globals() throws Exception{
 //BA.debugLineNum = 6;BA.debugLine="Sub Process_Globals";
 //BA.debugLineNum = 7;BA.debugLine="Public Basket As String";
_basket = "";
 //BA.debugLineNum = 8;BA.debugLine="End Sub";
return "";
}
public static String  _sendsms(String _text,boolean _intent) throws Exception{
anywheresoftware.b4a.objects.IntentWrapper _in = null;
anywheresoftware.b4a.phone.Phone.PhoneSms _ps = null;
anywheresoftware.b4a.phone.PhoneEvents _pv = null;
 //BA.debugLineNum = 72;BA.debugLine="Sub SendSms(Text As String,Intent As Boolean)";
 //BA.debugLineNum = 74;BA.debugLine="If Intent = True Then";
if (_intent==anywheresoftware.b4a.keywords.Common.True) { 
 //BA.debugLineNum = 75;BA.debugLine="Dim In As Intent";
_in = new anywheresoftware.b4a.objects.IntentWrapper();
 //BA.debugLineNum = 76;BA.debugLine="In.Initialize(In.ACTION_VIEW, \"sms:\" & Librar";
_in.Initialize(_in.ACTION_VIEW,"sms:"+mostCurrent._library._getstringresourse(mostCurrent.activityBA,"shop_sms"));
 //BA.debugLineNum = 77;BA.debugLine="In.PutExtra(\"sms_body\", Text)";
_in.PutExtra("sms_body",(Object)(_text));
 //BA.debugLineNum = 78;BA.debugLine="StartActivity(In)";
anywheresoftware.b4a.keywords.Common.StartActivity(mostCurrent.activityBA,(Object)(_in.getObject()));
 }else {
 //BA.debugLineNum = 80;BA.debugLine="Dim ps As PhoneSms";
_ps = new anywheresoftware.b4a.phone.Phone.PhoneSms();
 //BA.debugLineNum = 81;BA.debugLine="Dim pv As PhoneEvents";
_pv = new anywheresoftware.b4a.phone.PhoneEvents();
 //BA.debugLineNum = 82;BA.debugLine="pv.Initialize(\"phoneevents\")";
_pv.Initialize(processBA,"phoneevents");
 //BA.debugLineNum = 83;BA.debugLine="ps.Send2(Library.GetStringResourse(\"shop_sms\"),T";
_ps.Send2(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"shop_sms"),_text,anywheresoftware.b4a.keywords.Common.True,anywheresoftware.b4a.keywords.Common.True);
 //BA.debugLineNum = 84;BA.debugLine="MyToastMessageShow1.ShowToastMessageShow(Library";
mostCurrent._mytoastmessageshow1._showtoastmessageshow(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"send_order"),(long) (1.7),anywheresoftware.b4a.keywords.Common.True);
 //BA.debugLineNum = 85;BA.debugLine="txtcomment.Text = \"\"";
mostCurrent._txtcomment.setText(BA.ObjectToCharSequence(""));
 //BA.debugLineNum = 86;BA.debugLine="txtname.Text = \"\"";
mostCurrent._txtname.setText(BA.ObjectToCharSequence(""));
 };
 //BA.debugLineNum = 89;BA.debugLine="End Sub";
return "";
}
}
