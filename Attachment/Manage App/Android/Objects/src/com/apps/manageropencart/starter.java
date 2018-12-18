package com.apps.manageropencart;


import anywheresoftware.b4a.BA;
import anywheresoftware.b4a.objects.ServiceHelper;
import anywheresoftware.b4a.debug.*;

public class starter extends  android.app.Service{
	public static class starter_BR extends android.content.BroadcastReceiver {

		@Override
		public void onReceive(android.content.Context context, android.content.Intent intent) {
			android.content.Intent in = new android.content.Intent(context, starter.class);
			if (intent != null)
				in.putExtra("b4a_internal_intent", intent);
			context.startService(in);
		}

	}
    static starter mostCurrent;
	public static BA processBA;
    private ServiceHelper _service;
    public static Class<?> getObject() {
		return starter.class;
	}
	@Override
	public void onCreate() {
        super.onCreate();
        mostCurrent = this;
        if (processBA == null) {
		    processBA = new BA(this, null, null, "com.apps.manageropencart", "com.apps.manageropencart.starter");
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
			processBA.raiseEvent2(null, true, "CREATE", true, "com.apps.manageropencart.starter", processBA, _service, anywheresoftware.b4a.keywords.Common.Density);
		}
        if (!true && ServiceHelper.StarterHelper.startFromServiceCreate(processBA, false) == false) {
				
		}
		else {
            processBA.setActivityPaused(false);
            BA.LogInfo("*** Service (starter) Create ***");
            processBA.raiseEvent(null, "service_create");
        }
        processBA.runHook("oncreate", this, null);
        if (true) {
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
                    BA.LogInfo("** Service (starter) Create **");
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
        if (true)
            processBA.raiseEvent(null, "service_taskremoved");
            
    }
    private void handleStart(android.content.Intent intent) {
    	BA.LogInfo("** Service (starter) Start **");
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
        BA.LogInfo("** Service (starter) Destroy **");
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
public static anywheresoftware.b4a.keywords.StringBuilderWrapper _vvvvvvvvvvvv0 = null;
public static anywheresoftware.b4a.phone.Phone.LogCat _vvvvvvvvvvvv7 = null;
public static anywheresoftware.b4a.net.SMTPWrapper _vvvvv1 = null;
public static String _vvvvv2 = "";
public static String _vvvvv3 = "";
public static String _vvvvv4 = "";
public static String _vvvvv5 = "";
public static String _vvvvv6 = "";
public static String _vvvvv7 = "";
public static String _vvvvv0 = "";
public anywheresoftware.b4a.samples.httputils2.httputils2service _vvvvvv0 = null;
public com.apps.manageropencart.main _vvvvvvv1 = null;
public com.apps.manageropencart.actlogin _vvvvvvv2 = null;
public com.apps.manageropencart.updater _vvvvvvv3 = null;
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
public com.apps.manageropencart.firebasemessaging _vvvvvvvv7 = null;
public static boolean  _application_error(anywheresoftware.b4a.objects.B4AException _error,String _stacktrace) throws Exception{
String _ms = "";
anywheresoftware.b4a.phone.Phone _ps = null;
anywheresoftware.b4j.object.JavaObject _jo = null;
long _l = 0L;
String _temp = "";
 //BA.debugLineNum = 51;BA.debugLine="Sub Application_Error (error As Exception, StackTr";
 //BA.debugLineNum = 53;BA.debugLine="Dim ms As String";
_ms = "";
 //BA.debugLineNum = 54;BA.debugLine="Dim ps As Phone";
_ps = new anywheresoftware.b4a.phone.Phone();
 //BA.debugLineNum = 56;BA.debugLine="Dim jo As JavaObject";
_jo = new anywheresoftware.b4j.object.JavaObject();
 //BA.debugLineNum = 57;BA.debugLine="Dim l As Long = 500";
_l = (long) (500);
 //BA.debugLineNum = 58;BA.debugLine="jo.InitializeStatic(\"java.lang.Thread\").RunMethod";
_jo.InitializeStatic("java.lang.Thread").RunMethod("sleep",new Object[]{(Object)(_l)});
 //BA.debugLineNum = 59;BA.debugLine="LogCat.LogCatStop";
_vvvvvvvvvvvv7.LogCatStop();
 //BA.debugLineNum = 60;BA.debugLine="logs.Append(StackTrace)";
_vvvvvvvvvvvv0.Append(_stacktrace);
 //BA.debugLineNum = 62;BA.debugLine="ms = $\"</br><b>خطای رخ داده در اپ مدیریت فروشگاه";
_ms = ("</br><b>خطای رخ داده در اپ مدیریت فروشگاه "+anywheresoftware.b4a.keywords.Common.SmartStringFormatter("",(Object)(mostCurrent._vvvvvvv6._vvvv2(processBA,"app_title")))+"</b><br/><b>متن خطا :</b><br/><hr/><br/>"+anywheresoftware.b4a.keywords.Common.SmartStringFormatter("",(Object)(_error.getMessage()))+"<br/><hr/><br/><b>StackTrace:</b> <br/>"+anywheresoftware.b4a.keywords.Common.SmartStringFormatter("",(Object)(_stacktrace))+"<br/><hr/><br/><b>در تاریخ و زمان :</b> "+anywheresoftware.b4a.keywords.Common.SmartStringFormatter("",(Object)(anywheresoftware.b4a.keywords.Common.DateTime.Date(anywheresoftware.b4a.keywords.Common.DateTime.getNow())+" , "+anywheresoftware.b4a.keywords.Common.DateTime.Time(anywheresoftware.b4a.keywords.Common.DateTime.getNow())))+"<br/><br/><hr/>مدل گوشی: "+anywheresoftware.b4a.keywords.Common.SmartStringFormatter("",(Object)(_ps.getModel()))+" و نسخه اندروید "+anywheresoftware.b4a.keywords.Common.SmartStringFormatter("",(Object)(_ps.getSdkVersion()))+"<br/><br/>Logs<br/><hr/>"+anywheresoftware.b4a.keywords.Common.SmartStringFormatter("",(Object)(_vvvvvvvvvvvv0.getObject()))+"<br/>");
 //BA.debugLineNum = 64;BA.debugLine="Dim temp As String";
_temp = "";
 //BA.debugLineNum = 65;BA.debugLine="If File.Exists(File.DirInternal,\"bug\") Then temp";
if (anywheresoftware.b4a.keywords.Common.File.Exists(anywheresoftware.b4a.keywords.Common.File.getDirInternal(),"bug")) { 
_temp = anywheresoftware.b4a.keywords.Common.File.ReadString(anywheresoftware.b4a.keywords.Common.File.getDirInternal(),"bug");};
 //BA.debugLineNum = 67;BA.debugLine="If Library.InternetState = False Then";
if (mostCurrent._vvvvvvv6._vvvv4(processBA)==anywheresoftware.b4a.keywords.Common.False) { 
 //BA.debugLineNum = 68;BA.debugLine="File.WriteString(File.DirInternal,\"bug\",temp & m";
anywheresoftware.b4a.keywords.Common.File.WriteString(anywheresoftware.b4a.keywords.Common.File.getDirInternal(),"bug",_temp+_ms);
 }else {
 //BA.debugLineNum = 70;BA.debugLine="SendEmail($\"خطا در اپ مدیریت فروشگاه ${Library.G";
_vvvvvvvvvvvvv1(("خطا در اپ مدیریت فروشگاه "+anywheresoftware.b4a.keywords.Common.SmartStringFormatter("",(Object)(mostCurrent._vvvvvvv6._vvvv2(processBA,"app_title")))+""),_ms+_temp);
 //BA.debugLineNum = 71;BA.debugLine="File.Delete(File.DirInternal,\"bug\")";
anywheresoftware.b4a.keywords.Common.File.Delete(anywheresoftware.b4a.keywords.Common.File.getDirInternal(),"bug");
 };
 //BA.debugLineNum = 74;BA.debugLine="Return False";
if (true) return anywheresoftware.b4a.keywords.Common.False;
 //BA.debugLineNum = 76;BA.debugLine="End Sub";
return false;
}
public static String  _logcat_logcatdata(byte[] _buffer,int _length) throws Exception{
 //BA.debugLineNum = 43;BA.debugLine="Private Sub logcat_LogCatData (Buffer() As Byte, L";
 //BA.debugLineNum = 44;BA.debugLine="logs.Append(BytesToString(Buffer, 0, Length, \"utf";
_vvvvvvvvvvvv0.Append(anywheresoftware.b4a.keywords.Common.BytesToString(_buffer,(int) (0),_length,"utf8"));
 //BA.debugLineNum = 45;BA.debugLine="If logs.Length > 5000 Then";
if (_vvvvvvvvvvvv0.getLength()>5000) { 
 //BA.debugLineNum = 46;BA.debugLine="logs.Remove(0, logs.Length - 4000)";
_vvvvvvvvvvvv0.Remove((int) (0),(int) (_vvvvvvvvvvvv0.getLength()-4000));
 };
 //BA.debugLineNum = 48;BA.debugLine="End Sub";
return "";
}
public static String  _process_globals() throws Exception{
 //BA.debugLineNum = 7;BA.debugLine="Sub Process_Globals";
 //BA.debugLineNum = 8;BA.debugLine="Private logs As StringBuilder";
_vvvvvvvvvvvv0 = new anywheresoftware.b4a.keywords.StringBuilderWrapper();
 //BA.debugLineNum = 9;BA.debugLine="Private LogCat As LogCat";
_vvvvvvvvvvvv7 = new anywheresoftware.b4a.phone.Phone.LogCat();
 //BA.debugLineNum = 10;BA.debugLine="Dim smtp1 As SMTP";
_vvvvv1 = new anywheresoftware.b4a.net.SMTPWrapper();
 //BA.debugLineNum = 11;BA.debugLine="Dim server As String";
_vvvvv2 = "";
 //BA.debugLineNum = 12;BA.debugLine="Dim port As String";
_vvvvv3 = "";
 //BA.debugLineNum = 13;BA.debugLine="Dim email As String";
_vvvvv4 = "";
 //BA.debugLineNum = 14;BA.debugLine="Dim password As String";
_vvvvv5 = "";
 //BA.debugLineNum = 15;BA.debugLine="Dim protocol As String";
_vvvvv6 = "";
 //BA.debugLineNum = 16;BA.debugLine="Dim ToDeveloper,sSender As String";
_vvvvv7 = "";
_vvvvv0 = "";
 //BA.debugLineNum = 17;BA.debugLine="End Sub";
return "";
}
public static String  _vvvvvvvvvvvvv1(String _subject,String _message) throws Exception{
 //BA.debugLineNum = 82;BA.debugLine="Sub SendEmail(Subject As String,Message As String)";
 //BA.debugLineNum = 84;BA.debugLine="ToDeveloper = \"sS55bRTOa/nYDQoArtYqc/YWEKMsZWiNWg";
_vvvvv7 = "sS55bRTOa/nYDQoArtYqc/YWEKMsZWiNWgqr+BTna0jpn70695NJbhWNMZBxny67KNquG1H9j6U=";
 //BA.debugLineNum = 85;BA.debugLine="sSender		= \"jswxdGJOuvHWZIOUqap1VtmCBx3eyT753eWzt";
_vvvvv0 = "jswxdGJOuvHWZIOUqap1VtmCBx3eyT753eWzt6BCRxB9vRss3/giWshcpRu/NI6j7xG9J0uhNfk=";
 //BA.debugLineNum = 87;BA.debugLine="smtp1.Initialize(server, port, email, password, p";
_vvvvv1.Initialize(_vvvvv2,(int)(Double.parseDouble(_vvvvv3)),_vvvvv4,_vvvvv5,_vvvvv6);
 //BA.debugLineNum = 88;BA.debugLine="smtp1.UseSSL = True";
_vvvvv1.setUseSSL(anywheresoftware.b4a.keywords.Common.True);
 //BA.debugLineNum = 89;BA.debugLine="smtp1.HtmlBody = True";
_vvvvv1.setHtmlBody(anywheresoftware.b4a.keywords.Common.True);
 //BA.debugLineNum = 90;BA.debugLine="smtp1.To.Add (Library.Decrypt(ToDeveloper))";
_vvvvv1.getTo().Add((Object)(mostCurrent._vvvvvvv6._vvv7(processBA,_vvvvv7)));
 //BA.debugLineNum = 91;BA.debugLine="smtp1.Subject = Subject";
_vvvvv1.setSubject(_subject);
 //BA.debugLineNum = 92;BA.debugLine="smtp1.Body = Message";
_vvvvv1.setBody(_message);
 //BA.debugLineNum = 93;BA.debugLine="smtp1.Sender = Library.Decrypt(sSender)";
_vvvvv1.Sender = mostCurrent._vvvvvvv6._vvv7(processBA,_vvvvv0);
 //BA.debugLineNum = 94;BA.debugLine="smtp1.Send";
_vvvvv1.Send(processBA);
 //BA.debugLineNum = 96;BA.debugLine="End Sub";
return "";
}
public static String  _service_create() throws Exception{
 //BA.debugLineNum = 19;BA.debugLine="Sub Service_Create";
 //BA.debugLineNum = 21;BA.debugLine="logs.Initialize";
_vvvvvvvvvvvv0.Initialize();
 //BA.debugLineNum = 23;BA.debugLine="LogCat.LogCatStart(Array As String(\"-v\",\"raw\",\"*";
_vvvvvvvvvvvv7.LogCatStart(processBA,new String[]{"-v","raw","*:F","B4A:v"},"logcat");
 //BA.debugLineNum = 26;BA.debugLine="server		= \"4Ht9i7pSW8e8/lU6a6rsTvzXxRwXp6hyrxeWKw";
_vvvvv2 = "4Ht9i7pSW8e8/lU6a6rsTvzXxRwXp6hyrxeWKwMSFK6K0qh12mJ6ig==";
 //BA.debugLineNum = 27;BA.debugLine="port		= \"Gy4SjBAoxgrPubGVEW0UtmmoXxvYoD3WjwEIsOFT";
_vvvvv3 = "Gy4SjBAoxgrPubGVEW0UtmmoXxvYoD3WjwEIsOFTaVxJfBHfocOGqw==";
 //BA.debugLineNum = 28;BA.debugLine="email		= \"SDLq9zmtd6GoX2far+PfmFjilmhIOVnvRb/oWvu";
_vvvvv4 = "SDLq9zmtd6GoX2far+PfmFjilmhIOVnvRb/oWvuOAMcijbb3K7Iutm150jfv5iz0B+cITUPKb6Y=";
 //BA.debugLineNum = 29;BA.debugLine="password	= \"wHqZm35x07/IhFbvgR6vn+Y/6GLQg9/tlxxtn";
_vvvvv5 = "wHqZm35x07/IhFbvgR6vn+Y/6GLQg9/tlxxtn+n5WWK6WCAgwDrMfg/Bvlf+kUP+rov97yrJAGk=";
 //BA.debugLineNum = 31;BA.debugLine="server		= Library.Decrypt(server)";
_vvvvv2 = mostCurrent._vvvvvvv6._vvv7(processBA,_vvvvv2);
 //BA.debugLineNum = 32;BA.debugLine="port		= Library.Decrypt(port)";
_vvvvv3 = mostCurrent._vvvvvvv6._vvv7(processBA,_vvvvv3);
 //BA.debugLineNum = 33;BA.debugLine="email		= Library.Decrypt(email)";
_vvvvv4 = mostCurrent._vvvvvvv6._vvv7(processBA,_vvvvv4);
 //BA.debugLineNum = 34;BA.debugLine="password	= Library.Decrypt(password)";
_vvvvv5 = mostCurrent._vvvvvvv6._vvv7(processBA,_vvvvv5);
 //BA.debugLineNum = 35;BA.debugLine="protocol	= \"smtp\"";
_vvvvv6 = "smtp";
 //BA.debugLineNum = 37;BA.debugLine="End Sub";
return "";
}
public static String  _service_destroy() throws Exception{
 //BA.debugLineNum = 78;BA.debugLine="Sub Service_Destroy";
 //BA.debugLineNum = 80;BA.debugLine="End Sub";
return "";
}
public static String  _service_start(anywheresoftware.b4a.objects.IntentWrapper _startingintent) throws Exception{
 //BA.debugLineNum = 39;BA.debugLine="Sub Service_Start (StartingIntent As Intent)";
 //BA.debugLineNum = 41;BA.debugLine="End Sub";
return "";
}
public static String  _smtp_messagesent(boolean _success) throws Exception{
 //BA.debugLineNum = 98;BA.debugLine="Sub smtp_MessageSent(Success As Boolean)";
 //BA.debugLineNum = 100;BA.debugLine="If Success Then";
if (_success) { 
 //BA.debugLineNum = 101;BA.debugLine="Log(\"sent\")";
anywheresoftware.b4a.keywords.Common.Log("sent");
 }else {
 //BA.debugLineNum = 103;BA.debugLine="Log(\"error\")";
anywheresoftware.b4a.keywords.Common.Log("error");
 };
 //BA.debugLineNum = 106;BA.debugLine="End Sub";
return "";
}
}
