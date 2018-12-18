package b4j.example;


import anywheresoftware.b4a.BA;
import anywheresoftware.b4a.debug.*;

public class main extends javafx.application.Application{
public static main mostCurrent = new main();

public static BA ba;
static {
		ba = new  anywheresoftware.b4j.objects.FxBA("b4j.example", "b4j.example.main", null);
		ba.loadHtSubs(main.class);
        if (ba.getClass().getName().endsWith("ShellBA")) {
			
			ba.raiseEvent2(null, true, "SHELL", false);
			ba.raiseEvent2(null, true, "CREATE", true, "b4j.example.main", ba);
		}
	}
    public static Class<?> getObject() {
		return main.class;
	}

 
    public static void main(String[] args) {
    	launch(args);
    }
    public void start (javafx.stage.Stage stage) {
        try {
            if (!false)
                System.setProperty("prism.lcdtext", "false");
            anywheresoftware.b4j.objects.FxBA.application = this;
		    anywheresoftware.b4a.keywords.Common.setDensity(javafx.stage.Screen.getPrimary().getDpi());
            anywheresoftware.b4a.keywords.Common.LogDebug("Program started.");
            initializeProcessGlobals();
            anywheresoftware.b4j.objects.Form frm = new anywheresoftware.b4j.objects.Form();
            frm.initWithStage(ba, stage, 334, 410);
            ba.raiseEvent(null, "appstart", frm, (String[])getParameters().getRaw().toArray(new String[0]));
        } catch (Throwable t) {
            BA.printException(t, true);
            System.exit(1);
        }
    }
public static anywheresoftware.b4a.keywords.Common __c = null;
public static anywheresoftware.b4j.objects.JFX _fx = null;
public static anywheresoftware.b4j.objects.Form _mainform = null;
public static anywheresoftware.b4j.objects.TextInputControlWrapper.TextFieldWrapper _txtval = null;
public static anywheresoftware.b4j.objects.ButtonWrapper.RadioButtonWrapper _r1 = null;
public static anywheresoftware.b4j.objects.ButtonWrapper.RadioButtonWrapper _r2 = null;
public static anywheresoftware.b4j.objects.TextInputControlWrapper.TextAreaWrapper _txtoutput = null;
public static anywheresoftware.b4j.objects.ButtonWrapper _btndo = null;
public static anywheresoftware.b4j.objects.TextInputControlWrapper.TextFieldWrapper _txtpass = null;
public static String  _appstart(anywheresoftware.b4j.objects.Form _form1,String[] _args) throws Exception{
 //BA.debugLineNum = 18;BA.debugLine="Sub AppStart (Form1 As Form, Args() As String)";
 //BA.debugLineNum = 20;BA.debugLine="MainForm = Form1";
_mainform = _form1;
 //BA.debugLineNum = 21;BA.debugLine="MainForm.SetFormStyle(\"UNIFIED\")";
_mainform.SetFormStyle("UNIFIED");
 //BA.debugLineNum = 22;BA.debugLine="MainForm.RootPane.LoadLayout(\"frm1\") 'Load the la";
_mainform.getRootPane().LoadLayout(ba,"frm1");
 //BA.debugLineNum = 23;BA.debugLine="MainForm.Show";
_mainform.Show();
 //BA.debugLineNum = 24;BA.debugLine="MainForm.Resizable = False";
_mainform.setResizable(anywheresoftware.b4a.keywords.Common.False);
 //BA.debugLineNum = 26;BA.debugLine="End Sub";
return "";
}
public static String  _btndo_action() throws Exception{
 //BA.debugLineNum = 28;BA.debugLine="Sub btndo_Action";
 //BA.debugLineNum = 30;BA.debugLine="If r1.Selected = True Then";
if (_r1.getSelected()==anywheresoftware.b4a.keywords.Common.True) { 
 //BA.debugLineNum = 31;BA.debugLine="txtoutput.Text = Encrypt(txtval.Text,txtpass.Tex";
_txtoutput.setText(_encrypt(_txtval.getText(),_txtpass.getText()));
 }else {
 //BA.debugLineNum = 33;BA.debugLine="txtoutput.Text = Decrypt(txtval.Text,txtpass.Tex";
_txtoutput.setText(_decrypt(_txtval.getText(),_txtpass.getText()));
 };
 //BA.debugLineNum = 36;BA.debugLine="End Sub";
return "";
}
public static String  _decrypt(String _text,String _password) throws Exception{
anywheresoftware.b4a.object.B4XEncryption _c = null;
anywheresoftware.b4a.objects.StringUtils _su = null;
byte[] _b = null;
 //BA.debugLineNum = 68;BA.debugLine="Sub Decrypt(Text As String,Password As String) As";
 //BA.debugLineNum = 70;BA.debugLine="Dim c As B4XCipher";
_c = new anywheresoftware.b4a.object.B4XEncryption();
 //BA.debugLineNum = 71;BA.debugLine="Dim su As StringUtils";
_su = new anywheresoftware.b4a.objects.StringUtils();
 //BA.debugLineNum = 72;BA.debugLine="Dim b() As Byte = c.Decrypt(su.DecodeBase64(Tex";
_b = _c.Decrypt(_su.DecodeBase64(_text),_password);
 //BA.debugLineNum = 73;BA.debugLine="Return BytesToString(b, 0, b.Length, \"utf8\")";
if (true) return anywheresoftware.b4a.keywords.Common.BytesToString(_b,(int) (0),_b.length,"utf8");
 //BA.debugLineNum = 75;BA.debugLine="End Sub";
return "";
}
public static String  _encrypt(String _text,String _password) throws Exception{
anywheresoftware.b4a.object.B4XEncryption _c = null;
anywheresoftware.b4a.objects.StringUtils _su = null;
byte[] _b = null;
 //BA.debugLineNum = 58;BA.debugLine="Sub Encrypt(text As String,Password As String) As";
 //BA.debugLineNum = 60;BA.debugLine="Dim c As B4XCipher";
_c = new anywheresoftware.b4a.object.B4XEncryption();
 //BA.debugLineNum = 61;BA.debugLine="Dim su As StringUtils";
_su = new anywheresoftware.b4a.objects.StringUtils();
 //BA.debugLineNum = 62;BA.debugLine="Dim b() As Byte";
_b = new byte[(int) (0)];
;
 //BA.debugLineNum = 63;BA.debugLine="b = c.Encrypt(text.GetBytes(\"utf8\"), Password)";
_b = _c.Encrypt(_text.getBytes("utf8"),_password);
 //BA.debugLineNum = 64;BA.debugLine="Return su.EncodeBase64(b)";
if (true) return _su.EncodeBase64(_b);
 //BA.debugLineNum = 66;BA.debugLine="End Sub";
return "";
}

private static boolean processGlobalsRun;
public static void initializeProcessGlobals() {
    
    if (main.processGlobalsRun == false) {
	    main.processGlobalsRun = true;
		try {
		        main._process_globals();
		
        } catch (Exception e) {
			throw new RuntimeException(e);
		}
    }
}public static String  _process_globals() throws Exception{
 //BA.debugLineNum = 7;BA.debugLine="Sub Process_Globals";
 //BA.debugLineNum = 8;BA.debugLine="Private fx As JFX";
_fx = new anywheresoftware.b4j.objects.JFX();
 //BA.debugLineNum = 9;BA.debugLine="Private MainForm As Form";
_mainform = new anywheresoftware.b4j.objects.Form();
 //BA.debugLineNum = 10;BA.debugLine="Private txtval As TextField";
_txtval = new anywheresoftware.b4j.objects.TextInputControlWrapper.TextFieldWrapper();
 //BA.debugLineNum = 11;BA.debugLine="Private r1 As RadioButton";
_r1 = new anywheresoftware.b4j.objects.ButtonWrapper.RadioButtonWrapper();
 //BA.debugLineNum = 12;BA.debugLine="Private r2 As RadioButton";
_r2 = new anywheresoftware.b4j.objects.ButtonWrapper.RadioButtonWrapper();
 //BA.debugLineNum = 13;BA.debugLine="Private txtoutput As TextArea";
_txtoutput = new anywheresoftware.b4j.objects.TextInputControlWrapper.TextAreaWrapper();
 //BA.debugLineNum = 14;BA.debugLine="Private btndo As Button";
_btndo = new anywheresoftware.b4j.objects.ButtonWrapper();
 //BA.debugLineNum = 15;BA.debugLine="Private txtpass As TextField";
_txtpass = new anywheresoftware.b4j.objects.TextInputControlWrapper.TextFieldWrapper();
 //BA.debugLineNum = 16;BA.debugLine="End Sub";
return "";
}
public static String  _r1_selectedchange(boolean _selected) throws Exception{
 //BA.debugLineNum = 38;BA.debugLine="Sub r1_SelectedChange(Selected As Boolean)";
 //BA.debugLineNum = 40;BA.debugLine="If Selected Then";
if (_selected) { 
 //BA.debugLineNum = 41;BA.debugLine="r2.Selected = False";
_r2.setSelected(anywheresoftware.b4a.keywords.Common.False);
 //BA.debugLineNum = 42;BA.debugLine="txtoutput.Text = \"\"";
_txtoutput.setText("");
 //BA.debugLineNum = 43;BA.debugLine="btndo.Text = \"Encryption\"";
_btndo.setText("Encryption");
 };
 //BA.debugLineNum = 46;BA.debugLine="End Sub";
return "";
}
public static String  _r2_selectedchange(boolean _selected) throws Exception{
 //BA.debugLineNum = 48;BA.debugLine="Sub r2_SelectedChange(Selected As Boolean)";
 //BA.debugLineNum = 50;BA.debugLine="If Selected Then";
if (_selected) { 
 //BA.debugLineNum = 51;BA.debugLine="r1.Selected = False";
_r1.setSelected(anywheresoftware.b4a.keywords.Common.False);
 //BA.debugLineNum = 52;BA.debugLine="btndo.Text = \"Decryption\"";
_btndo.setText("Decryption");
 //BA.debugLineNum = 53;BA.debugLine="txtoutput.Text = \"\"";
_txtoutput.setText("");
 };
 //BA.debugLineNum = 56;BA.debugLine="End Sub";
return "";
}
}
