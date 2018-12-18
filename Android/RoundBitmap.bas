Type=Class
Version=6.3
ModulesStructureVersion=1
B4A=true
@EndOfDesignText@
private Sub Class_Globals
	Private nativeMe As JavaObject
	Private borderWidth As Int = 50
	Private borderColor As Int = Colors.ARGB(255,200,0,0)
End Sub

'Initializes the object. You can add parameters to this method if needed.
Public Sub Initialize

End Sub

Sub RoundBitmap(Bitmap1 As Bitmap,Radius As Int) As Bitmap
	
	nativeMe.InitializeContext
    Return nativeMe.RunMethod("getRoundBitmap",Array(Bitmap1,borderColor, borderWidth,Radius))
	
End Sub

#If Java

import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.Path;
import android.graphics.Rect;
import android.graphics.RectF;
import android.graphics.drawable.BitmapDrawable;
import android.graphics.drawable.Drawable;
import android.graphics.Path.FillType;
import android.graphics.Paint;
import android.graphics.Color;
import android.view.View;

import android.annotation.SuppressLint;
import android.content.Context;
import android.graphics.BitmapShader;
import android.graphics.Shader;
import android.graphics.PorterDuffXfermode;
import android.graphics.PorterDuff.Mode;


public static Bitmap getRoundBitmap(Bitmap scaleBitmapImage, int borderColor, int borderWidth,int radius) {
	int targetWidth = 1000;
	int targetHeight = 1000;
	
	Bitmap targetBitmap = Bitmap.createBitmap(targetWidth, targetHeight,
			Bitmap.Config.ARGB_8888);

	Canvas canvas = new Canvas(targetBitmap);
	Path path = new Path();
	path.addCircle(((float) targetWidth - 1) / 2,
			((float) targetHeight - 1) / 2,
			(Math.min(((float) targetWidth), ((float) targetHeight)) / 2),
			Path.Direction.CCW);

	canvas.clipPath(path);
	
	Bitmap sourceBitmap = scaleBitmapImage;
	
	canvas.drawBitmap(sourceBitmap, new Rect(0, 0, sourceBitmap.getWidth(),
			sourceBitmap.getHeight()), new Rect(0, 0, targetWidth,
			targetHeight), null);
			
			
	Paint p = new Paint();                                              
	p.setAntiAlias(true);           		
	//	canvas.drawBitmap(sourceBitmap, 4, 4, p);                                      
	p.setXfermode(null);                                                
	p.setStyle(Paint.Style.STROKE);                                           
	p.setColor(borderColor);                                            
	p.setStrokeWidth(borderWidth);                                                
	canvas.drawCircle((targetWidth / 2) , (targetHeight / 2) , radius, p);      						

	return targetBitmap;
}

#End If