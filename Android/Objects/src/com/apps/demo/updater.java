package com.apps.demo;


import anywheresoftware.b4a.BA;
import anywheresoftware.b4a.objects.ServiceHelper;
import anywheresoftware.b4a.debug.*;

public class updater extends  android.app.Service{
	public static class updater_BR extends android.content.BroadcastReceiver {

		@Override
		public void onReceive(android.content.Context context, android.content.Intent intent) {
			android.content.Intent in = new android.content.Intent(context, updater.class);
			if (intent != null)
				in.putExtra("b4a_internal_intent", intent);
			context.startService(in);
		}

	}
    static updater mostCurrent;
	public static BA processBA;
    private ServiceHelper _service;
    public static Class<?> getObject() {
		return updater.class;
	}
	@Override
	public void onCreate() {
        super.onCreate();
        mostCurrent = this;
        if (processBA == null) {
		    processBA = new BA(this, null, null, "com.apps.demo", "com.apps.demo.updater");
            if (BA.isShellModeRuntimeCheck(processBA)) {
                processBA.raiseEvent2(null, true, "SHELL", false);
		    }
            try {
                Class.forName(BA.applicationContext.getPackageName() + ".main").getMethod("initializeProcessGlobals").invoke(null, null);
            } catch (Exception e) {
                throw new RuntimeException(e);
            }
            processBA.loadHtSubs(this.getClass());
            ServiceHelper.init();
        }
        _service = new ServiceHelper(this);
        processBA.service = this;
        
        if (BA.isShellModeRuntimeCheck(processBA)) {
			processBA.raiseEvent2(null, true, "CREATE", true, "com.apps.demo.updater", processBA, _service, anywheresoftware.b4a.keywords.Common.Density);
		}
        if (!false && ServiceHelper.StarterHelper.startFromServiceCreate(processBA, false) == false) {
				
		}
		else {
            processBA.setActivityPaused(false);
            BA.LogInfo("** Service (updater) Create **");
            processBA.raiseEvent(null, "service_create");
        }
        processBA.runHook("oncreate", this, null);
        if (false) {
			if (ServiceHelper.StarterHelper.waitForLayout != null)
				BA.handler.post(ServiceHelper.StarterHelper.waitForLayout);
		}
    }
		@Override
	public void onStart(android.content.Intent intent, int startId) {
		onStartCommand(intent, 0, 0);
    }
    @Override
    public int onStartCommand(final android.content.Intent intent, int flags, int startId) {
    	if (ServiceHelper.StarterHelper.onStartCommand(processBA))
			handleStart(intent);
		else {
			ServiceHelper.StarterHelper.waitForLayout = new Runnable() {
				public void run() {
                    processBA.setActivityPaused(false);
                    BA.LogInfo("** Service (updater) Create **");
                    processBA.raiseEvent(null, "service_create");
					handleStart(intent);
				}
			};
		}
        processBA.runHook("onstartcommand", this, new Object[] {intent, flags, startId});
		return android.app.Service.START_NOT_STICKY;
    }
    public void onTaskRemoved(android.content.Intent rootIntent) {
        super.onTaskRemoved(rootIntent);
        if (false)
            processBA.raiseEvent(null, "service_taskremoved");
            
    }
    private void handleStart(android.content.Intent intent) {
    	BA.LogInfo("** Service (updater) Start **");
    	java.lang.reflect.Method startEvent = processBA.htSubs.get("service_start");
    	if (startEvent != null) {
    		if (startEvent.getParameterTypes().length > 0) {
    			anywheresoftware.b4a.objects.IntentWrapper iw = new anywheresoftware.b4a.objects.IntentWrapper();
    			if (intent != null) {
    				if (intent.hasExtra("b4a_internal_intent"))
    					iw.setObject((android.content.Intent) intent.getParcelableExtra("b4a_internal_intent"));
    				else
    					iw.setObject(intent);
    			}
    			processBA.raiseEvent(null, "service_start", iw);
    		}
    		else {
    			processBA.raiseEvent(null, "service_start");
    		}
    	}
    }
	
	@Override
	public void onDestroy() {
        super.onDestroy();
        BA.LogInfo("** Service (updater) Destroy **");
		processBA.raiseEvent(null, "service_destroy");
        processBA.service = null;
		mostCurrent = null;
		processBA.setActivityPaused(true);
        processBA.runHook("ondestroy", this, null);
	}

@Override
	public android.os.IBinder onBind(android.content.Intent intent) {
		return null;
	}public anywheresoftware.b4a.keywords.Common __c = null;
public static anywheresoftware.b4a.samples.httputils2.httpjob _hu = null;
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
public com.apps.demo.starter _starter = null;
public static String  _jobdone(anywheresoftware.b4a.samples.httputils2.httpjob _job) throws Exception{
anywheresoftware.b4a.objects.collections.JSONParser _js = null;
anywheresoftware.b4a.objects.collections.Map _d1 = null;
int _v1 = 0;
 //BA.debugLineNum = 28;BA.debugLine="Sub JobDone(Job As HttpJob)";
 //BA.debugLineNum = 30;BA.debugLine="If Job.Success Then";
if (_job._success) { 
 //BA.debugLineNum = 32;BA.debugLine="If Job.JobName = \"config\" Then";
if ((_job._jobname).equals("config")) { 
 //BA.debugLineNum = 34;BA.debugLine="Dim js As JSONParser";
_js = new anywheresoftware.b4a.objects.collections.JSONParser();
 //BA.debugLineNum = 35;BA.debugLine="js.Initialize(Job.GetString2(\"UTF8\"))";
_js.Initialize(_job._getstring2("UTF8"));
 //BA.debugLineNum = 37;BA.debugLine="Try";
try { //BA.debugLineNum = 39;BA.debugLine="Dim d1 As Map";
_d1 = new anywheresoftware.b4a.objects.collections.Map();
 //BA.debugLineNum = 40;BA.debugLine="d1 = js.NextObject";
_d1 = _js.NextObject();
 //BA.debugLineNum = 42;BA.debugLine="If d1.Get(\"shop_state\") = False Then";
if ((_d1.Get((Object)("shop_state"))).equals((Object)(anywheresoftware.b4a.keywords.Common.False))) { 
 //BA.debugLineNum = 43;BA.debugLine="Library.ShopState = False";
mostCurrent._library._shopstate = anywheresoftware.b4a.keywords.Common.False;
 //BA.debugLineNum = 44;BA.debugLine="Library.manager.SetBoolean(\"disactive_shop\",T";
mostCurrent._library._manager.SetBoolean("disactive_shop",anywheresoftware.b4a.keywords.Common.True);
 //BA.debugLineNum = 45;BA.debugLine="Return";
if (true) return "";
 }else if((_d1.Get((Object)("shop_state"))).equals((Object)(anywheresoftware.b4a.keywords.Common.True))) { 
 //BA.debugLineNum = 47;BA.debugLine="Library.manager.SetBoolean(\"disactive_shop\",F";
mostCurrent._library._manager.SetBoolean("disactive_shop",anywheresoftware.b4a.keywords.Common.False);
 //BA.debugLineNum = 48;BA.debugLine="Library.ShopState = True";
mostCurrent._library._shopstate = anywheresoftware.b4a.keywords.Common.True;
 };
 //BA.debugLineNum = 51;BA.debugLine="Dim v1 As Int";
_v1 = 0;
 //BA.debugLineNum = 52;BA.debugLine="v1 = d1.Get(\"version\")";
_v1 = (int)(BA.ObjectToNumber(_d1.Get((Object)("version"))));
 //BA.debugLineNum = 54;BA.debugLine="If v1 > Library.Sign.getPackageVersionCode The";
if (_v1>mostCurrent._library._sign.getPackageVersionCode(processBA)) { 
 //BA.debugLineNum = 56;BA.debugLine="actUpdate.sLog = d1.Get(\"log\")";
mostCurrent._actupdate._slog = BA.ObjectToString(_d1.Get((Object)("log")));
 //BA.debugLineNum = 57;BA.debugLine="actUpdate.ForceUpdate = d1.Get(\"force_update\"";
mostCurrent._actupdate._forceupdate = BA.ObjectToBoolean(_d1.Get((Object)("force_update")));
 //BA.debugLineNum = 58;BA.debugLine="StartActivity(actUpdate)";
anywheresoftware.b4a.keywords.Common.StartActivity(processBA,(Object)(mostCurrent._actupdate.getObject()));
 };
 } 
       catch (Exception e24) {
			processBA.setLastException(e24); };
 };
 }else {
 };
 //BA.debugLineNum = 72;BA.debugLine="Job.Release";
_job._release();
 //BA.debugLineNum = 74;BA.debugLine="End Sub";
return "";
}
public static String  _process_globals() throws Exception{
 //BA.debugLineNum = 5;BA.debugLine="Sub Process_Globals";
 //BA.debugLineNum = 6;BA.debugLine="Private hu As HttpJob";
_hu = new anywheresoftware.b4a.samples.httputils2.httpjob();
 //BA.debugLineNum = 7;BA.debugLine="End Sub";
return "";
}
public static String  _service_create() throws Exception{
 //BA.debugLineNum = 9;BA.debugLine="Sub Service_Create";
 //BA.debugLineNum = 11;BA.debugLine="End Sub";
return "";
}
public static String  _service_destroy() throws Exception{
 //BA.debugLineNum = 76;BA.debugLine="Sub Service_Destroy";
 //BA.debugLineNum = 78;BA.debugLine="End Sub";
return "";
}
public static String  _service_start(anywheresoftware.b4a.objects.IntentWrapper _startingintent) throws Exception{
anywheresoftware.b4a.samples.httputils2.httpjob _ht = null;
 //BA.debugLineNum = 13;BA.debugLine="Sub Service_Start (StartingIntent As Intent)";
 //BA.debugLineNum = 15;BA.debugLine="If Library.InternetState = True Then";
if (mostCurrent._library._internetstate(processBA)==anywheresoftware.b4a.keywords.Common.True) { 
 //BA.debugLineNum = 17;BA.debugLine="Dim ht As HttpJob";
_ht = new anywheresoftware.b4a.samples.httputils2.httpjob();
 //BA.debugLineNum = 18;BA.debugLine="ht.Initialize(\"config\",Me)";
_ht._initialize(processBA,"config",updater.getObject());
 //BA.debugLineNum = 19;BA.debugLine="ht.Download(Library.GetStringResourse(\"url\") & \"";
_ht._download(mostCurrent._library._getstringresourse(processBA,"url")+"/app/config");
 //BA.debugLineNum = 20;BA.debugLine="ht.GetRequest.SetHeader(\"Cache-Control\",\"no-stor";
_ht._getrequest().SetHeader("Cache-Control","no-store, no-cache, must-revalidate, max-age=0");
 };
 //BA.debugLineNum = 24;BA.debugLine="StartServiceAt(\"\",DateTime.Now + 1800000,True) 'e";
anywheresoftware.b4a.keywords.Common.StartServiceAt(processBA,(Object)(""),(long) (anywheresoftware.b4a.keywords.Common.DateTime.getNow()+1800000),anywheresoftware.b4a.keywords.Common.True);
 //BA.debugLineNum = 26;BA.debugLine="End Sub";
return "";
}
}
