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

public class actbanners extends Activity implements B4AActivity{
	public static actbanners mostCurrent;
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
			processBA = new BA(this.getApplicationContext(), null, null, "com.apps.manageropencart", "com.apps.manageropencart.actbanners");
			processBA.loadHtSubs(this.getClass());
	        float deviceScale = getApplicationContext().getResources().getDisplayMetrics().density;
	        BALayout.setDeviceScale(deviceScale);
            
		}
		else if (previousOne != null) {
			Activity p = previousOne.get();
			if (p != null && p != this) {
                BA.LogInfo("Killing previous instance (actbanners).");
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
		activityBA = new BA(this, layout, processBA, "com.apps.manageropencart", "com.apps.manageropencart.actbanners");
        
        processBA.sharedProcessBA.activityBA = new java.lang.ref.WeakReference<BA>(activityBA);
        anywheresoftware.b4a.objects.ViewWrapper.lastId = 0;
        _activity = new ActivityWrapper(activityBA, "activity");
        anywheresoftware.b4a.Msgbox.isDismissing = false;
        if (BA.isShellModeRuntimeCheck(processBA)) {
			if (isFirst)
				processBA.raiseEvent2(null, true, "SHELL", false);
			processBA.raiseEvent2(null, true, "CREATE", true, "com.apps.manageropencart.actbanners", processBA, activityBA, _activity, anywheresoftware.b4a.keywords.Common.Density, mostCurrent);
			_activity.reinitializeForShell(activityBA, "activity");
		}
        initializeProcessGlobals();		
        initializeGlobals();
        
        BA.LogInfo("** Activity (actbanners) Create, isFirst = " + isFirst + " **");
        processBA.raiseEvent2(null, true, "activity_create", false, isFirst);
		isFirst = false;
		if (this != mostCurrent)
			return;
        processBA.setActivityPaused(false);
        BA.LogInfo("** Activity (actbanners) Resume **");
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
		return actbanners.class;
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
        BA.LogInfo("** Activity (actbanners) Pause, UserClosed = " + activityBA.activity.isFinishing() + " **");
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
            BA.LogInfo("** Activity (actbanners) Resume **");
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
public anywheresoftware.b4a.objects.LabelWrapper _lblheader = null;
public anywheresoftware.b4a.objects.ButtonWrapper _btnsend = null;
public anywheresoftware.b4a.objects.ButtonWrapper _btncancel = null;
public com.apps.manageropencart.showprogress _vvvvvvvvv7 = null;
public com.apps.manageropencart.opencart _vvvvvvvvvv6 = null;
public com.apps.manageropencart.mytoastmessageshow _vvvvvvvvv0 = null;
public anywheresoftware.b4a.objects.collections.List _vvvvvvvvvv5 = null;
public anywheresoftware.b4a.objects.collections.List _vvvvvvvvvvv2 = null;
public anywheresoftware.b4a.objects.collections.List _vvvvvvvvvvv1 = null;
public anywheresoftware.b4a.objects.ScrollViewWrapper _sv1 = null;
public anywheresoftware.b4a.samples.httputils2.httputils2service _vvvvvv0 = null;
public com.apps.manageropencart.main _vvvvvvv1 = null;
public com.apps.manageropencart.actlogin _vvvvvvv2 = null;
public com.apps.manageropencart.updater _vvvvvvv3 = null;
public com.apps.manageropencart.actsendpush _vvvvvvv4 = null;
public com.apps.manageropencart.actdetailsofreportitem _vvvvvvv5 = null;
public com.apps.manageropencart.library _vvvvvvv6 = null;
public com.apps.manageropencart.actfeaturemodule _vvvvvvv7 = null;
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
wrap.Wrap _status = null;
anywheresoftware.b4a.samples.httputils2.httpjob _hu = null;
 //BA.debugLineNum = 22;BA.debugLine="Sub Activity_Create(FirstTime As Boolean)";
 //BA.debugLineNum = 24;BA.debugLine="Activity.LoadLayout(\"frmbanners\")";
mostCurrent._activity.LoadLayout("frmbanners",mostCurrent.activityBA);
 //BA.debugLineNum = 26;BA.debugLine="Library.setLocalApp";
mostCurrent._vvvvvvv6._vvvv0(mostCurrent.activityBA);
 //BA.debugLineNum = 28;BA.debugLine="lblheader.Text = Library.GetStringResourse(\"choos";
mostCurrent._lblheader.setText(BA.ObjectToCharSequence(mostCurrent._vvvvvvv6._vvvv2(mostCurrent.activityBA,"choose_banner")));
 //BA.debugLineNum = 29;BA.debugLine="btncancel.Text = Library.GetStringResourse(\"back\"";
mostCurrent._btncancel.setText(BA.ObjectToCharSequence(mostCurrent._vvvvvvv6._vvvv2(mostCurrent.activityBA,"back")));
 //BA.debugLineNum = 30;BA.debugLine="btnsend.Text = Library.GetStringResourse(\"apply\")";
mostCurrent._btnsend.setText(BA.ObjectToCharSequence(mostCurrent._vvvvvvv6._vvvv2(mostCurrent.activityBA,"apply")));
 //BA.debugLineNum = 32;BA.debugLine="Dim status As StatusBarCompat";
_status = new wrap.Wrap();
 //BA.debugLineNum = 33;BA.debugLine="status.Initialize";
_status.Initialize(mostCurrent.activityBA);
 //BA.debugLineNum = 34;BA.debugLine="status.StatusBarColor = Library.ThemeColor";
_status.setStatusBarColor(mostCurrent._vvvvvvv6._vvv3);
 //BA.debugLineNum = 36;BA.debugLine="sv1.Color = Colors.Transparent";
mostCurrent._sv1.setColor(anywheresoftware.b4a.keywords.Common.Colors.Transparent);
 //BA.debugLineNum = 37;BA.debugLine="sv1.Panel.Color = Colors.Transparent";
mostCurrent._sv1.getPanel().setColor(anywheresoftware.b4a.keywords.Common.Colors.Transparent);
 //BA.debugLineNum = 38;BA.debugLine="Activity.Color = Library.ThemeColor";
mostCurrent._activity.setColor(mostCurrent._vvvvvvv6._vvv3);
 //BA.debugLineNum = 40;BA.debugLine="BannersItems.Initialize";
mostCurrent._vvvvvvvvvvv1.Initialize();
 //BA.debugLineNum = 41;BA.debugLine="Checks.Initialize";
mostCurrent._vvvvvvvvvv5.Initialize();
 //BA.debugLineNum = 42;BA.debugLine="ServerChoosenBanner.Initialize";
mostCurrent._vvvvvvvvvvv2.Initialize();
 //BA.debugLineNum = 43;BA.debugLine="opencart1.Initialize";
mostCurrent._vvvvvvvvvv6._initialize(processBA);
 //BA.debugLineNum = 45;BA.debugLine="progress.Initialize(Activity)";
mostCurrent._vvvvvvvvv7._initialize(mostCurrent.activityBA,mostCurrent._activity);
 //BA.debugLineNum = 46;BA.debugLine="toast.Initialize(Activity)";
mostCurrent._vvvvvvvvv0._initialize(mostCurrent.activityBA,(anywheresoftware.b4a.objects.PanelWrapper) anywheresoftware.b4a.AbsObjectWrapper.ConvertToWrapper(new anywheresoftware.b4a.objects.PanelWrapper(), (android.view.ViewGroup)(mostCurrent._activity.getObject())));
 //BA.debugLineNum = 47;BA.debugLine="progress.ShowProgress(Library.GetStringResourse(\"";
mostCurrent._vvvvvvvvv7._vvvvvvvvv1(mostCurrent._vvvvvvv6._vvvv2(mostCurrent.activityBA,"downloading"));
 //BA.debugLineNum = 49;BA.debugLine="Dim hu As HttpJob";
_hu = new anywheresoftware.b4a.samples.httputils2.httpjob();
 //BA.debugLineNum = 50;BA.debugLine="hu.Initialize(\"config\",Me)";
_hu._initialize(processBA,"config",actbanners.getObject());
 //BA.debugLineNum = 51;BA.debugLine="hu.Download(Library.BaseURL & \"app/config\")";
_hu._download(mostCurrent._vvvvvvv6._vv3+"app/config");
 //BA.debugLineNum = 52;BA.debugLine="hu.GetRequest.SetHeader(\"Cache-Control\",\"no-store";
_hu._getrequest().SetHeader("Cache-Control","no-store, no-cache, must-revalidate, max-age=0");
 //BA.debugLineNum = 54;BA.debugLine="End Sub";
return "";
}
public static String  _activity_pause(boolean _userclosed) throws Exception{
 //BA.debugLineNum = 60;BA.debugLine="Sub Activity_Pause (UserClosed As Boolean)";
 //BA.debugLineNum = 62;BA.debugLine="End Sub";
return "";
}
public static String  _activity_resume() throws Exception{
 //BA.debugLineNum = 56;BA.debugLine="Sub Activity_Resume";
 //BA.debugLineNum = 58;BA.debugLine="End Sub";
return "";
}
public static String  _banners_receive(anywheresoftware.b4a.objects.collections.List _data) throws Exception{
anywheresoftware.b4a.objects.collections.Map _predefine = null;
int _top = 0;
int _i = 0;
anywheresoftware.b4a.objects.PanelWrapper _p1 = null;
anywheresoftware.b4a.objects.collections.Map _d1 = null;
anywheresoftware.b4a.objects.LabelWrapper _lbltitle = null;
anywheresoftware.b4a.objects.CompoundButtonWrapper.CheckBoxWrapper _chk1 = null;
 //BA.debugLineNum = 125;BA.debugLine="Sub Banners_Receive(Data As List)";
 //BA.debugLineNum = 127;BA.debugLine="Dim predefine As Map";
_predefine = new anywheresoftware.b4a.objects.collections.Map();
 //BA.debugLineNum = 128;BA.debugLine="predefine.Initialize";
_predefine.Initialize();
 //BA.debugLineNum = 129;BA.debugLine="predefine.Put(\"name\",Library.GetStringResourse(\"m";
_predefine.Put((Object)("name"),(Object)(mostCurrent._vvvvvvv6._vvvv2(mostCurrent.activityBA,"manufacture_base")));
 //BA.debugLineNum = 130;BA.debugLine="predefine.Put(\"banner_id\",\"manufacture\")";
_predefine.Put((Object)("banner_id"),(Object)("manufacture"));
 //BA.debugLineNum = 131;BA.debugLine="Data.Add(predefine)";
_data.Add((Object)(_predefine.getObject()));
 //BA.debugLineNum = 133;BA.debugLine="Dim Top As Int";
_top = 0;
 //BA.debugLineNum = 135;BA.debugLine="For i = 0 To Data.Size - 1";
{
final int step7 = 1;
final int limit7 = (int) (_data.getSize()-1);
_i = (int) (0) ;
for (;(step7 > 0 && _i <= limit7) || (step7 < 0 && _i >= limit7) ;_i = ((int)(0 + _i + step7))  ) {
 //BA.debugLineNum = 137;BA.debugLine="Dim p1 As Panel";
_p1 = new anywheresoftware.b4a.objects.PanelWrapper();
 //BA.debugLineNum = 138;BA.debugLine="p1.Initialize(\"\")";
_p1.Initialize(mostCurrent.activityBA,"");
 //BA.debugLineNum = 139;BA.debugLine="sv1.Panel.AddView(p1,0,Top,100%x,50dip)";
mostCurrent._sv1.getPanel().AddView((android.view.View)(_p1.getObject()),(int) (0),_top,anywheresoftware.b4a.keywords.Common.PerXToCurrent((float) (100),mostCurrent.activityBA),anywheresoftware.b4a.keywords.Common.DipToCurrent((int) (50)));
 //BA.debugLineNum = 141;BA.debugLine="If File.ReadString(File.DirInternal,Library.Lang";
if ((anywheresoftware.b4a.keywords.Common.File.ReadString(anywheresoftware.b4a.keywords.Common.File.getDirInternal(),mostCurrent._vvvvvvv6._vv7)).equals("fa")) { 
 //BA.debugLineNum = 142;BA.debugLine="p1.LoadLayout(\"frmitem_banners\")";
_p1.LoadLayout("frmitem_banners",mostCurrent.activityBA);
 }else {
 //BA.debugLineNum = 144;BA.debugLine="p1.LoadLayout(\"frmitem_banners_en\")";
_p1.LoadLayout("frmitem_banners_en",mostCurrent.activityBA);
 };
 //BA.debugLineNum = 147;BA.debugLine="Dim d1 As Map";
_d1 = new anywheresoftware.b4a.objects.collections.Map();
 //BA.debugLineNum = 148;BA.debugLine="d1 = Data.Get(i)";
_d1.setObject((anywheresoftware.b4a.objects.collections.Map.MyMap)(_data.Get(_i)));
 //BA.debugLineNum = 150;BA.debugLine="Dim lbltitle As Label";
_lbltitle = new anywheresoftware.b4a.objects.LabelWrapper();
 //BA.debugLineNum = 151;BA.debugLine="Dim chk1 As CheckBox";
_chk1 = new anywheresoftware.b4a.objects.CompoundButtonWrapper.CheckBoxWrapper();
 //BA.debugLineNum = 153;BA.debugLine="lbltitle	= p1.GetView(1)";
_lbltitle.setObject((android.widget.TextView)(_p1.GetView((int) (1)).getObject()));
 //BA.debugLineNum = 154;BA.debugLine="chk1		= p1.GetView(0)";
_chk1.setObject((android.widget.CheckBox)(_p1.GetView((int) (0)).getObject()));
 //BA.debugLineNum = 156;BA.debugLine="lbltitle.Text = d1.Get(\"name\")";
_lbltitle.setText(BA.ObjectToCharSequence(_d1.Get((Object)("name"))));
 //BA.debugLineNum = 157;BA.debugLine="chk1.Tag = d1.Get(\"banner_id\")";
_chk1.setTag(_d1.Get((Object)("banner_id")));
 //BA.debugLineNum = 159;BA.debugLine="If ExistKey(d1.Get(\"banner_id\")) Then chk1.Check";
if (_vvvvvvvvvvv3(BA.ObjectToString(_d1.Get((Object)("banner_id"))))) { 
_chk1.setChecked(anywheresoftware.b4a.keywords.Common.True);};
 //BA.debugLineNum = 161;BA.debugLine="lbltitle.Tag = chk1";
_lbltitle.setTag((Object)(_chk1.getObject()));
 //BA.debugLineNum = 163;BA.debugLine="Checks.Add(chk1)";
mostCurrent._vvvvvvvvvv5.Add((Object)(_chk1.getObject()));
 //BA.debugLineNum = 165;BA.debugLine="Top = Top + p1.Height";
_top = (int) (_top+_p1.getHeight());
 }
};
 //BA.debugLineNum = 169;BA.debugLine="sv1.Panel.Height = Top";
mostCurrent._sv1.getPanel().setHeight(_top);
 //BA.debugLineNum = 170;BA.debugLine="progress.HideProgress";
mostCurrent._vvvvvvvvv7._vvvvvvvv0();
 //BA.debugLineNum = 172;BA.debugLine="End Sub";
return "";
}
public static String  _btncancel_click() throws Exception{
 //BA.debugLineNum = 121;BA.debugLine="Sub btncancel_Click";
 //BA.debugLineNum = 122;BA.debugLine="Activity.Finish";
mostCurrent._activity.Finish();
 //BA.debugLineNum = 123;BA.debugLine="End Sub";
return "";
}
public static String  _btnsend_click() throws Exception{
anywheresoftware.b4a.objects.collections.List _id = null;
int _i = 0;
anywheresoftware.b4a.objects.CompoundButtonWrapper.CheckBoxWrapper _ch = null;
anywheresoftware.b4a.objects.collections.JSONParser.JSONGenerator _js = null;
anywheresoftware.b4a.objects.StringUtils _su = null;
anywheresoftware.b4a.samples.httputils2.httpjob _hu = null;
 //BA.debugLineNum = 64;BA.debugLine="Sub btnsend_Click";
 //BA.debugLineNum = 66;BA.debugLine="Dim id As List";
_id = new anywheresoftware.b4a.objects.collections.List();
 //BA.debugLineNum = 67;BA.debugLine="id.Initialize";
_id.Initialize();
 //BA.debugLineNum = 69;BA.debugLine="For i = 0 To Checks.Size - 1";
{
final int step3 = 1;
final int limit3 = (int) (mostCurrent._vvvvvvvvvv5.getSize()-1);
_i = (int) (0) ;
for (;(step3 > 0 && _i <= limit3) || (step3 < 0 && _i >= limit3) ;_i = ((int)(0 + _i + step3))  ) {
 //BA.debugLineNum = 71;BA.debugLine="Dim ch As CheckBox";
_ch = new anywheresoftware.b4a.objects.CompoundButtonWrapper.CheckBoxWrapper();
 //BA.debugLineNum = 72;BA.debugLine="ch = Checks.Get(i)";
_ch.setObject((android.widget.CheckBox)(mostCurrent._vvvvvvvvvv5.Get(_i)));
 //BA.debugLineNum = 74;BA.debugLine="If ch.Checked = True Then	id.Add(ch.Tag)";
if (_ch.getChecked()==anywheresoftware.b4a.keywords.Common.True) { 
_id.Add(_ch.getTag());};
 }
};
 //BA.debugLineNum = 78;BA.debugLine="progress.ShowProgress(Library.GetStringResourse(\"";
mostCurrent._vvvvvvvvv7._vvvvvvvvv1(mostCurrent._vvvvvvv6._vvvv2(mostCurrent.activityBA,"during_apply"));
 //BA.debugLineNum = 80;BA.debugLine="Dim js As JSONGenerator";
_js = new anywheresoftware.b4a.objects.collections.JSONParser.JSONGenerator();
 //BA.debugLineNum = 81;BA.debugLine="js.Initialize2(id)";
_js.Initialize2(_id);
 //BA.debugLineNum = 83;BA.debugLine="Dim su As StringUtils";
_su = new anywheresoftware.b4a.objects.StringUtils();
 //BA.debugLineNum = 85;BA.debugLine="Dim hu As HttpJob";
_hu = new anywheresoftware.b4a.samples.httputils2.httpjob();
 //BA.debugLineNum = 86;BA.debugLine="hu.Initialize(\"save_banner\",Me)";
_hu._initialize(processBA,"save_banner",actbanners.getObject());
 //BA.debugLineNum = 87;BA.debugLine="hu.Download(Library.URL & \"method=save_banner&id=";
_hu._download(mostCurrent._vvvvvvv6._vv2+"method=save_banner&id="+_su.EncodeUrl(_js.ToString(),"UTF8"));
 //BA.debugLineNum = 89;BA.debugLine="End Sub";
return "";
}
public static boolean  _vvvvvvvvvvv3(String _id) throws Exception{
int _i = 0;
String _temp = "";
 //BA.debugLineNum = 174;BA.debugLine="Sub ExistKey(ID As String) As Boolean";
 //BA.debugLineNum = 176;BA.debugLine="For i = 0 To ServerChoosenBanner.Size - 1";
{
final int step1 = 1;
final int limit1 = (int) (mostCurrent._vvvvvvvvvvv2.getSize()-1);
_i = (int) (0) ;
for (;(step1 > 0 && _i <= limit1) || (step1 < 0 && _i >= limit1) ;_i = ((int)(0 + _i + step1))  ) {
 //BA.debugLineNum = 177;BA.debugLine="Dim temp As String";
_temp = "";
 //BA.debugLineNum = 178;BA.debugLine="temp = ServerChoosenBanner.Get(i)";
_temp = BA.ObjectToString(mostCurrent._vvvvvvvvvvv2.Get(_i));
 //BA.debugLineNum = 179;BA.debugLine="If temp = ID Then Return True";
if ((_temp).equals(_id)) { 
if (true) return anywheresoftware.b4a.keywords.Common.True;};
 }
};
 //BA.debugLineNum = 182;BA.debugLine="Return False";
if (true) return anywheresoftware.b4a.keywords.Common.False;
 //BA.debugLineNum = 184;BA.debugLine="End Sub";
return false;
}
public static String  _globals() throws Exception{
 //BA.debugLineNum = 10;BA.debugLine="Sub Globals";
 //BA.debugLineNum = 11;BA.debugLine="Private lblheader As Label";
mostCurrent._lblheader = new anywheresoftware.b4a.objects.LabelWrapper();
 //BA.debugLineNum = 12;BA.debugLine="Private btnsend As Button";
mostCurrent._btnsend = new anywheresoftware.b4a.objects.ButtonWrapper();
 //BA.debugLineNum = 13;BA.debugLine="Private btncancel As Button";
mostCurrent._btncancel = new anywheresoftware.b4a.objects.ButtonWrapper();
 //BA.debugLineNum = 14;BA.debugLine="Private progress As ShowProgress";
mostCurrent._vvvvvvvvv7 = new com.apps.manageropencart.showprogress();
 //BA.debugLineNum = 15;BA.debugLine="Dim opencart1 As OpenCart";
mostCurrent._vvvvvvvvvv6 = new com.apps.manageropencart.opencart();
 //BA.debugLineNum = 16;BA.debugLine="Private toast As MyToastMessageShow";
mostCurrent._vvvvvvvvv0 = new com.apps.manageropencart.mytoastmessageshow();
 //BA.debugLineNum = 17;BA.debugLine="Private Checks As List";
mostCurrent._vvvvvvvvvv5 = new anywheresoftware.b4a.objects.collections.List();
 //BA.debugLineNum = 18;BA.debugLine="Private ServerChoosenBanner,BannersItems As List";
mostCurrent._vvvvvvvvvvv2 = new anywheresoftware.b4a.objects.collections.List();
mostCurrent._vvvvvvvvvvv1 = new anywheresoftware.b4a.objects.collections.List();
 //BA.debugLineNum = 19;BA.debugLine="Private sv1 As ScrollView";
mostCurrent._sv1 = new anywheresoftware.b4a.objects.ScrollViewWrapper();
 //BA.debugLineNum = 20;BA.debugLine="End Sub";
return "";
}
public static String  _jobdone(anywheresoftware.b4a.samples.httputils2.httpjob _job) throws Exception{
anywheresoftware.b4a.objects.collections.Map _m = null;
anywheresoftware.b4a.objects.collections.Map _m1 = null;
 //BA.debugLineNum = 91;BA.debugLine="Sub JobDone(Job As HttpJob)";
 //BA.debugLineNum = 93;BA.debugLine="progress.HideProgress";
mostCurrent._vvvvvvvvv7._vvvvvvvv0();
 //BA.debugLineNum = 95;BA.debugLine="If 	Job.Success Then";
if (_job._success) { 
 //BA.debugLineNum = 97;BA.debugLine="If Job.JobName = \"save_banner\" Then";
if ((_job._jobname).equals("save_banner")) { 
 //BA.debugLineNum = 98;BA.debugLine="Dim m As Map";
_m = new anywheresoftware.b4a.objects.collections.Map();
 //BA.debugLineNum = 99;BA.debugLine="m = Library.Json2Map(Job.GetString)";
_m = mostCurrent._vvvvvvv6._vvvv5(mostCurrent.activityBA,_job._getstring());
 //BA.debugLineNum = 100;BA.debugLine="If m.Get(\"result\") = True Then";
if ((_m.Get((Object)("result"))).equals((Object)(anywheresoftware.b4a.keywords.Common.True))) { 
 //BA.debugLineNum = 101;BA.debugLine="toast.ShowToastMessageShow(Library.GetStringRe";
mostCurrent._vvvvvvvvv0._vvvvvvvvv3(mostCurrent._vvvvvvv6._vvvv2(mostCurrent.activityBA,"choosen_banner"),(long) (2),anywheresoftware.b4a.keywords.Common.True);
 }else {
 //BA.debugLineNum = 103;BA.debugLine="toast.ShowToastMessageShow(Library.GetStringRe";
mostCurrent._vvvvvvvvv0._vvvvvvvvv3(mostCurrent._vvvvvvv6._vvvv2(mostCurrent.activityBA,"error_data"),(long) (2),anywheresoftware.b4a.keywords.Common.False);
 };
 }else if((_job._jobname).equals("config")) { 
 //BA.debugLineNum = 108;BA.debugLine="Dim m1 As Map";
_m1 = new anywheresoftware.b4a.objects.collections.Map();
 //BA.debugLineNum = 109;BA.debugLine="m1 = Library.Json2Map(Job.GetString)";
_m1 = mostCurrent._vvvvvvv6._vvvv5(mostCurrent.activityBA,_job._getstring());
 //BA.debugLineNum = 111;BA.debugLine="ServerChoosenBanner = m1.Get(\"banner\")";
mostCurrent._vvvvvvvvvvv2.setObject((java.util.List)(_m1.Get((Object)("banner"))));
 //BA.debugLineNum = 113;BA.debugLine="opencart1.GetBanners(Me,\"Banners_Receive\",\"\")";
mostCurrent._vvvvvvvvvv6._vvvvvv1(actbanners.getObject(),"Banners_Receive","");
 };
 };
 //BA.debugLineNum = 119;BA.debugLine="End Sub";
return "";
}
public static String  _lbltitle_click() throws Exception{
anywheresoftware.b4a.objects.LabelWrapper _ls = null;
anywheresoftware.b4a.objects.CompoundButtonWrapper.CheckBoxWrapper _chk = null;
 //BA.debugLineNum = 186;BA.debugLine="Sub lbltitle_Click";
 //BA.debugLineNum = 188;BA.debugLine="Dim ls As Label";
_ls = new anywheresoftware.b4a.objects.LabelWrapper();
 //BA.debugLineNum = 189;BA.debugLine="ls = Sender";
_ls.setObject((android.widget.TextView)(anywheresoftware.b4a.keywords.Common.Sender(mostCurrent.activityBA)));
 //BA.debugLineNum = 191;BA.debugLine="Dim chk As CheckBox";
_chk = new anywheresoftware.b4a.objects.CompoundButtonWrapper.CheckBoxWrapper();
 //BA.debugLineNum = 192;BA.debugLine="chk = ls.Tag";
_chk.setObject((android.widget.CheckBox)(_ls.getTag()));
 //BA.debugLineNum = 193;BA.debugLine="chk.Checked = Not(chk.Checked)";
_chk.setChecked(anywheresoftware.b4a.keywords.Common.Not(_chk.getChecked()));
 //BA.debugLineNum = 195;BA.debugLine="End Sub";
return "";
}
public static String  _process_globals() throws Exception{
 //BA.debugLineNum = 6;BA.debugLine="Sub Process_Globals";
 //BA.debugLineNum = 8;BA.debugLine="End Sub";
return "";
}
}
