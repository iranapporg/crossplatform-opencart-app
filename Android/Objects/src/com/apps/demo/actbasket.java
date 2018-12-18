package com.apps.demo;

import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.Path;
import android.graphics.Rect;
import android.graphics.RectF;
import android.graphics.drawable.BitmapDrawable;
import android.graphics.drawable.Drawable;
import android.graphics.Path.FillType;
import android.graphics.Paint;
import android.graphics.Color;
import android.view.View;
import android.annotation.SuppressLint;
import android.content.Context;
import android.graphics.BitmapShader;
import android.graphics.Shader;
import android.graphics.PorterDuffXfermode;
import android.graphics.PorterDuff.Mode;

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

public class actbasket extends Activity implements B4AActivity{
	public static actbasket mostCurrent;
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
			processBA = new BA(this.getApplicationContext(), null, null, "com.apps.demo", "com.apps.demo.actbasket");
			processBA.loadHtSubs(this.getClass());
	        float deviceScale = getApplicationContext().getResources().getDisplayMetrics().density;
	        BALayout.setDeviceScale(deviceScale);
            
		}
		else if (previousOne != null) {
			Activity p = previousOne.get();
			if (p != null && p != this) {
                BA.LogInfo("Killing previous instance (actbasket).");
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
		activityBA = new BA(this, layout, processBA, "com.apps.demo", "com.apps.demo.actbasket");
        
        processBA.sharedProcessBA.activityBA = new java.lang.ref.WeakReference<BA>(activityBA);
        anywheresoftware.b4a.objects.ViewWrapper.lastId = 0;
        _activity = new ActivityWrapper(activityBA, "activity");
        anywheresoftware.b4a.Msgbox.isDismissing = false;
        if (BA.isShellModeRuntimeCheck(processBA)) {
			if (isFirst)
				processBA.raiseEvent2(null, true, "SHELL", false);
			processBA.raiseEvent2(null, true, "CREATE", true, "com.apps.demo.actbasket", processBA, activityBA, _activity, anywheresoftware.b4a.keywords.Common.Density, mostCurrent);
			_activity.reinitializeForShell(activityBA, "activity");
		}
        initializeProcessGlobals();		
        initializeGlobals();
        
        BA.LogInfo("** Activity (actbasket) Create, isFirst = " + isFirst + " **");
        processBA.raiseEvent2(null, true, "activity_create", false, isFirst);
		isFirst = false;
		if (this != mostCurrent)
			return;
        processBA.setActivityPaused(false);
        BA.LogInfo("** Activity (actbasket) Resume **");
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
		return actbasket.class;
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
        BA.LogInfo("** Activity (actbasket) Pause, UserClosed = " + activityBA.activity.isFinishing() + " **");
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
            BA.LogInfo("** Activity (actbasket) Resume **");
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
public static anywheresoftware.b4a.objects.Timer _timeranimation = null;
public anywheresoftware.b4a.objects.PanelWrapper _pnlheader = null;
public anywheresoftware.b4a.objects.LabelWrapper _lbltitle = null;
public anywheresoftware.b4a.objects.LabelWrapper _lblpb = null;
public anywheresoftware.b4a.objects.PanelWrapper _pnlloading = null;
public anywheresoftware.b4a.objects.ButtonWrapper _btnpayment = null;
public anywheresoftware.b4a.objects.ButtonWrapper _btnclear = null;
public anywheresoftware.b4a.objects.LabelWrapper _lbltotal = null;
public anywheresoftware.b4a.objects.LabelWrapper _lblsabadtitle = null;
public com.apps.demo.opencart _op1 = null;
public anywheresoftware.b4a.objects.SpinnerWrapper _txtcartcount = null;
public anywheresoftware.b4a.objects.LabelWrapper _lblcprice = null;
public anywheresoftware.b4a.objects.LabelWrapper _lblctitle = null;
public anywheresoftware.b4a.objects.ImageViewWrapper _imgicon = null;
public anywheresoftware.b4a.objects.PanelWrapper _pnlitemcart = null;
public anywheresoftware.b4a.objects.ScrollViewWrapper _sv1 = null;
public static int _top = 0;
public anywheresoftware.b4a.objects.LabelWrapper _lblcount = null;
public anywheresoftware.b4a.objects.ButtonWrapper _btncoupon = null;
public anywheresoftware.b4a.objects.LabelWrapper _lblremove_product = null;
public anywheresoftware.b4a.objects.EditTextWrapper _txtcoupon_id = null;
public anywheresoftware.b4a.objects.EditTextWrapper _txtvoucher_id = null;
public anywheresoftware.b4a.objects.ButtonWrapper _btnvoucher = null;
public static boolean _biggersv = false;
public static boolean _doanimatesv = false;
public static int _defaulttopsv = 0;
public static int _defaultheightsv = 0;
public com.apps.demo.mytoastmessageshow _mytoastmessageshow = null;
public static int _itemcountinbasket = 0;
public anywheresoftware.b4a.objects.ButtonWrapper _btnok = null;
public anywheresoftware.b4a.objects.WebViewWrapper _wbattention = null;
public anywheresoftware.b4a.objects.PanelWrapper _pnlattention = null;
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
anywheresoftware.b4a.objects.drawable.ColorDrawable _cd = null;
 //BA.debugLineNum = 42;BA.debugLine="Sub Activity_Create(FirstTime As Boolean)";
 //BA.debugLineNum = 44;BA.debugLine="Library.setLocalApp(Library.currLang)";
mostCurrent._library._setlocalapp(mostCurrent.activityBA,mostCurrent._library._currlang);
 //BA.debugLineNum = 46;BA.debugLine="Activity.LoadLayout(\"frmbasket\")";
mostCurrent._activity.LoadLayout("frmbasket",mostCurrent.activityBA);
 //BA.debugLineNum = 47;BA.debugLine="MyToastMessageShow.Initialize(Activity)";
mostCurrent._mytoastmessageshow._initialize(mostCurrent.activityBA,(anywheresoftware.b4a.objects.PanelWrapper) anywheresoftware.b4a.AbsObjectWrapper.ConvertToWrapper(new anywheresoftware.b4a.objects.PanelWrapper(), (android.view.ViewGroup)(mostCurrent._activity.getObject())));
 //BA.debugLineNum = 49;BA.debugLine="Library.ChangeStatusColor";
mostCurrent._library._changestatuscolor(mostCurrent.activityBA);
 //BA.debugLineNum = 51;BA.debugLine="lbltitle.Text = Library.GetStringResourse(\"basket";
mostCurrent._lbltitle.setText(BA.ObjectToCharSequence(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"basket_title")));
 //BA.debugLineNum = 52;BA.debugLine="lblpb.Text = Library.GetStringResourse(\"loading\")";
mostCurrent._lblpb.setText(BA.ObjectToCharSequence(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"loading")));
 //BA.debugLineNum = 53;BA.debugLine="btnclear.Text = Library.GetStringResourse(\"btncle";
mostCurrent._btnclear.setText(BA.ObjectToCharSequence(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"btnclear")));
 //BA.debugLineNum = 54;BA.debugLine="btnpayment.Text = Library.GetStringResourse(\"btnp";
mostCurrent._btnpayment.setText(BA.ObjectToCharSequence(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"btnpayment")));
 //BA.debugLineNum = 55;BA.debugLine="btnok.Text = Library.GetStringResourse(\"ok\")";
mostCurrent._btnok.setText(BA.ObjectToCharSequence(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"ok")));
 //BA.debugLineNum = 56;BA.debugLine="lblsabadtitle.Text = Library.GetStringResourse(\"b";
mostCurrent._lblsabadtitle.setText(BA.ObjectToCharSequence(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"basket_total")));
 //BA.debugLineNum = 57;BA.debugLine="lblsabadtitle.TextSize = 12";
mostCurrent._lblsabadtitle.setTextSize((float) (12));
 //BA.debugLineNum = 58;BA.debugLine="lbltotal.Text = \"0\"";
mostCurrent._lbltotal.setText(BA.ObjectToCharSequence("0"));
 //BA.debugLineNum = 60;BA.debugLine="btncoupon.Text = Library.GetStringResourse(\"new_c";
mostCurrent._btncoupon.setText(BA.ObjectToCharSequence(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"new_coupon")));
 //BA.debugLineNum = 61;BA.debugLine="txtcoupon_id.Hint = Library.GetStringResourse(\"en";
mostCurrent._txtcoupon_id.setHint(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"enter_coupon"));
 //BA.debugLineNum = 62;BA.debugLine="txtvoucher_id.Hint = Library.GetStringResourse(\"e";
mostCurrent._txtvoucher_id.setHint(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"enter_voucher"));
 //BA.debugLineNum = 63;BA.debugLine="btnvoucher.Text = Library.GetStringResourse(\"new_";
mostCurrent._btnvoucher.setText(BA.ObjectToCharSequence(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"new_voucher")));
 //BA.debugLineNum = 66;BA.debugLine="Dim cd As ColorDrawable";
_cd = new anywheresoftware.b4a.objects.drawable.ColorDrawable();
 //BA.debugLineNum = 67;BA.debugLine="cd.Initialize2(Library.ConvertHex2Int(Library.Get";
_cd.Initialize2((int)(Double.parseDouble(mostCurrent._library._converthex2int(mostCurrent.activityBA,mostCurrent._library._getstringresourse(mostCurrent.activityBA,"category_button")))),(int) (0),(int) (0),anywheresoftware.b4a.keywords.Common.Colors.Gray);
 //BA.debugLineNum = 68;BA.debugLine="btnpayment.Background = cd";
mostCurrent._btnpayment.setBackground((android.graphics.drawable.Drawable)(_cd.getObject()));
 //BA.debugLineNum = 69;BA.debugLine="btnok.Background = cd";
mostCurrent._btnok.setBackground((android.graphics.drawable.Drawable)(_cd.getObject()));
 //BA.debugLineNum = 70;BA.debugLine="btnclear.Color = Colors.Transparent";
mostCurrent._btnclear.setColor(anywheresoftware.b4a.keywords.Common.Colors.Transparent);
 //BA.debugLineNum = 72;BA.debugLine="pnlheader.Color = Library.Theme_Header";
mostCurrent._pnlheader.setColor(mostCurrent._library._theme_header);
 //BA.debugLineNum = 73;BA.debugLine="op1.Initialize";
mostCurrent._op1._initialize(processBA);
 //BA.debugLineNum = 75;BA.debugLine="sv1.Color = Colors.RGB(247, 244, 244)";
mostCurrent._sv1.setColor(anywheresoftware.b4a.keywords.Common.Colors.RGB((int) (247),(int) (244),(int) (244)));
 //BA.debugLineNum = 76;BA.debugLine="sv1.Panel.Color = Colors.RGB(247, 244, 244)";
mostCurrent._sv1.getPanel().setColor(anywheresoftware.b4a.keywords.Common.Colors.RGB((int) (247),(int) (244),(int) (244)));
 //BA.debugLineNum = 78;BA.debugLine="DefaultHeightSV = sv1.Height";
_defaultheightsv = mostCurrent._sv1.getHeight();
 //BA.debugLineNum = 79;BA.debugLine="DefaultTopSV = sv1.Top";
_defaulttopsv = mostCurrent._sv1.getTop();
 //BA.debugLineNum = 81;BA.debugLine="timerAnimation.Initialize(\"tmrAnimation\",1000)";
_timeranimation.Initialize(processBA,"tmrAnimation",(long) (1000));
 //BA.debugLineNum = 83;BA.debugLine="If Library.IsEnglish Then";
if (mostCurrent._library._isenglish(mostCurrent.activityBA)) { 
 //BA.debugLineNum = 84;BA.debugLine="lbltotal.Typeface = Library.GetFont";
mostCurrent._lbltotal.setTypeface((android.graphics.Typeface)(mostCurrent._library._getfont(mostCurrent.activityBA).getObject()));
 //BA.debugLineNum = 85;BA.debugLine="lblsabadtitle.Left = lbltotal.Left";
mostCurrent._lblsabadtitle.setLeft(mostCurrent._lbltotal.getLeft());
 //BA.debugLineNum = 86;BA.debugLine="lbltotal.Left = lblsabadtitle.Left + lblsabadtit";
mostCurrent._lbltotal.setLeft((int) (mostCurrent._lblsabadtitle.getLeft()+mostCurrent._lblsabadtitle.getWidth()));
 //BA.debugLineNum = 87;BA.debugLine="lbltotal.Gravity = Bit.Or(Gravity.RIGHT,Gravity.";
mostCurrent._lbltotal.setGravity(anywheresoftware.b4a.keywords.Common.Bit.Or(anywheresoftware.b4a.keywords.Common.Gravity.RIGHT,anywheresoftware.b4a.keywords.Common.Gravity.CENTER_VERTICAL));
 //BA.debugLineNum = 88;BA.debugLine="lblsabadtitle.Gravity = Bit.Or(Gravity.LEFT,Grav";
mostCurrent._lblsabadtitle.setGravity(anywheresoftware.b4a.keywords.Common.Bit.Or(anywheresoftware.b4a.keywords.Common.Gravity.LEFT,anywheresoftware.b4a.keywords.Common.Gravity.CENTER_VERTICAL));
 };
 //BA.debugLineNum = 91;BA.debugLine="End Sub";
return "";
}
public static boolean  _activity_keypress(int _keycode) throws Exception{
 //BA.debugLineNum = 418;BA.debugLine="Sub Activity_KeyPress (KeyCode As Int) As Boolean";
 //BA.debugLineNum = 420;BA.debugLine="If KeyCode = KeyCodes.KEYCODE_BACK Then";
if (_keycode==anywheresoftware.b4a.keywords.Common.KeyCodes.KEYCODE_BACK) { 
 //BA.debugLineNum = 421;BA.debugLine="Activity.Finish";
mostCurrent._activity.Finish();
 //BA.debugLineNum = 422;BA.debugLine="Return True";
if (true) return anywheresoftware.b4a.keywords.Common.True;
 };
 //BA.debugLineNum = 425;BA.debugLine="End Sub";
return false;
}
public static String  _activity_pause(boolean _userclosed) throws Exception{
 //BA.debugLineNum = 97;BA.debugLine="Sub Activity_Pause (UserClosed As Boolean)";
 //BA.debugLineNum = 98;BA.debugLine="Library.AnimationFromLeft2Right";
mostCurrent._library._animationfromleft2right(mostCurrent.activityBA);
 //BA.debugLineNum = 99;BA.debugLine="End Sub";
return "";
}
public static String  _activity_resume() throws Exception{
 //BA.debugLineNum = 93;BA.debugLine="Sub Activity_Resume";
 //BA.debugLineNum = 94;BA.debugLine="GetCart";
_getcart();
 //BA.debugLineNum = 95;BA.debugLine="End Sub";
return "";
}
public static String  _addcoupon_receive(boolean _state) throws Exception{
 //BA.debugLineNum = 441;BA.debugLine="Sub addcoupon_receive(state As Boolean)";
 //BA.debugLineNum = 443;BA.debugLine="pnlloading.SetVisibleAnimated(500,False)";
mostCurrent._pnlloading.SetVisibleAnimated((int) (500),anywheresoftware.b4a.keywords.Common.False);
 //BA.debugLineNum = 445;BA.debugLine="txtcoupon_id.Text = \"\"";
mostCurrent._txtcoupon_id.setText(BA.ObjectToCharSequence(""));
 //BA.debugLineNum = 447;BA.debugLine="If state = True Then";
if (_state==anywheresoftware.b4a.keywords.Common.True) { 
 //BA.debugLineNum = 448;BA.debugLine="MyToastMessageShow.ShowToastMessageShow(Library.";
mostCurrent._mytoastmessageshow._showtoastmessageshow(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"add_coupon"),(long) (1.5),anywheresoftware.b4a.keywords.Common.True);
 //BA.debugLineNum = 449;BA.debugLine="GetCart";
_getcart();
 //BA.debugLineNum = 450;BA.debugLine="Return";
if (true) return "";
 }else {
 //BA.debugLineNum = 452;BA.debugLine="MyToastMessageShow.ShowToastMessageShow(Library.";
mostCurrent._mytoastmessageshow._showtoastmessageshow(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"no_coupon"),(long) (1.5),anywheresoftware.b4a.keywords.Common.False);
 };
 //BA.debugLineNum = 455;BA.debugLine="End Sub";
return "";
}
public static String  _addvoucher_receive(boolean _state) throws Exception{
 //BA.debugLineNum = 471;BA.debugLine="Sub addvoucher_receive(state As Boolean)";
 //BA.debugLineNum = 473;BA.debugLine="pnlloading.SetVisibleAnimated(500,False)";
mostCurrent._pnlloading.SetVisibleAnimated((int) (500),anywheresoftware.b4a.keywords.Common.False);
 //BA.debugLineNum = 475;BA.debugLine="txtvoucher_id.Text = \"\"";
mostCurrent._txtvoucher_id.setText(BA.ObjectToCharSequence(""));
 //BA.debugLineNum = 477;BA.debugLine="If state = True Then";
if (_state==anywheresoftware.b4a.keywords.Common.True) { 
 //BA.debugLineNum = 478;BA.debugLine="MyToastMessageShow.ShowToastMessageShow(Library.";
mostCurrent._mytoastmessageshow._showtoastmessageshow(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"add_voucher"),(long) (1.5),anywheresoftware.b4a.keywords.Common.True);
 //BA.debugLineNum = 479;BA.debugLine="GetCart";
_getcart();
 //BA.debugLineNum = 480;BA.debugLine="Return";
if (true) return "";
 }else {
 //BA.debugLineNum = 482;BA.debugLine="MyToastMessageShow.ShowToastMessageShow(Library.";
mostCurrent._mytoastmessageshow._showtoastmessageshow(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"no_voucher"),(long) (1.5),anywheresoftware.b4a.keywords.Common.False);
 };
 //BA.debugLineNum = 485;BA.debugLine="End Sub";
return "";
}
public static String  _btnclear_click() throws Exception{
 //BA.debugLineNum = 134;BA.debugLine="Sub btnclear_Click";
 //BA.debugLineNum = 135;BA.debugLine="op1.ClearCart(Me,\"ClearCart_receive\")";
mostCurrent._op1._clearcart(actbasket.getObject(),"ClearCart_receive");
 //BA.debugLineNum = 136;BA.debugLine="End Sub";
return "";
}
public static String  _btnclose_click() throws Exception{
 //BA.debugLineNum = 101;BA.debugLine="Sub btnclose_Click";
 //BA.debugLineNum = 102;BA.debugLine="Activity.Finish";
mostCurrent._activity.Finish();
 //BA.debugLineNum = 103;BA.debugLine="End Sub";
return "";
}
public static String  _btncoupon_click() throws Exception{
com.apps.demo.opencart _coupon = null;
 //BA.debugLineNum = 427;BA.debugLine="Sub btncoupon_Click";
 //BA.debugLineNum = 429;BA.debugLine="If IsNumber(txtcoupon_id.Text) Then";
if (anywheresoftware.b4a.keywords.Common.IsNumber(mostCurrent._txtcoupon_id.getText())) { 
 //BA.debugLineNum = 430;BA.debugLine="Dim coupon As OpenCart";
_coupon = new com.apps.demo.opencart();
 //BA.debugLineNum = 431;BA.debugLine="coupon.Initialize";
_coupon._initialize(processBA);
 //BA.debugLineNum = 432;BA.debugLine="lblpb.Text = Library.GetStringResourse(\"apply\")";
mostCurrent._lblpb.setText(BA.ObjectToCharSequence(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"apply")));
 //BA.debugLineNum = 433;BA.debugLine="pnlloading.SetVisibleAnimated(500,True)";
mostCurrent._pnlloading.SetVisibleAnimated((int) (500),anywheresoftware.b4a.keywords.Common.True);
 //BA.debugLineNum = 434;BA.debugLine="coupon.AddCoupon(Me,\"addcoupon_receive\",txtcoupo";
_coupon._addcoupon(actbasket.getObject(),"addcoupon_receive",mostCurrent._txtcoupon_id.getText());
 }else {
 //BA.debugLineNum = 436;BA.debugLine="MyToastMessageShow.ShowToastMessageShow(Library.";
mostCurrent._mytoastmessageshow._showtoastmessageshow(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"enter_coupon"),(long) (1.5),anywheresoftware.b4a.keywords.Common.False);
 };
 //BA.debugLineNum = 439;BA.debugLine="End Sub";
return "";
}
public static String  _btnok_click() throws Exception{
 //BA.debugLineNum = 524;BA.debugLine="Sub btnok_Click";
 //BA.debugLineNum = 525;BA.debugLine="pnlattention.SetVisibleAnimated(700,False)";
mostCurrent._pnlattention.SetVisibleAnimated((int) (700),anywheresoftware.b4a.keywords.Common.False);
 //BA.debugLineNum = 526;BA.debugLine="End Sub";
return "";
}
public static String  _btnpayment_click() throws Exception{
 //BA.debugLineNum = 105;BA.debugLine="Sub btnpayment_Click";
 //BA.debugLineNum = 107;BA.debugLine="If Library.InternetState = False Then";
if (mostCurrent._library._internetstate(mostCurrent.activityBA)==anywheresoftware.b4a.keywords.Common.False) { 
 //BA.debugLineNum = 108;BA.debugLine="MyToastMessageShow.ShowToastMessageShow(Library.";
mostCurrent._mytoastmessageshow._showtoastmessageshow(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"error_net_details"),(long) (1.5),anywheresoftware.b4a.keywords.Common.False);
 //BA.debugLineNum = 109;BA.debugLine="Return";
if (true) return "";
 };
 //BA.debugLineNum = 112;BA.debugLine="If Library.loginDetails.IsInitialized Then";
if (mostCurrent._library._logindetails.IsInitialized()) { 
 //BA.debugLineNum = 113;BA.debugLine="If Library.loginDetails.Get(\"login\") = True Then";
if ((mostCurrent._library._logindetails.Get((Object)("login"))).equals((Object)(anywheresoftware.b4a.keywords.Common.True))) { 
 //BA.debugLineNum = 114;BA.debugLine="If DateTime.Now - Library.loginDetails.Get(\"exp";
if (anywheresoftware.b4a.keywords.Common.DateTime.getNow()-(double)(BA.ObjectToNumber(mostCurrent._library._logindetails.Get((Object)("expire"))))>1010020) { 
 //BA.debugLineNum = 115;BA.debugLine="StartActivity(actLogin)";
anywheresoftware.b4a.keywords.Common.StartActivity(mostCurrent.activityBA,(Object)(mostCurrent._actlogin.getObject()));
 //BA.debugLineNum = 116;BA.debugLine="Return";
if (true) return "";
 };
 //BA.debugLineNum = 118;BA.debugLine="StartActivity(actDoOrder)";
anywheresoftware.b4a.keywords.Common.StartActivity(mostCurrent.activityBA,(Object)(mostCurrent._actdoorder.getObject()));
 //BA.debugLineNum = 119;BA.debugLine="Return";
if (true) return "";
 };
 };
 //BA.debugLineNum = 123;BA.debugLine="If Library.GuestLogin.IsInitialized Then";
if (mostCurrent._library._guestlogin.IsInitialized()) { 
 //BA.debugLineNum = 124;BA.debugLine="If Library.GuestLogin.Get(\"login\") = True Then";
if ((mostCurrent._library._guestlogin.Get((Object)("login"))).equals((Object)(anywheresoftware.b4a.keywords.Common.True))) { 
 //BA.debugLineNum = 125;BA.debugLine="StartActivity(actDoOrder)";
anywheresoftware.b4a.keywords.Common.StartActivity(mostCurrent.activityBA,(Object)(mostCurrent._actdoorder.getObject()));
 //BA.debugLineNum = 126;BA.debugLine="Return";
if (true) return "";
 };
 };
 //BA.debugLineNum = 130;BA.debugLine="StartActivity(actLogin)";
anywheresoftware.b4a.keywords.Common.StartActivity(mostCurrent.activityBA,(Object)(mostCurrent._actlogin.getObject()));
 //BA.debugLineNum = 132;BA.debugLine="End Sub";
return "";
}
public static String  _btnvoucher_click() throws Exception{
com.apps.demo.opencart _coupon = null;
 //BA.debugLineNum = 457;BA.debugLine="Sub btnvoucher_Click";
 //BA.debugLineNum = 459;BA.debugLine="If IsNumber(txtvoucher_id.Text) Then";
if (anywheresoftware.b4a.keywords.Common.IsNumber(mostCurrent._txtvoucher_id.getText())) { 
 //BA.debugLineNum = 460;BA.debugLine="Dim coupon As OpenCart";
_coupon = new com.apps.demo.opencart();
 //BA.debugLineNum = 461;BA.debugLine="coupon.Initialize";
_coupon._initialize(processBA);
 //BA.debugLineNum = 462;BA.debugLine="lblpb.Text = Library.GetStringResourse(\"apply\")";
mostCurrent._lblpb.setText(BA.ObjectToCharSequence(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"apply")));
 //BA.debugLineNum = 463;BA.debugLine="pnlloading.SetVisibleAnimated(500,True)";
mostCurrent._pnlloading.SetVisibleAnimated((int) (500),anywheresoftware.b4a.keywords.Common.True);
 //BA.debugLineNum = 464;BA.debugLine="coupon.AddVoucher(Me,\"addvoucher_receive\",txtvou";
_coupon._addvoucher(actbasket.getObject(),"addvoucher_receive",mostCurrent._txtvoucher_id.getText());
 }else {
 //BA.debugLineNum = 466;BA.debugLine="MyToastMessageShow.ShowToastMessageShow(Library.";
mostCurrent._mytoastmessageshow._showtoastmessageshow(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"enter_voucher"),(long) (1.5),anywheresoftware.b4a.keywords.Common.False);
 };
 //BA.debugLineNum = 469;BA.debugLine="End Sub";
return "";
}
public static String  _carts_receive(anywheresoftware.b4a.objects.collections.Map _res,String _cat) throws Exception{
String _style = "";
anywheresoftware.b4a.objects.collections.Map _total = null;
ariagp.amin.shahedi.AriaGlideWrapper _glide = null;
anywheresoftware.b4a.objects.collections.List _l1 = null;
anywheresoftware.b4a.objects.collections.Map _images = null;
uk.co.martinpearman.b4a.text.Html _html1 = null;
int _i = 0;
anywheresoftware.b4a.objects.collections.Map _temp = null;
anywheresoftware.b4a.objects.PanelWrapper _p1 = null;
int _qu = 0;
int _j = 0;
String _thumb = "";
anywheresoftware.b4a.objects.collections.List _options = null;
int _topoption = 0;
int _k = 0;
anywheresoftware.b4a.objects.collections.Map _te = null;
anywheresoftware.b4a.objects.LabelWrapper _lblkey = null;
 //BA.debugLineNum = 170;BA.debugLine="Sub Carts_receive(res As Map,cat As String)";
 //BA.debugLineNum = 172;BA.debugLine="pnlloading.SetVisibleAnimated(600,False)";
mostCurrent._pnlloading.SetVisibleAnimated((int) (600),anywheresoftware.b4a.keywords.Common.False);
 //BA.debugLineNum = 174;BA.debugLine="If res.IsInitialized = False Then";
if (_res.IsInitialized()==anywheresoftware.b4a.keywords.Common.False) { 
 //BA.debugLineNum = 175;BA.debugLine="ToastMessageShow(Library.GetStringResourse(\"no_c";
anywheresoftware.b4a.keywords.Common.ToastMessageShow(BA.ObjectToCharSequence(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"no_cart")),anywheresoftware.b4a.keywords.Common.False);
 //BA.debugLineNum = 176;BA.debugLine="Activity.Finish";
mostCurrent._activity.Finish();
 //BA.debugLineNum = 177;BA.debugLine="Return";
if (true) return "";
 };
 //BA.debugLineNum = 180;BA.debugLine="If res.ContainsKey(\"attention\") Then";
if (_res.ContainsKey((Object)("attention"))) { 
 //BA.debugLineNum = 182;BA.debugLine="If res.Get(\"attention\") <> \"\" Then";
if ((_res.Get((Object)("attention"))).equals((Object)("")) == false) { 
 //BA.debugLineNum = 183;BA.debugLine="Dim style As String";
_style = "";
 //BA.debugLineNum = 185;BA.debugLine="If Library.IsPersian Then style = \"<body style=";
if (mostCurrent._library._ispersian(mostCurrent.activityBA)) { 
_style = "<body style=\"direction:rtl;text-align:right\">";};
 //BA.debugLineNum = 187;BA.debugLine="wbattention.LoadHtml(style & res.Get(\"attention";
mostCurrent._wbattention.LoadHtml(_style+BA.ObjectToString(_res.Get((Object)("attention"))));
 //BA.debugLineNum = 188;BA.debugLine="pnlattention.SetVisibleAnimated(700,True)";
mostCurrent._pnlattention.SetVisibleAnimated((int) (700),anywheresoftware.b4a.keywords.Common.True);
 }else {
 //BA.debugLineNum = 190;BA.debugLine="pnlattention.Visible = False";
mostCurrent._pnlattention.setVisible(anywheresoftware.b4a.keywords.Common.False);
 };
 };
 //BA.debugLineNum = 195;BA.debugLine="If res.ContainsKey(\"error_warning\") Then";
if (_res.ContainsKey((Object)("error_warning"))) { 
 //BA.debugLineNum = 197;BA.debugLine="If res.Get(\"error_warning\") <> \"\" Then";
if ((_res.Get((Object)("error_warning"))).equals((Object)("")) == false) { 
 //BA.debugLineNum = 198;BA.debugLine="Msgbox(res.Get(\"error_warning\"),Library.GetStri";
anywheresoftware.b4a.keywords.Common.Msgbox(BA.ObjectToCharSequence(_res.Get((Object)("error_warning"))),BA.ObjectToCharSequence(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"alert")),mostCurrent.activityBA);
 }else {
 //BA.debugLineNum = 200;BA.debugLine="pnlattention.Visible = False";
mostCurrent._pnlattention.setVisible(anywheresoftware.b4a.keywords.Common.False);
 };
 };
 //BA.debugLineNum = 205;BA.debugLine="Library.CartDetails = res";
mostCurrent._library._cartdetails = _res;
 //BA.debugLineNum = 206;BA.debugLine="lbltitle.Text = Library.GetStringResourse(\"basket";
mostCurrent._lbltitle.setText(BA.ObjectToCharSequence(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"basket_title")+" [ 0 ]".replace("0",BA.NumberToString(mostCurrent._op1._getcartcount()))));
 //BA.debugLineNum = 208;BA.debugLine="lbltitle.Typeface = Library.GetFont";
mostCurrent._lbltitle.setTypeface((android.graphics.Typeface)(mostCurrent._library._getfont(mostCurrent.activityBA).getObject()));
 //BA.debugLineNum = 210;BA.debugLine="Dim total As Map";
_total = new anywheresoftware.b4a.objects.collections.Map();
 //BA.debugLineNum = 211;BA.debugLine="total = op1.GetCartTotal(res.Get(\"totals\"))";
_total = mostCurrent._op1._getcarttotal((anywheresoftware.b4a.objects.collections.List) anywheresoftware.b4a.AbsObjectWrapper.ConvertToWrapper(new anywheresoftware.b4a.objects.collections.List(), (java.util.List)(_res.Get((Object)("totals")))));
 //BA.debugLineNum = 212;BA.debugLine="lbltotal.Text = total.Get(\"total\")";
mostCurrent._lbltotal.setText(BA.ObjectToCharSequence(_total.Get((Object)("total"))));
 //BA.debugLineNum = 214;BA.debugLine="Dim Glide As AriaGlide";
_glide = new ariagp.amin.shahedi.AriaGlideWrapper();
 //BA.debugLineNum = 216;BA.debugLine="Top = 10";
_top = (int) (10);
 //BA.debugLineNum = 218;BA.debugLine="If res.ContainsKey(\"products\") Then";
if (_res.ContainsKey((Object)("products"))) { 
 //BA.debugLineNum = 220;BA.debugLine="Dim l1 As List";
_l1 = new anywheresoftware.b4a.objects.collections.List();
 //BA.debugLineNum = 221;BA.debugLine="l1.Initialize";
_l1.Initialize();
 //BA.debugLineNum = 222;BA.debugLine="l1 = res.Get(\"products\")";
_l1.setObject((java.util.List)(_res.Get((Object)("products"))));
 //BA.debugLineNum = 224;BA.debugLine="Dim images As Map";
_images = new anywheresoftware.b4a.objects.collections.Map();
 //BA.debugLineNum = 225;BA.debugLine="images.Initialize";
_images.Initialize();
 //BA.debugLineNum = 227;BA.debugLine="Dim html1 As Html";
_html1 = new uk.co.martinpearman.b4a.text.Html();
 //BA.debugLineNum = 229;BA.debugLine="ItemCountInBasket = l1.Size";
_itemcountinbasket = _l1.getSize();
 //BA.debugLineNum = 231;BA.debugLine="For i = 0 To l1.Size - 1";
{
final int step40 = 1;
final int limit40 = (int) (_l1.getSize()-1);
for (_i = (int) (0) ; (step40 > 0 && _i <= limit40) || (step40 < 0 && _i >= limit40); _i = ((int)(0 + _i + step40)) ) {
 //BA.debugLineNum = 233;BA.debugLine="Dim temp As Map";
_temp = new anywheresoftware.b4a.objects.collections.Map();
 //BA.debugLineNum = 234;BA.debugLine="temp = l1.Get(i)";
_temp.setObject((anywheresoftware.b4a.objects.collections.Map.MyMap)(_l1.Get(_i)));
 //BA.debugLineNum = 236;BA.debugLine="Dim p1 As Panel";
_p1 = new anywheresoftware.b4a.objects.PanelWrapper();
 //BA.debugLineNum = 237;BA.debugLine="p1.Initialize(\"\")";
_p1.Initialize(mostCurrent.activityBA,"");
 //BA.debugLineNum = 238;BA.debugLine="sv1.Panel.AddView(p1,0,Top,sv1.Width,0)";
mostCurrent._sv1.getPanel().AddView((android.view.View)(_p1.getObject()),(int) (0),_top,mostCurrent._sv1.getWidth(),(int) (0));
 //BA.debugLineNum = 240;BA.debugLine="If Library.IsPersian Then";
if (mostCurrent._library._ispersian(mostCurrent.activityBA)) { 
 //BA.debugLineNum = 241;BA.debugLine="p1.LoadLayout(\"frmtemplate_car\")";
_p1.LoadLayout("frmtemplate_car",mostCurrent.activityBA);
 }else {
 //BA.debugLineNum = 243;BA.debugLine="p1.LoadLayout(\"frmtemplate_car_en\")";
_p1.LoadLayout("frmtemplate_car_en",mostCurrent.activityBA);
 };
 //BA.debugLineNum = 246;BA.debugLine="p1.Tag = temp.Get(\"product_id\")";
_p1.setTag(_temp.Get((Object)("product_id")));
 //BA.debugLineNum = 248;BA.debugLine="lblcprice.Typeface = Library.GetFont";
mostCurrent._lblcprice.setTypeface((android.graphics.Typeface)(mostCurrent._library._getfont(mostCurrent.activityBA).getObject()));
 //BA.debugLineNum = 250;BA.debugLine="p1.Height = pnlitemcart.Height + 10dip";
_p1.setHeight((int) (mostCurrent._pnlitemcart.getHeight()+anywheresoftware.b4a.keywords.Common.DipToCurrent((int) (10))));
 //BA.debugLineNum = 252;BA.debugLine="txtcartcount.DropdownBackgroundColor = Colors.W";
mostCurrent._txtcartcount.setDropdownBackgroundColor(anywheresoftware.b4a.keywords.Common.Colors.White);
 //BA.debugLineNum = 253;BA.debugLine="txtcartcount.DropdownTextColor = Colors.Gray";
mostCurrent._txtcartcount.setDropdownTextColor(anywheresoftware.b4a.keywords.Common.Colors.Gray);
 //BA.debugLineNum = 254;BA.debugLine="lblcount.Text = Library.GetStringResourse(\"cart";
mostCurrent._lblcount.setText(BA.ObjectToCharSequence(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"cart_product_count")));
 //BA.debugLineNum = 256;BA.debugLine="Dim qu As Int";
_qu = 0;
 //BA.debugLineNum = 257;BA.debugLine="qu = temp.Get(\"quantity\")";
_qu = (int)(BA.ObjectToNumber(_temp.Get((Object)("quantity"))));
 //BA.debugLineNum = 259;BA.debugLine="For j = 1 To 80";
{
final int step59 = 1;
final int limit59 = (int) (80);
for (_j = (int) (1) ; (step59 > 0 && _j <= limit59) || (step59 < 0 && _j >= limit59); _j = ((int)(0 + _j + step59)) ) {
 //BA.debugLineNum = 261;BA.debugLine="txtcartcount.Add(j)";
mostCurrent._txtcartcount.Add(BA.NumberToString(_j));
 //BA.debugLineNum = 263;BA.debugLine="If j = qu Then";
if (_j==_qu) { 
 //BA.debugLineNum = 264;BA.debugLine="txtcartcount.SelectedIndex = j-1";
mostCurrent._txtcartcount.setSelectedIndex((int) (_j-1));
 };
 }
};
 //BA.debugLineNum = 269;BA.debugLine="txtcartcount.Tag = temp.Get(\"key\")";
mostCurrent._txtcartcount.setTag(_temp.Get((Object)("key")));
 //BA.debugLineNum = 270;BA.debugLine="lblremove_product.Tag = temp.Get(\"key\")";
mostCurrent._lblremove_product.setTag(_temp.Get((Object)("key")));
 //BA.debugLineNum = 272;BA.debugLine="lblctitle.Text = html1.FromHtml(temp.Get(\"name\"";
mostCurrent._lblctitle.setText(_html1.FromHtml(BA.ObjectToString(_temp.Get((Object)("name")))));
 //BA.debugLineNum = 273;BA.debugLine="lblctitle.Gravity = Library.GetStringResourse(\"";
mostCurrent._lblctitle.setGravity((int)(Double.parseDouble(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"direction"))));
 //BA.debugLineNum = 274;BA.debugLine="lblcprice.Gravity = Library.GetStringResourse(\"";
mostCurrent._lblcprice.setGravity((int)(Double.parseDouble(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"direction"))));
 //BA.debugLineNum = 275;BA.debugLine="lblcprice.Text = temp.Get(\"price\")";
mostCurrent._lblcprice.setText(BA.ObjectToCharSequence(_temp.Get((Object)("price"))));
 //BA.debugLineNum = 276;BA.debugLine="If lblcprice.Text.StartsWith(\"0\") = True Then l";
if (mostCurrent._lblcprice.getText().startsWith("0")==anywheresoftware.b4a.keywords.Common.True) { 
mostCurrent._lblcprice.setText(BA.ObjectToCharSequence(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"call_us")));};
 //BA.debugLineNum = 278;BA.debugLine="If lblcprice.Text.ToLowerCase = \"false\" Then lb";
if ((mostCurrent._lblcprice.getText().toLowerCase()).equals("false")) { 
mostCurrent._lblcprice.setText(BA.ObjectToCharSequence("-"));};
 //BA.debugLineNum = 280;BA.debugLine="Dim thumb As String";
_thumb = "";
 //BA.debugLineNum = 281;BA.debugLine="thumb = temp.Get(\"thumb\")";
_thumb = BA.ObjectToString(_temp.Get((Object)("thumb")));
 //BA.debugLineNum = 282;BA.debugLine="thumb = thumb.Replace(\" \",\"%20\")";
_thumb = _thumb.replace(" ","%20");
 //BA.debugLineNum = 284;BA.debugLine="If thumb.Length = 0 Then";
if (_thumb.length()==0) { 
 //BA.debugLineNum = 285;BA.debugLine="Glide.Load(\"file:///android_asset/noimage1.png";
_glide.Load((Object)("file:///android_asset/noimage1.png")).AsBitmap().Resize((int) (anywheresoftware.b4a.keywords.Common.Abs(mostCurrent._imgicon.getWidth())),(int) (anywheresoftware.b4a.keywords.Common.Abs(mostCurrent._imgicon.getHeight()))).CenterCrop().IntoTarget(processBA,"CartThumb",(Object)(mostCurrent._imgicon.getObject()));
 }else {
 //BA.debugLineNum = 287;BA.debugLine="Glide.Load(thumb).AsBitmap.Resize(Abs(imgicon.";
_glide.Load((Object)(_thumb)).AsBitmap().Resize((int) (anywheresoftware.b4a.keywords.Common.Abs(mostCurrent._imgicon.getWidth())),(int) (anywheresoftware.b4a.keywords.Common.Abs(mostCurrent._imgicon.getHeight()))).CenterCrop().IntoTarget(processBA,"CartThumb",(Object)(mostCurrent._imgicon.getObject()));
 };
 //BA.debugLineNum = 290;BA.debugLine="If temp.Get(\"stock\") = False Then";
if ((_temp.Get((Object)("stock"))).equals((Object)(anywheresoftware.b4a.keywords.Common.False))) { 
 //BA.debugLineNum = 291;BA.debugLine="lblctitle.TextColor = Colors.Red";
mostCurrent._lblctitle.setTextColor(anywheresoftware.b4a.keywords.Common.Colors.Red);
 //BA.debugLineNum = 292;BA.debugLine="lblctitle.Text = lblctitle.Text & \" ***\"";
mostCurrent._lblctitle.setText(BA.ObjectToCharSequence(mostCurrent._lblctitle.getText()+" ***"));
 };
 //BA.debugLineNum = 295;BA.debugLine="Dim options As List";
_options = new anywheresoftware.b4a.objects.collections.List();
 //BA.debugLineNum = 296;BA.debugLine="options = temp.Get(\"option\")";
_options.setObject((java.util.List)(_temp.Get((Object)("option"))));
 //BA.debugLineNum = 298;BA.debugLine="Dim topOption As Int";
_topoption = 0;
 //BA.debugLineNum = 299;BA.debugLine="topOption = pnlitemcart.Height";
_topoption = mostCurrent._pnlitemcart.getHeight();
 //BA.debugLineNum = 301;BA.debugLine="If options.IsInitialized Then";
if (_options.IsInitialized()) { 
 //BA.debugLineNum = 302;BA.debugLine="For k = 0 To options.Size - 1";
{
final int step90 = 1;
final int limit90 = (int) (_options.getSize()-1);
for (_k = (int) (0) ; (step90 > 0 && _k <= limit90) || (step90 < 0 && _k >= limit90); _k = ((int)(0 + _k + step90)) ) {
 //BA.debugLineNum = 303;BA.debugLine="Dim te As Map";
_te = new anywheresoftware.b4a.objects.collections.Map();
 //BA.debugLineNum = 304;BA.debugLine="te = options.Get(k)";
_te.setObject((anywheresoftware.b4a.objects.collections.Map.MyMap)(_options.Get(_k)));
 //BA.debugLineNum = 305;BA.debugLine="Dim lblKey As Label";
_lblkey = new anywheresoftware.b4a.objects.LabelWrapper();
 //BA.debugLineNum = 306;BA.debugLine="lblKey.Initialize(\"\")";
_lblkey.Initialize(mostCurrent.activityBA,"");
 //BA.debugLineNum = 307;BA.debugLine="lblKey.Color = Colors.White";
_lblkey.setColor(anywheresoftware.b4a.keywords.Common.Colors.White);
 //BA.debugLineNum = 308;BA.debugLine="lblKey.Typeface = Library.GetFont";
_lblkey.setTypeface((android.graphics.Typeface)(mostCurrent._library._getfont(mostCurrent.activityBA).getObject()));
 //BA.debugLineNum = 309;BA.debugLine="lblKey.TextSize = 11";
_lblkey.setTextSize((float) (11));
 //BA.debugLineNum = 310;BA.debugLine="lblKey.TextColor = Colors.Black";
_lblkey.setTextColor(anywheresoftware.b4a.keywords.Common.Colors.Black);
 //BA.debugLineNum = 311;BA.debugLine="lblKey.Text = Library.UnderLine(te.Get(\"name\"";
_lblkey.setText(BA.ObjectToCharSequence(mostCurrent._library._underline(mostCurrent.activityBA,BA.ObjectToString(_te.Get((Object)("name")))+" : "+"{un}"+BA.ObjectToString(_te.Get((Object)("value")))+"{un}").getObject()));
 //BA.debugLineNum = 312;BA.debugLine="lblKey.Gravity = Library.GetStringResourse(\"d";
_lblkey.setGravity((int)(Double.parseDouble(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"direction"))));
 //BA.debugLineNum = 313;BA.debugLine="Library.PaddingLabel(lblKey,10,0,10,0)";
mostCurrent._library._paddinglabel(mostCurrent.activityBA,_lblkey,(int) (10),(int) (0),(int) (10),(int) (0));
 //BA.debugLineNum = 314;BA.debugLine="pnlitemcart.AddView(lblKey,18,topOption,pnlit";
mostCurrent._pnlitemcart.AddView((android.view.View)(_lblkey.getObject()),(int) (18),_topoption,(int) (mostCurrent._pnlitemcart.getWidth()-20),anywheresoftware.b4a.keywords.Common.DipToCurrent((int) (40)));
 //BA.debugLineNum = 315;BA.debugLine="pnlitemcart.Height = pnlitemcart.Height + 42d";
mostCurrent._pnlitemcart.setHeight((int) (mostCurrent._pnlitemcart.getHeight()+anywheresoftware.b4a.keywords.Common.DipToCurrent((int) (42))));
 //BA.debugLineNum = 316;BA.debugLine="topOption = topOption + 35dip";
_topoption = (int) (_topoption+anywheresoftware.b4a.keywords.Common.DipToCurrent((int) (35)));
 //BA.debugLineNum = 317;BA.debugLine="p1.Height = pnlitemcart.Height";
_p1.setHeight(mostCurrent._pnlitemcart.getHeight());
 }
};
 //BA.debugLineNum = 320;BA.debugLine="topOption = pnlitemcart.Height";
_topoption = mostCurrent._pnlitemcart.getHeight();
 };
 //BA.debugLineNum = 323;BA.debugLine="Top = Top + p1.Height + 1dip";
_top = (int) (_top+_p1.getHeight()+anywheresoftware.b4a.keywords.Common.DipToCurrent((int) (1)));
 }
};
 //BA.debugLineNum = 327;BA.debugLine="sv1.Panel.Height = Top";
mostCurrent._sv1.getPanel().setHeight(_top);
 };
 //BA.debugLineNum = 331;BA.debugLine="End Sub";
return "";
}
public static String  _cartthumb_onbitmapready(anywheresoftware.b4a.objects.drawable.CanvasWrapper.BitmapWrapper _bitmap,Object _tag) throws Exception{
anywheresoftware.b4a.objects.ImageViewWrapper _im = null;
anywheresoftware.b4j.object.JavaObject _nativeme = null;
int _borderwidth = 0;
int _bordercolor = 0;
 //BA.debugLineNum = 333;BA.debugLine="Sub CartThumb_OnBitmapReady(bitmap As Bitmap,Tag A";
 //BA.debugLineNum = 335;BA.debugLine="Dim im As ImageView";
_im = new anywheresoftware.b4a.objects.ImageViewWrapper();
 //BA.debugLineNum = 336;BA.debugLine="im = Tag";
_im.setObject((android.widget.ImageView)(_tag));
 //BA.debugLineNum = 338;BA.debugLine="im.Gravity = Gravity.FILL";
_im.setGravity(anywheresoftware.b4a.keywords.Common.Gravity.FILL);
 //BA.debugLineNum = 340;BA.debugLine="Dim nativeMe As JavaObject";
_nativeme = new anywheresoftware.b4j.object.JavaObject();
 //BA.debugLineNum = 341;BA.debugLine="Dim borderWidth As Int = 50";
_borderwidth = (int) (50);
 //BA.debugLineNum = 342;BA.debugLine="Dim borderColor As Int = Colors.Gray";
_bordercolor = anywheresoftware.b4a.keywords.Common.Colors.Gray;
 //BA.debugLineNum = 344;BA.debugLine="nativeMe.InitializeContext";
_nativeme.InitializeContext(processBA);
 //BA.debugLineNum = 345;BA.debugLine="im.Bitmap = nativeMe.RunMethod(\"getRoundBitmap";
_im.setBitmap((android.graphics.Bitmap)(_nativeme.RunMethod("getRoundBitmap",new Object[]{(Object)(_bitmap.getObject()),(Object)(_bordercolor),(Object)(_borderwidth)})));
 //BA.debugLineNum = 347;BA.debugLine="End Sub";
return "";
}
public static String  _clearcart_receive(anywheresoftware.b4a.objects.collections.Map _res,String _cat) throws Exception{
String _r1 = "";
 //BA.debugLineNum = 138;BA.debugLine="Sub ClearCart_receive(res As Map,cat As String)";
 //BA.debugLineNum = 140;BA.debugLine="If res = Null Then Return";
if (_res== null) { 
if (true) return "";};
 //BA.debugLineNum = 142;BA.debugLine="If res.ContainsKey(\"success\") Then";
if (_res.ContainsKey((Object)("success"))) { 
 //BA.debugLineNum = 144;BA.debugLine="Dim r1 As String";
_r1 = "";
 //BA.debugLineNum = 145;BA.debugLine="r1 = res.Get(\"success\")";
_r1 = BA.ObjectToString(_res.Get((Object)("success")));
 //BA.debugLineNum = 147;BA.debugLine="If r1.ToLowerCase = \"true\" Then";
if ((_r1.toLowerCase()).equals("true")) { 
 //BA.debugLineNum = 148;BA.debugLine="ToastMessageShow(Library.GetStringResourse(\"cle";
anywheresoftware.b4a.keywords.Common.ToastMessageShow(BA.ObjectToCharSequence(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"cleared")),anywheresoftware.b4a.keywords.Common.False);
 //BA.debugLineNum = 149;BA.debugLine="Activity.Finish";
mostCurrent._activity.Finish();
 //BA.debugLineNum = 150;BA.debugLine="Return";
if (true) return "";
 }else {
 //BA.debugLineNum = 152;BA.debugLine="MyToastMessageShow.ShowToastMessageShow(Library";
mostCurrent._mytoastmessageshow._showtoastmessageshow(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"error_net_title"),(long) (1.5),anywheresoftware.b4a.keywords.Common.False);
 };
 };
 //BA.debugLineNum = 157;BA.debugLine="End Sub";
return "";
}
public static String  _deleteitem_receive(anywheresoftware.b4a.objects.collections.Map _res,String _cat) throws Exception{
String _re = "";
 //BA.debugLineNum = 368;BA.debugLine="Sub DeleteItem_receive(res As Map,cat As String)";
 //BA.debugLineNum = 370;BA.debugLine="pnlloading.SetVisibleAnimated(600,False)";
mostCurrent._pnlloading.SetVisibleAnimated((int) (600),anywheresoftware.b4a.keywords.Common.False);
 //BA.debugLineNum = 372;BA.debugLine="If res.ContainsKey(\"success\") Then";
if (_res.ContainsKey((Object)("success"))) { 
 //BA.debugLineNum = 373;BA.debugLine="Dim re As String";
_re = "";
 //BA.debugLineNum = 374;BA.debugLine="re = res.Get(\"success\")";
_re = BA.ObjectToString(_res.Get((Object)("success")));
 //BA.debugLineNum = 376;BA.debugLine="If re.ToLowerCase = \"false\" Then";
if ((_re.toLowerCase()).equals("false")) { 
 //BA.debugLineNum = 377;BA.debugLine="MyToastMessageShow.ShowToastMessageShow(Library";
mostCurrent._mytoastmessageshow._showtoastmessageshow(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"error_net_title"),(long) (1.5),anywheresoftware.b4a.keywords.Common.False);
 }else {
 //BA.debugLineNum = 379;BA.debugLine="MyToastMessageShow.ShowToastMessageShow(Library";
mostCurrent._mytoastmessageshow._showtoastmessageshow(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"deleted_item"),(long) (1.5),anywheresoftware.b4a.keywords.Common.True);
 };
 };
 //BA.debugLineNum = 384;BA.debugLine="End Sub";
return "";
}
public static String  _getcart() throws Exception{
 //BA.debugLineNum = 159;BA.debugLine="Sub GetCart";
 //BA.debugLineNum = 161;BA.debugLine="pnlloading.SetVisibleAnimated(600,True)";
mostCurrent._pnlloading.SetVisibleAnimated((int) (600),anywheresoftware.b4a.keywords.Common.True);
 //BA.debugLineNum = 162;BA.debugLine="sv1.Panel.RemoveAllViews";
mostCurrent._sv1.getPanel().RemoveAllViews();
 //BA.debugLineNum = 163;BA.debugLine="sv1.Panel.Height = 0";
mostCurrent._sv1.getPanel().setHeight((int) (0));
 //BA.debugLineNum = 164;BA.debugLine="Top = 0";
_top = (int) (0);
 //BA.debugLineNum = 166;BA.debugLine="op1.GetCarts(Me,\"Carts_receive\")";
mostCurrent._op1._getcarts(actbasket.getObject(),"Carts_receive");
 //BA.debugLineNum = 168;BA.debugLine="End Sub";
return "";
}
public static String  _globals() throws Exception{
 //BA.debugLineNum = 10;BA.debugLine="Sub Globals";
 //BA.debugLineNum = 11;BA.debugLine="Private pnlheader As Panel";
mostCurrent._pnlheader = new anywheresoftware.b4a.objects.PanelWrapper();
 //BA.debugLineNum = 12;BA.debugLine="Private lbltitle As Label";
mostCurrent._lbltitle = new anywheresoftware.b4a.objects.LabelWrapper();
 //BA.debugLineNum = 13;BA.debugLine="Private lblpb As Label";
mostCurrent._lblpb = new anywheresoftware.b4a.objects.LabelWrapper();
 //BA.debugLineNum = 14;BA.debugLine="Private pnlloading As Panel";
mostCurrent._pnlloading = new anywheresoftware.b4a.objects.PanelWrapper();
 //BA.debugLineNum = 15;BA.debugLine="Private btnpayment As Button";
mostCurrent._btnpayment = new anywheresoftware.b4a.objects.ButtonWrapper();
 //BA.debugLineNum = 16;BA.debugLine="Private btnclear As Button";
mostCurrent._btnclear = new anywheresoftware.b4a.objects.ButtonWrapper();
 //BA.debugLineNum = 17;BA.debugLine="Private lbltotal As Label";
mostCurrent._lbltotal = new anywheresoftware.b4a.objects.LabelWrapper();
 //BA.debugLineNum = 18;BA.debugLine="Private lblsabadtitle As Label";
mostCurrent._lblsabadtitle = new anywheresoftware.b4a.objects.LabelWrapper();
 //BA.debugLineNum = 19;BA.debugLine="Private op1 As OpenCart";
mostCurrent._op1 = new com.apps.demo.opencart();
 //BA.debugLineNum = 20;BA.debugLine="Private txtcartcount As Spinner";
mostCurrent._txtcartcount = new anywheresoftware.b4a.objects.SpinnerWrapper();
 //BA.debugLineNum = 21;BA.debugLine="Private lblcprice As Label";
mostCurrent._lblcprice = new anywheresoftware.b4a.objects.LabelWrapper();
 //BA.debugLineNum = 22;BA.debugLine="Private lblctitle As Label";
mostCurrent._lblctitle = new anywheresoftware.b4a.objects.LabelWrapper();
 //BA.debugLineNum = 23;BA.debugLine="Private imgicon As ImageView";
mostCurrent._imgicon = new anywheresoftware.b4a.objects.ImageViewWrapper();
 //BA.debugLineNum = 24;BA.debugLine="Private pnlitemcart As Panel";
mostCurrent._pnlitemcart = new anywheresoftware.b4a.objects.PanelWrapper();
 //BA.debugLineNum = 25;BA.debugLine="Private sv1 As ScrollView";
mostCurrent._sv1 = new anywheresoftware.b4a.objects.ScrollViewWrapper();
 //BA.debugLineNum = 26;BA.debugLine="Private Top As Int = 0";
_top = (int) (0);
 //BA.debugLineNum = 27;BA.debugLine="Private lblcount As Label";
mostCurrent._lblcount = new anywheresoftware.b4a.objects.LabelWrapper();
 //BA.debugLineNum = 28;BA.debugLine="Private btncoupon As Button";
mostCurrent._btncoupon = new anywheresoftware.b4a.objects.ButtonWrapper();
 //BA.debugLineNum = 29;BA.debugLine="Private lblremove_product As Label";
mostCurrent._lblremove_product = new anywheresoftware.b4a.objects.LabelWrapper();
 //BA.debugLineNum = 30;BA.debugLine="Private txtcoupon_id As EditText";
mostCurrent._txtcoupon_id = new anywheresoftware.b4a.objects.EditTextWrapper();
 //BA.debugLineNum = 31;BA.debugLine="Private txtvoucher_id As EditText";
mostCurrent._txtvoucher_id = new anywheresoftware.b4a.objects.EditTextWrapper();
 //BA.debugLineNum = 32;BA.debugLine="Private btnvoucher As Button";
mostCurrent._btnvoucher = new anywheresoftware.b4a.objects.ButtonWrapper();
 //BA.debugLineNum = 33;BA.debugLine="Private BiggerSV,DoAnimateSV As Boolean";
_biggersv = false;
_doanimatesv = false;
 //BA.debugLineNum = 34;BA.debugLine="Private DefaultTopSV,DefaultHeightSV As Int";
_defaulttopsv = 0;
_defaultheightsv = 0;
 //BA.debugLineNum = 35;BA.debugLine="Private MyToastMessageShow As MyToastMessageShow";
mostCurrent._mytoastmessageshow = new com.apps.demo.mytoastmessageshow();
 //BA.debugLineNum = 36;BA.debugLine="Private ItemCountInBasket As Int = 0";
_itemcountinbasket = (int) (0);
 //BA.debugLineNum = 37;BA.debugLine="Private btnok As Button";
mostCurrent._btnok = new anywheresoftware.b4a.objects.ButtonWrapper();
 //BA.debugLineNum = 38;BA.debugLine="Private wbattention As WebView";
mostCurrent._wbattention = new anywheresoftware.b4a.objects.WebViewWrapper();
 //BA.debugLineNum = 39;BA.debugLine="Private pnlattention As Panel";
mostCurrent._pnlattention = new anywheresoftware.b4a.objects.PanelWrapper();
 //BA.debugLineNum = 40;BA.debugLine="End Sub";
return "";
}
public static String  _lblproduct_event_click() throws Exception{
anywheresoftware.b4a.objects.ConcreteViewWrapper _v1 = null;
anywheresoftware.b4a.objects.ConcreteViewWrapper _parent = null;
String _id = "";
 //BA.debugLineNum = 540;BA.debugLine="Sub lblproduct_event_Click";
 //BA.debugLineNum = 542;BA.debugLine="Dim v1 As View";
_v1 = new anywheresoftware.b4a.objects.ConcreteViewWrapper();
 //BA.debugLineNum = 543;BA.debugLine="v1 = Sender";
_v1.setObject((android.view.View)(anywheresoftware.b4a.keywords.Common.Sender(mostCurrent.activityBA)));
 //BA.debugLineNum = 545;BA.debugLine="Dim parent As View";
_parent = new anywheresoftware.b4a.objects.ConcreteViewWrapper();
 //BA.debugLineNum = 546;BA.debugLine="parent = v1.Parent";
_parent.setObject((android.view.View)(_v1.getParent()));
 //BA.debugLineNum = 548;BA.debugLine="Dim id As String";
_id = "";
 //BA.debugLineNum = 550;BA.debugLine="If IsNumber(parent.Tag) Then";
if (anywheresoftware.b4a.keywords.Common.IsNumber(BA.ObjectToString(_parent.getTag()))) { 
 //BA.debugLineNum = 551;BA.debugLine="id = parent.Tag";
_id = BA.ObjectToString(_parent.getTag());
 }else {
 //BA.debugLineNum = 553;BA.debugLine="parent = parent.Parent";
_parent.setObject((android.view.View)(_parent.getParent()));
 //BA.debugLineNum = 554;BA.debugLine="id = parent.Tag";
_id = BA.ObjectToString(_parent.getTag());
 };
 //BA.debugLineNum = 557;BA.debugLine="If IsNumber(id) Then";
if (anywheresoftware.b4a.keywords.Common.IsNumber(_id)) { 
 //BA.debugLineNum = 558;BA.debugLine="actProduct.product = CreateMap(\"product_id\":id)";
mostCurrent._actproduct._product = anywheresoftware.b4a.keywords.Common.createMap(new Object[] {(Object)("product_id"),(Object)(_id)});
 //BA.debugLineNum = 559;BA.debugLine="StartActivity(actProduct)";
anywheresoftware.b4a.keywords.Common.StartActivity(mostCurrent.activityBA,(Object)(mostCurrent._actproduct.getObject()));
 };
 //BA.debugLineNum = 562;BA.debugLine="End Sub";
return "";
}
public static String  _lblremove_product_click() throws Exception{
anywheresoftware.b4a.objects.LabelWrapper _p1 = null;
String _product = "";
 //BA.debugLineNum = 349;BA.debugLine="Sub lblremove_product_Click";
 //BA.debugLineNum = 351;BA.debugLine="Dim p1 As Label";
_p1 = new anywheresoftware.b4a.objects.LabelWrapper();
 //BA.debugLineNum = 352;BA.debugLine="p1 = Sender";
_p1.setObject((android.widget.TextView)(anywheresoftware.b4a.keywords.Common.Sender(mostCurrent.activityBA)));
 //BA.debugLineNum = 354;BA.debugLine="Library.GetParent(p1).Visible = False";
mostCurrent._library._getparent(mostCurrent.activityBA,(anywheresoftware.b4a.objects.ConcreteViewWrapper) anywheresoftware.b4a.AbsObjectWrapper.ConvertToWrapper(new anywheresoftware.b4a.objects.ConcreteViewWrapper(), (android.view.View)(_p1.getObject()))).setVisible(anywheresoftware.b4a.keywords.Common.False);
 //BA.debugLineNum = 355;BA.debugLine="Library.GetParent(p1).SetVisibleAnimated(600,True";
mostCurrent._library._getparent(mostCurrent.activityBA,(anywheresoftware.b4a.objects.ConcreteViewWrapper) anywheresoftware.b4a.AbsObjectWrapper.ConvertToWrapper(new anywheresoftware.b4a.objects.ConcreteViewWrapper(), (android.view.View)(_p1.getObject()))).SetVisibleAnimated((int) (600),anywheresoftware.b4a.keywords.Common.True);
 //BA.debugLineNum = 357;BA.debugLine="Dim product As String";
_product = "";
 //BA.debugLineNum = 358;BA.debugLine="product = p1.Tag";
_product = BA.ObjectToString(_p1.getTag());
 //BA.debugLineNum = 360;BA.debugLine="If Msgbox2(Library.GetStringResourse(\"question_de";
if (anywheresoftware.b4a.keywords.Common.Msgbox2(BA.ObjectToCharSequence(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"question_delete_cart")),BA.ObjectToCharSequence(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"alert")),mostCurrent._library._getstringresourse(mostCurrent.activityBA,"yes"),mostCurrent._library._getstringresourse(mostCurrent.activityBA,"no"),"",(android.graphics.Bitmap)(anywheresoftware.b4a.keywords.Common.Null),mostCurrent.activityBA)==anywheresoftware.b4a.keywords.Common.DialogResponse.POSITIVE) { 
 //BA.debugLineNum = 361;BA.debugLine="pnlloading.SetVisibleAnimated(600,True)";
mostCurrent._pnlloading.SetVisibleAnimated((int) (600),anywheresoftware.b4a.keywords.Common.True);
 //BA.debugLineNum = 363;BA.debugLine="op1.DeleteProductFromCart(Me,\"UpdateProduct_rece";
mostCurrent._op1._deleteproductfromcart(actbasket.getObject(),"UpdateProduct_receive",_product);
 };
 //BA.debugLineNum = 366;BA.debugLine="End Sub";
return "";
}
public static String  _process_globals() throws Exception{
 //BA.debugLineNum = 6;BA.debugLine="Sub Process_Globals";
 //BA.debugLineNum = 7;BA.debugLine="Private timerAnimation As Timer";
_timeranimation = new anywheresoftware.b4a.objects.Timer();
 //BA.debugLineNum = 8;BA.debugLine="End Sub";
return "";
}
public static String  _sv1_scrollchanged(int _position) throws Exception{
 //BA.debugLineNum = 487;BA.debugLine="Sub sv1_ScrollChanged(Position As Int)";
 //BA.debugLineNum = 518;BA.debugLine="End Sub";
return "";
}
public static String  _tmranimation_tick() throws Exception{
 //BA.debugLineNum = 520;BA.debugLine="Sub tmrAnimation_Tick";
 //BA.debugLineNum = 521;BA.debugLine="timerAnimation.Enabled = False";
_timeranimation.setEnabled(anywheresoftware.b4a.keywords.Common.False);
 //BA.debugLineNum = 522;BA.debugLine="End Sub";
return "";
}
public static String  _txtcartcount_itemclick(int _position,Object _value) throws Exception{
anywheresoftware.b4a.objects.SpinnerWrapper _sp = null;
String _id = "";
 //BA.debugLineNum = 386;BA.debugLine="Sub txtcartcount_ItemClick (Position As Int, Value";
 //BA.debugLineNum = 388;BA.debugLine="Dim sp As Spinner";
_sp = new anywheresoftware.b4a.objects.SpinnerWrapper();
 //BA.debugLineNum = 389;BA.debugLine="sp = Sender";
_sp.setObject((anywheresoftware.b4a.objects.SpinnerWrapper.B4ASpinner)(anywheresoftware.b4a.keywords.Common.Sender(mostCurrent.activityBA)));
 //BA.debugLineNum = 391;BA.debugLine="Dim id As String";
_id = "";
 //BA.debugLineNum = 392;BA.debugLine="id = sp.Tag";
_id = BA.ObjectToString(_sp.getTag());
 //BA.debugLineNum = 394;BA.debugLine="pnlloading.SetVisibleAnimated(600,True)";
mostCurrent._pnlloading.SetVisibleAnimated((int) (600),anywheresoftware.b4a.keywords.Common.True);
 //BA.debugLineNum = 395;BA.debugLine="op1.UpdateProductCart(Me,\"UpdateProduct_receive\",";
mostCurrent._op1._updateproductcart(actbasket.getObject(),"UpdateProduct_receive",_id,BA.ObjectToString(_value));
 //BA.debugLineNum = 397;BA.debugLine="End Sub";
return "";
}
public static String  _updateproduct_receive(anywheresoftware.b4a.objects.collections.Map _res,String _cat) throws Exception{
String _re = "";
 //BA.debugLineNum = 399;BA.debugLine="Sub UpdateProduct_receive(res As Map,cat As String";
 //BA.debugLineNum = 401;BA.debugLine="pnlloading.SetVisibleAnimated(600,False)";
mostCurrent._pnlloading.SetVisibleAnimated((int) (600),anywheresoftware.b4a.keywords.Common.False);
 //BA.debugLineNum = 403;BA.debugLine="If res.ContainsKey(\"success\") Then";
if (_res.ContainsKey((Object)("success"))) { 
 //BA.debugLineNum = 404;BA.debugLine="Dim re As String";
_re = "";
 //BA.debugLineNum = 405;BA.debugLine="re = res.Get(\"success\")";
_re = BA.ObjectToString(_res.Get((Object)("success")));
 //BA.debugLineNum = 407;BA.debugLine="If re.ToLowerCase = \"false\" Then";
if ((_re.toLowerCase()).equals("false")) { 
 //BA.debugLineNum = 408;BA.debugLine="MyToastMessageShow.ShowToastMessageShow(Library";
mostCurrent._mytoastmessageshow._showtoastmessageshow(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"error_net_title"),(long) (1.5),anywheresoftware.b4a.keywords.Common.False);
 }else {
 //BA.debugLineNum = 410;BA.debugLine="MyToastMessageShow.ShowToastMessageShow(Library";
mostCurrent._mytoastmessageshow._showtoastmessageshow(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"update_count_item"),(long) (1.5),anywheresoftware.b4a.keywords.Common.True);
 //BA.debugLineNum = 411;BA.debugLine="GetCart";
_getcart();
 };
 };
 //BA.debugLineNum = 416;BA.debugLine="End Sub";
return "";
}
public static boolean  _wbattention_overrideurl(String _url) throws Exception{
 //BA.debugLineNum = 528;BA.debugLine="Sub wbattention_OverrideUrl (Url As String) As Boo";
 //BA.debugLineNum = 530;BA.debugLine="If Url.ToLowerCase.IndexOf(\"login\") > -1 Then";
if (_url.toLowerCase().indexOf("login")>-1) { 
 //BA.debugLineNum = 531;BA.debugLine="StartActivity(actLogin)";
anywheresoftware.b4a.keywords.Common.StartActivity(mostCurrent.activityBA,(Object)(mostCurrent._actlogin.getObject()));
 }else if(_url.toLowerCase().indexOf("register")>-1) { 
 //BA.debugLineNum = 533;BA.debugLine="StartActivity(actRegister)";
anywheresoftware.b4a.keywords.Common.StartActivity(mostCurrent.activityBA,(Object)(mostCurrent._actregister.getObject()));
 };
 //BA.debugLineNum = 536;BA.debugLine="Return True";
if (true) return anywheresoftware.b4a.keywords.Common.True;
 //BA.debugLineNum = 538;BA.debugLine="End Sub";
return false;
}




public static Bitmap getRoundBitmap(Bitmap scaleBitmapImage, int borderColor, int borderWidth) {
	int targetWidth = 1000;
	int targetHeight = 1000;
	int radius = Math.min((targetHeight - 5)/2, (targetWidth - 5)/2);   
	
	Bitmap targetBitmap = Bitmap.createBitmap(targetWidth, targetHeight,
			Bitmap.Config.ARGB_8888);

	Canvas canvas = new Canvas(targetBitmap);
	Path path = new Path();
	path.addCircle(((float) targetWidth - 1) / 2,
			((float) targetHeight - 1) / 2,
			(Math.min(((float) targetWidth), ((float) targetHeight)) / 2),
			Path.Direction.CCW);

	canvas.clipPath(path);
	
	Bitmap sourceBitmap = scaleBitmapImage;
	
	canvas.drawBitmap(sourceBitmap, new Rect(0, 0, sourceBitmap.getWidth(),
			sourceBitmap.getHeight()), new Rect(0, 0, targetWidth,
			targetHeight), null);
			
			
	Paint p = new Paint();                                              
	p.setAntiAlias(true);           		
	//	canvas.drawBitmap(sourceBitmap, 4, 4, p);                                      
	p.setXfermode(null);                                                
	p.setStyle(Paint.Style.STROKE);                                           
	p.setColor(borderColor);                                            
	p.setStrokeWidth(borderWidth);                                                
	canvas.drawCircle((targetWidth / 2) , (targetHeight / 2) , radius, p);      						

	return targetBitmap;
}

}
