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

public class actcompare extends Activity implements B4AActivity{
	public static actcompare mostCurrent;
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
			processBA = new BA(this.getApplicationContext(), null, null, "com.apps.demo", "com.apps.demo.actcompare");
			processBA.loadHtSubs(this.getClass());
	        float deviceScale = getApplicationContext().getResources().getDisplayMetrics().density;
	        BALayout.setDeviceScale(deviceScale);
            
		}
		else if (previousOne != null) {
			Activity p = previousOne.get();
			if (p != null && p != this) {
                BA.LogInfo("Killing previous instance (actcompare).");
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
		activityBA = new BA(this, layout, processBA, "com.apps.demo", "com.apps.demo.actcompare");
        
        processBA.sharedProcessBA.activityBA = new java.lang.ref.WeakReference<BA>(activityBA);
        anywheresoftware.b4a.objects.ViewWrapper.lastId = 0;
        _activity = new ActivityWrapper(activityBA, "activity");
        anywheresoftware.b4a.Msgbox.isDismissing = false;
        if (BA.isShellModeRuntimeCheck(processBA)) {
			if (isFirst)
				processBA.raiseEvent2(null, true, "SHELL", false);
			processBA.raiseEvent2(null, true, "CREATE", true, "com.apps.demo.actcompare", processBA, activityBA, _activity, anywheresoftware.b4a.keywords.Common.Density, mostCurrent);
			_activity.reinitializeForShell(activityBA, "activity");
		}
        initializeProcessGlobals();		
        initializeGlobals();
        
        BA.LogInfo("** Activity (actcompare) Create, isFirst = " + isFirst + " **");
        processBA.raiseEvent2(null, true, "activity_create", false, isFirst);
		isFirst = false;
		if (this != mostCurrent)
			return;
        processBA.setActivityPaused(false);
        BA.LogInfo("** Activity (actcompare) Resume **");
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
		return actcompare.class;
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
        BA.LogInfo("** Activity (actcompare) Pause, UserClosed = " + activityBA.activity.isFinishing() + " **");
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
            BA.LogInfo("** Activity (actcompare) Resume **");
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
public static int _stop = 0;
public static int _sleft = 0;
public static int _productcount = 0;
public anywheresoftware.b4a.objects.collections.Map _except_item = null;
public anywheresoftware.b4a.objects.PanelWrapper _pnldesc = null;
public anywheresoftware.b4a.objects.WebViewWrapper _wb1 = null;
public anywheresoftware.b4a.objects.PanelWrapper _pnlloading = null;
public anywheresoftware.b4a.objects.ButtonWrapper _btnclear = null;
public anywheresoftware.b4a.objects.ButtonWrapper _btnclose = null;
public static int _labelheight = 0;
public static int _labeltextsize = 0;
public anywheresoftware.b4a.objects.LabelWrapper _lblpb = null;
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

public static void initializeProcessGlobals() {
             try {
                Class.forName(BA.applicationContext.getPackageName() + ".main").getMethod("initializeProcessGlobals").invoke(null, null);
            } catch (Exception e) {
                throw new RuntimeException(e);
            }
}
public static String  _activity_create(boolean _firsttime) throws Exception{
anywheresoftware.b4a.phone.Phone _ph = null;
anywheresoftware.b4a.objects.drawable.ColorDrawable _cd = null;
com.apps.demo.opencart _op = null;
 //BA.debugLineNum = 23;BA.debugLine="Sub Activity_Create(FirstTime As Boolean)";
 //BA.debugLineNum = 25;BA.debugLine="If Activity.Height > Activity.Width Then";
if (mostCurrent._activity.getHeight()>mostCurrent._activity.getWidth()) { 
 //BA.debugLineNum = 26;BA.debugLine="Dim ph As Phone";
_ph = new anywheresoftware.b4a.phone.Phone();
 //BA.debugLineNum = 27;BA.debugLine="ph.SetScreenOrientation(0)";
_ph.SetScreenOrientation(processBA,(int) (0));
 //BA.debugLineNum = 28;BA.debugLine="Return";
if (true) return "";
 };
 //BA.debugLineNum = 31;BA.debugLine="Library.setLocalApp(Library.currLang)";
mostCurrent._library._setlocalapp(mostCurrent.activityBA,mostCurrent._library._currlang);
 //BA.debugLineNum = 33;BA.debugLine="Activity.LoadLayout(\"frmcompare\")";
mostCurrent._activity.LoadLayout("frmcompare",mostCurrent.activityBA);
 //BA.debugLineNum = 35;BA.debugLine="Library.ChangeStatusColor";
mostCurrent._library._changestatuscolor(mostCurrent.activityBA);
 //BA.debugLineNum = 37;BA.debugLine="lblpb.Text = Library.GetStringResourse(\"loading\")";
mostCurrent._lblpb.setText(BA.ObjectToCharSequence(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"loading")));
 //BA.debugLineNum = 39;BA.debugLine="If Library.GetDevicePhysicalSize > 5 Then";
if (mostCurrent._library._getdevicephysicalsize(mostCurrent.activityBA)>5) { 
 //BA.debugLineNum = 40;BA.debugLine="LabelTextSize	= 16";
_labeltextsize = (int) (16);
 //BA.debugLineNum = 41;BA.debugLine="LabelHeight		= 70dip";
_labelheight = anywheresoftware.b4a.keywords.Common.DipToCurrent((int) (70));
 }else {
 //BA.debugLineNum = 43;BA.debugLine="LabelTextSize = 11";
_labeltextsize = (int) (11);
 //BA.debugLineNum = 44;BA.debugLine="LabelHeight		= 30dip";
_labelheight = anywheresoftware.b4a.keywords.Common.DipToCurrent((int) (30));
 };
 //BA.debugLineNum = 47;BA.debugLine="Dim cd As ColorDrawable";
_cd = new anywheresoftware.b4a.objects.drawable.ColorDrawable();
 //BA.debugLineNum = 48;BA.debugLine="cd.Initialize(Library.Theme_Header,50)";
_cd.Initialize(mostCurrent._library._theme_header,(int) (50));
 //BA.debugLineNum = 49;BA.debugLine="btnclear.Background = cd";
mostCurrent._btnclear.setBackground((android.graphics.drawable.Drawable)(_cd.getObject()));
 //BA.debugLineNum = 50;BA.debugLine="btnclose.Background = cd";
mostCurrent._btnclose.setBackground((android.graphics.drawable.Drawable)(_cd.getObject()));
 //BA.debugLineNum = 52;BA.debugLine="except_item.Initialize";
mostCurrent._except_item.Initialize();
 //BA.debugLineNum = 53;BA.debugLine="except_item.Put(\"thumb\",1)";
mostCurrent._except_item.Put((Object)("thumb"),(Object)(1));
 //BA.debugLineNum = 54;BA.debugLine="except_item.Put(\"attribute\",1)";
mostCurrent._except_item.Put((Object)("attribute"),(Object)(1));
 //BA.debugLineNum = 55;BA.debugLine="except_item.Put(\"product_id\",1)";
mostCurrent._except_item.Put((Object)("product_id"),(Object)(1));
 //BA.debugLineNum = 57;BA.debugLine="sv1.Color = Colors.White";
mostCurrent._sv1.setColor(anywheresoftware.b4a.keywords.Common.Colors.White);
 //BA.debugLineNum = 58;BA.debugLine="sv1.Panel.Color = Colors.White";
mostCurrent._sv1.getPanel().setColor(anywheresoftware.b4a.keywords.Common.Colors.White);
 //BA.debugLineNum = 60;BA.debugLine="Dim op As OpenCart";
_op = new com.apps.demo.opencart();
 //BA.debugLineNum = 61;BA.debugLine="op.Initialize";
_op._initialize(processBA);
 //BA.debugLineNum = 62;BA.debugLine="op.CompareProduct(Me,\"receive_compare\")";
_op._compareproduct(actcompare.getObject(),"receive_compare");
 //BA.debugLineNum = 64;BA.debugLine="End Sub";
return "";
}
public static String  _activity_pause(boolean _userclosed) throws Exception{
 //BA.debugLineNum = 70;BA.debugLine="Sub Activity_Pause (UserClosed As Boolean)";
 //BA.debugLineNum = 72;BA.debugLine="End Sub";
return "";
}
public static String  _activity_resume() throws Exception{
 //BA.debugLineNum = 66;BA.debugLine="Sub Activity_Resume";
 //BA.debugLineNum = 68;BA.debugLine="End Sub";
return "";
}
public static String  _btnclear_click() throws Exception{
 //BA.debugLineNum = 268;BA.debugLine="Sub btnclear_Click";
 //BA.debugLineNum = 269;BA.debugLine="Library.ListProductIDForCompare.Clear";
mostCurrent._library._listproductidforcompare.Clear();
 //BA.debugLineNum = 270;BA.debugLine="Library.AnimationFromLeft2Right";
mostCurrent._library._animationfromleft2right(mostCurrent.activityBA);
 //BA.debugLineNum = 271;BA.debugLine="Activity.Finish";
mostCurrent._activity.Finish();
 //BA.debugLineNum = 272;BA.debugLine="End Sub";
return "";
}
public static String  _btnclose_click() throws Exception{
 //BA.debugLineNum = 264;BA.debugLine="Sub btnclose_Click";
 //BA.debugLineNum = 265;BA.debugLine="pnldesc.SetVisibleAnimated(600,False)";
mostCurrent._pnldesc.SetVisibleAnimated((int) (600),anywheresoftware.b4a.keywords.Common.False);
 //BA.debugLineNum = 266;BA.debugLine="End Sub";
return "";
}
public static int  _getitemwidth() throws Exception{
int _rs = 0;
 //BA.debugLineNum = 197;BA.debugLine="Sub GetItemWidth As Int";
 //BA.debugLineNum = 199;BA.debugLine="Dim rs As Int";
_rs = 0;
 //BA.debugLineNum = 200;BA.debugLine="rs = Activity.Width / (ProductCount+1)";
_rs = (int) (mostCurrent._activity.getWidth()/(double)(_productcount+1));
 //BA.debugLineNum = 202;BA.debugLine="Return rs";
if (true) return _rs;
 //BA.debugLineNum = 204;BA.debugLine="End Sub";
return 0;
}
public static anywheresoftware.b4a.objects.PanelWrapper  _getrate(String _rate) throws Exception{
anywheresoftware.b4a.objects.PanelWrapper _p1 = null;
int _left = 0;
String _unstar = "";
String _star = "";
int _i = 0;
anywheresoftware.b4a.objects.LabelWrapper _r1 = null;
 //BA.debugLineNum = 229;BA.debugLine="Sub GetRate(Rate As String) As Panel";
 //BA.debugLineNum = 231;BA.debugLine="Dim p1 As Panel";
_p1 = new anywheresoftware.b4a.objects.PanelWrapper();
 //BA.debugLineNum = 232;BA.debugLine="p1.Initialize(\"\")";
_p1.Initialize(mostCurrent.activityBA,"");
 //BA.debugLineNum = 233;BA.debugLine="p1.Color = Colors.RGB(239,239,239)";
_p1.setColor(anywheresoftware.b4a.keywords.Common.Colors.RGB((int) (239),(int) (239),(int) (239)));
 //BA.debugLineNum = 235;BA.debugLine="Dim left As Int";
_left = 0;
 //BA.debugLineNum = 236;BA.debugLine="left = 10";
_left = (int) (10);
 //BA.debugLineNum = 238;BA.debugLine="Dim unstar,star As String";
_unstar = "";
_star = "";
 //BA.debugLineNum = 239;BA.debugLine="unstar = \"\"";
_unstar = "";
 //BA.debugLineNum = 240;BA.debugLine="star = \"\"";
_star = "";
 //BA.debugLineNum = 242;BA.debugLine="For i = 0 To 4";
{
final int step9 = 1;
final int limit9 = (int) (4);
for (_i = (int) (0) ; (step9 > 0 && _i <= limit9) || (step9 < 0 && _i >= limit9); _i = ((int)(0 + _i + step9)) ) {
 //BA.debugLineNum = 244;BA.debugLine="Dim r1 As Label";
_r1 = new anywheresoftware.b4a.objects.LabelWrapper();
 //BA.debugLineNum = 245;BA.debugLine="r1.Initialize(\"\")";
_r1.Initialize(mostCurrent.activityBA,"");
 //BA.debugLineNum = 246;BA.debugLine="r1.Typeface = Typeface.LoadFromAssets(\"icomoon.t";
_r1.setTypeface(anywheresoftware.b4a.keywords.Common.Typeface.LoadFromAssets("icomoon.ttf"));
 //BA.debugLineNum = 248;BA.debugLine="If Rate > i Then";
if ((double)(Double.parseDouble(_rate))>_i) { 
 //BA.debugLineNum = 249;BA.debugLine="r1.Text = star";
_r1.setText(BA.ObjectToCharSequence(_star));
 }else {
 //BA.debugLineNum = 251;BA.debugLine="r1.Text = unstar";
_r1.setText(BA.ObjectToCharSequence(_unstar));
 };
 //BA.debugLineNum = 254;BA.debugLine="r1.TextColor = Library.Theme_Header";
_r1.setTextColor(mostCurrent._library._theme_header);
 //BA.debugLineNum = 255;BA.debugLine="p1.AddView(r1,left,9,GetItemWidth/5,30dip)";
_p1.AddView((android.view.View)(_r1.getObject()),_left,(int) (9),(int) (_getitemwidth()/(double)5),anywheresoftware.b4a.keywords.Common.DipToCurrent((int) (30)));
 //BA.debugLineNum = 256;BA.debugLine="left = left + r1.Width";
_left = (int) (_left+_r1.getWidth());
 }
};
 //BA.debugLineNum = 260;BA.debugLine="Return p1";
if (true) return _p1;
 //BA.debugLineNum = 262;BA.debugLine="End Sub";
return null;
}
public static String  _globals() throws Exception{
 //BA.debugLineNum = 10;BA.debugLine="Sub Globals";
 //BA.debugLineNum = 11;BA.debugLine="Private sv1 As ScrollView";
mostCurrent._sv1 = new anywheresoftware.b4a.objects.ScrollViewWrapper();
 //BA.debugLineNum = 12;BA.debugLine="Dim sTop,sLeft,ProductCount As Int";
_stop = 0;
_sleft = 0;
_productcount = 0;
 //BA.debugLineNum = 13;BA.debugLine="Dim except_item As Map";
mostCurrent._except_item = new anywheresoftware.b4a.objects.collections.Map();
 //BA.debugLineNum = 14;BA.debugLine="Private pnldesc As Panel";
mostCurrent._pnldesc = new anywheresoftware.b4a.objects.PanelWrapper();
 //BA.debugLineNum = 15;BA.debugLine="Private wb1 As WebView";
mostCurrent._wb1 = new anywheresoftware.b4a.objects.WebViewWrapper();
 //BA.debugLineNum = 16;BA.debugLine="Private pnlloading As Panel";
mostCurrent._pnlloading = new anywheresoftware.b4a.objects.PanelWrapper();
 //BA.debugLineNum = 17;BA.debugLine="Private btnclear As Button";
mostCurrent._btnclear = new anywheresoftware.b4a.objects.ButtonWrapper();
 //BA.debugLineNum = 18;BA.debugLine="Private btnclose As Button";
mostCurrent._btnclose = new anywheresoftware.b4a.objects.ButtonWrapper();
 //BA.debugLineNum = 19;BA.debugLine="Private LabelHeight,LabelTextSize As Int";
_labelheight = 0;
_labeltextsize = 0;
 //BA.debugLineNum = 20;BA.debugLine="Private lblpb As Label";
mostCurrent._lblpb = new anywheresoftware.b4a.objects.LabelWrapper();
 //BA.debugLineNum = 21;BA.debugLine="End Sub";
return "";
}
public static String  _lbldesc_click() throws Exception{
anywheresoftware.b4a.objects.LabelWrapper _lb = null;
String _style = "";
 //BA.debugLineNum = 206;BA.debugLine="Sub lbldesc_Click";
 //BA.debugLineNum = 208;BA.debugLine="Dim lb As Label";
_lb = new anywheresoftware.b4a.objects.LabelWrapper();
 //BA.debugLineNum = 209;BA.debugLine="lb = Sender";
_lb.setObject((android.widget.TextView)(anywheresoftware.b4a.keywords.Common.Sender(mostCurrent.activityBA)));
 //BA.debugLineNum = 211;BA.debugLine="lb.SetColorAnimated(700,Colors.White,Colors.RGB(2";
_lb.SetColorAnimated((int) (700),anywheresoftware.b4a.keywords.Common.Colors.White,anywheresoftware.b4a.keywords.Common.Colors.RGB((int) (239),(int) (239),(int) (239)));
 //BA.debugLineNum = 213;BA.debugLine="If lb.Tag = Null Then lb.Tag = \"-\"";
if (_lb.getTag()== null) { 
_lb.setTag((Object)("-"));};
 //BA.debugLineNum = 215;BA.debugLine="Dim style As String";
_style = "";
 //BA.debugLineNum = 216;BA.debugLine="style = $\"<body style=\"background-color:#F7F4F4;l";
_style = ("<body style=\"background-color:#F7F4F4;line-height:25px;font-family:tahoma;");
 //BA.debugLineNum = 218;BA.debugLine="If Library.IsPersian Then";
if (mostCurrent._library._ispersian(mostCurrent.activityBA)) { 
 //BA.debugLineNum = 219;BA.debugLine="style = style & $\"direction:rtl\">\"$";
_style = _style+("direction:rtl\">");
 }else {
 //BA.debugLineNum = 221;BA.debugLine="style = style & $\"direction:ltr\">\"$";
_style = _style+("direction:ltr\">");
 };
 //BA.debugLineNum = 224;BA.debugLine="wb1.LoadHtml(style & lb.Tag)";
mostCurrent._wb1.LoadHtml(_style+BA.ObjectToString(_lb.getTag()));
 //BA.debugLineNum = 225;BA.debugLine="pnldesc.SetVisibleAnimated(600,True)";
mostCurrent._pnldesc.SetVisibleAnimated((int) (600),anywheresoftware.b4a.keywords.Common.True);
 //BA.debugLineNum = 227;BA.debugLine="End Sub";
return "";
}
public static String  _process_globals() throws Exception{
 //BA.debugLineNum = 6;BA.debugLine="Sub Process_Globals";
 //BA.debugLineNum = 8;BA.debugLine="End Sub";
return "";
}
public static String  _receive_compare(anywheresoftware.b4a.objects.collections.Map _data) throws Exception{
anywheresoftware.b4a.objects.collections.Map _ls = null;
anywheresoftware.b4a.objects.collections.Map _temp = null;
uk.co.martinpearman.b4a.text.Html _html1 = null;
String _click_here = "";
String _d1 = "";
anywheresoftware.b4a.objects.collections.Map _pro = null;
String _field = "";
anywheresoftware.b4a.objects.LabelWrapper _l1 = null;
 //BA.debugLineNum = 74;BA.debugLine="Sub receive_compare(Data As Map)";
 //BA.debugLineNum = 76;BA.debugLine="If Data.ContainsKey(\"success\") Then";
if (_data.ContainsKey((Object)("success"))) { 
 //BA.debugLineNum = 77;BA.debugLine="If Data.Get(\"success\") = True Then";
if ((_data.Get((Object)("success"))).equals((Object)(anywheresoftware.b4a.keywords.Common.True))) { 
 //BA.debugLineNum = 79;BA.debugLine="Dim ls As Map";
_ls = new anywheresoftware.b4a.objects.collections.Map();
 //BA.debugLineNum = 80;BA.debugLine="ls = Data.Get(\"data\")";
_ls.setObject((anywheresoftware.b4a.objects.collections.Map.MyMap)(_data.Get((Object)("data"))));
 //BA.debugLineNum = 82;BA.debugLine="If ls.Size = 0 Then";
if (_ls.getSize()==0) { 
 //BA.debugLineNum = 83;BA.debugLine="Activity.Finish";
mostCurrent._activity.Finish();
 //BA.debugLineNum = 84;BA.debugLine="Return";
if (true) return "";
 };
 //BA.debugLineNum = 87;BA.debugLine="ProductCount = ls.Size";
_productcount = _ls.getSize();
 //BA.debugLineNum = 89;BA.debugLine="Dim temp As Map";
_temp = new anywheresoftware.b4a.objects.collections.Map();
 //BA.debugLineNum = 90;BA.debugLine="temp = ls.Get(ls.GetKeyAt(ls.Size-1))";
_temp.setObject((anywheresoftware.b4a.objects.collections.Map.MyMap)(_ls.Get(_ls.GetKeyAt((int) (_ls.getSize()-1)))));
 //BA.debugLineNum = 91;BA.debugLine="ShowHeader(temp)";
_showheader(_temp);
 //BA.debugLineNum = 93;BA.debugLine="Dim html1 As Html";
_html1 = new uk.co.martinpearman.b4a.text.Html();
 //BA.debugLineNum = 94;BA.debugLine="Dim click_here As String";
_click_here = "";
 //BA.debugLineNum = 95;BA.debugLine="click_here = Library.GetStringResourse(\"click_h";
_click_here = mostCurrent._library._getstringresourse(mostCurrent.activityBA,"click_here");
 //BA.debugLineNum = 97;BA.debugLine="For Each d1 As String In ls.Keys";
final anywheresoftware.b4a.BA.IterableList group16 = _ls.Keys();
final int groupLen16 = group16.getSize();
for (int index16 = 0;index16 < groupLen16 ;index16++){
_d1 = BA.ObjectToString(group16.Get(index16));
 //BA.debugLineNum = 99;BA.debugLine="Dim pro As Map";
_pro = new anywheresoftware.b4a.objects.collections.Map();
 //BA.debugLineNum = 100;BA.debugLine="pro = ls.Get(d1)";
_pro.setObject((anywheresoftware.b4a.objects.collections.Map.MyMap)(_ls.Get((Object)(_d1))));
 //BA.debugLineNum = 102;BA.debugLine="For Each field As String In pro.Keys";
final anywheresoftware.b4a.BA.IterableList group19 = _pro.Keys();
final int groupLen19 = group19.getSize();
for (int index19 = 0;index19 < groupLen19 ;index19++){
_field = BA.ObjectToString(group19.Get(index19));
 //BA.debugLineNum = 104;BA.debugLine="If except_item.ContainsKey(field) = True Then";
if (mostCurrent._except_item.ContainsKey((Object)(_field))==anywheresoftware.b4a.keywords.Common.True) { 
if (true) continue;};
 //BA.debugLineNum = 106;BA.debugLine="If field = \"rating\" Then";
if ((_field).equals("rating")) { 
 //BA.debugLineNum = 107;BA.debugLine="sv1.Panel.AddView(GetRate(pro.Get(field)),sL";
mostCurrent._sv1.getPanel().AddView((android.view.View)(_getrate(BA.ObjectToString(_pro.Get((Object)(_field)))).getObject()),_sleft,_stop,_getitemwidth(),_labelheight);
 //BA.debugLineNum = 108;BA.debugLine="sTop = sTop + 30dip+1dip";
_stop = (int) (_stop+anywheresoftware.b4a.keywords.Common.DipToCurrent((int) (30))+anywheresoftware.b4a.keywords.Common.DipToCurrent((int) (1)));
 //BA.debugLineNum = 109;BA.debugLine="Continue";
if (true) continue;
 };
 //BA.debugLineNum = 112;BA.debugLine="Dim l1 As Label";
_l1 = new anywheresoftware.b4a.objects.LabelWrapper();
 //BA.debugLineNum = 114;BA.debugLine="If field.ToLowerCase = \"description\" Then";
if ((_field.toLowerCase()).equals("description")) { 
 //BA.debugLineNum = 115;BA.debugLine="l1.Initialize(\"lbldesc\")";
_l1.Initialize(mostCurrent.activityBA,"lbldesc");
 //BA.debugLineNum = 116;BA.debugLine="l1.Text = click_here";
_l1.setText(BA.ObjectToCharSequence(_click_here));
 //BA.debugLineNum = 117;BA.debugLine="l1.TextColor = Library.Theme_Header";
_l1.setTextColor(mostCurrent._library._theme_header);
 //BA.debugLineNum = 118;BA.debugLine="l1.Tag = html1.FromHtml(pro.Get(field))";
_l1.setTag((Object)(_html1.FromHtml(BA.ObjectToString(_pro.Get((Object)(_field))))));
 }else {
 //BA.debugLineNum = 120;BA.debugLine="l1.Initialize(\"\")";
_l1.Initialize(mostCurrent.activityBA,"");
 //BA.debugLineNum = 121;BA.debugLine="l1.Text = html1.FromHtml(pro.Get(field))";
_l1.setText(_html1.FromHtml(BA.ObjectToString(_pro.Get((Object)(_field)))));
 //BA.debugLineNum = 122;BA.debugLine="l1.TextColor = Colors.Black";
_l1.setTextColor(anywheresoftware.b4a.keywords.Common.Colors.Black);
 };
 //BA.debugLineNum = 125;BA.debugLine="If field = \"price\" Or field = \"special\" Then";
if ((_field).equals("price") || (_field).equals("special")) { 
 //BA.debugLineNum = 126;BA.debugLine="If pro.Get(field) = False Then l1.Text = Lib";
if ((_pro.Get((Object)(_field))).equals((Object)(anywheresoftware.b4a.keywords.Common.False))) { 
_l1.setText(BA.ObjectToCharSequence(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"login_account")));};
 };
 //BA.debugLineNum = 129;BA.debugLine="If pro.Get(field) = Null Then l1.Text = \"-\"";
if (_pro.Get((Object)(_field))== null) { 
_l1.setText(BA.ObjectToCharSequence("-"));};
 //BA.debugLineNum = 131;BA.debugLine="l1.Gravity = Gravity.CENTER";
_l1.setGravity(anywheresoftware.b4a.keywords.Common.Gravity.CENTER);
 //BA.debugLineNum = 132;BA.debugLine="l1.Color = Colors.RGB(239,239,239)";
_l1.setColor(anywheresoftware.b4a.keywords.Common.Colors.RGB((int) (239),(int) (239),(int) (239)));
 //BA.debugLineNum = 133;BA.debugLine="l1.Typeface = Library.GetFont";
_l1.setTypeface((android.graphics.Typeface)(mostCurrent._library._getfont(mostCurrent.activityBA).getObject()));
 //BA.debugLineNum = 134;BA.debugLine="l1.TextSize = LabelTextSize";
_l1.setTextSize((float) (_labeltextsize));
 //BA.debugLineNum = 135;BA.debugLine="sv1.Panel.AddView(l1,sLeft,sTop,GetItemWidth,";
mostCurrent._sv1.getPanel().AddView((android.view.View)(_l1.getObject()),_sleft,_stop,_getitemwidth(),_labelheight);
 //BA.debugLineNum = 136;BA.debugLine="Library.LabelSpace(l1,1.5)";
mostCurrent._library._labelspace(mostCurrent.activityBA,(anywheresoftware.b4a.objects.ConcreteViewWrapper) anywheresoftware.b4a.AbsObjectWrapper.ConvertToWrapper(new anywheresoftware.b4a.objects.ConcreteViewWrapper(), (android.view.View)(_l1.getObject())),(float) (1.5));
 //BA.debugLineNum = 137;BA.debugLine="sTop = sTop + l1.Height+1dip";
_stop = (int) (_stop+_l1.getHeight()+anywheresoftware.b4a.keywords.Common.DipToCurrent((int) (1)));
 }
;
 //BA.debugLineNum = 141;BA.debugLine="sLeft = sLeft + GetItemWidth + 2dip";
_sleft = (int) (_sleft+_getitemwidth()+anywheresoftware.b4a.keywords.Common.DipToCurrent((int) (2)));
 //BA.debugLineNum = 142;BA.debugLine="sTop = 40dip";
_stop = anywheresoftware.b4a.keywords.Common.DipToCurrent((int) (40));
 }
;
 };
 };
 //BA.debugLineNum = 149;BA.debugLine="pnlloading.Visible = False";
mostCurrent._pnlloading.setVisible(anywheresoftware.b4a.keywords.Common.False);
 //BA.debugLineNum = 151;BA.debugLine="End Sub";
return "";
}
public static String  _showheader(anywheresoftware.b4a.objects.collections.Map _data) throws Exception{
anywheresoftware.b4a.objects.LabelWrapper _header = null;
String _v1 = "";
anywheresoftware.b4a.objects.LabelWrapper _l1 = null;
 //BA.debugLineNum = 153;BA.debugLine="Sub ShowHeader(Data As Map)";
 //BA.debugLineNum = 155;BA.debugLine="Dim header As Label";
_header = new anywheresoftware.b4a.objects.LabelWrapper();
 //BA.debugLineNum = 156;BA.debugLine="header.Initialize(\"\")";
_header.Initialize(mostCurrent.activityBA,"");
 //BA.debugLineNum = 157;BA.debugLine="header.Text = Library.GetStringResourse(\"campare_";
_header.setText(BA.ObjectToCharSequence(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"campare_title")));
 //BA.debugLineNum = 158;BA.debugLine="header.Color = Library.Theme_Header";
_header.setColor(mostCurrent._library._theme_header);
 //BA.debugLineNum = 159;BA.debugLine="header.TextColor = Colors.White";
_header.setTextColor(anywheresoftware.b4a.keywords.Common.Colors.White);
 //BA.debugLineNum = 160;BA.debugLine="header.Typeface = Library.GetFont";
_header.setTypeface((android.graphics.Typeface)(mostCurrent._library._getfont(mostCurrent.activityBA).getObject()));
 //BA.debugLineNum = 161;BA.debugLine="header.TextSize = 13";
_header.setTextSize((float) (13));
 //BA.debugLineNum = 162;BA.debugLine="Library.LabelSpace(header,1.8)";
mostCurrent._library._labelspace(mostCurrent.activityBA,(anywheresoftware.b4a.objects.ConcreteViewWrapper) anywheresoftware.b4a.AbsObjectWrapper.ConvertToWrapper(new anywheresoftware.b4a.objects.ConcreteViewWrapper(), (android.view.View)(_header.getObject())),(float) (1.8));
 //BA.debugLineNum = 163;BA.debugLine="header.Gravity = Bit.Or(Gravity.CENTER_HORIZONTAL";
_header.setGravity(anywheresoftware.b4a.keywords.Common.Bit.Or(anywheresoftware.b4a.keywords.Common.Gravity.CENTER_HORIZONTAL,anywheresoftware.b4a.keywords.Common.Gravity.CENTER_VERTICAL));
 //BA.debugLineNum = 165;BA.debugLine="sv1.Panel.AddView(header,0,0,100%x,40dip)";
mostCurrent._sv1.getPanel().AddView((android.view.View)(_header.getObject()),(int) (0),(int) (0),anywheresoftware.b4a.keywords.Common.PerXToCurrent((float) (100),mostCurrent.activityBA),anywheresoftware.b4a.keywords.Common.DipToCurrent((int) (40)));
 //BA.debugLineNum = 167;BA.debugLine="sTop = 40dip";
_stop = anywheresoftware.b4a.keywords.Common.DipToCurrent((int) (40));
 //BA.debugLineNum = 169;BA.debugLine="For Each v1 As String In Data.Keys";
final anywheresoftware.b4a.BA.IterableList group12 = _data.Keys();
final int groupLen12 = group12.getSize();
for (int index12 = 0;index12 < groupLen12 ;index12++){
_v1 = BA.ObjectToString(group12.Get(index12));
 //BA.debugLineNum = 171;BA.debugLine="If except_item.ContainsKey(v1) = True Then Conti";
if (mostCurrent._except_item.ContainsKey((Object)(_v1))==anywheresoftware.b4a.keywords.Common.True) { 
if (true) continue;};
 //BA.debugLineNum = 173;BA.debugLine="Dim l1 As Label";
_l1 = new anywheresoftware.b4a.objects.LabelWrapper();
 //BA.debugLineNum = 174;BA.debugLine="l1.Initialize(\"\")";
_l1.Initialize(mostCurrent.activityBA,"");
 //BA.debugLineNum = 175;BA.debugLine="l1.Text = \" \" & Library.GetStringResourse(v1)";
_l1.setText(BA.ObjectToCharSequence(" "+mostCurrent._library._getstringresourse(mostCurrent.activityBA,_v1)));
 //BA.debugLineNum = 177;BA.debugLine="If l1.Text.Length = 0 Then l1.Text = v1";
if (_l1.getText().length()==0) { 
_l1.setText(BA.ObjectToCharSequence(_v1));};
 //BA.debugLineNum = 179;BA.debugLine="l1.TextColor = Colors.White";
_l1.setTextColor(anywheresoftware.b4a.keywords.Common.Colors.White);
 //BA.debugLineNum = 180;BA.debugLine="l1.TextSize = LabelTextSize";
_l1.setTextSize((float) (_labeltextsize));
 //BA.debugLineNum = 181;BA.debugLine="l1.Typeface = Typeface.LoadFromAssets(\"byekan.tt";
_l1.setTypeface(anywheresoftware.b4a.keywords.Common.Typeface.LoadFromAssets("byekan.ttf"));
 //BA.debugLineNum = 182;BA.debugLine="l1.Gravity = Gravity.CENTER";
_l1.setGravity(anywheresoftware.b4a.keywords.Common.Gravity.CENTER);
 //BA.debugLineNum = 183;BA.debugLine="l1.Color = Library.Theme_Header";
_l1.setColor(mostCurrent._library._theme_header);
 //BA.debugLineNum = 184;BA.debugLine="sv1.Panel.AddView(l1,0,sTop,GetItemWidth,LabelHe";
mostCurrent._sv1.getPanel().AddView((android.view.View)(_l1.getObject()),(int) (0),_stop,_getitemwidth(),_labelheight);
 //BA.debugLineNum = 185;BA.debugLine="Library.LabelSpace(l1,1.5)";
mostCurrent._library._labelspace(mostCurrent.activityBA,(anywheresoftware.b4a.objects.ConcreteViewWrapper) anywheresoftware.b4a.AbsObjectWrapper.ConvertToWrapper(new anywheresoftware.b4a.objects.ConcreteViewWrapper(), (android.view.View)(_l1.getObject())),(float) (1.5));
 //BA.debugLineNum = 186;BA.debugLine="sTop = sTop + l1.Height+1dip";
_stop = (int) (_stop+_l1.getHeight()+anywheresoftware.b4a.keywords.Common.DipToCurrent((int) (1)));
 }
;
 //BA.debugLineNum = 190;BA.debugLine="sLeft = GetItemWidth";
_sleft = _getitemwidth();
 //BA.debugLineNum = 191;BA.debugLine="sv1.Panel.Height = sTop";
mostCurrent._sv1.getPanel().setHeight(_stop);
 //BA.debugLineNum = 193;BA.debugLine="sTop = 40dip";
_stop = anywheresoftware.b4a.keywords.Common.DipToCurrent((int) (40));
 //BA.debugLineNum = 195;BA.debugLine="End Sub";
return "";
}
}
