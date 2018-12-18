package com.apps.manageropencart;


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

public class actdetailsofreportitem extends Activity implements B4AActivity{
	public static actdetailsofreportitem mostCurrent;
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
			processBA = new BA(this.getApplicationContext(), null, null, "com.apps.manageropencart", "com.apps.manageropencart.actdetailsofreportitem");
			processBA.loadHtSubs(this.getClass());
	        float deviceScale = getApplicationContext().getResources().getDisplayMetrics().density;
	        BALayout.setDeviceScale(deviceScale);
            
		}
		else if (previousOne != null) {
			Activity p = previousOne.get();
			if (p != null && p != this) {
                BA.LogInfo("Killing previous instance (actdetailsofreportitem).");
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
		activityBA = new BA(this, layout, processBA, "com.apps.manageropencart", "com.apps.manageropencart.actdetailsofreportitem");
        
        processBA.sharedProcessBA.activityBA = new java.lang.ref.WeakReference<BA>(activityBA);
        anywheresoftware.b4a.objects.ViewWrapper.lastId = 0;
        _activity = new ActivityWrapper(activityBA, "activity");
        anywheresoftware.b4a.Msgbox.isDismissing = false;
        if (BA.isShellModeRuntimeCheck(processBA)) {
			if (isFirst)
				processBA.raiseEvent2(null, true, "SHELL", false);
			processBA.raiseEvent2(null, true, "CREATE", true, "com.apps.manageropencart.actdetailsofreportitem", processBA, activityBA, _activity, anywheresoftware.b4a.keywords.Common.Density, mostCurrent);
			_activity.reinitializeForShell(activityBA, "activity");
		}
        initializeProcessGlobals();		
        initializeGlobals();
        
        BA.LogInfo("** Activity (actdetailsofreportitem) Create, isFirst = " + isFirst + " **");
        processBA.raiseEvent2(null, true, "activity_create", false, isFirst);
		isFirst = false;
		if (this != mostCurrent)
			return;
        processBA.setActivityPaused(false);
        BA.LogInfo("** Activity (actdetailsofreportitem) Resume **");
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
		return actdetailsofreportitem.class;
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
        BA.LogInfo("** Activity (actdetailsofreportitem) Pause, UserClosed = " + activityBA.activity.isFinishing() + " **");
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
            BA.LogInfo("** Activity (actdetailsofreportitem) Resume **");
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
public static anywheresoftware.b4a.objects.collections.Map _v7 = null;
public anywheresoftware.b4a.objects.ScrollViewWrapper _vvvvvvvvvv2 = null;
public anywheresoftware.b4a.samples.httputils2.httputils2service _vvvvvv0 = null;
public com.apps.manageropencart.main _vvvvvvv1 = null;
public com.apps.manageropencart.actlogin _vvvvvvv2 = null;
public com.apps.manageropencart.updater _vvvvvvv3 = null;
public com.apps.manageropencart.actsendpush _vvvvvvv4 = null;
public com.apps.manageropencart.library _vvvvvvv6 = null;
public com.apps.manageropencart.actfeaturemodule _vvvvvvv7 = null;
public com.apps.manageropencart.actbanners _vvvvvvv0 = null;
public com.apps.manageropencart.actstatistic _vvvvvvvv1 = null;
public com.apps.manageropencart.actmenu _vvvvvvvv2 = null;
public com.apps.manageropencart.actmenus _vvvvvvvv3 = null;
public com.apps.manageropencart.actnewversion _vvvvvvvv4 = null;
public com.apps.manageropencart.actpassword _vvvvvvvv5 = null;
public com.apps.manageropencart.starter _vvvvvvvv6 = null;
public com.apps.manageropencart.firebasemessaging _vvvvvvvv7 = null;

public static void initializeProcessGlobals() {
             try {
                Class.forName(BA.applicationContext.getPackageName() + ".main").getMethod("initializeProcessGlobals").invoke(null, null);
            } catch (Exception e) {
                throw new RuntimeException(e);
            }
}
public static String  _activity_create(boolean _firsttime) throws Exception{
anywheresoftware.b4a.objects.collections.Map _ip_info = null;
anywheresoftware.b4a.objects.collections.Map _info = null;
anywheresoftware.b4a.objects.collections.Map _all = null;
String _d1 = "";
int _top = 0;
String _lang = "";
String _item = "";
anywheresoftware.b4a.objects.LabelWrapper _key = null;
String _val_item = "";
anywheresoftware.b4a.objects.LabelWrapper _value = null;
 //BA.debugLineNum = 14;BA.debugLine="Sub Activity_Create(FirstTime As Boolean)";
 //BA.debugLineNum = 16;BA.debugLine="Library.setLocalApp";
mostCurrent._vvvvvvv6._vvvv0(mostCurrent.activityBA);
 //BA.debugLineNum = 18;BA.debugLine="sv.Initialize(0)";
mostCurrent._vvvvvvvvvv2.Initialize(mostCurrent.activityBA,(int) (0));
 //BA.debugLineNum = 19;BA.debugLine="Activity.AddView(sv,0,0,100%x,100%y)";
mostCurrent._activity.AddView((android.view.View)(mostCurrent._vvvvvvvvvv2.getObject()),(int) (0),(int) (0),anywheresoftware.b4a.keywords.Common.PerXToCurrent((float) (100),mostCurrent.activityBA),anywheresoftware.b4a.keywords.Common.PerYToCurrent((float) (100),mostCurrent.activityBA));
 //BA.debugLineNum = 20;BA.debugLine="sv.Color = Colors.White";
mostCurrent._vvvvvvvvvv2.setColor(anywheresoftware.b4a.keywords.Common.Colors.White);
 //BA.debugLineNum = 21;BA.debugLine="sv.Panel.Color = Colors.White";
mostCurrent._vvvvvvvvvv2.getPanel().setColor(anywheresoftware.b4a.keywords.Common.Colors.White);
 //BA.debugLineNum = 23;BA.debugLine="Try";
try { //BA.debugLineNum = 24;BA.debugLine="Dim ip_info,info,all As Map";
_ip_info = new anywheresoftware.b4a.objects.collections.Map();
_info = new anywheresoftware.b4a.objects.collections.Map();
_all = new anywheresoftware.b4a.objects.collections.Map();
 //BA.debugLineNum = 25;BA.debugLine="ip_info = Library.Json2Map(Data.Get(\"sIPInfo\"))";
_ip_info = mostCurrent._vvvvvvv6._vvvv5(mostCurrent.activityBA,BA.ObjectToString(_v7.Get((Object)("sIPInfo"))));
 //BA.debugLineNum = 26;BA.debugLine="info = Library.Json2Map(Data.Get(\"sInfo\"))";
_info = mostCurrent._vvvvvvv6._vvvv5(mostCurrent.activityBA,BA.ObjectToString(_v7.Get((Object)("sInfo"))));
 //BA.debugLineNum = 27;BA.debugLine="all.Initialize";
_all.Initialize();
 //BA.debugLineNum = 29;BA.debugLine="If ip_info.IsInitialized Then";
if (_ip_info.IsInitialized()) { 
 //BA.debugLineNum = 30;BA.debugLine="For Each d1 As String In ip_info.Keys";
{
final anywheresoftware.b4a.BA.IterableList group12 = _ip_info.Keys();
final int groupLen12 = group12.getSize()
;int index12 = 0;
;
for (; index12 < groupLen12;index12++){
_d1 = BA.ObjectToString(group12.Get(index12));
 //BA.debugLineNum = 31;BA.debugLine="all.Put(d1,ip_info.Get(d1))";
_all.Put((Object)(_d1),_ip_info.Get((Object)(_d1)));
 }
};
 };
 //BA.debugLineNum = 35;BA.debugLine="If info.IsInitialized Then";
if (_info.IsInitialized()) { 
 //BA.debugLineNum = 36;BA.debugLine="For Each d1 As String In info.Keys";
{
final anywheresoftware.b4a.BA.IterableList group17 = _info.Keys();
final int groupLen17 = group17.getSize()
;int index17 = 0;
;
for (; index17 < groupLen17;index17++){
_d1 = BA.ObjectToString(group17.Get(index17));
 //BA.debugLineNum = 37;BA.debugLine="If d1.ToLowerCase = \"location\" Or d1.ToLowerCa";
if ((_d1.toLowerCase()).equals("location") || (_d1.toLowerCase()).equals("country")) { 
if (true) continue;};
 //BA.debugLineNum = 38;BA.debugLine="all.Put(d1,info.Get(d1))";
_all.Put((Object)(_d1),_info.Get((Object)(_d1)));
 }
};
 };
 //BA.debugLineNum = 42;BA.debugLine="Dim top As Int";
_top = 0;
 //BA.debugLineNum = 43;BA.debugLine="Dim lang As String";
_lang = "";
 //BA.debugLineNum = 44;BA.debugLine="lang = File.ReadString(File.DirInternal,Library.";
_lang = anywheresoftware.b4a.keywords.Common.File.ReadString(anywheresoftware.b4a.keywords.Common.File.getDirInternal(),mostCurrent._vvvvvvv6._vv7);
 //BA.debugLineNum = 46;BA.debugLine="For Each item As String In all.Keys";
{
final anywheresoftware.b4a.BA.IterableList group25 = _all.Keys();
final int groupLen25 = group25.getSize()
;int index25 = 0;
;
for (; index25 < groupLen25;index25++){
_item = BA.ObjectToString(group25.Get(index25));
 //BA.debugLineNum = 48;BA.debugLine="Dim key As Label";
_key = new anywheresoftware.b4a.objects.LabelWrapper();
 //BA.debugLineNum = 49;BA.debugLine="key.Initialize(\"\")";
_key.Initialize(mostCurrent.activityBA,"");
 //BA.debugLineNum = 50;BA.debugLine="key.TextColor = Colors.White";
_key.setTextColor(anywheresoftware.b4a.keywords.Common.Colors.White);
 //BA.debugLineNum = 51;BA.debugLine="key.TextSize = 12";
_key.setTextSize((float) (12));
 //BA.debugLineNum = 52;BA.debugLine="key.Text = \"   \" & Library.GetStringResourse(it";
_key.setText(BA.ObjectToCharSequence("   "+mostCurrent._vvvvvvv6._vvvv2(mostCurrent.activityBA,_item.toLowerCase())+"   "));
 //BA.debugLineNum = 53;BA.debugLine="key.Typeface = Typeface.LoadFromAssets(\"iran sa";
_key.setTypeface(anywheresoftware.b4a.keywords.Common.Typeface.LoadFromAssets("iran sans.ttf"));
 //BA.debugLineNum = 55;BA.debugLine="If lang = \"en\" Then";
if ((_lang).equals("en")) { 
 //BA.debugLineNum = 56;BA.debugLine="key.Gravity = Bit.Or(Gravity.LEFT,Gravity.CENT";
_key.setGravity(anywheresoftware.b4a.keywords.Common.Bit.Or(anywheresoftware.b4a.keywords.Common.Gravity.LEFT,anywheresoftware.b4a.keywords.Common.Gravity.CENTER_VERTICAL));
 }else {
 //BA.debugLineNum = 58;BA.debugLine="key.Gravity = Bit.Or(Gravity.RIGHT,Gravity.CEN";
_key.setGravity(anywheresoftware.b4a.keywords.Common.Bit.Or(anywheresoftware.b4a.keywords.Common.Gravity.RIGHT,anywheresoftware.b4a.keywords.Common.Gravity.CENTER_VERTICAL));
 };
 //BA.debugLineNum = 61;BA.debugLine="key.Color = Library.ThemeColor";
_key.setColor(mostCurrent._vvvvvvv6._vvv3);
 //BA.debugLineNum = 62;BA.debugLine="sv.Panel.AddView(key,0,top,100%x,40dip)";
mostCurrent._vvvvvvvvvv2.getPanel().AddView((android.view.View)(_key.getObject()),(int) (0),_top,anywheresoftware.b4a.keywords.Common.PerXToCurrent((float) (100),mostCurrent.activityBA),anywheresoftware.b4a.keywords.Common.DipToCurrent((int) (40)));
 //BA.debugLineNum = 64;BA.debugLine="top = top + 40dip";
_top = (int) (_top+anywheresoftware.b4a.keywords.Common.DipToCurrent((int) (40)));
 //BA.debugLineNum = 66;BA.debugLine="Dim val_item As String";
_val_item = "";
 //BA.debugLineNum = 67;BA.debugLine="Dim value As Label";
_value = new anywheresoftware.b4a.objects.LabelWrapper();
 //BA.debugLineNum = 69;BA.debugLine="val_item = all.Get(item)";
_val_item = BA.ObjectToString(_all.Get((Object)(_item)));
 //BA.debugLineNum = 70;BA.debugLine="value.Initialize(\"lblitem\")";
_value.Initialize(mostCurrent.activityBA,"lblitem");
 //BA.debugLineNum = 71;BA.debugLine="value.TextColor = Colors.RGB(134,134,134)";
_value.setTextColor(anywheresoftware.b4a.keywords.Common.Colors.RGB((int) (134),(int) (134),(int) (134)));
 //BA.debugLineNum = 72;BA.debugLine="value.TextSize = 12";
_value.setTextSize((float) (12));
 //BA.debugLineNum = 74;BA.debugLine="If val_item.ToLowerCase == \"false\" Then";
if ((_val_item.toLowerCase()).equals("false")) { 
 //BA.debugLineNum = 75;BA.debugLine="val_item = Library.GetStringResourse(\"no\")";
_val_item = mostCurrent._vvvvvvv6._vvvv2(mostCurrent.activityBA,"no");
 }else if((_val_item.toLowerCase()).equals("true")) { 
 //BA.debugLineNum = 77;BA.debugLine="val_item = Library.GetStringResourse(\"yes\")";
_val_item = mostCurrent._vvvvvvv6._vvvv2(mostCurrent.activityBA,"yes");
 };
 //BA.debugLineNum = 80;BA.debugLine="If item.ToLowerCase = \"loc\" Then";
if ((_item.toLowerCase()).equals("loc")) { 
 //BA.debugLineNum = 81;BA.debugLine="value.Tag = val_item";
_value.setTag((Object)(_val_item));
 };
 //BA.debugLineNum = 84;BA.debugLine="value.Text = \"   {b}\" & val_item& \"{b}   \"";
_value.setText(BA.ObjectToCharSequence("   {b}"+_val_item+"{b}   "));
 //BA.debugLineNum = 85;BA.debugLine="value.Typeface = Typeface.LoadFromAssets(\"iran";
_value.setTypeface(anywheresoftware.b4a.keywords.Common.Typeface.LoadFromAssets("iran sans.ttf"));
 //BA.debugLineNum = 87;BA.debugLine="If lang = \"en\" Then";
if ((_lang).equals("en")) { 
 //BA.debugLineNum = 88;BA.debugLine="value.Gravity = Bit.Or(Gravity.LEFT,Gravity.CE";
_value.setGravity(anywheresoftware.b4a.keywords.Common.Bit.Or(anywheresoftware.b4a.keywords.Common.Gravity.LEFT,anywheresoftware.b4a.keywords.Common.Gravity.CENTER_VERTICAL));
 }else {
 //BA.debugLineNum = 90;BA.debugLine="value.Gravity = Bit.Or(Gravity.RIGHT,Gravity.C";
_value.setGravity(anywheresoftware.b4a.keywords.Common.Bit.Or(anywheresoftware.b4a.keywords.Common.Gravity.RIGHT,anywheresoftware.b4a.keywords.Common.Gravity.CENTER_VERTICAL));
 };
 //BA.debugLineNum = 93;BA.debugLine="value.Color = Colors.White";
_value.setColor(anywheresoftware.b4a.keywords.Common.Colors.White);
 //BA.debugLineNum = 94;BA.debugLine="Library.BoldString(value.Text ,value)";
mostCurrent._vvvvvvv6._vvv5(mostCurrent.activityBA,_value.getText(),_value);
 //BA.debugLineNum = 95;BA.debugLine="sv.Panel.AddView(value,0,top,100%x,40dip)";
mostCurrent._vvvvvvvvvv2.getPanel().AddView((android.view.View)(_value.getObject()),(int) (0),_top,anywheresoftware.b4a.keywords.Common.PerXToCurrent((float) (100),mostCurrent.activityBA),anywheresoftware.b4a.keywords.Common.DipToCurrent((int) (40)));
 //BA.debugLineNum = 97;BA.debugLine="top = top + 60dip";
_top = (int) (_top+anywheresoftware.b4a.keywords.Common.DipToCurrent((int) (60)));
 }
};
 //BA.debugLineNum = 101;BA.debugLine="sv.Panel.Height = top+700";
mostCurrent._vvvvvvvvvv2.getPanel().setHeight((int) (_top+700));
 } 
       catch (Exception e68) {
			processBA.setLastException(e68); //BA.debugLineNum = 104;BA.debugLine="Log(\"Error in activity actDetailsOfReportItem\")";
anywheresoftware.b4a.keywords.Common.Log("Error in activity actDetailsOfReportItem");
 };
 //BA.debugLineNum = 107;BA.debugLine="End Sub";
return "";
}
public static String  _activity_pause(boolean _userclosed) throws Exception{
 //BA.debugLineNum = 113;BA.debugLine="Sub Activity_Pause (UserClosed As Boolean)";
 //BA.debugLineNum = 115;BA.debugLine="End Sub";
return "";
}
public static String  _activity_resume() throws Exception{
 //BA.debugLineNum = 109;BA.debugLine="Sub Activity_Resume";
 //BA.debugLineNum = 111;BA.debugLine="End Sub";
return "";
}
public static String  _globals() throws Exception{
 //BA.debugLineNum = 10;BA.debugLine="Sub Globals";
 //BA.debugLineNum = 11;BA.debugLine="Dim sv As ScrollView";
mostCurrent._vvvvvvvvvv2 = new anywheresoftware.b4a.objects.ScrollViewWrapper();
 //BA.debugLineNum = 12;BA.debugLine="End Sub";
return "";
}
public static String  _lblitem_click() throws Exception{
anywheresoftware.b4a.objects.LabelWrapper _la = null;
 //BA.debugLineNum = 117;BA.debugLine="Sub lblitem_Click";
 //BA.debugLineNum = 119;BA.debugLine="Dim la As Label";
_la = new anywheresoftware.b4a.objects.LabelWrapper();
 //BA.debugLineNum = 120;BA.debugLine="la = Sender";
_la.setObject((android.widget.TextView)(anywheresoftware.b4a.keywords.Common.Sender(mostCurrent.activityBA)));
 //BA.debugLineNum = 122;BA.debugLine="If la.Tag = Null Then Return";
if (_la.getTag()== null) { 
if (true) return "";};
 //BA.debugLineNum = 124;BA.debugLine="OpenGoogleMap(la.Tag)";
_vvvvvvvvvv3(BA.ObjectToString(_la.getTag()));
 //BA.debugLineNum = 126;BA.debugLine="End Sub";
return "";
}
public static String  _vvvvvvvvvv3(String _location) throws Exception{
anywheresoftware.b4a.objects.IntentWrapper _mapintent = null;
 //BA.debugLineNum = 128;BA.debugLine="Sub OpenGoogleMap(location As String)";
 //BA.debugLineNum = 130;BA.debugLine="Dim MapIntent As Intent";
_mapintent = new anywheresoftware.b4a.objects.IntentWrapper();
 //BA.debugLineNum = 131;BA.debugLine="location = \"geo:\" & location & \"?q=\" & location";
_location = "geo:"+_location+"?q="+_location;
 //BA.debugLineNum = 133;BA.debugLine="Try";
try { //BA.debugLineNum = 134;BA.debugLine="MapIntent.Initialize(MapIntent.ACTION_VIEW, loca";
_mapintent.Initialize(_mapintent.ACTION_VIEW,_location);
 //BA.debugLineNum = 135;BA.debugLine="StartActivity(MapIntent)";
anywheresoftware.b4a.keywords.Common.StartActivity(processBA,(Object)(_mapintent.getObject()));
 } 
       catch (Exception e7) {
			processBA.setLastException(e7); };
 //BA.debugLineNum = 139;BA.debugLine="End Sub";
return "";
}
public static String  _process_globals() throws Exception{
 //BA.debugLineNum = 6;BA.debugLine="Sub Process_Globals";
 //BA.debugLineNum = 7;BA.debugLine="Public Data As Map";
_v7 = new anywheresoftware.b4a.objects.collections.Map();
 //BA.debugLineNum = 8;BA.debugLine="End Sub";
return "";
}
}
