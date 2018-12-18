Type=StaticCode
Version=4.3
ModulesStructureVersion=1
B4i=true
@EndOfDesignText@
'Code module
Sub Process_Globals
	Private hc As HttpClient
	Private TaskIdToJob As Map
	Public TempFolder As String
	Private taskCounter As Int
End Sub

Private Sub initialize
	hc.initialize("hc")
	TaskIdToJob.initialize
End Sub
Public Sub SubmitJob(job As HttpJob)
	If hc.IsInitialized = False Then initialize
	taskCounter = taskCounter + 1
	TaskIdToJob.Put(taskCounter, job)
	If job.Username <> "" And job.Password <> "" Then
		hc.ExecuteCredentials(job.GetRequest, taskCounter, job.Username, job.Password)
	Else
		hc.Execute(job.GetRequest, taskCounter)
	End If
End Sub

Sub hc_ResponseError (Response As HttpResponse, Reason As String, StatusCode As Int, TaskId As Int)
	Log("Error response: " & Reason & ", status code: " & StatusCode)
	CompleteJob(TaskId, False, Reason, Null)
End Sub

Sub hc_ResponseSuccess (Response As HttpResponse, TaskId As Int)
	Log("response success")
	CompleteJob(TaskId, True, "", Response)
End Sub

Sub CompleteJob(TaskId As Int, success As Boolean, errorMessage As String, res As HttpResponse)
	Dim job As HttpJob = TaskIdToJob.Get(TaskId)
	TaskIdToJob.Remove(TaskId)
	job.success = success
	job.errorMessage = errorMessage
	job.Complete(res)
End Sub