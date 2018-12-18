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

public class actsearch extends Activity implements B4AActivity{
	public static actsearch mostCurrent;
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
			processBA = new BA(this.getApplicationContext(), null, null, "com.apps.demo", "com.apps.demo.actsearch");
			processBA.loadHtSubs(this.getClass());
	        float deviceScale = getApplicationContext().getResources().getDisplayMetrics().density;
	        BALayout.setDeviceScale(deviceScale);
            
		}
		else if (previousOne != null) {
			Activity p = previousOne.get();
			if (p != null && p != this) {
                BA.LogInfo("Killing previous instance (actsearch).");
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
		activityBA = new BA(this, layout, processBA, "com.apps.demo", "com.apps.demo.actsearch");
        
        processBA.sharedProcessBA.activityBA = new java.lang.ref.WeakReference<BA>(activityBA);
        anywheresoftware.b4a.objects.ViewWrapper.lastId = 0;
        _activity = new ActivityWrapper(activityBA, "activity");
        anywheresoftware.b4a.Msgbox.isDismissing = false;
        if (BA.isShellModeRuntimeCheck(processBA)) {
			if (isFirst)
				processBA.raiseEvent2(null, true, "SHELL", false);
			processBA.raiseEvent2(null, true, "CREATE", true, "com.apps.demo.actsearch", processBA, activityBA, _activity, anywheresoftware.b4a.keywords.Common.Density, mostCurrent);
			_activity.reinitializeForShell(activityBA, "activity");
		}
        initializeProcessGlobals();		
        initializeGlobals();
        
        BA.LogInfo("** Activity (actsearch) Create, isFirst = " + isFirst + " **");
        processBA.raiseEvent2(null, true, "activity_create", false, isFirst);
		isFirst = false;
		if (this != mostCurrent)
			return;
        processBA.setActivityPaused(false);
        BA.LogInfo("** Activity (actsearch) Resume **");
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
		return actsearch.class;
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
        BA.LogInfo("** Activity (actsearch) Pause, UserClosed = " + activityBA.activity.isFinishing() + " **");
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
            BA.LogInfo("** Activity (actsearch) Resume **");
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
public anywheresoftware.b4a.objects.EditTextWrapper _txtsearch = null;
public anywheresoftware.b4a.objects.ProgressBarWrapper _pbloading = null;
public anywheresoftware.b4a.objects.PanelWrapper _pnlloading = null;
public anywheresoftware.b4a.objects.ScrollViewWrapper _sv1 = null;
public anywheresoftware.b4a.objects.LabelWrapper _lblpb = null;
public anywheresoftware.b4a.objects.PanelWrapper _pnlheader = null;
public com.apps.demo.opencart _searchmodule = null;
public static int _top = 0;
public com.apps.demo.mytoastmessageshow _mytoastmessageshow = null;
public anywheresoftware.b4a.objects.ButtonWrapper _btnclose = null;
public anywheresoftware.b4a.objects.ButtonWrapper _btnlist = null;
public anywheresoftware.b4a.objects.ButtonWrapper _btnsearch = null;
public anywheresoftware.b4a.objects.ImageViewWrapper _divider = null;
public anywheresoftware.b4a.objects.LabelWrapper _label2 = null;
public anywheresoftware.b4a.objects.LabelWrapper _label3 = null;
public anywheresoftware.b4a.objects.LabelWrapper _lblcompare = null;
public anywheresoftware.b4a.objects.LabelWrapper _lbldivider1 = null;
public anywheresoftware.b4a.objects.LabelWrapper _lbldivier2 = null;
public anywheresoftware.b4a.objects.LabelWrapper _lblfield = null;
public anywheresoftware.b4a.objects.LabelWrapper _lbllogical = null;
public anywheresoftware.b4a.objects.ButtonWrapper _lblsearch = null;
public anywheresoftware.b4a.objects.LabelWrapper _lblsort_item = null;
public anywheresoftware.b4a.objects.LabelWrapper _lblsort_type = null;
public anywheresoftware.b4a.objects.LabelWrapper _lblval = null;
public anywheresoftware.b4a.objects.PanelWrapper _pnlfilter = null;
public anywheresoftware.b4a.objects.PanelWrapper _pnlloading1 = null;
public anywheresoftware.b4a.objects.PanelWrapper _pnlsearch = null;
public anywheresoftware.b4a.objects.CompoundButtonWrapper.RadioButtonWrapper _rbasc = null;
public anywheresoftware.b4a.objects.CompoundButtonWrapper.RadioButtonWrapper _rbdesc = null;
public anywheresoftware.b4a.objects.SpinnerWrapper _txtcampare = null;
public anywheresoftware.b4a.objects.SpinnerWrapper _txtfields = null;
public anywheresoftware.b4a.objects.SpinnerWrapper _txtlogic = null;
public anywheresoftware.b4a.objects.SpinnerWrapper _txtsort_item = null;
public anywheresoftware.b4a.objects.EditTextWrapper _txtval = null;
public anywheresoftware.b4a.objects.ScrollViewWrapper _svfilter = null;
public anywheresoftware.b4a.objects.ButtonWrapper _btnadd = null;
public anywheresoftware.b4a.objects.collections.List _listcondition = null;
public anywheresoftware.b4a.objects.collections.List _listconditionview = null;
public anywheresoftware.b4a.objects.collections.Map _filter = null;
public static int _topfilter = 0;
public anywheresoftware.b4a.objects.IME _ime = null;
public anywheresoftware.b4a.objects.collections.List _listfields = null;
public anywheresoftware.b4a.objects.collections.List _listsortfields = null;
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
com.views.setting.ViewsSetting _vs = null;
 //BA.debugLineNum = 60;BA.debugLine="Sub Activity_Create(FirstTime As Boolean)";
 //BA.debugLineNum = 62;BA.debugLine="Activity.LoadLayout(\"frmsearch\")";
mostCurrent._activity.LoadLayout("frmsearch",mostCurrent.activityBA);
 //BA.debugLineNum = 63;BA.debugLine="MyToastMessageShow.Initialize(Activity)";
mostCurrent._mytoastmessageshow._initialize(mostCurrent.activityBA,(anywheresoftware.b4a.objects.PanelWrapper) anywheresoftware.b4a.AbsObjectWrapper.ConvertToWrapper(new anywheresoftware.b4a.objects.PanelWrapper(), (android.view.ViewGroup)(mostCurrent._activity.getObject())));
 //BA.debugLineNum = 64;BA.debugLine="Library.setLocalApp(Library.currLang)";
mostCurrent._library._setlocalapp(mostCurrent.activityBA,mostCurrent._library._currlang);
 //BA.debugLineNum = 66;BA.debugLine="IME.Initialize(\"\")";
mostCurrent._ime.Initialize("");
 //BA.debugLineNum = 68;BA.debugLine="Library.ChangeStatusColor";
mostCurrent._library._changestatuscolor(mostCurrent.activityBA);
 //BA.debugLineNum = 70;BA.debugLine="lbltitle.Text = Library.GetStringResourse(\"search";
mostCurrent._lbltitle.setText(BA.ObjectToCharSequence(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"search_title")));
 //BA.debugLineNum = 71;BA.debugLine="lblpb.Text = Library.GetStringResourse(\"loading\")";
mostCurrent._lblpb.setText(BA.ObjectToCharSequence(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"loading")));
 //BA.debugLineNum = 72;BA.debugLine="pnlheader.Color = Library.Theme_Header";
mostCurrent._pnlheader.setColor(mostCurrent._library._theme_header);
 //BA.debugLineNum = 73;BA.debugLine="searchmodule.Initialize";
mostCurrent._searchmodule._initialize(processBA);
 //BA.debugLineNum = 74;BA.debugLine="txtsearch.Color = Colors.White";
mostCurrent._txtsearch.setColor(anywheresoftware.b4a.keywords.Common.Colors.White);
 //BA.debugLineNum = 75;BA.debugLine="txtsearch.RequestFocus";
mostCurrent._txtsearch.RequestFocus();
 //BA.debugLineNum = 77;BA.debugLine="sv1.Panel.Color = Colors.Transparent";
mostCurrent._sv1.getPanel().setColor(anywheresoftware.b4a.keywords.Common.Colors.Transparent);
 //BA.debugLineNum = 78;BA.debugLine="sv1.Color = Colors.Transparent";
mostCurrent._sv1.setColor(anywheresoftware.b4a.keywords.Common.Colors.Transparent);
 //BA.debugLineNum = 80;BA.debugLine="Dim vs As ViewSetting";
_vs = new com.views.setting.ViewsSetting();
 //BA.debugLineNum = 81;BA.debugLine="vs.setCursorDrawableColor(txtsearch,Library.Theme";
_vs.setCursorDrawableColor((android.widget.EditText)(mostCurrent._txtsearch.getObject()),mostCurrent._library._theme_header);
 //BA.debugLineNum = 83;BA.debugLine="listCondition.Initialize";
mostCurrent._listcondition.Initialize();
 //BA.debugLineNum = 84;BA.debugLine="Filter.Initialize";
mostCurrent._filter.Initialize();
 //BA.debugLineNum = 85;BA.debugLine="listConditionView.Initialize";
mostCurrent._listconditionview.Initialize();
 //BA.debugLineNum = 87;BA.debugLine="LoadFilterPanel";
_loadfilterpanel();
 //BA.debugLineNum = 89;BA.debugLine="If Library.IsPersian = False Then";
if (mostCurrent._library._ispersian(mostCurrent.activityBA)==anywheresoftware.b4a.keywords.Common.False) { 
 //BA.debugLineNum = 90;BA.debugLine="txtsearch.Gravity = Gravity.LEFT";
mostCurrent._txtsearch.setGravity(anywheresoftware.b4a.keywords.Common.Gravity.LEFT);
 };
 //BA.debugLineNum = 93;BA.debugLine="End Sub";
return "";
}
public static boolean  _activity_keypress(int _keycode) throws Exception{
 //BA.debugLineNum = 103;BA.debugLine="Sub Activity_KeyPress (KeyCode As Int) As Boolean";
 //BA.debugLineNum = 105;BA.debugLine="If KeyCode = KeyCodes.KEYCODE_BACK Then";
if (_keycode==anywheresoftware.b4a.keywords.Common.KeyCodes.KEYCODE_BACK) { 
 //BA.debugLineNum = 106;BA.debugLine="If svfilter.Visible = True Then";
if (mostCurrent._svfilter.getVisible()==anywheresoftware.b4a.keywords.Common.True) { 
 //BA.debugLineNum = 107;BA.debugLine="btnlist_Click";
_btnlist_click();
 //BA.debugLineNum = 108;BA.debugLine="Return True";
if (true) return anywheresoftware.b4a.keywords.Common.True;
 };
 //BA.debugLineNum = 110;BA.debugLine="Activity.Finish";
mostCurrent._activity.Finish();
 };
 //BA.debugLineNum = 113;BA.debugLine="End Sub";
return false;
}
public static String  _activity_pause(boolean _userclosed) throws Exception{
 //BA.debugLineNum = 99;BA.debugLine="Sub Activity_Pause (UserClosed As Boolean)";
 //BA.debugLineNum = 100;BA.debugLine="Library.AnimationFromLeft2Right";
mostCurrent._library._animationfromleft2right(mostCurrent.activityBA);
 //BA.debugLineNum = 101;BA.debugLine="End Sub";
return "";
}
public static String  _activity_resume() throws Exception{
 //BA.debugLineNum = 95;BA.debugLine="Sub Activity_Resume";
 //BA.debugLineNum = 97;BA.debugLine="End Sub";
return "";
}
public static String  _add2cart2_receive(anywheresoftware.b4a.objects.collections.Map _res,String _cat) throws Exception{
anywheresoftware.b4a.objects.collections.Map _rs = null;
 //BA.debugLineNum = 195;BA.debugLine="Sub Add2Cart2_receive(res As Map,cat As String)";
 //BA.debugLineNum = 197;BA.debugLine="ProgressDialogHide";
anywheresoftware.b4a.keywords.Common.ProgressDialogHide();
 //BA.debugLineNum = 199;BA.debugLine="If res.ContainsKey(\"error\") Then";
if (_res.ContainsKey((Object)("error"))) { 
 //BA.debugLineNum = 201;BA.debugLine="Dim rs As Map";
_rs = new anywheresoftware.b4a.objects.collections.Map();
 //BA.debugLineNum = 203;BA.debugLine="rs = res.Get(\"error\")";
_rs.setObject((anywheresoftware.b4a.objects.collections.Map.MyMap)(_res.Get((Object)("error"))));
 //BA.debugLineNum = 205;BA.debugLine="If rs.ContainsKey(\"option\") Then";
if (_rs.ContainsKey((Object)("option"))) { 
 //BA.debugLineNum = 206;BA.debugLine="ToastMessageShow(Library.GetStringResourse(\"can";
anywheresoftware.b4a.keywords.Common.ToastMessageShow(BA.ObjectToCharSequence(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"cannot_add_cart")),anywheresoftware.b4a.keywords.Common.True);
 //BA.debugLineNum = 207;BA.debugLine="actProduct.product = CreateMap(\"product_id\":Lib";
mostCurrent._actproduct._product = anywheresoftware.b4a.keywords.Common.createMap(new Object[] {(Object)("product_id"),(Object)(mostCurrent._library._productchoosenid)});
 //BA.debugLineNum = 208;BA.debugLine="Library.ProductChoosenID = 0";
mostCurrent._library._productchoosenid = BA.NumberToString(0);
 //BA.debugLineNum = 209;BA.debugLine="StartActivity(actProduct)";
anywheresoftware.b4a.keywords.Common.StartActivity(mostCurrent.activityBA,(Object)(mostCurrent._actproduct.getObject()));
 //BA.debugLineNum = 210;BA.debugLine="Return";
if (true) return "";
 };
 };
 //BA.debugLineNum = 215;BA.debugLine="If res.Get(\"success\") = True Then";
if ((_res.Get((Object)("success"))).equals((Object)(anywheresoftware.b4a.keywords.Common.True))) { 
 //BA.debugLineNum = 216;BA.debugLine="MyToastMessageShow.ShowToastMessageShow(Library.";
mostCurrent._mytoastmessageshow._showtoastmessageshow(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"add2cart"),(long) (1.5),anywheresoftware.b4a.keywords.Common.True);
 };
 //BA.debugLineNum = 219;BA.debugLine="Library.ProductChoosenID = 0";
mostCurrent._library._productchoosenid = BA.NumberToString(0);
 //BA.debugLineNum = 221;BA.debugLine="End Sub";
return "";
}
public static String  _btnadd_2_cart_click() throws Exception{
 //BA.debugLineNum = 186;BA.debugLine="Sub btnadd_2_cart_Click";
 //BA.debugLineNum = 193;BA.debugLine="End Sub";
return "";
}
public static String  _btnadd_click() throws Exception{
String _order = "";
com.apps.demo.mytoastmessageshow _toastmessageshow1 = null;
anywheresoftware.b4a.objects.LabelWrapper _lbl = null;
anywheresoftware.b4a.objects.LabelWrapper _lbl1 = null;
anywheresoftware.b4a.objects.LabelWrapper _sdivider = null;
 //BA.debugLineNum = 223;BA.debugLine="Sub btnadd_Click";
 //BA.debugLineNum = 225;BA.debugLine="Dim order As String";
_order = "";
 //BA.debugLineNum = 227;BA.debugLine="If listCondition.Size = 0 Then";
if (mostCurrent._listcondition.getSize()==0) { 
 //BA.debugLineNum = 229;BA.debugLine="If rbasc.Checked = True Then";
if (mostCurrent._rbasc.getChecked()==anywheresoftware.b4a.keywords.Common.True) { 
 //BA.debugLineNum = 230;BA.debugLine="order = \"asc\"";
_order = "asc";
 }else {
 //BA.debugLineNum = 232;BA.debugLine="order = \"desc\"";
_order = "desc";
 };
 //BA.debugLineNum = 235;BA.debugLine="Filter.Put(\"sort\",listSortFields.Get(txtsort_ite";
mostCurrent._filter.Put((Object)("sort"),mostCurrent._listsortfields.Get(mostCurrent._txtsort_item.getSelectedIndex()));
 //BA.debugLineNum = 236;BA.debugLine="Filter.Put(\"order\",order)";
mostCurrent._filter.Put((Object)("order"),(Object)(_order));
 };
 //BA.debugLineNum = 240;BA.debugLine="If txtval.Text.Length = 0 Then";
if (mostCurrent._txtval.getText().length()==0) { 
 //BA.debugLineNum = 241;BA.debugLine="Dim ToastMessageShow1 As MyToastMessageShow";
_toastmessageshow1 = new com.apps.demo.mytoastmessageshow();
 //BA.debugLineNum = 242;BA.debugLine="ToastMessageShow1.Initialize(Activity)";
_toastmessageshow1._initialize(mostCurrent.activityBA,(anywheresoftware.b4a.objects.PanelWrapper) anywheresoftware.b4a.AbsObjectWrapper.ConvertToWrapper(new anywheresoftware.b4a.objects.PanelWrapper(), (android.view.ViewGroup)(mostCurrent._activity.getObject())));
 //BA.debugLineNum = 243;BA.debugLine="ToastMessageShow1.ShowToastMessageShow(Library.G";
_toastmessageshow1._showtoastmessageshow(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"filter_error_val"),(long) (1.8),anywheresoftware.b4a.keywords.Common.False);
 //BA.debugLineNum = 244;BA.debugLine="Return";
if (true) return "";
 };
 //BA.debugLineNum = 247;BA.debugLine="listCondition.Add(CreateMap(\"field\":listFields.Ge";
mostCurrent._listcondition.Add((Object)(anywheresoftware.b4a.keywords.Common.createMap(new Object[] {(Object)("field"),mostCurrent._listfields.Get(mostCurrent._txtfields.getSelectedIndex()),(Object)("operand"),(Object)(mostCurrent._txtcampare.getSelectedItem()),(Object)("value"),(Object)(mostCurrent._txtval.getText())}).getObject()));
 //BA.debugLineNum = 249;BA.debugLine="Dim lbl As Label";
_lbl = new anywheresoftware.b4a.objects.LabelWrapper();
 //BA.debugLineNum = 250;BA.debugLine="lbl.Initialize(\"\")";
_lbl.Initialize(mostCurrent.activityBA,"");
 //BA.debugLineNum = 251;BA.debugLine="lbl.TextColor = Colors.Black";
_lbl.setTextColor(anywheresoftware.b4a.keywords.Common.Colors.Black);
 //BA.debugLineNum = 252;BA.debugLine="lbl.Typeface = Library.GetFont";
_lbl.setTypeface((android.graphics.Typeface)(mostCurrent._library._getfont(mostCurrent.activityBA).getObject()));
 //BA.debugLineNum = 253;BA.debugLine="lbl.TextSize = 14";
_lbl.setTextSize((float) (14));
 //BA.debugLineNum = 254;BA.debugLine="lbl.Gravity = Library.GetStringResourse(\"directio";
_lbl.setGravity((int)(Double.parseDouble(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"direction"))));
 //BA.debugLineNum = 255;BA.debugLine="lbl.Text = \"   [ \" & Library.GetStringResourse(\"f";
_lbl.setText(BA.ObjectToCharSequence("   [ "+mostCurrent._library._getstringresourse(mostCurrent.activityBA,"filter_show_field")+mostCurrent._txtfields.getSelectedItem()+" ] , [ "+mostCurrent._txtcampare.getSelectedItem()+" ]"));
 //BA.debugLineNum = 256;BA.debugLine="svfilter.Panel.AddView(lbl,0,topFilter,svfilter.W";
mostCurrent._svfilter.getPanel().AddView((android.view.View)(_lbl.getObject()),(int) (0),_topfilter,mostCurrent._svfilter.getWidth(),anywheresoftware.b4a.keywords.Common.DipToCurrent((int) (40)));
 //BA.debugLineNum = 257;BA.debugLine="svfilter.Panel.Height = svfilter.Panel.Height + 4";
mostCurrent._svfilter.getPanel().setHeight((int) (mostCurrent._svfilter.getPanel().getHeight()+anywheresoftware.b4a.keywords.Common.DipToCurrent((int) (40))));
 //BA.debugLineNum = 258;BA.debugLine="listConditionView.Add(lbl)";
mostCurrent._listconditionview.Add((Object)(_lbl.getObject()));
 //BA.debugLineNum = 260;BA.debugLine="topFilter = topFilter + 40dip";
_topfilter = (int) (_topfilter+anywheresoftware.b4a.keywords.Common.DipToCurrent((int) (40)));
 //BA.debugLineNum = 262;BA.debugLine="Dim lbl1 As Label";
_lbl1 = new anywheresoftware.b4a.objects.LabelWrapper();
 //BA.debugLineNum = 263;BA.debugLine="lbl1.Initialize(\"\")";
_lbl1.Initialize(mostCurrent.activityBA,"");
 //BA.debugLineNum = 264;BA.debugLine="lbl1.TextColor = Colors.Black";
_lbl1.setTextColor(anywheresoftware.b4a.keywords.Common.Colors.Black);
 //BA.debugLineNum = 265;BA.debugLine="lbl1.Typeface = Library.GetFont";
_lbl1.setTypeface((android.graphics.Typeface)(mostCurrent._library._getfont(mostCurrent.activityBA).getObject()));
 //BA.debugLineNum = 266;BA.debugLine="lbl1.TextSize = 14";
_lbl1.setTextSize((float) (14));
 //BA.debugLineNum = 267;BA.debugLine="lbl1.Gravity = Library.GetStringResourse(\"directi";
_lbl1.setGravity((int)(Double.parseDouble(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"direction"))));
 //BA.debugLineNum = 268;BA.debugLine="lbl1.Text = \"   \" & Library.GetStringResourse(\"fi";
_lbl1.setText(BA.ObjectToCharSequence("   "+mostCurrent._library._getstringresourse(mostCurrent.activityBA,"filter_show_val")+mostCurrent._txtval.getText()));
 //BA.debugLineNum = 269;BA.debugLine="svfilter.Panel.AddView(lbl1,0,topFilter,svfilter.";
mostCurrent._svfilter.getPanel().AddView((android.view.View)(_lbl1.getObject()),(int) (0),_topfilter,mostCurrent._svfilter.getWidth(),anywheresoftware.b4a.keywords.Common.DipToCurrent((int) (40)));
 //BA.debugLineNum = 270;BA.debugLine="listConditionView.Add(lbl1)";
mostCurrent._listconditionview.Add((Object)(_lbl1.getObject()));
 //BA.debugLineNum = 272;BA.debugLine="topFilter = topFilter + 45dip";
_topfilter = (int) (_topfilter+anywheresoftware.b4a.keywords.Common.DipToCurrent((int) (45)));
 //BA.debugLineNum = 273;BA.debugLine="svfilter.Panel.Height = svfilter.Panel.Height + 4";
mostCurrent._svfilter.getPanel().setHeight((int) (mostCurrent._svfilter.getPanel().getHeight()+anywheresoftware.b4a.keywords.Common.DipToCurrent((int) (40))));
 //BA.debugLineNum = 275;BA.debugLine="Dim sdivider As Label";
_sdivider = new anywheresoftware.b4a.objects.LabelWrapper();
 //BA.debugLineNum = 276;BA.debugLine="sdivider.Initialize(\"\")";
_sdivider.Initialize(mostCurrent.activityBA,"");
 //BA.debugLineNum = 277;BA.debugLine="sdivider.Color = Colors.Gray";
_sdivider.setColor(anywheresoftware.b4a.keywords.Common.Colors.Gray);
 //BA.debugLineNum = 278;BA.debugLine="svfilter.Panel.AddView(sdivider,10,topFilter,svfi";
mostCurrent._svfilter.getPanel().AddView((android.view.View)(_sdivider.getObject()),(int) (10),_topfilter,(int) (mostCurrent._svfilter.getWidth()-20),anywheresoftware.b4a.keywords.Common.DipToCurrent((int) (1)));
 //BA.debugLineNum = 279;BA.debugLine="listConditionView.Add(sdivider)";
mostCurrent._listconditionview.Add((Object)(_sdivider.getObject()));
 //BA.debugLineNum = 280;BA.debugLine="topFilter = topFilter + 5dip";
_topfilter = (int) (_topfilter+anywheresoftware.b4a.keywords.Common.DipToCurrent((int) (5)));
 //BA.debugLineNum = 281;BA.debugLine="svfilter.Panel.Height = svfilter.Panel.Height + 1";
mostCurrent._svfilter.getPanel().setHeight((int) (mostCurrent._svfilter.getPanel().getHeight()+anywheresoftware.b4a.keywords.Common.DipToCurrent((int) (12))));
 //BA.debugLineNum = 283;BA.debugLine="If listCondition.Size = 1 Then svfilter.ScrollPos";
if (mostCurrent._listcondition.getSize()==1) { 
mostCurrent._svfilter.setScrollPosition(_sdivider.getTop());};
 //BA.debugLineNum = 285;BA.debugLine="txtval.Text = \"\"";
mostCurrent._txtval.setText(BA.ObjectToCharSequence(""));
 //BA.debugLineNum = 287;BA.debugLine="End Sub";
return "";
}
public static String  _btnclose_click() throws Exception{
 //BA.debugLineNum = 166;BA.debugLine="Sub btnclose_Click";
 //BA.debugLineNum = 167;BA.debugLine="Activity.Finish";
mostCurrent._activity.Finish();
 //BA.debugLineNum = 168;BA.debugLine="End Sub";
return "";
}
public static String  _btnlist_click() throws Exception{
int _i = 0;
anywheresoftware.b4a.objects.ConcreteViewWrapper _v1 = null;
 //BA.debugLineNum = 313;BA.debugLine="Sub btnlist_Click";
 //BA.debugLineNum = 315;BA.debugLine="If svfilter.Visible = False Then";
if (mostCurrent._svfilter.getVisible()==anywheresoftware.b4a.keywords.Common.False) { 
 //BA.debugLineNum = 316;BA.debugLine="svfilter.SetVisibleAnimated(500,True)";
mostCurrent._svfilter.SetVisibleAnimated((int) (500),anywheresoftware.b4a.keywords.Common.True);
 //BA.debugLineNum = 317;BA.debugLine="btnlist.Text = Library.GetStringResourse(\"filter";
mostCurrent._btnlist.setText(BA.ObjectToCharSequence(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"filter_search")));
 //BA.debugLineNum = 318;BA.debugLine="svfilter.BringToFront";
mostCurrent._svfilter.BringToFront();
 //BA.debugLineNum = 319;BA.debugLine="listCondition.Clear";
mostCurrent._listcondition.Clear();
 //BA.debugLineNum = 320;BA.debugLine="Filter.Clear";
mostCurrent._filter.Clear();
 //BA.debugLineNum = 321;BA.debugLine="IME.HideKeyboard";
mostCurrent._ime.HideKeyboard(mostCurrent.activityBA);
 }else {
 //BA.debugLineNum = 324;BA.debugLine="IME.HideKeyboard";
mostCurrent._ime.HideKeyboard(mostCurrent.activityBA);
 //BA.debugLineNum = 326;BA.debugLine="svfilter.ScrollPosition = 0";
mostCurrent._svfilter.setScrollPosition((int) (0));
 //BA.debugLineNum = 327;BA.debugLine="topFilter = btnadd.top + btnadd.Height + 30dip";
_topfilter = (int) (mostCurrent._btnadd.getTop()+mostCurrent._btnadd.getHeight()+anywheresoftware.b4a.keywords.Common.DipToCurrent((int) (30)));
 //BA.debugLineNum = 329;BA.debugLine="For i = 0 To listConditionView.Size - 1";
{
final int step12 = 1;
final int limit12 = (int) (mostCurrent._listconditionview.getSize()-1);
for (_i = (int) (0) ; (step12 > 0 && _i <= limit12) || (step12 < 0 && _i >= limit12); _i = ((int)(0 + _i + step12)) ) {
 //BA.debugLineNum = 330;BA.debugLine="Dim v1 As View";
_v1 = new anywheresoftware.b4a.objects.ConcreteViewWrapper();
 //BA.debugLineNum = 331;BA.debugLine="v1 = listConditionView.Get(i)";
_v1.setObject((android.view.View)(mostCurrent._listconditionview.Get(_i)));
 //BA.debugLineNum = 332;BA.debugLine="v1.RemoveView";
_v1.RemoveView();
 //BA.debugLineNum = 333;BA.debugLine="DoEvents";
anywheresoftware.b4a.keywords.Common.DoEvents();
 }
};
 //BA.debugLineNum = 336;BA.debugLine="svfilter.SetVisibleAnimated(500,False)";
mostCurrent._svfilter.SetVisibleAnimated((int) (500),anywheresoftware.b4a.keywords.Common.False);
 //BA.debugLineNum = 337;BA.debugLine="btnlist.Text = Library.GetStringResourse(\"filter";
mostCurrent._btnlist.setText(BA.ObjectToCharSequence(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"filter_button")));
 };
 //BA.debugLineNum = 341;BA.debugLine="End Sub";
return "";
}
public static String  _btnsearch_click() throws Exception{
com.apps.demo.opencart _op = null;
 //BA.debugLineNum = 289;BA.debugLine="Sub btnsearch_Click";
 //BA.debugLineNum = 291;BA.debugLine="If Library.InternetState = False Then";
if (mostCurrent._library._internetstate(mostCurrent.activityBA)==anywheresoftware.b4a.keywords.Common.False) { 
 //BA.debugLineNum = 292;BA.debugLine="MyToastMessageShow.ShowToastMessageShow(Library.";
mostCurrent._mytoastmessageshow._showtoastmessageshow(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"error_net_details"),(long) (1.5),anywheresoftware.b4a.keywords.Common.False);
 //BA.debugLineNum = 293;BA.debugLine="Return";
if (true) return "";
 };
 //BA.debugLineNum = 296;BA.debugLine="If listCondition.Size = 0 Then";
if (mostCurrent._listcondition.getSize()==0) { 
 //BA.debugLineNum = 297;BA.debugLine="MyToastMessageShow.ShowToastMessageShow(Library.";
mostCurrent._mytoastmessageshow._showtoastmessageshow(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"no_filter"),(long) (1.8),anywheresoftware.b4a.keywords.Common.False);
 //BA.debugLineNum = 298;BA.debugLine="Return";
if (true) return "";
 };
 //BA.debugLineNum = 301;BA.debugLine="Filter.Put(\"filters\",listCondition)";
mostCurrent._filter.Put((Object)("filters"),(Object)(mostCurrent._listcondition.getObject()));
 //BA.debugLineNum = 303;BA.debugLine="pnlloading.SetVisibleAnimated(500,True)";
mostCurrent._pnlloading.SetVisibleAnimated((int) (500),anywheresoftware.b4a.keywords.Common.True);
 //BA.debugLineNum = 305;BA.debugLine="Dim op As OpenCart";
_op = new com.apps.demo.opencart();
 //BA.debugLineNum = 306;BA.debugLine="op.Initialize";
_op._initialize(processBA);
 //BA.debugLineNum = 307;BA.debugLine="op.CustomSearchProduct(Me,\"product_receive\",Filte";
_op._customsearchproduct(actsearch.getObject(),"product_receive",mostCurrent._filter,(int) (1000));
 //BA.debugLineNum = 309;BA.debugLine="btnlist_Click";
_btnlist_click();
 //BA.debugLineNum = 311;BA.debugLine="End Sub";
return "";
}
public static String  _endsearch_load(int _lasttop) throws Exception{
 //BA.debugLineNum = 162;BA.debugLine="Sub EndSearch_Load(LastTop As Int)";
 //BA.debugLineNum = 163;BA.debugLine="sv1.Panel.Height = sv1.Panel.Height + 500";
mostCurrent._sv1.getPanel().setHeight((int) (mostCurrent._sv1.getPanel().getHeight()+500));
 //BA.debugLineNum = 164;BA.debugLine="End Sub";
return "";
}
public static String  _globals() throws Exception{
 //BA.debugLineNum = 10;BA.debugLine="Sub Globals";
 //BA.debugLineNum = 11;BA.debugLine="Private lbltitle As Label";
mostCurrent._lbltitle = new anywheresoftware.b4a.objects.LabelWrapper();
 //BA.debugLineNum = 12;BA.debugLine="Private txtsearch As EditText";
mostCurrent._txtsearch = new anywheresoftware.b4a.objects.EditTextWrapper();
 //BA.debugLineNum = 13;BA.debugLine="Private pbloading As ProgressBar";
mostCurrent._pbloading = new anywheresoftware.b4a.objects.ProgressBarWrapper();
 //BA.debugLineNum = 14;BA.debugLine="Private pnlloading As Panel";
mostCurrent._pnlloading = new anywheresoftware.b4a.objects.PanelWrapper();
 //BA.debugLineNum = 15;BA.debugLine="Private sv1 As ScrollView";
mostCurrent._sv1 = new anywheresoftware.b4a.objects.ScrollViewWrapper();
 //BA.debugLineNum = 16;BA.debugLine="Private lblpb As Label";
mostCurrent._lblpb = new anywheresoftware.b4a.objects.LabelWrapper();
 //BA.debugLineNum = 17;BA.debugLine="Private pnlheader As Panel";
mostCurrent._pnlheader = new anywheresoftware.b4a.objects.PanelWrapper();
 //BA.debugLineNum = 18;BA.debugLine="Private searchmodule As OpenCart";
mostCurrent._searchmodule = new com.apps.demo.opencart();
 //BA.debugLineNum = 19;BA.debugLine="Private top As Int = 10";
_top = (int) (10);
 //BA.debugLineNum = 20;BA.debugLine="Private MyToastMessageShow As MyToastMessageShow";
mostCurrent._mytoastmessageshow = new com.apps.demo.mytoastmessageshow();
 //BA.debugLineNum = 23;BA.debugLine="Private btnclose As Button";
mostCurrent._btnclose = new anywheresoftware.b4a.objects.ButtonWrapper();
 //BA.debugLineNum = 24;BA.debugLine="Private btnlist As Button";
mostCurrent._btnlist = new anywheresoftware.b4a.objects.ButtonWrapper();
 //BA.debugLineNum = 25;BA.debugLine="Private btnsearch As Button";
mostCurrent._btnsearch = new anywheresoftware.b4a.objects.ButtonWrapper();
 //BA.debugLineNum = 26;BA.debugLine="Private divider As ImageView";
mostCurrent._divider = new anywheresoftware.b4a.objects.ImageViewWrapper();
 //BA.debugLineNum = 27;BA.debugLine="Private Label2 As Label";
mostCurrent._label2 = new anywheresoftware.b4a.objects.LabelWrapper();
 //BA.debugLineNum = 28;BA.debugLine="Private Label3 As Label";
mostCurrent._label3 = new anywheresoftware.b4a.objects.LabelWrapper();
 //BA.debugLineNum = 29;BA.debugLine="Private lblcompare As Label";
mostCurrent._lblcompare = new anywheresoftware.b4a.objects.LabelWrapper();
 //BA.debugLineNum = 30;BA.debugLine="Private lbldivider1 As Label";
mostCurrent._lbldivider1 = new anywheresoftware.b4a.objects.LabelWrapper();
 //BA.debugLineNum = 31;BA.debugLine="Private lbldivier2 As Label";
mostCurrent._lbldivier2 = new anywheresoftware.b4a.objects.LabelWrapper();
 //BA.debugLineNum = 32;BA.debugLine="Private lblfield As Label";
mostCurrent._lblfield = new anywheresoftware.b4a.objects.LabelWrapper();
 //BA.debugLineNum = 33;BA.debugLine="Private lbllogical As Label";
mostCurrent._lbllogical = new anywheresoftware.b4a.objects.LabelWrapper();
 //BA.debugLineNum = 34;BA.debugLine="Private lblsearch As Button";
mostCurrent._lblsearch = new anywheresoftware.b4a.objects.ButtonWrapper();
 //BA.debugLineNum = 35;BA.debugLine="Private lblsort_item As Label";
mostCurrent._lblsort_item = new anywheresoftware.b4a.objects.LabelWrapper();
 //BA.debugLineNum = 36;BA.debugLine="Private lblsort_type As Label";
mostCurrent._lblsort_type = new anywheresoftware.b4a.objects.LabelWrapper();
 //BA.debugLineNum = 37;BA.debugLine="Private lblval As Label";
mostCurrent._lblval = new anywheresoftware.b4a.objects.LabelWrapper();
 //BA.debugLineNum = 38;BA.debugLine="Private pnlfilter As Panel";
mostCurrent._pnlfilter = new anywheresoftware.b4a.objects.PanelWrapper();
 //BA.debugLineNum = 39;BA.debugLine="Private pnlloading1 As Panel";
mostCurrent._pnlloading1 = new anywheresoftware.b4a.objects.PanelWrapper();
 //BA.debugLineNum = 40;BA.debugLine="Private pnlsearch As Panel";
mostCurrent._pnlsearch = new anywheresoftware.b4a.objects.PanelWrapper();
 //BA.debugLineNum = 41;BA.debugLine="Private rbasc As RadioButton";
mostCurrent._rbasc = new anywheresoftware.b4a.objects.CompoundButtonWrapper.RadioButtonWrapper();
 //BA.debugLineNum = 42;BA.debugLine="Private rbdesc As RadioButton";
mostCurrent._rbdesc = new anywheresoftware.b4a.objects.CompoundButtonWrapper.RadioButtonWrapper();
 //BA.debugLineNum = 43;BA.debugLine="Private txtcampare As Spinner";
mostCurrent._txtcampare = new anywheresoftware.b4a.objects.SpinnerWrapper();
 //BA.debugLineNum = 44;BA.debugLine="Private txtfields As Spinner";
mostCurrent._txtfields = new anywheresoftware.b4a.objects.SpinnerWrapper();
 //BA.debugLineNum = 45;BA.debugLine="Private txtlogic As Spinner";
mostCurrent._txtlogic = new anywheresoftware.b4a.objects.SpinnerWrapper();
 //BA.debugLineNum = 46;BA.debugLine="Private txtsort_item As Spinner";
mostCurrent._txtsort_item = new anywheresoftware.b4a.objects.SpinnerWrapper();
 //BA.debugLineNum = 47;BA.debugLine="Private txtval As EditText";
mostCurrent._txtval = new anywheresoftware.b4a.objects.EditTextWrapper();
 //BA.debugLineNum = 48;BA.debugLine="Private svfilter As ScrollView";
mostCurrent._svfilter = new anywheresoftware.b4a.objects.ScrollViewWrapper();
 //BA.debugLineNum = 49;BA.debugLine="Private btnadd As Button";
mostCurrent._btnadd = new anywheresoftware.b4a.objects.ButtonWrapper();
 //BA.debugLineNum = 51;BA.debugLine="Private listCondition,listConditionView As List";
mostCurrent._listcondition = new anywheresoftware.b4a.objects.collections.List();
mostCurrent._listconditionview = new anywheresoftware.b4a.objects.collections.List();
 //BA.debugLineNum = 52;BA.debugLine="Private Filter As Map";
mostCurrent._filter = new anywheresoftware.b4a.objects.collections.Map();
 //BA.debugLineNum = 53;BA.debugLine="Private topFilter As Int";
_topfilter = 0;
 //BA.debugLineNum = 55;BA.debugLine="Dim IME As IME";
mostCurrent._ime = new anywheresoftware.b4a.objects.IME();
 //BA.debugLineNum = 56;BA.debugLine="Dim listFields,listSortFields As List";
mostCurrent._listfields = new anywheresoftware.b4a.objects.collections.List();
mostCurrent._listsortfields = new anywheresoftware.b4a.objects.collections.List();
 //BA.debugLineNum = 58;BA.debugLine="End Sub";
return "";
}
public static String  _loadfilterpanel() throws Exception{
int _i = 0;
 //BA.debugLineNum = 343;BA.debugLine="Sub LoadFilterPanel";
 //BA.debugLineNum = 345;BA.debugLine="svfilter.Panel.LoadLayout(\"frmtemplate_filter\")";
mostCurrent._svfilter.getPanel().LoadLayout("frmtemplate_filter",mostCurrent.activityBA);
 //BA.debugLineNum = 346;BA.debugLine="svfilter.Visible = False";
mostCurrent._svfilter.setVisible(anywheresoftware.b4a.keywords.Common.False);
 //BA.debugLineNum = 347;BA.debugLine="svfilter.Panel.Height = btnadd.top + btnadd.Heigh";
mostCurrent._svfilter.getPanel().setHeight((int) (mostCurrent._btnadd.getTop()+mostCurrent._btnadd.getHeight()+anywheresoftware.b4a.keywords.Common.DipToCurrent((int) (200))));
 //BA.debugLineNum = 348;BA.debugLine="topFilter = btnadd.top + btnadd.Height + 30dip";
_topfilter = (int) (mostCurrent._btnadd.getTop()+mostCurrent._btnadd.getHeight()+anywheresoftware.b4a.keywords.Common.DipToCurrent((int) (30)));
 //BA.debugLineNum = 349;BA.debugLine="btnsearch.Background = Library.GetButtonState";
mostCurrent._btnsearch.setBackground((android.graphics.drawable.Drawable)(mostCurrent._library._getbuttonstate(mostCurrent.activityBA).getObject()));
 //BA.debugLineNum = 350;BA.debugLine="btnadd.Background = Library.GetButtonState";
mostCurrent._btnadd.setBackground((android.graphics.drawable.Drawable)(mostCurrent._library._getbuttonstate(mostCurrent.activityBA).getObject()));
 //BA.debugLineNum = 351;BA.debugLine="svfilter.Color = Colors.White";
mostCurrent._svfilter.setColor(anywheresoftware.b4a.keywords.Common.Colors.White);
 //BA.debugLineNum = 352;BA.debugLine="svfilter.Panel.Color = Colors.White";
mostCurrent._svfilter.getPanel().setColor(anywheresoftware.b4a.keywords.Common.Colors.White);
 //BA.debugLineNum = 353;BA.debugLine="DoEvents";
anywheresoftware.b4a.keywords.Common.DoEvents();
 //BA.debugLineNum = 355;BA.debugLine="btnlist.Text = Library.GetStringResourse(\"filter_";
mostCurrent._btnlist.setText(BA.ObjectToCharSequence(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"filter_button")));
 //BA.debugLineNum = 356;BA.debugLine="btnadd.Text = Library.GetStringResourse(\"filter_a";
mostCurrent._btnadd.setText(BA.ObjectToCharSequence(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"filter_add")));
 //BA.debugLineNum = 357;BA.debugLine="btnsearch.Text = Library.GetStringResourse(\"filte";
mostCurrent._btnsearch.setText(BA.ObjectToCharSequence(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"filter_search")));
 //BA.debugLineNum = 358;BA.debugLine="lblsort_item.Text = Library.GetStringResourse(\"fi";
mostCurrent._lblsort_item.setText(BA.ObjectToCharSequence(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"filter_sort_item")));
 //BA.debugLineNum = 359;BA.debugLine="lblsort_type.Text =Library.GetStringResourse(\"fil";
mostCurrent._lblsort_type.setText(BA.ObjectToCharSequence(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"filter_sort_type")));
 //BA.debugLineNum = 360;BA.debugLine="rbdesc.Text = Library.GetStringResourse(\"filter_d";
mostCurrent._rbdesc.setText(BA.ObjectToCharSequence(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"filter_desc")));
 //BA.debugLineNum = 361;BA.debugLine="rbasc.Text = Library.GetStringResourse(\"filter_as";
mostCurrent._rbasc.setText(BA.ObjectToCharSequence(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"filter_asc")));
 //BA.debugLineNum = 362;BA.debugLine="lblfield.Text = Library.GetStringResourse(\"filter";
mostCurrent._lblfield.setText(BA.ObjectToCharSequence(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"filter_choose_field")));
 //BA.debugLineNum = 363;BA.debugLine="lblcompare.Text = Library.GetStringResourse(\"filt";
mostCurrent._lblcompare.setText(BA.ObjectToCharSequence(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"filter_comapre")));
 //BA.debugLineNum = 364;BA.debugLine="lbllogical.Text = Library.GetStringResourse(\"filt";
mostCurrent._lbllogical.setText(BA.ObjectToCharSequence(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"filter_logic")));
 //BA.debugLineNum = 365;BA.debugLine="lblval.Text = Library.GetStringResourse(\"filter_v";
mostCurrent._lblval.setText(BA.ObjectToCharSequence(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"filter_val")));
 //BA.debugLineNum = 366;BA.debugLine="DoEvents";
anywheresoftware.b4a.keywords.Common.DoEvents();
 //BA.debugLineNum = 368;BA.debugLine="listFields.Initialize";
mostCurrent._listfields.Initialize();
 //BA.debugLineNum = 369;BA.debugLine="listSortFields.Initialize";
mostCurrent._listsortfields.Initialize();
 //BA.debugLineNum = 371;BA.debugLine="listFields.Add(\"category\")";
mostCurrent._listfields.Add((Object)("category"));
 //BA.debugLineNum = 372;BA.debugLine="listFields.Add(\"quantity\")";
mostCurrent._listfields.Add((Object)("quantity"));
 //BA.debugLineNum = 373;BA.debugLine="listFields.Add(\"model\")";
mostCurrent._listfields.Add((Object)("model"));
 //BA.debugLineNum = 374;BA.debugLine="listFields.Add(\"upc\")";
mostCurrent._listfields.Add((Object)("upc"));
 //BA.debugLineNum = 375;BA.debugLine="listFields.Add(\"name\")";
mostCurrent._listfields.Add((Object)("name"));
 //BA.debugLineNum = 376;BA.debugLine="listFields.Add(\"date_start\")";
mostCurrent._listfields.Add((Object)("date_start"));
 //BA.debugLineNum = 377;BA.debugLine="listFields.Add(\"date_end\")";
mostCurrent._listfields.Add((Object)("date_end"));
 //BA.debugLineNum = 378;BA.debugLine="listFields.Add(\"product_id\")";
mostCurrent._listfields.Add((Object)("product_id"));
 //BA.debugLineNum = 379;BA.debugLine="listFields.Add(\"price\")";
mostCurrent._listfields.Add((Object)("price"));
 //BA.debugLineNum = 384;BA.debugLine="For i = 0 To listFields.Size - 1";
{
final int step33 = 1;
final int limit33 = (int) (mostCurrent._listfields.getSize()-1);
for (_i = (int) (0) ; (step33 > 0 && _i <= limit33) || (step33 < 0 && _i >= limit33); _i = ((int)(0 + _i + step33)) ) {
 //BA.debugLineNum = 385;BA.debugLine="txtfields.Add(Library.GetStringResourse(\"filter_";
mostCurrent._txtfields.Add(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"filter_field_"+BA.ObjectToString(mostCurrent._listfields.Get(_i))));
 }
};
 //BA.debugLineNum = 388;BA.debugLine="listSortFields.Add(\"quantity\")";
mostCurrent._listsortfields.Add((Object)("quantity"));
 //BA.debugLineNum = 389;BA.debugLine="listSortFields.Add(\"rating\")";
mostCurrent._listsortfields.Add((Object)("rating"));
 //BA.debugLineNum = 390;BA.debugLine="listSortFields.Add(\"sort_order\")";
mostCurrent._listsortfields.Add((Object)("sort_order"));
 //BA.debugLineNum = 391;BA.debugLine="listSortFields.Add(\"model\")";
mostCurrent._listsortfields.Add((Object)("model"));
 //BA.debugLineNum = 392;BA.debugLine="listSortFields.Add(\"date_added\")";
mostCurrent._listsortfields.Add((Object)("date_added"));
 //BA.debugLineNum = 393;BA.debugLine="listSortFields.Add(\"name\")";
mostCurrent._listsortfields.Add((Object)("name"));
 //BA.debugLineNum = 394;BA.debugLine="listSortFields.Add(\"price\")";
mostCurrent._listsortfields.Add((Object)("price"));
 //BA.debugLineNum = 396;BA.debugLine="For i = 0 To listSortFields.Size - 1";
{
final int step43 = 1;
final int limit43 = (int) (mostCurrent._listsortfields.getSize()-1);
for (_i = (int) (0) ; (step43 > 0 && _i <= limit43) || (step43 < 0 && _i >= limit43); _i = ((int)(0 + _i + step43)) ) {
 //BA.debugLineNum = 397;BA.debugLine="txtsort_item.Add(Library.GetStringResourse(\"filt";
mostCurrent._txtsort_item.Add(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"filter_field_"+BA.ObjectToString(mostCurrent._listsortfields.Get(_i))));
 }
};
 //BA.debugLineNum = 400;BA.debugLine="txtcampare.Add(\"=\")";
mostCurrent._txtcampare.Add("=");
 //BA.debugLineNum = 401;BA.debugLine="txtcampare.Add(\"!=\")";
mostCurrent._txtcampare.Add("!=");
 //BA.debugLineNum = 402;BA.debugLine="txtcampare.Add(\"<>\")";
mostCurrent._txtcampare.Add("<>");
 //BA.debugLineNum = 403;BA.debugLine="txtcampare.Add(\">\")";
mostCurrent._txtcampare.Add(">");
 //BA.debugLineNum = 404;BA.debugLine="txtcampare.Add(\"<\")";
mostCurrent._txtcampare.Add("<");
 //BA.debugLineNum = 405;BA.debugLine="txtcampare.Add(\">=\")";
mostCurrent._txtcampare.Add(">=");
 //BA.debugLineNum = 406;BA.debugLine="txtcampare.Add(\"<=\")";
mostCurrent._txtcampare.Add("<=");
 //BA.debugLineNum = 407;BA.debugLine="txtcampare.Add(\"!<\")";
mostCurrent._txtcampare.Add("!<");
 //BA.debugLineNum = 408;BA.debugLine="txtcampare.Add(\"!>\")";
mostCurrent._txtcampare.Add("!>");
 //BA.debugLineNum = 410;BA.debugLine="txtcampare.Add(\"like\")";
mostCurrent._txtcampare.Add("like");
 //BA.debugLineNum = 412;BA.debugLine="txtlogic.Add(\"and\")";
mostCurrent._txtlogic.Add("and");
 //BA.debugLineNum = 413;BA.debugLine="txtlogic.Add(\"or\")";
mostCurrent._txtlogic.Add("or");
 //BA.debugLineNum = 415;BA.debugLine="txtval.Color = Colors.ARGB(10,0,0,0)";
mostCurrent._txtval.setColor(anywheresoftware.b4a.keywords.Common.Colors.ARGB((int) (10),(int) (0),(int) (0),(int) (0)));
 //BA.debugLineNum = 416;BA.debugLine="DoEvents";
anywheresoftware.b4a.keywords.Common.DoEvents();
 //BA.debugLineNum = 418;BA.debugLine="End Sub";
return "";
}
public static String  _pnlover_click() throws Exception{
anywheresoftware.b4a.objects.PanelWrapper _p1 = null;
anywheresoftware.b4a.objects.PanelWrapper _p2 = null;
anywheresoftware.b4a.objects.collections.Map _temp = null;
 //BA.debugLineNum = 170;BA.debugLine="Sub pnlover_Click";
 //BA.debugLineNum = 172;BA.debugLine="Dim p1,p2 As Panel";
_p1 = new anywheresoftware.b4a.objects.PanelWrapper();
_p2 = new anywheresoftware.b4a.objects.PanelWrapper();
 //BA.debugLineNum = 173;BA.debugLine="p1 = Sender";
_p1.setObject((android.view.ViewGroup)(anywheresoftware.b4a.keywords.Common.Sender(mostCurrent.activityBA)));
 //BA.debugLineNum = 175;BA.debugLine="p2 = Library.GetParent(p1)";
_p2.setObject((android.view.ViewGroup)(mostCurrent._library._getparent(mostCurrent.activityBA,(anywheresoftware.b4a.objects.ConcreteViewWrapper) anywheresoftware.b4a.AbsObjectWrapper.ConvertToWrapper(new anywheresoftware.b4a.objects.ConcreteViewWrapper(), (android.view.View)(_p1.getObject()))).getObject()));
 //BA.debugLineNum = 176;BA.debugLine="p2.Visible = False";
_p2.setVisible(anywheresoftware.b4a.keywords.Common.False);
 //BA.debugLineNum = 177;BA.debugLine="p2.SetVisibleAnimated(500,True)";
_p2.SetVisibleAnimated((int) (500),anywheresoftware.b4a.keywords.Common.True);
 //BA.debugLineNum = 179;BA.debugLine="Dim temp As Map";
_temp = new anywheresoftware.b4a.objects.collections.Map();
 //BA.debugLineNum = 180;BA.debugLine="temp = p1.Tag";
_temp.setObject((anywheresoftware.b4a.objects.collections.Map.MyMap)(_p1.getTag()));
 //BA.debugLineNum = 181;BA.debugLine="actProduct.product = temp";
mostCurrent._actproduct._product = _temp;
 //BA.debugLineNum = 182;BA.debugLine="StartActivity(actProduct)";
anywheresoftware.b4a.keywords.Common.StartActivity(mostCurrent.activityBA,(Object)(mostCurrent._actproduct.getObject()));
 //BA.debugLineNum = 184;BA.debugLine="End Sub";
return "";
}
public static String  _process_globals() throws Exception{
 //BA.debugLineNum = 6;BA.debugLine="Sub Process_Globals";
 //BA.debugLineNum = 8;BA.debugLine="End Sub";
return "";
}
public static String  _product_receive(anywheresoftware.b4a.objects.collections.List _res,String _scategory) throws Exception{
 //BA.debugLineNum = 132;BA.debugLine="Sub product_receive(res As List,sCategory As Strin";
 //BA.debugLineNum = 134;BA.debugLine="If res.IsInitialized = False Then";
if (_res.IsInitialized()==anywheresoftware.b4a.keywords.Common.False) { 
 //BA.debugLineNum = 135;BA.debugLine="pnlloading.SetVisibleAnimated(500,False)";
mostCurrent._pnlloading.SetVisibleAnimated((int) (500),anywheresoftware.b4a.keywords.Common.False);
 //BA.debugLineNum = 136;BA.debugLine="MyToastMessageShow.ShowToastMessageShow(Library.";
mostCurrent._mytoastmessageshow._showtoastmessageshow(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"no_exist_product"),(long) (2),anywheresoftware.b4a.keywords.Common.False);
 //BA.debugLineNum = 137;BA.debugLine="Return";
if (true) return "";
 };
 //BA.debugLineNum = 140;BA.debugLine="If res.Size = 0 Then";
if (_res.getSize()==0) { 
 //BA.debugLineNum = 141;BA.debugLine="pnlloading.SetVisibleAnimated(500,False)";
mostCurrent._pnlloading.SetVisibleAnimated((int) (500),anywheresoftware.b4a.keywords.Common.False);
 //BA.debugLineNum = 142;BA.debugLine="MyToastMessageShow.ShowToastMessageShow(Library.";
mostCurrent._mytoastmessageshow._showtoastmessageshow(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"no_exist_product"),(long) (2),anywheresoftware.b4a.keywords.Common.False);
 //BA.debugLineNum = 143;BA.debugLine="Return";
if (true) return "";
 };
 //BA.debugLineNum = 146;BA.debugLine="txtsearch.SetTextColorAnimated(700,Colors.Black)";
mostCurrent._txtsearch.SetTextColorAnimated((int) (700),anywheresoftware.b4a.keywords.Common.Colors.Black);
 //BA.debugLineNum = 148;BA.debugLine="sv1.Panel.RemoveAllViews";
mostCurrent._sv1.getPanel().RemoveAllViews();
 //BA.debugLineNum = 149;BA.debugLine="sv1.Panel.Height = 0";
mostCurrent._sv1.getPanel().setHeight((int) (0));
 //BA.debugLineNum = 150;BA.debugLine="top = 10";
_top = (int) (10);
 //BA.debugLineNum = 151;BA.debugLine="sv1.Visible = False";
mostCurrent._sv1.setVisible(anywheresoftware.b4a.keywords.Common.False);
 //BA.debugLineNum = 152;BA.debugLine="top = Library.LoadProduct(res,top,sv1)";
_top = mostCurrent._library._loadproduct(mostCurrent.activityBA,_res,_top,mostCurrent._sv1);
 //BA.debugLineNum = 154;BA.debugLine="sv1.Visible = True";
mostCurrent._sv1.setVisible(anywheresoftware.b4a.keywords.Common.True);
 //BA.debugLineNum = 155;BA.debugLine="sv1.Panel.Height = sv1.Panel.Height + 400dip";
mostCurrent._sv1.getPanel().setHeight((int) (mostCurrent._sv1.getPanel().getHeight()+anywheresoftware.b4a.keywords.Common.DipToCurrent((int) (400))));
 //BA.debugLineNum = 156;BA.debugLine="sv1.ScrollPosition = 0";
mostCurrent._sv1.setScrollPosition((int) (0));
 //BA.debugLineNum = 158;BA.debugLine="pnlloading.SetVisibleAnimated(500,False)";
mostCurrent._pnlloading.SetVisibleAnimated((int) (500),anywheresoftware.b4a.keywords.Common.False);
 //BA.debugLineNum = 160;BA.debugLine="End Sub";
return "";
}
public static String  _txtsearch_enterpressed() throws Exception{
 //BA.debugLineNum = 115;BA.debugLine="Sub txtsearch_EnterPressed";
 //BA.debugLineNum = 117;BA.debugLine="If txtsearch.Text.Length = 0 Then Return";
if (mostCurrent._txtsearch.getText().length()==0) { 
if (true) return "";};
 //BA.debugLineNum = 119;BA.debugLine="If Library.InternetState = False Then";
if (mostCurrent._library._internetstate(mostCurrent.activityBA)==anywheresoftware.b4a.keywords.Common.False) { 
 //BA.debugLineNum = 120;BA.debugLine="MyToastMessageShow.ShowToastMessageShow(Library.";
mostCurrent._mytoastmessageshow._showtoastmessageshow(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"error_net_details"),(long) (1.5),anywheresoftware.b4a.keywords.Common.False);
 //BA.debugLineNum = 121;BA.debugLine="Return";
if (true) return "";
 };
 //BA.debugLineNum = 124;BA.debugLine="pnlloading.SetVisibleAnimated(500,True)";
mostCurrent._pnlloading.SetVisibleAnimated((int) (500),anywheresoftware.b4a.keywords.Common.True);
 //BA.debugLineNum = 126;BA.debugLine="txtsearch.SetTextColorAnimated(700,Library.Theme_";
mostCurrent._txtsearch.SetTextColorAnimated((int) (700),mostCurrent._library._theme_header);
 //BA.debugLineNum = 128;BA.debugLine="searchmodule.SearchProduct2(Me,\"product_receive\",";
mostCurrent._searchmodule._searchproduct2(actsearch.getObject(),"product_receive",mostCurrent._txtsearch.getText().replace("ي","ی").replace("ك","ک").replace("",""));
 //BA.debugLineNum = 130;BA.debugLine="End Sub";
return "";
}
public static String  _txtval_focuschanged(boolean _hasfocus) throws Exception{
 //BA.debugLineNum = 420;BA.debugLine="Sub txtval_FocusChanged (HasFocus As Boolean)";
 //BA.debugLineNum = 421;BA.debugLine="If HasFocus Then";
if (_hasfocus) { 
 //BA.debugLineNum = 422;BA.debugLine="svfilter.ScrollPosition = txtval.top + txtval.He";
mostCurrent._svfilter.setScrollPosition((int) (mostCurrent._txtval.getTop()+mostCurrent._txtval.getHeight()));
 //BA.debugLineNum = 423;BA.debugLine="txtval.SelectAll";
mostCurrent._txtval.SelectAll();
 };
 //BA.debugLineNum = 425;BA.debugLine="End Sub";
return "";
}
}
