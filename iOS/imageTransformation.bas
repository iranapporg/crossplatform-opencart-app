Type=Class
Version=2.8
ModulesStructureVersion=1
B4i=true
@EndOfDesignText@
'Class module
Sub Class_Globals
	Private nome As NativeObject=Me
	Public zTHRESH_BINARY As Int  = 0 
	Public zTHRESH_BINARY_INV As Int  = 1
	Public zTHRESH_TRUNC As Int  = 2
	Public zTHRESH_TOZERO As Int = 3
	Public zTHRESH_TOZERO_INV As Int = 4
End Sub

'Initializes the object. Nothing is done here, add some code if needed.
Public Sub Initialize
	
End Sub


'**************************************************************
'** Crop a rectangle from a given image 
'**************************************************************
Public Sub CropImageRect(img As Bitmap,left As Float, top As Float, width As Float, height As Float) As Bitmap
	Dim b As Bitmap
	Dim r As Object=nome.MakeRect(left,top,width,height)
	b=nome.RunMethod("ImageInRect::",Array(img,r))
	Return b
End Sub

'**************************************************************
'** Blur image by a given factor
'**************************************************************
Public Sub blurImage(img As Bitmap, BlurFactor As Int) As Bitmap
	Dim b As Bitmap
	b=nome.RunMethod("boxblurImage::",Array(img,BlurFactor))
	Return b
End Sub

'**************************************************************
'** Turns a image to GreySacle - Method 1
'**************************************************************
Public Sub GreyScaleImage(img As Bitmap) As Bitmap
	Dim b As Bitmap
	b=nome.RunMethod("convertToGreyscale::",Array(img,0))
	Return b
End Sub

'**************************************************************
'** Turns a image to GreySacle - Method 2
'**************************************************************
Public Sub GreyScaleImage2(img As Bitmap) As Bitmap
	Dim b As Bitmap
	b=nome.RunMethod("greyScale2::",Array(img,0))
	Return b
End Sub

'**************************************************************
'** Turns a image to Black and White
'**************************************************************
Public Sub BlackWhiteImage(img As Bitmap) As Bitmap
	Dim b As Bitmap
	b=nome.RunMethod("pureBlackAndWhiteImage::",Array(img,0))
	Return b
End Sub

'**************************************************************
'** Turns a image to Black and White, inverting colors
'**************************************************************
Public Sub InvBlackWhiteImage(img As Bitmap) As Bitmap
	Dim b As Bitmap
	b=nome.RunMethod("pureBlackAndWhiteInvertedImage::",Array(img,0))
	Return b
End Sub

'***********************************************************************************
'** Erode image using a given kernel size - uses VImageMax/VImageMin to perform operation
'***********************************************************************************
Public Sub ErodeImage(img As Bitmap, kernelSize As Int) As Bitmap
	Dim b As Bitmap
	b=nome.RunMethod("erodeImage::",Array(img,kernelSize))
	Return b
End Sub

'***********************************************************************************
'** Erode image using default 3x3 Kernel Matrix by a number of interations
'***********************************************************************************
Public Sub ErodeImageWithDefaultKernel(img As Bitmap, interactions As Int) As Bitmap
	Dim b As Bitmap
	b = img
	For i=0 To interactions-1
		b=nome.RunMethod("erodeImageWithKernel:",Array(b))
	Next
	Return b
End Sub

'***********************************************************************************
'** Dilate image using a given kernel size - uses VImageMax/VImageMin to perform operation
'***********************************************************************************
Public Sub DilateImage(img As Bitmap, kernelSize As Int) As Bitmap
	Dim b As Bitmap
	b=nome.RunMethod("dilateImage::",Array(img,kernelSize))
	Return b
End Sub

'***********************************************************************************
'** Dilate image using default 3x3 Kernel Matrix by a number of interations
'***********************************************************************************
Public Sub DilateImageWithDefaultKernel(img As Bitmap, interactions As Int) As Bitmap
	Dim b As Bitmap
	b = img
	For i=0 To interactions-1
		b=nome.RunMethod("dilateImageWithKernel:",Array(b))
	Next
	Return b
End Sub


'**************************************************************
'** Emboss image using default 3x3 Kernel Matrix
'**************************************************************
Public Sub EmbossImage(img As Bitmap) As Bitmap
	Dim b As Bitmap
	b=nome.RunMethod("embossImage:",Array(img))
	Return b
End Sub

'**************************************************************
'** Edge image using default 3x3 Kernel Matrix
'**************************************************************
Public Sub EdgeImage(img As Bitmap, direction As Int) As Bitmap
	Dim b As Bitmap
	b=nome.RunMethod("edgeImage::",Array(img, direction))
	Return b
End Sub
 {

'**************************************************************************************************************************
'*** threshold(img As Bitmap, thr As Int, maxval As Int, vType As Int, ostsu As Int) As Bitmap
'*** parameters: 
'***     1 - img - input Array (single-channel, 8-Bit Or 32-Bit floating point). This Is the source image, 
'***         which should be a grayscale image.
'***     2 - thr - threshold value, And it Is used To classify the pixel values.
'***     3 - maxval - maximum value To use with the THRESH_BINARY And THRESH_BINARY_INV thresholding types. 
'***     4 - vType - thresholding Type.
'***     			imt.zTHRESH_BINARY = 0 
'***     			imt.zTHRESH_BINARY_INVY = 1
'***     			imt.zTHRESH_TRUNCY = 2
'***     			imt.zTHRESH_TOZEROY = 3
'***     			imt.zTHRESH_TOZERO_INVY = 4
'***     5 - ostsu - If value Is 1, calculate ostsu threshold And use it. thr origanal value Is ignored at this situation
'***************************************************************************************************************************
Public Sub threshold(img As Bitmap, thr As Int, maxval As Int, vType As Int, ostsu As Int) As Bitmap
	Dim b As Bitmap
	b=nome.RunMethod("thresholdImage:::::",Array(img ,thr, maxval, vType, ostsu))
	Return b
End Sub



#If OBJC

#import <QuartzCore/QuartzCore.h>
#import <Accelerate/Accelerate.h>

//*********************************************************************************************************************************
// Gets an Threshold Image 
//parameters: 
//src - input array (single-channel, 8-bit or 32-bit floating point). This is the source image, which should be a grayscale image.
//thresh - threshold value, and it is used to classify the pixel values.
//vmaxval - maximum value to use with the THRESH_BINARY and THRESH_BINARY_INV thresholding types. 
//         It represents the value to be given if pixel value is more than (sometimes less than) the threshold value.
//vtype - thresholding type.(see threshold for details).
//			imt.zTHRESH_BINARY = 0 
//			imt.zTHRESH_BINARY_INVY = 1
//			imt.zTHRESH_TRUNCY = 2
//			imt.zTHRESH_TOZEROY = 3
//			imt.zTHRESH_TOZERO_INVY = 4
//	Membername	Value	Description
//	Binary		0		value = value > threshold ? max_value : 0
//	BinaryInv	1		value = value > threshold ? 0 : max_value
//	Trunc		2		value = value > threshold ? threshold : value
//	ToZero		3		value = value > threshold ? value : 0
//	ToZeroInv	4		value = value > threshold ? 0 : value

//votsu - If value is 1, calculate ostsu threshold and use it. thresh origanal value is ignored at this situation
//*********************************************************************************************************************
-(UIImage*)thresholdImage: (UIImage*)image :(int)thresh :(int)vmaxval :(int)vtype :(int)votsu  {

	int threshold = thresh;
	
	if (votsu ==1) {
		//calculate otsu value
	    int histData[256]; 
		
		int m_width = image.size.width;
	    int m_height = image.size.height;

	    uint32_t *rgbImage = (uint32_t *) malloc(m_width * m_height * sizeof(uint32_t));
	    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
	    CGContextRef context = CGBitmapContextCreate(rgbImage, m_width, m_height, 8, m_width * 4, colorSpace, kCGBitmapByteOrder32Little | kCGImageAlphaNoneSkipLast);
	    CGContextSetInterpolationQuality(context, kCGInterpolationHigh);
	    CGContextSetShouldAntialias(context, NO);
	    CGContextDrawImage(context, CGRectMake(0, 0, m_width, m_height), [image CGImage]);
	    CGContextRelease(context);
	    CGColorSpaceRelease(colorSpace);

		// Clear histogram data
		// Set all values to zero
		int ptr = 0;
		while (ptr < 256) histData[ptr++] = 0;


	    // interate pixels
	    for(int y = 0; y < m_height; y++) {
	        for(int x = 0; x < m_width; x++) {
	            uint32_t rgbPixel=rgbImage[y*m_width+x];
				rgbPixel = rgbPixel >> 8;
				int h = 0xFF & rgbPixel;
				histData[h]++;
	        }
	    }
		
		
		int total = m_height *  m_width;
		float sum = 0;
		for (int t=0 ; t<256 ; t++) sum += t * histData[t];
		
	
		float sumB = 0;
		int wB = 0;
		int wF = 0;

		float varMax = 0;
		threshold = 0;

		for (int t=0 ; t<256 ; t++) {
		   wB += histData[t];               // Weight Background
		   if (wB == 0) continue;

		   wF = total - wB;                 // Weight Foreground
		   if (wF == 0) break;

		   sumB += (float) (t * histData[t]);

		   float mB = sumB / wB;            // Mean Background
		   float mF = (sum - sumB) / wF;    // Mean Foreground

		   // Calculate Between Class Variance
		   float varBetween = (float)wB * (float)wF * (mB - mF) * (mB - mF);

		   // Check if new maximum found
		   if (varBetween > varMax) {
		      varMax = varBetween;
		      threshold = t;
		   }
		}
	    free(rgbImage);
	}	
	

	//Transform image in a context (each pixel is a represented in four bytes (alfha, red, green and blue values) 
    unsigned char *dataBitmap = [self bitmapFromImage:image];
	
	if (vtype ==0) {
		//Binary
	    for (int i = 0; i < image.size.width * image.size.height * 4; i += 4) {
		
			int RGB = (dataBitmap[i + 1]*65536)+(dataBitmap[i + 2]*256)+dataBitmap[i + 3]; //(when R is RED, G is GREEN and B is BLUE)
		
			int pointValue = ((0xFF & RGB));
			
	        if (pointValue < threshold) {
	            dataBitmap[i + 1] = 0;
	            dataBitmap[i + 2] = 0;
	            dataBitmap[i + 3] = 0;
	        } else {
	            dataBitmap[i + 1] = vmaxval;
	            dataBitmap[i + 2] = vmaxval;
	            dataBitmap[i + 3] = vmaxval;
	        }
	    }
	}
	
	if (vtype ==1) {
		//BinaryInv
	    for (int i = 0; i < image.size.width * image.size.height * 4; i += 4) {
		
			int RGB = (dataBitmap[i + 1]*65536)+(dataBitmap[i + 2]*256)+dataBitmap[i + 3]; //(when R is RED, G is GREEN and B is BLUE)
		
			int pointValue = ((0xFF & RGB));
			
	        if (pointValue < threshold) {
	            dataBitmap[i + 1] = vmaxval;
	            dataBitmap[i + 2] = vmaxval;
	            dataBitmap[i + 3] = vmaxval;
	        } else {
	            dataBitmap[i + 1] = 0;
	            dataBitmap[i + 2] = 0;
	            dataBitmap[i + 3] = 0;
	        }
	    }
	}
	
	if (vtype ==2) {
		//Trunc		2		value = value > threshold ? threshold : value
	    for (int i = 0; i < image.size.width * image.size.height * 4; i += 4) {
		
			int RGB = (dataBitmap[i + 1]*65536)+(dataBitmap[i + 2]*256)+dataBitmap[i + 3]; //(when R is RED, G is GREEN and B is BLUE)
		
			int pointValue = ((0xFF & RGB));
			
	        if (pointValue < threshold) {
	            dataBitmap[i + 1] = pointValue;
	            dataBitmap[i + 2] = pointValue;
	            dataBitmap[i + 3] = pointValue;
	        } else {
	            dataBitmap[i + 1] = threshold;
	            dataBitmap[i + 2] = threshold;
	            dataBitmap[i + 3] = threshold;
	        }
	    }
	}
	
	if (vtype ==3) {
		//	ToZero		3		value = value > threshold ? value : 0
	    for (int i = 0; i < image.size.width * image.size.height * 4; i += 4) {
		
			int RGB = (dataBitmap[i + 1]*65536)+(dataBitmap[i + 2]*256)+dataBitmap[i + 3]; //(when R is RED, G is GREEN and B is BLUE)
		
			int pointValue = ((0xFF & RGB));
			
	        if (pointValue < threshold) {
	            dataBitmap[i + 1] = 0;
	            dataBitmap[i + 2] = 0;
	            dataBitmap[i + 3] = 0;
	        } else {
	            dataBitmap[i + 1] = pointValue;
	            dataBitmap[i + 2] = pointValue;
	            dataBitmap[i + 3] = pointValue;
	        }
	    }
	}
	
	
	if (vtype ==4) {
		//	ToZeroInv	4		value = value > threshold ? 0 : value
	    for (int i = 0; i < image.size.width * image.size.height * 4; i += 4) {
		
			int RGB = (dataBitmap[i + 1]*65536)+(dataBitmap[i + 2]*256)+dataBitmap[i + 3]; //(when R is RED, G is GREEN and B is BLUE)
		
			int pointValue = ((0xFF & RGB));
			
	        if (pointValue < threshold) {
	            dataBitmap[i + 1] = pointValue;
	            dataBitmap[i + 2] = pointValue;
	            dataBitmap[i + 3] = pointValue;
	        } else {
	            dataBitmap[i + 1] = 0;
	            dataBitmap[i + 2] = 0;
	            dataBitmap[i + 3] = 0;
	        }
	    }
	}

    image = [self imageWithBits:dataBitmap withSize:image.size];
   return image;
}


//************************************************************************************************************************
// Performs emboss transformation using a 3x3 Kernel Matrix
//************************************************************************************************************************
-(UIImage*)embossImage: (UIImage*)image {
    //Get CGImage from UIImage
    CGImageRef img = image.CGImage;
    //setup variables
    vImage_Buffer inBuffer, outBuffer;
    vImage_Error error;
    void *pixelBuffer;
    //create vImage_Buffer with data from CGImageRef
    //These two lines get get the data from the CGImage
    CGDataProviderRef inProvider = CGImageGetDataProvider(img);  
    CFDataRef inBitmapData = CGDataProviderCopyData(inProvider);  
    //The next three lines set up the inBuffer object based on the attributes of the CGImage
    inBuffer.width = CGImageGetWidth(img);
    inBuffer.height = CGImageGetHeight(img);
    inBuffer.rowBytes = CGImageGetBytesPerRow(img);
     
    //This sets the pointer to the data for the inBuffer object
    inBuffer.data = (void*)CFDataGetBytePtr(inBitmapData);
    //create vImage_Buffer for output
    //allocate a buffer for the output image and check if it exists in the next three lines
    pixelBuffer = malloc(CGImageGetBytesPerRow(img) * CGImageGetHeight(img));
    if(pixelBuffer == NULL)
        NSLog(@"No pixelbuffer");
    //set up the output buffer object based on the same dimensions as the input image
    outBuffer.data = pixelBuffer;
    outBuffer.width = CGImageGetWidth(img);
    outBuffer.height = CGImageGetHeight(img);
    outBuffer.rowBytes = CGImageGetBytesPerRow(img);
    //perform convolution - this is the call for our type of data
	//uint_8 kernel = {-2, -2, 0, -2, 6, 0, 0, 0, 0}; // 1
	unsigned char kernel[9] = {-2, -2, 0, -2, 6, 0, 0, 0, 0}; // 1
    unsigned char bgColor[4] = { 0, 0, 0, 0 }; // 4
    error = vImageConvolve_ARGB8888(&inBuffer, &outBuffer, NULL, 0, 0, kernel, 3, 3, 0, bgColor, kvImageBackgroundColorFill);
	
    //check for an error in the call to perform the convolution
    if (error) {
        NSLog(@"error from convolution %ld", error);
    }
    //create CGImageRef from vImage_Buffer output
    //1 - CGBitmapContextCreateImage -
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGContextRef ctx = CGBitmapContextCreate(outBuffer.data,
                                             outBuffer.width,
                                             outBuffer.height,
                                             8,
                                             outBuffer.rowBytes,
                                             colorSpace,
                                             kCGImageAlphaNoneSkipLast);
    CGImageRef imageRef = CGBitmapContextCreateImage (ctx);
    UIImage *returnImage = [UIImage imageWithCGImage:imageRef];
    //clean up
    CGContextRelease(ctx);
    CGColorSpaceRelease(colorSpace);
    free(pixelBuffer);
    CFRelease(inBitmapData);
    CGColorSpaceRelease(colorSpace);
    CGImageRelease(imageRef);
    return returnImage;
}


//************************************************************************************************************************
// Performs edge transformation using a 3x3 Kernel Matrix
//************************************************************************************************************************
-(UIImage*)edgeImage: (UIImage*)image :(int) direction {
    //Get CGImage from UIImage
    CGImageRef img = image.CGImage;
    //setup variables
    vImage_Buffer inBuffer, outBuffer;
    vImage_Error error;
    void *pixelBuffer;
    //create vImage_Buffer with data from CGImageRef
    //These two lines get get the data from the CGImage
    CGDataProviderRef inProvider = CGImageGetDataProvider(img);  
    CFDataRef inBitmapData = CGDataProviderCopyData(inProvider);  
    //The next three lines set up the inBuffer object based on the attributes of the CGImage
    inBuffer.width = CGImageGetWidth(img);
    inBuffer.height = CGImageGetHeight(img);
    inBuffer.rowBytes = CGImageGetBytesPerRow(img);
     
    //This sets the pointer to the data for the inBuffer object
    inBuffer.data = (void*)CFDataGetBytePtr(inBitmapData);
    //create vImage_Buffer for output
    //allocate a buffer for the output image and check if it exists in the next three lines
    pixelBuffer = malloc(CGImageGetBytesPerRow(img) * CGImageGetHeight(img));
    if(pixelBuffer == NULL)
        NSLog(@"No pixelbuffer");
    //set up the output buffer object based on the same dimensions as the input image
    outBuffer.data = pixelBuffer;
    outBuffer.width = CGImageGetWidth(img);
    outBuffer.height = CGImageGetHeight(img);
    outBuffer.rowBytes = CGImageGetBytesPerRow(img);
    //perform convolution - this is the call for our type of data
	unsigned char kernel[9] = {0,1,0,1,-4,1,0,1,0};  //NO DIRECTION
	unsigned char kernelv[9] = {0,0,0,-1,2,-1,0,0,0}; //VERTICAL
	unsigned char kernelh[9] = {0,-1,0,0,2,0,0,-1,0}; //HORIZONTAL
    unsigned char bgColor[4] = { 0, 0, 0, 0 }; // 4

	if (direction == 0) {     error = vImageConvolve_ARGB8888(&inBuffer, &outBuffer, NULL, 0, 0, kernel, 3, 3, 0, bgColor, kvImageBackgroundColorFill);}
	if (direction == 1) {     error = vImageConvolve_ARGB8888(&inBuffer, &outBuffer, NULL, 0, 0, kernelv, 3, 3, 0, bgColor, kvImageBackgroundColorFill);}
	if (direction == 2) {     error = vImageConvolve_ARGB8888(&inBuffer, &outBuffer, NULL, 0, 0, kernelh, 3, 3, 0, bgColor, kvImageBackgroundColorFill);}

	
    //check for an error in the call to perform the convolution
    if (error) {
        NSLog(@"error from convolution %ld", error);
    }
    //create CGImageRef from vImage_Buffer output
    //1 - CGBitmapContextCreateImage -
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGContextRef ctx = CGBitmapContextCreate(outBuffer.data,
                                             outBuffer.width,
                                             outBuffer.height,
                                             8,
                                             outBuffer.rowBytes,
                                             colorSpace,
                                             kCGImageAlphaNoneSkipLast);
    CGImageRef imageRef = CGBitmapContextCreateImage (ctx);
    UIImage *returnImage = [UIImage imageWithCGImage:imageRef];
    //clean up
    CGContextRelease(ctx);
    CGColorSpaceRelease(colorSpace);
    free(pixelBuffer);
    CFRelease(inBitmapData);
    CGColorSpaceRelease(colorSpace);
    CGImageRelease(imageRef);
    return returnImage;
}


//************************************************************************************************************************
// Performs erode transformation using a 3x3 Kernel Matrix
//************************************************************************************************************************
-(UIImage*)erodeImageWithKernel: (UIImage*)image {
    //Get CGImage from UIImage
    CGImageRef img = image.CGImage;
    //setup variables
    vImage_Buffer inBuffer, outBuffer;
    vImage_Error error;
    void *pixelBuffer;
    //create vImage_Buffer with data from CGImageRef
    //These two lines get get the data from the CGImage
    CGDataProviderRef inProvider = CGImageGetDataProvider(img);  
    CFDataRef inBitmapData = CGDataProviderCopyData(inProvider);  
    //The next three lines set up the inBuffer object based on the attributes of the CGImage
    inBuffer.width = CGImageGetWidth(img);
    inBuffer.height = CGImageGetHeight(img);
    inBuffer.rowBytes = CGImageGetBytesPerRow(img);
     
    //This sets the pointer to the data for the inBuffer object
    inBuffer.data = (void*)CFDataGetBytePtr(inBitmapData);
    //create vImage_Buffer for output
    //allocate a buffer for the output image and check if it exists in the next three lines
    pixelBuffer = malloc(CGImageGetBytesPerRow(img) * CGImageGetHeight(img));
    if(pixelBuffer == NULL)
        NSLog(@"No pixelbuffer");
    //set up the output buffer object based on the same dimensions as the input image
    outBuffer.data = pixelBuffer;
    outBuffer.width = CGImageGetWidth(img);
    outBuffer.height = CGImageGetHeight(img);
    outBuffer.rowBytes = CGImageGetBytesPerRow(img);
    //perform convolution - this is the call for our type of data
	//uint_8 kernel = {-2, -2, 0, -2, 6, 0, 0, 0, 0}; // 1
	unsigned char kernel[9] = {1, 1, 1, 1, 1, 1, 1, 1, 1}; // 1
    unsigned char bgColor[4] = { 0, 0, 0, 0 }; // 4
    error = vImageErode_ARGB8888(&inBuffer, &outBuffer, 0, 0, kernel, 3, 3, kvImageBackgroundColorFill);

    //check for an error in the call to perform the convolution
    if (error) {
        NSLog(@"error from convolution %ld", error);
    }
    //create CGImageRef from vImage_Buffer output
    //1 - CGBitmapContextCreateImage -
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGContextRef ctx = CGBitmapContextCreate(outBuffer.data,
                                             outBuffer.width,
                                             outBuffer.height,
                                             8,
                                             outBuffer.rowBytes,
                                             colorSpace,
                                             kCGImageAlphaNoneSkipLast);
    CGImageRef imageRef = CGBitmapContextCreateImage (ctx);
    UIImage *returnImage = [UIImage imageWithCGImage:imageRef];
    //clean up
    CGContextRelease(ctx);
    CGColorSpaceRelease(colorSpace);
    free(pixelBuffer);
    CFRelease(inBitmapData);
    CGColorSpaceRelease(colorSpace);
    CGImageRelease(imageRef);
    return returnImage;
}


//************************************************************************************************************************
// Performs dilate transformation using a 3x3 Kernel Matrix
//************************************************************************************************************************
-(UIImage*)dilateImageWithKernel: (UIImage*)image {
    //Get CGImage from UIImage
    CGImageRef img = image.CGImage;
    //setup variables
    vImage_Buffer inBuffer, outBuffer;
    vImage_Error error;
    void *pixelBuffer;
    //create vImage_Buffer with data from CGImageRef
    //These two lines get get the data from the CGImage
    CGDataProviderRef inProvider = CGImageGetDataProvider(img);  
    CFDataRef inBitmapData = CGDataProviderCopyData(inProvider);  
    //The next three lines set up the inBuffer object based on the attributes of the CGImage
    inBuffer.width = CGImageGetWidth(img);
    inBuffer.height = CGImageGetHeight(img);
    inBuffer.rowBytes = CGImageGetBytesPerRow(img);
     
    //This sets the pointer to the data for the inBuffer object
    inBuffer.data = (void*)CFDataGetBytePtr(inBitmapData);
    //create vImage_Buffer for output
    //allocate a buffer for the output image and check if it exists in the next three lines
    pixelBuffer = malloc(CGImageGetBytesPerRow(img) * CGImageGetHeight(img));
    if(pixelBuffer == NULL)
        NSLog(@"No pixelbuffer");
    //set up the output buffer object based on the same dimensions as the input image
    outBuffer.data = pixelBuffer;
    outBuffer.width = CGImageGetWidth(img);
    outBuffer.height = CGImageGetHeight(img);
    outBuffer.rowBytes = CGImageGetBytesPerRow(img);
    //perform convolution - this is the call for our type of data
	//uint_8 kernel = {-2, -2, 0, -2, 6, 0, 0, 0, 0}; // 1
	unsigned char kernel[9] = {1, 1, 1, 1, 1, 1, 1, 1, 1}; // 1
    unsigned char bgColor[4] = { 0, 0, 0, 0 }; // 4
    error = vImageDilate_ARGB8888(&inBuffer, &outBuffer, 0, 0, kernel, 3, 3, kvImageBackgroundColorFill);

    //check for an error in the call to perform the convolution
    if (error) {
        NSLog(@"error from convolution %ld", error);
    }
    //create CGImageRef from vImage_Buffer output
    //1 - CGBitmapContextCreateImage -
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGContextRef ctx = CGBitmapContextCreate(outBuffer.data,
                                             outBuffer.width,
                                             outBuffer.height,
                                             8,
                                             outBuffer.rowBytes,
                                             colorSpace,
                                             kCGImageAlphaNoneSkipLast);
    CGImageRef imageRef = CGBitmapContextCreateImage (ctx);
    UIImage *returnImage = [UIImage imageWithCGImage:imageRef];
    //clean up
    CGContextRelease(ctx);
    CGColorSpaceRelease(colorSpace);
    free(pixelBuffer);
    CFRelease(inBitmapData);
    CGColorSpaceRelease(colorSpace);
    CGImageRelease(imageRef);
    return returnImage;
}


-(UIImage*)erodeImage: (UIImage*)image :(int)size {
    //Get CGImage from UIImage
    CGImageRef img = image.CGImage;
    //setup variables
    vImage_Buffer inBuffer, outBuffer;
    vImage_Error error;
    void *pixelBuffer;
    //create vImage_Buffer with data from CGImageRef
    //These two lines get get the data from the CGImage
    CGDataProviderRef inProvider = CGImageGetDataProvider(img);  
    CFDataRef inBitmapData = CGDataProviderCopyData(inProvider);  
    //The next three lines set up the inBuffer object based on the attributes of the CGImage
    inBuffer.width = CGImageGetWidth(img);
    inBuffer.height = CGImageGetHeight(img);
    inBuffer.rowBytes = CGImageGetBytesPerRow(img);
     
    //This sets the pointer to the data for the inBuffer object
    inBuffer.data = (void*)CFDataGetBytePtr(inBitmapData);
    //create vImage_Buffer for output
    //allocate a buffer for the output image and check if it exists in the next three lines
    pixelBuffer = malloc(CGImageGetBytesPerRow(img) * CGImageGetHeight(img));
    if(pixelBuffer == NULL)
        NSLog(@"No pixelbuffer");
    //set up the output buffer object based on the same dimensions as the input image
    outBuffer.data = pixelBuffer;
    outBuffer.width = CGImageGetWidth(img);
    outBuffer.height = CGImageGetHeight(img);
    outBuffer.rowBytes = CGImageGetBytesPerRow(img);
    //perform convolution - this is the call for our type of data
    error = vImageMin_ARGB8888(&inBuffer, &outBuffer, NULL, 0, 0, size, size, kvImageLeaveAlphaUnchanged);

    //check for an error in the call to perform the convolution
    if (error) {
        NSLog(@"error from convolution %ld", error);
    }
    //create CGImageRef from vImage_Buffer output
    //1 - CGBitmapContextCreateImage -
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGContextRef ctx = CGBitmapContextCreate(outBuffer.data,
                                             outBuffer.width,
                                             outBuffer.height,
                                             8,
                                             outBuffer.rowBytes,
                                             colorSpace,
                                             kCGImageAlphaNoneSkipLast);
    CGImageRef imageRef = CGBitmapContextCreateImage (ctx);
    UIImage *returnImage = [UIImage imageWithCGImage:imageRef];
    //clean up
    CGContextRelease(ctx);
    CGColorSpaceRelease(colorSpace);
    free(pixelBuffer);
    CFRelease(inBitmapData);
    CGColorSpaceRelease(colorSpace);
    CGImageRelease(imageRef);
    return returnImage;
}


-(UIImage*)dilateImage: (UIImage*)image :(int)size {
    //Get CGImage from UIImage
    CGImageRef img = image.CGImage;
    //setup variables
    vImage_Buffer inBuffer, outBuffer;
    vImage_Error error;
    void *pixelBuffer;
    //create vImage_Buffer with data from CGImageRef
    //These two lines get get the data from the CGImage
    CGDataProviderRef inProvider = CGImageGetDataProvider(img);  
    CFDataRef inBitmapData = CGDataProviderCopyData(inProvider);  
    //The next three lines set up the inBuffer object based on the attributes of the CGImage
    inBuffer.width = CGImageGetWidth(img);
    inBuffer.height = CGImageGetHeight(img);
    inBuffer.rowBytes = CGImageGetBytesPerRow(img);
     
    //This sets the pointer to the data for the inBuffer object
    inBuffer.data = (void*)CFDataGetBytePtr(inBitmapData);
    //create vImage_Buffer for output
    //allocate a buffer for the output image and check if it exists in the next three lines
    pixelBuffer = malloc(CGImageGetBytesPerRow(img) * CGImageGetHeight(img));
    if(pixelBuffer == NULL)
        NSLog(@"No pixelbuffer");
    //set up the output buffer object based on the same dimensions as the input image
    outBuffer.data = pixelBuffer;
    outBuffer.width = CGImageGetWidth(img);
    outBuffer.height = CGImageGetHeight(img);
    outBuffer.rowBytes = CGImageGetBytesPerRow(img);
    //perform convolution - this is the call for our type of data
    error = vImageMax_ARGB8888(&inBuffer, &outBuffer, NULL, 0, 0, size, size, kvImageLeaveAlphaUnchanged);

    //check for an error in the call to perform the convolution
    if (error) {
        NSLog(@"error from convolution %ld", error);
    }
    //create CGImageRef from vImage_Buffer output
    //1 - CGBitmapContextCreateImage -
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGContextRef ctx = CGBitmapContextCreate(outBuffer.data,
                                             outBuffer.width,
                                             outBuffer.height,
                                             8,
                                             outBuffer.rowBytes,
                                             colorSpace,
                                             kCGImageAlphaNoneSkipLast);
    CGImageRef imageRef = CGBitmapContextCreateImage (ctx);
    UIImage *returnImage = [UIImage imageWithCGImage:imageRef];
    //clean up
    CGContextRelease(ctx);
    CGColorSpaceRelease(colorSpace);
    free(pixelBuffer);
    CFRelease(inBitmapData);
    CGColorSpaceRelease(colorSpace);
    CGImageRelease(imageRef);
    return returnImage;
}


// Gets an pure black and white image from an original image.
-(UIImage*)pureBlackAndWhiteImage: (UIImage *)image :(int)boxSize {

    unsigned char *dataBitmap = [self bitmapFromImage:image];
	
    for (int i = 0; i < image.size.width * image.size.height * 4; i += 4) {
        if ((dataBitmap[i + 1] + dataBitmap[i + 2] + dataBitmap[i + 3]) < (255 * 3 / 2)) {
            dataBitmap[i + 1] = 0;
            dataBitmap[i + 2] = 0;
            dataBitmap[i + 3] = 0;
        } else {
            dataBitmap[i + 1] = 255;
            dataBitmap[i + 2] = 255;
            dataBitmap[i + 3] = 255;
        }
    }
    image = [self imageWithBits:dataBitmap withSize:image.size];
   return image;
}

// Gets an pure black and white image from an original image.
-(UIImage*)pureBlackAndWhiteInvertedImage: (UIImage *)image :(int)boxSize {

    unsigned char *dataBitmap = [self bitmapFromImage:image];
    for (int i = 0; i < image.size.width * image.size.height * 4; i += 4) {
        if ((dataBitmap[i + 1] + dataBitmap[i + 2] + dataBitmap[i + 3]) < (255 * 3 / 2)) {
            dataBitmap[i + 1] = 255;
            dataBitmap[i + 2] = 255;
            dataBitmap[i + 3] = 255;
        } else {
            dataBitmap[i + 1] = 0;
            dataBitmap[i + 2] = 0;
            dataBitmap[i + 3] = 0;
        }
    }
    image = [self imageWithBits:dataBitmap withSize:image.size];
   return image;
}


-(unsigned char*)bitmapFromImage:(UIImage*) image {

    // Creates a bitmap from the given image.
	//CGContextRef contex = [self bitmapFromImage:image];
    CGContextRef contex = CreateARGBBitmapContext(image.size);
    if (contex == NULL) {
        return NULL;
    }

    CGRect rect = CGRectMake(0.0f, 0.0f, image.size.width, image.size.height);
    CGContextDrawImage(contex, rect, image.CGImage);
    unsigned char *data = CGBitmapContextGetData(contex);
    CGContextRelease(contex);

    return data;
}

// Fills an image with bits.
-(UIImage*)imageWithBits:(unsigned char*)bits withSize:(CGSize)size {

    // Creates a color space
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    if (colorSpace == NULL) {

        fprintf(stderr, "Error allocating color space\n");
        free(bits);
        return nil;
    }

    CGContextRef context = CGBitmapContextCreate (bits, size.width, size.height, 8, size.width * 4, colorSpace, kCGImageAlphaPremultipliedFirst);
    if (context == NULL) {

        fprintf (stderr, "Error. Context not created\n");
        free (bits);
        CGColorSpaceRelease(colorSpace );
        return nil;
    }

    CGColorSpaceRelease(colorSpace );
    CGImageRef ref = CGBitmapContextCreateImage(context);
    free(CGBitmapContextGetData(context));
    CGContextRelease(context);

    UIImage *img = [UIImage imageWithCGImage:ref];
    CFRelease(ref);
    return img;
}


CGContextRef CreateARGBBitmapContext(CGSize size)
{
    CGContextRef    context = NULL;
    CGColorSpaceRef colorSpace;
    void *          bitmapData;
    int             bitmapByteCount;
    int             bitmapBytesPerRow;

    // Get image width, height. We'll use the entire image.                                                                                                                                                                                 
    size_t pixelsWide = size.width;
    size_t pixelsHigh = size.height;

    // Declare the number of bytes per row. Each pixel in the bitmap in this                                                                                                                                                                
    // example is represented by 4 bytes; 8 bits each of red, green, blue, and                                                                                                                                                              
    // alpha.                                                                                                                                                                                                                               
    bitmapBytesPerRow   = (pixelsWide * 4);
    bitmapByteCount     = (bitmapBytesPerRow * pixelsHigh);

    // Use the generic RGB color space.                                                                                                                                                                                                     
    colorSpace = CGColorSpaceCreateDeviceRGB();

    if (colorSpace == NULL)
    {
        fprintf(stderr, "Error allocating color space\n");
        return NULL;
    }

    // Allocate memory for image data. This is the destination in memory                                                                                                                                                                    
    // where any drawing to the bitmap context will be rendered.                                                                                                                                                                            
    bitmapData = malloc( bitmapByteCount );
    if (bitmapData == NULL)
    {
        fprintf (stderr, "Memory not allocated!");
        CGColorSpaceRelease( colorSpace );
        return NULL;
    }
    // Create the bitmap context. We want pre-multiplied ARGB, 8-bits                                                                                                                                                                       
    // per component. Regardless of what the source image format is                                                                                                                                                                         
    // (CMYK, Grayscale, and so on) it will be converted over to the format                                                                                                                                                                 
    // specified here by CGBitmapContextCreate.                                                                                                                                                                                             
    context = CGBitmapContextCreate (bitmapData,
                                     pixelsWide,
                                     pixelsHigh,
                                     8,      // bits per component                                                                                                                                                                          
                                     bitmapBytesPerRow,
                                     colorSpace,
                                     kCGImageAlphaPremultipliedFirst);
    if (context == NULL)
    {
        free (bitmapData);
        fprintf (stderr, "Context not created!");
    }

    // Make sure and release colorspace before returning                                                                                                                                                                                    
    CGColorSpaceRelease( colorSpace );
    return context;
}


-(UIImage*)greyScale2: (UIImage*)image :(int)boxSize {
    //Get CGImage from UIImage
    CGImageRef img = image.CGImage;
    CGColorSpaceRef colorSapce = CGColorSpaceCreateDeviceGray();
    CGContextRef context = CGBitmapContextCreate(nil, image.size.width, image.size.height, 8, image.size.width, colorSapce, kCGImageAlphaNone);
    CGContextSetInterpolationQuality(context, kCGInterpolationHigh);
    CGContextSetShouldAntialias(context, NO);
    CGContextDrawImage(context, CGRectMake(0, 0, image.size.width, image.size.height), [image CGImage]);
    CGImageRef bwImage = CGBitmapContextCreateImage(context);
    CGContextRelease(context);
    CGColorSpaceRelease(colorSapce);
    UIImage *resultImage = [UIImage imageWithCGImage:bwImage]; // This is result B/W image.
    CGImageRelease(bwImage);
    return resultImage;
}


-(UIImage*)boxblurImage: (UIImage*)image :(int)boxSize {
    //Get CGImage from UIImage
    CGImageRef img = image.CGImage;
    //setup variables
    vImage_Buffer inBuffer, outBuffer;
    vImage_Error error;
    void *pixelBuffer;
    //create vImage_Buffer with data from CGImageRef
    //These two lines get get the data from the CGImage
    CGDataProviderRef inProvider = CGImageGetDataProvider(img);  
    CFDataRef inBitmapData = CGDataProviderCopyData(inProvider);  
    //The next three lines set up the inBuffer object based on the attributes of the CGImage
    inBuffer.width = CGImageGetWidth(img);
    inBuffer.height = CGImageGetHeight(img);
    inBuffer.rowBytes = CGImageGetBytesPerRow(img);
     
    //This sets the pointer to the data for the inBuffer object
    inBuffer.data = (void*)CFDataGetBytePtr(inBitmapData);
    //create vImage_Buffer for output
    //allocate a buffer for the output image and check if it exists in the next three lines
    pixelBuffer = malloc(CGImageGetBytesPerRow(img) * CGImageGetHeight(img));
    if(pixelBuffer == NULL)
        NSLog(@"No pixelbuffer");
    //set up the output buffer object based on the same dimensions as the input image
    outBuffer.data = pixelBuffer;
    outBuffer.width = CGImageGetWidth(img);
    outBuffer.height = CGImageGetHeight(img);
    outBuffer.rowBytes = CGImageGetBytesPerRow(img);
    //perform convolution - this is the call for our type of data
    error = vImageBoxConvolve_ARGB8888(&inBuffer, &outBuffer, NULL, 0, 0, boxSize, boxSize, NULL, kvImageEdgeExtend);
    //check for an error in the call to perform the convolution
    if (error) {
        NSLog(@"error from convolution %ld", error);
    }
    //create CGImageRef from vImage_Buffer output
    //1 - CGBitmapContextCreateImage -
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGContextRef ctx = CGBitmapContextCreate(outBuffer.data,
                                             outBuffer.width,
                                             outBuffer.height,
                                             8,
                                             outBuffer.rowBytes,
                                             colorSpace,
                                             kCGImageAlphaNoneSkipLast);
    CGImageRef imageRef = CGBitmapContextCreateImage (ctx);
    UIImage *returnImage = [UIImage imageWithCGImage:imageRef];
    //clean up
    CGContextRelease(ctx);
    CGColorSpaceRelease(colorSpace);
    free(pixelBuffer);
    CFRelease(inBitmapData);
    CGColorSpaceRelease(colorSpace);
    CGImageRelease(imageRef);
    return returnImage;
}





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

-(UIImage*)applyBlurOnImage: (UIImage*)imageToBlur :(CGFloat)blurRadius {
    CIImage *originalImage = [CIImage imageWithCGImage: imageToBlur.CGImage];
    CIFilter *filter = [CIFilter filterWithName: @"CIGaussianBlur"
                                  keysAndValues: kCIInputImageKey, originalImage,
                                  @"inputRadius", @(blurRadius), nil];
    CIImage *outputImage = filter.outputImage;
    CIContext *context = [CIContext contextWithOptions:nil];
    CGImageRef outImage = [context createCGImage: outputImage
                                        fromRect: [outputImage extent]];
    return [UIImage imageWithCGImage: outImage];
}

-(UIImage*) convertToGreyscale:(UIImage*)i :(int)Size   {

    int kRed = 1;
    int kGreen = 2;
    int kBlue = 4;

    int colors = kGreen | kBlue | kRed;
    int m_width = i.size.width;
    int m_height = i.size.height;

    uint32_t *rgbImage = (uint32_t *) malloc(m_width * m_height * sizeof(uint32_t));
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGContextRef context = CGBitmapContextCreate(rgbImage, m_width, m_height, 8, m_width * 4, colorSpace, kCGBitmapByteOrder32Little | kCGImageAlphaNoneSkipLast);
    CGContextSetInterpolationQuality(context, kCGInterpolationHigh);
    CGContextSetShouldAntialias(context, NO);
    CGContextDrawImage(context, CGRectMake(0, 0, m_width, m_height), [i CGImage]);
    CGContextRelease(context);
    CGColorSpaceRelease(colorSpace);

    // now convert to grayscale
    uint8_t *m_imageData = (uint8_t *) malloc(m_width * m_height);
    for(int y = 0; y < m_height; y++) {
        for(int x = 0; x < m_width; x++) {
            uint32_t rgbPixel=rgbImage[y*m_width+x];
            uint32_t sum=0,count=0;
            if (colors & kRed) {sum += (rgbPixel>>24)&255; count++;}
            if (colors & kGreen) {sum += (rgbPixel>>16)&255; count++;}
            if (colors & kBlue) {sum += (rgbPixel>>8)&255; count++;}
            m_imageData[y*m_width+x]=sum/count;
        }
    }
    free(rgbImage);

    // convert from a gray scale image back into a UIImage
    uint8_t *result = (uint8_t *) calloc(m_width * m_height *sizeof(uint32_t), 1);

    // process the image back to rgb
    for(int i = 0; i < m_height * m_width; i++) {
        result[i*4]=0;
        int val=m_imageData[i];
        result[i*4+1]=val;
        result[i*4+2]=val;
        result[i*4+3]=val;
    }

    // create a UIImage
    colorSpace = CGColorSpaceCreateDeviceRGB();
    context = CGBitmapContextCreate(result, m_width, m_height, 8, m_width * sizeof(uint32_t), colorSpace, kCGBitmapByteOrder32Little | kCGImageAlphaNoneSkipLast);
    CGImageRef image = CGBitmapContextCreateImage(context);
    CGContextRelease(context);
    CGColorSpaceRelease(colorSpace);
    UIImage *resultUIImage = [UIImage imageWithCGImage:image];
    CGImageRelease(image);

    free(m_imageData);

    // make sure the data will be released by giving it to an autoreleased NSData
    [NSData dataWithBytesNoCopy:result length:m_width * m_height];

    return resultUIImage;
}


#End If
