
#import "b4i_actregister.h"
#import "b4i_main.h"
#import "b4i_actmenu.h"
#import "b4i_library.h"
#import "b4i_imagedownloader.h"
#import "b4i_actsearch.h"
#import "b4i_opencart.h"
#import "b4i_actaccount.h"
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


@implementation b4i_actregister 


+ (instancetype)new {
    static b4i_actregister* shared = nil;
    if (shared == nil) {
        shared = [self alloc];
        shared.bi = [[B4I alloc] init:shared];
        shared.__c = [B4ICommon new];
    }
    return shared;
}

- (_responseadditem*)  _additem:(NSString*) _title :(NSString*) _stype :(NSString*) _sname :(NSObject*) _tag :(BOOL) _showicon{
B4IViewWrapper* _v1 = nil;
B4ITextFieldWrapper* _txt1 = nil;
B4IPickerWrapper* _sp = nil;
B4IList* _lss = nil;
int _i = 0;
B4ILabelWrapper* _lbl1 = nil;
_responseadditem* _st = nil;
 //BA.debugLineNum = 373;BA.debugLine="Sub AddItem(Title As String,sType As String,sName";
 //BA.debugLineNum = 375;BA.debugLine="Dim v1 As View";
_v1 = [B4IViewWrapper new];
 //BA.debugLineNum = 378;BA.debugLine="If sType = \"text\" Then";
if ([_stype isEqual:@"text"]) { 
 //BA.debugLineNum = 379;BA.debugLine="Dim txt1 As TextField";
_txt1 = [B4ITextFieldWrapper new];
 //BA.debugLineNum = 380;BA.debugLine="txt1.Initialize(\"txtdata\")";
[_txt1 Initialize:self.bi :@"txtdata"];
 //BA.debugLineNum = 381;BA.debugLine="txt1.Color = Colors.White";
[_txt1 setColor:[[self.__c Colors] White]];
 //BA.debugLineNum = 382;BA.debugLine="txt1.TextColor = Colors.Black";
[_txt1 setTextColor:[[self.__c Colors] Black]];
 //BA.debugLineNum = 383;BA.debugLine="txt1.Font = Library.GetFont(14)";
[_txt1 setFont:[self._library _getfont:(int) (14)]];
 //BA.debugLineNum = 384;BA.debugLine="txt1.TextAlignment = Library.GetStringResourse(\"";
[_txt1 setTextAlignment:[self.bi ObjectToNumber:[self._library _getstringresourse:@"direction_ios"]].intValue];
 //BA.debugLineNum = 385;BA.debugLine="txt1.Tag = sName";
[_txt1 setTag:(NSObject*)(_sname)];
 //BA.debugLineNum = 386;BA.debugLine="v1 = txt1";
_v1.object = (UIView*)((_txt1).object);
 //BA.debugLineNum = 388;BA.debugLine="If sName = \"address_1\" Then";
if ([_sname isEqual:@"address_1"]) { 
 //BA.debugLineNum = 389;BA.debugLine="txt1.AdjustFontSizeToFit = True";
[_txt1 setAdjustFontSizeToFit:[self.__c True]];
 };
 //BA.debugLineNum = 393;BA.debugLine="If sName = \"telephone\" Or sName = \"postcode\" Or";
if ([_sname isEqual:@"telephone"] || [_sname isEqual:@"postcode"] || [_sname isEqual:@"fax"]) { 
 //BA.debugLineNum = 394;BA.debugLine="txt1.KeyboardType = txt1.TYPE_NUMBERS_AND_PUNCT";
[_txt1 setKeyboardType:[_txt1 TYPE_NUMBERS_AND_PUNCTUATIONS]];
 //BA.debugLineNum = 395;BA.debugLine="txt1.ReturnKey = txt1.RETURN_DONE";
[_txt1 setReturnKey:[_txt1 RETURN_DONE]];
 //BA.debugLineNum = 396;BA.debugLine="txt1.TextAlignment = txt1.ALIGNMENT_LEFT";
[_txt1 setTextAlignment:[_txt1 ALIGNMENT_LEFT]];
 //BA.debugLineNum = 399;BA.debugLine="If ShowIcon = True Then";
if (_showicon==[self.__c True]) { 
 };
 }else if([_sname isEqual:@"password"]) { 
 //BA.debugLineNum = 404;BA.debugLine="txt1.PasswordMode = True";
[_txt1 setPasswordMode:[self.__c True]];
 //BA.debugLineNum = 405;BA.debugLine="txt1.TextAlignment = txt1.ALIGNMENT_LEFT";
[_txt1 setTextAlignment:[_txt1 ALIGNMENT_LEFT]];
 //BA.debugLineNum = 406;BA.debugLine="If ShowIcon = True Then";
if (_showicon==[self.__c True]) { 
 };
 }else if([_sname isEqual:@"email"]) { 
 //BA.debugLineNum = 411;BA.debugLine="txt1.TextAlignment = txt1.ALIGNMENT_LEFT";
[_txt1 setTextAlignment:[_txt1 ALIGNMENT_LEFT]];
 //BA.debugLineNum = 412;BA.debugLine="txt1.KeyboardType = txt1.TYPE_EMAIL_ADDRESS";
[_txt1 setKeyboardType:[_txt1 TYPE_EMAIL_ADDRESS]];
 //BA.debugLineNum = 413;BA.debugLine="If ShowIcon = True Then";
if (_showicon==[self.__c True]) { 
 };
 }else {
 //BA.debugLineNum = 418;BA.debugLine="If ShowIcon = True Then";
if (_showicon==[self.__c True]) { 
 };
 };
 //BA.debugLineNum = 423;BA.debugLine="If sName <> \"password\" Then";
if ([_sname isEqual:@"password"] == false) { 
 };
 }else if([_stype isEqual:@"spinner"]) { 
 //BA.debugLineNum = 432;BA.debugLine="Dim sp As Picker";
_sp = [B4IPickerWrapper new];
 //BA.debugLineNum = 433;BA.debugLine="sp.Initialize(sName)";
[_sp Initialize:self.bi :_sname];
 //BA.debugLineNum = 435;BA.debugLine="If Tag <> Null Then";
if (_tag!= nil) { 
 //BA.debugLineNum = 436;BA.debugLine="If Tag Is List Then";
if ([_tag isKindOfClass: [NSArray class]]) { 
 //BA.debugLineNum = 437;BA.debugLine="sp.SetItems(0,Tag)";
[_sp SetItems:(int) (0) :(B4IList*) [B4IObjectWrapper createWrapper:[B4IList new] object:(NSArray*)(_tag)]];
 };
 };
 //BA.debugLineNum = 441;BA.debugLine="sp.Tag = sName";
[_sp setTag:(NSObject*)(_sname)];
 //BA.debugLineNum = 443;BA.debugLine="If Library.IsPersian Then";
if ([self._library _ispersian]) { 
 //BA.debugLineNum = 444;BA.debugLine="Dim lss As List";
_lss = [B4IList new];
 //BA.debugLineNum = 445;BA.debugLine="lss = Tag";
_lss.object = (NSArray*)(_tag);
 //BA.debugLineNum = 446;BA.debugLine="For i=0 To lss.Size - 1";
{
const int step48 = 1;
const int limit48 = (int) ([_lss Size]-1);
_i = (int) (0) ;
for (;(step48 > 0 && _i <= limit48) || (step48 < 0 && _i >= limit48) ;_i = ((int)(0 + _i + step48))  ) {
 //BA.debugLineNum = 447;BA.debugLine="If lss.Get(i) = \"جمهوری اسلامی ایران\" Then";
if ([[_lss Get:_i] isEqual:(NSObject*)(@"جمهوری اسلامی ایران")]) { 
 //BA.debugLineNum = 448;BA.debugLine="sp.SelectRow(0,i,True)";
[_sp SelectRow:(int) (0) :_i :[self.__c True]];
 //BA.debugLineNum = 449;BA.debugLine="Exit";
if (true) break;
 };
 }
};
 };
 //BA.debugLineNum = 454;BA.debugLine="v1 = sp";
_v1.object = (UIView*)((_sp).object);
 };
 //BA.debugLineNum = 460;BA.debugLine="Dim lbl1 As Label";
_lbl1 = [B4ILabelWrapper new];
 //BA.debugLineNum = 461;BA.debugLine="lbl1.Initialize(\"\")";
[_lbl1 Initialize:self.bi :@""];
 //BA.debugLineNum = 462;BA.debugLine="lbl1.TextColor = Colors.Black";
[_lbl1 setTextColor:[[self.__c Colors] Black]];
 //BA.debugLineNum = 463;BA.debugLine="lbl1.Font = Library.GetFont(14)";
[_lbl1 setFont:[self._library _getfont:(int) (14)]];
 //BA.debugLineNum = 464;BA.debugLine="lbl1.TextAlignment = Library.GetStringResourse(\"d";
[_lbl1 setTextAlignment:[self.bi ObjectToNumber:[self._library _getstringresourse:@"direction_ios"]].intValue];
 //BA.debugLineNum = 466;BA.debugLine="sv1.Panel.AddView(lbl1,15,top,sv1.Width - 34,30di";
[[self._sv1 Panel] AddView:(UIView*)((_lbl1).object) :(float) (15) :[self.bi ObjectToNumber:self._top].floatValue :(float) ([self._sv1 Width]-34) :(float) ([self.__c DipToCurrent:(int) (30)])];
 //BA.debugLineNum = 467;BA.debugLine="top = top + 34dip";
self._top = (NSObject*)(@([self.bi ObjectToNumber:self._top].doubleValue+[self.__c DipToCurrent:(int) (34)]));
 //BA.debugLineNum = 469;BA.debugLine="If sType = \"spinner\" Then";
if ([_stype isEqual:@"spinner"]) { 
 //BA.debugLineNum = 470;BA.debugLine="sv1.Panel.AddView(v1,15,top+20dip,sv1.Width - 34";
[[self._sv1 Panel] AddView:(UIView*)((_v1).object) :(float) (15) :(float) ([self.bi ObjectToNumber:self._top].doubleValue+[self.__c DipToCurrent:(int) (20)]) :(float) ([self._sv1 Width]-34) :(float) ([self.__c DipToCurrent:(int) (97)])];
 }else {
 //BA.debugLineNum = 472;BA.debugLine="sv1.Panel.AddView(v1,15,top,sv1.Width - 34,37dip";
[[self._sv1 Panel] AddView:(UIView*)((_v1).object) :(float) (15) :[self.bi ObjectToNumber:self._top].floatValue :(float) ([self._sv1 Width]-34) :(float) ([self.__c DipToCurrent:(int) (37)])];
 };
 //BA.debugLineNum = 475;BA.debugLine="top = top + 52dip";
self._top = (NSObject*)(@([self.bi ObjectToNumber:self._top].doubleValue+[self.__c DipToCurrent:(int) (52)]));
 //BA.debugLineNum = 477;BA.debugLine="lbl1.Text = Title";
[_lbl1 setText:_title];
 //BA.debugLineNum = 479;BA.debugLine="sv1.Panel.Height = top";
[[self._sv1 Panel] setHeight:[self.bi ObjectToNumber:self._top].floatValue];
 //BA.debugLineNum = 481;BA.debugLine="Dim st As ResponseAddItem";
_st = [_responseadditem new];
 //BA.debugLineNum = 482;BA.debugLine="st.Initialize";
[_st Initialize];
 //BA.debugLineNum = 483;BA.debugLine="st.Top = top";
_st.Top = [self.bi ObjectToNumber:self._top].intValue;
 //BA.debugLineNum = 484;BA.debugLine="st.View1 = v1";
_st.View1 = _v1;
 //BA.debugLineNum = 486;BA.debugLine="Return st";
if (true) return _st;
 //BA.debugLineNum = 488;BA.debugLine="End Sub";
return nil;
}
- (NSString*)  _btnclose_click{
 //BA.debugLineNum = 75;BA.debugLine="Sub btnclose_Click";
 //BA.debugLineNum = 76;BA.debugLine="Library.NavControl.ShowPage(Library.LastPage)";
[self._library._navcontrol ShowPage:(UIViewController*)((self._library._lastpage).object)];
 //BA.debugLineNum = 77;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _btnlogin_click{
 //BA.debugLineNum = 368;BA.debugLine="Sub btnlogin_Click";
 //BA.debugLineNum = 369;BA.debugLine="Library.LastPage = pg";
self._library._lastpage = self._pg;
 //BA.debugLineNum = 370;BA.debugLine="actDoOrder.StartActivity";
[self._actdoorder _startactivity];
 //BA.debugLineNum = 371;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _btnregister_click{
iStringUtils* _su = nil;
B4IMap* _data = nil;
B4IViewWrapper* _v1 = nil;
B4ITextFieldWrapper* _ed = nil;
int _k = 0;
B4IMap* _m2 = nil;
 //BA.debugLineNum = 198;BA.debugLine="Sub btnregister_Click";
 //BA.debugLineNum = 200;BA.debugLine="If Library.InternetState = False Then";
if ([self._library _internetstate]==[self.__c False]) { 
 //BA.debugLineNum = 201;BA.debugLine="MyToastMessageShow1.ShowToastMessageShow(Library";
[self._mytoastmessageshow1 _showtoastmessageshow:[self._library _getstringresourse:@"error_net_details"] :(long long) (1.5) :[self.__c False]];
 //BA.debugLineNum = 202;BA.debugLine="Return";
if (true) return @"";
 };
 //BA.debugLineNum = 205;BA.debugLine="Dim su As StringUtils";
_su = [iStringUtils new];
 //BA.debugLineNum = 206;BA.debugLine="Dim data As Map";
_data = [B4IMap new];
 //BA.debugLineNum = 208;BA.debugLine="data.Initialize";
[_data Initialize];
 //BA.debugLineNum = 210;BA.debugLine="For Each v1 As View In sv1.Panel.GetAllViewsRecur";
_v1 = [B4IViewWrapper new];
{
const id<B4IIterable> group8 = [[self._sv1 Panel] GetAllViewsRecursive];
const int groupLen8 = group8.Size
;int index8 = 0;
;
for (; index8 < groupLen8;index8++){
_v1.object = (UIView*)([group8 Get:index8]);
 //BA.debugLineNum = 212;BA.debugLine="If v1 Is TextField Then";
if ([_v1.objectOrNull isKindOfClass: [UITextField class]]) { 
 //BA.debugLineNum = 214;BA.debugLine="Dim ed As TextField";
_ed = [B4ITextFieldWrapper new];
 //BA.debugLineNum = 215;BA.debugLine="ed = v1";
_ed.object = (UITextField*)((_v1).object);
 //BA.debugLineNum = 217;BA.debugLine="If ed.Tag = \"password\" And ed.Text.Length < 5 T";
if ([[_ed Tag] isEqual:(NSObject*)(@"password")] && [[_ed Text] Length]<5) { 
 //BA.debugLineNum = 218;BA.debugLine="MyToastMessageShow1.ShowToastMessageShow(Libra";
[self._mytoastmessageshow1 _showtoastmessageshow:[self._library _getstringresourse:[@[@"error_",[self.bi ObjectToString:[_ed Tag]]] componentsJoinedByString:@""]] :(long long) (1.5) :[self.__c False]];
 //BA.debugLineNum = 219;BA.debugLine="Return";
if (true) return @"";
 }else if([[_ed Tag] isEqual:(NSObject*)(@"firstname")] && [[_ed Text] Length]<2) { 
 //BA.debugLineNum = 222;BA.debugLine="MyToastMessageShow1.ShowToastMessageShow(Libra";
[self._mytoastmessageshow1 _showtoastmessageshow:[self._library _getstringresourse:[@[@"error_",[self.bi ObjectToString:[_ed Tag]]] componentsJoinedByString:@""]] :(long long) (1.5) :[self.__c False]];
 //BA.debugLineNum = 223;BA.debugLine="Return";
if (true) return @"";
 }else if([[_ed Tag] isEqual:(NSObject*)(@"email")] && [self._library _validemail:[_ed Text]]==[self.__c False]) { 
 //BA.debugLineNum = 226;BA.debugLine="MyToastMessageShow1.ShowToastMessageShow(Libra";
[self._mytoastmessageshow1 _showtoastmessageshow:[self._library _getstringresourse:[@[@"error_",[self.bi ObjectToString:[_ed Tag]]] componentsJoinedByString:@""]] :(long long) (1.5) :[self.__c False]];
 //BA.debugLineNum = 227;BA.debugLine="Return";
if (true) return @"";
 }else if([[_ed Tag] isEqual:(NSObject*)(@"address_1")] && [[_ed Text] Length]<5) { 
 //BA.debugLineNum = 230;BA.debugLine="MyToastMessageShow1.ShowToastMessageShow(Libra";
[self._mytoastmessageshow1 _showtoastmessageshow:[self._library _getstringresourse:[@[@"error_",[self.bi ObjectToString:[_ed Tag]]] componentsJoinedByString:@""]] :(long long) (1.5) :[self.__c False]];
 //BA.debugLineNum = 231;BA.debugLine="Return";
if (true) return @"";
 }else if([[_ed Tag] isEqual:(NSObject*)(@"postcode")] && [self._library _validpostalcode:[_ed Text]]==[self.__c False]) { 
 //BA.debugLineNum = 234;BA.debugLine="MyToastMessageShow1.ShowToastMessageShow(Libra";
[self._mytoastmessageshow1 _showtoastmessageshow:[self._library _getstringresourse:[@[@"error_",[self.bi ObjectToString:[_ed Tag]]] componentsJoinedByString:@""]] :(long long) (1.5) :[self.__c False]];
 //BA.debugLineNum = 235;BA.debugLine="Return";
if (true) return @"";
 }else if([[_ed Tag] isEqual:(NSObject*)(@"telephone")] && [self._library _validphonenumber:[_ed Text]]==[self.__c False]) { 
 //BA.debugLineNum = 238;BA.debugLine="MyToastMessageShow1.ShowToastMessageShow(Libra";
[self._mytoastmessageshow1 _showtoastmessageshow:[self._library _getstringresourse:[@[@"error_",[self.bi ObjectToString:[_ed Tag]]] componentsJoinedByString:@""]] :(long long) (1.5) :[self.__c False]];
 //BA.debugLineNum = 239;BA.debugLine="Return";
if (true) return @"";
 };
 //BA.debugLineNum = 243;BA.debugLine="data.Put(ed.Tag,ed.Text)";
[_data Put:[_ed Tag] :(NSObject*)([_ed Text])];
 };
 }
};
 //BA.debugLineNum = 249;BA.debugLine="data.Put(\"email\",su.DecodeUrl(data.Get(\"email\"),\"";
[_data Put:(NSObject*)(@"email") :(NSObject*)([_su DecodeUrl:[self.bi ObjectToString:[_data Get:(NSObject*)(@"email")]] :@"UTF8"])];
 //BA.debugLineNum = 251;BA.debugLine="If spCity.GetSelectedRow(0) < 0 Then";
if ([self._spcity GetSelectedRow:(int) (0)]<0) { 
 //BA.debugLineNum = 252;BA.debugLine="MyToastMessageShow1.ShowToastMessageShow(Library";
[self._mytoastmessageshow1 _showtoastmessageshow:[self._library _getstringresourse:@"error_city"] :(long long) (1.5) :[self.__c False]];
 //BA.debugLineNum = 253;BA.debugLine="Return";
if (true) return @"";
 };
 //BA.debugLineNum = 256;BA.debugLine="username = data.Get(\"email\")";
self._username = [self.bi ObjectToString:[_data Get:(NSObject*)(@"email")]];
 //BA.debugLineNum = 257;BA.debugLine="password = data.Get(\"password\")";
self._password = [self.bi ObjectToString:[_data Get:(NSObject*)(@"password")]];
 //BA.debugLineNum = 259;BA.debugLine="For k = 0 To listCity.Size - 1";
{
const int step41 = 1;
const int limit41 = (int) ([self._listcity Size]-1);
_k = (int) (0) ;
for (;(step41 > 0 && _k <= limit41) || (step41 < 0 && _k >= limit41) ;_k = ((int)(0 + _k + step41))  ) {
 //BA.debugLineNum = 261;BA.debugLine="Dim m2 As Map";
_m2 = [B4IMap new];
 //BA.debugLineNum = 262;BA.debugLine="m2 = listCity.Get(k)";
_m2 = (B4IMap*)([self._listcity Get:_k]);
 //BA.debugLineNum = 264;BA.debugLine="If m2.Get(\"name\") = spCity.GetSelectedItem(0) Th";
if ([[_m2 Get:(NSObject*)(@"name")] isEqual:[self._spcity GetSelectedItem:(int) (0)]]) { 
 //BA.debugLineNum = 265;BA.debugLine="data.Put(\"zone_id\",m2.Get(\"zone_id\"))";
[_data Put:(NSObject*)(@"zone_id") :[_m2 Get:(NSObject*)(@"zone_id")]];
 //BA.debugLineNum = 266;BA.debugLine="data.Put(\"country_id\",m2.Get(\"country_id\"))";
[_data Put:(NSObject*)(@"country_id") :[_m2 Get:(NSObject*)(@"country_id")]];
 //BA.debugLineNum = 267;BA.debugLine="Exit";
if (true) break;
 };
 }
};
 //BA.debugLineNum = 272;BA.debugLine="Library.GuestLogin.Initialize";
[self._library._guestlogin Initialize];
 //BA.debugLineNum = 274;BA.debugLine="If Guest = True Then";
if (self._guest==[self.__c True]) { 
 //BA.debugLineNum = 275;BA.debugLine="Library.GuestLogin = data";
self._library._guestlogin = _data;
 };
 //BA.debugLineNum = 278;BA.debugLine="pnlloading.Visible = True";
[self._pnlloading setVisible:[self.__c True]];
 //BA.debugLineNum = 280;BA.debugLine="data.Put(\"newsletter\",\"0\")";
[_data Put:(NSObject*)(@"newsletter") :(NSObject*)(@"0")];
 //BA.debugLineNum = 281;BA.debugLine="If chknewsletter.Value = True Then data.Put(\"news";
if ([self._chknewsletter Value]==[self.__c True]) { 
[_data Put:(NSObject*)(@"newsletter") :(NSObject*)(@"1")];};
 //BA.debugLineNum = 283;BA.debugLine="op1.register(Me,\"register_receive\",data,Guest)";
[self._op1 _register:self :@"register_receive" :_data :self._guest];
 //BA.debugLineNum = 285;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _city_receive:(B4IList*) _res :(NSString*) _cat{
B4IList* _ls = nil;
int _tehran = 0;
int _i = 0;
B4IMap* _m1 = nil;
NSString* _temp = @"";
 //BA.debugLineNum = 155;BA.debugLine="Sub city_receive(res As List,cat As String)";
 //BA.debugLineNum = 157;BA.debugLine="pnlloading.Visible = False";
[self._pnlloading setVisible:[self.__c False]];
 //BA.debugLineNum = 159;BA.debugLine="listCity = res";
self._listcity = _res;
 //BA.debugLineNum = 161;BA.debugLine="spCity.GetItems(0).Clear";
[[self._spcity GetItems:(int) (0)] Clear];
 //BA.debugLineNum = 163;BA.debugLine="Dim ls As List";
_ls = [B4IList new];
 //BA.debugLineNum = 164;BA.debugLine="ls.Initialize";
[_ls Initialize];
 //BA.debugLineNum = 166;BA.debugLine="Dim tehran As Int = 0";
_tehran = (int) (0);
 //BA.debugLineNum = 168;BA.debugLine="For i = 0 To res.Size - 1";
{
const int step7 = 1;
const int limit7 = (int) ([_res Size]-1);
_i = (int) (0) ;
for (;(step7 > 0 && _i <= limit7) || (step7 < 0 && _i >= limit7) ;_i = ((int)(0 + _i + step7))  ) {
 //BA.debugLineNum = 169;BA.debugLine="Dim m1 As Map";
_m1 = [B4IMap new];
 //BA.debugLineNum = 170;BA.debugLine="m1 = res.Get(i)";
_m1 = (B4IMap*)([_res Get:_i]);
 //BA.debugLineNum = 171;BA.debugLine="ls.Add(m1.Get(\"name\"))";
[_ls Add:[_m1 Get:(NSObject*)(@"name")]];
 //BA.debugLineNum = 173;BA.debugLine="Dim temp As String";
_temp = @"";
 //BA.debugLineNum = 174;BA.debugLine="temp = m1.Get(\"name\")";
_temp = [self.bi ObjectToString:[_m1 Get:(NSObject*)(@"name")]];
 //BA.debugLineNum = 175;BA.debugLine="If temp.IndexOf(\"تهران\") > -1 Then";
if ([_temp IndexOf:@"تهران"]>-1) { 
 //BA.debugLineNum = 176;BA.debugLine="tehran = i";
_tehran = _i;
 };
 }
};
 //BA.debugLineNum = 181;BA.debugLine="spCity.SetItems(0,ls)";
[self._spcity SetItems:(int) (0) :_ls];
 //BA.debugLineNum = 183;BA.debugLine="spCity.SelectRow(0,tehran,True)";
[self._spcity SelectRow:(int) (0) :_tehran :[self.__c True]];
 //BA.debugLineNum = 185;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _country_itemselected:(int) _column :(int) _row{
B4IPickerWrapper* _pick = nil;
int _i = 0;
B4IMap* _m1 = nil;
 //BA.debugLineNum = 135;BA.debugLine="Sub country_ItemSelected (Column As Int, Row As In";
 //BA.debugLineNum = 137;BA.debugLine="Dim pick As Picker";
_pick = [B4IPickerWrapper new];
 //BA.debugLineNum = 138;BA.debugLine="pick = Sender";
_pick.object = (UIPickerView*)([self.__c Sender:self.bi]);
 //BA.debugLineNum = 140;BA.debugLine="For i = 0 To listCountry.Size - 1";
{
const int step3 = 1;
const int limit3 = (int) ([self._listcountry Size]-1);
_i = (int) (0) ;
for (;(step3 > 0 && _i <= limit3) || (step3 < 0 && _i >= limit3) ;_i = ((int)(0 + _i + step3))  ) {
 //BA.debugLineNum = 142;BA.debugLine="Dim m1 As Map";
_m1 = [B4IMap new];
 //BA.debugLineNum = 143;BA.debugLine="m1 = listCountry.Get(i)";
_m1 = (B4IMap*)([self._listcountry Get:_i]);
 //BA.debugLineNum = 145;BA.debugLine="If m1.Get(\"name\") = pick.GetItems(0).Get(Row) Th";
if ([[_m1 Get:(NSObject*)(@"name")] isEqual:[[_pick GetItems:(int) (0)] Get:_row]]) { 
 //BA.debugLineNum = 146;BA.debugLine="pnlloading.Visible = True";
[self._pnlloading setVisible:[self.__c True]];
 //BA.debugLineNum = 147;BA.debugLine="opCity.GetCity(Me,\"city_receive\",m1.Get(\"countr";
[self._opcity _getcity:self :@"city_receive" :[self.bi ObjectToString:[_m1 Get:(NSObject*)(@"country_id")]]];
 //BA.debugLineNum = 148;BA.debugLine="Return";
if (true) return @"";
 };
 }
};
 //BA.debugLineNum = 153;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _country_receive:(B4IList*) _ls :(NSString*) _cat{
B4IList* _city = nil;
B4IList* _lscountryname = nil;
B4IList* _lscityname = nil;
int _i = 0;
B4IMap* _te = nil;
NSString* _name = @"";
_responseadditem* _response = nil;
 //BA.debugLineNum = 79;BA.debugLine="Sub country_receive(ls As List,cat As String)";
 //BA.debugLineNum = 81;BA.debugLine="pnlloading.Visible = False";
[self._pnlloading setVisible:[self.__c False]];
 //BA.debugLineNum = 83;BA.debugLine="listCountry = ls";
self._listcountry = _ls;
 //BA.debugLineNum = 85;BA.debugLine="Dim City As List";
_city = [B4IList new];
 //BA.debugLineNum = 86;BA.debugLine="City.Initialize";
[_city Initialize];
 //BA.debugLineNum = 88;BA.debugLine="Dim lsCountryname,lsCityname As List";
_lscountryname = [B4IList new];
_lscityname = [B4IList new];
 //BA.debugLineNum = 89;BA.debugLine="lsCountryname.Initialize";
[_lscountryname Initialize];
 //BA.debugLineNum = 90;BA.debugLine="lsCityname.Initialize";
[_lscityname Initialize];
 //BA.debugLineNum = 92;BA.debugLine="For i = 0 To ls.Size - 1";
{
const int step8 = 1;
const int limit8 = (int) ([_ls Size]-1);
_i = (int) (0) ;
for (;(step8 > 0 && _i <= limit8) || (step8 < 0 && _i >= limit8) ;_i = ((int)(0 + _i + step8))  ) {
 //BA.debugLineNum = 94;BA.debugLine="Dim te As Map";
_te = [B4IMap new];
 //BA.debugLineNum = 95;BA.debugLine="te = ls.Get(i)";
_te = (B4IMap*)([_ls Get:_i]);
 //BA.debugLineNum = 97;BA.debugLine="Dim name As String";
_name = @"";
 //BA.debugLineNum = 98;BA.debugLine="name = te.Get(\"name\")";
_name = [self.bi ObjectToString:[_te Get:(NSObject*)(@"name")]];
 //BA.debugLineNum = 99;BA.debugLine="lsCountryname.Add(name)";
[_lscountryname Add:(NSObject*)(_name)];
 }
};
 //BA.debugLineNum = 103;BA.debugLine="top = AddItem(Library.GetStringResourse(\"tname\"),";
self._top = (NSObject*)(@([self _additem:[self._library _getstringresourse:@"tname"] :@"text" :@"firstname" :(NSObject*)(@"") :[self.__c True]].Top));
 //BA.debugLineNum = 104;BA.debugLine="top = AddItem(Library.GetStringResourse(\"lastname";
self._top = (NSObject*)(@([self _additem:[self._library _getstringresourse:@"lastname"] :@"text" :@"lastname" :(NSObject*)(@"") :[self.__c True]].Top));
 //BA.debugLineNum = 105;BA.debugLine="top = AddItem(Library.GetStringResourse(\"email\"),";
self._top = (NSObject*)(@([self _additem:[self._library _getstringresourse:@"email"] :@"text" :@"email" :(NSObject*)(@"") :[self.__c True]].Top));
 //BA.debugLineNum = 106;BA.debugLine="If Guest = False Then top = AddItem(Library.GetSt";
if (self._guest==[self.__c False]) { 
self._top = (NSObject*)(@([self _additem:[self._library _getstringresourse:@"password"] :@"text" :@"password" :(NSObject*)(@"") :[self.__c True]].Top));};
 //BA.debugLineNum = 107;BA.debugLine="top = AddItem(Library.GetStringResourse(\"country\"";
self._top = (NSObject*)(@([self _additem:[self._library _getstringresourse:@"country"] :@"spinner" :@"country" :(NSObject*)((_lscountryname).object) :[self.__c False]].Top));
 //BA.debugLineNum = 109;BA.debugLine="top = top + 50dip";
self._top = (NSObject*)(@([self.bi ObjectToNumber:self._top].doubleValue+[self.__c DipToCurrent:(int) (50)]));
 //BA.debugLineNum = 110;BA.debugLine="Dim response As ResponseAddItem";
_response = [_responseadditem new];
 //BA.debugLineNum = 111;BA.debugLine="response = AddItem(Library.GetStringResourse(\"sta";
_response = [self _additem:[self._library _getstringresourse:@"state"] :@"spinner" :@"state" :(NSObject*)((_lscityname).object) :[self.__c False]];
 //BA.debugLineNum = 112;BA.debugLine="spCity = response.View1";
self._spcity.object = (UIPickerView*)((_response.View1).object);
 //BA.debugLineNum = 113;BA.debugLine="top = response.top";
self._top = (NSObject*)(@(_response.Top));
 //BA.debugLineNum = 115;BA.debugLine="top = top + 120dip";
self._top = (NSObject*)(@([self.bi ObjectToNumber:self._top].doubleValue+[self.__c DipToCurrent:(int) (120)]));
 //BA.debugLineNum = 117;BA.debugLine="top = AddItem(Library.GetStringResourse(\"city\"),\"";
self._top = (NSObject*)(@([self _additem:[self._library _getstringresourse:@"city"] :@"text" :@"city" :(NSObject*)(@"") :[self.__c True]].Top));
 //BA.debugLineNum = 119;BA.debugLine="top = AddItem(Library.GetStringResourse(\"address1";
self._top = (NSObject*)(@([self _additem:[self._library _getstringresourse:@"address1"] :@"text" :@"address_1" :(NSObject*)(@"") :[self.__c True]].Top));
 //BA.debugLineNum = 121;BA.debugLine="top = AddItem(Library.GetStringResourse(\"postal\")";
self._top = (NSObject*)(@([self _additem:[self._library _getstringresourse:@"postal"] :@"text" :@"postcode" :(NSObject*)(@"") :[self.__c True]].Top));
 //BA.debugLineNum = 122;BA.debugLine="top = AddItem(Library.GetStringResourse(\"phone\"),";
self._top = (NSObject*)(@([self _additem:[self._library _getstringresourse:@"phone"] :@"text" :@"telephone" :(NSObject*)(@"") :[self.__c True]].Top));
 //BA.debugLineNum = 123;BA.debugLine="top = AddItem(Library.GetStringResourse(\"fax\"),\"t";
self._top = (NSObject*)(@([self _additem:[self._library _getstringresourse:@"fax"] :@"text" :@"fax" :(NSObject*)(@"") :[self.__c True]].Top));
 //BA.debugLineNum = 125;BA.debugLine="If Library.IsPersian Then";
if ([self._library _ispersian]) { 
 //BA.debugLineNum = 126;BA.debugLine="opCity.GetCity(Me,\"city_receive\",\"101\")";
[self._opcity _getcity:self :@"city_receive" :@"101"];
 };
 //BA.debugLineNum = 129;BA.debugLine="sv1.Panel.Height = sv1.Panel.Height + 190dip";
[[self._sv1 Panel] setHeight:(float) ([[self._sv1 Panel] Height]+[self.__c DipToCurrent:(int) (190)])];
 //BA.debugLineNum = 130;BA.debugLine="sv1.ContentHeight = sv1.Panel.Height";
[self._sv1 setContentHeight:(int) ([[self._sv1 Panel] Height])];
 //BA.debugLineNum = 131;BA.debugLine="sv1.ContentWidth = sv1.Width";
[self._sv1 setContentWidth:(int) ([self._sv1 Width])];
 //BA.debugLineNum = 133;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _pageregister_disappear{
 //BA.debugLineNum = 191;BA.debugLine="Sub pageRegister_Disappear";
 //BA.debugLineNum = 193;BA.debugLine="Guest = False";
self._guest = [self.__c False];
 //BA.debugLineNum = 194;BA.debugLine="successRegister = False";
self._successregister = [self.__c False];
 //BA.debugLineNum = 196;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _process_globals{
self._main=[b4i_main new];
self._actmenu=[b4i_actmenu new];
self._library=[b4i_library new];
self._actsearch=[b4i_actsearch new];
self._actaccount=[b4i_actaccount new];
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
 //BA.debugLineNum = 4;BA.debugLine="Public Guest As Boolean";
self._guest = false;
 //BA.debugLineNum = 5;BA.debugLine="Private sv1 As ScrollView";
self._sv1 = [B4IScrollView new];
 //BA.debugLineNum = 6;BA.debugLine="Private btnregister As Button";
self._btnregister = [B4IButtonWrapper new];
 //BA.debugLineNum = 7;BA.debugLine="Private btnlogin As Button";
self._btnlogin = [B4IButtonWrapper new];
 //BA.debugLineNum = 8;BA.debugLine="Private lbltitle As Label";
self._lbltitle = [B4ILabelWrapper new];
 //BA.debugLineNum = 9;BA.debugLine="Private pnlloading As Panel";
self._pnlloading = [B4IPanelWrapper new];
 //BA.debugLineNum = 10;BA.debugLine="Private lblpb As Label";
self._lblpb = [B4ILabelWrapper new];
 //BA.debugLineNum = 11;BA.debugLine="Private top As Object = 0";
self._top = (NSObject*)(@(0));
 //BA.debugLineNum = 12;BA.debugLine="Private op1 As OpenCart";
self._op1 = [b4i_opencart new];
 //BA.debugLineNum = 13;BA.debugLine="Private pnlheader As Panel";
self._pnlheader = [B4IPanelWrapper new];
 //BA.debugLineNum = 14;BA.debugLine="Private listCountry,listCity As List";
self._listcountry = [B4IList new];
self._listcity = [B4IList new];
 //BA.debugLineNum = 15;BA.debugLine="Private opCountry,opCity As OpenCart";
self._opcountry = [b4i_opencart new];
self._opcity = [b4i_opencart new];
 //BA.debugLineNum = 16;BA.debugLine="Private spCity As Picker";
self._spcity = [B4IPickerWrapper new];
 //BA.debugLineNum = 17;BA.debugLine="Private successRegister As Boolean";
self._successregister = false;
 //BA.debugLineNum = 18;BA.debugLine="Private MyToastMessageShow1 As MyToastMessageShow";
self._mytoastmessageshow1 = [b4i_mytoastmessageshow new];
 //BA.debugLineNum = 19;BA.debugLine="Private chknewsletter As Switch";
self._chknewsletter = [B4ISwitchWrapper new];
 //BA.debugLineNum = 20;BA.debugLine="Private pg As Page";
self._pg = [B4IPage new];
 //BA.debugLineNum = 21;BA.debugLine="Private btnclose As Button";
self._btnclose = [B4IButtonWrapper new];
 //BA.debugLineNum = 22;BA.debugLine="Private lblnewsletter As Label";
self._lblnewsletter = [B4ILabelWrapper new];
 //BA.debugLineNum = 23;BA.debugLine="Private username,password As String";
self._username = @"";
self._password = @"";
 //BA.debugLineNum = 24;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _register_receive:(B4IMap*) _res :(NSString*) _cat{
B4IMap* _rs1 = nil;
NSString* _err = @"";
NSString* _val = @"";
b4i_opencart* _op1guest = nil;
 //BA.debugLineNum = 287;BA.debugLine="Sub register_receive(res As Map,cat As String)";
 //BA.debugLineNum = 289;BA.debugLine="If res = Null Then Return";
if (_res== nil) { 
if (true) return @"";};
 //BA.debugLineNum = 291;BA.debugLine="pnlloading.Visible = False";
[self._pnlloading setVisible:[self.__c False]];
 //BA.debugLineNum = 293;BA.debugLine="If res.IsInitialized = False Then";
if ([_res IsInitialized]==[self.__c False]) { 
 //BA.debugLineNum = 294;BA.debugLine="MyToastMessageShow1.ShowToastMessageShow(Library";
[self._mytoastmessageshow1 _showtoastmessageshow:[self._library _getstringresourse:@"error_net_title"] :(long long) (1.5) :[self.__c False]];
 //BA.debugLineNum = 295;BA.debugLine="Return";
if (true) return @"";
 };
 //BA.debugLineNum = 298;BA.debugLine="If res.ContainsKey(\"error\") Then";
if ([_res ContainsKey:(NSObject*)(@"error")]) { 
 //BA.debugLineNum = 299;BA.debugLine="If res.Get(\"error\") = \"User already is logged\" T";
if ([[_res Get:(NSObject*)(@"error")] isEqual:(NSObject*)(@"User already is logged")]) { 
 //BA.debugLineNum = 300;BA.debugLine="MyToastMessageShow1.ShowToastMessageShow(Librar";
[self._mytoastmessageshow1 _showtoastmessageshow:[self._library _getstringresourse:@"already_login"] :(long long) (1.5) :[self.__c False]];
 //BA.debugLineNum = 301;BA.debugLine="Return";
if (true) return @"";
 }else {
 //BA.debugLineNum = 303;BA.debugLine="Dim rs1 As Map";
_rs1 = [B4IMap new];
 //BA.debugLineNum = 304;BA.debugLine="rs1 = res.Get(\"error\")";
_rs1 = (B4IMap*)([_res Get:(NSObject*)(@"error")]);
 //BA.debugLineNum = 306;BA.debugLine="Dim err As String";
_err = @"";
 //BA.debugLineNum = 308;BA.debugLine="For Each val As String In rs1.Values";
{
const id<B4IIterable> group15 = [_rs1 Values];
const int groupLen15 = group15.Size
;int index15 = 0;
;
for (; index15 < groupLen15;index15++){
_val = [self.bi ObjectToString:[group15 Get:index15]];
 //BA.debugLineNum = 309;BA.debugLine="err = err & val & CRLF";
_err = [@[_err,_val,[self.__c CRLF]] componentsJoinedByString:@""];
 }
};
 //BA.debugLineNum = 312;BA.debugLine="Msgbox(err,Library.GetStringResourse(\"alert\"))";
[self.__c Msgbox:_err :[self._library _getstringresourse:@"alert"]];
 };
 }else if([_res ContainsKey:(NSObject*)(@"success")]) { 
 //BA.debugLineNum = 318;BA.debugLine="If res.Get(\"success\") = 1 Then";
if ([[_res Get:(NSObject*)(@"success")] isEqual:(NSObject*)(@(1))]) { 
 //BA.debugLineNum = 320;BA.debugLine="If Guest = False Then	Library.HUD.ToastMessageS";
if (self._guest==[self.__c False]) { 
[self._library._hud ToastMessageShow:[self._library _getstringresourse:@"register_success"] :[self.__c False]];};
 //BA.debugLineNum = 322;BA.debugLine="successRegister = True";
self._successregister = [self.__c True];
 //BA.debugLineNum = 324;BA.debugLine="If Guest = False Then";
if (self._guest==[self.__c False]) { 
 //BA.debugLineNum = 325;BA.debugLine="Guest = False";
self._guest = [self.__c False];
 //BA.debugLineNum = 326;BA.debugLine="Library.LastPage = Library.MenuPage";
self._library._lastpage = self._library._menupage;
 //BA.debugLineNum = 327;BA.debugLine="actLogin.RegisteredUsername = username";
self._actlogin._registeredusername = self._username;
 //BA.debugLineNum = 328;BA.debugLine="actLogin.RegisteredPassword = password";
self._actlogin._registeredpassword = self._password;
 //BA.debugLineNum = 329;BA.debugLine="actLogin.StartActivity";
[self._actlogin _startactivity];
 }else {
 //BA.debugLineNum = 331;BA.debugLine="Guest = False";
self._guest = [self.__c False];
 //BA.debugLineNum = 332;BA.debugLine="pnlloading.Visible = True";
[self._pnlloading setVisible:[self.__c True]];
 //BA.debugLineNum = 333;BA.debugLine="Library.ChoosenAddress = 1";
self._library._choosenaddress = (int) (1);
 //BA.debugLineNum = 334;BA.debugLine="Dim op1Guest As OpenCart";
_op1guest = [b4i_opencart new];
 //BA.debugLineNum = 335;BA.debugLine="op1Guest.Initialize";
[_op1guest _initialize:self.bi];
 //BA.debugLineNum = 336;BA.debugLine="op1.SetGuestShipMethods(Me,\"setGuestShip_recei";
[self._op1 _setguestshipmethods:self :@"setGuestShip_receive" :self._library._guestlogin];
 };
 //BA.debugLineNum = 339;BA.debugLine="Return";
if (true) return @"";
 };
 };
 //BA.debugLineNum = 343;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _setguestship_receive:(B4IMap*) _res :(NSString*) _cat{
B4IMap* _ms = nil;
 //BA.debugLineNum = 345;BA.debugLine="Sub setGuestShip_receive(res As Map,cat As String)";
 //BA.debugLineNum = 347;BA.debugLine="pnlloading.Visible = False";
[self._pnlloading setVisible:[self.__c False]];
 //BA.debugLineNum = 349;BA.debugLine="If res = Null Then";
if (_res== nil) { 
 //BA.debugLineNum = 350;BA.debugLine="MyToastMessageShow1.ShowToastMessageShow(Library";
[self._mytoastmessageshow1 _showtoastmessageshow:[self._library _getstringresourse:@"error_net_title"] :(long long) (1.5) :[self.__c False]];
 //BA.debugLineNum = 351;BA.debugLine="Return";
if (true) return @"";
 };
 //BA.debugLineNum = 354;BA.debugLine="If res.ContainsKey(\"success\") Then";
if ([_res ContainsKey:(NSObject*)(@"success")]) { 
 //BA.debugLineNum = 355;BA.debugLine="If res.Get(\"success\") = True Then";
if ([[_res Get:(NSObject*)(@"success")] isEqual:(NSObject*)(@([self.__c True]))]) { 
 //BA.debugLineNum = 356;BA.debugLine="Guest = False";
self._guest = [self.__c False];
 //BA.debugLineNum = 357;BA.debugLine="Dim ms As Map";
_ms = [B4IMap new];
 //BA.debugLineNum = 358;BA.debugLine="Library.loginDetails = ms";
self._library._logindetails = _ms;
 //BA.debugLineNum = 359;BA.debugLine="Library.GuestLogin.Put(\"login\",True)";
[self._library._guestlogin Put:(NSObject*)(@"login") :(NSObject*)(@([self.__c True]))];
 //BA.debugLineNum = 360;BA.debugLine="Library.LastPage = Library.MenuPage";
self._library._lastpage = self._library._menupage;
 //BA.debugLineNum = 361;BA.debugLine="actDoOrder.StartActivity";
[self._actdoorder _startactivity];
 //BA.debugLineNum = 362;BA.debugLine="Return";
if (true) return @"";
 };
 };
 //BA.debugLineNum = 366;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _spcity_itemclick:(int) _position :(NSObject*) _value{
 //BA.debugLineNum = 187;BA.debugLine="Sub spcity_ItemClick (Position As Int, Value As Ob";
 //BA.debugLineNum = 189;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _startactivity{
 //BA.debugLineNum = 26;BA.debugLine="Sub StartActivity";
 //BA.debugLineNum = 28;BA.debugLine="pg.Initialize(\"pageRegister\")";
[self._pg Initialize:self.bi :@"pageRegister"];
 //BA.debugLineNum = 30;BA.debugLine="pg.RootPanel.LoadLayout(\"frmregister\")";
[[self._pg RootPanel] LoadLayout:@"frmregister" :self.bi];
 //BA.debugLineNum = 31;BA.debugLine="MyToastMessageShow1.Initialize(pg.RootPanel)";
[self._mytoastmessageshow1 _initialize:self.bi :[self._pg RootPanel]];
 //BA.debugLineNum = 32;BA.debugLine="lbltitle.Font = Library.GetFont(lbltitle.Font.Siz";
[self._lbltitle setFont:[self._library _getfont:(int) ([[self._lbltitle Font] Size])]];
 //BA.debugLineNum = 33;BA.debugLine="lblnewsletter.Font = Library.GetFont(lbltitle.Fon";
[self._lblnewsletter setFont:[self._library _getfont:(int) ([[self._lbltitle Font] Size])]];
 //BA.debugLineNum = 34;BA.debugLine="Library.SetFont(btnclose,\"icomoon\",btnclose.Custo";
[self._library _setfont:(B4IViewWrapper*) [B4IObjectWrapper createWrapper:[B4IViewWrapper new] object:(UIView*)((self._btnclose).object)] :@"icomoon" :(int) ([[[self._btnclose CustomLabel] Font] Size])];
 //BA.debugLineNum = 35;BA.debugLine="Library.NavControl.ShowPage(pg)";
[self._library._navcontrol ShowPage:(UIViewController*)((self._pg).object)];
 //BA.debugLineNum = 37;BA.debugLine="If Guest = False Then";
if (self._guest==[self.__c False]) { 
 //BA.debugLineNum = 38;BA.debugLine="lbltitle.Text = Library.GetStringResourse(\"regis";
[self._lbltitle setText:[self._library _getstringresourse:@"register"]];
 //BA.debugLineNum = 39;BA.debugLine="btnregister.Text = Library.GetStringResourse(\"re";
[self._btnregister setText:[self._library _getstringresourse:@"register"]];
 }else {
 //BA.debugLineNum = 41;BA.debugLine="lbltitle.Text = Library.GetStringResourse(\"reuqu";
[self._lbltitle setText:[self._library _getstringresourse:@"reuquest_guest"]];
 //BA.debugLineNum = 42;BA.debugLine="btnregister.Text = Library.GetStringResourse(\"co";
[self._btnregister setText:[self._library _getstringresourse:@"continues"]];
 };
 //BA.debugLineNum = 45;BA.debugLine="lblpb.Text = Library.GetStringResourse(\"loading\")";
[self._lblpb setText:[self._library _getstringresourse:@"loading"]];
 //BA.debugLineNum = 46;BA.debugLine="btnlogin.Text = Library.GetStringResourse(\"login\"";
[self._btnlogin setText:[self._library _getstringresourse:@"login"]];
 //BA.debugLineNum = 47;BA.debugLine="lblnewsletter.Text = Library.GetStringResourse(\"r";
[self._lblnewsletter setText:[self._library _getstringresourse:@"register_newsletter"]];
 //BA.debugLineNum = 48;BA.debugLine="pnlheader.Color = Library.Theme_Header";
[self._pnlheader setColor:self._library._theme_header];
 //BA.debugLineNum = 50;BA.debugLine="btnregister.Top = btnregister.Top-20dip";
[self._btnregister setTop:(float) ([self._btnregister Top]-[self.__c DipToCurrent:(int) (20)])];
 //BA.debugLineNum = 51;BA.debugLine="btnregister.CustomLabel.Font = Library.GetFont(bt";
[[self._btnregister CustomLabel] setFont:[self._library _getfont:(int) ([[[self._btnregister CustomLabel] Font] Size])]];
 //BA.debugLineNum = 53;BA.debugLine="Library.GetButtonState(btnlogin)";
[self._library _getbuttonstate:self._btnlogin];
 //BA.debugLineNum = 54;BA.debugLine="Library.GetButtonState(btnregister)";
[self._library _getbuttonstate:self._btnregister];
 //BA.debugLineNum = 56;BA.debugLine="top = 14";
self._top = (NSObject*)(@(14));
 //BA.debugLineNum = 57;BA.debugLine="op1.Initialize";
[self._op1 _initialize:self.bi];
 //BA.debugLineNum = 58;BA.debugLine="listCity.Initialize";
[self._listcity Initialize];
 //BA.debugLineNum = 60;BA.debugLine="opCountry.Initialize";
[self._opcountry _initialize:self.bi];
 //BA.debugLineNum = 61;BA.debugLine="opCity.Initialize";
[self._opcity _initialize:self.bi];
 //BA.debugLineNum = 63;BA.debugLine="pnlloading.Visible = True";
[self._pnlloading setVisible:[self.__c True]];
 //BA.debugLineNum = 65;BA.debugLine="If listCountry.IsInitialized = False Then";
if ([self._listcountry IsInitialized]==[self.__c False]) { 
 //BA.debugLineNum = 66;BA.debugLine="opCountry.GetCountry(Me,\"country_receive\")";
[self._opcountry _getcountry:self :@"country_receive"];
 }else {
 //BA.debugLineNum = 68;BA.debugLine="country_receive(listCountry,\"\")";
[self _country_receive:self._listcountry :@""];
 };
 //BA.debugLineNum = 71;BA.debugLine="btnregister.Color = Library.ConvertHex2Int(Librar";
[self._btnregister setColor:[self.bi ObjectToNumber:[self._library _converthex2int:[self._library _getstringresourse:@"category_button"]]].intValue];
 //BA.debugLineNum = 73;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _txtdata_beginedit{
B4ITextFieldWrapper* _t2 = nil;
 //BA.debugLineNum = 490;BA.debugLine="Sub txtdata_BeginEdit";
 //BA.debugLineNum = 491;BA.debugLine="Dim t2 As TextField";
_t2 = [B4ITextFieldWrapper new];
 //BA.debugLineNum = 492;BA.debugLine="t2 = Sender";
_t2.object = (UITextField*)([self.__c Sender:self.bi]);
 //BA.debugLineNum = 493;BA.debugLine="sv1.ScrollTo(0,t2.Top-t2.Height,True)";
[self._sv1 ScrollTo:(int) (0) :(int) ([_t2 Top]-[_t2 Height]) :[self.__c True]];
 //BA.debugLineNum = 494;BA.debugLine="End Sub";
return @"";
}
@end
