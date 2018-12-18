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

public class actdoorder extends Activity implements B4AActivity{
	public static actdoorder mostCurrent;
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
			processBA = new BA(this.getApplicationContext(), null, null, "com.apps.demo", "com.apps.demo.actdoorder");
			processBA.loadHtSubs(this.getClass());
	        float deviceScale = getApplicationContext().getResources().getDisplayMetrics().density;
	        BALayout.setDeviceScale(deviceScale);
            
		}
		else if (previousOne != null) {
			Activity p = previousOne.get();
			if (p != null && p != this) {
                BA.LogInfo("Killing previous instance (actdoorder).");
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
		activityBA = new BA(this, layout, processBA, "com.apps.demo", "com.apps.demo.actdoorder");
        
        processBA.sharedProcessBA.activityBA = new java.lang.ref.WeakReference<BA>(activityBA);
        anywheresoftware.b4a.objects.ViewWrapper.lastId = 0;
        _activity = new ActivityWrapper(activityBA, "activity");
        anywheresoftware.b4a.Msgbox.isDismissing = false;
        if (BA.isShellModeRuntimeCheck(processBA)) {
			if (isFirst)
				processBA.raiseEvent2(null, true, "SHELL", false);
			processBA.raiseEvent2(null, true, "CREATE", true, "com.apps.demo.actdoorder", processBA, activityBA, _activity, anywheresoftware.b4a.keywords.Common.Density, mostCurrent);
			_activity.reinitializeForShell(activityBA, "activity");
		}
        initializeProcessGlobals();		
        initializeGlobals();
        
        BA.LogInfo("** Activity (actdoorder) Create, isFirst = " + isFirst + " **");
        processBA.raiseEvent2(null, true, "activity_create", false, isFirst);
		isFirst = false;
		if (this != mostCurrent)
			return;
        processBA.setActivityPaused(false);
        BA.LogInfo("** Activity (actdoorder) Resume **");
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
		return actdoorder.class;
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
        BA.LogInfo("** Activity (actdoorder) Pause, UserClosed = " + activityBA.activity.isFinishing() + " **");
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
            BA.LogInfo("** Activity (actdoorder) Resume **");
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
public anywheresoftware.b4a.objects.LabelWrapper _lblship = null;
public anywheresoftware.b4a.objects.LabelWrapper _lblpayment = null;
public anywheresoftware.b4a.objects.ButtonWrapper _btnpayment = null;
public anywheresoftware.b4a.objects.PanelWrapper _pnlheader = null;
public anywheresoftware.b4a.objects.PanelWrapper _pnlloading = null;
public anywheresoftware.b4a.objects.LabelWrapper _lblpb = null;
public anywheresoftware.b4a.objects.LabelWrapper _lbltitle = null;
public static String _currentpaymentcode = "";
public anywheresoftware.b4a.objects.ScrollViewWrapper _sv1 = null;
public static int _topsv = 0;
public anywheresoftware.b4a.objects.ScrollViewWrapper _svpreview = null;
public anywheresoftware.b4a.objects.ButtonWrapper _btncontinue = null;
public anywheresoftware.b4a.objects.PanelWrapper _pnlpreview = null;
public anywheresoftware.b4a.objects.LabelWrapper _lblname_product = null;
public anywheresoftware.b4a.objects.LabelWrapper _lblprice_quantity = null;
public anywheresoftware.b4a.objects.PanelWrapper _pnl_item_product = null;
public static String _order_id = "";
public com.apps.demo.mytoastmessageshow _mytoastmessageshow = null;
public anywheresoftware.b4a.objects.ButtonWrapper _btnreturn = null;
public anywheresoftware.b4a.objects.Timer _timerscroll = null;
public anywheresoftware.b4a.objects.LabelWrapper _lbladdr = null;
public anywheresoftware.b4a.objects.ListViewWrapper _lsaddr = null;
public anywheresoftware.b4a.objects.PanelWrapper _pnladdr = null;
public anywheresoftware.b4a.objects.EditTextWrapper _txtcomment = null;
public anywheresoftware.b4a.objects.LabelWrapper _lblcomment = null;
public anywheresoftware.b4a.objects.ButtonWrapper _btnnewaddress = null;
public static String _currentaddresschooser = "";
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
int _address_id = 0;
com.apps.demo.opencart _opaddress = null;
 //BA.debugLineNum = 40;BA.debugLine="Sub Activity_Create(FirstTime As Boolean)";
 //BA.debugLineNum = 42;BA.debugLine="Library.setLocalApp(Library.currLang)";
mostCurrent._library._setlocalapp(mostCurrent.activityBA,mostCurrent._library._currlang);
 //BA.debugLineNum = 44;BA.debugLine="Activity.LoadLayout(\"frmdoorder\")";
mostCurrent._activity.LoadLayout("frmdoorder",mostCurrent.activityBA);
 //BA.debugLineNum = 45;BA.debugLine="MyToastMessageShow.Initialize(Activity)";
mostCurrent._mytoastmessageshow._initialize(mostCurrent.activityBA,(anywheresoftware.b4a.objects.PanelWrapper) anywheresoftware.b4a.AbsObjectWrapper.ConvertToWrapper(new anywheresoftware.b4a.objects.PanelWrapper(), (android.view.ViewGroup)(mostCurrent._activity.getObject())));
 //BA.debugLineNum = 47;BA.debugLine="Library.ChangeStatusColor";
mostCurrent._library._changestatuscolor(mostCurrent.activityBA);
 //BA.debugLineNum = 49;BA.debugLine="lbltitle.Text = Library.GetStringResourse(\"paymen";
mostCurrent._lbltitle.setText(BA.ObjectToCharSequence(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"payment")));
 //BA.debugLineNum = 50;BA.debugLine="btnnewaddress.Text = Library.GetStringResourse(\"n";
mostCurrent._btnnewaddress.setText(BA.ObjectToCharSequence(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"new_address")));
 //BA.debugLineNum = 51;BA.debugLine="lblpb.Text = Library.GetStringResourse(\"loading\")";
mostCurrent._lblpb.setText(BA.ObjectToCharSequence(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"loading")));
 //BA.debugLineNum = 52;BA.debugLine="lblcomment.Text = Library.GetStringResourse(\"orde";
mostCurrent._lblcomment.setText(BA.ObjectToCharSequence(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"order_comment")));
 //BA.debugLineNum = 53;BA.debugLine="lblcomment.Gravity = Library.GetStringResourse(\"d";
mostCurrent._lblcomment.setGravity((int)(Double.parseDouble(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"direction"))));
 //BA.debugLineNum = 54;BA.debugLine="txtcomment.Gravity = Library.GetStringResourse(\"d";
mostCurrent._txtcomment.setGravity((int)(Double.parseDouble(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"direction"))));
 //BA.debugLineNum = 55;BA.debugLine="txtcomment.Color = Colors.RGB(242, 242, 242)";
mostCurrent._txtcomment.setColor(anywheresoftware.b4a.keywords.Common.Colors.RGB((int) (242),(int) (242),(int) (242)));
 //BA.debugLineNum = 56;BA.debugLine="lbladdr.Gravity = Library.GetStringResourse(\"dire";
mostCurrent._lbladdr.setGravity((int)(Double.parseDouble(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"direction"))));
 //BA.debugLineNum = 57;BA.debugLine="pnlheader.Color = Library.Theme_Header";
mostCurrent._pnlheader.setColor(mostCurrent._library._theme_header);
 //BA.debugLineNum = 59;BA.debugLine="btnpayment.Text = Library.GetStringResourse(\"prev";
mostCurrent._btnpayment.setText(BA.ObjectToCharSequence(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"preview_finish")));
 //BA.debugLineNum = 60;BA.debugLine="btnpayment.Background = Library.GetButtonState";
mostCurrent._btnpayment.setBackground((android.graphics.drawable.Drawable)(mostCurrent._library._getbuttonstate(mostCurrent.activityBA).getObject()));
 //BA.debugLineNum = 62;BA.debugLine="If Library.loginDetails.IsInitialized Then";
if (mostCurrent._library._logindetails.IsInitialized()) { 
 //BA.debugLineNum = 63;BA.debugLine="If Library.loginDetails.Get(\"login\") = True Then";
if ((mostCurrent._library._logindetails.Get((Object)("login"))).equals((Object)(anywheresoftware.b4a.keywords.Common.True))) { 
 //BA.debugLineNum = 64;BA.debugLine="btnnewaddress.Visible = True";
mostCurrent._btnnewaddress.setVisible(anywheresoftware.b4a.keywords.Common.True);
 };
 };
 //BA.debugLineNum = 68;BA.debugLine="lsaddr.SingleLineLayout.Label.TextColor = Colors.";
mostCurrent._lsaddr.getSingleLineLayout().Label.setTextColor(anywheresoftware.b4a.keywords.Common.Colors.Black);
 //BA.debugLineNum = 69;BA.debugLine="lsaddr.SingleLineLayout.Label.TextSize = 12";
mostCurrent._lsaddr.getSingleLineLayout().Label.setTextSize((float) (12));
 //BA.debugLineNum = 70;BA.debugLine="lsaddr.SingleLineLayout.Label.Typeface = Library.";
mostCurrent._lsaddr.getSingleLineLayout().Label.setTypeface((android.graphics.Typeface)(mostCurrent._library._getfont(mostCurrent.activityBA).getObject()));
 //BA.debugLineNum = 71;BA.debugLine="lsaddr.SingleLineLayout.Label.Gravity = Library.G";
mostCurrent._lsaddr.getSingleLineLayout().Label.setGravity((int)(Double.parseDouble(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"direction"))));
 //BA.debugLineNum = 73;BA.debugLine="btncontinue.Text = Library.GetStringResourse(\"con";
mostCurrent._btncontinue.setText(BA.ObjectToCharSequence(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"continues_order")));
 //BA.debugLineNum = 74;BA.debugLine="lbladdr.Text	 = Library.GetStringResourse(\"choose";
mostCurrent._lbladdr.setText(BA.ObjectToCharSequence(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"choose_address")));
 //BA.debugLineNum = 76;BA.debugLine="btncontinue.Background = Library.GetButtonState";
mostCurrent._btncontinue.setBackground((android.graphics.drawable.Drawable)(mostCurrent._library._getbuttonstate(mostCurrent.activityBA).getObject()));
 //BA.debugLineNum = 79;BA.debugLine="lblpayment.Initialize(\"\")";
mostCurrent._lblpayment.Initialize(mostCurrent.activityBA,"");
 //BA.debugLineNum = 80;BA.debugLine="lblpayment.TextSize = 14";
mostCurrent._lblpayment.setTextSize((float) (14));
 //BA.debugLineNum = 81;BA.debugLine="lblpayment.Typeface =Library.GetFont";
mostCurrent._lblpayment.setTypeface((android.graphics.Typeface)(mostCurrent._library._getfont(mostCurrent.activityBA).getObject()));
 //BA.debugLineNum = 82;BA.debugLine="lblpayment.Gravity = Library.GetStringResourse(\"d";
mostCurrent._lblpayment.setGravity((int)(Double.parseDouble(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"direction"))));
 //BA.debugLineNum = 83;BA.debugLine="lblpayment.Color = Library.Theme_Footer";
mostCurrent._lblpayment.setColor(mostCurrent._library._theme_footer);
 //BA.debugLineNum = 84;BA.debugLine="lblpayment.TextColor = Colors.White";
mostCurrent._lblpayment.setTextColor(anywheresoftware.b4a.keywords.Common.Colors.White);
 //BA.debugLineNum = 85;BA.debugLine="lblpayment.Text = \" \" & Library.GetStringResourse";
mostCurrent._lblpayment.setText(BA.ObjectToCharSequence(" "+mostCurrent._library._getstringresourse(mostCurrent.activityBA,"payment_title")+" :"));
 //BA.debugLineNum = 86;BA.debugLine="sv1.Panel.AddView(lblpayment,0,topSv,sv1.Width,40";
mostCurrent._sv1.getPanel().AddView((android.view.View)(mostCurrent._lblpayment.getObject()),(int) (0),_topsv,mostCurrent._sv1.getWidth(),anywheresoftware.b4a.keywords.Common.DipToCurrent((int) (40)));
 //BA.debugLineNum = 87;BA.debugLine="topSv = topSv + 40dip";
_topsv = (int) (_topsv+anywheresoftware.b4a.keywords.Common.DipToCurrent((int) (40)));
 //BA.debugLineNum = 91;BA.debugLine="lblship.Initialize(\"\")";
mostCurrent._lblship.Initialize(mostCurrent.activityBA,"");
 //BA.debugLineNum = 92;BA.debugLine="lblship.TextSize = 14";
mostCurrent._lblship.setTextSize((float) (14));
 //BA.debugLineNum = 93;BA.debugLine="lblship.Typeface = Library.GetFont";
mostCurrent._lblship.setTypeface((android.graphics.Typeface)(mostCurrent._library._getfont(mostCurrent.activityBA).getObject()));
 //BA.debugLineNum = 94;BA.debugLine="lblship.Gravity = Library.GetStringResourse(\"dire";
mostCurrent._lblship.setGravity((int)(Double.parseDouble(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"direction"))));
 //BA.debugLineNum = 95;BA.debugLine="lblship.Color = Library.Theme_Footer";
mostCurrent._lblship.setColor(mostCurrent._library._theme_footer);
 //BA.debugLineNum = 96;BA.debugLine="lblship.TextColor = Colors.White";
mostCurrent._lblship.setTextColor(anywheresoftware.b4a.keywords.Common.Colors.White);
 //BA.debugLineNum = 97;BA.debugLine="lblship.Text = \" \" & Library.GetStringResourse(\"s";
mostCurrent._lblship.setText(BA.ObjectToCharSequence(" "+mostCurrent._library._getstringresourse(mostCurrent.activityBA,"ship_title")+" :"));
 //BA.debugLineNum = 98;BA.debugLine="sv1.Panel.AddView(lblship,0,topSv,sv1.Width,40dip";
mostCurrent._sv1.getPanel().AddView((android.view.View)(mostCurrent._lblship.getObject()),(int) (0),_topsv,mostCurrent._sv1.getWidth(),anywheresoftware.b4a.keywords.Common.DipToCurrent((int) (40)));
 //BA.debugLineNum = 99;BA.debugLine="topSv = topSv + 40dip";
_topsv = (int) (_topsv+anywheresoftware.b4a.keywords.Common.DipToCurrent((int) (40)));
 //BA.debugLineNum = 102;BA.debugLine="If Library.loginDetails.IsInitialized = False And";
if (mostCurrent._library._logindetails.IsInitialized()==anywheresoftware.b4a.keywords.Common.False && mostCurrent._library._guestlogin.IsInitialized()) { 
 //BA.debugLineNum = 103;BA.debugLine="LoadData";
_loaddata();
 //BA.debugLineNum = 104;BA.debugLine="Return";
if (true) return "";
 };
 //BA.debugLineNum = 107;BA.debugLine="If Library.loginDetails.Get(\"login\") = True Then";
if ((mostCurrent._library._logindetails.Get((Object)("login"))).equals((Object)(anywheresoftware.b4a.keywords.Common.True))) { 
 //BA.debugLineNum = 109;BA.debugLine="pnlloading.SetVisibleAnimated(500,True)";
mostCurrent._pnlloading.SetVisibleAnimated((int) (500),anywheresoftware.b4a.keywords.Common.True);
 //BA.debugLineNum = 111;BA.debugLine="Dim address_id As Int";
_address_id = 0;
 //BA.debugLineNum = 112;BA.debugLine="address_id = Library.loginDetails.Get(\"address_i";
_address_id = (int)(BA.ObjectToNumber(mostCurrent._library._logindetails.Get((Object)("address_id"))));
 //BA.debugLineNum = 114;BA.debugLine="If Library.ChoosenAddress > 0 Then";
if (mostCurrent._library._choosenaddress>0) { 
 //BA.debugLineNum = 115;BA.debugLine="address_id = Library.ChoosenAddress";
_address_id = mostCurrent._library._choosenaddress;
 };
 //BA.debugLineNum = 118;BA.debugLine="Dim opAddress As OpenCart";
_opaddress = new com.apps.demo.opencart();
 //BA.debugLineNum = 119;BA.debugLine="opAddress.Initialize";
_opaddress._initialize(processBA);
 //BA.debugLineNum = 120;BA.debugLine="opAddress.GetPaymentAddress(Me,\"ListPaymentgAddr";
_opaddress._getpaymentaddress(actdoorder.getObject(),"ListPaymentgAddress_receive");
 }else {
 //BA.debugLineNum = 123;BA.debugLine="If Library.GuestLogin.Get(\"login\") = True Then";
if ((mostCurrent._library._guestlogin.Get((Object)("login"))).equals((Object)(anywheresoftware.b4a.keywords.Common.True))) { 
 //BA.debugLineNum = 124;BA.debugLine="LoadData";
_loaddata();
 }else {
 //BA.debugLineNum = 126;BA.debugLine="ToastMessageShow(Library.GetStringResourse(\"log";
anywheresoftware.b4a.keywords.Common.ToastMessageShow(BA.ObjectToCharSequence(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"login_force")),anywheresoftware.b4a.keywords.Common.False);
 //BA.debugLineNum = 127;BA.debugLine="Activity.Finish";
mostCurrent._activity.Finish();
 //BA.debugLineNum = 128;BA.debugLine="StartActivity(actLogin)";
anywheresoftware.b4a.keywords.Common.StartActivity(mostCurrent.activityBA,(Object)(mostCurrent._actlogin.getObject()));
 };
 };
 //BA.debugLineNum = 136;BA.debugLine="End Sub";
return "";
}
public static boolean  _activity_keypress(int _keycode) throws Exception{
 //BA.debugLineNum = 138;BA.debugLine="Sub Activity_KeyPress (KeyCode As Int) As Boolean";
 //BA.debugLineNum = 140;BA.debugLine="If KeyCode = KeyCodes.KEYCODE_BACK Then";
if (_keycode==anywheresoftware.b4a.keywords.Common.KeyCodes.KEYCODE_BACK) { 
 //BA.debugLineNum = 142;BA.debugLine="If pnlpreview.Visible = True Then";
if (mostCurrent._pnlpreview.getVisible()==anywheresoftware.b4a.keywords.Common.True) { 
 //BA.debugLineNum = 143;BA.debugLine="pnlpreview.SetVisibleAnimated(500,False)";
mostCurrent._pnlpreview.SetVisibleAnimated((int) (500),anywheresoftware.b4a.keywords.Common.False);
 //BA.debugLineNum = 144;BA.debugLine="Return True";
if (true) return anywheresoftware.b4a.keywords.Common.True;
 };
 //BA.debugLineNum = 147;BA.debugLine="Activity.Finish";
mostCurrent._activity.Finish();
 //BA.debugLineNum = 149;BA.debugLine="Return True";
if (true) return anywheresoftware.b4a.keywords.Common.True;
 };
 //BA.debugLineNum = 153;BA.debugLine="End Sub";
return false;
}
public static String  _activity_pause(boolean _userclosed) throws Exception{
 //BA.debugLineNum = 416;BA.debugLine="Sub Activity_Pause (UserClosed As Boolean)";
 //BA.debugLineNum = 417;BA.debugLine="Library.AnimationFromLeft2Right";
mostCurrent._library._animationfromleft2right(mostCurrent.activityBA);
 //BA.debugLineNum = 418;BA.debugLine="End Sub";
return "";
}
public static String  _activity_resume() throws Exception{
 //BA.debugLineNum = 405;BA.debugLine="Sub Activity_Resume";
 //BA.debugLineNum = 407;BA.debugLine="Library.setLocalApp(Library.currLang)";
mostCurrent._library._setlocalapp(mostCurrent.activityBA,mostCurrent._library._currlang);
 //BA.debugLineNum = 409;BA.debugLine="If Library.PaymentSuccess = True Then";
if (mostCurrent._library._paymentsuccess==anywheresoftware.b4a.keywords.Common.True) { 
 //BA.debugLineNum = 410;BA.debugLine="Library.PaymentSuccess = False";
mostCurrent._library._paymentsuccess = anywheresoftware.b4a.keywords.Common.False;
 //BA.debugLineNum = 411;BA.debugLine="Activity.Finish";
mostCurrent._activity.Finish();
 };
 //BA.debugLineNum = 414;BA.debugLine="End Sub";
return "";
}
public static String  _addaddressshipping_receive(anywheresoftware.b4a.objects.collections.Map _res,String _cat) throws Exception{
 //BA.debugLineNum = 206;BA.debugLine="Sub AddAddressShipping_receive(res As Map,cat As S";
 //BA.debugLineNum = 207;BA.debugLine="LoadData";
_loaddata();
 //BA.debugLineNum = 208;BA.debugLine="End Sub";
return "";
}
public static String  _addpaymentaddress_receive(anywheresoftware.b4a.objects.collections.Map _res,String _cat) throws Exception{
com.apps.demo.opencart _opaddress = null;
 //BA.debugLineNum = 210;BA.debugLine="Sub AddPaymentAddress_receive(res As Map,cat As St";
 //BA.debugLineNum = 212;BA.debugLine="If res.ContainsKey(\"success\") Then";
if (_res.ContainsKey((Object)("success"))) { 
 //BA.debugLineNum = 214;BA.debugLine="If res.Get(\"success\") = True Then";
if ((_res.Get((Object)("success"))).equals((Object)(anywheresoftware.b4a.keywords.Common.True))) { 
 //BA.debugLineNum = 216;BA.debugLine="Dim opAddress As OpenCart";
_opaddress = new com.apps.demo.opencart();
 //BA.debugLineNum = 217;BA.debugLine="opAddress.Initialize";
_opaddress._initialize(processBA);
 //BA.debugLineNum = 218;BA.debugLine="opAddress.GetShipAddress(Me,\"ListShippingAddres";
_opaddress._getshipaddress(actdoorder.getObject(),"ListShippingAddress_receive");
 }else {
 //BA.debugLineNum = 221;BA.debugLine="If res.ContainsKey(\"error\") Then";
if (_res.ContainsKey((Object)("error"))) { 
 //BA.debugLineNum = 222;BA.debugLine="If res.Get(\"error\") = \"User is not logged in\"";
if ((_res.Get((Object)("error"))).equals((Object)("User is not logged in"))) { 
 //BA.debugLineNum = 223;BA.debugLine="Activity.Finish";
mostCurrent._activity.Finish();
 //BA.debugLineNum = 224;BA.debugLine="StartActivity(actLogin)";
anywheresoftware.b4a.keywords.Common.StartActivity(mostCurrent.activityBA,(Object)(mostCurrent._actlogin.getObject()));
 }else if(_res.Get((Object)("error")) instanceof anywheresoftware.b4a.objects.collections.Map.MyMap) { 
 //BA.debugLineNum = 227;BA.debugLine="Library.ShowErrors(res.Get(\"error\"))";
mostCurrent._library._showerrors(mostCurrent.activityBA,(anywheresoftware.b4a.objects.collections.Map) anywheresoftware.b4a.AbsObjectWrapper.ConvertToWrapper(new anywheresoftware.b4a.objects.collections.Map(), (anywheresoftware.b4a.objects.collections.Map.MyMap)(_res.Get((Object)("error")))));
 }else if((_res.Get((Object)("error"))).equals((Object)("Validate cart has products and has stock failed"))) { 
 //BA.debugLineNum = 230;BA.debugLine="ToastMessageShow(Library.GetStringResourse(\"n";
anywheresoftware.b4a.keywords.Common.ToastMessageShow(BA.ObjectToCharSequence(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"no_valid_cart")),anywheresoftware.b4a.keywords.Common.True);
 //BA.debugLineNum = 231;BA.debugLine="Activity.Finish";
mostCurrent._activity.Finish();
 //BA.debugLineNum = 232;BA.debugLine="Return";
if (true) return "";
 }else if((_res.Get((Object)("error"))).equals((Object)("Your cart is empty or a product is out of stock"))) { 
 //BA.debugLineNum = 235;BA.debugLine="Msgbox(Library.GetStringResourse(\"no_stock_ca";
anywheresoftware.b4a.keywords.Common.Msgbox(BA.ObjectToCharSequence(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"no_stock_cart")),BA.ObjectToCharSequence(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"alert")),mostCurrent.activityBA);
 //BA.debugLineNum = 236;BA.debugLine="Activity.Finish";
mostCurrent._activity.Finish();
 //BA.debugLineNum = 237;BA.debugLine="Return";
if (true) return "";
 }else {
 //BA.debugLineNum = 240;BA.debugLine="Msgbox(res.Get(\"error\"),Library.GetStringReso";
anywheresoftware.b4a.keywords.Common.Msgbox(BA.ObjectToCharSequence(_res.Get((Object)("error"))),BA.ObjectToCharSequence(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"alert")),mostCurrent.activityBA);
 };
 //BA.debugLineNum = 243;BA.debugLine="Activity.Finish";
mostCurrent._activity.Finish();
 }else {
 //BA.debugLineNum = 246;BA.debugLine="MyToastMessageShow.ShowToastMessageShow(Librar";
mostCurrent._mytoastmessageshow._showtoastmessageshow(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"error_net_title"),(long) (1.5),anywheresoftware.b4a.keywords.Common.False);
 };
 };
 }else {
 //BA.debugLineNum = 252;BA.debugLine="MyToastMessageShow.ShowToastMessageShow(Library.";
mostCurrent._mytoastmessageshow._showtoastmessageshow(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"error_net_title"),(long) (1.5),anywheresoftware.b4a.keywords.Common.False);
 };
 //BA.debugLineNum = 255;BA.debugLine="End Sub";
return "";
}
public static String  _btnclose_click() throws Exception{
 //BA.debugLineNum = 420;BA.debugLine="Sub btnclose_Click";
 //BA.debugLineNum = 421;BA.debugLine="Activity.Finish";
mostCurrent._activity.Finish();
 //BA.debugLineNum = 422;BA.debugLine="End Sub";
return "";
}
public static String  _btncontinue_click() throws Exception{
com.apps.demo.opencart _opconfirm = null;
 //BA.debugLineNum = 669;BA.debugLine="Sub btncontinue_Click";
 //BA.debugLineNum = 671;BA.debugLine="pnlpreview.SetVisibleAnimated(500,False)";
mostCurrent._pnlpreview.SetVisibleAnimated((int) (500),anywheresoftware.b4a.keywords.Common.False);
 //BA.debugLineNum = 673;BA.debugLine="If currentPaymentCode = \"cod\" Or currentPaymentCo";
if ((mostCurrent._currentpaymentcode).equals("cod") || (mostCurrent._currentpaymentcode).equals("cheque") || (mostCurrent._currentpaymentcode).equals("bank_transfer")) { 
 //BA.debugLineNum = 674;BA.debugLine="pnlloading.SetVisibleAnimated(500,True)";
mostCurrent._pnlloading.SetVisibleAnimated((int) (500),anywheresoftware.b4a.keywords.Common.True);
 //BA.debugLineNum = 675;BA.debugLine="Dim opConfirm As OpenCart";
_opconfirm = new com.apps.demo.opencart();
 //BA.debugLineNum = 676;BA.debugLine="opConfirm.Initialize";
_opconfirm._initialize(processBA);
 //BA.debugLineNum = 677;BA.debugLine="opConfirm.SaveOrder(Me,\"SaveOrder_receive\",True)";
_opconfirm._saveorder(actdoorder.getObject(),"SaveOrder_receive",anywheresoftware.b4a.keywords.Common.True);
 }else {
 //BA.debugLineNum = 679;BA.debugLine="actPayment.Data = order_id";
mostCurrent._actpayment._data = mostCurrent._order_id;
 //BA.debugLineNum = 680;BA.debugLine="StartActivity(actPayment)";
anywheresoftware.b4a.keywords.Common.StartActivity(mostCurrent.activityBA,(Object)(mostCurrent._actpayment.getObject()));
 //BA.debugLineNum = 681;BA.debugLine="Return";
if (true) return "";
 };
 //BA.debugLineNum = 684;BA.debugLine="End Sub";
return "";
}
public static String  _btnnewaddress_click() throws Exception{
 //BA.debugLineNum = 714;BA.debugLine="Sub btnnewaddress_Click";
 //BA.debugLineNum = 716;BA.debugLine="Activity.Finish";
mostCurrent._activity.Finish();
 //BA.debugLineNum = 717;BA.debugLine="StartActivity(actAccount)";
anywheresoftware.b4a.keywords.Common.StartActivity(mostCurrent.activityBA,(Object)(mostCurrent._actaccount.getObject()));
 //BA.debugLineNum = 719;BA.debugLine="End Sub";
return "";
}
public static String  _btnpayment_click() throws Exception{
com.apps.demo.opencart _opconfirm = null;
 //BA.debugLineNum = 457;BA.debugLine="Sub btnpayment_Click";
 //BA.debugLineNum = 459;BA.debugLine="If Library.InternetState = False Then";
if (mostCurrent._library._internetstate(mostCurrent.activityBA)==anywheresoftware.b4a.keywords.Common.False) { 
 //BA.debugLineNum = 460;BA.debugLine="MyToastMessageShow.ShowToastMessageShow(Library.";
mostCurrent._mytoastmessageshow._showtoastmessageshow(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"error_net_details"),(long) (1.5),anywheresoftware.b4a.keywords.Common.False);
 //BA.debugLineNum = 461;BA.debugLine="Return";
if (true) return "";
 };
 //BA.debugLineNum = 464;BA.debugLine="pnlloading.SetVisibleAnimated(500,True)";
mostCurrent._pnlloading.SetVisibleAnimated((int) (500),anywheresoftware.b4a.keywords.Common.True);
 //BA.debugLineNum = 466;BA.debugLine="Dim opConfirm As OpenCart";
_opconfirm = new com.apps.demo.opencart();
 //BA.debugLineNum = 467;BA.debugLine="opConfirm.Initialize";
_opconfirm._initialize(processBA);
 //BA.debugLineNum = 468;BA.debugLine="opConfirm.SaveOrder(Me,\"ConfirmOrder_receive\",Fal";
_opconfirm._saveorder(actdoorder.getObject(),"ConfirmOrder_receive",anywheresoftware.b4a.keywords.Common.False);
 //BA.debugLineNum = 470;BA.debugLine="End Sub";
return "";
}
public static String  _changerbstyle(anywheresoftware.b4a.objects.CompoundButtonWrapper.RadioButtonWrapper _lblkey) throws Exception{
 //BA.debugLineNum = 393;BA.debugLine="Private Sub ChangeRBStyle(lblKey As RadioButton)";
 //BA.debugLineNum = 395;BA.debugLine="lblKey.Gravity = Library.GetStringResourse(\"direc";
_lblkey.setGravity((int)(Double.parseDouble(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"direction"))));
 //BA.debugLineNum = 396;BA.debugLine="lblKey.Typeface = Library.GetFont";
_lblkey.setTypeface((android.graphics.Typeface)(mostCurrent._library._getfont(mostCurrent.activityBA).getObject()));
 //BA.debugLineNum = 397;BA.debugLine="lblKey.TextSize = 14";
_lblkey.setTextSize((float) (14));
 //BA.debugLineNum = 398;BA.debugLine="lblKey.TextColor = Colors.Black";
_lblkey.setTextColor(anywheresoftware.b4a.keywords.Common.Colors.Black);
 //BA.debugLineNum = 399;BA.debugLine="Library.ChangeRBStyle(lblKey)";
mostCurrent._library._changerbstyle(mostCurrent.activityBA,_lblkey);
 //BA.debugLineNum = 401;BA.debugLine="End Sub";
return "";
}
public static String  _confirmorder_receive(anywheresoftware.b4a.objects.collections.Map _res,String _cat) throws Exception{
String _err = "";
anywheresoftware.b4a.objects.collections.List _l1 = null;
anywheresoftware.b4a.objects.collections.Map _temp = null;
int _top = 0;
int _i = 0;
anywheresoftware.b4a.objects.collections.Map _temp1 = null;
anywheresoftware.b4a.objects.PanelWrapper _p1 = null;
anywheresoftware.b4a.objects.collections.List _l2 = null;
int _j = 0;
anywheresoftware.b4a.objects.collections.Map _tm = null;
anywheresoftware.b4a.objects.LabelWrapper _lbl1 = null;
anywheresoftware.b4a.objects.WebViewWrapper _v = null;
uk.co.martinpearman.b4a.text.Html _html1 = null;
String _style = "";
String _extra = "";
 //BA.debugLineNum = 472;BA.debugLine="Sub ConfirmOrder_receive(res As Map,cat As String)";
 //BA.debugLineNum = 474;BA.debugLine="pnlloading.SetVisibleAnimated(500,False)";
mostCurrent._pnlloading.SetVisibleAnimated((int) (500),anywheresoftware.b4a.keywords.Common.False);
 //BA.debugLineNum = 476;BA.debugLine="If res.ContainsKey(\"error\") Then";
if (_res.ContainsKey((Object)("error"))) { 
 //BA.debugLineNum = 478;BA.debugLine="Dim err As String";
_err = "";
 //BA.debugLineNum = 479;BA.debugLine="err = res.Get(\"error\")";
_err = BA.ObjectToString(_res.Get((Object)("error")));
 //BA.debugLineNum = 480;BA.debugLine="err = err.ToLowerCase";
_err = _err.toLowerCase();
 //BA.debugLineNum = 482;BA.debugLine="If err.StartsWith(\"empty payment method\") Then";
if (_err.startsWith("empty payment method")) { 
 //BA.debugLineNum = 483;BA.debugLine="MyToastMessageShow.ShowToastMessageShow(Library";
mostCurrent._mytoastmessageshow._showtoastmessageshow(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"error_payment_select"),(long) (1.5),anywheresoftware.b4a.keywords.Common.False);
 }else if(_err.startsWith("validate if shipping method has been set failed")) { 
 //BA.debugLineNum = 485;BA.debugLine="MyToastMessageShow.ShowToastMessageShow(Library";
mostCurrent._mytoastmessageshow._showtoastmessageshow(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"error_ships_select"),(long) (1.5),anywheresoftware.b4a.keywords.Common.False);
 };
 //BA.debugLineNum = 488;BA.debugLine="Return";
if (true) return "";
 };
 //BA.debugLineNum = 494;BA.debugLine="If res.ContainsKey(\"success\") Then";
if (_res.ContainsKey((Object)("success"))) { 
 //BA.debugLineNum = 495;BA.debugLine="If res.Get(\"success\") = True Then";
if ((_res.Get((Object)("success"))).equals((Object)(anywheresoftware.b4a.keywords.Common.True))) { 
 //BA.debugLineNum = 496;BA.debugLine="pnlpreview.SetVisibleAnimated(500,True)";
mostCurrent._pnlpreview.SetVisibleAnimated((int) (500),anywheresoftware.b4a.keywords.Common.True);
 //BA.debugLineNum = 498;BA.debugLine="Dim l1 As List";
_l1 = new anywheresoftware.b4a.objects.collections.List();
 //BA.debugLineNum = 499;BA.debugLine="Dim temp As Map";
_temp = new anywheresoftware.b4a.objects.collections.Map();
 //BA.debugLineNum = 500;BA.debugLine="Dim top As Int";
_top = 0;
 //BA.debugLineNum = 502;BA.debugLine="l1.Initialize";
_l1.Initialize();
 //BA.debugLineNum = 504;BA.debugLine="timerScroll.Initialize(\"tmrScroll\",1300)";
mostCurrent._timerscroll.Initialize(processBA,"tmrScroll",(long) (1300));
 //BA.debugLineNum = 506;BA.debugLine="svpreview.Panel.Height = 0";
mostCurrent._svpreview.getPanel().setHeight((int) (0));
 //BA.debugLineNum = 507;BA.debugLine="svpreview.ScrollPosition = 0";
mostCurrent._svpreview.setScrollPosition((int) (0));
 //BA.debugLineNum = 508;BA.debugLine="svpreview.Panel.RemoveAllViews";
mostCurrent._svpreview.getPanel().RemoveAllViews();
 //BA.debugLineNum = 510;BA.debugLine="temp = res.Get(\"data\")";
_temp.setObject((anywheresoftware.b4a.objects.collections.Map.MyMap)(_res.Get((Object)("data"))));
 //BA.debugLineNum = 511;BA.debugLine="order_id = temp.Get(\"order_id\")";
mostCurrent._order_id = BA.ObjectToString(_temp.Get((Object)("order_id")));
 //BA.debugLineNum = 513;BA.debugLine="top = 0";
_top = (int) (0);
 //BA.debugLineNum = 514;BA.debugLine="l1 = temp.Get(\"products\")";
_l1.setObject((java.util.List)(_temp.Get((Object)("products"))));
 //BA.debugLineNum = 516;BA.debugLine="For i = 0 To l1.Size - 1";
{
final int step28 = 1;
final int limit28 = (int) (_l1.getSize()-1);
for (_i = (int) (0) ; (step28 > 0 && _i <= limit28) || (step28 < 0 && _i >= limit28); _i = ((int)(0 + _i + step28)) ) {
 //BA.debugLineNum = 518;BA.debugLine="Dim temp1 As Map";
_temp1 = new anywheresoftware.b4a.objects.collections.Map();
 //BA.debugLineNum = 519;BA.debugLine="temp1 = l1.Get(i)";
_temp1.setObject((anywheresoftware.b4a.objects.collections.Map.MyMap)(_l1.Get(_i)));
 //BA.debugLineNum = 521;BA.debugLine="Dim p1 As Panel";
_p1 = new anywheresoftware.b4a.objects.PanelWrapper();
 //BA.debugLineNum = 522;BA.debugLine="p1.Initialize(\"\")";
_p1.Initialize(mostCurrent.activityBA,"");
 //BA.debugLineNum = 523;BA.debugLine="svpreview.Panel.AddView(p1,0,top,svpreview.Wid";
mostCurrent._svpreview.getPanel().AddView((android.view.View)(_p1.getObject()),(int) (0),_top,mostCurrent._svpreview.getWidth(),(int) (0));
 //BA.debugLineNum = 525;BA.debugLine="p1.LoadLayout(\"frmsimple_product\")";
_p1.LoadLayout("frmsimple_product",mostCurrent.activityBA);
 //BA.debugLineNum = 526;BA.debugLine="btnreturn.Enabled = False";
mostCurrent._btnreturn.setEnabled(anywheresoftware.b4a.keywords.Common.False);
 //BA.debugLineNum = 527;BA.debugLine="btnreturn.Text = \"\"";
mostCurrent._btnreturn.setText(BA.ObjectToCharSequence(""));
 //BA.debugLineNum = 528;BA.debugLine="btnreturn.TextColor = Colors.Green";
mostCurrent._btnreturn.setTextColor(anywheresoftware.b4a.keywords.Common.Colors.Green);
 //BA.debugLineNum = 529;BA.debugLine="p1.Height = pnl_item_product.Height";
_p1.setHeight(mostCurrent._pnl_item_product.getHeight());
 //BA.debugLineNum = 531;BA.debugLine="top = top + p1.Height + 5dip";
_top = (int) (_top+_p1.getHeight()+anywheresoftware.b4a.keywords.Common.DipToCurrent((int) (5)));
 //BA.debugLineNum = 533;BA.debugLine="lblname_product.Text = temp1.Get(\"name\")";
mostCurrent._lblname_product.setText(BA.ObjectToCharSequence(_temp1.Get((Object)("name"))));
 //BA.debugLineNum = 534;BA.debugLine="lblprice_quantity.Text = temp1.Get(\"price\") &";
mostCurrent._lblprice_quantity.setText(BA.ObjectToCharSequence(BA.ObjectToString(_temp1.Get((Object)("price")))+" "+mostCurrent._library._getstringresourse(mostCurrent.activityBA,"cart_product_count")+" "+BA.ObjectToString(_temp1.Get((Object)("quantity")))));
 //BA.debugLineNum = 535;BA.debugLine="lblname_product.Gravity = Library.GetStringRes";
mostCurrent._lblname_product.setGravity((int)(Double.parseDouble(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"direction"))));
 //BA.debugLineNum = 536;BA.debugLine="lblprice_quantity.Gravity = Library.GetStringR";
mostCurrent._lblprice_quantity.setGravity((int)(Double.parseDouble(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"direction"))));
 //BA.debugLineNum = 537;BA.debugLine="lblprice_quantity.Typeface = Library.GetFont";
mostCurrent._lblprice_quantity.setTypeface((android.graphics.Typeface)(mostCurrent._library._getfont(mostCurrent.activityBA).getObject()));
 //BA.debugLineNum = 538;BA.debugLine="lblprice_quantity.Typeface = Library.GetFont";
mostCurrent._lblprice_quantity.setTypeface((android.graphics.Typeface)(mostCurrent._library._getfont(mostCurrent.activityBA).getObject()));
 //BA.debugLineNum = 540;BA.debugLine="svpreview.Panel.Height = svpreview.Panel.Heigh";
mostCurrent._svpreview.getPanel().setHeight((int) (mostCurrent._svpreview.getPanel().getHeight()+_p1.getHeight()));
 }
};
 //BA.debugLineNum = 544;BA.debugLine="top = top + 5dip";
_top = (int) (_top+anywheresoftware.b4a.keywords.Common.DipToCurrent((int) (5)));
 //BA.debugLineNum = 546;BA.debugLine="If temp.ContainsKey(\"totals\") Then";
if (_temp.ContainsKey((Object)("totals"))) { 
 //BA.debugLineNum = 547;BA.debugLine="Dim l2 As List";
_l2 = new anywheresoftware.b4a.objects.collections.List();
 //BA.debugLineNum = 548;BA.debugLine="l2 = temp.Get(\"totals\")";
_l2.setObject((java.util.List)(_temp.Get((Object)("totals"))));
 //BA.debugLineNum = 550;BA.debugLine="For j = 0 To l2.Size - 1";
{
final int step52 = 1;
final int limit52 = (int) (_l2.getSize()-1);
for (_j = (int) (0) ; (step52 > 0 && _j <= limit52) || (step52 < 0 && _j >= limit52); _j = ((int)(0 + _j + step52)) ) {
 //BA.debugLineNum = 552;BA.debugLine="Dim tm As Map";
_tm = new anywheresoftware.b4a.objects.collections.Map();
 //BA.debugLineNum = 553;BA.debugLine="tm = l2.Get(j)";
_tm.setObject((anywheresoftware.b4a.objects.collections.Map.MyMap)(_l2.Get(_j)));
 //BA.debugLineNum = 555;BA.debugLine="Dim lbl1 As Label";
_lbl1 = new anywheresoftware.b4a.objects.LabelWrapper();
 //BA.debugLineNum = 556;BA.debugLine="lbl1.Initialize(\"\")";
_lbl1.Initialize(mostCurrent.activityBA,"");
 //BA.debugLineNum = 557;BA.debugLine="lbl1.TextColor = Colors.Black";
_lbl1.setTextColor(anywheresoftware.b4a.keywords.Common.Colors.Black);
 //BA.debugLineNum = 558;BA.debugLine="lbl1.Typeface = Library.GetFont";
_lbl1.setTypeface((android.graphics.Typeface)(mostCurrent._library._getfont(mostCurrent.activityBA).getObject()));
 //BA.debugLineNum = 559;BA.debugLine="lbl1.TextSize = 14";
_lbl1.setTextSize((float) (14));
 //BA.debugLineNum = 560;BA.debugLine="lbl1.Gravity = Library.GetStringResourse(\"dir";
_lbl1.setGravity((int)(Double.parseDouble(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"direction"))));
 //BA.debugLineNum = 561;BA.debugLine="lbl1.Text = Library.BoldString(tm.Get(\"title\"";
_lbl1.setText(BA.ObjectToCharSequence(mostCurrent._library._boldstring(mostCurrent.activityBA,BA.ObjectToString(_tm.Get((Object)("title")))+" : {c}{b}"+BA.ObjectToString(_tm.Get((Object)("text")))+"{b}{c}").getObject()));
 //BA.debugLineNum = 563;BA.debugLine="svpreview.Panel.AddView(lbl1,10dip,top,svprev";
mostCurrent._svpreview.getPanel().AddView((android.view.View)(_lbl1.getObject()),anywheresoftware.b4a.keywords.Common.DipToCurrent((int) (10)),_top,(int) (mostCurrent._svpreview.getWidth()-anywheresoftware.b4a.keywords.Common.DipToCurrent((int) (30))),anywheresoftware.b4a.keywords.Common.DipToCurrent((int) (50)));
 //BA.debugLineNum = 564;BA.debugLine="svpreview.Panel.Height = svpreview.Panel.Heig";
mostCurrent._svpreview.getPanel().setHeight((int) (mostCurrent._svpreview.getPanel().getHeight()+_lbl1.getHeight()));
 //BA.debugLineNum = 566;BA.debugLine="top = top + lbl1.Height + 5dip";
_top = (int) (_top+_lbl1.getHeight()+anywheresoftware.b4a.keywords.Common.DipToCurrent((int) (5)));
 }
};
 };
 //BA.debugLineNum = 572;BA.debugLine="svpreview.Panel.Height = svpreview.Panel.Height";
mostCurrent._svpreview.getPanel().setHeight((int) (mostCurrent._svpreview.getPanel().getHeight()+100));
 //BA.debugLineNum = 573;BA.debugLine="top = svpreview.Panel.Height";
_top = mostCurrent._svpreview.getPanel().getHeight();
 //BA.debugLineNum = 575;BA.debugLine="Dim v As WebView";
_v = new anywheresoftware.b4a.objects.WebViewWrapper();
 //BA.debugLineNum = 576;BA.debugLine="Dim html1 As Html";
_html1 = new uk.co.martinpearman.b4a.text.Html();
 //BA.debugLineNum = 577;BA.debugLine="v.Initialize(\"\")";
_v.Initialize(mostCurrent.activityBA,"");
 //BA.debugLineNum = 578;BA.debugLine="v.ZoomEnabled = False";
_v.setZoomEnabled(anywheresoftware.b4a.keywords.Common.False);
 //BA.debugLineNum = 579;BA.debugLine="svpreview.Panel.AddView(v,10dip,top,svpreview.W";
mostCurrent._svpreview.getPanel().AddView((android.view.View)(_v.getObject()),anywheresoftware.b4a.keywords.Common.DipToCurrent((int) (10)),_top,(int) (mostCurrent._svpreview.getWidth()-anywheresoftware.b4a.keywords.Common.DipToCurrent((int) (10))),anywheresoftware.b4a.keywords.Common.DipToCurrent((int) (630)));
 //BA.debugLineNum = 581;BA.debugLine="Dim style As String";
_style = "";
 //BA.debugLineNum = 582;BA.debugLine="style = $\"<body style=\"background-color:#F7F4F4";
_style = ("<body style=\"background-color:#F7F4F4;line-height:25px;font-family:tahoma;");
 //BA.debugLineNum = 584;BA.debugLine="If Library.IsPersian Then";
if (mostCurrent._library._ispersian(mostCurrent.activityBA)) { 
 //BA.debugLineNum = 585;BA.debugLine="style = style & $\"direction:rtl\">\"$";
_style = _style+("direction:rtl\">");
 }else {
 //BA.debugLineNum = 587;BA.debugLine="style = style & $\"direction:ltr\">\"$";
_style = _style+("direction:ltr\">");
 };
 //BA.debugLineNum = 590;BA.debugLine="Dim extra As String";
_extra = "";
 //BA.debugLineNum = 591;BA.debugLine="extra = temp.GetValueAt(temp.Size-1)";
_extra = BA.ObjectToString(_temp.GetValueAt((int) (_temp.getSize()-1)));
 //BA.debugLineNum = 593;BA.debugLine="If extra.StartsWith(\"[{\") Then";
if (_extra.startsWith("[{")) { 
 //BA.debugLineNum = 594;BA.debugLine="extra = \"\"";
_extra = "";
 };
 //BA.debugLineNum = 597;BA.debugLine="extra = extra.Replace(\"[]\",\"\").Replace(\"{}\",\"\")";
_extra = _extra.replace("[]","").replace("{}","");
 //BA.debugLineNum = 598;BA.debugLine="extra = extra.Replace(\"<br/>\",\"{br}\")";
_extra = _extra.replace("<br/>","{br}");
 //BA.debugLineNum = 599;BA.debugLine="extra = extra.Replace(\"<br />\",\"{br}\")";
_extra = _extra.replace("<br />","{br}");
 //BA.debugLineNum = 600;BA.debugLine="extra = extra.Replace(\"<br>\",\"{br}\")";
_extra = _extra.replace("<br>","{br}");
 //BA.debugLineNum = 601;BA.debugLine="extra = html1.FromHtml(extra)";
_extra = BA.ObjectToString(_html1.FromHtml(_extra));
 //BA.debugLineNum = 602;BA.debugLine="extra = extra.Replace(\"{br}\",\"<br/>\")";
_extra = _extra.replace("{br}","<br/>");
 //BA.debugLineNum = 604;BA.debugLine="v.LoadHtml(style & extra)";
_v.LoadHtml(_style+_extra);
 //BA.debugLineNum = 606;BA.debugLine="svpreview.Panel.Height = svpreview.Panel.Height";
mostCurrent._svpreview.getPanel().setHeight((int) (mostCurrent._svpreview.getPanel().getHeight()+_v.getHeight()));
 //BA.debugLineNum = 608;BA.debugLine="timerScroll.Enabled = True";
mostCurrent._timerscroll.setEnabled(anywheresoftware.b4a.keywords.Common.True);
 //BA.debugLineNum = 610;BA.debugLine="Return";
if (true) return "";
 };
 };
 //BA.debugLineNum = 617;BA.debugLine="MyToastMessageShow.ShowToastMessageShow(Library.G";
mostCurrent._mytoastmessageshow._showtoastmessageshow(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"error_net_title"),(long) (1.5),anywheresoftware.b4a.keywords.Common.False);
 //BA.debugLineNum = 619;BA.debugLine="End Sub";
return "";
}
public static String  _getways_receive(anywheresoftware.b4a.objects.collections.Map _res,String _cat) throws Exception{
anywheresoftware.b4a.objects.collections.Map _methods = null;
anywheresoftware.b4a.objects.PanelWrapper _pnld = null;
int _t = 0;
int _i = 0;
anywheresoftware.b4a.objects.collections.Map _temp = null;
anywheresoftware.b4a.objects.CompoundButtonWrapper.RadioButtonWrapper _lblkey = null;
com.apps.demo.opencart _payments = null;
 //BA.debugLineNum = 280;BA.debugLine="Sub Getways_receive(res As Map,cat As String)";
 //BA.debugLineNum = 282;BA.debugLine="If res.ContainsKey(\"success\") Then";
if (_res.ContainsKey((Object)("success"))) { 
 //BA.debugLineNum = 283;BA.debugLine="If res.Get(\"success\") = True Then";
if ((_res.Get((Object)("success"))).equals((Object)(anywheresoftware.b4a.keywords.Common.True))) { 
 //BA.debugLineNum = 285;BA.debugLine="Dim methods As Map";
_methods = new anywheresoftware.b4a.objects.collections.Map();
 //BA.debugLineNum = 286;BA.debugLine="methods = res.Get(\"data\")";
_methods.setObject((anywheresoftware.b4a.objects.collections.Map.MyMap)(_res.Get((Object)("data"))));
 //BA.debugLineNum = 287;BA.debugLine="methods = methods.Get(\"payment_methods\")";
_methods.setObject((anywheresoftware.b4a.objects.collections.Map.MyMap)(_methods.Get((Object)("payment_methods"))));
 //BA.debugLineNum = 289;BA.debugLine="topSv = lblpayment.Height";
_topsv = mostCurrent._lblpayment.getHeight();
 //BA.debugLineNum = 291;BA.debugLine="Dim pnlD As Panel";
_pnld = new anywheresoftware.b4a.objects.PanelWrapper();
 //BA.debugLineNum = 292;BA.debugLine="pnlD.Initialize(\"\")";
_pnld.Initialize(mostCurrent.activityBA,"");
 //BA.debugLineNum = 294;BA.debugLine="sv1.Panel.AddView(pnlD,0,topSv,sv1.Width,method";
mostCurrent._sv1.getPanel().AddView((android.view.View)(_pnld.getObject()),(int) (0),_topsv,mostCurrent._sv1.getWidth(),(int) (_methods.getSize()*anywheresoftware.b4a.keywords.Common.DipToCurrent((int) (40))));
 //BA.debugLineNum = 296;BA.debugLine="Dim t As Int";
_t = 0;
 //BA.debugLineNum = 297;BA.debugLine="For i = 0 To methods.Size - 1";
{
final int step11 = 1;
final int limit11 = (int) (_methods.getSize()-1);
for (_i = (int) (0) ; (step11 > 0 && _i <= limit11) || (step11 < 0 && _i >= limit11); _i = ((int)(0 + _i + step11)) ) {
 //BA.debugLineNum = 298;BA.debugLine="Dim temp As Map";
_temp = new anywheresoftware.b4a.objects.collections.Map();
 //BA.debugLineNum = 299;BA.debugLine="temp = methods.Get(methods.GetKeyAt(i))";
_temp.setObject((anywheresoftware.b4a.objects.collections.Map.MyMap)(_methods.Get(_methods.GetKeyAt(_i))));
 //BA.debugLineNum = 300;BA.debugLine="Dim lblKey As RadioButton";
_lblkey = new anywheresoftware.b4a.objects.CompoundButtonWrapper.RadioButtonWrapper();
 //BA.debugLineNum = 301;BA.debugLine="lblKey.Initialize(\"rbpayment\")";
_lblkey.Initialize(mostCurrent.activityBA,"rbpayment");
 //BA.debugLineNum = 302;BA.debugLine="lblKey.Tag = temp.Get(\"code\")";
_lblkey.setTag(_temp.Get((Object)("code")));
 //BA.debugLineNum = 303;BA.debugLine="lblKey.Text = \"   \" & temp.Get(\"title\")";
_lblkey.setText(BA.ObjectToCharSequence("   "+BA.ObjectToString(_temp.Get((Object)("title")))));
 //BA.debugLineNum = 304;BA.debugLine="pnlD.AddView(lblKey,sv1.Left+10dip,t,sv1.Width";
_pnld.AddView((android.view.View)(_lblkey.getObject()),(int) (mostCurrent._sv1.getLeft()+anywheresoftware.b4a.keywords.Common.DipToCurrent((int) (10))),_t,mostCurrent._sv1.getWidth(),anywheresoftware.b4a.keywords.Common.DipToCurrent((int) (40)));
 //BA.debugLineNum = 305;BA.debugLine="ChangeRBStyle(lblKey)";
_changerbstyle(_lblkey);
 //BA.debugLineNum = 306;BA.debugLine="t = t + 40dip";
_t = (int) (_t+anywheresoftware.b4a.keywords.Common.DipToCurrent((int) (40)));
 }
};
 //BA.debugLineNum = 310;BA.debugLine="sv1.Panel.Height = sv1.Panel.Height + pnlD.Heig";
mostCurrent._sv1.getPanel().setHeight((int) (mostCurrent._sv1.getPanel().getHeight()+_pnld.getHeight()));
 //BA.debugLineNum = 312;BA.debugLine="topSv = pnlD.Height + pnlD.Top + 40dip";
_topsv = (int) (_pnld.getHeight()+_pnld.getTop()+anywheresoftware.b4a.keywords.Common.DipToCurrent((int) (40)));
 //BA.debugLineNum = 314;BA.debugLine="lblship.Top = topSv - lblpayment.Height";
mostCurrent._lblship.setTop((int) (_topsv-mostCurrent._lblpayment.getHeight()));
 //BA.debugLineNum = 316;BA.debugLine="lblpb.Text = Library.GetStringResourse(\"apply\")";
mostCurrent._lblpb.setText(BA.ObjectToCharSequence(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"apply")));
 //BA.debugLineNum = 318;BA.debugLine="Dim payments As OpenCart";
_payments = new com.apps.demo.opencart();
 //BA.debugLineNum = 319;BA.debugLine="payments.Initialize";
_payments._initialize(processBA);
 //BA.debugLineNum = 320;BA.debugLine="payments.GetShipMethods(Me,\"ship_receive\")";
_payments._getshipmethods(actdoorder.getObject(),"ship_receive");
 };
 };
 //BA.debugLineNum = 325;BA.debugLine="pnlloading.SetVisibleAnimated(500,False)";
mostCurrent._pnlloading.SetVisibleAnimated((int) (500),anywheresoftware.b4a.keywords.Common.False);
 //BA.debugLineNum = 327;BA.debugLine="End Sub";
return "";
}
public static String  _globals() throws Exception{
 //BA.debugLineNum = 10;BA.debugLine="Sub Globals";
 //BA.debugLineNum = 11;BA.debugLine="Private lblship As Label";
mostCurrent._lblship = new anywheresoftware.b4a.objects.LabelWrapper();
 //BA.debugLineNum = 12;BA.debugLine="Private lblpayment As Label";
mostCurrent._lblpayment = new anywheresoftware.b4a.objects.LabelWrapper();
 //BA.debugLineNum = 13;BA.debugLine="Private btnpayment As Button";
mostCurrent._btnpayment = new anywheresoftware.b4a.objects.ButtonWrapper();
 //BA.debugLineNum = 14;BA.debugLine="Private pnlheader As Panel";
mostCurrent._pnlheader = new anywheresoftware.b4a.objects.PanelWrapper();
 //BA.debugLineNum = 15;BA.debugLine="Private pnlloading As Panel";
mostCurrent._pnlloading = new anywheresoftware.b4a.objects.PanelWrapper();
 //BA.debugLineNum = 16;BA.debugLine="Private lblpb As Label";
mostCurrent._lblpb = new anywheresoftware.b4a.objects.LabelWrapper();
 //BA.debugLineNum = 17;BA.debugLine="Private lbltitle As Label";
mostCurrent._lbltitle = new anywheresoftware.b4a.objects.LabelWrapper();
 //BA.debugLineNum = 18;BA.debugLine="Private currentPaymentCode As String";
mostCurrent._currentpaymentcode = "";
 //BA.debugLineNum = 19;BA.debugLine="Private sv1 As ScrollView";
mostCurrent._sv1 = new anywheresoftware.b4a.objects.ScrollViewWrapper();
 //BA.debugLineNum = 20;BA.debugLine="Private topSv As Int = 0";
_topsv = (int) (0);
 //BA.debugLineNum = 21;BA.debugLine="Private svpreview As ScrollView";
mostCurrent._svpreview = new anywheresoftware.b4a.objects.ScrollViewWrapper();
 //BA.debugLineNum = 22;BA.debugLine="Private btncontinue As Button";
mostCurrent._btncontinue = new anywheresoftware.b4a.objects.ButtonWrapper();
 //BA.debugLineNum = 23;BA.debugLine="Private pnlpreview As Panel";
mostCurrent._pnlpreview = new anywheresoftware.b4a.objects.PanelWrapper();
 //BA.debugLineNum = 24;BA.debugLine="Private lblname_product As Label";
mostCurrent._lblname_product = new anywheresoftware.b4a.objects.LabelWrapper();
 //BA.debugLineNum = 25;BA.debugLine="Private lblprice_quantity As Label";
mostCurrent._lblprice_quantity = new anywheresoftware.b4a.objects.LabelWrapper();
 //BA.debugLineNum = 26;BA.debugLine="Private pnl_item_product As Panel";
mostCurrent._pnl_item_product = new anywheresoftware.b4a.objects.PanelWrapper();
 //BA.debugLineNum = 27;BA.debugLine="Private order_id As String";
mostCurrent._order_id = "";
 //BA.debugLineNum = 28;BA.debugLine="Dim MyToastMessageShow As MyToastMessageShow";
mostCurrent._mytoastmessageshow = new com.apps.demo.mytoastmessageshow();
 //BA.debugLineNum = 29;BA.debugLine="Private btnreturn As Button";
mostCurrent._btnreturn = new anywheresoftware.b4a.objects.ButtonWrapper();
 //BA.debugLineNum = 30;BA.debugLine="Private timerScroll As Timer";
mostCurrent._timerscroll = new anywheresoftware.b4a.objects.Timer();
 //BA.debugLineNum = 31;BA.debugLine="Private lbladdr As Label";
mostCurrent._lbladdr = new anywheresoftware.b4a.objects.LabelWrapper();
 //BA.debugLineNum = 32;BA.debugLine="Private lsaddr As ListView";
mostCurrent._lsaddr = new anywheresoftware.b4a.objects.ListViewWrapper();
 //BA.debugLineNum = 33;BA.debugLine="Private pnladdr As Panel";
mostCurrent._pnladdr = new anywheresoftware.b4a.objects.PanelWrapper();
 //BA.debugLineNum = 34;BA.debugLine="Private txtcomment As EditText";
mostCurrent._txtcomment = new anywheresoftware.b4a.objects.EditTextWrapper();
 //BA.debugLineNum = 35;BA.debugLine="Private lblcomment As Label";
mostCurrent._lblcomment = new anywheresoftware.b4a.objects.LabelWrapper();
 //BA.debugLineNum = 36;BA.debugLine="Private btnnewaddress As Button";
mostCurrent._btnnewaddress = new anywheresoftware.b4a.objects.ButtonWrapper();
 //BA.debugLineNum = 37;BA.debugLine="Private CurrentAddressChooser As String";
mostCurrent._currentaddresschooser = "";
 //BA.debugLineNum = 38;BA.debugLine="End Sub";
return "";
}
public static String  _listaddressship_receive(anywheresoftware.b4a.objects.collections.Map _res,String _cat) throws Exception{
 //BA.debugLineNum = 165;BA.debugLine="Sub ListAddressShip_receive(res As Map,cat As Stri";
 //BA.debugLineNum = 167;BA.debugLine="End Sub";
return "";
}
public static String  _listpaymentgaddress_receive(anywheresoftware.b4a.objects.collections.Map _res,String _cat) throws Exception{
anywheresoftware.b4a.objects.collections.Map _d1 = null;
anywheresoftware.b4a.objects.collections.List _addr = null;
int _i = 0;
anywheresoftware.b4a.objects.collections.Map _temp = null;
 //BA.debugLineNum = 169;BA.debugLine="Sub ListPaymentgAddress_receive(res As Map,cat As";
 //BA.debugLineNum = 171;BA.debugLine="If res.ContainsKey(\"success\") Then";
if (_res.ContainsKey((Object)("success"))) { 
 //BA.debugLineNum = 172;BA.debugLine="If res.Get(\"success\") = True Then";
if ((_res.Get((Object)("success"))).equals((Object)(anywheresoftware.b4a.keywords.Common.True))) { 
 //BA.debugLineNum = 174;BA.debugLine="Dim d1 As Map";
_d1 = new anywheresoftware.b4a.objects.collections.Map();
 //BA.debugLineNum = 175;BA.debugLine="Dim addr As List";
_addr = new anywheresoftware.b4a.objects.collections.List();
 //BA.debugLineNum = 176;BA.debugLine="d1 = res.Get(\"data\")";
_d1.setObject((anywheresoftware.b4a.objects.collections.Map.MyMap)(_res.Get((Object)("data"))));
 //BA.debugLineNum = 177;BA.debugLine="addr = d1.Get(\"addresses\")";
_addr.setObject((java.util.List)(_d1.Get((Object)("addresses"))));
 //BA.debugLineNum = 179;BA.debugLine="For i = 0 To addr.Size - 1";
{
final int step7 = 1;
final int limit7 = (int) (_addr.getSize()-1);
for (_i = (int) (0) ; (step7 > 0 && _i <= limit7) || (step7 < 0 && _i >= limit7); _i = ((int)(0 + _i + step7)) ) {
 //BA.debugLineNum = 181;BA.debugLine="Dim temp As Map";
_temp = new anywheresoftware.b4a.objects.collections.Map();
 //BA.debugLineNum = 182;BA.debugLine="temp = addr.Get(i)";
_temp.setObject((anywheresoftware.b4a.objects.collections.Map.MyMap)(_addr.Get(_i)));
 //BA.debugLineNum = 184;BA.debugLine="lsaddr.AddSingleLine2($\"  ${temp.Get(\"country\"";
mostCurrent._lsaddr.AddSingleLine2(BA.ObjectToCharSequence(("  "+anywheresoftware.b4a.keywords.Common.SmartStringFormatter("",_temp.Get((Object)("country")))+" "+anywheresoftware.b4a.keywords.Common.SmartStringFormatter("",_temp.Get((Object)("city")))+" "+anywheresoftware.b4a.keywords.Common.SmartStringFormatter("",_temp.Get((Object)("address_1")))+"  ")),_temp.Get((Object)("address_id")));
 }
};
 //BA.debugLineNum = 188;BA.debugLine="pnladdr.BringToFront";
mostCurrent._pnladdr.BringToFront();
 //BA.debugLineNum = 189;BA.debugLine="pnladdr.SetVisibleAnimated(700,True)";
mostCurrent._pnladdr.SetVisibleAnimated((int) (700),anywheresoftware.b4a.keywords.Common.True);
 //BA.debugLineNum = 191;BA.debugLine="Return";
if (true) return "";
 };
 };
 //BA.debugLineNum = 196;BA.debugLine="End Sub";
return "";
}
public static String  _listshippingaddress_receive(anywheresoftware.b4a.objects.collections.Map _res,String _cat) throws Exception{
com.apps.demo.opencart _opaddressshipping = null;
 //BA.debugLineNum = 198;BA.debugLine="Sub ListShippingAddress_receive(res As Map,cat As";
 //BA.debugLineNum = 200;BA.debugLine="Dim opAddressShipping As OpenCart";
_opaddressshipping = new com.apps.demo.opencart();
 //BA.debugLineNum = 201;BA.debugLine="opAddressShipping.Initialize";
_opaddressshipping._initialize(processBA);
 //BA.debugLineNum = 202;BA.debugLine="opAddressShipping.AddAddress(Me,\"AddAddressShippi";
_opaddressshipping._addaddress(actdoorder.getObject(),"AddAddressShipping_receive",anywheresoftware.b4a.keywords.Common.createMap(new Object[] {(Object)("shipping_address"),(Object)("existing"),(Object)("address_id"),(Object)(mostCurrent._currentaddresschooser)}),anywheresoftware.b4a.keywords.Common.False);
 //BA.debugLineNum = 204;BA.debugLine="End Sub";
return "";
}
public static String  _loaddata() throws Exception{
com.apps.demo.opencart _payments = null;
 //BA.debugLineNum = 155;BA.debugLine="Sub LoadData";
 //BA.debugLineNum = 157;BA.debugLine="pnlloading.SetVisibleAnimated(500,True)";
mostCurrent._pnlloading.SetVisibleAnimated((int) (500),anywheresoftware.b4a.keywords.Common.True);
 //BA.debugLineNum = 159;BA.debugLine="Dim payments As OpenCart";
_payments = new com.apps.demo.opencart();
 //BA.debugLineNum = 160;BA.debugLine="payments.Initialize";
_payments._initialize(processBA);
 //BA.debugLineNum = 161;BA.debugLine="payments.GetPaymentMethods(Me,\"Getways_receive\")";
_payments._getpaymentmethods(actdoorder.getObject(),"Getways_receive");
 //BA.debugLineNum = 163;BA.debugLine="End Sub";
return "";
}
public static String  _lsaddr_itemclick(int _position,Object _value) throws Exception{
com.apps.demo.opencart _opaddresspayment = null;
 //BA.debugLineNum = 257;BA.debugLine="Sub lsaddr_ItemClick (Position As Int, Value As Ob";
 //BA.debugLineNum = 264;BA.debugLine="pnlloading.BringToFront";
mostCurrent._pnlloading.BringToFront();
 //BA.debugLineNum = 265;BA.debugLine="pnladdr.SetVisibleAnimated(500,False)";
mostCurrent._pnladdr.SetVisibleAnimated((int) (500),anywheresoftware.b4a.keywords.Common.False);
 //BA.debugLineNum = 266;BA.debugLine="pnlloading.SetVisibleAnimated(1,True)";
mostCurrent._pnlloading.SetVisibleAnimated((int) (1),anywheresoftware.b4a.keywords.Common.True);
 //BA.debugLineNum = 268;BA.debugLine="txtcomment.Text = txtcomment.Text & CRLF & Librar";
mostCurrent._txtcomment.setText(BA.ObjectToCharSequence(mostCurrent._txtcomment.getText()+anywheresoftware.b4a.keywords.Common.CRLF+mostCurrent._library._getstringresourse(mostCurrent.activityBA,"inapp_buy")));
 //BA.debugLineNum = 270;BA.debugLine="CurrentAddressChooser = Value";
mostCurrent._currentaddresschooser = BA.ObjectToString(_value);
 //BA.debugLineNum = 272;BA.debugLine="Dim opAddressPayment As OpenCart";
_opaddresspayment = new com.apps.demo.opencart();
 //BA.debugLineNum = 273;BA.debugLine="opAddressPayment.Initialize";
_opaddresspayment._initialize(processBA);
 //BA.debugLineNum = 274;BA.debugLine="opAddressPayment.AddAddress(Me,\"AddPaymentAddress";
_opaddresspayment._addaddress(actdoorder.getObject(),"AddPaymentAddress_receive",anywheresoftware.b4a.keywords.Common.createMap(new Object[] {(Object)("payment_address"),(Object)("existing"),(Object)("address_id"),(Object)(mostCurrent._currentaddresschooser)}),anywheresoftware.b4a.keywords.Common.True);
 //BA.debugLineNum = 276;BA.debugLine="End Sub";
return "";
}
public static String  _process_globals() throws Exception{
 //BA.debugLineNum = 6;BA.debugLine="Sub Process_Globals";
 //BA.debugLineNum = 8;BA.debugLine="End Sub";
return "";
}
public static String  _rbpayment_checkedchange(boolean _checked) throws Exception{
anywheresoftware.b4a.objects.CompoundButtonWrapper.RadioButtonWrapper _b1 = null;
com.apps.demo.opencart _opmethod = null;
 //BA.debugLineNum = 686;BA.debugLine="Sub rbpayment_CheckedChange(Checked As Boolean)";
 //BA.debugLineNum = 688;BA.debugLine="Dim b1 As RadioButton";
_b1 = new anywheresoftware.b4a.objects.CompoundButtonWrapper.RadioButtonWrapper();
 //BA.debugLineNum = 689;BA.debugLine="b1 = Sender";
_b1.setObject((android.widget.RadioButton)(anywheresoftware.b4a.keywords.Common.Sender(mostCurrent.activityBA)));
 //BA.debugLineNum = 691;BA.debugLine="pnlloading.SetVisibleAnimated(500,True)";
mostCurrent._pnlloading.SetVisibleAnimated((int) (500),anywheresoftware.b4a.keywords.Common.True);
 //BA.debugLineNum = 693;BA.debugLine="currentPaymentCode = b1.Tag";
mostCurrent._currentpaymentcode = BA.ObjectToString(_b1.getTag());
 //BA.debugLineNum = 695;BA.debugLine="Dim opMethod As OpenCart";
_opmethod = new com.apps.demo.opencart();
 //BA.debugLineNum = 696;BA.debugLine="opMethod.Initialize";
_opmethod._initialize(processBA);
 //BA.debugLineNum = 697;BA.debugLine="opMethod.SetPaymentMethods(Me,\"setPaymentMethod_r";
_opmethod._setpaymentmethods(actdoorder.getObject(),"setPaymentMethod_receive",BA.ObjectToString(_b1.getTag()),mostCurrent._library._getstringresourse(mostCurrent.activityBA,"inapp_buy")+anywheresoftware.b4a.keywords.Common.CRLF+mostCurrent._txtcomment.getText());
 //BA.debugLineNum = 699;BA.debugLine="End Sub";
return "";
}
public static String  _rbship_checkedchange(boolean _checked) throws Exception{
anywheresoftware.b4a.objects.CompoundButtonWrapper.RadioButtonWrapper _b1 = null;
com.apps.demo.opencart _opship = null;
 //BA.debugLineNum = 701;BA.debugLine="Sub rbship_CheckedChange(Checked As Boolean)";
 //BA.debugLineNum = 703;BA.debugLine="Dim b1 As RadioButton";
_b1 = new anywheresoftware.b4a.objects.CompoundButtonWrapper.RadioButtonWrapper();
 //BA.debugLineNum = 704;BA.debugLine="b1 = Sender";
_b1.setObject((android.widget.RadioButton)(anywheresoftware.b4a.keywords.Common.Sender(mostCurrent.activityBA)));
 //BA.debugLineNum = 706;BA.debugLine="pnlloading.SetVisibleAnimated(500,True)";
mostCurrent._pnlloading.SetVisibleAnimated((int) (500),anywheresoftware.b4a.keywords.Common.True);
 //BA.debugLineNum = 708;BA.debugLine="Dim opShip As OpenCart";
_opship = new com.apps.demo.opencart();
 //BA.debugLineNum = 709;BA.debugLine="opShip.Initialize";
_opship._initialize(processBA);
 //BA.debugLineNum = 710;BA.debugLine="opShip.SetShipMethods(Me,\"setShipMethod_receive\",";
_opship._setshipmethods(actdoorder.getObject(),"setShipMethod_receive",BA.ObjectToString(_b1.getTag()),mostCurrent._library._getstringresourse(mostCurrent.activityBA,"inapp_buy")+anywheresoftware.b4a.keywords.Common.CRLF+mostCurrent._txtcomment.getText());
 //BA.debugLineNum = 712;BA.debugLine="End Sub";
return "";
}
public static String  _saveorder_receive(anywheresoftware.b4a.objects.collections.Map _res,String _cat) throws Exception{
anywheresoftware.b4a.objects.collections.Map _m = null;
 //BA.debugLineNum = 632;BA.debugLine="Sub SaveOrder_receive(res As Map,cat As String)";
 //BA.debugLineNum = 634;BA.debugLine="pnlloading.SetVisibleAnimated(500,False)";
mostCurrent._pnlloading.SetVisibleAnimated((int) (500),anywheresoftware.b4a.keywords.Common.False);
 //BA.debugLineNum = 635;BA.debugLine="pnlpreview.SetVisibleAnimated(500,True)";
mostCurrent._pnlpreview.SetVisibleAnimated((int) (500),anywheresoftware.b4a.keywords.Common.True);
 //BA.debugLineNum = 637;BA.debugLine="If res = Null Then";
if (_res== null) { 
 //BA.debugLineNum = 638;BA.debugLine="Msgbox(Library.GetStringResourse(\"error_payment\"";
anywheresoftware.b4a.keywords.Common.Msgbox(BA.ObjectToCharSequence(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"error_payment")),BA.ObjectToCharSequence(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"alert")),mostCurrent.activityBA);
 //BA.debugLineNum = 639;BA.debugLine="Return";
if (true) return "";
 };
 //BA.debugLineNum = 642;BA.debugLine="If res.ContainsKey(\"success\") Then";
if (_res.ContainsKey((Object)("success"))) { 
 //BA.debugLineNum = 645;BA.debugLine="If res.Get(\"success\") = True Then";
if ((_res.Get((Object)("success"))).equals((Object)(anywheresoftware.b4a.keywords.Common.True))) { 
 //BA.debugLineNum = 647;BA.debugLine="Msgbox(Library.GetStringResourse(\"success_payme";
anywheresoftware.b4a.keywords.Common.Msgbox(BA.ObjectToCharSequence(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"success_payment")),BA.ObjectToCharSequence(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"alert")),mostCurrent.activityBA);
 //BA.debugLineNum = 649;BA.debugLine="If Library.GuestLogin.IsInitialized Then";
if (mostCurrent._library._guestlogin.IsInitialized()) { 
 //BA.debugLineNum = 650;BA.debugLine="Dim m As Map";
_m = new anywheresoftware.b4a.objects.collections.Map();
 //BA.debugLineNum = 651;BA.debugLine="Library.GuestLogin = m";
mostCurrent._library._guestlogin = _m;
 //BA.debugLineNum = 652;BA.debugLine="Activity.Finish";
mostCurrent._activity.Finish();
 //BA.debugLineNum = 653;BA.debugLine="Return";
if (true) return "";
 };
 //BA.debugLineNum = 656;BA.debugLine="Activity.Finish";
mostCurrent._activity.Finish();
 //BA.debugLineNum = 658;BA.debugLine="Return";
if (true) return "";
 };
 };
 //BA.debugLineNum = 664;BA.debugLine="pnlloading.SetVisibleAnimated(500,False)";
mostCurrent._pnlloading.SetVisibleAnimated((int) (500),anywheresoftware.b4a.keywords.Common.False);
 //BA.debugLineNum = 665;BA.debugLine="Msgbox(Library.GetStringResourse(\"error_payment\")";
anywheresoftware.b4a.keywords.Common.Msgbox(BA.ObjectToCharSequence(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"error_payment")),BA.ObjectToCharSequence(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"alert")),mostCurrent.activityBA);
 //BA.debugLineNum = 667;BA.debugLine="End Sub";
return "";
}
public static String  _setpaymentmethod_receive(anywheresoftware.b4a.objects.collections.Map _res,String _cat) throws Exception{
 //BA.debugLineNum = 441;BA.debugLine="Sub setPaymentMethod_receive(res As Map,cat As Str";
 //BA.debugLineNum = 443;BA.debugLine="pnlloading.SetVisibleAnimated(500,False)";
mostCurrent._pnlloading.SetVisibleAnimated((int) (500),anywheresoftware.b4a.keywords.Common.False);
 //BA.debugLineNum = 445;BA.debugLine="If res.ContainsKey(\"success\") Then";
if (_res.ContainsKey((Object)("success"))) { 
 //BA.debugLineNum = 446;BA.debugLine="If res.Get(\"success\") = True Then";
if ((_res.Get((Object)("success"))).equals((Object)(anywheresoftware.b4a.keywords.Common.True))) { 
 //BA.debugLineNum = 447;BA.debugLine="Return";
if (true) return "";
 };
 };
 //BA.debugLineNum = 451;BA.debugLine="MyToastMessageShow.ShowToastMessageShow(Library.G";
mostCurrent._mytoastmessageshow._showtoastmessageshow(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"error_net_title"),(long) (1.5),anywheresoftware.b4a.keywords.Common.False);
 //BA.debugLineNum = 453;BA.debugLine="End Sub";
return "";
}
public static String  _setshipmethod_receive(anywheresoftware.b4a.objects.collections.Map _res,String _cat) throws Exception{
 //BA.debugLineNum = 426;BA.debugLine="Sub setShipMethod_receive(res As Map,cat As String";
 //BA.debugLineNum = 428;BA.debugLine="pnlloading.SetVisibleAnimated(500,False)";
mostCurrent._pnlloading.SetVisibleAnimated((int) (500),anywheresoftware.b4a.keywords.Common.False);
 //BA.debugLineNum = 430;BA.debugLine="If res.ContainsKey(\"success\") Then";
if (_res.ContainsKey((Object)("success"))) { 
 //BA.debugLineNum = 431;BA.debugLine="If res.Get(\"success\") = True Then";
if ((_res.Get((Object)("success"))).equals((Object)(anywheresoftware.b4a.keywords.Common.True))) { 
 //BA.debugLineNum = 433;BA.debugLine="Return";
if (true) return "";
 };
 };
 //BA.debugLineNum = 437;BA.debugLine="MyToastMessageShow.ShowToastMessageShow(Library.G";
mostCurrent._mytoastmessageshow._showtoastmessageshow(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"error_net_title"),(long) (1.5),anywheresoftware.b4a.keywords.Common.False);
 //BA.debugLineNum = 439;BA.debugLine="End Sub";
return "";
}
public static String  _ship_receive(anywheresoftware.b4a.objects.collections.Map _res,String _cat) throws Exception{
anywheresoftware.b4a.objects.collections.Map _ref = null;
anywheresoftware.b4a.objects.collections.Map _ships = null;
anywheresoftware.b4a.objects.collections.List _l1 = null;
int _i = 0;
anywheresoftware.b4a.objects.collections.Map _temp = null;
anywheresoftware.b4a.objects.collections.Map _temp1 = null;
anywheresoftware.b4a.objects.CompoundButtonWrapper.RadioButtonWrapper _lblkey = null;
 //BA.debugLineNum = 329;BA.debugLine="Sub ship_receive(res As Map,cat As String)";
 //BA.debugLineNum = 331;BA.debugLine="If res.ContainsKey(\"success\") Then";
if (_res.ContainsKey((Object)("success"))) { 
 //BA.debugLineNum = 333;BA.debugLine="If res.Get(\"success\") = True Then";
if ((_res.Get((Object)("success"))).equals((Object)(anywheresoftware.b4a.keywords.Common.True))) { 
 //BA.debugLineNum = 335;BA.debugLine="Dim ref As Map";
_ref = new anywheresoftware.b4a.objects.collections.Map();
 //BA.debugLineNum = 336;BA.debugLine="Dim ships As Map";
_ships = new anywheresoftware.b4a.objects.collections.Map();
 //BA.debugLineNum = 338;BA.debugLine="ref = res.Get(\"data\")";
_ref.setObject((anywheresoftware.b4a.objects.collections.Map.MyMap)(_res.Get((Object)("data"))));
 //BA.debugLineNum = 349;BA.debugLine="ships = ref.Get(\"shipping_methods\")";
_ships.setObject((anywheresoftware.b4a.objects.collections.Map.MyMap)(_ref.Get((Object)("shipping_methods"))));
 //BA.debugLineNum = 350;BA.debugLine="res = ships.GetValueAt(0)";
_res.setObject((anywheresoftware.b4a.objects.collections.Map.MyMap)(_ships.GetValueAt((int) (0))));
 //BA.debugLineNum = 351;BA.debugLine="ships = res.Get(\"quote\")";
_ships.setObject((anywheresoftware.b4a.objects.collections.Map.MyMap)(_res.Get((Object)("quote"))));
 //BA.debugLineNum = 353;BA.debugLine="Dim l1 As List";
_l1 = new anywheresoftware.b4a.objects.collections.List();
 //BA.debugLineNum = 354;BA.debugLine="l1.Initialize";
_l1.Initialize();
 //BA.debugLineNum = 356;BA.debugLine="For i = 0 To ships.Size - 1";
{
final int step11 = 1;
final int limit11 = (int) (_ships.getSize()-1);
for (_i = (int) (0) ; (step11 > 0 && _i <= limit11) || (step11 < 0 && _i >= limit11); _i = ((int)(0 + _i + step11)) ) {
 //BA.debugLineNum = 358;BA.debugLine="Dim temp,temp1 As Map";
_temp = new anywheresoftware.b4a.objects.collections.Map();
_temp1 = new anywheresoftware.b4a.objects.collections.Map();
 //BA.debugLineNum = 359;BA.debugLine="temp = ships.Get(ships.GetKeyAt(i))";
_temp.setObject((anywheresoftware.b4a.objects.collections.Map.MyMap)(_ships.Get(_ships.GetKeyAt(_i))));
 //BA.debugLineNum = 360;BA.debugLine="temp1 = temp";
_temp1 = _temp;
 //BA.debugLineNum = 362;BA.debugLine="Dim lblKey As RadioButton";
_lblkey = new anywheresoftware.b4a.objects.CompoundButtonWrapper.RadioButtonWrapper();
 //BA.debugLineNum = 363;BA.debugLine="lblKey.Initialize(\"rbship\")";
_lblkey.Initialize(mostCurrent.activityBA,"rbship");
 //BA.debugLineNum = 364;BA.debugLine="lblKey.Tag = temp1.Get(\"code\")";
_lblkey.setTag(_temp1.Get((Object)("code")));
 //BA.debugLineNum = 365;BA.debugLine="lblKey.Text = \"   \" & temp.Get(\"title\")";
_lblkey.setText(BA.ObjectToCharSequence("   "+BA.ObjectToString(_temp.Get((Object)("title")))));
 //BA.debugLineNum = 367;BA.debugLine="ChangeRBStyle(lblKey)";
_changerbstyle(_lblkey);
 //BA.debugLineNum = 369;BA.debugLine="sv1.Panel.AddView(lblKey,sv1.Left+10dip,topSv,";
mostCurrent._sv1.getPanel().AddView((android.view.View)(_lblkey.getObject()),(int) (mostCurrent._sv1.getLeft()+anywheresoftware.b4a.keywords.Common.DipToCurrent((int) (10))),_topsv,mostCurrent._sv1.getWidth(),anywheresoftware.b4a.keywords.Common.DipToCurrent((int) (40)));
 //BA.debugLineNum = 371;BA.debugLine="topSv = topSv + 40dip";
_topsv = (int) (_topsv+anywheresoftware.b4a.keywords.Common.DipToCurrent((int) (40)));
 //BA.debugLineNum = 372;BA.debugLine="sv1.Panel.Height = sv1.Panel.Height + 40dip";
mostCurrent._sv1.getPanel().setHeight((int) (mostCurrent._sv1.getPanel().getHeight()+anywheresoftware.b4a.keywords.Common.DipToCurrent((int) (40))));
 }
};
 //BA.debugLineNum = 376;BA.debugLine="topSv = topSv + lblpayment.Height";
_topsv = (int) (_topsv+mostCurrent._lblpayment.getHeight());
 //BA.debugLineNum = 378;BA.debugLine="topSv = topSv + 40dip";
_topsv = (int) (_topsv+anywheresoftware.b4a.keywords.Common.DipToCurrent((int) (40)));
 //BA.debugLineNum = 379;BA.debugLine="sv1.Panel.Height = sv1.Panel.Height + btnpaymen";
mostCurrent._sv1.getPanel().setHeight((int) (mostCurrent._sv1.getPanel().getHeight()+mostCurrent._btnpayment.getHeight()));
 }else {
 //BA.debugLineNum = 382;BA.debugLine="MyToastMessageShow.ShowToastMessageShow(Library";
mostCurrent._mytoastmessageshow._showtoastmessageshow(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"error_net_title"),(long) (1.5),anywheresoftware.b4a.keywords.Common.False);
 //BA.debugLineNum = 383;BA.debugLine="pnlloading.SetVisibleAnimated(500,False)";
mostCurrent._pnlloading.SetVisibleAnimated((int) (500),anywheresoftware.b4a.keywords.Common.False);
 };
 }else {
 //BA.debugLineNum = 387;BA.debugLine="MyToastMessageShow.ShowToastMessageShow(Library.";
mostCurrent._mytoastmessageshow._showtoastmessageshow(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"error_net_title"),(long) (1.5),anywheresoftware.b4a.keywords.Common.False);
 //BA.debugLineNum = 388;BA.debugLine="pnlloading.SetVisibleAnimated(500,False)";
mostCurrent._pnlloading.SetVisibleAnimated((int) (500),anywheresoftware.b4a.keywords.Common.False);
 };
 //BA.debugLineNum = 391;BA.debugLine="End Sub";
return "";
}
public static String  _tmrscroll_tick() throws Exception{
 //BA.debugLineNum = 621;BA.debugLine="Sub tmrScroll_Tick";
 //BA.debugLineNum = 630;BA.debugLine="End Sub";
return "";
}
}
