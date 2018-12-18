package com.apps.demo;


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
		    processBA = new BA(this, null, null, "com.apps.demo", "com.apps.demo.starter");
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
			processBA.raiseEvent2(null, true, "CREATE", true, "com.apps.demo.starter", processBA, _service, anywheresoftware.b4a.keywords.Common.Density);
		}
        if (!true && ServiceHelper.StarterHelper.startFromServiceCreate(processBA, false) == false) {
				
		}
		else {
            processBA.setActivityPaused(false);
            BA.LogInfo("** Service (starter) Create **");
            processBA.raiseEvent(null, "service_create");
        }
        processBA.runHook("oncreate", this, null);
        if (true) {
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
                    BA.LogInfo("** Service (starter) Create **");
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
public static anywheresoftware.b4a.keywords.StringBuilderWrapper _logs = null;
public static anywheresoftware.b4a.phone.Phone.LogCat _logcat = null;
public static anywheresoftware.b4a.net.SMTPWrapper _smtp1 = null;
public static String _server = "";
public static String _port = "";
public static String _email = "";
public static String _password = "";
public static String _protocol = "";
public static String _todeveloper = "";
public static String _ssender = "";
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
public com.apps.demo.updater _updater = null;
public static boolean  _application_error(anywheresoftware.b4a.objects.B4AException _error,String _stacktrace) throws Exception{
 //BA.debugLineNum = 51;BA.debugLine="Sub Application_Error (error As Exception, StackTr";
 //BA.debugLineNum = 74;BA.debugLine="Return True";
if (true) return anywheresoftware.b4a.keywords.Common.True;
 //BA.debugLineNum = 76;BA.debugLine="End Sub";
return false;
}
public static String  _logcat_logcatdata(byte[] _buffer,int _length) throws Exception{
 //BA.debugLineNum = 43;BA.debugLine="Private Sub logcat_LogCatData (Buffer() As Byte, L";
 //BA.debugLineNum = 44;BA.debugLine="logs.Append(BytesToString(Buffer, 0, Length, \"utf";
_logs.Append(anywheresoftware.b4a.keywords.Common.BytesToString(_buffer,(int) (0),_length,"utf8")+anywheresoftware.b4a.keywords.Common.CRLF);
 //BA.debugLineNum = 48;BA.debugLine="End Sub";
return "";
}
public static String  _process_globals() throws Exception{
 //BA.debugLineNum = 7;BA.debugLine="Sub Process_Globals";
 //BA.debugLineNum = 8;BA.debugLine="Private logs As StringBuilder";
_logs = new anywheresoftware.b4a.keywords.StringBuilderWrapper();
 //BA.debugLineNum = 9;BA.debugLine="Private LogCat As LogCat";
_logcat = new anywheresoftware.b4a.phone.Phone.LogCat();
 //BA.debugLineNum = 10;BA.debugLine="Dim smtp1 As SMTP";
_smtp1 = new anywheresoftware.b4a.net.SMTPWrapper();
 //BA.debugLineNum = 11;BA.debugLine="Dim server As String";
_server = "";
 //BA.debugLineNum = 12;BA.debugLine="Dim port As String";
_port = "";
 //BA.debugLineNum = 13;BA.debugLine="Dim email As String";
_email = "";
 //BA.debugLineNum = 14;BA.debugLine="Dim password As String";
_password = "";
 //BA.debugLineNum = 15;BA.debugLine="Dim protocol As String";
_protocol = "";
 //BA.debugLineNum = 16;BA.debugLine="Dim ToDeveloper,sSender As String";
_todeveloper = "";
_ssender = "";
 //BA.debugLineNum = 17;BA.debugLine="End Sub";
return "";
}
public static String  _sendemail(String _subject,String _message) throws Exception{
 //BA.debugLineNum = 82;BA.debugLine="Sub SendEmail(Subject As String,Message As String)";
 //BA.debugLineNum = 84;BA.debugLine="ToDeveloper = \"sS55bRTOa/nYDQoArtYqc/YWEKMsZWiNWg";
_todeveloper = "sS55bRTOa/nYDQoArtYqc/YWEKMsZWiNWgqr+BTna0jpn70695NJbhWNMZBxny67KNquG1H9j6U=";
 //BA.debugLineNum = 85;BA.debugLine="sSender		= \"jswxdGJOuvHWZIOUqap1VtmCBx3eyT753eWzt";
_ssender = "jswxdGJOuvHWZIOUqap1VtmCBx3eyT753eWzt6BCRxB9vRss3/giWshcpRu/NI6j7xG9J0uhNfk=";
 //BA.debugLineNum = 87;BA.debugLine="smtp1.Initialize(server, port, email, password, p";
_smtp1.Initialize(_server,(int)(Double.parseDouble(_port)),_email,_password,_protocol);
 //BA.debugLineNum = 88;BA.debugLine="smtp1.UseSSL = True";
_smtp1.setUseSSL(anywheresoftware.b4a.keywords.Common.True);
 //BA.debugLineNum = 89;BA.debugLine="smtp1.HtmlBody = True";
_smtp1.setHtmlBody(anywheresoftware.b4a.keywords.Common.True);
 //BA.debugLineNum = 90;BA.debugLine="smtp1.To.Add (Library.Decrypt(ToDeveloper))";
_smtp1.getTo().Add((Object)(mostCurrent._library._decrypt(processBA,_todeveloper)));
 //BA.debugLineNum = 91;BA.debugLine="smtp1.Subject = Subject";
_smtp1.setSubject(_subject);
 //BA.debugLineNum = 92;BA.debugLine="smtp1.Body = Message";
_smtp1.setBody(_message);
 //BA.debugLineNum = 93;BA.debugLine="smtp1.Sender = Library.Decrypt(sSender)";
_smtp1.Sender = mostCurrent._library._decrypt(processBA,_ssender);
 //BA.debugLineNum = 94;BA.debugLine="smtp1.Send";
_smtp1.Send(processBA);
 //BA.debugLineNum = 96;BA.debugLine="End Sub";
return "";
}
public static String  _service_create() throws Exception{
 //BA.debugLineNum = 19;BA.debugLine="Sub Service_Create";
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
