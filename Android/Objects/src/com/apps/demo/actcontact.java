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

public class actcontact extends Activity implements B4AActivity{
	public static actcontact mostCurrent;
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
			processBA = new BA(this.getApplicationContext(), null, null, "com.apps.demo", "com.apps.demo.actcontact");
			processBA.loadHtSubs(this.getClass());
	        float deviceScale = getApplicationContext().getResources().getDisplayMetrics().density;
	        BALayout.setDeviceScale(deviceScale);
            
		}
		else if (previousOne != null) {
			Activity p = previousOne.get();
			if (p != null && p != this) {
                BA.LogInfo("Killing previous instance (actcontact).");
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
		activityBA = new BA(this, layout, processBA, "com.apps.demo", "com.apps.demo.actcontact");
        
        processBA.sharedProcessBA.activityBA = new java.lang.ref.WeakReference<BA>(activityBA);
        anywheresoftware.b4a.objects.ViewWrapper.lastId = 0;
        _activity = new ActivityWrapper(activityBA, "activity");
        anywheresoftware.b4a.Msgbox.isDismissing = false;
        if (BA.isShellModeRuntimeCheck(processBA)) {
			if (isFirst)
				processBA.raiseEvent2(null, true, "SHELL", false);
			processBA.raiseEvent2(null, true, "CREATE", true, "com.apps.demo.actcontact", processBA, activityBA, _activity, anywheresoftware.b4a.keywords.Common.Density, mostCurrent);
			_activity.reinitializeForShell(activityBA, "activity");
		}
        initializeProcessGlobals();		
        initializeGlobals();
        
        BA.LogInfo("** Activity (actcontact) Create, isFirst = " + isFirst + " **");
        processBA.raiseEvent2(null, true, "activity_create", false, isFirst);
		isFirst = false;
		if (this != mostCurrent)
			return;
        processBA.setActivityPaused(false);
        BA.LogInfo("** Activity (actcontact) Resume **");
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
		return actcontact.class;
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
        BA.LogInfo("** Activity (actcontact) Pause, UserClosed = " + activityBA.activity.isFinishing() + " **");
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
            BA.LogInfo("** Activity (actcontact) Resume **");
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
public anywheresoftware.b4a.objects.LabelWrapper _lbltitle = null;
public anywheresoftware.b4a.objects.LabelWrapper _lblname = null;
public anywheresoftware.b4a.objects.EditTextWrapper _txtname = null;
public anywheresoftware.b4a.objects.LabelWrapper _lblemail = null;
public anywheresoftware.b4a.objects.EditTextWrapper _txtemail = null;
public anywheresoftware.b4a.objects.LabelWrapper _lbltext = null;
public anywheresoftware.b4a.objects.EditTextWrapper _txttext = null;
public anywheresoftware.b4a.objects.ButtonWrapper _btnsend = null;
public anywheresoftware.b4a.objects.PanelWrapper _pnlloading = null;
public anywheresoftware.b4a.objects.LabelWrapper _lblpb = null;
public anywheresoftware.b4a.objects.PanelWrapper _pnlheader = null;
public com.apps.demo.mytoastmessageshow _mytoastmessageshow = null;
public anywheresoftware.b4a.objects.ProgressBarWrapper _pbloading = null;
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

public static void initializeProcessGlobals() {
             try {
                Class.forName(BA.applicationContext.getPackageName() + ".main").getMethod("initializeProcessGlobals").invoke(null, null);
            } catch (Exception e) {
                throw new RuntimeException(e);
            }
}
public static String  _activity_create(boolean _firsttime) throws Exception{
 //BA.debugLineNum = 31;BA.debugLine="Sub Activity_Create(FirstTime As Boolean)";
 //BA.debugLineNum = 33;BA.debugLine="Activity.LoadLayout(\"frmcontact\")";
mostCurrent._activity.LoadLayout("frmcontact",mostCurrent.activityBA);
 //BA.debugLineNum = 34;BA.debugLine="MyToastMessageShow.Initialize(Activity)";
mostCurrent._mytoastmessageshow._initialize(mostCurrent.activityBA,(anywheresoftware.b4a.objects.PanelWrapper) anywheresoftware.b4a.AbsObjectWrapper.ConvertToWrapper(new anywheresoftware.b4a.objects.PanelWrapper(), (android.view.ViewGroup)(mostCurrent._activity.getObject())));
 //BA.debugLineNum = 35;BA.debugLine="Library.setLocalApp(Library.currLang)";
mostCurrent._library._setlocalapp(mostCurrent.activityBA,mostCurrent._library._currlang);
 //BA.debugLineNum = 37;BA.debugLine="Library.ChangeStatusColor";
mostCurrent._library._changestatuscolor(mostCurrent.activityBA);
 //BA.debugLineNum = 39;BA.debugLine="lbltitle.Text = Library.GetStringResourse(\"contac";
mostCurrent._lbltitle.setText(BA.ObjectToCharSequence(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"contact")));
 //BA.debugLineNum = 40;BA.debugLine="lblpb.Text = Library.GetStringResourse(\"apply\")";
mostCurrent._lblpb.setText(BA.ObjectToCharSequence(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"apply")));
 //BA.debugLineNum = 41;BA.debugLine="pnlheader.Color = Library.Theme_Header";
mostCurrent._pnlheader.setColor(mostCurrent._library._theme_header);
 //BA.debugLineNum = 43;BA.debugLine="lblname.Text = Library.GetStringResourse(\"tname\")";
mostCurrent._lblname.setText(BA.ObjectToCharSequence(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"tname")));
 //BA.debugLineNum = 44;BA.debugLine="lblemail.Text = Library.GetStringResourse(\"email\"";
mostCurrent._lblemail.setText(BA.ObjectToCharSequence(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"email")));
 //BA.debugLineNum = 45;BA.debugLine="lbltext.Text = Library.GetStringResourse(\"ttext\")";
mostCurrent._lbltext.setText(BA.ObjectToCharSequence(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"ttext")));
 //BA.debugLineNum = 46;BA.debugLine="btnsend.Text = Library.GetStringResourse(\"send\")";
mostCurrent._btnsend.setText(BA.ObjectToCharSequence(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"send")));
 //BA.debugLineNum = 47;BA.debugLine="btnsend.Background = Library.GetButtonState";
mostCurrent._btnsend.setBackground((android.graphics.drawable.Drawable)(mostCurrent._library._getbuttonstate(mostCurrent.activityBA).getObject()));
 //BA.debugLineNum = 49;BA.debugLine="txtname.Color = Colors.RGB(250,250,250)";
mostCurrent._txtname.setColor(anywheresoftware.b4a.keywords.Common.Colors.RGB((int) (250),(int) (250),(int) (250)));
 //BA.debugLineNum = 50;BA.debugLine="txtemail.Color = Colors.RGB(250,250,250)";
mostCurrent._txtemail.setColor(anywheresoftware.b4a.keywords.Common.Colors.RGB((int) (250),(int) (250),(int) (250)));
 //BA.debugLineNum = 51;BA.debugLine="txttext.Color = Colors.RGB(250,250,250)";
mostCurrent._txttext.setColor(anywheresoftware.b4a.keywords.Common.Colors.RGB((int) (250),(int) (250),(int) (250)));
 //BA.debugLineNum = 53;BA.debugLine="lblname.Gravity		= Library.GetStringResourse(\"dir";
mostCurrent._lblname.setGravity((int)(Double.parseDouble(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"direction"))));
 //BA.debugLineNum = 54;BA.debugLine="lblemail.Gravity	= Library.GetStringResourse(\"dir";
mostCurrent._lblemail.setGravity((int)(Double.parseDouble(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"direction"))));
 //BA.debugLineNum = 55;BA.debugLine="lbltext.Gravity	= Library.GetStringResourse(\"dire";
mostCurrent._lbltext.setGravity((int)(Double.parseDouble(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"direction"))));
 //BA.debugLineNum = 57;BA.debugLine="Library.EditTextIcon(txtemail,\"ic_menu_cc\")";
mostCurrent._library._edittexticon(mostCurrent.activityBA,mostCurrent._txtemail,"ic_menu_cc");
 //BA.debugLineNum = 58;BA.debugLine="Library.EditTextIcon(txtname,\"ic_menu_edit\")";
mostCurrent._library._edittexticon(mostCurrent.activityBA,mostCurrent._txtname,"ic_menu_edit");
 //BA.debugLineNum = 59;BA.debugLine="Library.EditTextIcon(txttext,\"ic_menu_edit\")";
mostCurrent._library._edittexticon(mostCurrent.activityBA,mostCurrent._txttext,"ic_menu_edit");
 //BA.debugLineNum = 61;BA.debugLine="txtemail.InputType = 33";
mostCurrent._txtemail.setInputType((int) (33));
 //BA.debugLineNum = 63;BA.debugLine="End Sub";
return "";
}
public static String  _activity_pause(boolean _userclosed) throws Exception{
 //BA.debugLineNum = 69;BA.debugLine="Sub Activity_Pause (UserClosed As Boolean)";
 //BA.debugLineNum = 70;BA.debugLine="Activity.Finish";
mostCurrent._activity.Finish();
 //BA.debugLineNum = 71;BA.debugLine="Library.AnimationFromLeft2Right";
mostCurrent._library._animationfromleft2right(mostCurrent.activityBA);
 //BA.debugLineNum = 72;BA.debugLine="End Sub";
return "";
}
public static String  _activity_resume() throws Exception{
 //BA.debugLineNum = 65;BA.debugLine="Sub Activity_Resume";
 //BA.debugLineNum = 67;BA.debugLine="End Sub";
return "";
}
public static String  _btnclose_click() throws Exception{
 //BA.debugLineNum = 74;BA.debugLine="Sub btnclose_Click";
 //BA.debugLineNum = 75;BA.debugLine="Activity.Finish";
mostCurrent._activity.Finish();
 //BA.debugLineNum = 76;BA.debugLine="End Sub";
return "";
}
public static String  _btnsend_click() throws Exception{
com.apps.demo.opencart _op = null;
 //BA.debugLineNum = 78;BA.debugLine="Sub btnsend_Click";
 //BA.debugLineNum = 80;BA.debugLine="If Library.InternetState = False Then";
if (mostCurrent._library._internetstate(mostCurrent.activityBA)==anywheresoftware.b4a.keywords.Common.False) { 
 //BA.debugLineNum = 81;BA.debugLine="MyToastMessageShow.ShowToastMessageShow(Library.";
mostCurrent._mytoastmessageshow._showtoastmessageshow(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"error_net_details"),(long) (2),anywheresoftware.b4a.keywords.Common.False);
 //BA.debugLineNum = 82;BA.debugLine="Return";
if (true) return "";
 };
 //BA.debugLineNum = 85;BA.debugLine="If txtname.Text.Length < 2 Or txttext.Text.Length";
if (mostCurrent._txtname.getText().length()<2 || mostCurrent._txttext.getText().length()<25) { 
 //BA.debugLineNum = 86;BA.debugLine="MyToastMessageShow.ShowToastMessageShow(Library.";
mostCurrent._mytoastmessageshow._showtoastmessageshow(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"error_data").replace("\\n",anywheresoftware.b4a.keywords.Common.CRLF),(long) (2),anywheresoftware.b4a.keywords.Common.False);
 //BA.debugLineNum = 87;BA.debugLine="Return";
if (true) return "";
 };
 //BA.debugLineNum = 90;BA.debugLine="Dim op As OpenCart";
_op = new com.apps.demo.opencart();
 //BA.debugLineNum = 91;BA.debugLine="op.Initialize";
_op._initialize(processBA);
 //BA.debugLineNum = 92;BA.debugLine="pnlloading.SetVisibleAnimated(500,True)";
mostCurrent._pnlloading.SetVisibleAnimated((int) (500),anywheresoftware.b4a.keywords.Common.True);
 //BA.debugLineNum = 93;BA.debugLine="op.ContactUs(Me,\"SendReview_receive\",txtemail.Tex";
_op._contactus(actcontact.getObject(),"SendReview_receive",mostCurrent._txtemail.getText(),mostCurrent._txtname.getText(),mostCurrent._txttext.getText());
 //BA.debugLineNum = 95;BA.debugLine="End Sub";
return "";
}
public static String  _globals() throws Exception{
 //BA.debugLineNum = 12;BA.debugLine="Sub Globals";
 //BA.debugLineNum = 16;BA.debugLine="Private lbltitle As Label";
mostCurrent._lbltitle = new anywheresoftware.b4a.objects.LabelWrapper();
 //BA.debugLineNum = 17;BA.debugLine="Private lblname As Label";
mostCurrent._lblname = new anywheresoftware.b4a.objects.LabelWrapper();
 //BA.debugLineNum = 18;BA.debugLine="Private txtname As EditText";
mostCurrent._txtname = new anywheresoftware.b4a.objects.EditTextWrapper();
 //BA.debugLineNum = 19;BA.debugLine="Private lblemail As Label";
mostCurrent._lblemail = new anywheresoftware.b4a.objects.LabelWrapper();
 //BA.debugLineNum = 20;BA.debugLine="Private txtemail As EditText";
mostCurrent._txtemail = new anywheresoftware.b4a.objects.EditTextWrapper();
 //BA.debugLineNum = 21;BA.debugLine="Private lbltext As Label";
mostCurrent._lbltext = new anywheresoftware.b4a.objects.LabelWrapper();
 //BA.debugLineNum = 22;BA.debugLine="Private txttext As EditText";
mostCurrent._txttext = new anywheresoftware.b4a.objects.EditTextWrapper();
 //BA.debugLineNum = 23;BA.debugLine="Private btnsend As Button";
mostCurrent._btnsend = new anywheresoftware.b4a.objects.ButtonWrapper();
 //BA.debugLineNum = 24;BA.debugLine="Private pnlloading As Panel";
mostCurrent._pnlloading = new anywheresoftware.b4a.objects.PanelWrapper();
 //BA.debugLineNum = 25;BA.debugLine="Private lblpb As Label";
mostCurrent._lblpb = new anywheresoftware.b4a.objects.LabelWrapper();
 //BA.debugLineNum = 26;BA.debugLine="Private pnlheader As Panel";
mostCurrent._pnlheader = new anywheresoftware.b4a.objects.PanelWrapper();
 //BA.debugLineNum = 27;BA.debugLine="Dim MyToastMessageShow As MyToastMessageShow";
mostCurrent._mytoastmessageshow = new com.apps.demo.mytoastmessageshow();
 //BA.debugLineNum = 28;BA.debugLine="Private pbloading As ProgressBar";
mostCurrent._pbloading = new anywheresoftware.b4a.objects.ProgressBarWrapper();
 //BA.debugLineNum = 29;BA.debugLine="End Sub";
return "";
}
public static String  _process_globals() throws Exception{
 //BA.debugLineNum = 6;BA.debugLine="Sub Process_Globals";
 //BA.debugLineNum = 10;BA.debugLine="End Sub";
return "";
}
public static String  _sendreview_receive(anywheresoftware.b4a.objects.collections.Map _res,String _cat) throws Exception{
String _res1 = "";
 //BA.debugLineNum = 97;BA.debugLine="Sub SendReview_receive(res As Map,cat As String)";
 //BA.debugLineNum = 99;BA.debugLine="pnlloading.SetVisibleAnimated(600,False)";
mostCurrent._pnlloading.SetVisibleAnimated((int) (600),anywheresoftware.b4a.keywords.Common.False);
 //BA.debugLineNum = 101;BA.debugLine="Dim res1 As String";
_res1 = "";
 //BA.debugLineNum = 102;BA.debugLine="res1 = res.Get(\"success\")";
_res1 = BA.ObjectToString(_res.Get((Object)("success")));
 //BA.debugLineNum = 104;BA.debugLine="If res1.ToLowerCase = \"true\" Then";
if ((_res1.toLowerCase()).equals("true")) { 
 //BA.debugLineNum = 105;BA.debugLine="txtemail.Text = \"\"";
mostCurrent._txtemail.setText(BA.ObjectToCharSequence(""));
 //BA.debugLineNum = 106;BA.debugLine="txtname.Text = \"\"";
mostCurrent._txtname.setText(BA.ObjectToCharSequence(""));
 //BA.debugLineNum = 107;BA.debugLine="txttext.Text = \"\"";
mostCurrent._txttext.setText(BA.ObjectToCharSequence(""));
 //BA.debugLineNum = 108;BA.debugLine="MyToastMessageShow.ShowToastMessageShow(Library.";
mostCurrent._mytoastmessageshow._showtoastmessageshow(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"success_send"),(long) (2),anywheresoftware.b4a.keywords.Common.True);
 }else {
 //BA.debugLineNum = 110;BA.debugLine="MyToastMessageShow.ShowToastMessageShow(Library.";
mostCurrent._mytoastmessageshow._showtoastmessageshow(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"error_data").replace("\\n",anywheresoftware.b4a.keywords.Common.CRLF),(long) (2),anywheresoftware.b4a.keywords.Common.False);
 };
 //BA.debugLineNum = 113;BA.debugLine="End Sub";
return "";
}
}
