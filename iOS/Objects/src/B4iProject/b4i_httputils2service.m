
#import "b4i_httputils2service.h"
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


@implementation b4i_httputils2service 


+ (instancetype)new {
    static b4i_httputils2service* shared = nil;
    if (shared == nil) {
        shared = [self alloc];
        shared.bi = [[B4I alloc] init:shared];
        shared.__c = [B4ICommon new];
    }
    return shared;
}

- (NSString*)  _completejob:(int) _taskid :(BOOL) _success :(NSString*) _errormessage :(B4IHttpResponse*) _res{
b4i_httpjob* _job = nil;
 //BA.debugLineNum = 34;BA.debugLine="Sub CompleteJob(TaskId As Int, success As Boolean,";
 //BA.debugLineNum = 35;BA.debugLine="Dim job As HttpJob = TaskIdToJob.Get(TaskId)";
_job = (b4i_httpjob*)([self._taskidtojob Get:(NSObject*)(@(_taskid))]);
 //BA.debugLineNum = 36;BA.debugLine="TaskIdToJob.Remove(TaskId)";
[self._taskidtojob Remove:(NSObject*)(@(_taskid))];
 //BA.debugLineNum = 37;BA.debugLine="job.success = success";
_job._success = _success;
 //BA.debugLineNum = 38;BA.debugLine="job.errorMessage = errorMessage";
_job._errormessage = _errormessage;
 //BA.debugLineNum = 39;BA.debugLine="job.Complete(res)";
[_job _complete:_res];
 //BA.debugLineNum = 40;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _hc_responseerror:(B4IHttpResponse*) _response :(NSString*) _reason :(int) _statuscode :(int) _taskid{
 //BA.debugLineNum = 24;BA.debugLine="Sub hc_ResponseError (Response As HttpResponse, Re";
 //BA.debugLineNum = 25;BA.debugLine="Log(\"Error response: \" & Reason & \", status code:";
[self.__c Log:[@[@"Error response: ",_reason,@", status code: ",[self.bi NumberToString:@(_statuscode)]] componentsJoinedByString:@""]];
 //BA.debugLineNum = 26;BA.debugLine="CompleteJob(TaskId, False, Reason, Null)";
[self _completejob:_taskid :[self.__c False] :_reason :(B4IHttpResponse*)([self.__c Null])];
 //BA.debugLineNum = 27;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _hc_responsesuccess:(B4IHttpResponse*) _response :(int) _taskid{
 //BA.debugLineNum = 29;BA.debugLine="Sub hc_ResponseSuccess (Response As HttpResponse,";
 //BA.debugLineNum = 30;BA.debugLine="Log(\"response success\")";
[self.__c Log:@"response success"];
 //BA.debugLineNum = 31;BA.debugLine="CompleteJob(TaskId, True, \"\", Response)";
[self _completejob:_taskid :[self.__c True] :@"" :_response];
 //BA.debugLineNum = 32;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _initialize{
 //BA.debugLineNum = 9;BA.debugLine="Private Sub initialize";
 //BA.debugLineNum = 10;BA.debugLine="hc.initialize(\"hc\")";
[self._hc Initialize:self.bi :@"hc"];
 //BA.debugLineNum = 11;BA.debugLine="TaskIdToJob.initialize";
[self._taskidtojob Initialize];
 //BA.debugLineNum = 12;BA.debugLine="End Sub";
return @"";
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
self._cachedata=[b4i_cachedata new];
self._dateutils=[b4i_dateutils new];
self._bookmark=[b4i_bookmark new];
self._actabout=[b4i_actabout new];
self._actshow=[b4i_actshow new];
self._actweb=[b4i_actweb new];
self._actsetting=[b4i_actsetting new];
self._actreview=[b4i_actreview new];
self._peroperties=[b4i_peroperties new];
 //BA.debugLineNum = 2;BA.debugLine="Sub Process_Globals";
 //BA.debugLineNum = 3;BA.debugLine="Private hc As HttpClient";
self._hc = [B4IHttp new];
 //BA.debugLineNum = 4;BA.debugLine="Private TaskIdToJob As Map";
self._taskidtojob = [B4IMap new];
 //BA.debugLineNum = 5;BA.debugLine="Public TempFolder As String";
self._tempfolder = @"";
 //BA.debugLineNum = 6;BA.debugLine="Private taskCounter As Int";
self._taskcounter = 0;
 //BA.debugLineNum = 7;BA.debugLine="End Sub";
return @"";
}
- (NSString*)  _submitjob:(b4i_httpjob*) _job{
 //BA.debugLineNum = 13;BA.debugLine="Public Sub SubmitJob(job As HttpJob)";
 //BA.debugLineNum = 14;BA.debugLine="If hc.IsInitialized = False Then initialize";
if ([self._hc IsInitialized]==[self.__c False]) { 
[self _initialize];};
 //BA.debugLineNum = 15;BA.debugLine="taskCounter = taskCounter + 1";
self._taskcounter = (int) (self._taskcounter+1);
 //BA.debugLineNum = 16;BA.debugLine="TaskIdToJob.Put(taskCounter, job)";
[self._taskidtojob Put:(NSObject*)(@(self._taskcounter)) :(NSObject*)(_job)];
 //BA.debugLineNum = 17;BA.debugLine="If job.Username <> \"\" And job.Password <> \"\" Then";
if ([_job._username isEqual:@""] == false && [_job._password isEqual:@""] == false) { 
 //BA.debugLineNum = 18;BA.debugLine="hc.ExecuteCredentials(job.GetRequest, taskCounte";
[self._hc ExecuteCredentials:[_job _getrequest] :self._taskcounter :_job._username :_job._password];
 }else {
 //BA.debugLineNum = 20;BA.debugLine="hc.Execute(job.GetRequest, taskCounter)";
[self._hc Execute:[_job _getrequest] :self._taskcounter];
 };
 //BA.debugLineNum = 22;BA.debugLine="End Sub";
return @"";
}
@end
