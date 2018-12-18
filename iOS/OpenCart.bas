Type=Class
Version=4.3
ModulesStructureVersion=1
B4i=true
@EndOfDesignText@
'Class module
Private Sub Class_Globals
	Private hu As HttpJob
	Private su As StringUtils
	Private my_url,api_url As String
	Private EVT As String
	Private sModule As Object
	Private currentCategory As String
End Sub

Public Sub Initialize

	my_url	= Library.GetStringResourse("url")
	api_url = my_url & "/api/rest/"
	
	If Library.InternetState = False And CacheData.ExistCacheProducts = False Then
		actErrorInternet.module = Null'actMenu
		actErrorInternet.StartActivity
	End If
	
End Sub

Public Sub GetToken(Module As Object,Event As String)
	
	Dim res As String
	Dim byte1 As ByteConverter
	res = su.EncodeBase64(byte1.StringToBytes($"${Library.Decrypt(Library.GetStringResourse("client_id"))}:${Library.Decrypt(Library.GetStringResourse("client_secret"))}"$,"UTF8"))
	
	EVT = Event
	sModule = Module
	
	hu.Initialize("token",Me)
	hu.PostString(my_url & "/api/rest/oauth2/token/client_credentials","grant_type=client_credentials")
	hu.GetRequest.SetContentType("application/json")
	hu.GetRequest.SetHeader("Authorization","Basic " & res)'NTI0MTI2MTIzMzE6QVNFQCNFQURT
	setDefaultX_OC(hu.GetRequest)
	setStoreID(hu.GetRequest)
	
End Sub

Public Sub GetCurrentToken As String
	Dim tok As String
	tok = Library.token.Get("access_token")
	Return tok
End Sub

Public Sub CheckSumLocal(Data As List)
	
	Dim blnChanged As Boolean
	
	If File.Exists(CacheData.DirCache,"checksum") = False Then
		File.WriteList(CacheData.DirCache,"checksum",Data)
	Else
		Dim temp As List
		temp = File.ReadList(CacheData.DirCache,"checksum")
		
		For i = 0 To temp.Size - 1
			
			Dim js As JSONParser
			js.Initialize(temp.Get(i))
			
			Try
				Dim md,md2 As Map
				md = js.NextObject
				md2 = Data.Get(i)
			Catch
				Continue
			End Try
			
			Dim d1,d2 As String
			d1 = md.Get("checksum")
			d2 = md2.Get("checksum")
			
			If d1 <> d2 Then
				
				blnChanged = True
				
				Dim tbl As String
				tbl = md2.Get("table")
				
				If tbl.IndexOf("product_description") > -1 Then
					tbl = "cache_string_files"
				Else If tbl.IndexOf("product_to_category") > -1 Then
					tbl = "cache_category_product2"
				Else If tbl.IndexOf("category") > -1 Then
					tbl = "cache_category2"
				Else If tbl.IndexOf("product") > -1 Then
					tbl = "cache_category_product2"
				End If
				
				File.Delete(CacheData.DirCache,tbl)
				
			End If
			
		Next
		
		If blnChanged = True Then
		
			Library.ShowNotification(Library.GetStringResourse("update_checksum"),1)
			File.WriteList(CacheData.DirCache,"checksum",Data)
			
			Try
				Dim ls As List
				ls = File.ListFiles(File.DirLibrary)
				
				If ls.IsInitialized Then
					For o = 0 To ls.Size - 1
						Dim files As String
						files = ls.Get(i)
						If files.StartsWith("timeout_ids_") Then File.Delete(File.DirLibrary,files)
					Next
				End If
			
			Catch
				Log("error in delete special timer file")
			End Try
			
		End If
		
	End If
	
End Sub

Sub JobDone(Job As HttpJob)
	
	Library.HUD.ProgressDialogHide
	 
	Try
	
		If Job.Success Then
			 
			If Job.JobName = "confirmorderpayment" Then
				CallSubDelayed2(sModule,EVT,Job.GetString)
				Return
			End If
			
			Dim rs As String
			rs = Job.GetString2("UTF8")
			
			If rs.StartsWith("<b>Warning") Then
				Dim js1 As JSONGenerator
				js1.Initialize(CreateMap("success":True))
				rs = js1.ToString
			End If
			
			Dim js As JSONParser
			js.Initialize(rs)
			
			If Job.GetString2("UTF8").IndexOf("Unauthorized") > -1 And Job.GetString2("UTF8").IndexOf("401") > -1 Then
				If Library.InternetState = True Then
					Library.HUD.ToastMessageShow(Library.GetStringResourse("error_net_title"),True)
					Return
				End If
			End If
			
			If Job.GetString2("UTF8").IndexOf("The client credentials are invalid") > -1 Then
				
			End If
			
			#region Check Job
			
			#Region Get Token
			If Job.JobName = "token" Then
				
				Try
			
					Library.token = js.NextObject
					
					If SubExists(sModule,EVT,1) Or SubExists(sModule,EVT,2) Or SubExists(sModule,EVT,3)  Then
						CallSub2(sModule,EVT,Library.token)
					End If
					
				Catch
				End Try
				
			#End Region
			
			#region subscribe
			Else if Job.JobName = "subscribe" Then
				Dim res As Map
				res = js.NextObject
				
				CallSub3(sModule,EVT,res,"subscribe")
			#end region

			#region language
			Else if Job.JobName = "languages" Then
				Dim res,res1 As Map
				res = js.NextObject
				res1 = res.Get("data")
				
				Dim lsLang As List
				lsLang.Initialize
				
				For Each val1 As String In res1.Values
					lsLang.Add(val1)
				Next
				
				Dim jsLang As JSONGenerator
				jsLang.Initialize2(lsLang)
				
				File.WriteString(CacheData.DirCache,"language",jsLang.ToString)
				
				CallSub3(sModule,EVT,res,"languages")
			#end region
					
			#region product class
			Else if Job.JobName = "product_class" Then
				Dim res,res1 As Map
				res = js.NextObject
				res1 = res.Get("data")
				
				Dim jsG As JSONGenerator
				jsG.Initialize2(res.Get("return_reasons"))
				File.WriteString(CacheData.DirCache,"return_reasons",jsG.ToString)
				
				For Each k1 As String In res1.Keys
					jsG.Initialize2(res1.Get(k1))
					File.WriteString(CacheData.DirCache,k1,jsG.ToString)
				Next
				
				File.WriteMap(CacheData.DirCache,"product_class2",res)
				CallSub3(sModule,EVT,res,"product_class")
				
			#end region
			
			#region returns
			else if Job.JobName = "returns" Then
				Dim res As Map
				res = js.NextObject
				
				CallSub3(sModule,EVT,res,"returns")
			#end region
			
			#Region Checksum
			Else If Job.JobName = "checksums" Then
				Dim m1 As Map
				m1 = js.NextObject
				If m1.ContainsKey("success") Then
					If m1.Get("success") = True Then
						CheckSumLocal(m1.Get("data"))
					End If
				End If
				CallSubDelayed(sModule,EVT)
			#End Region
			
			#Region Product
			Else If Job.JobName = "product" Or Job.JobName = "bestsellers" Then
				
				If currentCategory = "bestsellers" Then
			 	
					Dim m1,product As Map
					m1 = js.NextObject
					
					Dim products As List
					Dim temp2s As Map
					products.Initialize
					temp2s = m1.Get("data")
					
					Dim l1 As List
					l1 = temp2s.Get("products")
					
					CallSubDelayed3(sModule,EVT,l1,currentCategory)
					
					Return
					
				End If
				
				If SubExists(sModule,EVT,1) Or SubExists(sModule,EVT,2) Or SubExists(sModule,EVT,3)  Then
					Try
						Dim m1,product As Map
						m1 = js.NextObject
						
						Dim temp,products As List
						products.Initialize
						temp = m1.Get("data")
						
						If temp Is List Then
							
							If temp.Size = 0 Then
								CallSubDelayed3(sModule,EVT,temp,currentCategory)
								Return	
							End If
							
							Dim t1 As Map
							t1 = temp.Get(0)
							
							If t1.ContainsKey("products") = False Then
								CallSubDelayed3(sModule,EVT,temp,currentCategory)
								Return
							End If
						
						Else If temp Is Map Then
							Dim ms As Map
							ms = temp
							Dim l1 As List
							l1 = ms.Get("products")
							
							CallSubDelayed3(sModule,EVT,l1,currentCategory)
							Return
							
						End If
						
						Try
							product		= temp.Get(0) 
							products	= product.Get("products")
							CallSubDelayed3(sModule,EVT,products,currentCategory)
						Catch
							CallSubDelayed3(sModule,EVT,products,currentCategory)
						End Try
						
					Catch
					End Try
				End If
			
			#End Region
			
			#Region Product Details
			Else If Job.JobName = "product_details" Then
				
				If SubExists(sModule,EVT,1) Or SubExists(sModule,EVT,2) Or SubExists(sModule,EVT,3)  Then
					Try
						Dim m1,product As Map
						m1 = js.NextObject
						
						Dim temp1 As Map
						temp1 = m1.Get("data")
						
						CallSub3(sModule,EVT,temp1,currentCategory)
						
					Catch
					End Try
				End If
			
			#End Region
			
			#Region Slideshow
			Else If Job.JobName = "slideshow" Then
				
				Dim temp1 As Map
				temp1 = js.NextObject
				
				Dim temp2 As List
				temp2 = temp1.Get("data")
				temp1 = temp2.Get(0)

				temp2 = temp1.Get("banners")
				
				CallSub3(sModule,EVT,temp2,"slideshow")
				Return
			
			#End Region
			
			#Region Categories
			Else If Job.JobName = "categories" Then
			
				Dim temp1 As Map
				temp1 = js.NextObject
				
				Dim temp2 As List
				temp2 = temp1.Get("data")
				
				CallSub3(sModule,EVT,temp2,"categories")
				
			#End Region
			
			#Region Add Item to cart
			Else If Job.JobName = "add2cart" Then
				
				Dim res As Map
				res = js.NextObject
				
				CallSub3(sModule,EVT,res,"add2cart")
				
			#End Region
			
			#Region Carts
			Else If Job.JobName = "carts" Then
			
				Dim data1,data2 As Map
				data1 = js.NextObject
				
				data2 = data1.Get("data")
				
				CallSub3(sModule,EVT,data2,"carts")
			
			#End Region
			
			#Region Clear Cart
			Else If Job.JobName = "clearcart" Then
				
				Dim data3 As Map
				data3 = js.NextObject
				CallSub3(sModule,EVT,data3,"carts")
				
			#End Region
			
			#Region Update Cart
			Else If Job.JobName = "updatecart" Then
				
				Dim data3 As Map
				data3 = js.NextObject
				CallSub3(sModule,EVT,data3,"update")
				
			#End Region
			
			#Region Review
			Else If Job.JobName = "review" Then
				
				Dim res1 As Map
				res1 = js.NextObject
				CallSub3(sModule,EVT,res1,"review")
			
			#End Region
			
			#Region Contact
			Else If Job.JobName = "contact" Then
				
				Dim res1 As Map
				res1 = js.NextObject
				CallSub3(sModule,EVT,res1,"contact")
			
			#End Region
			
			#Region Delete item cart
			Else If Job.JobName = "deletecartitem" Then
			
				Dim data1,data2 As Map
				data1 = js.NextObject
				
				CallSub3(sModule,EVT,data1,"deletecartitem")
			
			#End Region
			
			#Region Register User
			Else If Job.JobName = "register" Then
			
				Dim data1,data2 As Map
				data1 = js.NextObject
				
				CallSub3(sModule,EVT,data1,"register")
			
			#End Region
			
			#Region Login User
			Else If Job.JobName = "login" Then
			
				Dim data1,data2 As Map
				data1 = js.NextObject
				
				CallSub3(sModule,EVT,data1,"login")
			
			#End Region
			
			#Region Logout User
			Else If Job.JobName = "logout" Then
			
				Dim data1,data2 As Map
				data1 = js.NextObject
				
				CallSub3(sModule,EVT,data1,"logout")
			
			#End Region
			
			#Region Forgoten password
			Else If Job.JobName = "forgot" Then
			
				Dim data1,data2 As Map
				data1 = js.NextObject
				
				CallSub3(sModule,EVT,data1,"forgot")
			
			#End Region
			
			#Region Add Coupon
			Else If Job.JobName = "coupon" Or Job.JobName = "voucher" Or Job.JobName = "reward" Then
			
				Dim data1,data2 As Map
				data1 = js.NextObject
				
				If data1.ContainsKey("success") Then
					If data1.Get("success") = True Then
						CallSubDelayed2(sModule,EVT,True)
					Else
						CallSubDelayed2(sModule,EVT,False)
					End If
				Else
					CallSubDelayed2(sModule,EVT,False)
				End If
			
			#End Region
			
			#Region List Country
			Else If Job.JobName = "country" Then
				
				Dim l1 As List
				Dim m1 As Map
				m1 = js.NextObject
				l1 = m1.Get("data")
			
				CallSubDelayed3(sModule,EVT,l1,"city")
				
			#End Region
			
			#Region List City
			Else If Job.JobName = "city" Then
				
				Dim l1 As List
				Dim m1 As Map
				m1 = js.NextObject
				m1 = m1.Get("data")
				l1 = m1.Get("zone")
				
				CallSubDelayed3(sModule,EVT,l1,"city")
				
			#End Region
			
			#Region Order
			Else If Job.JobName = "order" Or Job.JobName = "confirmorder" Or Job.JobName = "pay" Then Then
				
				Dim data1,data2 As Map
				data1 = js.NextObject
				
				CallSub3(sModule,EVT,data1,"order")
			#End Region
			
			#Region Order simple
			Else If Job.JobName = "ordersimple" Then
				
				CallSub2(sModule,EVT,Job.GetString)
			#End Region
			
			#Region Payments
			Else If Job.JobName = "getpayments" Or Job.JobName = "setpayments" Then Then
				
				Dim data1,data2 As Map
				data1 = js.NextObject
				
				CallSubDelayed3(sModule,EVT,data1,"payments")
			#End Region
			
			#Region Ship Method
			Else If Job.JobName = "shippingmethods" Then Then
				
				Dim data1,data2 As Map
				data1 = js.NextObject
				
				CallSubDelayed3(sModule,EVT,data1,"shippingmethods")
			#End Region
			
			#Region Add Address
			Else If Job.JobName = "addaddress" Then Then
				
				Dim data1,data2 As Map
				data1 = js.NextObject
				
				CallSubDelayed3(sModule,EVT,data1,"addaddress")
			#End Region
			
			#Region Clear cart after payment
			Else If Job.JobName = "clearcart_payment" Then
				CallSub(sModule,EVT)
			#End Region
			
			#Region account_details
			Else If Job.JobName = "account_user" Then
				
				Dim data1,data2 As Map
				data1 = js.NextObject
				
				CallSubDelayed3(sModule,EVT,data1,"account_details")
				
			#End Region
			
			#Region Get all orders
			Else If Job.JobName = "getothers" Then
				
				Dim data1,data2 As Map
				data1 = js.NextObject
				
				CallSubDelayed3(sModule,EVT,data1,"orders")
			#End Region
			
			#Region Get manufacturers and information
			Else If Job.JobName = "manufacturers" Or Job.JobName = "information" Then
				
				Dim data1,data2 As Map
				data1 = js.NextObject
				
				CallSubDelayed3(sModule,EVT,data1,Job.JobName)
				
			#End Region
			
			#Region Get store and details
			Else If Job.JobName = "store" Then
				
				Dim data1,data2 As Map
				data1 = js.NextObject
				
				CallSubDelayed3(sModule,EVT,data1,"store")
			#End Region
			
			#Region Wishlist
			Else If Job.JobName = "wishlist" Then
				
				Dim data1,data2 As Map
				data1 = js.NextObject
				
				CallSubDelayed3(sModule,EVT,data1,"wishlist")
			
			End If
			#End Region
			
		Else
			
			If Job.ErrorMessage.ToLowerCase.IndexOf("service unavailable") > -1 Then
				Library.HUD.ToastMessageShow(Library.GetStringResourse("shop_disable"),True)
				actErrorInternet.module = sModule
				actErrorInternet.NoShop = Library.GetStringResourse("shop_disable")
				actErrorInternet.StartActivity
				Return	
			End If
			
			If CacheData.ExistCacheProducts = True And Library.InternetState = False Then
				'not connect to internet
			Else
				Log(Job.JobName)
				actErrorInternet.module = sModule
				actErrorInternet.StartActivity
			End If
			
		End If
	
	Catch

		Library.HUD.ToastMessageShow(Library.GetStringResourse("error_net_title"),False)

		If SubExists(sModule,EVT,1) Or SubExists(sModule,EVT,2) Or SubExists(sModule,EVT,3)  Then
			CallSub3(sModule,EVT,Null,"")
		End If
		
	End Try
	
	#end region

	Job.Release
	
End Sub 

Public Sub GetSlideshow(Module As Object,Event As String)
	
	sModule = Module
	EVT = Event
	currentCategory = "slideshow"
	
	hu.Initialize("slideshow",Me)
	
	hu.Download(api_url & "slideshows")
	
	Dim auth As String
	auth = $"${Library.token.Get("token_type")} ${GetCurrentToken}"$
	
	hu.GetRequest.SetHeader("Authorization",auth)
 	setDefaultX_OC(hu.GetRequest)
	
End Sub

#Region User

Public Sub Register(Module As Object,Event As String,data As Map,isGuest As Boolean)
	
	sModule = Module
	EVT = Event
	currentCategory = "register"
	
	hu.Initialize("register",Me)
	
	Dim auth As String
	auth = $"${Library.token.Get("token_type")} ${GetCurrentToken}"$
	
	If isGuest = True Then
		data.Put("address_2","android")
		data.Put("company_id","1")
		data.Put("company","guest")
		data.Put("password","12345")
		data.Put("confirm","12345")
		data.Put("fax","1")
		data.Put("tax_id","")
		data.Put("agree","1")
		currentCategory = "guest"
	Else
		data.Put("company","company")
		data.Put("address_2","test")
		data.Put("company_id","company")
		data.Put("confirm",data.Get("password"))
		data.Put("agree","1")
		data.Put("tax_id","1")
		currentCategory = "register"
	End If
	
	Dim js As JSONGenerator
	js.Initialize(data)
	
	hu.PostString(api_url & currentCategory,js.ToString)
	hu.GetRequest.SetHeader("body",js.ToString)
	hu.GetRequest.SetHeader("Authorization",auth)
	
End Sub

Public Sub Login(Module As Object,Event As String,sEmail As String,sPassword  As String)
	
	sModule = Module
	EVT = Event
	currentCategory = "login"
	
	Dim data As Map
	data.Initialize
	data.Put("email",sEmail)
	data.Put("password",sPassword)
	
	Dim js As JSONGenerator
	js.Initialize(data)
	
	hu.Initialize("login",Me)
	hu.PostString(api_url & "login",js.ToString)
	
	Dim auth As String
	auth = $"${Library.token.Get("token_type")} ${GetCurrentToken}"$

	hu.GetRequest.SetHeader("body",js.ToString)
	hu.GetRequest.SetHeader("Authorization",auth)
	
End Sub

Public Sub Logout(Module As Object,Event As String)
	
	sModule = Module
	EVT = Event
	currentCategory = "logout"
	
	hu.Initialize("logout",Me)
	
	hu.PostString(api_url & "logout","")
	
	Dim auth As String
	auth = $"${Library.token.Get("token_type")} ${GetCurrentToken}"$

	hu.GetRequest.SetHeader("Authorization",auth)
 	setDefaultX_OC(hu.GetRequest)
	
End Sub

Public Sub LoginUser(Module As Object,Event As String,sEMail As String,sPassword As String)
	
	sModule = Module
	EVT = Event
	currentCategory = "login"
	
	hu.Initialize("login",Me)
	
	hu.Download(api_url & currentCategory)
	
	Dim auth As String
	auth = $"${Library.token.Get("token_type")} ${GetCurrentToken}"$
	
	hu.GetRequest.SetHeader("Authorization",auth)
	
	Dim sData As Map
	sData.Initialize
	sData.Put("email",sEMail)
	sData.Put("password",sPassword)
	
	Dim js As JSONGenerator
	js.Initialize(sData)
	hu.GetRequest.SetHeader("Login object",js.ToString)
	
End Sub

Public Sub LoginUserSocial(Module As Object,Event As String,sEMail As String,sAccessToken As String,sProvider As String)
	
	sModule = Module
	EVT = Event
	currentCategory = "sociallogin"
	
	hu.Initialize("login",Me)
	
	hu.Download(api_url & currentCategory)
	
	Dim auth As String
	auth = $"${Library.token.Get("token_type")} ${GetCurrentToken}"$
	
	hu.GetRequest.SetHeader("Authorization",auth)
	
	Dim sData As Map
	sData.Initialize
	sData.Put("email",sEMail)
	sData.Put("access_token",sAccessToken)
	sData.Put("provider",sProvider)
	
	Dim js As JSONGenerator
	js.Initialize(sData)
	hu.GetRequest.SetHeader("Login object",js.ToString)
	
End Sub

Public Sub ContactUs(Module As Object,Event As String,sEmail As String,sName As String,sText As String)
	
	sModule = Module
	EVT = Event
	currentCategory = "contact"
	
	Dim sReview As Map
	sReview.Initialize
	sReview.Put("name",sName)
	sReview.Put("email",sEmail)
	sReview.Put("enquiry",sText)
	
	Dim js As JSONGenerator
	js.Initialize(sReview)
	
	hu.Initialize("contact",Me)
	hu.PostString(api_url & currentCategory,js.ToString)
	
	Dim auth As String
	auth = $"${Library.token.Get("token_type")} ${GetCurrentToken}"$
	
	hu.GetRequest.SetHeader("Authorization",auth)
	
End Sub

Public Sub ForgotPassword(Module As Object,Event As String,sEmail As String)
	
	sModule = Module
	EVT = Event
	currentCategory = "forgotten"
	
	Dim data As Map
	data.Initialize
	data.Put("email",sEmail)
	
	Dim js As JSONGenerator
	js.Initialize(data)
	
	hu.Initialize("forgot",Me)
	hu.PostString(api_url & currentCategory,js.ToString)
	
	Dim auth As String
	auth = $"${Library.token.Get("token_type")} ${GetCurrentToken}"$
	hu.GetRequest.SetHeader("Authorization",auth)
	
End Sub

#End Region

#Region Products

Public Sub GetSpecialProduct(Category As String,Paging As Boolean,Limit As Int,Module As Object,Event As String)
	
	sModule = Module
	EVT = Event
	currentCategory = Category
	
	hu.Initialize("product",Me)
	
	Dim link As String
	link = $"/${Category}/limit/${Limit}"$
	
	If Paging = True Then
		link = link & "/page/1"
	End If
	
	hu.Download(api_url & link)

	Dim auth As String
	auth = $"${Library.token.Get("token_type")} ${GetCurrentToken}"$
	hu.GetRequest.SetHeader("Authorization",auth)
	setDefaultX_OC(hu.GetRequest)
 
End Sub

Public Sub GetmanufactureProduct(sID As String,Module As Object,Event As String)
	
	sModule = Module
	EVT = Event
	currentCategory = "/index.php?route=feed/rest_api/products&manufacturer=" & sID
	
	hu.Initialize("product",Me)
	
	hu.Download(my_url & currentCategory)
	
	Dim auth As String
	auth = $"${Library.token.Get("token_type")} ${GetCurrentToken}"$
	hu.GetRequest.SetHeader("Authorization",auth)
	setDefaultX_OC(hu.GetRequest)
 
End Sub

Public Sub GetCategory(Module As Object,Event As String,sParentID As String)
	
	sModule = Module
	EVT = Event
	
	If sParentID = "" Then
		currentCategory = "categories"
	Else
		currentCategory = "categories/parent/" & sParentID
	End If
	
	hu.Initialize("categories",Me)
	hu.Download(api_url & currentCategory)
	
	Dim auth As String
	auth = $"${Library.token.Get("token_type")} ${GetCurrentToken}"$
	
	hu.GetRequest.SetHeader("Authorization",auth)
	setDefaultX_OC(hu.GetRequest)
 
End Sub

Public Sub GetCategoryProducts(Module As Object,Event As String,sID As String)
	
	sModule = Module
	EVT = Event
	
	If sID = "0" Then
		currentCategory = "products/category"
	Else
		currentCategory = "products/category/" & sID
	End If
	
	hu.Initialize("product",Me)
	
	hu.Download(api_url & currentCategory)
	
	Dim auth As String
	auth = $"${Library.token.Get("token_type")} ${GetCurrentToken}"$
	
	hu.GetRequest.SetHeader("Authorization",auth)
	setDefaultX_OC(hu.GetRequest)
 
End Sub

Public Sub SearchProduct(Module As Object,Event As String,sField As String)
	
	sModule = Module
	EVT = Event
	
	Dim su As StringUtils
	currentCategory = "products/search/" & su.EncodeUrl(sField,"UTF8")
	
	hu.Initialize("product",Me)
	hu.Download(api_url & currentCategory)
	
	Dim auth As String
	auth = $"${Library.token.Get("token_type")} ${GetCurrentToken}"$
	
	hu.GetRequest.SetHeader("Authorization",auth)
	setDefaultX_OC(hu.GetRequest)
	
End Sub

Public Sub CustomSearchProduct(Module As Object,Event As String,sField As Map,Limit As Int)
	
	sModule = Module
	EVT = Event
	
	Dim su As StringUtils
	currentCategory = "products/custom_search/limit/" & Limit & "/page/1"
	
	Dim js As JSONGenerator
	js.Initialize(sField)
	
	hu.Initialize("product",Me)
	hu.PostString(api_url & currentCategory,js.ToString)
	
	Dim auth As String
	auth = $"${Library.token.Get("token_type")} ${GetCurrentToken}"$
	
	hu.GetRequest.SetHeader("Authorization",auth)
	hu.GetRequest.SetHeader("body",js.ToString)
	hu.GetRequest.SetContentEncoding("utf-8")
	setDefaultX_OC(hu.GetRequest)
	
End Sub

Public Sub SearchProduct2(Module As Object,Event As String,sField As String)
	
	sModule = Module
	EVT = Event
	
	Dim su As StringUtils
	currentCategory = "products/search/" & su.EncodeUrl(sField,"UTF8") 
	
	hu.Initialize("product",Me)
	
	hu.Download(api_url & currentCategory)
	
	Dim auth As String
	auth = $"${Library.token.Get("token_type")} ${GetCurrentToken}"$
	
	hu.GetRequest.SetHeader("Authorization",auth)
	setDefaultX_OC(hu.GetRequest)
	
End Sub

Public Sub RelatedProduct(Module As Object,Event As String,sID As String)
	
	sModule = Module
	EVT = Event
	
	Dim su As StringUtils
	currentCategory = "related/" & sID
	
	hu.Initialize("product",Me)
	
	hu.Download(api_url & currentCategory)
	
	Dim auth As String
	auth = $"${Library.token.Get("token_type")} ${GetCurrentToken}"$
	
	hu.GetRequest.SetHeader("Authorization",auth)
	setDefaultX_OC(hu.GetRequest)
	
End Sub

Public Sub ProductDetails(Module As Object,Event As String,sID As String)
	
	sModule = Module
	EVT = Event
	currentCategory = "products/" & sID
	
	hu.Initialize("product_details",Me)
	
	hu.Download(api_url & currentCategory)
	
	Dim auth As String
	auth = $"${Library.token.Get("token_type")} ${GetCurrentToken}"$
	
	hu.GetRequest.SetHeader("Authorization",auth)
	setDefaultX_OC(hu.GetRequest)
	
End Sub

Public Sub AddReviewProduct(Module As Object,Event As String,sID As String,sName As String,sText As String,sRating As String)
	
	sModule = Module
	EVT = Event
	currentCategory = $"products/${sID}/review"$
	
	Dim sReview As Map
	sReview.Initialize
	sReview.Put("name",sName)
	sReview.Put("text",sText)
	sReview.Put("rating",sRating)
	
	Dim js As JSONGenerator
	js.Initialize(sReview)
	
	hu.Initialize("review",Me)
	hu.PostString(api_url & currentCategory,js.ToString)
	
	Dim auth As String
	auth = $"${Library.token.Get("token_type")} ${GetCurrentToken}"$
	
	hu.GetRequest.SetHeader("Authorization",auth)
	
End Sub

#End Region

Public Sub GetCity(Module As Object,Event As String,sID As String)
	
	sModule = Module
	EVT = Event
	currentCategory = "countries/" & sID
	
	hu.Initialize("city",Me)
	
	hu.Download(api_url & currentCategory)
	
	Dim auth As String
	auth = $"${Library.token.Get("token_type")} ${GetCurrentToken}"$
	
	hu.GetRequest.SetHeader("Authorization",auth)
	setDefaultX_OC(hu.GetRequest)
	
End Sub

Public Sub GetCountry(Module As Object,Event As String)
	
	sModule = Module
	EVT = Event
	currentCategory = "countries"
	
	hu.Initialize("country",Me)
	
	hu.Download(api_url & currentCategory)
	
	Dim auth As String
	auth = $"${Library.token.Get("token_type")} ${GetCurrentToken}"$
	
	hu.GetRequest.SetHeader("Authorization",auth)
	setDefaultX_OC(hu.GetRequest)
	
End Sub

#Region Order

Public Sub SaveOrder(Module As Object,Event As String,isOnlySave As Boolean)
	
	sModule = Module
	EVT = Event
	currentCategory = "confirm" 'this is method name
	
	hu.Initialize("order",Me)
	hu.PostString(api_url & currentCategory,"")
	
	If isOnlySave = True Then
		hu.GetRequest.InitializePut2(api_url & currentCategory,"".GetBytes("UTF8"))
	End If
	
	Dim auth As String
	auth = $"${Library.token.Get("token_type")} ${GetCurrentToken}"$
	hu.GetRequest.SetHeader("Authorization",auth)
	'hu.GetRequest.SetContentType("application/json")
	
End Sub

Public Sub SaveOrderSimple(Module As Object,Event As String,isOnlySave As Boolean)
	
	sModule = Module
	EVT = Event
	currentCategory = "simpleconfirm" 'this is method name
	
	hu.Initialize("ordersimple",Me)
	hu.PostString(api_url & currentCategory,"")
	
	If isOnlySave = True Then
		hu.GetRequest.InitializePut2(api_url & currentCategory,"".GetBytes("UTF8"))
	End If
	
	Dim auth As String
	auth = $"${Library.token.Get("token_type")} ${GetCurrentToken}"$
	hu.GetRequest.SetHeader("Authorization",auth)
	'hu.GetRequest.SetContentType("application/json")
	
End Sub

Public Sub PaymentOrder(Module As Object,Event As String)
	
	sModule = Module
	EVT = Event
	currentCategory = "pay"
	
	hu.Initialize("confirmorderpayment",Me)
	hu.Download(api_url & currentCategory)
	
	Dim auth As String
	auth = $"${Library.token.Get("token_type")} ${GetCurrentToken}"$
	hu.GetRequest.SetHeader("Authorization",auth)
	
End Sub

Public Sub GetPaymentMethods(Module As Object,Event As String)
	
	sModule = Module
	EVT = Event
	currentCategory = "paymentmethods"
	
	hu.Initialize("getpayments",Me)
	hu.Download(api_url & currentCategory)
	
	Dim auth As String
	auth = $"${Library.token.Get("token_type")} ${GetCurrentToken}"$
	hu.GetRequest.SetHeader("Authorization",auth)
	setDefaultX_OC(hu.GetRequest)
	
End Sub

Public Sub SetPaymentMethods(Module As Object,Event As String,sID As String,Comment As String)
	
	sModule = Module
	EVT = Event
	currentCategory = "paymentmethods"
	
	Dim sData As Map
	sData.Initialize
	sData.Put("payment_method",sID)
	sData.Put("agree","1")
	sData.Put("comment",Comment)
	
	Dim js As JSONGenerator
	js.Initialize(sData)
	
	hu.Initialize("setpayments",Me)
	hu.PostString(api_url & currentCategory,js.ToString)
	
	Dim auth As String
	auth = $"${Library.token.Get("token_type")} ${GetCurrentToken}"$
	hu.GetRequest.SetHeader("Authorization",auth)
	
End Sub

Public Sub GetShipMethods(Module As Object,Event As String)
	
	sModule = Module
	EVT = Event
	currentCategory = "shippingmethods"
	
	hu.Initialize("shippingmethods",Me)
	hu.Download(api_url & currentCategory)
	
	Dim auth As String
	auth = $"${Library.token.Get("token_type")} ${GetCurrentToken}"$
	hu.GetRequest.SetHeader("Authorization",auth)
	setDefaultX_OC(hu.GetRequest)
	
End Sub

Public Sub SetShipMethods(Module As Object,Event As String,sID As String,Comment As String)
	
	sModule = Module
	EVT = Event
	currentCategory = "shippingmethods"
	
	Dim sData As Map
	sData.Initialize
	sData.Put("shipping_method",sID)
	sData.Put("comment",Comment)
	
	Dim js As JSONGenerator
	js.Initialize(sData)
	
	hu.Initialize("shippingmethods",Me)
	hu.PostString(api_url & currentCategory,js.ToString)
	
	Dim auth As String
	auth = $"${Library.token.Get("token_type")} ${GetCurrentToken}"$
	hu.GetRequest.SetHeader("Authorization",auth)
	
End Sub

Public Sub SetGuestShipMethods(Module As Object,Event As String,sData As Map)
	
	sModule = Module
	EVT = Event
	currentCategory = "guestshipping"
	
	Dim js As JSONGenerator
	js.Initialize(sData)
	
	hu.Initialize("shippingmethods",Me)
	hu.PostString(api_url & currentCategory,js.ToString)
	
	Dim auth As String
	auth = $"${Library.token.Get("token_type")} ${GetCurrentToken}"$
	hu.GetRequest.SetHeader("Authorization",auth)
	
End Sub

Public Sub AddAddress(Module As Object,Event As String,sData As Map,IsPayment As Boolean)
	
	sModule = Module
	EVT = Event
	
	If IsPayment Then
		currentCategory = "paymentaddress"
	Else
		currentCategory = "shippingaddress"
	End If
	
	Dim js As JSONGenerator
	js.Initialize(sData)
	
	hu.Initialize("addaddress",Me)
	hu.PostString(api_url & currentCategory,js.ToString)

	Dim auth As String
	auth = $"${Library.token.Get("token_type")} ${GetCurrentToken}"$
	
	hu.GetRequest.SetHeader("Authorization",auth)
	hu.GetRequest.SetHeader("body",js.ToString)
	hu.GetRequest.SetContentType("application/json")
	
End Sub

Public Sub GetOrders(Module As Object,Event As String,sID As String)
	
	sModule = Module
	EVT = Event
	
	If sID = "" Then
		currentCategory = "customerorders"
	Else
		currentCategory = "customerorders/" & sID
	End If
	
	hu.Initialize("getothers",Me)
	hu.Download(api_url & currentCategory)
	
	Dim auth As String
	auth = $"${Library.token.Get("token_type")} ${GetCurrentToken}"$
	hu.GetRequest.SetHeader("Authorization",auth)
	setDefaultX_OC(hu.GetRequest)
	
End Sub

Public Sub GetReturns(Module As Object,Event As String,sID As String)
	
	sModule = Module
	EVT = Event
	
	If sID = "" Then
		currentCategory = "returns"
	Else
		currentCategory = "returns/" & sID
	End If
	
	hu.Initialize("getothers",Me)
	hu.Download(api_url & currentCategory)
	
	Dim auth As String
	auth = $"${Library.token.Get("token_type")} ${GetCurrentToken}"$
	hu.GetRequest.SetHeader("Authorization",auth)
	setDefaultX_OC(hu.GetRequest)
	
End Sub

Public Sub RequestReturn(Module As Object,Event As String,sData As  Map)
		
	sModule = Module
	EVT = Event
	currentCategory = "returns"
	
	Dim js As JSONGenerator
	js.Initialize(sData)
	
	hu.Initialize("returns",Me)
	hu.PostString(api_url & currentCategory,js.ToString)

	Dim auth As String
	auth = $"${Library.token.Get("token_type")} ${GetCurrentToken}"$
	
	hu.GetRequest.SetHeader("Authorization",auth)
	hu.GetRequest.SetHeader("body",js.ToString)
	hu.GetRequest.SetContentType("application/json")
	
End Sub
#End Region

Public Sub GetManufacturers(Module As Object,Event As String)
	
	sModule = Module
	EVT = Event
	
	currentCategory = "manufacturers"
	
	hu.Initialize("manufacturers",Me)
	hu.Download(api_url & currentCategory)
	
	Dim auth As String
	auth = $"${Library.token.Get("token_type")} ${GetCurrentToken}"$
	hu.GetRequest.SetHeader("Authorization",auth)
	setDefaultX_OC(hu.GetRequest)
	
End Sub

Public Sub GetInformation(Module As Object,Event As String)
	
	sModule = Module
	EVT = Event
	
	currentCategory = "information"
	
	hu.Initialize("information",Me)
	hu.Download(api_url & currentCategory)
	
	Dim auth As String
	auth = $"${Library.token.Get("token_type")} ${GetCurrentToken}"$
	hu.GetRequest.SetHeader("Authorization",auth)
	setDefaultX_OC(hu.GetRequest)
	
End Sub

Public Sub GetInformationDetailsID(Module As Object,Event As String,sID As String)
	
	sModule = Module
	EVT = Event
	
	currentCategory = "information/" & sID
	
	hu.Initialize("information",Me)
	hu.Download(api_url & currentCategory)
	
	Dim auth As String
	auth = $"${Library.token.Get("token_type")} ${GetCurrentToken}"$
	hu.GetRequest.SetHeader("Authorization",auth)
	setDefaultX_OC(hu.GetRequest)
	
End Sub

#Region Cart Attachment

Public Sub AddCoupon(Module As Object,Event As String,sID As String)
	
	sModule = Module
	EVT = Event
	currentCategory = "coupon"
	
	Dim js As JSONGenerator
	js.Initialize(CreateMap("coupon" : sID))
	
	hu.Initialize("coupon",Me)
	hu.PostString(api_url & currentCategory,js.ToString)

	Dim auth As String
	auth = $"${Library.token.Get("token_type")} ${GetCurrentToken}"$
	
	hu.GetRequest.SetHeader("Authorization",auth)
	hu.GetRequest.SetHeader("body",js.ToString)
	hu.GetRequest.SetContentType("application/json")
	
End Sub

Public Sub AddReward(Module As Object,Event As String,sID As String)
	
	sModule = Module
	EVT = Event
	currentCategory = "reward"
	
	Dim js As JSONGenerator
	js.Initialize(CreateMap("reward" : sID))
	
	hu.Initialize("reward",Me)
	hu.PostString(api_url & currentCategory,js.ToString)

	Dim auth As String
	auth = $"${Library.token.Get("token_type")} ${GetCurrentToken}"$
	
	hu.GetRequest.SetHeader("Authorization",auth)
	hu.GetRequest.SetHeader("body",js.ToString)
	hu.GetRequest.SetContentType("application/json")
	
End Sub

Public Sub AddVoucher(Module As Object,Event As String,sID As String)
	
	sModule = Module
	EVT = Event
	currentCategory = "voucher"
	
	Dim js As JSONGenerator
	js.Initialize(CreateMap("voucher" : sID))
	
	hu.Initialize("voucher",Me)
	hu.PostString(api_url & currentCategory,js.ToString)

	Dim auth As String
	auth = $"${Library.token.Get("token_type")} ${GetCurrentToken}"$
	
	hu.GetRequest.SetHeader("Authorization",auth)
	hu.GetRequest.SetHeader("body",js.ToString)
	hu.GetRequest.SetContentType("application/json")
	
End Sub

#End Region

Private Sub setDefaultX_OC(Request As HttpRequest)
	
	If Library.currLang = "فارسی" Then
		Request.SetHeader("X-Oc-Merchant-Language","fa")
	Else If Library.currLang.ToLowerCase = "english" Then
		Request.SetHeader("X-Oc-Merchant-Language","en")
	End If
	
	#region Currency Shop
	Dim curr As String
	curr = Library.manager.GetString("curr")
	
	Dim ls,listCurr As List
	Dim temp As String
	
	If File.Exists(CacheData.DirCache,"currencies") Then
		
		temp = File.ReadString(CacheData.DirCache,"currencies")
	
		ls = Library.String2List(temp)
		listCurr.Initialize
		
		If ls.IsInitialized Then
			For i = 0 To ls.Size - 1
				
				Dim m2 As Map
				m2 = ls.Get(i)
				
				If m2.Get("title") = curr Then
					curr = m2.Get("code")
					Exit
				End If
				
			Next
		End If
	
	Else
		curr = "RLS"
	End If
	
	
	If curr.Length = 0 Then curr = "USD"
	
	Request.SetHeader("X-Oc-Currency",curr)
	
	#end region
	
	Request.SetHeader("X-Oc-Image-Dimension",$"${100%x}x${100%x}"$)
	
End Sub

#Region Stores

Public Sub setStoreID(Request As HttpRequest)
	Request.SetHeader("X-Oc-Store-Id",Library.StoreID)
End Sub

Public Sub GetStore(Module As Object,Event As String,sID As String)
	
	sModule = Module
	EVT = Event
	
	If sID = "" Then
		currentCategory = "stores"
	Else
		currentCategory = "stores/" & sID
	End If
	
	hu.Initialize("store",Me)
	hu.Download(api_url & currentCategory)
	
	Dim auth As String
	auth = $"${Library.token.Get("token_type")} ${GetCurrentToken}"$
	hu.GetRequest.SetHeader("Authorization",auth)
	setDefaultX_OC(hu.GetRequest)
	
End Sub

#End Region

Public Sub GetURL As String
	Return my_url
End Sub

#Region Cart

Public Sub Add2Cart(Module As Object,Event As String,sID As String,sCount As String,sOptions As Map)
	
	sModule = Module
	EVT = Event
	currentCategory = "cart"
	
	Dim sProduct As Map
	sProduct.Initialize
	sProduct.Put("product_id",sID)
	sProduct.Put("quantity",sCount)
	sProduct.Put("option",sOptions)
	
	Dim js As JSONGenerator
	js.Initialize(sProduct)
	Log(js.ToString)
	hu.Initialize("add2cart",Me)
	hu.PostString(api_url & currentCategory,js.ToString)
	
	Dim auth As String
	auth = $"${Library.token.Get("token_type")} ${GetCurrentToken}"$
	
	hu.GetRequest.SetHeader("Authorization",auth)
	
End Sub

Public Sub GetCarts(Module As Object,Event As String)
	
	sModule = Module
	EVT = Event
	currentCategory = "cart"
	
	hu.Initialize("carts",Me)
	
	hu.Download(api_url & currentCategory)
	
	Dim auth As String
	
	If Library.token.IsInitialized Then
		auth = $"${Library.token.Get("token_type")} ${GetCurrentToken}"$
	End If
	
	hu.GetRequest.SetHeader("Authorization",auth)
	setDefaultX_OC(hu.GetRequest)
	
End Sub

Public Sub GetCartCount As Int
	
	Try
		If Library.CartDetails = Null Then Return 0
		If Library.CartDetails.IsInitialized = False Then Return 0
		If Library.CartDetails.ContainsKey("products") = False Then Return 0
		
		Try
			Dim l1 As List
			l1 = Library.CartDetails.Get("products")
			Return l1.Size
		Catch
			Return 0
		End Try
	Catch
		Return 0
	End Try
	
End Sub

Public Sub GetCartTotal(Data As List) As Map
	
	Dim sdata,tax,afzodeh,total As Map
	sdata.Initialize
	tax.Initialize
	afzodeh.Initialize
	
	afzodeh = Data.Get(1)
	
	If Data.Size > 2 Then
		tax		= Data.Get(2)
		sdata.Put("tax",tax.Get("text"))
	End If
	
	If Data.Size > 3 Then
		total	= Data.Get(3)
		sdata.Put("total",total.Get("text"))
	Else
		total	= Data.Get(1)
		sdata.Put("total",total.Get("text"))
	End If
	
	sdata.Put("afzodeh",afzodeh.Get("text"))
	
	Return sdata
	
End Sub

Public Sub ClearCartAfterPayment(Module As Object,Event As String)
	
	sModule = Module
	EVT = Event
	currentCategory = "confirm"
	
	hu.Initialize("clearcart_payment",Me)
	hu.PostString(api_url & currentCategory,"")
	hu.GetRequest.InitializePut2(api_url & currentCategory,"".GetBytes("UTF8"))

	Dim auth As String
	auth = $"${Library.token.Get("token_type")} ${GetCurrentToken}"$
	
	hu.GetRequest.SetHeader("Authorization",auth)
	hu.GetRequest.SetContentType("application/json")
	
End Sub

Public Sub DeleteProductFromCart(Module As Object,Event As String,sID As String)
	
	sModule = Module
	EVT = Event
	currentCategory = "cart"
	
	Dim sProduct As Map
	sProduct.Initialize
	sProduct.Put("key",sID)
	
	Dim js As JSONGenerator
	js.Initialize(sProduct)
	
	hu.Initialize("deletecartitem",Me)
	hu.PostString(api_url & currentCategory,js.ToString)
	hu.GetRequest.InitializeDelete(api_url & currentCategory)
	
	Dim auth As String
	auth = $"${Library.token.Get("token_type")} ${GetCurrentToken}"$
	
	hu.GetRequest.SetHeader("Authorization",auth)
	hu.GetRequest.SetHeader("body",js.ToString)
	
End Sub

Public Sub UpdateProductCart(Module As Object,Event As String,sID As String,sCount As String)
	
	sModule = Module
	EVT = Event
	currentCategory = "cart"
	
	Dim sProduct,id As Map
	sProduct.Initialize
	id.Initialize
	sProduct.Put("quantity",CreateMap(sID:sCount))
	
	Dim js As JSONGenerator
	js.Initialize(sProduct)
	
	hu.Initialize("updatecart",Me)
	hu.PostString(api_url & currentCategory,js.ToString)
	hu.GetRequest.InitializePut2(api_url & currentCategory,js.ToString.GetBytes("UTF8"))

	Dim auth As String
	auth = $"${Library.token.Get("token_type")} ${GetCurrentToken}"$
	
	hu.GetRequest.SetHeader("Authorization",auth)
	hu.GetRequest.SetHeader("body",js.ToString)
	hu.GetRequest.SetContentType("application/json")
	
End Sub

Public Sub ClearCart(Module As Object,Event As String)
	
	sModule = Module
	EVT = Event
	currentCategory = "cart/empty"
	
	hu.Initialize("clearcart",Me)
	hu.PostString(api_url & currentCategory,"")
	hu.GetRequest.InitializeDelete(api_url & currentCategory)
	
	Dim auth As String
	auth = $"${Library.token.Get("token_type")} ${GetCurrentToken}"$
	hu.GetRequest.SetHeader("Authorization",auth)
	
End Sub

#End Region

#Region Whishlist

Public Sub Wishlist(Module As Object,Event As String,sID As String)
	
	sModule = Module
	EVT = Event
	
	hu.Initialize("wishlist",Me)
	
	If sID = "" Then
		currentCategory = "wishlist"
		hu.Download(api_url & currentCategory)
	Else If sID.StartsWith("-") Then
		currentCategory = "wishlist/" & sID.Replace("-","")
		hu.PostString(api_url & currentCategory,"")
		hu.GetRequest.InitializeDelete(api_url & currentCategory)
	Else
		currentCategory = "wishlist/" & sID
		hu.PostString(api_url & currentCategory,"")
	End If

	Dim auth As String
	auth = $"${Library.token.Get("token_type")} ${GetCurrentToken}"$
	hu.GetRequest.SetHeader("Authorization",auth)
	setDefaultX_OC(hu.GetRequest)
	
End Sub

#End Region

#Region Account Section

Public Sub SubScribe(Module As Object,Event As String,SubScribes As Boolean)
	
	sModule = Module
	EVT = Event
	
	If SubScribes Then
		currentCategory = "/index.php?route=rest/account/newsletter&subscribe=1"
	Else
		currentCategory = "/index.php?route=rest/account/newsletter&subscribe=0"
	End If
	
	hu.Initialize("subscribe",Me)
	hu.PostString(my_url & currentCategory,"")
	hu.GetRequest.InitializePut2(my_url & currentCategory,"".GetBytes("UTF8"))
	
	Dim auth As String
	auth = $"${Library.token.Get("token_type")} ${GetCurrentToken}"$
	hu.GetRequest.SetHeader("Authorization",auth)
	
End Sub

Public Sub UserDetails(Module As Object,Event As String)
	
	sModule = Module
	EVT = Event
	currentCategory = "account"
	
	hu.Initialize("account_user",Me)
	hu.Download(api_url & currentCategory)
	
	Dim auth As String
	auth = $"${Library.token.Get("token_type")} ${GetCurrentToken}"$
	hu.GetRequest.SetHeader("Authorization",auth)
	setDefaultX_OC(hu.GetRequest)
	
End Sub

Public Sub UpdateUserDetails(Module As Object,Event As String,sData As Map)
	
	sModule = Module
	EVT = Event
	currentCategory = "account"
	
	Dim js As JSONGenerator
	js.Initialize(sData)
	
	hu.Initialize("account_user",Me)
	hu.PostString(api_url & currentCategory,js.ToString)
	
	Dim auth As String
	auth = $"${Library.token.Get("token_type")} ${GetCurrentToken}"$
	hu.GetRequest.SetHeader("Authorization",auth)
	setDefaultX_OC(hu.GetRequest)
	
End Sub

Public Sub UpdatePasswordUser(Module As Object,Event As String,sPassword As String)
	
	sModule = Module
	EVT = Event
	currentCategory = "account/password"
	
	Dim js As JSONGenerator
	js.Initialize(CreateMap("password":sPassword,"confirm":sPassword))
	
	hu.Initialize("account_user",Me)
	hu.PostString(api_url & currentCategory,js.ToString)
	hu.GetRequest.InitializePut2(api_url & currentCategory,js.ToString.GetBytes("UTF8"))

	Dim auth As String
	auth = $"${Library.token.Get("token_type")} ${GetCurrentToken}"$
	
	hu.GetRequest.SetHeader("Authorization",auth)
	hu.GetRequest.SetHeader("body",js.ToString)
	hu.GetRequest.SetContentType("application/json")
	
End Sub

Public Sub ListAddressUser(Module As Object,Event As String)
	
	sModule = Module
	EVT = Event
	currentCategory = "account/address"
	
	hu.Initialize("account_user",Me)
	hu.Download(api_url & currentCategory)
	
	Dim auth As String
	auth = $"${Library.token.Get("token_type")} ${GetCurrentToken}"$
	hu.GetRequest.SetHeader("Authorization",auth)
	setDefaultX_OC(hu.GetRequest)
	
End Sub

Public Sub DeleteAddressUser(Module As Object,Event As String,sID As String)
	
	sModule = Module
	EVT = Event
	currentCategory = "account/address/" & sID
	
	Dim sProduct As Map
	sProduct.Initialize
	sProduct.Put("id",sID)
	
	Dim js As JSONGenerator
	js.Initialize(sProduct)
	
	hu.Initialize("account_user",Me)
	hu.PostString(api_url & currentCategory,js.ToString)
	hu.GetRequest.InitializeDelete(api_url & currentCategory)
	
	Dim auth As String
	auth = $"${Library.token.Get("token_type")} ${GetCurrentToken}"$
	
	hu.GetRequest.SetHeader("Authorization",auth)
	hu.GetRequest.SetHeader("body",js.ToString)
	
End Sub

Public Sub AddAddressUser(Module As Object,Event As String,sData As Map)
	
	sModule = Module
	EVT = Event
	currentCategory = "account/address"
	
	Dim js As JSONGenerator
	js.Initialize(sData)
	
	hu.Initialize("account_user",Me)
	hu.PostString(api_url & currentCategory,js.ToString)
	
	Dim auth As String
	auth = $"${Library.token.Get("token_type")} ${GetCurrentToken}"$
	hu.GetRequest.SetHeader("Authorization",auth)
	setDefaultX_OC(hu.GetRequest)
	
End Sub

Public Sub EditAddressUser(Module As Object,Event As String,sData As Map,sID As String)
	
	sModule = Module
	EVT = Event
	currentCategory = "account/address/" & sID
	
	Dim js As JSONGenerator
	js.Initialize(sData)
	
	hu.Initialize("account_user",Me)
	hu.PostString(api_url & currentCategory,js.ToString)
	hu.GetRequest.InitializePut2(api_url & currentCategory,js.ToString.GetBytes("UTF8"))
	
	Dim auth As String
	auth = $"${Library.token.Get("token_type")} ${GetCurrentToken}"$
	hu.GetRequest.SetHeader("Authorization",auth)
	hu.GetRequest.SetHeader("body",js.ToString)
	hu.GetRequest.SetContentType("application/json")
	setDefaultX_OC(hu.GetRequest)
	
End Sub

#Region Order User

Public Sub UserOrders(Module As Object,Event As String,sID As String,isRecorder As Boolean)
	
	sModule = Module
	EVT = Event
	
	If sID = "0" And isRecorder = False Then
		currentCategory = "customerorders"
	Else
		currentCategory = "customerorders/" & sID
	End If
	
	hu.Initialize("account_user",Me)
	
	If isRecorder = False Then
		hu.Download(api_url & currentCategory)
	Else
		hu.PostString(api_url & currentCategory,"")
	End If
	
	Dim auth As String
	auth = $"${Library.token.Get("token_type")} ${GetCurrentToken}"$
	hu.GetRequest.SetHeader("Authorization",auth)
	setDefaultX_OC(hu.GetRequest)
	
End Sub

#End Region

#End Region

Public Sub CheckSumOnline(Module As Object,Event As String)
	
	sModule = Module
	EVT = Event
	currentCategory = "checksums"
	
	hu.Initialize("checksums",Me)
	hu.Download(api_url & currentCategory)
	
	Dim auth As String
	auth = $"${Library.token.Get("token_type")} ${GetCurrentToken}"$
	hu.GetRequest.SetHeader("Authorization",auth)
	
End Sub

Public Sub GetProductClass(Module As Object,Event As String)
	
	sModule = Module
	EVT = Event
	currentCategory = "product_classes"
	
	hu.Initialize("product_class",Me)
	hu.Download(api_url & currentCategory)
	
	Dim auth As String
	auth = $"${Library.token.Get("token_type")} ${GetCurrentToken}"$
	hu.GetRequest.SetHeader("Authorization",auth)
	setDefaultX_OC(hu.GetRequest)
	
End Sub

Public Sub GetLanguages(Module As Object,Event As String)
	
	sModule = Module
	EVT = Event
	currentCategory = "languages"
	
	hu.Initialize("languages",Me)
	hu.Download(api_url & currentCategory)
	
	Dim auth As String
	auth = $"${Library.token.Get("token_type")} ${GetCurrentToken}"$

	hu.GetRequest.SetHeader("Authorization",auth)
	
End Sub