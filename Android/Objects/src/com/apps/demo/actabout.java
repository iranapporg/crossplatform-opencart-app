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

public class actabout extends Activity implements B4AActivity{
	public static actabout mostCurrent;
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
			processBA = new BA(this.getApplicationContext(), null, null, "com.apps.demo", "com.apps.demo.actabout");
			processBA.loadHtSubs(this.getClass());
	        float deviceScale = getApplicationContext().getResources().getDisplayMetrics().density;
	        BALayout.setDeviceScale(deviceScale);
            
		}
		else if (previousOne != null) {
			Activity p = previousOne.get();
			if (p != null && p != this) {
                BA.LogInfo("Killing previous instance (actabout).");
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
		activityBA = new BA(this, layout, processBA, "com.apps.demo", "com.apps.demo.actabout");
        
        processBA.sharedProcessBA.activityBA = new java.lang.ref.WeakReference<BA>(activityBA);
        anywheresoftware.b4a.objects.ViewWrapper.lastId = 0;
        _activity = new ActivityWrapper(activityBA, "activity");
        anywheresoftware.b4a.Msgbox.isDismissing = false;
        if (BA.isShellModeRuntimeCheck(processBA)) {
			if (isFirst)
				processBA.raiseEvent2(null, true, "SHELL", false);
			processBA.raiseEvent2(null, true, "CREATE", true, "com.apps.demo.actabout", processBA, activityBA, _activity, anywheresoftware.b4a.keywords.Common.Density, mostCurrent);
			_activity.reinitializeForShell(activityBA, "activity");
		}
        initializeProcessGlobals();		
        initializeGlobals();
        
        BA.LogInfo("** Activity (actabout) Create, isFirst = " + isFirst + " **");
        processBA.raiseEvent2(null, true, "activity_create", false, isFirst);
		isFirst = false;
		if (this != mostCurrent)
			return;
        processBA.setActivityPaused(false);
        BA.LogInfo("** Activity (actabout) Resume **");
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
		return actabout.class;
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
        BA.LogInfo("** Activity (actabout) Pause, UserClosed = " + activityBA.activity.isFinishing() + " **");
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
            BA.LogInfo("** Activity (actabout) Resume **");
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
public anywheresoftware.b4a.objects.PanelWrapper _pnlheader = null;
public anywheresoftware.b4a.objects.ButtonWrapper _btnclose = null;
public anywheresoftware.b4a.objects.ImageViewWrapper _imglogo = null;
public anywheresoftware.b4a.objects.LabelWrapper _lbladdress = null;
public anywheresoftware.b4a.objects.LabelWrapper _lblemail = null;
public anywheresoftware.b4a.objects.LabelWrapper _lblfax = null;
public anywheresoftware.b4a.objects.LabelWrapper _lblname = null;
public anywheresoftware.b4a.objects.LabelWrapper _lblowner = null;
public anywheresoftware.b4a.objects.LabelWrapper _lblphone = null;
public anywheresoftware.b4a.objects.LabelWrapper _lblurl = null;
public anywheresoftware.b4a.objects.PanelWrapper _pnlsearch = null;
public anywheresoftware.b4a.objects.PanelWrapper _pnlloading = null;
public anywheresoftware.b4a.objects.LabelWrapper _lblpb = null;
public anywheresoftware.b4a.objects.LabelWrapper _lblcomment = null;
public anywheresoftware.b4a.objects.ProgressBarWrapper _pb1 = null;
public anywheresoftware.b4a.objects.ListViewWrapper _lv1 = null;
public anywheresoftware.b4a.objects.PanelWrapper _pnlstores = null;
public anywheresoftware.b4a.objects.ButtonWrapper _btnlist = null;
public anywheresoftware.b4a.objects.ButtonWrapper _btncancel = null;
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
com.apps.demo.opencart _op1 = null;
 //BA.debugLineNum = 33;BA.debugLine="Sub Activity_Create(FirstTime As Boolean)";
 //BA.debugLineNum = 35;BA.debugLine="Library.setLocalApp(Library.currLang)";
mostCurrent._library._setlocalapp(mostCurrent.activityBA,mostCurrent._library._currlang);
 //BA.debugLineNum = 37;BA.debugLine="Library.ChangeStatusColor";
mostCurrent._library._changestatuscolor(mostCurrent.activityBA);
 //BA.debugLineNum = 39;BA.debugLine="Activity.LoadLayout(\"frmabout\")";
mostCurrent._activity.LoadLayout("frmabout",mostCurrent.activityBA);
 //BA.debugLineNum = 40;BA.debugLine="pnlheader.Color = Library.Theme_Header";
mostCurrent._pnlheader.setColor(mostCurrent._library._theme_header);
 //BA.debugLineNum = 41;BA.debugLine="lbltitle.Text = Library.GetStringResourse(\"about\"";
mostCurrent._lbltitle.setText(BA.ObjectToCharSequence(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"about")));
 //BA.debugLineNum = 42;BA.debugLine="lblpb.Text = Library.GetStringResourse(\"loading\")";
mostCurrent._lblpb.setText(BA.ObjectToCharSequence(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"loading")));
 //BA.debugLineNum = 43;BA.debugLine="btnlist.Text = Library.GetStringResourse(\"shop_li";
mostCurrent._btnlist.setText(BA.ObjectToCharSequence(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"shop_list")));
 //BA.debugLineNum = 44;BA.debugLine="btncancel.Text = Library.GetStringResourse(\"cance";
mostCurrent._btncancel.setText(BA.ObjectToCharSequence(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"cancel")));
 //BA.debugLineNum = 45;BA.debugLine="btncancel.Background = Library.GetButtonState";
mostCurrent._btncancel.setBackground((android.graphics.drawable.Drawable)(mostCurrent._library._getbuttonstate(mostCurrent.activityBA).getObject()));
 //BA.debugLineNum = 47;BA.debugLine="Library.PaddingLabel(lbladdress,16,16,16,16)";
mostCurrent._library._paddinglabel(mostCurrent.activityBA,mostCurrent._lbladdress,(int) (16),(int) (16),(int) (16),(int) (16));
 //BA.debugLineNum = 48;BA.debugLine="Library.PaddingLabel(lblcomment,16,16,16,16)";
mostCurrent._library._paddinglabel(mostCurrent.activityBA,mostCurrent._lblcomment,(int) (16),(int) (16),(int) (16),(int) (16));
 //BA.debugLineNum = 49;BA.debugLine="Library.PaddingLabel(lblname,20,0,20,0)";
mostCurrent._library._paddinglabel(mostCurrent.activityBA,mostCurrent._lblname,(int) (20),(int) (0),(int) (20),(int) (0));
 //BA.debugLineNum = 50;BA.debugLine="Library.PaddingLabel(lblphone,20,0,20,0)";
mostCurrent._library._paddinglabel(mostCurrent.activityBA,mostCurrent._lblphone,(int) (20),(int) (0),(int) (20),(int) (0));
 //BA.debugLineNum = 51;BA.debugLine="Library.PaddingLabel(lblfax,20,0,20,0)";
mostCurrent._library._paddinglabel(mostCurrent.activityBA,mostCurrent._lblfax,(int) (20),(int) (0),(int) (20),(int) (0));
 //BA.debugLineNum = 52;BA.debugLine="Library.PaddingLabel(lblemail,20,0,20,0)";
mostCurrent._library._paddinglabel(mostCurrent.activityBA,mostCurrent._lblemail,(int) (20),(int) (0),(int) (20),(int) (0));
 //BA.debugLineNum = 53;BA.debugLine="Library.PaddingLabel(lblowner,20,0,20,0)";
mostCurrent._library._paddinglabel(mostCurrent.activityBA,mostCurrent._lblowner,(int) (20),(int) (0),(int) (20),(int) (0));
 //BA.debugLineNum = 54;BA.debugLine="Library.PaddingLabel(lblurl,20,0,20,0)";
mostCurrent._library._paddinglabel(mostCurrent.activityBA,mostCurrent._lblurl,(int) (20),(int) (0),(int) (20),(int) (0));
 //BA.debugLineNum = 56;BA.debugLine="lblname.Gravity = Library.GetStringResourse(\"dire";
mostCurrent._lblname.setGravity((int)(Double.parseDouble(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"direction"))));
 //BA.debugLineNum = 57;BA.debugLine="lblphone.Gravity = Library.GetStringResourse(\"dir";
mostCurrent._lblphone.setGravity((int)(Double.parseDouble(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"direction"))));
 //BA.debugLineNum = 58;BA.debugLine="lblfax.Gravity = Library.GetStringResourse(\"direc";
mostCurrent._lblfax.setGravity((int)(Double.parseDouble(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"direction"))));
 //BA.debugLineNum = 59;BA.debugLine="lblemail.Gravity = Library.GetStringResourse(\"dir";
mostCurrent._lblemail.setGravity((int)(Double.parseDouble(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"direction"))));
 //BA.debugLineNum = 60;BA.debugLine="lblurl.Gravity = Library.GetStringResourse(\"direc";
mostCurrent._lblurl.setGravity((int)(Double.parseDouble(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"direction"))));
 //BA.debugLineNum = 61;BA.debugLine="lblowner.Gravity = Library.GetStringResourse(\"dir";
mostCurrent._lblowner.setGravity((int)(Double.parseDouble(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"direction"))));
 //BA.debugLineNum = 62;BA.debugLine="lbladdress.Gravity = Library.GetStringResourse(\"d";
mostCurrent._lbladdress.setGravity((int)(Double.parseDouble(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"direction"))));
 //BA.debugLineNum = 64;BA.debugLine="If Library.IsPersian Then";
if (mostCurrent._library._ispersian(mostCurrent.activityBA)) { 
 //BA.debugLineNum = 65;BA.debugLine="lblcomment.Gravity = Bit.Or(Gravity.Right,Gravit";
mostCurrent._lblcomment.setGravity(anywheresoftware.b4a.keywords.Common.Bit.Or(anywheresoftware.b4a.keywords.Common.Gravity.RIGHT,anywheresoftware.b4a.keywords.Common.Gravity.TOP));
 }else {
 //BA.debugLineNum = 67;BA.debugLine="lblcomment.Gravity = Bit.Or(Gravity.LEFT,Gravity";
mostCurrent._lblcomment.setGravity(anywheresoftware.b4a.keywords.Common.Bit.Or(anywheresoftware.b4a.keywords.Common.Gravity.LEFT,anywheresoftware.b4a.keywords.Common.Gravity.TOP));
 };
 //BA.debugLineNum = 70;BA.debugLine="lv1.SingleLineLayout.Label.TextColor = Colors.Bla";
mostCurrent._lv1.getSingleLineLayout().Label.setTextColor(anywheresoftware.b4a.keywords.Common.Colors.Black);
 //BA.debugLineNum = 71;BA.debugLine="lv1.SingleLineLayout.Label.Typeface = Library.Get";
mostCurrent._lv1.getSingleLineLayout().Label.setTypeface((android.graphics.Typeface)(mostCurrent._library._getfont(mostCurrent.activityBA).getObject()));
 //BA.debugLineNum = 72;BA.debugLine="lv1.SingleLineLayout.Label.TextSize = 14";
mostCurrent._lv1.getSingleLineLayout().Label.setTextSize((float) (14));
 //BA.debugLineNum = 73;BA.debugLine="lv1.SingleLineLayout.Label.Gravity = Library.GetS";
mostCurrent._lv1.getSingleLineLayout().Label.setGravity((int)(Double.parseDouble(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"direction"))));
 //BA.debugLineNum = 74;BA.debugLine="lv1.SingleLineLayout.Label.Width = lv1.Width - 10";
mostCurrent._lv1.getSingleLineLayout().Label.setWidth((int) (mostCurrent._lv1.getWidth()-anywheresoftware.b4a.keywords.Common.DipToCurrent((int) (10))));
 //BA.debugLineNum = 76;BA.debugLine="Library.SetDivider(lv1,Library.Theme_Header,1)";
mostCurrent._library._setdivider(mostCurrent.activityBA,mostCurrent._lv1,mostCurrent._library._theme_header,(int) (1));
 //BA.debugLineNum = 77;BA.debugLine="lv1.TwoLinesLayout.Label.TextColor = Colors.Black";
mostCurrent._lv1.getTwoLinesLayout().Label.setTextColor(anywheresoftware.b4a.keywords.Common.Colors.Black);
 //BA.debugLineNum = 79;BA.debugLine="Dim op1 As OpenCart";
_op1 = new com.apps.demo.opencart();
 //BA.debugLineNum = 80;BA.debugLine="op1.Initialize";
_op1._initialize(processBA);
 //BA.debugLineNum = 81;BA.debugLine="op1.GetStore(Me,\"StoreDetails_receive\",\"0\")";
_op1._getstore(actabout.getObject(),"StoreDetails_receive","0");
 //BA.debugLineNum = 83;BA.debugLine="End Sub";
return "";
}
public static boolean  _activity_keypress(int _keycode) throws Exception{
 //BA.debugLineNum = 186;BA.debugLine="Sub Activity_KeyPress (KeyCode As Int) As Boolean";
 //BA.debugLineNum = 188;BA.debugLine="If KeyCode = KeyCodes.KEYCODE_BACK Then";
if (_keycode==anywheresoftware.b4a.keywords.Common.KeyCodes.KEYCODE_BACK) { 
 //BA.debugLineNum = 190;BA.debugLine="If pnlstores.Visible = True Then";
if (mostCurrent._pnlstores.getVisible()==anywheresoftware.b4a.keywords.Common.True) { 
 //BA.debugLineNum = 191;BA.debugLine="pnlstores.SetVisibleAnimated(500,False)";
mostCurrent._pnlstores.SetVisibleAnimated((int) (500),anywheresoftware.b4a.keywords.Common.False);
 }else {
 //BA.debugLineNum = 193;BA.debugLine="Activity.Finish";
mostCurrent._activity.Finish();
 };
 //BA.debugLineNum = 196;BA.debugLine="Return True";
if (true) return anywheresoftware.b4a.keywords.Common.True;
 }else if(_keycode==24 || _keycode==25) { 
 //BA.debugLineNum = 199;BA.debugLine="Library.CurrentModule = Me";
mostCurrent._library._currentmodule = actabout.getObject();
 //BA.debugLineNum = 200;BA.debugLine="CallSubDelayed(GoogleVoices,\"Listen\")";
anywheresoftware.b4a.keywords.Common.CallSubDelayed(mostCurrent.activityBA,(Object)(mostCurrent._googlevoices.getObject()),"Listen");
 //BA.debugLineNum = 201;BA.debugLine="Return True";
if (true) return anywheresoftware.b4a.keywords.Common.True;
 };
 //BA.debugLineNum = 205;BA.debugLine="End Sub";
return false;
}
public static String  _activity_pause(boolean _userclosed) throws Exception{
 //BA.debugLineNum = 137;BA.debugLine="Sub Activity_Pause (UserClosed As Boolean)";
 //BA.debugLineNum = 138;BA.debugLine="Library.AnimationFromLeft2Right";
mostCurrent._library._animationfromleft2right(mostCurrent.activityBA);
 //BA.debugLineNum = 139;BA.debugLine="Activity.Finish";
mostCurrent._activity.Finish();
 //BA.debugLineNum = 140;BA.debugLine="End Sub";
return "";
}
public static String  _activity_resume() throws Exception{
 //BA.debugLineNum = 133;BA.debugLine="Sub Activity_Resume";
 //BA.debugLineNum = 135;BA.debugLine="End Sub";
return "";
}
public static String  _btncancel_click() throws Exception{
 //BA.debugLineNum = 176;BA.debugLine="Sub btncancel_Click";
 //BA.debugLineNum = 177;BA.debugLine="pnlstores.SetVisibleAnimated(500,False)";
mostCurrent._pnlstores.SetVisibleAnimated((int) (500),anywheresoftware.b4a.keywords.Common.False);
 //BA.debugLineNum = 178;BA.debugLine="End Sub";
return "";
}
public static String  _btnclose_click() throws Exception{
 //BA.debugLineNum = 142;BA.debugLine="Sub btnclose_Click";
 //BA.debugLineNum = 143;BA.debugLine="Activity.Finish";
mostCurrent._activity.Finish();
 //BA.debugLineNum = 144;BA.debugLine="End Sub";
return "";
}
public static String  _btnlist_click() throws Exception{
com.apps.demo.opencart _op = null;
 //BA.debugLineNum = 146;BA.debugLine="Sub btnlist_Click";
 //BA.debugLineNum = 148;BA.debugLine="If lv1.Size = 0 Then";
if (mostCurrent._lv1.getSize()==0) { 
 //BA.debugLineNum = 149;BA.debugLine="pnlloading.SetVisibleAnimated(500,True)";
mostCurrent._pnlloading.SetVisibleAnimated((int) (500),anywheresoftware.b4a.keywords.Common.True);
 //BA.debugLineNum = 150;BA.debugLine="Dim op As OpenCart";
_op = new com.apps.demo.opencart();
 //BA.debugLineNum = 151;BA.debugLine="op.Initialize";
_op._initialize(processBA);
 //BA.debugLineNum = 152;BA.debugLine="op.GetStore(Me,\"StoreList_receive\",\"\")";
_op._getstore(actabout.getObject(),"StoreList_receive","");
 }else {
 //BA.debugLineNum = 154;BA.debugLine="pnlstores.SetVisibleAnimated(500,True)";
mostCurrent._pnlstores.SetVisibleAnimated((int) (500),anywheresoftware.b4a.keywords.Common.True);
 };
 //BA.debugLineNum = 157;BA.debugLine="End Sub";
return "";
}
public static String  _closeme() throws Exception{
 //BA.debugLineNum = 207;BA.debugLine="Sub CloseMe";
 //BA.debugLineNum = 208;BA.debugLine="Activity.Finish";
mostCurrent._activity.Finish();
 //BA.debugLineNum = 209;BA.debugLine="End Sub";
return "";
}
public static String  _globals() throws Exception{
 //BA.debugLineNum = 10;BA.debugLine="Sub Globals";
 //BA.debugLineNum = 11;BA.debugLine="Private lbltitle As Label";
mostCurrent._lbltitle = new anywheresoftware.b4a.objects.LabelWrapper();
 //BA.debugLineNum = 12;BA.debugLine="Private pnlheader As Panel";
mostCurrent._pnlheader = new anywheresoftware.b4a.objects.PanelWrapper();
 //BA.debugLineNum = 13;BA.debugLine="Private btnclose As Button";
mostCurrent._btnclose = new anywheresoftware.b4a.objects.ButtonWrapper();
 //BA.debugLineNum = 14;BA.debugLine="Private imglogo As ImageView";
mostCurrent._imglogo = new anywheresoftware.b4a.objects.ImageViewWrapper();
 //BA.debugLineNum = 15;BA.debugLine="Private lbladdress As Label";
mostCurrent._lbladdress = new anywheresoftware.b4a.objects.LabelWrapper();
 //BA.debugLineNum = 16;BA.debugLine="Private lblemail As Label";
mostCurrent._lblemail = new anywheresoftware.b4a.objects.LabelWrapper();
 //BA.debugLineNum = 17;BA.debugLine="Private lblfax As Label";
mostCurrent._lblfax = new anywheresoftware.b4a.objects.LabelWrapper();
 //BA.debugLineNum = 18;BA.debugLine="Private lblname As Label";
mostCurrent._lblname = new anywheresoftware.b4a.objects.LabelWrapper();
 //BA.debugLineNum = 19;BA.debugLine="Private lblowner As Label";
mostCurrent._lblowner = new anywheresoftware.b4a.objects.LabelWrapper();
 //BA.debugLineNum = 20;BA.debugLine="Private lblphone As Label";
mostCurrent._lblphone = new anywheresoftware.b4a.objects.LabelWrapper();
 //BA.debugLineNum = 21;BA.debugLine="Private lblurl As Label";
mostCurrent._lblurl = new anywheresoftware.b4a.objects.LabelWrapper();
 //BA.debugLineNum = 22;BA.debugLine="Private pnlsearch As Panel";
mostCurrent._pnlsearch = new anywheresoftware.b4a.objects.PanelWrapper();
 //BA.debugLineNum = 23;BA.debugLine="Private pnlloading As Panel";
mostCurrent._pnlloading = new anywheresoftware.b4a.objects.PanelWrapper();
 //BA.debugLineNum = 24;BA.debugLine="Private lblpb As Label";
mostCurrent._lblpb = new anywheresoftware.b4a.objects.LabelWrapper();
 //BA.debugLineNum = 25;BA.debugLine="Private lblcomment As Label";
mostCurrent._lblcomment = new anywheresoftware.b4a.objects.LabelWrapper();
 //BA.debugLineNum = 26;BA.debugLine="Private pb1 As ProgressBar";
mostCurrent._pb1 = new anywheresoftware.b4a.objects.ProgressBarWrapper();
 //BA.debugLineNum = 27;BA.debugLine="Private lv1 As ListView";
mostCurrent._lv1 = new anywheresoftware.b4a.objects.ListViewWrapper();
 //BA.debugLineNum = 28;BA.debugLine="Private pnlstores As Panel";
mostCurrent._pnlstores = new anywheresoftware.b4a.objects.PanelWrapper();
 //BA.debugLineNum = 29;BA.debugLine="Private btnlist As Button";
mostCurrent._btnlist = new anywheresoftware.b4a.objects.ButtonWrapper();
 //BA.debugLineNum = 30;BA.debugLine="Private btncancel As Button";
mostCurrent._btncancel = new anywheresoftware.b4a.objects.ButtonWrapper();
 //BA.debugLineNum = 31;BA.debugLine="End Sub";
return "";
}
public static String  _lv1_itemclick(int _position,Object _value) throws Exception{
 //BA.debugLineNum = 180;BA.debugLine="Sub lv1_ItemClick (Position As Int, Value As Objec";
 //BA.debugLineNum = 181;BA.debugLine="ToastMessageShow(Library.GetStringResourse(\"defau";
anywheresoftware.b4a.keywords.Common.ToastMessageShow(BA.ObjectToCharSequence(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"default_shop")),anywheresoftware.b4a.keywords.Common.False);
 //BA.debugLineNum = 182;BA.debugLine="Library.manager.SetString(\"store_id\",Value)";
mostCurrent._library._manager.SetString("store_id",BA.ObjectToString(_value));
 //BA.debugLineNum = 183;BA.debugLine="Library.StoreID = Value";
mostCurrent._library._storeid = BA.ObjectToString(_value);
 //BA.debugLineNum = 184;BA.debugLine="End Sub";
return "";
}
public static String  _process_globals() throws Exception{
 //BA.debugLineNum = 6;BA.debugLine="Sub Process_Globals";
 //BA.debugLineNum = 8;BA.debugLine="End Sub";
return "";
}
public static String  _storedetails_receive(anywheresoftware.b4a.objects.collections.Map _res,String _cat) throws Exception{
anywheresoftware.b4a.objects.collections.Map _data = null;
anywheresoftware.b4a.objects.collections.List _l = null;
String _image = "";
ariagp.amin.shahedi.AriaGlideWrapper _glide = null;
anywheresoftware.b4a.objects.ConcreteViewWrapper _v1 = null;
anywheresoftware.b4a.objects.LabelWrapper _te = null;
 //BA.debugLineNum = 85;BA.debugLine="Sub StoreDetails_receive(res As Map,cat As String)";
 //BA.debugLineNum = 87;BA.debugLine="pnlloading.SetVisibleAnimated(500,False)";
mostCurrent._pnlloading.SetVisibleAnimated((int) (500),anywheresoftware.b4a.keywords.Common.False);
 //BA.debugLineNum = 89;BA.debugLine="Dim data As Map";
_data = new anywheresoftware.b4a.objects.collections.Map();
 //BA.debugLineNum = 90;BA.debugLine="Dim l As List";
_l = new anywheresoftware.b4a.objects.collections.List();
 //BA.debugLineNum = 92;BA.debugLine="If res.Get(\"data\") Is List Then";
if (_res.Get((Object)("data")) instanceof java.util.List) { 
 //BA.debugLineNum = 93;BA.debugLine="l = res.Get(\"data\")";
_l.setObject((java.util.List)(_res.Get((Object)("data"))));
 //BA.debugLineNum = 94;BA.debugLine="data = l.Get(0)";
_data.setObject((anywheresoftware.b4a.objects.collections.Map.MyMap)(_l.Get((int) (0))));
 }else {
 //BA.debugLineNum = 96;BA.debugLine="data = res.Get(\"data\")";
_data.setObject((anywheresoftware.b4a.objects.collections.Map.MyMap)(_res.Get((Object)("data"))));
 };
 //BA.debugLineNum = 99;BA.debugLine="lblname.Text = data.Get(\"store_name\")";
mostCurrent._lblname.setText(BA.ObjectToCharSequence(_data.Get((Object)("store_name"))));
 //BA.debugLineNum = 100;BA.debugLine="lblphone.Text = data.Get(\"store_telephone\")";
mostCurrent._lblphone.setText(BA.ObjectToCharSequence(_data.Get((Object)("store_telephone"))));
 //BA.debugLineNum = 101;BA.debugLine="lblfax.Text = data.Get(\"store_fax\")";
mostCurrent._lblfax.setText(BA.ObjectToCharSequence(_data.Get((Object)("store_fax"))));
 //BA.debugLineNum = 103;BA.debugLine="If lblfax.Text.Length = 0 Then lblfax.Text = \"-\"";
if (mostCurrent._lblfax.getText().length()==0) { 
mostCurrent._lblfax.setText(BA.ObjectToCharSequence("-"));};
 //BA.debugLineNum = 105;BA.debugLine="lbladdress.Text = Library.GetStringResourse(\"shop";
mostCurrent._lbladdress.setText(BA.ObjectToCharSequence(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"shop_address")+BA.ObjectToString(_data.Get((Object)("store_address")))));
 //BA.debugLineNum = 106;BA.debugLine="lblemail.Text = Library.GetStringResourse(\"shop_e";
mostCurrent._lblemail.setText(BA.ObjectToCharSequence(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"shop_email")+BA.ObjectToString(_data.Get((Object)("store_email")))));
 //BA.debugLineNum = 107;BA.debugLine="lblowner.Text = Library.GetStringResourse(\"shop_o";
mostCurrent._lblowner.setText(BA.ObjectToCharSequence(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"shop_owner")+BA.ObjectToString(_data.Get((Object)("store_owner")))));
 //BA.debugLineNum = 108;BA.debugLine="lblurl.Text = Library.GetStringResourse(\"url\")";
mostCurrent._lblurl.setText(BA.ObjectToCharSequence(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"url")));
 //BA.debugLineNum = 109;BA.debugLine="lblcomment.Text = data.Get(\"store_comment\")";
mostCurrent._lblcomment.setText(BA.ObjectToCharSequence(_data.Get((Object)("store_comment"))));
 //BA.debugLineNum = 111;BA.debugLine="If lblcomment.Text.Length = 0 Then lblcomment.Tex";
if (mostCurrent._lblcomment.getText().length()==0) { 
mostCurrent._lblcomment.setText(BA.ObjectToCharSequence(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"no_comment")));};
 //BA.debugLineNum = 113;BA.debugLine="Dim image As String";
_image = "";
 //BA.debugLineNum = 117;BA.debugLine="image = data.Get(\"thumb\")";
_image = BA.ObjectToString(_data.Get((Object)("thumb")));
 //BA.debugLineNum = 120;BA.debugLine="Dim glide As AriaGlide";
_glide = new ariagp.amin.shahedi.AriaGlideWrapper();
 //BA.debugLineNum = 121;BA.debugLine="glide.Load(image).AsBitmap.Resize(Abs(imglogo.Wid";
_glide.Load((Object)(_image)).AsBitmap().Resize((int) (anywheresoftware.b4a.keywords.Common.Abs(mostCurrent._imglogo.getWidth())),(int) (anywheresoftware.b4a.keywords.Common.Abs(mostCurrent._imglogo.getHeight()))).CenterCrop().IntoImageView(mostCurrent._imglogo);
 //BA.debugLineNum = 123;BA.debugLine="For Each v1 As View In Activity.GetAllViewsRecurs";
_v1 = new anywheresoftware.b4a.objects.ConcreteViewWrapper();
final anywheresoftware.b4a.BA.IterableList group24 = mostCurrent._activity.GetAllViewsRecursive();
final int groupLen24 = group24.getSize();
for (int index24 = 0;index24 < groupLen24 ;index24++){
_v1.setObject((android.view.View)(group24.Get(index24)));
 //BA.debugLineNum = 124;BA.debugLine="If v1 Is Label Then";
if (_v1.getObjectOrNull() instanceof android.widget.TextView) { 
 //BA.debugLineNum = 125;BA.debugLine="Dim te As Label";
_te = new anywheresoftware.b4a.objects.LabelWrapper();
 //BA.debugLineNum = 126;BA.debugLine="te = v1";
_te.setObject((android.widget.TextView)(_v1.getObject()));
 //BA.debugLineNum = 127;BA.debugLine="If te.Text.ToLowerCase = \"null\" Then te.Text =";
if ((_te.getText().toLowerCase()).equals("null")) { 
_te.setText(BA.ObjectToCharSequence("-"));};
 };
 }
;
 //BA.debugLineNum = 131;BA.debugLine="End Sub";
return "";
}
public static String  _storelist_receive(anywheresoftware.b4a.objects.collections.Map _res,String _cat) throws Exception{
anywheresoftware.b4a.objects.collections.List _data = null;
int _i = 0;
anywheresoftware.b4a.objects.collections.Map _m1 = null;
 //BA.debugLineNum = 159;BA.debugLine="Sub StoreList_receive(res As Map,cat As String)";
 //BA.debugLineNum = 161;BA.debugLine="pnlloading.SetVisibleAnimated(500,False)";
mostCurrent._pnlloading.SetVisibleAnimated((int) (500),anywheresoftware.b4a.keywords.Common.False);
 //BA.debugLineNum = 163;BA.debugLine="Dim data As List";
_data = new anywheresoftware.b4a.objects.collections.List();
 //BA.debugLineNum = 164;BA.debugLine="data = res.Get(\"data\")";
_data.setObject((java.util.List)(_res.Get((Object)("data"))));
 //BA.debugLineNum = 166;BA.debugLine="For i = 0 To data.Size - 1";
{
final int step4 = 1;
final int limit4 = (int) (_data.getSize()-1);
for (_i = (int) (0) ; (step4 > 0 && _i <= limit4) || (step4 < 0 && _i >= limit4); _i = ((int)(0 + _i + step4)) ) {
 //BA.debugLineNum = 167;BA.debugLine="Dim m1 As Map";
_m1 = new anywheresoftware.b4a.objects.collections.Map();
 //BA.debugLineNum = 168;BA.debugLine="m1 = data.Get(i)";
_m1.setObject((anywheresoftware.b4a.objects.collections.Map.MyMap)(_data.Get(_i)));
 //BA.debugLineNum = 169;BA.debugLine="lv1.AddSingleLine2(m1.Get(\"name\") & \" [ \" & m1.G";
mostCurrent._lv1.AddSingleLine2(BA.ObjectToCharSequence(BA.ObjectToString(_m1.Get((Object)("name")))+" [ "+BA.ObjectToString(_m1.Get((Object)("store_id")))+" ]"),_m1.Get((Object)("store_id")));
 }
};
 //BA.debugLineNum = 172;BA.debugLine="pnlstores.SetVisibleAnimated(500,True)";
mostCurrent._pnlstores.SetVisibleAnimated((int) (500),anywheresoftware.b4a.keywords.Common.True);
 //BA.debugLineNum = 174;BA.debugLine="End Sub";
return "";
}
}
