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

public class actcategory extends Activity implements B4AActivity{
	public static actcategory mostCurrent;
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
			processBA = new BA(this.getApplicationContext(), null, null, "com.apps.demo", "com.apps.demo.actcategory");
			processBA.loadHtSubs(this.getClass());
	        float deviceScale = getApplicationContext().getResources().getDisplayMetrics().density;
	        BALayout.setDeviceScale(deviceScale);
            
		}
		else if (previousOne != null) {
			Activity p = previousOne.get();
			if (p != null && p != this) {
                BA.LogInfo("Killing previous instance (actcategory).");
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
		activityBA = new BA(this, layout, processBA, "com.apps.demo", "com.apps.demo.actcategory");
        
        processBA.sharedProcessBA.activityBA = new java.lang.ref.WeakReference<BA>(activityBA);
        anywheresoftware.b4a.objects.ViewWrapper.lastId = 0;
        _activity = new ActivityWrapper(activityBA, "activity");
        anywheresoftware.b4a.Msgbox.isDismissing = false;
        if (BA.isShellModeRuntimeCheck(processBA)) {
			if (isFirst)
				processBA.raiseEvent2(null, true, "SHELL", false);
			processBA.raiseEvent2(null, true, "CREATE", true, "com.apps.demo.actcategory", processBA, activityBA, _activity, anywheresoftware.b4a.keywords.Common.Density, mostCurrent);
			_activity.reinitializeForShell(activityBA, "activity");
		}
        initializeProcessGlobals();		
        initializeGlobals();
        
        BA.LogInfo("** Activity (actcategory) Create, isFirst = " + isFirst + " **");
        processBA.raiseEvent2(null, true, "activity_create", false, isFirst);
		isFirst = false;
		if (this != mostCurrent)
			return;
        processBA.setActivityPaused(false);
        BA.LogInfo("** Activity (actcategory) Resume **");
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
		return actcategory.class;
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
        BA.LogInfo("** Activity (actcategory) Pause, UserClosed = " + activityBA.activity.isFinishing() + " **");
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
            BA.LogInfo("** Activity (actcategory) Resume **");
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
public anywheresoftware.b4a.objects.ButtonWrapper _scollbutton = null;
public anywheresoftware.b4a.objects.LabelWrapper _lbltitle = null;
public anywheresoftware.b4a.objects.LabelWrapper _lblpb = null;
public anywheresoftware.b4a.objects.PanelWrapper _pnlloading = null;
public anywheresoftware.b4a.objects.LabelWrapper _lblctitle = null;
public anywheresoftware.b4a.objects.ImageViewWrapper _imgicon = null;
public anywheresoftware.b4a.objects.PanelWrapper _pncategory = null;
public anywheresoftware.b4a.objects.PanelWrapper _pnlheader = null;
public anywheresoftware.b4a.objects.collections.List _historycategory = null;
public anywheresoftware.b4a.objects.collections.List _historycategorytitle = null;
public anywheresoftware.b4a.objects.ImageViewWrapper _imgiconcat = null;
public anywheresoftware.b4a.objects.PanelWrapper _pnlovercat = null;
public anywheresoftware.b4a.objects.LabelWrapper _lblbasket = null;
public com.apps.demo.mytoastmessageshow _mytoastmessageshow = null;
public flm.b4a.ultimatelistview.UltimateListViewWrapper _ulv = null;
public anywheresoftware.b4a.objects.collections.List _result = null;
public anywheresoftware.b4a.objects.collections.List _resultcategory = null;
public static boolean _cache_state = false;
public anywheresoftware.b4a.objects.drawable.BitmapDrawable _error_image = null;
public com.apps.demo.opencart _op = null;
public static String _currentcategoryid = "";
public anywheresoftware.b4a.objects.PanelWrapper _pnlcontainer = null;
public anywheresoftware.b4a.objects.ButtonWrapper _btnreturn = null;
public anywheresoftware.b4a.objects.ProgressBarWrapper _loading = null;
public anywheresoftware.b4a.objects.ButtonWrapper _btnclose = null;
public anywheresoftware.b4a.objects.LabelWrapper _lblcrumb = null;
public ariagp.amin.shahedi.AriaGlideWrapper _aria = null;
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
anywheresoftware.b4a.objects.drawable.ColorDrawable _c1 = null;
anywheresoftware.b4a.objects.drawable.ColorDrawable _cd = null;
anywheresoftware.b4a.objects.collections.List _cache = null;
 //BA.debugLineNum = 48;BA.debugLine="Sub Activity_Create(FirstTime As Boolean)";
 //BA.debugLineNum = 50;BA.debugLine="Activity.LoadLayout(\"frmcategory\")";
mostCurrent._activity.LoadLayout("frmcategory",mostCurrent.activityBA);
 //BA.debugLineNum = 51;BA.debugLine="MyToastMessageShow.Initialize(Activity)";
mostCurrent._mytoastmessageshow._initialize(mostCurrent.activityBA,(anywheresoftware.b4a.objects.PanelWrapper) anywheresoftware.b4a.AbsObjectWrapper.ConvertToWrapper(new anywheresoftware.b4a.objects.PanelWrapper(), (android.view.ViewGroup)(mostCurrent._activity.getObject())));
 //BA.debugLineNum = 53;BA.debugLine="Library.ChangeStatusColor";
mostCurrent._library._changestatuscolor(mostCurrent.activityBA);
 //BA.debugLineNum = 57;BA.debugLine="ScollButton = Library.MakeUpScrollButton(Activity";
mostCurrent._scollbutton = mostCurrent._library._makeupscrollbutton(mostCurrent.activityBA,(anywheresoftware.b4a.objects.PanelWrapper) anywheresoftware.b4a.AbsObjectWrapper.ConvertToWrapper(new anywheresoftware.b4a.objects.PanelWrapper(), (android.view.ViewGroup)(mostCurrent._activity.getObject())));
 //BA.debugLineNum = 59;BA.debugLine="btnreturn.Width = ScollButton.Width";
mostCurrent._btnreturn.setWidth(mostCurrent._scollbutton.getWidth());
 //BA.debugLineNum = 60;BA.debugLine="btnreturn.Height = ScollButton.Height";
mostCurrent._btnreturn.setHeight(mostCurrent._scollbutton.getHeight());
 //BA.debugLineNum = 62;BA.debugLine="Library.setLocalApp(Library.currLang)";
mostCurrent._library._setlocalapp(mostCurrent.activityBA,mostCurrent._library._currlang);
 //BA.debugLineNum = 64;BA.debugLine="lbltitle.Text = Library.GetStringResourse(\"catego";
mostCurrent._lbltitle.setText(BA.ObjectToCharSequence(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"category")));
 //BA.debugLineNum = 65;BA.debugLine="lbltitle.Tag = lbltitle.Text";
mostCurrent._lbltitle.setTag((Object)(mostCurrent._lbltitle.getText()));
 //BA.debugLineNum = 66;BA.debugLine="lblpb.Text = Library.GetStringResourse(\"loading\")";
mostCurrent._lblpb.setText(BA.ObjectToCharSequence(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"loading")));
 //BA.debugLineNum = 67;BA.debugLine="pnlheader.Color = Library.Theme_Header";
mostCurrent._pnlheader.setColor(mostCurrent._library._theme_header);
 //BA.debugLineNum = 69;BA.debugLine="Dim c1 As ColorDrawable";
_c1 = new anywheresoftware.b4a.objects.drawable.ColorDrawable();
 //BA.debugLineNum = 70;BA.debugLine="c1.Initialize(Library.Theme_Header,50)";
_c1.Initialize(mostCurrent._library._theme_header,(int) (50));
 //BA.debugLineNum = 71;BA.debugLine="btnreturn.Background = Library.GetButtonStateCirc";
mostCurrent._btnreturn.setBackground((android.graphics.drawable.Drawable)(mostCurrent._library._getbuttonstatecircle(mostCurrent.activityBA,mostCurrent._btnreturn.getWidth()).getObject()));
 //BA.debugLineNum = 73;BA.debugLine="currentCategoryID = \"0\"";
mostCurrent._currentcategoryid = "0";
 //BA.debugLineNum = 75;BA.debugLine="historyCategory.Initialize";
mostCurrent._historycategory.Initialize();
 //BA.debugLineNum = 76;BA.debugLine="historyCategoryTitle.Initialize";
mostCurrent._historycategorytitle.Initialize();
 //BA.debugLineNum = 78;BA.debugLine="historyCategory.Add(\"0\")";
mostCurrent._historycategory.Add((Object)("0"));
 //BA.debugLineNum = 79;BA.debugLine="historyCategoryTitle.Add(Library.GetStringResours";
mostCurrent._historycategorytitle.Add((Object)(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"home")));
 //BA.debugLineNum = 81;BA.debugLine="cache_state		= Library.manager.GetBoolean(\"cache\"";
_cache_state = mostCurrent._library._manager.GetBoolean("cache");
 //BA.debugLineNum = 82;BA.debugLine="error_image.Initialize(LoadBitmap(File.DirAssets,";
mostCurrent._error_image.Initialize((android.graphics.Bitmap)(anywheresoftware.b4a.keywords.Common.LoadBitmap(anywheresoftware.b4a.keywords.Common.File.getDirAssets(),"noimage.png").getObject()));
 //BA.debugLineNum = 84;BA.debugLine="op.Initialize";
mostCurrent._op._initialize(processBA);
 //BA.debugLineNum = 86;BA.debugLine="ulv.Initialize(0, 0, \"\", \"ULV\")";
mostCurrent._ulv.Initialize(mostCurrent.activityBA,(byte) (0),(int) (0),"","ULV");
 //BA.debugLineNum = 87;BA.debugLine="ulv.Color = Library.Theme_Background";
mostCurrent._ulv.setColor(mostCurrent._library._theme_background);
 //BA.debugLineNum = 89;BA.debugLine="Dim cd As ColorDrawable";
_cd = new anywheresoftware.b4a.objects.drawable.ColorDrawable();
 //BA.debugLineNum = 90;BA.debugLine="cd.Initialize(Colors.Transparent,0)";
_cd.Initialize(anywheresoftware.b4a.keywords.Common.Colors.Transparent,(int) (0));
 //BA.debugLineNum = 91;BA.debugLine="ulv.PressedDrawable = cd";
mostCurrent._ulv.setPressedDrawable((android.graphics.drawable.Drawable)(_cd.getObject()));
 //BA.debugLineNum = 93;BA.debugLine="pnlcontainer.AddView(ulv, 0, 0,pnlcontainer.Width";
mostCurrent._pnlcontainer.AddView((android.view.View)(mostCurrent._ulv.getObject()),(int) (0),(int) (0),mostCurrent._pnlcontainer.getWidth(),mostCurrent._pnlcontainer.getHeight());
 //BA.debugLineNum = 95;BA.debugLine="lblcrumb.Text = Library.GetStringResourse(\"home\")";
mostCurrent._lblcrumb.setText(BA.ObjectToCharSequence(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"home")));
 //BA.debugLineNum = 97;BA.debugLine="ulv.AddLayout(\"category\",\"Categorys_LayoutCreator";
mostCurrent._ulv.AddLayout("category","Categorys_LayoutCreator","Categorys_ContentFiller",anywheresoftware.b4a.keywords.Common.DipToCurrent((int) (93)),anywheresoftware.b4a.keywords.Common.True);
 //BA.debugLineNum = 98;BA.debugLine="ulv.AddLayout(\"products\",\"Items_LayoutCreator\", \"";
mostCurrent._ulv.AddLayout("products","Items_LayoutCreator","Items_ContentFiller",anywheresoftware.b4a.keywords.Common.DipToCurrent((int) (113)),anywheresoftware.b4a.keywords.Common.True);
 //BA.debugLineNum = 100;BA.debugLine="Dim cache As List";
_cache = new anywheresoftware.b4a.objects.collections.List();
 //BA.debugLineNum = 101;BA.debugLine="cache = Library.CacheSystem.GetCacheAsList(curren";
_cache = mostCurrent._library._cachesystem._getcacheaslist(mostCurrent._currentcategoryid,"category");
 //BA.debugLineNum = 103;BA.debugLine="If cache.IsInitialized Then";
if (_cache.IsInitialized()) { 
 //BA.debugLineNum = 104;BA.debugLine="CategoryList_Receive(cache,\"\")";
_categorylist_receive(_cache,"");
 }else {
 //BA.debugLineNum = 106;BA.debugLine="pnlloading.SetVisibleAnimated(600,True)";
mostCurrent._pnlloading.SetVisibleAnimated((int) (600),anywheresoftware.b4a.keywords.Common.True);
 //BA.debugLineNum = 107;BA.debugLine="op.GetCategory(Me,\"CategoryList_Receive\",\"\")";
mostCurrent._op._getcategory(actcategory.getObject(),"CategoryList_Receive","");
 };
 //BA.debugLineNum = 110;BA.debugLine="End Sub";
return "";
}
public static boolean  _activity_keypress(int _keycode) throws Exception{
 //BA.debugLineNum = 120;BA.debugLine="Sub Activity_KeyPress (KeyCode As Int) As Boolean";
 //BA.debugLineNum = 122;BA.debugLine="If KeyCode = KeyCodes.KEYCODE_BACK Then";
if (_keycode==anywheresoftware.b4a.keywords.Common.KeyCodes.KEYCODE_BACK) { 
 //BA.debugLineNum = 123;BA.debugLine="If historyCategory.Size = 1 Then";
if (mostCurrent._historycategory.getSize()==1) { 
 //BA.debugLineNum = 124;BA.debugLine="Activity.Finish";
mostCurrent._activity.Finish();
 }else {
 };
 };
 //BA.debugLineNum = 131;BA.debugLine="End Sub";
return false;
}
public static String  _activity_pause(boolean _userclosed) throws Exception{
 //BA.debugLineNum = 116;BA.debugLine="Sub Activity_Pause (UserClosed As Boolean)";
 //BA.debugLineNum = 117;BA.debugLine="Library.AnimationFromLeft2Right";
mostCurrent._library._animationfromleft2right(mostCurrent.activityBA);
 //BA.debugLineNum = 118;BA.debugLine="End Sub";
return "";
}
public static String  _activity_resume() throws Exception{
 //BA.debugLineNum = 112;BA.debugLine="Sub Activity_Resume";
 //BA.debugLineNum = 113;BA.debugLine="Library.ShowCartLabel(lblbasket)";
mostCurrent._library._showcartlabel(mostCurrent.activityBA,mostCurrent._lblbasket);
 //BA.debugLineNum = 114;BA.debugLine="End Sub";
return "";
}
public static String  _bookmark_receive(anywheresoftware.b4a.objects.collections.Map _res,String _cat) throws Exception{
 //BA.debugLineNum = 629;BA.debugLine="Sub Bookmark_receive(res As Map,cat As String)";
 //BA.debugLineNum = 630;BA.debugLine="Log(res)";
anywheresoftware.b4a.keywords.Common.Log(BA.ObjectToString(_res));
 //BA.debugLineNum = 631;BA.debugLine="End Sub";
return "";
}
public static String  _btnbasket_click() throws Exception{
 //BA.debugLineNum = 141;BA.debugLine="Sub btnbasket_Click";
 //BA.debugLineNum = 142;BA.debugLine="StartActivity(actBasket)";
anywheresoftware.b4a.keywords.Common.StartActivity(mostCurrent.activityBA,(Object)(mostCurrent._actbasket.getObject()));
 //BA.debugLineNum = 143;BA.debugLine="End Sub";
return "";
}
public static String  _btnclose_click() throws Exception{
 //BA.debugLineNum = 145;BA.debugLine="Sub btnclose_Click";
 //BA.debugLineNum = 146;BA.debugLine="Activity.Finish";
mostCurrent._activity.Finish();
 //BA.debugLineNum = 147;BA.debugLine="End Sub";
return "";
}
public static String  _btnreturn_click() throws Exception{
anywheresoftware.b4a.objects.collections.List _cache = null;
 //BA.debugLineNum = 559;BA.debugLine="Sub btnreturn_Click";
 //BA.debugLineNum = 561;BA.debugLine="If historyCategory.Size = 1 Then Return";
if (mostCurrent._historycategory.getSize()==1) { 
if (true) return "";};
 //BA.debugLineNum = 563;BA.debugLine="historyCategory.RemoveAt(historyCategory.Size-1)";
mostCurrent._historycategory.RemoveAt((int) (mostCurrent._historycategory.getSize()-1));
 //BA.debugLineNum = 564;BA.debugLine="historyCategoryTitle.RemoveAt(historyCategoryTitl";
mostCurrent._historycategorytitle.RemoveAt((int) (mostCurrent._historycategorytitle.getSize()-1));
 //BA.debugLineNum = 566;BA.debugLine="If historyCategory.Size = 1 Then btnreturn.Visibl";
if (mostCurrent._historycategory.getSize()==1) { 
mostCurrent._btnreturn.setVisible(anywheresoftware.b4a.keywords.Common.False);};
 //BA.debugLineNum = 568;BA.debugLine="ShowCrumb";
_showcrumb();
 //BA.debugLineNum = 570;BA.debugLine="currentCategoryID = historyCategory.Get(historyCa";
mostCurrent._currentcategoryid = BA.ObjectToString(mostCurrent._historycategory.Get((int) (mostCurrent._historycategory.getSize()-1)));
 //BA.debugLineNum = 572;BA.debugLine="pnlloading.Visible = True";
mostCurrent._pnlloading.setVisible(anywheresoftware.b4a.keywords.Common.True);
 //BA.debugLineNum = 574;BA.debugLine="Dim cache As List";
_cache = new anywheresoftware.b4a.objects.collections.List();
 //BA.debugLineNum = 575;BA.debugLine="cache = Library.CacheSystem.GetCacheAsList(curren";
_cache = mostCurrent._library._cachesystem._getcacheaslist(mostCurrent._currentcategoryid,"category");
 //BA.debugLineNum = 577;BA.debugLine="If cache.IsInitialized Then";
if (_cache.IsInitialized()) { 
 //BA.debugLineNum = 578;BA.debugLine="CategoryList_Receive(cache,\"\")";
_categorylist_receive(_cache,"");
 }else {
 //BA.debugLineNum = 580;BA.debugLine="op.GetCategory(Me,\"CategoryList_Receive\",current";
mostCurrent._op._getcategory(actcategory.getObject(),"CategoryList_Receive",mostCurrent._currentcategoryid);
 };
 //BA.debugLineNum = 583;BA.debugLine="ulv.JumpTo(0,True)";
mostCurrent._ulv.JumpTo((int) (0),anywheresoftware.b4a.keywords.Common.True);
 //BA.debugLineNum = 585;BA.debugLine="End Sub";
return "";
}
public static String  _btnscrollup_click() throws Exception{
 //BA.debugLineNum = 597;BA.debugLine="Sub btnScrollUp_Click";
 //BA.debugLineNum = 598;BA.debugLine="ulv.JumpTo(0,True)";
mostCurrent._ulv.JumpTo((int) (0),anywheresoftware.b4a.keywords.Common.True);
 //BA.debugLineNum = 599;BA.debugLine="ScollButton.SetLayoutAnimated(760,ScollButton.Lef";
mostCurrent._scollbutton.SetLayoutAnimated((int) (760),mostCurrent._scollbutton.getLeft(),(int) (mostCurrent._activity.getHeight()+mostCurrent._scollbutton.getHeight()),mostCurrent._scollbutton.getWidth(),mostCurrent._scollbutton.getHeight());
 //BA.debugLineNum = 600;BA.debugLine="DoEvents";
anywheresoftware.b4a.keywords.Common.DoEvents();
 //BA.debugLineNum = 601;BA.debugLine="End Sub";
return "";
}
public static String  _btnsearch_click() throws Exception{
 //BA.debugLineNum = 137;BA.debugLine="Sub btnsearch_Click";
 //BA.debugLineNum = 138;BA.debugLine="StartActivity(actSearch)";
anywheresoftware.b4a.keywords.Common.StartActivity(mostCurrent.activityBA,(Object)(mostCurrent._actsearch.getObject()));
 //BA.debugLineNum = 139;BA.debugLine="End Sub";
return "";
}
public static String  _categorylist_receive(anywheresoftware.b4a.objects.collections.List _res,String _scategory) throws Exception{
anywheresoftware.b4a.objects.collections.List _cache = null;
 //BA.debugLineNum = 172;BA.debugLine="Sub CategoryList_Receive(res As List,scategory As";
 //BA.debugLineNum = 174;BA.debugLine="resultCategory = res";
mostCurrent._resultcategory = _res;
 //BA.debugLineNum = 176;BA.debugLine="If res.IsInitialized = True Then";
if (_res.IsInitialized()==anywheresoftware.b4a.keywords.Common.True) { 
 //BA.debugLineNum = 177;BA.debugLine="Library.CacheSystem.AddList2Cache(currentCategor";
mostCurrent._library._cachesystem._addlist2cache(mostCurrent._currentcategoryid,_res,"category");
 };
 //BA.debugLineNum = 180;BA.debugLine="ulv.ClearContent";
mostCurrent._ulv.ClearContent(mostCurrent.activityBA);
 //BA.debugLineNum = 182;BA.debugLine="If res.IsInitialized Then";
if (_res.IsInitialized()) { 
 //BA.debugLineNum = 183;BA.debugLine="ulv.BulkAddItems(res.Size, \"category\", 0)";
mostCurrent._ulv.BulkAddItems(_res.getSize(),"category",(int) (0));
 };
 //BA.debugLineNum = 186;BA.debugLine="If currentCategoryID <> 0 Then";
if ((mostCurrent._currentcategoryid).equals(BA.NumberToString(0)) == false) { 
 //BA.debugLineNum = 188;BA.debugLine="Dim cache As List";
_cache = new anywheresoftware.b4a.objects.collections.List();
 //BA.debugLineNum = 189;BA.debugLine="cache = Library.CacheSystem.GetCacheAsList(curre";
_cache = mostCurrent._library._cachesystem._getcacheaslist(mostCurrent._currentcategoryid,"product_of_category");
 //BA.debugLineNum = 191;BA.debugLine="If cache.IsInitialized Then";
if (_cache.IsInitialized()) { 
 //BA.debugLineNum = 192;BA.debugLine="ProductsList_Receive(cache,\"\")";
_productslist_receive(_cache,"");
 }else {
 //BA.debugLineNum = 194;BA.debugLine="pnlloading.Visible = True";
mostCurrent._pnlloading.setVisible(anywheresoftware.b4a.keywords.Common.True);
 //BA.debugLineNum = 195;BA.debugLine="op.GetCategoryProducts(Me,\"ProductsList_Receive";
mostCurrent._op._getcategoryproducts(actcategory.getObject(),"ProductsList_Receive",mostCurrent._currentcategoryid);
 };
 }else {
 //BA.debugLineNum = 199;BA.debugLine="pnlloading.Visible = False";
mostCurrent._pnlloading.setVisible(anywheresoftware.b4a.keywords.Common.False);
 //BA.debugLineNum = 200;BA.debugLine="lbltitle.Text = lbltitle.Tag";
mostCurrent._lbltitle.setText(BA.ObjectToCharSequence(mostCurrent._lbltitle.getTag()));
 //BA.debugLineNum = 201;BA.debugLine="loading.Visible = False";
mostCurrent._loading.setVisible(anywheresoftware.b4a.keywords.Common.False);
 //BA.debugLineNum = 202;BA.debugLine="btnclose.Visible = True";
mostCurrent._btnclose.setVisible(anywheresoftware.b4a.keywords.Common.True);
 };
 //BA.debugLineNum = 206;BA.debugLine="End Sub";
return "";
}
public static String  _categorys_contentfiller(long _itemid,String _layoutname,anywheresoftware.b4a.objects.PanelWrapper _layoutpanel,int _position) throws Exception{
anywheresoftware.b4a.objects.PanelWrapper _pnl = null;
anywheresoftware.b4a.objects.collections.Map _m1 = null;
String _image = "";
 //BA.debugLineNum = 220;BA.debugLine="Sub Categorys_ContentFiller(ItemID As Long, Layout";
 //BA.debugLineNum = 222;BA.debugLine="If Position > resultCategory.Size - 1 Then";
if (_position>mostCurrent._resultcategory.getSize()-1) { 
 //BA.debugLineNum = 223;BA.debugLine="Return";
if (true) return "";
 };
 //BA.debugLineNum = 226;BA.debugLine="Dim pnl As Panel : pnl = LayoutPanel.GetView(0)";
_pnl = new anywheresoftware.b4a.objects.PanelWrapper();
 //BA.debugLineNum = 226;BA.debugLine="Dim pnl As Panel : pnl = LayoutPanel.GetView(0)";
_pnl.setObject((android.view.ViewGroup)(_layoutpanel.GetView((int) (0)).getObject()));
 //BA.debugLineNum = 227;BA.debugLine="Dim imgiconcat As ImageView";
mostCurrent._imgiconcat = new anywheresoftware.b4a.objects.ImageViewWrapper();
 //BA.debugLineNum = 228;BA.debugLine="Dim lblctitle As Label";
mostCurrent._lblctitle = new anywheresoftware.b4a.objects.LabelWrapper();
 //BA.debugLineNum = 230;BA.debugLine="imgiconcat = pnl.GetView(0)";
mostCurrent._imgiconcat.setObject((android.widget.ImageView)(_pnl.GetView((int) (0)).getObject()));
 //BA.debugLineNum = 231;BA.debugLine="lblctitle = pnl.GetView(1)";
mostCurrent._lblctitle.setObject((android.widget.TextView)(_pnl.GetView((int) (1)).getObject()));
 //BA.debugLineNum = 233;BA.debugLine="Dim m1 As Map";
_m1 = new anywheresoftware.b4a.objects.collections.Map();
 //BA.debugLineNum = 234;BA.debugLine="m1 = resultCategory.Get(Position)";
_m1.setObject((anywheresoftware.b4a.objects.collections.Map.MyMap)(mostCurrent._resultcategory.Get(_position)));
 //BA.debugLineNum = 236;BA.debugLine="lblctitle.Text = m1.Get(\"name\")";
mostCurrent._lblctitle.setText(BA.ObjectToCharSequence(_m1.Get((Object)("name"))));
 //BA.debugLineNum = 237;BA.debugLine="lblctitle.Text = lblctitle.Text.Replace(\"&quot;\",";
mostCurrent._lblctitle.setText(BA.ObjectToCharSequence(mostCurrent._lblctitle.getText().replace("&quot;",anywheresoftware.b4a.keywords.Common.QUOTE).replace("&amp;","&")));
 //BA.debugLineNum = 239;BA.debugLine="Dim image As String";
_image = "";
 //BA.debugLineNum = 240;BA.debugLine="image = m1.Get(\"image\")";
_image = BA.ObjectToString(_m1.Get((Object)("image")));
 //BA.debugLineNum = 241;BA.debugLine="image = image.Replace(\" \",\"%20\")";
_image = _image.replace(" ","%20");
 //BA.debugLineNum = 243;BA.debugLine="If image.Length > 0 And image <> \"null\" Then";
if (_image.length()>0 && (_image).equals("null") == false) { 
 //BA.debugLineNum = 244;BA.debugLine="aria.Load(image).AsBitmap.Error(error_image.Bitm";
mostCurrent._aria.Load((Object)(_image)).AsBitmap().Error(mostCurrent._error_image.getBitmap()).Resize(mostCurrent._imgiconcat.getWidth(),mostCurrent._imgiconcat.getHeight()).CenterCrop().IntoImageView(mostCurrent._imgiconcat);
 }else {
 //BA.debugLineNum = 246;BA.debugLine="aria.Load(\"File:///android_asset/noimage1.png\").";
mostCurrent._aria.Load((Object)("File:///android_asset/noimage1.png")).AsBitmap().Error(mostCurrent._error_image.getBitmap()).Resize(mostCurrent._imgiconcat.getWidth(),mostCurrent._imgiconcat.getHeight()).CenterCrop().IntoImageView(mostCurrent._imgiconcat);
 };
 //BA.debugLineNum = 249;BA.debugLine="End Sub";
return "";
}
public static String  _categorys_layoutcreator(String _layoutname,anywheresoftware.b4a.objects.PanelWrapper _layoutpanel) throws Exception{
 //BA.debugLineNum = 208;BA.debugLine="Sub Categorys_LayoutCreator(LayoutName As String,";
 //BA.debugLineNum = 210;BA.debugLine="If Library.IsPersian Then";
if (mostCurrent._library._ispersian(mostCurrent.activityBA)) { 
 //BA.debugLineNum = 211;BA.debugLine="LayoutPanel.LoadLayout(\"frmtemplage_category\")";
_layoutpanel.LoadLayout("frmtemplage_category",mostCurrent.activityBA);
 }else {
 //BA.debugLineNum = 213;BA.debugLine="LayoutPanel.LoadLayout(\"frmtemplage_category_en\"";
_layoutpanel.LoadLayout("frmtemplage_category_en",mostCurrent.activityBA);
 };
 //BA.debugLineNum = 216;BA.debugLine="LayoutPanel.Tag = \"category\"";
_layoutpanel.setTag((Object)("category"));
 //BA.debugLineNum = 218;BA.debugLine="End Sub";
return "";
}
public static String  _globals() throws Exception{
 //BA.debugLineNum = 10;BA.debugLine="Sub Globals";
 //BA.debugLineNum = 12;BA.debugLine="Private ScollButton As Button";
mostCurrent._scollbutton = new anywheresoftware.b4a.objects.ButtonWrapper();
 //BA.debugLineNum = 13;BA.debugLine="Private lbltitle As Label";
mostCurrent._lbltitle = new anywheresoftware.b4a.objects.LabelWrapper();
 //BA.debugLineNum = 14;BA.debugLine="Private lblpb As Label";
mostCurrent._lblpb = new anywheresoftware.b4a.objects.LabelWrapper();
 //BA.debugLineNum = 15;BA.debugLine="Private pnlloading As Panel";
mostCurrent._pnlloading = new anywheresoftware.b4a.objects.PanelWrapper();
 //BA.debugLineNum = 16;BA.debugLine="Private lblctitle As Label";
mostCurrent._lblctitle = new anywheresoftware.b4a.objects.LabelWrapper();
 //BA.debugLineNum = 17;BA.debugLine="Private imgicon As ImageView";
mostCurrent._imgicon = new anywheresoftware.b4a.objects.ImageViewWrapper();
 //BA.debugLineNum = 18;BA.debugLine="Private pncategory As Panel";
mostCurrent._pncategory = new anywheresoftware.b4a.objects.PanelWrapper();
 //BA.debugLineNum = 19;BA.debugLine="Private pnlheader As Panel";
mostCurrent._pnlheader = new anywheresoftware.b4a.objects.PanelWrapper();
 //BA.debugLineNum = 21;BA.debugLine="Private historyCategory,historyCategoryTitle As L";
mostCurrent._historycategory = new anywheresoftware.b4a.objects.collections.List();
mostCurrent._historycategorytitle = new anywheresoftware.b4a.objects.collections.List();
 //BA.debugLineNum = 23;BA.debugLine="Private imgiconcat As ImageView";
mostCurrent._imgiconcat = new anywheresoftware.b4a.objects.ImageViewWrapper();
 //BA.debugLineNum = 24;BA.debugLine="Private pnlovercat As Panel";
mostCurrent._pnlovercat = new anywheresoftware.b4a.objects.PanelWrapper();
 //BA.debugLineNum = 25;BA.debugLine="Private lblbasket As Label";
mostCurrent._lblbasket = new anywheresoftware.b4a.objects.LabelWrapper();
 //BA.debugLineNum = 26;BA.debugLine="Dim MyToastMessageShow As MyToastMessageShow";
mostCurrent._mytoastmessageshow = new com.apps.demo.mytoastmessageshow();
 //BA.debugLineNum = 28;BA.debugLine="Dim ulv As UltimateListView";
mostCurrent._ulv = new flm.b4a.ultimatelistview.UltimateListViewWrapper();
 //BA.debugLineNum = 29;BA.debugLine="Dim result,resultCategory As List";
mostCurrent._result = new anywheresoftware.b4a.objects.collections.List();
mostCurrent._resultcategory = new anywheresoftware.b4a.objects.collections.List();
 //BA.debugLineNum = 30;BA.debugLine="Dim cache_state As Boolean";
_cache_state = false;
 //BA.debugLineNum = 31;BA.debugLine="Dim error_image As BitmapDrawable";
mostCurrent._error_image = new anywheresoftware.b4a.objects.drawable.BitmapDrawable();
 //BA.debugLineNum = 32;BA.debugLine="Dim op As OpenCart";
mostCurrent._op = new com.apps.demo.opencart();
 //BA.debugLineNum = 33;BA.debugLine="Private currentCategoryID As String : currentCate";
mostCurrent._currentcategoryid = "";
 //BA.debugLineNum = 33;BA.debugLine="Private currentCategoryID As String : currentCate";
mostCurrent._currentcategoryid = "";
 //BA.debugLineNum = 36;BA.debugLine="Private pnlcontainer As Panel";
mostCurrent._pnlcontainer = new anywheresoftware.b4a.objects.PanelWrapper();
 //BA.debugLineNum = 37;BA.debugLine="Private btnreturn As Button";
mostCurrent._btnreturn = new anywheresoftware.b4a.objects.ButtonWrapper();
 //BA.debugLineNum = 39;BA.debugLine="Private loading As ProgressBar";
mostCurrent._loading = new anywheresoftware.b4a.objects.ProgressBarWrapper();
 //BA.debugLineNum = 40;BA.debugLine="Private btnclose As Button";
mostCurrent._btnclose = new anywheresoftware.b4a.objects.ButtonWrapper();
 //BA.debugLineNum = 41;BA.debugLine="Private lblcrumb As Label";
mostCurrent._lblcrumb = new anywheresoftware.b4a.objects.LabelWrapper();
 //BA.debugLineNum = 42;BA.debugLine="Dim aria As AriaGlide";
mostCurrent._aria = new ariagp.amin.shahedi.AriaGlideWrapper();
 //BA.debugLineNum = 44;BA.debugLine="End Sub";
return "";
}
public static String  _items_contentfiller(long _itemid,String _layoutname,anywheresoftware.b4a.objects.PanelWrapper _layoutpanel,int _position) throws Exception{
int _pos = 0;
anywheresoftware.b4a.objects.collections.Map _temp = null;
anywheresoftware.b4a.objects.PanelWrapper _pnl = null;
anywheresoftware.b4a.objects.ImageViewWrapper _imgicon2 = null;
anywheresoftware.b4a.objects.LabelWrapper _lblpprice = null;
anywheresoftware.b4a.objects.LabelWrapper _lblptitle = null;
anywheresoftware.b4a.objects.LabelWrapper _lblnostock = null;
anywheresoftware.b4a.objects.LabelWrapper _lblreview = null;
anywheresoftware.b4a.objects.LabelWrapper _lblfav = null;
anywheresoftware.b4a.objects.LabelWrapper _lbls1 = null;
anywheresoftware.b4a.objects.LabelWrapper _lbls2 = null;
anywheresoftware.b4a.objects.LabelWrapper _lbls3 = null;
anywheresoftware.b4a.objects.LabelWrapper _lbls4 = null;
anywheresoftware.b4a.objects.LabelWrapper _lbls5 = null;
String _price = "";
String _special = "";
int _quantity = 0;
String _pathimage = "";
anywheresoftware.b4a.objects.collections.Map _review = null;
String _id = "";
String _rating = "";
 //BA.debugLineNum = 301;BA.debugLine="Sub Items_ContentFiller(ItemID As Long, LayoutName";
 //BA.debugLineNum = 303;BA.debugLine="pnlloading.SetVisibleAnimated(500,False)";
mostCurrent._pnlloading.SetVisibleAnimated((int) (500),anywheresoftware.b4a.keywords.Common.False);
 //BA.debugLineNum = 305;BA.debugLine="lbltitle.Text = lbltitle.Tag";
mostCurrent._lbltitle.setText(BA.ObjectToCharSequence(mostCurrent._lbltitle.getTag()));
 //BA.debugLineNum = 306;BA.debugLine="btnclose.Visible = True";
mostCurrent._btnclose.setVisible(anywheresoftware.b4a.keywords.Common.True);
 //BA.debugLineNum = 307;BA.debugLine="loading.Visible = False";
mostCurrent._loading.setVisible(anywheresoftware.b4a.keywords.Common.False);
 //BA.debugLineNum = 309;BA.debugLine="Dim pos As Int";
_pos = 0;
 //BA.debugLineNum = 311;BA.debugLine="If resultCategory.IsInitialized Then";
if (mostCurrent._resultcategory.IsInitialized()) { 
 //BA.debugLineNum = 312;BA.debugLine="pos = Abs(resultCategory.Size - Position)";
_pos = (int) (anywheresoftware.b4a.keywords.Common.Abs(mostCurrent._resultcategory.getSize()-_position));
 }else {
 //BA.debugLineNum = 314;BA.debugLine="pos = Position";
_pos = _position;
 };
 //BA.debugLineNum = 317;BA.debugLine="If pos > result.Size - 1 Then";
if (_pos>mostCurrent._result.getSize()-1) { 
 //BA.debugLineNum = 318;BA.debugLine="Return";
if (true) return "";
 };
 //BA.debugLineNum = 321;BA.debugLine="Try";
try { //BA.debugLineNum = 323;BA.debugLine="Dim temp As Map";
_temp = new anywheresoftware.b4a.objects.collections.Map();
 //BA.debugLineNum = 324;BA.debugLine="temp = result.Get(pos)";
_temp.setObject((anywheresoftware.b4a.objects.collections.Map.MyMap)(mostCurrent._result.Get(_pos)));
 //BA.debugLineNum = 326;BA.debugLine="Dim pnl As Panel : pnl = LayoutPanel.GetView(0)";
_pnl = new anywheresoftware.b4a.objects.PanelWrapper();
 //BA.debugLineNum = 326;BA.debugLine="Dim pnl As Panel : pnl = LayoutPanel.GetView(0)";
_pnl.setObject((android.view.ViewGroup)(_layoutpanel.GetView((int) (0)).getObject()));
 //BA.debugLineNum = 327;BA.debugLine="Dim imgicon2 As ImageView";
_imgicon2 = new anywheresoftware.b4a.objects.ImageViewWrapper();
 //BA.debugLineNum = 328;BA.debugLine="Dim lblpprice,lblptitle,lblnostock,lblreview,lbl";
_lblpprice = new anywheresoftware.b4a.objects.LabelWrapper();
_lblptitle = new anywheresoftware.b4a.objects.LabelWrapper();
_lblnostock = new anywheresoftware.b4a.objects.LabelWrapper();
_lblreview = new anywheresoftware.b4a.objects.LabelWrapper();
_lblfav = new anywheresoftware.b4a.objects.LabelWrapper();
 //BA.debugLineNum = 329;BA.debugLine="Dim lbls1,lbls2,lbls3,lbls4,lbls5 As Label";
_lbls1 = new anywheresoftware.b4a.objects.LabelWrapper();
_lbls2 = new anywheresoftware.b4a.objects.LabelWrapper();
_lbls3 = new anywheresoftware.b4a.objects.LabelWrapper();
_lbls4 = new anywheresoftware.b4a.objects.LabelWrapper();
_lbls5 = new anywheresoftware.b4a.objects.LabelWrapper();
 //BA.debugLineNum = 331;BA.debugLine="imgicon2 = pnl.GetView(0)";
_imgicon2.setObject((android.widget.ImageView)(_pnl.GetView((int) (0)).getObject()));
 //BA.debugLineNum = 332;BA.debugLine="lblptitle = pnl.GetView(1)";
_lblptitle.setObject((android.widget.TextView)(_pnl.GetView((int) (1)).getObject()));
 //BA.debugLineNum = 333;BA.debugLine="lblpprice = pnl.GetView(2)";
_lblpprice.setObject((android.widget.TextView)(_pnl.GetView((int) (2)).getObject()));
 //BA.debugLineNum = 335;BA.debugLine="lbls1 = pnl.GetView(4)";
_lbls1.setObject((android.widget.TextView)(_pnl.GetView((int) (4)).getObject()));
 //BA.debugLineNum = 336;BA.debugLine="lbls2 = pnl.GetView(5)";
_lbls2.setObject((android.widget.TextView)(_pnl.GetView((int) (5)).getObject()));
 //BA.debugLineNum = 337;BA.debugLine="lbls3 = pnl.GetView(6)";
_lbls3.setObject((android.widget.TextView)(_pnl.GetView((int) (6)).getObject()));
 //BA.debugLineNum = 338;BA.debugLine="lbls4 = pnl.GetView(7)";
_lbls4.setObject((android.widget.TextView)(_pnl.GetView((int) (7)).getObject()));
 //BA.debugLineNum = 339;BA.debugLine="lbls5 = pnl.GetView(8)";
_lbls5.setObject((android.widget.TextView)(_pnl.GetView((int) (8)).getObject()));
 //BA.debugLineNum = 341;BA.debugLine="lblnostock = pnl.GetView(9)";
_lblnostock.setObject((android.widget.TextView)(_pnl.GetView((int) (9)).getObject()));
 //BA.debugLineNum = 342;BA.debugLine="lblreview = pnl.GetView(10)";
_lblreview.setObject((android.widget.TextView)(_pnl.GetView((int) (10)).getObject()));
 //BA.debugLineNum = 343;BA.debugLine="lblfav = pnl.GetView(11)";
_lblfav.setObject((android.widget.TextView)(_pnl.GetView((int) (11)).getObject()));
 //BA.debugLineNum = 345;BA.debugLine="lbls1.TextColor = Library.Theme_Header";
_lbls1.setTextColor(mostCurrent._library._theme_header);
 //BA.debugLineNum = 346;BA.debugLine="lbls2.TextColor = Library.Theme_Header";
_lbls2.setTextColor(mostCurrent._library._theme_header);
 //BA.debugLineNum = 347;BA.debugLine="lbls3.TextColor = Library.Theme_Header";
_lbls3.setTextColor(mostCurrent._library._theme_header);
 //BA.debugLineNum = 348;BA.debugLine="lbls4.TextColor = Library.Theme_Header";
_lbls4.setTextColor(mostCurrent._library._theme_header);
 //BA.debugLineNum = 349;BA.debugLine="lbls5.TextColor = Library.Theme_Header";
_lbls5.setTextColor(mostCurrent._library._theme_header);
 //BA.debugLineNum = 351;BA.debugLine="lblptitle.Text = temp.Get(\"name\")";
_lblptitle.setText(BA.ObjectToCharSequence(_temp.Get((Object)("name"))));
 //BA.debugLineNum = 352;BA.debugLine="lblptitle.Text = lblptitle.Text.Replace(\"&quot;\"";
_lblptitle.setText(BA.ObjectToCharSequence(_lblptitle.getText().replace("&quot;",anywheresoftware.b4a.keywords.Common.QUOTE).replace("&amp;","&")));
 //BA.debugLineNum = 354;BA.debugLine="Dim price,special As String";
_price = "";
_special = "";
 //BA.debugLineNum = 355;BA.debugLine="Dim quantity As Int";
_quantity = 0;
 //BA.debugLineNum = 357;BA.debugLine="quantity = temp.Get(\"quantity\")";
_quantity = (int)(BA.ObjectToNumber(_temp.Get((Object)("quantity"))));
 //BA.debugLineNum = 359;BA.debugLine="If temp.ContainsKey(\"price_formated\") Then";
if (_temp.ContainsKey((Object)("price_formated"))) { 
 //BA.debugLineNum = 360;BA.debugLine="price   = temp.Get(\"price_formated\")";
_price = BA.ObjectToString(_temp.Get((Object)("price_formated")));
 }else {
 //BA.debugLineNum = 362;BA.debugLine="price   = temp.Get(\"price\")";
_price = BA.ObjectToString(_temp.Get((Object)("price")));
 };
 //BA.debugLineNum = 365;BA.debugLine="If temp.ContainsKey(\"special_formated\") Then";
if (_temp.ContainsKey((Object)("special_formated"))) { 
 //BA.debugLineNum = 366;BA.debugLine="special = temp.Get(\"special_formated\")";
_special = BA.ObjectToString(_temp.Get((Object)("special_formated")));
 }else if(_temp.ContainsKey((Object)("special"))) { 
 //BA.debugLineNum = 368;BA.debugLine="special = temp.Get(\"special\")";
_special = BA.ObjectToString(_temp.Get((Object)("special")));
 };
 //BA.debugLineNum = 371;BA.debugLine="If special = \"null\" Or special = \"false\" Then sp";
if ((_special).equals("null") || (_special).equals("false")) { 
_special = "";};
 //BA.debugLineNum = 373;BA.debugLine="If Library.IsPersian Then";
if (mostCurrent._library._ispersian(mostCurrent.activityBA)) { 
 //BA.debugLineNum = 374;BA.debugLine="lblptitle.Typeface = Typeface.LoadFromAssets(\"b";
_lblptitle.setTypeface(anywheresoftware.b4a.keywords.Common.Typeface.LoadFromAssets("byekan.ttf"));
 //BA.debugLineNum = 375;BA.debugLine="lblpprice.Typeface = Typeface.LoadFromAssets(\"b";
_lblpprice.setTypeface(anywheresoftware.b4a.keywords.Common.Typeface.LoadFromAssets("byekan.ttf"));
 }else {
 //BA.debugLineNum = 377;BA.debugLine="lblptitle.Typeface = Typeface.SANS_SERIF";
_lblptitle.setTypeface(anywheresoftware.b4a.keywords.Common.Typeface.SANS_SERIF);
 //BA.debugLineNum = 378;BA.debugLine="lblpprice.Typeface = Typeface.SANS_SERIF";
_lblpprice.setTypeface(anywheresoftware.b4a.keywords.Common.Typeface.SANS_SERIF);
 };
 //BA.debugLineNum = 381;BA.debugLine="If price.Length > 0 And special.Length = 0 Then";
if (_price.length()>0 && _special.length()==0) { 
 //BA.debugLineNum = 382;BA.debugLine="lblpprice.Text = price";
_lblpprice.setText(BA.ObjectToCharSequence(_price));
 }else if(_special.length()>0) { 
 //BA.debugLineNum = 384;BA.debugLine="lblpprice.Text = Library.DiscountStyleLabel(pri";
_lblpprice.setText(BA.ObjectToCharSequence(mostCurrent._library._discountstylelabel(mostCurrent.activityBA,_price,_special).getObject()));
 };
 //BA.debugLineNum = 387;BA.debugLine="If lblpprice.Text.ToLowerCase = \"false\" Then lbl";
if ((_lblpprice.getText().toLowerCase()).equals("false")) { 
_lblpprice.setText(BA.ObjectToCharSequence(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"login_account")));};
 //BA.debugLineNum = 389;BA.debugLine="If quantity = 0 Then";
if (_quantity==0) { 
 //BA.debugLineNum = 390;BA.debugLine="lblpprice.Text = temp.Get(\"stock_status\")";
_lblpprice.setText(BA.ObjectToCharSequence(_temp.Get((Object)("stock_status"))));
 };
 //BA.debugLineNum = 393;BA.debugLine="Dim PathImage As String";
_pathimage = "";
 //BA.debugLineNum = 395;BA.debugLine="If temp.ContainsKey(\"image\") Then";
if (_temp.ContainsKey((Object)("image"))) { 
 //BA.debugLineNum = 396;BA.debugLine="PathImage = temp.Get(\"image\")";
_pathimage = BA.ObjectToString(_temp.Get((Object)("image")));
 }else if(_temp.ContainsKey((Object)("thumb"))) { 
 //BA.debugLineNum = 398;BA.debugLine="PathImage = temp.Get(\"thumb\")";
_pathimage = BA.ObjectToString(_temp.Get((Object)("thumb")));
 };
 //BA.debugLineNum = 401;BA.debugLine="PathImage = PathImage.Replace(\" \",\"%20\")";
_pathimage = _pathimage.replace(" ","%20");
 //BA.debugLineNum = 403;BA.debugLine="If PathImage.ToLowerCase = \"null\" Or PathImage.L";
if ((_pathimage.toLowerCase()).equals("null") || _pathimage.length()==0) { 
 //BA.debugLineNum = 404;BA.debugLine="aria.Load(\"file:///android_asset/noimage1.png\")";
mostCurrent._aria.Load((Object)("file:///android_asset/noimage1.png")).AsBitmap().Error(mostCurrent._error_image.getBitmap()).Resize(_imgicon2.getWidth(),_imgicon2.getHeight()).CenterCrop().IntoImageView(_imgicon2);
 }else {
 //BA.debugLineNum = 411;BA.debugLine="aria.Load(PathImage).AsBitmap.Error(error_imag";
mostCurrent._aria.Load((Object)(_pathimage)).AsBitmap().Error(mostCurrent._error_image.getBitmap()).Resize(_imgicon2.getWidth(),_imgicon2.getHeight()).CenterCrop().IntoImageView(_imgicon2);
 };
 //BA.debugLineNum = 416;BA.debugLine="Dim review As Map";
_review = new anywheresoftware.b4a.objects.collections.Map();
 //BA.debugLineNum = 417;BA.debugLine="review.Initialize";
_review.Initialize();
 //BA.debugLineNum = 418;BA.debugLine="review = temp.Get(\"reviews\")";
_review.setObject((anywheresoftware.b4a.objects.collections.Map.MyMap)(_temp.Get((Object)("reviews"))));
 //BA.debugLineNum = 419;BA.debugLine="If review.IsInitialized Then";
if (_review.IsInitialized()) { 
 //BA.debugLineNum = 420;BA.debugLine="If review.ContainsKey(\"review_total\") Then";
if (_review.ContainsKey((Object)("review_total"))) { 
 //BA.debugLineNum = 421;BA.debugLine="lblreview.Text = $\"( ${review.Get(\"review_tota";
_lblreview.setText(BA.ObjectToCharSequence(("( "+anywheresoftware.b4a.keywords.Common.SmartStringFormatter("",_review.Get((Object)("review_total")))+" )")));
 };
 };
 //BA.debugLineNum = 425;BA.debugLine="Dim id As String";
_id = "";
 //BA.debugLineNum = 426;BA.debugLine="id = temp.Get(\"id\")";
_id = BA.ObjectToString(_temp.Get((Object)("id")));
 //BA.debugLineNum = 427;BA.debugLine="lblfav.Tag = id";
_lblfav.setTag((Object)(_id));
 //BA.debugLineNum = 429;BA.debugLine="If Library.Bookmarked.ContainsKey(id) = True The";
if (mostCurrent._library._bookmarked.ContainsKey((Object)(_id))==anywheresoftware.b4a.keywords.Common.True) { 
 //BA.debugLineNum = 430;BA.debugLine="lblfav.Text = \"\"";
_lblfav.setText(BA.ObjectToCharSequence(""));
 //BA.debugLineNum = 431;BA.debugLine="lblfav.TextColor = Library.Theme_Header";
_lblfav.setTextColor(mostCurrent._library._theme_header);
 }else {
 //BA.debugLineNum = 433;BA.debugLine="lblfav.Text = \"\"";
_lblfav.setText(BA.ObjectToCharSequence(""));
 //BA.debugLineNum = 434;BA.debugLine="lblfav.TextColor = Colors.Gray";
_lblfav.setTextColor(anywheresoftware.b4a.keywords.Common.Colors.Gray);
 };
 //BA.debugLineNum = 445;BA.debugLine="Dim rating As String";
_rating = "";
 //BA.debugLineNum = 446;BA.debugLine="rating = temp.Get(\"rating\")";
_rating = BA.ObjectToString(_temp.Get((Object)("rating")));
 //BA.debugLineNum = 448;BA.debugLine="If rating = \"0\" Then";
if ((_rating).equals("0")) { 
 //BA.debugLineNum = 449;BA.debugLine="lbls1.Text = \"\"";
_lbls1.setText(BA.ObjectToCharSequence(""));
 //BA.debugLineNum = 450;BA.debugLine="lbls2.Text = \"\"";
_lbls2.setText(BA.ObjectToCharSequence(""));
 //BA.debugLineNum = 451;BA.debugLine="lbls3.Text = \"\"";
_lbls3.setText(BA.ObjectToCharSequence(""));
 //BA.debugLineNum = 452;BA.debugLine="lbls4.Text = \"\"";
_lbls4.setText(BA.ObjectToCharSequence(""));
 //BA.debugLineNum = 453;BA.debugLine="lbls5.Text = \"\"";
_lbls5.setText(BA.ObjectToCharSequence(""));
 }else if((_rating).equals("1")) { 
 //BA.debugLineNum = 456;BA.debugLine="lbls1.Text = \"\"";
_lbls1.setText(BA.ObjectToCharSequence(""));
 //BA.debugLineNum = 457;BA.debugLine="lbls2.Text = \"\"";
_lbls2.setText(BA.ObjectToCharSequence(""));
 //BA.debugLineNum = 458;BA.debugLine="lbls3.Text = \"\"";
_lbls3.setText(BA.ObjectToCharSequence(""));
 //BA.debugLineNum = 459;BA.debugLine="lbls4.Text = \"\"";
_lbls4.setText(BA.ObjectToCharSequence(""));
 //BA.debugLineNum = 460;BA.debugLine="lbls5.Text = \"\"";
_lbls5.setText(BA.ObjectToCharSequence(""));
 }else if((_rating).equals("2")) { 
 //BA.debugLineNum = 463;BA.debugLine="lbls1.Text = \"\"";
_lbls1.setText(BA.ObjectToCharSequence(""));
 //BA.debugLineNum = 464;BA.debugLine="lbls2.Text = \"\"";
_lbls2.setText(BA.ObjectToCharSequence(""));
 //BA.debugLineNum = 465;BA.debugLine="lbls3.Text = \"\"";
_lbls3.setText(BA.ObjectToCharSequence(""));
 //BA.debugLineNum = 466;BA.debugLine="lbls4.Text = \"\"";
_lbls4.setText(BA.ObjectToCharSequence(""));
 //BA.debugLineNum = 467;BA.debugLine="lbls5.Text = \"\"";
_lbls5.setText(BA.ObjectToCharSequence(""));
 }else if((_rating).equals("3")) { 
 //BA.debugLineNum = 470;BA.debugLine="lbls1.Text = \"\"";
_lbls1.setText(BA.ObjectToCharSequence(""));
 //BA.debugLineNum = 471;BA.debugLine="lbls2.Text = \"\"";
_lbls2.setText(BA.ObjectToCharSequence(""));
 //BA.debugLineNum = 472;BA.debugLine="lbls3.Text = \"\"";
_lbls3.setText(BA.ObjectToCharSequence(""));
 //BA.debugLineNum = 473;BA.debugLine="lbls4.Text = \"\"";
_lbls4.setText(BA.ObjectToCharSequence(""));
 //BA.debugLineNum = 474;BA.debugLine="lbls5.Text = \"\"";
_lbls5.setText(BA.ObjectToCharSequence(""));
 }else if((_rating).equals("4")) { 
 //BA.debugLineNum = 477;BA.debugLine="lbls1.Text = \"\"";
_lbls1.setText(BA.ObjectToCharSequence(""));
 //BA.debugLineNum = 478;BA.debugLine="lbls2.Text = \"\"";
_lbls2.setText(BA.ObjectToCharSequence(""));
 //BA.debugLineNum = 479;BA.debugLine="lbls3.Text = \"\"";
_lbls3.setText(BA.ObjectToCharSequence(""));
 //BA.debugLineNum = 480;BA.debugLine="lbls4.Text = \"\"";
_lbls4.setText(BA.ObjectToCharSequence(""));
 //BA.debugLineNum = 481;BA.debugLine="lbls5.Text = \"\"";
_lbls5.setText(BA.ObjectToCharSequence(""));
 }else if((_rating).equals("5") || (double)(Double.parseDouble(_rating))>5) { 
 //BA.debugLineNum = 484;BA.debugLine="lbls1.Text = \"\"";
_lbls1.setText(BA.ObjectToCharSequence(""));
 //BA.debugLineNum = 485;BA.debugLine="lbls2.Text = \"\"";
_lbls2.setText(BA.ObjectToCharSequence(""));
 //BA.debugLineNum = 486;BA.debugLine="lbls3.Text = \"\"";
_lbls3.setText(BA.ObjectToCharSequence(""));
 //BA.debugLineNum = 487;BA.debugLine="lbls4.Text = \"\"";
_lbls4.setText(BA.ObjectToCharSequence(""));
 //BA.debugLineNum = 488;BA.debugLine="lbls5.Text = \"\"";
_lbls5.setText(BA.ObjectToCharSequence(""));
 };
 } 
       catch (Exception e140) {
			processBA.setLastException(e140); };
 //BA.debugLineNum = 497;BA.debugLine="End Sub";
return "";
}
public static String  _items_layoutcreator(String _layoutname,anywheresoftware.b4a.objects.PanelWrapper _layoutpanel) throws Exception{
 //BA.debugLineNum = 289;BA.debugLine="Sub Items_LayoutCreator(LayoutName As String, Layo";
 //BA.debugLineNum = 291;BA.debugLine="If Library.IsPersian Then";
if (mostCurrent._library._ispersian(mostCurrent.activityBA)) { 
 //BA.debugLineNum = 292;BA.debugLine="LayoutPanel.LoadLayout(\"frmtemplate_product_fa\")";
_layoutpanel.LoadLayout("frmtemplate_product_fa",mostCurrent.activityBA);
 }else {
 //BA.debugLineNum = 294;BA.debugLine="LayoutPanel.LoadLayout(\"frmtemplate_product_en\")";
_layoutpanel.LoadLayout("frmtemplate_product_en",mostCurrent.activityBA);
 };
 //BA.debugLineNum = 297;BA.debugLine="LayoutPanel.Tag = \"product\"";
_layoutpanel.setTag((Object)("product"));
 //BA.debugLineNum = 299;BA.debugLine="End Sub";
return "";
}
public static String  _lblfav_click() throws Exception{
anywheresoftware.b4a.objects.LabelWrapper _lb = null;
 //BA.debugLineNum = 603;BA.debugLine="Sub lblfav_Click";
 //BA.debugLineNum = 605;BA.debugLine="Dim lb As Label";
_lb = new anywheresoftware.b4a.objects.LabelWrapper();
 //BA.debugLineNum = 606;BA.debugLine="lb = Sender";
_lb.setObject((android.widget.TextView)(anywheresoftware.b4a.keywords.Common.Sender(mostCurrent.activityBA)));
 //BA.debugLineNum = 608;BA.debugLine="Dim op As OpenCart";
mostCurrent._op = new com.apps.demo.opencart();
 //BA.debugLineNum = 609;BA.debugLine="op.Initialize";
mostCurrent._op._initialize(processBA);
 //BA.debugLineNum = 611;BA.debugLine="If Library.Bookmarked.ContainsKey(lb.Tag) = False";
if (mostCurrent._library._bookmarked.ContainsKey(_lb.getTag())==anywheresoftware.b4a.keywords.Common.False) { 
 //BA.debugLineNum = 612;BA.debugLine="Library.Bookmarked.Put(lb.Tag,True)";
mostCurrent._library._bookmarked.Put(_lb.getTag(),(Object)(anywheresoftware.b4a.keywords.Common.True));
 //BA.debugLineNum = 613;BA.debugLine="lb.Text = \"\"";
_lb.setText(BA.ObjectToCharSequence(""));
 //BA.debugLineNum = 614;BA.debugLine="lb.TextColor = Library.Theme_Header";
_lb.setTextColor(mostCurrent._library._theme_header);
 //BA.debugLineNum = 615;BA.debugLine="op.Wishlist(Me,\"Bookmark_receive\",lb.Tag)";
mostCurrent._op._wishlist(actcategory.getObject(),"Bookmark_receive",BA.ObjectToString(_lb.getTag()));
 //BA.debugLineNum = 616;BA.debugLine="lb.Visible = False";
_lb.setVisible(anywheresoftware.b4a.keywords.Common.False);
 //BA.debugLineNum = 617;BA.debugLine="lb.SetVisibleAnimated(1100,True)";
_lb.SetVisibleAnimated((int) (1100),anywheresoftware.b4a.keywords.Common.True);
 //BA.debugLineNum = 618;BA.debugLine="ulv.RefreshContent";
mostCurrent._ulv.RefreshContent();
 }else {
 //BA.debugLineNum = 620;BA.debugLine="lb.Text = \"\"";
_lb.setText(BA.ObjectToCharSequence(""));
 //BA.debugLineNum = 621;BA.debugLine="lb.TextColor = Colors.Gray";
_lb.setTextColor(anywheresoftware.b4a.keywords.Common.Colors.Gray);
 //BA.debugLineNum = 622;BA.debugLine="Library.Bookmarked.Remove(lb.Tag)";
mostCurrent._library._bookmarked.Remove(_lb.getTag());
 //BA.debugLineNum = 623;BA.debugLine="op.Wishlist(Me,\"Bookmark_receive\",\"-\" & lb.Tag)";
mostCurrent._op._wishlist(actcategory.getObject(),"Bookmark_receive","-"+BA.ObjectToString(_lb.getTag()));
 //BA.debugLineNum = 624;BA.debugLine="ulv.RefreshContent";
mostCurrent._ulv.RefreshContent();
 };
 //BA.debugLineNum = 627;BA.debugLine="End Sub";
return "";
}
public static String  _process_globals() throws Exception{
 //BA.debugLineNum = 6;BA.debugLine="Sub Process_Globals";
 //BA.debugLineNum = 8;BA.debugLine="End Sub";
return "";
}
public static String  _productslist_receive(anywheresoftware.b4a.objects.collections.List _res,String _scategory) throws Exception{
 //BA.debugLineNum = 251;BA.debugLine="Sub ProductsList_Receive(res As List,sCategory As";
 //BA.debugLineNum = 253;BA.debugLine="result = res";
mostCurrent._result = _res;
 //BA.debugLineNum = 255;BA.debugLine="ProgressDialogHide";
anywheresoftware.b4a.keywords.Common.ProgressDialogHide();
 //BA.debugLineNum = 258;BA.debugLine="Library.CacheSystem.AddList2Cache(currentCategory";
mostCurrent._library._cachesystem._addlist2cache(mostCurrent._currentcategoryid,_res,"product_of_category");
 //BA.debugLineNum = 260;BA.debugLine="ShowCrumb";
_showcrumb();
 //BA.debugLineNum = 263;BA.debugLine="If True Then";
if (anywheresoftware.b4a.keywords.Common.True) { 
 //BA.debugLineNum = 264;BA.debugLine="pnlloading.SetVisibleAnimated(500,False)";
mostCurrent._pnlloading.SetVisibleAnimated((int) (500),anywheresoftware.b4a.keywords.Common.False);
 //BA.debugLineNum = 265;BA.debugLine="lbltitle.Text = lbltitle.Tag";
mostCurrent._lbltitle.setText(BA.ObjectToCharSequence(mostCurrent._lbltitle.getTag()));
 //BA.debugLineNum = 266;BA.debugLine="loading.Visible = False";
mostCurrent._loading.setVisible(anywheresoftware.b4a.keywords.Common.False);
 //BA.debugLineNum = 267;BA.debugLine="btnclose.Visible = True";
mostCurrent._btnclose.setVisible(anywheresoftware.b4a.keywords.Common.True);
 };
 //BA.debugLineNum = 271;BA.debugLine="If res.Size = 0 Then";
if (_res.getSize()==0) { 
 //BA.debugLineNum = 272;BA.debugLine="pnlloading.SetVisibleAnimated(500,False)";
mostCurrent._pnlloading.SetVisibleAnimated((int) (500),anywheresoftware.b4a.keywords.Common.False);
 //BA.debugLineNum = 273;BA.debugLine="lbltitle.Text = lbltitle.Tag";
mostCurrent._lbltitle.setText(BA.ObjectToCharSequence(mostCurrent._lbltitle.getTag()));
 //BA.debugLineNum = 274;BA.debugLine="btnclose.Visible = True";
mostCurrent._btnclose.setVisible(anywheresoftware.b4a.keywords.Common.True);
 //BA.debugLineNum = 275;BA.debugLine="loading.Visible = False";
mostCurrent._loading.setVisible(anywheresoftware.b4a.keywords.Common.False);
 //BA.debugLineNum = 276;BA.debugLine="Return";
if (true) return "";
 };
 //BA.debugLineNum = 279;BA.debugLine="ulv.BulkAddItems(res.Size,\"products\", 1)";
mostCurrent._ulv.BulkAddItems(_res.getSize(),"products",(int) (1));
 //BA.debugLineNum = 281;BA.debugLine="If historyCategory.Size > 1 Then";
if (mostCurrent._historycategory.getSize()>1) { 
 //BA.debugLineNum = 282;BA.debugLine="btnreturn.SetVisibleAnimated(800,True)";
mostCurrent._btnreturn.SetVisibleAnimated((int) (800),anywheresoftware.b4a.keywords.Common.True);
 }else {
 //BA.debugLineNum = 284;BA.debugLine="btnreturn.SetVisibleAnimated(800,False)";
mostCurrent._btnreturn.SetVisibleAnimated((int) (800),anywheresoftware.b4a.keywords.Common.False);
 };
 //BA.debugLineNum = 287;BA.debugLine="End Sub";
return "";
}
public static String  _showcrumb() throws Exception{
String _title = "";
String _count = "";
int _i = 0;
 //BA.debugLineNum = 151;BA.debugLine="Sub ShowCrumb";
 //BA.debugLineNum = 153;BA.debugLine="Dim title,count As String";
_title = "";
_count = "";
 //BA.debugLineNum = 155;BA.debugLine="If result.IsInitialized Then";
if (mostCurrent._result.IsInitialized()) { 
 //BA.debugLineNum = 156;BA.debugLine="count = \" [ \" & result.Size & \" ]\"";
_count = " [ "+BA.NumberToString(mostCurrent._result.getSize())+" ]";
 };
 //BA.debugLineNum = 159;BA.debugLine="If historyCategoryTitle.Size > 1 Then";
if (mostCurrent._historycategorytitle.getSize()>1) { 
 //BA.debugLineNum = 160;BA.debugLine="For i = 0 To  historyCategoryTitle.Size - 1";
{
final int step6 = 1;
final int limit6 = (int) (mostCurrent._historycategorytitle.getSize()-1);
for (_i = (int) (0) ; (step6 > 0 && _i <= limit6) || (step6 < 0 && _i >= limit6); _i = ((int)(0 + _i + step6)) ) {
 //BA.debugLineNum = 161;BA.debugLine="title = title & \" » \" & historyCategoryTitle.Ge";
_title = _title+" » "+BA.ObjectToString(mostCurrent._historycategorytitle.Get(_i));
 }
};
 //BA.debugLineNum = 163;BA.debugLine="title = title & \" \" & count";
_title = _title+" "+_count;
 }else {
 //BA.debugLineNum = 165;BA.debugLine="title = Library.GetStringResourse(\"home\")";
_title = mostCurrent._library._getstringresourse(mostCurrent.activityBA,"home");
 };
 //BA.debugLineNum = 168;BA.debugLine="lblcrumb.Text = title";
mostCurrent._lblcrumb.setText(BA.ObjectToCharSequence(_title));
 //BA.debugLineNum = 170;BA.debugLine="End Sub";
return "";
}
public static String  _target_onbitmapready(anywheresoftware.b4a.objects.drawable.CanvasWrapper.BitmapWrapper _bitmap,Object _tag) throws Exception{
de.donmanfred.RoundImageWrapper _r = null;
anywheresoftware.b4a.objects.ImageViewWrapper _im = null;
 //BA.debugLineNum = 499;BA.debugLine="Sub Target_OnBitmapReady(bitmap As Bitmap,Tag As O";
 //BA.debugLineNum = 501;BA.debugLine="Dim r As RoundImage";
_r = new de.donmanfred.RoundImageWrapper();
 //BA.debugLineNum = 503;BA.debugLine="Dim im As ImageView";
_im = new anywheresoftware.b4a.objects.ImageViewWrapper();
 //BA.debugLineNum = 504;BA.debugLine="im = Tag";
_im.setObject((android.widget.ImageView)(_tag));
 //BA.debugLineNum = 505;BA.debugLine="im.Bitmap = r.CreateBitmap(bitmap)";
_im.setBitmap(_r.CreateBitmap(processBA,(android.graphics.Bitmap)(_bitmap.getObject())));
 //BA.debugLineNum = 507;BA.debugLine="End Sub";
return "";
}
public static String  _ulv_itemclick(long _itemid,int _position,anywheresoftware.b4a.objects.PanelWrapper _clickedpanel) throws Exception{
int _pos = 0;
anywheresoftware.b4a.objects.collections.Map _data = null;
anywheresoftware.b4a.objects.collections.List _cache = null;
 //BA.debugLineNum = 509;BA.debugLine="Sub ULV_ItemClick(ItemID As Long, Position As Int,";
 //BA.debugLineNum = 511;BA.debugLine="If ClickedPanel.Tag = \"product\" Then";
if ((_clickedpanel.getTag()).equals((Object)("product"))) { 
 //BA.debugLineNum = 513;BA.debugLine="Dim pos As Int";
_pos = 0;
 //BA.debugLineNum = 515;BA.debugLine="If resultCategory.IsInitialized Then";
if (mostCurrent._resultcategory.IsInitialized()) { 
 //BA.debugLineNum = 516;BA.debugLine="pos = Abs(resultCategory.Size - Position)";
_pos = (int) (anywheresoftware.b4a.keywords.Common.Abs(mostCurrent._resultcategory.getSize()-_position));
 }else {
 //BA.debugLineNum = 518;BA.debugLine="pos = Position";
_pos = _position;
 };
 //BA.debugLineNum = 521;BA.debugLine="Dim data As Map";
_data = new anywheresoftware.b4a.objects.collections.Map();
 //BA.debugLineNum = 523;BA.debugLine="data = result.Get(pos)";
_data.setObject((anywheresoftware.b4a.objects.collections.Map.MyMap)(mostCurrent._result.Get(_pos)));
 //BA.debugLineNum = 525;BA.debugLine="actProduct.product = data";
mostCurrent._actproduct._product = _data;
 //BA.debugLineNum = 526;BA.debugLine="StartActivity(actProduct)";
anywheresoftware.b4a.keywords.Common.StartActivity(mostCurrent.activityBA,(Object)(mostCurrent._actproduct.getObject()));
 //BA.debugLineNum = 528;BA.debugLine="Return";
if (true) return "";
 };
 //BA.debugLineNum = 532;BA.debugLine="Dim data As Map";
_data = new anywheresoftware.b4a.objects.collections.Map();
 //BA.debugLineNum = 533;BA.debugLine="data = resultCategory.Get(Position)";
_data.setObject((anywheresoftware.b4a.objects.collections.Map.MyMap)(mostCurrent._resultcategory.Get(_position)));
 //BA.debugLineNum = 535;BA.debugLine="btnreturn.Visible = True";
mostCurrent._btnreturn.setVisible(anywheresoftware.b4a.keywords.Common.True);
 //BA.debugLineNum = 536;BA.debugLine="historyCategory.Add(data.Get(\"category_id\"))";
mostCurrent._historycategory.Add(_data.Get((Object)("category_id")));
 //BA.debugLineNum = 537;BA.debugLine="historyCategoryTitle.Add(data.Get(\"name\"))";
mostCurrent._historycategorytitle.Add(_data.Get((Object)("name")));
 //BA.debugLineNum = 539;BA.debugLine="pnlloading.Visible = True";
mostCurrent._pnlloading.setVisible(anywheresoftware.b4a.keywords.Common.True);
 //BA.debugLineNum = 540;BA.debugLine="lbltitle.Text = Library.GetStringResourse(\"loadin";
mostCurrent._lbltitle.setText(BA.ObjectToCharSequence(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"loading")));
 //BA.debugLineNum = 541;BA.debugLine="loading.Visible = True";
mostCurrent._loading.setVisible(anywheresoftware.b4a.keywords.Common.True);
 //BA.debugLineNum = 542;BA.debugLine="btnclose.Visible = False";
mostCurrent._btnclose.setVisible(anywheresoftware.b4a.keywords.Common.False);
 //BA.debugLineNum = 544;BA.debugLine="currentCategoryID = data.Get(\"category_id\")";
mostCurrent._currentcategoryid = BA.ObjectToString(_data.Get((Object)("category_id")));
 //BA.debugLineNum = 546;BA.debugLine="Dim cache As List";
_cache = new anywheresoftware.b4a.objects.collections.List();
 //BA.debugLineNum = 547;BA.debugLine="cache = Library.CacheSystem.GetCacheAsList(curren";
_cache = mostCurrent._library._cachesystem._getcacheaslist(mostCurrent._currentcategoryid,"category");
 //BA.debugLineNum = 549;BA.debugLine="If cache.IsInitialized Then";
if (_cache.IsInitialized()) { 
 //BA.debugLineNum = 550;BA.debugLine="CategoryList_Receive(cache,\"\")";
_categorylist_receive(_cache,"");
 }else {
 //BA.debugLineNum = 552;BA.debugLine="op.GetCategory(Me,\"CategoryList_Receive\",current";
mostCurrent._op._getcategory(actcategory.getObject(),"CategoryList_Receive",mostCurrent._currentcategoryid);
 };
 //BA.debugLineNum = 555;BA.debugLine="ulv.JumpTo(0,True)";
mostCurrent._ulv.JumpTo((int) (0),anywheresoftware.b4a.keywords.Common.True);
 //BA.debugLineNum = 557;BA.debugLine="End Sub";
return "";
}
public static String  _ulv_scrolled(int _firstvisibleitem,int _visibleitemcount,int _totalitemcount,boolean _isattop,boolean _isatbottom) throws Exception{
 //BA.debugLineNum = 587;BA.debugLine="Sub ULV_Scrolled(FirstVisibleItem As Int, VisibleI";
 //BA.debugLineNum = 589;BA.debugLine="If IsAtTop = False Then";
if (_isattop==anywheresoftware.b4a.keywords.Common.False) { 
 //BA.debugLineNum = 590;BA.debugLine="ScollButton.SetLayoutAnimated(760,ScollButton.Le";
mostCurrent._scollbutton.SetLayoutAnimated((int) (760),mostCurrent._scollbutton.getLeft(),(int) (mostCurrent._activity.getHeight()-anywheresoftware.b4a.keywords.Common.DipToCurrent((int) (10))-mostCurrent._scollbutton.getHeight()),mostCurrent._scollbutton.getWidth(),mostCurrent._scollbutton.getHeight());
 }else {
 //BA.debugLineNum = 592;BA.debugLine="ScollButton.SetLayoutAnimated(760,ScollButton.Le";
mostCurrent._scollbutton.SetLayoutAnimated((int) (760),mostCurrent._scollbutton.getLeft(),(int) (mostCurrent._activity.getHeight()+mostCurrent._scollbutton.getHeight()),mostCurrent._scollbutton.getWidth(),mostCurrent._scollbutton.getHeight());
 };
 //BA.debugLineNum = 595;BA.debugLine="End Sub";
return "";
}
}
