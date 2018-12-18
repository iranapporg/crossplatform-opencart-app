Type=Service
Version=6.8
ModulesStructureVersion=1
B4A=true
@EndOfDesignText@
#Region  Service Attributes 
	#StartAtBoot: True
#End Region

Sub Process_Globals
	Private hu As HttpJob
End Sub

Sub Service_Create

End Sub

Sub Service_Start (StartingIntent As Intent)
	
	If Library.InternetState = True Then
		
		Dim ht As HttpJob
		ht.Initialize("config",Me)
		ht.Download(Library.GetStringResourse("url") & "/app/config")
		ht.GetRequest.SetHeader("Cache-Control","no-store, no-cache, must-revalidate, max-age=0")
	
	End If
	
	StartServiceAt("",DateTime.Now + 1800000,True) 'each 30 minute

End Sub

Sub JobDone(Job As HttpJob)
	
	If Job.Success Then
		
		If Job.JobName = "config" Then
			
			Dim js As JSONParser
			js.Initialize(Job.GetString2("UTF8"))
			
			Try
				
				Dim d1 As Map
				d1 = js.NextObject
				
				If d1.Get("shop_state") = False Then
					Library.ShopState = False
					Library.manager.SetBoolean("disactive_shop",True)
					Return
				Else if d1.Get("shop_state") = True Then
					Library.manager.SetBoolean("disactive_shop",False)
					Library.ShopState = True
				End If
				
				Dim v1 As Int
				v1 = d1.Get("version")
				
				If v1 > Library.Sign.getPackageVersionCode Then
					
					actUpdate.sLog = d1.Get("log")
					actUpdate.ForceUpdate = d1.Get("force_update")
					StartActivity(actUpdate)
					
				End If
				
			Catch
				
			End Try
			
		End If
		
	Else
		
	End If
	
	Job.Release
	
End Sub

Sub Service_Destroy

End Sub
