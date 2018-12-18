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

public class actsetting extends Activity implements B4AActivity{
	public static actsetting mostCurrent;
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
			processBA = new BA(this.getApplicationContext(), null, null, "com.apps.demo", "com.apps.demo.actsetting");
			processBA.loadHtSubs(this.getClass());
	        float deviceScale = getApplicationContext().getResources().getDisplayMetrics().density;
	        BALayout.setDeviceScale(deviceScale);
            
		}
		else if (previousOne != null) {
			Activity p = previousOne.get();
			if (p != null && p != this) {
                BA.LogInfo("Killing previous instance (actsetting).");
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
		activityBA = new BA(this, layout, processBA, "com.apps.demo", "com.apps.demo.actsetting");
        
        processBA.sharedProcessBA.activityBA = new java.lang.ref.WeakReference<BA>(activityBA);
        anywheresoftware.b4a.objects.ViewWrapper.lastId = 0;
        _activity = new ActivityWrapper(activityBA, "activity");
        anywheresoftware.b4a.Msgbox.isDismissing = false;
        if (BA.isShellModeRuntimeCheck(processBA)) {
			if (isFirst)
				processBA.raiseEvent2(null, true, "SHELL", false);
			processBA.raiseEvent2(null, true, "CREATE", true, "com.apps.demo.actsetting", processBA, activityBA, _activity, anywheresoftware.b4a.keywords.Common.Density, mostCurrent);
			_activity.reinitializeForShell(activityBA, "activity");
		}
        initializeProcessGlobals();		
        initializeGlobals();
        
        BA.LogInfo("** Activity (actsetting) Create, isFirst = " + isFirst + " **");
        processBA.raiseEvent2(null, true, "activity_create", false, isFirst);
		isFirst = false;
		if (this != mostCurrent)
			return;
        processBA.setActivityPaused(false);
        BA.LogInfo("** Activity (actsetting) Resume **");
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
		return actsetting.class;
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
        BA.LogInfo("** Activity (actsetting) Pause, UserClosed = " + activityBA.activity.isFinishing() + " **");
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
            BA.LogInfo("** Activity (actsetting) Resume **");
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
public anywheresoftware.b4a.objects.ButtonWrapper _btnclose = null;
public anywheresoftware.b4a.objects.ButtonWrapper _btndefault = null;
public anywheresoftware.b4a.objects.ButtonWrapper _btnsave = null;
public anywheresoftware.b4a.objects.CompoundButtonWrapper.CheckBoxWrapper _chkcache = null;
public anywheresoftware.b4a.objects.CompoundButtonWrapper.CheckBoxWrapper _chknewsletter = null;
public anywheresoftware.b4a.objects.ImageViewWrapper _imageview1 = null;
public anywheresoftware.b4a.objects.ImageViewWrapper _imageview2 = null;
public anywheresoftware.b4a.objects.LabelWrapper _lblcurr = null;
public anywheresoftware.b4a.objects.LabelWrapper _lbllang = null;
public anywheresoftware.b4a.objects.LabelWrapper _lbltitle = null;
public anywheresoftware.b4a.objects.PanelWrapper _panel1 = null;
public anywheresoftware.b4a.objects.PanelWrapper _panel2 = null;
public anywheresoftware.b4a.objects.PanelWrapper _panel3 = null;
public anywheresoftware.b4a.objects.PanelWrapper _panel4 = null;
public anywheresoftware.b4a.objects.PanelWrapper _pnlheader = null;
public anywheresoftware.b4a.objects.CompoundButtonWrapper.RadioButtonWrapper _rben = null;
public anywheresoftware.b4a.objects.CompoundButtonWrapper.RadioButtonWrapper _rbfa = null;
public anywheresoftware.b4a.objects.SpinnerWrapper _spcurr = null;
public static String _defaultlanguage = "";
public static String _defaultcurrency = "";
public static String _chooselang = "";
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
anywheresoftware.b4a.objects.collections.List _ls = null;
anywheresoftware.b4a.objects.collections.List _listcurr = null;
int _i = 0;
anywheresoftware.b4a.objects.collections.Map _m2 = null;
 //BA.debugLineNum = 32;BA.debugLine="Sub Activity_Create(FirstTime As Boolean)";
 //BA.debugLineNum = 34;BA.debugLine="Library.ChangeStatusColor";
mostCurrent._library._changestatuscolor(mostCurrent.activityBA);
 //BA.debugLineNum = 36;BA.debugLine="Activity.LoadLayout(\"frmsetting\")";
mostCurrent._activity.LoadLayout("frmsetting",mostCurrent.activityBA);
 //BA.debugLineNum = 38;BA.debugLine="lbltitle.Text = Library.GetStringResourse(\"settin";
mostCurrent._lbltitle.setText(BA.ObjectToCharSequence(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"setting_title")));
 //BA.debugLineNum = 39;BA.debugLine="lblcurr.Text = Library.GetStringResourse(\"setting";
mostCurrent._lblcurr.setText(BA.ObjectToCharSequence(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"setting_currency_summary")));
 //BA.debugLineNum = 40;BA.debugLine="lbllang.Text = Library.GetStringResourse(\"languag";
mostCurrent._lbllang.setText(BA.ObjectToCharSequence(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"language_summary")));
 //BA.debugLineNum = 41;BA.debugLine="chkcache.Text = Library.GetStringResourse(\"cache_";
mostCurrent._chkcache.setText(BA.ObjectToCharSequence(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"cache_image_title")));
 //BA.debugLineNum = 42;BA.debugLine="chknewsletter.Text = Library.GetStringResourse(\"p";
mostCurrent._chknewsletter.setText(BA.ObjectToCharSequence(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"push_subscribe")));
 //BA.debugLineNum = 43;BA.debugLine="btnsave.Text = Library.GetStringResourse(\"setting";
mostCurrent._btnsave.setText(BA.ObjectToCharSequence(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"setting_save")));
 //BA.debugLineNum = 44;BA.debugLine="btndefault.Text = Library.GetStringResourse(\"sett";
mostCurrent._btndefault.setText(BA.ObjectToCharSequence(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"setting_default")));
 //BA.debugLineNum = 46;BA.debugLine="lblcurr.Gravity = Library.GetStringResourse(\"dire";
mostCurrent._lblcurr.setGravity((int)(Double.parseDouble(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"direction"))));
 //BA.debugLineNum = 47;BA.debugLine="lbllang.Gravity = Library.GetStringResourse(\"dire";
mostCurrent._lbllang.setGravity((int)(Double.parseDouble(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"direction"))));
 //BA.debugLineNum = 48;BA.debugLine="chkcache.Gravity = Library.GetStringResourse(\"dir";
mostCurrent._chkcache.setGravity((int)(Double.parseDouble(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"direction"))));
 //BA.debugLineNum = 49;BA.debugLine="chknewsletter.Gravity = Library.GetStringResourse";
mostCurrent._chknewsletter.setGravity((int)(Double.parseDouble(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"direction"))));
 //BA.debugLineNum = 51;BA.debugLine="spcurr.DropdownBackgroundColor = Colors.White";
mostCurrent._spcurr.setDropdownBackgroundColor(anywheresoftware.b4a.keywords.Common.Colors.White);
 //BA.debugLineNum = 52;BA.debugLine="spcurr.DropdownTextColor = Colors.Black";
mostCurrent._spcurr.setDropdownTextColor(anywheresoftware.b4a.keywords.Common.Colors.Black);
 //BA.debugLineNum = 54;BA.debugLine="pnlheader.Color = Library.Theme_Header";
mostCurrent._pnlheader.setColor(mostCurrent._library._theme_header);
 //BA.debugLineNum = 56;BA.debugLine="btnsave.Background = Library.GetButtonState";
mostCurrent._btnsave.setBackground((android.graphics.drawable.Drawable)(mostCurrent._library._getbuttonstate(mostCurrent.activityBA).getObject()));
 //BA.debugLineNum = 57;BA.debugLine="btndefault.Background = Library.GetButtonState";
mostCurrent._btndefault.setBackground((android.graphics.drawable.Drawable)(mostCurrent._library._getbuttonstate(mostCurrent.activityBA).getObject()));
 //BA.debugLineNum = 59;BA.debugLine="defaultLanguage = Library.manager.GetString(\"lang";
mostCurrent._defaultlanguage = mostCurrent._library._manager.GetString("lang");
 //BA.debugLineNum = 60;BA.debugLine="defaultCurrency = Library.manager.GetString(\"curr";
mostCurrent._defaultcurrency = mostCurrent._library._manager.GetString("curr");
 //BA.debugLineNum = 62;BA.debugLine="chkcache.Checked = Library.manager.GetBoolean(\"ca";
mostCurrent._chkcache.setChecked(mostCurrent._library._manager.GetBoolean("cache"));
 //BA.debugLineNum = 63;BA.debugLine="chknewsletter.Checked = Library.manager.GetBoolea";
mostCurrent._chknewsletter.setChecked(mostCurrent._library._manager.GetBoolean("push"));
 //BA.debugLineNum = 65;BA.debugLine="If defaultLanguage = \"فارسی\" Then";
if ((mostCurrent._defaultlanguage).equals("فارسی")) { 
 //BA.debugLineNum = 66;BA.debugLine="chooseLang = \"فارسی\"";
mostCurrent._chooselang = "فارسی";
 //BA.debugLineNum = 67;BA.debugLine="rbfa.Checked = True";
mostCurrent._rbfa.setChecked(anywheresoftware.b4a.keywords.Common.True);
 }else {
 //BA.debugLineNum = 69;BA.debugLine="chooseLang = \"english\"";
mostCurrent._chooselang = "english";
 //BA.debugLineNum = 70;BA.debugLine="rben.Checked = True";
mostCurrent._rben.setChecked(anywheresoftware.b4a.keywords.Common.True);
 };
 //BA.debugLineNum = 74;BA.debugLine="Dim ls,listCurr As List";
_ls = new anywheresoftware.b4a.objects.collections.List();
_listcurr = new anywheresoftware.b4a.objects.collections.List();
 //BA.debugLineNum = 76;BA.debugLine="ls = Library.CacheSystem.GetCacheAsList(\"currenci";
_ls = mostCurrent._library._cachesystem._getcacheaslist("currencies","currencies");
 //BA.debugLineNum = 77;BA.debugLine="listCurr.Initialize";
_listcurr.Initialize();
 //BA.debugLineNum = 79;BA.debugLine="If ls.IsInitialized Then";
if (_ls.IsInitialized()) { 
 //BA.debugLineNum = 80;BA.debugLine="For i = 0 To ls.Size - 1";
{
final int step34 = 1;
final int limit34 = (int) (_ls.getSize()-1);
for (_i = (int) (0) ; (step34 > 0 && _i <= limit34) || (step34 < 0 && _i >= limit34); _i = ((int)(0 + _i + step34)) ) {
 //BA.debugLineNum = 81;BA.debugLine="Dim m2 As Map";
_m2 = new anywheresoftware.b4a.objects.collections.Map();
 //BA.debugLineNum = 82;BA.debugLine="m2 = ls.Get(i)";
_m2.setObject((anywheresoftware.b4a.objects.collections.Map.MyMap)(_ls.Get(_i)));
 //BA.debugLineNum = 83;BA.debugLine="spcurr.Add(m2.Get(\"title\"))";
mostCurrent._spcurr.Add(BA.ObjectToString(_m2.Get((Object)("title"))));
 //BA.debugLineNum = 84;BA.debugLine="If defaultCurrency = m2.Get(\"title\") Then spcur";
if ((mostCurrent._defaultcurrency).equals(BA.ObjectToString(_m2.Get((Object)("title"))))) { 
mostCurrent._spcurr.setSelectedIndex(_i);};
 }
};
 };
 //BA.debugLineNum = 112;BA.debugLine="End Sub";
return "";
}
public static String  _activity_pause(boolean _userclosed) throws Exception{
 //BA.debugLineNum = 118;BA.debugLine="Sub Activity_Pause (UserClosed As Boolean)";
 //BA.debugLineNum = 120;BA.debugLine="If UserClosed Then";
if (_userclosed) { 
 //BA.debugLineNum = 121;BA.debugLine="Activity.Finish";
mostCurrent._activity.Finish();
 };
 //BA.debugLineNum = 124;BA.debugLine="Library.AnimationFromLeft2Right";
mostCurrent._library._animationfromleft2right(mostCurrent.activityBA);
 //BA.debugLineNum = 126;BA.debugLine="End Sub";
return "";
}
public static String  _activity_resume() throws Exception{
 //BA.debugLineNum = 114;BA.debugLine="Sub Activity_Resume";
 //BA.debugLineNum = 116;BA.debugLine="End Sub";
return "";
}
public static String  _btnclose_click() throws Exception{
 //BA.debugLineNum = 171;BA.debugLine="Sub btnclose_Click";
 //BA.debugLineNum = 172;BA.debugLine="Activity.Finish";
mostCurrent._activity.Finish();
 //BA.debugLineNum = 173;BA.debugLine="End Sub";
return "";
}
public static String  _btndefault_click() throws Exception{
 //BA.debugLineNum = 151;BA.debugLine="Sub btndefault_Click";
 //BA.debugLineNum = 153;BA.debugLine="Library.manager.SetBoolean(\"cache\",False)";
mostCurrent._library._manager.SetBoolean("cache",anywheresoftware.b4a.keywords.Common.False);
 //BA.debugLineNum = 154;BA.debugLine="Library.manager.SetBoolean(\"push\",True)";
mostCurrent._library._manager.SetBoolean("push",anywheresoftware.b4a.keywords.Common.True);
 //BA.debugLineNum = 155;BA.debugLine="Library.manager.SetString(\"curr\",\"USD\")";
mostCurrent._library._manager.SetString("curr","USD");
 //BA.debugLineNum = 156;BA.debugLine="Library.manager.SetString(\"lang\",\"english\")";
mostCurrent._library._manager.SetString("lang","english");
 //BA.debugLineNum = 158;BA.debugLine="CallSubDelayed(actMenu,\"ApplySettingChanges\")";
anywheresoftware.b4a.keywords.Common.CallSubDelayed(mostCurrent.activityBA,(Object)(mostCurrent._actmenu.getObject()),"ApplySettingChanges");
 //BA.debugLineNum = 159;BA.debugLine="Activity.Finish";
mostCurrent._activity.Finish();
 //BA.debugLineNum = 161;BA.debugLine="End Sub";
return "";
}
public static String  _btnsave_click() throws Exception{
 //BA.debugLineNum = 128;BA.debugLine="Sub btnsave_Click";
 //BA.debugLineNum = 130;BA.debugLine="Library.manager.SetBoolean(\"cache\",chkcache.Check";
mostCurrent._library._manager.SetBoolean("cache",mostCurrent._chkcache.getChecked());
 //BA.debugLineNum = 131;BA.debugLine="Library.manager.SetBoolean(\"push\",chknewsletter.C";
mostCurrent._library._manager.SetBoolean("push",mostCurrent._chknewsletter.getChecked());
 //BA.debugLineNum = 132;BA.debugLine="Library.manager.SetString(\"curr\",spcurr.SelectedI";
mostCurrent._library._manager.SetString("curr",mostCurrent._spcurr.getSelectedItem());
 //BA.debugLineNum = 133;BA.debugLine="Library.manager.SetString(\"lang\",chooseLang)";
mostCurrent._library._manager.SetString("lang",mostCurrent._chooselang);
 //BA.debugLineNum = 135;BA.debugLine="ToastMessageShow(Library.GetStringResourse(\"setti";
anywheresoftware.b4a.keywords.Common.ToastMessageShow(BA.ObjectToCharSequence(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"setting_saved")),anywheresoftware.b4a.keywords.Common.False);
 //BA.debugLineNum = 137;BA.debugLine="If chooseLang <> defaultLanguage Or spcurr.Select";
if ((mostCurrent._chooselang).equals(mostCurrent._defaultlanguage) == false || (mostCurrent._spcurr.getSelectedItem()).equals(mostCurrent._defaultcurrency) == false) { 
 //BA.debugLineNum = 139;BA.debugLine="If Library.InternetState = False Then";
if (mostCurrent._library._internetstate(mostCurrent.activityBA)==anywheresoftware.b4a.keywords.Common.False) { 
 //BA.debugLineNum = 140;BA.debugLine="ToastMessageShow(Library.GetStringResourse(\"err";
anywheresoftware.b4a.keywords.Common.ToastMessageShow(BA.ObjectToCharSequence(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"error_net_title")),anywheresoftware.b4a.keywords.Common.False);
 //BA.debugLineNum = 141;BA.debugLine="Return";
if (true) return "";
 };
 //BA.debugLineNum = 144;BA.debugLine="CallSubDelayed(actMenu,\"ApplySettingChanges\")";
anywheresoftware.b4a.keywords.Common.CallSubDelayed(mostCurrent.activityBA,(Object)(mostCurrent._actmenu.getObject()),"ApplySettingChanges");
 //BA.debugLineNum = 145;BA.debugLine="Activity.Finish";
mostCurrent._activity.Finish();
 };
 //BA.debugLineNum = 149;BA.debugLine="End Sub";
return "";
}
public static String  _globals() throws Exception{
 //BA.debugLineNum = 10;BA.debugLine="Sub Globals";
 //BA.debugLineNum = 11;BA.debugLine="Private btnclose As Button";
mostCurrent._btnclose = new anywheresoftware.b4a.objects.ButtonWrapper();
 //BA.debugLineNum = 12;BA.debugLine="Private btndefault As Button";
mostCurrent._btndefault = new anywheresoftware.b4a.objects.ButtonWrapper();
 //BA.debugLineNum = 13;BA.debugLine="Private btnsave As Button";
mostCurrent._btnsave = new anywheresoftware.b4a.objects.ButtonWrapper();
 //BA.debugLineNum = 14;BA.debugLine="Private chkcache As CheckBox";
mostCurrent._chkcache = new anywheresoftware.b4a.objects.CompoundButtonWrapper.CheckBoxWrapper();
 //BA.debugLineNum = 15;BA.debugLine="Private chknewsletter As CheckBox";
mostCurrent._chknewsletter = new anywheresoftware.b4a.objects.CompoundButtonWrapper.CheckBoxWrapper();
 //BA.debugLineNum = 16;BA.debugLine="Private ImageView1 As ImageView";
mostCurrent._imageview1 = new anywheresoftware.b4a.objects.ImageViewWrapper();
 //BA.debugLineNum = 17;BA.debugLine="Private ImageView2 As ImageView";
mostCurrent._imageview2 = new anywheresoftware.b4a.objects.ImageViewWrapper();
 //BA.debugLineNum = 18;BA.debugLine="Private lblcurr As Label";
mostCurrent._lblcurr = new anywheresoftware.b4a.objects.LabelWrapper();
 //BA.debugLineNum = 19;BA.debugLine="Private lbllang As Label";
mostCurrent._lbllang = new anywheresoftware.b4a.objects.LabelWrapper();
 //BA.debugLineNum = 20;BA.debugLine="Private lbltitle As Label";
mostCurrent._lbltitle = new anywheresoftware.b4a.objects.LabelWrapper();
 //BA.debugLineNum = 21;BA.debugLine="Private Panel1 As Panel";
mostCurrent._panel1 = new anywheresoftware.b4a.objects.PanelWrapper();
 //BA.debugLineNum = 22;BA.debugLine="Private Panel2 As Panel";
mostCurrent._panel2 = new anywheresoftware.b4a.objects.PanelWrapper();
 //BA.debugLineNum = 23;BA.debugLine="Private Panel3 As Panel";
mostCurrent._panel3 = new anywheresoftware.b4a.objects.PanelWrapper();
 //BA.debugLineNum = 24;BA.debugLine="Private Panel4 As Panel";
mostCurrent._panel4 = new anywheresoftware.b4a.objects.PanelWrapper();
 //BA.debugLineNum = 25;BA.debugLine="Private pnlheader As Panel";
mostCurrent._pnlheader = new anywheresoftware.b4a.objects.PanelWrapper();
 //BA.debugLineNum = 26;BA.debugLine="Private rben As RadioButton";
mostCurrent._rben = new anywheresoftware.b4a.objects.CompoundButtonWrapper.RadioButtonWrapper();
 //BA.debugLineNum = 27;BA.debugLine="Private rbfa As RadioButton";
mostCurrent._rbfa = new anywheresoftware.b4a.objects.CompoundButtonWrapper.RadioButtonWrapper();
 //BA.debugLineNum = 28;BA.debugLine="Private spcurr As Spinner";
mostCurrent._spcurr = new anywheresoftware.b4a.objects.SpinnerWrapper();
 //BA.debugLineNum = 29;BA.debugLine="Private defaultLanguage,defaultCurrency,chooseLan";
mostCurrent._defaultlanguage = "";
mostCurrent._defaultcurrency = "";
mostCurrent._chooselang = "";
 //BA.debugLineNum = 30;BA.debugLine="End Sub";
return "";
}
public static String  _process_globals() throws Exception{
 //BA.debugLineNum = 6;BA.debugLine="Sub Process_Globals";
 //BA.debugLineNum = 8;BA.debugLine="End Sub";
return "";
}
public static String  _rben_checkedchange(boolean _checked) throws Exception{
 //BA.debugLineNum = 163;BA.debugLine="Sub rben_CheckedChange(Checked As Boolean)";
 //BA.debugLineNum = 164;BA.debugLine="chooseLang = \"english\"";
mostCurrent._chooselang = "english";
 //BA.debugLineNum = 165;BA.debugLine="End Sub";
return "";
}
public static String  _rbfa_checkedchange(boolean _checked) throws Exception{
 //BA.debugLineNum = 167;BA.debugLine="Sub rbfa_CheckedChange(Checked As Boolean)";
 //BA.debugLineNum = 168;BA.debugLine="chooseLang = \"فارسی\"";
mostCurrent._chooselang = "فارسی";
 //BA.debugLineNum = 169;BA.debugLine="End Sub";
return "";
}
}
