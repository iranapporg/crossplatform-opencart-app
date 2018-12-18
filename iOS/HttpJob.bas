Type=Class
Version=4.3
ModulesStructureVersion=1
B4i=true
@EndOfDesignText@
'HttpUtils2 version 2.10
'Class module
Sub Class_Globals
	Public JobName As String
	Public Success As Boolean
	Public Username, Password As String
	Public ErrorMessage As String
	Private target As Object
	Private req As HttpRequest
	Public Tag As Object
	Private res As HttpResponse
	Type MultipartFileData (Dir As String, FileName As String, KeyName As String, ContentType As String)
End Sub

'Initializes the Job.
'Name - The job's name. Note that the name doesn't need to be unique.
'TargetModule - The activity or service that will handle the JobDone event.
Public Sub Initialize (Name As String, TargetModule As Object)
	JobName = Name
	target = TargetModule
End Sub
'Sends a POST request with the given data as the post data.
Public Sub PostString(Link As String, Text As String)
	PostBytes(Link, Text.GetBytes("UTF8"))
End Sub

'Sends a POST request with the given string as the post data
Public Sub PostBytes(Link As String, Data() As Byte)
	req.InitializePost2(Link, Data)
	CallSubDelayed2(HttpUtils2Service, "SubmitJob", Me)
End Sub
'Sends a multipart POST request.
'NameValues - A map with the keys and values. Pass Null if not needed.
'Files - List of MultipartFileData items. Pass Null if not needed.
public Sub PostMultipart(Link As String, NameValues As Map, Files As List)
	Dim boundary As String = "---------------------------1461124740692"
	Dim stream As OutputStream
	stream.InitializeToBytesArray(0)
	Dim b() As Byte
	Dim eol As String = Chr(13) & Chr(10)
	If NameValues <> Null And NameValues.IsInitialized Then
		For Each key As String In NameValues.Keys
			Dim value As String = NameValues.Get(key)
			Dim s As String = _
$"--${boundary}
Content-Disposition: form-data; name="${key}"

${value}
"$
			b = s.Replace(CRLF, eol).GetBytes("UTF8")
			stream.WriteBytes(b, 0, b.Length)
		Next
	End If
	If Files <> Null And Files.IsInitialized Then
		For Each fd As MultipartFileData In Files
			Dim s As String = _
$"--${boundary}
Content-Disposition: form-data; name="${fd.KeyName}"; filename="${fd.FileName}"
Content-Type: ${fd.ContentType}

"$
			b = s.Replace(CRLF, eol).GetBytes("UTF8")
			stream.WriteBytes(b, 0, b.Length)
			Dim in As InputStream = File.OpenInput(fd.Dir, fd.FileName)
			File.Copy2(in, stream)
			stream.WriteBytes(eol.GetBytes("utf8"), 0, 2)
		Next
	End If
	s = _
$"
--${boundary}--
"$
	b = s.Replace(CRLF, eol).GetBytes("UTF8")
	stream.WriteBytes(b, 0, b.Length)
	PostBytes(Link, stream.ToBytesArray)
	req.SetContentType("multipart/form-data; boundary=" & boundary)
	req.SetContentEncoding("UTF8")
End Sub

'Sends a POST request with the given file as the post data.
Public Sub PostFile(Link As String, Dir As String, FileName As String)
	req.InitializePost(Link, Dir, FileName)
	CallSubDelayed2(HttpUtils2Service, "SubmitJob", Me)	
End Sub
'Submits a HTTP GET request.
'Consider using Download2 if the parameters should be escaped.
Public Sub Download(Link As String)
	req.InitializeGet(Link)
	CallSubDelayed2(HttpUtils2Service, "SubmitJob", Me)
End Sub
'Submits a HTTP GET request.
'Encodes illegal parameter characters.
'<code>Example:
'job.Download2("http://www.example.com", _
'	Array As String("key1", "value1", "key2", "value2"))</code>
Public Sub Download2(Link As String, Parameters() As String)
	Dim sb As StringBuilder
	sb.Initialize
	sb.Append(Link)
	If Parameters.Length > 0 Then sb.Append("?")
	Dim su As StringUtils
	For i = 0 To Parameters.Length - 1 Step 2
		If i > 0 Then sb.Append("&")
		sb.Append(su.EncodeUrl(Parameters(i), "UTF8")).Append("=")
		sb.Append(su.EncodeUrl(Parameters(i + 1), "UTF8"))
	Next
	req.InitializeGet(sb.ToString)
	CallSubDelayed2(HttpUtils2Service, "SubmitJob", Me)		
End Sub

'Called by the service to get the request
Public Sub GetRequest As HttpRequest
	Return req
End Sub

'Called by the service when job completes
Public Sub Complete (res1 As HttpResponse)
	res = res1
	CallSub2(target, "JobDone", Me)
End Sub

'Should be called to free resources held by this job.
Public Sub Release
	
End Sub

'Returns the response as a string encoded with UTF8.
Public Sub GetString As String
	Return GetString2("UTF8")
End Sub

'Returns the response as a string.
Public Sub GetString2(Encoding As String) As String
	Return res.GetString2(Encoding)
End Sub

'Returns the response as a bitmap
Public Sub GetBitmap As Bitmap
	Dim b As Bitmap
	b.Initialize2(res.GetInputStream)
	Return b
End Sub

Public Sub GetInputStream As InputStream
	Return res.GetInputStream
End Sub

