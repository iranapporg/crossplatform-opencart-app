
#import "b4i_actaccount.h"
#import "b4i_main.h"
#import "b4i_actmenu.h"
#import "b4i_library.h"
#import "b4i_imagedownloader.h"
#import "b4i_actsearch.h"
#import "b4i_opencart.h"
#import "b4i_actregister.h"
#import "b4i_actcontact.h"
#import "b4i_actproduct.h"
#import "b4i_httpjob.h"
#import "b4i_clspreferencemanager.h"
#import "b4i_actpicture.h"
#import "b4i_actdoorder.h"
#import "b4i_actcategory.h"
#import "b4i_actpayment.h"
#import "b4i_actpush.h"
#import "b4i_pushnotification.h"
#import "b4i_actlogin.h"
#import "b4i_actbasket.h"
#import "b4i_actproducts.h"
#import "b4i_slidemenu.h"
#import "b4i_richstring.h"
#import "b4i_actsms.h"
#import "b4i_html.h"
#import "b4i_actorderdetails.h"
#import "b4i_modshare.h"
#import "b4i_acterrorinternet.h"
#import "b4i_httputils2service.h"
#import "b4i_cachedata.h"
#import "b4i_mytoastmessageshow.h"
#import "b4i_customlistview.h"
#import "b4i_dateutils.h"
#import "b4i_bookmark.h"
#import "b4i_actabout.h"
#import "b4i_actshow.h"
#import "b4i_actweb.h"
#import "b4i_actsetting.h"
#import "b4i_actreview.h"
#import "b4i_imagezoom.h"
#import "b4i_peroperties.h"


@implementation b4i_actaccount 


+ (instancetype)new {
    static b4i_actaccount* shared = nil;
    if (shared == nil) {
        shared = [self alloc];
        shared.bi = [[B4I alloc] init:shared];
        shared.__c = [B4ICommon new];
    }
    return shared;
}

- (NSString*)  _addaddress_receive:(B4IMap*) _res :(NSString*) _cat{
b4i_opencart* _opaddress = nil;
 //BA.debugLineNum = 808;BA.debugLine="Sub addAddress_receive(res As  Map,cat As String)";
 //BA.debugLineNum = 810;BA.debugLine="Library.HUD.ProgressDialogHide";
[self._library._hud ProgressDialogHide];
 //BA.debugLineNum = 812;BA.debugLine="pnlloading.Visible = False";
[self._pnlloading setVisible:[self.__c False]];
 //BA.debugLineNum = 814;BA.debugLine="If res.ContainsKey(\"success\") Then";
if ([_res ContainsKey:(NSObject*)(@"success")]) { 
 //BA.debugLineNum = 815;BA.debugLine="If res.Get(\"success\") = 1 Then";
if ([[_res Get:(NSObject*)(@"success")] isEqual:(NSObject*)(@(1))]) { 
 //BA.debugLineNum = 816;BA.debugLine="txtaddress.Text = \"\"";
[self._txtaddress setText:@""];
 //BA.debugLineNum = 817;BA.debugLine="toast.ShowToastMessageShow(Library.GetStringRes";
[self._toast _showtoastmessageshow:[self._library _getstringresourse:@"success_add_address"] :(long long) (2) :[self.__c True]];
 //BA.debugLineNum = 818;BA.debugLine="Dim opAddress As OpenCart";
_opaddress = [b4i_opencart new];
 //BA.debugLineNum = 819;BA.debugLine="opAddress.Initialize";
[_opaddress _initialize:self.bi];
 //BA.debugLineNum = 820;BA.debugLine="opAddress.ListAddressUser(Me,\"ListAddress_recei";
[_opaddress _listaddressuser:self :@"ListAddress_receive"];
 //BA.debugLineNum = 821;BA.debugLine="Return";
if (true) return @"";
 };
 };
 //BA.debugLineNum = 825;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _btnadd_address_click{
 //BA.debugLineNum = 827;BA.debugLine="Sub btnadd_address_Click";
 //BA.debugLineNum = 829;BA.debugLine="HideMainpanelSV";
[self _hidemainpanelsv];
 //BA.debugLineNum = 830;BA.debugLine="svadd_address.Visible = True";
[self._svadd_address setVisible:[self.__c True]];
 //BA.debugLineNum = 831;BA.debugLine="DefaultButtonMenuColor";
[self _defaultbuttonmenucolor];
 //BA.debugLineNum = 833;BA.debugLine="btnadd_address.CustomLabel.TextColor = Colors.RGB";
[[self._btnadd_address CustomLabel] setTextColor:[[self.__c Colors] RGB:(int) (244) :(int) (255) :(int) (0)]];
 //BA.debugLineNum = 834;BA.debugLine="lblnewaddress.TextColor = Colors.RGB(244,255,0)";
[self._lblnewaddress setTextColor:[[self.__c Colors] RGB:(int) (244) :(int) (255) :(int) (0)]];
 //BA.debugLineNum = 836;BA.debugLine="btnadd.Text = Library.GetStringResourse(\"new_addr";
[self._btnadd setText:[self._library _getstringresourse:@"new_address"]];
 //BA.debugLineNum = 837;BA.debugLine="Library.GetButtonState(btnadd)";
[self._library _getbuttonstate:self._btnadd];
 //BA.debugLineNum = 838;BA.debugLine="Library.GetButtonState(btncancel_new_address)";
[self._library _getbuttonstate:self._btncancel_new_address];
 //BA.debugLineNum = 839;BA.debugLine="btnback_menu_Click";
[self _btnback_menu_click];
 //BA.debugLineNum = 841;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _btnadd_click{
B4IMap* _data = nil;
int _k = 0;
B4IMap* _m2 = nil;
b4i_opencart* _op1 = nil;
 //BA.debugLineNum = 732;BA.debugLine="Sub btnadd_Click";
 //BA.debugLineNum = 734;BA.debugLine="If txtaddress.Text.Length < 3 Then";
if ([[self._txtaddress Text] Length]<3) { 
 //BA.debugLineNum = 735;BA.debugLine="toast.ShowToastMessageShow(Library.GetStringReso";
[self._toast _showtoastmessageshow:[self._library _getstringresourse:@"error_address_1"] :(long long) (2) :[self.__c False]];
 //BA.debugLineNum = 736;BA.debugLine="Return";
if (true) return @"";
 };
 //BA.debugLineNum = 739;BA.debugLine="If Library.ValidPostalCode(txtpostal_enter.Text)";
if ([self._library _validpostalcode:[self._txtpostal_enter Text]]==[self.__c False]) { 
 //BA.debugLineNum = 740;BA.debugLine="toast.ShowToastMessageShow(Library.GetStringReso";
[self._toast _showtoastmessageshow:[[self._library _getstringresourse:@"postal"] Replace:@":" :@""] :(long long) (2) :[self.__c False]];
 //BA.debugLineNum = 741;BA.debugLine="Return";
if (true) return @"";
 };
 //BA.debugLineNum = 744;BA.debugLine="Dim data As Map";
_data = [B4IMap new];
 //BA.debugLineNum = 745;BA.debugLine="data.Initialize";
[_data Initialize];
 //BA.debugLineNum = 747;BA.debugLine="If txtcity.GetSelectedRow(0) < 0 Then";
if ([self._txtcity GetSelectedRow:(int) (0)]<0) { 
 //BA.debugLineNum = 748;BA.debugLine="toast.ShowToastMessageShow(Library.GetStringReso";
[self._toast _showtoastmessageshow:[self._library _getstringresourse:@"error_city"] :(long long) (2) :[self.__c False]];
 //BA.debugLineNum = 749;BA.debugLine="Return";
if (true) return @"";
 };
 //BA.debugLineNum = 752;BA.debugLine="data.Put(\"city\",txtcity.GetSelectedItem(0))";
[_data Put:(NSObject*)(@"city") :[self._txtcity GetSelectedItem:(int) (0)]];
 //BA.debugLineNum = 754;BA.debugLine="For k = 0 To listCity.Size - 1";
{
const int step16 = 1;
const int limit16 = (int) ([self._listcity Size]-1);
_k = (int) (0) ;
for (;(step16 > 0 && _k <= limit16) || (step16 < 0 && _k >= limit16) ;_k = ((int)(0 + _k + step16))  ) {
 //BA.debugLineNum = 756;BA.debugLine="Dim m2 As Map";
_m2 = [B4IMap new];
 //BA.debugLineNum = 757;BA.debugLine="m2 = listCity.Get(k)";
_m2 = (B4IMap*)([self._listcity Get:_k]);
 //BA.debugLineNum = 759;BA.debugLine="If m2.Get(\"name\") = txtcity.GetSelectedItem(0) T";
if ([[_m2 Get:(NSObject*)(@"name")] isEqual:[self._txtcity GetSelectedItem:(int) (0)]]) { 
 //BA.debugLineNum = 760;BA.debugLine="data.Put(\"zone_id\",m2.Get(\"zone_id\"))";
[_data Put:(NSObject*)(@"zone_id") :[_m2 Get:(NSObject*)(@"zone_id")]];
 //BA.debugLineNum = 761;BA.debugLine="data.Put(\"country_id\",m2.Get(\"country_id\"))";
[_data Put:(NSObject*)(@"country_id") :[_m2 Get:(NSObject*)(@"country_id")]];
 //BA.debugLineNum = 762;BA.debugLine="Exit";
if (true) break;
 };
 }
};
 //BA.debugLineNum = 767;BA.debugLine="data.Put(\"firstname\",txtname.Text)";
[_data Put:(NSObject*)(@"firstname") :(NSObject*)([self._txtname Text])];
 //BA.debugLineNum = 768;BA.debugLine="data.Put(\"lastname\",txtfamily.Text)";
[_data Put:(NSObject*)(@"lastname") :(NSObject*)([self._txtfamily Text])];
 //BA.debugLineNum = 769;BA.debugLine="data.Put(\"address_1\",txtaddress.Text)";
[_data Put:(NSObject*)(@"address_1") :(NSObject*)([self._txtaddress Text])];
 //BA.debugLineNum = 770;BA.debugLine="data.Put(\"postcode\",txtpostal_enter.Text)";
[_data Put:(NSObject*)(@"postcode") :(NSObject*)([self._txtpostal_enter Text])];
 //BA.debugLineNum = 772;BA.debugLine="lblpb.Text = Library.GetStringResourse(\"apply\")";
[self._lblpb setText:[self._library _getstringresourse:@"apply"]];
 //BA.debugLineNum = 773;BA.debugLine="pnlloading.Visible = True";
[self._pnlloading setVisible:[self.__c True]];
 //BA.debugLineNum = 775;BA.debugLine="Dim op1 As OpenCart";
_op1 = [b4i_opencart new];
 //BA.debugLineNum = 776;BA.debugLine="op1.Initialize";
[_op1 _initialize:self.bi];
 //BA.debugLineNum = 778;BA.debugLine="If btnadd.Text = Library.GetStringResourse(\"edit\"";
if ([[self._btnadd Text] isEqual:[self._library _getstringresourse:@"edit"]]) { 
 //BA.debugLineNum = 779;BA.debugLine="op1.EditAddressUser(Me,\"editAddress_receive\",dat";
[_op1 _editaddressuser:self :@"editAddress_receive" :_data :[self.bi NumberToString:@(self._choosenaddress4edit)]];
 }else {
 //BA.debugLineNum = 781;BA.debugLine="op1.AddAddressUser(Me,\"addAddress_receive\",data)";
[_op1 _addaddressuser:self :@"addAddress_receive" :_data];
 };
 //BA.debugLineNum = 784;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _btnaddress_click{
b4i_opencart* _opaddress = nil;
 //BA.debugLineNum = 950;BA.debugLine="Sub btnaddress_Click";
 //BA.debugLineNum = 952;BA.debugLine="HideMainpanelSV";
[self _hidemainpanelsv];
 //BA.debugLineNum = 953;BA.debugLine="svAddress.Visible = True";
[self._svaddress setVisible:[self.__c True]];
 //BA.debugLineNum = 955;BA.debugLine="If svAddress.Panel.NumberOfViews = 0  Then";
if ([[self._svaddress Panel] NumberOfViews]==0) { 
 //BA.debugLineNum = 956;BA.debugLine="pnlloading.Visible = True";
[self._pnlloading setVisible:[self.__c True]];
 //BA.debugLineNum = 957;BA.debugLine="Dim opAddress As OpenCart";
_opaddress = [b4i_opencart new];
 //BA.debugLineNum = 958;BA.debugLine="opAddress.Initialize";
[_opaddress _initialize:self.bi];
 //BA.debugLineNum = 959;BA.debugLine="opAddress.ListAddressUser(Me,\"ListAddress_receiv";
[_opaddress _listaddressuser:self :@"ListAddress_receive"];
 };
 //BA.debugLineNum = 962;BA.debugLine="DefaultButtonMenuColor";
[self _defaultbuttonmenucolor];
 //BA.debugLineNum = 963;BA.debugLine="btnaddress.CustomLabel.TextColor = Colors.RGB(244";
[[self._btnaddress CustomLabel] setTextColor:[[self.__c Colors] RGB:(int) (244) :(int) (255) :(int) (0)]];
 //BA.debugLineNum = 965;BA.debugLine="btnback_menu_Click";
[self _btnback_menu_click];
 //BA.debugLineNum = 967;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _btnapply_newsletter_click{
b4i_opencart* _op1 = nil;
 //BA.debugLineNum = 1234;BA.debugLine="Sub btnapply_newsletter_Click";
 //BA.debugLineNum = 1236;BA.debugLine="lblpb.Text = Library.GetStringResourse(\"apply\")";
[self._lblpb setText:[self._library _getstringresourse:@"apply"]];
 //BA.debugLineNum = 1237;BA.debugLine="pnlloading.Visible = True";
[self._pnlloading setVisible:[self.__c True]];
 //BA.debugLineNum = 1239;BA.debugLine="Dim op1 As OpenCart";
_op1 = [b4i_opencart new];
 //BA.debugLineNum = 1240;BA.debugLine="op1.Initialize";
[_op1 _initialize:self.bi];
 //BA.debugLineNum = 1242;BA.debugLine="If rbyes.Value Then";
if ([self._rbyes Value]) { 
 //BA.debugLineNum = 1243;BA.debugLine="SubscribeState = \"1\"";
self._subscribestate = @"1";
 //BA.debugLineNum = 1244;BA.debugLine="op1.SubScribe(Me,\"subsribe_receive\",True)";
[_op1 _subscribe:self :@"subsribe_receive" :[self.__c True]];
 }else {
 //BA.debugLineNum = 1246;BA.debugLine="SubscribeState = \"0\"";
self._subscribestate = @"0";
 //BA.debugLineNum = 1247;BA.debugLine="op1.SubScribe(Me,\"subsribe_receive\",False)";
[_op1 _subscribe:self :@"subsribe_receive" :[self.__c False]];
 };
 //BA.debugLineNum = 1250;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _btnback_menu_click{
 //BA.debugLineNum = 1319;BA.debugLine="Sub btnback_menu_Click";
 //BA.debugLineNum = 1320;BA.debugLine="pnlaction.SetLayoutAnimated(600,1,0,Library.GetHe";
[self._pnlaction SetLayoutAnimated:(int) (600) :(float) (1) :(float) (0) :(float) ([self._library _getheight]+[self._pnlaction Height]) :[self._pnlaction Width] :[self._pnlaction Height]];
 //BA.debugLineNum = 1321;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _btncancel_new_address_click{
 //BA.debugLineNum = 843;BA.debugLine="Sub btncancel_new_address_Click";
 //BA.debugLineNum = 844;BA.debugLine="ChoosenAddress4Edit = 0";
self._choosenaddress4edit = (int) (0);
 //BA.debugLineNum = 845;BA.debugLine="btnprofile_Click";
[self _btnprofile_click];
 //BA.debugLineNum = 846;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _btncancel_return_click{
 //BA.debugLineNum = 1331;BA.debugLine="Sub btncancel_return_Click";
 //BA.debugLineNum = 1332;BA.debugLine="sv_return_details.Panel.RemoveAllViews";
[[self._sv_return_details Panel] RemoveAllViews];
 //BA.debugLineNum = 1333;BA.debugLine="pnldetails_return.Visible = False";
[self._pnldetails_return setVisible:[self.__c False]];
 //BA.debugLineNum = 1334;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _btnclose_click{
 //BA.debugLineNum = 640;BA.debugLine="Sub btnclose_Click";
 //BA.debugLineNum = 642;BA.debugLine="If pnldetails_return.Visible = True Then";
if ([self._pnldetails_return Visible]==[self.__c True]) { 
 //BA.debugLineNum = 643;BA.debugLine="pnldetails_return.Visible = False";
[self._pnldetails_return setVisible:[self.__c False]];
 //BA.debugLineNum = 644;BA.debugLine="Return";
if (true) return @"";
 };
 //BA.debugLineNum = 647;BA.debugLine="Library.NavControl.ShowPage(Library.MenuPage)";
[self._library._navcontrol ShowPage:(UIViewController*)((self._library._menupage).object)];
 //BA.debugLineNum = 649;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _btndefault_address_click{
 //BA.debugLineNum = 1311;BA.debugLine="Sub btndefault_address_Click";
 //BA.debugLineNum = 1313;BA.debugLine="btnback_menu_Click";
[self _btnback_menu_click];
 //BA.debugLineNum = 1314;BA.debugLine="Library.ChoosenAddress = ChoosenAddressID";
self._library._choosenaddress = [self.bi ObjectToNumber:self._choosenaddressid].intValue;
 //BA.debugLineNum = 1315;BA.debugLine="toast.ShowToastMessageShow(Library.GetStringResou";
[self._toast _showtoastmessageshow:[self._library _getstringresourse:@"choosen_address"] :(long long) (2) :[self.__c True]];
 //BA.debugLineNum = 1317;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _btndelete_address_click{
b4i_opencart* _opdeleteaddr = nil;
 //BA.debugLineNum = 1252;BA.debugLine="Sub btndelete_address_Click";
 //BA.debugLineNum = 1254;BA.debugLine="pnlloading.Visible = True";
[self._pnlloading setVisible:[self.__c True]];
 //BA.debugLineNum = 1255;BA.debugLine="btnback_menu_Click";
[self _btnback_menu_click];
 //BA.debugLineNum = 1257;BA.debugLine="Dim opDeleteAddr As OpenCart";
_opdeleteaddr = [b4i_opencart new];
 //BA.debugLineNum = 1258;BA.debugLine="opDeleteAddr.Initialize";
[_opdeleteaddr _initialize:self.bi];
 //BA.debugLineNum = 1259;BA.debugLine="opDeleteAddr.DeleteAddressUser(Me,\"DeleteAddress_";
[_opdeleteaddr _deleteaddressuser:self :@"DeleteAddress_receive" :self._choosenaddressid];
 //BA.debugLineNum = 1261;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _btndetails_click{
B4IButtonWrapper* _b1 = nil;
NSString* _id1 = @"";
b4i_opencart* _opdetails = nil;
 //BA.debugLineNum = 848;BA.debugLine="Sub btndetails_Click";
 //BA.debugLineNum = 850;BA.debugLine="Dim b1 As Button";
_b1 = [B4IButtonWrapper new];
 //BA.debugLineNum = 851;BA.debugLine="b1 = Sender";
_b1.object = (UIButton*)([self.__c Sender:self.bi]);
 //BA.debugLineNum = 853;BA.debugLine="Dim id1 As String";
_id1 = @"";
 //BA.debugLineNum = 854;BA.debugLine="id1 = b1.Tag";
_id1 = [self.bi ObjectToString:[_b1 Tag]];
 //BA.debugLineNum = 856;BA.debugLine="pnlloading.Visible = True";
[self._pnlloading setVisible:[self.__c True]];
 //BA.debugLineNum = 858;BA.debugLine="Dim opDetails As OpenCart";
_opdetails = [b4i_opencart new];
 //BA.debugLineNum = 859;BA.debugLine="opDetails.Initialize";
[_opdetails _initialize:self.bi];
 //BA.debugLineNum = 860;BA.debugLine="opDetails.GetOrders(Me,\"DetailsOrder_receive\",id1";
[_opdetails _getorders:self :@"DetailsOrder_receive" :_id1];
 //BA.debugLineNum = 862;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _btnedit_address_click{
NSString* _vs = @"";
B4IMap* _temp = nil;
int _k = 0;
b4i_opencart* _opcity = nil;
 //BA.debugLineNum = 1263;BA.debugLine="Sub btnedit_address_Click";
 //BA.debugLineNum = 1265;BA.debugLine="HideMainpanelSV";
[self _hidemainpanelsv];
 //BA.debugLineNum = 1266;BA.debugLine="btnback_menu_Click";
[self _btnback_menu_click];
 //BA.debugLineNum = 1268;BA.debugLine="For Each vs As String In listAddressCache.Keys";
{
const id<B4IIterable> group3 = [self._listaddresscache Keys];
const int groupLen3 = group3.Size
;int index3 = 0;
;
for (; index3 < groupLen3;index3++){
_vs = [self.bi ObjectToString:[group3 Get:index3]];
 //BA.debugLineNum = 1270;BA.debugLine="Dim temp As Map";
_temp = [B4IMap new];
 //BA.debugLineNum = 1271;BA.debugLine="temp = listAddressCache.Get(vs)";
_temp = (B4IMap*)([self._listaddresscache Get:(NSObject*)(_vs)]);
 //BA.debugLineNum = 1273;BA.debugLine="If ChoosenAddressValue = $\"${temp.Get(\"country\"";
if ([self._choosenaddressvalue isEqual:([@[@"",[self.__c SmartStringFormatter:@"" :[_temp Get:(NSObject*)(@"country")]],@" ",[self.__c SmartStringFormatter:@"" :[_temp Get:(NSObject*)(@"city")]],@" ",[self.__c SmartStringFormatter:@"" :[_temp Get:(NSObject*)(@"address_1")]],@""] componentsJoinedByString:@""])]) { 
 //BA.debugLineNum = 1275;BA.debugLine="txtaddress.Text = temp.Get(\"address_1\")";
[self._txtaddress setText:[self.bi ObjectToString:[_temp Get:(NSObject*)(@"address_1")]]];
 //BA.debugLineNum = 1276;BA.debugLine="txtpostal_enter.Text = temp.Get(\"postcode\")";
[self._txtpostal_enter setText:[self.bi ObjectToString:[_temp Get:(NSObject*)(@"postcode")]]];
 //BA.debugLineNum = 1277;BA.debugLine="choosenCity = temp.Get(\"city\")";
self._choosencity = [self.bi ObjectToString:[_temp Get:(NSObject*)(@"city")]];
 //BA.debugLineNum = 1278;BA.debugLine="btnadd.Text = Library.GetStringResourse(\"edit\"";
[self._btnadd setText:[self._library _getstringresourse:@"edit"]];
 //BA.debugLineNum = 1280;BA.debugLine="For k = 0 To txtcountry.GetItems(0).Size - 1";
{
const int step11 = 1;
const int limit11 = (int) ([[self._txtcountry GetItems:(int) (0)] Size]-1);
_k = (int) (0) ;
for (;(step11 > 0 && _k <= limit11) || (step11 < 0 && _k >= limit11) ;_k = ((int)(0 + _k + step11))  ) {
 //BA.debugLineNum = 1282;BA.debugLine="If txtcountry.GetItems(0).Get(k) = temp.Get(\"";
if ([[[self._txtcountry GetItems:(int) (0)] Get:_k] isEqual:[_temp Get:(NSObject*)(@"country")]]) { 
 //BA.debugLineNum = 1284;BA.debugLine="ChoosenAddress4Edit = vs";
self._choosenaddress4edit = [self.bi ObjectToNumber:_vs].intValue;
 //BA.debugLineNum = 1286;BA.debugLine="txtcountry.SelectRow(0,k,True)";
[self._txtcountry SelectRow:(int) (0) :_k :[self.__c True]];
 //BA.debugLineNum = 1288;BA.debugLine="Dim opCity As OpenCart";
_opcity = [b4i_opencart new];
 //BA.debugLineNum = 1289;BA.debugLine="opCity.Initialize";
[_opcity _initialize:self.bi];
 //BA.debugLineNum = 1290;BA.debugLine="opCity.GetCity(Me,\"city_receive\",temp.Get(\"c";
[_opcity _getcity:self :@"city_receive" :[self.bi ObjectToString:[_temp Get:(NSObject*)(@"country_id")]]];
 //BA.debugLineNum = 1292;BA.debugLine="Exit";
if (true) break;
 };
 }
};
 //BA.debugLineNum = 1298;BA.debugLine="Library.GetButtonState(btnadd)";
[self._library _getbuttonstate:self._btnadd];
 //BA.debugLineNum = 1299;BA.debugLine="Library.GetButtonState(btncancel_new_address)";
[self._library _getbuttonstate:self._btncancel_new_address];
 //BA.debugLineNum = 1300;BA.debugLine="HideMainpanelSV";
[self _hidemainpanelsv];
 //BA.debugLineNum = 1301;BA.debugLine="svadd_address.Visible = True";
[self._svadd_address setVisible:[self.__c True]];
 //BA.debugLineNum = 1303;BA.debugLine="Return";
if (true) return @"";
 };
 }
};
 //BA.debugLineNum = 1309;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _btnorders_click{
b4i_opencart* _oporder = nil;
 //BA.debugLineNum = 931;BA.debugLine="Sub btnorders_Click";
 //BA.debugLineNum = 933;BA.debugLine="HideMainpanelSV";
[self _hidemainpanelsv];
 //BA.debugLineNum = 934;BA.debugLine="svOrders.Visible = True";
[self._svorders setVisible:[self.__c True]];
 //BA.debugLineNum = 936;BA.debugLine="If svOrders.Panel.NumberOfViews = 0 Then";
if ([[self._svorders Panel] NumberOfViews]==0) { 
 //BA.debugLineNum = 937;BA.debugLine="pnlloading.Visible = True";
[self._pnlloading setVisible:[self.__c True]];
 //BA.debugLineNum = 938;BA.debugLine="Dim opOrder As OpenCart";
_oporder = [b4i_opencart new];
 //BA.debugLineNum = 939;BA.debugLine="opOrder.Initialize";
[_oporder _initialize:self.bi];
 //BA.debugLineNum = 940;BA.debugLine="opOrder.GetOrders(Me,\"Orders_receive\",\"\")";
[_oporder _getorders:self :@"Orders_receive" :@""];
 };
 //BA.debugLineNum = 943;BA.debugLine="DefaultButtonMenuColor";
[self _defaultbuttonmenucolor];
 //BA.debugLineNum = 944;BA.debugLine="btnorders.CustomLabel.TextColor = Colors.RGB(244,";
[[self._btnorders CustomLabel] setTextColor:[[self.__c Colors] RGB:(int) (244) :(int) (255) :(int) (0)]];
 //BA.debugLineNum = 946;BA.debugLine="btnback_menu_Click";
[self _btnback_menu_click];
 //BA.debugLineNum = 948;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _btnpassword_click{
b4i_opencart* _op1 = nil;
 //BA.debugLineNum = 695;BA.debugLine="Sub btnpassword_Click";
 //BA.debugLineNum = 697;BA.debugLine="If txtpassword.Text.Length < 5 Then";
if ([[self._txtpassword Text] Length]<5) { 
 //BA.debugLineNum = 698;BA.debugLine="toast.ShowToastMessageShow(Library.GetStringReso";
[self._toast _showtoastmessageshow:[self._library _getstringresourse:@"error_password"] :(long long) (2) :[self.__c False]];
 //BA.debugLineNum = 699;BA.debugLine="Return";
if (true) return @"";
 };
 //BA.debugLineNum = 702;BA.debugLine="If txtpassword.Text <> txtpassword2.Text Then";
if ([[self._txtpassword Text] isEqual:[self._txtpassword2 Text]] == false) { 
 //BA.debugLineNum = 703;BA.debugLine="toast.ShowToastMessageShow(Library.GetStringReso";
[self._toast _showtoastmessageshow:[self._library _getstringresourse:@"error_password2"] :(long long) (2) :[self.__c False]];
 //BA.debugLineNum = 704;BA.debugLine="Return";
if (true) return @"";
 };
 //BA.debugLineNum = 707;BA.debugLine="lblpb.Text = Library.GetStringResourse(\"apply\")";
[self._lblpb setText:[self._library _getstringresourse:@"apply"]];
 //BA.debugLineNum = 708;BA.debugLine="pnlloading.Visible = True";
[self._pnlloading setVisible:[self.__c True]];
 //BA.debugLineNum = 710;BA.debugLine="Dim op1 As OpenCart";
_op1 = [b4i_opencart new];
 //BA.debugLineNum = 711;BA.debugLine="op1.Initialize";
[_op1 _initialize:self.bi];
 //BA.debugLineNum = 712;BA.debugLine="op1.UpdatePasswordUser(Me,\"changepassword_receive";
[_op1 _updatepassworduser:self :@"changepassword_receive" :[self._txtpassword Text]];
 //BA.debugLineNum = 714;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _btnpasswords_click{
 //BA.debugLineNum = 923;BA.debugLine="Sub btnpasswords_Click";
 //BA.debugLineNum = 924;BA.debugLine="HideMainpanelSV";
[self _hidemainpanelsv];
 //BA.debugLineNum = 925;BA.debugLine="svPassword.Visible = True";
[self._svpassword setVisible:[self.__c True]];
 //BA.debugLineNum = 926;BA.debugLine="DefaultButtonMenuColor";
[self _defaultbuttonmenucolor];
 //BA.debugLineNum = 927;BA.debugLine="btnpasswords.CustomLabel.TextColor = Colors.RGB(2";
[[self._btnpasswords CustomLabel] setTextColor:[[self.__c Colors] RGB:(int) (244) :(int) (255) :(int) (0)]];
 //BA.debugLineNum = 928;BA.debugLine="btnback_menu_Click";
[self _btnback_menu_click];
 //BA.debugLineNum = 929;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _btnprofile_click{
 //BA.debugLineNum = 915;BA.debugLine="Sub btnprofile_Click";
 //BA.debugLineNum = 916;BA.debugLine="HideMainpanelSV";
[self _hidemainpanelsv];
 //BA.debugLineNum = 917;BA.debugLine="svParent.Visible = True";
[self._svparent setVisible:[self.__c True]];
 //BA.debugLineNum = 918;BA.debugLine="DefaultButtonMenuColor";
[self _defaultbuttonmenucolor];
 //BA.debugLineNum = 919;BA.debugLine="btnprofile.CustomLabel.TextColor = Colors.RGB(244";
[[self._btnprofile CustomLabel] setTextColor:[[self.__c Colors] RGB:(int) (244) :(int) (255) :(int) (0)]];
 //BA.debugLineNum = 920;BA.debugLine="btnback_menu_Click";
[self _btnback_menu_click];
 //BA.debugLineNum = 921;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _btnreturn_details_click{
B4IButtonWrapper* _bu = nil;
b4i_opencart* _op1 = nil;
 //BA.debugLineNum = 1095;BA.debugLine="Sub btnreturn_details_Click";
 //BA.debugLineNum = 1097;BA.debugLine="Dim bu As Button";
_bu = [B4IButtonWrapper new];
 //BA.debugLineNum = 1098;BA.debugLine="bu = Sender";
_bu.object = (UIButton*)([self.__c Sender:self.bi]);
 //BA.debugLineNum = 1100;BA.debugLine="pnlloading.Visible = True";
[self._pnlloading setVisible:[self.__c True]];
 //BA.debugLineNum = 1102;BA.debugLine="Dim op1 As OpenCart";
_op1 = [b4i_opencart new];
 //BA.debugLineNum = 1103;BA.debugLine="op1.Initialize";
[_op1 _initialize:self.bi];
 //BA.debugLineNum = 1104;BA.debugLine="op1.GetReturns(Me,\"returndetails_receive\",bu.Tag)";
[_op1 _getreturns:self :@"returndetails_receive" :[self.bi ObjectToString:[_bu Tag]]];
 //BA.debugLineNum = 1106;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _btnreturns_click{
b4i_opencart* _op = nil;
 //BA.debugLineNum = 1010;BA.debugLine="Sub btnreturns_Click";
 //BA.debugLineNum = 1012;BA.debugLine="HideMainpanelSV";
[self _hidemainpanelsv];
 //BA.debugLineNum = 1013;BA.debugLine="svReturns.Visible = True";
[self._svreturns setVisible:[self.__c True]];
 //BA.debugLineNum = 1015;BA.debugLine="DefaultButtonMenuColor";
[self _defaultbuttonmenucolor];
 //BA.debugLineNum = 1016;BA.debugLine="btnreturns.CustomLabel.TextColor = Colors.RGB(244";
[[self._btnreturns CustomLabel] setTextColor:[[self.__c Colors] RGB:(int) (244) :(int) (255) :(int) (0)]];
 //BA.debugLineNum = 1018;BA.debugLine="If svReturns.Panel.NumberOfViews = 0 Then";
if ([[self._svreturns Panel] NumberOfViews]==0) { 
 //BA.debugLineNum = 1019;BA.debugLine="lblpb.Text = Library.GetStringResourse(\"loading\"";
[self._lblpb setText:[self._library _getstringresourse:@"loading"]];
 //BA.debugLineNum = 1020;BA.debugLine="pnlloading.Visible = True";
[self._pnlloading setVisible:[self.__c True]];
 //BA.debugLineNum = 1022;BA.debugLine="Dim op As OpenCart";
_op = [b4i_opencart new];
 //BA.debugLineNum = 1023;BA.debugLine="op.Initialize";
[_op _initialize:self.bi];
 //BA.debugLineNum = 1024;BA.debugLine="op.GetReturns(Me,\"returns_receive\",\"\")";
[_op _getreturns:self :@"returns_receive" :@""];
 };
 //BA.debugLineNum = 1027;BA.debugLine="btnback_menu_Click";
[self _btnback_menu_click];
 //BA.debugLineNum = 1029;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _btnsave_click{
B4IMap* _data = nil;
b4i_opencart* _op1 = nil;
 //BA.debugLineNum = 651;BA.debugLine="Sub btnsave_Click";
 //BA.debugLineNum = 653;BA.debugLine="If txtname.Text.Length < 2 Or txtfamily.Text.Leng";
if ([[self._txtname Text] Length]<2 || [[self._txtfamily Text] Length]<3) { 
 //BA.debugLineNum = 654;BA.debugLine="toast.ShowToastMessageShow(Library.GetStringReso";
[self._toast _showtoastmessageshow:[self._library _getstringresourse:@"error_name"] :(long long) (2) :[self.__c False]];
 //BA.debugLineNum = 655;BA.debugLine="Return";
if (true) return @"";
 };
 //BA.debugLineNum = 658;BA.debugLine="If txtphone.Text.Length <> 11 Then";
if ([[self._txtphone Text] Length]!=11) { 
 //BA.debugLineNum = 659;BA.debugLine="toast.ShowToastMessageShow(Library.GetStringReso";
[self._toast _showtoastmessageshow:[self._library _getstringresourse:@"error_phone"] :(long long) (2) :[self.__c False]];
 //BA.debugLineNum = 661;BA.debugLine="Return";
if (true) return @"";
 };
 //BA.debugLineNum = 664;BA.debugLine="Dim data As Map";
_data = [B4IMap new];
 //BA.debugLineNum = 665;BA.debugLine="data.Initialize";
[_data Initialize];
 //BA.debugLineNum = 666;BA.debugLine="data.Put(\"email\",txtemail.Text)";
[_data Put:(NSObject*)(@"email") :(NSObject*)([self._txtemail Text])];
 //BA.debugLineNum = 667;BA.debugLine="data.Put(\"firstname\",txtname.Text)";
[_data Put:(NSObject*)(@"firstname") :(NSObject*)([self._txtname Text])];
 //BA.debugLineNum = 668;BA.debugLine="data.Put(\"lastname\",txtfamily.Text)";
[_data Put:(NSObject*)(@"lastname") :(NSObject*)([self._txtfamily Text])];
 //BA.debugLineNum = 669;BA.debugLine="data.Put(\"telephone\",txtphone.Text)";
[_data Put:(NSObject*)(@"telephone") :(NSObject*)([self._txtphone Text])];
 //BA.debugLineNum = 670;BA.debugLine="data.Put(\"fax\",txtfax.Text)";
[_data Put:(NSObject*)(@"fax") :(NSObject*)([self._txtfax Text])];
 //BA.debugLineNum = 672;BA.debugLine="lblpb.Text = Library.GetStringResourse(\"apply\")";
[self._lblpb setText:[self._library _getstringresourse:@"apply"]];
 //BA.debugLineNum = 673;BA.debugLine="pnlloading.Visible = True";
[self._pnlloading setVisible:[self.__c True]];
 //BA.debugLineNum = 675;BA.debugLine="Dim op1 As OpenCart";
_op1 = [b4i_opencart new];
 //BA.debugLineNum = 676;BA.debugLine="op1.Initialize";
[_op1 _initialize:self.bi];
 //BA.debugLineNum = 677;BA.debugLine="op1.UpdateUserDetails(Me,\"updatedetails_receive\",";
[_op1 _updateuserdetails:self :@"updatedetails_receive" :_data];
 //BA.debugLineNum = 679;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _btnscribe_click{
 //BA.debugLineNum = 969;BA.debugLine="Sub btnscribe_Click";
 //BA.debugLineNum = 971;BA.debugLine="HideMainpanelSV";
[self _hidemainpanelsv];
 //BA.debugLineNum = 973;BA.debugLine="svParent.Visible = False";
[self._svparent setVisible:[self.__c False]];
 //BA.debugLineNum = 974;BA.debugLine="svNewsletter.Visible = True";
[self._svnewsletter setVisible:[self.__c True]];
 //BA.debugLineNum = 975;BA.debugLine="DefaultButtonMenuColor";
[self _defaultbuttonmenucolor];
 //BA.debugLineNum = 976;BA.debugLine="btnscribe.CustomLabel.TextColor = Colors.RGB(244,";
[[self._btnscribe CustomLabel] setTextColor:[[self.__c Colors] RGB:(int) (244) :(int) (255) :(int) (0)]];
 //BA.debugLineNum = 978;BA.debugLine="btnback_menu_Click";
[self _btnback_menu_click];
 //BA.debugLineNum = 980;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _changepassword_receive:(B4IMap*) _res :(NSString*) _cat{
 //BA.debugLineNum = 716;BA.debugLine="Sub changepassword_receive(res As Map,cat As Strin";
 //BA.debugLineNum = 718;BA.debugLine="Library.HUD.ProgressDialogHide";
[self._library._hud ProgressDialogHide];
 //BA.debugLineNum = 719;BA.debugLine="pnlloading.Visible = False";
[self._pnlloading setVisible:[self.__c False]];
 //BA.debugLineNum = 721;BA.debugLine="If res.ContainsKey(\"success\") Then";
if ([_res ContainsKey:(NSObject*)(@"success")]) { 
 //BA.debugLineNum = 722;BA.debugLine="If res.Get(\"success\") = 1 Then";
if ([[_res Get:(NSObject*)(@"success")] isEqual:(NSObject*)(@(1))]) { 
 //BA.debugLineNum = 723;BA.debugLine="toast.ShowToastMessageShow(Library.GetStringRes";
[self._toast _showtoastmessageshow:[self._library _getstringresourse:@"success_save_details"] :(long long) (2) :[self.__c True]];
 //BA.debugLineNum = 724;BA.debugLine="txtpassword.Text = \"\"";
[self._txtpassword setText:@""];
 //BA.debugLineNum = 725;BA.debugLine="txtpassword2.Text = \"\"";
[self._txtpassword2 setText:@""];
 //BA.debugLineNum = 726;BA.debugLine="Return";
if (true) return @"";
 };
 };
 //BA.debugLineNum = 730;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _changeviewsetting{
B4IViewWrapper* _v1 = nil;
B4ITextFieldWrapper* _t1 = nil;
B4ILabelWrapper* _l1 = nil;
B4IViewWrapper* _v2 = nil;
B4IButtonWrapper* _t2 = nil;
 //BA.debugLineNum = 234;BA.debugLine="Sub ChangeViewSetting";
 //BA.debugLineNum = 236;BA.debugLine="For Each v1 As View In svadd_address.Panel.GetAll";
_v1 = [B4IViewWrapper new];
{
const id<B4IIterable> group1 = [[self._svadd_address Panel] GetAllViewsRecursive];
const int groupLen1 = group1.Size
;int index1 = 0;
;
for (; index1 < groupLen1;index1++){
_v1.object = (UIView*)([group1 Get:index1]);
 //BA.debugLineNum = 238;BA.debugLine="If v1 Is TextField Then";
if ([_v1.objectOrNull isKindOfClass: [UITextField class]]) { 
 //BA.debugLineNum = 239;BA.debugLine="Dim t1 As TextField";
_t1 = [B4ITextFieldWrapper new];
 //BA.debugLineNum = 240;BA.debugLine="t1 = v1";
_t1.object = (UITextField*)((_v1).object);
 //BA.debugLineNum = 241;BA.debugLine="t1.TextAlignment = Library.GetStringResourse(\"d";
[_t1 setTextAlignment:[self.bi ObjectToNumber:[self._library _getstringresourse:@"direction_ios"]].intValue];
 };
 //BA.debugLineNum = 244;BA.debugLine="If v1 Is Label Then";
if ([_v1.objectOrNull isKindOfClass: [UILabel class]]) { 
 //BA.debugLineNum = 245;BA.debugLine="Dim l1 As Label";
_l1 = [B4ILabelWrapper new];
 //BA.debugLineNum = 246;BA.debugLine="l1 = v1";
_l1.object = (UILabel*)((_v1).object);
 //BA.debugLineNum = 247;BA.debugLine="l1.Font = Library.GetFont(l1.Font.Size)";
[_l1 setFont:[self._library _getfont:(int) ([[_l1 Font] Size])]];
 //BA.debugLineNum = 248;BA.debugLine="l1.TextAlignment = Library.GetStringResourse(\"d";
[_l1 setTextAlignment:[self.bi ObjectToNumber:[self._library _getstringresourse:@"direction_ios"]].intValue];
 };
 }
};
 //BA.debugLineNum = 253;BA.debugLine="For Each v1 As View In svParent.Panel.GetAllViews";
_v1 = [B4IViewWrapper new];
{
const id<B4IIterable> group14 = [[self._svparent Panel] GetAllViewsRecursive];
const int groupLen14 = group14.Size
;int index14 = 0;
;
for (; index14 < groupLen14;index14++){
_v1.object = (UIView*)([group14 Get:index14]);
 //BA.debugLineNum = 255;BA.debugLine="If v1 Is Button Then Continue";
if ([_v1.objectOrNull isKindOfClass: [UIButton class]]) { 
if (true) continue;};
 //BA.debugLineNum = 257;BA.debugLine="If v1 Is TextField Then";
if ([_v1.objectOrNull isKindOfClass: [UITextField class]]) { 
 //BA.debugLineNum = 258;BA.debugLine="Dim t1 As TextField";
_t1 = [B4ITextFieldWrapper new];
 //BA.debugLineNum = 259;BA.debugLine="t1 = v1";
_t1.object = (UITextField*)((_v1).object);
 //BA.debugLineNum = 260;BA.debugLine="t1.Color = Library.ConvertHex2Int(Library.GetSt";
[_t1 setColor:[self.bi ObjectToNumber:[self._library _converthex2int:[self._library _getstringresourse:@"textbox_color"]]].intValue];
 //BA.debugLineNum = 261;BA.debugLine="t1.TextAlignment = Library.GetStringResourse(\"d";
[_t1 setTextAlignment:[self.bi ObjectToNumber:[self._library _getstringresourse:@"direction_ios"]].intValue];
 };
 //BA.debugLineNum = 264;BA.debugLine="If v1 Is Label Then";
if ([_v1.objectOrNull isKindOfClass: [UILabel class]]) { 
 //BA.debugLineNum = 265;BA.debugLine="Dim l1 As Label";
_l1 = [B4ILabelWrapper new];
 //BA.debugLineNum = 266;BA.debugLine="l1 = v1";
_l1.object = (UILabel*)((_v1).object);
 //BA.debugLineNum = 267;BA.debugLine="l1.Font = Library.GetFont(l1.Font.Size)";
[_l1 setFont:[self._library _getfont:(int) ([[_l1 Font] Size])]];
 //BA.debugLineNum = 268;BA.debugLine="l1.TextAlignment = Library.GetStringResourse(\"d";
[_l1 setTextAlignment:[self.bi ObjectToNumber:[self._library _getstringresourse:@"direction_ios"]].intValue];
 };
 }
};
 //BA.debugLineNum = 273;BA.debugLine="For Each v2 As View In svPassword.Panel.GetAllVie";
_v2 = [B4IViewWrapper new];
{
const id<B4IIterable> group29 = [[self._svpassword Panel] GetAllViewsRecursive];
const int groupLen29 = group29.Size
;int index29 = 0;
;
for (; index29 < groupLen29;index29++){
_v2.object = (UIView*)([group29 Get:index29]);
 //BA.debugLineNum = 275;BA.debugLine="If v2 Is Button Then";
if ([_v2.objectOrNull isKindOfClass: [UIButton class]]) { 
 //BA.debugLineNum = 276;BA.debugLine="Dim t2 As Button";
_t2 = [B4IButtonWrapper new];
 //BA.debugLineNum = 277;BA.debugLine="t2 = v2";
_t2.object = (UIButton*)((_v2).object);
 //BA.debugLineNum = 278;BA.debugLine="t2.CustomLabel.Font = Library.GetFont(14)";
[[_t2 CustomLabel] setFont:[self._library _getfont:(int) (14)]];
 };
 //BA.debugLineNum = 281;BA.debugLine="If v2 Is Label Then";
if ([_v2.objectOrNull isKindOfClass: [UILabel class]]) { 
 //BA.debugLineNum = 282;BA.debugLine="Dim l1 As Label";
_l1 = [B4ILabelWrapper new];
 //BA.debugLineNum = 283;BA.debugLine="l1 = v2";
_l1.object = (UILabel*)((_v2).object);
 //BA.debugLineNum = 284;BA.debugLine="l1.Font = Library.GetFont(l1.Font.Size)";
[_l1 setFont:[self._library _getfont:(int) ([[_l1 Font] Size])]];
 };
 }
};
 //BA.debugLineNum = 289;BA.debugLine="For Each v2 As View In pnlaction_address.GetAllVi";
_v2 = [B4IViewWrapper new];
{
const id<B4IIterable> group41 = [self._pnlaction_address GetAllViewsRecursive];
const int groupLen41 = group41.Size
;int index41 = 0;
;
for (; index41 < groupLen41;index41++){
_v2.object = (UIView*)([group41 Get:index41]);
 //BA.debugLineNum = 291;BA.debugLine="If v2 Is Button Then";
if ([_v2.objectOrNull isKindOfClass: [UIButton class]]) { 
 //BA.debugLineNum = 292;BA.debugLine="Dim t2 As Button";
_t2 = [B4IButtonWrapper new];
 //BA.debugLineNum = 293;BA.debugLine="t2 = v2";
_t2.object = (UIButton*)((_v2).object);
 //BA.debugLineNum = 294;BA.debugLine="Library.SetFont(t2.CustomLabel,\"icomoon\",t2.Cus";
[self._library _setfont:(B4IViewWrapper*) [B4IObjectWrapper createWrapper:[B4IViewWrapper new] object:(UIView*)(([_t2 CustomLabel]).object)] :@"icomoon" :(int) ([[[_t2 CustomLabel] Font] Size])];
 };
 //BA.debugLineNum = 297;BA.debugLine="If v2 Is Label Then";
if ([_v2.objectOrNull isKindOfClass: [UILabel class]]) { 
 //BA.debugLineNum = 298;BA.debugLine="Dim l1 As Label";
_l1 = [B4ILabelWrapper new];
 //BA.debugLineNum = 299;BA.debugLine="l1 = v2";
_l1.object = (UILabel*)((_v2).object);
 //BA.debugLineNum = 300;BA.debugLine="l1.Font = Library.GetFont(l1.Font.Size)";
[_l1 setFont:[self._library _getfont:(int) ([[_l1 Font] Size])]];
 };
 }
};
 //BA.debugLineNum = 305;BA.debugLine="For Each v2 As View In svadd_address.Panel.GetAll";
_v2 = [B4IViewWrapper new];
{
const id<B4IIterable> group53 = [[self._svadd_address Panel] GetAllViewsRecursive];
const int groupLen53 = group53.Size
;int index53 = 0;
;
for (; index53 < groupLen53;index53++){
_v2.object = (UIView*)([group53 Get:index53]);
 //BA.debugLineNum = 307;BA.debugLine="If v2 Is Label Then";
if ([_v2.objectOrNull isKindOfClass: [UILabel class]]) { 
 //BA.debugLineNum = 308;BA.debugLine="Dim l1 As Label";
_l1 = [B4ILabelWrapper new];
 //BA.debugLineNum = 309;BA.debugLine="l1 = v2";
_l1.object = (UILabel*)((_v2).object);
 //BA.debugLineNum = 310;BA.debugLine="l1.Font = Library.GetFont(l1.Font.Size)";
[_l1 setFont:[self._library _getfont:(int) ([[_l1 Font] Size])]];
 };
 }
};
 //BA.debugLineNum = 315;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _city_receive:(B4IList*) _res :(NSString*) _cat{
B4IList* _ls = nil;
int _i = 0;
B4IMap* _m1 = nil;
 //BA.debugLineNum = 512;BA.debugLine="Sub city_receive(res As List,cat As String)";
 //BA.debugLineNum = 514;BA.debugLine="pnlloading.Visible = False";
[self._pnlloading setVisible:[self.__c False]];
 //BA.debugLineNum = 516;BA.debugLine="listCity = res";
self._listcity = _res;
 //BA.debugLineNum = 518;BA.debugLine="If res = Null Then Return";
if (_res== nil) { 
if (true) return @"";};
 //BA.debugLineNum = 520;BA.debugLine="Dim ls As List";
_ls = [B4IList new];
 //BA.debugLineNum = 521;BA.debugLine="ls.Initialize";
[_ls Initialize];
 //BA.debugLineNum = 523;BA.debugLine="For i = 0 To res.Size - 1";
{
const int step6 = 1;
const int limit6 = (int) ([_res Size]-1);
_i = (int) (0) ;
for (;(step6 > 0 && _i <= limit6) || (step6 < 0 && _i >= limit6) ;_i = ((int)(0 + _i + step6))  ) {
 //BA.debugLineNum = 525;BA.debugLine="Dim m1 As Map";
_m1 = [B4IMap new];
 //BA.debugLineNum = 526;BA.debugLine="m1 = res.Get(i)";
_m1 = (B4IMap*)([_res Get:_i]);
 //BA.debugLineNum = 528;BA.debugLine="ls.Add(m1.Get(\"name\"))";
[_ls Add:[_m1 Get:(NSObject*)(@"name")]];
 //BA.debugLineNum = 529;BA.debugLine="If m1.Get(\"name\") = choosenCity Then txtcity.Sel";
if ([[_m1 Get:(NSObject*)(@"name")] isEqual:(NSObject*)(self._choosencity)]) { 
[self._txtcity SelectRow:(int) (0) :_i :[self.__c True]];};
 }
};
 //BA.debugLineNum = 533;BA.debugLine="txtcity.SetItems(0,ls)";
[self._txtcity SetItems:(int) (0) :_ls];
 //BA.debugLineNum = 534;BA.debugLine="txtcity.SelectRow(0,0,True)";
[self._txtcity SelectRow:(int) (0) :(int) (0) :[self.__c True]];
 //BA.debugLineNum = 536;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _country_receive:(B4IList*) _ls :(NSString*) _cat{
B4IList* _city = nil;
B4IList* _ls1 = nil;
int _index = 0;
int _i = 0;
B4IMap* _te = nil;
b4i_opencart* _opcity = nil;
B4IMap* _tem = nil;
 //BA.debugLineNum = 464;BA.debugLine="Sub country_receive(ls As List,cat As String)";
 //BA.debugLineNum = 466;BA.debugLine="pnlloading.Visible = False";
[self._pnlloading setVisible:[self.__c False]];
 //BA.debugLineNum = 468;BA.debugLine="listCountries.Initialize";
[self._listcountries Initialize];
 //BA.debugLineNum = 469;BA.debugLine="listCountries = ls";
self._listcountries = _ls;
 //BA.debugLineNum = 471;BA.debugLine="Dim City,ls1 As List";
_city = [B4IList new];
_ls1 = [B4IList new];
 //BA.debugLineNum = 472;BA.debugLine="City.Initialize";
[_city Initialize];
 //BA.debugLineNum = 473;BA.debugLine="ls1.Initialize";
[_ls1 Initialize];
 //BA.debugLineNum = 475;BA.debugLine="Dim index As Int : index = -1";
_index = 0;
 //BA.debugLineNum = 475;BA.debugLine="Dim index As Int : index = -1";
_index = (int) (-1);
 //BA.debugLineNum = 477;BA.debugLine="For i = 0 To ls.Size - 1";
{
const int step9 = 1;
const int limit9 = (int) ([_ls Size]-1);
_i = (int) (0) ;
for (;(step9 > 0 && _i <= limit9) || (step9 < 0 && _i >= limit9) ;_i = ((int)(0 + _i + step9))  ) {
 //BA.debugLineNum = 479;BA.debugLine="Dim te As Map";
_te = [B4IMap new];
 //BA.debugLineNum = 480;BA.debugLine="te = ls.Get(i)";
_te = (B4IMap*)([_ls Get:_i]);
 //BA.debugLineNum = 481;BA.debugLine="ls1.Add(te.Get(\"name\"))";
[_ls1 Add:[_te Get:(NSObject*)(@"name")]];
 }
};
 //BA.debugLineNum = 489;BA.debugLine="txtcountry.SetItems(0,ls1)";
[self._txtcountry SetItems:(int) (0) :_ls1];
 //BA.debugLineNum = 491;BA.debugLine="If index <> -1 Then";
if (_index!=-1) { 
 //BA.debugLineNum = 492;BA.debugLine="txtcountry.SelectRow(0,index,True)";
[self._txtcountry SelectRow:(int) (0) :_index :[self.__c True]];
 }else {
 //BA.debugLineNum = 494;BA.debugLine="txtcountry.SelectRow(0,0,True)";
[self._txtcountry SelectRow:(int) (0) :(int) (0) :[self.__c True]];
 };
 //BA.debugLineNum = 504;BA.debugLine="Dim opCity As OpenCart";
_opcity = [b4i_opencart new];
 //BA.debugLineNum = 505;BA.debugLine="opCity.Initialize";
[_opcity _initialize:self.bi];
 //BA.debugLineNum = 506;BA.debugLine="Dim tem As Map";
_tem = [B4IMap new];
 //BA.debugLineNum = 507;BA.debugLine="tem = listCountries.Get(0)";
_tem = (B4IMap*)([self._listcountries Get:(int) (0)]);
 //BA.debugLineNum = 508;BA.debugLine="opCity.GetCity(Me,\"city_receive\",tem.Get(\"countr";
[_opcity _getcity:self :@"city_receive" :[self.bi ObjectToString:[_tem Get:(NSObject*)(@"country_id")]]];
 //BA.debugLineNum = 510;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _defaultbuttonmenucolor{
B4IViewWrapper* _v1 = nil;
B4IButtonWrapper* _b1 = nil;
 //BA.debugLineNum = 1220;BA.debugLine="Sub DefaultButtonMenuColor";
 //BA.debugLineNum = 1222;BA.debugLine="For Each v1 As View In pnlmenu.GetAllViewsRecursi";
_v1 = [B4IViewWrapper new];
{
const id<B4IIterable> group1 = [self._pnlmenu GetAllViewsRecursive];
const int groupLen1 = group1.Size
;int index1 = 0;
;
for (; index1 < groupLen1;index1++){
_v1.object = (UIView*)([group1 Get:index1]);
 //BA.debugLineNum = 1223;BA.debugLine="If v1 Is Button Then";
if ([_v1.objectOrNull isKindOfClass: [UIButton class]]) { 
 //BA.debugLineNum = 1224;BA.debugLine="Dim b1 As Button";
_b1 = [B4IButtonWrapper new];
 //BA.debugLineNum = 1225;BA.debugLine="b1 = v1";
_b1.object = (UIButton*)((_v1).object);
 //BA.debugLineNum = 1226;BA.debugLine="b1.CustomLabel.TextColor = Colors.White";
[[_b1 CustomLabel] setTextColor:[[self.__c Colors] White]];
 };
 }
};
 //BA.debugLineNum = 1230;BA.debugLine="lblnewaddress.TextColor = Colors.White";
[self._lblnewaddress setTextColor:[[self.__c Colors] White]];
 //BA.debugLineNum = 1232;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _deleteaddress_receive:(B4IMap*) _res :(NSString*) _cat{
b4i_opencart* _opaddress = nil;
 //BA.debugLineNum = 895;BA.debugLine="Sub DeleteAddress_receive(res As Map,cat As String";
 //BA.debugLineNum = 897;BA.debugLine="pnlloading.Visible = False";
[self._pnlloading setVisible:[self.__c False]];
 //BA.debugLineNum = 899;BA.debugLine="If res.ContainsKey(\"success\") Then";
if ([_res ContainsKey:(NSObject*)(@"success")]) { 
 //BA.debugLineNum = 900;BA.debugLine="If res.Get(\"success\") = 1 Then";
if ([[_res Get:(NSObject*)(@"success")] isEqual:(NSObject*)(@(1))]) { 
 //BA.debugLineNum = 902;BA.debugLine="listAddressID.Clear";
[self._listaddressid Clear];
 //BA.debugLineNum = 904;BA.debugLine="toast.ShowToastMessageShow(Library.GetStringRes";
[self._toast _showtoastmessageshow:[self._library _getstringresourse:@"deleted_address"] :(long long) (2) :[self.__c True]];
 //BA.debugLineNum = 906;BA.debugLine="Dim opAddress As OpenCart";
_opaddress = [b4i_opencart new];
 //BA.debugLineNum = 907;BA.debugLine="opAddress.Initialize";
[_opaddress _initialize:self.bi];
 //BA.debugLineNum = 908;BA.debugLine="opAddress.ListAddressUser(Me,\"ListAddress_recei";
[_opaddress _listaddressuser:self :@"ListAddress_receive"];
 };
 };
 //BA.debugLineNum = 913;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _detailsorder_receive:(B4IMap*) _res :(NSString*) _cat{
B4IMap* _data = nil;
 //BA.debugLineNum = 864;BA.debugLine="Sub DetailsOrder_receive(res As Map,cat As String)";
 //BA.debugLineNum = 866;BA.debugLine="pnlloading.Visible = False";
[self._pnlloading setVisible:[self.__c False]];
 //BA.debugLineNum = 868;BA.debugLine="If res.ContainsKey(\"success\") Then";
if ([_res ContainsKey:(NSObject*)(@"success")]) { 
 //BA.debugLineNum = 869;BA.debugLine="If res.Get(\"success\") = 1 Then";
if ([[_res Get:(NSObject*)(@"success")] isEqual:(NSObject*)(@(1))]) { 
 //BA.debugLineNum = 870;BA.debugLine="Dim data As Map";
_data = [B4IMap new];
 //BA.debugLineNum = 871;BA.debugLine="data = res.Get(\"data\")";
_data = (B4IMap*)([_res Get:(NSObject*)(@"data")]);
 //BA.debugLineNum = 872;BA.debugLine="Library.LastPage = Library.AccountPage";
self._library._lastpage = self._library._accountpage;
 //BA.debugLineNum = 873;BA.debugLine="actOrderDetails.details = data";
self._actorderdetails._details = _data;
 //BA.debugLineNum = 874;BA.debugLine="actOrderDetails.user_details = CreateMap(\"first";
self._actorderdetails._user_details = [self.__c createMap:@[(NSObject*)(@"firstname"),(NSObject*)([self._txtname Text]),(NSObject*)(@"lastname"),(NSObject*)([self._txtfamily Text]),(NSObject*)(@"email"),(NSObject*)([self._txtemail Text]),(NSObject*)(@"telephone"),(NSObject*)([self._txtphone Text]),(NSObject*)(@"order_id"),[_data Get:(NSObject*)(@"order_id")],(NSObject*)(@"date_ordered"),[_data Get:(NSObject*)(@"date_added")]]];
 //BA.debugLineNum = 875;BA.debugLine="actOrderDetails.StartActivity";
[self._actorderdetails _startactivity];
 };
 };
 //BA.debugLineNum = 879;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _editaddress_receive:(B4IMap*) _res :(NSString*) _cat{
b4i_opencart* _opaddress = nil;
 //BA.debugLineNum = 786;BA.debugLine="Sub editAddress_receive(res As  Map,cat As String)";
 //BA.debugLineNum = 788;BA.debugLine="Library.HUD.ProgressDialogHide";
[self._library._hud ProgressDialogHide];
 //BA.debugLineNum = 790;BA.debugLine="If res = Null Then Return";
if (_res== nil) { 
if (true) return @"";};
 //BA.debugLineNum = 792;BA.debugLine="pnlloading.Visible = False";
[self._pnlloading setVisible:[self.__c False]];
 //BA.debugLineNum = 794;BA.debugLine="If res.ContainsKey(\"success\") Then";
if ([_res ContainsKey:(NSObject*)(@"success")]) { 
 //BA.debugLineNum = 795;BA.debugLine="If res.Get(\"success\") = 1 Then";
if ([[_res Get:(NSObject*)(@"success")] isEqual:(NSObject*)(@(1))]) { 
 //BA.debugLineNum = 796;BA.debugLine="ChoosenAddress4Edit = 0";
self._choosenaddress4edit = (int) (0);
 //BA.debugLineNum = 797;BA.debugLine="txtaddress.Text = \"\"";
[self._txtaddress setText:@""];
 //BA.debugLineNum = 798;BA.debugLine="toast.ShowToastMessageShow(Library.GetStringRes";
[self._toast _showtoastmessageshow:[self._library _getstringresourse:@"success_save_details"] :(long long) (2) :[self.__c True]];
 //BA.debugLineNum = 799;BA.debugLine="Dim opAddress As OpenCart";
_opaddress = [b4i_opencart new];
 //BA.debugLineNum = 800;BA.debugLine="opAddress.Initialize";
[_opaddress _initialize:self.bi];
 //BA.debugLineNum = 801;BA.debugLine="opAddress.ListAddressUser(Me,\"ListAddress_recei";
[_opaddress _listaddressuser:self :@"ListAddress_receive"];
 //BA.debugLineNum = 802;BA.debugLine="Return";
if (true) return @"";
 };
 };
 //BA.debugLineNum = 806;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _getdetails_receive:(B4IMap*) _res :(NSString*) _cat{
B4IMap* _ma = nil;
NSString* _date = @"";
 //BA.debugLineNum = 561;BA.debugLine="Sub getDetails_receive(res As Map,cat As String)";
 //BA.debugLineNum = 563;BA.debugLine="If Library.IsPersian Then";
if ([self._library _ispersian]) { 
 //BA.debugLineNum = 564;BA.debugLine="pnlmain.Left = 0";
[self._pnlmain setLeft:(float) (0)];
 };
 //BA.debugLineNum = 567;BA.debugLine="Library.HUD.ProgressDialogHide";
[self._library._hud ProgressDialogHide];
 //BA.debugLineNum = 568;BA.debugLine="pnlloading.Visible = False";
[self._pnlloading setVisible:[self.__c False]];
 //BA.debugLineNum = 570;BA.debugLine="If res.ContainsKey(\"error\") Then";
if ([_res ContainsKey:(NSObject*)(@"error")]) { 
 //BA.debugLineNum = 571;BA.debugLine="If res.Get(\"error\") = \"User is not logged in\" Th";
if ([[_res Get:(NSObject*)(@"error")] isEqual:(NSObject*)(@"User is not logged in")]) { 
 //BA.debugLineNum = 572;BA.debugLine="Library.HUD.ToastMessageShow(Library.GetStringR";
[self._library._hud ToastMessageShow:[self._library _getstringresourse:@"login_force"] :[self.__c False]];
 //BA.debugLineNum = 573;BA.debugLine="CallSubDelayed(actMenu,\"Logout\")";
[self.__c CallSubDelayed:self.bi :(NSObject*)((self._actmenu).object) :@"Logout"];
 //BA.debugLineNum = 574;BA.debugLine="Return";
if (true) return @"";
 };
 };
 //BA.debugLineNum = 578;BA.debugLine="If res.Get(\"success\") Then";
if ([self.bi ObjectToBoolean:[_res Get:(NSObject*)(@"success")]]) { 
 //BA.debugLineNum = 579;BA.debugLine="If res.Get(\"success\") = True Then";
if ([[_res Get:(NSObject*)(@"success")] isEqual:(NSObject*)(@([self.__c True]))]) { 
 //BA.debugLineNum = 581;BA.debugLine="Dim ma As Map";
_ma = [B4IMap new];
 //BA.debugLineNum = 582;BA.debugLine="ma = res.Get(\"data\")";
_ma = (B4IMap*)([_res Get:(NSObject*)(@"data")]);
 //BA.debugLineNum = 583;BA.debugLine="txtname.Text = ma.Get(\"firstname\")";
[self._txtname setText:[self.bi ObjectToString:[_ma Get:(NSObject*)(@"firstname")]]];
 //BA.debugLineNum = 584;BA.debugLine="txtfamily.Text = ma.Get(\"lastname\")";
[self._txtfamily setText:[self.bi ObjectToString:[_ma Get:(NSObject*)(@"lastname")]]];
 //BA.debugLineNum = 585;BA.debugLine="txtemail.Text = ma.Get(\"email\")";
[self._txtemail setText:[self.bi ObjectToString:[_ma Get:(NSObject*)(@"email")]]];
 //BA.debugLineNum = 586;BA.debugLine="txtphone.Text = ma.Get(\"telephone\")";
[self._txtphone setText:[self.bi ObjectToString:[_ma Get:(NSObject*)(@"telephone")]]];
 //BA.debugLineNum = 587;BA.debugLine="txtfax.Text = ma.Get(\"fax\")";
[self._txtfax setText:[self.bi ObjectToString:[_ma Get:(NSObject*)(@"fax")]]];
 //BA.debugLineNum = 589;BA.debugLine="Dim date As String";
_date = @"";
 //BA.debugLineNum = 590;BA.debugLine="date = ma.Get(\"date_added\")";
_date = [self.bi ObjectToString:[_ma Get:(NSObject*)(@"date_added")]];
 //BA.debugLineNum = 592;BA.debugLine="If Library.IsPersian Then";
if ([self._library _ispersian]) { 
 //BA.debugLineNum = 593;BA.debugLine="lbldate.Text = Library.GetStringResourse(\"lbld";
[self._lbldate setText:[[self._library _getstringresourse:@"lbldate"] Replace:@"0" :[self._library _getdate:_date]]];
 }else {
 //BA.debugLineNum = 595;BA.debugLine="lbldate.Text = Library.GetStringResourse(\"lbld";
[self._lbldate setText:[[self._library _getstringresourse:@"lbldate"] Replace:@"0" :_date]];
 };
 //BA.debugLineNum = 598;BA.debugLine="lblip.Text = Library.GetStringResourse(\"lblip\")";
[self._lblip setText:[[self._library _getstringresourse:@"lblip"] Replace:@"0" :[self.bi ObjectToString:[_ma Get:(NSObject*)(@"ip")]]]];
 //BA.debugLineNum = 600;BA.debugLine="tmrOpenMenu.Enabled = True";
[self._tmropenmenu setEnabled:[self.__c True]];
 //BA.debugLineNum = 602;BA.debugLine="btnprofile_Click";
[self _btnprofile_click];
 //BA.debugLineNum = 604;BA.debugLine="If ma.Get(\"newsletter\") = \"1\" Then";
if ([[_ma Get:(NSObject*)(@"newsletter")] isEqual:(NSObject*)(@"1")]) { 
 //BA.debugLineNum = 605;BA.debugLine="rbyes.Value = False";
[self._rbyes setValue:[self.__c False]];
 //BA.debugLineNum = 606;BA.debugLine="lblyes.Visible = False";
[self._lblyes setVisible:[self.__c False]];
 //BA.debugLineNum = 607;BA.debugLine="lblno.Visible = True";
[self._lblno setVisible:[self.__c True]];
 //BA.debugLineNum = 608;BA.debugLine="lblnewsletteroption.Text = Library.GetStringRe";
[self._lblnewsletteroption setText:[self._library _getstringresourse:@"scribe_state_1"]];
 }else {
 //BA.debugLineNum = 610;BA.debugLine="lblyes.Visible = True";
[self._lblyes setVisible:[self.__c True]];
 //BA.debugLineNum = 611;BA.debugLine="rbyes.Value = True";
[self._rbyes setValue:[self.__c True]];
 //BA.debugLineNum = 612;BA.debugLine="lblno.Visible = False";
[self._lblno setVisible:[self.__c False]];
 //BA.debugLineNum = 613;BA.debugLine="rbyes.Visible = True";
[self._rbyes setVisible:[self.__c True]];
 //BA.debugLineNum = 614;BA.debugLine="lblnewsletteroption.Text = Library.GetStringRe";
[self._lblnewsletteroption setText:[self._library _getstringresourse:@"scribe_state_0"]];
 };
 }else {
 //BA.debugLineNum = 618;BA.debugLine="Library.NavControl.ShowPage(Library.MenuPage)";
[self._library._navcontrol ShowPage:(UIViewController*)((self._library._menupage).object)];
 };
 }else {
 //BA.debugLineNum = 622;BA.debugLine="Library.NavControl.ShowPage(Library.MenuPage)";
[self._library._navcontrol ShowPage:(UIViewController*)((self._library._menupage).object)];
 };
 //BA.debugLineNum = 625;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _hidemainpanelsv{
 //BA.debugLineNum = 317;BA.debugLine="Sub HideMainpanelSV";
 //BA.debugLineNum = 319;BA.debugLine="svReturns.Visible = False";
[self._svreturns setVisible:[self.__c False]];
 //BA.debugLineNum = 320;BA.debugLine="svAddress.Visible = False";
[self._svaddress setVisible:[self.__c False]];
 //BA.debugLineNum = 321;BA.debugLine="svadd_address.Visible = False";
[self._svadd_address setVisible:[self.__c False]];
 //BA.debugLineNum = 322;BA.debugLine="svOrders.Visible = False";
[self._svorders setVisible:[self.__c False]];
 //BA.debugLineNum = 323;BA.debugLine="svParent.Visible = False";
[self._svparent setVisible:[self.__c False]];
 //BA.debugLineNum = 324;BA.debugLine="svPassword.Visible = False";
[self._svpassword setVisible:[self.__c False]];
 //BA.debugLineNum = 325;BA.debugLine="svNewsletter.Visible = False";
[self._svnewsletter setVisible:[self.__c False]];
 //BA.debugLineNum = 327;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _lbladdress_1_click{
B4ILabelWrapper* _lb = nil;
B4IMap* _p = nil;
 //BA.debugLineNum = 881;BA.debugLine="Sub lbladdress_1_Click";
 //BA.debugLineNum = 883;BA.debugLine="Dim lb As Label";
_lb = [B4ILabelWrapper new];
 //BA.debugLineNum = 884;BA.debugLine="lb = Sender";
_lb.object = (UILabel*)([self.__c Sender:self.bi]);
 //BA.debugLineNum = 886;BA.debugLine="Dim p As Map";
_p = [B4IMap new];
 //BA.debugLineNum = 887;BA.debugLine="p = lb.Tag";
_p = (B4IMap*)([_lb Tag]);
 //BA.debugLineNum = 889;BA.debugLine="ChoosenAddressID = listAddressID.Get(p.Get(\"index";
self._choosenaddressid = [self.bi ObjectToString:[self._listaddressid Get:[self.bi ObjectToNumber:[_p Get:(NSObject*)(@"index")]].intValue]];
 //BA.debugLineNum = 890;BA.debugLine="ChoosenAddressValue = p.Get(\"value\")";
self._choosenaddressvalue = [self.bi ObjectToString:[_p Get:(NSObject*)(@"value")]];
 //BA.debugLineNum = 891;BA.debugLine="pnlaction.SetLayoutAnimated(600,1,0,Library.GetHe";
[self._pnlaction SetLayoutAnimated:(int) (600) :(float) (1) :(float) (0) :(float) ([self._library _getheight]-[self._pnlaction Height]-[self.__c DipToCurrent:(int) (20)]) :[self._pnlaction Width] :[self._pnlaction Height]];
 //BA.debugLineNum = 893;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _listaddress_receive:(B4IMap*) _res :(NSString*) _cat{
B4IMap* _d1 = nil;
B4IList* _ls = nil;
int _top = 0;
int _i = 0;
NSString* _key = @"";
B4IMap* _temp = nil;
B4IPanelWrapper* _p = nil;
 //BA.debugLineNum = 404;BA.debugLine="Sub ListAddress_receive(res As Map,cat As String)";
 //BA.debugLineNum = 406;BA.debugLine="pnlloading.Visible = False";
[self._pnlloading setVisible:[self.__c False]];
 //BA.debugLineNum = 408;BA.debugLine="If res.ContainsKey(\"success\") Then";
if ([_res ContainsKey:(NSObject*)(@"success")]) { 
 //BA.debugLineNum = 409;BA.debugLine="If res.Get(\"success\") = True Then";
if ([[_res Get:(NSObject*)(@"success")] isEqual:(NSObject*)(@([self.__c True]))]) { 
 //BA.debugLineNum = 410;BA.debugLine="Dim d1 As Map";
_d1 = [B4IMap new];
 //BA.debugLineNum = 411;BA.debugLine="d1 = res.Get(\"data\")";
_d1 = (B4IMap*)([_res Get:(NSObject*)(@"data")]);
 //BA.debugLineNum = 412;BA.debugLine="d1 = d1.Get(\"addresses\")";
_d1 = (B4IMap*)([_d1 Get:(NSObject*)(@"addresses")]);
 //BA.debugLineNum = 414;BA.debugLine="listAddressCache = d1";
self._listaddresscache = _d1;
 //BA.debugLineNum = 416;BA.debugLine="listAddressID.Initialize";
[self._listaddressid Initialize];
 //BA.debugLineNum = 418;BA.debugLine="Dim ls As List";
_ls = [B4IList new];
 //BA.debugLineNum = 419;BA.debugLine="ls.Initialize";
[_ls Initialize];
 //BA.debugLineNum = 421;BA.debugLine="Dim top,i As Int";
_top = 0;
_i = 0;
 //BA.debugLineNum = 423;BA.debugLine="svAddress.Panel.RemoveAllViews";
[[self._svaddress Panel] RemoveAllViews];
 //BA.debugLineNum = 424;BA.debugLine="svAddress.Color = Colors.White";
[self._svaddress setColor:[[self.__c Colors] White]];
 //BA.debugLineNum = 426;BA.debugLine="For Each key As String In d1.Keys";
{
const id<B4IIterable> group14 = [_d1 Keys];
const int groupLen14 = group14.Size
;int index14 = 0;
;
for (; index14 < groupLen14;index14++){
_key = [self.bi ObjectToString:[group14 Get:index14]];
 //BA.debugLineNum = 428;BA.debugLine="Dim temp As Map";
_temp = [B4IMap new];
 //BA.debugLineNum = 429;BA.debugLine="temp = d1.Get(key)";
_temp = (B4IMap*)([_d1 Get:(NSObject*)(_key)]);
 //BA.debugLineNum = 431;BA.debugLine="Dim p As Panel";
_p = [B4IPanelWrapper new];
 //BA.debugLineNum = 432;BA.debugLine="p.Initialize(\"\")";
[_p Initialize:self.bi :@""];
 //BA.debugLineNum = 433;BA.debugLine="p.LoadLayout(\"frmaddress_item\")";
[_p LoadLayout:@"frmaddress_item" :self.bi];
 //BA.debugLineNum = 434;BA.debugLine="lbladdress_1.Text = $\"${temp.Get(\"country\")} $";
[self._lbladdress_1 setText:([@[@"",[self.__c SmartStringFormatter:@"" :[_temp Get:(NSObject*)(@"country")]],@" ",[self.__c SmartStringFormatter:@"" :[_temp Get:(NSObject*)(@"city")]],@" ",[self.__c SmartStringFormatter:@"" :[_temp Get:(NSObject*)(@"address_1")]],@""] componentsJoinedByString:@""])];
 //BA.debugLineNum = 435;BA.debugLine="lbladdress_1.Font = Library.GetFont(14)";
[self._lbladdress_1 setFont:[self._library _getfont:(int) (14)]];
 //BA.debugLineNum = 436;BA.debugLine="lbladdress_1.TextAlignment = Library.GetString";
[self._lbladdress_1 setTextAlignment:[self.bi ObjectToNumber:[self._library _getstringresourse:@"direction_ios"]].intValue];
 //BA.debugLineNum = 437;BA.debugLine="svAddress.panel.AddView(p,0,top,svAddress.Widt";
[[self._svaddress Panel] AddView:(UIView*)((_p).object) :(float) (0) :(float) (_top) :[self._svaddress Width] :(float) ([self.__c DipToCurrent:(int) (60)])];
 //BA.debugLineNum = 438;BA.debugLine="top = top + 70dip";
_top = (int) (_top+[self.__c DipToCurrent:(int) (70)]);
 //BA.debugLineNum = 440;BA.debugLine="lbladdress_1.Tag = CreateMap(\"index\":i,\"value\"";
[self._lbladdress_1 setTag:(NSObject*)([self.__c createMap:@[(NSObject*)(@"index"),(NSObject*)(@(_i)),(NSObject*)(@"value"),(NSObject*)([self._lbladdress_1 Text])]])];
 //BA.debugLineNum = 441;BA.debugLine="ls.Add(temp.Get(\"address_id\"))";
[_ls Add:[_temp Get:(NSObject*)(@"address_id")]];
 //BA.debugLineNum = 443;BA.debugLine="i = i + 1";
_i = (int) (_i+1);
 //BA.debugLineNum = 445;BA.debugLine="svAddress.Panel.Height = svAddress.Panel.Heigh";
[[self._svaddress Panel] setHeight:(float) ([[self._svaddress Panel] Height]+[self.__c DipToCurrent:(int) (70)])];
 //BA.debugLineNum = 446;BA.debugLine="listAddressID.Add(temp.Get(\"address_id\"))";
[self._listaddressid Add:[_temp Get:(NSObject*)(@"address_id")]];
 }
};
 //BA.debugLineNum = 450;BA.debugLine="svAddress.ContentWidth = svAddress.Width";
[self._svaddress setContentWidth:(int) ([self._svaddress Width])];
 //BA.debugLineNum = 451;BA.debugLine="svAddress.ContentHeight = top";
[self._svaddress setContentHeight:_top];
 //BA.debugLineNum = 453;BA.debugLine="If ChoosenTab = \"address\" Then";
if ([self._choosentab isEqual:@"address"]) { 
 //BA.debugLineNum = 454;BA.debugLine="ChoosenTab = \"\"";
self._choosentab = @"";
 };
 //BA.debugLineNum = 457;BA.debugLine="Return";
if (true) return @"";
 };
 };
 //BA.debugLineNum = 462;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _orders_receive:(B4IMap*) _res :(NSString*) _cat{
B4IMap* _m1 = nil;
B4IList* _l1 = nil;
int _top = 0;
int _i = 0;
B4IMap* _temp = nil;
B4IPanelWrapper* _p1 = nil;
 //BA.debugLineNum = 329;BA.debugLine="Sub Orders_receive(res As Map,cat As String)";
 //BA.debugLineNum = 331;BA.debugLine="If res.ContainsKey(\"success\") Then";
if ([_res ContainsKey:(NSObject*)(@"success")]) { 
 //BA.debugLineNum = 333;BA.debugLine="If res.Get(\"success\") = True Then";
if ([[_res Get:(NSObject*)(@"success")] isEqual:(NSObject*)(@([self.__c True]))]) { 
 //BA.debugLineNum = 334;BA.debugLine="Dim m1 As Map";
_m1 = [B4IMap new];
 //BA.debugLineNum = 335;BA.debugLine="m1.Initialize";
[_m1 Initialize];
 //BA.debugLineNum = 336;BA.debugLine="m1 = res.Get(\"data\")";
_m1 = (B4IMap*)([_res Get:(NSObject*)(@"data")]);
 //BA.debugLineNum = 338;BA.debugLine="Dim l1 As List";
_l1 = [B4IList new];
 //BA.debugLineNum = 339;BA.debugLine="l1 = m1.Get(\"orders\")";
_l1.object = (NSArray*)([_m1 Get:(NSObject*)(@"orders")]);
 //BA.debugLineNum = 341;BA.debugLine="Dim top As Int";
_top = 0;
 //BA.debugLineNum = 342;BA.debugLine="top = 0";
_top = (int) (0);
 //BA.debugLineNum = 343;BA.debugLine="svOrders.Panel.Color = Colors.White";
[[self._svorders Panel] setColor:[[self.__c Colors] White]];
 //BA.debugLineNum = 344;BA.debugLine="svOrders.Color = Colors.White";
[self._svorders setColor:[[self.__c Colors] White]];
 //BA.debugLineNum = 346;BA.debugLine="For i = 0 To l1.Size - 1";
{
const int step12 = 1;
const int limit12 = (int) ([_l1 Size]-1);
_i = (int) (0) ;
for (;(step12 > 0 && _i <= limit12) || (step12 < 0 && _i >= limit12) ;_i = ((int)(0 + _i + step12))  ) {
 //BA.debugLineNum = 348;BA.debugLine="Dim temp As Map";
_temp = [B4IMap new];
 //BA.debugLineNum = 349;BA.debugLine="temp = l1.Get(i)";
_temp = (B4IMap*)([_l1 Get:_i]);
 //BA.debugLineNum = 351;BA.debugLine="Dim p1 As Panel";
_p1 = [B4IPanelWrapper new];
 //BA.debugLineNum = 352;BA.debugLine="p1.Initialize(\"\")";
[_p1 Initialize:self.bi :@""];
 //BA.debugLineNum = 354;BA.debugLine="svOrders.Panel.AddView(p1,-10,top,svOrders.Wid";
[[self._svorders Panel] AddView:(UIView*)((_p1).object) :(float) (-10) :(float) (_top) :[self._svorders Width] :(float) (0)];
 //BA.debugLineNum = 356;BA.debugLine="If Library.IsPersian Then";
if ([self._library _ispersian]) { 
 //BA.debugLineNum = 357;BA.debugLine="p1.LoadLayout(\"frmtemplate_order\")";
[_p1 LoadLayout:@"frmtemplate_order" :self.bi];
 //BA.debugLineNum = 358;BA.debugLine="lbldate.Text = Library.GetDate(temp.Get(\"date";
[self._lbldate setText:[self._library _getdate:[self.bi ObjectToString:[_temp Get:(NSObject*)(@"date_added")]]]];
 }else {
 //BA.debugLineNum = 360;BA.debugLine="p1.LoadLayout(\"frmtemplate_order_en\")";
[_p1 LoadLayout:@"frmtemplate_order_en" :self.bi];
 //BA.debugLineNum = 361;BA.debugLine="lbldate.Text = temp.Get(\"date_added\")";
[self._lbldate setText:[self.bi ObjectToString:[_temp Get:(NSObject*)(@"date_added")]]];
 };
 //BA.debugLineNum = 365;BA.debugLine="p1.Color = Colors.White";
[_p1 setColor:[[self.__c Colors] White]];
 //BA.debugLineNum = 366;BA.debugLine="pnlorder.Color = Colors.White";
[self._pnlorder setColor:[[self.__c Colors] White]];
 //BA.debugLineNum = 367;BA.debugLine="p1.Height = pnlorder.Height";
[_p1 setHeight:[self._pnlorder Height]];
 //BA.debugLineNum = 369;BA.debugLine="lbldate.Font = Library.GetFont(lbldate.Font.Si";
[self._lbldate setFont:[self._library _getfont:(int) ([[self._lbldate Font] Size])]];
 //BA.debugLineNum = 370;BA.debugLine="lblid.Text = Library.GetStringResourse(\"order_";
[self._lblid setText:[[[self._library _getstringresourse:@"order_id"] Replace:@"0" :[self.bi ObjectToString:[_temp Get:(NSObject*)(@"order_id")]]] Replace:@"1" :@""]];
 //BA.debugLineNum = 371;BA.debugLine="lblid.Font = Library.GetFont(lblid.Font.Size)";
[self._lblid setFont:[self._library _getfont:(int) ([[self._lblid Font] Size])]];
 //BA.debugLineNum = 372;BA.debugLine="lblstate2.Text = temp.Get(\"status\")";
[self._lblstate2 setText:[self.bi ObjectToString:[_temp Get:(NSObject*)(@"status")]]];
 //BA.debugLineNum = 373;BA.debugLine="lblstate2.Font = Library.GetFont(lblstate2.Fon";
[self._lblstate2 setFont:[self._library _getfont:(int) ([[self._lblstate2 Font] Size])]];
 //BA.debugLineNum = 374;BA.debugLine="btndetails.Text = Library.GetStringResourse(\"o";
[self._btndetails setText:[self._library _getstringresourse:@"order_details"]];
 //BA.debugLineNum = 375;BA.debugLine="btndetails.CustomLabel.Font = Library.GetFont(";
[[self._btndetails CustomLabel] setFont:[self._library _getfont:(int) (14)]];
 //BA.debugLineNum = 376;BA.debugLine="btndetails.Tag = temp.Get(\"order_id\")";
[self._btndetails setTag:[_temp Get:(NSObject*)(@"order_id")]];
 //BA.debugLineNum = 378;BA.debugLine="top = top + p1.Height";
_top = (int) (_top+[_p1 Height]);
 }
};
 //BA.debugLineNum = 382;BA.debugLine="svOrders.Panel.Height = top + 150dip";
[[self._svorders Panel] setHeight:(float) (_top+[self.__c DipToCurrent:(int) (150)])];
 //BA.debugLineNum = 383;BA.debugLine="svOrders.ContentHeight = top";
[self._svorders setContentHeight:_top];
 //BA.debugLineNum = 384;BA.debugLine="svOrders.ContentWidth = Library.GetWidth - pnlm";
[self._svorders setContentWidth:(int) ([self._library _getwidth]-[self._pnlmenu Width]-[self.__c DipToCurrent:(int) (30)])];
 //BA.debugLineNum = 386;BA.debugLine="svOrders.Color = Colors.White";
[self._svorders setColor:[[self.__c Colors] White]];
 //BA.debugLineNum = 387;BA.debugLine="svOrders.Panel.Color = Colors.White";
[[self._svorders Panel] setColor:[[self.__c Colors] White]];
 //BA.debugLineNum = 389;BA.debugLine="If ChoosenTab = \"order\" Then";
if ([self._choosentab isEqual:@"order"]) { 
 };
 //BA.debugLineNum = 393;BA.debugLine="pnlloading.Visible = False";
[self._pnlloading setVisible:[self.__c False]];
 //BA.debugLineNum = 395;BA.debugLine="Return";
if (true) return @"";
 };
 };
 //BA.debugLineNum = 400;BA.debugLine="pnlloading.Visible = False";
[self._pnlloading setVisible:[self.__c False]];
 //BA.debugLineNum = 402;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _pageaccount_appear{
 //BA.debugLineNum = 226;BA.debugLine="Sub pageAccount_Appear";
 //BA.debugLineNum = 228;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _pageaccount_disappear{
 //BA.debugLineNum = 230;BA.debugLine="Sub pageAccount_Disappear";
 //BA.debugLineNum = 232;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _process_globals{
self._main=[b4i_main new];
self._actmenu=[b4i_actmenu new];
self._library=[b4i_library new];
self._actsearch=[b4i_actsearch new];
self._actregister=[b4i_actregister new];
self._actcontact=[b4i_actcontact new];
self._actproduct=[b4i_actproduct new];
self._actpicture=[b4i_actpicture new];
self._actdoorder=[b4i_actdoorder new];
self._actcategory=[b4i_actcategory new];
self._actpayment=[b4i_actpayment new];
self._actpush=[b4i_actpush new];
self._pushnotification=[b4i_pushnotification new];
self._actlogin=[b4i_actlogin new];
self._actbasket=[b4i_actbasket new];
self._actproducts=[b4i_actproducts new];
self._actsms=[b4i_actsms new];
self._actorderdetails=[b4i_actorderdetails new];
self._modshare=[b4i_modshare new];
self._acterrorinternet=[b4i_acterrorinternet new];
self._httputils2service=[b4i_httputils2service new];
self._cachedata=[b4i_cachedata new];
self._dateutils=[b4i_dateutils new];
self._bookmark=[b4i_bookmark new];
self._actabout=[b4i_actabout new];
self._actshow=[b4i_actshow new];
self._actweb=[b4i_actweb new];
self._actsetting=[b4i_actsetting new];
self._actreview=[b4i_actreview new];
self._peroperties=[b4i_peroperties new];
 //BA.debugLineNum = 3;BA.debugLine="Sub Process_Globals";
 //BA.debugLineNum = 4;BA.debugLine="Public ChoosenTab As String";
self._choosentab = @"";
 //BA.debugLineNum = 5;BA.debugLine="Private tmrOpenMenu As Timer";
self._tmropenmenu = [B4ITimer new];
 //BA.debugLineNum = 6;BA.debugLine="Public ChoosenTab As String";
self._choosentab = @"";
 //BA.debugLineNum = 7;BA.debugLine="Dim svReturns As ScrollView";
self._svreturns = [B4IScrollView new];
 //BA.debugLineNum = 8;BA.debugLine="Private btnsave As Button";
self._btnsave = [B4IButtonWrapper new];
 //BA.debugLineNum = 9;BA.debugLine="Private Label11 As Label";
self._label11 = [B4ILabelWrapper new];
 //BA.debugLineNum = 10;BA.debugLine="Private Label2 As Label";
self._label2 = [B4ILabelWrapper new];
 //BA.debugLineNum = 11;BA.debugLine="Private Label3 As Label";
self._label3 = [B4ILabelWrapper new];
 //BA.debugLineNum = 12;BA.debugLine="Private Label5 As Label";
self._label5 = [B4ILabelWrapper new];
 //BA.debugLineNum = 13;BA.debugLine="Private Label7 As Label";
self._label7 = [B4ILabelWrapper new];
 //BA.debugLineNum = 14;BA.debugLine="Private Label9 As Label";
self._label9 = [B4ILabelWrapper new];
 //BA.debugLineNum = 15;BA.debugLine="Private lbldate As Label";
self._lbldate = [B4ILabelWrapper new];
 //BA.debugLineNum = 16;BA.debugLine="Private lblemail As Label";
self._lblemail = [B4ILabelWrapper new];
 //BA.debugLineNum = 17;BA.debugLine="Private lblfamily As Label";
self._lblfamily = [B4ILabelWrapper new];
 //BA.debugLineNum = 18;BA.debugLine="Private lblfax As Label";
self._lblfax = [B4ILabelWrapper new];
 //BA.debugLineNum = 19;BA.debugLine="Private lblip As Label";
self._lblip = [B4ILabelWrapper new];
 //BA.debugLineNum = 20;BA.debugLine="Private lblname As Label";
self._lblname = [B4ILabelWrapper new];
 //BA.debugLineNum = 21;BA.debugLine="Private lblpassword As Label";
self._lblpassword = [B4ILabelWrapper new];
 //BA.debugLineNum = 22;BA.debugLine="Private lblphone As Label";
self._lblphone = [B4ILabelWrapper new];
 //BA.debugLineNum = 23;BA.debugLine="Private txtemail As TextField";
self._txtemail = [B4ITextFieldWrapper new];
 //BA.debugLineNum = 24;BA.debugLine="Private txtfamily As TextField";
self._txtfamily = [B4ITextFieldWrapper new];
 //BA.debugLineNum = 25;BA.debugLine="Private txtfax As TextField";
self._txtfax = [B4ITextFieldWrapper new];
 //BA.debugLineNum = 26;BA.debugLine="Private txtname As TextField";
self._txtname = [B4ITextFieldWrapper new];
 //BA.debugLineNum = 27;BA.debugLine="Private txtpassword As TextField";
self._txtpassword = [B4ITextFieldWrapper new];
 //BA.debugLineNum = 28;BA.debugLine="Private txtphone As TextField";
self._txtphone = [B4ITextFieldWrapper new];
 //BA.debugLineNum = 30;BA.debugLine="Private btnpassword As Button";
self._btnpassword = [B4IButtonWrapper new];
 //BA.debugLineNum = 31;BA.debugLine="Private lblcountry As Label";
self._lblcountry = [B4ILabelWrapper new];
 //BA.debugLineNum = 32;BA.debugLine="Private txtcountry As Picker";
self._txtcountry = [B4IPickerWrapper new];
 //BA.debugLineNum = 33;BA.debugLine="Private lblcity As Label";
self._lblcity = [B4ILabelWrapper new];
 //BA.debugLineNum = 34;BA.debugLine="Private txtcity As Picker";
self._txtcity = [B4IPickerWrapper new];
 //BA.debugLineNum = 35;BA.debugLine="Private lbladdress As Label";
self._lbladdress = [B4ILabelWrapper new];
 //BA.debugLineNum = 36;BA.debugLine="Private btnadd As Button";
self._btnadd = [B4IButtonWrapper new];
 //BA.debugLineNum = 37;BA.debugLine="Private listCity,listCountries As List";
self._listcity = [B4IList new];
self._listcountries = [B4IList new];
 //BA.debugLineNum = 38;BA.debugLine="Private txtaddress As TextField";
self._txtaddress = [B4ITextFieldWrapper new];
 //BA.debugLineNum = 39;BA.debugLine="Private lvAddress,listCountry As Picker";
self._lvaddress = [B4IPickerWrapper new];
self._listcountry = [B4IPickerWrapper new];
 //BA.debugLineNum = 40;BA.debugLine="Private lblid As Label";
self._lblid = [B4ILabelWrapper new];
 //BA.debugLineNum = 41;BA.debugLine="Private lblstate2 As Label";
self._lblstate2 = [B4ILabelWrapper new];
 //BA.debugLineNum = 42;BA.debugLine="Private btndetails As Button";
self._btndetails = [B4IButtonWrapper new];
 //BA.debugLineNum = 43;BA.debugLine="Private pnlorder As Panel";
self._pnlorder = [B4IPanelWrapper new];
 //BA.debugLineNum = 44;BA.debugLine="Private btnadd_address As Button";
self._btnadd_address = [B4IButtonWrapper new];
 //BA.debugLineNum = 45;BA.debugLine="Private btncancel_new_address As Button";
self._btncancel_new_address = [B4IButtonWrapper new];
 //BA.debugLineNum = 46;BA.debugLine="Private lblpostal_enter As Label";
self._lblpostal_enter = [B4ILabelWrapper new];
 //BA.debugLineNum = 47;BA.debugLine="Private txtpostal_enter As TextField";
self._txtpostal_enter = [B4ITextFieldWrapper new];
 //BA.debugLineNum = 48;BA.debugLine="Private listAddressCache As Map";
self._listaddresscache = [B4IMap new];
 //BA.debugLineNum = 49;BA.debugLine="Private ChoosenAddress4Edit As Int";
self._choosenaddress4edit = 0;
 //BA.debugLineNum = 50;BA.debugLine="Private lbldefault As Label";
self._lbldefault = [B4ILabelWrapper new];
 //BA.debugLineNum = 51;BA.debugLine="Private listAddressID As List";
self._listaddressid = [B4IList new];
 //BA.debugLineNum = 52;BA.debugLine="Private choosenCity As String";
self._choosencity = @"";
 //BA.debugLineNum = 53;BA.debugLine="Private pnlmenu As Panel";
self._pnlmenu = [B4IPanelWrapper new];
 //BA.debugLineNum = 54;BA.debugLine="Private toast As MyToastMessageShow";
self._toast = [b4i_mytoastmessageshow new];
 //BA.debugLineNum = 55;BA.debugLine="Private pnlloading As Panel";
self._pnlloading = [B4IPanelWrapper new];
 //BA.debugLineNum = 56;BA.debugLine="Private lblpb As Label";
self._lblpb = [B4ILabelWrapper new];
 //BA.debugLineNum = 57;BA.debugLine="Private pnlmain As Panel";
self._pnlmain = [B4IPanelWrapper new];
 //BA.debugLineNum = 58;BA.debugLine="Private SubscribeState As String";
self._subscribestate = @"";
 //BA.debugLineNum = 59;BA.debugLine="Private lblreturn_title As Label";
self._lblreturn_title = [B4ILabelWrapper new];
 //BA.debugLineNum = 60;BA.debugLine="Private lblreturn_state As Label";
self._lblreturn_state = [B4ILabelWrapper new];
 //BA.debugLineNum = 61;BA.debugLine="Private btnreturn_details As Button";
self._btnreturn_details = [B4IButtonWrapper new];
 //BA.debugLineNum = 62;BA.debugLine="Private lblprofile As Label";
self._lblprofile = [B4ILabelWrapper new];
 //BA.debugLineNum = 63;BA.debugLine="Private lblorders As Label";
self._lblorders = [B4ILabelWrapper new];
 //BA.debugLineNum = 64;BA.debugLine="Private lblnewaddress1 As Label";
self._lblnewaddress1 = [B4ILabelWrapper new];
 //BA.debugLineNum = 65;BA.debugLine="Private lblnewsletter As Label";
self._lblnewsletter = [B4ILabelWrapper new];
 //BA.debugLineNum = 66;BA.debugLine="Private lblreturns As Label";
self._lblreturns = [B4ILabelWrapper new];
 //BA.debugLineNum = 67;BA.debugLine="Private btnprofile As Button";
self._btnprofile = [B4IButtonWrapper new];
 //BA.debugLineNum = 68;BA.debugLine="Private btnpasswords As Button";
self._btnpasswords = [B4IButtonWrapper new];
 //BA.debugLineNum = 69;BA.debugLine="Private btnorders As Button";
self._btnorders = [B4IButtonWrapper new];
 //BA.debugLineNum = 70;BA.debugLine="Private btnaddress As Button";
self._btnaddress = [B4IButtonWrapper new];
 //BA.debugLineNum = 71;BA.debugLine="Private btnscribe As Button";
self._btnscribe = [B4IButtonWrapper new];
 //BA.debugLineNum = 72;BA.debugLine="Private btnreturns As Button";
self._btnreturns = [B4IButtonWrapper new];
 //BA.debugLineNum = 73;BA.debugLine="Private lblnewaddress As Label";
self._lblnewaddress = [B4ILabelWrapper new];
 //BA.debugLineNum = 74;BA.debugLine="Private lblpasswords As Label";
self._lblpasswords = [B4ILabelWrapper new];
 //BA.debugLineNum = 75;BA.debugLine="Private lbladdress1 As Label";
self._lbladdress1 = [B4ILabelWrapper new];
 //BA.debugLineNum = 76;BA.debugLine="Private lblnewsletteroption As Label";
self._lblnewsletteroption = [B4ILabelWrapper new];
 //BA.debugLineNum = 77;BA.debugLine="Private rbyes As Switch";
self._rbyes = [B4ISwitchWrapper new];
 //BA.debugLineNum = 78;BA.debugLine="Private btnapply_newsletter As Button";
self._btnapply_newsletter = [B4IButtonWrapper new];
 //BA.debugLineNum = 79;BA.debugLine="Private pnlaction As Panel";
self._pnlaction = [B4IPanelWrapper new];
 //BA.debugLineNum = 80;BA.debugLine="Private lbldefault_address As Label";
self._lbldefault_address = [B4ILabelWrapper new];
 //BA.debugLineNum = 81;BA.debugLine="Private lbledit_address As Label";
self._lbledit_address = [B4ILabelWrapper new];
 //BA.debugLineNum = 82;BA.debugLine="Private lbldelete_address As Label";
self._lbldelete_address = [B4ILabelWrapper new];
 //BA.debugLineNum = 83;BA.debugLine="Private ChoosenAddressID,ChoosenAddressValue As S";
self._choosenaddressid = @"";
self._choosenaddressvalue = @"";
 //BA.debugLineNum = 84;BA.debugLine="Private btnback_menu As Button";
self._btnback_menu = [B4IButtonWrapper new];
 //BA.debugLineNum = 85;BA.debugLine="Private lblback_menu As Label";
self._lblback_menu = [B4ILabelWrapper new];
 //BA.debugLineNum = 86;BA.debugLine="Private lblpassword_title As Label";
self._lblpassword_title = [B4ILabelWrapper new];
 //BA.debugLineNum = 87;BA.debugLine="Private txtpassword2 As TextField";
self._txtpassword2 = [B4ITextFieldWrapper new];
 //BA.debugLineNum = 88;BA.debugLine="Private lblpassword2 As Label";
self._lblpassword2 = [B4ILabelWrapper new];
 //BA.debugLineNum = 89;BA.debugLine="Private pnldetails_return As Panel";
self._pnldetails_return = [B4IPanelWrapper new];
 //BA.debugLineNum = 90;BA.debugLine="Private sv_return_details As ScrollView";
self._sv_return_details = [B4IScrollView new];
 //BA.debugLineNum = 91;BA.debugLine="Private btncancel_return As Button";
self._btncancel_return = [B4IButtonWrapper new];
 //BA.debugLineNum = 92;BA.debugLine="Private svParent As ScrollView";
self._svparent = [B4IScrollView new];
 //BA.debugLineNum = 93;BA.debugLine="Private svNewsletter As ScrollView";
self._svnewsletter = [B4IScrollView new];
 //BA.debugLineNum = 94;BA.debugLine="Private lblno As Label";
self._lblno = [B4ILabelWrapper new];
 //BA.debugLineNum = 95;BA.debugLine="Private lblyes As Label";
self._lblyes = [B4ILabelWrapper new];
 //BA.debugLineNum = 96;BA.debugLine="Private svPassword As ScrollView";
self._svpassword = [B4IScrollView new];
 //BA.debugLineNum = 97;BA.debugLine="Private svOrders As ScrollView";
self._svorders = [B4IScrollView new];
 //BA.debugLineNum = 98;BA.debugLine="Private svAddress As ScrollView";
self._svaddress = [B4IScrollView new];
 //BA.debugLineNum = 99;BA.debugLine="Private lbladdress_1 As Label";
self._lbladdress_1 = [B4ILabelWrapper new];
 //BA.debugLineNum = 100;BA.debugLine="Private pnlaction_address As Panel";
self._pnlaction_address = [B4IPanelWrapper new];
 //BA.debugLineNum = 101;BA.debugLine="Private svadd_address As ScrollView";
self._svadd_address = [B4IScrollView new];
 //BA.debugLineNum = 102;BA.debugLine="Private lbldivider As Label";
self._lbldivider = [B4ILabelWrapper new];
 //BA.debugLineNum = 103;BA.debugLine="Private btnopen As Button";
self._btnopen = [B4IButtonWrapper new];
 //BA.debugLineNum = 104;BA.debugLine="Private lbldivider_return As Label";
self._lbldivider_return = [B4ILabelWrapper new];
 //BA.debugLineNum = 105;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _returndetails_receive:(B4IMap*) _res :(NSString*) _cat{
B4IMap* _data = nil;
int _top = 0;
NSString* _vs = @"";
B4ILabelWrapper* _lblkey = nil;
B4ILabelWrapper* _lblval = nil;
B4ILabelWrapper* _divider = nil;
 //BA.debugLineNum = 1148;BA.debugLine="Sub returndetails_receive(res As Map,cat As String";
 //BA.debugLineNum = 1150;BA.debugLine="pnlloading.Visible = False";
[self._pnlloading setVisible:[self.__c False]];
 //BA.debugLineNum = 1152;BA.debugLine="sv_return_details.Panel.RemoveAllViews";
[[self._sv_return_details Panel] RemoveAllViews];
 //BA.debugLineNum = 1154;BA.debugLine="If res.ContainsKey(\"success\") Then";
if ([_res ContainsKey:(NSObject*)(@"success")]) { 
 //BA.debugLineNum = 1155;BA.debugLine="If res.Get(\"success\") = 1 Then";
if ([[_res Get:(NSObject*)(@"success")] isEqual:(NSObject*)(@(1))]) { 
 //BA.debugLineNum = 1156;BA.debugLine="Dim data As Map";
_data = [B4IMap new];
 //BA.debugLineNum = 1157;BA.debugLine="data = res.Get(\"data\")";
_data = (B4IMap*)([_res Get:(NSObject*)(@"data")]);
 //BA.debugLineNum = 1159;BA.debugLine="Dim top As Int";
_top = 0;
 //BA.debugLineNum = 1160;BA.debugLine="sv_return_details.Color = Colors.White";
[self._sv_return_details setColor:[[self.__c Colors] White]];
 //BA.debugLineNum = 1161;BA.debugLine="sv_return_details.Panel.Color = Colors.White";
[[self._sv_return_details Panel] setColor:[[self.__c Colors] White]];
 //BA.debugLineNum = 1163;BA.debugLine="sv_return_details.ContentWidth = sv_return_det";
[self._sv_return_details setContentWidth:(int) ([self._sv_return_details Width])];
 //BA.debugLineNum = 1165;BA.debugLine="For Each vs As String In data.Keys";
{
const id<B4IIterable> group11 = [_data Keys];
const int groupLen11 = group11.Size
;int index11 = 0;
;
for (; index11 < groupLen11;index11++){
_vs = [self.bi ObjectToString:[group11 Get:index11]];
 //BA.debugLineNum = 1167;BA.debugLine="If data.Get(vs) Is List Then Continue";
if ([[_data Get:(NSObject*)(_vs)] isKindOfClass: [NSArray class]]) { 
if (true) continue;};
 //BA.debugLineNum = 1169;BA.debugLine="Dim lblKey As Label";
_lblkey = [B4ILabelWrapper new];
 //BA.debugLineNum = 1170;BA.debugLine="lblKey.Initialize(\"\")";
[_lblkey Initialize:self.bi :@""];
 //BA.debugLineNum = 1171;BA.debugLine="lblKey.Color = Colors.RGB(242, 242, 242)";
[_lblkey setColor:[[self.__c Colors] RGB:(int) (242) :(int) (242) :(int) (242)]];
 //BA.debugLineNum = 1173;BA.debugLine="lblKey.TextColor = Colors.Black";
[_lblkey setTextColor:[[self.__c Colors] Black]];
 //BA.debugLineNum = 1175;BA.debugLine="lblKey.Font = Library.GetFont(14)";
[_lblkey setFont:[self._library _getfont:(int) (14)]];
 //BA.debugLineNum = 1176;BA.debugLine="lblKey.Text = \"  \" & Library.GetStringResours";
[_lblkey setText:[@[@"  ",[self._library _getstringresourse:[@[@"return_item_",_vs] componentsJoinedByString:@""]],@"  "] componentsJoinedByString:@""]];
 //BA.debugLineNum = 1178;BA.debugLine="If lblKey.Text = \"null\" Then lblKey.Text = \"-";
if ([[_lblkey Text] isEqual:@"null"]) { 
[_lblkey setText:@"-"];};
 //BA.debugLineNum = 1180;BA.debugLine="lblKey.TextAlignment = Library.GetStringResou";
[_lblkey setTextAlignment:[self.bi ObjectToNumber:[self._library _getstringresourse:@"direction_ios"]].intValue];
 //BA.debugLineNum = 1182;BA.debugLine="sv_return_details.Panel.AddView(lblKey,0,top,";
[[self._sv_return_details Panel] AddView:(UIView*)((_lblkey).object) :(float) (0) :(float) (_top) :[self._sv_return_details Width] :(float) ([self.__c DipToCurrent:(int) (40)])];
 //BA.debugLineNum = 1183;BA.debugLine="top = top + 40dip";
_top = (int) (_top+[self.__c DipToCurrent:(int) (40)]);
 //BA.debugLineNum = 1185;BA.debugLine="Dim lblVal As Label";
_lblval = [B4ILabelWrapper new];
 //BA.debugLineNum = 1186;BA.debugLine="lblVal.Initialize(\"\")";
[_lblval Initialize:self.bi :@""];
 //BA.debugLineNum = 1187;BA.debugLine="lblVal.Color = Colors.Rgb(253, 253, 253)";
[_lblval setColor:[[self.__c Colors] RGB:(int) (253) :(int) (253) :(int) (253)]];
 //BA.debugLineNum = 1189;BA.debugLine="lblVal.TextColor = Colors.Black";
[_lblval setTextColor:[[self.__c Colors] Black]];
 //BA.debugLineNum = 1190;BA.debugLine="lblVal.Text = \"  \" & data.Get(vs) & \"  \"";
[_lblval setText:[@[@"  ",[self.bi ObjectToString:[_data Get:(NSObject*)(_vs)]],@"  "] componentsJoinedByString:@""]];
 //BA.debugLineNum = 1192;BA.debugLine="lblVal.Font = Library.GetFont(12)";
[_lblval setFont:[self._library _getfont:(int) (12)]];
 //BA.debugLineNum = 1194;BA.debugLine="If lblVal.Text.ToLowerCase.IndexOf(\"null\") <>";
if ([[[_lblval Text] ToLowerCase] IndexOf:@"null"]!=-1) { 
[_lblval setText:@"-"];};
 //BA.debugLineNum = 1196;BA.debugLine="lblVal.TextAlignment = Library.GetStringResou";
[_lblval setTextAlignment:[self.bi ObjectToNumber:[self._library _getstringresourse:@"direction_ios"]].intValue];
 //BA.debugLineNum = 1198;BA.debugLine="sv_return_details.Panel.AddView(lblVal,0,top,";
[[self._sv_return_details Panel] AddView:(UIView*)((_lblval).object) :(float) (0) :(float) (_top) :[self._sv_return_details Width] :(float) ([self.__c DipToCurrent:(int) (40)])];
 //BA.debugLineNum = 1199;BA.debugLine="top = top + 47dip";
_top = (int) (_top+[self.__c DipToCurrent:(int) (47)]);
 //BA.debugLineNum = 1201;BA.debugLine="Dim divider As Label";
_divider = [B4ILabelWrapper new];
 //BA.debugLineNum = 1202;BA.debugLine="divider.Initialize(\"\")";
[_divider Initialize:self.bi :@""];
 //BA.debugLineNum = 1203;BA.debugLine="sv_return_details.Panel.AddView(divider,7,top";
[[self._sv_return_details Panel] AddView:(UIView*)((_divider).object) :(float) (7) :(float) (_top) :(float) ([self._sv_return_details Width]-10) :(float) ([self.__c DipToCurrent:(int) (1)])];
 //BA.debugLineNum = 1204;BA.debugLine="divider.Color = Colors.RGB(242,242,242)";
[_divider setColor:[[self.__c Colors] RGB:(int) (242) :(int) (242) :(int) (242)]];
 //BA.debugLineNum = 1205;BA.debugLine="top = top + 7dip";
_top = (int) (_top+[self.__c DipToCurrent:(int) (7)]);
 }
};
 //BA.debugLineNum = 1209;BA.debugLine="btncancel_return.CustomLabel.Font = Library.Ge";
[[self._btncancel_return CustomLabel] setFont:[self._library _getfont:(int) (14)]];
 //BA.debugLineNum = 1211;BA.debugLine="sv_return_details.ContentHeight = top";
[self._sv_return_details setContentHeight:_top];
 //BA.debugLineNum = 1212;BA.debugLine="pnldetails_return.Visible = True";
[self._pnldetails_return setVisible:[self.__c True]];
 //BA.debugLineNum = 1213;BA.debugLine="pnldetails_return.BringToFront";
[self._pnldetails_return BringToFront];
 };
 };
 //BA.debugLineNum = 1218;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _returns_receive:(B4IMap*) _res :(NSString*) _cat{
B4IMap* _m1 = nil;
B4IList* _l1 = nil;
int _top = 0;
int _i = 0;
B4IMap* _temp = nil;
B4IPanelWrapper* _p1 = nil;
 //BA.debugLineNum = 1031;BA.debugLine="Sub returns_receive(res As Map,cat As String)";
 //BA.debugLineNum = 1033;BA.debugLine="pnlloading.Visible = False";
[self._pnlloading setVisible:[self.__c False]];
 //BA.debugLineNum = 1035;BA.debugLine="If res.ContainsKey(\"success\") Then";
if ([_res ContainsKey:(NSObject*)(@"success")]) { 
 //BA.debugLineNum = 1036;BA.debugLine="If res.Get(\"success\") = 1 Then";
if ([[_res Get:(NSObject*)(@"success")] isEqual:(NSObject*)(@(1))]) { 
 //BA.debugLineNum = 1037;BA.debugLine="Dim m1 As Map";
_m1 = [B4IMap new];
 //BA.debugLineNum = 1038;BA.debugLine="m1.Initialize";
[_m1 Initialize];
 //BA.debugLineNum = 1039;BA.debugLine="m1 = res.Get(\"data\")";
_m1 = (B4IMap*)([_res Get:(NSObject*)(@"data")]);
 //BA.debugLineNum = 1041;BA.debugLine="Dim l1 As List";
_l1 = [B4IList new];
 //BA.debugLineNum = 1042;BA.debugLine="l1 = m1.Get(\"returns\")";
_l1.object = (NSArray*)([_m1 Get:(NSObject*)(@"returns")]);
 //BA.debugLineNum = 1044;BA.debugLine="Dim top As Int";
_top = 0;
 //BA.debugLineNum = 1045;BA.debugLine="top = 0";
_top = (int) (0);
 //BA.debugLineNum = 1046;BA.debugLine="svReturns.Panel.Color = Colors.White";
[[self._svreturns Panel] setColor:[[self.__c Colors] White]];
 //BA.debugLineNum = 1047;BA.debugLine="svReturns.Color = Colors.White";
[self._svreturns setColor:[[self.__c Colors] White]];
 //BA.debugLineNum = 1049;BA.debugLine="For i = 0 To l1.Size - 1";
{
const int step13 = 1;
const int limit13 = (int) ([_l1 Size]-1);
_i = (int) (0) ;
for (;(step13 > 0 && _i <= limit13) || (step13 < 0 && _i >= limit13) ;_i = ((int)(0 + _i + step13))  ) {
 //BA.debugLineNum = 1051;BA.debugLine="Dim temp As Map";
_temp = [B4IMap new];
 //BA.debugLineNum = 1052;BA.debugLine="temp = l1.Get(i)";
_temp = (B4IMap*)([_l1 Get:_i]);
 //BA.debugLineNum = 1054;BA.debugLine="Dim p1 As Panel";
_p1 = [B4IPanelWrapper new];
 //BA.debugLineNum = 1055;BA.debugLine="p1.Initialize(\"\")";
[_p1 Initialize:self.bi :@""];
 //BA.debugLineNum = 1057;BA.debugLine="svReturns.Panel.AddView(p1,-10,top,svReturns.W";
[[self._svreturns Panel] AddView:(UIView*)((_p1).object) :(float) (-10) :(float) (_top) :[self._svreturns Width] :(float) (0)];
 //BA.debugLineNum = 1059;BA.debugLine="If Library.IsPersian Then";
if ([self._library _ispersian]) { 
 //BA.debugLineNum = 1060;BA.debugLine="p1.LoadLayout(\"frmtemplate_returns\")";
[_p1 LoadLayout:@"frmtemplate_returns" :self.bi];
 //BA.debugLineNum = 1061;BA.debugLine="temp.Put(\"date_added\",Library.GetDate(temp.Ge";
[_temp Put:(NSObject*)(@"date_added") :(NSObject*)([self._library _getdate:[self.bi ObjectToString:[_temp Get:(NSObject*)(@"date_added")]]])];
 }else {
 //BA.debugLineNum = 1063;BA.debugLine="p1.LoadLayout(\"frmtemplate_returns_en\")";
[_p1 LoadLayout:@"frmtemplate_returns_en" :self.bi];
 };
 //BA.debugLineNum = 1066;BA.debugLine="btnreturn_details.Tag = temp.Get(\"return_id\")";
[self._btnreturn_details setTag:[_temp Get:(NSObject*)(@"return_id")]];
 //BA.debugLineNum = 1068;BA.debugLine="p1.Color = Colors.White";
[_p1 setColor:[[self.__c Colors] White]];
 //BA.debugLineNum = 1069;BA.debugLine="p1.Height = lbldivider_return.Top + 4dip";
[_p1 setHeight:(float) ([self._lbldivider_return Top]+[self.__c DipToCurrent:(int) (4)])];
 //BA.debugLineNum = 1071;BA.debugLine="lblreturn_title.Text = Library.GetStringResour";
[self._lblreturn_title setText:[[[self._library _getstringresourse:@"return_from"] Replace:@"1" :[self.bi ObjectToString:[_temp Get:(NSObject*)(@"name")]]] Replace:@"0" :[self.bi ObjectToString:[_temp Get:(NSObject*)(@"date_added")]]]];
 //BA.debugLineNum = 1072;BA.debugLine="lblreturn_state.Text = Library.GetStringResour";
[self._lblreturn_state setText:[[[self._library _getstringresourse:@"return_state"] Replace:@"1" :[self.bi ObjectToString:[_temp Get:(NSObject*)(@"status")]]] Replace:@"0" :[self.bi ObjectToString:[_temp Get:(NSObject*)(@"order_id")]]]];
 //BA.debugLineNum = 1074;BA.debugLine="lblreturn_title.Font = Library.GetFont(lblretu";
[self._lblreturn_title setFont:[self._library _getfont:(int) ([[self._lblreturn_title Font] Size])]];
 //BA.debugLineNum = 1075;BA.debugLine="lblreturn_state.Font = Library.GetFont(lblretu";
[self._lblreturn_state setFont:[self._library _getfont:(int) ([[self._lblreturn_state Font] Size])]];
 //BA.debugLineNum = 1076;BA.debugLine="Library.SetFont(btnreturn_details.CustomLabel,";
[self._library _setfont:(B4IViewWrapper*) [B4IObjectWrapper createWrapper:[B4IViewWrapper new] object:(UIView*)(([self._btnreturn_details CustomLabel]).object)] :@"icomoon" :(int) (18)];
 //BA.debugLineNum = 1077;BA.debugLine="lblreturn_title.TextAlignment = Library.GetStr";
[self._lblreturn_title setTextAlignment:[self.bi ObjectToNumber:[self._library _getstringresourse:@"direction_ios"]].intValue];
 //BA.debugLineNum = 1078;BA.debugLine="lblreturn_state.TextAlignment = Library.GetStr";
[self._lblreturn_state setTextAlignment:[self.bi ObjectToNumber:[self._library _getstringresourse:@"direction_ios"]].intValue];
 //BA.debugLineNum = 1080;BA.debugLine="top = top + p1.Height";
_top = (int) (_top+[_p1 Height]);
 }
};
 //BA.debugLineNum = 1084;BA.debugLine="svReturns.Panel.Height = top + 140dip";
[[self._svreturns Panel] setHeight:(float) (_top+[self.__c DipToCurrent:(int) (140)])];
 //BA.debugLineNum = 1085;BA.debugLine="svReturns.ContentWidth = Library.GetWidth - pnl";
[self._svreturns setContentWidth:(int) ([self._library _getwidth]-[self._pnlmenu Width]-[self.__c DipToCurrent:(int) (30)])];
 //BA.debugLineNum = 1086;BA.debugLine="svReturns.ContentHeight = top + 100dip";
[self._svreturns setContentHeight:(int) (_top+[self.__c DipToCurrent:(int) (100)])];
 //BA.debugLineNum = 1088;BA.debugLine="Return";
if (true) return @"";
 };
 };
 //BA.debugLineNum = 1093;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _startactivity{
B4IViewWrapper* _v2 = nil;
B4IButtonWrapper* _b = nil;
b4i_opencart* _op1 = nil;
b4i_opencart* _opcountry = nil;
 //BA.debugLineNum = 107;BA.debugLine="Sub StartActivity";
 //BA.debugLineNum = 109;BA.debugLine="Library.AccountPage.Initialize(\"pageAccount\")";
[self._library._accountpage Initialize:self.bi :@"pageAccount"];
 //BA.debugLineNum = 110;BA.debugLine="Library.AccountPage.RootPanel.LoadLayout(\"frmacco";
[[self._library._accountpage RootPanel] LoadLayout:@"frmaccounts" :self.bi];
 //BA.debugLineNum = 111;BA.debugLine="Library.NavControl.ShowPage(Library.AccountPage)";
[self._library._navcontrol ShowPage:(UIViewController*)((self._library._accountpage).object)];
 //BA.debugLineNum = 113;BA.debugLine="pnlmenu.Color = Library.Theme_Header";
[self._pnlmenu setColor:self._library._theme_header];
 //BA.debugLineNum = 114;BA.debugLine="Library.AccountPage.RootPanel.Color = Library.The";
[[self._library._accountpage RootPanel] setColor:self._library._theme_header];
 //BA.debugLineNum = 116;BA.debugLine="toast.Initialize(Library.AccountPage.RootPanel)";
[self._toast _initialize:self.bi :[self._library._accountpage RootPanel]];
 //BA.debugLineNum = 117;BA.debugLine="tmrOpenMenu.Initialize(\"tmrOpenMenu\",250)";
[self._tmropenmenu Initialize:self.bi :@"tmrOpenMenu" :(long long) (250)];
 //BA.debugLineNum = 119;BA.debugLine="lblpb.Text = Library.GetStringResourse(\"loading\")";
[self._lblpb setText:[self._library _getstringresourse:@"loading"]];
 //BA.debugLineNum = 120;BA.debugLine="Library.GetButtonState(btncancel_return)";
[self._library _getbuttonstate:self._btncancel_return];
 //BA.debugLineNum = 121;BA.debugLine="btncancel_return.Text = Library.GetStringResourse";
[self._btncancel_return setText:[self._library _getstringresourse:@"cancel"]];
 //BA.debugLineNum = 122;BA.debugLine="pnlloading.Visible = True";
[self._pnlloading setVisible:[self.__c True]];
 //BA.debugLineNum = 124;BA.debugLine="svParent.Panel.LoadLayout(\"frmaccount_details\")";
[[self._svparent Panel] LoadLayout:@"frmaccount_details" :self.bi];
 //BA.debugLineNum = 125;BA.debugLine="svParent.ContentWidth = Library.GetWidth - pnlmen";
[self._svparent setContentWidth:(int) ([self._library _getwidth]-[self._pnlmenu Width]-[self.__c DipToCurrent:(int) (30)])];
 //BA.debugLineNum = 126;BA.debugLine="svParent.ContentHeight = btnsave.Top + btnsave.He";
[self._svparent setContentHeight:(int) ([self._btnsave Top]+[self._btnsave Height]+[self.__c DipToCurrent:(int) (30)])];
 //BA.debugLineNum = 128;BA.debugLine="lblname.Text = Library.GetStringResourse(\"lblname";
[self._lblname setText:[self._library _getstringresourse:@"lblname"]];
 //BA.debugLineNum = 129;BA.debugLine="lblfamily.Text = Library.GetStringResourse(\"lblfa";
[self._lblfamily setText:[self._library _getstringresourse:@"lblfamily"]];
 //BA.debugLineNum = 130;BA.debugLine="lblemail.Text = Library.GetStringResourse(\"lblema";
[self._lblemail setText:[self._library _getstringresourse:@"lblemail"]];
 //BA.debugLineNum = 131;BA.debugLine="lblfax.Text = Library.GetStringResourse(\"lblfax\")";
[self._lblfax setText:[self._library _getstringresourse:@"lblfax"]];
 //BA.debugLineNum = 132;BA.debugLine="lblphone.Text = Library.GetStringResourse(\"lblpho";
[self._lblphone setText:[self._library _getstringresourse:@"lblphone"]];
 //BA.debugLineNum = 133;BA.debugLine="btnsave.Text = Library.GetStringResourse(\"save_de";
[self._btnsave setText:[self._library _getstringresourse:@"save_details"]];
 //BA.debugLineNum = 134;BA.debugLine="Library.GetButtonState(btnsave)";
[self._library _getbuttonstate:self._btnsave];
 //BA.debugLineNum = 136;BA.debugLine="svadd_address.Panel.LoadLayout(\"frmaccount_add_ad";
[[self._svadd_address Panel] LoadLayout:@"frmaccount_add_address" :self.bi];
 //BA.debugLineNum = 137;BA.debugLine="txtaddress.Color = Colors.RGB(250,250,250)";
[self._txtaddress setColor:[[self.__c Colors] RGB:(int) (250) :(int) (250) :(int) (250)]];
 //BA.debugLineNum = 138;BA.debugLine="txtpostal_enter.Color = Colors.RGB(250,250,250)";
[self._txtpostal_enter setColor:[[self.__c Colors] RGB:(int) (250) :(int) (250) :(int) (250)]];
 //BA.debugLineNum = 139;BA.debugLine="lblcountry.Text = Library.GetStringResourse(\"coun";
[self._lblcountry setText:[self._library _getstringresourse:@"country"]];
 //BA.debugLineNum = 140;BA.debugLine="lblcity.Text =  Library.GetStringResourse(\"city\")";
[self._lblcity setText:[self._library _getstringresourse:@"city"]];
 //BA.debugLineNum = 141;BA.debugLine="lbladdress.Text =  Library.GetStringResourse(\"add";
[self._lbladdress setText:[self._library _getstringresourse:@"address1"]];
 //BA.debugLineNum = 142;BA.debugLine="btnadd.Text = Library.GetStringResourse(\"new_addr";
[self._btnadd setText:[self._library _getstringresourse:@"new_address"]];
 //BA.debugLineNum = 143;BA.debugLine="btncancel_new_address.Text = Library.GetStringRes";
[self._btncancel_new_address setText:[self._library _getstringresourse:@"cancel"]];
 //BA.debugLineNum = 144;BA.debugLine="lblpostal_enter.Text = Library.GetStringResourse(";
[self._lblpostal_enter setText:[self._library _getstringresourse:@"postal"]];
 //BA.debugLineNum = 145;BA.debugLine="svadd_address.ContentWidth = Library.GetWidth - p";
[self._svadd_address setContentWidth:(int) ([self._library _getwidth]-[self._pnlmenu Width]-[self.__c DipToCurrent:(int) (30)])];
 //BA.debugLineNum = 146;BA.debugLine="svadd_address.ContentHeight = 600";
[self._svadd_address setContentHeight:(int) (600)];
 //BA.debugLineNum = 148;BA.debugLine="svOrders.Panel.Color = Colors.RGB(247, 244, 244)";
[[self._svorders Panel] setColor:[[self.__c Colors] RGB:(int) (247) :(int) (244) :(int) (244)]];
 //BA.debugLineNum = 151;BA.debugLine="svNewsletter.panel.LoadLayout(\"frmaccount_newslet";
[[self._svnewsletter Panel] LoadLayout:@"frmaccount_newsletter" :self.bi];
 //BA.debugLineNum = 152;BA.debugLine="lblnewsletteroption.TextAlignment = Library.GetSt";
[self._lblnewsletteroption setTextAlignment:[self.bi ObjectToNumber:[self._library _getstringresourse:@"direction_ios"]].intValue];
 //BA.debugLineNum = 153;BA.debugLine="lblnewsletteroption.Font = Library.GetFont(14)";
[self._lblnewsletteroption setFont:[self._library _getfont:(int) (14)]];
 //BA.debugLineNum = 154;BA.debugLine="btnapply_newsletter.Text = Library.GetStringResou";
[self._btnapply_newsletter setText:[self._library _getstringresourse:@"scribe_change_state"]];
 //BA.debugLineNum = 155;BA.debugLine="Library.GetButtonState(btnapply_newsletter)";
[self._library _getbuttonstate:self._btnapply_newsletter];
 //BA.debugLineNum = 156;BA.debugLine="lblyes.Text = Library.GetStringResourse(\"subscrib";
[self._lblyes setText:[self._library _getstringresourse:@"subscribe"]];
 //BA.debugLineNum = 157;BA.debugLine="lblno.Text = Library.GetStringResourse(\"unsubscri";
[self._lblno setText:[self._library _getstringresourse:@"unsubscribe"]];
 //BA.debugLineNum = 158;BA.debugLine="svNewsletter.ContentWidth = Library.GetWidth - pn";
[self._svnewsletter setContentWidth:(int) ([self._library _getwidth]-[self._pnlmenu Width]-[self.__c DipToCurrent:(int) (30)])];
 //BA.debugLineNum = 159;BA.debugLine="svNewsletter.ContentHeight = 300";
[self._svnewsletter setContentHeight:(int) (300)];
 //BA.debugLineNum = 160;BA.debugLine="btnapply_newsletter.CustomLabel.Font = Library.Ge";
[[self._btnapply_newsletter CustomLabel] setFont:[self._library _getfont:(int) (14)]];
 //BA.debugLineNum = 164;BA.debugLine="svPassword.Panel.LoadLayout(\"frmaccount_password\"";
[[self._svpassword Panel] LoadLayout:@"frmaccount_password" :self.bi];
 //BA.debugLineNum = 165;BA.debugLine="lblpassword.TextAlignment = Library.GetStringReso";
[self._lblpassword setTextAlignment:[self.bi ObjectToNumber:[self._library _getstringresourse:@"direction_ios"]].intValue];
 //BA.debugLineNum = 166;BA.debugLine="lblpassword2.TextAlignment = Library.GetStringRes";
[self._lblpassword2 setTextAlignment:[self.bi ObjectToNumber:[self._library _getstringresourse:@"direction_ios"]].intValue];
 //BA.debugLineNum = 167;BA.debugLine="lblpassword_title.TextAlignment = Library.GetStri";
[self._lblpassword_title setTextAlignment:[self.bi ObjectToNumber:[self._library _getstringresourse:@"direction_ios"]].intValue];
 //BA.debugLineNum = 168;BA.debugLine="lblpassword.Text = Library.GetStringResourse(\"lbl";
[self._lblpassword setText:[self._library _getstringresourse:@"lblpassword"]];
 //BA.debugLineNum = 169;BA.debugLine="lblpassword2.Text = Library.GetStringResourse(\"lb";
[self._lblpassword2 setText:[self._library _getstringresourse:@"lblpassword2"]];
 //BA.debugLineNum = 170;BA.debugLine="lblpassword_title.Text = Library.GetStringResours";
[self._lblpassword_title setText:[self._library _getstringresourse:@"password_title"]];
 //BA.debugLineNum = 171;BA.debugLine="btnpassword.Text = Library.GetStringResourse(\"sav";
[self._btnpassword setText:[self._library _getstringresourse:@"save_password"]];
 //BA.debugLineNum = 172;BA.debugLine="Library.GetButtonState(btnpassword)";
[self._library _getbuttonstate:self._btnpassword];
 //BA.debugLineNum = 173;BA.debugLine="txtpassword.TextAlignment = txtpassword.ALIGNMENT";
[self._txtpassword setTextAlignment:[self._txtpassword ALIGNMENT_LEFT]];
 //BA.debugLineNum = 174;BA.debugLine="txtpassword.PasswordMode = True";
[self._txtpassword setPasswordMode:[self.__c True]];
 //BA.debugLineNum = 175;BA.debugLine="txtpassword.Color = Colors.RGB(250,250,250)";
[self._txtpassword setColor:[[self.__c Colors] RGB:(int) (250) :(int) (250) :(int) (250)]];
 //BA.debugLineNum = 176;BA.debugLine="txtpassword2.Color = Colors.RGB(250,250,250)";
[self._txtpassword2 setColor:[[self.__c Colors] RGB:(int) (250) :(int) (250) :(int) (250)]];
 //BA.debugLineNum = 177;BA.debugLine="Library.LabelSpace(lblpassword_title,1.3)";
[self._library _labelspace:(B4IViewWrapper*) [B4IObjectWrapper createWrapper:[B4IViewWrapper new] object:(UIView*)((self._lblpassword_title).object)] :(float) (1.3)];
 //BA.debugLineNum = 178;BA.debugLine="svPassword.ContentWidth = Library.GetWidth - pnlm";
[self._svpassword setContentWidth:(int) ([self._library _getwidth]-[self._pnlmenu Width]-[self.__c DipToCurrent:(int) (30)])];
 //BA.debugLineNum = 179;BA.debugLine="svPassword.ContentHeight = 300";
[self._svpassword setContentHeight:(int) (300)];
 //BA.debugLineNum = 182;BA.debugLine="lblcountry.TextAlignment = Library.GetStringResou";
[self._lblcountry setTextAlignment:[self.bi ObjectToNumber:[self._library _getstringresourse:@"direction"]].intValue];
 //BA.debugLineNum = 183;BA.debugLine="lblcity.TextAlignment = Library.GetStringResourse";
[self._lblcity setTextAlignment:[self.bi ObjectToNumber:[self._library _getstringresourse:@"direction"]].intValue];
 //BA.debugLineNum = 184;BA.debugLine="lbladdress.TextAlignment = Library.GetStringResou";
[self._lbladdress setTextAlignment:[self.bi ObjectToNumber:[self._library _getstringresourse:@"direction"]].intValue];
 //BA.debugLineNum = 185;BA.debugLine="lblpostal_enter.TextAlignment = Library.GetString";
[self._lblpostal_enter setTextAlignment:[self.bi ObjectToNumber:[self._library _getstringresourse:@"direction"]].intValue];
 //BA.debugLineNum = 187;BA.debugLine="lblprofile.Text = Library.GetStringResourse(\"retu";
[self._lblprofile setText:[self._library _getstringresourse:@"return_menu_profile"]];
 //BA.debugLineNum = 188;BA.debugLine="lblpasswords.Text = Library.GetStringResourse(\"re";
[self._lblpasswords setText:[self._library _getstringresourse:@"return_menu_pass"]];
 //BA.debugLineNum = 189;BA.debugLine="lblorders.Text = Library.GetStringResourse(\"retur";
[self._lblorders setText:[self._library _getstringresourse:@"return_menu_orders"]];
 //BA.debugLineNum = 190;BA.debugLine="lbladdress1.Text = Library.GetStringResourse(\"ret";
[self._lbladdress1 setText:[self._library _getstringresourse:@"return_menu_address"]];
 //BA.debugLineNum = 191;BA.debugLine="lblnewaddress1.Text = Library.GetStringResourse(\"";
[self._lblnewaddress1 setText:[self._library _getstringresourse:@"return_menu_new_address"]];
 //BA.debugLineNum = 192;BA.debugLine="lblnewsletter.Text = Library.GetStringResourse(\"r";
[self._lblnewsletter setText:[self._library _getstringresourse:@"return_menu_news"]];
 //BA.debugLineNum = 193;BA.debugLine="lblreturns.Text = Library.GetStringResourse(\"retu";
[self._lblreturns setText:[self._library _getstringresourse:@"return_menu_returns"]];
 //BA.debugLineNum = 194;BA.debugLine="lbldelete_address.Text = Library.GetStringResours";
[self._lbldelete_address setText:[self._library _getstringresourse:@"delete_address"]];
 //BA.debugLineNum = 195;BA.debugLine="lbldefault_address.Text = Library.GetStringResour";
[self._lbldefault_address setText:[self._library _getstringresourse:@"default_address"]];
 //BA.debugLineNum = 196;BA.debugLine="lbledit_address.Text = Library.GetStringResourse(";
[self._lbledit_address setText:[self._library _getstringresourse:@"edit"]];
 //BA.debugLineNum = 197;BA.debugLine="lblback_menu.Text = Library.GetStringResourse(\"ba";
[self._lblback_menu setText:[self._library _getstringresourse:@"back"]];
 //BA.debugLineNum = 198;BA.debugLine="Library.SetFont(lblnewaddress,\"icomoon\",14)";
[self._library _setfont:(B4IViewWrapper*) [B4IObjectWrapper createWrapper:[B4IViewWrapper new] object:(UIView*)((self._lblnewaddress).object)] :@"icomoon" :(int) (14)];
 //BA.debugLineNum = 200;BA.debugLine="For Each v2 As View In pnlmenu.GetAllViewsRecursi";
_v2 = [B4IViewWrapper new];
{
const id<B4IIterable> group76 = [self._pnlmenu GetAllViewsRecursive];
const int groupLen76 = group76.Size
;int index76 = 0;
;
for (; index76 < groupLen76;index76++){
_v2.object = (UIView*)([group76 Get:index76]);
 //BA.debugLineNum = 201;BA.debugLine="If v2 Is Button Then";
if ([_v2.objectOrNull isKindOfClass: [UIButton class]]) { 
 //BA.debugLineNum = 202;BA.debugLine="Dim b As Button";
_b = [B4IButtonWrapper new];
 //BA.debugLineNum = 203;BA.debugLine="b = v2";
_b.object = (UIButton*)((_v2).object);
 //BA.debugLineNum = 204;BA.debugLine="Library.SetFont(b,\"icomoon\",b.CustomLabel.Font.";
[self._library _setfont:(B4IViewWrapper*) [B4IObjectWrapper createWrapper:[B4IViewWrapper new] object:(UIView*)((_b).object)] :@"icomoon" :(int) ([[[_b CustomLabel] Font] Size])];
 };
 }
};
 //BA.debugLineNum = 208;BA.debugLine="ChangeViewSetting";
[self _changeviewsetting];
 //BA.debugLineNum = 209;BA.debugLine="pnlloading.Visible = True";
[self._pnlloading setVisible:[self.__c True]];
 //BA.debugLineNum = 211;BA.debugLine="Dim op1 As OpenCart";
_op1 = [b4i_opencart new];
 //BA.debugLineNum = 212;BA.debugLine="op1.Initialize";
[_op1 _initialize:self.bi];
 //BA.debugLineNum = 213;BA.debugLine="op1.UserDetails(Me,\"getDetails_receive\")";
[_op1 _userdetails:self :@"getDetails_receive"];
 //BA.debugLineNum = 215;BA.debugLine="Dim opCountry As OpenCart";
_opcountry = [b4i_opencart new];
 //BA.debugLineNum = 216;BA.debugLine="opCountry.Initialize";
[_opcountry _initialize:self.bi];
 //BA.debugLineNum = 217;BA.debugLine="opCountry.GetCountry(Me,\"country_receive\")";
[_opcountry _getcountry:self :@"country_receive"];
 //BA.debugLineNum = 219;BA.debugLine="If Library.IsPersian Then";
if ([self._library _ispersian]) { 
 //BA.debugLineNum = 220;BA.debugLine="pnlmain.Left = 0";
[self._pnlmain setLeft:(float) (0)];
 //BA.debugLineNum = 221;BA.debugLine="pnlmenu.Left = Library.GetWidth + pnlmain.Width";
[self._pnlmenu setLeft:(float) ([self._library _getwidth]+[self._pnlmain Width])];
 };
 //BA.debugLineNum = 224;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _subsribe_receive:(B4IMap*) _res :(NSString*) _cat{
 //BA.debugLineNum = 982;BA.debugLine="Sub subsribe_receive(res As Map,cat As String)";
 //BA.debugLineNum = 984;BA.debugLine="Library.HUD.ProgressDialogHide";
[self._library._hud ProgressDialogHide];
 //BA.debugLineNum = 985;BA.debugLine="pnlloading.Visible = False";
[self._pnlloading setVisible:[self.__c False]];
 //BA.debugLineNum = 987;BA.debugLine="If res.IsInitialized Then";
if ([_res IsInitialized]) { 
 //BA.debugLineNum = 988;BA.debugLine="If res.ContainsKey(\"success\") Then";
if ([_res ContainsKey:(NSObject*)(@"success")]) { 
 //BA.debugLineNum = 989;BA.debugLine="If res.Get(\"success\") = 1 Then";
if ([[_res Get:(NSObject*)(@"success")] isEqual:(NSObject*)(@(1))]) { 
 //BA.debugLineNum = 991;BA.debugLine="If SubscribeState = \"1\" Then";
if ([self._subscribestate isEqual:@"1"]) { 
 //BA.debugLineNum = 992;BA.debugLine="rbyes.Value = False";
[self._rbyes setValue:[self.__c False]];
 //BA.debugLineNum = 993;BA.debugLine="lblyes.Visible = False";
[self._lblyes setVisible:[self.__c False]];
 //BA.debugLineNum = 994;BA.debugLine="lblno.Visible = True";
[self._lblno setVisible:[self.__c True]];
 //BA.debugLineNum = 995;BA.debugLine="lblnewsletteroption.Text = Library.GetStringR";
[self._lblnewsletteroption setText:[self._library _getstringresourse:@"scribe_state_1"]];
 }else {
 //BA.debugLineNum = 997;BA.debugLine="lblyes.Visible = True";
[self._lblyes setVisible:[self.__c True]];
 //BA.debugLineNum = 998;BA.debugLine="rbyes.Value = True";
[self._rbyes setValue:[self.__c True]];
 //BA.debugLineNum = 999;BA.debugLine="lblno.Visible = False";
[self._lblno setVisible:[self.__c False]];
 //BA.debugLineNum = 1000;BA.debugLine="rbyes.Visible = True";
[self._rbyes setVisible:[self.__c True]];
 //BA.debugLineNum = 1001;BA.debugLine="lblnewsletteroption.Text = Library.GetStringR";
[self._lblnewsletteroption setText:[self._library _getstringresourse:@"scribe_state_0"]];
 };
 };
 };
 };
 //BA.debugLineNum = 1008;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _tmropenmenu_tick{
 //BA.debugLineNum = 627;BA.debugLine="Sub tmrOpenMenu_Tick";
 //BA.debugLineNum = 629;BA.debugLine="tmrOpenMenu.Enabled = False";
[self._tmropenmenu setEnabled:[self.__c False]];
 //BA.debugLineNum = 631;BA.debugLine="If Library.IsPersian Then";
if ([self._library _ispersian]) { 
 //BA.debugLineNum = 632;BA.debugLine="pnlmenu.Left = Library.GetWidth";
[self._pnlmenu setLeft:(float) ([self._library _getwidth])];
 //BA.debugLineNum = 633;BA.debugLine="pnlmenu.SetLayoutAnimated(800,1,pnlmain.Width,pn";
[self._pnlmenu SetLayoutAnimated:(int) (800) :(float) (1) :[self._pnlmain Width] :[self._pnlmenu Top] :[self._pnlmenu Width] :[self._pnlmenu Height]];
 }else {
 //BA.debugLineNum = 635;BA.debugLine="pnlmenu.SetLayoutAnimated(800,1,0,pnlmenu.Top,pn";
[self._pnlmenu SetLayoutAnimated:(int) (800) :(float) (1) :(float) (0) :[self._pnlmenu Top] :[self._pnlmenu Width] :[self._pnlmenu Height]];
 };
 //BA.debugLineNum = 638;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _tomixcase:(NSString*) _entry{
B4IStringBuilder* _sb = nil;
B4IMatcher* _m = nil;
int _i = 0;
 //BA.debugLineNum = 1108;BA.debugLine="Sub ToMixCase(Entry As String) As String";
 //BA.debugLineNum = 1110;BA.debugLine="Dim sb As StringBuilder";
_sb = [B4IStringBuilder new];
 //BA.debugLineNum = 1111;BA.debugLine="Dim m As Matcher";
_m = [B4IMatcher new];
 //BA.debugLineNum = 1112;BA.debugLine="Dim I As Int";
_i = 0;
 //BA.debugLineNum = 1114;BA.debugLine="Entry = Entry.ToLowerCase";
_entry = [_entry ToLowerCase];
 //BA.debugLineNum = 1116;BA.debugLine="sb.Initialize";
[_sb Initialize];
 //BA.debugLineNum = 1118;BA.debugLine="m = Regex.Matcher(\"(^\\w)|(\\s\\w)\", Entry)";
_m = [[self.__c Regex] Matcher:@"(^\\w)|(\\s\\w)" :_entry];
 //BA.debugLineNum = 1120;BA.debugLine="Do While m.Find";
while ([_m Find]) {
 //BA.debugLineNum = 1122;BA.debugLine="If m.Match.Length > 1 Then";
if ([[_m Match] Length]>1) { 
 //BA.debugLineNum = 1124;BA.debugLine="sb.Append(Entry.SubString2(I, m.GetStart";
[_sb Append:[_entry SubString2:_i :(int) ([_m GetStart:(int) (0)]+1)]];
 //BA.debugLineNum = 1125;BA.debugLine="sb.Append(m.Match.SubString(1).ToUpperCa";
[_sb Append:[[[_m Match] SubString:(int) (1)] ToUpperCase]];
 }else {
 //BA.debugLineNum = 1129;BA.debugLine="sb.Append(Entry.SubString2(I, m.GetStart";
[_sb Append:[_entry SubString2:_i :[_m GetStart:(int) (0)]]];
 //BA.debugLineNum = 1130;BA.debugLine="sb.Append(m.Match.ToUpperCase)";
[_sb Append:[[_m Match] ToUpperCase]];
 };
 //BA.debugLineNum = 1134;BA.debugLine="I = m.GetEnd(0)";
_i = [_m GetEnd:(int) (0)];
 }
;
 //BA.debugLineNum = 1138;BA.debugLine="If I < Entry.Length Then";
if (_i<[_entry Length]) { 
 //BA.debugLineNum = 1140;BA.debugLine="sb.Append(Entry.SubString(I))";
[_sb Append:[_entry SubString:_i]];
 };
 //BA.debugLineNum = 1144;BA.debugLine="Return sb.ToString";
if (true) return [_sb ToString];
 //BA.debugLineNum = 1146;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _txtcountry_itemselected:(int) _column :(int) _row{
int _i = 0;
B4IMap* _m1 = nil;
b4i_opencart* _opcity = nil;
 //BA.debugLineNum = 538;BA.debugLine="Sub txtcountry_ItemSelected (Column As Int, Row As";
 //BA.debugLineNum = 540;BA.debugLine="pnlloading.Visible = True";
[self._pnlloading setVisible:[self.__c True]];
 //BA.debugLineNum = 542;BA.debugLine="For i = 0 To listCountries.Size - 1";
{
const int step2 = 1;
const int limit2 = (int) ([self._listcountries Size]-1);
_i = (int) (0) ;
for (;(step2 > 0 && _i <= limit2) || (step2 < 0 && _i >= limit2) ;_i = ((int)(0 + _i + step2))  ) {
 //BA.debugLineNum = 544;BA.debugLine="Dim m1 As Map";
_m1 = [B4IMap new];
 //BA.debugLineNum = 545;BA.debugLine="m1 = listCountries.Get(i)";
_m1 = (B4IMap*)([self._listcountries Get:_i]);
 //BA.debugLineNum = 547;BA.debugLine="If m1.Get(\"name\") = txtcountry.GetSelectedItem(0";
if ([[_m1 Get:(NSObject*)(@"name")] isEqual:[self._txtcountry GetSelectedItem:(int) (0)]]) { 
 //BA.debugLineNum = 548;BA.debugLine="pnlloading.Visible = True";
[self._pnlloading setVisible:[self.__c True]];
 //BA.debugLineNum = 549;BA.debugLine="Dim opCity As OpenCart";
_opcity = [b4i_opencart new];
 //BA.debugLineNum = 550;BA.debugLine="opCity.Initialize";
[_opcity _initialize:self.bi];
 //BA.debugLineNum = 551;BA.debugLine="opCity.GetCity(Me,\"city_receive\",m1.Get(\"countr";
[_opcity _getcity:self :@"city_receive" :[self.bi ObjectToString:[_m1 Get:(NSObject*)(@"country_id")]]];
 //BA.debugLineNum = 552;BA.debugLine="Return";
if (true) return @"";
 };
 }
};
 //BA.debugLineNum = 557;BA.debugLine="pnlloading.Visible = False";
[self._pnlloading setVisible:[self.__c False]];
 //BA.debugLineNum = 559;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _txtfax_focuschanged:(BOOL) _hasfocus{
 //BA.debugLineNum = 1327;BA.debugLine="Sub txtfax_FocusChanged (HasFocus As Boolean)";
 //BA.debugLineNum = 1329;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _txtphone_focuschanged:(BOOL) _hasfocus{
 //BA.debugLineNum = 1323;BA.debugLine="Sub txtphone_FocusChanged (HasFocus As Boolean)";
 //BA.debugLineNum = 1325;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _updatedetails_receive:(B4IMap*) _res :(NSString*) _cat{
 //BA.debugLineNum = 681;BA.debugLine="Sub updatedetails_receive(res As Map,cat As String";
 //BA.debugLineNum = 683;BA.debugLine="Library.HUD.ProgressDialogHide";
[self._library._hud ProgressDialogHide];
 //BA.debugLineNum = 684;BA.debugLine="pnlloading.Visible = False";
[self._pnlloading setVisible:[self.__c False]];
 //BA.debugLineNum = 686;BA.debugLine="If res.ContainsKey(\"success\") Then";
if ([_res ContainsKey:(NSObject*)(@"success")]) { 
 //BA.debugLineNum = 687;BA.debugLine="If res.Get(\"success\") = 1 Then";
if ([[_res Get:(NSObject*)(@"success")] isEqual:(NSObject*)(@(1))]) { 
 //BA.debugLineNum = 688;BA.debugLine="toast.ShowToastMessageShow(Library.GetStringRes";
[self._toast _showtoastmessageshow:[self._library _getstringresourse:@"success_save_details"] :(long long) (2) :[self.__c True]];
 //BA.debugLineNum = 689;BA.debugLine="Return";
if (true) return @"";
 };
 };
 //BA.debugLineNum = 693;BA.debugLine="End Sub";
return @"";
}
@end
