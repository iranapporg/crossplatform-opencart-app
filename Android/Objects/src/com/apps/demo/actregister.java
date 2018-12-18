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

public class actregister extends Activity implements B4AActivity{
	public static actregister mostCurrent;
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
			processBA = new BA(this.getApplicationContext(), null, null, "com.apps.demo", "com.apps.demo.actregister");
			processBA.loadHtSubs(this.getClass());
	        float deviceScale = getApplicationContext().getResources().getDisplayMetrics().density;
	        BALayout.setDeviceScale(deviceScale);
            
		}
		else if (previousOne != null) {
			Activity p = previousOne.get();
			if (p != null && p != this) {
                BA.LogInfo("Killing previous instance (actregister).");
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
		activityBA = new BA(this, layout, processBA, "com.apps.demo", "com.apps.demo.actregister");
        
        processBA.sharedProcessBA.activityBA = new java.lang.ref.WeakReference<BA>(activityBA);
        anywheresoftware.b4a.objects.ViewWrapper.lastId = 0;
        _activity = new ActivityWrapper(activityBA, "activity");
        anywheresoftware.b4a.Msgbox.isDismissing = false;
        if (BA.isShellModeRuntimeCheck(processBA)) {
			if (isFirst)
				processBA.raiseEvent2(null, true, "SHELL", false);
			processBA.raiseEvent2(null, true, "CREATE", true, "com.apps.demo.actregister", processBA, activityBA, _activity, anywheresoftware.b4a.keywords.Common.Density, mostCurrent);
			_activity.reinitializeForShell(activityBA, "activity");
		}
        initializeProcessGlobals();		
        initializeGlobals();
        
        BA.LogInfo("** Activity (actregister) Create, isFirst = " + isFirst + " **");
        processBA.raiseEvent2(null, true, "activity_create", false, isFirst);
		isFirst = false;
		if (this != mostCurrent)
			return;
        processBA.setActivityPaused(false);
        BA.LogInfo("** Activity (actregister) Resume **");
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
		return actregister.class;
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
        BA.LogInfo("** Activity (actregister) Pause, UserClosed = " + activityBA.activity.isFinishing() + " **");
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
            BA.LogInfo("** Activity (actregister) Resume **");
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
public static boolean _guest = false;
public anywheresoftware.b4a.objects.ScrollViewWrapper _sv1 = null;
public anywheresoftware.b4a.objects.ButtonWrapper _btnregister = null;
public anywheresoftware.b4a.objects.ButtonWrapper _btnlogin = null;
public anywheresoftware.b4a.objects.LabelWrapper _lbltitle = null;
public anywheresoftware.b4a.objects.PanelWrapper _pnlloading = null;
public anywheresoftware.b4a.objects.LabelWrapper _lblpb = null;
public Object _top = null;
public com.apps.demo.opencart _op1 = null;
public anywheresoftware.b4a.objects.PanelWrapper _pnlheader = null;
public anywheresoftware.b4a.objects.collections.List _listcountry = null;
public anywheresoftware.b4a.objects.collections.List _listcity = null;
public com.apps.demo.opencart _opcountry = null;
public com.apps.demo.opencart _opcity = null;
public anywheresoftware.b4a.objects.SpinnerWrapper _spcity = null;
public static boolean _successregister = false;
public com.apps.demo.mytoastmessageshow _mytoastmessageshow = null;
public anywheresoftware.b4a.objects.CompoundButtonWrapper.CheckBoxWrapper _chknewsletter = null;
public static String _susername = "";
public static String _spassword = "";
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
anywheresoftware.b4a.objects.drawable.ColorDrawable _cd = null;
 //BA.debugLineNum = 29;BA.debugLine="Sub Activity_Create(FirstTime As Boolean)";
 //BA.debugLineNum = 31;BA.debugLine="Library.setLocalApp(Library.currLang)";
mostCurrent._library._setlocalapp(mostCurrent.activityBA,mostCurrent._library._currlang);
 //BA.debugLineNum = 33;BA.debugLine="Activity.LoadLayout(\"frmregister\")";
mostCurrent._activity.LoadLayout("frmregister",mostCurrent.activityBA);
 //BA.debugLineNum = 34;BA.debugLine="MyToastMessageShow.Initialize(Activity)";
mostCurrent._mytoastmessageshow._initialize(mostCurrent.activityBA,(anywheresoftware.b4a.objects.PanelWrapper) anywheresoftware.b4a.AbsObjectWrapper.ConvertToWrapper(new anywheresoftware.b4a.objects.PanelWrapper(), (android.view.ViewGroup)(mostCurrent._activity.getObject())));
 //BA.debugLineNum = 36;BA.debugLine="Library.ChangeStatusColor";
mostCurrent._library._changestatuscolor(mostCurrent.activityBA);
 //BA.debugLineNum = 38;BA.debugLine="If Guest = False Then";
if (_guest==anywheresoftware.b4a.keywords.Common.False) { 
 //BA.debugLineNum = 39;BA.debugLine="lbltitle.Text = Library.GetStringResourse(\"regis";
mostCurrent._lbltitle.setText(BA.ObjectToCharSequence(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"register")));
 //BA.debugLineNum = 40;BA.debugLine="btnregister.Text = Library.GetStringResourse(\"re";
mostCurrent._btnregister.setText(BA.ObjectToCharSequence(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"register")));
 }else {
 //BA.debugLineNum = 42;BA.debugLine="lbltitle.Text = Library.GetStringResourse(\"reuqu";
mostCurrent._lbltitle.setText(BA.ObjectToCharSequence(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"reuquest_guest")));
 //BA.debugLineNum = 43;BA.debugLine="btnregister.Text = Library.GetStringResourse(\"co";
mostCurrent._btnregister.setText(BA.ObjectToCharSequence(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"continues")));
 };
 //BA.debugLineNum = 46;BA.debugLine="lblpb.Text = Library.GetStringResourse(\"loading\")";
mostCurrent._lblpb.setText(BA.ObjectToCharSequence(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"loading")));
 //BA.debugLineNum = 47;BA.debugLine="btnlogin.Text = Library.GetStringResourse(\"login\"";
mostCurrent._btnlogin.setText(BA.ObjectToCharSequence(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"login")));
 //BA.debugLineNum = 48;BA.debugLine="chknewsletter.Text = Library.GetStringResourse(\"r";
mostCurrent._chknewsletter.setText(BA.ObjectToCharSequence(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"register_newsletter")));
 //BA.debugLineNum = 49;BA.debugLine="chknewsletter.Gravity = Library.GetStringResourse";
mostCurrent._chknewsletter.setGravity((int)(Double.parseDouble(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"direction"))));
 //BA.debugLineNum = 50;BA.debugLine="pnlheader.Color = Library.Theme_Header";
mostCurrent._pnlheader.setColor(mostCurrent._library._theme_header);
 //BA.debugLineNum = 51;BA.debugLine="btnlogin.Background = Library.GetButtonState";
mostCurrent._btnlogin.setBackground((android.graphics.drawable.Drawable)(mostCurrent._library._getbuttonstate(mostCurrent.activityBA).getObject()));
 //BA.debugLineNum = 52;BA.debugLine="btnregister.Background = Library.GetButtonState";
mostCurrent._btnregister.setBackground((android.graphics.drawable.Drawable)(mostCurrent._library._getbuttonstate(mostCurrent.activityBA).getObject()));
 //BA.debugLineNum = 54;BA.debugLine="top = 14";
mostCurrent._top = (Object)(14);
 //BA.debugLineNum = 55;BA.debugLine="op1.Initialize";
mostCurrent._op1._initialize(processBA);
 //BA.debugLineNum = 56;BA.debugLine="listCity.Initialize";
mostCurrent._listcity.Initialize();
 //BA.debugLineNum = 58;BA.debugLine="opCountry.Initialize";
mostCurrent._opcountry._initialize(processBA);
 //BA.debugLineNum = 59;BA.debugLine="opCity.Initialize";
mostCurrent._opcity._initialize(processBA);
 //BA.debugLineNum = 61;BA.debugLine="pnlloading.SetVisibleAnimated(500,True)";
mostCurrent._pnlloading.SetVisibleAnimated((int) (500),anywheresoftware.b4a.keywords.Common.True);
 //BA.debugLineNum = 63;BA.debugLine="If listCountry.IsInitialized = False Then";
if (mostCurrent._listcountry.IsInitialized()==anywheresoftware.b4a.keywords.Common.False) { 
 //BA.debugLineNum = 64;BA.debugLine="opCountry.GetCountry(Me,\"country_receive\")";
mostCurrent._opcountry._getcountry(actregister.getObject(),"country_receive");
 }else {
 //BA.debugLineNum = 66;BA.debugLine="country_receive(listCountry,\"\")";
_country_receive(mostCurrent._listcountry,"");
 };
 //BA.debugLineNum = 69;BA.debugLine="Dim cd As ColorDrawable";
_cd = new anywheresoftware.b4a.objects.drawable.ColorDrawable();
 //BA.debugLineNum = 70;BA.debugLine="cd.Initialize2(Library.ConvertHex2Int(Library.Get";
_cd.Initialize2((int)(Double.parseDouble(mostCurrent._library._converthex2int(mostCurrent.activityBA,mostCurrent._library._getstringresourse(mostCurrent.activityBA,"category_button")))),(int) (0),(int) (0),anywheresoftware.b4a.keywords.Common.Colors.Gray);
 //BA.debugLineNum = 71;BA.debugLine="btnregister.Background = cd";
mostCurrent._btnregister.setBackground((android.graphics.drawable.Drawable)(_cd.getObject()));
 //BA.debugLineNum = 73;BA.debugLine="End Sub";
return "";
}
public static boolean  _activity_keypress(int _keycode) throws Exception{
 //BA.debugLineNum = 366;BA.debugLine="Sub Activity_KeyPress (KeyCode As Int) As Boolean";
 //BA.debugLineNum = 368;BA.debugLine="If KeyCode = KeyCodes.KEYCODE_BACK Then";
if (_keycode==anywheresoftware.b4a.keywords.Common.KeyCodes.KEYCODE_BACK) { 
 //BA.debugLineNum = 369;BA.debugLine="Activity.Finish";
mostCurrent._activity.Finish();
 //BA.debugLineNum = 370;BA.debugLine="Return True";
if (true) return anywheresoftware.b4a.keywords.Common.True;
 };
 //BA.debugLineNum = 373;BA.debugLine="End Sub";
return false;
}
public static String  _activity_pause(boolean _userclosed) throws Exception{
 //BA.debugLineNum = 169;BA.debugLine="Sub Activity_Pause (UserClosed As Boolean)";
 //BA.debugLineNum = 171;BA.debugLine="If Guest = True And successRegister = True Then";
if (_guest==anywheresoftware.b4a.keywords.Common.True && _successregister==anywheresoftware.b4a.keywords.Common.True) { 
 //BA.debugLineNum = 172;BA.debugLine="StartActivity(actDoOrder)";
anywheresoftware.b4a.keywords.Common.StartActivity(mostCurrent.activityBA,(Object)(mostCurrent._actdoorder.getObject()));
 };
 //BA.debugLineNum = 175;BA.debugLine="Guest = False";
_guest = anywheresoftware.b4a.keywords.Common.False;
 //BA.debugLineNum = 176;BA.debugLine="successRegister = False";
_successregister = anywheresoftware.b4a.keywords.Common.False;
 //BA.debugLineNum = 178;BA.debugLine="Library.AnimationFromLeft2Right";
mostCurrent._library._animationfromleft2right(mostCurrent.activityBA);
 //BA.debugLineNum = 180;BA.debugLine="End Sub";
return "";
}
public static String  _activity_resume() throws Exception{
 //BA.debugLineNum = 165;BA.debugLine="Sub Activity_Resume";
 //BA.debugLineNum = 167;BA.debugLine="End Sub";
return "";
}
public static String  _btnclose_click() throws Exception{
 //BA.debugLineNum = 362;BA.debugLine="Sub btnclose_Click";
 //BA.debugLineNum = 363;BA.debugLine="Activity.Finish";
mostCurrent._activity.Finish();
 //BA.debugLineNum = 364;BA.debugLine="End Sub";
return "";
}
public static String  _btnlogin_click() throws Exception{
 //BA.debugLineNum = 358;BA.debugLine="Sub btnlogin_Click";
 //BA.debugLineNum = 359;BA.debugLine="StartActivity(actLogin)";
anywheresoftware.b4a.keywords.Common.StartActivity(mostCurrent.activityBA,(Object)(mostCurrent._actlogin.getObject()));
 //BA.debugLineNum = 360;BA.debugLine="End Sub";
return "";
}
public static String  _btnregister_click() throws Exception{
anywheresoftware.b4a.objects.IME _ime1 = null;
anywheresoftware.b4a.objects.StringUtils _su = null;
anywheresoftware.b4a.objects.collections.Map _data = null;
anywheresoftware.b4a.objects.ConcreteViewWrapper _v1 = null;
anywheresoftware.b4a.objects.EditTextWrapper _ed = null;
int _k = 0;
anywheresoftware.b4a.objects.collections.Map _m2 = null;
String _fax = "";
 //BA.debugLineNum = 182;BA.debugLine="Sub btnregister_Click";
 //BA.debugLineNum = 184;BA.debugLine="Dim ime1 As IME";
_ime1 = new anywheresoftware.b4a.objects.IME();
 //BA.debugLineNum = 185;BA.debugLine="ime1.Initialize(\"\")";
_ime1.Initialize("");
 //BA.debugLineNum = 186;BA.debugLine="ime1.HideKeyboard";
_ime1.HideKeyboard(mostCurrent.activityBA);
 //BA.debugLineNum = 188;BA.debugLine="If Library.InternetState = False Then";
if (mostCurrent._library._internetstate(mostCurrent.activityBA)==anywheresoftware.b4a.keywords.Common.False) { 
 //BA.debugLineNum = 189;BA.debugLine="MyToastMessageShow.ShowToastMessageShow(Library.";
mostCurrent._mytoastmessageshow._showtoastmessageshow(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"error_net_details"),(long) (1.5),anywheresoftware.b4a.keywords.Common.False);
 //BA.debugLineNum = 190;BA.debugLine="Return";
if (true) return "";
 };
 //BA.debugLineNum = 193;BA.debugLine="Dim su As StringUtils";
_su = new anywheresoftware.b4a.objects.StringUtils();
 //BA.debugLineNum = 194;BA.debugLine="Dim data As Map";
_data = new anywheresoftware.b4a.objects.collections.Map();
 //BA.debugLineNum = 196;BA.debugLine="data.Initialize";
_data.Initialize();
 //BA.debugLineNum = 198;BA.debugLine="For Each v1 As View In sv1.Panel.GetAllViewsRecur";
_v1 = new anywheresoftware.b4a.objects.ConcreteViewWrapper();
final anywheresoftware.b4a.BA.IterableList group11 = mostCurrent._sv1.getPanel().GetAllViewsRecursive();
final int groupLen11 = group11.getSize();
for (int index11 = 0;index11 < groupLen11 ;index11++){
_v1.setObject((android.view.View)(group11.Get(index11)));
 //BA.debugLineNum = 200;BA.debugLine="If v1 Is EditText Then";
if (_v1.getObjectOrNull() instanceof android.widget.EditText) { 
 //BA.debugLineNum = 202;BA.debugLine="Dim ed As EditText";
_ed = new anywheresoftware.b4a.objects.EditTextWrapper();
 //BA.debugLineNum = 203;BA.debugLine="ed = v1";
_ed.setObject((android.widget.EditText)(_v1.getObject()));
 //BA.debugLineNum = 205;BA.debugLine="If ed.Tag = \"password\" And ed.Text.Length < 5 T";
if ((_ed.getTag()).equals((Object)("password")) && _ed.getText().length()<5) { 
 //BA.debugLineNum = 206;BA.debugLine="MyToastMessageShow.ShowToastMessageShow(Librar";
mostCurrent._mytoastmessageshow._showtoastmessageshow(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"error_"+BA.ObjectToString(_ed.getTag())),(long) (1.5),anywheresoftware.b4a.keywords.Common.False);
 //BA.debugLineNum = 207;BA.debugLine="Return";
if (true) return "";
 }else if((_ed.getTag()).equals((Object)("firstname")) && _ed.getText().length()<2) { 
 //BA.debugLineNum = 210;BA.debugLine="MyToastMessageShow.ShowToastMessageShow(Librar";
mostCurrent._mytoastmessageshow._showtoastmessageshow(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"error_"+BA.ObjectToString(_ed.getTag())),(long) (1.5),anywheresoftware.b4a.keywords.Common.False);
 //BA.debugLineNum = 211;BA.debugLine="Return";
if (true) return "";
 }else if((_ed.getTag()).equals((Object)("email")) && mostCurrent._library._validemail(mostCurrent.activityBA,_ed.getText())==anywheresoftware.b4a.keywords.Common.False) { 
 //BA.debugLineNum = 214;BA.debugLine="MyToastMessageShow.ShowToastMessageShow(Librar";
mostCurrent._mytoastmessageshow._showtoastmessageshow(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"error_"+BA.ObjectToString(_ed.getTag())),(long) (1.5),anywheresoftware.b4a.keywords.Common.False);
 //BA.debugLineNum = 215;BA.debugLine="Return";
if (true) return "";
 }else if((_ed.getTag()).equals((Object)("address_1")) && _ed.getText().length()<5) { 
 //BA.debugLineNum = 218;BA.debugLine="MyToastMessageShow.ShowToastMessageShow(Librar";
mostCurrent._mytoastmessageshow._showtoastmessageshow(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"error_"+BA.ObjectToString(_ed.getTag())),(long) (1.5),anywheresoftware.b4a.keywords.Common.False);
 //BA.debugLineNum = 219;BA.debugLine="Return";
if (true) return "";
 }else if((_ed.getTag()).equals((Object)("postcode")) && mostCurrent._library._validpostalcode(mostCurrent.activityBA,_ed.getText())==anywheresoftware.b4a.keywords.Common.False) { 
 //BA.debugLineNum = 222;BA.debugLine="MyToastMessageShow.ShowToastMessageShow(Librar";
mostCurrent._mytoastmessageshow._showtoastmessageshow(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"error_"+BA.ObjectToString(_ed.getTag())),(long) (1.5),anywheresoftware.b4a.keywords.Common.False);
 //BA.debugLineNum = 223;BA.debugLine="Return";
if (true) return "";
 }else if((_ed.getTag()).equals((Object)("telephone")) && mostCurrent._library._validphonenumber(mostCurrent.activityBA,_ed.getText())==anywheresoftware.b4a.keywords.Common.False) { 
 //BA.debugLineNum = 226;BA.debugLine="MyToastMessageShow.ShowToastMessageShow(Librar";
mostCurrent._mytoastmessageshow._showtoastmessageshow(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"error_"+BA.ObjectToString(_ed.getTag())),(long) (1.5),anywheresoftware.b4a.keywords.Common.False);
 //BA.debugLineNum = 227;BA.debugLine="Return";
if (true) return "";
 };
 //BA.debugLineNum = 231;BA.debugLine="data.Put(ed.Tag,ed.Text)";
_data.Put(_ed.getTag(),(Object)(_ed.getText()));
 };
 }
;
 //BA.debugLineNum = 237;BA.debugLine="data.Put(\"email\",su.DecodeUrl(data.Get(\"email\"),\"";
_data.Put((Object)("email"),(Object)(_su.DecodeUrl(BA.ObjectToString(_data.Get((Object)("email"))),"UTF8")));
 //BA.debugLineNum = 239;BA.debugLine="If spCity.SelectedIndex = -1 Then";
if (mostCurrent._spcity.getSelectedIndex()==-1) { 
 //BA.debugLineNum = 240;BA.debugLine="MyToastMessageShow.ShowToastMessageShow(Library.";
mostCurrent._mytoastmessageshow._showtoastmessageshow(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"error_city"),(long) (1.5),anywheresoftware.b4a.keywords.Common.False);
 //BA.debugLineNum = 241;BA.debugLine="Return";
if (true) return "";
 };
 //BA.debugLineNum = 244;BA.debugLine="sUsername = data.Get(\"email\")";
mostCurrent._susername = BA.ObjectToString(_data.Get((Object)("email")));
 //BA.debugLineNum = 245;BA.debugLine="sPassword = data.Get(\"password\")";
mostCurrent._spassword = BA.ObjectToString(_data.Get((Object)("password")));
 //BA.debugLineNum = 247;BA.debugLine="For k = 0 To listCity.Size - 1";
{
final int step44 = 1;
final int limit44 = (int) (mostCurrent._listcity.getSize()-1);
for (_k = (int) (0) ; (step44 > 0 && _k <= limit44) || (step44 < 0 && _k >= limit44); _k = ((int)(0 + _k + step44)) ) {
 //BA.debugLineNum = 249;BA.debugLine="Dim m2 As Map";
_m2 = new anywheresoftware.b4a.objects.collections.Map();
 //BA.debugLineNum = 250;BA.debugLine="m2 = listCity.Get(k)";
_m2.setObject((anywheresoftware.b4a.objects.collections.Map.MyMap)(mostCurrent._listcity.Get(_k)));
 //BA.debugLineNum = 252;BA.debugLine="If m2.Get(\"name\") = spCity.SelectedItem Then";
if ((_m2.Get((Object)("name"))).equals((Object)(mostCurrent._spcity.getSelectedItem()))) { 
 //BA.debugLineNum = 253;BA.debugLine="data.Put(\"zone_id\",m2.Get(\"zone_id\"))";
_data.Put((Object)("zone_id"),_m2.Get((Object)("zone_id")));
 //BA.debugLineNum = 254;BA.debugLine="data.Put(\"country_id\",m2.Get(\"country_id\"))";
_data.Put((Object)("country_id"),_m2.Get((Object)("country_id")));
 //BA.debugLineNum = 255;BA.debugLine="Exit";
if (true) break;
 };
 }
};
 //BA.debugLineNum = 260;BA.debugLine="Library.GuestLogin.Initialize";
mostCurrent._library._guestlogin.Initialize();
 //BA.debugLineNum = 262;BA.debugLine="If Guest = True Then";
if (_guest==anywheresoftware.b4a.keywords.Common.True) { 
 //BA.debugLineNum = 263;BA.debugLine="Library.GuestLogin = data";
mostCurrent._library._guestlogin = _data;
 };
 //BA.debugLineNum = 266;BA.debugLine="pnlloading.SetVisibleAnimated(500,True)";
mostCurrent._pnlloading.SetVisibleAnimated((int) (500),anywheresoftware.b4a.keywords.Common.True);
 //BA.debugLineNum = 268;BA.debugLine="data.Put(\"newsletter\",\"0\")";
_data.Put((Object)("newsletter"),(Object)("0"));
 //BA.debugLineNum = 269;BA.debugLine="If chknewsletter.Checked Then data.Put(\"newslette";
if (mostCurrent._chknewsletter.getChecked()) { 
_data.Put((Object)("newsletter"),(Object)("1"));};
 //BA.debugLineNum = 271;BA.debugLine="Dim fax As String";
_fax = "";
 //BA.debugLineNum = 272;BA.debugLine="fax = data.Get(\"fax\")";
_fax = BA.ObjectToString(_data.Get((Object)("fax")));
 //BA.debugLineNum = 273;BA.debugLine="data.Put(\"fax\",data.Get(\"telephone\"))";
_data.Put((Object)("fax"),_data.Get((Object)("telephone")));
 //BA.debugLineNum = 274;BA.debugLine="data.Put(\"telephone\",fax)";
_data.Put((Object)("telephone"),(Object)(_fax));
 //BA.debugLineNum = 276;BA.debugLine="op1.register(Me,\"register_receive\",data,Guest)";
mostCurrent._op1._register(actregister.getObject(),"register_receive",_data,_guest);
 //BA.debugLineNum = 278;BA.debugLine="End Sub";
return "";
}
public static String  _city_receive(anywheresoftware.b4a.objects.collections.List _res,String _cat) throws Exception{
int _i = 0;
anywheresoftware.b4a.objects.collections.Map _m1 = null;
 //BA.debugLineNum = 142;BA.debugLine="Sub city_receive(res As List,cat As String)";
 //BA.debugLineNum = 144;BA.debugLine="pnlloading.SetVisibleAnimated(500,False)";
mostCurrent._pnlloading.SetVisibleAnimated((int) (500),anywheresoftware.b4a.keywords.Common.False);
 //BA.debugLineNum = 146;BA.debugLine="listCity = res";
mostCurrent._listcity = _res;
 //BA.debugLineNum = 148;BA.debugLine="spCity.Clear";
mostCurrent._spcity.Clear();
 //BA.debugLineNum = 150;BA.debugLine="For i = 0 To res.Size - 1";
{
final int step4 = 1;
final int limit4 = (int) (_res.getSize()-1);
for (_i = (int) (0) ; (step4 > 0 && _i <= limit4) || (step4 < 0 && _i >= limit4); _i = ((int)(0 + _i + step4)) ) {
 //BA.debugLineNum = 151;BA.debugLine="Dim m1 As Map";
_m1 = new anywheresoftware.b4a.objects.collections.Map();
 //BA.debugLineNum = 152;BA.debugLine="m1 = res.Get(i)";
_m1.setObject((anywheresoftware.b4a.objects.collections.Map.MyMap)(_res.Get(_i)));
 //BA.debugLineNum = 153;BA.debugLine="spCity.Add(m1.Get(\"name\"))";
mostCurrent._spcity.Add(BA.ObjectToString(_m1.Get((Object)("name"))));
 //BA.debugLineNum = 154;BA.debugLine="If spCity.GetItem(i).IndexOf(\"تهران\") > -1 Or sp";
if (mostCurrent._spcity.GetItem(_i).indexOf("تهران")>-1 || mostCurrent._spcity.GetItem(_i).toLowerCase().indexOf("tehran")>-1) { 
 //BA.debugLineNum = 155;BA.debugLine="spCity.SelectedIndex = i";
mostCurrent._spcity.setSelectedIndex(_i);
 };
 }
};
 //BA.debugLineNum = 159;BA.debugLine="End Sub";
return "";
}
public static String  _country_itemclick(int _position,Object _value) throws Exception{
int _i = 0;
anywheresoftware.b4a.objects.collections.Map _m1 = null;
 //BA.debugLineNum = 125;BA.debugLine="Sub country_ItemClick (Position As Int, Value As O";
 //BA.debugLineNum = 127;BA.debugLine="For i = 0 To listCountry.Size - 1";
{
final int step1 = 1;
final int limit1 = (int) (mostCurrent._listcountry.getSize()-1);
for (_i = (int) (0) ; (step1 > 0 && _i <= limit1) || (step1 < 0 && _i >= limit1); _i = ((int)(0 + _i + step1)) ) {
 //BA.debugLineNum = 129;BA.debugLine="Dim m1 As Map";
_m1 = new anywheresoftware.b4a.objects.collections.Map();
 //BA.debugLineNum = 130;BA.debugLine="m1 = listCountry.Get(i)";
_m1.setObject((anywheresoftware.b4a.objects.collections.Map.MyMap)(mostCurrent._listcountry.Get(_i)));
 //BA.debugLineNum = 132;BA.debugLine="If m1.Get(\"name\") = Value Then";
if ((_m1.Get((Object)("name"))).equals(_value)) { 
 //BA.debugLineNum = 133;BA.debugLine="pnlloading.SetVisibleAnimated(500,True)";
mostCurrent._pnlloading.SetVisibleAnimated((int) (500),anywheresoftware.b4a.keywords.Common.True);
 //BA.debugLineNum = 134;BA.debugLine="opCity.GetCity(Me,\"city_receive\",m1.Get(\"countr";
mostCurrent._opcity._getcity(actregister.getObject(),"city_receive",BA.ObjectToString(_m1.Get((Object)("country_id"))));
 //BA.debugLineNum = 135;BA.debugLine="Return";
if (true) return "";
 };
 }
};
 //BA.debugLineNum = 140;BA.debugLine="End Sub";
return "";
}
public static String  _country_receive(anywheresoftware.b4a.objects.collections.List _ls,String _cat) throws Exception{
anywheresoftware.b4a.objects.collections.List _city = null;
anywheresoftware.b4a.objects.collections.List _lscountryname = null;
anywheresoftware.b4a.objects.collections.List _lscityname = null;
int _i = 0;
anywheresoftware.b4a.objects.collections.Map _te = null;
String _name = "";
com.apps.demo.library._responseadditem _response = null;
 //BA.debugLineNum = 75;BA.debugLine="Sub country_receive(ls As List,cat As String)";
 //BA.debugLineNum = 77;BA.debugLine="pnlloading.SetVisibleAnimated(500,False)";
mostCurrent._pnlloading.SetVisibleAnimated((int) (500),anywheresoftware.b4a.keywords.Common.False);
 //BA.debugLineNum = 79;BA.debugLine="listCountry = ls";
mostCurrent._listcountry = _ls;
 //BA.debugLineNum = 81;BA.debugLine="Dim City As List";
_city = new anywheresoftware.b4a.objects.collections.List();
 //BA.debugLineNum = 82;BA.debugLine="City.Initialize";
_city.Initialize();
 //BA.debugLineNum = 84;BA.debugLine="Dim lsCountryname,lsCityname As List";
_lscountryname = new anywheresoftware.b4a.objects.collections.List();
_lscityname = new anywheresoftware.b4a.objects.collections.List();
 //BA.debugLineNum = 85;BA.debugLine="lsCountryname.Initialize";
_lscountryname.Initialize();
 //BA.debugLineNum = 86;BA.debugLine="lsCityname.Initialize";
_lscityname.Initialize();
 //BA.debugLineNum = 88;BA.debugLine="For i = 0 To ls.Size - 1";
{
final int step8 = 1;
final int limit8 = (int) (_ls.getSize()-1);
for (_i = (int) (0) ; (step8 > 0 && _i <= limit8) || (step8 < 0 && _i >= limit8); _i = ((int)(0 + _i + step8)) ) {
 //BA.debugLineNum = 90;BA.debugLine="Dim te As Map";
_te = new anywheresoftware.b4a.objects.collections.Map();
 //BA.debugLineNum = 91;BA.debugLine="te = ls.Get(i)";
_te.setObject((anywheresoftware.b4a.objects.collections.Map.MyMap)(_ls.Get(_i)));
 //BA.debugLineNum = 93;BA.debugLine="Dim name As String";
_name = "";
 //BA.debugLineNum = 94;BA.debugLine="name = te.Get(\"name\")";
_name = BA.ObjectToString(_te.Get((Object)("name")));
 //BA.debugLineNum = 95;BA.debugLine="lsCountryname.Add(name)";
_lscountryname.Add((Object)(_name));
 }
};
 //BA.debugLineNum = 99;BA.debugLine="top = Library.AddItem(Library.GetStringResourse(\"";
mostCurrent._top = (Object)(mostCurrent._library._additem(mostCurrent.activityBA,mostCurrent._library._getstringresourse(mostCurrent.activityBA,"tname"),"text","firstname",(Object)(""),mostCurrent._top,mostCurrent._sv1,anywheresoftware.b4a.keywords.Common.True).Top);
 //BA.debugLineNum = 100;BA.debugLine="top = Library.AddItem(Library.GetStringResourse(\"";
mostCurrent._top = (Object)(mostCurrent._library._additem(mostCurrent.activityBA,mostCurrent._library._getstringresourse(mostCurrent.activityBA,"lastname"),"text","lastname",(Object)(""),mostCurrent._top,mostCurrent._sv1,anywheresoftware.b4a.keywords.Common.True).Top);
 //BA.debugLineNum = 101;BA.debugLine="top = Library.AddItem(Library.GetStringResourse(\"";
mostCurrent._top = (Object)(mostCurrent._library._additem(mostCurrent.activityBA,mostCurrent._library._getstringresourse(mostCurrent.activityBA,"email"),"text","email",(Object)(""),mostCurrent._top,mostCurrent._sv1,anywheresoftware.b4a.keywords.Common.True).Top);
 //BA.debugLineNum = 102;BA.debugLine="If Guest = False Then top = Library.AddItem(Libra";
if (_guest==anywheresoftware.b4a.keywords.Common.False) { 
mostCurrent._top = (Object)(mostCurrent._library._additem(mostCurrent.activityBA,mostCurrent._library._getstringresourse(mostCurrent.activityBA,"password"),"text","password",(Object)(""),mostCurrent._top,mostCurrent._sv1,anywheresoftware.b4a.keywords.Common.True).Top);};
 //BA.debugLineNum = 103;BA.debugLine="top = Library.AddItem(Library.GetStringResourse(\"";
mostCurrent._top = (Object)(mostCurrent._library._additem(mostCurrent.activityBA,mostCurrent._library._getstringresourse(mostCurrent.activityBA,"country"),"spinner","country",(Object)(_lscountryname.getObject()),mostCurrent._top,mostCurrent._sv1,anywheresoftware.b4a.keywords.Common.False).Top);
 //BA.debugLineNum = 105;BA.debugLine="Dim response As ResponseAddItem";
_response = new com.apps.demo.library._responseadditem();
 //BA.debugLineNum = 106;BA.debugLine="response = Library.AddItem(Library.GetStringResou";
_response = mostCurrent._library._additem(mostCurrent.activityBA,mostCurrent._library._getstringresourse(mostCurrent.activityBA,"state"),"spinner","state",(Object)(_lscityname.getObject()),mostCurrent._top,mostCurrent._sv1,anywheresoftware.b4a.keywords.Common.False);
 //BA.debugLineNum = 107;BA.debugLine="spCity = response.View1";
mostCurrent._spcity.setObject((anywheresoftware.b4a.objects.SpinnerWrapper.B4ASpinner)(_response.View1.getObject()));
 //BA.debugLineNum = 108;BA.debugLine="top = response.top";
mostCurrent._top = (Object)(_response.Top);
 //BA.debugLineNum = 110;BA.debugLine="top = Library.AddItem(Library.GetStringResourse(\"";
mostCurrent._top = (Object)(mostCurrent._library._additem(mostCurrent.activityBA,mostCurrent._library._getstringresourse(mostCurrent.activityBA,"city"),"text","city",(Object)(""),mostCurrent._top,mostCurrent._sv1,anywheresoftware.b4a.keywords.Common.True).Top);
 //BA.debugLineNum = 111;BA.debugLine="top = Library.AddItem(Library.GetStringResourse(\"";
mostCurrent._top = (Object)(mostCurrent._library._additem(mostCurrent.activityBA,mostCurrent._library._getstringresourse(mostCurrent.activityBA,"address1"),"text","address_1",(Object)(""),mostCurrent._top,mostCurrent._sv1,anywheresoftware.b4a.keywords.Common.True).Top);
 //BA.debugLineNum = 112;BA.debugLine="top = top + 60dip";
mostCurrent._top = (Object)((double)(BA.ObjectToNumber(mostCurrent._top))+anywheresoftware.b4a.keywords.Common.DipToCurrent((int) (60)));
 //BA.debugLineNum = 113;BA.debugLine="top = Library.AddItem(Library.GetStringResourse(\"";
mostCurrent._top = (Object)(mostCurrent._library._additem(mostCurrent.activityBA,mostCurrent._library._getstringresourse(mostCurrent.activityBA,"postal"),"text","postcode",(Object)(""),mostCurrent._top,mostCurrent._sv1,anywheresoftware.b4a.keywords.Common.True).Top);
 //BA.debugLineNum = 114;BA.debugLine="top = Library.AddItem(Library.GetStringResourse(\"";
mostCurrent._top = (Object)(mostCurrent._library._additem(mostCurrent.activityBA,mostCurrent._library._getstringresourse(mostCurrent.activityBA,"phone"),"text","telephone",(Object)(""),mostCurrent._top,mostCurrent._sv1,anywheresoftware.b4a.keywords.Common.True).Top);
 //BA.debugLineNum = 115;BA.debugLine="top = Library.AddItem(Library.GetStringResourse(\"";
mostCurrent._top = (Object)(mostCurrent._library._additem(mostCurrent.activityBA,mostCurrent._library._getstringresourse(mostCurrent.activityBA,"fax"),"text","fax",(Object)(""),mostCurrent._top,mostCurrent._sv1,anywheresoftware.b4a.keywords.Common.True).Top);
 //BA.debugLineNum = 117;BA.debugLine="If Library.IsPersian Then";
if (mostCurrent._library._ispersian(mostCurrent.activityBA)) { 
 //BA.debugLineNum = 118;BA.debugLine="opCity.GetCity(Me,\"city_receive\",\"101\")";
mostCurrent._opcity._getcity(actregister.getObject(),"city_receive","101");
 };
 //BA.debugLineNum = 121;BA.debugLine="sv1.Panel.Height = sv1.Panel.Height + 190dip";
mostCurrent._sv1.getPanel().setHeight((int) (mostCurrent._sv1.getPanel().getHeight()+anywheresoftware.b4a.keywords.Common.DipToCurrent((int) (190))));
 //BA.debugLineNum = 123;BA.debugLine="End Sub";
return "";
}
public static String  _globals() throws Exception{
 //BA.debugLineNum = 10;BA.debugLine="Sub Globals";
 //BA.debugLineNum = 11;BA.debugLine="Private sv1 As ScrollView";
mostCurrent._sv1 = new anywheresoftware.b4a.objects.ScrollViewWrapper();
 //BA.debugLineNum = 12;BA.debugLine="Private btnregister As Button";
mostCurrent._btnregister = new anywheresoftware.b4a.objects.ButtonWrapper();
 //BA.debugLineNum = 13;BA.debugLine="Private btnlogin As Button";
mostCurrent._btnlogin = new anywheresoftware.b4a.objects.ButtonWrapper();
 //BA.debugLineNum = 14;BA.debugLine="Private lbltitle As Label";
mostCurrent._lbltitle = new anywheresoftware.b4a.objects.LabelWrapper();
 //BA.debugLineNum = 15;BA.debugLine="Private pnlloading As Panel";
mostCurrent._pnlloading = new anywheresoftware.b4a.objects.PanelWrapper();
 //BA.debugLineNum = 16;BA.debugLine="Private lblpb As Label";
mostCurrent._lblpb = new anywheresoftware.b4a.objects.LabelWrapper();
 //BA.debugLineNum = 17;BA.debugLine="Private top As Object = 0";
mostCurrent._top = (Object)(0);
 //BA.debugLineNum = 18;BA.debugLine="Private op1 As OpenCart";
mostCurrent._op1 = new com.apps.demo.opencart();
 //BA.debugLineNum = 19;BA.debugLine="Private pnlheader As Panel";
mostCurrent._pnlheader = new anywheresoftware.b4a.objects.PanelWrapper();
 //BA.debugLineNum = 20;BA.debugLine="Private listCountry,listCity As List";
mostCurrent._listcountry = new anywheresoftware.b4a.objects.collections.List();
mostCurrent._listcity = new anywheresoftware.b4a.objects.collections.List();
 //BA.debugLineNum = 21;BA.debugLine="Private opCountry,opCity As OpenCart";
mostCurrent._opcountry = new com.apps.demo.opencart();
mostCurrent._opcity = new com.apps.demo.opencart();
 //BA.debugLineNum = 22;BA.debugLine="Private spCity As Spinner";
mostCurrent._spcity = new anywheresoftware.b4a.objects.SpinnerWrapper();
 //BA.debugLineNum = 23;BA.debugLine="Private successRegister As Boolean";
_successregister = false;
 //BA.debugLineNum = 24;BA.debugLine="Private MyToastMessageShow As MyToastMessageShow";
mostCurrent._mytoastmessageshow = new com.apps.demo.mytoastmessageshow();
 //BA.debugLineNum = 25;BA.debugLine="Private chknewsletter As CheckBox";
mostCurrent._chknewsletter = new anywheresoftware.b4a.objects.CompoundButtonWrapper.CheckBoxWrapper();
 //BA.debugLineNum = 26;BA.debugLine="Private sUsername,sPassword As String";
mostCurrent._susername = "";
mostCurrent._spassword = "";
 //BA.debugLineNum = 27;BA.debugLine="End Sub";
return "";
}
public static String  _process_globals() throws Exception{
 //BA.debugLineNum = 6;BA.debugLine="Sub Process_Globals";
 //BA.debugLineNum = 7;BA.debugLine="Public Guest As Boolean";
_guest = false;
 //BA.debugLineNum = 8;BA.debugLine="End Sub";
return "";
}
public static String  _register_receive(anywheresoftware.b4a.objects.collections.Map _res,String _cat) throws Exception{
anywheresoftware.b4a.objects.collections.Map _rs1 = null;
String _err = "";
int _i = 0;
String _rs = "";
com.apps.demo.opencart _op1guest = null;
 //BA.debugLineNum = 280;BA.debugLine="Sub register_receive(res As Map,cat As String)";
 //BA.debugLineNum = 282;BA.debugLine="If res = Null Then Return";
if (_res== null) { 
if (true) return "";};
 //BA.debugLineNum = 284;BA.debugLine="pnlloading.SetVisibleAnimated(500,False)";
mostCurrent._pnlloading.SetVisibleAnimated((int) (500),anywheresoftware.b4a.keywords.Common.False);
 //BA.debugLineNum = 286;BA.debugLine="If res.IsInitialized = False Then";
if (_res.IsInitialized()==anywheresoftware.b4a.keywords.Common.False) { 
 //BA.debugLineNum = 287;BA.debugLine="MyToastMessageShow.ShowToastMessageShow(Library.";
mostCurrent._mytoastmessageshow._showtoastmessageshow(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"error_net_title"),(long) (1.5),anywheresoftware.b4a.keywords.Common.False);
 //BA.debugLineNum = 288;BA.debugLine="Return";
if (true) return "";
 };
 //BA.debugLineNum = 291;BA.debugLine="If res.ContainsKey(\"error\") Then";
if (_res.ContainsKey((Object)("error"))) { 
 //BA.debugLineNum = 292;BA.debugLine="If res.Get(\"error\") = \"User already is logged\" T";
if ((_res.Get((Object)("error"))).equals((Object)("User already is logged"))) { 
 //BA.debugLineNum = 293;BA.debugLine="MyToastMessageShow.ShowToastMessageShow(Library";
mostCurrent._mytoastmessageshow._showtoastmessageshow(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"already_login"),(long) (1.5),anywheresoftware.b4a.keywords.Common.False);
 //BA.debugLineNum = 294;BA.debugLine="Return";
if (true) return "";
 }else {
 //BA.debugLineNum = 298;BA.debugLine="Dim rs1 As Map";
_rs1 = new anywheresoftware.b4a.objects.collections.Map();
 //BA.debugLineNum = 299;BA.debugLine="rs1 = res.Get(\"error\")";
_rs1.setObject((anywheresoftware.b4a.objects.collections.Map.MyMap)(_res.Get((Object)("error"))));
 //BA.debugLineNum = 301;BA.debugLine="Dim err As String";
_err = "";
 //BA.debugLineNum = 303;BA.debugLine="For i = 0 To rs1.Size - 1";
{
final int step15 = 1;
final int limit15 = (int) (_rs1.getSize()-1);
for (_i = (int) (0) ; (step15 > 0 && _i <= limit15) || (step15 < 0 && _i >= limit15); _i = ((int)(0 + _i + step15)) ) {
 //BA.debugLineNum = 304;BA.debugLine="err = err & rs1.GetValueAt(i) & CRLF";
_err = _err+BA.ObjectToString(_rs1.GetValueAt(_i))+anywheresoftware.b4a.keywords.Common.CRLF;
 }
};
 //BA.debugLineNum = 307;BA.debugLine="MyToastMessageShow.ShowToastMessageShow(err,2,T";
mostCurrent._mytoastmessageshow._showtoastmessageshow(_err,(long) (2),anywheresoftware.b4a.keywords.Common.True);
 };
 }else if(_res.ContainsKey((Object)("success"))) { 
 //BA.debugLineNum = 313;BA.debugLine="Dim rs As String";
_rs = "";
 //BA.debugLineNum = 314;BA.debugLine="rs = res.Get(\"success\")";
_rs = BA.ObjectToString(_res.Get((Object)("success")));
 //BA.debugLineNum = 316;BA.debugLine="If rs = \"true\" Then";
if ((_rs).equals("true")) { 
 //BA.debugLineNum = 318;BA.debugLine="ToastMessageShow(Library.GetStringResourse(\"reg";
anywheresoftware.b4a.keywords.Common.ToastMessageShow(BA.ObjectToCharSequence(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"register_success")),anywheresoftware.b4a.keywords.Common.False);
 //BA.debugLineNum = 319;BA.debugLine="successRegister = True";
_successregister = anywheresoftware.b4a.keywords.Common.True;
 //BA.debugLineNum = 321;BA.debugLine="If Guest = False Then";
if (_guest==anywheresoftware.b4a.keywords.Common.False) { 
 //BA.debugLineNum = 322;BA.debugLine="Guest = False";
_guest = anywheresoftware.b4a.keywords.Common.False;
 //BA.debugLineNum = 323;BA.debugLine="actLogin.username = sUsername";
mostCurrent._actlogin._username = mostCurrent._susername;
 //BA.debugLineNum = 324;BA.debugLine="actLogin.password = sPassword";
mostCurrent._actlogin._password = mostCurrent._spassword;
 //BA.debugLineNum = 325;BA.debugLine="Activity.Finish";
mostCurrent._activity.Finish();
 //BA.debugLineNum = 326;BA.debugLine="StartActivity(actLogin)";
anywheresoftware.b4a.keywords.Common.StartActivity(mostCurrent.activityBA,(Object)(mostCurrent._actlogin.getObject()));
 }else {
 //BA.debugLineNum = 328;BA.debugLine="Guest = False";
_guest = anywheresoftware.b4a.keywords.Common.False;
 //BA.debugLineNum = 329;BA.debugLine="pnlloading.SetVisibleAnimated(500,True)";
mostCurrent._pnlloading.SetVisibleAnimated((int) (500),anywheresoftware.b4a.keywords.Common.True);
 //BA.debugLineNum = 330;BA.debugLine="Library.ChoosenAddress = 1";
mostCurrent._library._choosenaddress = (int) (1);
 //BA.debugLineNum = 331;BA.debugLine="Dim op1Guest As OpenCart";
_op1guest = new com.apps.demo.opencart();
 //BA.debugLineNum = 332;BA.debugLine="op1Guest.Initialize";
_op1guest._initialize(processBA);
 //BA.debugLineNum = 333;BA.debugLine="op1.SetGuestShipMethods(Me,\"setGuestShip_recei";
mostCurrent._op1._setguestshipmethods(actregister.getObject(),"setGuestShip_receive",mostCurrent._library._guestlogin);
 };
 //BA.debugLineNum = 336;BA.debugLine="Return";
if (true) return "";
 };
 };
 //BA.debugLineNum = 340;BA.debugLine="End Sub";
return "";
}
public static String  _setguestship_receive(anywheresoftware.b4a.objects.collections.Map _res,String _cat) throws Exception{
 //BA.debugLineNum = 342;BA.debugLine="Sub setGuestShip_receive(res As Map,cat As String)";
 //BA.debugLineNum = 344;BA.debugLine="pnlloading.SetVisibleAnimated(500,False)";
mostCurrent._pnlloading.SetVisibleAnimated((int) (500),anywheresoftware.b4a.keywords.Common.False);
 //BA.debugLineNum = 346;BA.debugLine="If res.ContainsKey(\"success\") Then";
if (_res.ContainsKey((Object)("success"))) { 
 //BA.debugLineNum = 347;BA.debugLine="If res.Get(\"success\") = True Then";
if ((_res.Get((Object)("success"))).equals((Object)(anywheresoftware.b4a.keywords.Common.True))) { 
 //BA.debugLineNum = 348;BA.debugLine="Guest = False";
_guest = anywheresoftware.b4a.keywords.Common.False;
 //BA.debugLineNum = 349;BA.debugLine="Library.GuestLogin.Put(\"login\",True)";
mostCurrent._library._guestlogin.Put((Object)("login"),(Object)(anywheresoftware.b4a.keywords.Common.True));
 //BA.debugLineNum = 350;BA.debugLine="Activity.Finish";
mostCurrent._activity.Finish();
 //BA.debugLineNum = 351;BA.debugLine="StartActivity(actDoOrder)";
anywheresoftware.b4a.keywords.Common.StartActivity(mostCurrent.activityBA,(Object)(mostCurrent._actdoorder.getObject()));
 //BA.debugLineNum = 352;BA.debugLine="Return";
if (true) return "";
 };
 };
 //BA.debugLineNum = 356;BA.debugLine="End Sub";
return "";
}
public static String  _spcity_itemclick(int _position,Object _value) throws Exception{
 //BA.debugLineNum = 161;BA.debugLine="Sub spcity_ItemClick (Position As Int, Value As Ob";
 //BA.debugLineNum = 163;BA.debugLine="End Sub";
return "";
}
public static String  _txtdata_focuschanged(boolean _hasfocus) throws Exception{
anywheresoftware.b4a.objects.EditTextWrapper _ed = null;
 //BA.debugLineNum = 375;BA.debugLine="Sub txtdata_FocusChanged (HasFocus As Boolean)";
 //BA.debugLineNum = 377;BA.debugLine="Dim ed As EditText";
_ed = new anywheresoftware.b4a.objects.EditTextWrapper();
 //BA.debugLineNum = 378;BA.debugLine="ed = Sender";
_ed.setObject((android.widget.EditText)(anywheresoftware.b4a.keywords.Common.Sender(mostCurrent.activityBA)));
 //BA.debugLineNum = 379;BA.debugLine="sv1.ScrollPosition = ed.Top-67dip";
mostCurrent._sv1.setScrollPosition((int) (_ed.getTop()-anywheresoftware.b4a.keywords.Common.DipToCurrent((int) (67))));
 //BA.debugLineNum = 381;BA.debugLine="End Sub";
return "";
}
}
