package com.apps.manageropencart;


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
		    processBA = new BA(this, null, null, "com.apps.manageropencart", "com.apps.manageropencart.updater");
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
			processBA.raiseEvent2(null, true, "CREATE", true, "com.apps.manageropencart.updater", processBA, _service, anywheresoftware.b4a.keywords.Common.Density);
		}
        if (!false && ServiceHelper.StarterHelper.startFromServiceCreate(processBA, false) == false) {
				
		}
		else {
            processBA.setActivityPaused(false);
            BA.LogInfo("*** Service (updater) Create ***");
            processBA.raiseEvent(null, "service_create");
        }
        processBA.runHook("oncreate", this, null);
        if (false) {
			ServiceHelper.StarterHelper.runWaitForLayouts();
		}
    }
		@Override
	public void onStart(android.content.Intent intent, int startId) {
		onStartCommand(intent, 0, 0);
    }
    @Override
    public int onStartCommand(final android.content.Intent intent, int flags, int startId) {
    	if (ServiceHelper.StarterHelper.onStartCommand(processBA, new Runnable() {
            public void run() {
                handleStart(intent);
            }}))
			;
		else {
			ServiceHelper.StarterHelper.addWaitForLayout (new Runnable() {
				public void run() {
                    processBA.setActivityPaused(false);
                    BA.LogInfo("** Service (updater) Create **");
                    processBA.raiseEvent(null, "service_create");
					handleStart(intent);
                    ServiceHelper.StarterHelper.removeWaitForLayout();
				}
			});
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
public static anywheresoftware.b4a.samples.httputils2.httpjob _v6 = null;
public anywheresoftware.b4a.samples.httputils2.httputils2service _vvvvvv0 = null;
public com.apps.manageropencart.main _vvvvvvv1 = null;
public com.apps.manageropencart.actlogin _vvvvvvv2 = null;
public com.apps.manageropencart.actsendpush _vvvvvvv4 = null;
public com.apps.manageropencart.actdetailsofreportitem _vvvvvvv5 = null;
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
public static String  _jobdone(anywheresoftware.b4a.samples.httputils2.httpjob _job) throws Exception{
anywheresoftware.b4a.objects.collections.Map _ma = null;
String _slog = "";
anywheresoftware.b4a.samples.httputils2.httpjob _download = null;
anywheresoftware.b4a.objects.streams.File.OutputStreamWrapper _ou = null;
 //BA.debugLineNum = 22;BA.debugLine="Sub JobDone(job As HttpJob)";
 //BA.debugLineNum = 24;BA.debugLine="If job.Success Then";
if (_job._success) { 
 //BA.debugLineNum = 25;BA.debugLine="If job.JobName = \"updater\" Then";
if ((_job._jobname).equals("updater")) { 
 //BA.debugLineNum = 27;BA.debugLine="Dim ma As Map";
_ma = new anywheresoftware.b4a.objects.collections.Map();
 //BA.debugLineNum = 28;BA.debugLine="ma = Library.Json2Map(job.GetString)";
_ma = mostCurrent._vvvvvvv6._vvvv5(processBA,_job._getstring());
 //BA.debugLineNum = 30;BA.debugLine="If  Library.Sign.getPackageVersionCode < ma.Get";
if (mostCurrent._vvvvvvv6._vvv2.getPackageVersionCode(processBA)<(double)(BA.ObjectToNumber(_ma.Get((Object)("current_version"))))) { 
 //BA.debugLineNum = 32;BA.debugLine="Dim sLog As String";
_slog = "";
 //BA.debugLineNum = 34;BA.debugLine="If File.ReadString(File.DirInternal,Library.La";
if ((anywheresoftware.b4a.keywords.Common.File.ReadString(anywheresoftware.b4a.keywords.Common.File.getDirInternal(),mostCurrent._vvvvvvv6._vv7)).equals("fa")) { 
 //BA.debugLineNum = 35;BA.debugLine="sLog = ma.Get(\"log_fa\")";
_slog = BA.ObjectToString(_ma.Get((Object)("log_fa")));
 }else {
 //BA.debugLineNum = 37;BA.debugLine="sLog = ma.Get(\"log_en\")";
_slog = BA.ObjectToString(_ma.Get((Object)("log_en")));
 };
 //BA.debugLineNum = 40;BA.debugLine="If sLog.IndexOf(\"\\r\\n\") > -1 Then";
if (_slog.indexOf("\\r\\n")>-1) { 
 //BA.debugLineNum = 41;BA.debugLine="File.WriteString(File.DirInternal,\"log\",sLog.";
anywheresoftware.b4a.keywords.Common.File.WriteString(anywheresoftware.b4a.keywords.Common.File.getDirInternal(),"log",_slog.replace("\\r\\n",anywheresoftware.b4a.keywords.Common.CRLF));
 }else {
 //BA.debugLineNum = 43;BA.debugLine="File.WriteString(File.DirInternal,\"log\",sLog.";
anywheresoftware.b4a.keywords.Common.File.WriteString(anywheresoftware.b4a.keywords.Common.File.getDirInternal(),"log",_slog.replace("\\n",anywheresoftware.b4a.keywords.Common.CRLF));
 };
 //BA.debugLineNum = 46;BA.debugLine="Dim download As HttpJob";
_download = new anywheresoftware.b4a.samples.httputils2.httpjob();
 //BA.debugLineNum = 47;BA.debugLine="download.Initialize(\"download\",Me)";
_download._initialize(processBA,"download",updater.getObject());
 //BA.debugLineNum = 48;BA.debugLine="download.Download(\"https://app.opencart.ir/app";
_download._download("https://app.opencart.ir/app/app_config/"+BA.ObjectToString(_ma.Get((Object)("filename"))));
 };
 }else if((_job._jobname).equals("download")) { 
 //BA.debugLineNum = 54;BA.debugLine="Dim ou As OutputStream";
_ou = new anywheresoftware.b4a.objects.streams.File.OutputStreamWrapper();
 //BA.debugLineNum = 55;BA.debugLine="ou = File.OpenOutput(File.DirRootExternal,\"app.";
_ou = anywheresoftware.b4a.keywords.Common.File.OpenOutput(anywheresoftware.b4a.keywords.Common.File.getDirRootExternal(),"app.apk",anywheresoftware.b4a.keywords.Common.False);
 //BA.debugLineNum = 56;BA.debugLine="File.Copy2(job.GetInputStream,ou)";
anywheresoftware.b4a.keywords.Common.File.Copy2((java.io.InputStream)(_job._getinputstream().getObject()),(java.io.OutputStream)(_ou.getObject()));
 //BA.debugLineNum = 57;BA.debugLine="ou.Close";
_ou.Close();
 //BA.debugLineNum = 59;BA.debugLine="Library.setLocalApp";
mostCurrent._vvvvvvv6._vvvv0(processBA);
 //BA.debugLineNum = 60;BA.debugLine="ToastMessageShow(Library.GetStringResourse(\"new";
anywheresoftware.b4a.keywords.Common.ToastMessageShow(BA.ObjectToCharSequence(mostCurrent._vvvvvvv6._vvvv2(processBA,"new_update_receive").replace("\\n",anywheresoftware.b4a.keywords.Common.CRLF)),anywheresoftware.b4a.keywords.Common.True);
 //BA.debugLineNum = 62;BA.debugLine="Library.InstallApp(File.DirRootExternal,\"app.ap";
mostCurrent._vvvvvvv6._vvvv3(processBA,anywheresoftware.b4a.keywords.Common.File.getDirRootExternal(),"app.apk");
 };
 };
 //BA.debugLineNum = 67;BA.debugLine="End Sub";
return "";
}
public static String  _process_globals() throws Exception{
 //BA.debugLineNum = 5;BA.debugLine="Sub Process_Globals";
 //BA.debugLineNum = 6;BA.debugLine="Dim hu As HttpJob";
_v6 = new anywheresoftware.b4a.samples.httputils2.httpjob();
 //BA.debugLineNum = 7;BA.debugLine="End Sub";
return "";
}
public static String  _service_create() throws Exception{
 //BA.debugLineNum = 9;BA.debugLine="Sub Service_Create";
 //BA.debugLineNum = 10;BA.debugLine="hu.Initialize(\"updater\",Me)";
_v6._initialize(processBA,"updater",updater.getObject());
 //BA.debugLineNum = 11;BA.debugLine="End Sub";
return "";
}
public static String  _service_destroy() throws Exception{
 //BA.debugLineNum = 69;BA.debugLine="Sub Service_Destroy";
 //BA.debugLineNum = 71;BA.debugLine="End Sub";
return "";
}
public static String  _service_start(anywheresoftware.b4a.objects.IntentWrapper _startingintent) throws Exception{
 //BA.debugLineNum = 13;BA.debugLine="Sub Service_Start (StartingIntent As Intent)";
 //BA.debugLineNum = 15;BA.debugLine="hu.Download(\"https://app.opencart.ir/app/app_conf";
_v6._download("https://app.opencart.ir/app/app_config/config");
 //BA.debugLineNum = 16;BA.debugLine="hu.GetRequest.SetHeader(\"Cache-Control\",\"no-store";
_v6._getrequest().SetHeader("Cache-Control","no-store, no-cache, must-revalidate, max-age=0");
 //BA.debugLineNum = 18;BA.debugLine="StartServiceAt(\"\",DateTime.Now * 118000,True)";
anywheresoftware.b4a.keywords.Common.StartServiceAt(processBA,(Object)(""),(long) (anywheresoftware.b4a.keywords.Common.DateTime.getNow()*118000),anywheresoftware.b4a.keywords.Common.True);
 //BA.debugLineNum = 20;BA.debugLine="End Sub";
return "";
}
}
