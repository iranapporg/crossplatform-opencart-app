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

public class actproduct extends Activity implements B4AActivity{
	public static actproduct mostCurrent;
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
			processBA = new BA(this.getApplicationContext(), null, null, "com.apps.demo", "com.apps.demo.actproduct");
			processBA.loadHtSubs(this.getClass());
	        float deviceScale = getApplicationContext().getResources().getDisplayMetrics().density;
	        BALayout.setDeviceScale(deviceScale);
            
		}
		else if (previousOne != null) {
			Activity p = previousOne.get();
			if (p != null && p != this) {
                BA.LogInfo("Killing previous instance (actproduct).");
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
		activityBA = new BA(this, layout, processBA, "com.apps.demo", "com.apps.demo.actproduct");
        
        processBA.sharedProcessBA.activityBA = new java.lang.ref.WeakReference<BA>(activityBA);
        anywheresoftware.b4a.objects.ViewWrapper.lastId = 0;
        _activity = new ActivityWrapper(activityBA, "activity");
        anywheresoftware.b4a.Msgbox.isDismissing = false;
        if (BA.isShellModeRuntimeCheck(processBA)) {
			if (isFirst)
				processBA.raiseEvent2(null, true, "SHELL", false);
			processBA.raiseEvent2(null, true, "CREATE", true, "com.apps.demo.actproduct", processBA, activityBA, _activity, anywheresoftware.b4a.keywords.Common.Density, mostCurrent);
			_activity.reinitializeForShell(activityBA, "activity");
		}
        initializeProcessGlobals();		
        initializeGlobals();
        
        BA.LogInfo("** Activity (actproduct) Create, isFirst = " + isFirst + " **");
        processBA.raiseEvent2(null, true, "activity_create", false, isFirst);
		isFirst = false;
		if (this != mostCurrent)
			return;
        processBA.setActivityPaused(false);
        BA.LogInfo("** Activity (actproduct) Resume **");
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
		return actproduct.class;
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
        BA.LogInfo("** Activity (actproduct) Pause, UserClosed = " + activityBA.activity.isFinishing() + " **");
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
            BA.LogInfo("** Activity (actproduct) Resume **");
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
public static anywheresoftware.b4a.objects.collections.Map _product = null;
public static anywheresoftware.b4a.objects.Timer _timerslideshow = null;
public static boolean _isopenproduct = false;
public static boolean _clickedmenu = false;
public anywheresoftware.b4a.objects.ButtonWrapper _scollbutton = null;
public anywheresoftware.b4a.objects.ButtonWrapper _btnqr = null;
public wrap.Wrap _status = null;
public anywheresoftware.b4a.objects.PanelWrapper _progress = null;
public de.donmanfred.GoogleProgressBarWrapper _googlebar = null;
public anywheresoftware.b4a.objects.collections.List _bullet = null;
public anywheresoftware.b4a.objects.LabelWrapper _lbltitle = null;
public anywheresoftware.b4a.objects.LabelWrapper _lblprice = null;
public anywheresoftware.b4a.objects.LabelWrapper _lbls1 = null;
public anywheresoftware.b4a.objects.LabelWrapper _lbls2 = null;
public anywheresoftware.b4a.objects.LabelWrapper _lbls3 = null;
public anywheresoftware.b4a.objects.LabelWrapper _lbls4 = null;
public anywheresoftware.b4a.objects.LabelWrapper _lbls5 = null;
public anywheresoftware.b4a.objects.LabelWrapper _lblstate = null;
public anywheresoftware.b4a.objects.LabelWrapper _lblproducer = null;
public anywheresoftware.b4a.objects.LabelWrapper _lbldate = null;
public anywheresoftware.b4a.objects.LabelWrapper _lblmodel = null;
public anywheresoftware.b4a.objects.LabelWrapper _lblvisit = null;
public anywheresoftware.b4a.objects.ButtonWrapper _btnreview = null;
public anywheresoftware.b4a.objects.PanelWrapper _pnl2 = null;
public anywheresoftware.b4a.objects.PanelWrapper _pnl1 = null;
public anywheresoftware.b4a.objects.collections.List _listslideshow = null;
public static int _offsetslideshow = 0;
public anywheresoftware.b4a.objects.LabelWrapper _lblratetitle = null;
public anywheresoftware.b4a.objects.LabelWrapper _lblstatetitle = null;
public anywheresoftware.b4a.objects.LabelWrapper _lblproducertitle = null;
public anywheresoftware.b4a.objects.LabelWrapper _lbldatetitle = null;
public anywheresoftware.b4a.objects.LabelWrapper _lblmodeltitle = null;
public anywheresoftware.b4a.objects.LabelWrapper _lblvisitcount = null;
public anywheresoftware.b4a.objects.ScrollViewWrapper _sv1 = null;
public anywheresoftware.b4a.objects.LabelWrapper _lbldivider2 = null;
public anywheresoftware.b4a.objects.LabelWrapper _lbldescription = null;
public com.apps.demo.opencart _details = null;
public anywheresoftware.b4a.objects.ButtonWrapper _btnbookmark = null;
public anywheresoftware.b4a.objects.LabelWrapper _lblbasket = null;
public anywheresoftware.b4a.objects.LabelWrapper _lblauthor = null;
public anywheresoftware.b4a.objects.LabelWrapper _lbldate_comment = null;
public anywheresoftware.b4a.objects.LabelWrapper _lblcomment_review = null;
public anywheresoftware.b4a.objects.PanelWrapper _pnlitem_comment = null;
public anywheresoftware.b4a.objects.LabelWrapper _lblcommentstar1 = null;
public anywheresoftware.b4a.objects.LabelWrapper _lblcommentstar2 = null;
public anywheresoftware.b4a.objects.LabelWrapper _lblcommentstar3 = null;
public anywheresoftware.b4a.objects.LabelWrapper _lblcommentstar4 = null;
public anywheresoftware.b4a.objects.LabelWrapper _lblcommentstar5 = null;
public anywheresoftware.b4a.objects.ButtonWrapper _btnreviews = null;
public static int _topreview = 0;
public static int _topoptions = 0;
public static int _topattr = 0;
public anywheresoftware.b4a.objects.LabelWrapper _lblnumber = null;
public anywheresoftware.b4a.objects.PanelWrapper _pnloverheader = null;
public anywheresoftware.b4a.objects.LabelWrapper _lblheadername = null;
public anywheresoftware.b4a.objects.PanelWrapper _pnlheadert = null;
public static int _top = 0;
public anywheresoftware.b4a.objects.PanelWrapper _pnlheaderproduct = null;
public anywheresoftware.b4a.objects.PanelWrapper _pnlads = null;
public anywheresoftware.b4a.objects.collections.List _listoptions = null;
public anywheresoftware.b4a.objects.LabelWrapper _lblattr = null;
public anywheresoftware.b4a.objects.LabelWrapper _lbloptions = null;
public com.apps.demo.slidemenu _slidemenu1 = null;
public anywheresoftware.b4a.objects.LabelWrapper _lbladd2cart = null;
public anywheresoftware.b4a.objects.PanelWrapper _pnlheader = null;
public anywheresoftware.b4a.objects.collections.List _listbanner = null;
public anywheresoftware.b4a.objects.ImageViewWrapper _imgspecial = null;
public anywheresoftware.b4a.objects.EditTextWrapper _txtfocus = null;
public com.apps.demo.mytoastmessageshow _mytoastmessageshow = null;
public static boolean _fixpanelheader = false;
public anywheresoftware.b4a.objects.PanelWrapper _pnlreviews = null;
public anywheresoftware.b4a.objects.PanelWrapper _pnlattribute = null;
public anywheresoftware.b4a.objects.PanelWrapper _pnlbasket = null;
public anywheresoftware.b4a.objects.ScrollViewWrapper _svreviews = null;
public anywheresoftware.b4a.objects.ScrollViewWrapper _svattribute = null;
public anywheresoftware.b4a.objects.ButtonWrapper _btnattributes = null;
public anywheresoftware.b4a.objects.LabelWrapper _lblfloat_basket = null;
public static String _tiptag = "";
public static String _titlehelp = "";
public anywheresoftware.b4a.objects.ButtonWrapper _btnshare = null;
public anywheresoftware.b4a.objects.ButtonWrapper _btnbasket = null;
public de.amberhome.viewpager.PageContainerAdapter _slidepanel1 = null;
public de.amberhome.viewpager.ViewPagerWrapper _slidepanelpage = null;
public anywheresoftware.b4a.objects.ButtonWrapper _btnsearch = null;
public anywheresoftware.b4a.objects.ButtonWrapper _btnback = null;
public anywheresoftware.b4a.objects.PanelWrapper _pnlcircle = null;
public anywheresoftware.b4a.objects.LabelWrapper _lblpre_price = null;
public anywheresoftware.b4a.objects.PanelWrapper _pnltimer = null;
public anywheresoftware.b4a.objects.LabelWrapper _lblnum1 = null;
public anywheresoftware.b4a.objects.LabelWrapper _lblnum2 = null;
public anywheresoftware.b4a.objects.LabelWrapper _lblnum3 = null;
public anywheresoftware.b4a.objects.PanelWrapper _pnlprice = null;
public anywheresoftware.b4a.objects.Timer _timerspecial = null;
public com.apps.demo.dateutils._period _specialdateinformation = null;
public static int _currenttimerspecialwidth = 0;
public anywheresoftware.b4a.objects.LabelWrapper _lblline2 = null;
public anywheresoftware.b4a.objects.LabelWrapper _lblline1 = null;
public anywheresoftware.b4a.objects.LabelWrapper _lblwonderfull = null;
public anywheresoftware.b4a.objects.LabelWrapper _lblnum4 = null;
public anywheresoftware.b4a.objects.PanelWrapper _pnllistnumb = null;
public anywheresoftware.b4a.objects.PanelWrapper _pnlqr = null;
public anywheresoftware.b4a.objects.collections.List _listimageview = null;
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
anywheresoftware.b4a.objects.PanelWrapper _content = null;
anywheresoftware.b4a.objects.drawable.ColorDrawable _cd = null;
anywheresoftware.b4a.objects.collections.Map _detailstemp = null;
 //BA.debugLineNum = 113;BA.debugLine="Sub Activity_Create(FirstTime As Boolean)";
 //BA.debugLineNum = 115;BA.debugLine="Library.setLocalApp(Library.currLang)";
mostCurrent._library._setlocalapp(mostCurrent.activityBA,mostCurrent._library._currlang);
 //BA.debugLineNum = 117;BA.debugLine="ListOptions.Initialize";
mostCurrent._listoptions.Initialize();
 //BA.debugLineNum = 118;BA.debugLine="ListImageView.Initialize";
mostCurrent._listimageview.Initialize();
 //BA.debugLineNum = 119;BA.debugLine="sv1.Initialize2(0,\"sve1\")";
mostCurrent._sv1.Initialize2(mostCurrent.activityBA,(int) (0),"sve1");
 //BA.debugLineNum = 121;BA.debugLine="Dim Content As Panel";
_content = new anywheresoftware.b4a.objects.PanelWrapper();
 //BA.debugLineNum = 122;BA.debugLine="Content.Initialize(\"\")";
_content.Initialize(mostCurrent.activityBA,"");
 //BA.debugLineNum = 123;BA.debugLine="Activity.AddView(sv1,0,0,100%x,100%y)";
mostCurrent._activity.AddView((android.view.View)(mostCurrent._sv1.getObject()),(int) (0),(int) (0),anywheresoftware.b4a.keywords.Common.PerXToCurrent((float) (100),mostCurrent.activityBA),anywheresoftware.b4a.keywords.Common.PerYToCurrent((float) (100),mostCurrent.activityBA));
 //BA.debugLineNum = 124;BA.debugLine="Activity.AddView(Content,0,0,100%x,100%y)";
mostCurrent._activity.AddView((android.view.View)(_content.getObject()),(int) (0),(int) (0),anywheresoftware.b4a.keywords.Common.PerXToCurrent((float) (100),mostCurrent.activityBA),anywheresoftware.b4a.keywords.Common.PerYToCurrent((float) (100),mostCurrent.activityBA));
 //BA.debugLineNum = 126;BA.debugLine="ScollButton = Library.MakeUpScrollButton(Activity";
mostCurrent._scollbutton = mostCurrent._library._makeupscrollbutton(mostCurrent.activityBA,(anywheresoftware.b4a.objects.PanelWrapper) anywheresoftware.b4a.AbsObjectWrapper.ConvertToWrapper(new anywheresoftware.b4a.objects.PanelWrapper(), (android.view.ViewGroup)(mostCurrent._activity.getObject())));
 //BA.debugLineNum = 127;BA.debugLine="ScollButton.BringToFront";
mostCurrent._scollbutton.BringToFront();
 //BA.debugLineNum = 129;BA.debugLine="Library.ChangeStatusColor";
mostCurrent._library._changestatuscolor(mostCurrent.activityBA);
 //BA.debugLineNum = 131;BA.debugLine="progress.Initialize(\"\")";
mostCurrent._progress.Initialize(mostCurrent.activityBA,"");
 //BA.debugLineNum = 132;BA.debugLine="progress.Color = Colors.ARGB(120,66,66,66)";
mostCurrent._progress.setColor(anywheresoftware.b4a.keywords.Common.Colors.ARGB((int) (120),(int) (66),(int) (66),(int) (66)));
 //BA.debugLineNum = 133;BA.debugLine="Activity.AddView(progress,0,0,100%x,100%y)";
mostCurrent._activity.AddView((android.view.View)(mostCurrent._progress.getObject()),(int) (0),(int) (0),anywheresoftware.b4a.keywords.Common.PerXToCurrent((float) (100),mostCurrent.activityBA),anywheresoftware.b4a.keywords.Common.PerYToCurrent((float) (100),mostCurrent.activityBA));
 //BA.debugLineNum = 134;BA.debugLine="googlebar.Initialize(\"\",0,Array As Int(Colors.RGB";
mostCurrent._googlebar.Initialize(processBA,"",(int) (0),new int[]{anywheresoftware.b4a.keywords.Common.Colors.RGB((int) (3),(int) (174),(int) (218)),anywheresoftware.b4a.keywords.Common.Colors.RGB((int) (218),(int) (3),(int) (79)),anywheresoftware.b4a.keywords.Common.Colors.RGB((int) (67),(int) (67),(int) (67)),anywheresoftware.b4a.keywords.Common.Colors.RGB((int) (218),(int) (128),(int) (0))});
 //BA.debugLineNum = 135;BA.debugLine="progress.AddView(googlebar,Activity.Width / 2 - 4";
mostCurrent._progress.AddView((android.view.View)(mostCurrent._googlebar.getObject()),(int) (mostCurrent._activity.getWidth()/(double)2-anywheresoftware.b4a.keywords.Common.DipToCurrent((int) (40))/(double)2),(int) (mostCurrent._activity.getHeight()/(double)2-anywheresoftware.b4a.keywords.Common.DipToCurrent((int) (40))),anywheresoftware.b4a.keywords.Common.DipToCurrent((int) (40)),anywheresoftware.b4a.keywords.Common.DipToCurrent((int) (40)));
 //BA.debugLineNum = 137;BA.debugLine="pnlReviews.Initialize(\"\")";
mostCurrent._pnlreviews.Initialize(mostCurrent.activityBA,"");
 //BA.debugLineNum = 138;BA.debugLine="Activity.AddView(pnlReviews,0,0,100%x,100%y)";
mostCurrent._activity.AddView((android.view.View)(mostCurrent._pnlreviews.getObject()),(int) (0),(int) (0),anywheresoftware.b4a.keywords.Common.PerXToCurrent((float) (100),mostCurrent.activityBA),anywheresoftware.b4a.keywords.Common.PerYToCurrent((float) (100),mostCurrent.activityBA));
 //BA.debugLineNum = 139;BA.debugLine="pnlReviews.Visible = False";
mostCurrent._pnlreviews.setVisible(anywheresoftware.b4a.keywords.Common.False);
 //BA.debugLineNum = 140;BA.debugLine="pnlReviews.Color = Colors.RGB(238, 238, 238)";
mostCurrent._pnlreviews.setColor(anywheresoftware.b4a.keywords.Common.Colors.RGB((int) (238),(int) (238),(int) (238)));
 //BA.debugLineNum = 141;BA.debugLine="svReviews.Initialize(0)";
mostCurrent._svreviews.Initialize(mostCurrent.activityBA,(int) (0));
 //BA.debugLineNum = 142;BA.debugLine="pnlReviews.AddView(svReviews,0,0,100%x,100%y)";
mostCurrent._pnlreviews.AddView((android.view.View)(mostCurrent._svreviews.getObject()),(int) (0),(int) (0),anywheresoftware.b4a.keywords.Common.PerXToCurrent((float) (100),mostCurrent.activityBA),anywheresoftware.b4a.keywords.Common.PerYToCurrent((float) (100),mostCurrent.activityBA));
 //BA.debugLineNum = 144;BA.debugLine="pnlAttribute.Initialize(\"\")";
mostCurrent._pnlattribute.Initialize(mostCurrent.activityBA,"");
 //BA.debugLineNum = 145;BA.debugLine="Activity.AddView(pnlAttribute,0,0,100%x,100%y)";
mostCurrent._activity.AddView((android.view.View)(mostCurrent._pnlattribute.getObject()),(int) (0),(int) (0),anywheresoftware.b4a.keywords.Common.PerXToCurrent((float) (100),mostCurrent.activityBA),anywheresoftware.b4a.keywords.Common.PerYToCurrent((float) (100),mostCurrent.activityBA));
 //BA.debugLineNum = 146;BA.debugLine="pnlAttribute.Visible = False";
mostCurrent._pnlattribute.setVisible(anywheresoftware.b4a.keywords.Common.False);
 //BA.debugLineNum = 147;BA.debugLine="pnlAttribute.Color = Colors.RGB(238, 238, 238)";
mostCurrent._pnlattribute.setColor(anywheresoftware.b4a.keywords.Common.Colors.RGB((int) (238),(int) (238),(int) (238)));
 //BA.debugLineNum = 148;BA.debugLine="svAttribute.Initialize(0)";
mostCurrent._svattribute.Initialize(mostCurrent.activityBA,(int) (0));
 //BA.debugLineNum = 149;BA.debugLine="pnlAttribute.AddView(svAttribute,0,0,100%x,100%y)";
mostCurrent._pnlattribute.AddView((android.view.View)(mostCurrent._svattribute.getObject()),(int) (0),(int) (0),anywheresoftware.b4a.keywords.Common.PerXToCurrent((float) (100),mostCurrent.activityBA),anywheresoftware.b4a.keywords.Common.PerYToCurrent((float) (100),mostCurrent.activityBA));
 //BA.debugLineNum = 151;BA.debugLine="pnlBasket.Initialize(\"\")";
mostCurrent._pnlbasket.Initialize(mostCurrent.activityBA,"");
 //BA.debugLineNum = 152;BA.debugLine="Activity.AddView(pnlBasket,0,100%y - 50dip,100%x,";
mostCurrent._activity.AddView((android.view.View)(mostCurrent._pnlbasket.getObject()),(int) (0),(int) (anywheresoftware.b4a.keywords.Common.PerYToCurrent((float) (100),mostCurrent.activityBA)-anywheresoftware.b4a.keywords.Common.DipToCurrent((int) (50))),anywheresoftware.b4a.keywords.Common.PerXToCurrent((float) (100),mostCurrent.activityBA),anywheresoftware.b4a.keywords.Common.DipToCurrent((int) (50)));
 //BA.debugLineNum = 154;BA.debugLine="Dim cd As ColorDrawable";
_cd = new anywheresoftware.b4a.objects.drawable.ColorDrawable();
 //BA.debugLineNum = 155;BA.debugLine="cd.Initialize2(Library.ConvertHex2Int(Library.Get";
_cd.Initialize2((int)(Double.parseDouble(mostCurrent._library._converthex2int(mostCurrent.activityBA,mostCurrent._library._getstringresourse(mostCurrent.activityBA,"category_button")))),(int) (0),(int) (0),anywheresoftware.b4a.keywords.Common.Colors.Gray);
 //BA.debugLineNum = 156;BA.debugLine="pnlBasket.Background = cd";
mostCurrent._pnlbasket.setBackground((android.graphics.drawable.Drawable)(_cd.getObject()));
 //BA.debugLineNum = 158;BA.debugLine="lblfloat_basket.Initialize(\"lbladd2cart\")";
mostCurrent._lblfloat_basket.Initialize(mostCurrent.activityBA,"lbladd2cart");
 //BA.debugLineNum = 159;BA.debugLine="lblfloat_basket.TextColor = Colors.White";
mostCurrent._lblfloat_basket.setTextColor(anywheresoftware.b4a.keywords.Common.Colors.White);
 //BA.debugLineNum = 160;BA.debugLine="lblfloat_basket.Typeface = Typeface.LoadFromAsset";
mostCurrent._lblfloat_basket.setTypeface(anywheresoftware.b4a.keywords.Common.Typeface.LoadFromAssets("icomoon.ttf"));
 //BA.debugLineNum = 162;BA.debugLine="lblfloat_basket.TextSize = 14";
mostCurrent._lblfloat_basket.setTextSize((float) (14));
 //BA.debugLineNum = 163;BA.debugLine="lblfloat_basket.Gravity = Gravity.CENTER";
mostCurrent._lblfloat_basket.setGravity(anywheresoftware.b4a.keywords.Common.Gravity.CENTER);
 //BA.debugLineNum = 164;BA.debugLine="pnlBasket.AddView(lblfloat_basket,0,0,pnlBasket.W";
mostCurrent._pnlbasket.AddView((android.view.View)(mostCurrent._lblfloat_basket.getObject()),(int) (0),(int) (0),mostCurrent._pnlbasket.getWidth(),mostCurrent._pnlbasket.getHeight());
 //BA.debugLineNum = 165;BA.debugLine="pnlBasket.Visible = False";
mostCurrent._pnlbasket.setVisible(anywheresoftware.b4a.keywords.Common.False);
 //BA.debugLineNum = 166;BA.debugLine="Library.CenterView(lblfloat_basket,Activity)";
mostCurrent._library._centerview(mostCurrent.activityBA,(anywheresoftware.b4a.objects.ConcreteViewWrapper) anywheresoftware.b4a.AbsObjectWrapper.ConvertToWrapper(new anywheresoftware.b4a.objects.ConcreteViewWrapper(), (android.view.View)(mostCurrent._lblfloat_basket.getObject())),(anywheresoftware.b4a.objects.ConcreteViewWrapper) anywheresoftware.b4a.AbsObjectWrapper.ConvertToWrapper(new anywheresoftware.b4a.objects.ConcreteViewWrapper(), (android.view.View)(mostCurrent._activity.getObject())));
 //BA.debugLineNum = 168;BA.debugLine="MyToastMessageShow.Initialize(Activity)";
mostCurrent._mytoastmessageshow._initialize(mostCurrent.activityBA,(anywheresoftware.b4a.objects.PanelWrapper) anywheresoftware.b4a.AbsObjectWrapper.ConvertToWrapper(new anywheresoftware.b4a.objects.PanelWrapper(), (android.view.ViewGroup)(mostCurrent._activity.getObject())));
 //BA.debugLineNum = 170;BA.debugLine="If Library.IsEnglish Then";
if (mostCurrent._library._isenglish(mostCurrent.activityBA)) { 
 //BA.debugLineNum = 171;BA.debugLine="sv1.Panel.LoadLayout(\"frmproduct_en\")";
mostCurrent._sv1.getPanel().LoadLayout("frmproduct_en",mostCurrent.activityBA);
 }else {
 //BA.debugLineNum = 173;BA.debugLine="sv1.Panel.LoadLayout(\"frmproduct\")";
mostCurrent._sv1.getPanel().LoadLayout("frmproduct",mostCurrent.activityBA);
 };
 //BA.debugLineNum = 176;BA.debugLine="lblpre_price.Typeface = Library.GetFont";
mostCurrent._lblpre_price.setTypeface((android.graphics.Typeface)(mostCurrent._library._getfont(mostCurrent.activityBA).getObject()));
 //BA.debugLineNum = 177;BA.debugLine="lbldate.Typeface = Library.GetFont";
mostCurrent._lbldate.setTypeface((android.graphics.Typeface)(mostCurrent._library._getfont(mostCurrent.activityBA).getObject()));
 //BA.debugLineNum = 179;BA.debugLine="CurrentTimerSpecialWidth = pnllistnumb.Width";
_currenttimerspecialwidth = mostCurrent._pnllistnumb.getWidth();
 //BA.debugLineNum = 182;BA.debugLine="sv1.Panel.Height = pnl2.Height + pnl2.top + 100di";
mostCurrent._sv1.getPanel().setHeight((int) (mostCurrent._pnl2.getHeight()+mostCurrent._pnl2.getTop()+anywheresoftware.b4a.keywords.Common.DipToCurrent((int) (100))));
 //BA.debugLineNum = 183;BA.debugLine="sv1.ScrollPosition = 0";
mostCurrent._sv1.setScrollPosition((int) (0));
 //BA.debugLineNum = 185;BA.debugLine="details.Initialize";
mostCurrent._details._initialize(processBA);
 //BA.debugLineNum = 186;BA.debugLine="listBanner.Initialize";
mostCurrent._listbanner.Initialize();
 //BA.debugLineNum = 188;BA.debugLine="lblratetitle.Text = Library.GetStringResourse(\"ra";
mostCurrent._lblratetitle.setText(BA.ObjectToCharSequence(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"ratetitle")));
 //BA.debugLineNum = 189;BA.debugLine="lbldatetitle.Text = Library.GetStringResourse(\"da";
mostCurrent._lbldatetitle.setText(BA.ObjectToCharSequence(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"datetitle")));
 //BA.debugLineNum = 190;BA.debugLine="lblmodeltitle.Text = Library.GetStringResourse(\"m";
mostCurrent._lblmodeltitle.setText(BA.ObjectToCharSequence(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"modeltitle")));
 //BA.debugLineNum = 191;BA.debugLine="lblproducertitle.Text = Library.GetStringResourse";
mostCurrent._lblproducertitle.setText(BA.ObjectToCharSequence(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"producertitle")));
 //BA.debugLineNum = 192;BA.debugLine="lblstatetitle.Text = Library.GetStringResourse(\"s";
mostCurrent._lblstatetitle.setText(BA.ObjectToCharSequence(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"statetitle")));
 //BA.debugLineNum = 193;BA.debugLine="lblvisitcount.Text = Library.GetStringResourse(\"v";
mostCurrent._lblvisitcount.setText(BA.ObjectToCharSequence(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"visitcount")));
 //BA.debugLineNum = 194;BA.debugLine="lbloptions.Text  = Library.GetStringResourse(\"opt";
mostCurrent._lbloptions.setText(BA.ObjectToCharSequence(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"options")));
 //BA.debugLineNum = 195;BA.debugLine="lblattr.Text  = Library.GetStringResourse(\"attrib";
mostCurrent._lblattr.setText(BA.ObjectToCharSequence(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"attribute")));
 //BA.debugLineNum = 196;BA.debugLine="btnattributes.Text = Library.GetStringResourse(\"a";
mostCurrent._btnattributes.setText(BA.ObjectToCharSequence(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"attribute")));
 //BA.debugLineNum = 198;BA.debugLine="IsOpenProduct = True";
_isopenproduct = anywheresoftware.b4a.keywords.Common.True;
 //BA.debugLineNum = 199;BA.debugLine="slidemenu1.Initialize(Content,Me)";
mostCurrent._slidemenu1._initialize(mostCurrent.activityBA,_content,actproduct.getObject());
 //BA.debugLineNum = 201;BA.debugLine="lbls1.TextColor = Library.Theme_Header";
mostCurrent._lbls1.setTextColor(mostCurrent._library._theme_header);
 //BA.debugLineNum = 202;BA.debugLine="lbls2.TextColor = Library.Theme_Header";
mostCurrent._lbls2.setTextColor(mostCurrent._library._theme_header);
 //BA.debugLineNum = 203;BA.debugLine="lbls3.TextColor = Library.Theme_Header";
mostCurrent._lbls3.setTextColor(mostCurrent._library._theme_header);
 //BA.debugLineNum = 204;BA.debugLine="lbls4.TextColor = Library.Theme_Header";
mostCurrent._lbls4.setTextColor(mostCurrent._library._theme_header);
 //BA.debugLineNum = 205;BA.debugLine="lbls5.TextColor = Library.Theme_Header";
mostCurrent._lbls5.setTextColor(mostCurrent._library._theme_header);
 //BA.debugLineNum = 211;BA.debugLine="If product.ContainsKey(\"product_id\") = False Then";
if (_product.ContainsKey((Object)("product_id"))==anywheresoftware.b4a.keywords.Common.False) { 
 //BA.debugLineNum = 212;BA.debugLine="LoadItem";
_loaditem();
 }else {
 //BA.debugLineNum = 215;BA.debugLine="Dim detailsTemp As Map";
_detailstemp = new anywheresoftware.b4a.objects.collections.Map();
 //BA.debugLineNum = 216;BA.debugLine="detailsTemp = Library.CacheSystem.GetCacheAsMap(";
_detailstemp = mostCurrent._library._cachesystem._getcacheasmap(BA.ObjectToString(_product.Get((Object)("product_id"))),"product_description");
 //BA.debugLineNum = 218;BA.debugLine="If detailsTemp <> Null And detailsTemp.IsInitial";
if (_detailstemp!= null && _detailstemp.IsInitialized()) { 
 //BA.debugLineNum = 219;BA.debugLine="Details_receive(detailsTemp,\"\")";
_details_receive(_detailstemp,"");
 }else {
 //BA.debugLineNum = 221;BA.debugLine="If Library.InternetState = False Then";
if (mostCurrent._library._internetstate(mostCurrent.activityBA)==anywheresoftware.b4a.keywords.Common.False) { 
 //BA.debugLineNum = 222;BA.debugLine="ToastMessageShow(Library.GetStringResourse(\"er";
anywheresoftware.b4a.keywords.Common.ToastMessageShow(BA.ObjectToCharSequence(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"error_net_title")),anywheresoftware.b4a.keywords.Common.False);
 //BA.debugLineNum = 223;BA.debugLine="Activity.Finish";
mostCurrent._activity.Finish();
 //BA.debugLineNum = 224;BA.debugLine="Return";
if (true) return "";
 };
 //BA.debugLineNum = 228;BA.debugLine="details.ProductDetails(Me,\"Details_receive\",pro";
mostCurrent._details._productdetails(actproduct.getObject(),"Details_receive",BA.ObjectToString(_product.Get((Object)("product_id"))));
 };
 };
 //BA.debugLineNum = 233;BA.debugLine="GetCart";
_getcart();
 //BA.debugLineNum = 235;BA.debugLine="End Sub";
return "";
}
public static boolean  _activity_keypress(int _keycode) throws Exception{
 //BA.debugLineNum = 1312;BA.debugLine="Sub Activity_KeyPress (KeyCode As Int) As Boolean";
 //BA.debugLineNum = 1314;BA.debugLine="If KeyCode = KeyCodes.KEYCODE_MENU Then";
if (_keycode==anywheresoftware.b4a.keywords.Common.KeyCodes.KEYCODE_MENU) { 
 //BA.debugLineNum = 1315;BA.debugLine="slidemenu1.ToggleMenu";
mostCurrent._slidemenu1._togglemenu();
 }else if(_keycode==anywheresoftware.b4a.keywords.Common.KeyCodes.KEYCODE_BACK) { 
 //BA.debugLineNum = 1319;BA.debugLine="If pnlQR.IsInitialized Then";
if (mostCurrent._pnlqr.IsInitialized()) { 
 //BA.debugLineNum = 1320;BA.debugLine="If pnlQR.Visible = True Then";
if (mostCurrent._pnlqr.getVisible()==anywheresoftware.b4a.keywords.Common.True) { 
 //BA.debugLineNum = 1321;BA.debugLine="pnlQR.SetVisibleAnimated(500,False)";
mostCurrent._pnlqr.SetVisibleAnimated((int) (500),anywheresoftware.b4a.keywords.Common.False);
 //BA.debugLineNum = 1322;BA.debugLine="Return True";
if (true) return anywheresoftware.b4a.keywords.Common.True;
 };
 };
 //BA.debugLineNum = 1326;BA.debugLine="If pnlReviews.top = 0 And pnlReviews.Visible = T";
if (mostCurrent._pnlreviews.getTop()==0 && mostCurrent._pnlreviews.getVisible()==anywheresoftware.b4a.keywords.Common.True) { 
 //BA.debugLineNum = 1327;BA.debugLine="btnbackreviews_Click";
_btnbackreviews_click();
 //BA.debugLineNum = 1328;BA.debugLine="Return True";
if (true) return anywheresoftware.b4a.keywords.Common.True;
 };
 //BA.debugLineNum = 1331;BA.debugLine="If pnlAttribute.top = 0 And pnlAttribute.Visible";
if (mostCurrent._pnlattribute.getTop()==0 && mostCurrent._pnlattribute.getVisible()==anywheresoftware.b4a.keywords.Common.True) { 
 //BA.debugLineNum = 1332;BA.debugLine="btnbackattr_Click";
_btnbackattr_click();
 //BA.debugLineNum = 1333;BA.debugLine="Return True";
if (true) return anywheresoftware.b4a.keywords.Common.True;
 };
 //BA.debugLineNum = 1336;BA.debugLine="IsOpenProduct = False";
_isopenproduct = anywheresoftware.b4a.keywords.Common.False;
 //BA.debugLineNum = 1337;BA.debugLine="Activity.Finish";
mostCurrent._activity.Finish();
 //BA.debugLineNum = 1339;BA.debugLine="Return True";
if (true) return anywheresoftware.b4a.keywords.Common.True;
 };
 //BA.debugLineNum = 1343;BA.debugLine="End Sub";
return false;
}
public static String  _activity_pause(boolean _userclosed) throws Exception{
 //BA.debugLineNum = 347;BA.debugLine="Sub Activity_Pause (UserClosed As Boolean)";
 //BA.debugLineNum = 349;BA.debugLine="timerSpecial.Enabled = False";
mostCurrent._timerspecial.setEnabled(anywheresoftware.b4a.keywords.Common.False);
 //BA.debugLineNum = 350;BA.debugLine="Library.AnimationFromLeft2Right";
mostCurrent._library._animationfromleft2right(mostCurrent.activityBA);
 //BA.debugLineNum = 352;BA.debugLine="If ClickedMenu = True Then";
if (_clickedmenu==anywheresoftware.b4a.keywords.Common.True) { 
 //BA.debugLineNum = 353;BA.debugLine="ClickedMenu = False";
_clickedmenu = anywheresoftware.b4a.keywords.Common.False;
 //BA.debugLineNum = 354;BA.debugLine="IsOpenProduct = False";
_isopenproduct = anywheresoftware.b4a.keywords.Common.False;
 //BA.debugLineNum = 355;BA.debugLine="Activity.Finish";
mostCurrent._activity.Finish();
 };
 //BA.debugLineNum = 358;BA.debugLine="End Sub";
return "";
}
public static String  _activity_resume() throws Exception{
 //BA.debugLineNum = 331;BA.debugLine="Sub Activity_Resume";
 //BA.debugLineNum = 336;BA.debugLine="lbldescription.Text = lbldescription.Text";
mostCurrent._lbldescription.setText(BA.ObjectToCharSequence(mostCurrent._lbldescription.getText()));
 //BA.debugLineNum = 338;BA.debugLine="If product = Null Then";
if (_product== null) { 
 //BA.debugLineNum = 339;BA.debugLine="Activity.Finish";
mostCurrent._activity.Finish();
 //BA.debugLineNum = 340;BA.debugLine="Return";
if (true) return "";
 };
 //BA.debugLineNum = 343;BA.debugLine="If product.IsInitialized = False Then Activity.Fi";
if (_product.IsInitialized()==anywheresoftware.b4a.keywords.Common.False) { 
mostCurrent._activity.Finish();};
 //BA.debugLineNum = 345;BA.debugLine="End Sub";
return "";
}
public static String  _add2cart_receive(anywheresoftware.b4a.objects.collections.Map _res,String _cat) throws Exception{
anywheresoftware.b4a.objects.collections.Map _rs = null;
String _err = "";
int _i = 0;
String _temp = "";
 //BA.debugLineNum = 1258;BA.debugLine="Sub Add2Cart_receive(res As Map,cat As String)";
 //BA.debugLineNum = 1260;BA.debugLine="progress.Visible = False";
mostCurrent._progress.setVisible(anywheresoftware.b4a.keywords.Common.False);
 //BA.debugLineNum = 1262;BA.debugLine="If res.ContainsKey(\"error\") Then";
if (_res.ContainsKey((Object)("error"))) { 
 //BA.debugLineNum = 1264;BA.debugLine="Dim rs As Map";
_rs = new anywheresoftware.b4a.objects.collections.Map();
 //BA.debugLineNum = 1265;BA.debugLine="Dim err As String";
_err = "";
 //BA.debugLineNum = 1267;BA.debugLine="rs = res.Get(\"error\")";
_rs.setObject((anywheresoftware.b4a.objects.collections.Map.MyMap)(_res.Get((Object)("error"))));
 //BA.debugLineNum = 1269;BA.debugLine="For i = 0 To rs.Size - 1";
{
final int step6 = 1;
final int limit6 = (int) (_rs.getSize()-1);
for (_i = (int) (0) ; (step6 > 0 && _i <= limit6) || (step6 < 0 && _i >= limit6); _i = ((int)(0 + _i + step6)) ) {
 //BA.debugLineNum = 1270;BA.debugLine="Dim temp As String";
_temp = "";
 //BA.debugLineNum = 1271;BA.debugLine="temp = rs.GetValueAt(i)";
_temp = BA.ObjectToString(_rs.GetValueAt(_i));
 //BA.debugLineNum = 1272;BA.debugLine="temp = temp.Replace(\"{\",\"\").Replace(\"}\",\"\").Rep";
_temp = _temp.replace("{","").replace("}","").replace(",","");
 //BA.debugLineNum = 1273;BA.debugLine="temp = Library.RegexReplace(\"\\d+=\",temp,CRLF)";
_temp = mostCurrent._library._regexreplace(mostCurrent.activityBA,"\\d+=",_temp,anywheresoftware.b4a.keywords.Common.CRLF);
 //BA.debugLineNum = 1274;BA.debugLine="err = err & temp & CRLF";
_err = _err+_temp+anywheresoftware.b4a.keywords.Common.CRLF;
 }
};
 //BA.debugLineNum = 1277;BA.debugLine="MyToastMessageShow.ShowToastMessageShow(err,2,Fa";
mostCurrent._mytoastmessageshow._showtoastmessageshow(_err,(long) (2),anywheresoftware.b4a.keywords.Common.False);
 //BA.debugLineNum = 1279;BA.debugLine="Return";
if (true) return "";
 };
 //BA.debugLineNum = 1283;BA.debugLine="If res.Get(\"success\") = True Then";
if ((_res.Get((Object)("success"))).equals((Object)(anywheresoftware.b4a.keywords.Common.True))) { 
 //BA.debugLineNum = 1284;BA.debugLine="sv1.ScrollPosition = 0";
mostCurrent._sv1.setScrollPosition((int) (0));
 //BA.debugLineNum = 1285;BA.debugLine="DoEvents";
anywheresoftware.b4a.keywords.Common.DoEvents();
 //BA.debugLineNum = 1286;BA.debugLine="MyToastMessageShow.ShowToastMessageShow(Library.";
mostCurrent._mytoastmessageshow._showtoastmessageshow(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"add2cart"),(long) (2),anywheresoftware.b4a.keywords.Common.True);
 };
 //BA.debugLineNum = 1289;BA.debugLine="GetCart";
_getcart();
 //BA.debugLineNum = 1291;BA.debugLine="End Sub";
return "";
}
public static String  _add2cart2_receive(anywheresoftware.b4a.objects.collections.Map _res,String _cat) throws Exception{
anywheresoftware.b4a.objects.collections.Map _rs = null;
 //BA.debugLineNum = 1928;BA.debugLine="Sub Add2Cart2_receive(res As Map,cat As String)";
 //BA.debugLineNum = 1930;BA.debugLine="ProgressDialogHide";
anywheresoftware.b4a.keywords.Common.ProgressDialogHide();
 //BA.debugLineNum = 1932;BA.debugLine="If res.ContainsKey(\"error\") Then";
if (_res.ContainsKey((Object)("error"))) { 
 //BA.debugLineNum = 1934;BA.debugLine="Dim rs As Map";
_rs = new anywheresoftware.b4a.objects.collections.Map();
 //BA.debugLineNum = 1936;BA.debugLine="rs = res.Get(\"error\")";
_rs.setObject((anywheresoftware.b4a.objects.collections.Map.MyMap)(_res.Get((Object)("error"))));
 //BA.debugLineNum = 1938;BA.debugLine="If rs.ContainsKey(\"option\") Then";
if (_rs.ContainsKey((Object)("option"))) { 
 //BA.debugLineNum = 1939;BA.debugLine="MyToastMessageShow.ShowToastMessageShow(Library";
mostCurrent._mytoastmessageshow._showtoastmessageshow(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"cannot_add_cart"),(long) (2),anywheresoftware.b4a.keywords.Common.False);
 //BA.debugLineNum = 1940;BA.debugLine="product = CreateMap(\"product_id\":Library.Produc";
_product = anywheresoftware.b4a.keywords.Common.createMap(new Object[] {(Object)("product_id"),(Object)(mostCurrent._library._productchoosenid)});
 //BA.debugLineNum = 1941;BA.debugLine="Library.ProductChoosenID = 0";
mostCurrent._library._productchoosenid = BA.NumberToString(0);
 //BA.debugLineNum = 1942;BA.debugLine="Activity_Create(False)";
_activity_create(anywheresoftware.b4a.keywords.Common.False);
 //BA.debugLineNum = 1943;BA.debugLine="Return";
if (true) return "";
 };
 };
 //BA.debugLineNum = 1948;BA.debugLine="If res.Get(\"success\") = True Then";
if ((_res.Get((Object)("success"))).equals((Object)(anywheresoftware.b4a.keywords.Common.True))) { 
 //BA.debugLineNum = 1949;BA.debugLine="sv1.ScrollPosition = 0";
mostCurrent._sv1.setScrollPosition((int) (0));
 //BA.debugLineNum = 1950;BA.debugLine="DoEvents";
anywheresoftware.b4a.keywords.Common.DoEvents();
 //BA.debugLineNum = 1951;BA.debugLine="MyToastMessageShow.ShowToastMessageShow(Library.";
mostCurrent._mytoastmessageshow._showtoastmessageshow(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"add2cart"),(long) (2),anywheresoftware.b4a.keywords.Common.True);
 };
 //BA.debugLineNum = 1954;BA.debugLine="Library.ProductChoosenID = 0";
mostCurrent._library._productchoosenid = BA.NumberToString(0);
 //BA.debugLineNum = 1956;BA.debugLine="End Sub";
return "";
}
public static String  _addbullet(int _size) throws Exception{
int _left = 0;
anywheresoftware.b4a.objects.drawable.ColorDrawable _c1 = null;
anywheresoftware.b4a.objects.drawable.ColorDrawable _c2 = null;
int _i = 0;
anywheresoftware.b4a.objects.PanelWrapper _p1 = null;
 //BA.debugLineNum = 237;BA.debugLine="Sub AddBullet(size As Int)";
 //BA.debugLineNum = 239;BA.debugLine="Dim left As Int";
_left = 0;
 //BA.debugLineNum = 240;BA.debugLine="left = 0";
_left = (int) (0);
 //BA.debugLineNum = 242;BA.debugLine="If bullet.IsInitialized = False Then bullet.Initi";
if (mostCurrent._bullet.IsInitialized()==anywheresoftware.b4a.keywords.Common.False) { 
mostCurrent._bullet.Initialize();};
 //BA.debugLineNum = 244;BA.debugLine="Dim c1,c2 As ColorDrawable";
_c1 = new anywheresoftware.b4a.objects.drawable.ColorDrawable();
_c2 = new anywheresoftware.b4a.objects.drawable.ColorDrawable();
 //BA.debugLineNum = 245;BA.debugLine="c1.Initialize(Colors.RGB(66,66,66),50)";
_c1.Initialize(anywheresoftware.b4a.keywords.Common.Colors.RGB((int) (66),(int) (66),(int) (66)),(int) (50));
 //BA.debugLineNum = 246;BA.debugLine="c2.Initialize(Colors.RGB(191,191,191),50)";
_c2.Initialize(anywheresoftware.b4a.keywords.Common.Colors.RGB((int) (191),(int) (191),(int) (191)),(int) (50));
 //BA.debugLineNum = 249;BA.debugLine="pnlcircle.Width = 0";
mostCurrent._pnlcircle.setWidth((int) (0));
 //BA.debugLineNum = 251;BA.debugLine="For i = 1 To size";
{
final int step8 = 1;
final int limit8 = _size;
for (_i = (int) (1) ; (step8 > 0 && _i <= limit8) || (step8 < 0 && _i >= limit8); _i = ((int)(0 + _i + step8)) ) {
 //BA.debugLineNum = 253;BA.debugLine="Dim p1 As Panel";
_p1 = new anywheresoftware.b4a.objects.PanelWrapper();
 //BA.debugLineNum = 254;BA.debugLine="p1.Initialize(\"\")";
_p1.Initialize(mostCurrent.activityBA,"");
 //BA.debugLineNum = 255;BA.debugLine="pnlcircle.AddView(p1,left,pnlcircle.Height /2.2,";
mostCurrent._pnlcircle.AddView((android.view.View)(_p1.getObject()),_left,(int) (mostCurrent._pnlcircle.getHeight()/(double)2.2),anywheresoftware.b4a.keywords.Common.DipToCurrent((int) (10)),anywheresoftware.b4a.keywords.Common.DipToCurrent((int) (10)));
 //BA.debugLineNum = 256;BA.debugLine="p1.Background = c1";
_p1.setBackground((android.graphics.drawable.Drawable)(_c1.getObject()));
 //BA.debugLineNum = 257;BA.debugLine="left = left + 14dip";
_left = (int) (_left+anywheresoftware.b4a.keywords.Common.DipToCurrent((int) (14)));
 //BA.debugLineNum = 258;BA.debugLine="pnlcircle.Width = left";
mostCurrent._pnlcircle.setWidth(_left);
 //BA.debugLineNum = 259;BA.debugLine="bullet.Add(p1)";
mostCurrent._bullet.Add((Object)(_p1.getObject()));
 }
};
 //BA.debugLineNum = 262;BA.debugLine="Library.CenterView(pnlcircle,Activity)";
mostCurrent._library._centerview(mostCurrent.activityBA,(anywheresoftware.b4a.objects.ConcreteViewWrapper) anywheresoftware.b4a.AbsObjectWrapper.ConvertToWrapper(new anywheresoftware.b4a.objects.ConcreteViewWrapper(), (android.view.View)(mostCurrent._pnlcircle.getObject())),(anywheresoftware.b4a.objects.ConcreteViewWrapper) anywheresoftware.b4a.AbsObjectWrapper.ConvertToWrapper(new anywheresoftware.b4a.objects.ConcreteViewWrapper(), (android.view.View)(mostCurrent._activity.getObject())));
 //BA.debugLineNum = 264;BA.debugLine="End Sub";
return "";
}
public static int  _addheader(String _title,String _tag,int _tops) throws Exception{
anywheresoftware.b4a.objects.PanelWrapper _p1 = null;
anywheresoftware.b4a.objects.drawable.ColorDrawable _c1 = null;
 //BA.debugLineNum = 1095;BA.debugLine="Sub AddHeader(Title As String,Tag As String,Tops A";
 //BA.debugLineNum = 1097;BA.debugLine="Dim p1 As Panel";
_p1 = new anywheresoftware.b4a.objects.PanelWrapper();
 //BA.debugLineNum = 1098;BA.debugLine="p1.Initialize(\"\")";
_p1.Initialize(mostCurrent.activityBA,"");
 //BA.debugLineNum = 1099;BA.debugLine="sv1.Panel.AddView(p1,0,Tops,sv1.Width,0)";
mostCurrent._sv1.getPanel().AddView((android.view.View)(_p1.getObject()),(int) (0),_tops,mostCurrent._sv1.getWidth(),(int) (0));
 //BA.debugLineNum = 1101;BA.debugLine="If Library.IsPersian Then";
if (mostCurrent._library._ispersian(mostCurrent.activityBA)) { 
 //BA.debugLineNum = 1102;BA.debugLine="p1.LoadLayout(\"frmheader_template\")";
_p1.LoadLayout("frmheader_template",mostCurrent.activityBA);
 }else {
 //BA.debugLineNum = 1104;BA.debugLine="p1.LoadLayout(\"frmheader_template_en\")";
_p1.LoadLayout("frmheader_template_en",mostCurrent.activityBA);
 };
 //BA.debugLineNum = 1107;BA.debugLine="p1.Height = pnlheadert.Height";
_p1.setHeight(mostCurrent._pnlheadert.getHeight());
 //BA.debugLineNum = 1108;BA.debugLine="lblheadername.Text = Title";
mostCurrent._lblheadername.setText(BA.ObjectToCharSequence(_title));
 //BA.debugLineNum = 1109;BA.debugLine="pnloverheader.Tag = Tag";
mostCurrent._pnloverheader.setTag((Object)(_tag));
 //BA.debugLineNum = 1111;BA.debugLine="Tops = Tops + p1.Height + 4dip";
_tops = (int) (_tops+_p1.getHeight()+anywheresoftware.b4a.keywords.Common.DipToCurrent((int) (4)));
 //BA.debugLineNum = 1113;BA.debugLine="Dim c1 As ColorDrawable";
_c1 = new anywheresoftware.b4a.objects.drawable.ColorDrawable();
 //BA.debugLineNum = 1114;BA.debugLine="c1.Initialize(Library.Theme_Header,16dip)";
_c1.Initialize(mostCurrent._library._theme_header,anywheresoftware.b4a.keywords.Common.DipToCurrent((int) (16)));
 //BA.debugLineNum = 1115;BA.debugLine="pnlheaderproduct.Background = c1";
mostCurrent._pnlheaderproduct.setBackground((android.graphics.drawable.Drawable)(_c1.getObject()));
 //BA.debugLineNum = 1117;BA.debugLine="sv1.Panel.Height = sv1.Panel.Height + p1.Height";
mostCurrent._sv1.getPanel().setHeight((int) (mostCurrent._sv1.getPanel().getHeight()+_p1.getHeight()));
 //BA.debugLineNum = 1119;BA.debugLine="Return Tops";
if (true) return _tops;
 //BA.debugLineNum = 1121;BA.debugLine="End Sub";
return 0;
}
public static String  _bookmark_receive(anywheresoftware.b4a.objects.collections.Map _res,String _cat) throws Exception{
 //BA.debugLineNum = 1184;BA.debugLine="Sub Bookmark_receive(res As Map,cat As String)";
 //BA.debugLineNum = 1185;BA.debugLine="Log(res)";
anywheresoftware.b4a.keywords.Common.Log(BA.ObjectToString(_res));
 //BA.debugLineNum = 1186;BA.debugLine="End Sub";
return "";
}
public static String  _btnadd_2_cart_click() throws Exception{
anywheresoftware.b4a.objects.ButtonWrapper _b1 = null;
 //BA.debugLineNum = 1919;BA.debugLine="Sub btnadd_2_cart_Click";
 //BA.debugLineNum = 1921;BA.debugLine="Dim b1 As Button";
_b1 = new anywheresoftware.b4a.objects.ButtonWrapper();
 //BA.debugLineNum = 1922;BA.debugLine="b1 = Sender";
_b1.setObject((android.widget.Button)(anywheresoftware.b4a.keywords.Common.Sender(mostCurrent.activityBA)));
 //BA.debugLineNum = 1924;BA.debugLine="Library.Add2Cart(b1.Tag,\"1\",Me)";
mostCurrent._library._add2cart(mostCurrent.activityBA,BA.ObjectToString(_b1.getTag()),"1",actproduct.getObject());
 //BA.debugLineNum = 1926;BA.debugLine="End Sub";
return "";
}
public static String  _btnback_click() throws Exception{
 //BA.debugLineNum = 1307;BA.debugLine="Sub btnback_Click";
 //BA.debugLineNum = 1308;BA.debugLine="slidemenu1.ToggleMenu";
mostCurrent._slidemenu1._togglemenu();
 //BA.debugLineNum = 1310;BA.debugLine="End Sub";
return "";
}
public static String  _btnbackattr_click() throws Exception{
 //BA.debugLineNum = 1472;BA.debugLine="Sub btnbackattr_Click";
 //BA.debugLineNum = 1473;BA.debugLine="pnlAttribute.SetLayoutAnimated(500,0,pnlAttribute";
mostCurrent._pnlattribute.SetLayoutAnimated((int) (500),(int) (0),mostCurrent._pnlattribute.getHeight(),mostCurrent._pnlattribute.getWidth(),mostCurrent._pnlattribute.getHeight());
 //BA.debugLineNum = 1474;BA.debugLine="DoEvents";
anywheresoftware.b4a.keywords.Common.DoEvents();
 //BA.debugLineNum = 1475;BA.debugLine="End Sub";
return "";
}
public static String  _btnbackreviews_click() throws Exception{
 //BA.debugLineNum = 1043;BA.debugLine="Sub btnbackreviews_Click";
 //BA.debugLineNum = 1044;BA.debugLine="pnlReviews.SetLayoutAnimated(500,0,pnlReviews.Hei";
mostCurrent._pnlreviews.SetLayoutAnimated((int) (500),(int) (0),mostCurrent._pnlreviews.getHeight(),mostCurrent._pnlreviews.getWidth(),mostCurrent._pnlreviews.getHeight());
 //BA.debugLineNum = 1045;BA.debugLine="DoEvents";
anywheresoftware.b4a.keywords.Common.DoEvents();
 //BA.debugLineNum = 1046;BA.debugLine="End Sub";
return "";
}
public static String  _btnbasket_click() throws Exception{
 //BA.debugLineNum = 1253;BA.debugLine="Sub btnbasket_Click";
 //BA.debugLineNum = 1254;BA.debugLine="Activity.Finish";
mostCurrent._activity.Finish();
 //BA.debugLineNum = 1255;BA.debugLine="StartActivity(actBasket)";
anywheresoftware.b4a.keywords.Common.StartActivity(mostCurrent.activityBA,(Object)(mostCurrent._actbasket.getObject()));
 //BA.debugLineNum = 1256;BA.debugLine="End Sub";
return "";
}
public static String  _btnbookmark_click() throws Exception{
com.apps.demo.opencart _op = null;
 //BA.debugLineNum = 1165;BA.debugLine="Sub btnbookmark_Click";
 //BA.debugLineNum = 1167;BA.debugLine="Dim op As OpenCart";
_op = new com.apps.demo.opencart();
 //BA.debugLineNum = 1168;BA.debugLine="op.Initialize";
_op._initialize(processBA);
 //BA.debugLineNum = 1170;BA.debugLine="sv1.ScrollToNow(0)";
mostCurrent._sv1.ScrollToNow((int) (0));
 //BA.debugLineNum = 1172;BA.debugLine="If Bookmark.Bookmark(product) = True Then";
if (mostCurrent._bookmark._bookmark(mostCurrent.activityBA,_product)==anywheresoftware.b4a.keywords.Common.True) { 
 //BA.debugLineNum = 1173;BA.debugLine="MyToastMessageShow.ShowToastMessageShow(Library.";
mostCurrent._mytoastmessageshow._showtoastmessageshow(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"add_bookmark"),(long) (2),anywheresoftware.b4a.keywords.Common.True);
 //BA.debugLineNum = 1174;BA.debugLine="btnbookmark.TextColor = Colors.Red";
mostCurrent._btnbookmark.setTextColor(anywheresoftware.b4a.keywords.Common.Colors.Red);
 //BA.debugLineNum = 1175;BA.debugLine="op.Wishlist(Me,\"Bookmark_receive\",product.Get(\"i";
_op._wishlist(actproduct.getObject(),"Bookmark_receive",BA.ObjectToString(_product.Get((Object)("id"))));
 }else {
 //BA.debugLineNum = 1177;BA.debugLine="MyToastMessageShow.ShowToastMessageShow(Library.";
mostCurrent._mytoastmessageshow._showtoastmessageshow(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"remove_bookmark"),(long) (2),anywheresoftware.b4a.keywords.Common.True);
 //BA.debugLineNum = 1178;BA.debugLine="btnbookmark.TextColor = Colors.RGB(145, 145, 145";
mostCurrent._btnbookmark.setTextColor(anywheresoftware.b4a.keywords.Common.Colors.RGB((int) (145),(int) (145),(int) (145)));
 //BA.debugLineNum = 1179;BA.debugLine="op.Wishlist(Me,\"Bookmark_receive\",\"-\" & product.";
_op._wishlist(actproduct.getObject(),"Bookmark_receive","-"+BA.ObjectToString(_product.Get((Object)("id"))));
 };
 //BA.debugLineNum = 1182;BA.debugLine="End Sub";
return "";
}
public static String  _btncategory_click() throws Exception{
 //BA.debugLineNum = 2098;BA.debugLine="Sub btncategory_Click";
 //BA.debugLineNum = 2099;BA.debugLine="StartActivity(actCategory)";
anywheresoftware.b4a.keywords.Common.StartActivity(mostCurrent.activityBA,(Object)(mostCurrent._actcategory.getObject()));
 //BA.debugLineNum = 2100;BA.debugLine="End Sub";
return "";
}
public static String  _btnqr_click() throws Exception{
anywheresoftware.b4a.objects.ImageViewWrapper _im = null;
String _code = "";
 //BA.debugLineNum = 2102;BA.debugLine="Sub btnqr_Click";
 //BA.debugLineNum = 2104;BA.debugLine="If pnlQR.IsInitialized = False Then";
if (mostCurrent._pnlqr.IsInitialized()==anywheresoftware.b4a.keywords.Common.False) { 
 //BA.debugLineNum = 2106;BA.debugLine="pnlQR.Initialize(\"pnlqr\")";
mostCurrent._pnlqr.Initialize(mostCurrent.activityBA,"pnlqr");
 //BA.debugLineNum = 2107;BA.debugLine="pnlQR.Color = Colors.ARGB(210,72,72,72)";
mostCurrent._pnlqr.setColor(anywheresoftware.b4a.keywords.Common.Colors.ARGB((int) (210),(int) (72),(int) (72),(int) (72)));
 //BA.debugLineNum = 2108;BA.debugLine="Activity.AddView(pnlQR,0,0,100%x,100%y)";
mostCurrent._activity.AddView((android.view.View)(mostCurrent._pnlqr.getObject()),(int) (0),(int) (0),anywheresoftware.b4a.keywords.Common.PerXToCurrent((float) (100),mostCurrent.activityBA),anywheresoftware.b4a.keywords.Common.PerYToCurrent((float) (100),mostCurrent.activityBA));
 //BA.debugLineNum = 2109;BA.debugLine="pnlQR.Visible = False";
mostCurrent._pnlqr.setVisible(anywheresoftware.b4a.keywords.Common.False);
 //BA.debugLineNum = 2111;BA.debugLine="Dim im As ImageView";
_im = new anywheresoftware.b4a.objects.ImageViewWrapper();
 //BA.debugLineNum = 2112;BA.debugLine="im.Initialize(\"\")";
_im.Initialize(mostCurrent.activityBA,"");
 //BA.debugLineNum = 2113;BA.debugLine="pnlQR.AddView(im,0,0,250,250)";
mostCurrent._pnlqr.AddView((android.view.View)(_im.getObject()),(int) (0),(int) (0),(int) (250),(int) (250));
 //BA.debugLineNum = 2114;BA.debugLine="im.Gravity = Gravity.FILL";
_im.setGravity(anywheresoftware.b4a.keywords.Common.Gravity.FILL);
 //BA.debugLineNum = 2115;BA.debugLine="Library.CenterView2(im,pnlQR)";
mostCurrent._library._centerview2(mostCurrent.activityBA,(anywheresoftware.b4a.objects.ConcreteViewWrapper) anywheresoftware.b4a.AbsObjectWrapper.ConvertToWrapper(new anywheresoftware.b4a.objects.ConcreteViewWrapper(), (android.view.View)(_im.getObject())),(anywheresoftware.b4a.objects.ConcreteViewWrapper) anywheresoftware.b4a.AbsObjectWrapper.ConvertToWrapper(new anywheresoftware.b4a.objects.ConcreteViewWrapper(), (android.view.View)(mostCurrent._pnlqr.getObject())));
 //BA.debugLineNum = 2117;BA.debugLine="Dim code As String";
_code = "";
 //BA.debugLineNum = 2118;BA.debugLine="code = Library.GetStringResourse(\"url\") & \"/inde";
_code = mostCurrent._library._getstringresourse(mostCurrent.activityBA,"url")+"/index.php?route=product/product&product_id="+BA.ObjectToString(_product.Get((Object)("id")));
 //BA.debugLineNum = 2119;BA.debugLine="QRcode.Draw_QR_Code(code,\"L\",7,Colors.White,Libr";
mostCurrent._qrcode._draw_qr_code(mostCurrent.activityBA,_code,"L",(int) (7),anywheresoftware.b4a.keywords.Common.Colors.White,(int)(Double.parseDouble(mostCurrent._library._converthex2int(mostCurrent.activityBA,mostCurrent._library._getstringresourse(mostCurrent.activityBA,"theme_header")))),"S");
 //BA.debugLineNum = 2121;BA.debugLine="im.Bitmap = LoadBitmap(File.DirRootExternal, \"/p";
_im.setBitmap((android.graphics.Bitmap)(anywheresoftware.b4a.keywords.Common.LoadBitmap(anywheresoftware.b4a.keywords.Common.File.getDirRootExternal(),"/pictures/QRcode.png").getObject()));
 //BA.debugLineNum = 2123;BA.debugLine="pnlQR.SetVisibleAnimated(500,True)";
mostCurrent._pnlqr.SetVisibleAnimated((int) (500),anywheresoftware.b4a.keywords.Common.True);
 //BA.debugLineNum = 2125;BA.debugLine="Return";
if (true) return "";
 };
 //BA.debugLineNum = 2129;BA.debugLine="If pnlQR.Visible = False Then";
if (mostCurrent._pnlqr.getVisible()==anywheresoftware.b4a.keywords.Common.False) { 
 //BA.debugLineNum = 2130;BA.debugLine="pnlQR.SetVisibleAnimated(500,True)";
mostCurrent._pnlqr.SetVisibleAnimated((int) (500),anywheresoftware.b4a.keywords.Common.True);
 }else {
 //BA.debugLineNum = 2132;BA.debugLine="pnlQR.SetVisibleAnimated(500,False)";
mostCurrent._pnlqr.SetVisibleAnimated((int) (500),anywheresoftware.b4a.keywords.Common.False);
 };
 //BA.debugLineNum = 2135;BA.debugLine="End Sub";
return "";
}
public static String  _btnreview_click() throws Exception{
 //BA.debugLineNum = 1021;BA.debugLine="Sub btnreview_Click";
 //BA.debugLineNum = 1022;BA.debugLine="btnbackreviews_Click";
_btnbackreviews_click();
 //BA.debugLineNum = 1023;BA.debugLine="actReview.id = product.Get(\"id\")";
mostCurrent._actreview._id = BA.ObjectToString(_product.Get((Object)("id")));
 //BA.debugLineNum = 1024;BA.debugLine="StartActivity(actReview)";
anywheresoftware.b4a.keywords.Common.StartActivity(mostCurrent.activityBA,(Object)(mostCurrent._actreview.getObject()));
 //BA.debugLineNum = 1025;BA.debugLine="End Sub";
return "";
}
public static String  _btnreviews_click() throws Exception{
 //BA.debugLineNum = 1027;BA.debugLine="Sub btnreviews_Click";
 //BA.debugLineNum = 1029;BA.debugLine="If svReviews.Panel.NumberOfViews = 0 Then";
if (mostCurrent._svreviews.getPanel().getNumberOfViews()==0) { 
 //BA.debugLineNum = 1030;BA.debugLine="LoadReviews";
_loadreviews();
 };
 //BA.debugLineNum = 1033;BA.debugLine="If svReviews.Panel.NumberOfViews = 0 Then Return";
if (mostCurrent._svreviews.getPanel().getNumberOfViews()==0) { 
if (true) return "";};
 //BA.debugLineNum = 1035;BA.debugLine="pnlReviews.top = pnlReviews.Height";
mostCurrent._pnlreviews.setTop(mostCurrent._pnlreviews.getHeight());
 //BA.debugLineNum = 1036;BA.debugLine="pnlReviews.Visible = True";
mostCurrent._pnlreviews.setVisible(anywheresoftware.b4a.keywords.Common.True);
 //BA.debugLineNum = 1037;BA.debugLine="pnlReviews.SetLayoutAnimated(500,0,0,pnlReviews.W";
mostCurrent._pnlreviews.SetLayoutAnimated((int) (500),(int) (0),(int) (0),mostCurrent._pnlreviews.getWidth(),mostCurrent._pnlreviews.getHeight());
 //BA.debugLineNum = 1038;BA.debugLine="pnlReviews.BringToFront";
mostCurrent._pnlreviews.BringToFront();
 //BA.debugLineNum = 1039;BA.debugLine="DoEvents";
anywheresoftware.b4a.keywords.Common.DoEvents();
 //BA.debugLineNum = 1041;BA.debugLine="End Sub";
return "";
}
public static String  _btnscrollup_click() throws Exception{
 //BA.debugLineNum = 2145;BA.debugLine="Sub btnScrollUp_Click";
 //BA.debugLineNum = 2146;BA.debugLine="sv1.ScrollPosition = 0";
mostCurrent._sv1.setScrollPosition((int) (0));
 //BA.debugLineNum = 2147;BA.debugLine="DoEvents";
anywheresoftware.b4a.keywords.Common.DoEvents();
 //BA.debugLineNum = 2148;BA.debugLine="End Sub";
return "";
}
public static String  _btnsearch_click() throws Exception{
String _id = "";
int _i = 0;
 //BA.debugLineNum = 1958;BA.debugLine="Sub btnsearch_Click";
 //BA.debugLineNum = 1960;BA.debugLine="sv1.ScrollToNow(0)";
mostCurrent._sv1.ScrollToNow((int) (0));
 //BA.debugLineNum = 1962;BA.debugLine="If Library.ListProductIDForCompare.Size > 4 Then";
if (mostCurrent._library._listproductidforcompare.getSize()>4) { 
 //BA.debugLineNum = 1963;BA.debugLine="MyToastMessageShow.ShowToastMessageShow(Library.";
mostCurrent._mytoastmessageshow._showtoastmessageshow(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"limit_compare"),(long) (2),anywheresoftware.b4a.keywords.Common.False);
 //BA.debugLineNum = 1964;BA.debugLine="Return";
if (true) return "";
 };
 //BA.debugLineNum = 1967;BA.debugLine="Dim id As String";
_id = "";
 //BA.debugLineNum = 1968;BA.debugLine="id = \"\"";
_id = "";
 //BA.debugLineNum = 1970;BA.debugLine="For i = 0 To Library.ListProductIDForCompare.Size";
{
final int step8 = 1;
final int limit8 = (int) (mostCurrent._library._listproductidforcompare.getSize()-1);
for (_i = (int) (0) ; (step8 > 0 && _i <= limit8) || (step8 < 0 && _i >= limit8); _i = ((int)(0 + _i + step8)) ) {
 //BA.debugLineNum = 1971;BA.debugLine="If Library.ListProductIDForCompare.Get(i) =	prod";
if ((mostCurrent._library._listproductidforcompare.Get(_i)).equals(_product.Get((Object)("product_id")))) { 
 //BA.debugLineNum = 1972;BA.debugLine="MyToastMessageShow.ShowToastMessageShow(Library";
mostCurrent._mytoastmessageshow._showtoastmessageshow(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"adding2comparelist"),(long) (2),anywheresoftware.b4a.keywords.Common.True);
 //BA.debugLineNum = 1973;BA.debugLine="Return";
if (true) return "";
 };
 }
};
 //BA.debugLineNum = 1977;BA.debugLine="If id = \"\" Then id = product.Get(\"id\")";
if ((_id).equals("")) { 
_id = BA.ObjectToString(_product.Get((Object)("id")));};
 //BA.debugLineNum = 1979;BA.debugLine="Library.ListProductIDForCompare.Add(id)";
mostCurrent._library._listproductidforcompare.Add((Object)(_id));
 //BA.debugLineNum = 1981;BA.debugLine="Library.comparelist = Library.GetStringResourse(\"";
mostCurrent._library._comparelist = mostCurrent._library._getstringresourse(mostCurrent.activityBA,"comparelist")+(" ( "+anywheresoftware.b4a.keywords.Common.SmartStringFormatter("",(Object)(mostCurrent._library._listproductidforcompare.getSize()))+" )");
 //BA.debugLineNum = 1982;BA.debugLine="slidemenu1.AddHeader";
mostCurrent._slidemenu1._addheader();
 //BA.debugLineNum = 1984;BA.debugLine="MyToastMessageShow.ShowToastMessageShow(Library.G";
mostCurrent._mytoastmessageshow._showtoastmessageshow(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"adding2comparelist"),(long) (2),anywheresoftware.b4a.keywords.Common.True);
 //BA.debugLineNum = 1986;BA.debugLine="End Sub";
return "";
}
public static String  _btnshare_click() throws Exception{
com.maximus.id.id _id1 = null;
int _rs = 0;
String _link = "";
 //BA.debugLineNum = 1190;BA.debugLine="Sub btnshare_Click";
 //BA.debugLineNum = 1192;BA.debugLine="Dim id1 As id";
_id1 = new com.maximus.id.id();
 //BA.debugLineNum = 1193;BA.debugLine="Dim rs As Int";
_rs = 0;
 //BA.debugLineNum = 1197;BA.debugLine="Dim link As String";
_link = "";
 //BA.debugLineNum = 1200;BA.debugLine="link = details.GetURL & \"/index.php?route=produc";
_link = mostCurrent._details._geturl()+"/index.php?route=product/product&product_id="+BA.ObjectToString(_product.Get((Object)("id")));
 //BA.debugLineNum = 1207;BA.debugLine="Library.ShareString(product.Get(\"name\"),product.G";
mostCurrent._library._sharestring(mostCurrent.activityBA,BA.ObjectToString(_product.Get((Object)("name"))),BA.ObjectToString(_product.Get((Object)("name")))+anywheresoftware.b4a.keywords.Common.CRLF+_link,mostCurrent._library._getstringresourse(mostCurrent.activityBA,"share"));
 //BA.debugLineNum = 1210;BA.debugLine="End Sub";
return "";
}
public static String  _carts_receive(anywheresoftware.b4a.objects.collections.Map _res,String _cat) throws Exception{
 //BA.debugLineNum = 1299;BA.debugLine="Sub Carts_receive(res As Map,cat As String)";
 //BA.debugLineNum = 1300;BA.debugLine="Library.CartDetails = res";
mostCurrent._library._cartdetails = _res;
 //BA.debugLineNum = 1301;BA.debugLine="Library.ShowCartLabel(lblbasket)";
mostCurrent._library._showcartlabel(mostCurrent.activityBA,mostCurrent._lblbasket);
 //BA.debugLineNum = 1302;BA.debugLine="btnbasket.TextColor = Colors.Red";
mostCurrent._btnbasket.setTextColor(anywheresoftware.b4a.keywords.Common.Colors.Red);
 //BA.debugLineNum = 1303;BA.debugLine="End Sub";
return "";
}
public static String  _choosebullet(int _i) throws Exception{
anywheresoftware.b4a.objects.PanelWrapper _p1 = null;
anywheresoftware.b4a.objects.drawable.ColorDrawable _c1 = null;
anywheresoftware.b4a.objects.drawable.ColorDrawable _c2 = null;
anywheresoftware.b4a.objects.ConcreteViewWrapper _v1 = null;
anywheresoftware.b4a.objects.PanelWrapper _p2 = null;
 //BA.debugLineNum = 360;BA.debugLine="Sub ChooseBullet(i As Int)";
 //BA.debugLineNum = 362;BA.debugLine="If i > bullet.Size-1 Then i = 0";
if (_i>mostCurrent._bullet.getSize()-1) { 
_i = (int) (0);};
 //BA.debugLineNum = 364;BA.debugLine="Dim p1 As Panel";
_p1 = new anywheresoftware.b4a.objects.PanelWrapper();
 //BA.debugLineNum = 365;BA.debugLine="p1 = bullet.Get(i)";
_p1.setObject((android.view.ViewGroup)(mostCurrent._bullet.Get(_i)));
 //BA.debugLineNum = 367;BA.debugLine="Dim c1,c2 As ColorDrawable";
_c1 = new anywheresoftware.b4a.objects.drawable.ColorDrawable();
_c2 = new anywheresoftware.b4a.objects.drawable.ColorDrawable();
 //BA.debugLineNum = 368;BA.debugLine="c1.Initialize(Colors.RGB(66,66,66),50)";
_c1.Initialize(anywheresoftware.b4a.keywords.Common.Colors.RGB((int) (66),(int) (66),(int) (66)),(int) (50));
 //BA.debugLineNum = 369;BA.debugLine="c2.Initialize(Colors.RGB(191,191,191),50)";
_c2.Initialize(anywheresoftware.b4a.keywords.Common.Colors.RGB((int) (191),(int) (191),(int) (191)),(int) (50));
 //BA.debugLineNum = 371;BA.debugLine="For Each v1 As View In pnlcircle.GetAllViewsRecur";
_v1 = new anywheresoftware.b4a.objects.ConcreteViewWrapper();
final anywheresoftware.b4a.BA.IterableList group7 = mostCurrent._pnlcircle.GetAllViewsRecursive();
final int groupLen7 = group7.getSize();
for (int index7 = 0;index7 < groupLen7 ;index7++){
_v1.setObject((android.view.View)(group7.Get(index7)));
 //BA.debugLineNum = 372;BA.debugLine="Dim p2 As Panel";
_p2 = new anywheresoftware.b4a.objects.PanelWrapper();
 //BA.debugLineNum = 373;BA.debugLine="p2 = v1";
_p2.setObject((android.view.ViewGroup)(_v1.getObject()));
 //BA.debugLineNum = 374;BA.debugLine="p2.Background = c2";
_p2.setBackground((android.graphics.drawable.Drawable)(_c2.getObject()));
 }
;
 //BA.debugLineNum = 377;BA.debugLine="p1.Background = c1";
_p1.setBackground((android.graphics.drawable.Drawable)(_c1.getObject()));
 //BA.debugLineNum = 379;BA.debugLine="End Sub";
return "";
}
public static String  _details_receive(anywheresoftware.b4a.objects.collections.Map _res,String _cat) throws Exception{
 //BA.debugLineNum = 321;BA.debugLine="Sub Details_receive(res As Map,cat As String)";
 //BA.debugLineNum = 323;BA.debugLine="If res.IsInitialized Then";
if (_res.IsInitialized()) { 
 //BA.debugLineNum = 324;BA.debugLine="product = res";
_product = _res;
 //BA.debugLineNum = 325;BA.debugLine="Library.CacheSystem.AddMap2Cache(res.Get(\"id\"),r";
mostCurrent._library._cachesystem._addmap2cache(BA.ObjectToString(_res.Get((Object)("id"))),_res,"product_description");
 //BA.debugLineNum = 326;BA.debugLine="LoadItem";
_loaditem();
 };
 //BA.debugLineNum = 329;BA.debugLine="End Sub";
return "";
}
public static String  _endtimerspecial() throws Exception{
 //BA.debugLineNum = 860;BA.debugLine="Sub EndTimerSpecial";
 //BA.debugLineNum = 861;BA.debugLine="timerSpecial.Enabled = False";
mostCurrent._timerspecial.setEnabled(anywheresoftware.b4a.keywords.Common.False);
 //BA.debugLineNum = 862;BA.debugLine="pnlprice.top = pnltimer.top - pnltimer.Height";
mostCurrent._pnlprice.setTop((int) (mostCurrent._pnltimer.getTop()-mostCurrent._pnltimer.getHeight()));
 //BA.debugLineNum = 863;BA.debugLine="pnltimer.Visible = False";
mostCurrent._pnltimer.setVisible(anywheresoftware.b4a.keywords.Common.False);
 //BA.debugLineNum = 864;BA.debugLine="pnl2.top = pnlprice.top - pnlprice.Height";
mostCurrent._pnl2.setTop((int) (mostCurrent._pnlprice.getTop()-mostCurrent._pnlprice.getHeight()));
 //BA.debugLineNum = 865;BA.debugLine="End Sub";
return "";
}
public static String  _finishme() throws Exception{
 //BA.debugLineNum = 2141;BA.debugLine="Sub FinishMe";
 //BA.debugLineNum = 2142;BA.debugLine="Activity.Finish";
mostCurrent._activity.Finish();
 //BA.debugLineNum = 2143;BA.debugLine="End Sub";
return "";
}
public static String  _getcart() throws Exception{
com.apps.demo.opencart _cart = null;
 //BA.debugLineNum = 1293;BA.debugLine="Sub GetCart";
 //BA.debugLineNum = 1294;BA.debugLine="Dim cart As OpenCart";
_cart = new com.apps.demo.opencart();
 //BA.debugLineNum = 1295;BA.debugLine="cart.Initialize";
_cart._initialize(processBA);
 //BA.debugLineNum = 1296;BA.debugLine="cart.GetCarts(Me,\"Carts_receive\")";
_cart._getcarts(actproduct.getObject(),"Carts_receive");
 //BA.debugLineNum = 1297;BA.debugLine="End Sub";
return "";
}
public static anywheresoftware.b4a.objects.collections.Map  _getcartoptions() throws Exception{
anywheresoftware.b4a.objects.collections.Map _options = null;
anywheresoftware.b4a.objects.collections.Map _vals = null;
int _i = 0;
anywheresoftware.b4a.objects.ConcreteViewWrapper _v1 = null;
anywheresoftware.b4a.objects.collections.Map _data = null;
anywheresoftware.b4a.objects.EditTextWrapper _txt1 = null;
anywheresoftware.b4a.objects.CompoundButtonWrapper.RadioButtonWrapper _rb1 = null;
anywheresoftware.b4a.objects.SpinnerWrapper _sp1 = null;
anywheresoftware.b4a.objects.collections.List _l1 = null;
String _choosen = "";
int _t = 0;
anywheresoftware.b4a.objects.collections.Map _tempchoose = null;
String _price_format = "";
anywheresoftware.b4a.objects.CompoundButtonWrapper.CheckBoxWrapper _chk1 = null;
int _p = 0;
String _te = "";
String[] _s1 = null;
anywheresoftware.b4a.objects.collections.List _valid_val = null;
int _o = 0;
 //BA.debugLineNum = 1748;BA.debugLine="Sub GetCartOptions As Map";
 //BA.debugLineNum = 1750;BA.debugLine="Dim Options,vals As Map";
_options = new anywheresoftware.b4a.objects.collections.Map();
_vals = new anywheresoftware.b4a.objects.collections.Map();
 //BA.debugLineNum = 1751;BA.debugLine="Options.Initialize";
_options.Initialize();
 //BA.debugLineNum = 1752;BA.debugLine="vals.Initialize";
_vals.Initialize();
 //BA.debugLineNum = 1754;BA.debugLine="For i = 0 To ListOptions.Size - 1";
{
final int step4 = 1;
final int limit4 = (int) (mostCurrent._listoptions.getSize()-1);
for (_i = (int) (0) ; (step4 > 0 && _i <= limit4) || (step4 < 0 && _i >= limit4); _i = ((int)(0 + _i + step4)) ) {
 //BA.debugLineNum = 1756;BA.debugLine="Dim v1 As View";
_v1 = new anywheresoftware.b4a.objects.ConcreteViewWrapper();
 //BA.debugLineNum = 1757;BA.debugLine="Dim data As Map";
_data = new anywheresoftware.b4a.objects.collections.Map();
 //BA.debugLineNum = 1758;BA.debugLine="v1 = ListOptions.Get(i)";
_v1.setObject((android.view.View)(mostCurrent._listoptions.Get(_i)));
 //BA.debugLineNum = 1759;BA.debugLine="data = v1.Tag";
_data.setObject((anywheresoftware.b4a.objects.collections.Map.MyMap)(_v1.getTag()));
 //BA.debugLineNum = 1762;BA.debugLine="If v1 Is EditText Then";
if (_v1.getObjectOrNull() instanceof android.widget.EditText) { 
 //BA.debugLineNum = 1763;BA.debugLine="Dim txt1 As EditText";
_txt1 = new anywheresoftware.b4a.objects.EditTextWrapper();
 //BA.debugLineNum = 1764;BA.debugLine="txt1 = v1";
_txt1.setObject((android.widget.EditText)(_v1.getObject()));
 //BA.debugLineNum = 1765;BA.debugLine="vals.Put(data.Get(\"ID\"),txt1.Text)";
_vals.Put(_data.Get((Object)("ID")),(Object)(_txt1.getText()));
 }else if(_v1.getObjectOrNull() instanceof android.widget.RadioButton) { 
 //BA.debugLineNum = 1770;BA.debugLine="Dim rb1 As RadioButton";
_rb1 = new anywheresoftware.b4a.objects.CompoundButtonWrapper.RadioButtonWrapper();
 //BA.debugLineNum = 1771;BA.debugLine="rb1 = v1";
_rb1.setObject((android.widget.RadioButton)(_v1.getObject()));
 //BA.debugLineNum = 1773;BA.debugLine="If rb1.Checked = True Then";
if (_rb1.getChecked()==anywheresoftware.b4a.keywords.Common.True) { 
 //BA.debugLineNum = 1774;BA.debugLine="vals.Put(data.Get(\"ID\"),data.Get(\"Val\"))";
_vals.Put(_data.Get((Object)("ID")),_data.Get((Object)("Val")));
 };
 }else if(_v1.getObjectOrNull() instanceof anywheresoftware.b4a.objects.SpinnerWrapper.B4ASpinner) { 
 //BA.debugLineNum = 1780;BA.debugLine="Dim sp1 As Spinner";
_sp1 = new anywheresoftware.b4a.objects.SpinnerWrapper();
 //BA.debugLineNum = 1781;BA.debugLine="sp1 = v1";
_sp1.setObject((anywheresoftware.b4a.objects.SpinnerWrapper.B4ASpinner)(_v1.getObject()));
 //BA.debugLineNum = 1783;BA.debugLine="Dim l1 As List";
_l1 = new anywheresoftware.b4a.objects.collections.List();
 //BA.debugLineNum = 1784;BA.debugLine="l1 = data.Get(\"Vals\")";
_l1.setObject((java.util.List)(_data.Get((Object)("Vals"))));
 //BA.debugLineNum = 1786;BA.debugLine="Dim choosen As String";
_choosen = "";
 //BA.debugLineNum = 1787;BA.debugLine="choosen = sp1.SelectedItem";
_choosen = _sp1.getSelectedItem();
 //BA.debugLineNum = 1789;BA.debugLine="For t = 0 To l1.Size - 1";
{
final int step26 = 1;
final int limit26 = (int) (_l1.getSize()-1);
for (_t = (int) (0) ; (step26 > 0 && _t <= limit26) || (step26 < 0 && _t >= limit26); _t = ((int)(0 + _t + step26)) ) {
 //BA.debugLineNum = 1790;BA.debugLine="Dim tempChoose As Map";
_tempchoose = new anywheresoftware.b4a.objects.collections.Map();
 //BA.debugLineNum = 1791;BA.debugLine="tempChoose = l1.Get(t)";
_tempchoose.setObject((anywheresoftware.b4a.objects.collections.Map.MyMap)(_l1.Get(_t)));
 //BA.debugLineNum = 1793;BA.debugLine="Dim price_format As String";
_price_format = "";
 //BA.debugLineNum = 1794;BA.debugLine="price_format = tempChoose.Get(\"price_formated\"";
_price_format = BA.ObjectToString(_tempchoose.Get((Object)("price_formated")));
 //BA.debugLineNum = 1795;BA.debugLine="If price_format = \"false\" Then price_format =";
if ((_price_format).equals("false")) { 
_price_format = " )";};
 //BA.debugLineNum = 1797;BA.debugLine="If tempChoose.Get(\"name\") & \" ( \" & tempChoose";
if ((BA.ObjectToString(_tempchoose.Get((Object)("name")))+" ( "+BA.ObjectToString(_tempchoose.Get((Object)("price_prefix")))+_price_format).equals(_choosen) || _choosen.indexOf(BA.ObjectToString(_tempchoose.Get((Object)("name"))))>-1) { 
 //BA.debugLineNum = 1798;BA.debugLine="vals.Put(data.Get(\"id\"),tempChoose.Get(\"produ";
_vals.Put(_data.Get((Object)("id")),_tempchoose.Get((Object)("product_option_value_id")));
 //BA.debugLineNum = 1799;BA.debugLine="Continue";
if (true) continue;
 };
 }
};
 }else if(_v1.getObjectOrNull() instanceof android.widget.CheckBox) { 
 //BA.debugLineNum = 1808;BA.debugLine="Dim chk1 As CheckBox";
_chk1 = new anywheresoftware.b4a.objects.CompoundButtonWrapper.CheckBoxWrapper();
 //BA.debugLineNum = 1809;BA.debugLine="chk1 = v1";
_chk1.setObject((android.widget.CheckBox)(_v1.getObject()));
 //BA.debugLineNum = 1811;BA.debugLine="If chk1.Checked = True Then";
if (_chk1.getChecked()==anywheresoftware.b4a.keywords.Common.True) { 
 //BA.debugLineNum = 1812;BA.debugLine="If vals.ContainsKey(data.Get(\"ID\")) Then";
if (_vals.ContainsKey(_data.Get((Object)("ID")))) { 
 //BA.debugLineNum = 1813;BA.debugLine="vals.Put(data.Get(\"ID\"),vals.Get(data.Get(\"ID";
_vals.Put(_data.Get((Object)("ID")),(Object)(BA.ObjectToString(_vals.Get(_data.Get((Object)("ID"))))+"<!>"+BA.ObjectToString(_data.Get((Object)("Val")))));
 }else {
 //BA.debugLineNum = 1815;BA.debugLine="vals.Put(data.Get(\"ID\"),data.Get(\"Val\"))";
_vals.Put(_data.Get((Object)("ID")),_data.Get((Object)("Val")));
 };
 };
 };
 }
};
 //BA.debugLineNum = 1823;BA.debugLine="For p = 0 To vals.Size - 1";
{
final int step49 = 1;
final int limit49 = (int) (_vals.getSize()-1);
for (_p = (int) (0) ; (step49 > 0 && _p <= limit49) || (step49 < 0 && _p >= limit49); _p = ((int)(0 + _p + step49)) ) {
 //BA.debugLineNum = 1824;BA.debugLine="Dim te As String";
_te = "";
 //BA.debugLineNum = 1825;BA.debugLine="te = vals.GetValueAt(p)";
_te = BA.ObjectToString(_vals.GetValueAt(_p));
 //BA.debugLineNum = 1826;BA.debugLine="If te.IndexOf(\"<!>\") > -1 Then";
if (_te.indexOf("<!>")>-1) { 
 //BA.debugLineNum = 1827;BA.debugLine="Dim s1() As String";
_s1 = new String[(int) (0)];
java.util.Arrays.fill(_s1,"");
 //BA.debugLineNum = 1828;BA.debugLine="s1 = Regex.Split(\"<!>\",te)";
_s1 = anywheresoftware.b4a.keywords.Common.Regex.Split("<!>",_te);
 //BA.debugLineNum = 1830;BA.debugLine="Dim valid_val As List";
_valid_val = new anywheresoftware.b4a.objects.collections.List();
 //BA.debugLineNum = 1831;BA.debugLine="valid_val.Initialize";
_valid_val.Initialize();
 //BA.debugLineNum = 1833;BA.debugLine="For o = 0 To s1.Length - 1";
{
final int step57 = 1;
final int limit57 = (int) (_s1.length-1);
for (_o = (int) (0) ; (step57 > 0 && _o <= limit57) || (step57 < 0 && _o >= limit57); _o = ((int)(0 + _o + step57)) ) {
 //BA.debugLineNum = 1834;BA.debugLine="valid_val.Add(s1(o))";
_valid_val.Add((Object)(_s1[_o]));
 }
};
 //BA.debugLineNum = 1837;BA.debugLine="vals.Put(vals.GetKeyAt(p),valid_val)";
_vals.Put(_vals.GetKeyAt(_p),(Object)(_valid_val.getObject()));
 };
 }
};
 //BA.debugLineNum = 1841;BA.debugLine="Options.Put(\"options\",vals)";
_options.Put((Object)("options"),(Object)(_vals.getObject()));
 //BA.debugLineNum = 1843;BA.debugLine="Return vals";
if (true) return _vals;
 //BA.debugLineNum = 1845;BA.debugLine="End Sub";
return null;
}
public static boolean  _getdiscount() throws Exception{
String _start_date = "";
String _end_date = "";
String[] _sd = null;
String[] _ed = null;
long _sd1 = 0L;
long _se1 = 0L;
anywheresoftware.b4a.objects.collections.Map _m = null;
 //BA.debugLineNum = 705;BA.debugLine="Sub GetDiscount As Boolean";
 //BA.debugLineNum = 707;BA.debugLine="Dim start_date,end_date As String";
_start_date = "";
_end_date = "";
 //BA.debugLineNum = 708;BA.debugLine="start_date = product.Get(\"special_start_date\")";
_start_date = BA.ObjectToString(_product.Get((Object)("special_start_date")));
 //BA.debugLineNum = 709;BA.debugLine="end_date   = product.Get(\"special_end_date\")";
_end_date = BA.ObjectToString(_product.Get((Object)("special_end_date")));
 //BA.debugLineNum = 711;BA.debugLine="Dim sd() As String = Regex.Split(\"-\",start_date)";
_sd = anywheresoftware.b4a.keywords.Common.Regex.Split("-",_start_date);
 //BA.debugLineNum = 712;BA.debugLine="Dim ed() As String = Regex.Split(\"-\",end_date)";
_ed = anywheresoftware.b4a.keywords.Common.Regex.Split("-",_end_date);
 //BA.debugLineNum = 714;BA.debugLine="File.Delete(File.DirInternal,\"timeout_ids_\" & pro";
anywheresoftware.b4a.keywords.Common.File.Delete(anywheresoftware.b4a.keywords.Common.File.getDirInternal(),"timeout_ids_"+BA.ObjectToString(_product.Get((Object)("id"))));
 //BA.debugLineNum = 716;BA.debugLine="If start_date = \"0000-00-00\" Or end_date = \"0000-";
if ((_start_date).equals("0000-00-00") || (_end_date).equals("0000-00-00") || _start_date.length()==0 || _end_date.length()==0) { 
if (true) return anywheresoftware.b4a.keywords.Common.False;};
 //BA.debugLineNum = 718;BA.debugLine="If Regex.IsMatch(\"\\d{4}-\\d{1,2}-\\d{1,2}\",start_da";
if (anywheresoftware.b4a.keywords.Common.Regex.IsMatch("\\d{4}-\\d{1,2}-\\d{1,2}",_start_date) && anywheresoftware.b4a.keywords.Common.Regex.IsMatch("\\d{4}-\\d{1,2}-\\d{1,2}",_end_date)) { 
 //BA.debugLineNum = 720;BA.debugLine="Try";
try { //BA.debugLineNum = 732;BA.debugLine="DateTime.DateFormat = \"yyyy-mm-dd\"";
anywheresoftware.b4a.keywords.Common.DateTime.setDateFormat("yyyy-mm-dd");
 //BA.debugLineNum = 733;BA.debugLine="Dim sd1 As Long = DateUtils.SetDate(DateTime.G";
_sd1 = mostCurrent._dateutils._setdate(mostCurrent.activityBA,anywheresoftware.b4a.keywords.Common.DateTime.GetYear(anywheresoftware.b4a.keywords.Common.DateTime.getNow()),anywheresoftware.b4a.keywords.Common.DateTime.GetMonth(anywheresoftware.b4a.keywords.Common.DateTime.getNow()),anywheresoftware.b4a.keywords.Common.DateTime.GetDayOfMonth(anywheresoftware.b4a.keywords.Common.DateTime.getNow()));
 //BA.debugLineNum = 734;BA.debugLine="Dim se1 As Long = DateUtils.SetDate(ed(0),ed(1";
_se1 = mostCurrent._dateutils._setdate(mostCurrent.activityBA,(int)(Double.parseDouble(_ed[(int) (0)])),(int)(Double.parseDouble(_ed[(int) (1)])),(int)(Double.parseDouble(_ed[(int) (2)])));
 //BA.debugLineNum = 736;BA.debugLine="SpecialDateInformation = DateUtils.PeriodBetwe";
mostCurrent._specialdateinformation = mostCurrent._dateutils._periodbetweenindays(mostCurrent.activityBA,_sd1,_se1);
 //BA.debugLineNum = 738;BA.debugLine="SpecialDateInformation.Days = Abs(SpecialDateI";
mostCurrent._specialdateinformation.Days = (int) (anywheresoftware.b4a.keywords.Common.Abs(mostCurrent._specialdateinformation.Days));
 //BA.debugLineNum = 739;BA.debugLine="SpecialDateInformation.Hours = Abs(SpecialDate";
mostCurrent._specialdateinformation.Hours = (int) (anywheresoftware.b4a.keywords.Common.Abs(mostCurrent._specialdateinformation.Hours));
 //BA.debugLineNum = 740;BA.debugLine="SpecialDateInformation.Minutes = Abs(SpecialDa";
mostCurrent._specialdateinformation.Minutes = (int) (anywheresoftware.b4a.keywords.Common.Abs(mostCurrent._specialdateinformation.Minutes));
 //BA.debugLineNum = 741;BA.debugLine="SpecialDateInformation.Months = Abs(SpecialDat";
mostCurrent._specialdateinformation.Months = (int) (anywheresoftware.b4a.keywords.Common.Abs(mostCurrent._specialdateinformation.Months));
 //BA.debugLineNum = 742;BA.debugLine="SpecialDateInformation.Seconds = Abs(SpecialDa";
mostCurrent._specialdateinformation.Seconds = (int) (anywheresoftware.b4a.keywords.Common.Abs(mostCurrent._specialdateinformation.Seconds));
 //BA.debugLineNum = 743;BA.debugLine="SpecialDateInformation.Years = Abs(SpecialDate";
mostCurrent._specialdateinformation.Years = (int) (anywheresoftware.b4a.keywords.Common.Abs(mostCurrent._specialdateinformation.Years));
 //BA.debugLineNum = 745;BA.debugLine="If SpecialDateInformation.Months > 0 Then";
if (mostCurrent._specialdateinformation.Months>0) { 
 //BA.debugLineNum = 746;BA.debugLine="SpecialDateInformation.Days = SpecialDateInfo";
mostCurrent._specialdateinformation.Days = (int) (mostCurrent._specialdateinformation.Days+(mostCurrent._specialdateinformation.Months*30));
 };
 //BA.debugLineNum = 749;BA.debugLine="If SpecialDateInformation.Days > 0 Then";
if (mostCurrent._specialdateinformation.Days>0) { 
 //BA.debugLineNum = 750;BA.debugLine="SpecialDateInformation.Days = SpecialDateInfo";
mostCurrent._specialdateinformation.Days = (int) (mostCurrent._specialdateinformation.Days-1);
 //BA.debugLineNum = 751;BA.debugLine="SpecialDateInformation.Hours = SpecialDateInf";
mostCurrent._specialdateinformation.Hours = (int) (mostCurrent._specialdateinformation.Hours+24);
 //BA.debugLineNum = 752;BA.debugLine="SpecialDateInformation.Hours = Abs(DateTime.G";
mostCurrent._specialdateinformation.Hours = (int) (anywheresoftware.b4a.keywords.Common.Abs(anywheresoftware.b4a.keywords.Common.DateTime.GetHour(anywheresoftware.b4a.keywords.Common.DateTime.getNow())-mostCurrent._specialdateinformation.Hours));
 //BA.debugLineNum = 754;BA.debugLine="If SpecialDateInformation.Hours > 24 Then";
if (mostCurrent._specialdateinformation.Hours>24) { 
 //BA.debugLineNum = 755;BA.debugLine="SpecialDateInformation.Hours = SpecialDateIn";
mostCurrent._specialdateinformation.Hours = (int) (mostCurrent._specialdateinformation.Hours-24);
 //BA.debugLineNum = 756;BA.debugLine="SpecialDateInformation.Minutes = SpecialDate";
mostCurrent._specialdateinformation.Minutes = (int) (mostCurrent._specialdateinformation.Minutes+59);
 }else {
 //BA.debugLineNum = 758;BA.debugLine="SpecialDateInformation.Hours = SpecialDateIn";
mostCurrent._specialdateinformation.Hours = (int) (mostCurrent._specialdateinformation.Hours-1);
 //BA.debugLineNum = 759;BA.debugLine="SpecialDateInformation.Minutes = Abs(59-Date";
mostCurrent._specialdateinformation.Minutes = (int) (anywheresoftware.b4a.keywords.Common.Abs(59-anywheresoftware.b4a.keywords.Common.DateTime.GetMinute(anywheresoftware.b4a.keywords.Common.DateTime.getNow())));
 //BA.debugLineNum = 760;BA.debugLine="SpecialDateInformation.Seconds = Abs(59-Date";
mostCurrent._specialdateinformation.Seconds = (int) (anywheresoftware.b4a.keywords.Common.Abs(59-anywheresoftware.b4a.keywords.Common.DateTime.GetSecond(anywheresoftware.b4a.keywords.Common.DateTime.getNow())));
 };
 };
 //BA.debugLineNum = 765;BA.debugLine="Dim m As Map";
_m = new anywheresoftware.b4a.objects.collections.Map();
 //BA.debugLineNum = 766;BA.debugLine="m.Initialize";
_m.Initialize();
 //BA.debugLineNum = 767;BA.debugLine="m.Put(\"Years\",SpecialDateInformation.Years)";
_m.Put((Object)("Years"),(Object)(mostCurrent._specialdateinformation.Years));
 //BA.debugLineNum = 768;BA.debugLine="m.Put(\"Months\",SpecialDateInformation.Months)";
_m.Put((Object)("Months"),(Object)(mostCurrent._specialdateinformation.Months));
 //BA.debugLineNum = 769;BA.debugLine="m.Put(\"Days\",SpecialDateInformation.Days)";
_m.Put((Object)("Days"),(Object)(mostCurrent._specialdateinformation.Days));
 //BA.debugLineNum = 770;BA.debugLine="m.Put(\"Hours\",SpecialDateInformation.Hours)";
_m.Put((Object)("Hours"),(Object)(mostCurrent._specialdateinformation.Hours));
 //BA.debugLineNum = 771;BA.debugLine="m.Put(\"Minutes\",SpecialDateInformation.Minutes";
_m.Put((Object)("Minutes"),(Object)(mostCurrent._specialdateinformation.Minutes));
 //BA.debugLineNum = 772;BA.debugLine="m.Put(\"Seconds\",SpecialDateInformation.Seconds";
_m.Put((Object)("Seconds"),(Object)(mostCurrent._specialdateinformation.Seconds));
 //BA.debugLineNum = 773;BA.debugLine="File.WriteMap(File.DirInternal,\"timeout_ids_\"";
anywheresoftware.b4a.keywords.Common.File.WriteMap(anywheresoftware.b4a.keywords.Common.File.getDirInternal(),"timeout_ids_"+BA.ObjectToString(_product.Get((Object)("id"))),_m);
 //BA.debugLineNum = 777;BA.debugLine="Return True";
if (true) return anywheresoftware.b4a.keywords.Common.True;
 } 
       catch (Exception e47) {
			processBA.setLastException(e47); };
 };
 //BA.debugLineNum = 784;BA.debugLine="Return False";
if (true) return anywheresoftware.b4a.keywords.Common.False;
 //BA.debugLineNum = 786;BA.debugLine="End Sub";
return false;
}
public static String  _globals() throws Exception{
 //BA.debugLineNum = 12;BA.debugLine="Sub Globals";
 //BA.debugLineNum = 13;BA.debugLine="Private ScollButton As Button";
mostCurrent._scollbutton = new anywheresoftware.b4a.objects.ButtonWrapper();
 //BA.debugLineNum = 14;BA.debugLine="Private btnqr As Button";
mostCurrent._btnqr = new anywheresoftware.b4a.objects.ButtonWrapper();
 //BA.debugLineNum = 15;BA.debugLine="Dim status As StatusBarCompat";
mostCurrent._status = new wrap.Wrap();
 //BA.debugLineNum = 16;BA.debugLine="Dim progress As Panel";
mostCurrent._progress = new anywheresoftware.b4a.objects.PanelWrapper();
 //BA.debugLineNum = 17;BA.debugLine="Private googlebar As GoogleProgressBar";
mostCurrent._googlebar = new de.donmanfred.GoogleProgressBarWrapper();
 //BA.debugLineNum = 18;BA.debugLine="Private bullet As List";
mostCurrent._bullet = new anywheresoftware.b4a.objects.collections.List();
 //BA.debugLineNum = 19;BA.debugLine="Private lbltitle As Label";
mostCurrent._lbltitle = new anywheresoftware.b4a.objects.LabelWrapper();
 //BA.debugLineNum = 20;BA.debugLine="Private lblprice As Label";
mostCurrent._lblprice = new anywheresoftware.b4a.objects.LabelWrapper();
 //BA.debugLineNum = 21;BA.debugLine="Private lbls1 As Label";
mostCurrent._lbls1 = new anywheresoftware.b4a.objects.LabelWrapper();
 //BA.debugLineNum = 22;BA.debugLine="Private lbls2 As Label";
mostCurrent._lbls2 = new anywheresoftware.b4a.objects.LabelWrapper();
 //BA.debugLineNum = 23;BA.debugLine="Private lbls3 As Label";
mostCurrent._lbls3 = new anywheresoftware.b4a.objects.LabelWrapper();
 //BA.debugLineNum = 24;BA.debugLine="Private lbls4 As Label";
mostCurrent._lbls4 = new anywheresoftware.b4a.objects.LabelWrapper();
 //BA.debugLineNum = 25;BA.debugLine="Private lbls5 As Label";
mostCurrent._lbls5 = new anywheresoftware.b4a.objects.LabelWrapper();
 //BA.debugLineNum = 26;BA.debugLine="Private lblstate As Label";
mostCurrent._lblstate = new anywheresoftware.b4a.objects.LabelWrapper();
 //BA.debugLineNum = 27;BA.debugLine="Private lblproducer As Label";
mostCurrent._lblproducer = new anywheresoftware.b4a.objects.LabelWrapper();
 //BA.debugLineNum = 28;BA.debugLine="Private lbldate As Label";
mostCurrent._lbldate = new anywheresoftware.b4a.objects.LabelWrapper();
 //BA.debugLineNum = 29;BA.debugLine="Private lblmodel As Label";
mostCurrent._lblmodel = new anywheresoftware.b4a.objects.LabelWrapper();
 //BA.debugLineNum = 30;BA.debugLine="Private lblvisit As Label";
mostCurrent._lblvisit = new anywheresoftware.b4a.objects.LabelWrapper();
 //BA.debugLineNum = 31;BA.debugLine="Private btnreview As Button";
mostCurrent._btnreview = new anywheresoftware.b4a.objects.ButtonWrapper();
 //BA.debugLineNum = 32;BA.debugLine="Private pnl2 As Panel";
mostCurrent._pnl2 = new anywheresoftware.b4a.objects.PanelWrapper();
 //BA.debugLineNum = 33;BA.debugLine="Private pnl1 As Panel";
mostCurrent._pnl1 = new anywheresoftware.b4a.objects.PanelWrapper();
 //BA.debugLineNum = 34;BA.debugLine="Dim listSlideshow As List";
mostCurrent._listslideshow = new anywheresoftware.b4a.objects.collections.List();
 //BA.debugLineNum = 35;BA.debugLine="Dim offsetSlideshow As Int";
_offsetslideshow = 0;
 //BA.debugLineNum = 36;BA.debugLine="Private lblratetitle As Label";
mostCurrent._lblratetitle = new anywheresoftware.b4a.objects.LabelWrapper();
 //BA.debugLineNum = 37;BA.debugLine="Private lblstatetitle As Label";
mostCurrent._lblstatetitle = new anywheresoftware.b4a.objects.LabelWrapper();
 //BA.debugLineNum = 38;BA.debugLine="Private lblproducertitle As Label";
mostCurrent._lblproducertitle = new anywheresoftware.b4a.objects.LabelWrapper();
 //BA.debugLineNum = 39;BA.debugLine="Private lbldatetitle As Label";
mostCurrent._lbldatetitle = new anywheresoftware.b4a.objects.LabelWrapper();
 //BA.debugLineNum = 40;BA.debugLine="Private lblmodeltitle As Label";
mostCurrent._lblmodeltitle = new anywheresoftware.b4a.objects.LabelWrapper();
 //BA.debugLineNum = 41;BA.debugLine="Private lblvisitcount As Label";
mostCurrent._lblvisitcount = new anywheresoftware.b4a.objects.LabelWrapper();
 //BA.debugLineNum = 42;BA.debugLine="Dim sv1 As ScrollView";
mostCurrent._sv1 = new anywheresoftware.b4a.objects.ScrollViewWrapper();
 //BA.debugLineNum = 43;BA.debugLine="Private lbldivider2 As Label";
mostCurrent._lbldivider2 = new anywheresoftware.b4a.objects.LabelWrapper();
 //BA.debugLineNum = 44;BA.debugLine="Private lbldescription As Label";
mostCurrent._lbldescription = new anywheresoftware.b4a.objects.LabelWrapper();
 //BA.debugLineNum = 45;BA.debugLine="Dim details As OpenCart";
mostCurrent._details = new com.apps.demo.opencart();
 //BA.debugLineNum = 46;BA.debugLine="Private btnbookmark As Button";
mostCurrent._btnbookmark = new anywheresoftware.b4a.objects.ButtonWrapper();
 //BA.debugLineNum = 47;BA.debugLine="Private lblbasket As Label";
mostCurrent._lblbasket = new anywheresoftware.b4a.objects.LabelWrapper();
 //BA.debugLineNum = 48;BA.debugLine="Private lblauthor As Label";
mostCurrent._lblauthor = new anywheresoftware.b4a.objects.LabelWrapper();
 //BA.debugLineNum = 49;BA.debugLine="Private lbldate_comment As Label";
mostCurrent._lbldate_comment = new anywheresoftware.b4a.objects.LabelWrapper();
 //BA.debugLineNum = 50;BA.debugLine="Private lblcomment_review As Label";
mostCurrent._lblcomment_review = new anywheresoftware.b4a.objects.LabelWrapper();
 //BA.debugLineNum = 51;BA.debugLine="Private pnlitem_comment As Panel";
mostCurrent._pnlitem_comment = new anywheresoftware.b4a.objects.PanelWrapper();
 //BA.debugLineNum = 52;BA.debugLine="Private lblcommentstar1 As Label";
mostCurrent._lblcommentstar1 = new anywheresoftware.b4a.objects.LabelWrapper();
 //BA.debugLineNum = 53;BA.debugLine="Private lblcommentstar2 As Label";
mostCurrent._lblcommentstar2 = new anywheresoftware.b4a.objects.LabelWrapper();
 //BA.debugLineNum = 54;BA.debugLine="Private lblcommentstar3 As Label";
mostCurrent._lblcommentstar3 = new anywheresoftware.b4a.objects.LabelWrapper();
 //BA.debugLineNum = 55;BA.debugLine="Private lblcommentstar4 As Label";
mostCurrent._lblcommentstar4 = new anywheresoftware.b4a.objects.LabelWrapper();
 //BA.debugLineNum = 56;BA.debugLine="Private lblcommentstar5 As Label";
mostCurrent._lblcommentstar5 = new anywheresoftware.b4a.objects.LabelWrapper();
 //BA.debugLineNum = 57;BA.debugLine="Private btnreviews As Button";
mostCurrent._btnreviews = new anywheresoftware.b4a.objects.ButtonWrapper();
 //BA.debugLineNum = 58;BA.debugLine="Private topReview,topOptions,topAttr As Int";
_topreview = 0;
_topoptions = 0;
_topattr = 0;
 //BA.debugLineNum = 59;BA.debugLine="Private lblnumber As Label";
mostCurrent._lblnumber = new anywheresoftware.b4a.objects.LabelWrapper();
 //BA.debugLineNum = 60;BA.debugLine="Private pnloverheader As Panel";
mostCurrent._pnloverheader = new anywheresoftware.b4a.objects.PanelWrapper();
 //BA.debugLineNum = 61;BA.debugLine="Private lblheadername As Label";
mostCurrent._lblheadername = new anywheresoftware.b4a.objects.LabelWrapper();
 //BA.debugLineNum = 62;BA.debugLine="Private pnlheadert As Panel";
mostCurrent._pnlheadert = new anywheresoftware.b4a.objects.PanelWrapper();
 //BA.debugLineNum = 63;BA.debugLine="Dim top As Int";
_top = 0;
 //BA.debugLineNum = 64;BA.debugLine="Private pnlheaderproduct As Panel";
mostCurrent._pnlheaderproduct = new anywheresoftware.b4a.objects.PanelWrapper();
 //BA.debugLineNum = 65;BA.debugLine="Private pnlads As Panel";
mostCurrent._pnlads = new anywheresoftware.b4a.objects.PanelWrapper();
 //BA.debugLineNum = 66;BA.debugLine="Private ListOptions As List";
mostCurrent._listoptions = new anywheresoftware.b4a.objects.collections.List();
 //BA.debugLineNum = 67;BA.debugLine="Private lblattr As Label";
mostCurrent._lblattr = new anywheresoftware.b4a.objects.LabelWrapper();
 //BA.debugLineNum = 68;BA.debugLine="Private lbloptions As Label";
mostCurrent._lbloptions = new anywheresoftware.b4a.objects.LabelWrapper();
 //BA.debugLineNum = 69;BA.debugLine="Private slidemenu1 As SlideMenu";
mostCurrent._slidemenu1 = new com.apps.demo.slidemenu();
 //BA.debugLineNum = 70;BA.debugLine="Private lbladd2cart As Label";
mostCurrent._lbladd2cart = new anywheresoftware.b4a.objects.LabelWrapper();
 //BA.debugLineNum = 71;BA.debugLine="Private pnlheader As Panel";
mostCurrent._pnlheader = new anywheresoftware.b4a.objects.PanelWrapper();
 //BA.debugLineNum = 72;BA.debugLine="Private listBanner As List";
mostCurrent._listbanner = new anywheresoftware.b4a.objects.collections.List();
 //BA.debugLineNum = 73;BA.debugLine="Private imgspecial As ImageView";
mostCurrent._imgspecial = new anywheresoftware.b4a.objects.ImageViewWrapper();
 //BA.debugLineNum = 74;BA.debugLine="Private txtfocus As EditText";
mostCurrent._txtfocus = new anywheresoftware.b4a.objects.EditTextWrapper();
 //BA.debugLineNum = 75;BA.debugLine="Private MyToastMessageShow As MyToastMessageShow";
mostCurrent._mytoastmessageshow = new com.apps.demo.mytoastmessageshow();
 //BA.debugLineNum = 76;BA.debugLine="Private FixPanelHeader As Boolean";
_fixpanelheader = false;
 //BA.debugLineNum = 77;BA.debugLine="Dim pnlReviews,pnlAttribute,pnlBasket As Panel";
mostCurrent._pnlreviews = new anywheresoftware.b4a.objects.PanelWrapper();
mostCurrent._pnlattribute = new anywheresoftware.b4a.objects.PanelWrapper();
mostCurrent._pnlbasket = new anywheresoftware.b4a.objects.PanelWrapper();
 //BA.debugLineNum = 78;BA.debugLine="Private svReviews,svAttribute As ScrollView";
mostCurrent._svreviews = new anywheresoftware.b4a.objects.ScrollViewWrapper();
mostCurrent._svattribute = new anywheresoftware.b4a.objects.ScrollViewWrapper();
 //BA.debugLineNum = 79;BA.debugLine="Private btnattributes As Button";
mostCurrent._btnattributes = new anywheresoftware.b4a.objects.ButtonWrapper();
 //BA.debugLineNum = 80;BA.debugLine="Dim lblfloat_basket As Label";
mostCurrent._lblfloat_basket = new anywheresoftware.b4a.objects.LabelWrapper();
 //BA.debugLineNum = 82;BA.debugLine="Private TipTag,titleHelp As String";
mostCurrent._tiptag = "";
mostCurrent._titlehelp = "";
 //BA.debugLineNum = 83;BA.debugLine="Private btnshare As Button";
mostCurrent._btnshare = new anywheresoftware.b4a.objects.ButtonWrapper();
 //BA.debugLineNum = 84;BA.debugLine="Private btnbasket As Button";
mostCurrent._btnbasket = new anywheresoftware.b4a.objects.ButtonWrapper();
 //BA.debugLineNum = 86;BA.debugLine="Dim slidepanel1 As AHPageContainer";
mostCurrent._slidepanel1 = new de.amberhome.viewpager.PageContainerAdapter();
 //BA.debugLineNum = 87;BA.debugLine="Dim slidepanelPage As AHViewPager";
mostCurrent._slidepanelpage = new de.amberhome.viewpager.ViewPagerWrapper();
 //BA.debugLineNum = 89;BA.debugLine="Private btnsearch As Button";
mostCurrent._btnsearch = new anywheresoftware.b4a.objects.ButtonWrapper();
 //BA.debugLineNum = 90;BA.debugLine="Private btnback As Button";
mostCurrent._btnback = new anywheresoftware.b4a.objects.ButtonWrapper();
 //BA.debugLineNum = 91;BA.debugLine="Private pnlcircle As Panel";
mostCurrent._pnlcircle = new anywheresoftware.b4a.objects.PanelWrapper();
 //BA.debugLineNum = 92;BA.debugLine="Private lblpre_price As Label";
mostCurrent._lblpre_price = new anywheresoftware.b4a.objects.LabelWrapper();
 //BA.debugLineNum = 93;BA.debugLine="Private pnltimer As Panel";
mostCurrent._pnltimer = new anywheresoftware.b4a.objects.PanelWrapper();
 //BA.debugLineNum = 94;BA.debugLine="Private lblnum1 As Label";
mostCurrent._lblnum1 = new anywheresoftware.b4a.objects.LabelWrapper();
 //BA.debugLineNum = 95;BA.debugLine="Private lblnum2 As Label";
mostCurrent._lblnum2 = new anywheresoftware.b4a.objects.LabelWrapper();
 //BA.debugLineNum = 96;BA.debugLine="Private lblnum3 As Label";
mostCurrent._lblnum3 = new anywheresoftware.b4a.objects.LabelWrapper();
 //BA.debugLineNum = 97;BA.debugLine="Private pnlprice As Panel";
mostCurrent._pnlprice = new anywheresoftware.b4a.objects.PanelWrapper();
 //BA.debugLineNum = 99;BA.debugLine="Private timerSpecial As Timer";
mostCurrent._timerspecial = new anywheresoftware.b4a.objects.Timer();
 //BA.debugLineNum = 100;BA.debugLine="Dim SpecialDateInformation As Period";
mostCurrent._specialdateinformation = new com.apps.demo.dateutils._period();
 //BA.debugLineNum = 101;BA.debugLine="Private CurrentTimerSpecialWidth As Int";
_currenttimerspecialwidth = 0;
 //BA.debugLineNum = 103;BA.debugLine="Private lblline2 As Label";
mostCurrent._lblline2 = new anywheresoftware.b4a.objects.LabelWrapper();
 //BA.debugLineNum = 104;BA.debugLine="Private lblline1 As Label";
mostCurrent._lblline1 = new anywheresoftware.b4a.objects.LabelWrapper();
 //BA.debugLineNum = 105;BA.debugLine="Private lblwonderfull As Label";
mostCurrent._lblwonderfull = new anywheresoftware.b4a.objects.LabelWrapper();
 //BA.debugLineNum = 106;BA.debugLine="Private lblnum4 As Label";
mostCurrent._lblnum4 = new anywheresoftware.b4a.objects.LabelWrapper();
 //BA.debugLineNum = 107;BA.debugLine="Private pnllistnumb As Panel";
mostCurrent._pnllistnumb = new anywheresoftware.b4a.objects.PanelWrapper();
 //BA.debugLineNum = 108;BA.debugLine="Private pnlQR As Panel";
mostCurrent._pnlqr = new anywheresoftware.b4a.objects.PanelWrapper();
 //BA.debugLineNum = 110;BA.debugLine="Private ListImageView As List";
mostCurrent._listimageview = new anywheresoftware.b4a.objects.collections.List();
 //BA.debugLineNum = 111;BA.debugLine="End Sub";
return "";
}
public static String  _imgads_click() throws Exception{
anywheresoftware.b4a.objects.ImageViewWrapper _im = null;
 //BA.debugLineNum = 1050;BA.debugLine="Sub imgADs_Click";
 //BA.debugLineNum = 1052;BA.debugLine="Try";
try { //BA.debugLineNum = 1053;BA.debugLine="Dim im As ImageView";
_im = new anywheresoftware.b4a.objects.ImageViewWrapper();
 //BA.debugLineNum = 1054;BA.debugLine="im = Sender";
_im.setObject((android.widget.ImageView)(anywheresoftware.b4a.keywords.Common.Sender(mostCurrent.activityBA)));
 //BA.debugLineNum = 1055;BA.debugLine="actPicture.link = im.Tag";
mostCurrent._actpicture._link = BA.ObjectToString(_im.getTag());
 //BA.debugLineNum = 1056;BA.debugLine="actPicture.images = product.Get(\"images\")";
mostCurrent._actpicture._images.setObject((java.util.List)(_product.Get((Object)("images"))));
 //BA.debugLineNum = 1057;BA.debugLine="StartActivity(actPicture)";
anywheresoftware.b4a.keywords.Common.StartActivity(mostCurrent.activityBA,(Object)(mostCurrent._actpicture.getObject()));
 } 
       catch (Exception e8) {
			processBA.setLastException(e8); };
 //BA.debugLineNum = 1061;BA.debugLine="End Sub";
return "";
}
public static String  _lbladd2cart_click() throws Exception{
int _smin = 0;
anywheresoftware.b4a.objects.collections.Map _options = null;
 //BA.debugLineNum = 1214;BA.debugLine="Sub lbladd2cart_Click";
 //BA.debugLineNum = 1216;BA.debugLine="If Library.InternetState = False Then";
if (mostCurrent._library._internetstate(mostCurrent.activityBA)==anywheresoftware.b4a.keywords.Common.False) { 
 //BA.debugLineNum = 1217;BA.debugLine="MyToastMessageShow.Initialize(Activity)";
mostCurrent._mytoastmessageshow._initialize(mostCurrent.activityBA,(anywheresoftware.b4a.objects.PanelWrapper) anywheresoftware.b4a.AbsObjectWrapper.ConvertToWrapper(new anywheresoftware.b4a.objects.PanelWrapper(), (android.view.ViewGroup)(mostCurrent._activity.getObject())));
 //BA.debugLineNum = 1218;BA.debugLine="MyToastMessageShow.ShowToastMessageShow(Library.";
mostCurrent._mytoastmessageshow._showtoastmessageshow(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"error_net_details"),(long) (1.5),anywheresoftware.b4a.keywords.Common.False);
 //BA.debugLineNum = 1219;BA.debugLine="Return";
if (true) return "";
 };
 //BA.debugLineNum = 1222;BA.debugLine="If Library.GetStringResourse(\"need_to_login_site\"";
if ((mostCurrent._library._getstringresourse(mostCurrent.activityBA,"need_to_login_site")).equals("1") && mostCurrent._library._logindetails.IsInitialized()==anywheresoftware.b4a.keywords.Common.False) { 
 //BA.debugLineNum = 1223;BA.debugLine="MyToastMessageShow.ShowToastMessageShow(Library.";
mostCurrent._mytoastmessageshow._showtoastmessageshow(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"login_force"),(long) (1.5),anywheresoftware.b4a.keywords.Common.False);
 //BA.debugLineNum = 1224;BA.debugLine="Return";
if (true) return "";
 };
 //BA.debugLineNum = 1227;BA.debugLine="If lbladd2cart.Text = Library.GetStringResourse(\"";
if ((mostCurrent._lbladd2cart.getText()).equals(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"call_us"))) { 
 //BA.debugLineNum = 1228;BA.debugLine="MyToastMessageShow.ShowToastMessageShow(Library.";
mostCurrent._mytoastmessageshow._showtoastmessageshow(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"call_us"),(long) (1.5),anywheresoftware.b4a.keywords.Common.False);
 //BA.debugLineNum = 1229;BA.debugLine="Return";
if (true) return "";
 };
 //BA.debugLineNum = 1232;BA.debugLine="If product.Get(\"quantity\") = 0 Then";
if ((_product.Get((Object)("quantity"))).equals((Object)(0))) { 
 //BA.debugLineNum = 1233;BA.debugLine="MyToastMessageShow.Initialize(Activity)";
mostCurrent._mytoastmessageshow._initialize(mostCurrent.activityBA,(anywheresoftware.b4a.objects.PanelWrapper) anywheresoftware.b4a.AbsObjectWrapper.ConvertToWrapper(new anywheresoftware.b4a.objects.PanelWrapper(), (android.view.ViewGroup)(mostCurrent._activity.getObject())));
 //BA.debugLineNum = 1234;BA.debugLine="MyToastMessageShow.ShowToastMessageShow(Library.";
mostCurrent._mytoastmessageshow._showtoastmessageshow(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"no_product"),(long) (1.5),anywheresoftware.b4a.keywords.Common.False);
 //BA.debugLineNum = 1235;BA.debugLine="Return";
if (true) return "";
 };
 //BA.debugLineNum = 1238;BA.debugLine="Dim sMin As Int";
_smin = 0;
 //BA.debugLineNum = 1239;BA.debugLine="If product.ContainsKey(\"minimum\") Then";
if (_product.ContainsKey((Object)("minimum"))) { 
 //BA.debugLineNum = 1240;BA.debugLine="sMin = product.Get(\"minimum\")";
_smin = (int)(BA.ObjectToNumber(_product.Get((Object)("minimum"))));
 }else {
 //BA.debugLineNum = 1242;BA.debugLine="sMin = 1";
_smin = (int) (1);
 };
 //BA.debugLineNum = 1245;BA.debugLine="Dim options As Map";
_options = new anywheresoftware.b4a.objects.collections.Map();
 //BA.debugLineNum = 1246;BA.debugLine="options = GetCartOptions";
_options = _getcartoptions();
 //BA.debugLineNum = 1248;BA.debugLine="progress.Visible = True";
mostCurrent._progress.setVisible(anywheresoftware.b4a.keywords.Common.True);
 //BA.debugLineNum = 1249;BA.debugLine="details.Add2Cart(Me,\"Add2Cart_receive\",product.Ge";
mostCurrent._details._add2cart(actproduct.getObject(),"Add2Cart_receive",BA.ObjectToString(_product.Get((Object)("id"))),BA.NumberToString(_smin),_options);
 //BA.debugLineNum = 1251;BA.debugLine="End Sub";
return "";
}
public static String  _lblattr_click() throws Exception{
 //BA.debugLineNum = 1915;BA.debugLine="Sub lblattr_Click";
 //BA.debugLineNum = 1916;BA.debugLine="sv1.ScrollToNow(topAttr)";
mostCurrent._sv1.ScrollToNow(_topattr);
 //BA.debugLineNum = 1917;BA.debugLine="End Sub";
return "";
}
public static String  _lblattributes_click() throws Exception{
 //BA.debugLineNum = 1456;BA.debugLine="Sub lblattributes_Click";
 //BA.debugLineNum = 1458;BA.debugLine="If svAttribute.Panel.NumberOfViews = 0 Then";
if (mostCurrent._svattribute.getPanel().getNumberOfViews()==0) { 
 //BA.debugLineNum = 1459;BA.debugLine="LoadAttribute";
_loadattribute();
 };
 //BA.debugLineNum = 1462;BA.debugLine="If svAttribute.Panel.NumberOfViews = 0 Then Retur";
if (mostCurrent._svattribute.getPanel().getNumberOfViews()==0) { 
if (true) return "";};
 //BA.debugLineNum = 1464;BA.debugLine="pnlAttribute.top = pnlAttribute.Height";
mostCurrent._pnlattribute.setTop(mostCurrent._pnlattribute.getHeight());
 //BA.debugLineNum = 1465;BA.debugLine="pnlAttribute.Visible = True";
mostCurrent._pnlattribute.setVisible(anywheresoftware.b4a.keywords.Common.True);
 //BA.debugLineNum = 1466;BA.debugLine="pnlAttribute.SetLayoutAnimated(500,0,0,pnlAttribu";
mostCurrent._pnlattribute.SetLayoutAnimated((int) (500),(int) (0),(int) (0),mostCurrent._pnlattribute.getWidth(),mostCurrent._pnlattribute.getHeight());
 //BA.debugLineNum = 1467;BA.debugLine="pnlAttribute.BringToFront";
mostCurrent._pnlattribute.BringToFront();
 //BA.debugLineNum = 1468;BA.debugLine="DoEvents";
anywheresoftware.b4a.keywords.Common.DoEvents();
 //BA.debugLineNum = 1470;BA.debugLine="End Sub";
return "";
}
public static String  _lbloptions_click() throws Exception{
 //BA.debugLineNum = 1911;BA.debugLine="Sub lbloptions_Click";
 //BA.debugLineNum = 1912;BA.debugLine="sv1.ScrollToNow(topOptions)";
mostCurrent._sv1.ScrollToNow(_topoptions);
 //BA.debugLineNum = 1913;BA.debugLine="End Sub";
return "";
}
public static String  _lblpayment_click() throws Exception{
com.maximus.id.id _id1 = null;
int _rs = 0;
 //BA.debugLineNum = 1988;BA.debugLine="Sub lblpayment_Click";
 //BA.debugLineNum = 1990;BA.debugLine="If Library.InternetState = False Then";
if (mostCurrent._library._internetstate(mostCurrent.activityBA)==anywheresoftware.b4a.keywords.Common.False) { 
 //BA.debugLineNum = 1991;BA.debugLine="ToastMessageShow(Library.GetStringResourse(\"erro";
anywheresoftware.b4a.keywords.Common.ToastMessageShow(BA.ObjectToCharSequence(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"error_net_details")),anywheresoftware.b4a.keywords.Common.False);
 //BA.debugLineNum = 1992;BA.debugLine="Return";
if (true) return "";
 };
 //BA.debugLineNum = 1995;BA.debugLine="If Library.loginDetails.IsInitialized Then";
if (mostCurrent._library._logindetails.IsInitialized()) { 
 //BA.debugLineNum = 1996;BA.debugLine="If Library.loginDetails.Get(\"login\") = True Then";
if ((mostCurrent._library._logindetails.Get((Object)("login"))).equals((Object)(anywheresoftware.b4a.keywords.Common.True))) { 
 //BA.debugLineNum = 1997;BA.debugLine="If DateTime.Now - Library.loginDetails.Get(\"exp";
if (anywheresoftware.b4a.keywords.Common.DateTime.getNow()-(double)(BA.ObjectToNumber(mostCurrent._library._logindetails.Get((Object)("expire"))))>1010020) { 
 //BA.debugLineNum = 1998;BA.debugLine="Activity.Finish";
mostCurrent._activity.Finish();
 //BA.debugLineNum = 1999;BA.debugLine="StartActivity(actLogin)";
anywheresoftware.b4a.keywords.Common.StartActivity(mostCurrent.activityBA,(Object)(mostCurrent._actlogin.getObject()));
 //BA.debugLineNum = 2000;BA.debugLine="Return";
if (true) return "";
 };
 //BA.debugLineNum = 2002;BA.debugLine="StartActivity(actDoOrder)";
anywheresoftware.b4a.keywords.Common.StartActivity(mostCurrent.activityBA,(Object)(mostCurrent._actdoorder.getObject()));
 //BA.debugLineNum = 2003;BA.debugLine="Return";
if (true) return "";
 };
 };
 //BA.debugLineNum = 2007;BA.debugLine="If Library.GuestLogin.IsInitialized Then";
if (mostCurrent._library._guestlogin.IsInitialized()) { 
 //BA.debugLineNum = 2008;BA.debugLine="If Library.GuestLogin.Get(\"login\") = True Then";
if ((mostCurrent._library._guestlogin.Get((Object)("login"))).equals((Object)(anywheresoftware.b4a.keywords.Common.True))) { 
 //BA.debugLineNum = 2009;BA.debugLine="StartActivity(actDoOrder)";
anywheresoftware.b4a.keywords.Common.StartActivity(mostCurrent.activityBA,(Object)(mostCurrent._actdoorder.getObject()));
 //BA.debugLineNum = 2010;BA.debugLine="Return";
if (true) return "";
 };
 };
 //BA.debugLineNum = 2014;BA.debugLine="Dim id1 As id";
_id1 = new com.maximus.id.id();
 //BA.debugLineNum = 2015;BA.debugLine="Dim rs As Int";
_rs = 0;
 //BA.debugLineNum = 2017;BA.debugLine="rs = id1.InputList1(Array As String(Library.GetSt";
_rs = _id1.InputList1(anywheresoftware.b4a.keywords.Common.ArrayToList(new String[]{mostCurrent._library._getstringresourse(mostCurrent.activityBA,"guest"),mostCurrent._library._getstringresourse(mostCurrent.activityBA,"register"),mostCurrent._library._getstringresourse(mostCurrent.activityBA,"login")}),mostCurrent._library._getstringresourse(mostCurrent.activityBA,"user_choose"),mostCurrent.activityBA);
 //BA.debugLineNum = 2019;BA.debugLine="If rs = 0 Then";
if (_rs==0) { 
 //BA.debugLineNum = 2020;BA.debugLine="actRegister.Guest = True";
mostCurrent._actregister._guest = anywheresoftware.b4a.keywords.Common.True;
 //BA.debugLineNum = 2021;BA.debugLine="StartActivity(actRegister)";
anywheresoftware.b4a.keywords.Common.StartActivity(mostCurrent.activityBA,(Object)(mostCurrent._actregister.getObject()));
 }else if(_rs==1) { 
 //BA.debugLineNum = 2024;BA.debugLine="Activity.Finish";
mostCurrent._activity.Finish();
 //BA.debugLineNum = 2025;BA.debugLine="StartActivity(actRegister)";
anywheresoftware.b4a.keywords.Common.StartActivity(mostCurrent.activityBA,(Object)(mostCurrent._actregister.getObject()));
 }else if(_rs==2) { 
 //BA.debugLineNum = 2028;BA.debugLine="Activity.Finish";
mostCurrent._activity.Finish();
 //BA.debugLineNum = 2029;BA.debugLine="StartActivity(actLogin)";
anywheresoftware.b4a.keywords.Common.StartActivity(mostCurrent.activityBA,(Object)(mostCurrent._actlogin.getObject()));
 };
 //BA.debugLineNum = 2032;BA.debugLine="End Sub";
return "";
}
public static String  _loadattribute() throws Exception{
anywheresoftware.b4a.objects.collections.List _attr = null;
int _topattribute = 0;
anywheresoftware.b4a.objects.LabelWrapper _lblheader = null;
int _i = 0;
anywheresoftware.b4a.objects.collections.Map _temp = null;
anywheresoftware.b4a.objects.LabelWrapper _lblkey = null;
anywheresoftware.b4a.objects.collections.List _vals = null;
int _j = 0;
anywheresoftware.b4a.objects.collections.Map _attrs = null;
anywheresoftware.b4a.objects.LabelWrapper _lblval = null;
anywheresoftware.b4a.objects.drawable.ColorDrawable _cd = null;
 //BA.debugLineNum = 1347;BA.debugLine="Sub LoadAttribute";
 //BA.debugLineNum = 1349;BA.debugLine="Dim attr As List";
_attr = new anywheresoftware.b4a.objects.collections.List();
 //BA.debugLineNum = 1351;BA.debugLine="If product.ContainsKey(\"attribute_groups\") Then";
if (_product.ContainsKey((Object)("attribute_groups"))) { 
 //BA.debugLineNum = 1352;BA.debugLine="attr = product.Get(\"attribute_groups\")";
_attr.setObject((java.util.List)(_product.Get((Object)("attribute_groups"))));
 };
 //BA.debugLineNum = 1355;BA.debugLine="If attr.IsInitialized = False Then";
if (_attr.IsInitialized()==anywheresoftware.b4a.keywords.Common.False) { 
 //BA.debugLineNum = 1356;BA.debugLine="MyToastMessageShow.ShowToastMessageShow(Library.";
mostCurrent._mytoastmessageshow._showtoastmessageshow(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"no_attribute"),(long) (1.5),anywheresoftware.b4a.keywords.Common.False);
 //BA.debugLineNum = 1357;BA.debugLine="Return";
if (true) return "";
 };
 //BA.debugLineNum = 1360;BA.debugLine="If attr.Size = 0 Then";
if (_attr.getSize()==0) { 
 //BA.debugLineNum = 1361;BA.debugLine="MyToastMessageShow.ShowToastMessageShow(Library.";
mostCurrent._mytoastmessageshow._showtoastmessageshow(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"no_attribute"),(long) (1.5),anywheresoftware.b4a.keywords.Common.False);
 //BA.debugLineNum = 1362;BA.debugLine="Return";
if (true) return "";
 };
 //BA.debugLineNum = 1365;BA.debugLine="progress.Visible = True";
mostCurrent._progress.setVisible(anywheresoftware.b4a.keywords.Common.True);
 //BA.debugLineNum = 1367;BA.debugLine="Dim topAttribute As Int";
_topattribute = 0;
 //BA.debugLineNum = 1369;BA.debugLine="Dim lblHeader As Label";
_lblheader = new anywheresoftware.b4a.objects.LabelWrapper();
 //BA.debugLineNum = 1370;BA.debugLine="lblHeader.Initialize(\"\")";
_lblheader.Initialize(mostCurrent.activityBA,"");
 //BA.debugLineNum = 1371;BA.debugLine="lblHeader.Color = Library.Theme_Background";
_lblheader.setColor(mostCurrent._library._theme_background);
 //BA.debugLineNum = 1373;BA.debugLine="lblHeader.Typeface = Library.GetFont";
_lblheader.setTypeface((android.graphics.Typeface)(mostCurrent._library._getfont(mostCurrent.activityBA).getObject()));
 //BA.debugLineNum = 1375;BA.debugLine="lblHeader.TextSize = 14";
_lblheader.setTextSize((float) (14));
 //BA.debugLineNum = 1376;BA.debugLine="lblHeader.TextColor = Colors.Gray";
_lblheader.setTextColor(anywheresoftware.b4a.keywords.Common.Colors.Gray);
 //BA.debugLineNum = 1377;BA.debugLine="lblHeader.Text = Library.GetStringResourse(\"attri";
_lblheader.setText(BA.ObjectToCharSequence(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"attribute")));
 //BA.debugLineNum = 1378;BA.debugLine="lblHeader.Gravity = Library.GetStringResourse(\"di";
_lblheader.setGravity((int)(Double.parseDouble(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"direction"))));
 //BA.debugLineNum = 1379;BA.debugLine="Library.PaddingLabel(lblHeader,10,0,10,0)";
mostCurrent._library._paddinglabel(mostCurrent.activityBA,_lblheader,(int) (10),(int) (0),(int) (10),(int) (0));
 //BA.debugLineNum = 1380;BA.debugLine="svAttribute.Panel.AddView(lblHeader,pnl2.Left,top";
mostCurrent._svattribute.getPanel().AddView((android.view.View)(_lblheader.getObject()),mostCurrent._pnl2.getLeft(),_topattribute,mostCurrent._pnl2.getWidth(),anywheresoftware.b4a.keywords.Common.DipToCurrent((int) (40)));
 //BA.debugLineNum = 1381;BA.debugLine="topAttribute = topAttribute + 40dip";
_topattribute = (int) (_topattribute+anywheresoftware.b4a.keywords.Common.DipToCurrent((int) (40)));
 //BA.debugLineNum = 1382;BA.debugLine="svAttribute.Panel.Height = svAttribute.Panel.Heig";
mostCurrent._svattribute.getPanel().setHeight((int) (mostCurrent._svattribute.getPanel().getHeight()+anywheresoftware.b4a.keywords.Common.DipToCurrent((int) (40))));
 //BA.debugLineNum = 1384;BA.debugLine="For i = 0 To attr.Size - 1";
{
final int step27 = 1;
final int limit27 = (int) (_attr.getSize()-1);
for (_i = (int) (0) ; (step27 > 0 && _i <= limit27) || (step27 < 0 && _i >= limit27); _i = ((int)(0 + _i + step27)) ) {
 //BA.debugLineNum = 1386;BA.debugLine="Dim temp As Map";
_temp = new anywheresoftware.b4a.objects.collections.Map();
 //BA.debugLineNum = 1387;BA.debugLine="temp = attr.Get(i)";
_temp.setObject((anywheresoftware.b4a.objects.collections.Map.MyMap)(_attr.Get(_i)));
 //BA.debugLineNum = 1389;BA.debugLine="Dim lblKey As Label";
_lblkey = new anywheresoftware.b4a.objects.LabelWrapper();
 //BA.debugLineNum = 1390;BA.debugLine="lblKey.Initialize(\"\")";
_lblkey.Initialize(mostCurrent.activityBA,"");
 //BA.debugLineNum = 1391;BA.debugLine="lblKey.Color = Library.Theme_Header";
_lblkey.setColor(mostCurrent._library._theme_header);
 //BA.debugLineNum = 1392;BA.debugLine="lblKey.Typeface = Library.GetFont";
_lblkey.setTypeface((android.graphics.Typeface)(mostCurrent._library._getfont(mostCurrent.activityBA).getObject()));
 //BA.debugLineNum = 1393;BA.debugLine="lblKey.TextSize = 14";
_lblkey.setTextSize((float) (14));
 //BA.debugLineNum = 1394;BA.debugLine="lblKey.TextColor = Colors.White";
_lblkey.setTextColor(anywheresoftware.b4a.keywords.Common.Colors.White);
 //BA.debugLineNum = 1395;BA.debugLine="lblKey.Text = temp.Get(\"name\")";
_lblkey.setText(BA.ObjectToCharSequence(_temp.Get((Object)("name"))));
 //BA.debugLineNum = 1396;BA.debugLine="lblKey.Gravity = Library.GetStringResourse(\"dire";
_lblkey.setGravity((int)(Double.parseDouble(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"direction"))));
 //BA.debugLineNum = 1397;BA.debugLine="Library.PaddingLabel(lblKey,10,0,10,0)";
mostCurrent._library._paddinglabel(mostCurrent.activityBA,_lblkey,(int) (10),(int) (0),(int) (10),(int) (0));
 //BA.debugLineNum = 1399;BA.debugLine="svAttribute.Panel.AddView(lblKey,pnl2.Left,topAt";
mostCurrent._svattribute.getPanel().AddView((android.view.View)(_lblkey.getObject()),mostCurrent._pnl2.getLeft(),_topattribute,mostCurrent._pnl2.getWidth(),anywheresoftware.b4a.keywords.Common.DipToCurrent((int) (40)));
 //BA.debugLineNum = 1400;BA.debugLine="topAttribute = topAttribute + 40dip";
_topattribute = (int) (_topattribute+anywheresoftware.b4a.keywords.Common.DipToCurrent((int) (40)));
 //BA.debugLineNum = 1401;BA.debugLine="svAttribute.Panel.Height = svAttribute.Panel.Hei";
mostCurrent._svattribute.getPanel().setHeight((int) (mostCurrent._svattribute.getPanel().getHeight()+anywheresoftware.b4a.keywords.Common.DipToCurrent((int) (40))));
 //BA.debugLineNum = 1403;BA.debugLine="Dim vals As List";
_vals = new anywheresoftware.b4a.objects.collections.List();
 //BA.debugLineNum = 1404;BA.debugLine="vals = temp.Get(\"attribute\")";
_vals.setObject((java.util.List)(_temp.Get((Object)("attribute"))));
 //BA.debugLineNum = 1406;BA.debugLine="For j = 0 To vals.Size - 1";
{
final int step44 = 1;
final int limit44 = (int) (_vals.getSize()-1);
for (_j = (int) (0) ; (step44 > 0 && _j <= limit44) || (step44 < 0 && _j >= limit44); _j = ((int)(0 + _j + step44)) ) {
 //BA.debugLineNum = 1408;BA.debugLine="Dim attrs As Map";
_attrs = new anywheresoftware.b4a.objects.collections.Map();
 //BA.debugLineNum = 1409;BA.debugLine="attrs = vals.Get(j)";
_attrs.setObject((anywheresoftware.b4a.objects.collections.Map.MyMap)(_vals.Get(_j)));
 //BA.debugLineNum = 1411;BA.debugLine="Dim lblVal As Label";
_lblval = new anywheresoftware.b4a.objects.LabelWrapper();
 //BA.debugLineNum = 1412;BA.debugLine="lblVal.Initialize(\"\")";
_lblval.Initialize(mostCurrent.activityBA,"");
 //BA.debugLineNum = 1413;BA.debugLine="lblVal.Color = Colors.White";
_lblval.setColor(anywheresoftware.b4a.keywords.Common.Colors.White);
 //BA.debugLineNum = 1414;BA.debugLine="lblVal.Typeface =  Library.GetFont";
_lblval.setTypeface((android.graphics.Typeface)(mostCurrent._library._getfont(mostCurrent.activityBA).getObject()));
 //BA.debugLineNum = 1415;BA.debugLine="lblVal.TextSize = 12";
_lblval.setTextSize((float) (12));
 //BA.debugLineNum = 1416;BA.debugLine="lblVal.TextColor = Colors.Black";
_lblval.setTextColor(anywheresoftware.b4a.keywords.Common.Colors.Black);
 //BA.debugLineNum = 1417;BA.debugLine="lblVal.Text = attrs.Get(\"name\") & \" : \" & attrs";
_lblval.setText(BA.ObjectToCharSequence(BA.ObjectToString(_attrs.Get((Object)("name")))+" : "+BA.ObjectToString(_attrs.Get((Object)("text")))));
 //BA.debugLineNum = 1418;BA.debugLine="lblVal.Gravity = Library.GetStringResourse(\"dir";
_lblval.setGravity((int)(Double.parseDouble(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"direction"))));
 //BA.debugLineNum = 1419;BA.debugLine="Library.PaddingLabel(lblVal,10,0,10,0)";
mostCurrent._library._paddinglabel(mostCurrent.activityBA,_lblval,(int) (10),(int) (0),(int) (10),(int) (0));
 //BA.debugLineNum = 1421;BA.debugLine="svAttribute.Panel.AddView(lblVal,pnl2.Left,topA";
mostCurrent._svattribute.getPanel().AddView((android.view.View)(_lblval.getObject()),mostCurrent._pnl2.getLeft(),_topattribute,mostCurrent._pnl2.getWidth(),anywheresoftware.b4a.keywords.Common.DipToCurrent((int) (40)));
 //BA.debugLineNum = 1422;BA.debugLine="topAttribute = topAttribute + 40dip";
_topattribute = (int) (_topattribute+anywheresoftware.b4a.keywords.Common.DipToCurrent((int) (40)));
 //BA.debugLineNum = 1423;BA.debugLine="svAttribute.Panel.Height = svAttribute.Panel.He";
mostCurrent._svattribute.getPanel().setHeight((int) (mostCurrent._svattribute.getPanel().getHeight()+anywheresoftware.b4a.keywords.Common.DipToCurrent((int) (40))));
 //BA.debugLineNum = 1425;BA.debugLine="DoEvents";
anywheresoftware.b4a.keywords.Common.DoEvents();
 }
};
 //BA.debugLineNum = 1429;BA.debugLine="DoEvents";
anywheresoftware.b4a.keywords.Common.DoEvents();
 }
};
 //BA.debugLineNum = 1433;BA.debugLine="Dim btnback As Button";
mostCurrent._btnback = new anywheresoftware.b4a.objects.ButtonWrapper();
 //BA.debugLineNum = 1434;BA.debugLine="btnback.Initialize(\"btnbackattr\")";
mostCurrent._btnback.Initialize(mostCurrent.activityBA,"btnbackattr");
 //BA.debugLineNum = 1436;BA.debugLine="topAttribute = topAttribute + 15";
_topattribute = (int) (_topattribute+15);
 //BA.debugLineNum = 1438;BA.debugLine="svAttribute.Panel.AddView(btnback,0,topAttribute,";
mostCurrent._svattribute.getPanel().AddView((android.view.View)(mostCurrent._btnback.getObject()),(int) (0),_topattribute,anywheresoftware.b4a.keywords.Common.DipToCurrent((int) (120)),anywheresoftware.b4a.keywords.Common.DipToCurrent((int) (40)));
 //BA.debugLineNum = 1439;BA.debugLine="DoEvents";
anywheresoftware.b4a.keywords.Common.DoEvents();
 //BA.debugLineNum = 1441;BA.debugLine="Dim cd As ColorDrawable";
_cd = new anywheresoftware.b4a.objects.drawable.ColorDrawable();
 //BA.debugLineNum = 1442;BA.debugLine="cd.Initialize2(Library.ConvertHex2Int(Library.Get";
_cd.Initialize2((int)(Double.parseDouble(mostCurrent._library._converthex2int(mostCurrent.activityBA,mostCurrent._library._getstringresourse(mostCurrent.activityBA,"category_button")))),(int) (5),(int) (1),anywheresoftware.b4a.keywords.Common.Colors.Gray);
 //BA.debugLineNum = 1443;BA.debugLine="btnback.Background = cd";
mostCurrent._btnback.setBackground((android.graphics.drawable.Drawable)(_cd.getObject()));
 //BA.debugLineNum = 1444;BA.debugLine="btnback.Text = Library.GetStringResourse(\"back\")";
mostCurrent._btnback.setText(BA.ObjectToCharSequence(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"back")));
 //BA.debugLineNum = 1445;BA.debugLine="btnback.TextColor = Colors.White";
mostCurrent._btnback.setTextColor(anywheresoftware.b4a.keywords.Common.Colors.White);
 //BA.debugLineNum = 1446;BA.debugLine="btnback.TextSize = 14";
mostCurrent._btnback.setTextSize((float) (14));
 //BA.debugLineNum = 1447;BA.debugLine="btnback.Typeface = Library.GetFont";
mostCurrent._btnback.setTypeface((android.graphics.Typeface)(mostCurrent._library._getfont(mostCurrent.activityBA).getObject()));
 //BA.debugLineNum = 1448;BA.debugLine="Library.CenterView(btnback,Activity)";
mostCurrent._library._centerview(mostCurrent.activityBA,(anywheresoftware.b4a.objects.ConcreteViewWrapper) anywheresoftware.b4a.AbsObjectWrapper.ConvertToWrapper(new anywheresoftware.b4a.objects.ConcreteViewWrapper(), (android.view.View)(mostCurrent._btnback.getObject())),(anywheresoftware.b4a.objects.ConcreteViewWrapper) anywheresoftware.b4a.AbsObjectWrapper.ConvertToWrapper(new anywheresoftware.b4a.objects.ConcreteViewWrapper(), (android.view.View)(mostCurrent._activity.getObject())));
 //BA.debugLineNum = 1450;BA.debugLine="svAttribute.Panel.height = topAttribute + 55dip";
mostCurrent._svattribute.getPanel().setHeight((int) (_topattribute+anywheresoftware.b4a.keywords.Common.DipToCurrent((int) (55))));
 //BA.debugLineNum = 1452;BA.debugLine="progress.Visible = False";
mostCurrent._progress.setVisible(anywheresoftware.b4a.keywords.Common.False);
 //BA.debugLineNum = 1454;BA.debugLine="End Sub";
return "";
}
public static String  _loaditem() throws Exception{
String _product_name = "";
int _i = 0;
String _s1 = "";
String _price = "";
String _special = "";
anywheresoftware.b4a.objects.drawable.ColorDrawable _no_product = null;
anywheresoftware.b4a.objects.collections.List _listoption = null;
anywheresoftware.b4a.objects.LabelWrapper _lbld = null;
anywheresoftware.b4a.objects.collections.Map _review = null;
String _rating = "";
ariagp.amin.shahedi.AriaGlideWrapper _glide = null;
anywheresoftware.b4a.objects.collections.Map _imagesmap = null;
anywheresoftware.b4a.objects.PanelWrapper _p1 = null;
anywheresoftware.b4a.objects.ImageViewWrapper _im1 = null;
String _spath = "";
uk.co.martinpearman.b4a.text.Html _html1 = null;
anywheresoftware.b4a.objects.StringUtils _su = null;
int _new_height = 0;
long _onelineheight = 0L;
long _h = 0L;
anywheresoftware.b4a.agraham.reflection.Reflection _obj1 = null;
com.apps.demo.opencart _oprelat = null;
int _minu = 0;
anywheresoftware.b4a.agraham.richstring.RichStringBuilder.RichString _rich = null;
String _price2 = "";
 //BA.debugLineNum = 385;BA.debugLine="Sub LoadItem";
 //BA.debugLineNum = 387;BA.debugLine="Dim product_name As String";
_product_name = "";
 //BA.debugLineNum = 388;BA.debugLine="product_name = product.Get(\"name\")";
_product_name = BA.ObjectToString(_product.Get((Object)("name")));
 //BA.debugLineNum = 390;BA.debugLine="For i = 0 To product.Size - 1";
{
final int step3 = 1;
final int limit3 = (int) (_product.getSize()-1);
for (_i = (int) (0) ; (step3 > 0 && _i <= limit3) || (step3 < 0 && _i >= limit3); _i = ((int)(0 + _i + step3)) ) {
 //BA.debugLineNum = 392;BA.debugLine="Dim s1 As String";
_s1 = "";
 //BA.debugLineNum = 393;BA.debugLine="s1 = product.GetValueAt(i)";
_s1 = BA.ObjectToString(_product.GetValueAt(_i));
 //BA.debugLineNum = 395;BA.debugLine="If s1.ToLowerCase = \"null\" Then";
if ((_s1.toLowerCase()).equals("null")) { 
 //BA.debugLineNum = 396;BA.debugLine="product.Put(product.GetKeyAt(i),\"-\")";
_product.Put(_product.GetKeyAt(_i),(Object)("-"));
 };
 }
};
 //BA.debugLineNum = 401;BA.debugLine="If GetDiscount = True Then";
if (_getdiscount()==anywheresoftware.b4a.keywords.Common.True) { 
 //BA.debugLineNum = 403;BA.debugLine="lblwonderfull.Text = Library.RedString(Library.G";
mostCurrent._lblwonderfull.setText(BA.ObjectToCharSequence(mostCurrent._library._redstring(mostCurrent.activityBA,mostCurrent._library._getstringresourse(mostCurrent.activityBA,"special_wonderful")).getObject()));
 //BA.debugLineNum = 404;BA.debugLine="pnlprice.top = pnltimer.top + pnltimer.Height";
mostCurrent._pnlprice.setTop((int) (mostCurrent._pnltimer.getTop()+mostCurrent._pnltimer.getHeight()));
 //BA.debugLineNum = 405;BA.debugLine="pnl2.top = pnlprice.top + pnlprice.Height-2";
mostCurrent._pnl2.setTop((int) (mostCurrent._pnlprice.getTop()+mostCurrent._pnlprice.getHeight()-2));
 //BA.debugLineNum = 406;BA.debugLine="timerSpecial.Initialize(\"timerSpecial\",1000)";
mostCurrent._timerspecial.Initialize(processBA,"timerSpecial",(long) (1000));
 //BA.debugLineNum = 407;BA.debugLine="timerSpecial.Enabled = True";
mostCurrent._timerspecial.setEnabled(anywheresoftware.b4a.keywords.Common.True);
 //BA.debugLineNum = 408;BA.debugLine="lblline2.Color = Colors.Black";
mostCurrent._lblline2.setColor(anywheresoftware.b4a.keywords.Common.Colors.Black);
 //BA.debugLineNum = 409;BA.debugLine="lblline1.Color = Colors.Transparent";
mostCurrent._lblline1.setColor(anywheresoftware.b4a.keywords.Common.Colors.Transparent);
 };
 //BA.debugLineNum = 412;BA.debugLine="lbltitle.Text = product_name";
mostCurrent._lbltitle.setText(BA.ObjectToCharSequence(_product_name));
 //BA.debugLineNum = 413;BA.debugLine="lbltitle.Text = lbltitle.Text.Replace(\"&quot;\",QU";
mostCurrent._lbltitle.setText(BA.ObjectToCharSequence(mostCurrent._lbltitle.getText().replace("&quot;",anywheresoftware.b4a.keywords.Common.QUOTE).replace("&amp;","&")));
 //BA.debugLineNum = 415;BA.debugLine="Dim price,special As String";
_price = "";
_special = "";
 //BA.debugLineNum = 416;BA.debugLine="price = product.Get(\"price_formated\")";
_price = BA.ObjectToString(_product.Get((Object)("price_formated")));
 //BA.debugLineNum = 417;BA.debugLine="special = product.Get(\"special_formated\")";
_special = BA.ObjectToString(_product.Get((Object)("special_formated")));
 //BA.debugLineNum = 419;BA.debugLine="If price.StartsWith(\"0\") = True Or price.ToLowerC";
if (_price.startsWith("0")==anywheresoftware.b4a.keywords.Common.True || (_price.toLowerCase()).equals("false")) { 
 //BA.debugLineNum = 420;BA.debugLine="price = Library.GetStringResourse(\"login_account";
_price = mostCurrent._library._getstringresourse(mostCurrent.activityBA,"login_account");
 };
 //BA.debugLineNum = 423;BA.debugLine="If special.StartsWith(\"0\") = True Or special.ToLo";
if (_special.startsWith("0")==anywheresoftware.b4a.keywords.Common.True || (_special.toLowerCase()).equals("false")) { 
 //BA.debugLineNum = 424;BA.debugLine="special = \"\"";
_special = "";
 };
 //BA.debugLineNum = 427;BA.debugLine="If price.Length > 0 And special.Length = 0 Then";
if (_price.length()>0 && _special.length()==0) { 
 //BA.debugLineNum = 429;BA.debugLine="lbladd2cart.Text =  price";
mostCurrent._lbladd2cart.setText(BA.ObjectToCharSequence(_price));
 //BA.debugLineNum = 431;BA.debugLine="btnreviews.Typeface = Library.GetFont";
mostCurrent._btnreviews.setTypeface((android.graphics.Typeface)(mostCurrent._library._getfont(mostCurrent.activityBA).getObject()));
 //BA.debugLineNum = 432;BA.debugLine="btnattributes.Typeface = Library.GetFont";
mostCurrent._btnattributes.setTypeface((android.graphics.Typeface)(mostCurrent._library._getfont(mostCurrent.activityBA).getObject()));
 }else if(_special.length()>0) { 
 //BA.debugLineNum = 436;BA.debugLine="lbladd2cart.Text = special";
mostCurrent._lbladd2cart.setText(BA.ObjectToCharSequence(_special));
 //BA.debugLineNum = 437;BA.debugLine="lblpre_price.Text = Library.DiscountPrice(price)";
mostCurrent._lblpre_price.setText(BA.ObjectToCharSequence(mostCurrent._library._discountprice(mostCurrent.activityBA,_price).getObject()));
 //BA.debugLineNum = 439;BA.debugLine="If Library.IsPersian Then";
if (mostCurrent._library._ispersian(mostCurrent.activityBA)) { 
 //BA.debugLineNum = 440;BA.debugLine="imgspecial.SetBackgroundImage(LoadBitmap(File.D";
mostCurrent._imgspecial.SetBackgroundImage((android.graphics.Bitmap)(anywheresoftware.b4a.keywords.Common.LoadBitmap(anywheresoftware.b4a.keywords.Common.File.getDirAssets(),"special_fa.png").getObject()));
 }else {
 //BA.debugLineNum = 442;BA.debugLine="imgspecial.SetBackgroundImage(LoadBitmap(File.D";
mostCurrent._imgspecial.SetBackgroundImage((android.graphics.Bitmap)(anywheresoftware.b4a.keywords.Common.LoadBitmap(anywheresoftware.b4a.keywords.Common.File.getDirAssets(),"special_en.png").getObject()));
 };
 //BA.debugLineNum = 445;BA.debugLine="imgspecial.SetVisibleAnimated(700,True)";
mostCurrent._imgspecial.SetVisibleAnimated((int) (700),anywheresoftware.b4a.keywords.Common.True);
 };
 //BA.debugLineNum = 449;BA.debugLine="If product_name.Length > 17 Then product_name = p";
if (_product_name.length()>17) { 
_product_name = _product_name.substring((int) (0),(int) (13))+"...";};
 //BA.debugLineNum = 451;BA.debugLine="If product.Get(\"quantity\") = 0 Then";
if ((_product.Get((Object)("quantity"))).equals((Object)(0))) { 
 //BA.debugLineNum = 452;BA.debugLine="lbladd2cart.Typeface = Typeface.DEFAULT";
mostCurrent._lbladd2cart.setTypeface(anywheresoftware.b4a.keywords.Common.Typeface.DEFAULT);
 //BA.debugLineNum = 453;BA.debugLine="lbladd2cart.Text = Library.GetStringResourse(\"no";
mostCurrent._lbladd2cart.setText(BA.ObjectToCharSequence(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"no_stock")));
 //BA.debugLineNum = 454;BA.debugLine="Dim no_product As ColorDrawable";
_no_product = new anywheresoftware.b4a.objects.drawable.ColorDrawable();
 //BA.debugLineNum = 455;BA.debugLine="no_product.Initialize(Colors.RGB(253,77,90),9)";
_no_product.Initialize(anywheresoftware.b4a.keywords.Common.Colors.RGB((int) (253),(int) (77),(int) (90)),(int) (9));
 //BA.debugLineNum = 456;BA.debugLine="pnlBasket.Visible = False";
mostCurrent._pnlbasket.setVisible(anywheresoftware.b4a.keywords.Common.False);
 //BA.debugLineNum = 457;BA.debugLine="lbladd2cart.Background = no_product";
mostCurrent._lbladd2cart.setBackground((android.graphics.drawable.Drawable)(_no_product.getObject()));
 //BA.debugLineNum = 458;BA.debugLine="lbladd2cart.Enabled = False";
mostCurrent._lbladd2cart.setEnabled(anywheresoftware.b4a.keywords.Common.False);
 //BA.debugLineNum = 459;BA.debugLine="lblstate.Text = product.Get(\"stock_status\")";
mostCurrent._lblstate.setText(BA.ObjectToCharSequence(_product.Get((Object)("stock_status"))));
 }else {
 //BA.debugLineNum = 461;BA.debugLine="lblstate.Text = Library.GetStringResourse(\"yes_s";
mostCurrent._lblstate.setText(BA.ObjectToCharSequence(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"yes_stock")));
 };
 //BA.debugLineNum = 464;BA.debugLine="lblproducer.Text = product.Get(\"manufacturer\")";
mostCurrent._lblproducer.setText(BA.ObjectToCharSequence(_product.Get((Object)("manufacturer"))));
 //BA.debugLineNum = 465;BA.debugLine="lblmodel.Text = product.Get(\"model\")";
mostCurrent._lblmodel.setText(BA.ObjectToCharSequence(_product.Get((Object)("model"))));
 //BA.debugLineNum = 466;BA.debugLine="lblvisit.Text = product.Get(\"viewed\")";
mostCurrent._lblvisit.setText(BA.ObjectToCharSequence(_product.Get((Object)("viewed"))));
 //BA.debugLineNum = 468;BA.debugLine="Dim listoption As List";
_listoption = new anywheresoftware.b4a.objects.collections.List();
 //BA.debugLineNum = 469;BA.debugLine="listoption = product.Get(\"options\")";
_listoption.setObject((java.util.List)(_product.Get((Object)("options"))));
 //BA.debugLineNum = 471;BA.debugLine="top = lbldescription.top";
_top = mostCurrent._lbldescription.getTop();
 //BA.debugLineNum = 473;BA.debugLine="If listoption.Size > 0 Then";
if (_listoption.getSize()>0) { 
 //BA.debugLineNum = 474;BA.debugLine="LoadOptions(listoption)";
_loadoptions(_listoption);
 //BA.debugLineNum = 475;BA.debugLine="Dim lbld As Label";
_lbld = new anywheresoftware.b4a.objects.LabelWrapper();
 //BA.debugLineNum = 476;BA.debugLine="lbld = lbldescription";
_lbld = mostCurrent._lbldescription;
 //BA.debugLineNum = 477;BA.debugLine="lbldescription.RemoveView";
mostCurrent._lbldescription.RemoveView();
 //BA.debugLineNum = 478;BA.debugLine="DoEvents";
anywheresoftware.b4a.keywords.Common.DoEvents();
 //BA.debugLineNum = 479;BA.debugLine="pnl2.AddView(lbld,10,top + 20dip,sv1.Width-20,lb";
mostCurrent._pnl2.AddView((android.view.View)(_lbld.getObject()),(int) (10),(int) (_top+anywheresoftware.b4a.keywords.Common.DipToCurrent((int) (20))),(int) (mostCurrent._sv1.getWidth()-20),_lbld.getHeight());
 //BA.debugLineNum = 480;BA.debugLine="DoEvents";
anywheresoftware.b4a.keywords.Common.DoEvents();
 };
 //BA.debugLineNum = 483;BA.debugLine="Dim review As Map";
_review = new anywheresoftware.b4a.objects.collections.Map();
 //BA.debugLineNum = 484;BA.debugLine="review.Initialize";
_review.Initialize();
 //BA.debugLineNum = 485;BA.debugLine="review = product.Get(\"reviews\")";
_review.setObject((anywheresoftware.b4a.objects.collections.Map.MyMap)(_product.Get((Object)("reviews"))));
 //BA.debugLineNum = 487;BA.debugLine="If review.IsInitialized Then";
if (_review.IsInitialized()) { 
 //BA.debugLineNum = 488;BA.debugLine="btnreviews.Text = Library.GetStringResourse(\"rev";
mostCurrent._btnreviews.setText(BA.ObjectToCharSequence(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"reviews")+" [ "+BA.ObjectToString(_review.Get((Object)("review_total")))+" ]"));
 }else {
 //BA.debugLineNum = 490;BA.debugLine="btnreviews.Text = Library.GetStringResourse(\"rev";
mostCurrent._btnreviews.setText(BA.ObjectToCharSequence(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"reviews")));
 };
 //BA.debugLineNum = 494;BA.debugLine="If product.ContainsKey(\"rating\") Then";
if (_product.ContainsKey((Object)("rating"))) { 
 //BA.debugLineNum = 496;BA.debugLine="Dim rating As String";
_rating = "";
 //BA.debugLineNum = 497;BA.debugLine="rating = product.Get(\"rating\")";
_rating = BA.ObjectToString(_product.Get((Object)("rating")));
 //BA.debugLineNum = 499;BA.debugLine="If rating = \"0\" Then";
if ((_rating).equals("0")) { 
 //BA.debugLineNum = 500;BA.debugLine="lbls1.Text = \"\"";
mostCurrent._lbls1.setText(BA.ObjectToCharSequence(""));
 //BA.debugLineNum = 501;BA.debugLine="lbls2.Text = \"\"";
mostCurrent._lbls2.setText(BA.ObjectToCharSequence(""));
 //BA.debugLineNum = 502;BA.debugLine="lbls3.Text = \"\"";
mostCurrent._lbls3.setText(BA.ObjectToCharSequence(""));
 //BA.debugLineNum = 503;BA.debugLine="lbls4.Text = \"\"";
mostCurrent._lbls4.setText(BA.ObjectToCharSequence(""));
 //BA.debugLineNum = 504;BA.debugLine="lbls5.Text = \"\"";
mostCurrent._lbls5.setText(BA.ObjectToCharSequence(""));
 }else if((_rating).equals("1")) { 
 //BA.debugLineNum = 507;BA.debugLine="lbls1.Text = \"\"";
mostCurrent._lbls1.setText(BA.ObjectToCharSequence(""));
 //BA.debugLineNum = 508;BA.debugLine="lbls2.Text = \"\"";
mostCurrent._lbls2.setText(BA.ObjectToCharSequence(""));
 //BA.debugLineNum = 509;BA.debugLine="lbls3.Text = \"\"";
mostCurrent._lbls3.setText(BA.ObjectToCharSequence(""));
 //BA.debugLineNum = 510;BA.debugLine="lbls4.Text = \"\"";
mostCurrent._lbls4.setText(BA.ObjectToCharSequence(""));
 //BA.debugLineNum = 511;BA.debugLine="lbls5.Text = \"\"";
mostCurrent._lbls5.setText(BA.ObjectToCharSequence(""));
 }else if((_rating).equals("2")) { 
 //BA.debugLineNum = 514;BA.debugLine="lbls1.Text = \"\"";
mostCurrent._lbls1.setText(BA.ObjectToCharSequence(""));
 //BA.debugLineNum = 515;BA.debugLine="lbls2.Text = \"\"";
mostCurrent._lbls2.setText(BA.ObjectToCharSequence(""));
 //BA.debugLineNum = 516;BA.debugLine="lbls3.Text = \"\"";
mostCurrent._lbls3.setText(BA.ObjectToCharSequence(""));
 //BA.debugLineNum = 517;BA.debugLine="lbls4.Text = \"\"";
mostCurrent._lbls4.setText(BA.ObjectToCharSequence(""));
 //BA.debugLineNum = 518;BA.debugLine="lbls5.Text = \"\"";
mostCurrent._lbls5.setText(BA.ObjectToCharSequence(""));
 }else if((_rating).equals("3")) { 
 //BA.debugLineNum = 521;BA.debugLine="lbls1.Text = \"\"";
mostCurrent._lbls1.setText(BA.ObjectToCharSequence(""));
 //BA.debugLineNum = 522;BA.debugLine="lbls2.Text = \"\"";
mostCurrent._lbls2.setText(BA.ObjectToCharSequence(""));
 //BA.debugLineNum = 523;BA.debugLine="lbls3.Text = \"\"";
mostCurrent._lbls3.setText(BA.ObjectToCharSequence(""));
 //BA.debugLineNum = 524;BA.debugLine="lbls4.Text = \"\"";
mostCurrent._lbls4.setText(BA.ObjectToCharSequence(""));
 //BA.debugLineNum = 525;BA.debugLine="lbls5.Text = \"\"";
mostCurrent._lbls5.setText(BA.ObjectToCharSequence(""));
 }else if((_rating).equals("4")) { 
 //BA.debugLineNum = 528;BA.debugLine="lbls1.Text = \"\"";
mostCurrent._lbls1.setText(BA.ObjectToCharSequence(""));
 //BA.debugLineNum = 529;BA.debugLine="lbls2.Text = \"\"";
mostCurrent._lbls2.setText(BA.ObjectToCharSequence(""));
 //BA.debugLineNum = 530;BA.debugLine="lbls3.Text = \"\"";
mostCurrent._lbls3.setText(BA.ObjectToCharSequence(""));
 //BA.debugLineNum = 531;BA.debugLine="lbls4.Text = \"\"";
mostCurrent._lbls4.setText(BA.ObjectToCharSequence(""));
 //BA.debugLineNum = 532;BA.debugLine="lbls5.Text = \"\"";
mostCurrent._lbls5.setText(BA.ObjectToCharSequence(""));
 }else if((_rating).equals("5") || (double)(Double.parseDouble(_rating))>5) { 
 //BA.debugLineNum = 535;BA.debugLine="lbls1.Text = \"\"";
mostCurrent._lbls1.setText(BA.ObjectToCharSequence(""));
 //BA.debugLineNum = 536;BA.debugLine="lbls2.Text = \"\"";
mostCurrent._lbls2.setText(BA.ObjectToCharSequence(""));
 //BA.debugLineNum = 537;BA.debugLine="lbls3.Text = \"\"";
mostCurrent._lbls3.setText(BA.ObjectToCharSequence(""));
 //BA.debugLineNum = 538;BA.debugLine="lbls4.Text = \"\"";
mostCurrent._lbls4.setText(BA.ObjectToCharSequence(""));
 //BA.debugLineNum = 539;BA.debugLine="lbls5.Text = \"\"";
mostCurrent._lbls5.setText(BA.ObjectToCharSequence(""));
 };
 };
 //BA.debugLineNum = 547;BA.debugLine="If product.ContainsKey(\"images\") Then";
if (_product.ContainsKey((Object)("images"))) { 
 //BA.debugLineNum = 549;BA.debugLine="listSlideshow = product.Get(\"images\")";
mostCurrent._listslideshow.setObject((java.util.List)(_product.Get((Object)("images"))));
 //BA.debugLineNum = 551;BA.debugLine="If product.ContainsKey(\"image\") Then";
if (_product.ContainsKey((Object)("image"))) { 
 //BA.debugLineNum = 552;BA.debugLine="listSlideshow.InsertAt(0,product.Get(\"image\"))";
mostCurrent._listslideshow.InsertAt((int) (0),_product.Get((Object)("image")));
 };
 //BA.debugLineNum = 555;BA.debugLine="If listSlideshow.Size > 0 Then";
if (mostCurrent._listslideshow.getSize()>0) { 
 //BA.debugLineNum = 556;BA.debugLine="slidepanel1.Initialize";
mostCurrent._slidepanel1.Initialize(mostCurrent.activityBA);
 //BA.debugLineNum = 558;BA.debugLine="Dim Glide As AriaGlide";
_glide = new ariagp.amin.shahedi.AriaGlideWrapper();
 //BA.debugLineNum = 560;BA.debugLine="AddBullet(listSlideshow.Size)";
_addbullet(mostCurrent._listslideshow.getSize());
 //BA.debugLineNum = 561;BA.debugLine="ChooseBullet(0)";
_choosebullet((int) (0));
 //BA.debugLineNum = 563;BA.debugLine="Dim imagesMap As Map";
_imagesmap = new anywheresoftware.b4a.objects.collections.Map();
 //BA.debugLineNum = 564;BA.debugLine="imagesMap.Initialize";
_imagesmap.Initialize();
 //BA.debugLineNum = 566;BA.debugLine="For i = 0 To listSlideshow.Size - 1";
{
final int step133 = 1;
final int limit133 = (int) (mostCurrent._listslideshow.getSize()-1);
for (_i = (int) (0) ; (step133 > 0 && _i <= limit133) || (step133 < 0 && _i >= limit133); _i = ((int)(0 + _i + step133)) ) {
 //BA.debugLineNum = 568;BA.debugLine="Dim p1 As Panel";
_p1 = new anywheresoftware.b4a.objects.PanelWrapper();
 //BA.debugLineNum = 569;BA.debugLine="p1.Initialize(\"pnlImage\")";
_p1.Initialize(mostCurrent.activityBA,"pnlImage");
 //BA.debugLineNum = 570;BA.debugLine="slidepanel1.AddPage(p1,\"\")";
mostCurrent._slidepanel1.AddPage((android.view.View)(_p1.getObject()),"");
 //BA.debugLineNum = 572;BA.debugLine="Dim im1 As ImageView";
_im1 = new anywheresoftware.b4a.objects.ImageViewWrapper();
 //BA.debugLineNum = 573;BA.debugLine="im1.Initialize(\"imgADs\")";
_im1.Initialize(mostCurrent.activityBA,"imgADs");
 //BA.debugLineNum = 574;BA.debugLine="im1.Gravity = Gravity.FILL";
_im1.setGravity(anywheresoftware.b4a.keywords.Common.Gravity.FILL);
 //BA.debugLineNum = 575;BA.debugLine="Library.imagesSlideshow.Add(im1)";
mostCurrent._library._imagesslideshow.Add((Object)(_im1.getObject()));
 //BA.debugLineNum = 577;BA.debugLine="p1.AddView(im1,0,0,pnlads.Width,pnlads.Height)";
_p1.AddView((android.view.View)(_im1.getObject()),(int) (0),(int) (0),mostCurrent._pnlads.getWidth(),mostCurrent._pnlads.getHeight());
 //BA.debugLineNum = 578;BA.debugLine="im1.Tag = listSlideshow.Get(i)";
_im1.setTag(mostCurrent._listslideshow.Get(_i));
 //BA.debugLineNum = 580;BA.debugLine="Dim spath As String";
_spath = "";
 //BA.debugLineNum = 581;BA.debugLine="spath = listSlideshow.Get(i)";
_spath = BA.ObjectToString(mostCurrent._listslideshow.Get(_i));
 //BA.debugLineNum = 582;BA.debugLine="spath = spath.Replace(\" \",\"%20\")";
_spath = _spath.replace(" ","%20");
 //BA.debugLineNum = 584;BA.debugLine="imagesMap.Put(im1,spath)";
_imagesmap.Put((Object)(_im1.getObject()),(Object)(_spath));
 //BA.debugLineNum = 587;BA.debugLine="DoEvents";
anywheresoftware.b4a.keywords.Common.DoEvents();
 }
};
 //BA.debugLineNum = 591;BA.debugLine="slidepanelPage.Initialize(slidepanel1,\"pager\")";
mostCurrent._slidepanelpage.Initialize(mostCurrent.activityBA,mostCurrent._slidepanel1,"pager");
 //BA.debugLineNum = 592;BA.debugLine="pnlads.AddView(slidepanelPage,0,0,pnlads.Width,";
mostCurrent._pnlads.AddView((android.view.View)(mostCurrent._slidepanelpage.getObject()),(int) (0),(int) (0),mostCurrent._pnlads.getWidth(),mostCurrent._pnlads.getHeight());
 //BA.debugLineNum = 594;BA.debugLine="CallSubDelayed2(ImageDownloader,\"Download\",imag";
anywheresoftware.b4a.keywords.Common.CallSubDelayed2(mostCurrent.activityBA,(Object)(mostCurrent._imagedownloader.getObject()),"Download",(Object)(_imagesmap));
 //BA.debugLineNum = 596;BA.debugLine="timerSlideshow.Initialize(\"tmrSlideshow\",3900)";
_timerslideshow.Initialize(processBA,"tmrSlideshow",(long) (3900));
 //BA.debugLineNum = 597;BA.debugLine="timerSlideshow.Enabled = True";
_timerslideshow.setEnabled(anywheresoftware.b4a.keywords.Common.True);
 };
 };
 //BA.debugLineNum = 605;BA.debugLine="Dim html1 As Html";
_html1 = new uk.co.martinpearman.b4a.text.Html();
 //BA.debugLineNum = 606;BA.debugLine="lbldescription.Text = html1.FromHtml(product.Get(";
mostCurrent._lbldescription.setText(_html1.FromHtml(BA.ObjectToString(_product.Get((Object)("description")))));
 //BA.debugLineNum = 614;BA.debugLine="lbldescription.TextSize = 14";
mostCurrent._lbldescription.setTextSize((float) (14));
 //BA.debugLineNum = 616;BA.debugLine="Library.LabelSpace(lbldescription,1.7)";
mostCurrent._library._labelspace(mostCurrent.activityBA,(anywheresoftware.b4a.objects.ConcreteViewWrapper) anywheresoftware.b4a.AbsObjectWrapper.ConvertToWrapper(new anywheresoftware.b4a.objects.ConcreteViewWrapper(), (android.view.View)(mostCurrent._lbldescription.getObject())),(float) (1.7));
 //BA.debugLineNum = 618;BA.debugLine="Dim su As StringUtils";
_su = new anywheresoftware.b4a.objects.StringUtils();
 //BA.debugLineNum = 619;BA.debugLine="Dim new_height As Int";
_new_height = 0;
 //BA.debugLineNum = 621;BA.debugLine="Try";
try { //BA.debugLineNum = 622;BA.debugLine="new_height = su.MeasureMultilineTextHeight(lblde";
_new_height = _su.MeasureMultilineTextHeight((android.widget.TextView)(mostCurrent._lbldescription.getObject()),BA.ObjectToCharSequence(mostCurrent._lbldescription.getText()));
 } 
       catch (Exception e165) {
			processBA.setLastException(e165); //BA.debugLineNum = 624;BA.debugLine="new_height = lbldescription.Height";
_new_height = mostCurrent._lbldescription.getHeight();
 };
 //BA.debugLineNum = 627;BA.debugLine="Dim su As StringUtils";
_su = new anywheresoftware.b4a.objects.StringUtils();
 //BA.debugLineNum = 628;BA.debugLine="Dim OneLineHeight As Long = su.MeasureMultilin";
_onelineheight = (long) (_su.MeasureMultilineTextHeight((android.widget.TextView)(mostCurrent._lbldescription.getObject()),BA.ObjectToCharSequence(mostCurrent._lbldescription.getText())));
 //BA.debugLineNum = 629;BA.debugLine="Dim H As Long = su.MeasureMultilineTextHeight(";
_h = (long) (_su.MeasureMultilineTextHeight((android.widget.TextView)(mostCurrent._lbldescription.getObject()),BA.ObjectToCharSequence(mostCurrent._lbldescription.getText())));
 //BA.debugLineNum = 631;BA.debugLine="Dim obj1 As Reflector";
_obj1 = new anywheresoftware.b4a.agraham.reflection.Reflection();
 //BA.debugLineNum = 632;BA.debugLine="obj1.Target = lbldescription";
_obj1.Target = (Object)(mostCurrent._lbldescription.getObject());
 //BA.debugLineNum = 636;BA.debugLine="new_height = (obj1.RunMethod(\"getLineHeight\") * C";
_new_height = (int) (((double)(BA.ObjectToNumber(_obj1.RunMethod("getLineHeight")))*anywheresoftware.b4a.keywords.Common.Ceil(_h/(double)_onelineheight))/(double)1.9);
 //BA.debugLineNum = 638;BA.debugLine="If new_height < lbldescription.Height Then";
if (_new_height<mostCurrent._lbldescription.getHeight()) { 
 //BA.debugLineNum = 639;BA.debugLine="new_height = lbldescription.Height / 2";
_new_height = (int) (mostCurrent._lbldescription.getHeight()/(double)2);
 };
 //BA.debugLineNum = 642;BA.debugLine="lbldescription.Height = new_height + (new_height)";
mostCurrent._lbldescription.setHeight((int) (_new_height+(_new_height)+anywheresoftware.b4a.keywords.Common.DipToCurrent((int) (50))));
 //BA.debugLineNum = 644;BA.debugLine="sv1.Panel.Height = sv1.Panel.Height + lbldescript";
mostCurrent._sv1.getPanel().setHeight((int) (mostCurrent._sv1.getPanel().getHeight()+mostCurrent._lbldescription.getHeight()-anywheresoftware.b4a.keywords.Common.DipToCurrent((int) (340))));
 //BA.debugLineNum = 645;BA.debugLine="pnl2.Height = pnl2.Height + lbldescription.Height";
mostCurrent._pnl2.setHeight((int) (mostCurrent._pnl2.getHeight()+mostCurrent._lbldescription.getHeight()-anywheresoftware.b4a.keywords.Common.DipToCurrent((int) (270))));
 //BA.debugLineNum = 647;BA.debugLine="If Library.IsPersian Then";
if (mostCurrent._library._ispersian(mostCurrent.activityBA)) { 
 //BA.debugLineNum = 648;BA.debugLine="lbldescription.Gravity = Gravity.RIGHT";
mostCurrent._lbldescription.setGravity(anywheresoftware.b4a.keywords.Common.Gravity.RIGHT);
 //BA.debugLineNum = 649;BA.debugLine="lbldate.Text = Library.GetDate(product.Get(\"date";
mostCurrent._lbldate.setText(BA.ObjectToCharSequence(mostCurrent._library._getdate(mostCurrent.activityBA,BA.ObjectToString(_product.Get((Object)("date_added"))))));
 }else {
 //BA.debugLineNum = 651;BA.debugLine="lbldescription.Gravity = Gravity.LEFT";
mostCurrent._lbldescription.setGravity(anywheresoftware.b4a.keywords.Common.Gravity.LEFT);
 //BA.debugLineNum = 652;BA.debugLine="lbldate.Text = product.Get(\"date_added\")";
mostCurrent._lbldate.setText(BA.ObjectToCharSequence(_product.Get((Object)("date_added"))));
 };
 //BA.debugLineNum = 656;BA.debugLine="top = Library.GetRelativeTop(lbldescription) + lb";
_top = (int) (mostCurrent._library._getrelativetop(mostCurrent.activityBA,(anywheresoftware.b4j.object.JavaObject) anywheresoftware.b4a.AbsObjectWrapper.ConvertToWrapper(new anywheresoftware.b4j.object.JavaObject(), (java.lang.Object)(mostCurrent._lbldescription.getObject())))+mostCurrent._lbldescription.getHeight()+anywheresoftware.b4a.keywords.Common.DipToCurrent((int) (20)));
 //BA.debugLineNum = 657;BA.debugLine="DoEvents";
anywheresoftware.b4a.keywords.Common.DoEvents();
 //BA.debugLineNum = 661;BA.debugLine="Dim opRelat As OpenCart";
_oprelat = new com.apps.demo.opencart();
 //BA.debugLineNum = 662;BA.debugLine="opRelat.Initialize";
_oprelat._initialize(processBA);
 //BA.debugLineNum = 663;BA.debugLine="opRelat.RelatedProduct(Me,\"RelatedProduct_receive";
_oprelat._relatedproduct(actproduct.getObject(),"RelatedProduct_receive",BA.ObjectToString(_product.Get((Object)("id"))));
 //BA.debugLineNum = 665;BA.debugLine="progress.Visible = False";
mostCurrent._progress.setVisible(anywheresoftware.b4a.keywords.Common.False);
 //BA.debugLineNum = 667;BA.debugLine="lbladd2cart.Text = lbladd2cart.Text";
mostCurrent._lbladd2cart.setText(BA.ObjectToCharSequence(mostCurrent._lbladd2cart.getText()));
 //BA.debugLineNum = 668;BA.debugLine="lblfloat_basket.Text = \" \" & Library.GetStringRe";
mostCurrent._lblfloat_basket.setText(BA.ObjectToCharSequence(" "+mostCurrent._library._getstringresourse(mostCurrent.activityBA,"add2cartbtn")));
 //BA.debugLineNum = 671;BA.debugLine="If product.ContainsKey(\"minimum\") Then";
if (_product.ContainsKey((Object)("minimum"))) { 
 //BA.debugLineNum = 672;BA.debugLine="Dim minu As Int";
_minu = 0;
 //BA.debugLineNum = 673;BA.debugLine="minu = product.Get(\"minimum\")";
_minu = (int)(BA.ObjectToNumber(_product.Get((Object)("minimum"))));
 //BA.debugLineNum = 674;BA.debugLine="If minu > 1 Then";
if (_minu>1) { 
 //BA.debugLineNum = 675;BA.debugLine="Dim rich As RichString";
_rich = new anywheresoftware.b4a.agraham.richstring.RichStringBuilder.RichString();
 //BA.debugLineNum = 676;BA.debugLine="rich.Initialize(lblstate.Text & \" {c}{b}\" & Lib";
_rich.Initialize(BA.ObjectToCharSequence(mostCurrent._lblstate.getText()+" {c}{b}"+mostCurrent._library._getstringresourse(mostCurrent.activityBA,"atleast_product_to_cart").replace("0",(" "+anywheresoftware.b4a.keywords.Common.SmartStringFormatter("",(Object)(_minu))+" "))+"{c}{b}"));
 //BA.debugLineNum = 677;BA.debugLine="rich.Style2(rich.STYLE_BOLD,\"{b}\")";
_rich.Style2(_rich.STYLE_BOLD,"{b}");
 //BA.debugLineNum = 678;BA.debugLine="rich.Color2(Colors.Red,\"{c}\")";
_rich.Color2(anywheresoftware.b4a.keywords.Common.Colors.Red,"{c}");
 //BA.debugLineNum = 679;BA.debugLine="lblstate.Text = rich";
mostCurrent._lblstate.setText(BA.ObjectToCharSequence(_rich.getObject()));
 };
 };
 //BA.debugLineNum = 684;BA.debugLine="If Library.manager.GetBoolean(\"first_show_product";
if (mostCurrent._library._manager.GetBoolean("first_show_products")==anywheresoftware.b4a.keywords.Common.False) { 
 //BA.debugLineNum = 685;BA.debugLine="Library.manager.setBoolean(\"first_show_products\"";
mostCurrent._library._manager.SetBoolean("first_show_products",anywheresoftware.b4a.keywords.Common.True);
 //BA.debugLineNum = 686;BA.debugLine="titleHelp = Library.GetStringResourse(\"help\")";
mostCurrent._titlehelp = mostCurrent._library._getstringresourse(mostCurrent.activityBA,"help");
 //BA.debugLineNum = 688;BA.debugLine="If Library.phoneInfo.SdkVersion <> 19 Then";
if (mostCurrent._library._phoneinfo.getSdkVersion()!=19) { 
 //BA.debugLineNum = 689;BA.debugLine="TipTag = \"share\"";
mostCurrent._tiptag = "share";
 };
 };
 //BA.debugLineNum = 697;BA.debugLine="Dim price2 As String";
_price2 = "";
 //BA.debugLineNum = 698;BA.debugLine="price2 = product.Get(\"price\")";
_price2 = BA.ObjectToString(_product.Get((Object)("price")));
 //BA.debugLineNum = 699;BA.debugLine="If price2 = \"0\" Then";
if ((_price2).equals("0")) { 
 //BA.debugLineNum = 700;BA.debugLine="lbladd2cart.Text = Library.GetStringResourse(\"ca";
mostCurrent._lbladd2cart.setText(BA.ObjectToCharSequence(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"call_us")));
 };
 //BA.debugLineNum = 703;BA.debugLine="End Sub";
return "";
}
public static String  _loadoptions(anywheresoftware.b4a.objects.collections.List _attr) throws Exception{
anywheresoftware.b4a.objects.drawable.ColorDrawable _c1 = null;
ariagp.amin.shahedi.AriaGlideWrapper _glide = null;
anywheresoftware.b4a.objects.LabelWrapper _lblheader = null;
int _i = 0;
anywheresoftware.b4a.objects.collections.Map _optiontype = null;
anywheresoftware.b4a.objects.collections.List _optionvalue = null;
anywheresoftware.b4a.objects.LabelWrapper _lblkey = null;
anywheresoftware.b4a.objects.SpinnerWrapper _sp1 = null;
anywheresoftware.b4a.objects.PanelWrapper _pdefault = null;
boolean _blnaddpanel = false;
int _toprb = 0;
anywheresoftware.b4a.objects.EditTextWrapper _txt1 = null;
int _j = 0;
anywheresoftware.b4a.objects.collections.Map _attrs = null;
anywheresoftware.b4a.objects.CompoundButtonWrapper.RadioButtonWrapper _rb1 = null;
String _price_format = "";
anywheresoftware.b4a.objects.LabelWrapper _lb2 = null;
anywheresoftware.b4a.objects.CompoundButtonWrapper.CheckBoxWrapper _ck1 = null;
String _pr = "";
anywheresoftware.b4a.objects.LabelWrapper _lb21 = null;
anywheresoftware.b4a.objects.collections.Map _attrs1 = null;
anywheresoftware.b4a.objects.collections.Map _imagemap = null;
anywheresoftware.b4a.objects.collections.Map _img = null;
anywheresoftware.b4a.objects.CompoundButtonWrapper.RadioButtonWrapper _rbimage = null;
anywheresoftware.b4a.objects.ImageViewWrapper _image = null;
anywheresoftware.b4a.objects.LabelWrapper _lblimage = null;
String _thumb = "";
anywheresoftware.b4a.objects.LabelWrapper _divid = null;
 //BA.debugLineNum = 1479;BA.debugLine="Sub LoadOptions(attr As List)";
 //BA.debugLineNum = 1481;BA.debugLine="Dim c1 As ColorDrawable";
_c1 = new anywheresoftware.b4a.objects.drawable.ColorDrawable();
 //BA.debugLineNum = 1482;BA.debugLine="c1.Initialize2(Colors.White,7,1,Colors.Gray)";
_c1.Initialize2(anywheresoftware.b4a.keywords.Common.Colors.White,(int) (7),(int) (1),anywheresoftware.b4a.keywords.Common.Colors.Gray);
 //BA.debugLineNum = 1484;BA.debugLine="Dim Glide As AriaGlide";
_glide = new ariagp.amin.shahedi.AriaGlideWrapper();
 //BA.debugLineNum = 1486;BA.debugLine="If attr.IsInitialized = False Then Return";
if (_attr.IsInitialized()==anywheresoftware.b4a.keywords.Common.False) { 
if (true) return "";};
 //BA.debugLineNum = 1487;BA.debugLine="If attr.Size = 0 Then Return";
if (_attr.getSize()==0) { 
if (true) return "";};
 //BA.debugLineNum = 1489;BA.debugLine="progress.Visible = True";
mostCurrent._progress.setVisible(anywheresoftware.b4a.keywords.Common.True);
 //BA.debugLineNum = 1491;BA.debugLine="topOptions = top";
_topoptions = _top;
 //BA.debugLineNum = 1493;BA.debugLine="Dim lblHeader As Label";
_lblheader = new anywheresoftware.b4a.objects.LabelWrapper();
 //BA.debugLineNum = 1494;BA.debugLine="lblHeader.Initialize(\"\")";
_lblheader.Initialize(mostCurrent.activityBA,"");
 //BA.debugLineNum = 1495;BA.debugLine="lblHeader.Color = Colors.White";
_lblheader.setColor(anywheresoftware.b4a.keywords.Common.Colors.White);
 //BA.debugLineNum = 1497;BA.debugLine="lblHeader.Typeface = Library.GetFont";
_lblheader.setTypeface((android.graphics.Typeface)(mostCurrent._library._getfont(mostCurrent.activityBA).getObject()));
 //BA.debugLineNum = 1498;BA.debugLine="lblHeader.TextSize = 14";
_lblheader.setTextSize((float) (14));
 //BA.debugLineNum = 1499;BA.debugLine="lblHeader.TextColor = Colors.Gray";
_lblheader.setTextColor(anywheresoftware.b4a.keywords.Common.Colors.Gray);
 //BA.debugLineNum = 1500;BA.debugLine="lblHeader.Text = Library.GetStringResourse(\"optio";
_lblheader.setText(BA.ObjectToCharSequence(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"options")));
 //BA.debugLineNum = 1501;BA.debugLine="lblHeader.Gravity = Library.GetStringResourse(\"di";
_lblheader.setGravity((int)(Double.parseDouble(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"direction"))));
 //BA.debugLineNum = 1502;BA.debugLine="Library.PaddingLabel(lblHeader,10,0,10,0)";
mostCurrent._library._paddinglabel(mostCurrent.activityBA,_lblheader,(int) (10),(int) (0),(int) (10),(int) (0));
 //BA.debugLineNum = 1503;BA.debugLine="pnl2.AddView(lblHeader,pnl2.Left,top + 20,pnl2.Wi";
mostCurrent._pnl2.AddView((android.view.View)(_lblheader.getObject()),mostCurrent._pnl2.getLeft(),(int) (_top+20),mostCurrent._pnl2.getWidth(),anywheresoftware.b4a.keywords.Common.DipToCurrent((int) (40)));
 //BA.debugLineNum = 1504;BA.debugLine="top = top + lblHeader.Height+13dip";
_top = (int) (_top+_lblheader.getHeight()+anywheresoftware.b4a.keywords.Common.DipToCurrent((int) (13)));
 //BA.debugLineNum = 1505;BA.debugLine="sv1.Panel.Height = sv1.Panel.Height + 60dip";
mostCurrent._sv1.getPanel().setHeight((int) (mostCurrent._sv1.getPanel().getHeight()+anywheresoftware.b4a.keywords.Common.DipToCurrent((int) (60))));
 //BA.debugLineNum = 1506;BA.debugLine="pnl2.Height = sv1.Panel.Height + 60dip";
mostCurrent._pnl2.setHeight((int) (mostCurrent._sv1.getPanel().getHeight()+anywheresoftware.b4a.keywords.Common.DipToCurrent((int) (60))));
 //BA.debugLineNum = 1508;BA.debugLine="For i = 0 To attr.Size - 1";
{
final int step21 = 1;
final int limit21 = (int) (_attr.getSize()-1);
for (_i = (int) (0) ; (step21 > 0 && _i <= limit21) || (step21 < 0 && _i >= limit21); _i = ((int)(0 + _i + step21)) ) {
 //BA.debugLineNum = 1510;BA.debugLine="Dim OptionType As Map";
_optiontype = new anywheresoftware.b4a.objects.collections.Map();
 //BA.debugLineNum = 1511;BA.debugLine="Dim OptionValue As List";
_optionvalue = new anywheresoftware.b4a.objects.collections.List();
 //BA.debugLineNum = 1513;BA.debugLine="OptionType = attr.Get(i)";
_optiontype.setObject((anywheresoftware.b4a.objects.collections.Map.MyMap)(_attr.Get(_i)));
 //BA.debugLineNum = 1514;BA.debugLine="OptionValue = OptionType.Get(\"option_value\")";
_optionvalue.setObject((java.util.List)(_optiontype.Get((Object)("option_value"))));
 //BA.debugLineNum = 1516;BA.debugLine="Dim lblKey As Label";
_lblkey = new anywheresoftware.b4a.objects.LabelWrapper();
 //BA.debugLineNum = 1517;BA.debugLine="lblKey.Initialize(\"\")";
_lblkey.Initialize(mostCurrent.activityBA,"");
 //BA.debugLineNum = 1518;BA.debugLine="lblKey.Color = Library.Theme_Header";
_lblkey.setColor(mostCurrent._library._theme_header);
 //BA.debugLineNum = 1519;BA.debugLine="lblKey.Typeface = Library.GetFont";
_lblkey.setTypeface((android.graphics.Typeface)(mostCurrent._library._getfont(mostCurrent.activityBA).getObject()));
 //BA.debugLineNum = 1520;BA.debugLine="lblKey.TextSize = 11";
_lblkey.setTextSize((float) (11));
 //BA.debugLineNum = 1521;BA.debugLine="lblKey.TextColor = Colors.White";
_lblkey.setTextColor(anywheresoftware.b4a.keywords.Common.Colors.White);
 //BA.debugLineNum = 1522;BA.debugLine="lblKey.Text = OptionType.Get(\"name\") & \" \" & Lib";
_lblkey.setText(BA.ObjectToCharSequence(BA.ObjectToString(_optiontype.Get((Object)("name")))+" "+mostCurrent._library._getstringresourse(mostCurrent.activityBA,"request_state_"+BA.ObjectToString(_optiontype.Get((Object)("required"))))));
 //BA.debugLineNum = 1523;BA.debugLine="lblKey.Gravity = Library.GetStringResourse(\"dire";
_lblkey.setGravity((int)(Double.parseDouble(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"direction"))));
 //BA.debugLineNum = 1524;BA.debugLine="Library.PaddingLabel(lblKey,10,0,10,0)";
mostCurrent._library._paddinglabel(mostCurrent.activityBA,_lblkey,(int) (10),(int) (0),(int) (10),(int) (0));
 //BA.debugLineNum = 1526;BA.debugLine="pnl2.AddView(lblKey,pnl2.Left,top,pnl2.Width,40d";
mostCurrent._pnl2.AddView((android.view.View)(_lblkey.getObject()),mostCurrent._pnl2.getLeft(),_top,mostCurrent._pnl2.getWidth(),anywheresoftware.b4a.keywords.Common.DipToCurrent((int) (40)));
 //BA.debugLineNum = 1528;BA.debugLine="top = top + 43dip";
_top = (int) (_top+anywheresoftware.b4a.keywords.Common.DipToCurrent((int) (43)));
 //BA.debugLineNum = 1529;BA.debugLine="sv1.Panel.Height = sv1.Panel.Height + 43dip";
mostCurrent._sv1.getPanel().setHeight((int) (mostCurrent._sv1.getPanel().getHeight()+anywheresoftware.b4a.keywords.Common.DipToCurrent((int) (43))));
 //BA.debugLineNum = 1530;BA.debugLine="pnl2.Height = pnl2.Height + 43dip";
mostCurrent._pnl2.setHeight((int) (mostCurrent._pnl2.getHeight()+anywheresoftware.b4a.keywords.Common.DipToCurrent((int) (43))));
 //BA.debugLineNum = 1532;BA.debugLine="Dim sp1 As Spinner";
_sp1 = new anywheresoftware.b4a.objects.SpinnerWrapper();
 //BA.debugLineNum = 1533;BA.debugLine="sp1.Initialize(\"\")";
_sp1.Initialize(mostCurrent.activityBA,"");
 //BA.debugLineNum = 1535;BA.debugLine="Dim pDefault As Panel";
_pdefault = new anywheresoftware.b4a.objects.PanelWrapper();
 //BA.debugLineNum = 1536;BA.debugLine="Dim blnAddPanel As Boolean";
_blnaddpanel = false;
 //BA.debugLineNum = 1537;BA.debugLine="Dim TopRB As Int = 0";
_toprb = (int) (0);
 //BA.debugLineNum = 1538;BA.debugLine="pDefault.Initialize(\"\")";
_pdefault.Initialize(mostCurrent.activityBA,"");
 //BA.debugLineNum = 1540;BA.debugLine="If OptionType.Get(\"type\") = \"text\" Or OptionType";
if ((_optiontype.Get((Object)("type"))).equals((Object)("text")) || (_optiontype.Get((Object)("type"))).equals((Object)("file")) || (_optiontype.Get((Object)("type"))).equals((Object)("textarea")) || (_optiontype.Get((Object)("type"))).equals((Object)("time")) || (_optiontype.Get((Object)("type"))).equals((Object)("date")) || (_optiontype.Get((Object)("type"))).equals((Object)("datetime"))) { 
 //BA.debugLineNum = 1542;BA.debugLine="Dim txt1 As EditText";
_txt1 = new anywheresoftware.b4a.objects.EditTextWrapper();
 //BA.debugLineNum = 1543;BA.debugLine="txt1.Initialize(\"txtoption\")";
_txt1.Initialize(mostCurrent.activityBA,"txtoption");
 //BA.debugLineNum = 1544;BA.debugLine="txt1.Typeface = Library.GetFont";
_txt1.setTypeface((android.graphics.Typeface)(mostCurrent._library._getfont(mostCurrent.activityBA).getObject()));
 //BA.debugLineNum = 1545;BA.debugLine="txt1.Background = c1";
_txt1.setBackground((android.graphics.drawable.Drawable)(_c1.getObject()));
 //BA.debugLineNum = 1546;BA.debugLine="txt1.Tag = CreateMap(\"ID\":OptionType.Get(\"produ";
_txt1.setTag((Object)(anywheresoftware.b4a.keywords.Common.createMap(new Object[] {(Object)("ID"),_optiontype.Get((Object)("product_option_id")),(Object)("Val"),(Object)(""),(Object)("Type"),_optiontype.Get((Object)("type")),(Object)("Index"),(Object)(mostCurrent._listoptions.getSize()-1)}).getObject()));
 //BA.debugLineNum = 1547;BA.debugLine="ListOptions.Add(txt1)";
mostCurrent._listoptions.Add((Object)(_txt1.getObject()));
 //BA.debugLineNum = 1549;BA.debugLine="If OptionType.Get(\"type\") = \"textarea\" Then";
if ((_optiontype.Get((Object)("type"))).equals((Object)("textarea"))) { 
 //BA.debugLineNum = 1550;BA.debugLine="txt1.SingleLine = False";
_txt1.setSingleLine(anywheresoftware.b4a.keywords.Common.False);
 //BA.debugLineNum = 1551;BA.debugLine="pnl2.AddView(txt1,10,top,pnl2.Width-20,120dip)";
mostCurrent._pnl2.AddView((android.view.View)(_txt1.getObject()),(int) (10),_top,(int) (mostCurrent._pnl2.getWidth()-20),anywheresoftware.b4a.keywords.Common.DipToCurrent((int) (120)));
 //BA.debugLineNum = 1552;BA.debugLine="top = top + 128dip";
_top = (int) (_top+anywheresoftware.b4a.keywords.Common.DipToCurrent((int) (128)));
 //BA.debugLineNum = 1553;BA.debugLine="sv1.Panel.Height = sv1.Panel.Height + 128dip";
mostCurrent._sv1.getPanel().setHeight((int) (mostCurrent._sv1.getPanel().getHeight()+anywheresoftware.b4a.keywords.Common.DipToCurrent((int) (128))));
 //BA.debugLineNum = 1554;BA.debugLine="pnl2.Height = sv1.Panel.Height + 128dip";
mostCurrent._pnl2.setHeight((int) (mostCurrent._sv1.getPanel().getHeight()+anywheresoftware.b4a.keywords.Common.DipToCurrent((int) (128))));
 //BA.debugLineNum = 1555;BA.debugLine="txt1.Gravity = Bit.Or(Library.GetStringResours";
_txt1.setGravity(anywheresoftware.b4a.keywords.Common.Bit.Or((int)(Double.parseDouble(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"direction"))),anywheresoftware.b4a.keywords.Common.Gravity.TOP));
 }else {
 //BA.debugLineNum = 1557;BA.debugLine="txt1.SingleLine = True";
_txt1.setSingleLine(anywheresoftware.b4a.keywords.Common.True);
 //BA.debugLineNum = 1558;BA.debugLine="pnl2.AddView(txt1,10,top,pnl2.Width-20,40dip)";
mostCurrent._pnl2.AddView((android.view.View)(_txt1.getObject()),(int) (10),_top,(int) (mostCurrent._pnl2.getWidth()-20),anywheresoftware.b4a.keywords.Common.DipToCurrent((int) (40)));
 //BA.debugLineNum = 1559;BA.debugLine="top = top + 48dip";
_top = (int) (_top+anywheresoftware.b4a.keywords.Common.DipToCurrent((int) (48)));
 //BA.debugLineNum = 1560;BA.debugLine="txt1.Gravity = Library.GetStringResourse(\"dire";
_txt1.setGravity((int)(Double.parseDouble(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"direction"))));
 //BA.debugLineNum = 1561;BA.debugLine="sv1.Panel.Height = sv1.Panel.Height + 48dip";
mostCurrent._sv1.getPanel().setHeight((int) (mostCurrent._sv1.getPanel().getHeight()+anywheresoftware.b4a.keywords.Common.DipToCurrent((int) (48))));
 //BA.debugLineNum = 1562;BA.debugLine="pnl2.Height = sv1.Panel.Height + 48dip";
mostCurrent._pnl2.setHeight((int) (mostCurrent._sv1.getPanel().getHeight()+anywheresoftware.b4a.keywords.Common.DipToCurrent((int) (48))));
 };
 //BA.debugLineNum = 1565;BA.debugLine="Continue";
if (true) continue;
 };
 //BA.debugLineNum = 1569;BA.debugLine="For j = 0 To OptionValue.Size - 1";
{
final int step69 = 1;
final int limit69 = (int) (_optionvalue.getSize()-1);
for (_j = (int) (0) ; (step69 > 0 && _j <= limit69) || (step69 < 0 && _j >= limit69); _j = ((int)(0 + _j + step69)) ) {
 //BA.debugLineNum = 1570;BA.debugLine="Dim attrs As Map";
_attrs = new anywheresoftware.b4a.objects.collections.Map();
 //BA.debugLineNum = 1571;BA.debugLine="attrs = OptionValue.Get(j)";
_attrs.setObject((anywheresoftware.b4a.objects.collections.Map.MyMap)(_optionvalue.Get(_j)));
 //BA.debugLineNum = 1573;BA.debugLine="If OptionType.Get(\"type\") = \"radio\" Then";
if ((_optiontype.Get((Object)("type"))).equals((Object)("radio"))) { 
 //BA.debugLineNum = 1575;BA.debugLine="Dim rb1 As RadioButton";
_rb1 = new anywheresoftware.b4a.objects.CompoundButtonWrapper.RadioButtonWrapper();
 //BA.debugLineNum = 1576;BA.debugLine="rb1.Initialize(\"\")";
_rb1.Initialize(mostCurrent.activityBA,"");
 //BA.debugLineNum = 1577;BA.debugLine="rb1.TextSize = 12";
_rb1.setTextSize((float) (12));
 //BA.debugLineNum = 1578;BA.debugLine="Dim price_format As String";
_price_format = "";
 //BA.debugLineNum = 1579;BA.debugLine="price_format = attrs.Get(\"price_formated\")";
_price_format = BA.ObjectToString(_attrs.Get((Object)("price_formated")));
 //BA.debugLineNum = 1580;BA.debugLine="If price_format = \"false\" Then price_format =";
if ((_price_format).equals("false")) { 
_price_format = "";};
 //BA.debugLineNum = 1582;BA.debugLine="rb1.Tag = CreateMap(\"ID\":OptionType.Get(\"produ";
_rb1.setTag((Object)(anywheresoftware.b4a.keywords.Common.createMap(new Object[] {(Object)("ID"),_optiontype.Get((Object)("product_option_id")),(Object)("Val"),_attrs.Get((Object)("product_option_value_id"))}).getObject()));
 //BA.debugLineNum = 1588;BA.debugLine="ListOptions.Add(rb1)";
mostCurrent._listoptions.Add((Object)(_rb1.getObject()));
 //BA.debugLineNum = 1591;BA.debugLine="If blnAddPanel = False Then";
if (_blnaddpanel==anywheresoftware.b4a.keywords.Common.False) { 
 //BA.debugLineNum = 1592;BA.debugLine="pnl2.AddView(pDefault,0,top,100%x,40dip)";
mostCurrent._pnl2.AddView((android.view.View)(_pdefault.getObject()),(int) (0),_top,anywheresoftware.b4a.keywords.Common.PerXToCurrent((float) (100),mostCurrent.activityBA),anywheresoftware.b4a.keywords.Common.DipToCurrent((int) (40)));
 };
 //BA.debugLineNum = 1595;BA.debugLine="blnAddPanel = True";
_blnaddpanel = anywheresoftware.b4a.keywords.Common.True;
 //BA.debugLineNum = 1597;BA.debugLine="If Library.IsPersian Then";
if (mostCurrent._library._ispersian(mostCurrent.activityBA)) { 
 //BA.debugLineNum = 1598;BA.debugLine="Dim lb2 As Label";
_lb2 = new anywheresoftware.b4a.objects.LabelWrapper();
 //BA.debugLineNum = 1599;BA.debugLine="lb2.Initialize(\"\")";
_lb2.Initialize(mostCurrent.activityBA,"");
 //BA.debugLineNum = 1600;BA.debugLine="lb2.Text = \"  \" & attrs.Get(\"name\") & \" ( \" &";
_lb2.setText(BA.ObjectToCharSequence("  "+BA.ObjectToString(_attrs.Get((Object)("name")))+" ( "+BA.ObjectToString(_attrs.Get((Object)("price_prefix")))+_price_format+" )"));
 //BA.debugLineNum = 1601;BA.debugLine="lb2.Gravity = Gravity.RIGHT";
_lb2.setGravity(anywheresoftware.b4a.keywords.Common.Gravity.RIGHT);
 //BA.debugLineNum = 1602;BA.debugLine="lb2.TextColor = Colors.Black";
_lb2.setTextColor(anywheresoftware.b4a.keywords.Common.Colors.Black);
 //BA.debugLineNum = 1603;BA.debugLine="lb2.TextSize = 11";
_lb2.setTextSize((float) (11));
 //BA.debugLineNum = 1604;BA.debugLine="lb2.Typeface = Library.GetFont";
_lb2.setTypeface((android.graphics.Typeface)(mostCurrent._library._getfont(mostCurrent.activityBA).getObject()));
 //BA.debugLineNum = 1605;BA.debugLine="pDefault.AddView(lb2,0,TopRB+10,100%x - 40dip";
_pdefault.AddView((android.view.View)(_lb2.getObject()),(int) (0),(int) (_toprb+10),(int) (anywheresoftware.b4a.keywords.Common.PerXToCurrent((float) (100),mostCurrent.activityBA)-anywheresoftware.b4a.keywords.Common.DipToCurrent((int) (40))),anywheresoftware.b4a.keywords.Common.DipToCurrent((int) (40)));
 //BA.debugLineNum = 1606;BA.debugLine="pDefault.AddView(rb1,100%x-40dip,TopRB,40dip,";
_pdefault.AddView((android.view.View)(_rb1.getObject()),(int) (anywheresoftware.b4a.keywords.Common.PerXToCurrent((float) (100),mostCurrent.activityBA)-anywheresoftware.b4a.keywords.Common.DipToCurrent((int) (40))),_toprb,anywheresoftware.b4a.keywords.Common.DipToCurrent((int) (40)),anywheresoftware.b4a.keywords.Common.DipToCurrent((int) (40)));
 }else {
 //BA.debugLineNum = 1608;BA.debugLine="rb1.Text = \"  \" & attrs.Get(\"name\") & \" ( \" &";
_rb1.setText(BA.ObjectToCharSequence("  "+BA.ObjectToString(_attrs.Get((Object)("name")))+" ( "+BA.ObjectToString(_attrs.Get((Object)("price_prefix")))+_price_format+" )"));
 //BA.debugLineNum = 1609;BA.debugLine="rb1.Gravity = Library.GetStringResourse(\"dire";
_rb1.setGravity((int)(Double.parseDouble(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"direction"))));
 //BA.debugLineNum = 1610;BA.debugLine="rb1.Typeface = Library.GetFont";
_rb1.setTypeface((android.graphics.Typeface)(mostCurrent._library._getfont(mostCurrent.activityBA).getObject()));
 //BA.debugLineNum = 1611;BA.debugLine="pDefault.AddView(rb1,10,TopRB,pnl2.Width-20,4";
_pdefault.AddView((android.view.View)(_rb1.getObject()),(int) (10),_toprb,(int) (mostCurrent._pnl2.getWidth()-20),anywheresoftware.b4a.keywords.Common.DipToCurrent((int) (40)));
 };
 //BA.debugLineNum = 1614;BA.debugLine="top = top + 40dip";
_top = (int) (_top+anywheresoftware.b4a.keywords.Common.DipToCurrent((int) (40)));
 //BA.debugLineNum = 1615;BA.debugLine="TopRB = TopRB + 40dip";
_toprb = (int) (_toprb+anywheresoftware.b4a.keywords.Common.DipToCurrent((int) (40)));
 //BA.debugLineNum = 1616;BA.debugLine="sv1.Panel.Height = sv1.Panel.Height + 48dip";
mostCurrent._sv1.getPanel().setHeight((int) (mostCurrent._sv1.getPanel().getHeight()+anywheresoftware.b4a.keywords.Common.DipToCurrent((int) (48))));
 //BA.debugLineNum = 1617;BA.debugLine="pDefault.Height = pDefault.Height + 48dip";
_pdefault.setHeight((int) (_pdefault.getHeight()+anywheresoftware.b4a.keywords.Common.DipToCurrent((int) (48))));
 //BA.debugLineNum = 1618;BA.debugLine="pnl2.Height = sv1.Panel.Height + 48dip";
mostCurrent._pnl2.setHeight((int) (mostCurrent._sv1.getPanel().getHeight()+anywheresoftware.b4a.keywords.Common.DipToCurrent((int) (48))));
 }else if((_optiontype.Get((Object)("type"))).equals((Object)("checkbox"))) { 
 //BA.debugLineNum = 1622;BA.debugLine="Dim ck1 As CheckBox";
_ck1 = new anywheresoftware.b4a.objects.CompoundButtonWrapper.CheckBoxWrapper();
 //BA.debugLineNum = 1623;BA.debugLine="ck1.Initialize(\"\")";
_ck1.Initialize(mostCurrent.activityBA,"");
 //BA.debugLineNum = 1624;BA.debugLine="ck1.Typeface = Library.GetFont";
_ck1.setTypeface((android.graphics.Typeface)(mostCurrent._library._getfont(mostCurrent.activityBA).getObject()));
 //BA.debugLineNum = 1625;BA.debugLine="ck1.TextSize = 12";
_ck1.setTextSize((float) (12));
 //BA.debugLineNum = 1626;BA.debugLine="ck1.Gravity = Library.GetStringResourse(\"direc";
_ck1.setGravity((int)(Double.parseDouble(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"direction"))));
 //BA.debugLineNum = 1627;BA.debugLine="ck1.Tag = CreateMap(\"ID\":OptionType.Get(\"produ";
_ck1.setTag((Object)(anywheresoftware.b4a.keywords.Common.createMap(new Object[] {(Object)("ID"),_optiontype.Get((Object)("product_option_id")),(Object)("Val"),_attrs.Get((Object)("product_option_value_id"))}).getObject()));
 //BA.debugLineNum = 1628;BA.debugLine="ListOptions.Add(ck1)";
mostCurrent._listoptions.Add((Object)(_ck1.getObject()));
 //BA.debugLineNum = 1630;BA.debugLine="Dim pr As String";
_pr = "";
 //BA.debugLineNum = 1631;BA.debugLine="pr = attrs.Get(\"price_formated\")";
_pr = BA.ObjectToString(_attrs.Get((Object)("price_formated")));
 //BA.debugLineNum = 1632;BA.debugLine="If pr = \"false\" Then pr = \" \"";
if ((_pr).equals("false")) { 
_pr = " ";};
 //BA.debugLineNum = 1634;BA.debugLine="If Library.IsPersian Then";
if (mostCurrent._library._ispersian(mostCurrent.activityBA)) { 
 //BA.debugLineNum = 1635;BA.debugLine="Dim lb21 As Label";
_lb21 = new anywheresoftware.b4a.objects.LabelWrapper();
 //BA.debugLineNum = 1636;BA.debugLine="lb21.Initialize(\"\")";
_lb21.Initialize(mostCurrent.activityBA,"");
 //BA.debugLineNum = 1637;BA.debugLine="lb21.Text = \"  \" & attrs.Get(\"name\") & \" ( \"";
_lb21.setText(BA.ObjectToCharSequence("  "+BA.ObjectToString(_attrs.Get((Object)("name")))+" ( "+BA.ObjectToString(_attrs.Get((Object)("price_prefix")))+_pr+" )"));
 //BA.debugLineNum = 1638;BA.debugLine="lb21.Gravity = Gravity.RIGHT";
_lb21.setGravity(anywheresoftware.b4a.keywords.Common.Gravity.RIGHT);
 //BA.debugLineNum = 1639;BA.debugLine="lb21.TextColor = Colors.Black";
_lb21.setTextColor(anywheresoftware.b4a.keywords.Common.Colors.Black);
 //BA.debugLineNum = 1640;BA.debugLine="lb21.Typeface = Library.GetFont";
_lb21.setTypeface((android.graphics.Typeface)(mostCurrent._library._getfont(mostCurrent.activityBA).getObject()));
 //BA.debugLineNum = 1641;BA.debugLine="lb21.TextSize = 11";
_lb21.setTextSize((float) (11));
 //BA.debugLineNum = 1642;BA.debugLine="pnl2.AddView(lb21,0,top+10,100%x - 40dip,40di";
mostCurrent._pnl2.AddView((android.view.View)(_lb21.getObject()),(int) (0),(int) (_top+10),(int) (anywheresoftware.b4a.keywords.Common.PerXToCurrent((float) (100),mostCurrent.activityBA)-anywheresoftware.b4a.keywords.Common.DipToCurrent((int) (40))),anywheresoftware.b4a.keywords.Common.DipToCurrent((int) (40)));
 //BA.debugLineNum = 1643;BA.debugLine="pnl2.AddView(ck1,100%x-40dip,top,40dip,40dip)";
mostCurrent._pnl2.AddView((android.view.View)(_ck1.getObject()),(int) (anywheresoftware.b4a.keywords.Common.PerXToCurrent((float) (100),mostCurrent.activityBA)-anywheresoftware.b4a.keywords.Common.DipToCurrent((int) (40))),_top,anywheresoftware.b4a.keywords.Common.DipToCurrent((int) (40)),anywheresoftware.b4a.keywords.Common.DipToCurrent((int) (40)));
 }else {
 //BA.debugLineNum = 1645;BA.debugLine="ck1.Text = \"  \" & attrs.Get(\"name\") & \" ( \" &";
_ck1.setText(BA.ObjectToCharSequence("  "+BA.ObjectToString(_attrs.Get((Object)("name")))+" ( "+BA.ObjectToString(_attrs.Get((Object)("price_prefix")))+BA.ObjectToString(_attrs.Get((Object)("price_formated")))+" )"));
 //BA.debugLineNum = 1646;BA.debugLine="pnl2.AddView(ck1,10,top,pnl2.Width-20,40dip)";
mostCurrent._pnl2.AddView((android.view.View)(_ck1.getObject()),(int) (10),_top,(int) (mostCurrent._pnl2.getWidth()-20),anywheresoftware.b4a.keywords.Common.DipToCurrent((int) (40)));
 };
 //BA.debugLineNum = 1649;BA.debugLine="top = top + 40dip";
_top = (int) (_top+anywheresoftware.b4a.keywords.Common.DipToCurrent((int) (40)));
 //BA.debugLineNum = 1650;BA.debugLine="sv1.Panel.Height = sv1.Panel.Height + 58dip";
mostCurrent._sv1.getPanel().setHeight((int) (mostCurrent._sv1.getPanel().getHeight()+anywheresoftware.b4a.keywords.Common.DipToCurrent((int) (58))));
 //BA.debugLineNum = 1651;BA.debugLine="pnl2.Height = sv1.Panel.Height + 58dip";
mostCurrent._pnl2.setHeight((int) (mostCurrent._sv1.getPanel().getHeight()+anywheresoftware.b4a.keywords.Common.DipToCurrent((int) (58))));
 }else if((_optiontype.Get((Object)("type"))).equals((Object)("select"))) { 
 //BA.debugLineNum = 1655;BA.debugLine="Dim attrs1 As Map";
_attrs1 = new anywheresoftware.b4a.objects.collections.Map();
 //BA.debugLineNum = 1656;BA.debugLine="attrs1 = OptionValue.Get(j)";
_attrs1.setObject((anywheresoftware.b4a.objects.collections.Map.MyMap)(_optionvalue.Get(_j)));
 //BA.debugLineNum = 1658;BA.debugLine="Dim pr As String";
_pr = "";
 //BA.debugLineNum = 1659;BA.debugLine="pr = attrs1.Get(\"price_formated\")";
_pr = BA.ObjectToString(_attrs1.Get((Object)("price_formated")));
 //BA.debugLineNum = 1660;BA.debugLine="If pr = \"false\" Then pr = \" )\"";
if ((_pr).equals("false")) { 
_pr = " )";};
 //BA.debugLineNum = 1662;BA.debugLine="sp1.Add(attrs1.Get(\"name\") & \" ( \" & attrs1.Ge";
_sp1.Add(BA.ObjectToString(_attrs1.Get((Object)("name")))+" ( "+BA.ObjectToString(_attrs1.Get((Object)("price_prefix")))+_pr+" )");
 //BA.debugLineNum = 1664;BA.debugLine="If sp1.Size = OptionValue.Size Then";
if (_sp1.getSize()==_optionvalue.getSize()) { 
 //BA.debugLineNum = 1665;BA.debugLine="sp1.SelectedIndex = 0";
_sp1.setSelectedIndex((int) (0));
 //BA.debugLineNum = 1666;BA.debugLine="sp1.Tag = CreateMap(\"Vals\" : OptionValue,\"id\"";
_sp1.setTag((Object)(anywheresoftware.b4a.keywords.Common.createMap(new Object[] {(Object)("Vals"),(Object)(_optionvalue.getObject()),(Object)("id"),_optiontype.Get((Object)("product_option_id")),(Object)("Val"),_attrs.Get((Object)("product_option_value_id"))}).getObject()));
 //BA.debugLineNum = 1667;BA.debugLine="ListOptions.Add(sp1)";
mostCurrent._listoptions.Add((Object)(_sp1.getObject()));
 //BA.debugLineNum = 1668;BA.debugLine="sp1.TextSize = 12";
_sp1.setTextSize((float) (12));
 //BA.debugLineNum = 1669;BA.debugLine="pnl2.AddView(sp1,10,top,pnl2.Width-20,40dip)";
mostCurrent._pnl2.AddView((android.view.View)(_sp1.getObject()),(int) (10),_top,(int) (mostCurrent._pnl2.getWidth()-20),anywheresoftware.b4a.keywords.Common.DipToCurrent((int) (40)));
 //BA.debugLineNum = 1670;BA.debugLine="top = top + 40dip";
_top = (int) (_top+anywheresoftware.b4a.keywords.Common.DipToCurrent((int) (40)));
 //BA.debugLineNum = 1671;BA.debugLine="topOptions = top";
_topoptions = _top;
 //BA.debugLineNum = 1672;BA.debugLine="sv1.Panel.Height = sv1.Panel.Height + 48dip";
mostCurrent._sv1.getPanel().setHeight((int) (mostCurrent._sv1.getPanel().getHeight()+anywheresoftware.b4a.keywords.Common.DipToCurrent((int) (48))));
 //BA.debugLineNum = 1673;BA.debugLine="pnl2.Height = sv1.Panel.Height + 48dip";
mostCurrent._pnl2.setHeight((int) (mostCurrent._sv1.getPanel().getHeight()+anywheresoftware.b4a.keywords.Common.DipToCurrent((int) (48))));
 };
 }else if((_optiontype.Get((Object)("type"))).equals((Object)("image"))) { 
 //BA.debugLineNum = 1678;BA.debugLine="Dim imageMap As Map";
_imagemap = new anywheresoftware.b4a.objects.collections.Map();
 //BA.debugLineNum = 1679;BA.debugLine="imageMap.Initialize";
_imagemap.Initialize();
 //BA.debugLineNum = 1681;BA.debugLine="Dim img As Map";
_img = new anywheresoftware.b4a.objects.collections.Map();
 //BA.debugLineNum = 1682;BA.debugLine="img = OptionValue.Get(j)";
_img.setObject((anywheresoftware.b4a.objects.collections.Map.MyMap)(_optionvalue.Get(_j)));
 //BA.debugLineNum = 1684;BA.debugLine="Dim rbimage As RadioButton";
_rbimage = new anywheresoftware.b4a.objects.CompoundButtonWrapper.RadioButtonWrapper();
 //BA.debugLineNum = 1685;BA.debugLine="rbimage.Initialize(\"\")";
_rbimage.Initialize(mostCurrent.activityBA,"");
 //BA.debugLineNum = 1686;BA.debugLine="rbimage.TextSize = 12";
_rbimage.setTextSize((float) (12));
 //BA.debugLineNum = 1687;BA.debugLine="rbimage.Gravity = Library.GetStringResourse(\"d";
_rbimage.setGravity((int)(Double.parseDouble(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"direction"))));
 //BA.debugLineNum = 1688;BA.debugLine="rbimage.Tag = CreateMap(\"ID\":OptionType.Get(\"p";
_rbimage.setTag((Object)(anywheresoftware.b4a.keywords.Common.createMap(new Object[] {(Object)("ID"),_optiontype.Get((Object)("product_option_id")),(Object)("Val"),_attrs.Get((Object)("product_option_value_id"))}).getObject()));
 //BA.debugLineNum = 1690;BA.debugLine="Dim image As ImageView";
_image = new anywheresoftware.b4a.objects.ImageViewWrapper();
 //BA.debugLineNum = 1691;BA.debugLine="image.Initialize(\"\")";
_image.Initialize(mostCurrent.activityBA,"");
 //BA.debugLineNum = 1693;BA.debugLine="Dim lblImage As Label";
_lblimage = new anywheresoftware.b4a.objects.LabelWrapper();
 //BA.debugLineNum = 1694;BA.debugLine="lblImage.Initialize(\"\")";
_lblimage.Initialize(mostCurrent.activityBA,"");
 //BA.debugLineNum = 1695;BA.debugLine="lblImage.Typeface = Library.GetFont";
_lblimage.setTypeface((android.graphics.Typeface)(mostCurrent._library._getfont(mostCurrent.activityBA).getObject()));
 //BA.debugLineNum = 1696;BA.debugLine="lblImage.TextSize = 11";
_lblimage.setTextSize((float) (11));
 //BA.debugLineNum = 1697;BA.debugLine="lblImage.TextColor = Colors.Black";
_lblimage.setTextColor(anywheresoftware.b4a.keywords.Common.Colors.Black);
 //BA.debugLineNum = 1698;BA.debugLine="lblImage.Text = \"  \" & img.Get(\"name\") & \" ( \"";
_lblimage.setText(BA.ObjectToCharSequence("  "+BA.ObjectToString(_img.Get((Object)("name")))+" ( "+BA.ObjectToString(_img.Get((Object)("price_prefix")))+" )"));
 //BA.debugLineNum = 1699;BA.debugLine="lblImage.Gravity = Library.GetStringResourse(\"";
_lblimage.setGravity((int)(Double.parseDouble(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"direction"))));
 //BA.debugLineNum = 1701;BA.debugLine="If Library.IsPersian Then";
if (mostCurrent._library._ispersian(mostCurrent.activityBA)) { 
 //BA.debugLineNum = 1702;BA.debugLine="pnl2.AddView(rbimage,100%x-38dip,top,34dip,34";
mostCurrent._pnl2.AddView((android.view.View)(_rbimage.getObject()),(int) (anywheresoftware.b4a.keywords.Common.PerXToCurrent((float) (100),mostCurrent.activityBA)-anywheresoftware.b4a.keywords.Common.DipToCurrent((int) (38))),_top,anywheresoftware.b4a.keywords.Common.DipToCurrent((int) (34)),anywheresoftware.b4a.keywords.Common.DipToCurrent((int) (34)));
 //BA.debugLineNum = 1703;BA.debugLine="pnl2.AddView(image,100%x-38dip-38dip,top,34di";
mostCurrent._pnl2.AddView((android.view.View)(_image.getObject()),(int) (anywheresoftware.b4a.keywords.Common.PerXToCurrent((float) (100),mostCurrent.activityBA)-anywheresoftware.b4a.keywords.Common.DipToCurrent((int) (38))-anywheresoftware.b4a.keywords.Common.DipToCurrent((int) (38))),_top,anywheresoftware.b4a.keywords.Common.DipToCurrent((int) (34)),anywheresoftware.b4a.keywords.Common.DipToCurrent((int) (34)));
 //BA.debugLineNum = 1704;BA.debugLine="pnl2.AddView(lblImage,0,top+8,100%x-38dip-38d";
mostCurrent._pnl2.AddView((android.view.View)(_lblimage.getObject()),(int) (0),(int) (_top+8),(int) (anywheresoftware.b4a.keywords.Common.PerXToCurrent((float) (100),mostCurrent.activityBA)-anywheresoftware.b4a.keywords.Common.DipToCurrent((int) (38))-anywheresoftware.b4a.keywords.Common.DipToCurrent((int) (38))),anywheresoftware.b4a.keywords.Common.DipToCurrent((int) (43)));
 //BA.debugLineNum = 1705;BA.debugLine="lblImage.Gravity = Gravity.RIGHT";
_lblimage.setGravity(anywheresoftware.b4a.keywords.Common.Gravity.RIGHT);
 }else {
 //BA.debugLineNum = 1707;BA.debugLine="pnl2.AddView(rbimage,10,top,34dip,34dip)";
mostCurrent._pnl2.AddView((android.view.View)(_rbimage.getObject()),(int) (10),_top,anywheresoftware.b4a.keywords.Common.DipToCurrent((int) (34)),anywheresoftware.b4a.keywords.Common.DipToCurrent((int) (34)));
 //BA.debugLineNum = 1708;BA.debugLine="pnl2.AddView(image,rbimage.Left + rbimage.Wid";
mostCurrent._pnl2.AddView((android.view.View)(_image.getObject()),(int) (_rbimage.getLeft()+_rbimage.getWidth()),_top,anywheresoftware.b4a.keywords.Common.DipToCurrent((int) (34)),anywheresoftware.b4a.keywords.Common.DipToCurrent((int) (34)));
 //BA.debugLineNum = 1709;BA.debugLine="pnl2.AddView(lblImage,image.Left + image.Widt";
mostCurrent._pnl2.AddView((android.view.View)(_lblimage.getObject()),(int) (_image.getLeft()+_image.getWidth()),_top,(int) (mostCurrent._pnl2.getWidth()-_image.getWidth()-(_image.getWidth())-14),anywheresoftware.b4a.keywords.Common.DipToCurrent((int) (43)));
 };
 //BA.debugLineNum = 1714;BA.debugLine="Dim thumb As String";
_thumb = "";
 //BA.debugLineNum = 1715;BA.debugLine="thumb = img.Get(\"image\")";
_thumb = BA.ObjectToString(_img.Get((Object)("image")));
 //BA.debugLineNum = 1716;BA.debugLine="thumb = thumb.Replace(\" \",\"%20\")";
_thumb = _thumb.replace(" ","%20");
 //BA.debugLineNum = 1718;BA.debugLine="Glide.Load(thumb).AsBitmap.Resize(Abs(image.Wi";
_glide.Load((Object)(_thumb)).AsBitmap().Resize((int) (anywheresoftware.b4a.keywords.Common.Abs(_image.getWidth())),(int) (anywheresoftware.b4a.keywords.Common.Abs(_image.getHeight()))).CenterCrop().IntoImageView(_image);
 //BA.debugLineNum = 1720;BA.debugLine="ListOptions.Add(rbimage)";
mostCurrent._listoptions.Add((Object)(_rbimage.getObject()));
 //BA.debugLineNum = 1722;BA.debugLine="top = top + 37dip";
_top = (int) (_top+anywheresoftware.b4a.keywords.Common.DipToCurrent((int) (37)));
 //BA.debugLineNum = 1723;BA.debugLine="topOptions = top";
_topoptions = _top;
 //BA.debugLineNum = 1724;BA.debugLine="sv1.Panel.Height = sv1.Panel.Height + 48dip";
mostCurrent._sv1.getPanel().setHeight((int) (mostCurrent._sv1.getPanel().getHeight()+anywheresoftware.b4a.keywords.Common.DipToCurrent((int) (48))));
 //BA.debugLineNum = 1725;BA.debugLine="pnl2.Height = sv1.Panel.Height + 48dip";
mostCurrent._pnl2.setHeight((int) (mostCurrent._sv1.getPanel().getHeight()+anywheresoftware.b4a.keywords.Common.DipToCurrent((int) (48))));
 };
 //BA.debugLineNum = 1729;BA.debugLine="DoEvents";
anywheresoftware.b4a.keywords.Common.DoEvents();
 //BA.debugLineNum = 1731;BA.debugLine="pnl2.Height = pnl2.Height + 43dip";
mostCurrent._pnl2.setHeight((int) (mostCurrent._pnl2.getHeight()+anywheresoftware.b4a.keywords.Common.DipToCurrent((int) (43))));
 }
};
 //BA.debugLineNum = 1735;BA.debugLine="DoEvents";
anywheresoftware.b4a.keywords.Common.DoEvents();
 }
};
 //BA.debugLineNum = 1739;BA.debugLine="Dim divid As Label";
_divid = new anywheresoftware.b4a.objects.LabelWrapper();
 //BA.debugLineNum = 1740;BA.debugLine="divid.Initialize(\"\")";
_divid.Initialize(mostCurrent.activityBA,"");
 //BA.debugLineNum = 1741;BA.debugLine="divid.Color = Colors.RGB(212,212,212)";
_divid.setColor(anywheresoftware.b4a.keywords.Common.Colors.RGB((int) (212),(int) (212),(int) (212)));
 //BA.debugLineNum = 1742;BA.debugLine="pnl2.AddView(divid,10,top + 4,sv1.Width-20,1)";
mostCurrent._pnl2.AddView((android.view.View)(_divid.getObject()),(int) (10),(int) (_top+4),(int) (mostCurrent._sv1.getWidth()-20),(int) (1));
 //BA.debugLineNum = 1744;BA.debugLine="progress.Visible = False";
mostCurrent._progress.setVisible(anywheresoftware.b4a.keywords.Common.False);
 //BA.debugLineNum = 1746;BA.debugLine="End Sub";
return "";
}
public static String  _loadreviews() throws Exception{
com.views.setting.ViewsSetting _sett = null;
anywheresoftware.b4a.objects.collections.Map _reviewsmap = null;
anywheresoftware.b4a.objects.collections.List _reviews = null;
int _topreviews = 0;
uk.co.martinpearman.b4a.text.Html _html1 = null;
int _j = 0;
anywheresoftware.b4a.objects.collections.Map _m1 = null;
anywheresoftware.b4a.objects.PanelWrapper _p1 = null;
int _newheight = 0;
int _rating1 = 0;
anywheresoftware.b4a.objects.ButtonWrapper _btnbackre = null;
anywheresoftware.b4a.objects.drawable.ColorDrawable _cd = null;
 //BA.debugLineNum = 869;BA.debugLine="Sub LoadReviews";
 //BA.debugLineNum = 871;BA.debugLine="Dim sett As ViewSetting";
_sett = new com.views.setting.ViewsSetting();
 //BA.debugLineNum = 873;BA.debugLine="If product.ContainsKey(\"reviews\") Then";
if (_product.ContainsKey((Object)("reviews"))) { 
 //BA.debugLineNum = 875;BA.debugLine="progress.Visible = True";
mostCurrent._progress.setVisible(anywheresoftware.b4a.keywords.Common.True);
 //BA.debugLineNum = 877;BA.debugLine="Dim reviewsMap As Map = product.Get(\"reviews\")";
_reviewsmap = new anywheresoftware.b4a.objects.collections.Map();
_reviewsmap.setObject((anywheresoftware.b4a.objects.collections.Map.MyMap)(_product.Get((Object)("reviews"))));
 //BA.debugLineNum = 878;BA.debugLine="Dim reviews As List";
_reviews = new anywheresoftware.b4a.objects.collections.List();
 //BA.debugLineNum = 879;BA.debugLine="reviews = reviewsMap.Get(\"reviews\")";
_reviews.setObject((java.util.List)(_reviewsmap.Get((Object)("reviews"))));
 //BA.debugLineNum = 881;BA.debugLine="If reviews.IsInitialized Then";
if (_reviews.IsInitialized()) { 
 //BA.debugLineNum = 883;BA.debugLine="Dim topReviews As Int";
_topreviews = 0;
 //BA.debugLineNum = 884;BA.debugLine="Dim html1 As Html";
_html1 = new uk.co.martinpearman.b4a.text.Html();
 //BA.debugLineNum = 886;BA.debugLine="For j = 0 To reviews.Size - 1";
{
final int step10 = 1;
final int limit10 = (int) (_reviews.getSize()-1);
for (_j = (int) (0) ; (step10 > 0 && _j <= limit10) || (step10 < 0 && _j >= limit10); _j = ((int)(0 + _j + step10)) ) {
 //BA.debugLineNum = 888;BA.debugLine="Dim m1 As Map";
_m1 = new anywheresoftware.b4a.objects.collections.Map();
 //BA.debugLineNum = 889;BA.debugLine="m1 = reviews.Get(j)";
_m1.setObject((anywheresoftware.b4a.objects.collections.Map.MyMap)(_reviews.Get(_j)));
 //BA.debugLineNum = 891;BA.debugLine="Dim p1 As Panel";
_p1 = new anywheresoftware.b4a.objects.PanelWrapper();
 //BA.debugLineNum = 892;BA.debugLine="p1.Initialize(\"\")";
_p1.Initialize(mostCurrent.activityBA,"");
 //BA.debugLineNum = 894;BA.debugLine="svReviews.Panel.AddView(p1,0,topReviews,svRevi";
mostCurrent._svreviews.getPanel().AddView((android.view.View)(_p1.getObject()),(int) (0),_topreviews,mostCurrent._svreviews.getWidth(),(int) (0));
 //BA.debugLineNum = 895;BA.debugLine="p1.LoadLayout(\"frmtemplate_comment\")";
_p1.LoadLayout("frmtemplate_comment",mostCurrent.activityBA);
 //BA.debugLineNum = 896;BA.debugLine="p1.height = pnlitem_comment.height + 4";
_p1.setHeight((int) (mostCurrent._pnlitem_comment.getHeight()+4));
 //BA.debugLineNum = 898;BA.debugLine="Library.LabelSpace(lblcomment_review,1.3)";
mostCurrent._library._labelspace(mostCurrent.activityBA,(anywheresoftware.b4a.objects.ConcreteViewWrapper) anywheresoftware.b4a.AbsObjectWrapper.ConvertToWrapper(new anywheresoftware.b4a.objects.ConcreteViewWrapper(), (android.view.View)(mostCurrent._lblcomment_review.getObject())),(float) (1.3));
 //BA.debugLineNum = 900;BA.debugLine="lblauthor.Text = m1.Get(\"author\")";
mostCurrent._lblauthor.setText(BA.ObjectToCharSequence(_m1.Get((Object)("author"))));
 //BA.debugLineNum = 902;BA.debugLine="If Library.IsPersian Then";
if (mostCurrent._library._ispersian(mostCurrent.activityBA)) { 
 //BA.debugLineNum = 903;BA.debugLine="lbldate_comment.Text = Library.GetDate(m1.Get";
mostCurrent._lbldate_comment.setText(BA.ObjectToCharSequence(mostCurrent._library._getdate(mostCurrent.activityBA,BA.ObjectToString(_m1.Get((Object)("date_added"))))));
 //BA.debugLineNum = 904;BA.debugLine="lblcomment_review.Gravity = Gravity.RIGHT";
mostCurrent._lblcomment_review.setGravity(anywheresoftware.b4a.keywords.Common.Gravity.RIGHT);
 }else {
 //BA.debugLineNum = 906;BA.debugLine="lbldate_comment.Text = m1.Get(\"date_added\")";
mostCurrent._lbldate_comment.setText(BA.ObjectToCharSequence(_m1.Get((Object)("date_added"))));
 //BA.debugLineNum = 907;BA.debugLine="lblcomment_review.Gravity = Gravity.LEFT";
mostCurrent._lblcomment_review.setGravity(anywheresoftware.b4a.keywords.Common.Gravity.LEFT);
 };
 //BA.debugLineNum = 910;BA.debugLine="lblcomment_review.Text = html1.FromHtml(m1.Get";
mostCurrent._lblcomment_review.setText(_html1.FromHtml(BA.ObjectToString(_m1.Get((Object)("text")))));
 //BA.debugLineNum = 912;BA.debugLine="Dim newHeight As Int";
_newheight = 0;
 //BA.debugLineNum = 913;BA.debugLine="newHeight = sett.MeasureMultilineTextHeight(lb";
_newheight = _sett.MeasureMultilineTextHeight((android.widget.TextView)(mostCurrent._lblcomment_review.getObject()),BA.ObjectToString(_m1.Get((Object)("text"))));
 //BA.debugLineNum = 915;BA.debugLine="If newHeight < p1.height Then";
if (_newheight<_p1.getHeight()) { 
 //BA.debugLineNum = 916;BA.debugLine="newHeight = p1.height";
_newheight = _p1.getHeight();
 };
 //BA.debugLineNum = 919;BA.debugLine="lblnumber.Text = j + 1";
mostCurrent._lblnumber.setText(BA.ObjectToCharSequence(_j+1));
 //BA.debugLineNum = 921;BA.debugLine="lblcomment_review.height = newHeight";
mostCurrent._lblcomment_review.setHeight(_newheight);
 //BA.debugLineNum = 922;BA.debugLine="p1.height = p1.height + (newHeight - p1.height";
_p1.setHeight((int) (_p1.getHeight()+(_newheight-_p1.getHeight())));
 //BA.debugLineNum = 924;BA.debugLine="topReviews = topReviews + p1.height";
_topreviews = (int) (_topreviews+_p1.getHeight());
 //BA.debugLineNum = 926;BA.debugLine="If j = 0 Then topReview = topReviews - p1.heig";
if (_j==0) { 
_topreview = (int) (_topreviews-_p1.getHeight());};
 //BA.debugLineNum = 930;BA.debugLine="Dim rating1 As Int";
_rating1 = 0;
 //BA.debugLineNum = 931;BA.debugLine="rating1 = m1.Get(\"rating\")";
_rating1 = (int)(BA.ObjectToNumber(_m1.Get((Object)("rating"))));
 //BA.debugLineNum = 933;BA.debugLine="If rating1 = \"0\" Then";
if (_rating1==(double)(Double.parseDouble("0"))) { 
 //BA.debugLineNum = 934;BA.debugLine="lblcommentstar1.Text = \"\"";
mostCurrent._lblcommentstar1.setText(BA.ObjectToCharSequence(""));
 //BA.debugLineNum = 935;BA.debugLine="lblcommentstar2.Text = \"\"";
mostCurrent._lblcommentstar2.setText(BA.ObjectToCharSequence(""));
 //BA.debugLineNum = 936;BA.debugLine="lblcommentstar3.Text = \"\"";
mostCurrent._lblcommentstar3.setText(BA.ObjectToCharSequence(""));
 //BA.debugLineNum = 937;BA.debugLine="lblcommentstar4.Text = \"\"";
mostCurrent._lblcommentstar4.setText(BA.ObjectToCharSequence(""));
 //BA.debugLineNum = 938;BA.debugLine="lblcommentstar5.Text = \"\"";
mostCurrent._lblcommentstar5.setText(BA.ObjectToCharSequence(""));
 }else if(_rating1==(double)(Double.parseDouble("1"))) { 
 //BA.debugLineNum = 941;BA.debugLine="lblcommentstar1.Text = \"\"";
mostCurrent._lblcommentstar1.setText(BA.ObjectToCharSequence(""));
 //BA.debugLineNum = 942;BA.debugLine="lblcommentstar2.Text = \"\"";
mostCurrent._lblcommentstar2.setText(BA.ObjectToCharSequence(""));
 //BA.debugLineNum = 943;BA.debugLine="lblcommentstar3.Text = \"\"";
mostCurrent._lblcommentstar3.setText(BA.ObjectToCharSequence(""));
 //BA.debugLineNum = 944;BA.debugLine="lblcommentstar4.Text = \"\"";
mostCurrent._lblcommentstar4.setText(BA.ObjectToCharSequence(""));
 //BA.debugLineNum = 945;BA.debugLine="lblcommentstar5.Text = \"\"";
mostCurrent._lblcommentstar5.setText(BA.ObjectToCharSequence(""));
 }else if(_rating1==(double)(Double.parseDouble("2"))) { 
 //BA.debugLineNum = 948;BA.debugLine="lblcommentstar1.Text = \"\"";
mostCurrent._lblcommentstar1.setText(BA.ObjectToCharSequence(""));
 //BA.debugLineNum = 949;BA.debugLine="lblcommentstar2.Text = \"\"";
mostCurrent._lblcommentstar2.setText(BA.ObjectToCharSequence(""));
 //BA.debugLineNum = 950;BA.debugLine="lblcommentstar3.Text = \"\"";
mostCurrent._lblcommentstar3.setText(BA.ObjectToCharSequence(""));
 //BA.debugLineNum = 951;BA.debugLine="lblcommentstar4.Text = \"\"";
mostCurrent._lblcommentstar4.setText(BA.ObjectToCharSequence(""));
 //BA.debugLineNum = 952;BA.debugLine="lblcommentstar5.Text = \"\"";
mostCurrent._lblcommentstar5.setText(BA.ObjectToCharSequence(""));
 }else if(_rating1==(double)(Double.parseDouble("3"))) { 
 //BA.debugLineNum = 955;BA.debugLine="lblcommentstar1.Text = \"\"";
mostCurrent._lblcommentstar1.setText(BA.ObjectToCharSequence(""));
 //BA.debugLineNum = 956;BA.debugLine="lblcommentstar2.Text = \"\"";
mostCurrent._lblcommentstar2.setText(BA.ObjectToCharSequence(""));
 //BA.debugLineNum = 957;BA.debugLine="lblcommentstar3.Text = \"\"";
mostCurrent._lblcommentstar3.setText(BA.ObjectToCharSequence(""));
 //BA.debugLineNum = 958;BA.debugLine="lblcommentstar4.Text = \"\"";
mostCurrent._lblcommentstar4.setText(BA.ObjectToCharSequence(""));
 //BA.debugLineNum = 959;BA.debugLine="lblcommentstar5.Text = \"\"";
mostCurrent._lblcommentstar5.setText(BA.ObjectToCharSequence(""));
 }else if(_rating1==(double)(Double.parseDouble("4"))) { 
 //BA.debugLineNum = 962;BA.debugLine="lblcommentstar1.Text = \"\"";
mostCurrent._lblcommentstar1.setText(BA.ObjectToCharSequence(""));
 //BA.debugLineNum = 963;BA.debugLine="lblcommentstar2.Text = \"\"";
mostCurrent._lblcommentstar2.setText(BA.ObjectToCharSequence(""));
 //BA.debugLineNum = 964;BA.debugLine="lblcommentstar3.Text = \"\"";
mostCurrent._lblcommentstar3.setText(BA.ObjectToCharSequence(""));
 //BA.debugLineNum = 965;BA.debugLine="lblcommentstar4.Text = \"\"";
mostCurrent._lblcommentstar4.setText(BA.ObjectToCharSequence(""));
 //BA.debugLineNum = 966;BA.debugLine="lblcommentstar5.Text = \"\"";
mostCurrent._lblcommentstar5.setText(BA.ObjectToCharSequence(""));
 }else if(_rating1==(double)(Double.parseDouble("5")) || _rating1>5) { 
 //BA.debugLineNum = 969;BA.debugLine="lblcommentstar1.Text = \"\"";
mostCurrent._lblcommentstar1.setText(BA.ObjectToCharSequence(""));
 //BA.debugLineNum = 970;BA.debugLine="lblcommentstar2.Text = \"\"";
mostCurrent._lblcommentstar2.setText(BA.ObjectToCharSequence(""));
 //BA.debugLineNum = 971;BA.debugLine="lblcommentstar3.Text = \"\"";
mostCurrent._lblcommentstar3.setText(BA.ObjectToCharSequence(""));
 //BA.debugLineNum = 972;BA.debugLine="lblcommentstar4.Text = \"\"";
mostCurrent._lblcommentstar4.setText(BA.ObjectToCharSequence(""));
 //BA.debugLineNum = 973;BA.debugLine="lblcommentstar5.Text = \"\"";
mostCurrent._lblcommentstar5.setText(BA.ObjectToCharSequence(""));
 };
 //BA.debugLineNum = 978;BA.debugLine="DoEvents";
anywheresoftware.b4a.keywords.Common.DoEvents();
 }
};
 };
 //BA.debugLineNum = 984;BA.debugLine="progress.Visible = False";
mostCurrent._progress.setVisible(anywheresoftware.b4a.keywords.Common.False);
 //BA.debugLineNum = 986;BA.debugLine="Dim btnbackre As Button";
_btnbackre = new anywheresoftware.b4a.objects.ButtonWrapper();
 //BA.debugLineNum = 987;BA.debugLine="btnbackre.Initialize(\"btnbackreviews\")";
_btnbackre.Initialize(mostCurrent.activityBA,"btnbackreviews");
 //BA.debugLineNum = 988;BA.debugLine="btnreview.Initialize(\"btnreview\")";
mostCurrent._btnreview.Initialize(mostCurrent.activityBA,"btnreview");
 //BA.debugLineNum = 990;BA.debugLine="topReviews = topReviews + 15";
_topreviews = (int) (_topreviews+15);
 //BA.debugLineNum = 992;BA.debugLine="svReviews.Panel.AddView(btnbackre,0,topReviews,1";
mostCurrent._svreviews.getPanel().AddView((android.view.View)(_btnbackre.getObject()),(int) (0),_topreviews,anywheresoftware.b4a.keywords.Common.DipToCurrent((int) (120)),anywheresoftware.b4a.keywords.Common.DipToCurrent((int) (40)));
 //BA.debugLineNum = 993;BA.debugLine="topReviews = topReviews + 45dip";
_topreviews = (int) (_topreviews+anywheresoftware.b4a.keywords.Common.DipToCurrent((int) (45)));
 //BA.debugLineNum = 994;BA.debugLine="svReviews.Panel.AddView(btnreview,0,topReviews,1";
mostCurrent._svreviews.getPanel().AddView((android.view.View)(mostCurrent._btnreview.getObject()),(int) (0),_topreviews,anywheresoftware.b4a.keywords.Common.DipToCurrent((int) (120)),anywheresoftware.b4a.keywords.Common.DipToCurrent((int) (40)));
 //BA.debugLineNum = 995;BA.debugLine="DoEvents";
anywheresoftware.b4a.keywords.Common.DoEvents();
 //BA.debugLineNum = 997;BA.debugLine="Dim cd As ColorDrawable";
_cd = new anywheresoftware.b4a.objects.drawable.ColorDrawable();
 //BA.debugLineNum = 998;BA.debugLine="cd.Initialize2(Library.ConvertHex2Int(Library.Ge";
_cd.Initialize2((int)(Double.parseDouble(mostCurrent._library._converthex2int(mostCurrent.activityBA,mostCurrent._library._getstringresourse(mostCurrent.activityBA,"category_button")))),(int) (5),(int) (1),anywheresoftware.b4a.keywords.Common.Colors.Gray);
 //BA.debugLineNum = 999;BA.debugLine="btnbackre.Background = cd";
_btnbackre.setBackground((android.graphics.drawable.Drawable)(_cd.getObject()));
 //BA.debugLineNum = 1000;BA.debugLine="btnbackre.Text = Library.GetStringResourse(\"back";
_btnbackre.setText(BA.ObjectToCharSequence(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"back")));
 //BA.debugLineNum = 1001;BA.debugLine="btnbackre.TextColor = Colors.White";
_btnbackre.setTextColor(anywheresoftware.b4a.keywords.Common.Colors.White);
 //BA.debugLineNum = 1002;BA.debugLine="btnbackre.TextSize = 14";
_btnbackre.setTextSize((float) (14));
 //BA.debugLineNum = 1003;BA.debugLine="btnbackre.Typeface = Library.GetFont";
_btnbackre.setTypeface((android.graphics.Typeface)(mostCurrent._library._getfont(mostCurrent.activityBA).getObject()));
 //BA.debugLineNum = 1004;BA.debugLine="Library.CenterView(btnbackre,Activity)";
mostCurrent._library._centerview(mostCurrent.activityBA,(anywheresoftware.b4a.objects.ConcreteViewWrapper) anywheresoftware.b4a.AbsObjectWrapper.ConvertToWrapper(new anywheresoftware.b4a.objects.ConcreteViewWrapper(), (android.view.View)(_btnbackre.getObject())),(anywheresoftware.b4a.objects.ConcreteViewWrapper) anywheresoftware.b4a.AbsObjectWrapper.ConvertToWrapper(new anywheresoftware.b4a.objects.ConcreteViewWrapper(), (android.view.View)(mostCurrent._activity.getObject())));
 //BA.debugLineNum = 1006;BA.debugLine="Dim cd As ColorDrawable";
_cd = new anywheresoftware.b4a.objects.drawable.ColorDrawable();
 //BA.debugLineNum = 1007;BA.debugLine="cd.Initialize2(Library.ConvertHex2Int(Library.Ge";
_cd.Initialize2((int)(Double.parseDouble(mostCurrent._library._converthex2int(mostCurrent.activityBA,mostCurrent._library._getstringresourse(mostCurrent.activityBA,"category_button")))),(int) (5),(int) (1),anywheresoftware.b4a.keywords.Common.Colors.Gray);
 //BA.debugLineNum = 1008;BA.debugLine="btnreview.Background = cd";
mostCurrent._btnreview.setBackground((android.graphics.drawable.Drawable)(_cd.getObject()));
 //BA.debugLineNum = 1009;BA.debugLine="btnreview.Text = Library.GetStringResourse(\"revi";
mostCurrent._btnreview.setText(BA.ObjectToCharSequence(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"review").replace("[0]","")));
 //BA.debugLineNum = 1010;BA.debugLine="btnreview.TextColor = Colors.White";
mostCurrent._btnreview.setTextColor(anywheresoftware.b4a.keywords.Common.Colors.White);
 //BA.debugLineNum = 1011;BA.debugLine="btnreview.TextSize = 14";
mostCurrent._btnreview.setTextSize((float) (14));
 //BA.debugLineNum = 1012;BA.debugLine="btnreview.Typeface = Library.GetFont";
mostCurrent._btnreview.setTypeface((android.graphics.Typeface)(mostCurrent._library._getfont(mostCurrent.activityBA).getObject()));
 //BA.debugLineNum = 1013;BA.debugLine="Library.CenterView(btnreview,Activity)";
mostCurrent._library._centerview(mostCurrent.activityBA,(anywheresoftware.b4a.objects.ConcreteViewWrapper) anywheresoftware.b4a.AbsObjectWrapper.ConvertToWrapper(new anywheresoftware.b4a.objects.ConcreteViewWrapper(), (android.view.View)(mostCurrent._btnreview.getObject())),(anywheresoftware.b4a.objects.ConcreteViewWrapper) anywheresoftware.b4a.AbsObjectWrapper.ConvertToWrapper(new anywheresoftware.b4a.objects.ConcreteViewWrapper(), (android.view.View)(mostCurrent._activity.getObject())));
 //BA.debugLineNum = 1015;BA.debugLine="svReviews.Panel.height = topReviews + 55dip";
mostCurrent._svreviews.getPanel().setHeight((int) (_topreviews+anywheresoftware.b4a.keywords.Common.DipToCurrent((int) (55))));
 };
 //BA.debugLineNum = 1019;BA.debugLine="End Sub";
return "";
}
public static String  _pager_pagechanged(int _position) throws Exception{
 //BA.debugLineNum = 381;BA.debugLine="Sub pager_PageChanged (Position As Int)";
 //BA.debugLineNum = 382;BA.debugLine="ChooseBullet(Position)";
_choosebullet(_position);
 //BA.debugLineNum = 383;BA.debugLine="End Sub";
return "";
}
public static String  _pnlover_click() throws Exception{
anywheresoftware.b4a.objects.PanelWrapper _p1 = null;
anywheresoftware.b4a.objects.PanelWrapper _p2 = null;
anywheresoftware.b4a.objects.collections.Map _temp = null;
 //BA.debugLineNum = 1123;BA.debugLine="Sub pnlover_Click";
 //BA.debugLineNum = 1125;BA.debugLine="Dim p1,p2 As Panel";
_p1 = new anywheresoftware.b4a.objects.PanelWrapper();
_p2 = new anywheresoftware.b4a.objects.PanelWrapper();
 //BA.debugLineNum = 1126;BA.debugLine="p1 = Sender";
_p1.setObject((android.view.ViewGroup)(anywheresoftware.b4a.keywords.Common.Sender(mostCurrent.activityBA)));
 //BA.debugLineNum = 1128;BA.debugLine="p2 = Library.GetParent(p1)";
_p2.setObject((android.view.ViewGroup)(mostCurrent._library._getparent(mostCurrent.activityBA,(anywheresoftware.b4a.objects.ConcreteViewWrapper) anywheresoftware.b4a.AbsObjectWrapper.ConvertToWrapper(new anywheresoftware.b4a.objects.ConcreteViewWrapper(), (android.view.View)(_p1.getObject()))).getObject()));
 //BA.debugLineNum = 1129;BA.debugLine="p2.Visible = False";
_p2.setVisible(anywheresoftware.b4a.keywords.Common.False);
 //BA.debugLineNum = 1130;BA.debugLine="p2.SetVisibleAnimated(500,True)";
_p2.SetVisibleAnimated((int) (500),anywheresoftware.b4a.keywords.Common.True);
 //BA.debugLineNum = 1132;BA.debugLine="Dim temp As Map";
_temp = new anywheresoftware.b4a.objects.collections.Map();
 //BA.debugLineNum = 1133;BA.debugLine="temp = p1.Tag";
_temp.setObject((anywheresoftware.b4a.objects.collections.Map.MyMap)(_p1.getTag()));
 //BA.debugLineNum = 1134;BA.debugLine="product = temp";
_product = _temp;
 //BA.debugLineNum = 1135;BA.debugLine="top = 0";
_top = (int) (0);
 //BA.debugLineNum = 1136;BA.debugLine="sv1.Panel.RemoveAllViews";
mostCurrent._sv1.getPanel().RemoveAllViews();
 //BA.debugLineNum = 1138;BA.debugLine="Activity_Create(False)";
_activity_create(anywheresoftware.b4a.keywords.Common.False);
 //BA.debugLineNum = 1140;BA.debugLine="End Sub";
return "";
}
public static String  _pnlqr_click() throws Exception{
 //BA.debugLineNum = 2137;BA.debugLine="Sub pnlqr_Click";
 //BA.debugLineNum = 2138;BA.debugLine="pnlQR.SetVisibleAnimated(500,False)";
mostCurrent._pnlqr.SetVisibleAnimated((int) (500),anywheresoftware.b4a.keywords.Common.False);
 //BA.debugLineNum = 2139;BA.debugLine="End Sub";
return "";
}
public static String  _process_globals() throws Exception{
 //BA.debugLineNum = 6;BA.debugLine="Sub Process_Globals";
 //BA.debugLineNum = 7;BA.debugLine="Public product As Map";
_product = new anywheresoftware.b4a.objects.collections.Map();
 //BA.debugLineNum = 8;BA.debugLine="Private timerSlideshow As Timer";
_timerslideshow = new anywheresoftware.b4a.objects.Timer();
 //BA.debugLineNum = 9;BA.debugLine="Public IsOpenProduct,ClickedMenu As Boolean";
_isopenproduct = false;
_clickedmenu = false;
 //BA.debugLineNum = 10;BA.debugLine="End Sub";
return "";
}
public static String  _relatedproduct_receive(anywheresoftware.b4a.objects.collections.List _res,String _cat) throws Exception{
anywheresoftware.b4a.objects.collections.List _listoption = null;
anywheresoftware.b4a.objects.HorizontalScrollViewWrapper _svhproduct = null;
anywheresoftware.b4a.objects.ConcreteViewWrapper _v = null;
 //BA.debugLineNum = 1063;BA.debugLine="Sub RelatedProduct_receive(res As List,cat As Stri";
 //BA.debugLineNum = 1065;BA.debugLine="Dim listoption As List";
_listoption = new anywheresoftware.b4a.objects.collections.List();
 //BA.debugLineNum = 1066;BA.debugLine="listoption = product.Get(\"options\")";
_listoption.setObject((java.util.List)(_product.Get((Object)("options"))));
 //BA.debugLineNum = 1068;BA.debugLine="If listoption.IsInitialized Then";
if (_listoption.IsInitialized()) { 
 //BA.debugLineNum = 1070;BA.debugLine="If listoption.Size > 0 Then";
if (_listoption.getSize()>0) { 
 //BA.debugLineNum = 1071;BA.debugLine="pnl2.Height = pnl2.Height - 660dip";
mostCurrent._pnl2.setHeight((int) (mostCurrent._pnl2.getHeight()-anywheresoftware.b4a.keywords.Common.DipToCurrent((int) (660))));
 };
 //BA.debugLineNum = 1074;BA.debugLine="sv1.Panel.Height = sv1.Panel.Height + 20dip";
mostCurrent._sv1.getPanel().setHeight((int) (mostCurrent._sv1.getPanel().getHeight()+anywheresoftware.b4a.keywords.Common.DipToCurrent((int) (20))));
 //BA.debugLineNum = 1076;BA.debugLine="If res.Size > 0 Then";
if (_res.getSize()>0) { 
 //BA.debugLineNum = 1077;BA.debugLine="Dim svhProduct As HorizontalScrollView";
_svhproduct = new anywheresoftware.b4a.objects.HorizontalScrollViewWrapper();
 //BA.debugLineNum = 1078;BA.debugLine="top = AddHeader(Library.GetStringResourse(\"rela";
_top = _addheader(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"relat_product"),"newproduct",_top);
 //BA.debugLineNum = 1079;BA.debugLine="svhProduct.Initialize(0,\"\")";
_svhproduct.Initialize(mostCurrent.activityBA,(int) (0),"");
 //BA.debugLineNum = 1080;BA.debugLine="sv1.Panel.AddView(svhProduct,0,top,sv1.Width,19";
mostCurrent._sv1.getPanel().AddView((android.view.View)(_svhproduct.getObject()),(int) (0),_top,mostCurrent._sv1.getWidth(),anywheresoftware.b4a.keywords.Common.DipToCurrent((int) (190)));
 //BA.debugLineNum = 1081;BA.debugLine="top = top + Library.LoadProductHorizontalScroll";
_top = (int) (_top+mostCurrent._library._loadproducthorizontalscroll(mostCurrent.activityBA,_res,_svhproduct)+anywheresoftware.b4a.keywords.Common.DipToCurrent((int) (70)));
 //BA.debugLineNum = 1082;BA.debugLine="Dim v As View";
_v = new anywheresoftware.b4a.objects.ConcreteViewWrapper();
 //BA.debugLineNum = 1083;BA.debugLine="v = svhProduct.Panel.GetView(0)";
_v = _svhproduct.getPanel().GetView((int) (0));
 //BA.debugLineNum = 1084;BA.debugLine="v.Top = 0";
_v.setTop((int) (0));
 };
 };
 //BA.debugLineNum = 1090;BA.debugLine="sv1.Panel.Color = Colors.White";
mostCurrent._sv1.getPanel().setColor(anywheresoftware.b4a.keywords.Common.Colors.White);
 //BA.debugLineNum = 1091;BA.debugLine="sv1.Panel.Height = sv1.Panel.Height + 430dip";
mostCurrent._sv1.getPanel().setHeight((int) (mostCurrent._sv1.getPanel().getHeight()+anywheresoftware.b4a.keywords.Common.DipToCurrent((int) (430))));
 //BA.debugLineNum = 1093;BA.debugLine="End Sub";
return "";
}
public static String  _sve1_scrollchanged(int _position) throws Exception{
anywheresoftware.b4a.objects.PanelWrapper _pnl = null;
int _w = 0;
int _h = 0;
 //BA.debugLineNum = 2034;BA.debugLine="Sub sve1_ScrollChanged(Position As Int)";
 //BA.debugLineNum = 2036;BA.debugLine="If Position > 100 Then";
if (_position>100) { 
 //BA.debugLineNum = 2037;BA.debugLine="If ScollButton.Top <> Activity.Height - ScollBut";
if (mostCurrent._scollbutton.getTop()!=mostCurrent._activity.getHeight()-mostCurrent._scollbutton.getHeight()) { 
 //BA.debugLineNum = 2038;BA.debugLine="ScollButton.BringToFront";
mostCurrent._scollbutton.BringToFront();
 //BA.debugLineNum = 2039;BA.debugLine="ScollButton.SetLayoutAnimated(760,ScollButton.L";
mostCurrent._scollbutton.SetLayoutAnimated((int) (760),mostCurrent._scollbutton.getLeft(),(int) (mostCurrent._activity.getHeight()-anywheresoftware.b4a.keywords.Common.DipToCurrent((int) (30))-mostCurrent._scollbutton.getHeight()),mostCurrent._scollbutton.getWidth(),mostCurrent._scollbutton.getHeight());
 };
 }else if(_position<100) { 
 //BA.debugLineNum = 2043;BA.debugLine="If ScollButton.Top <> Activity.Height + ScollBut";
if (mostCurrent._scollbutton.getTop()!=mostCurrent._activity.getHeight()+mostCurrent._scollbutton.getHeight()) { 
 //BA.debugLineNum = 2044;BA.debugLine="ScollButton.SetLayoutAnimated(760,ScollButton.L";
mostCurrent._scollbutton.SetLayoutAnimated((int) (760),mostCurrent._scollbutton.getLeft(),(int) (mostCurrent._activity.getHeight()+mostCurrent._scollbutton.getHeight()),mostCurrent._scollbutton.getWidth(),mostCurrent._scollbutton.getHeight());
 };
 };
 //BA.debugLineNum = 2048;BA.debugLine="If Position > pnlads.top + pnlads.Height And FixP";
if (_position>mostCurrent._pnlads.getTop()+mostCurrent._pnlads.getHeight() && _fixpanelheader==anywheresoftware.b4a.keywords.Common.False) { 
 //BA.debugLineNum = 2049;BA.debugLine="FixPanelHeader = True";
_fixpanelheader = anywheresoftware.b4a.keywords.Common.True;
 //BA.debugLineNum = 2050;BA.debugLine="Dim pnl As Panel";
_pnl = new anywheresoftware.b4a.objects.PanelWrapper();
 //BA.debugLineNum = 2051;BA.debugLine="pnl = pnlheader";
_pnl = mostCurrent._pnlheader;
 //BA.debugLineNum = 2052;BA.debugLine="Dim w,h As Int";
_w = 0;
_h = 0;
 //BA.debugLineNum = 2053;BA.debugLine="w = pnlheader.Width";
_w = mostCurrent._pnlheader.getWidth();
 //BA.debugLineNum = 2054;BA.debugLine="h = pnlheader.Height";
_h = mostCurrent._pnlheader.getHeight();
 //BA.debugLineNum = 2055;BA.debugLine="pnlheader.RemoveView";
mostCurrent._pnlheader.RemoveView();
 //BA.debugLineNum = 2056;BA.debugLine="DoEvents";
anywheresoftware.b4a.keywords.Common.DoEvents();
 //BA.debugLineNum = 2057;BA.debugLine="Activity.AddView(pnl,0,0,w,h)";
mostCurrent._activity.AddView((android.view.View)(_pnl.getObject()),(int) (0),(int) (0),_w,_h);
 //BA.debugLineNum = 2058;BA.debugLine="pnl.Color = Library.Theme_Header";
_pnl.setColor(mostCurrent._library._theme_header);
 //BA.debugLineNum = 2059;BA.debugLine="btnbasket.TextColor = Colors.White";
mostCurrent._btnbasket.setTextColor(anywheresoftware.b4a.keywords.Common.Colors.White);
 //BA.debugLineNum = 2060;BA.debugLine="btnbookmark.TextColor = Colors.White";
mostCurrent._btnbookmark.setTextColor(anywheresoftware.b4a.keywords.Common.Colors.White);
 //BA.debugLineNum = 2061;BA.debugLine="btnshare.TextColor = Colors.White";
mostCurrent._btnshare.setTextColor(anywheresoftware.b4a.keywords.Common.Colors.White);
 //BA.debugLineNum = 2062;BA.debugLine="btnsearch.TextColor = Colors.White";
mostCurrent._btnsearch.setTextColor(anywheresoftware.b4a.keywords.Common.Colors.White);
 //BA.debugLineNum = 2063;BA.debugLine="btnback.TextColor = Colors.White";
mostCurrent._btnback.setTextColor(anywheresoftware.b4a.keywords.Common.Colors.White);
 //BA.debugLineNum = 2064;BA.debugLine="btnqr.TextColor = Colors.White";
mostCurrent._btnqr.setTextColor(anywheresoftware.b4a.keywords.Common.Colors.White);
 //BA.debugLineNum = 2065;BA.debugLine="btnback.TextColor = Colors.White";
mostCurrent._btnback.setTextColor(anywheresoftware.b4a.keywords.Common.Colors.White);
 //BA.debugLineNum = 2066;BA.debugLine="If product.Get(\"quantity\") > 0 Then pnlBasket.Se";
if ((double)(BA.ObjectToNumber(_product.Get((Object)("quantity"))))>0) { 
mostCurrent._pnlbasket.SetVisibleAnimated((int) (600),anywheresoftware.b4a.keywords.Common.True);};
 //BA.debugLineNum = 2067;BA.debugLine="pnl.Visible = False";
_pnl.setVisible(anywheresoftware.b4a.keywords.Common.False);
 //BA.debugLineNum = 2068;BA.debugLine="pnl.SetVisibleAnimated(600,True)";
_pnl.SetVisibleAnimated((int) (600),anywheresoftware.b4a.keywords.Common.True);
 //BA.debugLineNum = 2069;BA.debugLine="Library.ChangeStatusColor";
mostCurrent._library._changestatuscolor(mostCurrent.activityBA);
 //BA.debugLineNum = 2070;BA.debugLine="DoEvents";
anywheresoftware.b4a.keywords.Common.DoEvents();
 }else if(_position<mostCurrent._pnlads.getTop()+mostCurrent._pnlads.getHeight() && _fixpanelheader==anywheresoftware.b4a.keywords.Common.True) { 
 //BA.debugLineNum = 2073;BA.debugLine="FixPanelHeader = False";
_fixpanelheader = anywheresoftware.b4a.keywords.Common.False;
 //BA.debugLineNum = 2074;BA.debugLine="Dim pnl As Panel";
_pnl = new anywheresoftware.b4a.objects.PanelWrapper();
 //BA.debugLineNum = 2075;BA.debugLine="pnl = pnlheader";
_pnl = mostCurrent._pnlheader;
 //BA.debugLineNum = 2076;BA.debugLine="Dim w,h As Int";
_w = 0;
_h = 0;
 //BA.debugLineNum = 2077;BA.debugLine="w = pnlheader.Width";
_w = mostCurrent._pnlheader.getWidth();
 //BA.debugLineNum = 2078;BA.debugLine="h = pnlheader.Height";
_h = mostCurrent._pnlheader.getHeight();
 //BA.debugLineNum = 2079;BA.debugLine="pnlheader.RemoveView";
mostCurrent._pnlheader.RemoveView();
 //BA.debugLineNum = 2080;BA.debugLine="pnlBasket.SetVisibleAnimated(600,False)";
mostCurrent._pnlbasket.SetVisibleAnimated((int) (600),anywheresoftware.b4a.keywords.Common.False);
 //BA.debugLineNum = 2081;BA.debugLine="DoEvents";
anywheresoftware.b4a.keywords.Common.DoEvents();
 //BA.debugLineNum = 2082;BA.debugLine="sv1.Panel.AddView(pnl,0,0,w,h)";
mostCurrent._sv1.getPanel().AddView((android.view.View)(_pnl.getObject()),(int) (0),(int) (0),_w,_h);
 //BA.debugLineNum = 2083;BA.debugLine="pnl.Color = Colors.White";
_pnl.setColor(anywheresoftware.b4a.keywords.Common.Colors.White);
 //BA.debugLineNum = 2084;BA.debugLine="btnbasket.TextColor = Colors.Gray";
mostCurrent._btnbasket.setTextColor(anywheresoftware.b4a.keywords.Common.Colors.Gray);
 //BA.debugLineNum = 2085;BA.debugLine="btnbookmark.TextColor = Colors.Gray";
mostCurrent._btnbookmark.setTextColor(anywheresoftware.b4a.keywords.Common.Colors.Gray);
 //BA.debugLineNum = 2086;BA.debugLine="btnshare.TextColor = Colors.Gray";
mostCurrent._btnshare.setTextColor(anywheresoftware.b4a.keywords.Common.Colors.Gray);
 //BA.debugLineNum = 2087;BA.debugLine="btnsearch.TextColor = Colors.Gray";
mostCurrent._btnsearch.setTextColor(anywheresoftware.b4a.keywords.Common.Colors.Gray);
 //BA.debugLineNum = 2088;BA.debugLine="btnback.TextColor = Colors.Gray";
mostCurrent._btnback.setTextColor(anywheresoftware.b4a.keywords.Common.Colors.Gray);
 //BA.debugLineNum = 2089;BA.debugLine="btnqr.TextColor = Colors.Gray";
mostCurrent._btnqr.setTextColor(anywheresoftware.b4a.keywords.Common.Colors.Gray);
 //BA.debugLineNum = 2090;BA.debugLine="btnback.TextColor = Colors.Gray";
mostCurrent._btnback.setTextColor(anywheresoftware.b4a.keywords.Common.Colors.Gray);
 //BA.debugLineNum = 2091;BA.debugLine="Library.ChangeStatusColor2(Colors.White)";
mostCurrent._library._changestatuscolor2(mostCurrent.activityBA,anywheresoftware.b4a.keywords.Common.Colors.White);
 //BA.debugLineNum = 2092;BA.debugLine="DoEvents";
anywheresoftware.b4a.keywords.Common.DoEvents();
 };
 //BA.debugLineNum = 2096;BA.debugLine="End Sub";
return "";
}
public static String  _timerspecial_tick() throws Exception{
anywheresoftware.b4a.objects.collections.Map _m = null;
 //BA.debugLineNum = 788;BA.debugLine="Sub timerSpecial_Tick";
 //BA.debugLineNum = 790;BA.debugLine="If pnltimer.Visible = False Then pnltimer.SetVisi";
if (mostCurrent._pnltimer.getVisible()==anywheresoftware.b4a.keywords.Common.False) { 
mostCurrent._pnltimer.SetVisibleAnimated((int) (500),anywheresoftware.b4a.keywords.Common.True);};
 //BA.debugLineNum = 792;BA.debugLine="If SpecialDateInformation.Seconds = 0 Then";
if (mostCurrent._specialdateinformation.Seconds==0) { 
 //BA.debugLineNum = 794;BA.debugLine="SpecialDateInformation.Seconds = 59";
mostCurrent._specialdateinformation.Seconds = (int) (59);
 //BA.debugLineNum = 796;BA.debugLine="If SpecialDateInformation.Minutes = 0 And Specia";
if (mostCurrent._specialdateinformation.Minutes==0 && mostCurrent._specialdateinformation.Hours>0) { 
 //BA.debugLineNum = 797;BA.debugLine="SpecialDateInformation.Minutes = 59";
mostCurrent._specialdateinformation.Minutes = (int) (59);
 }else if(mostCurrent._specialdateinformation.Minutes==0 && mostCurrent._specialdateinformation.Hours==0) { 
 //BA.debugLineNum = 799;BA.debugLine="EndTimerSpecial";
_endtimerspecial();
 //BA.debugLineNum = 800;BA.debugLine="Return";
if (true) return "";
 }else {
 //BA.debugLineNum = 802;BA.debugLine="SpecialDateInformation.Minutes = SpecialDateInf";
mostCurrent._specialdateinformation.Minutes = (int) (mostCurrent._specialdateinformation.Minutes-1);
 };
 }else {
 //BA.debugLineNum = 806;BA.debugLine="SpecialDateInformation.Seconds = SpecialDateInfo";
mostCurrent._specialdateinformation.Seconds = (int) (mostCurrent._specialdateinformation.Seconds-1);
 };
 //BA.debugLineNum = 809;BA.debugLine="If SpecialDateInformation.Minutes = 0 Then";
if (mostCurrent._specialdateinformation.Minutes==0) { 
 //BA.debugLineNum = 810;BA.debugLine="If SpecialDateInformation.Minutes = 0 And Specia";
if (mostCurrent._specialdateinformation.Minutes==0 && mostCurrent._specialdateinformation.Hours>0) { 
 //BA.debugLineNum = 811;BA.debugLine="SpecialDateInformation.Minutes = 59";
mostCurrent._specialdateinformation.Minutes = (int) (59);
 //BA.debugLineNum = 812;BA.debugLine="SpecialDateInformation.Hours = SpecialDateInfor";
mostCurrent._specialdateinformation.Hours = (int) (mostCurrent._specialdateinformation.Hours-1);
 }else if(mostCurrent._specialdateinformation.Minutes==0 && mostCurrent._specialdateinformation.Hours==0) { 
 //BA.debugLineNum = 814;BA.debugLine="EndTimerSpecial";
_endtimerspecial();
 //BA.debugLineNum = 815;BA.debugLine="Return";
if (true) return "";
 }else {
 //BA.debugLineNum = 817;BA.debugLine="SpecialDateInformation.Hours = SpecialDateInfor";
mostCurrent._specialdateinformation.Hours = (int) (mostCurrent._specialdateinformation.Hours-1);
 };
 }else if(mostCurrent._specialdateinformation.Minutes>59) { 
 //BA.debugLineNum = 820;BA.debugLine="SpecialDateInformation.Minutes = SpecialDateInfo";
mostCurrent._specialdateinformation.Minutes = (int) (mostCurrent._specialdateinformation.Minutes-59);
 //BA.debugLineNum = 821;BA.debugLine="SpecialDateInformation.Hours = SpecialDateInform";
mostCurrent._specialdateinformation.Hours = (int) (mostCurrent._specialdateinformation.Hours+1);
 };
 //BA.debugLineNum = 824;BA.debugLine="If SpecialDateInformation.Hours = 0 Then";
if (mostCurrent._specialdateinformation.Hours==0) { 
 //BA.debugLineNum = 825;BA.debugLine="If SpecialDateInformation.Hours = 0 And SpecialD";
if (mostCurrent._specialdateinformation.Hours==0 && mostCurrent._specialdateinformation.Days>0) { 
 //BA.debugLineNum = 826;BA.debugLine="SpecialDateInformation.Hours = 24";
mostCurrent._specialdateinformation.Hours = (int) (24);
 //BA.debugLineNum = 827;BA.debugLine="SpecialDateInformation.Days = SpecialDateInform";
mostCurrent._specialdateinformation.Days = (int) (mostCurrent._specialdateinformation.Days-1);
 }else if(mostCurrent._specialdateinformation.Hours==0 && mostCurrent._specialdateinformation.Hours==0) { 
 //BA.debugLineNum = 829;BA.debugLine="EndTimerSpecial";
_endtimerspecial();
 //BA.debugLineNum = 830;BA.debugLine="Return";
if (true) return "";
 }else {
 //BA.debugLineNum = 832;BA.debugLine="SpecialDateInformation.Hours = SpecialDateInfor";
mostCurrent._specialdateinformation.Hours = (int) (mostCurrent._specialdateinformation.Hours-1);
 };
 }else {
 };
 //BA.debugLineNum = 839;BA.debugLine="Dim m As Map";
_m = new anywheresoftware.b4a.objects.collections.Map();
 //BA.debugLineNum = 840;BA.debugLine="m.Initialize";
_m.Initialize();
 //BA.debugLineNum = 841;BA.debugLine="m.Put(\"Years\",SpecialDateInformation.Years)";
_m.Put((Object)("Years"),(Object)(mostCurrent._specialdateinformation.Years));
 //BA.debugLineNum = 842;BA.debugLine="m.Put(\"Months\",SpecialDateInformation.Months)";
_m.Put((Object)("Months"),(Object)(mostCurrent._specialdateinformation.Months));
 //BA.debugLineNum = 843;BA.debugLine="m.Put(\"Days\",SpecialDateInformation.Days)";
_m.Put((Object)("Days"),(Object)(mostCurrent._specialdateinformation.Days));
 //BA.debugLineNum = 844;BA.debugLine="m.Put(\"Hours\",SpecialDateInformation.Hours)";
_m.Put((Object)("Hours"),(Object)(mostCurrent._specialdateinformation.Hours));
 //BA.debugLineNum = 845;BA.debugLine="m.Put(\"Minutes\",SpecialDateInformation.Minutes)";
_m.Put((Object)("Minutes"),(Object)(mostCurrent._specialdateinformation.Minutes));
 //BA.debugLineNum = 846;BA.debugLine="m.Put(\"Seconds\",SpecialDateInformation.Seconds)";
_m.Put((Object)("Seconds"),(Object)(mostCurrent._specialdateinformation.Seconds));
 //BA.debugLineNum = 847;BA.debugLine="File.WriteMap(File.DirInternal,\"timeout_ids_\" & p";
anywheresoftware.b4a.keywords.Common.File.WriteMap(anywheresoftware.b4a.keywords.Common.File.getDirInternal(),"timeout_ids_"+BA.ObjectToString(_product.Get((Object)("id"))),_m);
 //BA.debugLineNum = 849;BA.debugLine="lblnum1.Text = SpecialDateInformation.Days";
mostCurrent._lblnum1.setText(BA.ObjectToCharSequence(mostCurrent._specialdateinformation.Days));
 //BA.debugLineNum = 850;BA.debugLine="lblnum2.Text = SpecialDateInformation.Hours";
mostCurrent._lblnum2.setText(BA.ObjectToCharSequence(mostCurrent._specialdateinformation.Hours));
 //BA.debugLineNum = 851;BA.debugLine="lblnum3.Text = SpecialDateInformation.Minutes";
mostCurrent._lblnum3.setText(BA.ObjectToCharSequence(mostCurrent._specialdateinformation.Minutes));
 //BA.debugLineNum = 852;BA.debugLine="lblnum4.Text = SpecialDateInformation.Seconds";
mostCurrent._lblnum4.setText(BA.ObjectToCharSequence(mostCurrent._specialdateinformation.Seconds));
 //BA.debugLineNum = 854;BA.debugLine="If SpecialDateInformation.Days > 99 Then";
if (mostCurrent._specialdateinformation.Days>99) { 
 //BA.debugLineNum = 855;BA.debugLine="lblnum1.TextSize = 14";
mostCurrent._lblnum1.setTextSize((float) (14));
 };
 //BA.debugLineNum = 858;BA.debugLine="End Sub";
return "";
}
public static String  _tips_click() throws Exception{
 //BA.debugLineNum = 266;BA.debugLine="Sub tips_Click";
 //BA.debugLineNum = 319;BA.debugLine="End Sub";
return "";
}
public static String  _tmrslideshow_tick() throws Exception{
 //BA.debugLineNum = 1144;BA.debugLine="Sub tmrSlideshow_Tick";
 //BA.debugLineNum = 1146;BA.debugLine="Try";
try { //BA.debugLineNum = 1147;BA.debugLine="If Library.imagesSlideshow.IsInitialized = False";
if (mostCurrent._library._imagesslideshow.IsInitialized()==anywheresoftware.b4a.keywords.Common.False) { 
if (true) return "";};
 //BA.debugLineNum = 1149;BA.debugLine="If offsetSlideshow = listSlideshow.Size  Then of";
if (_offsetslideshow==mostCurrent._listslideshow.getSize()) { 
_offsetslideshow = (int) (0);};
 //BA.debugLineNum = 1151;BA.debugLine="slidepanelPage.GotoPage(offsetSlideshow,True)";
mostCurrent._slidepanelpage.GotoPage(_offsetslideshow,anywheresoftware.b4a.keywords.Common.True);
 //BA.debugLineNum = 1152;BA.debugLine="DoEvents";
anywheresoftware.b4a.keywords.Common.DoEvents();
 //BA.debugLineNum = 1153;BA.debugLine="offsetSlideshow = offsetSlideshow + 1";
_offsetslideshow = (int) (_offsetslideshow+1);
 } 
       catch (Exception e8) {
			processBA.setLastException(e8); //BA.debugLineNum = 1156;BA.debugLine="Log(\"Error [Function : tmrSlideshow_Tick , Modul";
anywheresoftware.b4a.keywords.Common.Log("Error [Function : tmrSlideshow_Tick , Module : actProduct ]");
 };
 //BA.debugLineNum = 1159;BA.debugLine="End Sub";
return "";
}
public static String  _txtoption_click() throws Exception{
 //BA.debugLineNum = 1907;BA.debugLine="Sub txtoption_Click";
 //BA.debugLineNum = 1908;BA.debugLine="txtoption_FocusChanged(True)";
_txtoption_focuschanged(anywheresoftware.b4a.keywords.Common.True);
 //BA.debugLineNum = 1909;BA.debugLine="End Sub";
return "";
}
public static String  _txtoption_focuschanged(boolean _hasfocus) throws Exception{
anywheresoftware.b4a.objects.EditTextWrapper _ed = null;
anywheresoftware.b4a.objects.IME _ime = null;
anywheresoftware.b4a.objects.collections.Map _data = null;
String _stype = "";
int[] _arrdate = null;
anywheresoftware.b4a.agraham.dialogs.InputDialog.TimeDialog _picker1 = null;
int[] _arrtime = null;
String _date = "";
String _time = "";
 //BA.debugLineNum = 1847;BA.debugLine="Sub txtoption_FocusChanged(HasFocus As Boolean)";
 //BA.debugLineNum = 1849;BA.debugLine="If HasFocus Then";
if (_hasfocus) { 
 //BA.debugLineNum = 1851;BA.debugLine="Dim ed As EditText";
_ed = new anywheresoftware.b4a.objects.EditTextWrapper();
 //BA.debugLineNum = 1852;BA.debugLine="ed = Sender";
_ed.setObject((android.widget.EditText)(anywheresoftware.b4a.keywords.Common.Sender(mostCurrent.activityBA)));
 //BA.debugLineNum = 1854;BA.debugLine="Dim ime As IME";
_ime = new anywheresoftware.b4a.objects.IME();
 //BA.debugLineNum = 1855;BA.debugLine="ime.Initialize(\"\")";
_ime.Initialize("");
 //BA.debugLineNum = 1857;BA.debugLine="If ed.IsInitialized = False Then Return";
if (_ed.IsInitialized()==anywheresoftware.b4a.keywords.Common.False) { 
if (true) return "";};
 //BA.debugLineNum = 1859;BA.debugLine="Dim data As Map";
_data = new anywheresoftware.b4a.objects.collections.Map();
 //BA.debugLineNum = 1860;BA.debugLine="data = ed.Tag";
_data.setObject((anywheresoftware.b4a.objects.collections.Map.MyMap)(_ed.getTag()));
 //BA.debugLineNum = 1862;BA.debugLine="Dim sType As String";
_stype = "";
 //BA.debugLineNum = 1863;BA.debugLine="sType = data.Get(\"Type\")";
_stype = BA.ObjectToString(_data.Get((Object)("Type")));
 //BA.debugLineNum = 1865;BA.debugLine="If sType = \"date\" Then";
if ((_stype).equals("date")) { 
 //BA.debugLineNum = 1867;BA.debugLine="ime.HideKeyboard";
_ime.HideKeyboard(mostCurrent.activityBA);
 //BA.debugLineNum = 1869;BA.debugLine="Dim Arrdate() As Int";
_arrdate = new int[(int) (0)];
;
 //BA.debugLineNum = 1870;BA.debugLine="Arrdate = Library.ParseDate(ed.Text)";
_arrdate = mostCurrent._library._parsedate(mostCurrent.activityBA,_ed.getText());
 //BA.debugLineNum = 1872;BA.debugLine="ed.Text = Library.MakeDateDialog(Arrdate(0),Arr";
_ed.setText(BA.ObjectToCharSequence(mostCurrent._library._makedatedialog(mostCurrent.activityBA,BA.NumberToString(_arrdate[(int) (0)]),BA.NumberToString(_arrdate[(int) (1)]),BA.NumberToString(_arrdate[(int) (2)]))));
 }else if((_stype).equals("time")) { 
 //BA.debugLineNum = 1876;BA.debugLine="ime.HideKeyboard";
_ime.HideKeyboard(mostCurrent.activityBA);
 //BA.debugLineNum = 1878;BA.debugLine="Dim picker1 As TimeDialog";
_picker1 = new anywheresoftware.b4a.agraham.dialogs.InputDialog.TimeDialog();
 //BA.debugLineNum = 1879;BA.debugLine="Dim Arrtime() As Int";
_arrtime = new int[(int) (0)];
;
 //BA.debugLineNum = 1880;BA.debugLine="picker1.Is24Hours = False";
_picker1.setIs24Hours(anywheresoftware.b4a.keywords.Common.False);
 //BA.debugLineNum = 1881;BA.debugLine="Arrtime = Library.ParseTime(ed.Text)";
_arrtime = mostCurrent._library._parsetime(mostCurrent.activityBA,_ed.getText());
 //BA.debugLineNum = 1883;BA.debugLine="picker1.Hour = Arrtime(0)";
_picker1.setHour(_arrtime[(int) (0)]);
 //BA.debugLineNum = 1884;BA.debugLine="picker1.Minute = Arrtime(1)";
_picker1.setMinute(_arrtime[(int) (1)]);
 //BA.debugLineNum = 1886;BA.debugLine="If picker1.Show(Library.GetStringResourse(\"ente";
if (_picker1.Show(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"enter_time"),mostCurrent._library._getstringresourse(mostCurrent.activityBA,"time_title"),mostCurrent._library._getstringresourse(mostCurrent.activityBA,"ok"),mostCurrent._library._getstringresourse(mostCurrent.activityBA,"cancel"),"",mostCurrent.activityBA,(android.graphics.Bitmap)(anywheresoftware.b4a.keywords.Common.Null))==anywheresoftware.b4a.keywords.Common.DialogResponse.POSITIVE) { 
 //BA.debugLineNum = 1887;BA.debugLine="ed.Text = picker1.Hour & \":\" & picker1.Minute";
_ed.setText(BA.ObjectToCharSequence(BA.NumberToString(_picker1.getHour())+":"+BA.NumberToString(_picker1.getMinute())));
 };
 }else if((_stype).equals("datetime")) { 
 //BA.debugLineNum = 1892;BA.debugLine="ime.HideKeyboard";
_ime.HideKeyboard(mostCurrent.activityBA);
 //BA.debugLineNum = 1894;BA.debugLine="Dim picker1 As TimeDialog";
_picker1 = new anywheresoftware.b4a.agraham.dialogs.InputDialog.TimeDialog();
 //BA.debugLineNum = 1895;BA.debugLine="Dim date,time As String";
_date = "";
_time = "";
 //BA.debugLineNum = 1896;BA.debugLine="date = Library.MakeDateDialog(0,0,0)";
_date = mostCurrent._library._makedatedialog(mostCurrent.activityBA,BA.NumberToString(0),BA.NumberToString(0),BA.NumberToString(0));
 //BA.debugLineNum = 1897;BA.debugLine="time = picker1.Show(Library.GetStringResourse(\"";
_time = BA.NumberToString(_picker1.Show(mostCurrent._library._getstringresourse(mostCurrent.activityBA,"enter_time"),mostCurrent._library._getstringresourse(mostCurrent.activityBA,"time_title"),mostCurrent._library._getstringresourse(mostCurrent.activityBA,"ok"),mostCurrent._library._getstringresourse(mostCurrent.activityBA,"cancel"),"",mostCurrent.activityBA,(android.graphics.Bitmap)(anywheresoftware.b4a.keywords.Common.Null)));
 //BA.debugLineNum = 1898;BA.debugLine="time = picker1.Hour & \":\" & picker1.Minute";
_time = BA.NumberToString(_picker1.getHour())+":"+BA.NumberToString(_picker1.getMinute());
 //BA.debugLineNum = 1899;BA.debugLine="ed.Text = date & \" \" & time";
_ed.setText(BA.ObjectToCharSequence(_date+" "+_time));
 };
 };
 //BA.debugLineNum = 1905;BA.debugLine="End Sub";
return "";
}
}
