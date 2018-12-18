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

public class actreview extends Activity implements B4AActivity{
	public static actreview mostCurrent;
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
			processBA = new BA(this.getApplicationContext(), null, null, "com.apps.demo", "com.apps.demo.actreview");
			processBA.loadHtSubs(this.getClass());
	        float deviceScale = getApplicationContext().getResources().getDisplayMetrics().density;
	        BALayout.setDeviceScale(deviceScale);
            
		}
		else if (previousOne != null) {
			Activity p = previousOne.get();
			if (p != null && p != this) {
                BA.LogInfo("Killing previous instance (actreview).");
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
		activityBA = new BA(this, layout, processBA, "com.apps.demo", "com.apps.demo.actreview");
        
        processBA.sharedProcessBA.activityBA = new java.lang.ref.WeakReference<BA>(activityBA);
        anywheresoftware.b4a.objects.ViewWrapper.lastId = 0;
        _activity = new ActivityWrapper(activityBA, "activity");
        anywheresoftware.b4a.Msgbox.isDismissing = false;
        if (BA.isShellModeRuntimeCheck(processBA)) {
			if (isFirst)
				processBA.raiseEvent2(null, true, "SHELL", false);
			processBA.raiseEvent2(null, true, "CREATE", true, "com.apps.demo.actreview", processBA, activityBA, _activity, anywheresoftware.b4a.keywords.Common.Density, mostCurrent);
			_activity.reinitializeForShell(activityBA, "activity");
		}
        initializeProcessGlobals();		
        initializeGlobals();
        
        BA.LogInfo("** Activity (actreview) Create, isFirst = " + isFirst + " **");
        processBA.raiseEvent2(null, true, "activity_create", false, isFirst);
		isFirst = false;
		if (this != mostCurrent)
			return;
        processBA.setActivityPaused(false);
        BA.LogInfo("** Activity (actreview) Resume **");
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
		return actreview.class;
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
        BA.LogInfo("** Activity (actreview) Pause, UserClosed = " + activityBA.activity.isFinishing() + " **");
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
            BA.LogInfo("** Activity (actreview) Resume **");
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
public static String _id = "";
public static String _rate = "";
public anywheresoftware.b4a.objects.LabelWrapper _lbltitle = null;
public anywheresoftware.b4a.objects.LabelWrapper _lblname = null;
public anywheresoftware.b4a.objects.EditTextWrapper _txtname = null;
public anywheresoftware.b4a.objects.LabelWrapper _lblrate = null;
public anywheresoftware.b4a.objects.LabelWrapper _lbltext = null;
public anywheresoftware.b4a.objects.EditTextWrapper _txttext = null;
public anywheresoftware.b4a.objects.ButtonWrapper _btnsend = null;
public anywheresoftware.b4a.objects.PanelWrapper _pnlloading = null;
public anywheresoftware.b4a.objects.LabelWrapper _lblpb = null;
public anywheresoftware.b4a.objects.PanelWrapper _pnlheader = null;
public com.apps.demo.mytoastmessageshow _mytoastmessageshow = null;
public anywheresoftware.b4a.objects.LabelWrapper _lbls5 = null;
public anywheresoftware.b4a.objects.LabelWrapper _lbls4 = null;
public anywheresoftware.b4a.objects.LabelWrapper _lbls3 = null;
public anywheresoftware.b4a.objects.LabelWrapper _lbls2 = null;
public anywheresoftware.b4a.objects.LabelWrapper _lbls1 = null;
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
 //BA.debugLineNum = 30;BA.debugLine="Sub Activity_Create(FirstTime As Boolean)";
 //BA.debugLineNum = 32;BA.debugLine="Library.setLocalApp(Library.currLang)";
mostCurrent._library._setlocalapp(mostCurrent.activityBA,mostCurrent._library._currlang);
 //BA.debugLineNum = 34;BA.debugLine="Activity.LoadLayout(\"frmreview\")";
mostCurrent._activity.LoadLayout("frmreview",mostCurrent.activityBA);
 //BA.debugLineNum = 35;BA.debugLine="MyToastMessageShow.Initialize(Activity)";
mostCurrent._mytoastmessageshow._initialize(mostCurrent.activityBA,(anywheresoftware.b4a.objects.PanelWrapper) anywheresoftware.b4a.AbsObjectWrapper.ConvertToWrapper(new anywheresoftware.b4a.objects.PanelWrapper(), (android.view.ViewGroup)(mostCurrent._activity.getObject())));
 //BA.debugLineNum = 37;BA.debugLine="Library.ChangeStatusColor";
mostCurrent._library._changestatuscolor(mostCurrent.activityBA);
 //BA.debugLineNum = 39;BA.debugLine="lbls1.TextColor = Library.Theme_Header";
mostCurrent._lbls1.setTextColor(mostCurrent._library._theme_header);
 //BA.debugLineNum = 40;BA.debugLine="lbls2.TextColor = Library.Theme_Header";
mostCurrent._lbls2.setTextColor(mostCurrent._library._theme_header);
 //BA.debugLineNum = 41;BA.debugLine="lbls3.TextColor = Library.Theme_Header";
mostCurrent._lbls3.setTextColor(mostCurrent._library._theme_header);
 //BA.debugLineNum = 42;BA.debugLine="lbls4.TextColor = Library.Theme_Header";
mostCurrent._lbls4.setTextColor(mostCurrent._library._theme_header);
 //BA.debugLineNum = 43;BA.debugLine="lbls5.TextColor = Library.Theme_Header";
mostCurrent._lbls5.setTextColor(mostCurrent._library._theme_header);
 //BA.debugLineNum = 45;BA.debugLine="lbltitle.Text = Library.GetStringResourse(\"review";
mostCurrent._lbltitle.setText(BA.ObjectToCharSequence(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"reviews")));
 //BA.debugLineNum = 46;BA.debugLine="lblpb.Text = Library.GetStringResourse(\"apply\")";
mostCurrent._lblpb.setText(BA.ObjectToCharSequence(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"apply")));
 //BA.debugLineNum = 47;BA.debugLine="pnlheader.Color = Library.Theme_Header";
mostCurrent._pnlheader.setColor(mostCurrent._library._theme_header);
 //BA.debugLineNum = 49;BA.debugLine="lblname.Text = Library.GetStringResourse(\"tname\")";
mostCurrent._lblname.setText(BA.ObjectToCharSequence(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"tname")));
 //BA.debugLineNum = 50;BA.debugLine="lblrate.Text = Library.GetStringResourse(\"trate\")";
mostCurrent._lblrate.setText(BA.ObjectToCharSequence(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"trate")));
 //BA.debugLineNum = 51;BA.debugLine="lbltext.Text = Library.GetStringResourse(\"ttext\")";
mostCurrent._lbltext.setText(BA.ObjectToCharSequence(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"ttext")));
 //BA.debugLineNum = 52;BA.debugLine="btnsend.Text = Library.GetStringResourse(\"send\")";
mostCurrent._btnsend.setText(BA.ObjectToCharSequence(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"send")));
 //BA.debugLineNum = 53;BA.debugLine="btnsend.Background = Library.GetButtonState";
mostCurrent._btnsend.setBackground((android.graphics.drawable.Drawable)(mostCurrent._library._getbuttonstate(mostCurrent.activityBA).getObject()));
 //BA.debugLineNum = 55;BA.debugLine="txtname.Color = Colors.RGB(250,250,250)";
mostCurrent._txtname.setColor(anywheresoftware.b4a.keywords.Common.Colors.RGB((int) (250),(int) (250),(int) (250)));
 //BA.debugLineNum = 56;BA.debugLine="txttext.Color = Colors.RGB(250,250,250)";
mostCurrent._txttext.setColor(anywheresoftware.b4a.keywords.Common.Colors.RGB((int) (250),(int) (250),(int) (250)));
 //BA.debugLineNum = 58;BA.debugLine="lblname.Gravity = Library.GetStringResourse(\"dire";
mostCurrent._lblname.setGravity((int)(Double.parseDouble(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"direction"))));
 //BA.debugLineNum = 59;BA.debugLine="lblrate.Gravity = Library.GetStringResourse(\"dire";
mostCurrent._lblrate.setGravity((int)(Double.parseDouble(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"direction"))));
 //BA.debugLineNum = 60;BA.debugLine="lbltext.Gravity = Library.GetStringResourse(\"dire";
mostCurrent._lbltext.setGravity((int)(Double.parseDouble(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"direction"))));
 //BA.debugLineNum = 62;BA.debugLine="End Sub";
return "";
}
public static String  _activity_pause(boolean _userclosed) throws Exception{
 //BA.debugLineNum = 68;BA.debugLine="Sub Activity_Pause (UserClosed As Boolean)";
 //BA.debugLineNum = 69;BA.debugLine="Activity.Finish";
mostCurrent._activity.Finish();
 //BA.debugLineNum = 70;BA.debugLine="Library.AnimationFromLeft2Right";
mostCurrent._library._animationfromleft2right(mostCurrent.activityBA);
 //BA.debugLineNum = 71;BA.debugLine="End Sub";
return "";
}
public static String  _activity_resume() throws Exception{
 //BA.debugLineNum = 64;BA.debugLine="Sub Activity_Resume";
 //BA.debugLineNum = 66;BA.debugLine="End Sub";
return "";
}
public static String  _btnclose_click() throws Exception{
 //BA.debugLineNum = 73;BA.debugLine="Sub btnclose_Click";
 //BA.debugLineNum = 74;BA.debugLine="Activity.Finish";
mostCurrent._activity.Finish();
 //BA.debugLineNum = 75;BA.debugLine="End Sub";
return "";
}
public static String  _btnsend_click() throws Exception{
com.apps.demo.opencart _op = null;
 //BA.debugLineNum = 77;BA.debugLine="Sub btnsend_Click";
 //BA.debugLineNum = 79;BA.debugLine="If Library.InternetState = False Then";
if (mostCurrent._library._internetstate(mostCurrent.activityBA)==anywheresoftware.b4a.keywords.Common.False) { 
 //BA.debugLineNum = 80;BA.debugLine="MyToastMessageShow.ShowToastMessageShow(Library.";
mostCurrent._mytoastmessageshow._showtoastmessageshow(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"error_net_details"),(long) (2),anywheresoftware.b4a.keywords.Common.False);
 //BA.debugLineNum = 81;BA.debugLine="Return";
if (true) return "";
 };
 //BA.debugLineNum = 84;BA.debugLine="If txtname.Text.Length < 2 Or txttext.Text.Length";
if (mostCurrent._txtname.getText().length()<2 || mostCurrent._txttext.getText().length()<25) { 
 //BA.debugLineNum = 85;BA.debugLine="MyToastMessageShow.ShowToastMessageShow(Library.";
mostCurrent._mytoastmessageshow._showtoastmessageshow(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"error_data").replace("\\n",anywheresoftware.b4a.keywords.Common.CRLF),(long) (2),anywheresoftware.b4a.keywords.Common.False);
 //BA.debugLineNum = 86;BA.debugLine="Return";
if (true) return "";
 };
 //BA.debugLineNum = 89;BA.debugLine="Dim op As OpenCart";
_op = new com.apps.demo.opencart();
 //BA.debugLineNum = 90;BA.debugLine="op.Initialize";
_op._initialize(processBA);
 //BA.debugLineNum = 91;BA.debugLine="pnlloading.SetVisibleAnimated(500,True)";
mostCurrent._pnlloading.SetVisibleAnimated((int) (500),anywheresoftware.b4a.keywords.Common.True);
 //BA.debugLineNum = 92;BA.debugLine="op.AddReviewProduct(Me,\"SendReview_receive\",id,tx";
_op._addreviewproduct(actreview.getObject(),"SendReview_receive",_id,mostCurrent._txtname.getText(),mostCurrent._txttext.getText(),mostCurrent._rate);
 //BA.debugLineNum = 94;BA.debugLine="End Sub";
return "";
}
public static String  _changestar() throws Exception{
 //BA.debugLineNum = 138;BA.debugLine="Sub ChangeStar";
 //BA.debugLineNum = 140;BA.debugLine="If Rate = \"1\" Then";
if ((mostCurrent._rate).equals("1")) { 
 //BA.debugLineNum = 141;BA.debugLine="lbls1.Text = \"\"";
mostCurrent._lbls1.setText(BA.ObjectToCharSequence(""));
 //BA.debugLineNum = 142;BA.debugLine="lbls2.Text = \"\"";
mostCurrent._lbls2.setText(BA.ObjectToCharSequence(""));
 //BA.debugLineNum = 143;BA.debugLine="lbls3.Text = \"\"";
mostCurrent._lbls3.setText(BA.ObjectToCharSequence(""));
 //BA.debugLineNum = 144;BA.debugLine="lbls4.Text = \"\"";
mostCurrent._lbls4.setText(BA.ObjectToCharSequence(""));
 //BA.debugLineNum = 145;BA.debugLine="lbls5.Text = \"\"";
mostCurrent._lbls5.setText(BA.ObjectToCharSequence(""));
 }else if((mostCurrent._rate).equals("2")) { 
 //BA.debugLineNum = 148;BA.debugLine="lbls1.Text = \"\"";
mostCurrent._lbls1.setText(BA.ObjectToCharSequence(""));
 //BA.debugLineNum = 149;BA.debugLine="lbls2.Text = \"\"";
mostCurrent._lbls2.setText(BA.ObjectToCharSequence(""));
 //BA.debugLineNum = 150;BA.debugLine="lbls3.Text = \"\"";
mostCurrent._lbls3.setText(BA.ObjectToCharSequence(""));
 //BA.debugLineNum = 151;BA.debugLine="lbls4.Text = \"\"";
mostCurrent._lbls4.setText(BA.ObjectToCharSequence(""));
 //BA.debugLineNum = 152;BA.debugLine="lbls5.Text = \"\"";
mostCurrent._lbls5.setText(BA.ObjectToCharSequence(""));
 }else if((mostCurrent._rate).equals("3")) { 
 //BA.debugLineNum = 155;BA.debugLine="lbls1.Text = \"\"";
mostCurrent._lbls1.setText(BA.ObjectToCharSequence(""));
 //BA.debugLineNum = 156;BA.debugLine="lbls2.Text = \"\"";
mostCurrent._lbls2.setText(BA.ObjectToCharSequence(""));
 //BA.debugLineNum = 157;BA.debugLine="lbls3.Text = \"\"";
mostCurrent._lbls3.setText(BA.ObjectToCharSequence(""));
 //BA.debugLineNum = 158;BA.debugLine="lbls4.Text = \"\"";
mostCurrent._lbls4.setText(BA.ObjectToCharSequence(""));
 //BA.debugLineNum = 159;BA.debugLine="lbls5.Text = \"\"";
mostCurrent._lbls5.setText(BA.ObjectToCharSequence(""));
 }else if((mostCurrent._rate).equals("4")) { 
 //BA.debugLineNum = 162;BA.debugLine="lbls1.Text = \"\"";
mostCurrent._lbls1.setText(BA.ObjectToCharSequence(""));
 //BA.debugLineNum = 163;BA.debugLine="lbls2.Text = \"\"";
mostCurrent._lbls2.setText(BA.ObjectToCharSequence(""));
 //BA.debugLineNum = 164;BA.debugLine="lbls3.Text = \"\"";
mostCurrent._lbls3.setText(BA.ObjectToCharSequence(""));
 //BA.debugLineNum = 165;BA.debugLine="lbls4.Text = \"\"";
mostCurrent._lbls4.setText(BA.ObjectToCharSequence(""));
 //BA.debugLineNum = 166;BA.debugLine="lbls5.Text = \"\"";
mostCurrent._lbls5.setText(BA.ObjectToCharSequence(""));
 }else if((mostCurrent._rate).equals("5") || (double)(Double.parseDouble(mostCurrent._rate))>5) { 
 //BA.debugLineNum = 169;BA.debugLine="lbls1.Text = \"\"";
mostCurrent._lbls1.setText(BA.ObjectToCharSequence(""));
 //BA.debugLineNum = 170;BA.debugLine="lbls2.Text = \"\"";
mostCurrent._lbls2.setText(BA.ObjectToCharSequence(""));
 //BA.debugLineNum = 171;BA.debugLine="lbls3.Text = \"\"";
mostCurrent._lbls3.setText(BA.ObjectToCharSequence(""));
 //BA.debugLineNum = 172;BA.debugLine="lbls4.Text = \"\"";
mostCurrent._lbls4.setText(BA.ObjectToCharSequence(""));
 //BA.debugLineNum = 173;BA.debugLine="lbls5.Text = \"\"";
mostCurrent._lbls5.setText(BA.ObjectToCharSequence(""));
 };
 //BA.debugLineNum = 176;BA.debugLine="End Sub";
return "";
}
public static String  _globals() throws Exception{
 //BA.debugLineNum = 10;BA.debugLine="Sub Globals";
 //BA.debugLineNum = 11;BA.debugLine="Private Rate As String = \"1\"";
mostCurrent._rate = "1";
 //BA.debugLineNum = 12;BA.debugLine="Private lbltitle As Label";
mostCurrent._lbltitle = new anywheresoftware.b4a.objects.LabelWrapper();
 //BA.debugLineNum = 13;BA.debugLine="Private lblname As Label";
mostCurrent._lblname = new anywheresoftware.b4a.objects.LabelWrapper();
 //BA.debugLineNum = 14;BA.debugLine="Private txtname As EditText";
mostCurrent._txtname = new anywheresoftware.b4a.objects.EditTextWrapper();
 //BA.debugLineNum = 15;BA.debugLine="Private lblrate As Label";
mostCurrent._lblrate = new anywheresoftware.b4a.objects.LabelWrapper();
 //BA.debugLineNum = 16;BA.debugLine="Private lbltext As Label";
mostCurrent._lbltext = new anywheresoftware.b4a.objects.LabelWrapper();
 //BA.debugLineNum = 17;BA.debugLine="Private txttext As EditText";
mostCurrent._txttext = new anywheresoftware.b4a.objects.EditTextWrapper();
 //BA.debugLineNum = 18;BA.debugLine="Private btnsend As Button";
mostCurrent._btnsend = new anywheresoftware.b4a.objects.ButtonWrapper();
 //BA.debugLineNum = 19;BA.debugLine="Private pnlloading As Panel";
mostCurrent._pnlloading = new anywheresoftware.b4a.objects.PanelWrapper();
 //BA.debugLineNum = 20;BA.debugLine="Private lblpb As Label";
mostCurrent._lblpb = new anywheresoftware.b4a.objects.LabelWrapper();
 //BA.debugLineNum = 21;BA.debugLine="Private pnlheader As Panel";
mostCurrent._pnlheader = new anywheresoftware.b4a.objects.PanelWrapper();
 //BA.debugLineNum = 22;BA.debugLine="Private MyToastMessageShow As MyToastMessageShow";
mostCurrent._mytoastmessageshow = new com.apps.demo.mytoastmessageshow();
 //BA.debugLineNum = 23;BA.debugLine="Private lbls5 As Label";
mostCurrent._lbls5 = new anywheresoftware.b4a.objects.LabelWrapper();
 //BA.debugLineNum = 24;BA.debugLine="Private lbls4 As Label";
mostCurrent._lbls4 = new anywheresoftware.b4a.objects.LabelWrapper();
 //BA.debugLineNum = 25;BA.debugLine="Private lbls3 As Label";
mostCurrent._lbls3 = new anywheresoftware.b4a.objects.LabelWrapper();
 //BA.debugLineNum = 26;BA.debugLine="Private lbls2 As Label";
mostCurrent._lbls2 = new anywheresoftware.b4a.objects.LabelWrapper();
 //BA.debugLineNum = 27;BA.debugLine="Private lbls1 As Label";
mostCurrent._lbls1 = new anywheresoftware.b4a.objects.LabelWrapper();
 //BA.debugLineNum = 28;BA.debugLine="End Sub";
return "";
}
public static String  _lbls1_click() throws Exception{
 //BA.debugLineNum = 133;BA.debugLine="Sub lbls1_Click";
 //BA.debugLineNum = 134;BA.debugLine="Rate = \"1\"";
mostCurrent._rate = "1";
 //BA.debugLineNum = 135;BA.debugLine="ChangeStar";
_changestar();
 //BA.debugLineNum = 136;BA.debugLine="End Sub";
return "";
}
public static String  _lbls2_click() throws Exception{
 //BA.debugLineNum = 128;BA.debugLine="Sub lbls2_Click";
 //BA.debugLineNum = 129;BA.debugLine="Rate = \"2\"";
mostCurrent._rate = "2";
 //BA.debugLineNum = 130;BA.debugLine="ChangeStar";
_changestar();
 //BA.debugLineNum = 131;BA.debugLine="End Sub";
return "";
}
public static String  _lbls3_click() throws Exception{
 //BA.debugLineNum = 123;BA.debugLine="Sub lbls3_Click";
 //BA.debugLineNum = 124;BA.debugLine="Rate = \"3\"";
mostCurrent._rate = "3";
 //BA.debugLineNum = 125;BA.debugLine="ChangeStar";
_changestar();
 //BA.debugLineNum = 126;BA.debugLine="End Sub";
return "";
}
public static String  _lbls4_click() throws Exception{
 //BA.debugLineNum = 118;BA.debugLine="Sub lbls4_Click";
 //BA.debugLineNum = 119;BA.debugLine="Rate = \"4\"";
mostCurrent._rate = "4";
 //BA.debugLineNum = 120;BA.debugLine="ChangeStar";
_changestar();
 //BA.debugLineNum = 121;BA.debugLine="End Sub";
return "";
}
public static String  _lbls5_click() throws Exception{
 //BA.debugLineNum = 113;BA.debugLine="Sub lbls5_Click";
 //BA.debugLineNum = 114;BA.debugLine="Rate = \"5\"";
mostCurrent._rate = "5";
 //BA.debugLineNum = 115;BA.debugLine="ChangeStar";
_changestar();
 //BA.debugLineNum = 116;BA.debugLine="End Sub";
return "";
}
public static String  _process_globals() throws Exception{
 //BA.debugLineNum = 6;BA.debugLine="Sub Process_Globals";
 //BA.debugLineNum = 7;BA.debugLine="Public id As String";
_id = "";
 //BA.debugLineNum = 8;BA.debugLine="End Sub";
return "";
}
public static String  _sendreview_receive(anywheresoftware.b4a.objects.collections.Map _res,String _cat) throws Exception{
String _res1 = "";
 //BA.debugLineNum = 96;BA.debugLine="Sub SendReview_receive(res As Map,cat As String)";
 //BA.debugLineNum = 98;BA.debugLine="pnlloading.SetVisibleAnimated(600,False)";
mostCurrent._pnlloading.SetVisibleAnimated((int) (600),anywheresoftware.b4a.keywords.Common.False);
 //BA.debugLineNum = 100;BA.debugLine="Dim res1 As String";
_res1 = "";
 //BA.debugLineNum = 101;BA.debugLine="res1 = res.Get(\"success\")";
_res1 = BA.ObjectToString(_res.Get((Object)("success")));
 //BA.debugLineNum = 103;BA.debugLine="If res1.ToLowerCase = \"true\" Then";
if ((_res1.toLowerCase()).equals("true")) { 
 //BA.debugLineNum = 104;BA.debugLine="txtname.Text = \"\"";
mostCurrent._txtname.setText(BA.ObjectToCharSequence(""));
 //BA.debugLineNum = 105;BA.debugLine="txttext.Text = \"\"";
mostCurrent._txttext.setText(BA.ObjectToCharSequence(""));
 //BA.debugLineNum = 106;BA.debugLine="MyToastMessageShow.ShowToastMessageShow(Library.";
mostCurrent._mytoastmessageshow._showtoastmessageshow(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"success_send"),(long) (1.5),anywheresoftware.b4a.keywords.Common.True);
 }else {
 //BA.debugLineNum = 108;BA.debugLine="MyToastMessageShow.ShowToastMessageShow(Library.";
mostCurrent._mytoastmessageshow._showtoastmessageshow(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"error_data").replace("\\n",anywheresoftware.b4a.keywords.Common.CRLF),(long) (2),anywheresoftware.b4a.keywords.Common.False);
 };
 //BA.debugLineNum = 111;BA.debugLine="End Sub";
return "";
}
}
