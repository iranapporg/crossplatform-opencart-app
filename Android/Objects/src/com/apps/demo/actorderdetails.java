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

public class actorderdetails extends Activity implements B4AActivity{
	public static actorderdetails mostCurrent;
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
			processBA = new BA(this.getApplicationContext(), null, null, "com.apps.demo", "com.apps.demo.actorderdetails");
			processBA.loadHtSubs(this.getClass());
	        float deviceScale = getApplicationContext().getResources().getDisplayMetrics().density;
	        BALayout.setDeviceScale(deviceScale);
            
		}
		else if (previousOne != null) {
			Activity p = previousOne.get();
			if (p != null && p != this) {
                BA.LogInfo("Killing previous instance (actorderdetails).");
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
		activityBA = new BA(this, layout, processBA, "com.apps.demo", "com.apps.demo.actorderdetails");
        
        processBA.sharedProcessBA.activityBA = new java.lang.ref.WeakReference<BA>(activityBA);
        anywheresoftware.b4a.objects.ViewWrapper.lastId = 0;
        _activity = new ActivityWrapper(activityBA, "activity");
        anywheresoftware.b4a.Msgbox.isDismissing = false;
        if (BA.isShellModeRuntimeCheck(processBA)) {
			if (isFirst)
				processBA.raiseEvent2(null, true, "SHELL", false);
			processBA.raiseEvent2(null, true, "CREATE", true, "com.apps.demo.actorderdetails", processBA, activityBA, _activity, anywheresoftware.b4a.keywords.Common.Density, mostCurrent);
			_activity.reinitializeForShell(activityBA, "activity");
		}
        initializeProcessGlobals();		
        initializeGlobals();
        
        BA.LogInfo("** Activity (actorderdetails) Create, isFirst = " + isFirst + " **");
        processBA.raiseEvent2(null, true, "activity_create", false, isFirst);
		isFirst = false;
		if (this != mostCurrent)
			return;
        processBA.setActivityPaused(false);
        BA.LogInfo("** Activity (actorderdetails) Resume **");
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
		return actorderdetails.class;
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
        BA.LogInfo("** Activity (actorderdetails) Pause, UserClosed = " + activityBA.activity.isFinishing() + " **");
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
            BA.LogInfo("** Activity (actorderdetails) Resume **");
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
public static anywheresoftware.b4a.objects.collections.Map _details = null;
public static anywheresoftware.b4a.objects.collections.Map _user_details = null;
public anywheresoftware.b4a.objects.collections.Map _shopinformation = null;
public anywheresoftware.b4a.objects.LabelWrapper _lbltitle = null;
public anywheresoftware.b4a.objects.PanelWrapper _pnlheader = null;
public anywheresoftware.b4a.objects.ScrollViewWrapper _sv1 = null;
public anywheresoftware.b4a.objects.LabelWrapper _lblorder_payment_type_title = null;
public anywheresoftware.b4a.objects.LabelWrapper _lblorderaddress1 = null;
public anywheresoftware.b4a.objects.LabelWrapper _lblorderaddress2 = null;
public anywheresoftware.b4a.objects.LabelWrapper _lblordercity1 = null;
public anywheresoftware.b4a.objects.LabelWrapper _lblordercity2 = null;
public anywheresoftware.b4a.objects.LabelWrapper _lblordercountry1 = null;
public anywheresoftware.b4a.objects.LabelWrapper _lblordercountry2 = null;
public anywheresoftware.b4a.objects.LabelWrapper _lblorderpayment_ship_type = null;
public anywheresoftware.b4a.objects.LabelWrapper _lblorderpayment_type = null;
public anywheresoftware.b4a.objects.LabelWrapper _lblorderphone = null;
public anywheresoftware.b4a.objects.LabelWrapper _lblorderphone2 = null;
public anywheresoftware.b4a.objects.LabelWrapper _lblorderpostal1 = null;
public anywheresoftware.b4a.objects.LabelWrapper _lblorderpostal2 = null;
public anywheresoftware.b4a.objects.LabelWrapper _lblorderreceiver_name1 = null;
public anywheresoftware.b4a.objects.LabelWrapper _lblorderreceiver_name2 = null;
public anywheresoftware.b4a.objects.LabelWrapper _lblordership_type = null;
public anywheresoftware.b4a.objects.LabelWrapper _lblordershop_name = null;
public anywheresoftware.b4a.objects.ImageViewWrapper _imgicon = null;
public anywheresoftware.b4a.objects.PanelWrapper _pnl_item_product = null;
public anywheresoftware.b4a.objects.LabelWrapper _lblprice_quantity = null;
public anywheresoftware.b4a.objects.LabelWrapper _lblname_product = null;
public anywheresoftware.b4a.objects.LabelWrapper _lblproducts = null;
public static int _top = 0;
public anywheresoftware.b4a.objects.ButtonWrapper _btnreturn = null;
public anywheresoftware.b4a.objects.PanelWrapper _pnlreturn = null;
public anywheresoftware.b4a.objects.LabelWrapper _lblcomment = null;
public anywheresoftware.b4a.objects.LabelWrapper _lblopened = null;
public anywheresoftware.b4a.objects.LabelWrapper _lblreason = null;
public anywheresoftware.b4a.objects.CompoundButtonWrapper.RadioButtonWrapper _rbno = null;
public anywheresoftware.b4a.objects.CompoundButtonWrapper.RadioButtonWrapper _rbyes = null;
public anywheresoftware.b4a.objects.SpinnerWrapper _spreason = null;
public anywheresoftware.b4a.objects.EditTextWrapper _txtcomment = null;
public anywheresoftware.b4a.objects.ButtonWrapper _btncancel = null;
public anywheresoftware.b4a.objects.ButtonWrapper _btncancelreturn = null;
public anywheresoftware.b4a.objects.ButtonWrapper _btnreturn_product = null;
public com.apps.demo.mytoastmessageshow _toast = null;
public anywheresoftware.b4a.objects.PanelWrapper _pnlloading = null;
public anywheresoftware.b4a.objects.LabelWrapper _lblpb = null;
public anywheresoftware.b4a.objects.collections.List _reason_id = null;
public anywheresoftware.b4a.objects.ButtonWrapper _btnprint = null;
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
anywheresoftware.b4a.objects.ConcreteViewWrapper _v1 = null;
anywheresoftware.b4a.objects.LabelWrapper _lb1 = null;
anywheresoftware.b4a.objects.collections.List _l1 = null;
int _i = 0;
anywheresoftware.b4a.objects.collections.Map _temp = null;
anywheresoftware.b4a.objects.PanelWrapper _p1 = null;
String _price = "";
 //BA.debugLineNum = 59;BA.debugLine="Sub Activity_Create(FirstTime As Boolean)";
 //BA.debugLineNum = 61;BA.debugLine="Library.setLocalApp(Library.currLang)";
mostCurrent._library._setlocalapp(mostCurrent.activityBA,mostCurrent._library._currlang);
 //BA.debugLineNum = 63;BA.debugLine="Library.ChangeStatusColor";
mostCurrent._library._changestatuscolor(mostCurrent.activityBA);
 //BA.debugLineNum = 65;BA.debugLine="toast.Initialize(Activity)";
mostCurrent._toast._initialize(mostCurrent.activityBA,(anywheresoftware.b4a.objects.PanelWrapper) anywheresoftware.b4a.AbsObjectWrapper.ConvertToWrapper(new anywheresoftware.b4a.objects.PanelWrapper(), (android.view.ViewGroup)(mostCurrent._activity.getObject())));
 //BA.debugLineNum = 66;BA.debugLine="reason_id.Initialize";
mostCurrent._reason_id.Initialize();
 //BA.debugLineNum = 68;BA.debugLine="Activity.LoadLayout(\"frmorder_details_template\")";
mostCurrent._activity.LoadLayout("frmorder_details_template",mostCurrent.activityBA);
 //BA.debugLineNum = 70;BA.debugLine="pnlheader.Color = Library.Theme_Header";
mostCurrent._pnlheader.setColor(mostCurrent._library._theme_header);
 //BA.debugLineNum = 71;BA.debugLine="lbltitle.Text = Library.GetStringResourse(\"detail";
mostCurrent._lbltitle.setText(BA.ObjectToCharSequence(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"details_user")));
 //BA.debugLineNum = 73;BA.debugLine="If Library.IsPersian = False Then";
if (mostCurrent._library._ispersian(mostCurrent.activityBA)==anywheresoftware.b4a.keywords.Common.False) { 
 //BA.debugLineNum = 74;BA.debugLine="sv1.Panel.LoadLayout(\"frmorder_details_en\")";
mostCurrent._sv1.getPanel().LoadLayout("frmorder_details_en",mostCurrent.activityBA);
 }else {
 //BA.debugLineNum = 76;BA.debugLine="sv1.Panel.LoadLayout(\"frmorder_details\")";
mostCurrent._sv1.getPanel().LoadLayout("frmorder_details",mostCurrent.activityBA);
 };
 //BA.debugLineNum = 79;BA.debugLine="GetReturnReason2Spinner";
_getreturnreason2spinner();
 //BA.debugLineNum = 82;BA.debugLine="lblordershop_name.Text = Library.GetStringResours";
mostCurrent._lblordershop_name.setText(BA.ObjectToCharSequence(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"lblordershop_name").replace("0",BA.ObjectToString(_details.Get((Object)("store_name"))))));
 //BA.debugLineNum = 83;BA.debugLine="lblordershop_name.Gravity = Library.GetStringReso";
mostCurrent._lblordershop_name.setGravity((int)(Double.parseDouble(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"direction"))));
 //BA.debugLineNum = 84;BA.debugLine="lblorderpayment_ship_type.Text = Library.GetStrin";
mostCurrent._lblorderpayment_ship_type.setText(BA.ObjectToCharSequence(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"lblorder_payment_type_title")));
 //BA.debugLineNum = 85;BA.debugLine="lblorderreceiver_name1.Text = Library.GetStringRe";
mostCurrent._lblorderreceiver_name1.setText(BA.ObjectToCharSequence(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"lblorderreceiver_name").replace("0",BA.ObjectToString(_details.Get((Object)("payment_firstname")))+" "+BA.ObjectToString(_details.Get((Object)("payment_lastname"))))));
 //BA.debugLineNum = 86;BA.debugLine="lblordercountry1.Text = Library.GetStringResourse";
mostCurrent._lblordercountry1.setText(BA.ObjectToCharSequence(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"lblordercountry").replace("0",BA.ObjectToString(_details.Get((Object)("payment_country"))))));
 //BA.debugLineNum = 87;BA.debugLine="lblordercity1.Text = Library.GetStringResourse(\"l";
mostCurrent._lblordercity1.setText(BA.ObjectToCharSequence(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"lblordercity").replace("0",BA.ObjectToString(_details.Get((Object)("payment_city"))))));
 //BA.debugLineNum = 88;BA.debugLine="lblorderaddress1.Text = Library.GetStringResourse";
mostCurrent._lblorderaddress1.setText(BA.ObjectToCharSequence(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"lblorderaddress").replace("0",BA.ObjectToString(_details.Get((Object)("payment_address_1"))))));
 //BA.debugLineNum = 89;BA.debugLine="lblorderpostal1.Text = Library.GetStringResourse(";
mostCurrent._lblorderpostal1.setText(BA.ObjectToCharSequence(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"lblorderpostal").replace("0",BA.ObjectToString(_details.Get((Object)("payment_postcode"))))));
 //BA.debugLineNum = 90;BA.debugLine="lblorderphone.Text = Library.GetStringResourse(\"l";
mostCurrent._lblorderphone.setText(BA.ObjectToCharSequence(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"lblorderphone").replace("0",BA.ObjectToString(_details.Get((Object)("telephone"))))));
 //BA.debugLineNum = 91;BA.debugLine="lblorderpayment_type.Text = details.Get(\"payment_";
mostCurrent._lblorderpayment_type.setText(BA.ObjectToCharSequence(_details.Get((Object)("payment_method"))));
 //BA.debugLineNum = 93;BA.debugLine="lblorder_payment_type_title.Text = Library.GetStr";
mostCurrent._lblorder_payment_type_title.setText(BA.ObjectToCharSequence(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"lblordership_type_title")));
 //BA.debugLineNum = 94;BA.debugLine="lblorderreceiver_name2.Text = Library.GetStringRe";
mostCurrent._lblorderreceiver_name2.setText(BA.ObjectToCharSequence(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"lblorderreceiver_name").replace("0",BA.ObjectToString(_details.Get((Object)("shipping_firstname")))+" "+BA.ObjectToString(_details.Get((Object)("shipping_lastname"))))));
 //BA.debugLineNum = 95;BA.debugLine="lblordercountry2.Text = Library.GetStringResourse";
mostCurrent._lblordercountry2.setText(BA.ObjectToCharSequence(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"lblordercountry").replace("0",BA.ObjectToString(_details.Get((Object)("shipping_country"))))));
 //BA.debugLineNum = 96;BA.debugLine="lblordercity2.Text = Library.GetStringResourse(\"l";
mostCurrent._lblordercity2.setText(BA.ObjectToCharSequence(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"lblordercity").replace("0",BA.ObjectToString(_details.Get((Object)("shipping_city"))))));
 //BA.debugLineNum = 97;BA.debugLine="lblorderaddress2.Text = Library.GetStringResourse";
mostCurrent._lblorderaddress2.setText(BA.ObjectToCharSequence(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"lblorderaddress").replace("0",BA.ObjectToString(_details.Get((Object)("shipping_address_1"))))));
 //BA.debugLineNum = 98;BA.debugLine="lblorderpostal2.Text = Library.GetStringResourse(";
mostCurrent._lblorderpostal2.setText(BA.ObjectToCharSequence(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"lblorderpostal").replace("0",BA.ObjectToString(_details.Get((Object)("shipping_postcode"))))));
 //BA.debugLineNum = 99;BA.debugLine="lblorderphone2.Text = Library.GetStringResourse(\"";
mostCurrent._lblorderphone2.setText(BA.ObjectToCharSequence(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"lblorderphone").replace("0",BA.ObjectToString(_details.Get((Object)("telephone"))))));
 //BA.debugLineNum = 100;BA.debugLine="lblordership_type.Text = details.Get(\"shipping_me";
mostCurrent._lblordership_type.setText(BA.ObjectToCharSequence(_details.Get((Object)("shipping_method"))));
 //BA.debugLineNum = 102;BA.debugLine="lblopened.Text = Library.GetStringResourse(\"retur";
mostCurrent._lblopened.setText(BA.ObjectToCharSequence(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"return_opened")));
 //BA.debugLineNum = 103;BA.debugLine="lblopened.Gravity = Library.GetStringResourse(\"di";
mostCurrent._lblopened.setGravity((int)(Double.parseDouble(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"direction"))));
 //BA.debugLineNum = 104;BA.debugLine="lblcomment.Gravity = Library.GetStringResourse(\"d";
mostCurrent._lblcomment.setGravity((int)(Double.parseDouble(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"direction"))));
 //BA.debugLineNum = 105;BA.debugLine="lblreason.Gravity = Library.GetStringResourse(\"di";
mostCurrent._lblreason.setGravity((int)(Double.parseDouble(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"direction"))));
 //BA.debugLineNum = 106;BA.debugLine="txtcomment.Gravity = Library.GetStringResourse(\"d";
mostCurrent._txtcomment.setGravity((int)(Double.parseDouble(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"direction"))));
 //BA.debugLineNum = 107;BA.debugLine="txtcomment.Gravity = Bit.Or(txtcomment.Gravity,Gr";
mostCurrent._txtcomment.setGravity(anywheresoftware.b4a.keywords.Common.Bit.Or(mostCurrent._txtcomment.getGravity(),anywheresoftware.b4a.keywords.Common.Gravity.TOP));
 //BA.debugLineNum = 108;BA.debugLine="rbno.Gravity = Library.GetStringResourse(\"directi";
mostCurrent._rbno.setGravity((int)(Double.parseDouble(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"direction"))));
 //BA.debugLineNum = 109;BA.debugLine="rbyes.Gravity = Library.GetStringResourse(\"direct";
mostCurrent._rbyes.setGravity((int)(Double.parseDouble(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"direction"))));
 //BA.debugLineNum = 110;BA.debugLine="txtcomment.Color = Colors.ARGB(60,250,250,250)";
mostCurrent._txtcomment.setColor(anywheresoftware.b4a.keywords.Common.Colors.ARGB((int) (60),(int) (250),(int) (250),(int) (250)));
 //BA.debugLineNum = 112;BA.debugLine="lblcomment.Text = Library.GetStringResourse(\"retu";
mostCurrent._lblcomment.setText(BA.ObjectToCharSequence(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"return_comment")));
 //BA.debugLineNum = 113;BA.debugLine="lblreason.Text = Library.GetStringResourse(\"retur";
mostCurrent._lblreason.setText(BA.ObjectToCharSequence(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"return_reason")));
 //BA.debugLineNum = 114;BA.debugLine="rbyes.Text = Library.GetStringResourse(\"return_op";
mostCurrent._rbyes.setText(BA.ObjectToCharSequence(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"return_opened_yes")));
 //BA.debugLineNum = 115;BA.debugLine="rbno.Text = Library.GetStringResourse(\"return_ope";
mostCurrent._rbno.setText(BA.ObjectToCharSequence(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"return_opened_no")));
 //BA.debugLineNum = 116;BA.debugLine="btnreturn_product.Text = Library.GetStringResours";
mostCurrent._btnreturn_product.setText(BA.ObjectToCharSequence(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"return_button")));
 //BA.debugLineNum = 117;BA.debugLine="btncancelreturn.Text = Library.GetStringResourse(";
mostCurrent._btncancelreturn.setText(BA.ObjectToCharSequence(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"cancel")));
 //BA.debugLineNum = 118;BA.debugLine="btnreturn_product.Background = Library.GetButtonS";
mostCurrent._btnreturn_product.setBackground((android.graphics.drawable.Drawable)(mostCurrent._library._getbuttonstate(mostCurrent.activityBA).getObject()));
 //BA.debugLineNum = 119;BA.debugLine="btncancelreturn.Background = Library.GetButtonSta";
mostCurrent._btncancelreturn.setBackground((android.graphics.drawable.Drawable)(mostCurrent._library._getbuttonstate(mostCurrent.activityBA).getObject()));
 //BA.debugLineNum = 122;BA.debugLine="sv1.Panel.Height = lblproducts.Height + lblproduc";
mostCurrent._sv1.getPanel().setHeight((int) (mostCurrent._lblproducts.getHeight()+mostCurrent._lblproducts.getTop()));
 //BA.debugLineNum = 124;BA.debugLine="For Each v1 As View In sv1.Panel.GetAllViewsRecur";
_v1 = new anywheresoftware.b4a.objects.ConcreteViewWrapper();
final anywheresoftware.b4a.BA.IterableList group50 = mostCurrent._sv1.getPanel().GetAllViewsRecursive();
final int groupLen50 = group50.getSize();
for (int index50 = 0;index50 < groupLen50 ;index50++){
_v1.setObject((android.view.View)(group50.Get(index50)));
 //BA.debugLineNum = 125;BA.debugLine="If v1 Is Label Then";
if (_v1.getObjectOrNull() instanceof android.widget.TextView) { 
 //BA.debugLineNum = 126;BA.debugLine="Dim lb1 As Label";
_lb1 = new anywheresoftware.b4a.objects.LabelWrapper();
 //BA.debugLineNum = 127;BA.debugLine="lb1 = v1";
_lb1.setObject((android.widget.TextView)(_v1.getObject()));
 //BA.debugLineNum = 128;BA.debugLine="Library.PaddingLabel(lb1,10,0,10,0)";
mostCurrent._library._paddinglabel(mostCurrent.activityBA,_lb1,(int) (10),(int) (0),(int) (10),(int) (0));
 };
 }
;
 //BA.debugLineNum = 132;BA.debugLine="Dim l1 As List";
_l1 = new anywheresoftware.b4a.objects.collections.List();
 //BA.debugLineNum = 134;BA.debugLine="l1.Initialize";
_l1.Initialize();
 //BA.debugLineNum = 135;BA.debugLine="top = sv1.Panel.Height + 10";
_top = (int) (mostCurrent._sv1.getPanel().getHeight()+10);
 //BA.debugLineNum = 136;BA.debugLine="l1 = details.Get(\"products\")";
_l1.setObject((java.util.List)(_details.Get((Object)("products"))));
 //BA.debugLineNum = 138;BA.debugLine="For i = 0 To l1.Size - 1";
{
final int step61 = 1;
final int limit61 = (int) (_l1.getSize()-1);
for (_i = (int) (0) ; (step61 > 0 && _i <= limit61) || (step61 < 0 && _i >= limit61); _i = ((int)(0 + _i + step61)) ) {
 //BA.debugLineNum = 140;BA.debugLine="Dim temp As Map";
_temp = new anywheresoftware.b4a.objects.collections.Map();
 //BA.debugLineNum = 141;BA.debugLine="temp = l1.Get(i)";
_temp.setObject((anywheresoftware.b4a.objects.collections.Map.MyMap)(_l1.Get(_i)));
 //BA.debugLineNum = 143;BA.debugLine="Dim p1 As Panel";
_p1 = new anywheresoftware.b4a.objects.PanelWrapper();
 //BA.debugLineNum = 144;BA.debugLine="p1.Initialize(\"\")";
_p1.Initialize(mostCurrent.activityBA,"");
 //BA.debugLineNum = 145;BA.debugLine="sv1.Panel.AddView(p1,0,top,sv1.Width,0)";
mostCurrent._sv1.getPanel().AddView((android.view.View)(_p1.getObject()),(int) (0),_top,mostCurrent._sv1.getWidth(),(int) (0));
 //BA.debugLineNum = 147;BA.debugLine="p1.LoadLayout(\"frmsimple_product\")";
_p1.LoadLayout("frmsimple_product",mostCurrent.activityBA);
 //BA.debugLineNum = 149;BA.debugLine="p1.Height = pnl_item_product.Height";
_p1.setHeight(mostCurrent._pnl_item_product.getHeight());
 //BA.debugLineNum = 151;BA.debugLine="top = top + p1.Height + 5dip";
_top = (int) (_top+_p1.getHeight()+anywheresoftware.b4a.keywords.Common.DipToCurrent((int) (5)));
 //BA.debugLineNum = 153;BA.debugLine="lblname_product.Text = temp.Get(\"name\")";
mostCurrent._lblname_product.setText(BA.ObjectToCharSequence(_temp.Get((Object)("name"))));
 //BA.debugLineNum = 154;BA.debugLine="Dim price As String";
_price = "";
 //BA.debugLineNum = 155;BA.debugLine="price = temp.Get(\"price\")";
_price = BA.ObjectToString(_temp.Get((Object)("price")));
 //BA.debugLineNum = 157;BA.debugLine="lblname_product.Gravity = lblordershop_name.Grav";
mostCurrent._lblname_product.setGravity(mostCurrent._lblordershop_name.getGravity());
 //BA.debugLineNum = 158;BA.debugLine="lblprice_quantity.Gravity = lblordershop_name.Gr";
mostCurrent._lblprice_quantity.setGravity(mostCurrent._lblordershop_name.getGravity());
 //BA.debugLineNum = 159;BA.debugLine="btnreturn_product.Tag = temp";
mostCurrent._btnreturn_product.setTag((Object)(_temp.getObject()));
 //BA.debugLineNum = 160;BA.debugLine="btnreturn.TextColor = Library.Theme_Header";
mostCurrent._btnreturn.setTextColor(mostCurrent._library._theme_header);
 //BA.debugLineNum = 162;BA.debugLine="lblname_product.Typeface = Library.GetFont";
mostCurrent._lblname_product.setTypeface((android.graphics.Typeface)(mostCurrent._library._getfont(mostCurrent.activityBA).getObject()));
 //BA.debugLineNum = 163;BA.debugLine="lblprice_quantity.Typeface = Library.GetFont";
mostCurrent._lblprice_quantity.setTypeface((android.graphics.Typeface)(mostCurrent._library._getfont(mostCurrent.activityBA).getObject()));
 //BA.debugLineNum = 165;BA.debugLine="lblprice_quantity.Text = price & \" [\" & temp.Get";
mostCurrent._lblprice_quantity.setText(BA.ObjectToCharSequence(_price+" ["+BA.ObjectToString(_temp.Get((Object)("quantity")))+"]"));
 //BA.debugLineNum = 167;BA.debugLine="sv1.Panel.Height = sv1.Panel.Height + p1.Height";
mostCurrent._sv1.getPanel().setHeight((int) (mostCurrent._sv1.getPanel().getHeight()+_p1.getHeight()));
 }
};
 //BA.debugLineNum = 171;BA.debugLine="sv1.Panel.Height = sv1.Panel.Height + p1.Height";
mostCurrent._sv1.getPanel().setHeight((int) (mostCurrent._sv1.getPanel().getHeight()+_p1.getHeight()));
 //BA.debugLineNum = 173;BA.debugLine="lblproducts.Text = Library.GetStringResourse(\"bas";
mostCurrent._lblproducts.setText(BA.ObjectToCharSequence(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"basket_total")+" "+BA.ObjectToString(_details.Get((Object)("total")))));
 //BA.debugLineNum = 175;BA.debugLine="If details.ContainsKey(\"histories\") Then";
if (_details.ContainsKey((Object)("histories"))) { 
 //BA.debugLineNum = 176;BA.debugLine="LoadAttribute(details.Get(\"histories\"))";
_loadattribute((anywheresoftware.b4a.objects.collections.List) anywheresoftware.b4a.AbsObjectWrapper.ConvertToWrapper(new anywheresoftware.b4a.objects.collections.List(), (java.util.List)(_details.Get((Object)("histories")))));
 };
 //BA.debugLineNum = 179;BA.debugLine="If Library.manager.GetBoolean(\"print_invoice\") =";
if (mostCurrent._library._manager.GetBoolean("print_invoice")==anywheresoftware.b4a.keywords.Common.False) { 
 //BA.debugLineNum = 184;BA.debugLine="Library.manager.setBoolean(\"print_invoice\",True)";
mostCurrent._library._manager.SetBoolean("print_invoice",anywheresoftware.b4a.keywords.Common.True);
 };
 //BA.debugLineNum = 187;BA.debugLine="End Sub";
return "";
}
public static String  _activity_pause(boolean _userclosed) throws Exception{
 //BA.debugLineNum = 258;BA.debugLine="Sub Activity_Pause (UserClosed As Boolean)";
 //BA.debugLineNum = 259;BA.debugLine="Library.AnimationFromLeft2Right";
mostCurrent._library._animationfromleft2right(mostCurrent.activityBA);
 //BA.debugLineNum = 260;BA.debugLine="End Sub";
return "";
}
public static String  _activity_resume() throws Exception{
 //BA.debugLineNum = 254;BA.debugLine="Sub Activity_Resume";
 //BA.debugLineNum = 256;BA.debugLine="End Sub";
return "";
}
public static String  _btncancel_click() throws Exception{
 //BA.debugLineNum = 266;BA.debugLine="Sub btncancel_Click";
 //BA.debugLineNum = 267;BA.debugLine="Activity.Finish";
mostCurrent._activity.Finish();
 //BA.debugLineNum = 268;BA.debugLine="End Sub";
return "";
}
public static String  _btncancelreturn_click() throws Exception{
 //BA.debugLineNum = 275;BA.debugLine="Sub btncancelreturn_Click";
 //BA.debugLineNum = 276;BA.debugLine="pnlreturn.SetVisibleAnimated(500,False)";
mostCurrent._pnlreturn.SetVisibleAnimated((int) (500),anywheresoftware.b4a.keywords.Common.False);
 //BA.debugLineNum = 277;BA.debugLine="End Sub";
return "";
}
public static String  _btnclose_click() throws Exception{
 //BA.debugLineNum = 262;BA.debugLine="Sub btnclose_Click";
 //BA.debugLineNum = 263;BA.debugLine="Activity.Finish";
mostCurrent._activity.Finish();
 //BA.debugLineNum = 264;BA.debugLine="End Sub";
return "";
}
public static String  _btnprint_click() throws Exception{
com.apps.demo.opencart _op1 = null;
 //BA.debugLineNum = 340;BA.debugLine="Sub btnprint_Click";
 //BA.debugLineNum = 342;BA.debugLine="lblpb.Text = Library.GetStringResourse(\"apply\")";
mostCurrent._lblpb.setText(BA.ObjectToCharSequence(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"apply")));
 //BA.debugLineNum = 343;BA.debugLine="pnlloading.SetVisibleAnimated(500,True)";
mostCurrent._pnlloading.SetVisibleAnimated((int) (500),anywheresoftware.b4a.keywords.Common.True);
 //BA.debugLineNum = 345;BA.debugLine="Dim op1 As OpenCart";
_op1 = new com.apps.demo.opencart();
 //BA.debugLineNum = 346;BA.debugLine="op1.Initialize";
_op1._initialize(processBA);
 //BA.debugLineNum = 347;BA.debugLine="op1.GetStore(Me,\"StoreDetails_receive\",\"0\")";
_op1._getstore(actorderdetails.getObject(),"StoreDetails_receive","0");
 //BA.debugLineNum = 349;BA.debugLine="End Sub";
return "";
}
public static String  _btnreturn_click() throws Exception{
 //BA.debugLineNum = 270;BA.debugLine="Sub btnreturn_Click";
 //BA.debugLineNum = 271;BA.debugLine="txtcomment.Text = \"\"";
mostCurrent._txtcomment.setText(BA.ObjectToCharSequence(""));
 //BA.debugLineNum = 272;BA.debugLine="pnlreturn.SetVisibleAnimated(500,True)";
mostCurrent._pnlreturn.SetVisibleAnimated((int) (500),anywheresoftware.b4a.keywords.Common.True);
 //BA.debugLineNum = 273;BA.debugLine="End Sub";
return "";
}
public static String  _btnreturn_product_click() throws Exception{
anywheresoftware.b4a.objects.ButtonWrapper _temp = null;
anywheresoftware.b4a.objects.collections.Map _product = null;
com.apps.demo.opencart _opreturn = null;
 //BA.debugLineNum = 279;BA.debugLine="Sub btnreturn_product_Click";
 //BA.debugLineNum = 281;BA.debugLine="Dim temp As Button";
_temp = new anywheresoftware.b4a.objects.ButtonWrapper();
 //BA.debugLineNum = 282;BA.debugLine="temp = Sender";
_temp.setObject((android.widget.Button)(anywheresoftware.b4a.keywords.Common.Sender(mostCurrent.activityBA)));
 //BA.debugLineNum = 284;BA.debugLine="Dim product As Map";
_product = new anywheresoftware.b4a.objects.collections.Map();
 //BA.debugLineNum = 285;BA.debugLine="product = temp.Tag";
_product.setObject((anywheresoftware.b4a.objects.collections.Map.MyMap)(_temp.getTag()));
 //BA.debugLineNum = 287;BA.debugLine="lblpb.Text = Library.GetStringResourse(\"apply\")";
mostCurrent._lblpb.setText(BA.ObjectToCharSequence(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"apply")));
 //BA.debugLineNum = 288;BA.debugLine="pnlloading.SetVisibleAnimated(500,True)";
mostCurrent._pnlloading.SetVisibleAnimated((int) (500),anywheresoftware.b4a.keywords.Common.True);
 //BA.debugLineNum = 290;BA.debugLine="If rbyes.Checked = True Then";
if (mostCurrent._rbyes.getChecked()==anywheresoftware.b4a.keywords.Common.True) { 
 //BA.debugLineNum = 291;BA.debugLine="user_details.Put(\"opened\",\"1\")";
_user_details.Put((Object)("opened"),(Object)("1"));
 }else {
 //BA.debugLineNum = 293;BA.debugLine="user_details.Put(\"opened\",\"0\")";
_user_details.Put((Object)("opened"),(Object)("0"));
 };
 //BA.debugLineNum = 296;BA.debugLine="user_details.Put(\"return_reason_id\",reason_id.Get";
_user_details.Put((Object)("return_reason_id"),mostCurrent._reason_id.Get(mostCurrent._spreason.getSelectedIndex()));
 //BA.debugLineNum = 297;BA.debugLine="user_details.Put(\"comment\",txtcomment.Text)";
_user_details.Put((Object)("comment"),(Object)(mostCurrent._txtcomment.getText()));
 //BA.debugLineNum = 298;BA.debugLine="user_details.Put(\"product\",product.Get(\"name\"))";
_user_details.Put((Object)("product"),_product.Get((Object)("name")));
 //BA.debugLineNum = 299;BA.debugLine="user_details.Put(\"model\",product.Get(\"model\"))";
_user_details.Put((Object)("model"),_product.Get((Object)("model")));
 //BA.debugLineNum = 300;BA.debugLine="user_details.Put(\"quantity\",product.Get(\"quantity";
_user_details.Put((Object)("quantity"),_product.Get((Object)("quantity")));
 //BA.debugLineNum = 302;BA.debugLine="Dim opReturn As OpenCart";
_opreturn = new com.apps.demo.opencart();
 //BA.debugLineNum = 303;BA.debugLine="opReturn.Initialize";
_opreturn._initialize(processBA);
 //BA.debugLineNum = 304;BA.debugLine="opReturn.RequestReturn(Me,\"return_receive\",user_d";
_opreturn._requestreturn(actorderdetails.getObject(),"return_receive",_user_details);
 //BA.debugLineNum = 306;BA.debugLine="End Sub";
return "";
}
public static String  _getreturnreason2spinner() throws Exception{
anywheresoftware.b4a.objects.collections.List _ls = null;
int _i = 0;
anywheresoftware.b4a.objects.collections.Map _m2 = null;
 //BA.debugLineNum = 324;BA.debugLine="Sub GetReturnReason2Spinner";
 //BA.debugLineNum = 326;BA.debugLine="Dim ls As List";
_ls = new anywheresoftware.b4a.objects.collections.List();
 //BA.debugLineNum = 327;BA.debugLine="ls = Library.CacheSystem.GetCacheAsList(\"return_r";
_ls = mostCurrent._library._cachesystem._getcacheaslist("return_reasons","return_reasons");
 //BA.debugLineNum = 329;BA.debugLine="If ls.IsInitialized Then";
if (_ls.IsInitialized()) { 
 //BA.debugLineNum = 330;BA.debugLine="For i = 0 To ls.Size - 1";
{
final int step4 = 1;
final int limit4 = (int) (_ls.getSize()-1);
for (_i = (int) (0) ; (step4 > 0 && _i <= limit4) || (step4 < 0 && _i >= limit4); _i = ((int)(0 + _i + step4)) ) {
 //BA.debugLineNum = 331;BA.debugLine="Dim m2 As Map";
_m2 = new anywheresoftware.b4a.objects.collections.Map();
 //BA.debugLineNum = 332;BA.debugLine="m2 = ls.Get(i)";
_m2.setObject((anywheresoftware.b4a.objects.collections.Map.MyMap)(_ls.Get(_i)));
 //BA.debugLineNum = 333;BA.debugLine="spreason.Add(m2.Get(\"name\"))";
mostCurrent._spreason.Add(BA.ObjectToString(_m2.Get((Object)("name"))));
 //BA.debugLineNum = 334;BA.debugLine="reason_id.Add(m2.Get(\"return_reason_id\"))";
mostCurrent._reason_id.Add(_m2.Get((Object)("return_reason_id")));
 }
};
 };
 //BA.debugLineNum = 338;BA.debugLine="End Sub";
return "";
}
public static String  _globals() throws Exception{
 //BA.debugLineNum = 11;BA.debugLine="Sub Globals";
 //BA.debugLineNum = 12;BA.debugLine="Private ShopInformation As Map";
mostCurrent._shopinformation = new anywheresoftware.b4a.objects.collections.Map();
 //BA.debugLineNum = 14;BA.debugLine="Private lbltitle As Label";
mostCurrent._lbltitle = new anywheresoftware.b4a.objects.LabelWrapper();
 //BA.debugLineNum = 15;BA.debugLine="Private pnlheader As Panel";
mostCurrent._pnlheader = new anywheresoftware.b4a.objects.PanelWrapper();
 //BA.debugLineNum = 16;BA.debugLine="Private sv1 As ScrollView";
mostCurrent._sv1 = new anywheresoftware.b4a.objects.ScrollViewWrapper();
 //BA.debugLineNum = 17;BA.debugLine="Private lblorder_payment_type_title As Label";
mostCurrent._lblorder_payment_type_title = new anywheresoftware.b4a.objects.LabelWrapper();
 //BA.debugLineNum = 18;BA.debugLine="Private lblorderaddress1 As Label";
mostCurrent._lblorderaddress1 = new anywheresoftware.b4a.objects.LabelWrapper();
 //BA.debugLineNum = 19;BA.debugLine="Private lblorderaddress2 As Label";
mostCurrent._lblorderaddress2 = new anywheresoftware.b4a.objects.LabelWrapper();
 //BA.debugLineNum = 20;BA.debugLine="Private lblordercity1 As Label";
mostCurrent._lblordercity1 = new anywheresoftware.b4a.objects.LabelWrapper();
 //BA.debugLineNum = 21;BA.debugLine="Private lblordercity2 As Label";
mostCurrent._lblordercity2 = new anywheresoftware.b4a.objects.LabelWrapper();
 //BA.debugLineNum = 22;BA.debugLine="Private lblordercountry1 As Label";
mostCurrent._lblordercountry1 = new anywheresoftware.b4a.objects.LabelWrapper();
 //BA.debugLineNum = 23;BA.debugLine="Private lblordercountry2 As Label";
mostCurrent._lblordercountry2 = new anywheresoftware.b4a.objects.LabelWrapper();
 //BA.debugLineNum = 24;BA.debugLine="Private lblorderpayment_ship_type As Label";
mostCurrent._lblorderpayment_ship_type = new anywheresoftware.b4a.objects.LabelWrapper();
 //BA.debugLineNum = 25;BA.debugLine="Private lblorderpayment_type As Label";
mostCurrent._lblorderpayment_type = new anywheresoftware.b4a.objects.LabelWrapper();
 //BA.debugLineNum = 26;BA.debugLine="Private lblorderphone As Label";
mostCurrent._lblorderphone = new anywheresoftware.b4a.objects.LabelWrapper();
 //BA.debugLineNum = 27;BA.debugLine="Private lblorderphone2 As Label";
mostCurrent._lblorderphone2 = new anywheresoftware.b4a.objects.LabelWrapper();
 //BA.debugLineNum = 28;BA.debugLine="Private lblorderpostal1 As Label";
mostCurrent._lblorderpostal1 = new anywheresoftware.b4a.objects.LabelWrapper();
 //BA.debugLineNum = 29;BA.debugLine="Private lblorderpostal2 As Label";
mostCurrent._lblorderpostal2 = new anywheresoftware.b4a.objects.LabelWrapper();
 //BA.debugLineNum = 30;BA.debugLine="Private lblorderreceiver_name1 As Label";
mostCurrent._lblorderreceiver_name1 = new anywheresoftware.b4a.objects.LabelWrapper();
 //BA.debugLineNum = 31;BA.debugLine="Private lblorderreceiver_name2 As Label";
mostCurrent._lblorderreceiver_name2 = new anywheresoftware.b4a.objects.LabelWrapper();
 //BA.debugLineNum = 32;BA.debugLine="Private lblordership_type As Label";
mostCurrent._lblordership_type = new anywheresoftware.b4a.objects.LabelWrapper();
 //BA.debugLineNum = 33;BA.debugLine="Private lblordershop_name As Label";
mostCurrent._lblordershop_name = new anywheresoftware.b4a.objects.LabelWrapper();
 //BA.debugLineNum = 34;BA.debugLine="Private imgicon As ImageView";
mostCurrent._imgicon = new anywheresoftware.b4a.objects.ImageViewWrapper();
 //BA.debugLineNum = 35;BA.debugLine="Private pnl_item_product As Panel";
mostCurrent._pnl_item_product = new anywheresoftware.b4a.objects.PanelWrapper();
 //BA.debugLineNum = 36;BA.debugLine="Private lblprice_quantity As Label";
mostCurrent._lblprice_quantity = new anywheresoftware.b4a.objects.LabelWrapper();
 //BA.debugLineNum = 37;BA.debugLine="Private lblname_product As Label";
mostCurrent._lblname_product = new anywheresoftware.b4a.objects.LabelWrapper();
 //BA.debugLineNum = 38;BA.debugLine="Private lblproducts As Label";
mostCurrent._lblproducts = new anywheresoftware.b4a.objects.LabelWrapper();
 //BA.debugLineNum = 39;BA.debugLine="Private top As Int";
_top = 0;
 //BA.debugLineNum = 40;BA.debugLine="Private btnreturn As Button";
mostCurrent._btnreturn = new anywheresoftware.b4a.objects.ButtonWrapper();
 //BA.debugLineNum = 41;BA.debugLine="Private pnlreturn As Panel";
mostCurrent._pnlreturn = new anywheresoftware.b4a.objects.PanelWrapper();
 //BA.debugLineNum = 42;BA.debugLine="Private lblcomment As Label";
mostCurrent._lblcomment = new anywheresoftware.b4a.objects.LabelWrapper();
 //BA.debugLineNum = 43;BA.debugLine="Private lblopened As Label";
mostCurrent._lblopened = new anywheresoftware.b4a.objects.LabelWrapper();
 //BA.debugLineNum = 44;BA.debugLine="Private lblreason As Label";
mostCurrent._lblreason = new anywheresoftware.b4a.objects.LabelWrapper();
 //BA.debugLineNum = 45;BA.debugLine="Private rbno As RadioButton";
mostCurrent._rbno = new anywheresoftware.b4a.objects.CompoundButtonWrapper.RadioButtonWrapper();
 //BA.debugLineNum = 46;BA.debugLine="Private rbyes As RadioButton";
mostCurrent._rbyes = new anywheresoftware.b4a.objects.CompoundButtonWrapper.RadioButtonWrapper();
 //BA.debugLineNum = 47;BA.debugLine="Private spreason As Spinner";
mostCurrent._spreason = new anywheresoftware.b4a.objects.SpinnerWrapper();
 //BA.debugLineNum = 48;BA.debugLine="Private txtcomment As EditText";
mostCurrent._txtcomment = new anywheresoftware.b4a.objects.EditTextWrapper();
 //BA.debugLineNum = 49;BA.debugLine="Private btncancel As Button";
mostCurrent._btncancel = new anywheresoftware.b4a.objects.ButtonWrapper();
 //BA.debugLineNum = 50;BA.debugLine="Private btncancelreturn As Button";
mostCurrent._btncancelreturn = new anywheresoftware.b4a.objects.ButtonWrapper();
 //BA.debugLineNum = 51;BA.debugLine="Private btnreturn_product As Button";
mostCurrent._btnreturn_product = new anywheresoftware.b4a.objects.ButtonWrapper();
 //BA.debugLineNum = 52;BA.debugLine="Private toast As MyToastMessageShow";
mostCurrent._toast = new com.apps.demo.mytoastmessageshow();
 //BA.debugLineNum = 53;BA.debugLine="Private pnlloading As Panel";
mostCurrent._pnlloading = new anywheresoftware.b4a.objects.PanelWrapper();
 //BA.debugLineNum = 54;BA.debugLine="Private lblpb As Label";
mostCurrent._lblpb = new anywheresoftware.b4a.objects.LabelWrapper();
 //BA.debugLineNum = 55;BA.debugLine="Private reason_id As List";
mostCurrent._reason_id = new anywheresoftware.b4a.objects.collections.List();
 //BA.debugLineNum = 56;BA.debugLine="Private btnprint As Button";
mostCurrent._btnprint = new anywheresoftware.b4a.objects.ButtonWrapper();
 //BA.debugLineNum = 57;BA.debugLine="End Sub";
return "";
}
public static String  _jobdone(anywheresoftware.b4a.samples.httputils2.httpjob _job) throws Exception{
String _filename = "";
anywheresoftware.b4a.objects.streams.File.OutputStreamWrapper _ou = null;
anywheresoftware.b4a.objects.IntentWrapper _intent1 = null;
 //BA.debugLineNum = 420;BA.debugLine="Sub JobDone(Job As HttpJob)";
 //BA.debugLineNum = 422;BA.debugLine="pnlloading.SetVisibleAnimated(500,False)";
mostCurrent._pnlloading.SetVisibleAnimated((int) (500),anywheresoftware.b4a.keywords.Common.False);
 //BA.debugLineNum = 424;BA.debugLine="If Job.Success = False Then";
if (_job._success==anywheresoftware.b4a.keywords.Common.False) { 
 //BA.debugLineNum = 425;BA.debugLine="Job.Release";
_job._release();
 //BA.debugLineNum = 426;BA.debugLine="Return";
if (true) return "";
 };
 //BA.debugLineNum = 429;BA.debugLine="Try";
try { //BA.debugLineNum = 431;BA.debugLine="Dim filename As String";
_filename = "";
 //BA.debugLineNum = 432;BA.debugLine="filename = $\"order_${details.Get(\"order_id\")}.pd";
_filename = ("order_"+anywheresoftware.b4a.keywords.Common.SmartStringFormatter("",_details.Get((Object)("order_id")))+".pdf");
 //BA.debugLineNum = 434;BA.debugLine="File.Delete(File.DirRootExternal,filename)";
anywheresoftware.b4a.keywords.Common.File.Delete(anywheresoftware.b4a.keywords.Common.File.getDirRootExternal(),_filename);
 //BA.debugLineNum = 435;BA.debugLine="Dim ou As OutputStream";
_ou = new anywheresoftware.b4a.objects.streams.File.OutputStreamWrapper();
 //BA.debugLineNum = 436;BA.debugLine="ou = File.OpenOutput(File.DirRootExternal,filena";
_ou = anywheresoftware.b4a.keywords.Common.File.OpenOutput(anywheresoftware.b4a.keywords.Common.File.getDirRootExternal(),_filename,anywheresoftware.b4a.keywords.Common.False);
 //BA.debugLineNum = 437;BA.debugLine="File.Copy2(Job.GetInputStream,ou)";
anywheresoftware.b4a.keywords.Common.File.Copy2((java.io.InputStream)(_job._getinputstream().getObject()),(java.io.OutputStream)(_ou.getObject()));
 //BA.debugLineNum = 438;BA.debugLine="ou.Close";
_ou.Close();
 //BA.debugLineNum = 440;BA.debugLine="Dim Intent1 As Intent";
_intent1 = new anywheresoftware.b4a.objects.IntentWrapper();
 //BA.debugLineNum = 441;BA.debugLine="Intent1.Initialize(Intent1.ACTION_VIEW,\"file:";
_intent1.Initialize(_intent1.ACTION_VIEW,"file://"+anywheresoftware.b4a.keywords.Common.File.Combine(anywheresoftware.b4a.keywords.Common.File.getDirRootExternal(),_filename));
 //BA.debugLineNum = 442;BA.debugLine="Intent1.SetComponent(\"android/com.android.int";
_intent1.SetComponent("android/com.android.internal.app.ResolverActivity");
 //BA.debugLineNum = 443;BA.debugLine="Intent1.SetType(\"application/pdf\")";
_intent1.SetType("application/pdf");
 //BA.debugLineNum = 444;BA.debugLine="StartActivity(Intent1)";
anywheresoftware.b4a.keywords.Common.StartActivity(mostCurrent.activityBA,(Object)(_intent1.getObject()));
 } 
       catch (Exception e20) {
			processBA.setLastException(e20); };
 //BA.debugLineNum = 449;BA.debugLine="Job.Release";
_job._release();
 //BA.debugLineNum = 451;BA.debugLine="End Sub";
return "";
}
public static String  _loadattribute(anywheresoftware.b4a.objects.collections.List _attr) throws Exception{
anywheresoftware.b4a.objects.LabelWrapper _lblheader = null;
int _i = 0;
anywheresoftware.b4a.objects.collections.Map _temp = null;
anywheresoftware.b4a.objects.LabelWrapper _lblkey = null;
String _date = "";
anywheresoftware.b4a.objects.LabelWrapper _lblval = null;
 //BA.debugLineNum = 189;BA.debugLine="Sub LoadAttribute(attr As List)";
 //BA.debugLineNum = 191;BA.debugLine="If attr.IsInitialized = False Then Return";
if (_attr.IsInitialized()==anywheresoftware.b4a.keywords.Common.False) { 
if (true) return "";};
 //BA.debugLineNum = 192;BA.debugLine="If attr.Size = 0 Then Return";
if (_attr.getSize()==0) { 
if (true) return "";};
 //BA.debugLineNum = 194;BA.debugLine="Dim lblHeader As Label";
_lblheader = new anywheresoftware.b4a.objects.LabelWrapper();
 //BA.debugLineNum = 195;BA.debugLine="lblHeader.Initialize(\"\")";
_lblheader.Initialize(mostCurrent.activityBA,"");
 //BA.debugLineNum = 196;BA.debugLine="lblHeader.Color = Library.Theme_Background";
_lblheader.setColor(mostCurrent._library._theme_background);
 //BA.debugLineNum = 197;BA.debugLine="lblHeader.Typeface = Library.GetFont";
_lblheader.setTypeface((android.graphics.Typeface)(mostCurrent._library._getfont(mostCurrent.activityBA).getObject()));
 //BA.debugLineNum = 198;BA.debugLine="lblHeader.TextSize = 14";
_lblheader.setTextSize((float) (14));
 //BA.debugLineNum = 199;BA.debugLine="lblHeader.TextColor = Colors.Gray";
_lblheader.setTextColor(anywheresoftware.b4a.keywords.Common.Colors.Gray);
 //BA.debugLineNum = 200;BA.debugLine="lblHeader.Text = Library.GetStringResourse(\"attri";
_lblheader.setText(BA.ObjectToCharSequence(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"attribute")));
 //BA.debugLineNum = 201;BA.debugLine="lblHeader.Gravity = Library.GetStringResourse(\"di";
_lblheader.setGravity((int)(Double.parseDouble(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"direction"))));
 //BA.debugLineNum = 202;BA.debugLine="Library.PaddingLabel(lblHeader,10,0,10,0)";
mostCurrent._library._paddinglabel(mostCurrent.activityBA,_lblheader,(int) (10),(int) (0),(int) (10),(int) (0));
 //BA.debugLineNum = 203;BA.debugLine="sv1.Panel.AddView(lblHeader,sv1.Left,top,sv1.Widt";
mostCurrent._sv1.getPanel().AddView((android.view.View)(_lblheader.getObject()),mostCurrent._sv1.getLeft(),_top,mostCurrent._sv1.getWidth(),anywheresoftware.b4a.keywords.Common.DipToCurrent((int) (40)));
 //BA.debugLineNum = 204;BA.debugLine="top = top + 40dip";
_top = (int) (_top+anywheresoftware.b4a.keywords.Common.DipToCurrent((int) (40)));
 //BA.debugLineNum = 205;BA.debugLine="sv1.Panel.Height = sv1.Panel.Height + 40dip";
mostCurrent._sv1.getPanel().setHeight((int) (mostCurrent._sv1.getPanel().getHeight()+anywheresoftware.b4a.keywords.Common.DipToCurrent((int) (40))));
 //BA.debugLineNum = 207;BA.debugLine="For i = 0 To attr.Size - 1";
{
final int step15 = 1;
final int limit15 = (int) (_attr.getSize()-1);
for (_i = (int) (0) ; (step15 > 0 && _i <= limit15) || (step15 < 0 && _i >= limit15); _i = ((int)(0 + _i + step15)) ) {
 //BA.debugLineNum = 209;BA.debugLine="Dim temp As Map";
_temp = new anywheresoftware.b4a.objects.collections.Map();
 //BA.debugLineNum = 210;BA.debugLine="temp = attr.Get(i)";
_temp.setObject((anywheresoftware.b4a.objects.collections.Map.MyMap)(_attr.Get(_i)));
 //BA.debugLineNum = 212;BA.debugLine="Dim lblKey As Label";
_lblkey = new anywheresoftware.b4a.objects.LabelWrapper();
 //BA.debugLineNum = 213;BA.debugLine="lblKey.Initialize(\"\")";
_lblkey.Initialize(mostCurrent.activityBA,"");
 //BA.debugLineNum = 214;BA.debugLine="lblKey.Color = Library.Theme_Header";
_lblkey.setColor(mostCurrent._library._theme_header);
 //BA.debugLineNum = 215;BA.debugLine="lblKey.Typeface = Library.GetFont";
_lblkey.setTypeface((android.graphics.Typeface)(mostCurrent._library._getfont(mostCurrent.activityBA).getObject()));
 //BA.debugLineNum = 216;BA.debugLine="lblKey.TextSize = 14";
_lblkey.setTextSize((float) (14));
 //BA.debugLineNum = 217;BA.debugLine="lblKey.TextColor = Colors.White";
_lblkey.setTextColor(anywheresoftware.b4a.keywords.Common.Colors.White);
 //BA.debugLineNum = 219;BA.debugLine="Dim date As String";
_date = "";
 //BA.debugLineNum = 220;BA.debugLine="If Library.IsPersian Then";
if (mostCurrent._library._ispersian(mostCurrent.activityBA)) { 
 //BA.debugLineNum = 221;BA.debugLine="date = Library.GetDate(temp.Get(\"date_added\"))";
_date = mostCurrent._library._getdate(mostCurrent.activityBA,BA.ObjectToString(_temp.Get((Object)("date_added"))));
 }else {
 //BA.debugLineNum = 223;BA.debugLine="date = temp.Get(\"date_added\")";
_date = BA.ObjectToString(_temp.Get((Object)("date_added")));
 };
 //BA.debugLineNum = 226;BA.debugLine="lblKey.Text = temp.Get(\"status\") & \" => \" & date";
_lblkey.setText(BA.ObjectToCharSequence(BA.ObjectToString(_temp.Get((Object)("status")))+" => "+_date));
 //BA.debugLineNum = 227;BA.debugLine="lblKey.Gravity = Library.GetStringResourse(\"dire";
_lblkey.setGravity((int)(Double.parseDouble(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"direction"))));
 //BA.debugLineNum = 228;BA.debugLine="Library.PaddingLabel(lblKey,10,0,10,0)";
mostCurrent._library._paddinglabel(mostCurrent.activityBA,_lblkey,(int) (10),(int) (0),(int) (10),(int) (0));
 //BA.debugLineNum = 230;BA.debugLine="sv1.Panel.AddView(lblKey,0,top,sv1.Width,40dip)";
mostCurrent._sv1.getPanel().AddView((android.view.View)(_lblkey.getObject()),(int) (0),_top,mostCurrent._sv1.getWidth(),anywheresoftware.b4a.keywords.Common.DipToCurrent((int) (40)));
 //BA.debugLineNum = 231;BA.debugLine="top = top + 40dip";
_top = (int) (_top+anywheresoftware.b4a.keywords.Common.DipToCurrent((int) (40)));
 //BA.debugLineNum = 232;BA.debugLine="sv1.Panel.Height = sv1.Panel.Height + 40dip";
mostCurrent._sv1.getPanel().setHeight((int) (mostCurrent._sv1.getPanel().getHeight()+anywheresoftware.b4a.keywords.Common.DipToCurrent((int) (40))));
 //BA.debugLineNum = 234;BA.debugLine="Dim lblVal As Label";
_lblval = new anywheresoftware.b4a.objects.LabelWrapper();
 //BA.debugLineNum = 235;BA.debugLine="lblVal.Initialize(\"\")";
_lblval.Initialize(mostCurrent.activityBA,"");
 //BA.debugLineNum = 236;BA.debugLine="lblVal.Color = Colors.White";
_lblval.setColor(anywheresoftware.b4a.keywords.Common.Colors.White);
 //BA.debugLineNum = 237;BA.debugLine="lblVal.Typeface = Library.GetFont";
_lblval.setTypeface((android.graphics.Typeface)(mostCurrent._library._getfont(mostCurrent.activityBA).getObject()));
 //BA.debugLineNum = 238;BA.debugLine="lblVal.TextSize = 12";
_lblval.setTextSize((float) (12));
 //BA.debugLineNum = 239;BA.debugLine="lblVal.TextColor = Colors.Black";
_lblval.setTextColor(anywheresoftware.b4a.keywords.Common.Colors.Black);
 //BA.debugLineNum = 240;BA.debugLine="lblVal.Text = temp.Get(\"comment\")";
_lblval.setText(BA.ObjectToCharSequence(_temp.Get((Object)("comment"))));
 //BA.debugLineNum = 241;BA.debugLine="lblVal.Gravity = Library.GetStringResourse(\"dire";
_lblval.setGravity((int)(Double.parseDouble(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"direction"))));
 //BA.debugLineNum = 242;BA.debugLine="Library.PaddingLabel(lblVal,10,0,10,0)";
mostCurrent._library._paddinglabel(mostCurrent.activityBA,_lblval,(int) (10),(int) (0),(int) (10),(int) (0));
 //BA.debugLineNum = 244;BA.debugLine="sv1.Panel.AddView(lblVal,sv1.Left,top,sv1.Width,";
mostCurrent._sv1.getPanel().AddView((android.view.View)(_lblval.getObject()),mostCurrent._sv1.getLeft(),_top,mostCurrent._sv1.getWidth(),anywheresoftware.b4a.keywords.Common.DipToCurrent((int) (90)));
 //BA.debugLineNum = 245;BA.debugLine="top = top + 90dip";
_top = (int) (_top+anywheresoftware.b4a.keywords.Common.DipToCurrent((int) (90)));
 //BA.debugLineNum = 246;BA.debugLine="sv1.Panel.Height = sv1.Panel.Height + 90dip";
mostCurrent._sv1.getPanel().setHeight((int) (mostCurrent._sv1.getPanel().getHeight()+anywheresoftware.b4a.keywords.Common.DipToCurrent((int) (90))));
 //BA.debugLineNum = 248;BA.debugLine="DoEvents";
anywheresoftware.b4a.keywords.Common.DoEvents();
 }
};
 //BA.debugLineNum = 252;BA.debugLine="End Sub";
return "";
}
public static String  _print() throws Exception{
anywheresoftware.b4a.objects.collections.List _l = null;
anywheresoftware.b4a.objects.collections.JSONParser.JSONGenerator _js = null;
anywheresoftware.b4a.objects.collections.List _products = null;
int _i = 0;
anywheresoftware.b4a.objects.collections.Map _pr = null;
anywheresoftware.b4a.objects.collections.Map _data = null;
String _addr = "";
int _j = 0;
String _tem = "";
anywheresoftware.b4a.samples.httputils2.httpjob _h = null;
 //BA.debugLineNum = 351;BA.debugLine="Sub Print";
 //BA.debugLineNum = 353;BA.debugLine="Dim l As List";
_l = new anywheresoftware.b4a.objects.collections.List();
 //BA.debugLineNum = 354;BA.debugLine="l.Initialize";
_l.Initialize();
 //BA.debugLineNum = 356;BA.debugLine="Dim js As JSONGenerator";
_js = new anywheresoftware.b4a.objects.collections.JSONParser.JSONGenerator();
 //BA.debugLineNum = 358;BA.debugLine="Dim products As List";
_products = new anywheresoftware.b4a.objects.collections.List();
 //BA.debugLineNum = 359;BA.debugLine="products = details.Get(\"products\")";
_products.setObject((java.util.List)(_details.Get((Object)("products"))));
 //BA.debugLineNum = 361;BA.debugLine="For i = 0 To products.Size - 1";
{
final int step6 = 1;
final int limit6 = (int) (_products.getSize()-1);
for (_i = (int) (0) ; (step6 > 0 && _i <= limit6) || (step6 < 0 && _i >= limit6); _i = ((int)(0 + _i + step6)) ) {
 //BA.debugLineNum = 362;BA.debugLine="Dim pr As Map";
_pr = new anywheresoftware.b4a.objects.collections.Map();
 //BA.debugLineNum = 363;BA.debugLine="pr = products.Get(i)";
_pr.setObject((anywheresoftware.b4a.objects.collections.Map.MyMap)(_products.Get(_i)));
 //BA.debugLineNum = 364;BA.debugLine="l.Add(CreateMap(\"title\":pr.Get(\"name\"),\"price\":p";
_l.Add((Object)(anywheresoftware.b4a.keywords.Common.createMap(new Object[] {(Object)("title"),_pr.Get((Object)("name")),(Object)("price"),_pr.Get((Object)("price")),(Object)("quantity"),_pr.Get((Object)("quantity")),(Object)("total"),_pr.Get((Object)("total"))}).getObject()));
 }
};
 //BA.debugLineNum = 367;BA.debugLine="js.Initialize2(l)";
_js.Initialize2(_l);
 //BA.debugLineNum = 369;BA.debugLine="Dim data As Map";
_data = new anywheresoftware.b4a.objects.collections.Map();
 //BA.debugLineNum = 370;BA.debugLine="data.Initialize";
_data.Initialize();
 //BA.debugLineNum = 371;BA.debugLine="data.Put(\"invoice\",\"1\")";
_data.Put((Object)("invoice"),(Object)("1"));
 //BA.debugLineNum = 372;BA.debugLine="data.Put(\"product\",l)";
_data.Put((Object)("product"),(Object)(_l.getObject()));
 //BA.debugLineNum = 374;BA.debugLine="If Library.IsPersian Then";
if (mostCurrent._library._ispersian(mostCurrent.activityBA)) { 
 //BA.debugLineNum = 375;BA.debugLine="data.Put(\"date\",Library.GetDate(details.Get(\"dat";
_data.Put((Object)("date"),(Object)(mostCurrent._library._getdate(mostCurrent.activityBA,BA.ObjectToString(_details.Get((Object)("date_added"))))));
 }else {
 //BA.debugLineNum = 377;BA.debugLine="data.Put(\"date\",details.Get(\"date_added\"))";
_data.Put((Object)("date"),_details.Get((Object)("date_added")));
 };
 //BA.debugLineNum = 380;BA.debugLine="data.Put(\"id\",details.Get(\"order_id\"))";
_data.Put((Object)("id"),_details.Get((Object)("order_id")));
 //BA.debugLineNum = 381;BA.debugLine="data.Put(\"seller\",$\"${ShopInformation.Get(\"store_";
_data.Put((Object)("seller"),(Object)((""+anywheresoftware.b4a.keywords.Common.SmartStringFormatter("",mostCurrent._shopinformation.Get((Object)("store_address")))+" - "+anywheresoftware.b4a.keywords.Common.SmartStringFormatter("",mostCurrent._shopinformation.Get((Object)("store_name")))+" - "+anywheresoftware.b4a.keywords.Common.SmartStringFormatter("",mostCurrent._shopinformation.Get((Object)("store_telephone")))+")")));
 //BA.debugLineNum = 382;BA.debugLine="data.Put(\"client_name\",details.Get(\"firstname\") &";
_data.Put((Object)("client_name"),(Object)(BA.ObjectToString(_details.Get((Object)("firstname")))+" "+BA.ObjectToString(_details.Get((Object)("lastname")))));
 //BA.debugLineNum = 383;BA.debugLine="data.Put(\"client_phone\",details.Get(\"telephone\"))";
_data.Put((Object)("client_phone"),_details.Get((Object)("telephone")));
 //BA.debugLineNum = 384;BA.debugLine="data.Put(\"client_email\",details.Get(\"email\"))";
_data.Put((Object)("client_email"),_details.Get((Object)("email")));
 //BA.debugLineNum = 385;BA.debugLine="data.Put(\"client_site\",\"-\")";
_data.Put((Object)("client_site"),(Object)("-"));
 //BA.debugLineNum = 387;BA.debugLine="Dim addr As String";
_addr = "";
 //BA.debugLineNum = 388;BA.debugLine="addr = details.Get(\"shipping_address\")";
_addr = BA.ObjectToString(_details.Get((Object)("shipping_address")));
 //BA.debugLineNum = 390;BA.debugLine="If addr.Length = 0 Then";
if (_addr.length()==0) { 
 //BA.debugLineNum = 391;BA.debugLine="addr = details.Get(\"payment_address\")";
_addr = BA.ObjectToString(_details.Get((Object)("payment_address")));
 };
 //BA.debugLineNum = 394;BA.debugLine="data.Put(\"client_address\",addr)";
_data.Put((Object)("client_address"),(Object)(_addr));
 //BA.debugLineNum = 395;BA.debugLine="data.Put(\"client_comment\",details.Get(\"comment\"))";
_data.Put((Object)("client_comment"),_details.Get((Object)("comment")));
 //BA.debugLineNum = 396;BA.debugLine="data.Put(\"shop_site\",Library.GetStringResourse(\"u";
_data.Put((Object)("shop_site"),(Object)(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"url")));
 //BA.debugLineNum = 397;BA.debugLine="data.Put(\"payment\",details.Get(\"payment_method\"))";
_data.Put((Object)("payment"),_details.Get((Object)("payment_method")));
 //BA.debugLineNum = 398;BA.debugLine="data.Put(\"ship\",details.Get(\"shipping_method\"))";
_data.Put((Object)("ship"),_details.Get((Object)("shipping_method")));
 //BA.debugLineNum = 400;BA.debugLine="If Library.IsPersian Then";
if (mostCurrent._library._ispersian(mostCurrent.activityBA)) { 
 //BA.debugLineNum = 401;BA.debugLine="data.Put(\"lang\",\"fa\")";
_data.Put((Object)("lang"),(Object)("fa"));
 }else {
 //BA.debugLineNum = 403;BA.debugLine="data.Put(\"lang\",\"en\")";
_data.Put((Object)("lang"),(Object)("en"));
 };
 //BA.debugLineNum = 406;BA.debugLine="For j = 0 To data.Size - 1";
{
final int step42 = 1;
final int limit42 = (int) (_data.getSize()-1);
for (_j = (int) (0) ; (step42 > 0 && _j <= limit42) || (step42 < 0 && _j >= limit42); _j = ((int)(0 + _j + step42)) ) {
 //BA.debugLineNum = 407;BA.debugLine="Dim tem As String";
_tem = "";
 //BA.debugLineNum = 408;BA.debugLine="tem = data.GetValueAt(j)";
_tem = BA.ObjectToString(_data.GetValueAt(_j));
 //BA.debugLineNum = 409;BA.debugLine="If tem.Length = 0 Then data.Put(data.GetKeyAt(j)";
if (_tem.length()==0) { 
_data.Put(_data.GetKeyAt(_j),(Object)("-"));};
 }
};
 //BA.debugLineNum = 412;BA.debugLine="js.Initialize(data)";
_js.Initialize(_data);
 //BA.debugLineNum = 414;BA.debugLine="Dim h As HttpJob";
_h = new anywheresoftware.b4a.samples.httputils2.httpjob();
 //BA.debugLineNum = 415;BA.debugLine="h.Initialize(\"print\",Me)";
_h._initialize(processBA,"print",actorderdetails.getObject());
 //BA.debugLineNum = 416;BA.debugLine="h.PostString(Library.GetStringResourse(\"url\") & \"";
_h._poststring(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"url")+"/app/invoice/invoice.php","data="+_js.ToString());
 //BA.debugLineNum = 418;BA.debugLine="End Sub";
return "";
}
public static String  _process_globals() throws Exception{
 //BA.debugLineNum = 6;BA.debugLine="Sub Process_Globals";
 //BA.debugLineNum = 7;BA.debugLine="Public details As Map";
_details = new anywheresoftware.b4a.objects.collections.Map();
 //BA.debugLineNum = 8;BA.debugLine="Public user_details As Map";
_user_details = new anywheresoftware.b4a.objects.collections.Map();
 //BA.debugLineNum = 9;BA.debugLine="End Sub";
return "";
}
public static String  _return_receive(anywheresoftware.b4a.objects.collections.Map _res,String _cat) throws Exception{
 //BA.debugLineNum = 308;BA.debugLine="Sub return_receive(res As Map,cat As String)";
 //BA.debugLineNum = 310;BA.debugLine="pnlloading.SetVisibleAnimated(500,False)";
mostCurrent._pnlloading.SetVisibleAnimated((int) (500),anywheresoftware.b4a.keywords.Common.False);
 //BA.debugLineNum = 312;BA.debugLine="If res.IsInitialized Then";
if (_res.IsInitialized()) { 
 //BA.debugLineNum = 313;BA.debugLine="If res.ContainsKey(\"success\") Then";
if (_res.ContainsKey((Object)("success"))) { 
 //BA.debugLineNum = 314;BA.debugLine="If res.Get(\"success\") = True Then";
if ((_res.Get((Object)("success"))).equals((Object)(anywheresoftware.b4a.keywords.Common.True))) { 
 //BA.debugLineNum = 315;BA.debugLine="pnlreturn.Visible = False";
mostCurrent._pnlreturn.setVisible(anywheresoftware.b4a.keywords.Common.False);
 //BA.debugLineNum = 316;BA.debugLine="toast.Initialize(Activity)";
mostCurrent._toast._initialize(mostCurrent.activityBA,(anywheresoftware.b4a.objects.PanelWrapper) anywheresoftware.b4a.AbsObjectWrapper.ConvertToWrapper(new anywheresoftware.b4a.objects.PanelWrapper(), (android.view.ViewGroup)(mostCurrent._activity.getObject())));
 //BA.debugLineNum = 317;BA.debugLine="toast.ShowToastMessageShow(Library.GetStringRe";
mostCurrent._toast._showtoastmessageshow(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"return_success"),(long) (2),anywheresoftware.b4a.keywords.Common.True);
 };
 };
 };
 //BA.debugLineNum = 322;BA.debugLine="End Sub";
return "";
}
public static String  _storedetails_receive(anywheresoftware.b4a.objects.collections.Map _res,String _cat) throws Exception{
 //BA.debugLineNum = 453;BA.debugLine="Sub StoreDetails_receive(res As Map,cat As String)";
 //BA.debugLineNum = 455;BA.debugLine="ShopInformation = res.Get(\"data\")";
mostCurrent._shopinformation.setObject((anywheresoftware.b4a.objects.collections.Map.MyMap)(_res.Get((Object)("data"))));
 //BA.debugLineNum = 456;BA.debugLine="Print";
_print();
 //BA.debugLineNum = 458;BA.debugLine="End Sub";
return "";
}
}
