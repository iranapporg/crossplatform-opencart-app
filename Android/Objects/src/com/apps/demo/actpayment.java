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

public class actpayment extends Activity implements B4AActivity{
	public static actpayment mostCurrent;
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
			processBA = new BA(this.getApplicationContext(), null, null, "com.apps.demo", "com.apps.demo.actpayment");
			processBA.loadHtSubs(this.getClass());
	        float deviceScale = getApplicationContext().getResources().getDisplayMetrics().density;
	        BALayout.setDeviceScale(deviceScale);
            
		}
		else if (previousOne != null) {
			Activity p = previousOne.get();
			if (p != null && p != this) {
                BA.LogInfo("Killing previous instance (actpayment).");
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
		activityBA = new BA(this, layout, processBA, "com.apps.demo", "com.apps.demo.actpayment");
        
        processBA.sharedProcessBA.activityBA = new java.lang.ref.WeakReference<BA>(activityBA);
        anywheresoftware.b4a.objects.ViewWrapper.lastId = 0;
        _activity = new ActivityWrapper(activityBA, "activity");
        anywheresoftware.b4a.Msgbox.isDismissing = false;
        if (BA.isShellModeRuntimeCheck(processBA)) {
			if (isFirst)
				processBA.raiseEvent2(null, true, "SHELL", false);
			processBA.raiseEvent2(null, true, "CREATE", true, "com.apps.demo.actpayment", processBA, activityBA, _activity, anywheresoftware.b4a.keywords.Common.Density, mostCurrent);
			_activity.reinitializeForShell(activityBA, "activity");
		}
        initializeProcessGlobals();		
        initializeGlobals();
        
        BA.LogInfo("** Activity (actpayment) Create, isFirst = " + isFirst + " **");
        processBA.raiseEvent2(null, true, "activity_create", false, isFirst);
		isFirst = false;
		if (this != mostCurrent)
			return;
        processBA.setActivityPaused(false);
        BA.LogInfo("** Activity (actpayment) Resume **");
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
		return actpayment.class;
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
        BA.LogInfo("** Activity (actpayment) Pause, UserClosed = " + activityBA.activity.isFinishing() + " **");
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
            BA.LogInfo("** Activity (actpayment) Resume **");
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
public static String _data = "";
public static boolean _startpayment = false;
public anywheresoftware.b4a.objects.LabelWrapper _lbltitle = null;
public anywheresoftware.b4a.objects.PanelWrapper _pnlheader = null;
public anywheresoftware.b4a.objects.WebViewWrapper _wb1 = null;
public anywheresoftware.b4a.objects.PanelWrapper _pnlloading = null;
public anywheresoftware.b4a.objects.LabelWrapper _lblpb = null;
public uk.co.martinpearman.b4a.webkit.DefaultWebViewClient _dwvc = null;
public uk.co.martinpearman.b4a.webkit.WebViewExtras _extra = null;
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

public static void initializeProcessGlobals() {
             try {
                Class.forName(BA.applicationContext.getPackageName() + ".main").getMethod("initializeProcessGlobals").invoke(null, null);
            } catch (Exception e) {
                throw new RuntimeException(e);
            }
}
public static String  _activity_create(boolean _firsttime) throws Exception{
anywheresoftware.b4a.phone.Phone _phone1 = null;
 //BA.debugLineNum = 21;BA.debugLine="Sub Activity_Create(FirstTime As Boolean)";
 //BA.debugLineNum = 23;BA.debugLine="Library.setLocalApp(Library.currLang)";
mostCurrent._library._setlocalapp(mostCurrent.activityBA,mostCurrent._library._currlang);
 //BA.debugLineNum = 25;BA.debugLine="Library.ChangeStatusColor";
mostCurrent._library._changestatuscolor(mostCurrent.activityBA);
 //BA.debugLineNum = 27;BA.debugLine="Dim phone1 As Phone";
_phone1 = new anywheresoftware.b4a.phone.Phone();
 //BA.debugLineNum = 28;BA.debugLine="phone1.SetScreenOrientation(1)";
_phone1.SetScreenOrientation(processBA,(int) (1));
 //BA.debugLineNum = 30;BA.debugLine="Activity.LoadLayout(\"frmpayment\")";
mostCurrent._activity.LoadLayout("frmpayment",mostCurrent.activityBA);
 //BA.debugLineNum = 31;BA.debugLine="lbltitle.Text = Library.GetStringResourse(\"paymen";
mostCurrent._lbltitle.setText(BA.ObjectToCharSequence(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"payment")));
 //BA.debugLineNum = 32;BA.debugLine="pnlheader.Color = Library.Theme_Header";
mostCurrent._pnlheader.setColor(mostCurrent._library._theme_header);
 //BA.debugLineNum = 33;BA.debugLine="lblpb.Text = Library.GetStringResourse(\"loading\")";
mostCurrent._lblpb.setText(BA.ObjectToCharSequence(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"loading")));
 //BA.debugLineNum = 35;BA.debugLine="wb1.JavaScriptEnabled = True";
mostCurrent._wb1.setJavaScriptEnabled(anywheresoftware.b4a.keywords.Common.True);
 //BA.debugLineNum = 36;BA.debugLine="wb1.ZoomEnabled = False";
mostCurrent._wb1.setZoomEnabled(anywheresoftware.b4a.keywords.Common.False);
 //BA.debugLineNum = 38;BA.debugLine="End Sub";
return "";
}
public static String  _activity_pause(boolean _userclosed) throws Exception{
 //BA.debugLineNum = 99;BA.debugLine="Sub Activity_Pause (UserClosed As Boolean)";
 //BA.debugLineNum = 100;BA.debugLine="Library.AnimationFromLeft2Right";
mostCurrent._library._animationfromleft2right(mostCurrent.activityBA);
 //BA.debugLineNum = 101;BA.debugLine="End Sub";
return "";
}
public static String  _activity_resume() throws Exception{
 //BA.debugLineNum = 85;BA.debugLine="Sub Activity_Resume";
 //BA.debugLineNum = 87;BA.debugLine="If StartPayment Then";
if (_startpayment) { 
 //BA.debugLineNum = 89;BA.debugLine="StartPayment = False";
_startpayment = anywheresoftware.b4a.keywords.Common.False;
 //BA.debugLineNum = 91;BA.debugLine="GetOrderStatus(Data)";
_getorderstatus(_data);
 }else {
 //BA.debugLineNum = 94;BA.debugLine="CallURL";
_callurl();
 };
 //BA.debugLineNum = 97;BA.debugLine="End Sub";
return "";
}
public static String  _btnclose_click() throws Exception{
 //BA.debugLineNum = 103;BA.debugLine="Sub btnclose_Click";
 //BA.debugLineNum = 104;BA.debugLine="Activity.Finish";
mostCurrent._activity.Finish();
 //BA.debugLineNum = 105;BA.debugLine="End Sub";
return "";
}
public static String  _callurl() throws Exception{
anywheresoftware.b4a.objects.IntentWrapper _i = null;
String _url = "";
String _state = "";
 //BA.debugLineNum = 40;BA.debugLine="Sub CallURL";
 //BA.debugLineNum = 42;BA.debugLine="StartPayment = True";
_startpayment = anywheresoftware.b4a.keywords.Common.True;
 //BA.debugLineNum = 43;BA.debugLine="pnlloading.SetVisibleAnimated(500,True)";
mostCurrent._pnlloading.SetVisibleAnimated((int) (500),anywheresoftware.b4a.keywords.Common.True);
 //BA.debugLineNum = 45;BA.debugLine="Dim i As Intent";
_i = new anywheresoftware.b4a.objects.IntentWrapper();
 //BA.debugLineNum = 46;BA.debugLine="Dim url As String";
_url = "";
 //BA.debugLineNum = 47;BA.debugLine="Dim state As String";
_state = "";
 //BA.debugLineNum = 49;BA.debugLine="url = Library.GetStringResourse(\"url\")";
_url = mostCurrent._library._getstringresourse(mostCurrent.activityBA,"url");
 //BA.debugLineNum = 50;BA.debugLine="state = Library.GetStringResourse(\"is_https\").ToL";
_state = mostCurrent._library._getstringresourse(mostCurrent.activityBA,"is_https").toLowerCase();
 //BA.debugLineNum = 52;BA.debugLine="If state = \"1\" Or state = \"on\" Then";
if ((_state).equals("1") || (_state).equals("on")) { 
 //BA.debugLineNum = 53;BA.debugLine="url = url.Replace(\"http://\",\"https://\") & \"/inde";
_url = _url.replace("http://","https://")+"/index.php?route=rest/confirm/confirm&page=pay&access_token="+BA.ObjectToString(mostCurrent._library._token.Get((Object)("access_token")));
 }else {
 //BA.debugLineNum = 55;BA.debugLine="url = url & \"/index.php?route=rest/confirm/confi";
_url = _url+"/index.php?route=rest/confirm/confirm&page=pay&access_token="+BA.ObjectToString(mostCurrent._library._token.Get((Object)("access_token")));
 };
 //BA.debugLineNum = 58;BA.debugLine="i.Initialize(i.ACTION_VIEW,url)";
_i.Initialize(_i.ACTION_VIEW,_url);
 //BA.debugLineNum = 59;BA.debugLine="StartActivity(i)";
anywheresoftware.b4a.keywords.Common.StartActivity(mostCurrent.activityBA,(Object)(_i.getObject()));
 //BA.debugLineNum = 61;BA.debugLine="Return";
if (true) return "";
 //BA.debugLineNum = 83;BA.debugLine="End Sub";
return "";
}
public static String  _checkorder_receive(anywheresoftware.b4a.objects.collections.Map _res,String _cat) throws Exception{
com.apps.demo.opencart _op1 = null;
 //BA.debugLineNum = 168;BA.debugLine="Sub CheckOrder_receive(res As Map,cat As String)";
 //BA.debugLineNum = 170;BA.debugLine="If res.Get(\"success\") = False Then";
if ((_res.Get((Object)("success"))).equals((Object)(anywheresoftware.b4a.keywords.Common.False))) { 
 //BA.debugLineNum = 171;BA.debugLine="Activity.Finish";
mostCurrent._activity.Finish();
 //BA.debugLineNum = 172;BA.debugLine="Return";
if (true) return "";
 };
 //BA.debugLineNum = 175;BA.debugLine="Dim op1 As OpenCart";
_op1 = new com.apps.demo.opencart();
 //BA.debugLineNum = 176;BA.debugLine="op1.Initialize";
_op1._initialize(processBA);
 //BA.debugLineNum = 177;BA.debugLine="op1.SaveOrder(Me,\"SaveOrder_receive\",True)";
_op1._saveorder(actpayment.getObject(),"SaveOrder_receive",anywheresoftware.b4a.keywords.Common.True);
 //BA.debugLineNum = 179;BA.debugLine="If Library.CartDetails.IsInitialized Then";
if (mostCurrent._library._cartdetails.IsInitialized()) { 
 //BA.debugLineNum = 180;BA.debugLine="Library.CartDetails.Clear";
mostCurrent._library._cartdetails.Clear();
 };
 //BA.debugLineNum = 183;BA.debugLine="End Sub";
return "";
}
public static String  _clearcart_receive() throws Exception{
 //BA.debugLineNum = 107;BA.debugLine="Sub clearCart_receive";
 //BA.debugLineNum = 108;BA.debugLine="Activity.Finish";
mostCurrent._activity.Finish();
 //BA.debugLineNum = 109;BA.debugLine="End Sub";
return "";
}
public static String  _getorderstatus(String _id) throws Exception{
com.apps.demo.opencart _p1 = null;
 //BA.debugLineNum = 160;BA.debugLine="Sub GetOrderStatus(ID As String)";
 //BA.debugLineNum = 162;BA.debugLine="Dim p1 As OpenCart";
_p1 = new com.apps.demo.opencart();
 //BA.debugLineNum = 163;BA.debugLine="p1.Initialize";
_p1._initialize(processBA);
 //BA.debugLineNum = 164;BA.debugLine="p1.GetOrders(Me,\"CheckOrder_receive\",ID)";
_p1._getorders(actpayment.getObject(),"CheckOrder_receive",_id);
 //BA.debugLineNum = 166;BA.debugLine="End Sub";
return "";
}
public static String  _globals() throws Exception{
 //BA.debugLineNum = 11;BA.debugLine="Sub Globals";
 //BA.debugLineNum = 12;BA.debugLine="Private lbltitle As Label";
mostCurrent._lbltitle = new anywheresoftware.b4a.objects.LabelWrapper();
 //BA.debugLineNum = 13;BA.debugLine="Private pnlheader As Panel";
mostCurrent._pnlheader = new anywheresoftware.b4a.objects.PanelWrapper();
 //BA.debugLineNum = 14;BA.debugLine="Private wb1 As WebView";
mostCurrent._wb1 = new anywheresoftware.b4a.objects.WebViewWrapper();
 //BA.debugLineNum = 15;BA.debugLine="Private pnlloading As Panel";
mostCurrent._pnlloading = new anywheresoftware.b4a.objects.PanelWrapper();
 //BA.debugLineNum = 16;BA.debugLine="Private lblpb As Label";
mostCurrent._lblpb = new anywheresoftware.b4a.objects.LabelWrapper();
 //BA.debugLineNum = 17;BA.debugLine="Private dwvc As DefaultWebViewClient";
mostCurrent._dwvc = new uk.co.martinpearman.b4a.webkit.DefaultWebViewClient();
 //BA.debugLineNum = 18;BA.debugLine="Private extra As WebViewExtras";
mostCurrent._extra = new uk.co.martinpearman.b4a.webkit.WebViewExtras();
 //BA.debugLineNum = 19;BA.debugLine="End Sub";
return "";
}
public static String  _javascriptcallback_receive(String _html1) throws Exception{
anywheresoftware.b4a.objects.collections.List _lserror = null;
int _i = 0;
String _temp = "";
com.apps.demo.opencart _op1 = null;
 //BA.debugLineNum = 124;BA.debugLine="Sub JavascriptCallback_Receive(Html1 As String)";
 //BA.debugLineNum = 126;BA.debugLine="Dim lsError As List";
_lserror = new anywheresoftware.b4a.objects.collections.List();
 //BA.debugLineNum = 127;BA.debugLine="lsError.Initialize";
_lserror.Initialize();
 //BA.debugLineNum = 128;BA.debugLine="lsError.Add(\"انصراف\")";
_lserror.Add((Object)("انصراف"));
 //BA.debugLineNum = 129;BA.debugLine="lsError.Add(\"منصرف\")";
_lserror.Add((Object)("منصرف"));
 //BA.debugLineNum = 131;BA.debugLine="For i = 0 To lsError.Size - 1";
{
final int step5 = 1;
final int limit5 = (int) (_lserror.getSize()-1);
for (_i = (int) (0) ; (step5 > 0 && _i <= limit5) || (step5 < 0 && _i >= limit5); _i = ((int)(0 + _i + step5)) ) {
 //BA.debugLineNum = 132;BA.debugLine="Dim temp As String";
_temp = "";
 //BA.debugLineNum = 133;BA.debugLine="temp = lsError.Get(i)";
_temp = BA.ObjectToString(_lserror.Get(_i));
 //BA.debugLineNum = 134;BA.debugLine="If Html1.IndexOf(temp) > -1 Then";
if (_html1.indexOf(_temp)>-1) { 
 //BA.debugLineNum = 135;BA.debugLine="Activity.Finish";
mostCurrent._activity.Finish();
 //BA.debugLineNum = 136;BA.debugLine="Log(\"ok payment\")";
anywheresoftware.b4a.keywords.Common.Log("ok payment");
 //BA.debugLineNum = 137;BA.debugLine="Return";
if (true) return "";
 };
 }
};
 //BA.debugLineNum = 141;BA.debugLine="wb1.Visible = False";
mostCurrent._wb1.setVisible(anywheresoftware.b4a.keywords.Common.False);
 //BA.debugLineNum = 142;BA.debugLine="pnlloading.SetVisibleAnimated(500,True)";
mostCurrent._pnlloading.SetVisibleAnimated((int) (500),anywheresoftware.b4a.keywords.Common.True);
 //BA.debugLineNum = 144;BA.debugLine="Log(\"save order and verify it\")";
anywheresoftware.b4a.keywords.Common.Log("save order and verify it");
 //BA.debugLineNum = 146;BA.debugLine="Dim op1 As OpenCart";
_op1 = new com.apps.demo.opencart();
 //BA.debugLineNum = 147;BA.debugLine="op1.Initialize";
_op1._initialize(processBA);
 //BA.debugLineNum = 148;BA.debugLine="op1.SaveOrder(Me,\"SaveOrder_receive\",True)";
_op1._saveorder(actpayment.getObject(),"SaveOrder_receive",anywheresoftware.b4a.keywords.Common.True);
 //BA.debugLineNum = 150;BA.debugLine="If Library.CartDetails.IsInitialized Then";
if (mostCurrent._library._cartdetails.IsInitialized()) { 
 //BA.debugLineNum = 151;BA.debugLine="Library.CartDetails.Clear";
mostCurrent._library._cartdetails.Clear();
 };
 //BA.debugLineNum = 154;BA.debugLine="End Sub";
return "";
}
public static String  _process_globals() throws Exception{
 //BA.debugLineNum = 6;BA.debugLine="Sub Process_Globals";
 //BA.debugLineNum = 7;BA.debugLine="Public Data As String";
_data = "";
 //BA.debugLineNum = 8;BA.debugLine="Public StartPayment As Boolean";
_startpayment = false;
 //BA.debugLineNum = 9;BA.debugLine="End Sub";
return "";
}
public static String  _saveorder_receive(anywheresoftware.b4a.objects.collections.Map _res,String _cat) throws Exception{
 //BA.debugLineNum = 185;BA.debugLine="Sub SaveOrder_receive(res As Map,cat As String)";
 //BA.debugLineNum = 187;BA.debugLine="Dim res As Map";
_res = new anywheresoftware.b4a.objects.collections.Map();
 //BA.debugLineNum = 188;BA.debugLine="res = res.Get(\"data\")";
_res.setObject((anywheresoftware.b4a.objects.collections.Map.MyMap)(_res.Get((Object)("data"))));
 //BA.debugLineNum = 190;BA.debugLine="Library.PaymentSuccess = True";
mostCurrent._library._paymentsuccess = anywheresoftware.b4a.keywords.Common.True;
 //BA.debugLineNum = 191;BA.debugLine="Msgbox(Library.GetStringResourse(\"success_payment";
anywheresoftware.b4a.keywords.Common.Msgbox(BA.ObjectToCharSequence(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"success_payment")),BA.ObjectToCharSequence(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"alert")),mostCurrent.activityBA);
 //BA.debugLineNum = 193;BA.debugLine="Activity.Finish";
mostCurrent._activity.Finish();
 //BA.debugLineNum = 195;BA.debugLine="End Sub";
return "";
}
public static String  _wbssl_pagefinished(String _url) throws Exception{
 //BA.debugLineNum = 111;BA.debugLine="Sub wbSSL_PageFinished(Url As String)";
 //BA.debugLineNum = 113;BA.debugLine="pnlloading.SetVisibleAnimated(500,False)";
mostCurrent._pnlloading.SetVisibleAnimated((int) (500),anywheresoftware.b4a.keywords.Common.False);
 //BA.debugLineNum = 115;BA.debugLine="If Url.ToLowerCase.IndexOf(\"order_id=\") > -1 Then";
if (_url.toLowerCase().indexOf("order_id=")>-1) { 
 //BA.debugLineNum = 116;BA.debugLine="wb1.Visible = False";
mostCurrent._wb1.setVisible(anywheresoftware.b4a.keywords.Common.False);
 //BA.debugLineNum = 117;BA.debugLine="pnlloading.SetVisibleAnimated(500,True)";
mostCurrent._pnlloading.SetVisibleAnimated((int) (500),anywheresoftware.b4a.keywords.Common.True);
 //BA.debugLineNum = 118;BA.debugLine="extra.executeJavascript(\"B4A.CallSub('Javascript";
mostCurrent._extra.ExecuteJavascript("B4A.CallSub('JavascriptCallback_Receive', true, document.documentElement.outerHTML)");
 };
 //BA.debugLineNum = 121;BA.debugLine="End Sub";
return "";
}
public static String  _wbssl_receivedsslerror(uk.co.martinpearman.b4a.webkit.SslErrorHandler _sslerrorhandler1,uk.co.martinpearman.b4a.net.http.SslError _sslerror1) throws Exception{
 //BA.debugLineNum = 156;BA.debugLine="Sub wbSSL_ReceivedSslError(SslErrorHandler1 As Ssl";
 //BA.debugLineNum = 157;BA.debugLine="SslErrorHandler1.Proceed";
_sslerrorhandler1.Proceed();
 //BA.debugLineNum = 158;BA.debugLine="End Sub";
return "";
}
}
