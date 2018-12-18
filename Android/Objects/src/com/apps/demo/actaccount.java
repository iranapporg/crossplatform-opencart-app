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

public class actaccount extends Activity implements B4AActivity{
	public static actaccount mostCurrent;
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
			processBA = new BA(this.getApplicationContext(), null, null, "com.apps.demo", "com.apps.demo.actaccount");
			processBA.loadHtSubs(this.getClass());
	        float deviceScale = getApplicationContext().getResources().getDisplayMetrics().density;
	        BALayout.setDeviceScale(deviceScale);
            
		}
		else if (previousOne != null) {
			Activity p = previousOne.get();
			if (p != null && p != this) {
                BA.LogInfo("Killing previous instance (actaccount).");
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
		activityBA = new BA(this, layout, processBA, "com.apps.demo", "com.apps.demo.actaccount");
        
        processBA.sharedProcessBA.activityBA = new java.lang.ref.WeakReference<BA>(activityBA);
        anywheresoftware.b4a.objects.ViewWrapper.lastId = 0;
        _activity = new ActivityWrapper(activityBA, "activity");
        anywheresoftware.b4a.Msgbox.isDismissing = false;
        if (BA.isShellModeRuntimeCheck(processBA)) {
			if (isFirst)
				processBA.raiseEvent2(null, true, "SHELL", false);
			processBA.raiseEvent2(null, true, "CREATE", true, "com.apps.demo.actaccount", processBA, activityBA, _activity, anywheresoftware.b4a.keywords.Common.Density, mostCurrent);
			_activity.reinitializeForShell(activityBA, "activity");
		}
        initializeProcessGlobals();		
        initializeGlobals();
        
        BA.LogInfo("** Activity (actaccount) Create, isFirst = " + isFirst + " **");
        processBA.raiseEvent2(null, true, "activity_create", false, isFirst);
		isFirst = false;
		if (this != mostCurrent)
			return;
        processBA.setActivityPaused(false);
        BA.LogInfo("** Activity (actaccount) Resume **");
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
		return actaccount.class;
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
        BA.LogInfo("** Activity (actaccount) Pause, UserClosed = " + activityBA.activity.isFinishing() + " **");
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
            BA.LogInfo("** Activity (actaccount) Resume **");
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
public static String _choosentab = "";
public static anywheresoftware.b4a.objects.Timer _tmropenmenu = null;
public anywheresoftware.b4a.objects.TabHostWrapper _tab1 = null;
public anywheresoftware.b4a.objects.ScrollViewWrapper _sv1 = null;
public anywheresoftware.b4a.objects.ScrollViewWrapper _svreturns = null;
public anywheresoftware.b4a.objects.ButtonWrapper _btnsave = null;
public anywheresoftware.b4a.objects.LabelWrapper _label11 = null;
public anywheresoftware.b4a.objects.LabelWrapper _label2 = null;
public anywheresoftware.b4a.objects.LabelWrapper _label3 = null;
public anywheresoftware.b4a.objects.LabelWrapper _label5 = null;
public anywheresoftware.b4a.objects.LabelWrapper _label7 = null;
public anywheresoftware.b4a.objects.LabelWrapper _label9 = null;
public anywheresoftware.b4a.objects.LabelWrapper _lbldate = null;
public anywheresoftware.b4a.objects.LabelWrapper _lblemail = null;
public anywheresoftware.b4a.objects.LabelWrapper _lblfamily = null;
public anywheresoftware.b4a.objects.LabelWrapper _lblfax = null;
public anywheresoftware.b4a.objects.LabelWrapper _lblip = null;
public anywheresoftware.b4a.objects.LabelWrapper _lblname = null;
public anywheresoftware.b4a.objects.LabelWrapper _lblpassword = null;
public anywheresoftware.b4a.objects.LabelWrapper _lblphone = null;
public anywheresoftware.b4a.objects.EditTextWrapper _txtemail = null;
public anywheresoftware.b4a.objects.EditTextWrapper _txtfamily = null;
public anywheresoftware.b4a.objects.EditTextWrapper _txtfax = null;
public anywheresoftware.b4a.objects.EditTextWrapper _txtname = null;
public anywheresoftware.b4a.objects.EditTextWrapper _txtpassword = null;
public anywheresoftware.b4a.objects.EditTextWrapper _txtphone = null;
public anywheresoftware.b4a.objects.PanelWrapper _panel1 = null;
public anywheresoftware.b4a.objects.ButtonWrapper _btnpassword = null;
public anywheresoftware.b4a.objects.LabelWrapper _lblcountry = null;
public anywheresoftware.b4a.objects.SpinnerWrapper _txtcountry = null;
public anywheresoftware.b4a.objects.LabelWrapper _lblcity = null;
public anywheresoftware.b4a.objects.SpinnerWrapper _txtcity = null;
public anywheresoftware.b4a.objects.LabelWrapper _lbladdress = null;
public anywheresoftware.b4a.objects.ButtonWrapper _btnadd = null;
public anywheresoftware.b4a.objects.collections.List _listcity = null;
public anywheresoftware.b4a.objects.collections.List _listcountries = null;
public anywheresoftware.b4a.objects.EditTextWrapper _txtaddress = null;
public anywheresoftware.b4a.objects.ListViewWrapper _lvaddress = null;
public anywheresoftware.b4a.objects.ListViewWrapper _listcountry = null;
public anywheresoftware.b4a.objects.ScrollViewWrapper _svorder = null;
public anywheresoftware.b4a.objects.LabelWrapper _lblid = null;
public anywheresoftware.b4a.objects.LabelWrapper _lblstate2 = null;
public anywheresoftware.b4a.objects.ButtonWrapper _btndetails = null;
public anywheresoftware.b4a.objects.PanelWrapper _pnlorder = null;
public anywheresoftware.b4a.objects.ButtonWrapper _btnadd_address = null;
public anywheresoftware.b4a.objects.PanelWrapper _pnlnew_address = null;
public anywheresoftware.b4a.objects.ButtonWrapper _btncancel_new_address = null;
public anywheresoftware.b4a.objects.LabelWrapper _lblpostal_enter = null;
public anywheresoftware.b4a.objects.EditTextWrapper _txtpostal_enter = null;
public anywheresoftware.b4a.objects.collections.Map _listaddresscache = null;
public static int _choosenaddress4edit = 0;
public anywheresoftware.b4a.objects.LabelWrapper _lbldefault = null;
public anywheresoftware.b4a.objects.collections.List _listaddressid = null;
public static String _choosencity = "";
public anywheresoftware.b4a.objects.PanelWrapper _pnlmenu = null;
public com.apps.demo.mytoastmessageshow _toast = null;
public anywheresoftware.b4a.objects.PanelWrapper _pnlloading = null;
public anywheresoftware.b4a.objects.LabelWrapper _lblpb = null;
public anywheresoftware.b4a.objects.PanelWrapper _pnlmain = null;
public static String _subscribestate = "";
public anywheresoftware.b4a.objects.LabelWrapper _lblreturn_title = null;
public anywheresoftware.b4a.objects.LabelWrapper _lblreturn_state = null;
public anywheresoftware.b4a.objects.ButtonWrapper _btnreturn_details = null;
public anywheresoftware.b4a.objects.LabelWrapper _lblprofile = null;
public anywheresoftware.b4a.objects.LabelWrapper _lblorders = null;
public anywheresoftware.b4a.objects.LabelWrapper _lblnewaddress1 = null;
public anywheresoftware.b4a.objects.LabelWrapper _lblnewsletter = null;
public anywheresoftware.b4a.objects.LabelWrapper _lblreturns = null;
public anywheresoftware.b4a.objects.ButtonWrapper _btnprofile = null;
public anywheresoftware.b4a.objects.ButtonWrapper _btnpasswords = null;
public anywheresoftware.b4a.objects.ButtonWrapper _btnorders = null;
public anywheresoftware.b4a.objects.ButtonWrapper _btnaddress = null;
public anywheresoftware.b4a.objects.ButtonWrapper _btnscribe = null;
public anywheresoftware.b4a.objects.ButtonWrapper _btnreturns = null;
public anywheresoftware.b4a.objects.LabelWrapper _lblnewaddress = null;
public anywheresoftware.b4a.objects.LabelWrapper _lblpasswords = null;
public anywheresoftware.b4a.objects.LabelWrapper _lbladdress1 = null;
public anywheresoftware.b4a.objects.LabelWrapper _lblnewsletteroption = null;
public anywheresoftware.b4a.objects.CompoundButtonWrapper.RadioButtonWrapper _rbyes = null;
public anywheresoftware.b4a.objects.CompoundButtonWrapper.RadioButtonWrapper _rbno = null;
public anywheresoftware.b4a.objects.ButtonWrapper _btnapply_newsletter = null;
public anywheresoftware.b4a.objects.PanelWrapper _pnlaction = null;
public anywheresoftware.b4a.objects.LabelWrapper _lbldefault_address = null;
public anywheresoftware.b4a.objects.LabelWrapper _lbledit_address = null;
public anywheresoftware.b4a.objects.LabelWrapper _lbldelete_address = null;
public static String _choosenaddressid = "";
public static String _choosenaddressvalue = "";
public anywheresoftware.b4a.objects.ButtonWrapper _btnback_menu = null;
public anywheresoftware.b4a.objects.LabelWrapper _lblback_menu = null;
public anywheresoftware.b4a.objects.LabelWrapper _lblpassword_title = null;
public anywheresoftware.b4a.objects.EditTextWrapper _txtpassword2 = null;
public anywheresoftware.b4a.objects.LabelWrapper _lblpassword2 = null;
public anywheresoftware.b4a.objects.LabelWrapper _lbldivider_return = null;
public anywheresoftware.b4a.objects.PanelWrapper _pnldetails_return = null;
public anywheresoftware.b4a.objects.ScrollViewWrapper _sv_return_details = null;
public anywheresoftware.b4a.objects.ButtonWrapper _btncancel_return = null;
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
anywheresoftware.b4a.objects.PanelWrapper _porder = null;
anywheresoftware.b4a.objects.ScrollViewWrapper _sv3 = null;
anywheresoftware.b4a.objects.PanelWrapper _svpassword = null;
anywheresoftware.b4a.objects.PanelWrapper _preturns = null;
anywheresoftware.b4a.objects.PanelWrapper _svnewsletter = null;
anywheresoftware.b4a.objects.ConcreteViewWrapper _v1 = null;
anywheresoftware.b4a.objects.EditTextWrapper _t1 = null;
anywheresoftware.b4a.objects.LabelWrapper _l1 = null;
com.apps.demo.opencart _op1 = null;
com.apps.demo.opencart _opcountry = null;
 //BA.debugLineNum = 104;BA.debugLine="Sub Activity_Create(FirstTime As Boolean)";
 //BA.debugLineNum = 106;BA.debugLine="Activity.LoadLayout(\"frmaccounts\")";
mostCurrent._activity.LoadLayout("frmaccounts",mostCurrent.activityBA);
 //BA.debugLineNum = 107;BA.debugLine="pnlmenu.Color = Library.Theme_Header";
mostCurrent._pnlmenu.setColor(mostCurrent._library._theme_header);
 //BA.debugLineNum = 108;BA.debugLine="Activity.Color = Library.Theme_Header";
mostCurrent._activity.setColor(mostCurrent._library._theme_header);
 //BA.debugLineNum = 110;BA.debugLine="Library.setLocalApp(Library.currLang)";
mostCurrent._library._setlocalapp(mostCurrent.activityBA,mostCurrent._library._currlang);
 //BA.debugLineNum = 112;BA.debugLine="Library.ChangeStatusColor";
mostCurrent._library._changestatuscolor(mostCurrent.activityBA);
 //BA.debugLineNum = 114;BA.debugLine="toast.Initialize(Activity)";
mostCurrent._toast._initialize(mostCurrent.activityBA,(anywheresoftware.b4a.objects.PanelWrapper) anywheresoftware.b4a.AbsObjectWrapper.ConvertToWrapper(new anywheresoftware.b4a.objects.PanelWrapper(), (android.view.ViewGroup)(mostCurrent._activity.getObject())));
 //BA.debugLineNum = 115;BA.debugLine="tmrOpenMenu.Initialize(\"tmrOpenMenu\",250)";
_tmropenmenu.Initialize(processBA,"tmrOpenMenu",(long) (250));
 //BA.debugLineNum = 117;BA.debugLine="lblpb.Text = Library.GetStringResourse(\"loading\")";
mostCurrent._lblpb.setText(BA.ObjectToCharSequence(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"loading")));
 //BA.debugLineNum = 118;BA.debugLine="btncancel_return.Background = Library.GetButtonSt";
mostCurrent._btncancel_return.setBackground((android.graphics.drawable.Drawable)(mostCurrent._library._getbuttonstate(mostCurrent.activityBA).getObject()));
 //BA.debugLineNum = 119;BA.debugLine="btncancel_return.Text = Library.GetStringResourse";
mostCurrent._btncancel_return.setText(BA.ObjectToCharSequence(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"cancel")));
 //BA.debugLineNum = 120;BA.debugLine="pnlloading.Visible = True";
mostCurrent._pnlloading.setVisible(anywheresoftware.b4a.keywords.Common.True);
 //BA.debugLineNum = 123;BA.debugLine="sv1.Initialize(0)";
mostCurrent._sv1.Initialize(mostCurrent.activityBA,(int) (0));
 //BA.debugLineNum = 124;BA.debugLine="tab1.AddTab2(Library.GetStringResourse(\"details_u";
mostCurrent._tab1.AddTab2(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"details_user"),(android.view.View)(mostCurrent._sv1.getObject()));
 //BA.debugLineNum = 125;BA.debugLine="sv1.Panel.LoadLayout(\"frmaccount_details\")";
mostCurrent._sv1.getPanel().LoadLayout("frmaccount_details",mostCurrent.activityBA);
 //BA.debugLineNum = 126;BA.debugLine="sv1.Panel.Height = btnsave.Top + btnsave.Height +";
mostCurrent._sv1.getPanel().setHeight((int) (mostCurrent._btnsave.getTop()+mostCurrent._btnsave.getHeight()+480));
 //BA.debugLineNum = 127;BA.debugLine="sv1.Height = tab1.Height";
mostCurrent._sv1.setHeight(mostCurrent._tab1.getHeight());
 //BA.debugLineNum = 128;BA.debugLine="sv1.Width = pnlmain.Width";
mostCurrent._sv1.setWidth(mostCurrent._pnlmain.getWidth());
 //BA.debugLineNum = 129;BA.debugLine="sv1.Panel.Width = tab1.Width-24dip";
mostCurrent._sv1.getPanel().setWidth((int) (mostCurrent._tab1.getWidth()-anywheresoftware.b4a.keywords.Common.DipToCurrent((int) (24))));
 //BA.debugLineNum = 133;BA.debugLine="Dim porder As Panel";
_porder = new anywheresoftware.b4a.objects.PanelWrapper();
 //BA.debugLineNum = 134;BA.debugLine="porder.Initialize(\"\")";
_porder.Initialize(mostCurrent.activityBA,"");
 //BA.debugLineNum = 135;BA.debugLine="svOrder.Initialize2(0,\"\")";
mostCurrent._svorder.Initialize2(mostCurrent.activityBA,(int) (0),"");
 //BA.debugLineNum = 136;BA.debugLine="tab1.AddTab2(Library.GetStringResourse(\"order_tit";
mostCurrent._tab1.AddTab2(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"order_title"),(android.view.View)(_porder.getObject()));
 //BA.debugLineNum = 137;BA.debugLine="porder.AddView(svOrder,0,0,Activity.Width-pnlmenu";
_porder.AddView((android.view.View)(mostCurrent._svorder.getObject()),(int) (0),(int) (0),(int) (mostCurrent._activity.getWidth()-mostCurrent._pnlmenu.getWidth()),mostCurrent._tab1.getHeight());
 //BA.debugLineNum = 138;BA.debugLine="svOrder.Panel.Color = Colors.RGB(247, 244, 244)";
mostCurrent._svorder.getPanel().setColor(anywheresoftware.b4a.keywords.Common.Colors.RGB((int) (247),(int) (244),(int) (244)));
 //BA.debugLineNum = 139;BA.debugLine="svOrder.Color = Colors.White";
mostCurrent._svorder.setColor(anywheresoftware.b4a.keywords.Common.Colors.White);
 //BA.debugLineNum = 140;BA.debugLine="porder.Color = Colors.RGB(247, 244, 244)";
_porder.setColor(anywheresoftware.b4a.keywords.Common.Colors.RGB((int) (247),(int) (244),(int) (244)));
 //BA.debugLineNum = 144;BA.debugLine="pnlnew_address.LoadLayout(\"frmaccount_add_address";
mostCurrent._pnlnew_address.LoadLayout("frmaccount_add_address",mostCurrent.activityBA);
 //BA.debugLineNum = 145;BA.debugLine="txtcountry.DropdownBackgroundColor = Colors.White";
mostCurrent._txtcountry.setDropdownBackgroundColor(anywheresoftware.b4a.keywords.Common.Colors.White);
 //BA.debugLineNum = 146;BA.debugLine="txtcity.DropdownBackgroundColor = Colors.White";
mostCurrent._txtcity.setDropdownBackgroundColor(anywheresoftware.b4a.keywords.Common.Colors.White);
 //BA.debugLineNum = 147;BA.debugLine="txtaddress.Color = Colors.RGB(250,250,250)";
mostCurrent._txtaddress.setColor(anywheresoftware.b4a.keywords.Common.Colors.RGB((int) (250),(int) (250),(int) (250)));
 //BA.debugLineNum = 148;BA.debugLine="txtpostal_enter.Color = Colors.RGB(250,250,250)";
mostCurrent._txtpostal_enter.setColor(anywheresoftware.b4a.keywords.Common.Colors.RGB((int) (250),(int) (250),(int) (250)));
 //BA.debugLineNum = 149;BA.debugLine="txtaddress.InputType = txtaddress.INPUT_TYPE_TEXT";
mostCurrent._txtaddress.setInputType(mostCurrent._txtaddress.INPUT_TYPE_TEXT);
 //BA.debugLineNum = 150;BA.debugLine="lblcountry.Text = Library.GetStringResourse(\"coun";
mostCurrent._lblcountry.setText(BA.ObjectToCharSequence(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"country")));
 //BA.debugLineNum = 151;BA.debugLine="lblcity.Text =  Library.GetStringResourse(\"city\")";
mostCurrent._lblcity.setText(BA.ObjectToCharSequence(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"city")));
 //BA.debugLineNum = 152;BA.debugLine="lbladdress.Text =  Library.GetStringResourse(\"add";
mostCurrent._lbladdress.setText(BA.ObjectToCharSequence(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"address1")));
 //BA.debugLineNum = 153;BA.debugLine="btnadd.Text = Library.GetStringResourse(\"new_addr";
mostCurrent._btnadd.setText(BA.ObjectToCharSequence(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"new_address")));
 //BA.debugLineNum = 154;BA.debugLine="btncancel_new_address.Text = Library.GetStringRes";
mostCurrent._btncancel_new_address.setText(BA.ObjectToCharSequence(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"cancel")));
 //BA.debugLineNum = 155;BA.debugLine="lblpostal_enter.Text = Library.GetStringResourse(";
mostCurrent._lblpostal_enter.setText(BA.ObjectToCharSequence(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"postal")));
 //BA.debugLineNum = 159;BA.debugLine="Dim sv3 As ScrollView";
_sv3 = new anywheresoftware.b4a.objects.ScrollViewWrapper();
 //BA.debugLineNum = 160;BA.debugLine="sv3.Initialize(0)";
_sv3.Initialize(mostCurrent.activityBA,(int) (0));
 //BA.debugLineNum = 161;BA.debugLine="tab1.AddTab(Library.GetStringResourse(\"my_address";
mostCurrent._tab1.AddTab(mostCurrent.activityBA,mostCurrent._library._getstringresourse(mostCurrent.activityBA,"my_address"),"frmaccount_address");
 //BA.debugLineNum = 162;BA.debugLine="lvAddress.SingleLineLayout.Label.Left = 0";
mostCurrent._lvaddress.getSingleLineLayout().Label.setLeft((int) (0));
 //BA.debugLineNum = 163;BA.debugLine="lvAddress.SingleLineLayout.Label.Width = 68%x";
mostCurrent._lvaddress.getSingleLineLayout().Label.setWidth(anywheresoftware.b4a.keywords.Common.PerXToCurrent((float) (68),mostCurrent.activityBA));
 //BA.debugLineNum = 164;BA.debugLine="lvAddress.SingleLineLayout.Label.TextColor = Colo";
mostCurrent._lvaddress.getSingleLineLayout().Label.setTextColor(anywheresoftware.b4a.keywords.Common.Colors.Black);
 //BA.debugLineNum = 165;BA.debugLine="lvAddress.SingleLineLayout.Label.Gravity = Bit.Or";
mostCurrent._lvaddress.getSingleLineLayout().Label.setGravity(anywheresoftware.b4a.keywords.Common.Bit.Or(anywheresoftware.b4a.keywords.Common.Gravity.RIGHT,anywheresoftware.b4a.keywords.Common.Gravity.CENTER));
 //BA.debugLineNum = 166;BA.debugLine="lvAddress.SingleLineLayout.Label.TextSize = 14";
mostCurrent._lvaddress.getSingleLineLayout().Label.setTextSize((float) (14));
 //BA.debugLineNum = 167;BA.debugLine="lvAddress.SingleLineLayout.Label.Typeface = Libra";
mostCurrent._lvaddress.getSingleLineLayout().Label.setTypeface((android.graphics.Typeface)(mostCurrent._library._getfont(mostCurrent.activityBA).getObject()));
 //BA.debugLineNum = 168;BA.debugLine="lvAddress.SingleLineLayout.ItemHeight = 100";
mostCurrent._lvaddress.getSingleLineLayout().setItemHeight((int) (100));
 //BA.debugLineNum = 169;BA.debugLine="Library.SetDivider(lvAddress,Library.Theme_Header";
mostCurrent._library._setdivider(mostCurrent.activityBA,mostCurrent._lvaddress,mostCurrent._library._theme_header,(int) (1));
 //BA.debugLineNum = 170;BA.debugLine="lvAddress.Color = Colors.Transparent";
mostCurrent._lvaddress.setColor(anywheresoftware.b4a.keywords.Common.Colors.Transparent);
 //BA.debugLineNum = 171;BA.debugLine="Library.GetParent(lvAddress).Color = Colors.Trans";
mostCurrent._library._getparent(mostCurrent.activityBA,(anywheresoftware.b4a.objects.ConcreteViewWrapper) anywheresoftware.b4a.AbsObjectWrapper.ConvertToWrapper(new anywheresoftware.b4a.objects.ConcreteViewWrapper(), (android.view.View)(mostCurrent._lvaddress.getObject()))).setColor(anywheresoftware.b4a.keywords.Common.Colors.Transparent);
 //BA.debugLineNum = 172;BA.debugLine="lbldefault.Text = Library.GetStringResourse(\"choo";
mostCurrent._lbldefault.setText(BA.ObjectToCharSequence(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"choose_address")));
 //BA.debugLineNum = 173;BA.debugLine="lbldefault.Gravity = Library.GetStringResourse(\"d";
mostCurrent._lbldefault.setGravity((int)(Double.parseDouble(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"direction"))));
 //BA.debugLineNum = 177;BA.debugLine="Dim svpassword As Panel";
_svpassword = new anywheresoftware.b4a.objects.PanelWrapper();
 //BA.debugLineNum = 178;BA.debugLine="svpassword.Initialize(\"\")";
_svpassword.Initialize(mostCurrent.activityBA,"");
 //BA.debugLineNum = 179;BA.debugLine="tab1.AddTab(Library.GetStringResourse(\"lblpasswor";
mostCurrent._tab1.AddTab(mostCurrent.activityBA,mostCurrent._library._getstringresourse(mostCurrent.activityBA,"lblpassword"),"frmaccount_password");
 //BA.debugLineNum = 180;BA.debugLine="lblpassword.Gravity = Library.GetStringResourse(\"";
mostCurrent._lblpassword.setGravity((int)(Double.parseDouble(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"direction"))));
 //BA.debugLineNum = 181;BA.debugLine="lblpassword2.Gravity = Library.GetStringResourse(";
mostCurrent._lblpassword2.setGravity((int)(Double.parseDouble(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"direction"))));
 //BA.debugLineNum = 182;BA.debugLine="lblpassword_title.Gravity = Library.GetStringReso";
mostCurrent._lblpassword_title.setGravity((int)(Double.parseDouble(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"direction"))));
 //BA.debugLineNum = 183;BA.debugLine="lblpassword.Text = Library.GetStringResourse(\"lbl";
mostCurrent._lblpassword.setText(BA.ObjectToCharSequence(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"lblpassword")));
 //BA.debugLineNum = 184;BA.debugLine="lblpassword2.Text = Library.GetStringResourse(\"lb";
mostCurrent._lblpassword2.setText(BA.ObjectToCharSequence(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"lblpassword2")));
 //BA.debugLineNum = 185;BA.debugLine="lblpassword_title.Text = Library.GetStringResours";
mostCurrent._lblpassword_title.setText(BA.ObjectToCharSequence(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"password_title")));
 //BA.debugLineNum = 186;BA.debugLine="btnpassword.Text = Library.GetStringResourse(\"sav";
mostCurrent._btnpassword.setText(BA.ObjectToCharSequence(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"save_password")));
 //BA.debugLineNum = 187;BA.debugLine="btnpassword.Background = Library.GetButtonState";
mostCurrent._btnpassword.setBackground((android.graphics.drawable.Drawable)(mostCurrent._library._getbuttonstate(mostCurrent.activityBA).getObject()));
 //BA.debugLineNum = 188;BA.debugLine="txtpassword.Gravity = Gravity.LEFT";
mostCurrent._txtpassword.setGravity(anywheresoftware.b4a.keywords.Common.Gravity.LEFT);
 //BA.debugLineNum = 189;BA.debugLine="txtpassword.PasswordMode = True";
mostCurrent._txtpassword.setPasswordMode(anywheresoftware.b4a.keywords.Common.True);
 //BA.debugLineNum = 190;BA.debugLine="txtpassword.Color = Colors.RGB(250,250,250)";
mostCurrent._txtpassword.setColor(anywheresoftware.b4a.keywords.Common.Colors.RGB((int) (250),(int) (250),(int) (250)));
 //BA.debugLineNum = 191;BA.debugLine="txtpassword2.Color = Colors.RGB(250,250,250)";
mostCurrent._txtpassword2.setColor(anywheresoftware.b4a.keywords.Common.Colors.RGB((int) (250),(int) (250),(int) (250)));
 //BA.debugLineNum = 192;BA.debugLine="Library.LabelSpace(lblpassword_title,1.3)";
mostCurrent._library._labelspace(mostCurrent.activityBA,(anywheresoftware.b4a.objects.ConcreteViewWrapper) anywheresoftware.b4a.AbsObjectWrapper.ConvertToWrapper(new anywheresoftware.b4a.objects.ConcreteViewWrapper(), (android.view.View)(mostCurrent._lblpassword_title.getObject())),(float) (1.3));
 //BA.debugLineNum = 196;BA.debugLine="Dim preturns As Panel";
_preturns = new anywheresoftware.b4a.objects.PanelWrapper();
 //BA.debugLineNum = 197;BA.debugLine="preturns.Initialize(\"\")";
_preturns.Initialize(mostCurrent.activityBA,"");
 //BA.debugLineNum = 198;BA.debugLine="svReturns.Initialize2(0,\"\")";
mostCurrent._svreturns.Initialize2(mostCurrent.activityBA,(int) (0),"");
 //BA.debugLineNum = 199;BA.debugLine="tab1.AddTab2(Library.GetStringResourse(\"order_tit";
mostCurrent._tab1.AddTab2(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"order_title"),(android.view.View)(_preturns.getObject()));
 //BA.debugLineNum = 200;BA.debugLine="preturns.AddView(svReturns,0,0,Activity.Width-pnl";
_preturns.AddView((android.view.View)(mostCurrent._svreturns.getObject()),(int) (0),(int) (0),(int) (mostCurrent._activity.getWidth()-mostCurrent._pnlmenu.getWidth()),mostCurrent._tab1.getHeight());
 //BA.debugLineNum = 201;BA.debugLine="svReturns.Panel.Color = Colors.RGB(247, 244, 244)";
mostCurrent._svreturns.getPanel().setColor(anywheresoftware.b4a.keywords.Common.Colors.RGB((int) (247),(int) (244),(int) (244)));
 //BA.debugLineNum = 202;BA.debugLine="preturns.Color = Colors.RGB(247, 244, 244)";
_preturns.setColor(anywheresoftware.b4a.keywords.Common.Colors.RGB((int) (247),(int) (244),(int) (244)));
 //BA.debugLineNum = 203;BA.debugLine="svReturns.Color = Colors.White";
mostCurrent._svreturns.setColor(anywheresoftware.b4a.keywords.Common.Colors.White);
 //BA.debugLineNum = 207;BA.debugLine="Dim svNewsletter As Panel";
_svnewsletter = new anywheresoftware.b4a.objects.PanelWrapper();
 //BA.debugLineNum = 208;BA.debugLine="svNewsletter.Initialize(\"\")";
_svnewsletter.Initialize(mostCurrent.activityBA,"");
 //BA.debugLineNum = 209;BA.debugLine="tab1.AddTab(Library.GetStringResourse(\"lblpasswor";
mostCurrent._tab1.AddTab(mostCurrent.activityBA,mostCurrent._library._getstringresourse(mostCurrent.activityBA,"lblpassword"),"frmaccount_newsletter");
 //BA.debugLineNum = 210;BA.debugLine="lblnewsletteroption.Gravity = Library.GetStringRe";
mostCurrent._lblnewsletteroption.setGravity((int)(Double.parseDouble(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"direction"))));
 //BA.debugLineNum = 211;BA.debugLine="lblnewsletteroption.Typeface = Library.GetFont";
mostCurrent._lblnewsletteroption.setTypeface((android.graphics.Typeface)(mostCurrent._library._getfont(mostCurrent.activityBA).getObject()));
 //BA.debugLineNum = 212;BA.debugLine="rbno.Typeface = Library.GetFont";
mostCurrent._rbno.setTypeface((android.graphics.Typeface)(mostCurrent._library._getfont(mostCurrent.activityBA).getObject()));
 //BA.debugLineNum = 213;BA.debugLine="rbyes.Typeface = Library.GetFont";
mostCurrent._rbyes.setTypeface((android.graphics.Typeface)(mostCurrent._library._getfont(mostCurrent.activityBA).getObject()));
 //BA.debugLineNum = 214;BA.debugLine="btnapply_newsletter.Text = Library.GetStringResou";
mostCurrent._btnapply_newsletter.setText(BA.ObjectToCharSequence(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"scribe_change_state")));
 //BA.debugLineNum = 215;BA.debugLine="btnapply_newsletter.Background = Library.GetButto";
mostCurrent._btnapply_newsletter.setBackground((android.graphics.drawable.Drawable)(mostCurrent._library._getbuttonstate(mostCurrent.activityBA).getObject()));
 //BA.debugLineNum = 216;BA.debugLine="rbyes.Text = Library.GetStringResourse(\"subscribe";
mostCurrent._rbyes.setText(BA.ObjectToCharSequence(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"subscribe")));
 //BA.debugLineNum = 217;BA.debugLine="rbno.Text = Library.GetStringResourse(\"unsubscrib";
mostCurrent._rbno.setText(BA.ObjectToCharSequence(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"unsubscribe")));
 //BA.debugLineNum = 220;BA.debugLine="lblname.Text = Library.GetStringResourse(\"lblname";
mostCurrent._lblname.setText(BA.ObjectToCharSequence(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"lblname")));
 //BA.debugLineNum = 221;BA.debugLine="lblfamily.Text = Library.GetStringResourse(\"lblfa";
mostCurrent._lblfamily.setText(BA.ObjectToCharSequence(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"lblfamily")));
 //BA.debugLineNum = 222;BA.debugLine="lblemail.Text = Library.GetStringResourse(\"lblema";
mostCurrent._lblemail.setText(BA.ObjectToCharSequence(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"lblemail")));
 //BA.debugLineNum = 223;BA.debugLine="lblfax.Text = Library.GetStringResourse(\"lblfax\")";
mostCurrent._lblfax.setText(BA.ObjectToCharSequence(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"lblfax")));
 //BA.debugLineNum = 224;BA.debugLine="lblphone.Text = Library.GetStringResourse(\"lblpho";
mostCurrent._lblphone.setText(BA.ObjectToCharSequence(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"lblphone")));
 //BA.debugLineNum = 225;BA.debugLine="btnsave.Text = Library.GetStringResourse(\"save_de";
mostCurrent._btnsave.setText(BA.ObjectToCharSequence(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"save_details")));
 //BA.debugLineNum = 226;BA.debugLine="btnsave.Background = Library.GetButtonState";
mostCurrent._btnsave.setBackground((android.graphics.drawable.Drawable)(mostCurrent._library._getbuttonstate(mostCurrent.activityBA).getObject()));
 //BA.debugLineNum = 227;BA.debugLine="lblcountry.Gravity = Library.GetStringResourse(\"d";
mostCurrent._lblcountry.setGravity((int)(Double.parseDouble(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"direction"))));
 //BA.debugLineNum = 228;BA.debugLine="lblcity.Gravity = Library.GetStringResourse(\"dire";
mostCurrent._lblcity.setGravity((int)(Double.parseDouble(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"direction"))));
 //BA.debugLineNum = 229;BA.debugLine="lbladdress.Gravity = Library.GetStringResourse(\"d";
mostCurrent._lbladdress.setGravity((int)(Double.parseDouble(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"direction"))));
 //BA.debugLineNum = 230;BA.debugLine="lblpostal_enter.Gravity = Library.GetStringResour";
mostCurrent._lblpostal_enter.setGravity((int)(Double.parseDouble(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"direction"))));
 //BA.debugLineNum = 232;BA.debugLine="lblprofile.Text = Library.GetStringResourse(\"retu";
mostCurrent._lblprofile.setText(BA.ObjectToCharSequence(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"return_menu_profile")));
 //BA.debugLineNum = 233;BA.debugLine="lblpasswords.Text = Library.GetStringResourse(\"re";
mostCurrent._lblpasswords.setText(BA.ObjectToCharSequence(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"return_menu_pass")));
 //BA.debugLineNum = 234;BA.debugLine="lblorders.Text = Library.GetStringResourse(\"retur";
mostCurrent._lblorders.setText(BA.ObjectToCharSequence(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"return_menu_orders")));
 //BA.debugLineNum = 235;BA.debugLine="lbladdress1.Text = Library.GetStringResourse(\"ret";
mostCurrent._lbladdress1.setText(BA.ObjectToCharSequence(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"return_menu_address")));
 //BA.debugLineNum = 236;BA.debugLine="lblnewaddress1.Text = Library.GetStringResourse(\"";
mostCurrent._lblnewaddress1.setText(BA.ObjectToCharSequence(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"return_menu_new_address")));
 //BA.debugLineNum = 237;BA.debugLine="lblnewsletter.Text = Library.GetStringResourse(\"r";
mostCurrent._lblnewsletter.setText(BA.ObjectToCharSequence(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"return_menu_news")));
 //BA.debugLineNum = 238;BA.debugLine="lblreturns.Text = Library.GetStringResourse(\"retu";
mostCurrent._lblreturns.setText(BA.ObjectToCharSequence(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"return_menu_returns")));
 //BA.debugLineNum = 239;BA.debugLine="lbldelete_address.Text = Library.GetStringResours";
mostCurrent._lbldelete_address.setText(BA.ObjectToCharSequence(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"delete_address")));
 //BA.debugLineNum = 240;BA.debugLine="lbldefault_address.Text = Library.GetStringResour";
mostCurrent._lbldefault_address.setText(BA.ObjectToCharSequence(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"default_address")));
 //BA.debugLineNum = 241;BA.debugLine="lbledit_address.Text = Library.GetStringResourse(";
mostCurrent._lbledit_address.setText(BA.ObjectToCharSequence(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"edit")));
 //BA.debugLineNum = 242;BA.debugLine="lblback_menu.Text = Library.GetStringResourse(\"ba";
mostCurrent._lblback_menu.setText(BA.ObjectToCharSequence(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"back")));
 //BA.debugLineNum = 244;BA.debugLine="For Each v1 As View In sv1.Panel.GetAllViewsRecur";
_v1 = new anywheresoftware.b4a.objects.ConcreteViewWrapper();
final anywheresoftware.b4a.BA.IterableList group111 = mostCurrent._sv1.getPanel().GetAllViewsRecursive();
final int groupLen111 = group111.getSize();
for (int index111 = 0;index111 < groupLen111 ;index111++){
_v1.setObject((android.view.View)(group111.Get(index111)));
 //BA.debugLineNum = 246;BA.debugLine="If v1 Is Button Then Continue";
if (_v1.getObjectOrNull() instanceof android.widget.Button) { 
if (true) continue;};
 //BA.debugLineNum = 248;BA.debugLine="If v1 Is EditText Then";
if (_v1.getObjectOrNull() instanceof android.widget.EditText) { 
 //BA.debugLineNum = 249;BA.debugLine="Dim t1 As EditText";
_t1 = new anywheresoftware.b4a.objects.EditTextWrapper();
 //BA.debugLineNum = 250;BA.debugLine="t1 = v1";
_t1.setObject((android.widget.EditText)(_v1.getObject()));
 //BA.debugLineNum = 251;BA.debugLine="t1.Color = Library.ConvertHex2Int(Library.GetSt";
_t1.setColor((int)(Double.parseDouble(mostCurrent._library._converthex2int(mostCurrent.activityBA,mostCurrent._library._getstringresourse(mostCurrent.activityBA,"textbox_color")))));
 //BA.debugLineNum = 252;BA.debugLine="t1.Gravity = Library.GetStringResourse(\"directi";
_t1.setGravity((int)(Double.parseDouble(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"direction"))));
 };
 //BA.debugLineNum = 255;BA.debugLine="If v1 Is Label Then";
if (_v1.getObjectOrNull() instanceof android.widget.TextView) { 
 //BA.debugLineNum = 256;BA.debugLine="Dim l1 As Label";
_l1 = new anywheresoftware.b4a.objects.LabelWrapper();
 //BA.debugLineNum = 257;BA.debugLine="l1 = v1";
_l1.setObject((android.widget.TextView)(_v1.getObject()));
 //BA.debugLineNum = 258;BA.debugLine="l1.Gravity = Library.GetStringResourse(\"directi";
_l1.setGravity((int)(Double.parseDouble(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"direction"))));
 };
 }
;
 //BA.debugLineNum = 263;BA.debugLine="pnlloading.Visible = True";
mostCurrent._pnlloading.setVisible(anywheresoftware.b4a.keywords.Common.True);
 //BA.debugLineNum = 265;BA.debugLine="Dim op1 As OpenCart";
_op1 = new com.apps.demo.opencart();
 //BA.debugLineNum = 266;BA.debugLine="op1.Initialize";
_op1._initialize(processBA);
 //BA.debugLineNum = 267;BA.debugLine="op1.UserDetails(Me,\"getDetails_receive\")";
_op1._userdetails(actaccount.getObject(),"getDetails_receive");
 //BA.debugLineNum = 269;BA.debugLine="Dim opCountry As OpenCart";
_opcountry = new com.apps.demo.opencart();
 //BA.debugLineNum = 270;BA.debugLine="opCountry.Initialize";
_opcountry._initialize(processBA);
 //BA.debugLineNum = 271;BA.debugLine="opCountry.GetCountry(Me,\"country_receive\")";
_opcountry._getcountry(actaccount.getObject(),"country_receive");
 //BA.debugLineNum = 273;BA.debugLine="If Library.IsPersian Then";
if (mostCurrent._library._ispersian(mostCurrent.activityBA)) { 
 //BA.debugLineNum = 274;BA.debugLine="pnlmain.Left = 0";
mostCurrent._pnlmain.setLeft((int) (0));
 //BA.debugLineNum = 275;BA.debugLine="pnlmenu.Left = Activity.Width + pnlmain.Width";
mostCurrent._pnlmenu.setLeft((int) (mostCurrent._activity.getWidth()+mostCurrent._pnlmain.getWidth()));
 //BA.debugLineNum = 276;BA.debugLine="pnlnew_address.Left = 0";
mostCurrent._pnlnew_address.setLeft((int) (0));
 //BA.debugLineNum = 277;BA.debugLine="tab1.Left = 0";
mostCurrent._tab1.setLeft((int) (0));
 };
 //BA.debugLineNum = 280;BA.debugLine="End Sub";
return "";
}
public static boolean  _activity_keypress(int _keycode) throws Exception{
 //BA.debugLineNum = 544;BA.debugLine="Sub Activity_KeyPress (KeyCode As Int) As Boolean";
 //BA.debugLineNum = 546;BA.debugLine="If KeyCode = KeyCodes.KEYCODE_BACK Then";
if (_keycode==anywheresoftware.b4a.keywords.Common.KeyCodes.KEYCODE_BACK) { 
 //BA.debugLineNum = 547;BA.debugLine="If pnldetails_return.Visible = True Then";
if (mostCurrent._pnldetails_return.getVisible()==anywheresoftware.b4a.keywords.Common.True) { 
 //BA.debugLineNum = 548;BA.debugLine="pnldetails_return.SetVisibleAnimated(500,False)";
mostCurrent._pnldetails_return.SetVisibleAnimated((int) (500),anywheresoftware.b4a.keywords.Common.False);
 //BA.debugLineNum = 549;BA.debugLine="Return True";
if (true) return anywheresoftware.b4a.keywords.Common.True;
 };
 };
 //BA.debugLineNum = 553;BA.debugLine="End Sub";
return false;
}
public static String  _activity_pause(boolean _userclosed) throws Exception{
 //BA.debugLineNum = 534;BA.debugLine="Sub Activity_Pause (UserClosed As Boolean)";
 //BA.debugLineNum = 536;BA.debugLine="Library.AnimationFromLeft2Right";
mostCurrent._library._animationfromleft2right(mostCurrent.activityBA);
 //BA.debugLineNum = 538;BA.debugLine="If UserClosed = True Then";
if (_userclosed==anywheresoftware.b4a.keywords.Common.True) { 
 //BA.debugLineNum = 539;BA.debugLine="Activity.Finish";
mostCurrent._activity.Finish();
 };
 //BA.debugLineNum = 542;BA.debugLine="End Sub";
return "";
}
public static String  _activity_resume() throws Exception{
 //BA.debugLineNum = 530;BA.debugLine="Sub Activity_Resume";
 //BA.debugLineNum = 532;BA.debugLine="End Sub";
return "";
}
public static String  _addaddress_receive(anywheresoftware.b4a.objects.collections.Map _res,String _cat) throws Exception{
com.apps.demo.opencart _opaddress = null;
 //BA.debugLineNum = 717;BA.debugLine="Sub addAddress_receive(res As  Map,cat As String)";
 //BA.debugLineNum = 719;BA.debugLine="ProgressDialogHide";
anywheresoftware.b4a.keywords.Common.ProgressDialogHide();
 //BA.debugLineNum = 721;BA.debugLine="pnlloading.SetVisibleAnimated(500,False)";
mostCurrent._pnlloading.SetVisibleAnimated((int) (500),anywheresoftware.b4a.keywords.Common.False);
 //BA.debugLineNum = 722;BA.debugLine="pnlnew_address.SetVisibleAnimated(500,False)";
mostCurrent._pnlnew_address.SetVisibleAnimated((int) (500),anywheresoftware.b4a.keywords.Common.False);
 //BA.debugLineNum = 724;BA.debugLine="If res.ContainsKey(\"success\") Then";
if (_res.ContainsKey((Object)("success"))) { 
 //BA.debugLineNum = 725;BA.debugLine="If res.Get(\"success\") = True Then";
if ((_res.Get((Object)("success"))).equals((Object)(anywheresoftware.b4a.keywords.Common.True))) { 
 //BA.debugLineNum = 726;BA.debugLine="txtaddress.Text = \"\"";
mostCurrent._txtaddress.setText(BA.ObjectToCharSequence(""));
 //BA.debugLineNum = 727;BA.debugLine="toast.ShowToastMessageShow(Library.GetStringRes";
mostCurrent._toast._showtoastmessageshow(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"success_add_address"),(long) (2),anywheresoftware.b4a.keywords.Common.True);
 //BA.debugLineNum = 728;BA.debugLine="Dim opAddress As OpenCart";
_opaddress = new com.apps.demo.opencart();
 //BA.debugLineNum = 729;BA.debugLine="opAddress.Initialize";
_opaddress._initialize(processBA);
 //BA.debugLineNum = 730;BA.debugLine="opAddress.ListAddressUser(Me,\"ListAddress_recei";
_opaddress._listaddressuser(actaccount.getObject(),"ListAddress_receive");
 //BA.debugLineNum = 731;BA.debugLine="Return";
if (true) return "";
 };
 };
 //BA.debugLineNum = 735;BA.debugLine="End Sub";
return "";
}
public static String  _btnadd_address_click() throws Exception{
 //BA.debugLineNum = 737;BA.debugLine="Sub btnadd_address_Click";
 //BA.debugLineNum = 739;BA.debugLine="DefaultButtonMenuColor";
_defaultbuttonmenucolor();
 //BA.debugLineNum = 740;BA.debugLine="btnadd_address.TextColor = Colors.RGB(244,255,0)";
mostCurrent._btnadd_address.setTextColor(anywheresoftware.b4a.keywords.Common.Colors.RGB((int) (244),(int) (255),(int) (0)));
 //BA.debugLineNum = 741;BA.debugLine="lblnewaddress.TextColor = Colors.RGB(244,255,0)";
mostCurrent._lblnewaddress.setTextColor(anywheresoftware.b4a.keywords.Common.Colors.RGB((int) (244),(int) (255),(int) (0)));
 //BA.debugLineNum = 743;BA.debugLine="btnadd.Text = Library.GetStringResourse(\"new_addr";
mostCurrent._btnadd.setText(BA.ObjectToCharSequence(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"new_address")));
 //BA.debugLineNum = 744;BA.debugLine="btnadd.Background = Library.GetButtonState";
mostCurrent._btnadd.setBackground((android.graphics.drawable.Drawable)(mostCurrent._library._getbuttonstate(mostCurrent.activityBA).getObject()));
 //BA.debugLineNum = 745;BA.debugLine="btncancel_new_address.Background = Library.GetBut";
mostCurrent._btncancel_new_address.setBackground((android.graphics.drawable.Drawable)(mostCurrent._library._getbuttonstate(mostCurrent.activityBA).getObject()));
 //BA.debugLineNum = 746;BA.debugLine="pnlnew_address.SetVisibleAnimated(500,True)";
mostCurrent._pnlnew_address.SetVisibleAnimated((int) (500),anywheresoftware.b4a.keywords.Common.True);
 //BA.debugLineNum = 747;BA.debugLine="btnback_menu_Click";
_btnback_menu_click();
 //BA.debugLineNum = 749;BA.debugLine="End Sub";
return "";
}
public static String  _btnadd_click() throws Exception{
anywheresoftware.b4a.objects.collections.Map _data = null;
int _k = 0;
anywheresoftware.b4a.objects.collections.Map _m2 = null;
com.apps.demo.opencart _op1 = null;
 //BA.debugLineNum = 640;BA.debugLine="Sub btnadd_Click";
 //BA.debugLineNum = 642;BA.debugLine="If txtaddress.Text.Length < 3 Then";
if (mostCurrent._txtaddress.getText().length()<3) { 
 //BA.debugLineNum = 643;BA.debugLine="toast.ShowToastMessageShow(Library.GetStringReso";
mostCurrent._toast._showtoastmessageshow(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"error_address_1"),(long) (2),anywheresoftware.b4a.keywords.Common.False);
 //BA.debugLineNum = 644;BA.debugLine="Return";
if (true) return "";
 };
 //BA.debugLineNum = 647;BA.debugLine="If Library.ValidPostalCode(txtpostal_enter.Text)";
if (mostCurrent._library._validpostalcode(mostCurrent.activityBA,mostCurrent._txtpostal_enter.getText())==anywheresoftware.b4a.keywords.Common.False) { 
 //BA.debugLineNum = 648;BA.debugLine="toast.ShowToastMessageShow(Library.GetStringReso";
mostCurrent._toast._showtoastmessageshow(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"postal").replace(":",""),(long) (2),anywheresoftware.b4a.keywords.Common.False);
 //BA.debugLineNum = 649;BA.debugLine="Return";
if (true) return "";
 };
 //BA.debugLineNum = 652;BA.debugLine="Dim data As Map";
_data = new anywheresoftware.b4a.objects.collections.Map();
 //BA.debugLineNum = 653;BA.debugLine="data.Initialize";
_data.Initialize();
 //BA.debugLineNum = 655;BA.debugLine="If txtcity.SelectedIndex = -1 Then";
if (mostCurrent._txtcity.getSelectedIndex()==-1) { 
 //BA.debugLineNum = 656;BA.debugLine="toast.ShowToastMessageShow(Library.GetStringReso";
mostCurrent._toast._showtoastmessageshow(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"error_city"),(long) (2),anywheresoftware.b4a.keywords.Common.False);
 //BA.debugLineNum = 657;BA.debugLine="Return";
if (true) return "";
 };
 //BA.debugLineNum = 660;BA.debugLine="data.Put(\"city\",txtcity.SelectedItem)";
_data.Put((Object)("city"),(Object)(mostCurrent._txtcity.getSelectedItem()));
 //BA.debugLineNum = 662;BA.debugLine="For k = 0 To listCity.Size - 1";
{
final int step16 = 1;
final int limit16 = (int) (mostCurrent._listcity.getSize()-1);
for (_k = (int) (0) ; (step16 > 0 && _k <= limit16) || (step16 < 0 && _k >= limit16); _k = ((int)(0 + _k + step16)) ) {
 //BA.debugLineNum = 664;BA.debugLine="Dim m2 As Map";
_m2 = new anywheresoftware.b4a.objects.collections.Map();
 //BA.debugLineNum = 665;BA.debugLine="m2 = listCity.Get(k)";
_m2.setObject((anywheresoftware.b4a.objects.collections.Map.MyMap)(mostCurrent._listcity.Get(_k)));
 //BA.debugLineNum = 667;BA.debugLine="If m2.Get(\"name\") = txtcity.SelectedItem Then";
if ((_m2.Get((Object)("name"))).equals((Object)(mostCurrent._txtcity.getSelectedItem()))) { 
 //BA.debugLineNum = 668;BA.debugLine="data.Put(\"zone_id\",m2.Get(\"zone_id\"))";
_data.Put((Object)("zone_id"),_m2.Get((Object)("zone_id")));
 //BA.debugLineNum = 669;BA.debugLine="data.Put(\"country_id\",m2.Get(\"country_id\"))";
_data.Put((Object)("country_id"),_m2.Get((Object)("country_id")));
 //BA.debugLineNum = 670;BA.debugLine="Exit";
if (true) break;
 };
 }
};
 //BA.debugLineNum = 675;BA.debugLine="data.Put(\"firstname\",txtname.Text)";
_data.Put((Object)("firstname"),(Object)(mostCurrent._txtname.getText()));
 //BA.debugLineNum = 676;BA.debugLine="data.Put(\"lastname\",txtfamily.Text)";
_data.Put((Object)("lastname"),(Object)(mostCurrent._txtfamily.getText()));
 //BA.debugLineNum = 677;BA.debugLine="data.Put(\"address_1\",txtaddress.Text)";
_data.Put((Object)("address_1"),(Object)(mostCurrent._txtaddress.getText()));
 //BA.debugLineNum = 678;BA.debugLine="data.Put(\"postcode\",txtpostal_enter.Text)";
_data.Put((Object)("postcode"),(Object)(mostCurrent._txtpostal_enter.getText()));
 //BA.debugLineNum = 680;BA.debugLine="lblpb.Text = Library.GetStringResourse(\"apply\")";
mostCurrent._lblpb.setText(BA.ObjectToCharSequence(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"apply")));
 //BA.debugLineNum = 681;BA.debugLine="pnlloading.SetVisibleAnimated(500,True)";
mostCurrent._pnlloading.SetVisibleAnimated((int) (500),anywheresoftware.b4a.keywords.Common.True);
 //BA.debugLineNum = 683;BA.debugLine="Dim op1 As OpenCart";
_op1 = new com.apps.demo.opencart();
 //BA.debugLineNum = 684;BA.debugLine="op1.Initialize";
_op1._initialize(processBA);
 //BA.debugLineNum = 686;BA.debugLine="If btnadd.Text = Library.GetStringResourse(\"edit\"";
if ((mostCurrent._btnadd.getText()).equals(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"edit"))) { 
 //BA.debugLineNum = 687;BA.debugLine="op1.EditAddressUser(Me,\"editAddress_receive\",dat";
_op1._editaddressuser(actaccount.getObject(),"editAddress_receive",_data,BA.NumberToString(_choosenaddress4edit));
 }else {
 //BA.debugLineNum = 689;BA.debugLine="op1.AddAddressUser(Me,\"addAddress_receive\",data)";
_op1._addaddressuser(actaccount.getObject(),"addAddress_receive",_data);
 };
 //BA.debugLineNum = 692;BA.debugLine="End Sub";
return "";
}
public static String  _btnaddress_click() throws Exception{
com.apps.demo.opencart _opaddress = null;
 //BA.debugLineNum = 851;BA.debugLine="Sub btnaddress_Click";
 //BA.debugLineNum = 853;BA.debugLine="If lvAddress.Size = 0 Then";
if (mostCurrent._lvaddress.getSize()==0) { 
 //BA.debugLineNum = 854;BA.debugLine="pnlloading.SetVisibleAnimated(500,True)";
mostCurrent._pnlloading.SetVisibleAnimated((int) (500),anywheresoftware.b4a.keywords.Common.True);
 //BA.debugLineNum = 855;BA.debugLine="Dim opAddress As OpenCart";
_opaddress = new com.apps.demo.opencart();
 //BA.debugLineNum = 856;BA.debugLine="opAddress.Initialize";
_opaddress._initialize(processBA);
 //BA.debugLineNum = 857;BA.debugLine="opAddress.ListAddressUser(Me,\"ListAddress_receiv";
_opaddress._listaddressuser(actaccount.getObject(),"ListAddress_receive");
 };
 //BA.debugLineNum = 860;BA.debugLine="pnlnew_address.SetVisibleAnimated(500,False)";
mostCurrent._pnlnew_address.SetVisibleAnimated((int) (500),anywheresoftware.b4a.keywords.Common.False);
 //BA.debugLineNum = 861;BA.debugLine="DefaultButtonMenuColor";
_defaultbuttonmenucolor();
 //BA.debugLineNum = 862;BA.debugLine="btnaddress.TextColor = Colors.RGB(244,255,0)";
mostCurrent._btnaddress.setTextColor(anywheresoftware.b4a.keywords.Common.Colors.RGB((int) (244),(int) (255),(int) (0)));
 //BA.debugLineNum = 863;BA.debugLine="tab1.CurrentTab = 2";
mostCurrent._tab1.setCurrentTab((int) (2));
 //BA.debugLineNum = 865;BA.debugLine="btnback_menu_Click";
_btnback_menu_click();
 //BA.debugLineNum = 867;BA.debugLine="End Sub";
return "";
}
public static String  _btnapply_newsletter_click() throws Exception{
com.apps.demo.opencart _op1 = null;
 //BA.debugLineNum = 1129;BA.debugLine="Sub btnapply_newsletter_Click";
 //BA.debugLineNum = 1131;BA.debugLine="lblpb.Text = Library.GetStringResourse(\"apply\")";
mostCurrent._lblpb.setText(BA.ObjectToCharSequence(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"apply")));
 //BA.debugLineNum = 1132;BA.debugLine="pnlloading.SetVisibleAnimated(500,True)";
mostCurrent._pnlloading.SetVisibleAnimated((int) (500),anywheresoftware.b4a.keywords.Common.True);
 //BA.debugLineNum = 1134;BA.debugLine="Dim op1 As OpenCart";
_op1 = new com.apps.demo.opencart();
 //BA.debugLineNum = 1135;BA.debugLine="op1.Initialize";
_op1._initialize(processBA);
 //BA.debugLineNum = 1137;BA.debugLine="If rbyes.Checked Then";
if (mostCurrent._rbyes.getChecked()) { 
 //BA.debugLineNum = 1138;BA.debugLine="SubscribeState = \"1\"";
mostCurrent._subscribestate = "1";
 //BA.debugLineNum = 1139;BA.debugLine="op1.SubScribe(Me,\"subsribe_receive\",True)";
_op1._subscribe(actaccount.getObject(),"subsribe_receive",anywheresoftware.b4a.keywords.Common.True);
 }else {
 //BA.debugLineNum = 1141;BA.debugLine="SubscribeState = \"0\"";
mostCurrent._subscribestate = "0";
 //BA.debugLineNum = 1142;BA.debugLine="op1.SubScribe(Me,\"subsribe_receive\",False)";
_op1._subscribe(actaccount.getObject(),"subsribe_receive",anywheresoftware.b4a.keywords.Common.False);
 };
 //BA.debugLineNum = 1145;BA.debugLine="End Sub";
return "";
}
public static String  _btnback_menu_click() throws Exception{
 //BA.debugLineNum = 1212;BA.debugLine="Sub btnback_menu_Click";
 //BA.debugLineNum = 1213;BA.debugLine="pnlaction.SetLayoutAnimated(600,0,Activity.Height";
mostCurrent._pnlaction.SetLayoutAnimated((int) (600),(int) (0),(int) (mostCurrent._activity.getHeight()+mostCurrent._pnlaction.getHeight()),mostCurrent._pnlaction.getWidth(),mostCurrent._pnlaction.getHeight());
 //BA.debugLineNum = 1214;BA.debugLine="End Sub";
return "";
}
public static String  _btncancel_new_address_click() throws Exception{
 //BA.debugLineNum = 751;BA.debugLine="Sub btncancel_new_address_Click";
 //BA.debugLineNum = 752;BA.debugLine="ChoosenAddress4Edit = 0";
_choosenaddress4edit = (int) (0);
 //BA.debugLineNum = 753;BA.debugLine="pnlnew_address.SetVisibleAnimated(500,False)";
mostCurrent._pnlnew_address.SetVisibleAnimated((int) (500),anywheresoftware.b4a.keywords.Common.False);
 //BA.debugLineNum = 754;BA.debugLine="End Sub";
return "";
}
public static String  _btncancel_return_click() throws Exception{
 //BA.debugLineNum = 1224;BA.debugLine="Sub btncancel_return_Click";
 //BA.debugLineNum = 1225;BA.debugLine="sv_return_details.Panel.RemoveAllViews";
mostCurrent._sv_return_details.getPanel().RemoveAllViews();
 //BA.debugLineNum = 1226;BA.debugLine="pnldetails_return.SetVisibleAnimated(500,False)";
mostCurrent._pnldetails_return.SetVisibleAnimated((int) (500),anywheresoftware.b4a.keywords.Common.False);
 //BA.debugLineNum = 1227;BA.debugLine="End Sub";
return "";
}
public static String  _btnclose_click() throws Exception{
 //BA.debugLineNum = 555;BA.debugLine="Sub btnclose_Click";
 //BA.debugLineNum = 556;BA.debugLine="Activity.Finish";
mostCurrent._activity.Finish();
 //BA.debugLineNum = 557;BA.debugLine="End Sub";
return "";
}
public static String  _btndefault_address_click() throws Exception{
 //BA.debugLineNum = 1204;BA.debugLine="Sub btndefault_address_Click";
 //BA.debugLineNum = 1206;BA.debugLine="btnback_menu_Click";
_btnback_menu_click();
 //BA.debugLineNum = 1207;BA.debugLine="Library.ChoosenAddress = ChoosenAddressID";
mostCurrent._library._choosenaddress = (int)(Double.parseDouble(mostCurrent._choosenaddressid));
 //BA.debugLineNum = 1208;BA.debugLine="toast.ShowToastMessageShow(Library.GetStringResou";
mostCurrent._toast._showtoastmessageshow(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"choosen_address"),(long) (2),anywheresoftware.b4a.keywords.Common.True);
 //BA.debugLineNum = 1210;BA.debugLine="End Sub";
return "";
}
public static String  _btndelete_address_click() throws Exception{
com.apps.demo.opencart _opdeleteaddr = null;
 //BA.debugLineNum = 1147;BA.debugLine="Sub btndelete_address_Click";
 //BA.debugLineNum = 1149;BA.debugLine="pnlloading.SetVisibleAnimated(500,True)";
mostCurrent._pnlloading.SetVisibleAnimated((int) (500),anywheresoftware.b4a.keywords.Common.True);
 //BA.debugLineNum = 1150;BA.debugLine="btnback_menu_Click";
_btnback_menu_click();
 //BA.debugLineNum = 1152;BA.debugLine="Dim opDeleteAddr As OpenCart";
_opdeleteaddr = new com.apps.demo.opencart();
 //BA.debugLineNum = 1153;BA.debugLine="opDeleteAddr.Initialize";
_opdeleteaddr._initialize(processBA);
 //BA.debugLineNum = 1154;BA.debugLine="opDeleteAddr.DeleteAddressUser(Me,\"DeleteAddress_";
_opdeleteaddr._deleteaddressuser(actaccount.getObject(),"DeleteAddress_receive",mostCurrent._choosenaddressid);
 //BA.debugLineNum = 1156;BA.debugLine="End Sub";
return "";
}
public static String  _btndetails_click() throws Exception{
anywheresoftware.b4a.objects.ButtonWrapper _b1 = null;
String _id1 = "";
com.apps.demo.opencart _opdetails = null;
 //BA.debugLineNum = 756;BA.debugLine="Sub btndetails_Click";
 //BA.debugLineNum = 758;BA.debugLine="Dim b1 As Button";
_b1 = new anywheresoftware.b4a.objects.ButtonWrapper();
 //BA.debugLineNum = 759;BA.debugLine="b1 = Sender";
_b1.setObject((android.widget.Button)(anywheresoftware.b4a.keywords.Common.Sender(mostCurrent.activityBA)));
 //BA.debugLineNum = 761;BA.debugLine="Dim id1 As String";
_id1 = "";
 //BA.debugLineNum = 762;BA.debugLine="id1 = b1.Tag";
_id1 = BA.ObjectToString(_b1.getTag());
 //BA.debugLineNum = 764;BA.debugLine="pnlloading.SetVisibleAnimated(500,True)";
mostCurrent._pnlloading.SetVisibleAnimated((int) (500),anywheresoftware.b4a.keywords.Common.True);
 //BA.debugLineNum = 766;BA.debugLine="Dim opDetails As OpenCart";
_opdetails = new com.apps.demo.opencart();
 //BA.debugLineNum = 767;BA.debugLine="opDetails.Initialize";
_opdetails._initialize(processBA);
 //BA.debugLineNum = 768;BA.debugLine="opDetails.GetOrders(Me,\"DetailsOrder_receive\",id1";
_opdetails._getorders(actaccount.getObject(),"DetailsOrder_receive",_id1);
 //BA.debugLineNum = 770;BA.debugLine="End Sub";
return "";
}
public static String  _btnedit_address_click() throws Exception{
int _i = 0;
anywheresoftware.b4a.objects.collections.Map _temp = null;
int _k = 0;
com.apps.demo.opencart _opcity = null;
 //BA.debugLineNum = 1158;BA.debugLine="Sub btnedit_address_Click";
 //BA.debugLineNum = 1160;BA.debugLine="btnback_menu_Click";
_btnback_menu_click();
 //BA.debugLineNum = 1162;BA.debugLine="For i = 0 To listAddressCache.Size - 1";
{
final int step2 = 1;
final int limit2 = (int) (mostCurrent._listaddresscache.getSize()-1);
for (_i = (int) (0) ; (step2 > 0 && _i <= limit2) || (step2 < 0 && _i >= limit2); _i = ((int)(0 + _i + step2)) ) {
 //BA.debugLineNum = 1164;BA.debugLine="Dim temp As Map";
_temp = new anywheresoftware.b4a.objects.collections.Map();
 //BA.debugLineNum = 1165;BA.debugLine="temp = listAddressCache.Get(listAddressCache.Ge";
_temp.setObject((anywheresoftware.b4a.objects.collections.Map.MyMap)(mostCurrent._listaddresscache.Get(mostCurrent._listaddresscache.GetKeyAt(_i))));
 //BA.debugLineNum = 1167;BA.debugLine="If ChoosenAddressValue = $\"${temp.Get(\"country\"";
if ((mostCurrent._choosenaddressvalue).equals((""+anywheresoftware.b4a.keywords.Common.SmartStringFormatter("",_temp.Get((Object)("country")))+" "+anywheresoftware.b4a.keywords.Common.SmartStringFormatter("",_temp.Get((Object)("city")))+" "+anywheresoftware.b4a.keywords.Common.SmartStringFormatter("",_temp.Get((Object)("address_1")))+""))) { 
 //BA.debugLineNum = 1169;BA.debugLine="txtaddress.Text = temp.Get(\"address_1\")";
mostCurrent._txtaddress.setText(BA.ObjectToCharSequence(_temp.Get((Object)("address_1"))));
 //BA.debugLineNum = 1170;BA.debugLine="txtpostal_enter.Text = temp.Get(\"postcode\")";
mostCurrent._txtpostal_enter.setText(BA.ObjectToCharSequence(_temp.Get((Object)("postcode"))));
 //BA.debugLineNum = 1171;BA.debugLine="choosenCity = temp.Get(\"city\")";
mostCurrent._choosencity = BA.ObjectToString(_temp.Get((Object)("city")));
 //BA.debugLineNum = 1172;BA.debugLine="btnadd.Text = Library.GetStringResourse(\"edit\"";
mostCurrent._btnadd.setText(BA.ObjectToCharSequence(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"edit")));
 //BA.debugLineNum = 1174;BA.debugLine="For k = 0 To txtcountry.Size - 1";
{
final int step10 = 1;
final int limit10 = (int) (mostCurrent._txtcountry.getSize()-1);
for (_k = (int) (0) ; (step10 > 0 && _k <= limit10) || (step10 < 0 && _k >= limit10); _k = ((int)(0 + _k + step10)) ) {
 //BA.debugLineNum = 1176;BA.debugLine="If txtcountry.GetItem(k) = temp.Get(\"country\"";
if ((mostCurrent._txtcountry.GetItem(_k)).equals(BA.ObjectToString(_temp.Get((Object)("country"))))) { 
 //BA.debugLineNum = 1178;BA.debugLine="ChoosenAddress4Edit = listAddressCache.GetKe";
_choosenaddress4edit = (int)(BA.ObjectToNumber(mostCurrent._listaddresscache.GetKeyAt(_i)));
 //BA.debugLineNum = 1180;BA.debugLine="txtcountry.SelectedIndex = k";
mostCurrent._txtcountry.setSelectedIndex(_k);
 //BA.debugLineNum = 1182;BA.debugLine="Dim opCity As OpenCart";
_opcity = new com.apps.demo.opencart();
 //BA.debugLineNum = 1183;BA.debugLine="opCity.Initialize";
_opcity._initialize(processBA);
 //BA.debugLineNum = 1184;BA.debugLine="opCity.GetCity(Me,\"city_receive\",temp.Get(\"c";
_opcity._getcity(actaccount.getObject(),"city_receive",BA.ObjectToString(_temp.Get((Object)("country_id"))));
 //BA.debugLineNum = 1186;BA.debugLine="Exit";
if (true) break;
 };
 }
};
 //BA.debugLineNum = 1192;BA.debugLine="btnadd.Background = Library.GetButtonState";
mostCurrent._btnadd.setBackground((android.graphics.drawable.Drawable)(mostCurrent._library._getbuttonstate(mostCurrent.activityBA).getObject()));
 //BA.debugLineNum = 1193;BA.debugLine="btncancel_new_address.Background = Library.Get";
mostCurrent._btncancel_new_address.setBackground((android.graphics.drawable.Drawable)(mostCurrent._library._getbuttonstate(mostCurrent.activityBA).getObject()));
 //BA.debugLineNum = 1194;BA.debugLine="pnlnew_address.SetVisibleAnimated(500,True)";
mostCurrent._pnlnew_address.SetVisibleAnimated((int) (500),anywheresoftware.b4a.keywords.Common.True);
 //BA.debugLineNum = 1196;BA.debugLine="Return";
if (true) return "";
 };
 }
};
 //BA.debugLineNum = 1202;BA.debugLine="End Sub";
return "";
}
public static String  _btnorders_click() throws Exception{
com.apps.demo.opencart _oporder = null;
 //BA.debugLineNum = 833;BA.debugLine="Sub btnorders_Click";
 //BA.debugLineNum = 835;BA.debugLine="If svOrder.Panel.NumberOfViews = 0 Then";
if (mostCurrent._svorder.getPanel().getNumberOfViews()==0) { 
 //BA.debugLineNum = 836;BA.debugLine="pnlloading.SetVisibleAnimated(500,True)";
mostCurrent._pnlloading.SetVisibleAnimated((int) (500),anywheresoftware.b4a.keywords.Common.True);
 //BA.debugLineNum = 837;BA.debugLine="Dim opOrder As OpenCart";
_oporder = new com.apps.demo.opencart();
 //BA.debugLineNum = 838;BA.debugLine="opOrder.Initialize";
_oporder._initialize(processBA);
 //BA.debugLineNum = 839;BA.debugLine="opOrder.GetOrders(Me,\"Orders_receive\",\"\")";
_oporder._getorders(actaccount.getObject(),"Orders_receive","");
 };
 //BA.debugLineNum = 842;BA.debugLine="pnlnew_address.SetVisibleAnimated(500,False)";
mostCurrent._pnlnew_address.SetVisibleAnimated((int) (500),anywheresoftware.b4a.keywords.Common.False);
 //BA.debugLineNum = 843;BA.debugLine="DefaultButtonMenuColor";
_defaultbuttonmenucolor();
 //BA.debugLineNum = 844;BA.debugLine="btnorders.TextColor = Colors.RGB(244,255,0)";
mostCurrent._btnorders.setTextColor(anywheresoftware.b4a.keywords.Common.Colors.RGB((int) (244),(int) (255),(int) (0)));
 //BA.debugLineNum = 845;BA.debugLine="tab1.CurrentTab = 1";
mostCurrent._tab1.setCurrentTab((int) (1));
 //BA.debugLineNum = 847;BA.debugLine="btnback_menu_Click";
_btnback_menu_click();
 //BA.debugLineNum = 849;BA.debugLine="End Sub";
return "";
}
public static String  _btnpassword_click() throws Exception{
com.apps.demo.opencart _op1 = null;
 //BA.debugLineNum = 603;BA.debugLine="Sub btnpassword_Click";
 //BA.debugLineNum = 605;BA.debugLine="If txtpassword.Text.Length < 5 Then";
if (mostCurrent._txtpassword.getText().length()<5) { 
 //BA.debugLineNum = 606;BA.debugLine="toast.ShowToastMessageShow(Library.GetStringReso";
mostCurrent._toast._showtoastmessageshow(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"error_password"),(long) (2),anywheresoftware.b4a.keywords.Common.False);
 //BA.debugLineNum = 607;BA.debugLine="Return";
if (true) return "";
 };
 //BA.debugLineNum = 610;BA.debugLine="If txtpassword.Text <> txtpassword2.Text Then";
if ((mostCurrent._txtpassword.getText()).equals(mostCurrent._txtpassword2.getText()) == false) { 
 //BA.debugLineNum = 611;BA.debugLine="toast.ShowToastMessageShow(Library.GetStringReso";
mostCurrent._toast._showtoastmessageshow(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"error_password2"),(long) (2),anywheresoftware.b4a.keywords.Common.False);
 //BA.debugLineNum = 612;BA.debugLine="Return";
if (true) return "";
 };
 //BA.debugLineNum = 615;BA.debugLine="lblpb.Text = Library.GetStringResourse(\"apply\")";
mostCurrent._lblpb.setText(BA.ObjectToCharSequence(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"apply")));
 //BA.debugLineNum = 616;BA.debugLine="pnlloading.SetVisibleAnimated(500,True)";
mostCurrent._pnlloading.SetVisibleAnimated((int) (500),anywheresoftware.b4a.keywords.Common.True);
 //BA.debugLineNum = 618;BA.debugLine="Dim op1 As OpenCart";
_op1 = new com.apps.demo.opencart();
 //BA.debugLineNum = 619;BA.debugLine="op1.Initialize";
_op1._initialize(processBA);
 //BA.debugLineNum = 620;BA.debugLine="op1.UpdatePasswordUser(Me,\"changepassword_receive";
_op1._updatepassworduser(actaccount.getObject(),"changepassword_receive",mostCurrent._txtpassword.getText());
 //BA.debugLineNum = 622;BA.debugLine="End Sub";
return "";
}
public static String  _btnpasswords_click() throws Exception{
 //BA.debugLineNum = 825;BA.debugLine="Sub btnpasswords_Click";
 //BA.debugLineNum = 826;BA.debugLine="pnlnew_address.SetVisibleAnimated(500,False)";
mostCurrent._pnlnew_address.SetVisibleAnimated((int) (500),anywheresoftware.b4a.keywords.Common.False);
 //BA.debugLineNum = 827;BA.debugLine="DefaultButtonMenuColor";
_defaultbuttonmenucolor();
 //BA.debugLineNum = 828;BA.debugLine="btnpasswords.TextColor = Colors.RGB(244,255,0)";
mostCurrent._btnpasswords.setTextColor(anywheresoftware.b4a.keywords.Common.Colors.RGB((int) (244),(int) (255),(int) (0)));
 //BA.debugLineNum = 829;BA.debugLine="tab1.CurrentTab = 3";
mostCurrent._tab1.setCurrentTab((int) (3));
 //BA.debugLineNum = 830;BA.debugLine="btnback_menu_Click";
_btnback_menu_click();
 //BA.debugLineNum = 831;BA.debugLine="End Sub";
return "";
}
public static String  _btnprofile_click() throws Exception{
 //BA.debugLineNum = 817;BA.debugLine="Sub btnprofile_Click";
 //BA.debugLineNum = 818;BA.debugLine="pnlnew_address.SetVisibleAnimated(500,False)";
mostCurrent._pnlnew_address.SetVisibleAnimated((int) (500),anywheresoftware.b4a.keywords.Common.False);
 //BA.debugLineNum = 819;BA.debugLine="DefaultButtonMenuColor";
_defaultbuttonmenucolor();
 //BA.debugLineNum = 820;BA.debugLine="btnprofile.TextColor = Colors.RGB(244,255,0)";
mostCurrent._btnprofile.setTextColor(anywheresoftware.b4a.keywords.Common.Colors.RGB((int) (244),(int) (255),(int) (0)));
 //BA.debugLineNum = 821;BA.debugLine="tab1.CurrentTab = 0";
mostCurrent._tab1.setCurrentTab((int) (0));
 //BA.debugLineNum = 822;BA.debugLine="btnback_menu_Click";
_btnback_menu_click();
 //BA.debugLineNum = 823;BA.debugLine="End Sub";
return "";
}
public static String  _btnreturn_details_click() throws Exception{
anywheresoftware.b4a.objects.ButtonWrapper _bu = null;
com.apps.demo.opencart _op1 = null;
 //BA.debugLineNum = 990;BA.debugLine="Sub btnreturn_details_Click";
 //BA.debugLineNum = 992;BA.debugLine="Dim bu As Button";
_bu = new anywheresoftware.b4a.objects.ButtonWrapper();
 //BA.debugLineNum = 993;BA.debugLine="bu = Sender";
_bu.setObject((android.widget.Button)(anywheresoftware.b4a.keywords.Common.Sender(mostCurrent.activityBA)));
 //BA.debugLineNum = 995;BA.debugLine="pnlloading.SetVisibleAnimated(500,True)";
mostCurrent._pnlloading.SetVisibleAnimated((int) (500),anywheresoftware.b4a.keywords.Common.True);
 //BA.debugLineNum = 997;BA.debugLine="Dim op1 As OpenCart";
_op1 = new com.apps.demo.opencart();
 //BA.debugLineNum = 998;BA.debugLine="op1.Initialize";
_op1._initialize(processBA);
 //BA.debugLineNum = 999;BA.debugLine="op1.GetReturns(Me,\"returndetails_receive\",bu.Tag)";
_op1._getreturns(actaccount.getObject(),"returndetails_receive",BA.ObjectToString(_bu.getTag()));
 //BA.debugLineNum = 1001;BA.debugLine="End Sub";
return "";
}
public static String  _btnreturns_click() throws Exception{
com.apps.demo.opencart _op = null;
 //BA.debugLineNum = 909;BA.debugLine="Sub btnreturns_Click";
 //BA.debugLineNum = 911;BA.debugLine="DefaultButtonMenuColor";
_defaultbuttonmenucolor();
 //BA.debugLineNum = 912;BA.debugLine="btnreturns.TextColor = Colors.RGB(244,255,0)";
mostCurrent._btnreturns.setTextColor(anywheresoftware.b4a.keywords.Common.Colors.RGB((int) (244),(int) (255),(int) (0)));
 //BA.debugLineNum = 914;BA.debugLine="If svReturns.Panel.NumberOfViews = 0 Then";
if (mostCurrent._svreturns.getPanel().getNumberOfViews()==0) { 
 //BA.debugLineNum = 915;BA.debugLine="lblpb.Text = Library.GetStringResourse(\"loading\"";
mostCurrent._lblpb.setText(BA.ObjectToCharSequence(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"loading")));
 //BA.debugLineNum = 916;BA.debugLine="pnlloading.SetVisibleAnimated(500,True)";
mostCurrent._pnlloading.SetVisibleAnimated((int) (500),anywheresoftware.b4a.keywords.Common.True);
 //BA.debugLineNum = 918;BA.debugLine="Dim op As OpenCart";
_op = new com.apps.demo.opencart();
 //BA.debugLineNum = 919;BA.debugLine="op.Initialize";
_op._initialize(processBA);
 //BA.debugLineNum = 920;BA.debugLine="op.GetReturns(Me,\"returns_receive\",\"\")";
_op._getreturns(actaccount.getObject(),"returns_receive","");
 }else {
 //BA.debugLineNum = 922;BA.debugLine="pnlnew_address.Visible = False";
mostCurrent._pnlnew_address.setVisible(anywheresoftware.b4a.keywords.Common.False);
 //BA.debugLineNum = 923;BA.debugLine="tab1.CurrentTab = 4";
mostCurrent._tab1.setCurrentTab((int) (4));
 };
 //BA.debugLineNum = 926;BA.debugLine="btnback_menu_Click";
_btnback_menu_click();
 //BA.debugLineNum = 928;BA.debugLine="End Sub";
return "";
}
public static String  _btnsave_click() throws Exception{
anywheresoftware.b4a.objects.collections.Map _data = null;
com.apps.demo.opencart _op1 = null;
 //BA.debugLineNum = 559;BA.debugLine="Sub btnsave_Click";
 //BA.debugLineNum = 561;BA.debugLine="If txtname.Text.Length < 2 Or txtfamily.Text.Leng";
if (mostCurrent._txtname.getText().length()<2 || mostCurrent._txtfamily.getText().length()<3) { 
 //BA.debugLineNum = 562;BA.debugLine="toast.ShowToastMessageShow(Library.GetStringReso";
mostCurrent._toast._showtoastmessageshow(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"error_name"),(long) (2),anywheresoftware.b4a.keywords.Common.False);
 //BA.debugLineNum = 563;BA.debugLine="Return";
if (true) return "";
 };
 //BA.debugLineNum = 566;BA.debugLine="If txtphone.Text.Length <> 11 Then";
if (mostCurrent._txtphone.getText().length()!=11) { 
 //BA.debugLineNum = 567;BA.debugLine="toast.ShowToastMessageShow(Library.GetStringReso";
mostCurrent._toast._showtoastmessageshow(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"error_phone"),(long) (2),anywheresoftware.b4a.keywords.Common.False);
 //BA.debugLineNum = 569;BA.debugLine="Return";
if (true) return "";
 };
 //BA.debugLineNum = 572;BA.debugLine="Dim data As Map";
_data = new anywheresoftware.b4a.objects.collections.Map();
 //BA.debugLineNum = 573;BA.debugLine="data.Initialize";
_data.Initialize();
 //BA.debugLineNum = 574;BA.debugLine="data.Put(\"email\",txtemail.Text)";
_data.Put((Object)("email"),(Object)(mostCurrent._txtemail.getText()));
 //BA.debugLineNum = 575;BA.debugLine="data.Put(\"firstname\",txtname.Text)";
_data.Put((Object)("firstname"),(Object)(mostCurrent._txtname.getText()));
 //BA.debugLineNum = 576;BA.debugLine="data.Put(\"lastname\",txtfamily.Text)";
_data.Put((Object)("lastname"),(Object)(mostCurrent._txtfamily.getText()));
 //BA.debugLineNum = 577;BA.debugLine="data.Put(\"telephone\",txtphone.Text)";
_data.Put((Object)("telephone"),(Object)(mostCurrent._txtphone.getText()));
 //BA.debugLineNum = 578;BA.debugLine="data.Put(\"fax\",txtfax.Text)";
_data.Put((Object)("fax"),(Object)(mostCurrent._txtfax.getText()));
 //BA.debugLineNum = 580;BA.debugLine="lblpb.Text = Library.GetStringResourse(\"apply\")";
mostCurrent._lblpb.setText(BA.ObjectToCharSequence(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"apply")));
 //BA.debugLineNum = 581;BA.debugLine="pnlloading.SetVisibleAnimated(500,True)";
mostCurrent._pnlloading.SetVisibleAnimated((int) (500),anywheresoftware.b4a.keywords.Common.True);
 //BA.debugLineNum = 583;BA.debugLine="Dim op1 As OpenCart";
_op1 = new com.apps.demo.opencart();
 //BA.debugLineNum = 584;BA.debugLine="op1.Initialize";
_op1._initialize(processBA);
 //BA.debugLineNum = 585;BA.debugLine="op1.UpdateUserDetails(Me,\"updatedetails_receive\",";
_op1._updateuserdetails(actaccount.getObject(),"updatedetails_receive",_data);
 //BA.debugLineNum = 587;BA.debugLine="End Sub";
return "";
}
public static String  _btnscribe_click() throws Exception{
 //BA.debugLineNum = 869;BA.debugLine="Sub btnscribe_Click";
 //BA.debugLineNum = 871;BA.debugLine="pnlnew_address.SetVisibleAnimated(500,False)";
mostCurrent._pnlnew_address.SetVisibleAnimated((int) (500),anywheresoftware.b4a.keywords.Common.False);
 //BA.debugLineNum = 872;BA.debugLine="DefaultButtonMenuColor";
_defaultbuttonmenucolor();
 //BA.debugLineNum = 873;BA.debugLine="btnscribe.TextColor = Colors.RGB(244,255,0)";
mostCurrent._btnscribe.setTextColor(anywheresoftware.b4a.keywords.Common.Colors.RGB((int) (244),(int) (255),(int) (0)));
 //BA.debugLineNum = 874;BA.debugLine="tab1.CurrentTab = 5";
mostCurrent._tab1.setCurrentTab((int) (5));
 //BA.debugLineNum = 876;BA.debugLine="btnback_menu_Click";
_btnback_menu_click();
 //BA.debugLineNum = 878;BA.debugLine="End Sub";
return "";
}
public static String  _changepassword_receive(anywheresoftware.b4a.objects.collections.Map _res,String _cat) throws Exception{
 //BA.debugLineNum = 624;BA.debugLine="Sub changepassword_receive(res As Map,cat As Strin";
 //BA.debugLineNum = 626;BA.debugLine="ProgressDialogHide";
anywheresoftware.b4a.keywords.Common.ProgressDialogHide();
 //BA.debugLineNum = 627;BA.debugLine="pnlloading.SetVisibleAnimated(500,False)";
mostCurrent._pnlloading.SetVisibleAnimated((int) (500),anywheresoftware.b4a.keywords.Common.False);
 //BA.debugLineNum = 629;BA.debugLine="If res.ContainsKey(\"success\") Then";
if (_res.ContainsKey((Object)("success"))) { 
 //BA.debugLineNum = 630;BA.debugLine="If res.Get(\"success\") = True Then";
if ((_res.Get((Object)("success"))).equals((Object)(anywheresoftware.b4a.keywords.Common.True))) { 
 //BA.debugLineNum = 631;BA.debugLine="toast.ShowToastMessageShow(Library.GetStringRes";
mostCurrent._toast._showtoastmessageshow(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"success_save_details"),(long) (2),anywheresoftware.b4a.keywords.Common.True);
 //BA.debugLineNum = 632;BA.debugLine="txtpassword.Text = \"\"";
mostCurrent._txtpassword.setText(BA.ObjectToCharSequence(""));
 //BA.debugLineNum = 633;BA.debugLine="txtpassword2.Text = \"\"";
mostCurrent._txtpassword2.setText(BA.ObjectToCharSequence(""));
 //BA.debugLineNum = 634;BA.debugLine="Return";
if (true) return "";
 };
 };
 //BA.debugLineNum = 638;BA.debugLine="End Sub";
return "";
}
public static String  _city_receive(anywheresoftware.b4a.objects.collections.List _res,String _cat) throws Exception{
int _i = 0;
anywheresoftware.b4a.objects.collections.Map _m1 = null;
 //BA.debugLineNum = 411;BA.debugLine="Sub city_receive(res As List,cat As String)";
 //BA.debugLineNum = 413;BA.debugLine="pnlloading.SetVisibleAnimated(500,False)";
mostCurrent._pnlloading.SetVisibleAnimated((int) (500),anywheresoftware.b4a.keywords.Common.False);
 //BA.debugLineNum = 415;BA.debugLine="listCity = res";
mostCurrent._listcity = _res;
 //BA.debugLineNum = 417;BA.debugLine="txtcity.Clear";
mostCurrent._txtcity.Clear();
 //BA.debugLineNum = 419;BA.debugLine="For i = 0 To res.Size - 1";
{
final int step4 = 1;
final int limit4 = (int) (_res.getSize()-1);
for (_i = (int) (0) ; (step4 > 0 && _i <= limit4) || (step4 < 0 && _i >= limit4); _i = ((int)(0 + _i + step4)) ) {
 //BA.debugLineNum = 421;BA.debugLine="Dim m1 As Map";
_m1 = new anywheresoftware.b4a.objects.collections.Map();
 //BA.debugLineNum = 422;BA.debugLine="m1 = res.Get(i)";
_m1.setObject((anywheresoftware.b4a.objects.collections.Map.MyMap)(_res.Get(_i)));
 //BA.debugLineNum = 423;BA.debugLine="txtcity.Add(m1.Get(\"name\"))";
mostCurrent._txtcity.Add(BA.ObjectToString(_m1.Get((Object)("name"))));
 //BA.debugLineNum = 425;BA.debugLine="If m1.Get(\"name\") = choosenCity Then txtcity.Sel";
if ((_m1.Get((Object)("name"))).equals((Object)(mostCurrent._choosencity))) { 
mostCurrent._txtcity.setSelectedIndex(_i);};
 }
};
 //BA.debugLineNum = 429;BA.debugLine="End Sub";
return "";
}
public static String  _country_receive(anywheresoftware.b4a.objects.collections.List _ls,String _cat) throws Exception{
anywheresoftware.b4a.objects.collections.List _city = null;
int _i = 0;
anywheresoftware.b4a.objects.collections.Map _te = null;
com.apps.demo.opencart _opcity = null;
 //BA.debugLineNum = 382;BA.debugLine="Sub country_receive(ls As List,cat As String)";
 //BA.debugLineNum = 384;BA.debugLine="pnlloading.SetVisibleAnimated(500,False)";
mostCurrent._pnlloading.SetVisibleAnimated((int) (500),anywheresoftware.b4a.keywords.Common.False);
 //BA.debugLineNum = 386;BA.debugLine="listCountries.Initialize";
mostCurrent._listcountries.Initialize();
 //BA.debugLineNum = 387;BA.debugLine="listCountries = ls";
mostCurrent._listcountries = _ls;
 //BA.debugLineNum = 389;BA.debugLine="Dim City As List";
_city = new anywheresoftware.b4a.objects.collections.List();
 //BA.debugLineNum = 390;BA.debugLine="City.Initialize";
_city.Initialize();
 //BA.debugLineNum = 392;BA.debugLine="For i = 0 To ls.Size - 1";
{
final int step6 = 1;
final int limit6 = (int) (_ls.getSize()-1);
for (_i = (int) (0) ; (step6 > 0 && _i <= limit6) || (step6 < 0 && _i >= limit6); _i = ((int)(0 + _i + step6)) ) {
 //BA.debugLineNum = 393;BA.debugLine="Dim te As Map";
_te = new anywheresoftware.b4a.objects.collections.Map();
 //BA.debugLineNum = 394;BA.debugLine="te = ls.Get(i)";
_te.setObject((anywheresoftware.b4a.objects.collections.Map.MyMap)(_ls.Get(_i)));
 //BA.debugLineNum = 395;BA.debugLine="txtcountry.Add(te.Get(\"name\"))";
mostCurrent._txtcountry.Add(BA.ObjectToString(_te.Get((Object)("name"))));
 //BA.debugLineNum = 397;BA.debugLine="If Library.IsPersian Then";
if (mostCurrent._library._ispersian(mostCurrent.activityBA)) { 
 //BA.debugLineNum = 398;BA.debugLine="If te.Get(\"country_id\") = \"101\" Then txtcountry";
if ((_te.Get((Object)("country_id"))).equals((Object)("101"))) { 
mostCurrent._txtcountry.setSelectedIndex(_i);};
 };
 }
};
 //BA.debugLineNum = 403;BA.debugLine="If Library.IsPersian Then";
if (mostCurrent._library._ispersian(mostCurrent.activityBA)) { 
 //BA.debugLineNum = 404;BA.debugLine="Dim opCity As OpenCart";
_opcity = new com.apps.demo.opencart();
 //BA.debugLineNum = 405;BA.debugLine="opCity.Initialize";
_opcity._initialize(processBA);
 //BA.debugLineNum = 406;BA.debugLine="opCity.GetCity(Me,\"city_receive\",\"101\")";
_opcity._getcity(actaccount.getObject(),"city_receive","101");
 };
 //BA.debugLineNum = 409;BA.debugLine="End Sub";
return "";
}
public static String  _defaultbuttonmenucolor() throws Exception{
anywheresoftware.b4a.objects.ConcreteViewWrapper _v1 = null;
anywheresoftware.b4a.objects.ButtonWrapper _b1 = null;
 //BA.debugLineNum = 1115;BA.debugLine="Sub DefaultButtonMenuColor";
 //BA.debugLineNum = 1117;BA.debugLine="For Each v1 As View In pnlmenu.GetAllViewsRecursi";
_v1 = new anywheresoftware.b4a.objects.ConcreteViewWrapper();
final anywheresoftware.b4a.BA.IterableList group1 = mostCurrent._pnlmenu.GetAllViewsRecursive();
final int groupLen1 = group1.getSize();
for (int index1 = 0;index1 < groupLen1 ;index1++){
_v1.setObject((android.view.View)(group1.Get(index1)));
 //BA.debugLineNum = 1118;BA.debugLine="If v1 Is Button Then";
if (_v1.getObjectOrNull() instanceof android.widget.Button) { 
 //BA.debugLineNum = 1119;BA.debugLine="Dim b1 As Button";
_b1 = new anywheresoftware.b4a.objects.ButtonWrapper();
 //BA.debugLineNum = 1120;BA.debugLine="b1 = v1";
_b1.setObject((android.widget.Button)(_v1.getObject()));
 //BA.debugLineNum = 1121;BA.debugLine="b1.TextColor = Colors.White";
_b1.setTextColor(anywheresoftware.b4a.keywords.Common.Colors.White);
 };
 }
;
 //BA.debugLineNum = 1125;BA.debugLine="lblnewaddress.TextColor = Colors.White";
mostCurrent._lblnewaddress.setTextColor(anywheresoftware.b4a.keywords.Common.Colors.White);
 //BA.debugLineNum = 1127;BA.debugLine="End Sub";
return "";
}
public static String  _deleteaddress_receive(anywheresoftware.b4a.objects.collections.Map _res,String _cat) throws Exception{
com.apps.demo.opencart _opaddress = null;
 //BA.debugLineNum = 796;BA.debugLine="Sub DeleteAddress_receive(res As Map,cat As String";
 //BA.debugLineNum = 798;BA.debugLine="pnlloading.SetVisibleAnimated(500,False)";
mostCurrent._pnlloading.SetVisibleAnimated((int) (500),anywheresoftware.b4a.keywords.Common.False);
 //BA.debugLineNum = 800;BA.debugLine="If res.ContainsKey(\"success\") Then";
if (_res.ContainsKey((Object)("success"))) { 
 //BA.debugLineNum = 801;BA.debugLine="If res.Get(\"success\") = True Then";
if ((_res.Get((Object)("success"))).equals((Object)(anywheresoftware.b4a.keywords.Common.True))) { 
 //BA.debugLineNum = 803;BA.debugLine="lvAddress.Clear";
mostCurrent._lvaddress.Clear();
 //BA.debugLineNum = 804;BA.debugLine="listAddressID.Clear";
mostCurrent._listaddressid.Clear();
 //BA.debugLineNum = 806;BA.debugLine="toast.ShowToastMessageShow(Library.GetStringRes";
mostCurrent._toast._showtoastmessageshow(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"deleted_address"),(long) (2),anywheresoftware.b4a.keywords.Common.True);
 //BA.debugLineNum = 808;BA.debugLine="Dim opAddress As OpenCart";
_opaddress = new com.apps.demo.opencart();
 //BA.debugLineNum = 809;BA.debugLine="opAddress.Initialize";
_opaddress._initialize(processBA);
 //BA.debugLineNum = 810;BA.debugLine="opAddress.ListAddressUser(Me,\"ListAddress_recei";
_opaddress._listaddressuser(actaccount.getObject(),"ListAddress_receive");
 };
 };
 //BA.debugLineNum = 815;BA.debugLine="End Sub";
return "";
}
public static String  _detailsorder_receive(anywheresoftware.b4a.objects.collections.Map _res,String _cat) throws Exception{
anywheresoftware.b4a.objects.collections.Map _data = null;
 //BA.debugLineNum = 772;BA.debugLine="Sub DetailsOrder_receive(res As Map,cat As String)";
 //BA.debugLineNum = 774;BA.debugLine="pnlloading.SetVisibleAnimated(500,False)";
mostCurrent._pnlloading.SetVisibleAnimated((int) (500),anywheresoftware.b4a.keywords.Common.False);
 //BA.debugLineNum = 776;BA.debugLine="If res.ContainsKey(\"success\") Then";
if (_res.ContainsKey((Object)("success"))) { 
 //BA.debugLineNum = 777;BA.debugLine="If res.Get(\"success\") = True Then";
if ((_res.Get((Object)("success"))).equals((Object)(anywheresoftware.b4a.keywords.Common.True))) { 
 //BA.debugLineNum = 778;BA.debugLine="Dim data As Map";
_data = new anywheresoftware.b4a.objects.collections.Map();
 //BA.debugLineNum = 779;BA.debugLine="data = res.Get(\"data\")";
_data.setObject((anywheresoftware.b4a.objects.collections.Map.MyMap)(_res.Get((Object)("data"))));
 //BA.debugLineNum = 780;BA.debugLine="actOrderDetails.details = data";
mostCurrent._actorderdetails._details = _data;
 //BA.debugLineNum = 781;BA.debugLine="actOrderDetails.user_details = CreateMap(\"first";
mostCurrent._actorderdetails._user_details = anywheresoftware.b4a.keywords.Common.createMap(new Object[] {(Object)("firstname"),(Object)(mostCurrent._txtname.getText()),(Object)("lastname"),(Object)(mostCurrent._txtfamily.getText()),(Object)("email"),(Object)(mostCurrent._txtemail.getText()),(Object)("telephone"),(Object)(mostCurrent._txtphone.getText()),(Object)("order_id"),_data.Get((Object)("order_id")),(Object)("date_ordered"),_data.Get((Object)("date_added"))});
 //BA.debugLineNum = 782;BA.debugLine="StartActivity(actOrderDetails)";
anywheresoftware.b4a.keywords.Common.StartActivity(mostCurrent.activityBA,(Object)(mostCurrent._actorderdetails.getObject()));
 };
 };
 //BA.debugLineNum = 786;BA.debugLine="End Sub";
return "";
}
public static String  _editaddress_receive(anywheresoftware.b4a.objects.collections.Map _res,String _cat) throws Exception{
com.apps.demo.opencart _opaddress = null;
 //BA.debugLineNum = 694;BA.debugLine="Sub editAddress_receive(res As  Map,cat As String)";
 //BA.debugLineNum = 696;BA.debugLine="ProgressDialogHide";
anywheresoftware.b4a.keywords.Common.ProgressDialogHide();
 //BA.debugLineNum = 698;BA.debugLine="If res = Null Then Return";
if (_res== null) { 
if (true) return "";};
 //BA.debugLineNum = 700;BA.debugLine="pnlloading.SetVisibleAnimated(500,False)";
mostCurrent._pnlloading.SetVisibleAnimated((int) (500),anywheresoftware.b4a.keywords.Common.False);
 //BA.debugLineNum = 701;BA.debugLine="pnlnew_address.SetVisibleAnimated(500,False)";
mostCurrent._pnlnew_address.SetVisibleAnimated((int) (500),anywheresoftware.b4a.keywords.Common.False);
 //BA.debugLineNum = 703;BA.debugLine="If res.ContainsKey(\"success\") Then";
if (_res.ContainsKey((Object)("success"))) { 
 //BA.debugLineNum = 704;BA.debugLine="If res.Get(\"success\") = True Then";
if ((_res.Get((Object)("success"))).equals((Object)(anywheresoftware.b4a.keywords.Common.True))) { 
 //BA.debugLineNum = 705;BA.debugLine="ChoosenAddress4Edit = 0";
_choosenaddress4edit = (int) (0);
 //BA.debugLineNum = 706;BA.debugLine="txtaddress.Text = \"\"";
mostCurrent._txtaddress.setText(BA.ObjectToCharSequence(""));
 //BA.debugLineNum = 707;BA.debugLine="toast.ShowToastMessageShow(Library.GetStringRes";
mostCurrent._toast._showtoastmessageshow(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"success_save_details"),(long) (2),anywheresoftware.b4a.keywords.Common.True);
 //BA.debugLineNum = 708;BA.debugLine="Dim opAddress As OpenCart";
_opaddress = new com.apps.demo.opencart();
 //BA.debugLineNum = 709;BA.debugLine="opAddress.Initialize";
_opaddress._initialize(processBA);
 //BA.debugLineNum = 710;BA.debugLine="opAddress.ListAddressUser(Me,\"ListAddress_recei";
_opaddress._listaddressuser(actaccount.getObject(),"ListAddress_receive");
 //BA.debugLineNum = 711;BA.debugLine="Return";
if (true) return "";
 };
 };
 //BA.debugLineNum = 715;BA.debugLine="End Sub";
return "";
}
public static String  _getdetails_receive(anywheresoftware.b4a.objects.collections.Map _res,String _cat) throws Exception{
anywheresoftware.b4a.objects.collections.Map _ma = null;
String _date = "";
 //BA.debugLineNum = 452;BA.debugLine="Sub getDetails_receive(res As Map,cat As String)";
 //BA.debugLineNum = 454;BA.debugLine="ProgressDialogHide";
anywheresoftware.b4a.keywords.Common.ProgressDialogHide();
 //BA.debugLineNum = 455;BA.debugLine="pnlloading.SetVisibleAnimated(0,False)";
mostCurrent._pnlloading.SetVisibleAnimated((int) (0),anywheresoftware.b4a.keywords.Common.False);
 //BA.debugLineNum = 457;BA.debugLine="If res.ContainsKey(\"error\") Then";
if (_res.ContainsKey((Object)("error"))) { 
 //BA.debugLineNum = 458;BA.debugLine="If res.Get(\"error\") = \"User is not logged in\" Th";
if ((_res.Get((Object)("error"))).equals((Object)("User is not logged in"))) { 
 //BA.debugLineNum = 459;BA.debugLine="ToastMessageShow(Library.GetStringResourse(\"log";
anywheresoftware.b4a.keywords.Common.ToastMessageShow(BA.ObjectToCharSequence(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"login_force")),anywheresoftware.b4a.keywords.Common.False);
 //BA.debugLineNum = 460;BA.debugLine="CallSubDelayed(actMenu,\"Logout\")";
anywheresoftware.b4a.keywords.Common.CallSubDelayed(mostCurrent.activityBA,(Object)(mostCurrent._actmenu.getObject()),"Logout");
 //BA.debugLineNum = 461;BA.debugLine="Return";
if (true) return "";
 };
 };
 //BA.debugLineNum = 465;BA.debugLine="If res.Get(\"success\") Then";
if (BA.ObjectToBoolean(_res.Get((Object)("success")))) { 
 //BA.debugLineNum = 466;BA.debugLine="If res.Get(\"success\") = True Then";
if ((_res.Get((Object)("success"))).equals((Object)(anywheresoftware.b4a.keywords.Common.True))) { 
 //BA.debugLineNum = 468;BA.debugLine="Dim ma As Map";
_ma = new anywheresoftware.b4a.objects.collections.Map();
 //BA.debugLineNum = 469;BA.debugLine="ma = res.Get(\"data\")";
_ma.setObject((anywheresoftware.b4a.objects.collections.Map.MyMap)(_res.Get((Object)("data"))));
 //BA.debugLineNum = 470;BA.debugLine="txtname.Text = ma.Get(\"firstname\")";
mostCurrent._txtname.setText(BA.ObjectToCharSequence(_ma.Get((Object)("firstname"))));
 //BA.debugLineNum = 471;BA.debugLine="txtfamily.Text = ma.Get(\"lastname\")";
mostCurrent._txtfamily.setText(BA.ObjectToCharSequence(_ma.Get((Object)("lastname"))));
 //BA.debugLineNum = 472;BA.debugLine="txtemail.Text = ma.Get(\"email\")";
mostCurrent._txtemail.setText(BA.ObjectToCharSequence(_ma.Get((Object)("email"))));
 //BA.debugLineNum = 473;BA.debugLine="txtphone.Text = ma.Get(\"telephone\")";
mostCurrent._txtphone.setText(BA.ObjectToCharSequence(_ma.Get((Object)("telephone"))));
 //BA.debugLineNum = 474;BA.debugLine="txtfax.Text = ma.Get(\"fax\")";
mostCurrent._txtfax.setText(BA.ObjectToCharSequence(_ma.Get((Object)("fax"))));
 //BA.debugLineNum = 476;BA.debugLine="Dim date As String";
_date = "";
 //BA.debugLineNum = 477;BA.debugLine="date = ma.Get(\"date_added\")";
_date = BA.ObjectToString(_ma.Get((Object)("date_added")));
 //BA.debugLineNum = 479;BA.debugLine="If Library.IsPersian Then";
if (mostCurrent._library._ispersian(mostCurrent.activityBA)) { 
 //BA.debugLineNum = 480;BA.debugLine="lbldate.Text = Library.GetStringResourse(\"lbld";
mostCurrent._lbldate.setText(BA.ObjectToCharSequence(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"lbldate").replace("0",mostCurrent._library._getdate(mostCurrent.activityBA,_date))));
 }else {
 //BA.debugLineNum = 482;BA.debugLine="lbldate.Text = Library.GetStringResourse(\"lbld";
mostCurrent._lbldate.setText(BA.ObjectToCharSequence(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"lbldate").replace("0",_date)));
 };
 //BA.debugLineNum = 485;BA.debugLine="lblip.Text = Library.GetStringResourse(\"lblip\")";
mostCurrent._lblip.setText(BA.ObjectToCharSequence(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"lblip").replace("0",BA.ObjectToString(_ma.Get((Object)("ip"))))));
 //BA.debugLineNum = 487;BA.debugLine="tmrOpenMenu.Enabled = True";
_tmropenmenu.setEnabled(anywheresoftware.b4a.keywords.Common.True);
 //BA.debugLineNum = 489;BA.debugLine="btnprofile_Click";
_btnprofile_click();
 //BA.debugLineNum = 491;BA.debugLine="If ma.Get(\"newsletter\") = \"1\" Then";
if ((_ma.Get((Object)("newsletter"))).equals((Object)("1"))) { 
 //BA.debugLineNum = 492;BA.debugLine="rbno.Checked = True";
mostCurrent._rbno.setChecked(anywheresoftware.b4a.keywords.Common.True);
 //BA.debugLineNum = 493;BA.debugLine="rbyes.Visible = False";
mostCurrent._rbyes.setVisible(anywheresoftware.b4a.keywords.Common.False);
 //BA.debugLineNum = 494;BA.debugLine="rbno.Visible = True";
mostCurrent._rbno.setVisible(anywheresoftware.b4a.keywords.Common.True);
 //BA.debugLineNum = 495;BA.debugLine="lblnewsletteroption.Text = Library.GetStringRe";
mostCurrent._lblnewsletteroption.setText(BA.ObjectToCharSequence(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"scribe_state_1")));
 }else {
 //BA.debugLineNum = 497;BA.debugLine="rbyes.Checked = True";
mostCurrent._rbyes.setChecked(anywheresoftware.b4a.keywords.Common.True);
 //BA.debugLineNum = 498;BA.debugLine="rbno.Visible = False";
mostCurrent._rbno.setVisible(anywheresoftware.b4a.keywords.Common.False);
 //BA.debugLineNum = 499;BA.debugLine="rbyes.Visible = True";
mostCurrent._rbyes.setVisible(anywheresoftware.b4a.keywords.Common.True);
 //BA.debugLineNum = 500;BA.debugLine="lblnewsletteroption.Text = Library.GetStringRe";
mostCurrent._lblnewsletteroption.setText(BA.ObjectToCharSequence(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"scribe_state_0")));
 };
 }else {
 //BA.debugLineNum = 504;BA.debugLine="Activity.Finish";
mostCurrent._activity.Finish();
 };
 }else {
 //BA.debugLineNum = 508;BA.debugLine="Activity.Finish";
mostCurrent._activity.Finish();
 };
 //BA.debugLineNum = 511;BA.debugLine="End Sub";
return "";
}
public static String  _globals() throws Exception{
 //BA.debugLineNum = 11;BA.debugLine="Sub Globals";
 //BA.debugLineNum = 12;BA.debugLine="Private tab1 As TabHost";
mostCurrent._tab1 = new anywheresoftware.b4a.objects.TabHostWrapper();
 //BA.debugLineNum = 13;BA.debugLine="Dim sv1,svReturns As ScrollView";
mostCurrent._sv1 = new anywheresoftware.b4a.objects.ScrollViewWrapper();
mostCurrent._svreturns = new anywheresoftware.b4a.objects.ScrollViewWrapper();
 //BA.debugLineNum = 14;BA.debugLine="Private btnsave As Button";
mostCurrent._btnsave = new anywheresoftware.b4a.objects.ButtonWrapper();
 //BA.debugLineNum = 15;BA.debugLine="Private Label11 As Label";
mostCurrent._label11 = new anywheresoftware.b4a.objects.LabelWrapper();
 //BA.debugLineNum = 16;BA.debugLine="Private Label2 As Label";
mostCurrent._label2 = new anywheresoftware.b4a.objects.LabelWrapper();
 //BA.debugLineNum = 17;BA.debugLine="Private Label3 As Label";
mostCurrent._label3 = new anywheresoftware.b4a.objects.LabelWrapper();
 //BA.debugLineNum = 18;BA.debugLine="Private Label5 As Label";
mostCurrent._label5 = new anywheresoftware.b4a.objects.LabelWrapper();
 //BA.debugLineNum = 19;BA.debugLine="Private Label7 As Label";
mostCurrent._label7 = new anywheresoftware.b4a.objects.LabelWrapper();
 //BA.debugLineNum = 20;BA.debugLine="Private Label9 As Label";
mostCurrent._label9 = new anywheresoftware.b4a.objects.LabelWrapper();
 //BA.debugLineNum = 21;BA.debugLine="Private lbldate As Label";
mostCurrent._lbldate = new anywheresoftware.b4a.objects.LabelWrapper();
 //BA.debugLineNum = 22;BA.debugLine="Private lblemail As Label";
mostCurrent._lblemail = new anywheresoftware.b4a.objects.LabelWrapper();
 //BA.debugLineNum = 23;BA.debugLine="Private lblfamily As Label";
mostCurrent._lblfamily = new anywheresoftware.b4a.objects.LabelWrapper();
 //BA.debugLineNum = 24;BA.debugLine="Private lblfax As Label";
mostCurrent._lblfax = new anywheresoftware.b4a.objects.LabelWrapper();
 //BA.debugLineNum = 25;BA.debugLine="Private lblip As Label";
mostCurrent._lblip = new anywheresoftware.b4a.objects.LabelWrapper();
 //BA.debugLineNum = 26;BA.debugLine="Private lblname As Label";
mostCurrent._lblname = new anywheresoftware.b4a.objects.LabelWrapper();
 //BA.debugLineNum = 27;BA.debugLine="Private lblpassword As Label";
mostCurrent._lblpassword = new anywheresoftware.b4a.objects.LabelWrapper();
 //BA.debugLineNum = 28;BA.debugLine="Private lblphone As Label";
mostCurrent._lblphone = new anywheresoftware.b4a.objects.LabelWrapper();
 //BA.debugLineNum = 29;BA.debugLine="Private txtemail As EditText";
mostCurrent._txtemail = new anywheresoftware.b4a.objects.EditTextWrapper();
 //BA.debugLineNum = 30;BA.debugLine="Private txtfamily As EditText";
mostCurrent._txtfamily = new anywheresoftware.b4a.objects.EditTextWrapper();
 //BA.debugLineNum = 31;BA.debugLine="Private txtfax As EditText";
mostCurrent._txtfax = new anywheresoftware.b4a.objects.EditTextWrapper();
 //BA.debugLineNum = 32;BA.debugLine="Private txtname As EditText";
mostCurrent._txtname = new anywheresoftware.b4a.objects.EditTextWrapper();
 //BA.debugLineNum = 33;BA.debugLine="Private txtpassword As EditText";
mostCurrent._txtpassword = new anywheresoftware.b4a.objects.EditTextWrapper();
 //BA.debugLineNum = 34;BA.debugLine="Private txtphone As EditText";
mostCurrent._txtphone = new anywheresoftware.b4a.objects.EditTextWrapper();
 //BA.debugLineNum = 35;BA.debugLine="Private Panel1 As Panel";
mostCurrent._panel1 = new anywheresoftware.b4a.objects.PanelWrapper();
 //BA.debugLineNum = 36;BA.debugLine="Private btnpassword As Button";
mostCurrent._btnpassword = new anywheresoftware.b4a.objects.ButtonWrapper();
 //BA.debugLineNum = 37;BA.debugLine="Private lblcountry As Label";
mostCurrent._lblcountry = new anywheresoftware.b4a.objects.LabelWrapper();
 //BA.debugLineNum = 38;BA.debugLine="Private txtcountry As Spinner";
mostCurrent._txtcountry = new anywheresoftware.b4a.objects.SpinnerWrapper();
 //BA.debugLineNum = 39;BA.debugLine="Private lblcity As Label";
mostCurrent._lblcity = new anywheresoftware.b4a.objects.LabelWrapper();
 //BA.debugLineNum = 40;BA.debugLine="Private txtcity As Spinner";
mostCurrent._txtcity = new anywheresoftware.b4a.objects.SpinnerWrapper();
 //BA.debugLineNum = 41;BA.debugLine="Private lbladdress As Label";
mostCurrent._lbladdress = new anywheresoftware.b4a.objects.LabelWrapper();
 //BA.debugLineNum = 42;BA.debugLine="Private btnadd As Button";
mostCurrent._btnadd = new anywheresoftware.b4a.objects.ButtonWrapper();
 //BA.debugLineNum = 43;BA.debugLine="Private listCity,listCountries As List";
mostCurrent._listcity = new anywheresoftware.b4a.objects.collections.List();
mostCurrent._listcountries = new anywheresoftware.b4a.objects.collections.List();
 //BA.debugLineNum = 44;BA.debugLine="Private txtaddress As EditText";
mostCurrent._txtaddress = new anywheresoftware.b4a.objects.EditTextWrapper();
 //BA.debugLineNum = 45;BA.debugLine="Private lvAddress,listCountry As ListView";
mostCurrent._lvaddress = new anywheresoftware.b4a.objects.ListViewWrapper();
mostCurrent._listcountry = new anywheresoftware.b4a.objects.ListViewWrapper();
 //BA.debugLineNum = 46;BA.debugLine="Dim svOrder As ScrollView";
mostCurrent._svorder = new anywheresoftware.b4a.objects.ScrollViewWrapper();
 //BA.debugLineNum = 47;BA.debugLine="Private lblid As Label";
mostCurrent._lblid = new anywheresoftware.b4a.objects.LabelWrapper();
 //BA.debugLineNum = 48;BA.debugLine="Private lblstate2 As Label";
mostCurrent._lblstate2 = new anywheresoftware.b4a.objects.LabelWrapper();
 //BA.debugLineNum = 49;BA.debugLine="Private btndetails As Button";
mostCurrent._btndetails = new anywheresoftware.b4a.objects.ButtonWrapper();
 //BA.debugLineNum = 50;BA.debugLine="Private pnlorder As Panel";
mostCurrent._pnlorder = new anywheresoftware.b4a.objects.PanelWrapper();
 //BA.debugLineNum = 51;BA.debugLine="Private btnadd_address As Button";
mostCurrent._btnadd_address = new anywheresoftware.b4a.objects.ButtonWrapper();
 //BA.debugLineNum = 52;BA.debugLine="Private pnlnew_address As Panel";
mostCurrent._pnlnew_address = new anywheresoftware.b4a.objects.PanelWrapper();
 //BA.debugLineNum = 53;BA.debugLine="Private btncancel_new_address As Button";
mostCurrent._btncancel_new_address = new anywheresoftware.b4a.objects.ButtonWrapper();
 //BA.debugLineNum = 54;BA.debugLine="Private lblpostal_enter As Label";
mostCurrent._lblpostal_enter = new anywheresoftware.b4a.objects.LabelWrapper();
 //BA.debugLineNum = 55;BA.debugLine="Private txtpostal_enter As EditText";
mostCurrent._txtpostal_enter = new anywheresoftware.b4a.objects.EditTextWrapper();
 //BA.debugLineNum = 56;BA.debugLine="Private listAddressCache As Map";
mostCurrent._listaddresscache = new anywheresoftware.b4a.objects.collections.Map();
 //BA.debugLineNum = 57;BA.debugLine="Private ChoosenAddress4Edit As Int";
_choosenaddress4edit = 0;
 //BA.debugLineNum = 58;BA.debugLine="Private lbldefault As Label";
mostCurrent._lbldefault = new anywheresoftware.b4a.objects.LabelWrapper();
 //BA.debugLineNum = 59;BA.debugLine="Private listAddressID As List";
mostCurrent._listaddressid = new anywheresoftware.b4a.objects.collections.List();
 //BA.debugLineNum = 60;BA.debugLine="Private choosenCity As String";
mostCurrent._choosencity = "";
 //BA.debugLineNum = 61;BA.debugLine="Private pnlmenu As Panel";
mostCurrent._pnlmenu = new anywheresoftware.b4a.objects.PanelWrapper();
 //BA.debugLineNum = 62;BA.debugLine="Private toast As MyToastMessageShow";
mostCurrent._toast = new com.apps.demo.mytoastmessageshow();
 //BA.debugLineNum = 63;BA.debugLine="Private pnlloading As Panel";
mostCurrent._pnlloading = new anywheresoftware.b4a.objects.PanelWrapper();
 //BA.debugLineNum = 64;BA.debugLine="Private lblpb As Label";
mostCurrent._lblpb = new anywheresoftware.b4a.objects.LabelWrapper();
 //BA.debugLineNum = 65;BA.debugLine="Private pnlmain As Panel";
mostCurrent._pnlmain = new anywheresoftware.b4a.objects.PanelWrapper();
 //BA.debugLineNum = 66;BA.debugLine="Private SubscribeState As String";
mostCurrent._subscribestate = "";
 //BA.debugLineNum = 67;BA.debugLine="Private lblreturn_title As Label";
mostCurrent._lblreturn_title = new anywheresoftware.b4a.objects.LabelWrapper();
 //BA.debugLineNum = 68;BA.debugLine="Private lblreturn_state As Label";
mostCurrent._lblreturn_state = new anywheresoftware.b4a.objects.LabelWrapper();
 //BA.debugLineNum = 69;BA.debugLine="Private btnreturn_details As Button";
mostCurrent._btnreturn_details = new anywheresoftware.b4a.objects.ButtonWrapper();
 //BA.debugLineNum = 70;BA.debugLine="Private lblprofile As Label";
mostCurrent._lblprofile = new anywheresoftware.b4a.objects.LabelWrapper();
 //BA.debugLineNum = 71;BA.debugLine="Private lblorders As Label";
mostCurrent._lblorders = new anywheresoftware.b4a.objects.LabelWrapper();
 //BA.debugLineNum = 72;BA.debugLine="Private lblnewaddress1 As Label";
mostCurrent._lblnewaddress1 = new anywheresoftware.b4a.objects.LabelWrapper();
 //BA.debugLineNum = 73;BA.debugLine="Private lblnewsletter As Label";
mostCurrent._lblnewsletter = new anywheresoftware.b4a.objects.LabelWrapper();
 //BA.debugLineNum = 74;BA.debugLine="Private lblreturns As Label";
mostCurrent._lblreturns = new anywheresoftware.b4a.objects.LabelWrapper();
 //BA.debugLineNum = 75;BA.debugLine="Private btnprofile As Button";
mostCurrent._btnprofile = new anywheresoftware.b4a.objects.ButtonWrapper();
 //BA.debugLineNum = 76;BA.debugLine="Private btnpasswords As Button";
mostCurrent._btnpasswords = new anywheresoftware.b4a.objects.ButtonWrapper();
 //BA.debugLineNum = 77;BA.debugLine="Private btnorders As Button";
mostCurrent._btnorders = new anywheresoftware.b4a.objects.ButtonWrapper();
 //BA.debugLineNum = 78;BA.debugLine="Private btnaddress As Button";
mostCurrent._btnaddress = new anywheresoftware.b4a.objects.ButtonWrapper();
 //BA.debugLineNum = 79;BA.debugLine="Private btnscribe As Button";
mostCurrent._btnscribe = new anywheresoftware.b4a.objects.ButtonWrapper();
 //BA.debugLineNum = 80;BA.debugLine="Private btnreturns As Button";
mostCurrent._btnreturns = new anywheresoftware.b4a.objects.ButtonWrapper();
 //BA.debugLineNum = 81;BA.debugLine="Private lblnewaddress As Label";
mostCurrent._lblnewaddress = new anywheresoftware.b4a.objects.LabelWrapper();
 //BA.debugLineNum = 82;BA.debugLine="Private lblpasswords As Label";
mostCurrent._lblpasswords = new anywheresoftware.b4a.objects.LabelWrapper();
 //BA.debugLineNum = 83;BA.debugLine="Private lbladdress1 As Label";
mostCurrent._lbladdress1 = new anywheresoftware.b4a.objects.LabelWrapper();
 //BA.debugLineNum = 84;BA.debugLine="Private lblnewsletteroption As Label";
mostCurrent._lblnewsletteroption = new anywheresoftware.b4a.objects.LabelWrapper();
 //BA.debugLineNum = 85;BA.debugLine="Private rbyes As RadioButton";
mostCurrent._rbyes = new anywheresoftware.b4a.objects.CompoundButtonWrapper.RadioButtonWrapper();
 //BA.debugLineNum = 86;BA.debugLine="Private rbno As RadioButton";
mostCurrent._rbno = new anywheresoftware.b4a.objects.CompoundButtonWrapper.RadioButtonWrapper();
 //BA.debugLineNum = 87;BA.debugLine="Private btnapply_newsletter As Button";
mostCurrent._btnapply_newsletter = new anywheresoftware.b4a.objects.ButtonWrapper();
 //BA.debugLineNum = 88;BA.debugLine="Private pnlaction As Panel";
mostCurrent._pnlaction = new anywheresoftware.b4a.objects.PanelWrapper();
 //BA.debugLineNum = 89;BA.debugLine="Private lbldefault_address As Label";
mostCurrent._lbldefault_address = new anywheresoftware.b4a.objects.LabelWrapper();
 //BA.debugLineNum = 90;BA.debugLine="Private lbledit_address As Label";
mostCurrent._lbledit_address = new anywheresoftware.b4a.objects.LabelWrapper();
 //BA.debugLineNum = 91;BA.debugLine="Private lbldelete_address As Label";
mostCurrent._lbldelete_address = new anywheresoftware.b4a.objects.LabelWrapper();
 //BA.debugLineNum = 92;BA.debugLine="Private ChoosenAddressID,ChoosenAddressValue As S";
mostCurrent._choosenaddressid = "";
mostCurrent._choosenaddressvalue = "";
 //BA.debugLineNum = 93;BA.debugLine="Private btnback_menu As Button";
mostCurrent._btnback_menu = new anywheresoftware.b4a.objects.ButtonWrapper();
 //BA.debugLineNum = 94;BA.debugLine="Private lblback_menu As Label";
mostCurrent._lblback_menu = new anywheresoftware.b4a.objects.LabelWrapper();
 //BA.debugLineNum = 95;BA.debugLine="Private lblpassword_title As Label";
mostCurrent._lblpassword_title = new anywheresoftware.b4a.objects.LabelWrapper();
 //BA.debugLineNum = 96;BA.debugLine="Private txtpassword2 As EditText";
mostCurrent._txtpassword2 = new anywheresoftware.b4a.objects.EditTextWrapper();
 //BA.debugLineNum = 97;BA.debugLine="Private lblpassword2 As Label";
mostCurrent._lblpassword2 = new anywheresoftware.b4a.objects.LabelWrapper();
 //BA.debugLineNum = 98;BA.debugLine="Private lbldivider_return As Label";
mostCurrent._lbldivider_return = new anywheresoftware.b4a.objects.LabelWrapper();
 //BA.debugLineNum = 99;BA.debugLine="Private pnldetails_return As Panel";
mostCurrent._pnldetails_return = new anywheresoftware.b4a.objects.PanelWrapper();
 //BA.debugLineNum = 100;BA.debugLine="Private sv_return_details As ScrollView";
mostCurrent._sv_return_details = new anywheresoftware.b4a.objects.ScrollViewWrapper();
 //BA.debugLineNum = 101;BA.debugLine="Private btncancel_return As Button";
mostCurrent._btncancel_return = new anywheresoftware.b4a.objects.ButtonWrapper();
 //BA.debugLineNum = 102;BA.debugLine="End Sub";
return "";
}
public static String  _listaddress_receive(anywheresoftware.b4a.objects.collections.Map _res,String _cat) throws Exception{
anywheresoftware.b4a.objects.collections.Map _d1 = null;
int _i = 0;
anywheresoftware.b4a.objects.collections.Map _temp = null;
 //BA.debugLineNum = 345;BA.debugLine="Sub ListAddress_receive(res As Map,cat As String)";
 //BA.debugLineNum = 347;BA.debugLine="pnlloading.SetVisibleAnimated(500,False)";
mostCurrent._pnlloading.SetVisibleAnimated((int) (500),anywheresoftware.b4a.keywords.Common.False);
 //BA.debugLineNum = 349;BA.debugLine="If res.ContainsKey(\"success\") Then";
if (_res.ContainsKey((Object)("success"))) { 
 //BA.debugLineNum = 350;BA.debugLine="If res.Get(\"success\") = True Then";
if ((_res.Get((Object)("success"))).equals((Object)(anywheresoftware.b4a.keywords.Common.True))) { 
 //BA.debugLineNum = 351;BA.debugLine="Dim d1 As Map";
_d1 = new anywheresoftware.b4a.objects.collections.Map();
 //BA.debugLineNum = 352;BA.debugLine="d1 = res.Get(\"data\")";
_d1.setObject((anywheresoftware.b4a.objects.collections.Map.MyMap)(_res.Get((Object)("data"))));
 //BA.debugLineNum = 353;BA.debugLine="d1 = d1.Get(\"addresses\")";
_d1.setObject((anywheresoftware.b4a.objects.collections.Map.MyMap)(_d1.Get((Object)("addresses"))));
 //BA.debugLineNum = 355;BA.debugLine="listAddressCache = d1";
mostCurrent._listaddresscache = _d1;
 //BA.debugLineNum = 357;BA.debugLine="lvAddress.Clear";
mostCurrent._lvaddress.Clear();
 //BA.debugLineNum = 358;BA.debugLine="listAddressID.Initialize";
mostCurrent._listaddressid.Initialize();
 //BA.debugLineNum = 360;BA.debugLine="For i = 0 To d1.Size - 1";
{
final int step10 = 1;
final int limit10 = (int) (_d1.getSize()-1);
for (_i = (int) (0) ; (step10 > 0 && _i <= limit10) || (step10 < 0 && _i >= limit10); _i = ((int)(0 + _i + step10)) ) {
 //BA.debugLineNum = 362;BA.debugLine="Dim temp As Map";
_temp = new anywheresoftware.b4a.objects.collections.Map();
 //BA.debugLineNum = 363;BA.debugLine="temp = d1.Get(d1.GetKeyAt(i))";
_temp.setObject((anywheresoftware.b4a.objects.collections.Map.MyMap)(_d1.Get(_d1.GetKeyAt(_i))));
 //BA.debugLineNum = 365;BA.debugLine="lvAddress.AddSingleLine($\"${temp.Get(\"country\"";
mostCurrent._lvaddress.AddSingleLine(BA.ObjectToCharSequence((""+anywheresoftware.b4a.keywords.Common.SmartStringFormatter("",_temp.Get((Object)("country")))+" "+anywheresoftware.b4a.keywords.Common.SmartStringFormatter("",_temp.Get((Object)("city")))+" "+anywheresoftware.b4a.keywords.Common.SmartStringFormatter("",_temp.Get((Object)("address_1")))+"")));
 //BA.debugLineNum = 366;BA.debugLine="listAddressID.Add(temp.Get(\"address_id\"))";
mostCurrent._listaddressid.Add(_temp.Get((Object)("address_id")));
 }
};
 //BA.debugLineNum = 370;BA.debugLine="If ChoosenTab = \"address\" Then";
if ((_choosentab).equals("address")) { 
 //BA.debugLineNum = 371;BA.debugLine="tab1.CurrentTab = 2";
mostCurrent._tab1.setCurrentTab((int) (2));
 //BA.debugLineNum = 372;BA.debugLine="ChoosenTab = \"\"";
_choosentab = "";
 };
 //BA.debugLineNum = 375;BA.debugLine="Return";
if (true) return "";
 };
 };
 //BA.debugLineNum = 380;BA.debugLine="End Sub";
return "";
}
public static String  _lvaddress_itemclick(int _position,Object _value) throws Exception{
 //BA.debugLineNum = 788;BA.debugLine="Sub lvAddress_ItemClick (Position As Int, Value As";
 //BA.debugLineNum = 790;BA.debugLine="ChoosenAddressID = listAddressID.Get(Position)";
mostCurrent._choosenaddressid = BA.ObjectToString(mostCurrent._listaddressid.Get(_position));
 //BA.debugLineNum = 791;BA.debugLine="ChoosenAddressValue = Value";
mostCurrent._choosenaddressvalue = BA.ObjectToString(_value);
 //BA.debugLineNum = 792;BA.debugLine="pnlaction.SetLayoutAnimated(600,0,Activity.Height";
mostCurrent._pnlaction.SetLayoutAnimated((int) (600),(int) (0),(int) (mostCurrent._activity.getHeight()-mostCurrent._pnlaction.getHeight()),mostCurrent._pnlaction.getWidth(),mostCurrent._pnlaction.getHeight());
 //BA.debugLineNum = 794;BA.debugLine="End Sub";
return "";
}
public static String  _orders_receive(anywheresoftware.b4a.objects.collections.Map _res,String _cat) throws Exception{
anywheresoftware.b4a.objects.collections.Map _m1 = null;
anywheresoftware.b4a.objects.collections.List _l1 = null;
int _top = 0;
int _i = 0;
anywheresoftware.b4a.objects.collections.Map _temp = null;
anywheresoftware.b4a.objects.PanelWrapper _p1 = null;
 //BA.debugLineNum = 282;BA.debugLine="Sub Orders_receive(res As Map,cat As String)";
 //BA.debugLineNum = 284;BA.debugLine="pnlloading.SetVisibleAnimated(500,False)";
mostCurrent._pnlloading.SetVisibleAnimated((int) (500),anywheresoftware.b4a.keywords.Common.False);
 //BA.debugLineNum = 286;BA.debugLine="If res.ContainsKey(\"success\") Then";
if (_res.ContainsKey((Object)("success"))) { 
 //BA.debugLineNum = 288;BA.debugLine="If res.Get(\"success\") = True Then";
if ((_res.Get((Object)("success"))).equals((Object)(anywheresoftware.b4a.keywords.Common.True))) { 
 //BA.debugLineNum = 289;BA.debugLine="Dim m1 As Map";
_m1 = new anywheresoftware.b4a.objects.collections.Map();
 //BA.debugLineNum = 290;BA.debugLine="m1.Initialize";
_m1.Initialize();
 //BA.debugLineNum = 291;BA.debugLine="m1 = res.Get(\"data\")";
_m1.setObject((anywheresoftware.b4a.objects.collections.Map.MyMap)(_res.Get((Object)("data"))));
 //BA.debugLineNum = 293;BA.debugLine="Dim l1 As List";
_l1 = new anywheresoftware.b4a.objects.collections.List();
 //BA.debugLineNum = 294;BA.debugLine="l1 = m1.Get(\"orders\")";
_l1.setObject((java.util.List)(_m1.Get((Object)("orders"))));
 //BA.debugLineNum = 296;BA.debugLine="Dim top As Int";
_top = 0;
 //BA.debugLineNum = 297;BA.debugLine="top = 0";
_top = (int) (0);
 //BA.debugLineNum = 298;BA.debugLine="svOrder.Panel.Color = Colors.White";
mostCurrent._svorder.getPanel().setColor(anywheresoftware.b4a.keywords.Common.Colors.White);
 //BA.debugLineNum = 300;BA.debugLine="For i = 0 To l1.Size - 1";
{
final int step12 = 1;
final int limit12 = (int) (_l1.getSize()-1);
for (_i = (int) (0) ; (step12 > 0 && _i <= limit12) || (step12 < 0 && _i >= limit12); _i = ((int)(0 + _i + step12)) ) {
 //BA.debugLineNum = 302;BA.debugLine="Dim temp As Map";
_temp = new anywheresoftware.b4a.objects.collections.Map();
 //BA.debugLineNum = 303;BA.debugLine="temp = l1.Get(i)";
_temp.setObject((anywheresoftware.b4a.objects.collections.Map.MyMap)(_l1.Get(_i)));
 //BA.debugLineNum = 305;BA.debugLine="Dim p1 As Panel";
_p1 = new anywheresoftware.b4a.objects.PanelWrapper();
 //BA.debugLineNum = 306;BA.debugLine="p1.Initialize(\"\")";
_p1.Initialize(mostCurrent.activityBA,"");
 //BA.debugLineNum = 308;BA.debugLine="svOrder.Panel.AddView(p1,-10,top,svOrder.Width";
mostCurrent._svorder.getPanel().AddView((android.view.View)(_p1.getObject()),(int) (-10),_top,mostCurrent._svorder.getWidth(),(int) (0));
 //BA.debugLineNum = 310;BA.debugLine="If Library.IsPersian Then";
if (mostCurrent._library._ispersian(mostCurrent.activityBA)) { 
 //BA.debugLineNum = 311;BA.debugLine="p1.LoadLayout(\"frmtemplate_order\")";
_p1.LoadLayout("frmtemplate_order",mostCurrent.activityBA);
 //BA.debugLineNum = 312;BA.debugLine="lbldate.Text = Library.GetDate(temp.Get(\"date";
mostCurrent._lbldate.setText(BA.ObjectToCharSequence(mostCurrent._library._getdate(mostCurrent.activityBA,BA.ObjectToString(_temp.Get((Object)("date_added"))))));
 }else {
 //BA.debugLineNum = 314;BA.debugLine="p1.LoadLayout(\"frmtemplate_order_en\")";
_p1.LoadLayout("frmtemplate_order_en",mostCurrent.activityBA);
 //BA.debugLineNum = 315;BA.debugLine="lbldate.Text = temp.Get(\"date_added\")";
mostCurrent._lbldate.setText(BA.ObjectToCharSequence(_temp.Get((Object)("date_added"))));
 };
 //BA.debugLineNum = 318;BA.debugLine="btndetails.Background = Library.GetButtonState";
mostCurrent._btndetails.setBackground((android.graphics.drawable.Drawable)(mostCurrent._library._getbuttonstateontheme(mostCurrent.activityBA,(int) (7)).getObject()));
 //BA.debugLineNum = 319;BA.debugLine="p1.Color = Colors.White";
_p1.setColor(anywheresoftware.b4a.keywords.Common.Colors.White);
 //BA.debugLineNum = 320;BA.debugLine="pnlorder.Color = Colors.White";
mostCurrent._pnlorder.setColor(anywheresoftware.b4a.keywords.Common.Colors.White);
 //BA.debugLineNum = 321;BA.debugLine="p1.Height = pnlorder.Height + 10";
_p1.setHeight((int) (mostCurrent._pnlorder.getHeight()+10));
 //BA.debugLineNum = 323;BA.debugLine="lblid.Text = Library.GetStringResourse(\"order_";
mostCurrent._lblid.setText(BA.ObjectToCharSequence(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"order_id").replace("0",BA.ObjectToString(_temp.Get((Object)("order_id")))).replace("1","")));
 //BA.debugLineNum = 324;BA.debugLine="lblstate2.Text = temp.Get(\"status\")";
mostCurrent._lblstate2.setText(BA.ObjectToCharSequence(_temp.Get((Object)("status"))));
 //BA.debugLineNum = 325;BA.debugLine="btndetails.Text = Library.GetStringResourse(\"o";
mostCurrent._btndetails.setText(BA.ObjectToCharSequence(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"order_details")));
 //BA.debugLineNum = 326;BA.debugLine="btndetails.Tag = temp.Get(\"order_id\")";
mostCurrent._btndetails.setTag(_temp.Get((Object)("order_id")));
 //BA.debugLineNum = 328;BA.debugLine="top = top + p1.Height + 10";
_top = (int) (_top+_p1.getHeight()+10);
 }
};
 //BA.debugLineNum = 332;BA.debugLine="svOrder.Panel.Height = top + 150dip";
mostCurrent._svorder.getPanel().setHeight((int) (_top+anywheresoftware.b4a.keywords.Common.DipToCurrent((int) (150))));
 //BA.debugLineNum = 334;BA.debugLine="If ChoosenTab = \"order\" Then";
if ((_choosentab).equals("order")) { 
 //BA.debugLineNum = 335;BA.debugLine="tab1.CurrentTab = 1";
mostCurrent._tab1.setCurrentTab((int) (1));
 };
 //BA.debugLineNum = 338;BA.debugLine="Return";
if (true) return "";
 };
 };
 //BA.debugLineNum = 343;BA.debugLine="End Sub";
return "";
}
public static String  _process_globals() throws Exception{
 //BA.debugLineNum = 6;BA.debugLine="Sub Process_Globals";
 //BA.debugLineNum = 7;BA.debugLine="Public ChoosenTab As String";
_choosentab = "";
 //BA.debugLineNum = 8;BA.debugLine="Private tmrOpenMenu As Timer";
_tmropenmenu = new anywheresoftware.b4a.objects.Timer();
 //BA.debugLineNum = 9;BA.debugLine="End Sub";
return "";
}
public static String  _returndetails_receive(anywheresoftware.b4a.objects.collections.Map _res,String _cat) throws Exception{
anywheresoftware.b4a.objects.collections.Map _data = null;
int _top = 0;
int _i = 0;
anywheresoftware.b4a.objects.LabelWrapper _lblkey = null;
anywheresoftware.b4a.objects.LabelWrapper _lblval = null;
anywheresoftware.b4a.objects.LabelWrapper _divider = null;
 //BA.debugLineNum = 1043;BA.debugLine="Sub returndetails_receive(res As Map,cat As String";
 //BA.debugLineNum = 1045;BA.debugLine="pnlloading.SetVisibleAnimated(500,False)";
mostCurrent._pnlloading.SetVisibleAnimated((int) (500),anywheresoftware.b4a.keywords.Common.False);
 //BA.debugLineNum = 1047;BA.debugLine="sv_return_details.Panel.RemoveAllViews";
mostCurrent._sv_return_details.getPanel().RemoveAllViews();
 //BA.debugLineNum = 1049;BA.debugLine="If res.ContainsKey(\"success\") Then";
if (_res.ContainsKey((Object)("success"))) { 
 //BA.debugLineNum = 1050;BA.debugLine="If res.Get(\"success\") = True Then";
if ((_res.Get((Object)("success"))).equals((Object)(anywheresoftware.b4a.keywords.Common.True))) { 
 //BA.debugLineNum = 1051;BA.debugLine="Dim data As Map";
_data = new anywheresoftware.b4a.objects.collections.Map();
 //BA.debugLineNum = 1052;BA.debugLine="data = res.Get(\"data\")";
_data.setObject((anywheresoftware.b4a.objects.collections.Map.MyMap)(_res.Get((Object)("data"))));
 //BA.debugLineNum = 1054;BA.debugLine="Dim top As Int";
_top = 0;
 //BA.debugLineNum = 1055;BA.debugLine="sv_return_details.Color = Colors.White";
mostCurrent._sv_return_details.setColor(anywheresoftware.b4a.keywords.Common.Colors.White);
 //BA.debugLineNum = 1056;BA.debugLine="sv_return_details.Panel.Color = Colors.White";
mostCurrent._sv_return_details.getPanel().setColor(anywheresoftware.b4a.keywords.Common.Colors.White);
 //BA.debugLineNum = 1058;BA.debugLine="For i = 0 To data.Size - 1";
{
final int step10 = 1;
final int limit10 = (int) (_data.getSize()-1);
for (_i = (int) (0) ; (step10 > 0 && _i <= limit10) || (step10 < 0 && _i >= limit10); _i = ((int)(0 + _i + step10)) ) {
 //BA.debugLineNum = 1060;BA.debugLine="If data.GetValueAt(i) Is List Then Continue";
if (_data.GetValueAt(_i) instanceof java.util.List) { 
if (true) continue;};
 //BA.debugLineNum = 1062;BA.debugLine="Dim lblKey As Label";
_lblkey = new anywheresoftware.b4a.objects.LabelWrapper();
 //BA.debugLineNum = 1063;BA.debugLine="lblKey.Initialize(\"\")";
_lblkey.Initialize(mostCurrent.activityBA,"");
 //BA.debugLineNum = 1064;BA.debugLine="lblKey.Color = Colors.RGB(234,234,234)";
_lblkey.setColor(anywheresoftware.b4a.keywords.Common.Colors.RGB((int) (234),(int) (234),(int) (234)));
 //BA.debugLineNum = 1066;BA.debugLine="lblKey.TextSize = 14";
_lblkey.setTextSize((float) (14));
 //BA.debugLineNum = 1067;BA.debugLine="lblKey.TextColor = Colors.Black";
_lblkey.setTextColor(anywheresoftware.b4a.keywords.Common.Colors.Black);
 //BA.debugLineNum = 1069;BA.debugLine="lblKey.Typeface = Library.GetFont";
_lblkey.setTypeface((android.graphics.Typeface)(mostCurrent._library._getfont(mostCurrent.activityBA).getObject()));
 //BA.debugLineNum = 1070;BA.debugLine="lblKey.Text = Library.GetStringResourse(\"retu";
_lblkey.setText(BA.ObjectToCharSequence(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"return_item_"+BA.ObjectToString(_data.GetKeyAt(_i)))));
 //BA.debugLineNum = 1072;BA.debugLine="If lblKey.Text = \"null\" Then lblKey.Text = \"-";
if ((_lblkey.getText()).equals("null")) { 
_lblkey.setText(BA.ObjectToCharSequence("-"));};
 //BA.debugLineNum = 1074;BA.debugLine="lblKey.Gravity = Library.GetStringResourse(\"d";
_lblkey.setGravity((int)(Double.parseDouble(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"direction"))));
 //BA.debugLineNum = 1075;BA.debugLine="Library.PaddingLabel(lblKey,10,0,10,0)";
mostCurrent._library._paddinglabel(mostCurrent.activityBA,_lblkey,(int) (10),(int) (0),(int) (10),(int) (0));
 //BA.debugLineNum = 1077;BA.debugLine="sv_return_details.Panel.AddView(lblKey,0,top,";
mostCurrent._sv_return_details.getPanel().AddView((android.view.View)(_lblkey.getObject()),(int) (0),_top,mostCurrent._sv_return_details.getWidth(),anywheresoftware.b4a.keywords.Common.DipToCurrent((int) (40)));
 //BA.debugLineNum = 1078;BA.debugLine="top = top + 40dip";
_top = (int) (_top+anywheresoftware.b4a.keywords.Common.DipToCurrent((int) (40)));
 //BA.debugLineNum = 1080;BA.debugLine="Dim lblVal As Label";
_lblval = new anywheresoftware.b4a.objects.LabelWrapper();
 //BA.debugLineNum = 1081;BA.debugLine="lblVal.Initialize(\"\")";
_lblval.Initialize(mostCurrent.activityBA,"");
 //BA.debugLineNum = 1082;BA.debugLine="lblVal.Color = Colors.Rgb(222,223,223)";
_lblval.setColor(anywheresoftware.b4a.keywords.Common.Colors.RGB((int) (222),(int) (223),(int) (223)));
 //BA.debugLineNum = 1084;BA.debugLine="lblVal.TextSize = 12";
_lblval.setTextSize((float) (12));
 //BA.debugLineNum = 1085;BA.debugLine="lblVal.TextColor = Colors.Black";
_lblval.setTextColor(anywheresoftware.b4a.keywords.Common.Colors.Black);
 //BA.debugLineNum = 1086;BA.debugLine="lblVal.Text = data.GetValueAt(i)";
_lblval.setText(BA.ObjectToCharSequence(_data.GetValueAt(_i)));
 //BA.debugLineNum = 1088;BA.debugLine="lblVal.Typeface = Library.GetFont";
_lblval.setTypeface((android.graphics.Typeface)(mostCurrent._library._getfont(mostCurrent.activityBA).getObject()));
 //BA.debugLineNum = 1090;BA.debugLine="If lblVal.Text = \"null\" Then lblVal.Text = \"-";
if ((_lblval.getText()).equals("null")) { 
_lblval.setText(BA.ObjectToCharSequence("-"));};
 //BA.debugLineNum = 1092;BA.debugLine="lblVal.Gravity = Library.GetStringResourse(\"d";
_lblval.setGravity((int)(Double.parseDouble(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"direction"))));
 //BA.debugLineNum = 1093;BA.debugLine="Library.PaddingLabel(lblVal,10,0,10,0)";
mostCurrent._library._paddinglabel(mostCurrent.activityBA,_lblval,(int) (10),(int) (0),(int) (10),(int) (0));
 //BA.debugLineNum = 1095;BA.debugLine="sv_return_details.Panel.AddView(lblVal,0,top,";
mostCurrent._sv_return_details.getPanel().AddView((android.view.View)(_lblval.getObject()),(int) (0),_top,mostCurrent._sv_return_details.getWidth(),anywheresoftware.b4a.keywords.Common.DipToCurrent((int) (40)));
 //BA.debugLineNum = 1096;BA.debugLine="top = top + 47dip";
_top = (int) (_top+anywheresoftware.b4a.keywords.Common.DipToCurrent((int) (47)));
 //BA.debugLineNum = 1098;BA.debugLine="Dim divider As Label";
_divider = new anywheresoftware.b4a.objects.LabelWrapper();
 //BA.debugLineNum = 1099;BA.debugLine="divider.Initialize(\"\")";
_divider.Initialize(mostCurrent.activityBA,"");
 //BA.debugLineNum = 1100;BA.debugLine="sv_return_details.Panel.AddView(divider,7,top";
mostCurrent._sv_return_details.getPanel().AddView((android.view.View)(_divider.getObject()),(int) (7),_top,(int) (mostCurrent._sv_return_details.getWidth()-10),anywheresoftware.b4a.keywords.Common.DipToCurrent((int) (1)));
 //BA.debugLineNum = 1101;BA.debugLine="divider.Color = Colors.RGB(242,242,242)";
_divider.setColor(anywheresoftware.b4a.keywords.Common.Colors.RGB((int) (242),(int) (242),(int) (242)));
 //BA.debugLineNum = 1102;BA.debugLine="top = top + 7dip";
_top = (int) (_top+anywheresoftware.b4a.keywords.Common.DipToCurrent((int) (7)));
 }
};
 //BA.debugLineNum = 1106;BA.debugLine="sv_return_details.Panel.Height = top";
mostCurrent._sv_return_details.getPanel().setHeight(_top);
 //BA.debugLineNum = 1108;BA.debugLine="pnldetails_return.SetVisibleAnimated(500,True)";
mostCurrent._pnldetails_return.SetVisibleAnimated((int) (500),anywheresoftware.b4a.keywords.Common.True);
 };
 };
 //BA.debugLineNum = 1113;BA.debugLine="End Sub";
return "";
}
public static String  _returns_receive(anywheresoftware.b4a.objects.collections.Map _res,String _cat) throws Exception{
anywheresoftware.b4a.objects.collections.Map _m1 = null;
anywheresoftware.b4a.objects.collections.List _l1 = null;
int _top = 0;
int _i = 0;
anywheresoftware.b4a.objects.collections.Map _temp = null;
anywheresoftware.b4a.objects.PanelWrapper _p1 = null;
 //BA.debugLineNum = 930;BA.debugLine="Sub returns_receive(res As Map,cat As String)";
 //BA.debugLineNum = 932;BA.debugLine="pnlloading.SetVisibleAnimated(500,False)";
mostCurrent._pnlloading.SetVisibleAnimated((int) (500),anywheresoftware.b4a.keywords.Common.False);
 //BA.debugLineNum = 933;BA.debugLine="pnlnew_address.SetVisibleAnimated(500,False)";
mostCurrent._pnlnew_address.SetVisibleAnimated((int) (500),anywheresoftware.b4a.keywords.Common.False);
 //BA.debugLineNum = 935;BA.debugLine="If res.ContainsKey(\"success\") Then";
if (_res.ContainsKey((Object)("success"))) { 
 //BA.debugLineNum = 936;BA.debugLine="If res.Get(\"success\") = True Then";
if ((_res.Get((Object)("success"))).equals((Object)(anywheresoftware.b4a.keywords.Common.True))) { 
 //BA.debugLineNum = 937;BA.debugLine="Dim m1 As Map";
_m1 = new anywheresoftware.b4a.objects.collections.Map();
 //BA.debugLineNum = 938;BA.debugLine="m1.Initialize";
_m1.Initialize();
 //BA.debugLineNum = 939;BA.debugLine="m1 = res.Get(\"data\")";
_m1.setObject((anywheresoftware.b4a.objects.collections.Map.MyMap)(_res.Get((Object)("data"))));
 //BA.debugLineNum = 941;BA.debugLine="Dim l1 As List";
_l1 = new anywheresoftware.b4a.objects.collections.List();
 //BA.debugLineNum = 942;BA.debugLine="l1 = m1.Get(\"returns\")";
_l1.setObject((java.util.List)(_m1.Get((Object)("returns"))));
 //BA.debugLineNum = 944;BA.debugLine="Dim top As Int";
_top = 0;
 //BA.debugLineNum = 945;BA.debugLine="top = 0";
_top = (int) (0);
 //BA.debugLineNum = 946;BA.debugLine="svReturns.Panel.Color = Colors.White";
mostCurrent._svreturns.getPanel().setColor(anywheresoftware.b4a.keywords.Common.Colors.White);
 //BA.debugLineNum = 948;BA.debugLine="For i = 0 To l1.Size - 1";
{
final int step13 = 1;
final int limit13 = (int) (_l1.getSize()-1);
for (_i = (int) (0) ; (step13 > 0 && _i <= limit13) || (step13 < 0 && _i >= limit13); _i = ((int)(0 + _i + step13)) ) {
 //BA.debugLineNum = 950;BA.debugLine="Dim temp As Map";
_temp = new anywheresoftware.b4a.objects.collections.Map();
 //BA.debugLineNum = 951;BA.debugLine="temp = l1.Get(i)";
_temp.setObject((anywheresoftware.b4a.objects.collections.Map.MyMap)(_l1.Get(_i)));
 //BA.debugLineNum = 953;BA.debugLine="Dim p1 As Panel";
_p1 = new anywheresoftware.b4a.objects.PanelWrapper();
 //BA.debugLineNum = 954;BA.debugLine="p1.Initialize(\"\")";
_p1.Initialize(mostCurrent.activityBA,"");
 //BA.debugLineNum = 956;BA.debugLine="svReturns.Panel.AddView(p1,-10,top,svOrder.Wid";
mostCurrent._svreturns.getPanel().AddView((android.view.View)(_p1.getObject()),(int) (-10),_top,mostCurrent._svorder.getWidth(),(int) (0));
 //BA.debugLineNum = 958;BA.debugLine="If Library.IsPersian Then";
if (mostCurrent._library._ispersian(mostCurrent.activityBA)) { 
 //BA.debugLineNum = 959;BA.debugLine="p1.LoadLayout(\"frmtemplate_returns\")";
_p1.LoadLayout("frmtemplate_returns",mostCurrent.activityBA);
 //BA.debugLineNum = 960;BA.debugLine="temp.Put(\"date_added\",Library.GetDate(temp.Ge";
_temp.Put((Object)("date_added"),(Object)(mostCurrent._library._getdate(mostCurrent.activityBA,BA.ObjectToString(_temp.Get((Object)("date_added"))))));
 }else {
 //BA.debugLineNum = 962;BA.debugLine="p1.LoadLayout(\"frmtemplate_returns_en\")";
_p1.LoadLayout("frmtemplate_returns_en",mostCurrent.activityBA);
 };
 //BA.debugLineNum = 965;BA.debugLine="btnreturn_details.Tag = temp.Get(\"return_id\")";
mostCurrent._btnreturn_details.setTag(_temp.Get((Object)("return_id")));
 //BA.debugLineNum = 967;BA.debugLine="p1.Color = Colors.White";
_p1.setColor(anywheresoftware.b4a.keywords.Common.Colors.White);
 //BA.debugLineNum = 968;BA.debugLine="p1.Height = lbldivider_return.Top + 4dip";
_p1.setHeight((int) (mostCurrent._lbldivider_return.getTop()+anywheresoftware.b4a.keywords.Common.DipToCurrent((int) (4))));
 //BA.debugLineNum = 970;BA.debugLine="lblreturn_title.Text = Library.GetStringResour";
mostCurrent._lblreturn_title.setText(BA.ObjectToCharSequence(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"return_from").replace("1",BA.ObjectToString(_temp.Get((Object)("name")))).replace("0",BA.ObjectToString(_temp.Get((Object)("date_added"))))));
 //BA.debugLineNum = 971;BA.debugLine="lblreturn_state.Text = Library.GetStringResour";
mostCurrent._lblreturn_state.setText(BA.ObjectToCharSequence(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"return_state").replace("1",BA.ObjectToString(_temp.Get((Object)("status")))).replace("0",BA.ObjectToString(_temp.Get((Object)("order_id"))))));
 //BA.debugLineNum = 973;BA.debugLine="lblreturn_title.Gravity = Library.GetStringRes";
mostCurrent._lblreturn_title.setGravity((int)(Double.parseDouble(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"direction"))));
 //BA.debugLineNum = 974;BA.debugLine="lblreturn_state.Gravity = Library.GetStringRes";
mostCurrent._lblreturn_state.setGravity((int)(Double.parseDouble(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"direction"))));
 //BA.debugLineNum = 976;BA.debugLine="top = top + p1.Height";
_top = (int) (_top+_p1.getHeight());
 }
};
 //BA.debugLineNum = 980;BA.debugLine="svReturns.Panel.Height = top + 140dip";
mostCurrent._svreturns.getPanel().setHeight((int) (_top+anywheresoftware.b4a.keywords.Common.DipToCurrent((int) (140))));
 //BA.debugLineNum = 981;BA.debugLine="tab1.CurrentTab = 4";
mostCurrent._tab1.setCurrentTab((int) (4));
 //BA.debugLineNum = 983;BA.debugLine="Return";
if (true) return "";
 };
 };
 //BA.debugLineNum = 988;BA.debugLine="End Sub";
return "";
}
public static String  _subsribe_receive(anywheresoftware.b4a.objects.collections.Map _res,String _cat) throws Exception{
 //BA.debugLineNum = 880;BA.debugLine="Sub subsribe_receive(res As Map,cat As String)";
 //BA.debugLineNum = 882;BA.debugLine="ProgressDialogHide";
anywheresoftware.b4a.keywords.Common.ProgressDialogHide();
 //BA.debugLineNum = 883;BA.debugLine="pnlloading.SetVisibleAnimated(500,False	)";
mostCurrent._pnlloading.SetVisibleAnimated((int) (500),anywheresoftware.b4a.keywords.Common.False);
 //BA.debugLineNum = 885;BA.debugLine="If res.IsInitialized Then";
if (_res.IsInitialized()) { 
 //BA.debugLineNum = 886;BA.debugLine="If res.ContainsKey(\"success\") Then";
if (_res.ContainsKey((Object)("success"))) { 
 //BA.debugLineNum = 887;BA.debugLine="If res.Get(\"success\") = True Then";
if ((_res.Get((Object)("success"))).equals((Object)(anywheresoftware.b4a.keywords.Common.True))) { 
 //BA.debugLineNum = 889;BA.debugLine="If SubscribeState = \"1\" Then";
if ((mostCurrent._subscribestate).equals("1")) { 
 //BA.debugLineNum = 890;BA.debugLine="toast.ShowToastMessageShow(Library.GetStringR";
mostCurrent._toast._showtoastmessageshow(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"subscribe_success"),(long) (2),anywheresoftware.b4a.keywords.Common.True);
 //BA.debugLineNum = 891;BA.debugLine="rbno.Checked = True";
mostCurrent._rbno.setChecked(anywheresoftware.b4a.keywords.Common.True);
 //BA.debugLineNum = 892;BA.debugLine="rbyes.Visible = False";
mostCurrent._rbyes.setVisible(anywheresoftware.b4a.keywords.Common.False);
 //BA.debugLineNum = 893;BA.debugLine="rbno.Visible = True";
mostCurrent._rbno.setVisible(anywheresoftware.b4a.keywords.Common.True);
 //BA.debugLineNum = 894;BA.debugLine="lblnewsletteroption.Text = Library.GetStringR";
mostCurrent._lblnewsletteroption.setText(BA.ObjectToCharSequence(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"scribe_state_1")));
 }else {
 //BA.debugLineNum = 896;BA.debugLine="toast.ShowToastMessageShow(Library.GetStringR";
mostCurrent._toast._showtoastmessageshow(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"unsubscribe_success"),(long) (2),anywheresoftware.b4a.keywords.Common.True);
 //BA.debugLineNum = 897;BA.debugLine="rbyes.Checked = True";
mostCurrent._rbyes.setChecked(anywheresoftware.b4a.keywords.Common.True);
 //BA.debugLineNum = 898;BA.debugLine="rbno.Visible = False";
mostCurrent._rbno.setVisible(anywheresoftware.b4a.keywords.Common.False);
 //BA.debugLineNum = 899;BA.debugLine="rbyes.Visible = True";
mostCurrent._rbyes.setVisible(anywheresoftware.b4a.keywords.Common.True);
 //BA.debugLineNum = 900;BA.debugLine="lblnewsletteroption.Text = Library.GetStringR";
mostCurrent._lblnewsletteroption.setText(BA.ObjectToCharSequence(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"scribe_state_0")));
 };
 };
 };
 };
 //BA.debugLineNum = 907;BA.debugLine="End Sub";
return "";
}
public static String  _tmropenmenu_tick() throws Exception{
 //BA.debugLineNum = 513;BA.debugLine="Sub tmrOpenMenu_Tick";
 //BA.debugLineNum = 515;BA.debugLine="tmrOpenMenu.Enabled = False";
_tmropenmenu.setEnabled(anywheresoftware.b4a.keywords.Common.False);
 //BA.debugLineNum = 517;BA.debugLine="If Library.IsPersian Then";
if (mostCurrent._library._ispersian(mostCurrent.activityBA)) { 
 //BA.debugLineNum = 519;BA.debugLine="pnlmenu.SetLayoutAnimated(800,Activity.Width - p";
mostCurrent._pnlmenu.SetLayoutAnimated((int) (800),(int) (mostCurrent._activity.getWidth()-mostCurrent._pnlmenu.getWidth()),mostCurrent._pnlmenu.getTop(),mostCurrent._pnlmenu.getWidth(),mostCurrent._pnlmenu.getHeight());
 //BA.debugLineNum = 520;BA.debugLine="DoEvents";
anywheresoftware.b4a.keywords.Common.DoEvents();
 }else {
 //BA.debugLineNum = 523;BA.debugLine="pnlmenu.SetLayoutAnimated(800,0,pnlmenu.Top,pnlm";
mostCurrent._pnlmenu.SetLayoutAnimated((int) (800),(int) (0),mostCurrent._pnlmenu.getTop(),mostCurrent._pnlmenu.getWidth(),mostCurrent._pnlmenu.getHeight());
 //BA.debugLineNum = 524;BA.debugLine="DoEvents";
anywheresoftware.b4a.keywords.Common.DoEvents();
 };
 //BA.debugLineNum = 528;BA.debugLine="End Sub";
return "";
}
public static String  _tomixcase(String _entry) throws Exception{
anywheresoftware.b4a.keywords.StringBuilderWrapper _sb = null;
anywheresoftware.b4a.keywords.Regex.MatcherWrapper _m = null;
int _i = 0;
 //BA.debugLineNum = 1003;BA.debugLine="Sub ToMixCase(Entry As String) As String";
 //BA.debugLineNum = 1005;BA.debugLine="Dim sb As StringBuilder";
_sb = new anywheresoftware.b4a.keywords.StringBuilderWrapper();
 //BA.debugLineNum = 1006;BA.debugLine="Dim m As Matcher";
_m = new anywheresoftware.b4a.keywords.Regex.MatcherWrapper();
 //BA.debugLineNum = 1007;BA.debugLine="Dim I As Int";
_i = 0;
 //BA.debugLineNum = 1009;BA.debugLine="Entry = Entry.ToLowerCase";
_entry = _entry.toLowerCase();
 //BA.debugLineNum = 1011;BA.debugLine="sb.Initialize";
_sb.Initialize();
 //BA.debugLineNum = 1013;BA.debugLine="m = Regex.Matcher(\"(^\\w)|(\\s\\w)\", Entry)";
_m = anywheresoftware.b4a.keywords.Common.Regex.Matcher("(^\\w)|(\\s\\w)",_entry);
 //BA.debugLineNum = 1015;BA.debugLine="Do While m.Find";
while (_m.Find()) {
 //BA.debugLineNum = 1017;BA.debugLine="If m.Match.Length > 1 Then";
if (_m.getMatch().length()>1) { 
 //BA.debugLineNum = 1019;BA.debugLine="sb.Append(Entry.SubString2(I, m.GetStart";
_sb.Append(_entry.substring(_i,(int) (_m.GetStart((int) (0))+1)));
 //BA.debugLineNum = 1020;BA.debugLine="sb.Append(m.Match.SubString(1).ToUpperCa";
_sb.Append(_m.getMatch().substring((int) (1)).toUpperCase());
 }else {
 //BA.debugLineNum = 1024;BA.debugLine="sb.Append(Entry.SubString2(I, m.GetStart";
_sb.Append(_entry.substring(_i,_m.GetStart((int) (0))));
 //BA.debugLineNum = 1025;BA.debugLine="sb.Append(m.Match.ToUpperCase)";
_sb.Append(_m.getMatch().toUpperCase());
 };
 //BA.debugLineNum = 1029;BA.debugLine="I = m.GetEnd(0)";
_i = _m.GetEnd((int) (0));
 }
;
 //BA.debugLineNum = 1033;BA.debugLine="If I < Entry.Length Then";
if (_i<_entry.length()) { 
 //BA.debugLineNum = 1035;BA.debugLine="sb.Append(Entry.SubString(I))";
_sb.Append(_entry.substring(_i));
 };
 //BA.debugLineNum = 1039;BA.debugLine="Return sb.ToString";
if (true) return _sb.ToString();
 //BA.debugLineNum = 1041;BA.debugLine="End Sub";
return "";
}
public static String  _txtcountry_itemclick(int _position,Object _value) throws Exception{
int _i = 0;
anywheresoftware.b4a.objects.collections.Map _m1 = null;
com.apps.demo.opencart _opcity = null;
 //BA.debugLineNum = 431;BA.debugLine="Sub txtcountry_ItemClick (Position As Int, Value A";
 //BA.debugLineNum = 433;BA.debugLine="pnlloading.SetVisibleAnimated(500,True)";
mostCurrent._pnlloading.SetVisibleAnimated((int) (500),anywheresoftware.b4a.keywords.Common.True);
 //BA.debugLineNum = 435;BA.debugLine="For i = 0 To listCountries.Size - 1";
{
final int step2 = 1;
final int limit2 = (int) (mostCurrent._listcountries.getSize()-1);
for (_i = (int) (0) ; (step2 > 0 && _i <= limit2) || (step2 < 0 && _i >= limit2); _i = ((int)(0 + _i + step2)) ) {
 //BA.debugLineNum = 437;BA.debugLine="Dim m1 As Map";
_m1 = new anywheresoftware.b4a.objects.collections.Map();
 //BA.debugLineNum = 438;BA.debugLine="m1 = listCountries.Get(i)";
_m1.setObject((anywheresoftware.b4a.objects.collections.Map.MyMap)(mostCurrent._listcountries.Get(_i)));
 //BA.debugLineNum = 440;BA.debugLine="If m1.Get(\"name\") = Value Then";
if ((_m1.Get((Object)("name"))).equals(_value)) { 
 //BA.debugLineNum = 441;BA.debugLine="pnlloading.SetVisibleAnimated(500,True)";
mostCurrent._pnlloading.SetVisibleAnimated((int) (500),anywheresoftware.b4a.keywords.Common.True);
 //BA.debugLineNum = 442;BA.debugLine="Dim opCity As OpenCart";
_opcity = new com.apps.demo.opencart();
 //BA.debugLineNum = 443;BA.debugLine="opCity.Initialize";
_opcity._initialize(processBA);
 //BA.debugLineNum = 444;BA.debugLine="opCity.GetCity(Me,\"city_receive\",m1.Get(\"countr";
_opcity._getcity(actaccount.getObject(),"city_receive",BA.ObjectToString(_m1.Get((Object)("country_id"))));
 //BA.debugLineNum = 445;BA.debugLine="Return";
if (true) return "";
 };
 }
};
 //BA.debugLineNum = 450;BA.debugLine="End Sub";
return "";
}
public static String  _txtfax_focuschanged(boolean _hasfocus) throws Exception{
 //BA.debugLineNum = 1220;BA.debugLine="Sub txtfax_FocusChanged (HasFocus As Boolean)";
 //BA.debugLineNum = 1221;BA.debugLine="sv1.ScrollPosition = txtfax.Top-lblfax.Height";
mostCurrent._sv1.setScrollPosition((int) (mostCurrent._txtfax.getTop()-mostCurrent._lblfax.getHeight()));
 //BA.debugLineNum = 1222;BA.debugLine="End Sub";
return "";
}
public static String  _txtphone_focuschanged(boolean _hasfocus) throws Exception{
 //BA.debugLineNum = 1216;BA.debugLine="Sub txtphone_FocusChanged (HasFocus As Boolean)";
 //BA.debugLineNum = 1217;BA.debugLine="sv1.ScrollPosition = txtphone.Top-lblphone.Height";
mostCurrent._sv1.setScrollPosition((int) (mostCurrent._txtphone.getTop()-mostCurrent._lblphone.getHeight()));
 //BA.debugLineNum = 1218;BA.debugLine="End Sub";
return "";
}
public static String  _updatedetails_receive(anywheresoftware.b4a.objects.collections.Map _res,String _cat) throws Exception{
 //BA.debugLineNum = 589;BA.debugLine="Sub updatedetails_receive(res As Map,cat As String";
 //BA.debugLineNum = 591;BA.debugLine="ProgressDialogHide";
anywheresoftware.b4a.keywords.Common.ProgressDialogHide();
 //BA.debugLineNum = 592;BA.debugLine="pnlloading.SetVisibleAnimated(500,False)";
mostCurrent._pnlloading.SetVisibleAnimated((int) (500),anywheresoftware.b4a.keywords.Common.False);
 //BA.debugLineNum = 594;BA.debugLine="If res.ContainsKey(\"success\") Then";
if (_res.ContainsKey((Object)("success"))) { 
 //BA.debugLineNum = 595;BA.debugLine="If res.Get(\"success\") = True Then";
if ((_res.Get((Object)("success"))).equals((Object)(anywheresoftware.b4a.keywords.Common.True))) { 
 //BA.debugLineNum = 596;BA.debugLine="toast.ShowToastMessageShow(Library.GetStringRes";
mostCurrent._toast._showtoastmessageshow(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"success_save_details"),(long) (2),anywheresoftware.b4a.keywords.Common.True);
 //BA.debugLineNum = 597;BA.debugLine="Return";
if (true) return "";
 };
 };
 //BA.debugLineNum = 601;BA.debugLine="End Sub";
return "";
}
}
