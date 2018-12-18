Type=Class
Version=4.3
ModulesStructureVersion=1
B4i=true
@EndOfDesignText@
'Class module
Sub Class_Globals
	Private sc As ScrollView
	Private iv As ImageView
	Private nome As NativeObject=Me
	Private mnScale As Float
	Private mxScale As Float=1
	Private zScale As Float
	Private noSC As NativeObject
	Private mUnzoomDT=True
End Sub

'Initializes the object. You can add parameters to this method if needed.
Public Sub Initialize(Image As Bitmap)
	sc.Initialize("sc",100,100)
	iv.Initialize("iv")
	noSC=sc
		

	If Image.IsInitialized=False Then
	iv.Bitmap=Null
	Else
	iv.Bitmap=Image
	sc.ScrollEnabled=True	
	End If
	
End Sub

Public Sub AddToView(Panel As Panel,Left As Int, Top As Int, Width As Float, Height As Float)
Panel.AddView(sc,Left,Top,Width,Height)
If iv.Bitmap.IsInitialized=False Then
sc.ContentHeight=Height
sc.ContentWidth=Width
sc.Panel.AddView(iv,0,0,sc.ContentWidth,sc.ContentHeight)
Else
sc.ContentHeight=iv.Bitmap.Height
sc.ContentWidth=iv.Bitmap.Width
sc.Panel.AddView(iv,0,0,sc.ContentWidth,sc.ContentHeight)
Dim f As Float=Max(sc.Width/iv.Bitmap.Width,sc.Height/iv.Bitmap.Height)
If f>1 Then f=1
EnableZoom(sc,f,1)
End If
End Sub

Sub ZoomedImage As Bitmap

Dim b As Bitmap
Dim Scale As Float=1/noSC.GetField("zoomScale").AsNumber
Dim l,t,w,h As Float
l=sc.ScrollOffsetX*Scale
t=sc.ScrollOffsety*Scale
w=sc.width*Scale
h=sc.width*Scale
Dim r As Object=nome.MakeRect(l,t,w,h)
b=ImageInRect(iv.Bitmap,r)
Return b

End Sub


Public Sub UnZOOM(annimated As Boolean)

noSC.RunMethod("setZoomScale:animated:",Array(mnScale,annimated))

If sc.ContentWidth>sc.Width Then
sc.ScrollOffsetX=(sc.ContentWidth-sc.Width)/2
Else If sc.ContentHeight> sc.Height Then
sc.ScrollOffsetY=(sc.ContentHeight-sc.Height)/2
End If

End Sub

Private Sub EnableZoom(scview As ScrollView,minScale As Float,MaxScale As Float)
	nome.RunMethod("EnableScroll::::",Array(sc,minScale,MaxScale,iv))
	noSC.RunMethod("setZoomScale:animated:",Array(minScale,False))
	mnScale=minScale
	zScale=1/noSC.GetField("zoomScale").AsNumber
End Sub


Private Sub zoom_End(Scale As Float)
zScale=1/noSC.GetField("zoomScale").AsNumber
End Sub

Private Sub scview_zoom

End Sub

Private Sub scview_doubletap
If mUnzoomDT=True Then
UnZOOM(True)
End If
End Sub

Public Sub getScale As Float
Return 1/zScale
End Sub
Public Sub setScale (Scale As Float)
zScale=Scale
noSC.RunMethod("setZoomScale:animated:",Array(Scale,False))
End Sub

Public Sub getMaxScale As Float
Dim f As Float=noSC.GetField("maximumZoomScale").AsNumber
Return f
End Sub
Public Sub setMaxScale (Scale As Float)
noSC.SetField("maximumZoomScale",Scale)
End Sub

Public Sub getMinScale As Float
Dim f As Float=noSC.GetField("minimumZoomScale").AsNumber
Return f
End Sub
Public Sub setMinScale (Scale As Float)
noSC.SetField("minimumZoomScale",Scale)
mnScale=Scale
End Sub

Public Sub setUnZOOMonDoubleTap (Value As Boolean)
mUnzoomDT =Value
End Sub

Public Sub getAsView As ScrollView
Return sc
End Sub

Public Sub setBitmap (Image As Bitmap)

iv.Bitmap=Image
sc.ContentHeight=Image.Height
sc.ContentWidth=Image.Width
iv.Height=Image.Height
iv.Width=Image.Width

Dim f As Float=Max(sc.Width/iv.Bitmap.Width,sc.Height/iv.Bitmap.Height)
If f>1 Then f=1

If mnScale=0 Then
EnableZoom(sc,f,1)
Else
EnableZoom(sc,mnScale,mxScale)
End If
UnZOOM(False)
End Sub
Public Sub getBitmap As Bitmap
Return iv.Bitmap
End Sub

Private Sub ImageInRect(img As Bitmap,r As Object) As Bitmap
Dim b As Bitmap
b=nome.RunMethod("ImageInRect::",Array(img,r))
Return b
End Sub

#If OBJC

#import <QuartzCore/QuartzCore.h>

-(UIImage*)ImageInRect: (UIImage*)image :(CGRect)rect
{


UIImage * LandscapeImage = image;
UIImage * PortraitImage = [[UIImage alloc] initWithCGImage: LandscapeImage.CGImage
                                                     scale: 1.0
                                               orientation: UIImageOrientationLeft];
CGImageRef imageRef = CGImageCreateWithImageInRect([PortraitImage CGImage], rect);

UIImage *img = [UIImage imageWithCGImage:imageRef]; 


CGImageRelease(imageRef);

return img;
}


- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    return (self._iv).object;
}


- (void)EnableScroll: (UIScrollView*)scr :(float)minS :(float)maxS :(UIImageView*)img
{

UITapGestureRecognizer *doubleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleDoubleTap:)];

[doubleTap setNumberOfTapsRequired:2];

[scr addGestureRecognizer:doubleTap];




    scr.clipsToBounds = YES;
	
	scr.decelerationRate = UIScrollViewDecelerationRateFast;
    scr.minimumZoomScale=minS;
    scr.maximumZoomScale=maxS;
    scr.delegate=self;
}

- (void)scrollViewDidEndZooming:(UIScrollView *)scrollView withView:(UIView *)view atScale:(float)scale
{

[self.bi raiseEvent:nil event:@"zoom_end:" params:@[@((float)scale)]];
}

-(void)scrollViewDidScroll:(UIScrollView*)scrollView{
double cc=scrollView.contentOffset.x;
double cy=scrollView.contentOffset.y;

//[self.bi raiseEvent:nil event:@"scview_scrollchanged::" params:@[@((int)cc),@((int)cy)]];


}



- (void)scrollViewDidZoom:(UIScrollView *)sv
{


   [self.bi raiseUIEvent:nil event:@"scview_zoom" params:@[]];
}

- (void)handleDoubleTap:(UIGestureRecognizer *)gestureRecognizer {  

    [self.bi raiseEvent:nil event:@"scview_doubletap" params:@[]];

  }  





#End If