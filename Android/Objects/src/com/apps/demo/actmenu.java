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

public class actmenu extends Activity implements B4AActivity{
	public static actmenu mostCurrent;
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
			processBA = new BA(this.getApplicationContext(), null, null, "com.apps.demo", "com.apps.demo.actmenu");
			processBA.loadHtSubs(this.getClass());
	        float deviceScale = getApplicationContext().getResources().getDisplayMetrics().density;
	        BALayout.setDeviceScale(deviceScale);
            
		}
		else if (previousOne != null) {
			Activity p = previousOne.get();
			if (p != null && p != this) {
                BA.LogInfo("Killing previous instance (actmenu).");
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
		activityBA = new BA(this, layout, processBA, "com.apps.demo", "com.apps.demo.actmenu");
        
        processBA.sharedProcessBA.activityBA = new java.lang.ref.WeakReference<BA>(activityBA);
        anywheresoftware.b4a.objects.ViewWrapper.lastId = 0;
        _activity = new ActivityWrapper(activityBA, "activity");
        anywheresoftware.b4a.Msgbox.isDismissing = false;
        if (BA.isShellModeRuntimeCheck(processBA)) {
			if (isFirst)
				processBA.raiseEvent2(null, true, "SHELL", false);
			processBA.raiseEvent2(null, true, "CREATE", true, "com.apps.demo.actmenu", processBA, activityBA, _activity, anywheresoftware.b4a.keywords.Common.Density, mostCurrent);
			_activity.reinitializeForShell(activityBA, "activity");
		}
        initializeProcessGlobals();		
        initializeGlobals();
        
        BA.LogInfo("** Activity (actmenu) Create, isFirst = " + isFirst + " **");
        processBA.raiseEvent2(null, true, "activity_create", false, isFirst);
		isFirst = false;
		if (this != mostCurrent)
			return;
        processBA.setActivityPaused(false);
        BA.LogInfo("** Activity (actmenu) Resume **");
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
		return actmenu.class;
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
        BA.LogInfo("** Activity (actmenu) Pause, UserClosed = " + activityBA.activity.isFinishing() + " **");
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
            BA.LogInfo("** Activity (actmenu) Resume **");
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
public static anywheresoftware.b4a.objects.Timer _timerslideshow = null;
public static anywheresoftware.b4a.objects.Timer _tmrshowdialogfirst = null;
public static int _topsv = 0;
public anywheresoftware.b4a.objects.PanelWrapper _pnlmenuinapp = null;
public ariagp.amin.shahedi.AriaGlideWrapper _glide = null;
public anywheresoftware.b4a.objects.ButtonWrapper _scollbutton = null;
public static boolean _isoffline = false;
public anywheresoftware.b4a.objects.HorizontalScrollViewWrapper _svhnewproduct = null;
public anywheresoftware.b4a.objects.HorizontalScrollViewWrapper _svhfeatureproduct = null;
public anywheresoftware.b4a.objects.HorizontalScrollViewWrapper _svhbestproduct = null;
public anywheresoftware.b4a.objects.HorizontalScrollViewWrapper _svhspecialproduct = null;
public anywheresoftware.b4a.objects.ScrollViewWrapper _sv1 = null;
public anywheresoftware.b4a.objects.LabelWrapper _lbltitle = null;
public anywheresoftware.b4a.objects.ButtonWrapper _btnbasket = null;
public anywheresoftware.b4a.objects.LabelWrapper _lblheadername = null;
public anywheresoftware.b4a.objects.LabelWrapper _lblnext = null;
public com.apps.demo.opencart _featureproduct = null;
public com.apps.demo.opencart _newproduct = null;
public com.apps.demo.opencart _bestproduct = null;
public com.apps.demo.opencart _slideshow = null;
public com.apps.demo.opencart _opmanufacturers = null;
public com.apps.demo.opencart _opspecialproduct = null;
public anywheresoftware.b4a.objects.PanelWrapper _pnlheader = null;
public static int _offsetslideshow = 0;
public anywheresoftware.b4a.objects.LabelWrapper _lblslidetitle = null;
public anywheresoftware.b4a.objects.PanelWrapper _pnlheadert = null;
public anywheresoftware.b4a.objects.PanelWrapper _pnlheaderproduct = null;
public anywheresoftware.b4a.objects.PanelWrapper _pnlloading = null;
public com.apps.demo.slidemenu _slidemenu = null;
public anywheresoftware.b4a.objects.LabelWrapper _lblpb = null;
public anywheresoftware.b4a.objects.PanelWrapper _pnlads = null;
public anywheresoftware.b4a.objects.ProgressBarWrapper _pbslideshow = null;
public anywheresoftware.b4a.objects.PanelWrapper _pnloverheader = null;
public anywheresoftware.b4a.objects.LabelWrapper _lblbasket = null;
public de.amberhome.viewpager.PageContainerAdapter _slidepanel1 = null;
public de.amberhome.viewpager.ViewPagerWrapper _slidepanelpage = null;
public anywheresoftware.b4a.objects.PanelWrapper _pnlcircle = null;
public anywheresoftware.b4a.objects.collections.List _bullet = null;
public anywheresoftware.b4a.objects.HorizontalScrollViewWrapper _svh = null;
public com.apps.demo.mytoastmessageshow _mytoastmessageshow = null;
public anywheresoftware.b4a.objects.ButtonWrapper _btnsearch = null;
public anywheresoftware.b4a.objects.ButtonWrapper _btnmenu = null;
public static String _tiptag = "";
public static String _titlehelp = "";
public anywheresoftware.b4a.objects.ButtonWrapper _btncat = null;
public anywheresoftware.b4a.objects.collections.Map _bannerscrollview = null;
public anywheresoftware.b4a.objects.ImageViewWrapper _imgbannerid = null;
public static int _offsetbannerloaded = 0;
public anywheresoftware.b4a.objects.collections.List _listbannerloaded = null;
public anywheresoftware.b4a.objects.ProgressBarWrapper _pbloading = null;
public anywheresoftware.b4a.objects.collections.Map _imageviewlist = null;
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
anywheresoftware.b4a.objects.PanelWrapper _slide = null;
anywheresoftware.b4a.objects.drawable.ColorDrawable _cd = null;
anywheresoftware.b4a.objects.collections.List _ls = null;
 //BA.debugLineNum = 72;BA.debugLine="Sub Activity_Create(FirstTime As Boolean)";
 //BA.debugLineNum = 74;BA.debugLine="If Library.IsPersian Then";
if (mostCurrent._library._ispersian(mostCurrent.activityBA)) { 
 //BA.debugLineNum = 75;BA.debugLine="Activity.LoadLayout(\"frmmenu\")";
mostCurrent._activity.LoadLayout("frmmenu",mostCurrent.activityBA);
 }else {
 //BA.debugLineNum = 77;BA.debugLine="Activity.LoadLayout(\"frmmenu_en\")";
mostCurrent._activity.LoadLayout("frmmenu_en",mostCurrent.activityBA);
 };
 //BA.debugLineNum = 80;BA.debugLine="If Library.manager.GetBoolean(\"fistshowdialog1\")";
if (mostCurrent._library._manager.GetBoolean("fistshowdialog1")==anywheresoftware.b4a.keywords.Common.False) { 
 //BA.debugLineNum = 81;BA.debugLine="tmrShowDialogFirst.Initialize(\"tmrshowdialog\",60";
_tmrshowdialogfirst.Initialize(processBA,"tmrshowdialog",(long) (6000));
 //BA.debugLineNum = 82;BA.debugLine="tmrShowDialogFirst.Enabled = True";
_tmrshowdialogfirst.setEnabled(anywheresoftware.b4a.keywords.Common.True);
 };
 //BA.debugLineNum = 85;BA.debugLine="SlideMenu.Initialize(pnlmenuinapp,Me)";
mostCurrent._slidemenu._initialize(mostCurrent.activityBA,mostCurrent._pnlmenuinapp,actmenu.getObject());
 //BA.debugLineNum = 87;BA.debugLine="Library.HideScrollbar(sv1)";
mostCurrent._library._hidescrollbar(mostCurrent.activityBA,mostCurrent._sv1);
 //BA.debugLineNum = 89;BA.debugLine="ScollButton = Library.MakeUpScrollButton(Activity";
mostCurrent._scollbutton = mostCurrent._library._makeupscrollbutton(mostCurrent.activityBA,(anywheresoftware.b4a.objects.PanelWrapper) anywheresoftware.b4a.AbsObjectWrapper.ConvertToWrapper(new anywheresoftware.b4a.objects.PanelWrapper(), (android.view.ViewGroup)(mostCurrent._activity.getObject())));
 //BA.debugLineNum = 91;BA.debugLine="MyToastMessageShow.Initialize(Activity)";
mostCurrent._mytoastmessageshow._initialize(mostCurrent.activityBA,(anywheresoftware.b4a.objects.PanelWrapper) anywheresoftware.b4a.AbsObjectWrapper.ConvertToWrapper(new anywheresoftware.b4a.objects.PanelWrapper(), (android.view.ViewGroup)(mostCurrent._activity.getObject())));
 //BA.debugLineNum = 92;BA.debugLine="opManufacturers.Initialize";
mostCurrent._opmanufacturers._initialize(processBA);
 //BA.debugLineNum = 93;BA.debugLine="ImageViewList.Initialize";
mostCurrent._imageviewlist.Initialize();
 //BA.debugLineNum = 94;BA.debugLine="opSpecialProduct.Initialize";
mostCurrent._opspecialproduct._initialize(processBA);
 //BA.debugLineNum = 96;BA.debugLine="pnlheader.Color = Library.Theme_Header";
mostCurrent._pnlheader.setColor(mostCurrent._library._theme_header);
 //BA.debugLineNum = 97;BA.debugLine="Activity.Color  = Library.Theme_Background";
mostCurrent._activity.setColor(mostCurrent._library._theme_background);
 //BA.debugLineNum = 98;BA.debugLine="sv1.Panel.Color = Library.Theme_Background";
mostCurrent._sv1.getPanel().setColor(mostCurrent._library._theme_background);
 //BA.debugLineNum = 100;BA.debugLine="Library.setLocalApp(Library.currLang)";
mostCurrent._library._setlocalapp(mostCurrent.activityBA,mostCurrent._library._currlang);
 //BA.debugLineNum = 102;BA.debugLine="Library.ChangeStatusColor";
mostCurrent._library._changestatuscolor(mostCurrent.activityBA);
 //BA.debugLineNum = 104;BA.debugLine="topSV = 0";
_topsv = (int) (0);
 //BA.debugLineNum = 107;BA.debugLine="Dim slide As Panel";
_slide = new anywheresoftware.b4a.objects.PanelWrapper();
 //BA.debugLineNum = 108;BA.debugLine="slide.Initialize(\"\")";
_slide.Initialize(mostCurrent.activityBA,"");
 //BA.debugLineNum = 109;BA.debugLine="sv1.Panel.AddView(slide,0,0,sv1.Width,0)";
mostCurrent._sv1.getPanel().AddView((android.view.View)(_slide.getObject()),(int) (0),(int) (0),mostCurrent._sv1.getWidth(),(int) (0));
 //BA.debugLineNum = 110;BA.debugLine="slide.LoadLayout(\"frmslideshow_panels\")";
_slide.LoadLayout("frmslideshow_panels",mostCurrent.activityBA);
 //BA.debugLineNum = 111;BA.debugLine="slide.Height = pnlads.Height + pnlcircle.Height";
_slide.setHeight((int) (mostCurrent._pnlads.getHeight()+mostCurrent._pnlcircle.getHeight()));
 //BA.debugLineNum = 112;BA.debugLine="topSV = slide.Height + pnlcircle.Height";
_topsv = (int) (_slide.getHeight()+mostCurrent._pnlcircle.getHeight());
 //BA.debugLineNum = 113;BA.debugLine="sv1.Panel.Height = topSV";
mostCurrent._sv1.getPanel().setHeight(_topsv);
 //BA.debugLineNum = 116;BA.debugLine="btncat.Initialize(\"btncat\")";
mostCurrent._btncat.Initialize(mostCurrent.activityBA,"btncat");
 //BA.debugLineNum = 118;BA.debugLine="topSV = topSV + 5";
_topsv = (int) (_topsv+5);
 //BA.debugLineNum = 119;BA.debugLine="sv1.Panel.AddView(btncat,0,topSV,80%x,40dip)";
mostCurrent._sv1.getPanel().AddView((android.view.View)(mostCurrent._btncat.getObject()),(int) (0),_topsv,anywheresoftware.b4a.keywords.Common.PerXToCurrent((float) (80),mostCurrent.activityBA),anywheresoftware.b4a.keywords.Common.DipToCurrent((int) (40)));
 //BA.debugLineNum = 121;BA.debugLine="Dim cd As ColorDrawable";
_cd = new anywheresoftware.b4a.objects.drawable.ColorDrawable();
 //BA.debugLineNum = 122;BA.debugLine="cd.Initialize2(Library.ConvertHex2Int(Library.Get";
_cd.Initialize2((int)(Double.parseDouble(mostCurrent._library._converthex2int(mostCurrent.activityBA,mostCurrent._library._getstringresourse(mostCurrent.activityBA,"category_button")))),(int) (5),(int) (1),anywheresoftware.b4a.keywords.Common.Colors.Gray);
 //BA.debugLineNum = 123;BA.debugLine="btncat.Background = cd";
mostCurrent._btncat.setBackground((android.graphics.drawable.Drawable)(_cd.getObject()));
 //BA.debugLineNum = 124;BA.debugLine="btncat.Text = Library.GetStringResourse(\"category";
mostCurrent._btncat.setText(BA.ObjectToCharSequence(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"category")));
 //BA.debugLineNum = 125;BA.debugLine="btncat.TextColor = Colors.White";
mostCurrent._btncat.setTextColor(anywheresoftware.b4a.keywords.Common.Colors.White);
 //BA.debugLineNum = 126;BA.debugLine="btncat.TextSize = 14";
mostCurrent._btncat.setTextSize((float) (14));
 //BA.debugLineNum = 127;BA.debugLine="btncat.Typeface = Library.GetFont";
mostCurrent._btncat.setTypeface((android.graphics.Typeface)(mostCurrent._library._getfont(mostCurrent.activityBA).getObject()));
 //BA.debugLineNum = 128;BA.debugLine="Library.CenterView(btncat,Activity)";
mostCurrent._library._centerview(mostCurrent.activityBA,(anywheresoftware.b4a.objects.ConcreteViewWrapper) anywheresoftware.b4a.AbsObjectWrapper.ConvertToWrapper(new anywheresoftware.b4a.objects.ConcreteViewWrapper(), (android.view.View)(mostCurrent._btncat.getObject())),(anywheresoftware.b4a.objects.ConcreteViewWrapper) anywheresoftware.b4a.AbsObjectWrapper.ConvertToWrapper(new anywheresoftware.b4a.objects.ConcreteViewWrapper(), (android.view.View)(mostCurrent._activity.getObject())));
 //BA.debugLineNum = 129;BA.debugLine="topSV = topSV + 60dip";
_topsv = (int) (_topsv+anywheresoftware.b4a.keywords.Common.DipToCurrent((int) (60)));
 //BA.debugLineNum = 131;BA.debugLine="FeatureProduct.Initialize";
mostCurrent._featureproduct._initialize(processBA);
 //BA.debugLineNum = 132;BA.debugLine="NewProduct.Initialize";
mostCurrent._newproduct._initialize(processBA);
 //BA.debugLineNum = 133;BA.debugLine="BestProduct.Initialize";
mostCurrent._bestproduct._initialize(processBA);
 //BA.debugLineNum = 134;BA.debugLine="Slideshow.Initialize";
mostCurrent._slideshow._initialize(processBA);
 //BA.debugLineNum = 136;BA.debugLine="lblpb.Text = Library.GetStringResourse(\"loading\")";
mostCurrent._lblpb.setText(BA.ObjectToCharSequence(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"loading")));
 //BA.debugLineNum = 137;BA.debugLine="lbltitle.Text = Library.GetStringResourse(\"app_ti";
mostCurrent._lbltitle.setText(BA.ObjectToCharSequence(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"app_title")));
 //BA.debugLineNum = 141;BA.debugLine="If Library.listSlideshow = Null Then";
if (mostCurrent._library._listslideshow== null) { 
 //BA.debugLineNum = 142;BA.debugLine="Dim ls As List";
_ls = new anywheresoftware.b4a.objects.collections.List();
 //BA.debugLineNum = 143;BA.debugLine="ls.Initialize";
_ls.Initialize();
 //BA.debugLineNum = 144;BA.debugLine="Library.listSlideshow = ls";
mostCurrent._library._listslideshow = _ls;
 };
 //BA.debugLineNum = 147;BA.debugLine="If Library.listSlideshow.IsInitialized Then";
if (mostCurrent._library._listslideshow.IsInitialized()) { 
 //BA.debugLineNum = 149;BA.debugLine="LoadSlideshow(Library.listSlideshow)";
_loadslideshow(mostCurrent._library._listslideshow);
 //BA.debugLineNum = 151;BA.debugLine="isOffline = True";
_isoffline = anywheresoftware.b4a.keywords.Common.True;
 //BA.debugLineNum = 153;BA.debugLine="If Library.listBanners.IsInitialized Then";
if (mostCurrent._library._listbanners.IsInitialized()) { 
 //BA.debugLineNum = 154;BA.debugLine="Banners_Receive(Library.listBanners,\"\")";
_banners_receive(mostCurrent._library._listbanners,"");
 };
 }else {
 //BA.debugLineNum = 158;BA.debugLine="Slideshow.GetSlideshow(Me,\"slideshow_receive\")";
mostCurrent._slideshow._getslideshow(actmenu.getObject(),"slideshow_receive");
 //BA.debugLineNum = 159;BA.debugLine="Return";
if (true) return "";
 };
 //BA.debugLineNum = 162;BA.debugLine="If Library.SpecialProduct.IsInitialized Then";
if (mostCurrent._library._specialproduct.IsInitialized()) { 
 //BA.debugLineNum = 163;BA.debugLine="isOffline = True";
_isoffline = anywheresoftware.b4a.keywords.Common.True;
 //BA.debugLineNum = 164;BA.debugLine="SpecialsProduct_receive(Library.SpecialProduct,\"";
_specialsproduct_receive(mostCurrent._library._specialproduct,"special");
 }else {
 //BA.debugLineNum = 166;BA.debugLine="If Library.InternetState = False Then";
if (mostCurrent._library._internetstate(mostCurrent.activityBA)==anywheresoftware.b4a.keywords.Common.False) { 
 //BA.debugLineNum = 167;BA.debugLine="pnlloading.SetVisibleAnimated(500,False)";
mostCurrent._pnlloading.SetVisibleAnimated((int) (500),anywheresoftware.b4a.keywords.Common.False);
 }else {
 //BA.debugLineNum = 169;BA.debugLine="opSpecialProduct.GetSpecialProduct(\"specials\",T";
mostCurrent._opspecialproduct._getspecialproduct("specials",anywheresoftware.b4a.keywords.Common.True,mostCurrent._library._getlimitloaditem(mostCurrent.activityBA),actmenu.getObject(),"SpecialsProduct_receive");
 };
 };
 //BA.debugLineNum = 173;BA.debugLine="If Library.NewProduct.IsInitialized Then";
if (mostCurrent._library._newproduct.IsInitialized()) { 
 //BA.debugLineNum = 174;BA.debugLine="isOffline = True";
_isoffline = anywheresoftware.b4a.keywords.Common.True;
 //BA.debugLineNum = 175;BA.debugLine="NewProduct_receive(Library.NewProduct,\"new\")";
_newproduct_receive(mostCurrent._library._newproduct,"new");
 }else {
 //BA.debugLineNum = 177;BA.debugLine="If Library.InternetState = False Then";
if (mostCurrent._library._internetstate(mostCurrent.activityBA)==anywheresoftware.b4a.keywords.Common.False) { 
 //BA.debugLineNum = 178;BA.debugLine="pnlloading.SetVisibleAnimated(500,False)";
mostCurrent._pnlloading.SetVisibleAnimated((int) (500),anywheresoftware.b4a.keywords.Common.False);
 }else {
 //BA.debugLineNum = 180;BA.debugLine="NewProduct.GetSpecialProduct(\"latest\",True,Libr";
mostCurrent._newproduct._getspecialproduct("latest",anywheresoftware.b4a.keywords.Common.True,mostCurrent._library._getlimitloaditem(mostCurrent.activityBA),actmenu.getObject(),"NewProduct_receive");
 };
 };
 //BA.debugLineNum = 184;BA.debugLine="If Library.FeatureProduct.IsInitialized Then";
if (mostCurrent._library._featureproduct.IsInitialized()) { 
 //BA.debugLineNum = 185;BA.debugLine="If Library.FeatureProduct.Size > 0 Then";
if (mostCurrent._library._featureproduct.getSize()>0) { 
 //BA.debugLineNum = 186;BA.debugLine="FeatureProduct_receive(Library.FeatureProduct,\"";
_featureproduct_receive(mostCurrent._library._featureproduct,"feature");
 };
 };
 //BA.debugLineNum = 190;BA.debugLine="If Library.BestProduct.IsInitialized Then";
if (mostCurrent._library._bestproduct.IsInitialized()) { 
 //BA.debugLineNum = 191;BA.debugLine="bestproduct_receive(Library.BestProduct,\"best\")";
_bestproduct_receive(mostCurrent._library._bestproduct,"best");
 }else {
 //BA.debugLineNum = 193;BA.debugLine="sv1.Panel.Height = sv1.Panel.Height + 100dip";
mostCurrent._sv1.getPanel().setHeight((int) (mostCurrent._sv1.getPanel().getHeight()+anywheresoftware.b4a.keywords.Common.DipToCurrent((int) (100))));
 };
 //BA.debugLineNum = 196;BA.debugLine="If Library.listManufacturers.IsInitialized Then";
if (mostCurrent._library._listmanufacturers.IsInitialized()) { 
 //BA.debugLineNum = 198;BA.debugLine="If CheckShowBannerConfig(\"manufacture\") = True T";
if (_checkshowbannerconfig("manufacture")==anywheresoftware.b4a.keywords.Common.True) { 
 //BA.debugLineNum = 199;BA.debugLine="LoadManufacturers(Library.listManufacturers)";
_loadmanufacturers(mostCurrent._library._listmanufacturers);
 }else {
 //BA.debugLineNum = 201;BA.debugLine="sv1.Panel.Height = sv1.Panel.Height + 100dip";
mostCurrent._sv1.getPanel().setHeight((int) (mostCurrent._sv1.getPanel().getHeight()+anywheresoftware.b4a.keywords.Common.DipToCurrent((int) (100))));
 //BA.debugLineNum = 202;BA.debugLine="topSV = topSV + 12dip";
_topsv = (int) (_topsv+anywheresoftware.b4a.keywords.Common.DipToCurrent((int) (12)));
 //BA.debugLineNum = 203;BA.debugLine="sv1.Panel.Height = topSV";
mostCurrent._sv1.getPanel().setHeight(_topsv);
 //BA.debugLineNum = 204;BA.debugLine="pnlloading.SetVisibleAnimated(600,False)";
mostCurrent._pnlloading.SetVisibleAnimated((int) (600),anywheresoftware.b4a.keywords.Common.False);
 };
 };
 //BA.debugLineNum = 211;BA.debugLine="If isOffline = True Then";
if (_isoffline==anywheresoftware.b4a.keywords.Common.True) { 
 //BA.debugLineNum = 212;BA.debugLine="pnlloading.SetVisibleAnimated(500,False)";
mostCurrent._pnlloading.SetVisibleAnimated((int) (500),anywheresoftware.b4a.keywords.Common.False);
 };
 //BA.debugLineNum = 215;BA.debugLine="CheckPushProduct";
_checkpushproduct();
 //BA.debugLineNum = 217;BA.debugLine="End Sub";
return "";
}
public static boolean  _activity_keypress(int _keycode) throws Exception{
 //BA.debugLineNum = 415;BA.debugLine="Sub Activity_KeyPress (KeyCode As Int) As Boolean";
 //BA.debugLineNum = 417;BA.debugLine="If KeyCode = KeyCodes.KEYCODE_MENU Then";
if (_keycode==anywheresoftware.b4a.keywords.Common.KeyCodes.KEYCODE_MENU) { 
 //BA.debugLineNum = 418;BA.debugLine="SlideMenu.ToggleMenu";
mostCurrent._slidemenu._togglemenu();
 }else if(_keycode==anywheresoftware.b4a.keywords.Common.KeyCodes.KEYCODE_BACK) { 
 //BA.debugLineNum = 422;BA.debugLine="If pnlloading.Visible = True Then Return True";
if (mostCurrent._pnlloading.getVisible()==anywheresoftware.b4a.keywords.Common.True) { 
if (true) return anywheresoftware.b4a.keywords.Common.True;};
 //BA.debugLineNum = 424;BA.debugLine="If SlideMenu.GetVisible = True Then";
if (mostCurrent._slidemenu._getvisible()==anywheresoftware.b4a.keywords.Common.True) { 
 //BA.debugLineNum = 425;BA.debugLine="SlideMenu.ToggleMenu";
mostCurrent._slidemenu._togglemenu();
 //BA.debugLineNum = 426;BA.debugLine="Return True";
if (true) return anywheresoftware.b4a.keywords.Common.True;
 };
 //BA.debugLineNum = 429;BA.debugLine="If Msgbox2(Library.GetStringResourse(\"exit_app2\"";
if (anywheresoftware.b4a.keywords.Common.Msgbox2(BA.ObjectToCharSequence(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"exit_app2")),BA.ObjectToCharSequence(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"alert")),mostCurrent._library._getstringresourse(mostCurrent.activityBA,"yes"),mostCurrent._library._getstringresourse(mostCurrent.activityBA,"no"),"",(android.graphics.Bitmap)(anywheresoftware.b4a.keywords.Common.Null),mostCurrent.activityBA)!=anywheresoftware.b4a.keywords.Common.DialogResponse.POSITIVE) { 
 //BA.debugLineNum = 430;BA.debugLine="Return True";
if (true) return anywheresoftware.b4a.keywords.Common.True;
 };
 //BA.debugLineNum = 433;BA.debugLine="File.Delete(File.DirInternal,\"data\")";
anywheresoftware.b4a.keywords.Common.File.Delete(anywheresoftware.b4a.keywords.Common.File.getDirInternal(),"data");
 //BA.debugLineNum = 434;BA.debugLine="Activity.Finish";
mostCurrent._activity.Finish();
 }else if(_keycode==24 || _keycode==25) { 
 //BA.debugLineNum = 437;BA.debugLine="CallSubDelayed(GoogleVoices,\"Listen\")";
anywheresoftware.b4a.keywords.Common.CallSubDelayed(mostCurrent.activityBA,(Object)(mostCurrent._googlevoices.getObject()),"Listen");
 //BA.debugLineNum = 438;BA.debugLine="Return True";
if (true) return anywheresoftware.b4a.keywords.Common.True;
 };
 //BA.debugLineNum = 442;BA.debugLine="End Sub";
return false;
}
public static String  _activity_pause(boolean _userclosed) throws Exception{
 //BA.debugLineNum = 503;BA.debugLine="Sub Activity_Pause (UserClosed As Boolean)";
 //BA.debugLineNum = 504;BA.debugLine="timerSlideshow.Enabled = False";
_timerslideshow.setEnabled(anywheresoftware.b4a.keywords.Common.False);
 //BA.debugLineNum = 505;BA.debugLine="Library.AnimationFromLeft2Right";
mostCurrent._library._animationfromleft2right(mostCurrent.activityBA);
 //BA.debugLineNum = 506;BA.debugLine="End Sub";
return "";
}
public static String  _activity_resume() throws Exception{
com.apps.demo.opencart _opwish = null;
 //BA.debugLineNum = 444;BA.debugLine="Sub Activity_Resume";
 //BA.debugLineNum = 446;BA.debugLine="If timerSlideshow.IsInitialized Then";
if (_timerslideshow.IsInitialized()) { 
 //BA.debugLineNum = 447;BA.debugLine="timerSlideshow.Enabled = True";
_timerslideshow.setEnabled(anywheresoftware.b4a.keywords.Common.True);
 };
 //BA.debugLineNum = 450;BA.debugLine="ApplySettingChanges";
_applysettingchanges();
 //BA.debugLineNum = 452;BA.debugLine="GetCart";
_getcart();
 //BA.debugLineNum = 454;BA.debugLine="Dim opWish As OpenCart";
_opwish = new com.apps.demo.opencart();
 //BA.debugLineNum = 455;BA.debugLine="opWish.Initialize";
_opwish._initialize(processBA);
 //BA.debugLineNum = 456;BA.debugLine="opWish.Wishlist(Me,\"WishList_receive\",\"\")";
_opwish._wishlist(actmenu.getObject(),"WishList_receive","");
 //BA.debugLineNum = 458;BA.debugLine="SlideMenu.AddHeader";
mostCurrent._slidemenu._addheader();
 //BA.debugLineNum = 460;BA.debugLine="End Sub";
return "";
}
public static String  _addbullet(int _size) throws Exception{
int _left = 0;
anywheresoftware.b4a.objects.drawable.ColorDrawable _c1 = null;
anywheresoftware.b4a.objects.drawable.ColorDrawable _c2 = null;
int _i = 0;
anywheresoftware.b4a.objects.PanelWrapper _p1 = null;
 //BA.debugLineNum = 877;BA.debugLine="Sub AddBullet(size As Int)";
 //BA.debugLineNum = 879;BA.debugLine="Dim left As Int";
_left = 0;
 //BA.debugLineNum = 880;BA.debugLine="left = 0";
_left = (int) (0);
 //BA.debugLineNum = 882;BA.debugLine="If bullet.IsInitialized = False Then bullet.Initi";
if (mostCurrent._bullet.IsInitialized()==anywheresoftware.b4a.keywords.Common.False) { 
mostCurrent._bullet.Initialize();};
 //BA.debugLineNum = 884;BA.debugLine="Dim c1,c2 As ColorDrawable";
_c1 = new anywheresoftware.b4a.objects.drawable.ColorDrawable();
_c2 = new anywheresoftware.b4a.objects.drawable.ColorDrawable();
 //BA.debugLineNum = 885;BA.debugLine="c1.Initialize(Colors.RGB(66,66,66),50)";
_c1.Initialize(anywheresoftware.b4a.keywords.Common.Colors.RGB((int) (66),(int) (66),(int) (66)),(int) (50));
 //BA.debugLineNum = 886;BA.debugLine="c2.Initialize(Colors.RGB(191,191,191),50)";
_c2.Initialize(anywheresoftware.b4a.keywords.Common.Colors.RGB((int) (191),(int) (191),(int) (191)),(int) (50));
 //BA.debugLineNum = 888;BA.debugLine="pnlcircle.Width = 0";
mostCurrent._pnlcircle.setWidth((int) (0));
 //BA.debugLineNum = 890;BA.debugLine="For i = 1 To size";
{
final int step8 = 1;
final int limit8 = _size;
for (_i = (int) (1) ; (step8 > 0 && _i <= limit8) || (step8 < 0 && _i >= limit8); _i = ((int)(0 + _i + step8)) ) {
 //BA.debugLineNum = 892;BA.debugLine="Dim p1 As Panel";
_p1 = new anywheresoftware.b4a.objects.PanelWrapper();
 //BA.debugLineNum = 893;BA.debugLine="p1.Initialize(\"\")";
_p1.Initialize(mostCurrent.activityBA,"");
 //BA.debugLineNum = 894;BA.debugLine="pnlcircle.AddView(p1,left,pnlcircle.Height /2,10";
mostCurrent._pnlcircle.AddView((android.view.View)(_p1.getObject()),_left,(int) (mostCurrent._pnlcircle.getHeight()/(double)2),anywheresoftware.b4a.keywords.Common.DipToCurrent((int) (10)),anywheresoftware.b4a.keywords.Common.DipToCurrent((int) (10)));
 //BA.debugLineNum = 895;BA.debugLine="p1.Background = c1";
_p1.setBackground((android.graphics.drawable.Drawable)(_c1.getObject()));
 //BA.debugLineNum = 896;BA.debugLine="left = left + 14dip";
_left = (int) (_left+anywheresoftware.b4a.keywords.Common.DipToCurrent((int) (14)));
 //BA.debugLineNum = 897;BA.debugLine="pnlcircle.Width = left";
mostCurrent._pnlcircle.setWidth(_left);
 //BA.debugLineNum = 898;BA.debugLine="bullet.Add(p1)";
mostCurrent._bullet.Add((Object)(_p1.getObject()));
 }
};
 //BA.debugLineNum = 901;BA.debugLine="Library.CenterView(pnlcircle,Activity)";
mostCurrent._library._centerview(mostCurrent.activityBA,(anywheresoftware.b4a.objects.ConcreteViewWrapper) anywheresoftware.b4a.AbsObjectWrapper.ConvertToWrapper(new anywheresoftware.b4a.objects.ConcreteViewWrapper(), (android.view.View)(mostCurrent._pnlcircle.getObject())),(anywheresoftware.b4a.objects.ConcreteViewWrapper) anywheresoftware.b4a.AbsObjectWrapper.ConvertToWrapper(new anywheresoftware.b4a.objects.ConcreteViewWrapper(), (android.view.View)(mostCurrent._activity.getObject())));
 //BA.debugLineNum = 903;BA.debugLine="End Sub";
return "";
}
public static int  _addheader(String _title,String _tag,int _top) throws Exception{
anywheresoftware.b4a.objects.PanelWrapper _p1 = null;
anywheresoftware.b4a.objects.drawable.ColorDrawable _c1 = null;
 //BA.debugLineNum = 510;BA.debugLine="Sub AddHeader(Title As String,Tag As String,Top As";
 //BA.debugLineNum = 512;BA.debugLine="Dim p1 As Panel";
_p1 = new anywheresoftware.b4a.objects.PanelWrapper();
 //BA.debugLineNum = 513;BA.debugLine="p1.Initialize(\"\")";
_p1.Initialize(mostCurrent.activityBA,"");
 //BA.debugLineNum = 514;BA.debugLine="sv1.Panel.AddView(p1,0,Top,sv1.Width,0)";
mostCurrent._sv1.getPanel().AddView((android.view.View)(_p1.getObject()),(int) (0),_top,mostCurrent._sv1.getWidth(),(int) (0));
 //BA.debugLineNum = 516;BA.debugLine="If Library.IsPersian Then";
if (mostCurrent._library._ispersian(mostCurrent.activityBA)) { 
 //BA.debugLineNum = 517;BA.debugLine="p1.LoadLayout(\"frmheader_template\")";
_p1.LoadLayout("frmheader_template",mostCurrent.activityBA);
 }else {
 //BA.debugLineNum = 519;BA.debugLine="p1.LoadLayout(\"frmheader_template_en\")";
_p1.LoadLayout("frmheader_template_en",mostCurrent.activityBA);
 };
 //BA.debugLineNum = 522;BA.debugLine="DoEvents";
anywheresoftware.b4a.keywords.Common.DoEvents();
 //BA.debugLineNum = 524;BA.debugLine="p1.Height = pnlheadert.Height";
_p1.setHeight(mostCurrent._pnlheadert.getHeight());
 //BA.debugLineNum = 525;BA.debugLine="lblheadername.Text = Title";
mostCurrent._lblheadername.setText(BA.ObjectToCharSequence(_title));
 //BA.debugLineNum = 526;BA.debugLine="pnloverheader.Tag = Tag";
mostCurrent._pnloverheader.setTag((Object)(_tag));
 //BA.debugLineNum = 528;BA.debugLine="Top = Top + p1.Height + 4dip";
_top = (int) (_top+_p1.getHeight()+anywheresoftware.b4a.keywords.Common.DipToCurrent((int) (4)));
 //BA.debugLineNum = 530;BA.debugLine="Dim c1 As ColorDrawable";
_c1 = new anywheresoftware.b4a.objects.drawable.ColorDrawable();
 //BA.debugLineNum = 531;BA.debugLine="c1.Initialize(Library.Theme_Header,16dip)";
_c1.Initialize(mostCurrent._library._theme_header,anywheresoftware.b4a.keywords.Common.DipToCurrent((int) (16)));
 //BA.debugLineNum = 532;BA.debugLine="pnlheaderproduct.Background = c1";
mostCurrent._pnlheaderproduct.setBackground((android.graphics.drawable.Drawable)(_c1.getObject()));
 //BA.debugLineNum = 534;BA.debugLine="sv1.Panel.Height = sv1.Panel.Height + p1.Height";
mostCurrent._sv1.getPanel().setHeight((int) (mostCurrent._sv1.getPanel().getHeight()+_p1.getHeight()));
 //BA.debugLineNum = 536;BA.debugLine="Return Top";
if (true) return _top;
 //BA.debugLineNum = 538;BA.debugLine="End Sub";
return 0;
}
public static String  _allproduct_receive(anywheresoftware.b4a.objects.collections.List _res,String _category) throws Exception{
String _t1 = "";
 //BA.debugLineNum = 1181;BA.debugLine="Sub allproduct_receive(res As List,category As Str";
 //BA.debugLineNum = 1183;BA.debugLine="If res = Null Then Return";
if (_res== null) { 
if (true) return "";};
 //BA.debugLineNum = 1184;BA.debugLine="If res.IsInitialized = False Then Return";
if (_res.IsInitialized()==anywheresoftware.b4a.keywords.Common.False) { 
if (true) return "";};
 //BA.debugLineNum = 1186;BA.debugLine="Library.CacheSystem.AddList2Cache(category,res,\"t";
mostCurrent._library._cachesystem._addlist2cache(_category,_res,"topic_products");
 //BA.debugLineNum = 1188;BA.debugLine="pnlloading.SetVisibleAnimated(500,False)";
mostCurrent._pnlloading.SetVisibleAnimated((int) (500),anywheresoftware.b4a.keywords.Common.False);
 //BA.debugLineNum = 1190;BA.debugLine="actProducts.res = res";
mostCurrent._actproducts._res = _res;
 //BA.debugLineNum = 1192;BA.debugLine="Dim t1 As String";
_t1 = "";
 //BA.debugLineNum = 1194;BA.debugLine="If category = \"bestsellers\" Then";
if ((_category).equals("bestsellers")) { 
 //BA.debugLineNum = 1195;BA.debugLine="t1 = Library.GetStringResourse(\"bestproduct\")";
_t1 = mostCurrent._library._getstringresourse(mostCurrent.activityBA,"bestproduct");
 }else if((_category).equals("featured")) { 
 //BA.debugLineNum = 1197;BA.debugLine="t1 = Library.GetStringResourse(\"featureproduct\")";
_t1 = mostCurrent._library._getstringresourse(mostCurrent.activityBA,"featureproduct");
 }else if((_category).equals("products")) { 
 //BA.debugLineNum = 1199;BA.debugLine="t1 = Library.GetStringResourse(\"newproduct\")";
_t1 = mostCurrent._library._getstringresourse(mostCurrent.activityBA,"newproduct");
 }else {
 //BA.debugLineNum = 1201;BA.debugLine="t1 = Library.GetStringResourse(\"relat_product\")";
_t1 = mostCurrent._library._getstringresourse(mostCurrent.activityBA,"relat_product");
 };
 //BA.debugLineNum = 1204;BA.debugLine="actProducts.title = t1";
mostCurrent._actproducts._title = _t1;
 //BA.debugLineNum = 1205;BA.debugLine="StartActivity(actProducts)";
anywheresoftware.b4a.keywords.Common.StartActivity(mostCurrent.activityBA,(Object)(mostCurrent._actproducts.getObject()));
 //BA.debugLineNum = 1207;BA.debugLine="End Sub";
return "";
}
public static String  _applysettingchanges() throws Exception{
 //BA.debugLineNum = 462;BA.debugLine="Sub ApplySettingChanges";
 //BA.debugLineNum = 464;BA.debugLine="If (Library.currLang.ToLowerCase <> Library.manag";
if (((mostCurrent._library._currlang.toLowerCase()).equals(mostCurrent._library._manager.GetString("lang").toLowerCase()) == false) || ((mostCurrent._library._currcurrency.toLowerCase()).equals(mostCurrent._library._manager.GetString("curr").toLowerCase()) == false)) { 
 //BA.debugLineNum = 466;BA.debugLine="If Library.loginDetails <> Null Then";
if (mostCurrent._library._logindetails!= null) { 
 //BA.debugLineNum = 467;BA.debugLine="If Library.loginDetails.IsInitialized Then";
if (mostCurrent._library._logindetails.IsInitialized()) { 
 //BA.debugLineNum = 468;BA.debugLine="Library.loginDetails.Put(\"login\",False)";
mostCurrent._library._logindetails.Put((Object)("login"),(Object)(anywheresoftware.b4a.keywords.Common.False));
 };
 };
 //BA.debugLineNum = 472;BA.debugLine="Library.CacheSystem.ClearCache";
mostCurrent._library._cachesystem._clearcache();
 //BA.debugLineNum = 474;BA.debugLine="Activity.Finish";
mostCurrent._activity.Finish();
 //BA.debugLineNum = 475;BA.debugLine="StartActivity(Main)";
anywheresoftware.b4a.keywords.Common.StartActivity(mostCurrent.activityBA,(Object)(mostCurrent._main.getObject()));
 //BA.debugLineNum = 477;BA.debugLine="Return";
if (true) return "";
 }else {
 //BA.debugLineNum = 480;BA.debugLine="Library.setLocalApp(Library.currLang)";
mostCurrent._library._setlocalapp(mostCurrent.activityBA,mostCurrent._library._currlang);
 };
 //BA.debugLineNum = 483;BA.debugLine="End Sub";
return "";
}
public static String  _banners_receive(anywheresoftware.b4a.objects.collections.List _res,String _id) throws Exception{
com.apps.demo.opencart _op = null;
int _i = 0;
anywheresoftware.b4a.objects.collections.Map _l1 = null;
anywheresoftware.b4a.objects.HorizontalScrollViewWrapper _svbanners = null;
String _name = "";
anywheresoftware.b4a.objects.ProgressBarWrapper _progress = null;
anywheresoftware.b4a.objects.collections.List _cache = null;
 //BA.debugLineNum = 913;BA.debugLine="Sub Banners_Receive(Res As List,ID As String)";
 //BA.debugLineNum = 915;BA.debugLine="If Res = Null Then";
if (_res== null) { 
 //BA.debugLineNum = 916;BA.debugLine="If isOffline = False Then";
if (_isoffline==anywheresoftware.b4a.keywords.Common.False) { 
 //BA.debugLineNum = 917;BA.debugLine="NewProduct.Initialize";
mostCurrent._newproduct._initialize(processBA);
 //BA.debugLineNum = 918;BA.debugLine="NewProduct.GetSpecialProduct(\"latest\",True,Libr";
mostCurrent._newproduct._getspecialproduct("latest",anywheresoftware.b4a.keywords.Common.True,mostCurrent._library._getlimitloaditem(mostCurrent.activityBA),actmenu.getObject(),"NewProduct_receive");
 }else {
 //BA.debugLineNum = 920;BA.debugLine="pnlloading.Visible = False";
mostCurrent._pnlloading.setVisible(anywheresoftware.b4a.keywords.Common.False);
 };
 //BA.debugLineNum = 922;BA.debugLine="Return";
if (true) return "";
 };
 //BA.debugLineNum = 925;BA.debugLine="If Res.IsInitialized = False Then";
if (_res.IsInitialized()==anywheresoftware.b4a.keywords.Common.False) { 
 //BA.debugLineNum = 926;BA.debugLine="If isOffline = False Then";
if (_isoffline==anywheresoftware.b4a.keywords.Common.False) { 
 //BA.debugLineNum = 927;BA.debugLine="NewProduct.Initialize";
mostCurrent._newproduct._initialize(processBA);
 //BA.debugLineNum = 928;BA.debugLine="NewProduct.GetSpecialProduct(\"latest\",True,Libr";
mostCurrent._newproduct._getspecialproduct("latest",anywheresoftware.b4a.keywords.Common.True,mostCurrent._library._getlimitloaditem(mostCurrent.activityBA),actmenu.getObject(),"NewProduct_receive");
 }else {
 //BA.debugLineNum = 930;BA.debugLine="pnlloading.Visible = False";
mostCurrent._pnlloading.setVisible(anywheresoftware.b4a.keywords.Common.False);
 };
 //BA.debugLineNum = 932;BA.debugLine="Return";
if (true) return "";
 };
 //BA.debugLineNum = 935;BA.debugLine="Library.CacheSystem.AddList2Cache(\"banners\",Res,\"";
mostCurrent._library._cachesystem._addlist2cache("banners",_res,"banners");
 //BA.debugLineNum = 937;BA.debugLine="Dim op As OpenCart";
_op = new com.apps.demo.opencart();
 //BA.debugLineNum = 938;BA.debugLine="op.Initialize";
_op._initialize(processBA);
 //BA.debugLineNum = 940;BA.debugLine="BannerScrollView.Initialize";
mostCurrent._bannerscrollview.Initialize();
 //BA.debugLineNum = 941;BA.debugLine="ListBannerLoaded.Initialize";
mostCurrent._listbannerloaded.Initialize();
 //BA.debugLineNum = 943;BA.debugLine="OffsetBannerLoaded = 0";
_offsetbannerloaded = (int) (0);
 //BA.debugLineNum = 945;BA.debugLine="For i = 0 To Res.Size - 1";
{
final int step25 = 1;
final int limit25 = (int) (_res.getSize()-1);
for (_i = (int) (0) ; (step25 > 0 && _i <= limit25) || (step25 < 0 && _i >= limit25); _i = ((int)(0 + _i + step25)) ) {
 //BA.debugLineNum = 947;BA.debugLine="Dim l1 As Map";
_l1 = new anywheresoftware.b4a.objects.collections.Map();
 //BA.debugLineNum = 948;BA.debugLine="l1 = Res.Get(i)";
_l1.setObject((anywheresoftware.b4a.objects.collections.Map.MyMap)(_res.Get(_i)));
 //BA.debugLineNum = 950;BA.debugLine="If CheckShowBannerConfig(l1.Get(\"banner_id\")) =";
if (_checkshowbannerconfig(BA.ObjectToString(_l1.Get((Object)("banner_id"))))==anywheresoftware.b4a.keywords.Common.True) { 
 //BA.debugLineNum = 952;BA.debugLine="ListBannerLoaded.Add(l1.Get(\"banner_id\"))";
mostCurrent._listbannerloaded.Add(_l1.Get((Object)("banner_id")));
 //BA.debugLineNum = 954;BA.debugLine="Dim svBanners As HorizontalScrollView";
_svbanners = new anywheresoftware.b4a.objects.HorizontalScrollViewWrapper();
 //BA.debugLineNum = 955;BA.debugLine="svBanners.Initialize(0,\"\")";
_svbanners.Initialize(mostCurrent.activityBA,(int) (0),"");
 //BA.debugLineNum = 956;BA.debugLine="svBanners.Color = Colors.Transparent";
_svbanners.setColor(anywheresoftware.b4a.keywords.Common.Colors.Transparent);
 //BA.debugLineNum = 957;BA.debugLine="svBanners.Panel.Color = Colors.Transparent";
_svbanners.getPanel().setColor(anywheresoftware.b4a.keywords.Common.Colors.Transparent);
 //BA.debugLineNum = 959;BA.debugLine="Dim name As String";
_name = "";
 //BA.debugLineNum = 960;BA.debugLine="name = l1.Get(\"name\")";
_name = BA.ObjectToString(_l1.Get((Object)("name")));
 //BA.debugLineNum = 961;BA.debugLine="name = name.ToLowerCase";
_name = _name.toLowerCase();
 //BA.debugLineNum = 963;BA.debugLine="If name.IndexOf(\"مربع\") > -1 Or name.IndexOf(\"s";
if (_name.indexOf("مربع")>-1 || _name.indexOf("square")>-1 || _name.indexOf("grid")>-1) { 
 //BA.debugLineNum = 964;BA.debugLine="svBanners.Tag = \"square\"";
_svbanners.setTag((Object)("square"));
 }else if(_name.indexOf("مستطیل")>-1 || _name.indexOf("rect")>-1) { 
 //BA.debugLineNum = 966;BA.debugLine="svBanners.Tag = \"rect\"";
_svbanners.setTag((Object)("rect"));
 };
 //BA.debugLineNum = 969;BA.debugLine="sv1.Panel.AddView(svBanners,0,topSV,100%x,140di";
mostCurrent._sv1.getPanel().AddView((android.view.View)(_svbanners.getObject()),(int) (0),_topsv,anywheresoftware.b4a.keywords.Common.PerXToCurrent((float) (100),mostCurrent.activityBA),anywheresoftware.b4a.keywords.Common.DipToCurrent((int) (140)));
 //BA.debugLineNum = 970;BA.debugLine="topSV = topSV + svBanners.Height+8dip";
_topsv = (int) (_topsv+_svbanners.getHeight()+anywheresoftware.b4a.keywords.Common.DipToCurrent((int) (8)));
 //BA.debugLineNum = 972;BA.debugLine="Dim progress As ProgressBar";
_progress = new anywheresoftware.b4a.objects.ProgressBarWrapper();
 //BA.debugLineNum = 973;BA.debugLine="progress.Initialize(\"\")";
_progress.Initialize(mostCurrent.activityBA,"");
 //BA.debugLineNum = 974;BA.debugLine="progress.Indeterminate = True";
_progress.setIndeterminate(anywheresoftware.b4a.keywords.Common.True);
 //BA.debugLineNum = 976;BA.debugLine="svBanners.Panel.AddView(progress,100%x / 2 - 30";
_svbanners.getPanel().AddView((android.view.View)(_progress.getObject()),(int) (anywheresoftware.b4a.keywords.Common.PerXToCurrent((float) (100),mostCurrent.activityBA)/(double)2-30),(int) (_svbanners.getHeight()/(double)2-60),(int) (60),(int) (60));
 //BA.debugLineNum = 977;BA.debugLine="svBanners.Panel.Width = 100%x";
_svbanners.getPanel().setWidth(anywheresoftware.b4a.keywords.Common.PerXToCurrent((float) (100),mostCurrent.activityBA));
 //BA.debugLineNum = 979;BA.debugLine="BannerScrollView.Put(l1.Get(\"banner_id\"),svBann";
mostCurrent._bannerscrollview.Put(_l1.Get((Object)("banner_id")),(Object)(_svbanners.getObject()));
 };
 }
};
 //BA.debugLineNum = 985;BA.debugLine="If isOffline = False Then";
if (_isoffline==anywheresoftware.b4a.keywords.Common.False) { 
 //BA.debugLineNum = 988;BA.debugLine="opSpecialProduct.GetSpecialProduct(\"specials\",Tr";
mostCurrent._opspecialproduct._getspecialproduct("specials",anywheresoftware.b4a.keywords.Common.True,mostCurrent._library._getlimitloaditem(mostCurrent.activityBA),actmenu.getObject(),"SpecialsProduct_receive");
 };
 //BA.debugLineNum = 991;BA.debugLine="If ListBannerLoaded.Size > 0 Then";
if (mostCurrent._listbannerloaded.getSize()>0) { 
 //BA.debugLineNum = 992;BA.debugLine="OffsetBannerLoaded = 0";
_offsetbannerloaded = (int) (0);
 //BA.debugLineNum = 993;BA.debugLine="Dim cache As List";
_cache = new anywheresoftware.b4a.objects.collections.List();
 //BA.debugLineNum = 995;BA.debugLine="cache = Library.CacheSystem.GetCacheAsList(\"bann";
_cache = mostCurrent._library._cachesystem._getcacheaslist("banner"+BA.ObjectToString(mostCurrent._listbannerloaded.Get((int) (0))),"banner_info");
 //BA.debugLineNum = 997;BA.debugLine="If Library.CacheSystem.ExistID(\"banner\" & ListBa";
if (mostCurrent._library._cachesystem._existid("banner"+BA.ObjectToString(mostCurrent._listbannerloaded.Get((int) (0))),"banner_info")) { 
 //BA.debugLineNum = 998;BA.debugLine="GetOnlyBanner_Receive(cache,ListBannerLoaded.Ge";
_getonlybanner_receive(_cache,BA.ObjectToString(mostCurrent._listbannerloaded.Get((int) (0))));
 }else {
 //BA.debugLineNum = 1000;BA.debugLine="op.Banner(Me,\"GetOnlyBanner_Receive\",ListBanner";
_op._banner(actmenu.getObject(),"GetOnlyBanner_Receive",BA.ObjectToString(mostCurrent._listbannerloaded.Get((int) (0))));
 };
 };
 //BA.debugLineNum = 1005;BA.debugLine="End Sub";
return "";
}
public static String  _bestproduct_receive(anywheresoftware.b4a.objects.collections.List _res,String _category) throws Exception{
anywheresoftware.b4a.objects.ConcreteViewWrapper _v = null;
 //BA.debugLineNum = 375;BA.debugLine="Sub bestproduct_receive(res As List,category As St";
 //BA.debugLineNum = 377;BA.debugLine="If Library.BestProduct.IsInitialized = False Then";
if (mostCurrent._library._bestproduct.IsInitialized()==anywheresoftware.b4a.keywords.Common.False) { 
 //BA.debugLineNum = 378;BA.debugLine="Library.BestProduct.Initialize";
mostCurrent._library._bestproduct.Initialize();
 //BA.debugLineNum = 379;BA.debugLine="Library.BestProduct = res";
mostCurrent._library._bestproduct = _res;
 };
 //BA.debugLineNum = 382;BA.debugLine="Library.CacheSystem.AddList2Cache(\"best\",res,\"pro";
mostCurrent._library._cachesystem._addlist2cache("best",_res,"product_main");
 //BA.debugLineNum = 383;BA.debugLine="Library.CacheSystem.AddList2Cache(\"new\",Library.N";
mostCurrent._library._cachesystem._addlist2cache("new",mostCurrent._library._newproduct,"product_main");
 //BA.debugLineNum = 384;BA.debugLine="Library.CacheSystem.AddList2Cache(\"feature\",Libra";
mostCurrent._library._cachesystem._addlist2cache("feature",mostCurrent._library._featureproduct,"product_main");
 //BA.debugLineNum = 385;BA.debugLine="Library.CacheSystem.AddList2Cache(\"special\",Libra";
mostCurrent._library._cachesystem._addlist2cache("special",mostCurrent._library._specialproduct,"product_main");
 //BA.debugLineNum = 387;BA.debugLine="If res.Size > 0 Then";
if (_res.getSize()>0) { 
 //BA.debugLineNum = 388;BA.debugLine="topSV = AddHeader(Library.GetStringResourse(\"bes";
_topsv = _addheader(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"bestproduct"),"bestproduct",_topsv);
 //BA.debugLineNum = 389;BA.debugLine="svhBestProduct.Initialize(0,\"\")";
mostCurrent._svhbestproduct.Initialize(mostCurrent.activityBA,(int) (0),"");
 //BA.debugLineNum = 390;BA.debugLine="sv1.Panel.AddView(svhBestProduct,0,topSV,sv1.Wid";
mostCurrent._sv1.getPanel().AddView((android.view.View)(mostCurrent._svhbestproduct.getObject()),(int) (0),_topsv,mostCurrent._sv1.getWidth(),anywheresoftware.b4a.keywords.Common.DipToCurrent((int) (190)));
 //BA.debugLineNum = 391;BA.debugLine="topSV = topSV + Library.LoadProductHorizontalScr";
_topsv = (int) (_topsv+mostCurrent._library._loadproducthorizontalscroll(mostCurrent.activityBA,mostCurrent._library._bestproduct,mostCurrent._svhbestproduct)+anywheresoftware.b4a.keywords.Common.DipToCurrent((int) (70)));
 //BA.debugLineNum = 392;BA.debugLine="sv1.Panel.Height = sv1.Panel.Height + 180dip";
mostCurrent._sv1.getPanel().setHeight((int) (mostCurrent._sv1.getPanel().getHeight()+anywheresoftware.b4a.keywords.Common.DipToCurrent((int) (180))));
 //BA.debugLineNum = 393;BA.debugLine="Dim v As View";
_v = new anywheresoftware.b4a.objects.ConcreteViewWrapper();
 //BA.debugLineNum = 394;BA.debugLine="v = svhBestProduct.Panel.GetView(0)";
_v = mostCurrent._svhbestproduct.getPanel().GetView((int) (0));
 //BA.debugLineNum = 395;BA.debugLine="v.Top = 0";
_v.setTop((int) (0));
 };
 //BA.debugLineNum = 398;BA.debugLine="sv1.Panel.Height = sv1.Panel.Height + 180dip";
mostCurrent._sv1.getPanel().setHeight((int) (mostCurrent._sv1.getPanel().getHeight()+anywheresoftware.b4a.keywords.Common.DipToCurrent((int) (180))));
 //BA.debugLineNum = 400;BA.debugLine="If CheckShowBannerConfig(\"manufacture\") = True Th";
if (_checkshowbannerconfig("manufacture")==anywheresoftware.b4a.keywords.Common.True) { 
 //BA.debugLineNum = 401;BA.debugLine="If isOffline = False Then";
if (_isoffline==anywheresoftware.b4a.keywords.Common.False) { 
 //BA.debugLineNum = 402;BA.debugLine="opManufacturers.GetManufacturers(Me,\"Manufactur";
mostCurrent._opmanufacturers._getmanufacturers(actmenu.getObject(),"Manufacturers_receive");
 };
 }else {
 //BA.debugLineNum = 405;BA.debugLine="sv1.Panel.Height = sv1.Panel.Height + 100dip";
mostCurrent._sv1.getPanel().setHeight((int) (mostCurrent._sv1.getPanel().getHeight()+anywheresoftware.b4a.keywords.Common.DipToCurrent((int) (100))));
 //BA.debugLineNum = 406;BA.debugLine="topSV = topSV + 12dip";
_topsv = (int) (_topsv+anywheresoftware.b4a.keywords.Common.DipToCurrent((int) (12)));
 //BA.debugLineNum = 407;BA.debugLine="sv1.Panel.Height = topSV";
mostCurrent._sv1.getPanel().setHeight(_topsv);
 //BA.debugLineNum = 408;BA.debugLine="pnlloading.SetVisibleAnimated(600,False)";
mostCurrent._pnlloading.SetVisibleAnimated((int) (600),anywheresoftware.b4a.keywords.Common.False);
 };
 //BA.debugLineNum = 411;BA.debugLine="End Sub";
return "";
}
public static String  _btnbasket_click() throws Exception{
 //BA.debugLineNum = 1124;BA.debugLine="Sub btnbasket_Click";
 //BA.debugLineNum = 1126;BA.debugLine="If Library.InternetState = False Then";
if (mostCurrent._library._internetstate(mostCurrent.activityBA)==anywheresoftware.b4a.keywords.Common.False) { 
 //BA.debugLineNum = 1127;BA.debugLine="ToastMessageShow(Library.GetStringResourse(\"erro";
anywheresoftware.b4a.keywords.Common.ToastMessageShow(BA.ObjectToCharSequence(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"error_net_title")),anywheresoftware.b4a.keywords.Common.False);
 //BA.debugLineNum = 1128;BA.debugLine="Return";
if (true) return "";
 };
 //BA.debugLineNum = 1131;BA.debugLine="StartActivity(actBasket)";
anywheresoftware.b4a.keywords.Common.StartActivity(mostCurrent.activityBA,(Object)(mostCurrent._actbasket.getObject()));
 //BA.debugLineNum = 1133;BA.debugLine="End Sub";
return "";
}
public static String  _btncat_click() throws Exception{
 //BA.debugLineNum = 1222;BA.debugLine="Sub btncat_Click";
 //BA.debugLineNum = 1223;BA.debugLine="StartActivity(actCategory)";
anywheresoftware.b4a.keywords.Common.StartActivity(mostCurrent.activityBA,(Object)(mostCurrent._actcategory.getObject()));
 //BA.debugLineNum = 1224;BA.debugLine="End Sub";
return "";
}
public static String  _btnmenu_click() throws Exception{
 //BA.debugLineNum = 1116;BA.debugLine="Sub btnmenu_Click";
 //BA.debugLineNum = 1117;BA.debugLine="SlideMenu.ToggleMenu";
mostCurrent._slidemenu._togglemenu();
 //BA.debugLineNum = 1118;BA.debugLine="End Sub";
return "";
}
public static String  _btnscrollup_click() throws Exception{
 //BA.debugLineNum = 1319;BA.debugLine="Sub btnScrollUp_Click";
 //BA.debugLineNum = 1320;BA.debugLine="sv1.ScrollPosition = 0";
mostCurrent._sv1.setScrollPosition((int) (0));
 //BA.debugLineNum = 1321;BA.debugLine="DoEvents";
anywheresoftware.b4a.keywords.Common.DoEvents();
 //BA.debugLineNum = 1322;BA.debugLine="End Sub";
return "";
}
public static String  _btnsearch_click() throws Exception{
 //BA.debugLineNum = 1120;BA.debugLine="Sub btnsearch_Click";
 //BA.debugLineNum = 1121;BA.debugLine="StartActivity(actSearch)";
anywheresoftware.b4a.keywords.Common.StartActivity(mostCurrent.activityBA,(Object)(mostCurrent._actsearch.getObject()));
 //BA.debugLineNum = 1122;BA.debugLine="End Sub";
return "";
}
public static String  _carts_receive(anywheresoftware.b4a.objects.collections.Map _res,String _cat) throws Exception{
 //BA.debugLineNum = 1215;BA.debugLine="Sub Carts_receive(res As Map,cat As String)";
 //BA.debugLineNum = 1216;BA.debugLine="If res = Null Then Return";
if (_res== null) { 
if (true) return "";};
 //BA.debugLineNum = 1217;BA.debugLine="If res.IsInitialized = False Then Return";
if (_res.IsInitialized()==anywheresoftware.b4a.keywords.Common.False) { 
if (true) return "";};
 //BA.debugLineNum = 1218;BA.debugLine="Library.CartDetails = res";
mostCurrent._library._cartdetails = _res;
 //BA.debugLineNum = 1219;BA.debugLine="Library.ShowCartLabel(lblbasket)";
mostCurrent._library._showcartlabel(mostCurrent.activityBA,mostCurrent._lblbasket);
 //BA.debugLineNum = 1220;BA.debugLine="End Sub";
return "";
}
public static String  _checkpushproduct() throws Exception{
 //BA.debugLineNum = 237;BA.debugLine="Sub CheckPushProduct";
 //BA.debugLineNum = 239;BA.debugLine="If Library.OpenProductFromPush <> \"\" Then";
if ((mostCurrent._library._openproductfrompush).equals("") == false) { 
 //BA.debugLineNum = 240;BA.debugLine="actProduct.product = CreateMap(\"product_id\" : Li";
mostCurrent._actproduct._product = anywheresoftware.b4a.keywords.Common.createMap(new Object[] {(Object)("product_id"),(Object)(mostCurrent._library._openproductfrompush)});
 //BA.debugLineNum = 241;BA.debugLine="Library.OpenProductFromPush	=	\"\"";
mostCurrent._library._openproductfrompush = "";
 //BA.debugLineNum = 242;BA.debugLine="StartActivity(actProduct)";
anywheresoftware.b4a.keywords.Common.StartActivity(mostCurrent.activityBA,(Object)(mostCurrent._actproduct.getObject()));
 };
 //BA.debugLineNum = 245;BA.debugLine="End Sub";
return "";
}
public static boolean  _checkshowbannerconfig(String _id) throws Exception{
anywheresoftware.b4a.objects.collections.List _temp = null;
int _i = 0;
String _t = "";
 //BA.debugLineNum = 1096;BA.debugLine="Sub CheckShowBannerConfig(ID As String) As Boolean";
 //BA.debugLineNum = 1098;BA.debugLine="Dim temp As List";
_temp = new anywheresoftware.b4a.objects.collections.List();
 //BA.debugLineNum = 1099;BA.debugLine="temp = Library.Config.Get(\"banner\")";
_temp.setObject((java.util.List)(mostCurrent._library._config.Get((Object)("banner"))));
 //BA.debugLineNum = 1101;BA.debugLine="For i = 0 To temp.Size - 1";
{
final int step3 = 1;
final int limit3 = (int) (_temp.getSize()-1);
for (_i = (int) (0) ; (step3 > 0 && _i <= limit3) || (step3 < 0 && _i >= limit3); _i = ((int)(0 + _i + step3)) ) {
 //BA.debugLineNum = 1103;BA.debugLine="Dim t As String";
_t = "";
 //BA.debugLineNum = 1104;BA.debugLine="t = temp.Get(i)";
_t = BA.ObjectToString(_temp.Get(_i));
 //BA.debugLineNum = 1106;BA.debugLine="If t = ID Then Return True";
if ((_t).equals(_id)) { 
if (true) return anywheresoftware.b4a.keywords.Common.True;};
 }
};
 //BA.debugLineNum = 1110;BA.debugLine="Return False";
if (true) return anywheresoftware.b4a.keywords.Common.False;
 //BA.debugLineNum = 1112;BA.debugLine="End Sub";
return false;
}
public static String  _choosebullet(int _i) throws Exception{
anywheresoftware.b4a.objects.PanelWrapper _p1 = null;
anywheresoftware.b4a.objects.drawable.ColorDrawable _c1 = null;
anywheresoftware.b4a.objects.drawable.ColorDrawable _c2 = null;
anywheresoftware.b4a.objects.ConcreteViewWrapper _v1 = null;
anywheresoftware.b4a.objects.PanelWrapper _p2 = null;
 //BA.debugLineNum = 796;BA.debugLine="Sub ChooseBullet(i As Int)";
 //BA.debugLineNum = 798;BA.debugLine="If bullet = Null Then Return";
if (mostCurrent._bullet== null) { 
if (true) return "";};
 //BA.debugLineNum = 799;BA.debugLine="If bullet.IsInitialized = False Then Return";
if (mostCurrent._bullet.IsInitialized()==anywheresoftware.b4a.keywords.Common.False) { 
if (true) return "";};
 //BA.debugLineNum = 801;BA.debugLine="If i > bullet.Size-1 Then i = 0";
if (_i>mostCurrent._bullet.getSize()-1) { 
_i = (int) (0);};
 //BA.debugLineNum = 802;BA.debugLine="If bullet.Size = 0 Then Return";
if (mostCurrent._bullet.getSize()==0) { 
if (true) return "";};
 //BA.debugLineNum = 804;BA.debugLine="Dim p1 As Panel";
_p1 = new anywheresoftware.b4a.objects.PanelWrapper();
 //BA.debugLineNum = 805;BA.debugLine="p1 = bullet.Get(i)";
_p1.setObject((android.view.ViewGroup)(mostCurrent._bullet.Get(_i)));
 //BA.debugLineNum = 807;BA.debugLine="Dim c1,c2 As ColorDrawable";
_c1 = new anywheresoftware.b4a.objects.drawable.ColorDrawable();
_c2 = new anywheresoftware.b4a.objects.drawable.ColorDrawable();
 //BA.debugLineNum = 808;BA.debugLine="c1.Initialize(Colors.RGB(66,66,66),50)";
_c1.Initialize(anywheresoftware.b4a.keywords.Common.Colors.RGB((int) (66),(int) (66),(int) (66)),(int) (50));
 //BA.debugLineNum = 809;BA.debugLine="c2.Initialize(Colors.RGB(191,191,191),50)";
_c2.Initialize(anywheresoftware.b4a.keywords.Common.Colors.RGB((int) (191),(int) (191),(int) (191)),(int) (50));
 //BA.debugLineNum = 811;BA.debugLine="For Each v1 As View In pnlcircle.GetAllViewsRecur";
_v1 = new anywheresoftware.b4a.objects.ConcreteViewWrapper();
final anywheresoftware.b4a.BA.IterableList group10 = mostCurrent._pnlcircle.GetAllViewsRecursive();
final int groupLen10 = group10.getSize();
for (int index10 = 0;index10 < groupLen10 ;index10++){
_v1.setObject((android.view.View)(group10.Get(index10)));
 //BA.debugLineNum = 812;BA.debugLine="Dim p2 As Panel";
_p2 = new anywheresoftware.b4a.objects.PanelWrapper();
 //BA.debugLineNum = 813;BA.debugLine="p2 = v1";
_p2.setObject((android.view.ViewGroup)(_v1.getObject()));
 //BA.debugLineNum = 814;BA.debugLine="p2.Background = c2";
_p2.setBackground((android.graphics.drawable.Drawable)(_c2.getObject()));
 }
;
 //BA.debugLineNum = 817;BA.debugLine="p1.Background = c1";
_p1.setBackground((android.graphics.drawable.Drawable)(_c1.getObject()));
 //BA.debugLineNum = 819;BA.debugLine="End Sub";
return "";
}
public static String  _exitapplications() throws Exception{
 //BA.debugLineNum = 1289;BA.debugLine="Sub ExitApplications";
 //BA.debugLineNum = 1290;BA.debugLine="Activity.Finish";
mostCurrent._activity.Finish();
 //BA.debugLineNum = 1291;BA.debugLine="End Sub";
return "";
}
public static String  _featureproduct_receive(anywheresoftware.b4a.objects.collections.List _res,String _category) throws Exception{
anywheresoftware.b4a.objects.ConcreteViewWrapper _v = null;
 //BA.debugLineNum = 346;BA.debugLine="Sub FeatureProduct_receive(res As List,category As";
 //BA.debugLineNum = 348;BA.debugLine="If Library.FeatureProduct.IsInitialized = False T";
if (mostCurrent._library._featureproduct.IsInitialized()==anywheresoftware.b4a.keywords.Common.False) { 
 //BA.debugLineNum = 349;BA.debugLine="Library.FeatureProduct.Initialize";
mostCurrent._library._featureproduct.Initialize();
 //BA.debugLineNum = 350;BA.debugLine="Library.FeatureProduct = res";
mostCurrent._library._featureproduct = _res;
 };
 //BA.debugLineNum = 353;BA.debugLine="Library.FeatureProduct = res";
mostCurrent._library._featureproduct = _res;
 //BA.debugLineNum = 355;BA.debugLine="If res.Size > 0 Then";
if (_res.getSize()>0) { 
 //BA.debugLineNum = 356;BA.debugLine="topSV = AddHeader(Library.GetStringResourse(\"fea";
_topsv = _addheader(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"featureproduct"),"featureproduct",_topsv);
 //BA.debugLineNum = 357;BA.debugLine="svhFeatureProduct.Initialize(0,\"\")";
mostCurrent._svhfeatureproduct.Initialize(mostCurrent.activityBA,(int) (0),"");
 //BA.debugLineNum = 358;BA.debugLine="sv1.Panel.AddView(svhFeatureProduct,0,topSV,sv1.";
mostCurrent._sv1.getPanel().AddView((android.view.View)(mostCurrent._svhfeatureproduct.getObject()),(int) (0),_topsv,mostCurrent._sv1.getWidth(),anywheresoftware.b4a.keywords.Common.DipToCurrent((int) (190)));
 //BA.debugLineNum = 359;BA.debugLine="topSV = topSV + Library.LoadProductHorizontalScr";
_topsv = (int) (_topsv+mostCurrent._library._loadproducthorizontalscroll(mostCurrent.activityBA,mostCurrent._library._featureproduct,mostCurrent._svhfeatureproduct)+anywheresoftware.b4a.keywords.Common.DipToCurrent((int) (70)));
 //BA.debugLineNum = 361;BA.debugLine="Dim v As View";
_v = new anywheresoftware.b4a.objects.ConcreteViewWrapper();
 //BA.debugLineNum = 362;BA.debugLine="v = svhFeatureProduct.Panel.GetView(0)";
_v = mostCurrent._svhfeatureproduct.getPanel().GetView((int) (0));
 //BA.debugLineNum = 363;BA.debugLine="v.Top = 0";
_v.setTop((int) (0));
 };
 //BA.debugLineNum = 367;BA.debugLine="sv1.Panel.Height = sv1.Panel.Height + 180dip";
mostCurrent._sv1.getPanel().setHeight((int) (mostCurrent._sv1.getPanel().getHeight()+anywheresoftware.b4a.keywords.Common.DipToCurrent((int) (180))));
 //BA.debugLineNum = 369;BA.debugLine="If isOffline = False Then";
if (_isoffline==anywheresoftware.b4a.keywords.Common.False) { 
 //BA.debugLineNum = 370;BA.debugLine="BestProduct.GetSpecialProduct(\"bestsellers\",Fals";
mostCurrent._bestproduct._getspecialproduct("bestsellers",anywheresoftware.b4a.keywords.Common.False,mostCurrent._library._getlimitloaditem(mostCurrent.activityBA),actmenu.getObject(),"bestproduct_receive");
 };
 //BA.debugLineNum = 373;BA.debugLine="End Sub";
return "";
}
public static String  _getcart() throws Exception{
com.apps.demo.opencart _cart = null;
 //BA.debugLineNum = 1209;BA.debugLine="Sub GetCart";
 //BA.debugLineNum = 1210;BA.debugLine="Dim cart As OpenCart";
_cart = new com.apps.demo.opencart();
 //BA.debugLineNum = 1211;BA.debugLine="cart.Initialize";
_cart._initialize(processBA);
 //BA.debugLineNum = 1212;BA.debugLine="cart.GetCarts(Me,\"Carts_receive\")";
_cart._getcarts(actmenu.getObject(),"Carts_receive");
 //BA.debugLineNum = 1213;BA.debugLine="End Sub";
return "";
}
public static String  _getonlybanner_receive(anywheresoftware.b4a.objects.collections.List _data,String _id) throws Exception{
String _sid = "";
anywheresoftware.b4a.objects.HorizontalScrollViewWrapper _sv = null;
int _left = 0;
int _svheight = 0;
anywheresoftware.b4a.objects.collections.Map _coll = null;
int _i = 0;
anywheresoftware.b4a.objects.collections.Map _d1 = null;
String _url = "";
String _tag = "";
anywheresoftware.b4a.objects.collections.List _cache = null;
com.apps.demo.opencart _op = null;
 //BA.debugLineNum = 1007;BA.debugLine="Sub GetOnlyBanner_Receive(Data As List,ID As Strin";
 //BA.debugLineNum = 1009;BA.debugLine="If Data = Null Then";
if (_data== null) { 
 //BA.debugLineNum = 1010;BA.debugLine="Return";
if (true) return "";
 };
 //BA.debugLineNum = 1013;BA.debugLine="If Data.IsInitialized = False Then";
if (_data.IsInitialized()==anywheresoftware.b4a.keywords.Common.False) { 
 //BA.debugLineNum = 1014;BA.debugLine="Return";
if (true) return "";
 };
 //BA.debugLineNum = 1017;BA.debugLine="Dim sID As String";
_sid = "";
 //BA.debugLineNum = 1018;BA.debugLine="sID = ListBannerLoaded.Get(OffsetBannerLoaded)";
_sid = BA.ObjectToString(mostCurrent._listbannerloaded.Get(_offsetbannerloaded));
 //BA.debugLineNum = 1020;BA.debugLine="Library.CacheSystem.AddList2Cache(\"banner\" & sID,";
mostCurrent._library._cachesystem._addlist2cache("banner"+_sid,_data,"banner_info");
 //BA.debugLineNum = 1022;BA.debugLine="Dim sv As HorizontalScrollView";
_sv = new anywheresoftware.b4a.objects.HorizontalScrollViewWrapper();
 //BA.debugLineNum = 1024;BA.debugLine="sv = BannerScrollView.Get(sID)";
_sv.setObject((android.widget.HorizontalScrollView)(mostCurrent._bannerscrollview.Get((Object)(_sid))));
 //BA.debugLineNum = 1026;BA.debugLine="sv.Panel.RemoveAllViews";
_sv.getPanel().RemoveAllViews();
 //BA.debugLineNum = 1028;BA.debugLine="Dim left,svHeight As Int";
_left = 0;
_svheight = 0;
 //BA.debugLineNum = 1029;BA.debugLine="left = 10";
_left = (int) (10);
 //BA.debugLineNum = 1030;BA.debugLine="svHeight = sv.Height";
_svheight = _sv.getHeight();
 //BA.debugLineNum = 1032;BA.debugLine="Dim coll As Map";
_coll = new anywheresoftware.b4a.objects.collections.Map();
 //BA.debugLineNum = 1033;BA.debugLine="coll.Initialize";
_coll.Initialize();
 //BA.debugLineNum = 1035;BA.debugLine="For i = 0 To Data.Size - 1";
{
final int step18 = 1;
final int limit18 = (int) (_data.getSize()-1);
for (_i = (int) (0) ; (step18 > 0 && _i <= limit18) || (step18 < 0 && _i >= limit18); _i = ((int)(0 + _i + step18)) ) {
 //BA.debugLineNum = 1037;BA.debugLine="Dim d1 As Map";
_d1 = new anywheresoftware.b4a.objects.collections.Map();
 //BA.debugLineNum = 1038;BA.debugLine="d1 = Data.Get(i)";
_d1.setObject((anywheresoftware.b4a.objects.collections.Map.MyMap)(_data.Get(_i)));
 //BA.debugLineNum = 1040;BA.debugLine="Dim imgbannerid As ImageView";
mostCurrent._imgbannerid = new anywheresoftware.b4a.objects.ImageViewWrapper();
 //BA.debugLineNum = 1041;BA.debugLine="imgbannerid.Initialize(\"imgbannerid\")";
mostCurrent._imgbannerid.Initialize(mostCurrent.activityBA,"imgbannerid");
 //BA.debugLineNum = 1043;BA.debugLine="imgbannerid.Tag = d1.Get(\"link\")";
mostCurrent._imgbannerid.setTag(_d1.Get((Object)("link")));
 //BA.debugLineNum = 1045;BA.debugLine="Dim url As String";
_url = "";
 //BA.debugLineNum = 1046;BA.debugLine="url = d1.Get(\"image\")";
_url = BA.ObjectToString(_d1.Get((Object)("image")));
 //BA.debugLineNum = 1047;BA.debugLine="url = url.Replace(\" \",\"%20\")";
_url = _url.replace(" ","%20");
 //BA.debugLineNum = 1049;BA.debugLine="Dim tag As String";
_tag = "";
 //BA.debugLineNum = 1050;BA.debugLine="tag = sv.Tag";
_tag = BA.ObjectToString(_sv.getTag());
 //BA.debugLineNum = 1052;BA.debugLine="If tag = \"rect\" Then";
if ((_tag).equals("rect")) { 
 //BA.debugLineNum = 1053;BA.debugLine="sv.Panel.AddView(imgbannerid,left,0,Activity.Wi";
_sv.getPanel().AddView((android.view.View)(mostCurrent._imgbannerid.getObject()),_left,(int) (0),mostCurrent._activity.getWidth(),_sv.getHeight());
 //BA.debugLineNum = 1054;BA.debugLine="left = left + Activity.Width";
_left = (int) (_left+mostCurrent._activity.getWidth());
 //BA.debugLineNum = 1055;BA.debugLine="Glide.Load(url).AsBitmap.Resize(Abs(imgbannerid";
mostCurrent._glide.Load((Object)(_url)).AsBitmap().Resize((int) (anywheresoftware.b4a.keywords.Common.Abs(mostCurrent._imgbannerid.getWidth())),(int) (anywheresoftware.b4a.keywords.Common.Abs(mostCurrent._imgbannerid.getHeight()))).CenterCrop().IntoImageView(mostCurrent._imgbannerid);
 }else {
 //BA.debugLineNum = 1058;BA.debugLine="If Activity.Height > Activity.Width Then";
if (mostCurrent._activity.getHeight()>mostCurrent._activity.getWidth()) { 
 //BA.debugLineNum = 1059;BA.debugLine="sv.Panel.AddView(imgbannerid,left,0,svHeight,s";
_sv.getPanel().AddView((android.view.View)(mostCurrent._imgbannerid.getObject()),_left,(int) (0),_svheight,_svheight);
 }else {
 //BA.debugLineNum = 1061;BA.debugLine="sv.Panel.AddView(imgbannerid,left,0,sv.Width/2";
_sv.getPanel().AddView((android.view.View)(mostCurrent._imgbannerid.getObject()),_left,(int) (0),(int) (_sv.getWidth()/(double)2.7),_svheight);
 };
 //BA.debugLineNum = 1064;BA.debugLine="Glide.Load(url).AsBitmap.Resize(Abs(imgbannerid";
mostCurrent._glide.Load((Object)(_url)).AsBitmap().Resize((int) (anywheresoftware.b4a.keywords.Common.Abs(mostCurrent._imgbannerid.getWidth())),(int) (anywheresoftware.b4a.keywords.Common.Abs(mostCurrent._imgbannerid.getHeight()))).FitCenter().IntoImageView(mostCurrent._imgbannerid);
 //BA.debugLineNum = 1066;BA.debugLine="left = left + imgbannerid.Width + 5dip";
_left = (int) (_left+mostCurrent._imgbannerid.getWidth()+anywheresoftware.b4a.keywords.Common.DipToCurrent((int) (5)));
 };
 //BA.debugLineNum = 1070;BA.debugLine="ImageViewList.Put(url,imgbannerid)";
mostCurrent._imageviewlist.Put((Object)(_url),(Object)(mostCurrent._imgbannerid.getObject()));
 }
};
 //BA.debugLineNum = 1074;BA.debugLine="sv.Panel.Width = left";
_sv.getPanel().setWidth(_left);
 //BA.debugLineNum = 1075;BA.debugLine="sv.ScrollPosition = sv.Panel.Width / 2";
_sv.setScrollPosition((int) (_sv.getPanel().getWidth()/(double)2));
 //BA.debugLineNum = 1076;BA.debugLine="DoEvents";
anywheresoftware.b4a.keywords.Common.DoEvents();
 //BA.debugLineNum = 1078;BA.debugLine="OffsetBannerLoaded = OffsetBannerLoaded + 1";
_offsetbannerloaded = (int) (_offsetbannerloaded+1);
 //BA.debugLineNum = 1080;BA.debugLine="If OffsetBannerLoaded > ListBannerLoaded.Size-1 T";
if (_offsetbannerloaded>mostCurrent._listbannerloaded.getSize()-1) { 
 //BA.debugLineNum = 1081;BA.debugLine="Return";
if (true) return "";
 }else {
 //BA.debugLineNum = 1083;BA.debugLine="If Library.CacheSystem.ExistID(\"banner\" & ListBa";
if (mostCurrent._library._cachesystem._existid("banner"+BA.ObjectToString(mostCurrent._listbannerloaded.Get(_offsetbannerloaded)),"banner_info")) { 
 //BA.debugLineNum = 1084;BA.debugLine="Dim cache As List";
_cache = new anywheresoftware.b4a.objects.collections.List();
 //BA.debugLineNum = 1085;BA.debugLine="cache = Library.CacheSystem.GetCacheAsList(\"ban";
_cache = mostCurrent._library._cachesystem._getcacheaslist("banner"+BA.ObjectToString(mostCurrent._listbannerloaded.Get(_offsetbannerloaded)),"banner_info");
 //BA.debugLineNum = 1086;BA.debugLine="GetOnlyBanner_Receive(cache,ListBannerLoaded.Ge";
_getonlybanner_receive(_cache,BA.ObjectToString(mostCurrent._listbannerloaded.Get(_offsetbannerloaded)));
 }else {
 //BA.debugLineNum = 1088;BA.debugLine="Dim op As OpenCart";
_op = new com.apps.demo.opencart();
 //BA.debugLineNum = 1089;BA.debugLine="op.Initialize";
_op._initialize(processBA);
 //BA.debugLineNum = 1090;BA.debugLine="op.Banner(Me,\"GetOnlyBanner_Receive\",ListBanner";
_op._banner(actmenu.getObject(),"GetOnlyBanner_Receive",BA.ObjectToString(mostCurrent._listbannerloaded.Get(_offsetbannerloaded)));
 };
 };
 //BA.debugLineNum = 1094;BA.debugLine="End Sub";
return "";
}
public static String  _globals() throws Exception{
 //BA.debugLineNum = 11;BA.debugLine="Sub Globals";
 //BA.debugLineNum = 12;BA.debugLine="Private pnlmenuinapp As Panel";
mostCurrent._pnlmenuinapp = new anywheresoftware.b4a.objects.PanelWrapper();
 //BA.debugLineNum = 13;BA.debugLine="Private Glide As AriaGlide";
mostCurrent._glide = new ariagp.amin.shahedi.AriaGlideWrapper();
 //BA.debugLineNum = 14;BA.debugLine="Private ScollButton As Button";
mostCurrent._scollbutton = new anywheresoftware.b4a.objects.ButtonWrapper();
 //BA.debugLineNum = 15;BA.debugLine="Private isOffline As Boolean";
_isoffline = false;
 //BA.debugLineNum = 16;BA.debugLine="Private svhNewProduct,svhFeatureProduct,svhBestPr";
mostCurrent._svhnewproduct = new anywheresoftware.b4a.objects.HorizontalScrollViewWrapper();
mostCurrent._svhfeatureproduct = new anywheresoftware.b4a.objects.HorizontalScrollViewWrapper();
mostCurrent._svhbestproduct = new anywheresoftware.b4a.objects.HorizontalScrollViewWrapper();
mostCurrent._svhspecialproduct = new anywheresoftware.b4a.objects.HorizontalScrollViewWrapper();
 //BA.debugLineNum = 17;BA.debugLine="Private sv1 As ScrollView";
mostCurrent._sv1 = new anywheresoftware.b4a.objects.ScrollViewWrapper();
 //BA.debugLineNum = 18;BA.debugLine="Private lbltitle As Label";
mostCurrent._lbltitle = new anywheresoftware.b4a.objects.LabelWrapper();
 //BA.debugLineNum = 19;BA.debugLine="Private btnbasket As Button";
mostCurrent._btnbasket = new anywheresoftware.b4a.objects.ButtonWrapper();
 //BA.debugLineNum = 20;BA.debugLine="Private lblheadername As Label";
mostCurrent._lblheadername = new anywheresoftware.b4a.objects.LabelWrapper();
 //BA.debugLineNum = 21;BA.debugLine="Private lblnext As Label";
mostCurrent._lblnext = new anywheresoftware.b4a.objects.LabelWrapper();
 //BA.debugLineNum = 23;BA.debugLine="Dim FeatureProduct,NewProduct,BestProduct,Slidesh";
mostCurrent._featureproduct = new com.apps.demo.opencart();
mostCurrent._newproduct = new com.apps.demo.opencart();
mostCurrent._bestproduct = new com.apps.demo.opencart();
mostCurrent._slideshow = new com.apps.demo.opencart();
mostCurrent._opmanufacturers = new com.apps.demo.opencart();
mostCurrent._opspecialproduct = new com.apps.demo.opencart();
 //BA.debugLineNum = 24;BA.debugLine="Private pnlheader As Panel";
mostCurrent._pnlheader = new anywheresoftware.b4a.objects.PanelWrapper();
 //BA.debugLineNum = 26;BA.debugLine="Private offsetSlideshow As Int = 0";
_offsetslideshow = (int) (0);
 //BA.debugLineNum = 28;BA.debugLine="Private lblslidetitle As Label";
mostCurrent._lblslidetitle = new anywheresoftware.b4a.objects.LabelWrapper();
 //BA.debugLineNum = 30;BA.debugLine="Private pnlheadert As Panel";
mostCurrent._pnlheadert = new anywheresoftware.b4a.objects.PanelWrapper();
 //BA.debugLineNum = 31;BA.debugLine="Private pnlheaderproduct As Panel";
mostCurrent._pnlheaderproduct = new anywheresoftware.b4a.objects.PanelWrapper();
 //BA.debugLineNum = 33;BA.debugLine="Private pnlloading As Panel";
mostCurrent._pnlloading = new anywheresoftware.b4a.objects.PanelWrapper();
 //BA.debugLineNum = 34;BA.debugLine="Private SlideMenu As SlideMenu";
mostCurrent._slidemenu = new com.apps.demo.slidemenu();
 //BA.debugLineNum = 36;BA.debugLine="Private lblpb As Label";
mostCurrent._lblpb = new anywheresoftware.b4a.objects.LabelWrapper();
 //BA.debugLineNum = 38;BA.debugLine="Private pnlads As Panel";
mostCurrent._pnlads = new anywheresoftware.b4a.objects.PanelWrapper();
 //BA.debugLineNum = 40;BA.debugLine="Private pbslideshow As ProgressBar";
mostCurrent._pbslideshow = new anywheresoftware.b4a.objects.ProgressBarWrapper();
 //BA.debugLineNum = 41;BA.debugLine="Private pnloverheader As Panel";
mostCurrent._pnloverheader = new anywheresoftware.b4a.objects.PanelWrapper();
 //BA.debugLineNum = 42;BA.debugLine="Private lblbasket As Label";
mostCurrent._lblbasket = new anywheresoftware.b4a.objects.LabelWrapper();
 //BA.debugLineNum = 43;BA.debugLine="Dim slidepanel1 As AHPageContainer";
mostCurrent._slidepanel1 = new de.amberhome.viewpager.PageContainerAdapter();
 //BA.debugLineNum = 44;BA.debugLine="Dim slidepanelPage As AHViewPager";
mostCurrent._slidepanelpage = new de.amberhome.viewpager.ViewPagerWrapper();
 //BA.debugLineNum = 46;BA.debugLine="Private pnlcircle As Panel";
mostCurrent._pnlcircle = new anywheresoftware.b4a.objects.PanelWrapper();
 //BA.debugLineNum = 47;BA.debugLine="Private bullet As List";
mostCurrent._bullet = new anywheresoftware.b4a.objects.collections.List();
 //BA.debugLineNum = 49;BA.debugLine="Dim svH As HorizontalScrollView";
mostCurrent._svh = new anywheresoftware.b4a.objects.HorizontalScrollViewWrapper();
 //BA.debugLineNum = 50;BA.debugLine="Dim MyToastMessageShow As MyToastMessageShow";
mostCurrent._mytoastmessageshow = new com.apps.demo.mytoastmessageshow();
 //BA.debugLineNum = 53;BA.debugLine="Private btnsearch As Button";
mostCurrent._btnsearch = new anywheresoftware.b4a.objects.ButtonWrapper();
 //BA.debugLineNum = 54;BA.debugLine="Private btnmenu As Button";
mostCurrent._btnmenu = new anywheresoftware.b4a.objects.ButtonWrapper();
 //BA.debugLineNum = 56;BA.debugLine="Private TipTag As String";
mostCurrent._tiptag = "";
 //BA.debugLineNum = 57;BA.debugLine="Dim titleHelp As String";
mostCurrent._titlehelp = "";
 //BA.debugLineNum = 58;BA.debugLine="Dim btncat As Button";
mostCurrent._btncat = new anywheresoftware.b4a.objects.ButtonWrapper();
 //BA.debugLineNum = 60;BA.debugLine="Private BannerScrollView As Map";
mostCurrent._bannerscrollview = new anywheresoftware.b4a.objects.collections.Map();
 //BA.debugLineNum = 62;BA.debugLine="Private imgbannerid As ImageView";
mostCurrent._imgbannerid = new anywheresoftware.b4a.objects.ImageViewWrapper();
 //BA.debugLineNum = 63;BA.debugLine="Private OffsetBannerLoaded As Int";
_offsetbannerloaded = 0;
 //BA.debugLineNum = 64;BA.debugLine="Private ListBannerLoaded As List";
mostCurrent._listbannerloaded = new anywheresoftware.b4a.objects.collections.List();
 //BA.debugLineNum = 65;BA.debugLine="Private isOffline As Boolean";
_isoffline = false;
 //BA.debugLineNum = 67;BA.debugLine="Private pbloading As ProgressBar";
mostCurrent._pbloading = new anywheresoftware.b4a.objects.ProgressBarWrapper();
 //BA.debugLineNum = 68;BA.debugLine="Private ImageViewList As Map";
mostCurrent._imageviewlist = new anywheresoftware.b4a.objects.collections.Map();
 //BA.debugLineNum = 70;BA.debugLine="End Sub";
return "";
}
public static String  _imgads_click() throws Exception{
anywheresoftware.b4a.objects.ImageViewWrapper _im = null;
anywheresoftware.b4a.objects.collections.Map _te = null;
 //BA.debugLineNum = 753;BA.debugLine="Sub imgads_Click";
 //BA.debugLineNum = 755;BA.debugLine="Dim im As ImageView";
_im = new anywheresoftware.b4a.objects.ImageViewWrapper();
 //BA.debugLineNum = 756;BA.debugLine="im = Sender";
_im.setObject((android.widget.ImageView)(anywheresoftware.b4a.keywords.Common.Sender(mostCurrent.activityBA)));
 //BA.debugLineNum = 758;BA.debugLine="If im.Tag Is Map Then";
if (_im.getTag() instanceof anywheresoftware.b4a.objects.collections.Map.MyMap) { 
 //BA.debugLineNum = 759;BA.debugLine="Dim te As Map";
_te = new anywheresoftware.b4a.objects.collections.Map();
 //BA.debugLineNum = 760;BA.debugLine="te = im.Tag";
_te.setObject((anywheresoftware.b4a.objects.collections.Map.MyMap)(_im.getTag()));
 //BA.debugLineNum = 761;BA.debugLine="ShowSlideContent(te)";
_showslidecontent(_te);
 };
 //BA.debugLineNum = 764;BA.debugLine="End Sub";
return "";
}
public static String  _imgbannerid_click() throws Exception{
anywheresoftware.b4a.objects.ImageViewWrapper _img = null;
 //BA.debugLineNum = 1324;BA.debugLine="Sub imgbannerid_Click";
 //BA.debugLineNum = 1326;BA.debugLine="Dim img As ImageView";
_img = new anywheresoftware.b4a.objects.ImageViewWrapper();
 //BA.debugLineNum = 1327;BA.debugLine="img = Sender";
_img.setObject((android.widget.ImageView)(anywheresoftware.b4a.keywords.Common.Sender(mostCurrent.activityBA)));
 //BA.debugLineNum = 1329;BA.debugLine="ShowSlideContent(CreateMap(\"link\":img.Tag))";
_showslidecontent(anywheresoftware.b4a.keywords.Common.createMap(new Object[] {(Object)("link"),_img.getTag()}));
 //BA.debugLineNum = 1331;BA.debugLine="End Sub";
return "";
}
public static String  _imgmanufacturers_click() throws Exception{
anywheresoftware.b4a.objects.ImageViewWrapper _im = null;
anywheresoftware.b4a.objects.collections.List _res = null;
com.apps.demo.opencart _op = null;
 //BA.debugLineNum = 1253;BA.debugLine="Sub imgmanufacturers_Click";
 //BA.debugLineNum = 1255;BA.debugLine="Dim im As ImageView";
_im = new anywheresoftware.b4a.objects.ImageViewWrapper();
 //BA.debugLineNum = 1256;BA.debugLine="im = Sender";
_im.setObject((android.widget.ImageView)(anywheresoftware.b4a.keywords.Common.Sender(mostCurrent.activityBA)));
 //BA.debugLineNum = 1258;BA.debugLine="If im.Tag = Null Or im.Tag = \"\" Then Return";
if (_im.getTag()== null || (_im.getTag()).equals((Object)(""))) { 
if (true) return "";};
 //BA.debugLineNum = 1260;BA.debugLine="Try";
try { //BA.debugLineNum = 1262;BA.debugLine="Dim res As List";
_res = new anywheresoftware.b4a.objects.collections.List();
 //BA.debugLineNum = 1263;BA.debugLine="res = Library.CacheSystem.GetCacheAsList(\"produc";
_res = mostCurrent._library._cachesystem._getcacheaslist("products/manufacturer/"+BA.ObjectToString(_im.getTag()),"information");
 //BA.debugLineNum = 1265;BA.debugLine="If res.IsInitialized Then";
if (_res.IsInitialized()) { 
 //BA.debugLineNum = 1266;BA.debugLine="If res.Size > 0 Then";
if (_res.getSize()>0) { 
 //BA.debugLineNum = 1267;BA.debugLine="actProducts.title = Library.GetStringResourse(";
mostCurrent._actproducts._title = mostCurrent._library._getstringresourse(mostCurrent.activityBA,"relat_product");
 //BA.debugLineNum = 1268;BA.debugLine="StartActivity(actProducts)";
anywheresoftware.b4a.keywords.Common.StartActivity(mostCurrent.activityBA,(Object)(mostCurrent._actproducts.getObject()));
 //BA.debugLineNum = 1269;BA.debugLine="Return";
if (true) return "";
 };
 };
 //BA.debugLineNum = 1273;BA.debugLine="pnlloading.SetVisibleAnimated(500,True)";
mostCurrent._pnlloading.SetVisibleAnimated((int) (500),anywheresoftware.b4a.keywords.Common.True);
 //BA.debugLineNum = 1275;BA.debugLine="Dim op As OpenCart";
_op = new com.apps.demo.opencart();
 //BA.debugLineNum = 1276;BA.debugLine="op.Initialize";
_op._initialize(processBA);
 //BA.debugLineNum = 1277;BA.debugLine="op.GetmanufactureProduct(im.Tag,Me,\"AllProduct_r";
_op._getmanufactureproduct(BA.ObjectToString(_im.getTag()),actmenu.getObject(),"AllProduct_receive");
 } 
       catch (Exception e19) {
			processBA.setLastException(e19); };
 //BA.debugLineNum = 1282;BA.debugLine="End Sub";
return "";
}
public static String  _loadmanufacturers(anywheresoftware.b4a.objects.collections.List _res) throws Exception{
int _left = 0;
anywheresoftware.b4a.objects.drawable.BitmapDrawable _error_image = null;
boolean _cache_state = false;
int _i = 0;
anywheresoftware.b4a.objects.collections.Map _temp = null;
anywheresoftware.b4a.objects.ImageViewWrapper _img = null;
String _spath = "";
 //BA.debugLineNum = 561;BA.debugLine="Sub LoadManufacturers(res As List)";
 //BA.debugLineNum = 563;BA.debugLine="If res.Size > 0 Then";
if (_res.getSize()>0) { 
 //BA.debugLineNum = 565;BA.debugLine="If svH.IsInitialized Then";
if (mostCurrent._svh.IsInitialized()) { 
 //BA.debugLineNum = 566;BA.debugLine="If svH.Panel.NumberOfViews > 0 Then Return";
if (mostCurrent._svh.getPanel().getNumberOfViews()>0) { 
if (true) return "";};
 };
 //BA.debugLineNum = 569;BA.debugLine="topSV = AddHeader(Library.GetStringResourse(\"man";
_topsv = _addheader(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"manufacture"),"manufacture",_topsv);
 //BA.debugLineNum = 571;BA.debugLine="If Library.GetDevicePhysicalSize < 7 Then";
if (mostCurrent._library._getdevicephysicalsize(mostCurrent.activityBA)<7) { 
 //BA.debugLineNum = 572;BA.debugLine="svH.Initialize(res.Size * 83dip + 20dip,\"svH\")";
mostCurrent._svh.Initialize(mostCurrent.activityBA,(int) (_res.getSize()*anywheresoftware.b4a.keywords.Common.DipToCurrent((int) (83))+anywheresoftware.b4a.keywords.Common.DipToCurrent((int) (20))),"svH");
 //BA.debugLineNum = 573;BA.debugLine="sv1.Panel.AddView(svH,0,topSV,sv1.Width,75dip)";
mostCurrent._sv1.getPanel().AddView((android.view.View)(mostCurrent._svh.getObject()),(int) (0),_topsv,mostCurrent._sv1.getWidth(),anywheresoftware.b4a.keywords.Common.DipToCurrent((int) (75)));
 }else {
 //BA.debugLineNum = 575;BA.debugLine="svH.Initialize(res.Size * 170dip + 20dip,\"svH\")";
mostCurrent._svh.Initialize(mostCurrent.activityBA,(int) (_res.getSize()*anywheresoftware.b4a.keywords.Common.DipToCurrent((int) (170))+anywheresoftware.b4a.keywords.Common.DipToCurrent((int) (20))),"svH");
 //BA.debugLineNum = 576;BA.debugLine="sv1.Panel.AddView(svH,0,topSV,sv1.Width,155dip)";
mostCurrent._sv1.getPanel().AddView((android.view.View)(mostCurrent._svh.getObject()),(int) (0),_topsv,mostCurrent._sv1.getWidth(),anywheresoftware.b4a.keywords.Common.DipToCurrent((int) (155)));
 };
 //BA.debugLineNum = 579;BA.debugLine="svH.Panel.Color = Colors.White";
mostCurrent._svh.getPanel().setColor(anywheresoftware.b4a.keywords.Common.Colors.White);
 //BA.debugLineNum = 581;BA.debugLine="topSV = topSV + svH.Height";
_topsv = (int) (_topsv+mostCurrent._svh.getHeight());
 //BA.debugLineNum = 583;BA.debugLine="Dim left As Int = 0";
_left = (int) (0);
 //BA.debugLineNum = 584;BA.debugLine="Dim error_image As BitmapDrawable";
_error_image = new anywheresoftware.b4a.objects.drawable.BitmapDrawable();
 //BA.debugLineNum = 585;BA.debugLine="error_image.Initialize(LoadBitmap(File.DirAssets";
_error_image.Initialize((android.graphics.Bitmap)(anywheresoftware.b4a.keywords.Common.LoadBitmap(anywheresoftware.b4a.keywords.Common.File.getDirAssets(),"noimage.png").getObject()));
 //BA.debugLineNum = 587;BA.debugLine="Dim cache_state As Boolean = Library.manager.Get";
_cache_state = mostCurrent._library._manager.GetBoolean("cache");
 //BA.debugLineNum = 589;BA.debugLine="For i = 0 To res.Size - 1";
{
final int step19 = 1;
final int limit19 = (int) (_res.getSize()-1);
for (_i = (int) (0) ; (step19 > 0 && _i <= limit19) || (step19 < 0 && _i >= limit19); _i = ((int)(0 + _i + step19)) ) {
 //BA.debugLineNum = 591;BA.debugLine="Dim temp As Map";
_temp = new anywheresoftware.b4a.objects.collections.Map();
 //BA.debugLineNum = 592;BA.debugLine="temp = res.Get(i)";
_temp.setObject((anywheresoftware.b4a.objects.collections.Map.MyMap)(_res.Get(_i)));
 //BA.debugLineNum = 594;BA.debugLine="Dim img As ImageView";
_img = new anywheresoftware.b4a.objects.ImageViewWrapper();
 //BA.debugLineNum = 595;BA.debugLine="img.Initialize(\"imgmanufacturers\")";
_img.Initialize(mostCurrent.activityBA,"imgmanufacturers");
 //BA.debugLineNum = 597;BA.debugLine="svH.Panel.AddView(img,left,10,svH.Height-10dip,";
mostCurrent._svh.getPanel().AddView((android.view.View)(_img.getObject()),_left,(int) (10),(int) (mostCurrent._svh.getHeight()-anywheresoftware.b4a.keywords.Common.DipToCurrent((int) (10))),(int) (mostCurrent._svh.getHeight()-anywheresoftware.b4a.keywords.Common.DipToCurrent((int) (10))));
 //BA.debugLineNum = 598;BA.debugLine="left = left + svH.Height + 10dip";
_left = (int) (_left+mostCurrent._svh.getHeight()+anywheresoftware.b4a.keywords.Common.DipToCurrent((int) (10)));
 //BA.debugLineNum = 600;BA.debugLine="Dim sPath As String";
_spath = "";
 //BA.debugLineNum = 601;BA.debugLine="sPath = temp.Get(\"image\")";
_spath = BA.ObjectToString(_temp.Get((Object)("image")));
 //BA.debugLineNum = 602;BA.debugLine="sPath = sPath.Replace(\" \",\"%20\")";
_spath = _spath.replace(" ","%20");
 //BA.debugLineNum = 604;BA.debugLine="Glide.Load(sPath).AsBitmap.Error(error_image.Bi";
mostCurrent._glide.Load((Object)(_spath)).AsBitmap().Error(_error_image.getBitmap()).Resize((int) (anywheresoftware.b4a.keywords.Common.Abs(_img.getWidth())),(int) (anywheresoftware.b4a.keywords.Common.Abs(_img.getHeight()))).CenterCrop().IntoImageView(_img);
 //BA.debugLineNum = 606;BA.debugLine="img.Tag = temp.Get(\"manufacturer_id\")";
_img.setTag(_temp.Get((Object)("manufacturer_id")));
 }
};
 //BA.debugLineNum = 610;BA.debugLine="topSV = topSV + 12dip";
_topsv = (int) (_topsv+anywheresoftware.b4a.keywords.Common.DipToCurrent((int) (12)));
 //BA.debugLineNum = 612;BA.debugLine="sv1.Panel.Height = topSV";
mostCurrent._sv1.getPanel().setHeight(_topsv);
 //BA.debugLineNum = 613;BA.debugLine="svH.Color = Colors.White";
mostCurrent._svh.setColor(anywheresoftware.b4a.keywords.Common.Colors.White);
 };
 //BA.debugLineNum = 617;BA.debugLine="If Library.FirstRun = True Then";
if (mostCurrent._library._firstrun==anywheresoftware.b4a.keywords.Common.True) { 
 //BA.debugLineNum = 619;BA.debugLine="If Library.phoneInfo.SdkVersion >= 21 Then";
if (mostCurrent._library._phoneinfo.getSdkVersion()>=21) { 
 //BA.debugLineNum = 620;BA.debugLine="titleHelp = Library.GetStringResourse(\"help\")";
mostCurrent._titlehelp = mostCurrent._library._getstringresourse(mostCurrent.activityBA,"help");
 //BA.debugLineNum = 622;BA.debugLine="TipTag = \"basket\"";
mostCurrent._tiptag = "basket";
 };
 };
 //BA.debugLineNum = 632;BA.debugLine="End Sub";
return "";
}
public static String  _loadproductsplit(String _pa) throws Exception{
com.apps.demo.opencart _op = null;
 //BA.debugLineNum = 1158;BA.debugLine="Sub LoadProductSplit(pa As String)";
 //BA.debugLineNum = 1160;BA.debugLine="Dim op As OpenCart";
_op = new com.apps.demo.opencart();
 //BA.debugLineNum = 1161;BA.debugLine="op.Initialize";
_op._initialize(processBA);
 //BA.debugLineNum = 1163;BA.debugLine="pnlloading.SetVisibleAnimated(500,True)";
mostCurrent._pnlloading.SetVisibleAnimated((int) (500),anywheresoftware.b4a.keywords.Common.True);
 //BA.debugLineNum = 1165;BA.debugLine="If pa = \"bestproduct\" Then";
if ((_pa).equals("bestproduct")) { 
 //BA.debugLineNum = 1166;BA.debugLine="op.GetSpecialProduct(\"bestsellers\",True,6,Me,\"al";
_op._getspecialproduct("bestsellers",anywheresoftware.b4a.keywords.Common.True,(int) (6),actmenu.getObject(),"allproduct_receive");
 }else if((_pa).equals("featureproduct")) { 
 //BA.debugLineNum = 1169;BA.debugLine="op.GetSpecialProduct(\"featured\",True,12,Me,\"AllP";
_op._getspecialproduct("featured",anywheresoftware.b4a.keywords.Common.True,(int) (12),actmenu.getObject(),"AllProduct_receive");
 }else if((_pa).equals("special")) { 
 //BA.debugLineNum = 1172;BA.debugLine="op.GetSpecialProduct(\"specials\",True,12,Me,\"AllP";
_op._getspecialproduct("specials",anywheresoftware.b4a.keywords.Common.True,(int) (12),actmenu.getObject(),"AllProduct_receive");
 }else if((_pa).equals("newproduct")) { 
 //BA.debugLineNum = 1175;BA.debugLine="op.GetSpecialProduct(\"latest\",True,12,Me,\"AllPro";
_op._getspecialproduct("latest",anywheresoftware.b4a.keywords.Common.True,(int) (12),actmenu.getObject(),"AllProduct_receive");
 };
 //BA.debugLineNum = 1179;BA.debugLine="End Sub";
return "";
}
public static String  _loadslideshow(anywheresoftware.b4a.objects.collections.List _res) throws Exception{
anywheresoftware.b4a.objects.collections.Map _im = null;
anywheresoftware.b4a.objects.collections.Map _firstslide = null;
anywheresoftware.b4a.objects.collections.List _tem = null;
anywheresoftware.b4a.objects.collections.Map _mdefault = null;
int _i = 0;
anywheresoftware.b4a.objects.PanelWrapper _p1 = null;
anywheresoftware.b4a.objects.collections.Map _m1 = null;
anywheresoftware.b4a.objects.ImageViewWrapper _im1 = null;
anywheresoftware.b4a.objects.LabelWrapper _lbl = null;
anywheresoftware.b4a.objects.drawable.ColorDrawable _c1 = null;
String _path = "";
 //BA.debugLineNum = 678;BA.debugLine="Sub LoadSlideshow(res As List)";
 //BA.debugLineNum = 680;BA.debugLine="Dim im,firstslide As Map";
_im = new anywheresoftware.b4a.objects.collections.Map();
_firstslide = new anywheresoftware.b4a.objects.collections.Map();
 //BA.debugLineNum = 681;BA.debugLine="im.Initialize";
_im.Initialize();
 //BA.debugLineNum = 683;BA.debugLine="slidepanel1.Initialize";
mostCurrent._slidepanel1.Initialize(mostCurrent.activityBA);
 //BA.debugLineNum = 685;BA.debugLine="If res = Null Then";
if (_res== null) { 
 //BA.debugLineNum = 686;BA.debugLine="Dim tem As List";
_tem = new anywheresoftware.b4a.objects.collections.List();
 //BA.debugLineNum = 687;BA.debugLine="tem.Initialize";
_tem.Initialize();
 //BA.debugLineNum = 688;BA.debugLine="res = tem";
_res = _tem;
 };
 //BA.debugLineNum = 691;BA.debugLine="If res.Size = 0 Then";
if (_res.getSize()==0) { 
 //BA.debugLineNum = 692;BA.debugLine="Dim mDefault As Map";
_mdefault = new anywheresoftware.b4a.objects.collections.Map();
 //BA.debugLineNum = 693;BA.debugLine="mDefault.Initialize";
_mdefault.Initialize();
 //BA.debugLineNum = 694;BA.debugLine="mDefault.Put(\"title\",Library.GetStringResourse(\"";
_mdefault.Put((Object)("title"),(Object)(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"app_title")));
 //BA.debugLineNum = 695;BA.debugLine="mDefault.Put(\"image\",Library.GetStringResourse(\"";
_mdefault.Put((Object)("image"),(Object)(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"url")+"/app/default_app_banner.jpg"));
 //BA.debugLineNum = 696;BA.debugLine="res.Add(mDefault)";
_res.Add((Object)(_mdefault.getObject()));
 };
 //BA.debugLineNum = 699;BA.debugLine="firstslide.Initialize";
_firstslide.Initialize();
 //BA.debugLineNum = 700;BA.debugLine="firstslide = res.Get(offsetSlideshow)";
_firstslide.setObject((anywheresoftware.b4a.objects.collections.Map.MyMap)(_res.Get(_offsetslideshow)));
 //BA.debugLineNum = 702;BA.debugLine="For i = 0 To res.Size - 1";
{
final int step18 = 1;
final int limit18 = (int) (_res.getSize()-1);
for (_i = (int) (0) ; (step18 > 0 && _i <= limit18) || (step18 < 0 && _i >= limit18); _i = ((int)(0 + _i + step18)) ) {
 //BA.debugLineNum = 704;BA.debugLine="Dim p1 As Panel";
_p1 = new anywheresoftware.b4a.objects.PanelWrapper();
 //BA.debugLineNum = 705;BA.debugLine="p1.Initialize(\"pnlImage\")";
_p1.Initialize(mostCurrent.activityBA,"pnlImage");
 //BA.debugLineNum = 706;BA.debugLine="slidepanel1.AddPage(p1,\"\")";
mostCurrent._slidepanel1.AddPage((android.view.View)(_p1.getObject()),"");
 //BA.debugLineNum = 707;BA.debugLine="DoEvents";
anywheresoftware.b4a.keywords.Common.DoEvents();
 //BA.debugLineNum = 709;BA.debugLine="Dim m1 As Map";
_m1 = new anywheresoftware.b4a.objects.collections.Map();
 //BA.debugLineNum = 710;BA.debugLine="m1 = res.Get(i)";
_m1.setObject((anywheresoftware.b4a.objects.collections.Map.MyMap)(_res.Get(_i)));
 //BA.debugLineNum = 712;BA.debugLine="Dim im1 As ImageView";
_im1 = new anywheresoftware.b4a.objects.ImageViewWrapper();
 //BA.debugLineNum = 713;BA.debugLine="im1.Initialize(\"imgads\")";
_im1.Initialize(mostCurrent.activityBA,"imgads");
 //BA.debugLineNum = 714;BA.debugLine="Library.imagesSlideshow.Add(im1)";
mostCurrent._library._imagesslideshow.Add((Object)(_im1.getObject()));
 //BA.debugLineNum = 716;BA.debugLine="p1.AddView(im1,0,0,pnlads.Width,pnlads.Height)";
_p1.AddView((android.view.View)(_im1.getObject()),(int) (0),(int) (0),mostCurrent._pnlads.getWidth(),mostCurrent._pnlads.getHeight());
 //BA.debugLineNum = 717;BA.debugLine="im1.Tag = m1";
_im1.setTag((Object)(_m1.getObject()));
 //BA.debugLineNum = 718;BA.debugLine="DoEvents";
anywheresoftware.b4a.keywords.Common.DoEvents();
 //BA.debugLineNum = 720;BA.debugLine="Dim lbl As Label";
_lbl = new anywheresoftware.b4a.objects.LabelWrapper();
 //BA.debugLineNum = 721;BA.debugLine="lbl.Initialize(\"\")";
_lbl.Initialize(mostCurrent.activityBA,"");
 //BA.debugLineNum = 722;BA.debugLine="lbl.Text = m1.Get(\"title\")";
_lbl.setText(BA.ObjectToCharSequence(_m1.Get((Object)("title"))));
 //BA.debugLineNum = 723;BA.debugLine="lbl.Typeface = Library.GetFont";
_lbl.setTypeface((android.graphics.Typeface)(mostCurrent._library._getfont(mostCurrent.activityBA).getObject()));
 //BA.debugLineNum = 724;BA.debugLine="lbl.TextSize = 17";
_lbl.setTextSize((float) (17));
 //BA.debugLineNum = 725;BA.debugLine="lbl.TextColor = Colors.Black";
_lbl.setTextColor(anywheresoftware.b4a.keywords.Common.Colors.Black);
 //BA.debugLineNum = 726;BA.debugLine="lbl.Gravity = Bit.Or(Gravity.CENTER,Gravity.CENT";
_lbl.setGravity(anywheresoftware.b4a.keywords.Common.Bit.Or(anywheresoftware.b4a.keywords.Common.Gravity.CENTER,anywheresoftware.b4a.keywords.Common.Gravity.CENTER_VERTICAL));
 //BA.debugLineNum = 728;BA.debugLine="Dim c1 As ColorDrawable";
_c1 = new anywheresoftware.b4a.objects.drawable.ColorDrawable();
 //BA.debugLineNum = 729;BA.debugLine="c1.Initialize(Colors.ARGB(50,255,255,255),0)";
_c1.Initialize(anywheresoftware.b4a.keywords.Common.Colors.ARGB((int) (50),(int) (255),(int) (255),(int) (255)),(int) (0));
 //BA.debugLineNum = 731;BA.debugLine="lbl.Background = c1";
_lbl.setBackground((android.graphics.drawable.Drawable)(_c1.getObject()));
 //BA.debugLineNum = 732;BA.debugLine="p1.AddView(lbl,0,pnlads.Height - 50dip,pnlads.Wi";
_p1.AddView((android.view.View)(_lbl.getObject()),(int) (0),(int) (mostCurrent._pnlads.getHeight()-anywheresoftware.b4a.keywords.Common.DipToCurrent((int) (50))),mostCurrent._pnlads.getWidth(),anywheresoftware.b4a.keywords.Common.DipToCurrent((int) (50)));
 //BA.debugLineNum = 734;BA.debugLine="Dim path As String";
_path = "";
 //BA.debugLineNum = 735;BA.debugLine="path = m1.Get(\"image\")";
_path = BA.ObjectToString(_m1.Get((Object)("image")));
 //BA.debugLineNum = 736;BA.debugLine="path = path.Replace(\" \",\"%20\")";
_path = _path.replace(" ","%20");
 //BA.debugLineNum = 738;BA.debugLine="Glide.Load(path).AsBitmap.Resize(Abs(im1.Width),";
mostCurrent._glide.Load((Object)(_path)).AsBitmap().Resize((int) (anywheresoftware.b4a.keywords.Common.Abs(_im1.getWidth())),(int) (anywheresoftware.b4a.keywords.Common.Abs(_im1.getHeight()))).CenterCrop().IntoImageView(_im1);
 }
};
 //BA.debugLineNum = 742;BA.debugLine="slidepanelPage.Initialize(slidepanel1,\"pager\")";
mostCurrent._slidepanelpage.Initialize(mostCurrent.activityBA,mostCurrent._slidepanel1,"pager");
 //BA.debugLineNum = 743;BA.debugLine="pnlads.AddView(slidepanelPage,0,0,pnlads.Width,pn";
mostCurrent._pnlads.AddView((android.view.View)(mostCurrent._slidepanelpage.getObject()),(int) (0),(int) (0),mostCurrent._pnlads.getWidth(),mostCurrent._pnlads.getHeight());
 //BA.debugLineNum = 745;BA.debugLine="AddBullet(res.Size)";
_addbullet(_res.getSize());
 //BA.debugLineNum = 746;BA.debugLine="ChooseBullet(0)";
_choosebullet((int) (0));
 //BA.debugLineNum = 748;BA.debugLine="timerSlideshow.Initialize(\"tmrSlideshow\",3600)";
_timerslideshow.Initialize(processBA,"tmrSlideshow",(long) (3600));
 //BA.debugLineNum = 749;BA.debugLine="timerSlideshow.Enabled = True";
_timerslideshow.setEnabled(anywheresoftware.b4a.keywords.Common.True);
 //BA.debugLineNum = 751;BA.debugLine="End Sub";
return "";
}
public static String  _logout() throws Exception{
com.apps.demo.opencart _op1 = null;
 //BA.debugLineNum = 1226;BA.debugLine="Sub Logout";
 //BA.debugLineNum = 1228;BA.debugLine="pnlloading.SetVisibleAnimated(500,True)";
mostCurrent._pnlloading.SetVisibleAnimated((int) (500),anywheresoftware.b4a.keywords.Common.True);
 //BA.debugLineNum = 1229;BA.debugLine="Dim op1 As OpenCart";
_op1 = new com.apps.demo.opencart();
 //BA.debugLineNum = 1230;BA.debugLine="op1.Initialize";
_op1._initialize(processBA);
 //BA.debugLineNum = 1231;BA.debugLine="op1.Logout(Me,\"Logout_receive\")";
_op1._logout(actmenu.getObject(),"Logout_receive");
 //BA.debugLineNum = 1233;BA.debugLine="End Sub";
return "";
}
public static String  _logout_receive(anywheresoftware.b4a.objects.collections.Map _res,String _cat) throws Exception{
 //BA.debugLineNum = 1235;BA.debugLine="Sub Logout_receive(res As Map,cat As String)";
 //BA.debugLineNum = 1237;BA.debugLine="pnlloading.SetVisibleAnimated(500,False)";
mostCurrent._pnlloading.SetVisibleAnimated((int) (500),anywheresoftware.b4a.keywords.Common.False);
 //BA.debugLineNum = 1239;BA.debugLine="If res.ContainsKey(\"success\") Then";
if (_res.ContainsKey((Object)("success"))) { 
 //BA.debugLineNum = 1240;BA.debugLine="If res.Get(\"success\") = True Then";
if ((_res.Get((Object)("success"))).equals((Object)(anywheresoftware.b4a.keywords.Common.True))) { 
 //BA.debugLineNum = 1241;BA.debugLine="MyToastMessageShow.ShowToastMessageShow(Library";
mostCurrent._mytoastmessageshow._showtoastmessageshow(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"success_logout"),(long) (2),anywheresoftware.b4a.keywords.Common.True);
 //BA.debugLineNum = 1242;BA.debugLine="If Library.loginDetails.IsInitialized Then Libr";
if (mostCurrent._library._logindetails.IsInitialized()) { 
mostCurrent._library._logindetails.Put((Object)("login"),(Object)(anywheresoftware.b4a.keywords.Common.False));};
 //BA.debugLineNum = 1243;BA.debugLine="lblbasket.SetVisibleAnimated(500,False)";
mostCurrent._lblbasket.SetVisibleAnimated((int) (500),anywheresoftware.b4a.keywords.Common.False);
 //BA.debugLineNum = 1244;BA.debugLine="SlideMenu.AddHeader";
mostCurrent._slidemenu._addheader();
 }else {
 //BA.debugLineNum = 1246;BA.debugLine="MyToastMessageShow.ShowToastMessageShow(Library";
mostCurrent._mytoastmessageshow._showtoastmessageshow(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"error_net_title"),(long) (2),anywheresoftware.b4a.keywords.Common.False);
 };
 };
 //BA.debugLineNum = 1251;BA.debugLine="End Sub";
return "";
}
public static String  _manufacturers_receive(anywheresoftware.b4a.objects.collections.Map _res1,String _category) throws Exception{
anywheresoftware.b4a.objects.collections.List _res = null;
 //BA.debugLineNum = 540;BA.debugLine="Sub Manufacturers_receive(res1 As Map,category As";
 //BA.debugLineNum = 542;BA.debugLine="pnlloading.SetVisibleAnimated(500,False)";
mostCurrent._pnlloading.SetVisibleAnimated((int) (500),anywheresoftware.b4a.keywords.Common.False);
 //BA.debugLineNum = 544;BA.debugLine="If res1 = Null Then Return";
if (_res1== null) { 
if (true) return "";};
 //BA.debugLineNum = 545;BA.debugLine="If res1.IsInitialized = False Then Return";
if (_res1.IsInitialized()==anywheresoftware.b4a.keywords.Common.False) { 
if (true) return "";};
 //BA.debugLineNum = 547;BA.debugLine="Dim res As List";
_res = new anywheresoftware.b4a.objects.collections.List();
 //BA.debugLineNum = 548;BA.debugLine="res = res1.Get(\"data\")";
_res.setObject((java.util.List)(_res1.Get((Object)("data"))));
 //BA.debugLineNum = 550;BA.debugLine="Library.listManufacturers.Initialize";
mostCurrent._library._listmanufacturers.Initialize();
 //BA.debugLineNum = 551;BA.debugLine="Library.listManufacturers = res";
mostCurrent._library._listmanufacturers = _res;
 //BA.debugLineNum = 553;BA.debugLine="Library.CacheSystem.AddList2Cache(\"manufacturers\"";
mostCurrent._library._cachesystem._addlist2cache("manufacturers",_res,"manufacturers");
 //BA.debugLineNum = 555;BA.debugLine="LoadManufacturers(res)";
_loadmanufacturers(_res);
 //BA.debugLineNum = 557;BA.debugLine="sv1.Panel.Height = sv1.Panel.Height + 100dip";
mostCurrent._sv1.getPanel().setHeight((int) (mostCurrent._sv1.getPanel().getHeight()+anywheresoftware.b4a.keywords.Common.DipToCurrent((int) (100))));
 //BA.debugLineNum = 559;BA.debugLine="End Sub";
return "";
}
public static String  _newproduct_receive(anywheresoftware.b4a.objects.collections.List _res,String _category) throws Exception{
anywheresoftware.b4a.objects.ConcreteViewWrapper _v = null;
 //BA.debugLineNum = 321;BA.debugLine="Sub NewProduct_receive(res As List,category As Str";
 //BA.debugLineNum = 323;BA.debugLine="If Library.NewProduct.IsInitialized = False Then";
if (mostCurrent._library._newproduct.IsInitialized()==anywheresoftware.b4a.keywords.Common.False) { 
 //BA.debugLineNum = 324;BA.debugLine="Library.NewProduct.Initialize";
mostCurrent._library._newproduct.Initialize();
 //BA.debugLineNum = 325;BA.debugLine="Library.NewProduct = res";
mostCurrent._library._newproduct = _res;
 };
 //BA.debugLineNum = 328;BA.debugLine="topSV = AddHeader(Library.GetStringResourse(\"newp";
_topsv = _addheader(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"newproduct"),"newproduct",_topsv);
 //BA.debugLineNum = 330;BA.debugLine="svhNewProduct.Initialize(0,\"\")";
mostCurrent._svhnewproduct.Initialize(mostCurrent.activityBA,(int) (0),"");
 //BA.debugLineNum = 331;BA.debugLine="sv1.Panel.AddView(svhNewProduct,0,topSV,sv1.Width";
mostCurrent._sv1.getPanel().AddView((android.view.View)(mostCurrent._svhnewproduct.getObject()),(int) (0),_topsv,mostCurrent._sv1.getWidth(),anywheresoftware.b4a.keywords.Common.DipToCurrent((int) (190)));
 //BA.debugLineNum = 332;BA.debugLine="topSV = topSV + Library.LoadProductHorizontalScro";
_topsv = (int) (_topsv+mostCurrent._library._loadproducthorizontalscroll(mostCurrent.activityBA,_res,mostCurrent._svhnewproduct)+anywheresoftware.b4a.keywords.Common.DipToCurrent((int) (70)));
 //BA.debugLineNum = 334;BA.debugLine="Dim v As View";
_v = new anywheresoftware.b4a.objects.ConcreteViewWrapper();
 //BA.debugLineNum = 335;BA.debugLine="v = svhNewProduct.Panel.GetView(0)";
_v = mostCurrent._svhnewproduct.getPanel().GetView((int) (0));
 //BA.debugLineNum = 336;BA.debugLine="v.Top = 0";
_v.setTop((int) (0));
 //BA.debugLineNum = 338;BA.debugLine="If isOffline = False Then";
if (_isoffline==anywheresoftware.b4a.keywords.Common.False) { 
 //BA.debugLineNum = 339;BA.debugLine="FeatureProduct.GetSpecialProduct(\"featured\",Fals";
mostCurrent._featureproduct._getspecialproduct("featured",anywheresoftware.b4a.keywords.Common.False,mostCurrent._library._getlimitloaditem(mostCurrent.activityBA),actmenu.getObject(),"FeatureProduct_receive");
 };
 //BA.debugLineNum = 342;BA.debugLine="sv1.ScrollPosition = 0";
mostCurrent._sv1.setScrollPosition((int) (0));
 //BA.debugLineNum = 344;BA.debugLine="End Sub";
return "";
}
public static String  _pager_pagechanged(int _position) throws Exception{
 //BA.debugLineNum = 905;BA.debugLine="Sub pager_PageChanged (Position As Int)";
 //BA.debugLineNum = 906;BA.debugLine="ChooseBullet(Position)";
_choosebullet(_position);
 //BA.debugLineNum = 907;BA.debugLine="End Sub";
return "";
}
public static String  _pnlmenuinapp_click() throws Exception{
 //BA.debugLineNum = 1333;BA.debugLine="Sub pnlmenuinapp_Click";
 //BA.debugLineNum = 1335;BA.debugLine="End Sub";
return "";
}
public static String  _pnlover_click() throws Exception{
anywheresoftware.b4a.objects.PanelWrapper _p1 = null;
anywheresoftware.b4a.objects.collections.Map _temp = null;
 //BA.debugLineNum = 1135;BA.debugLine="Sub pnlover_Click";
 //BA.debugLineNum = 1137;BA.debugLine="Dim p1 As Panel";
_p1 = new anywheresoftware.b4a.objects.PanelWrapper();
 //BA.debugLineNum = 1138;BA.debugLine="p1 = Sender";
_p1.setObject((android.view.ViewGroup)(anywheresoftware.b4a.keywords.Common.Sender(mostCurrent.activityBA)));
 //BA.debugLineNum = 1140;BA.debugLine="Dim temp As Map";
_temp = new anywheresoftware.b4a.objects.collections.Map();
 //BA.debugLineNum = 1141;BA.debugLine="temp = p1.Tag";
_temp.setObject((anywheresoftware.b4a.objects.collections.Map.MyMap)(_p1.getTag()));
 //BA.debugLineNum = 1142;BA.debugLine="actProduct.product = temp";
mostCurrent._actproduct._product = _temp;
 //BA.debugLineNum = 1143;BA.debugLine="StartActivity(actProduct)";
anywheresoftware.b4a.keywords.Common.StartActivity(mostCurrent.activityBA,(Object)(mostCurrent._actproduct.getObject()));
 //BA.debugLineNum = 1145;BA.debugLine="End Sub";
return "";
}
public static String  _pnloverheader_click() throws Exception{
anywheresoftware.b4a.objects.PanelWrapper _pa = null;
 //BA.debugLineNum = 1147;BA.debugLine="Sub pnloverheader_Click";
 //BA.debugLineNum = 1149;BA.debugLine="Dim pa As Panel";
_pa = new anywheresoftware.b4a.objects.PanelWrapper();
 //BA.debugLineNum = 1150;BA.debugLine="pa = Sender";
_pa.setObject((android.view.ViewGroup)(anywheresoftware.b4a.keywords.Common.Sender(mostCurrent.activityBA)));
 //BA.debugLineNum = 1152;BA.debugLine="If pa.Tag = \"manufacture\" Then Return";
if ((_pa.getTag()).equals((Object)("manufacture"))) { 
if (true) return "";};
 //BA.debugLineNum = 1154;BA.debugLine="LoadProductSplit(pa.Tag)";
_loadproductsplit(BA.ObjectToString(_pa.getTag()));
 //BA.debugLineNum = 1156;BA.debugLine="End Sub";
return "";
}
public static String  _process_globals() throws Exception{
 //BA.debugLineNum = 6;BA.debugLine="Sub Process_Globals";
 //BA.debugLineNum = 7;BA.debugLine="Private timerSlideshow,tmrShowDialogFirst As Time";
_timerslideshow = new anywheresoftware.b4a.objects.Timer();
_tmrshowdialogfirst = new anywheresoftware.b4a.objects.Timer();
 //BA.debugLineNum = 8;BA.debugLine="Private topSV As Int = 0";
_topsv = (int) (0);
 //BA.debugLineNum = 9;BA.debugLine="End Sub";
return "";
}
public static String  _refreshdata() throws Exception{
 //BA.debugLineNum = 1293;BA.debugLine="Sub RefreshData";
 //BA.debugLineNum = 1295;BA.debugLine="Activity.Finish";
mostCurrent._activity.Finish();
 //BA.debugLineNum = 1296;BA.debugLine="StartActivity(Main)";
anywheresoftware.b4a.keywords.Common.StartActivity(mostCurrent.activityBA,(Object)(mostCurrent._main.getObject()));
 //BA.debugLineNum = 1298;BA.debugLine="End Sub";
return "";
}
public static String  _rerunapp() throws Exception{
 //BA.debugLineNum = 1284;BA.debugLine="Sub ReRunApp";
 //BA.debugLineNum = 1285;BA.debugLine="Activity.Finish";
mostCurrent._activity.Finish();
 //BA.debugLineNum = 1286;BA.debugLine="StartActivity(Main)";
anywheresoftware.b4a.keywords.Common.StartActivity(mostCurrent.activityBA,(Object)(mostCurrent._main.getObject()));
 //BA.debugLineNum = 1287;BA.debugLine="End Sub";
return "";
}
public static String  _showhideloading(boolean _state) throws Exception{
 //BA.debugLineNum = 1300;BA.debugLine="Sub ShowHideLoading(State As Boolean)";
 //BA.debugLineNum = 1301;BA.debugLine="pnlloading.SetVisibleAnimated(500,State)";
mostCurrent._pnlloading.SetVisibleAnimated((int) (500),_state);
 //BA.debugLineNum = 1302;BA.debugLine="End Sub";
return "";
}
public static String  _showslidecontent(anywheresoftware.b4a.objects.collections.Map _data) throws Exception{
String _link = "";
anywheresoftware.b4a.keywords.Regex.MatcherWrapper _ma = null;
anywheresoftware.b4a.objects.collections.Map _m1 = null;
com.apps.demo.opencart _op = null;
 //BA.debugLineNum = 821;BA.debugLine="Sub ShowSlideContent(data As Map)";
 //BA.debugLineNum = 823;BA.debugLine="Try";
try { //BA.debugLineNum = 825;BA.debugLine="Dim link As String";
_link = "";
 //BA.debugLineNum = 826;BA.debugLine="link = data.Get(\"link\")";
_link = BA.ObjectToString(_data.Get((Object)("link")));
 //BA.debugLineNum = 827;BA.debugLine="link = link.Replace(\"&amp;\",\"&\")";
_link = _link.replace("&amp;","&");
 //BA.debugLineNum = 829;BA.debugLine="If link = \"\" Then Return";
if ((_link).equals("")) { 
if (true) return "";};
 //BA.debugLineNum = 832;BA.debugLine="Dim ma As Matcher";
_ma = new anywheresoftware.b4a.keywords.Regex.MatcherWrapper();
 //BA.debugLineNum = 833;BA.debugLine="ma = Regex.Matcher(\"product_id=(\\d+)\",link)";
_ma = anywheresoftware.b4a.keywords.Common.Regex.Matcher("product_id=(\\d+)",_link);
 //BA.debugLineNum = 835;BA.debugLine="If ma.Find Then";
if (_ma.Find()) { 
 //BA.debugLineNum = 836;BA.debugLine="link = ma.Group(1)";
_link = _ma.Group((int) (1));
 //BA.debugLineNum = 837;BA.debugLine="Dim m1 As Map";
_m1 = new anywheresoftware.b4a.objects.collections.Map();
 //BA.debugLineNum = 838;BA.debugLine="m1.Initialize";
_m1.Initialize();
 //BA.debugLineNum = 839;BA.debugLine="m1.Put(\"product_id\",link)";
_m1.Put((Object)("product_id"),(Object)(_link));
 //BA.debugLineNum = 840;BA.debugLine="actProduct.product = m1";
mostCurrent._actproduct._product = _m1;
 //BA.debugLineNum = 841;BA.debugLine="StartActivity(actProduct)";
anywheresoftware.b4a.keywords.Common.StartActivity(mostCurrent.activityBA,(Object)(mostCurrent._actproduct.getObject()));
 //BA.debugLineNum = 842;BA.debugLine="Return";
if (true) return "";
 };
 //BA.debugLineNum = 848;BA.debugLine="ma = Regex.Matcher(\"manufacturer_id=(\\d+)\",link)";
_ma = anywheresoftware.b4a.keywords.Common.Regex.Matcher("manufacturer_id=(\\d+)",_link);
 //BA.debugLineNum = 850;BA.debugLine="If ma.Find Then";
if (_ma.Find()) { 
 //BA.debugLineNum = 851;BA.debugLine="link = ma.Group(1)";
_link = _ma.Group((int) (1));
 //BA.debugLineNum = 852;BA.debugLine="pnlloading.SetVisibleAnimated(500,True)";
mostCurrent._pnlloading.SetVisibleAnimated((int) (500),anywheresoftware.b4a.keywords.Common.True);
 //BA.debugLineNum = 854;BA.debugLine="Dim op As OpenCart";
_op = new com.apps.demo.opencart();
 //BA.debugLineNum = 855;BA.debugLine="op.Initialize";
_op._initialize(processBA);
 //BA.debugLineNum = 856;BA.debugLine="op.GetmanufactureProduct(link,Me,\"AllProduct_re";
_op._getmanufactureproduct(_link,actmenu.getObject(),"AllProduct_receive");
 //BA.debugLineNum = 858;BA.debugLine="Return";
if (true) return "";
 };
 //BA.debugLineNum = 863;BA.debugLine="If link.ToLowerCase.IndexOf(\"www\") > -1 Or link.";
if (_link.toLowerCase().indexOf("www")>-1 || _link.toLowerCase().indexOf("http")>-1 || anywheresoftware.b4a.keywords.Common.Regex.IsMatch("^[\\w-]+\\.\\S+$",_link)) { 
 //BA.debugLineNum = 865;BA.debugLine="actWeb.data = \"\"";
mostCurrent._actweb._data = "";
 //BA.debugLineNum = 866;BA.debugLine="actWeb.link = link";
mostCurrent._actweb._link = _link;
 //BA.debugLineNum = 867;BA.debugLine="actWeb.title = \"Web\"";
mostCurrent._actweb._title = "Web";
 //BA.debugLineNum = 868;BA.debugLine="StartActivity(actWeb)";
anywheresoftware.b4a.keywords.Common.StartActivity(mostCurrent.activityBA,(Object)(mostCurrent._actweb.getObject()));
 };
 } 
       catch (Exception e33) {
			processBA.setLastException(e33); };
 //BA.debugLineNum = 875;BA.debugLine="End Sub";
return "";
}
public static String  _slideshow_receive(anywheresoftware.b4a.objects.collections.List _res,String _category) throws Exception{
anywheresoftware.b4a.objects.collections.List _rs = null;
anywheresoftware.b4a.objects.collections.Map _mdefault = null;
com.apps.demo.opencart _op = null;
 //BA.debugLineNum = 636;BA.debugLine="Sub slideshow_receive(res As List,category As Stri";
 //BA.debugLineNum = 638;BA.debugLine="Library.listSlideshow.Initialize";
mostCurrent._library._listslideshow.Initialize();
 //BA.debugLineNum = 639;BA.debugLine="Library.imagesSlideshow.Initialize";
mostCurrent._library._imagesslideshow.Initialize();
 //BA.debugLineNum = 640;BA.debugLine="Library.listSlideshow = res";
mostCurrent._library._listslideshow = _res;
 //BA.debugLineNum = 641;BA.debugLine="bullet.Initialize";
mostCurrent._bullet.Initialize();
 //BA.debugLineNum = 643;BA.debugLine="If res = Null Then";
if (_res== null) { 
 //BA.debugLineNum = 644;BA.debugLine="Dim rs As List";
_rs = new anywheresoftware.b4a.objects.collections.List();
 //BA.debugLineNum = 645;BA.debugLine="rs.Initialize";
_rs.Initialize();
 //BA.debugLineNum = 646;BA.debugLine="Dim mDefault As Map";
_mdefault = new anywheresoftware.b4a.objects.collections.Map();
 //BA.debugLineNum = 647;BA.debugLine="mDefault.Initialize";
_mdefault.Initialize();
 //BA.debugLineNum = 648;BA.debugLine="mDefault.Put(\"title\",Library.GetStringResourse(\"";
_mdefault.Put((Object)("title"),(Object)(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"app_title")));
 //BA.debugLineNum = 649;BA.debugLine="mDefault.Put(\"image\",Library.GetStringResourse(\"";
_mdefault.Put((Object)("image"),(Object)(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"url")+"/app/default_app_banner.jpg"));
 //BA.debugLineNum = 651;BA.debugLine="rs.Add(mDefault)";
_rs.Add((Object)(_mdefault.getObject()));
 //BA.debugLineNum = 652;BA.debugLine="res = rs";
_res = _rs;
 };
 //BA.debugLineNum = 655;BA.debugLine="If res.IsInitialized = False Then";
if (_res.IsInitialized()==anywheresoftware.b4a.keywords.Common.False) { 
 //BA.debugLineNum = 656;BA.debugLine="Dim rs As List";
_rs = new anywheresoftware.b4a.objects.collections.List();
 //BA.debugLineNum = 657;BA.debugLine="rs.Initialize";
_rs.Initialize();
 //BA.debugLineNum = 658;BA.debugLine="Dim mDefault As Map";
_mdefault = new anywheresoftware.b4a.objects.collections.Map();
 //BA.debugLineNum = 659;BA.debugLine="mDefault.Initialize";
_mdefault.Initialize();
 //BA.debugLineNum = 660;BA.debugLine="mDefault.Put(\"title\",Library.GetStringResourse(\"";
_mdefault.Put((Object)("title"),(Object)(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"app_title")));
 //BA.debugLineNum = 661;BA.debugLine="mDefault.Put(\"image\",Library.GetStringResourse(\"";
_mdefault.Put((Object)("image"),(Object)(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"url")+"/app/default_app_banner.jpg"));
 //BA.debugLineNum = 662;BA.debugLine="rs.Add(mDefault)";
_rs.Add((Object)(_mdefault.getObject()));
 //BA.debugLineNum = 663;BA.debugLine="res = rs";
_res = _rs;
 };
 //BA.debugLineNum = 666;BA.debugLine="Library.CacheSystem.AddList2Cache(\"slideshow\",res";
mostCurrent._library._cachesystem._addlist2cache("slideshow",_res,"slideshow");
 //BA.debugLineNum = 668;BA.debugLine="LoadSlideshow(res)";
_loadslideshow(_res);
 //BA.debugLineNum = 670;BA.debugLine="If Library.CacheSystem.ExistID(\"banners\",\"banners";
if (mostCurrent._library._cachesystem._existid("banners","banners")==anywheresoftware.b4a.keywords.Common.False) { 
 //BA.debugLineNum = 671;BA.debugLine="Dim op As OpenCart";
_op = new com.apps.demo.opencart();
 //BA.debugLineNum = 672;BA.debugLine="op.Initialize";
_op._initialize(processBA);
 //BA.debugLineNum = 673;BA.debugLine="op.Banner(Me,\"Banners_Receive\",\"\")";
_op._banner(actmenu.getObject(),"Banners_Receive","");
 };
 //BA.debugLineNum = 676;BA.debugLine="End Sub";
return "";
}
public static String  _specialsproduct_receive(anywheresoftware.b4a.objects.collections.List _res,String _category) throws Exception{
anywheresoftware.b4a.objects.ConcreteViewWrapper _v = null;
 //BA.debugLineNum = 289;BA.debugLine="Sub SpecialsProduct_receive(res As List,category A";
 //BA.debugLineNum = 291;BA.debugLine="If Library.SpecialProduct.IsInitialized = False T";
if (mostCurrent._library._specialproduct.IsInitialized()==anywheresoftware.b4a.keywords.Common.False) { 
 //BA.debugLineNum = 292;BA.debugLine="Library.SpecialProduct.Initialize";
mostCurrent._library._specialproduct.Initialize();
 //BA.debugLineNum = 293;BA.debugLine="Library.SpecialProduct = res";
mostCurrent._library._specialproduct = _res;
 };
 //BA.debugLineNum = 296;BA.debugLine="If res <> Null Then";
if (_res!= null) { 
 //BA.debugLineNum = 297;BA.debugLine="If res.Size > 0 Then";
if (_res.getSize()>0) { 
 //BA.debugLineNum = 299;BA.debugLine="topSV = AddHeader(Library.GetStringResourse(\"sp";
_topsv = _addheader(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"specialproduct"),"special",_topsv);
 //BA.debugLineNum = 301;BA.debugLine="svhSpecialProduct.Initialize(0,\"\")";
mostCurrent._svhspecialproduct.Initialize(mostCurrent.activityBA,(int) (0),"");
 //BA.debugLineNum = 302;BA.debugLine="svhSpecialProduct.Tag = \"special\"";
mostCurrent._svhspecialproduct.setTag((Object)("special"));
 //BA.debugLineNum = 303;BA.debugLine="sv1.Panel.AddView(svhSpecialProduct,0,topSV,sv1";
mostCurrent._sv1.getPanel().AddView((android.view.View)(mostCurrent._svhspecialproduct.getObject()),(int) (0),_topsv,mostCurrent._sv1.getWidth(),anywheresoftware.b4a.keywords.Common.DipToCurrent((int) (190)));
 //BA.debugLineNum = 304;BA.debugLine="topSV = topSV + Library.LoadProductHorizontalSc";
_topsv = (int) (_topsv+mostCurrent._library._loadproducthorizontalscroll(mostCurrent.activityBA,_res,mostCurrent._svhspecialproduct)+anywheresoftware.b4a.keywords.Common.DipToCurrent((int) (70)));
 //BA.debugLineNum = 306;BA.debugLine="Dim v As View";
_v = new anywheresoftware.b4a.objects.ConcreteViewWrapper();
 //BA.debugLineNum = 307;BA.debugLine="v = svhSpecialProduct.Panel.GetView(0)";
_v = mostCurrent._svhspecialproduct.getPanel().GetView((int) (0));
 //BA.debugLineNum = 308;BA.debugLine="If v.IsInitialized Then v.Top = 0";
if (_v.IsInitialized()) { 
_v.setTop((int) (0));};
 };
 };
 //BA.debugLineNum = 313;BA.debugLine="If isOffline = False Then";
if (_isoffline==anywheresoftware.b4a.keywords.Common.False) { 
 //BA.debugLineNum = 314;BA.debugLine="NewProduct.GetSpecialProduct(\"latest\",True,Libra";
mostCurrent._newproduct._getspecialproduct("latest",anywheresoftware.b4a.keywords.Common.True,mostCurrent._library._getlimitloaditem(mostCurrent.activityBA),actmenu.getObject(),"NewProduct_receive");
 };
 //BA.debugLineNum = 317;BA.debugLine="sv1.ScrollPosition = 0";
mostCurrent._sv1.setScrollPosition((int) (0));
 //BA.debugLineNum = 319;BA.debugLine="End Sub";
return "";
}
public static String  _sv1_scrollchanged(int _position) throws Exception{
 //BA.debugLineNum = 1304;BA.debugLine="Sub sv1_ScrollChanged(Position As Int)";
 //BA.debugLineNum = 1306;BA.debugLine="If Position > 100 Then";
if (_position>100) { 
 //BA.debugLineNum = 1307;BA.debugLine="If ScollButton.Top <> Activity.Height - ScollBut";
if (mostCurrent._scollbutton.getTop()!=mostCurrent._activity.getHeight()-mostCurrent._scollbutton.getHeight()) { 
 //BA.debugLineNum = 1308;BA.debugLine="ScollButton.SetLayoutAnimated(760,ScollButton.L";
mostCurrent._scollbutton.SetLayoutAnimated((int) (760),mostCurrent._scollbutton.getLeft(),(int) (mostCurrent._activity.getHeight()-anywheresoftware.b4a.keywords.Common.DipToCurrent((int) (10))-mostCurrent._scollbutton.getHeight()),mostCurrent._scollbutton.getWidth(),mostCurrent._scollbutton.getHeight());
 };
 }else if(_position<100) { 
 //BA.debugLineNum = 1312;BA.debugLine="If ScollButton.Top <> Activity.Height + ScollBut";
if (mostCurrent._scollbutton.getTop()!=mostCurrent._activity.getHeight()+mostCurrent._scollbutton.getHeight()) { 
 //BA.debugLineNum = 1313;BA.debugLine="ScollButton.SetLayoutAnimated(760,ScollButton.L";
mostCurrent._scollbutton.SetLayoutAnimated((int) (760),mostCurrent._scollbutton.getLeft(),(int) (mostCurrent._activity.getHeight()+mostCurrent._scollbutton.getHeight()),mostCurrent._scollbutton.getWidth(),mostCurrent._scollbutton.getHeight());
 };
 };
 //BA.debugLineNum = 1317;BA.debugLine="End Sub";
return "";
}
public static String  _tips_click() throws Exception{
 //BA.debugLineNum = 247;BA.debugLine="Sub tips_Click";
 //BA.debugLineNum = 287;BA.debugLine="End Sub";
return "";
}
public static String  _tmrshowdialog_tick() throws Exception{
 //BA.debugLineNum = 219;BA.debugLine="Sub tmrshowdialog_Tick";
 //BA.debugLineNum = 221;BA.debugLine="tmrShowDialogFirst.Enabled = False";
_tmrshowdialogfirst.setEnabled(anywheresoftware.b4a.keywords.Common.False);
 //BA.debugLineNum = 222;BA.debugLine="Library.manager.SetBoolean(\"fistshowdialog1\",True";
mostCurrent._library._manager.SetBoolean("fistshowdialog1",anywheresoftware.b4a.keywords.Common.True);
 //BA.debugLineNum = 235;BA.debugLine="End Sub";
return "";
}
public static String  _tmrslideshow_tick() throws Exception{
 //BA.debugLineNum = 766;BA.debugLine="Sub tmrSlideshow_Tick";
 //BA.debugLineNum = 768;BA.debugLine="If svH.IsInitialized Then";
if (mostCurrent._svh.IsInitialized()) { 
 //BA.debugLineNum = 769;BA.debugLine="If svH.ScrollPosition = 0 Then";
if (mostCurrent._svh.getScrollPosition()==0) { 
 //BA.debugLineNum = 770;BA.debugLine="svH.FullScroll(True)";
mostCurrent._svh.FullScroll(anywheresoftware.b4a.keywords.Common.True);
 }else {
 //BA.debugLineNum = 772;BA.debugLine="svH.FullScroll(False)";
mostCurrent._svh.FullScroll(anywheresoftware.b4a.keywords.Common.False);
 };
 };
 //BA.debugLineNum = 776;BA.debugLine="If Library.imagesSlideshow = Null Then Return";
if (mostCurrent._library._imagesslideshow== null) { 
if (true) return "";};
 //BA.debugLineNum = 778;BA.debugLine="If Library.imagesSlideshow.IsInitialized = False";
if (mostCurrent._library._imagesslideshow.IsInitialized()==anywheresoftware.b4a.keywords.Common.False) { 
if (true) return "";};
 //BA.debugLineNum = 780;BA.debugLine="If offsetSlideshow = Library.imagesSlideshow.Size";
if (_offsetslideshow==mostCurrent._library._imagesslideshow.getSize()) { 
_offsetslideshow = (int) (0);};
 //BA.debugLineNum = 782;BA.debugLine="If slidepanelPage.IsInitialized = False Then";
if (mostCurrent._slidepanelpage.IsInitialized()==anywheresoftware.b4a.keywords.Common.False) { 
 //BA.debugLineNum = 783;BA.debugLine="slidepanelPage.Initialize(slidepanel1,\"pager\")";
mostCurrent._slidepanelpage.Initialize(mostCurrent.activityBA,mostCurrent._slidepanel1,"pager");
 //BA.debugLineNum = 784;BA.debugLine="pnlads.AddView(slidepanelPage,0,0,pnlads.Width,p";
mostCurrent._pnlads.AddView((android.view.View)(mostCurrent._slidepanelpage.getObject()),(int) (0),(int) (0),mostCurrent._pnlads.getWidth(),mostCurrent._pnlads.getHeight());
 };
 //BA.debugLineNum = 787;BA.debugLine="slidepanelPage.GotoPage(offsetSlideshow,True)";
mostCurrent._slidepanelpage.GotoPage(_offsetslideshow,anywheresoftware.b4a.keywords.Common.True);
 //BA.debugLineNum = 789;BA.debugLine="DoEvents";
anywheresoftware.b4a.keywords.Common.DoEvents();
 //BA.debugLineNum = 791;BA.debugLine="ChooseBullet(offsetSlideshow)";
_choosebullet(_offsetslideshow);
 //BA.debugLineNum = 792;BA.debugLine="offsetSlideshow = offsetSlideshow + 1";
_offsetslideshow = (int) (_offsetslideshow+1);
 //BA.debugLineNum = 794;BA.debugLine="End Sub";
return "";
}
public static String  _wishlist_receive(anywheresoftware.b4a.objects.collections.Map _res,String _cat) throws Exception{
anywheresoftware.b4a.objects.collections.Map _m1 = null;
anywheresoftware.b4a.objects.collections.List _ls = null;
 //BA.debugLineNum = 485;BA.debugLine="Sub WishList_receive(res As Map,cat As String)";
 //BA.debugLineNum = 487;BA.debugLine="If res = Null Then Return";
if (_res== null) { 
if (true) return "";};
 //BA.debugLineNum = 488;BA.debugLine="If res.IsInitialized = False Then Return";
if (_res.IsInitialized()==anywheresoftware.b4a.keywords.Common.False) { 
if (true) return "";};
 //BA.debugLineNum = 490;BA.debugLine="If res.ContainsKey(\"success\") Then";
if (_res.ContainsKey((Object)("success"))) { 
 //BA.debugLineNum = 491;BA.debugLine="If res.Get(\"success\") = True Then";
if ((_res.Get((Object)("success"))).equals((Object)(anywheresoftware.b4a.keywords.Common.True))) { 
 //BA.debugLineNum = 492;BA.debugLine="Dim m1 As Map";
_m1 = new anywheresoftware.b4a.objects.collections.Map();
 //BA.debugLineNum = 493;BA.debugLine="Dim ls As List";
_ls = new anywheresoftware.b4a.objects.collections.List();
 //BA.debugLineNum = 494;BA.debugLine="m1 = res.Get(\"data\")";
_m1.setObject((anywheresoftware.b4a.objects.collections.Map.MyMap)(_res.Get((Object)("data"))));
 //BA.debugLineNum = 495;BA.debugLine="ls = m1.Get(\"products\")";
_ls.setObject((java.util.List)(_m1.Get((Object)("products"))));
 //BA.debugLineNum = 496;BA.debugLine="Library.wishlist = Library.GetStringResourse(\"b";
mostCurrent._library._wishlist = mostCurrent._library._getstringresourse(mostCurrent.activityBA,"bookmark")+(" ( "+anywheresoftware.b4a.keywords.Common.SmartStringFormatter("",(Object)(_ls.getSize()))+" )");
 //BA.debugLineNum = 497;BA.debugLine="SlideMenu.AddHeader";
mostCurrent._slidemenu._addheader();
 };
 };
 //BA.debugLineNum = 501;BA.debugLine="End Sub";
return "";
}
}
