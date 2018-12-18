
#import "b4i_dateutils.h"
#import "b4i_main.h"
#import "b4i_actmenu.h"
#import "b4i_library.h"
#import "b4i_imagedownloader.h"
#import "b4i_actsearch.h"
#import "b4i_opencart.h"
#import "b4i_actregister.h"
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
#import "b4i_bookmark.h"
#import "b4i_actabout.h"
#import "b4i_actshow.h"
#import "b4i_actweb.h"
#import "b4i_actsetting.h"
#import "b4i_actreview.h"
#import "b4i_imagezoom.h"
#import "b4i_peroperties.h"

@implementation _period
-(void)Initialize{
self.IsInitialized = true;
self.Years = 0;
self.Months = 0;
self.Days = 0;
self.Hours = 0;
self.Minutes = 0;
self.Seconds = 0;
}
- (NSString*)description {
return [B4I TypeToString:self :false];}
@end

@implementation b4i_dateutils 


+ (instancetype)new {
    static b4i_dateutils* shared = nil;
    if (shared == nil) {
        shared = [self alloc];
        shared.bi = [[B4I alloc] init:shared];
        shared.__c = [B4ICommon new];
    }
    return shared;
}

- (long long)  _addperiod:(long long) _ticks :(_period*) _per{
 //BA.debugLineNum = 220;BA.debugLine="Public Sub AddPeriod(Ticks As Long, Per As Period)";
 //BA.debugLineNum = 221;BA.debugLine="Ticks = DateTime.Add(Ticks, Per.Years, Per.Months";
_ticks = [[self.__c DateTime] Add:_ticks :_per.Years :_per.Months :_per.Days];
 //BA.debugLineNum = 222;BA.debugLine="Ticks = Ticks + Per.Hours * DateTime.TicksPerHour";
_ticks = (long long) (_ticks+_per.Hours*[[self.__c DateTime] TicksPerHour]+_per.Minutes*[[self.__c DateTime] TicksPerMinute]+_per.Seconds*[[self.__c DateTime] TicksPerSecond]);
 //BA.debugLineNum = 224;BA.debugLine="Return Ticks";
if (true) return _ticks;
 //BA.debugLineNum = 225;BA.debugLine="End Sub";
return 0L;
}
- (NSString*)  _format:(int) _value :(int) _length{
 //BA.debugLineNum = 207;BA.debugLine="Private Sub Format(Value As Int, Length As Int) As";
 //BA.debugLineNum = 208;BA.debugLine="Return NumberFormat2(Value, Length, 0, 0, False)";
if (true) return [self.__c NumberFormat2:_value :_length :(int) (0) :(int) (0) :[self.__c False]];
 //BA.debugLineNum = 209;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _getdayofweekname:(long long) _ticks{
NSString* _df = @"";
NSString* _res = @"";
 //BA.debugLineNum = 21;BA.debugLine="Public Sub GetDayOfWeekName(Ticks As Long) As Stri";
 //BA.debugLineNum = 22;BA.debugLine="Dim df As String = DateTime.DateFormat";
_df = [[self.__c DateTime] DateFormat];
 //BA.debugLineNum = 23;BA.debugLine="DateTime.DateFormat = \"EEEE\"";
[[self.__c DateTime] setDateFormat:@"EEEE"];
 //BA.debugLineNum = 24;BA.debugLine="Dim res As String = DateTime.Date(Ticks)";
_res = [[self.__c DateTime] Date:_ticks];
 //BA.debugLineNum = 25;BA.debugLine="DateTime.DateFormat = df";
[[self.__c DateTime] setDateFormat:_df];
 //BA.debugLineNum = 26;BA.debugLine="Return res";
if (true) return _res;
 //BA.debugLineNum = 27;BA.debugLine="End Sub";
return @"";
}
- (B4IList*)  _getdaysnames{
NSString* _df = @"";
long long _t = 0L;
int _i = 0;
 //BA.debugLineNum = 30;BA.debugLine="Public Sub GetDaysNames As List";
 //BA.debugLineNum = 31;BA.debugLine="If daysList.IsInitialized Then Return daysList";
if ([self._dayslist IsInitialized]) { 
if (true) return self._dayslist;};
 //BA.debugLineNum = 32;BA.debugLine="daysList.Initialize";
[self._dayslist Initialize];
 //BA.debugLineNum = 33;BA.debugLine="Dim df As String = DateTime.DateFormat";
_df = [[self.__c DateTime] DateFormat];
 //BA.debugLineNum = 34;BA.debugLine="DateTime.DateFormat = \"EEEE\"";
[[self.__c DateTime] setDateFormat:@"EEEE"];
 //BA.debugLineNum = 35;BA.debugLine="Dim t As Long = DateTime.Now";
_t = [[self.__c DateTime] Now];
 //BA.debugLineNum = 36;BA.debugLine="t = DateTime.Add(t, 0, 0, - (DateTime.GetDayOfWee";
_t = [[self.__c DateTime] Add:_t :(int) (0) :(int) (0) :(int) (-([[self.__c DateTime] GetDayOfWeek:_t]-1))];
 //BA.debugLineNum = 37;BA.debugLine="For i = 1 To 7";
{
const int step7 = 1;
const int limit7 = (int) (7);
_i = (int) (1) ;
for (;(step7 > 0 && _i <= limit7) || (step7 < 0 && _i >= limit7) ;_i = ((int)(0 + _i + step7))  ) {
 //BA.debugLineNum = 38;BA.debugLine="daysList.Add(DateTime.Date(t))";
[self._dayslist Add:(NSObject*)([[self.__c DateTime] Date:_t])];
 //BA.debugLineNum = 39;BA.debugLine="t = DateTime.Add(t, 0, 0, 1)";
_t = [[self.__c DateTime] Add:_t :(int) (0) :(int) (0) :(int) (1)];
 }
};
 //BA.debugLineNum = 41;BA.debugLine="DateTime.DateFormat = df";
[[self.__c DateTime] setDateFormat:_df];
 //BA.debugLineNum = 42;BA.debugLine="Return daysList";
if (true) return self._dayslist;
 //BA.debugLineNum = 43;BA.debugLine="End Sub";
return nil;
}
- (NSString*)  _getera:(BOOL) _negative{
NSString* _df = @"";
 //BA.debugLineNum = 141;BA.debugLine="Private Sub GetEra(Negative As Boolean) As String";
 //BA.debugLineNum = 142;BA.debugLine="Dim df As String = DateTime.DateFormat";
_df = [[self.__c DateTime] DateFormat];
 //BA.debugLineNum = 143;BA.debugLine="If Negative Then";
if (_negative) { 
 //BA.debugLineNum = 144;BA.debugLine="If bc <> \"\" Then Return bc";
if ([self._bc isEqual:@""] == false) { 
if (true) return self._bc;};
 //BA.debugLineNum = 145;BA.debugLine="DateTime.DateFormat = \"GG\"";
[[self.__c DateTime] setDateFormat:@"GG"];
 //BA.debugLineNum = 146;BA.debugLine="bc = DateTime.Date(-137628808000000)";
self._bc = [[self.__c DateTime] Date:(long long) (-137628808000000L)];
 //BA.debugLineNum = 147;BA.debugLine="DateTime.DateFormat = df";
[[self.__c DateTime] setDateFormat:_df];
 //BA.debugLineNum = 148;BA.debugLine="Return bc";
if (true) return self._bc;
 }else {
 //BA.debugLineNum = 150;BA.debugLine="If ad <> \"\" Then Return ad";
if ([self._ad isEqual:@""] == false) { 
if (true) return self._ad;};
 //BA.debugLineNum = 151;BA.debugLine="DateTime.DateFormat = \"GG\"";
[[self.__c DateTime] setDateFormat:@"GG"];
 //BA.debugLineNum = 152;BA.debugLine="ad = DateTime.Date(0)";
self._ad = [[self.__c DateTime] Date:(long long) (0)];
 //BA.debugLineNum = 153;BA.debugLine="DateTime.DateFormat = df";
[[self.__c DateTime] setDateFormat:_df];
 //BA.debugLineNum = 154;BA.debugLine="Return ad";
if (true) return self._ad;
 };
 //BA.debugLineNum = 156;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _getmonthname:(long long) _ticks{
NSString* _df = @"";
NSString* _res = @"";
 //BA.debugLineNum = 11;BA.debugLine="Public Sub GetMonthName(Ticks As Long) As String";
 //BA.debugLineNum = 12;BA.debugLine="Dim df As String = DateTime.DateFormat";
_df = [[self.__c DateTime] DateFormat];
 //BA.debugLineNum = 13;BA.debugLine="DateTime.DateFormat = \"MMMM\"";
[[self.__c DateTime] setDateFormat:@"MMMM"];
 //BA.debugLineNum = 14;BA.debugLine="Dim res As String = DateTime.Date(Ticks)";
_res = [[self.__c DateTime] Date:_ticks];
 //BA.debugLineNum = 15;BA.debugLine="DateTime.DateFormat = df";
[[self.__c DateTime] setDateFormat:_df];
 //BA.debugLineNum = 16;BA.debugLine="Return res";
if (true) return _res;
 //BA.debugLineNum = 17;BA.debugLine="End Sub";
return @"";
}
- (B4IList*)  _getmonthsnames{
NSString* _df = @"";
long long _t = 0L;
int _i = 0;
 //BA.debugLineNum = 46;BA.debugLine="Public Sub GetMonthsNames As List";
 //BA.debugLineNum = 47;BA.debugLine="If monthsList.IsInitialized Then Return monthsLis";
if ([self._monthslist IsInitialized]) { 
if (true) return self._monthslist;};
 //BA.debugLineNum = 48;BA.debugLine="monthsList.Initialize";
[self._monthslist Initialize];
 //BA.debugLineNum = 49;BA.debugLine="Dim df As String = DateTime.DateFormat";
_df = [[self.__c DateTime] DateFormat];
 //BA.debugLineNum = 50;BA.debugLine="DateTime.DateFormat = \"MMMM\"";
[[self.__c DateTime] setDateFormat:@"MMMM"];
 //BA.debugLineNum = 51;BA.debugLine="Dim t As Long = DateTime.Now";
_t = [[self.__c DateTime] Now];
 //BA.debugLineNum = 52;BA.debugLine="t = DateTime.Add(t, 0,- (DateTime.GetMonth(t) - 1";
_t = [[self.__c DateTime] Add:_t :(int) (0) :(int) (-([[self.__c DateTime] GetMonth:_t]-1)) :(int) (0)];
 //BA.debugLineNum = 53;BA.debugLine="For i = 1 To 12";
{
const int step7 = 1;
const int limit7 = (int) (12);
_i = (int) (1) ;
for (;(step7 > 0 && _i <= limit7) || (step7 < 0 && _i >= limit7) ;_i = ((int)(0 + _i + step7))  ) {
 //BA.debugLineNum = 54;BA.debugLine="monthsList.Add(DateTime.Date(t))";
[self._monthslist Add:(NSObject*)([[self.__c DateTime] Date:_t])];
 //BA.debugLineNum = 55;BA.debugLine="t = DateTime.Add(t, 0, 1, 0)";
_t = [[self.__c DateTime] Add:_t :(int) (0) :(int) (1) :(int) (0)];
 }
};
 //BA.debugLineNum = 57;BA.debugLine="DateTime.DateFormat = df";
[[self.__c DateTime] setDateFormat:_df];
 //BA.debugLineNum = 58;BA.debugLine="Return monthsList";
if (true) return self._monthslist;
 //BA.debugLineNum = 59;BA.debugLine="End Sub";
return nil;
}
- (BOOL)  _issameday:(long long) _ticks1 :(long long) _ticks2{
 //BA.debugLineNum = 232;BA.debugLine="Public Sub IsSameDay(Ticks1 As Long, Ticks2 As Lon";
 //BA.debugLineNum = 233;BA.debugLine="Return DateTime.GetYear(Ticks1) = DateTime.GetYea";
if (true) return [[self.__c DateTime] GetYear:_ticks1]==[[self.__c DateTime] GetYear:_ticks2] && [[self.__c DateTime] GetMonth:_ticks1]==[[self.__c DateTime] GetMonth:_ticks2] && [[self.__c DateTime] GetDayOfMonth:_ticks1]==[[self.__c DateTime] GetDayOfMonth:_ticks2];
 //BA.debugLineNum = 235;BA.debugLine="End Sub";
return false;
}
- (int)  _numberofdaysinmonth:(int) _month :(int) _year{
long long _ticks = 0L;
long long _nextmonth = 0L;
int _res = 0;
 //BA.debugLineNum = 212;BA.debugLine="Public Sub NumberOfDaysInMonth(Month As Int, Year";
 //BA.debugLineNum = 213;BA.debugLine="Dim Ticks As Long = SetDate(Year, Month, 1)";
_ticks = [self _setdate:_year :_month :(int) (1)];
 //BA.debugLineNum = 214;BA.debugLine="Dim nextMonth As Long = DateTime.Add(Ticks, 0, 1,";
_nextmonth = [[self.__c DateTime] Add:_ticks :(int) (0) :(int) (1) :(int) (0)];
 //BA.debugLineNum = 215;BA.debugLine="Dim res As Int =  Round((nextMonth - Ticks) / Dat";
_res = (int) ([self.__c Round:(_nextmonth-_ticks)/(double)[[self.__c DateTime] TicksPerDay]]);
 //BA.debugLineNum = 216;BA.debugLine="Return res";
if (true) return _res;
 //BA.debugLineNum = 217;BA.debugLine="End Sub";
return 0;
}
- (_period*)  _periodbetween:(long long) _start :(long long) _endtime{
 //BA.debugLineNum = 63;BA.debugLine="Public Sub PeriodBetween(Start As Long, EndTime As";
 //BA.debugLineNum = 64;BA.debugLine="Return PeriodBetweenHelper(Start, EndTime, False)";
if (true) return [self _periodbetweenhelper:_start :_endtime :[self.__c False]];
 //BA.debugLineNum = 65;BA.debugLine="End Sub";
return nil;
}
- (_period*)  _periodbetweenhelper:(long long) _start :(long long) _endtime :(BOOL) _startwithdays{
_period* _td = nil;
int _sy = 0;
int _ey = 0;
int _daysoffset = 0;
long long _ticks = 0L;
int _i = 0;
long long _diff = 0L;
 //BA.debugLineNum = 73;BA.debugLine="Private Sub PeriodBetweenHelper(Start As Long, End";
 //BA.debugLineNum = 74;BA.debugLine="Dim td As Period";
_td = [_period new];
 //BA.debugLineNum = 75;BA.debugLine="td.Initialize";
[_td Initialize];
 //BA.debugLineNum = 76;BA.debugLine="Dim sy = DateTime.GetYear(Start), ey = DateTime.G";
_sy = [[self.__c DateTime] GetYear:_start];
_ey = [[self.__c DateTime] GetYear:_endtime];
 //BA.debugLineNum = 77;BA.debugLine="Dim daysOffset As Int";
_daysoffset = 0;
 //BA.debugLineNum = 78;BA.debugLine="If EndTime > Start Then";
if (_endtime>_start) { 
 //BA.debugLineNum = 79;BA.debugLine="If Not(StartWithDays) Then";
if ([self.__c Not:_startwithdays]) { 
 //BA.debugLineNum = 81;BA.debugLine="If DateTime.Add(Start, ey - sy, 0, 0) > EndTime";
if ([[self.__c DateTime] Add:_start :(int) (_ey-_sy) :(int) (0) :(int) (0)]>_endtime) { 
_td.Years = (int) (_ey-_sy-1);}
else {
_td.Years = (int) (_ey-_sy);};
 //BA.debugLineNum = 82;BA.debugLine="Dim ticks As Long = DateTime.Add(Start, td.Year";
_ticks = [[self.__c DateTime] Add:_start :_td.Years :(int) (0) :(int) (0)];
 //BA.debugLineNum = 84;BA.debugLine="For i = 1 To 13";
{
const int step9 = 1;
const int limit9 = (int) (13);
_i = (int) (1) ;
for (;(step9 > 0 && _i <= limit9) || (step9 < 0 && _i >= limit9) ;_i = ((int)(0 + _i + step9))  ) {
 //BA.debugLineNum = 85;BA.debugLine="If DateTime.Add(ticks, 0, i, 0) > EndTime Then";
if ([[self.__c DateTime] Add:_ticks :(int) (0) :_i :(int) (0)]>_endtime) { 
 //BA.debugLineNum = 86;BA.debugLine="td.Months = i - 1";
_td.Months = (int) (_i-1);
 //BA.debugLineNum = 87;BA.debugLine="Exit";
if (true) break;
 };
 }
};
 //BA.debugLineNum = 90;BA.debugLine="ticks = DateTime.Add(ticks, 0, td.Months, 0)";
_ticks = [[self.__c DateTime] Add:_ticks :(int) (0) :_td.Months :(int) (0)];
 }else {
 //BA.debugLineNum = 92;BA.debugLine="daysOffset = (EndTime - Start) / DateTime.Ticks";
_daysoffset = (int) ((_endtime-_start)/(double)[[self.__c DateTime] TicksPerDay]-3);
 //BA.debugLineNum = 93;BA.debugLine="Dim ticks As Long = Start";
_ticks = _start;
 };
 //BA.debugLineNum = 96;BA.debugLine="For i = daysOffset + 1 To daysOffset + 32";
{
const int step20 = 1;
const int limit20 = (int) (_daysoffset+32);
_i = (int) (_daysoffset+1) ;
for (;(step20 > 0 && _i <= limit20) || (step20 < 0 && _i >= limit20) ;_i = ((int)(0 + _i + step20))  ) {
 //BA.debugLineNum = 97;BA.debugLine="If DateTime.Add(ticks, 0, 0, i) > EndTime Then";
if ([[self.__c DateTime] Add:_ticks :(int) (0) :(int) (0) :_i]>_endtime) { 
 //BA.debugLineNum = 98;BA.debugLine="td.Days = i - 1";
_td.Days = (int) (_i-1);
 //BA.debugLineNum = 99;BA.debugLine="Exit";
if (true) break;
 };
 }
};
 //BA.debugLineNum = 102;BA.debugLine="ticks = DateTime.Add(ticks, 0, 0, td.Days)";
_ticks = [[self.__c DateTime] Add:_ticks :(int) (0) :(int) (0) :_td.Days];
 //BA.debugLineNum = 103;BA.debugLine="Dim diff As Long = EndTime - ticks";
_diff = (long long) (_endtime-_ticks);
 //BA.debugLineNum = 104;BA.debugLine="td.Hours = diff / DateTime.TicksPerHour";
_td.Hours = (int) (_diff/(double)[[self.__c DateTime] TicksPerHour]);
 //BA.debugLineNum = 105;BA.debugLine="td.Minutes = (diff Mod DateTime.TicksPerHour) /";
_td.Minutes = (int) ((_diff%[[self.__c DateTime] TicksPerHour])/(double)[[self.__c DateTime] TicksPerMinute]);
 //BA.debugLineNum = 106;BA.debugLine="td.Seconds = (diff Mod DateTime.TicksPerMinute)";
_td.Seconds = (int) ((_diff%[[self.__c DateTime] TicksPerMinute])/(double)[[self.__c DateTime] TicksPerSecond]);
 //BA.debugLineNum = 107;BA.debugLine="Return td";
if (true) return _td;
 }else {
 //BA.debugLineNum = 109;BA.debugLine="If Not(StartWithDays) Then";
if ([self.__c Not:_startwithdays]) { 
 //BA.debugLineNum = 111;BA.debugLine="If DateTime.Add(Start, ey - sy, 0, 0) < EndTime";
if ([[self.__c DateTime] Add:_start :(int) (_ey-_sy) :(int) (0) :(int) (0)]<_endtime) { 
_td.Years = (int) (_ey-_sy+1);}
else {
_td.Years = (int) (_ey-_sy);};
 //BA.debugLineNum = 112;BA.debugLine="Dim ticks As Long = DateTime.Add(Start, td.Year";
_ticks = [[self.__c DateTime] Add:_start :_td.Years :(int) (0) :(int) (0)];
 //BA.debugLineNum = 114;BA.debugLine="For i = -1 To -13 Step -1";
{
const int step36 = (int) (-1);
const int limit36 = (int) (-13);
_i = (int) (-1) ;
for (;(step36 > 0 && _i <= limit36) || (step36 < 0 && _i >= limit36) ;_i = ((int)(0 + _i + step36))  ) {
 //BA.debugLineNum = 115;BA.debugLine="If DateTime.Add(ticks, 0, i, 0) < EndTime Then";
if ([[self.__c DateTime] Add:_ticks :(int) (0) :_i :(int) (0)]<_endtime) { 
 //BA.debugLineNum = 116;BA.debugLine="td.Months = i + 1";
_td.Months = (int) (_i+1);
 //BA.debugLineNum = 117;BA.debugLine="Exit";
if (true) break;
 };
 }
};
 //BA.debugLineNum = 120;BA.debugLine="ticks = DateTime.Add(ticks, 0, td.Months, 0)";
_ticks = [[self.__c DateTime] Add:_ticks :(int) (0) :_td.Months :(int) (0)];
 }else {
 //BA.debugLineNum = 122;BA.debugLine="daysOffset = (EndTime - Start) / DateTime.Ticks";
_daysoffset = (int) ((_endtime-_start)/(double)[[self.__c DateTime] TicksPerDay]+3);
 //BA.debugLineNum = 123;BA.debugLine="Dim ticks As Long = Start";
_ticks = _start;
 };
 //BA.debugLineNum = 126;BA.debugLine="For i = daysOffset - 1 To daysOffset - 32 Step -";
{
const int step47 = (int) (-1);
const int limit47 = (int) (_daysoffset-32);
_i = (int) (_daysoffset-1) ;
for (;(step47 > 0 && _i <= limit47) || (step47 < 0 && _i >= limit47) ;_i = ((int)(0 + _i + step47))  ) {
 //BA.debugLineNum = 127;BA.debugLine="If DateTime.Add(ticks, 0, 0, i) < EndTime Then";
if ([[self.__c DateTime] Add:_ticks :(int) (0) :(int) (0) :_i]<_endtime) { 
 //BA.debugLineNum = 128;BA.debugLine="td.Days = i + 1";
_td.Days = (int) (_i+1);
 //BA.debugLineNum = 129;BA.debugLine="Exit";
if (true) break;
 };
 }
};
 //BA.debugLineNum = 132;BA.debugLine="ticks = DateTime.Add(ticks, 0, 0, td.Days)";
_ticks = [[self.__c DateTime] Add:_ticks :(int) (0) :(int) (0) :_td.Days];
 //BA.debugLineNum = 133;BA.debugLine="Dim diff As Long = ticks - EndTime";
_diff = (long long) (_ticks-_endtime);
 //BA.debugLineNum = 134;BA.debugLine="td.Hours = -diff / DateTime.TicksPerHour";
_td.Hours = (int) (-_diff/(double)[[self.__c DateTime] TicksPerHour]);
 //BA.debugLineNum = 135;BA.debugLine="td.Minutes = -(diff Mod DateTime.TicksPerHour) /";
_td.Minutes = (int) (-(_diff%[[self.__c DateTime] TicksPerHour])/(double)[[self.__c DateTime] TicksPerMinute]);
 //BA.debugLineNum = 136;BA.debugLine="td.Seconds = -(diff Mod DateTime.TicksPerMinute)";
_td.Seconds = (int) (-(_diff%[[self.__c DateTime] TicksPerMinute])/(double)[[self.__c DateTime] TicksPerSecond]);
 //BA.debugLineNum = 137;BA.debugLine="Return td";
if (true) return _td;
 };
 //BA.debugLineNum = 139;BA.debugLine="End Sub";
return nil;
}
- (_period*)  _periodbetweenindays:(long long) _start :(long long) _endtime{
 //BA.debugLineNum = 69;BA.debugLine="Public Sub PeriodBetweenInDays (Start As Long, End";
 //BA.debugLineNum = 70;BA.debugLine="Return PeriodBetweenHelper(Start, EndTime, True)";
if (true) return [self _periodbetweenhelper:_start :_endtime :[self.__c True]];
 //BA.debugLineNum = 71;BA.debugLine="End Sub";
return nil;
}
- (NSString*)  _process_globals{
self._main=[b4i_main new];
self._actmenu=[b4i_actmenu new];
self._library=[b4i_library new];
self._actsearch=[b4i_actsearch new];
self._actregister=[b4i_actregister new];
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
self._bookmark=[b4i_bookmark new];
self._actabout=[b4i_actabout new];
self._actshow=[b4i_actshow new];
self._actweb=[b4i_actweb new];
self._actsetting=[b4i_actsetting new];
self._actreview=[b4i_actreview new];
self._peroperties=[b4i_peroperties new];
 //BA.debugLineNum = 2;BA.debugLine="Sub Process_Globals";
 //BA.debugLineNum = 3;BA.debugLine="Type Period (Years As Int, Months As Int, _ 		Day";
;
 //BA.debugLineNum = 5;BA.debugLine="Private daysList, monthsList As List";
self._dayslist = [B4IList new];
self._monthslist = [B4IList new];
 //BA.debugLineNum = 6;BA.debugLine="Private ad, bc As String";
self._ad = @"";
self._bc = @"";
 //BA.debugLineNum = 7;BA.debugLine="End Sub";
return @"";
}
- (long long)  _setdate:(int) _years :(int) _months :(int) _days{
 //BA.debugLineNum = 158;BA.debugLine="Public Sub SetDate(Years As Int, Months As Int, Da";
 //BA.debugLineNum = 159;BA.debugLine="Return SetDateAndTime(Years, Months, Days, 0, 0,";
if (true) return [self _setdateandtime:_years :_months :_days :(int) (0) :(int) (0) :(int) (0)];
 //BA.debugLineNum = 160;BA.debugLine="End Sub";
return 0L;
}
- (long long)  _setdateandtime:(int) _years :(int) _months :(int) _days :(int) _hours :(int) _minutes :(int) _seconds{
NSString* _df = @"";
NSString* _tf = @"";
NSString* _d = @"";
NSString* _t = @"";
long long _ticks = 0L;
 //BA.debugLineNum = 162;BA.debugLine="Public Sub SetDateAndTime(Years As Int, Months As";
 //BA.debugLineNum = 163;BA.debugLine="Dim df = DateTime.DateFormat, tf = DateTime.TimeF";
_df = [[self.__c DateTime] DateFormat];
_tf = [[self.__c DateTime] TimeFormat];
 //BA.debugLineNum = 164;BA.debugLine="DateTime.DateFormat = \"GGyyyyMMdd\"";
[[self.__c DateTime] setDateFormat:@"GGyyyyMMdd"];
 //BA.debugLineNum = 165;BA.debugLine="DateTime.TimeFormat = \"HHmmss\"";
[[self.__c DateTime] setTimeFormat:@"HHmmss"];
 //BA.debugLineNum = 166;BA.debugLine="Dim d As String = Format(Abs(Years), 4) & Format(";
_d = [@[[self _format:(int) ([self.__c Abs:_years]) :(int) (4)],[self _format:_months :(int) (2)],[self _format:_days :(int) (2)]] componentsJoinedByString:@""];
 //BA.debugLineNum = 167;BA.debugLine="d = GetEra(Years < 0) & d";
_d = [@[[self _getera:_years<0],_d] componentsJoinedByString:@""];
 //BA.debugLineNum = 168;BA.debugLine="Dim t As String = Format(Hours, 2) & Format(Minut";
_t = [@[[self _format:_hours :(int) (2)],[self _format:_minutes :(int) (2)],[self _format:_seconds :(int) (2)]] componentsJoinedByString:@""];
 //BA.debugLineNum = 169;BA.debugLine="Try";
@try { //BA.debugLineNum = 170;BA.debugLine="Dim ticks As Long = DateTime.DateTimeParse(d, t)";
_ticks = [[self.__c DateTime] DateTimeParse:_d :_t];
 } 
       @catch (NSException* e10) {
			[B4I SetException:e10]; //BA.debugLineNum = 172;BA.debugLine="DateTime.DateFormat = df";
[[self.__c DateTime] setDateFormat:_df];
 //BA.debugLineNum = 173;BA.debugLine="DateTime.TimeFormat = tf";
[[self.__c DateTime] setTimeFormat:_tf];
 //BA.debugLineNum = 174;BA.debugLine="Log(\"Error: Invalid value: \" & d & \" \" & t)";
[self.__c Log:[@[@"Error: Invalid value: ",_d,@" ",_t] componentsJoinedByString:@""]];
 //BA.debugLineNum = 175;BA.debugLine="Return \"invalid date\" + 1 'hack to throw an erro";
if (true) return (long long) ([self.bi ObjectToNumber:@"invalid date"].doubleValue+1);
 };
 //BA.debugLineNum = 177;BA.debugLine="DateTime.DateFormat = df";
[[self.__c DateTime] setDateFormat:_df];
 //BA.debugLineNum = 178;BA.debugLine="DateTime.TimeFormat = tf";
[[self.__c DateTime] setTimeFormat:_tf];
 //BA.debugLineNum = 179;BA.debugLine="Return ticks";
if (true) return _ticks;
 //BA.debugLineNum = 180;BA.debugLine="End Sub";
return 0L;
}
- (long long)  _setdateandtime2:(int) _years :(int) _months :(int) _days :(int) _hours :(int) _minutes :(int) _seconds :(double) _timezone{
NSString* _df = @"";
NSString* _d = @"";
int _tzminutes = 0;
int _tzhours = 0;
NSString* _tzsign = @"";
long long _ticks = 0L;
 //BA.debugLineNum = 184;BA.debugLine="Public Sub SetDateAndTime2(Years As Int, Months As";
 //BA.debugLineNum = 186;BA.debugLine="Dim df As String = DateTime.DateFormat";
_df = [[self.__c DateTime] DateFormat];
 //BA.debugLineNum = 187;BA.debugLine="DateTime.DateFormat = \"GGyyyyMMddHHmmssz\"";
[[self.__c DateTime] setDateFormat:@"GGyyyyMMddHHmmssz"];
 //BA.debugLineNum = 188;BA.debugLine="Dim d As String = Format(Abs(Years), 4) & Format(";
_d = [@[[self _format:(int) ([self.__c Abs:_years]) :(int) (4)],[self _format:_months :(int) (2)],[self _format:_days :(int) (2)]] componentsJoinedByString:@""];
 //BA.debugLineNum = 189;BA.debugLine="d = GetEra(Years < 0) & d";
_d = [@[[self _getera:_years<0],_d] componentsJoinedByString:@""];
 //BA.debugLineNum = 190;BA.debugLine="Dim tzMinutes As Int = Abs(TimeZone * 60)";
_tzminutes = (int) ([self.__c Abs:_timezone*60]);
 //BA.debugLineNum = 191;BA.debugLine="Dim tzHours As Int = tzMinutes / 60";
_tzhours = (int) (_tzminutes/(double)60);
 //BA.debugLineNum = 192;BA.debugLine="Dim tzSign As String";
_tzsign = @"";
 //BA.debugLineNum = 193;BA.debugLine="If TimeZone >= 0 Then tzSign = \"+\" Else tzSign =";
if (_timezone>=0) { 
_tzsign = @"+";}
else {
_tzsign = @"-";};
 //BA.debugLineNum = 194;BA.debugLine="d = d & Format(Hours, 2) & Format(Minutes, 2) & F";
_d = [@[_d,[self _format:_hours :(int) (2)],[self _format:_minutes :(int) (2)],[self _format:_seconds :(int) (2)],@"GMT",_tzsign,[self _format:_tzhours :(int) (2)],@":",[self _format:(int) (_tzminutes%60) :(int) (2)]] componentsJoinedByString:@""];
 //BA.debugLineNum = 196;BA.debugLine="Try";
@try { //BA.debugLineNum = 197;BA.debugLine="Dim ticks As Long = DateTime.DateParse(d)";
_ticks = [[self.__c DateTime] DateParse:_d];
 } 
       @catch (NSException* e13) {
			[B4I SetException:e13]; //BA.debugLineNum = 199;BA.debugLine="DateTime.DateFormat = df";
[[self.__c DateTime] setDateFormat:_df];
 //BA.debugLineNum = 200;BA.debugLine="Log(\"Error: Invalid value: \" & d)";
[self.__c Log:[@[@"Error: Invalid value: ",_d] componentsJoinedByString:@""]];
 //BA.debugLineNum = 201;BA.debugLine="Return \"invalid date\" + 1 'hack to throw an erro";
if (true) return (long long) ([self.bi ObjectToNumber:@"invalid date"].doubleValue+1);
 };
 //BA.debugLineNum = 203;BA.debugLine="DateTime.DateFormat = df";
[[self.__c DateTime] setDateFormat:_df];
 //BA.debugLineNum = 204;BA.debugLine="Return ticks";
if (true) return _ticks;
 //BA.debugLineNum = 205;BA.debugLine="End Sub";
return 0L;
}
- (NSString*)  _tickstostring:(long long) _ticks{
 //BA.debugLineNum = 227;BA.debugLine="Public Sub TicksToString(Ticks As Long) As String";
 //BA.debugLineNum = 228;BA.debugLine="Return DateTime.Date(Ticks) & \" \" & DateTime.Time";
if (true) return [@[[[self.__c DateTime] Date:_ticks],@" ",[[self.__c DateTime] Time:_ticks]] componentsJoinedByString:@""];
 //BA.debugLineNum = 229;BA.debugLine="End Sub";
return @"";
}
- (long long)  _tickstounixtime:(long long) _ticks{
 //BA.debugLineNum = 238;BA.debugLine="Public Sub TicksToUnixTime(Ticks As Long) As Long";
 //BA.debugLineNum = 239;BA.debugLine="Return Ticks / DateTime.TicksPerSecond";
if (true) return (long long) (_ticks/(double)[[self.__c DateTime] TicksPerSecond]);
 //BA.debugLineNum = 240;BA.debugLine="End Sub";
return 0L;
}
- (long long)  _unixtimetoticks:(long long) _unixtime{
 //BA.debugLineNum = 243;BA.debugLine="Public Sub UnixTimeToTicks(UnixTime As Long) As Lo";
 //BA.debugLineNum = 244;BA.debugLine="Return UnixTime * DateTime.TicksPerSecond";
if (true) return (long long) (_unixtime*[[self.__c DateTime] TicksPerSecond]);
 //BA.debugLineNum = 245;BA.debugLine="End Sub";
return 0L;
}
@end
