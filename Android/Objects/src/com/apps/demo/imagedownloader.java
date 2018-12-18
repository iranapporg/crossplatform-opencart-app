package com.apps.demo;


import anywheresoftware.b4a.BA;
import anywheresoftware.b4a.objects.ServiceHelper;
import anywheresoftware.b4a.debug.*;

public class imagedownloader extends  android.app.Service{
	public static class imagedownloader_BR extends android.content.BroadcastReceiver {

		@Override
		public void onReceive(android.content.Context context, android.content.Intent intent) {
			android.content.Intent in = new android.content.Intent(context, imagedownloader.class);
			if (intent != null)
				in.putExtra("b4a_internal_intent", intent);
			context.startService(in);
		}

	}
    static imagedownloader mostCurrent;
	public static BA processBA;
    private ServiceHelper _service;
    public static Class<?> getObject() {
		return imagedownloader.class;
	}
	@Override
	public void onCreate() {
        super.onCreate();
        mostCurrent = this;
        if (processBA == null) {
		    processBA = new BA(this, null, null, "com.apps.demo", "com.apps.demo.imagedownloader");
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
			processBA.raiseEvent2(null, true, "CREATE", true, "com.apps.demo.imagedownloader", processBA, _service, anywheresoftware.b4a.keywords.Common.Density);
		}
        if (!false && ServiceHelper.StarterHelper.startFromServiceCreate(processBA, false) == false) {
				
		}
		else {
            processBA.setActivityPaused(false);
            BA.LogInfo("** Service (imagedownloader) Create **");
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
                    BA.LogInfo("** Service (imagedownloader) Create **");
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
    	BA.LogInfo("** Service (imagedownloader) Start **");
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
        BA.LogInfo("** Service (imagedownloader) Destroy **");
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
public static anywheresoftware.b4a.objects.collections.Map _cache = null;
public static anywheresoftware.b4a.objects.collections.Map _tasks = null;
public static anywheresoftware.b4a.objects.collections.Map _ongoingtasks = null;
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
public com.apps.demo.updater _updater = null;
public com.apps.demo.starter _starter = null;
public static String  _activityispaused() throws Exception{
 //BA.debugLineNum = 87;BA.debugLine="Sub ActivityIsPaused";
 //BA.debugLineNum = 88;BA.debugLine="tasks.Clear";
_tasks.Clear();
 //BA.debugLineNum = 89;BA.debugLine="End Sub";
return "";
}
public static String  _download(anywheresoftware.b4a.objects.collections.Map _imageviewsmap) throws Exception{
int _i = 0;
String _link = "";
anywheresoftware.b4a.objects.ImageViewWrapper _iv = null;
anywheresoftware.b4a.samples.httputils2.httpjob _j = null;
 //BA.debugLineNum = 25;BA.debugLine="Sub Download (ImageViewsMap As Map)";
 //BA.debugLineNum = 27;BA.debugLine="For i = 0 To ImageViewsMap.Size - 1";
{
final int step1 = 1;
final int limit1 = (int) (_imageviewsmap.getSize()-1);
for (_i = (int) (0) ; (step1 > 0 && _i <= limit1) || (step1 < 0 && _i >= limit1); _i = ((int)(0 + _i + step1)) ) {
 //BA.debugLineNum = 29;BA.debugLine="tasks.Put(ImageViewsMap.GetKeyAt(i), ImageViewsM";
_tasks.Put(_imageviewsmap.GetKeyAt(_i),_imageviewsmap.GetValueAt(_i));
 //BA.debugLineNum = 30;BA.debugLine="Dim link As String = ImageViewsMap.GetValueAt(i)";
_link = BA.ObjectToString(_imageviewsmap.GetValueAt(_i));
 //BA.debugLineNum = 32;BA.debugLine="If File.Exists(File.DirInternal,Library.GetFilen";
if (anywheresoftware.b4a.keywords.Common.File.Exists(anywheresoftware.b4a.keywords.Common.File.getDirInternal(),mostCurrent._library._getfilename(processBA,_link))) { 
 //BA.debugLineNum = 33;BA.debugLine="Dim iv As ImageView = ImageViewsMap.GetKeyAt(i)";
_iv = new anywheresoftware.b4a.objects.ImageViewWrapper();
_iv.setObject((android.widget.ImageView)(_imageviewsmap.GetKeyAt(_i)));
 //BA.debugLineNum = 34;BA.debugLine="LoadImage(iv,link)";
_loadimage(_iv,_link);
 }else if(_ongoingtasks.ContainsKey((Object)(_link))==anywheresoftware.b4a.keywords.Common.False) { 
 //BA.debugLineNum = 37;BA.debugLine="ongoingTasks.Put(link, \"\")";
_ongoingtasks.Put((Object)(_link),(Object)(""));
 //BA.debugLineNum = 38;BA.debugLine="Dim j As HttpJob";
_j = new anywheresoftware.b4a.samples.httputils2.httpjob();
 //BA.debugLineNum = 39;BA.debugLine="j.Initialize(link, Me)";
_j._initialize(processBA,_link,imagedownloader.getObject());
 //BA.debugLineNum = 40;BA.debugLine="If link.Length < 20 Then Return";
if (_link.length()<20) { 
if (true) return "";};
 //BA.debugLineNum = 41;BA.debugLine="j.Download(link)";
_j._download(_link);
 };
 }
};
 //BA.debugLineNum = 46;BA.debugLine="End Sub";
return "";
}
public static String  _jobdone(anywheresoftware.b4a.samples.httputils2.httpjob _job) throws Exception{
anywheresoftware.b4a.objects.drawable.CanvasWrapper.BitmapWrapper _bmp = null;
int _i = 0;
String _link = "";
anywheresoftware.b4a.objects.ImageViewWrapper _iv = null;
 //BA.debugLineNum = 48;BA.debugLine="Sub JobDone(Job As HttpJob)";
 //BA.debugLineNum = 50;BA.debugLine="ongoingTasks.Remove(Job.JobName)";
_ongoingtasks.Remove((Object)(_job._jobname));
 //BA.debugLineNum = 52;BA.debugLine="If Job.Success Then";
if (_job._success) { 
 //BA.debugLineNum = 54;BA.debugLine="Dim bmp As Bitmap";
_bmp = new anywheresoftware.b4a.objects.drawable.CanvasWrapper.BitmapWrapper();
 //BA.debugLineNum = 56;BA.debugLine="Try";
try { //BA.debugLineNum = 57;BA.debugLine="If Job.GetBitmap = Null Then";
if (_job._getbitmap()== null) { 
 //BA.debugLineNum = 58;BA.debugLine="bmp = LoadBitmap(File.DirAssets,\"noimage.png\")";
_bmp = anywheresoftware.b4a.keywords.Common.LoadBitmap(anywheresoftware.b4a.keywords.Common.File.getDirAssets(),"noimage.png");
 }else {
 //BA.debugLineNum = 60;BA.debugLine="bmp = Job.GetBitmap";
_bmp = _job._getbitmap();
 };
 } 
       catch (Exception e11) {
			processBA.setLastException(e11); //BA.debugLineNum = 63;BA.debugLine="bmp = LoadBitmap(File.DirAssets,\"noimage.png\")";
_bmp = anywheresoftware.b4a.keywords.Common.LoadBitmap(anywheresoftware.b4a.keywords.Common.File.getDirAssets(),"noimage.png");
 };
 //BA.debugLineNum = 66;BA.debugLine="cache.Put(Job.JobName, bmp)";
_cache.Put((Object)(_job._jobname),(Object)(_bmp.getObject()));
 //BA.debugLineNum = 68;BA.debugLine="If tasks.IsInitialized Then";
if (_tasks.IsInitialized()) { 
 //BA.debugLineNum = 69;BA.debugLine="For i = 0 To tasks.Size - 1";
{
final int step15 = 1;
final int limit15 = (int) (_tasks.getSize()-1);
for (_i = (int) (0) ; (step15 > 0 && _i <= limit15) || (step15 < 0 && _i >= limit15); _i = ((int)(0 + _i + step15)) ) {
 //BA.debugLineNum = 70;BA.debugLine="Dim link As String = tasks.GetValueAt(i)";
_link = BA.ObjectToString(_tasks.GetValueAt(_i));
 //BA.debugLineNum = 71;BA.debugLine="If link = Job.JobName Then";
if ((_link).equals(_job._jobname)) { 
 //BA.debugLineNum = 72;BA.debugLine="Library.WriteBitmap2File(bmp,Library.GetFilen";
mostCurrent._library._writebitmap2file(processBA,_bmp,mostCurrent._library._getfilename(processBA,_job._jobname));
 //BA.debugLineNum = 73;BA.debugLine="Dim iv As ImageView = tasks.GetKeyAt(i)";
_iv = new anywheresoftware.b4a.objects.ImageViewWrapper();
_iv.setObject((android.widget.ImageView)(_tasks.GetKeyAt(_i)));
 //BA.debugLineNum = 74;BA.debugLine="LoadImage(iv,Job.JobName)";
_loadimage(_iv,_job._jobname);
 };
 }
};
 };
 }else {
 //BA.debugLineNum = 80;BA.debugLine="Log(\"Error downloading image: \" & Job.JobName &";
anywheresoftware.b4a.keywords.Common.Log("Error downloading image: "+_job._jobname+anywheresoftware.b4a.keywords.Common.CRLF+_job._errormessage);
 };
 //BA.debugLineNum = 83;BA.debugLine="Job.Release";
_job._release();
 //BA.debugLineNum = 85;BA.debugLine="End Sub";
return "";
}
public static String  _loadimage(anywheresoftware.b4a.objects.ImageViewWrapper _iv,String _url) throws Exception{
ariagp.amin.shahedi.AriaGlideWrapper _glide = null;
String _s1 = "";
String _path = "";
 //BA.debugLineNum = 91;BA.debugLine="Sub LoadImage(iv As ImageView,Url As String)";
 //BA.debugLineNum = 93;BA.debugLine="Dim glide As AriaGlide";
_glide = new ariagp.amin.shahedi.AriaGlideWrapper();
 //BA.debugLineNum = 95;BA.debugLine="Dim s1 As String";
_s1 = "";
 //BA.debugLineNum = 96;BA.debugLine="s1 = iv.Tag";
_s1 = BA.ObjectToString(_iv.getTag());
 //BA.debugLineNum = 98;BA.debugLine="Dim path As String";
_path = "";
 //BA.debugLineNum = 99;BA.debugLine="path = $\"${File.DirInternal}/${Library.GetFilenam";
_path = (""+anywheresoftware.b4a.keywords.Common.SmartStringFormatter("",(Object)(anywheresoftware.b4a.keywords.Common.File.getDirInternal()))+"/"+anywheresoftware.b4a.keywords.Common.SmartStringFormatter("",(Object)(mostCurrent._library._getfilename(processBA,_url)))+"");
 //BA.debugLineNum = 101;BA.debugLine="If s1 = \"scale\" Then";
if ((_s1).equals("scale")) { 
 //BA.debugLineNum = 102;BA.debugLine="glide.Load(path).AsBitmap.Resize(Abs(iv.Width),A";
_glide.Load((Object)(_path)).AsBitmap().Resize((int) (anywheresoftware.b4a.keywords.Common.Abs(_iv.getWidth())),(int) (anywheresoftware.b4a.keywords.Common.Abs(_iv.getHeight()))).CenterCrop().IntoImageView(_iv);
 }else {
 //BA.debugLineNum = 104;BA.debugLine="glide.Load(path).AsBitmap.Resize(Abs(iv.Width),A";
_glide.Load((Object)(_path)).AsBitmap().Resize((int) (anywheresoftware.b4a.keywords.Common.Abs(_iv.getWidth())),(int) (anywheresoftware.b4a.keywords.Common.Abs(_iv.getHeight()))).FitCenter().IntoImageView(_iv);
 };
 //BA.debugLineNum = 107;BA.debugLine="End Sub";
return "";
}
public static String  _process_globals() throws Exception{
 //BA.debugLineNum = 5;BA.debugLine="Sub Process_Globals";
 //BA.debugLineNum = 6;BA.debugLine="Private cache As Map";
_cache = new anywheresoftware.b4a.objects.collections.Map();
 //BA.debugLineNum = 7;BA.debugLine="Private tasks As Map";
_tasks = new anywheresoftware.b4a.objects.collections.Map();
 //BA.debugLineNum = 8;BA.debugLine="Private ongoingTasks As Map";
_ongoingtasks = new anywheresoftware.b4a.objects.collections.Map();
 //BA.debugLineNum = 9;BA.debugLine="End Sub";
return "";
}
public static String  _service_create() throws Exception{
 //BA.debugLineNum = 11;BA.debugLine="Sub Service_Create";
 //BA.debugLineNum = 12;BA.debugLine="tasks.Initialize";
_tasks.Initialize();
 //BA.debugLineNum = 13;BA.debugLine="cache.Initialize";
_cache.Initialize();
 //BA.debugLineNum = 14;BA.debugLine="ongoingTasks.Initialize";
_ongoingtasks.Initialize();
 //BA.debugLineNum = 15;BA.debugLine="End Sub";
return "";
}
public static String  _service_destroy() throws Exception{
 //BA.debugLineNum = 21;BA.debugLine="Sub Service_Destroy";
 //BA.debugLineNum = 23;BA.debugLine="End Sub";
return "";
}
public static String  _service_start(anywheresoftware.b4a.objects.IntentWrapper _startingintent) throws Exception{
 //BA.debugLineNum = 17;BA.debugLine="Sub Service_Start (StartingIntent As Intent)";
 //BA.debugLineNum = 19;BA.debugLine="End Sub";
return "";
}
}
