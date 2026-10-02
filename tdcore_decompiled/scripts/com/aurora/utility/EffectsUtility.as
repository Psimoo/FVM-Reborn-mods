package com.aurora.utility
{
   import fl.motion.AdjustColor;
   import flash.display.Shape;
   import flash.filters.BitmapFilterQuality;
   import flash.filters.BitmapFilterType;
   import flash.filters.ColorMatrixFilter;
   import flash.filters.GlowFilter;
   import flash.filters.GradientBevelFilter;
   import flash.filters.GradientGlowFilter;
   import flash.geom.Rectangle;
   
   public class EffectsUtility
   {
      
      public static var m_arrHighLightFilter:Array;
      
      public static var m_arrTextGlowFilterWhite:Array;
      
      public static var m_arrTextGlowFilter:Array;
      
      public static var m_arrTextGlowFilter2:Array;
      
      public static var m_arrTextGlowFilterEx:Array;
      
      public static var m_arrGrayFilter:Array;
      
      public static var m_arrStrongFilter:Array;
      
      public static var m_arrDisableColorMatrixFilter:Array;
      
      public function EffectsUtility()
      {
         super();
      }
      
      public static function getColorMatrix(brightness:Number = 0, contrast:Number = 0, hue:Number = 0, saturation:Number = 0) : Array
      {
         var ac:AdjustColor = new AdjustColor();
         ac.brightness = brightness;
         ac.contrast = contrast;
         ac.hue = hue;
         ac.saturation = saturation;
         return ac.CalculateFinalFlatArray();
      }
      
      public static function GetDisableFilter() : Array
      {
         if(null == m_arrDisableColorMatrixFilter)
         {
            m_arrDisableColorMatrixFilter = [new ColorMatrixFilter(getColorMatrix(0,0,0,-100))];
         }
         return m_arrDisableColorMatrixFilter;
      }
      
      public static function GetTextFilter(color:int = 1381653) : Array
      {
         var gf:GlowFilter = null;
         if(null == m_arrTextGlowFilter)
         {
            m_arrTextGlowFilter = new Array();
            gf = new GlowFilter(color,1,3,3,6,BitmapFilterQuality.LOW);
            m_arrTextGlowFilter.push(gf);
         }
         else
         {
            (m_arrTextGlowFilter[0] as GlowFilter).color = color;
         }
         return m_arrTextGlowFilter;
      }
      
      public static function GetTextFilter2(color:int = 1381653) : Array
      {
         var gf:GlowFilter = null;
         if(null == m_arrTextGlowFilter2)
         {
            m_arrTextGlowFilter2 = new Array();
            gf = new GlowFilter(color,1,3,3,6,BitmapFilterQuality.LOW);
            m_arrTextGlowFilter2.push(gf);
         }
         else
         {
            (m_arrTextGlowFilter2[0] as GlowFilter).color = color;
         }
         return m_arrTextGlowFilter2;
      }
      
      public static function GetTextFilterWhite() : Array
      {
         var gf:GlowFilter = null;
         if(null == m_arrTextGlowFilterWhite)
         {
            m_arrTextGlowFilterWhite = new Array();
            gf = new GlowFilter(16777215,1,6,6,3,BitmapFilterQuality.LOW);
            m_arrTextGlowFilterWhite.push(gf);
         }
         return m_arrTextGlowFilterWhite;
      }
      
      public static function GetTextFilterEx() : Array
      {
         var gf:GlowFilter = null;
         if(null == m_arrTextGlowFilterEx)
         {
            m_arrTextGlowFilterEx = new Array();
            gf = new GlowFilter(0,1,5,5,6,BitmapFilterQuality.LOW);
            m_arrTextGlowFilterEx.push(gf);
         }
         return m_arrTextGlowFilterEx;
      }
      
      public static function GetGradientFilter(colors:Array) : Array
      {
         var stGBFilter:GradientBevelFilter = new GradientBevelFilter();
         stGBFilter.colors = colors;
         stGBFilter.alphas = [1,1];
         stGBFilter.ratios = [0,255];
         stGBFilter.angle = 90;
         stGBFilter.blurY = 4;
         return [stGBFilter];
      }
      
      public static function GetStrongFilter(color:uint = 16777215) : Array
      {
         var colors:Array = null;
         var alphas:Array = null;
         var ratios:Array = null;
         if(null == m_arrStrongFilter)
         {
            colors = [16776960,16776960,15263894,16777215];
            alphas = [0,0,1,0];
            ratios = [0,0,126,255];
            m_arrStrongFilter = [new GradientGlowFilter(0,0,colors,alphas,ratios,8,8,1,BitmapFilterQuality.HIGH,BitmapFilterType.OUTER,false)];
         }
         return m_arrStrongFilter;
      }
      
      public static function GetRectangleFrame(rect:Rectangle, iColor:uint, fRange:Number = 4, fAlpha:Number = 0.8) : Shape
      {
         var stRectangleFrame:Shape = new Shape();
         stRectangleFrame.filters = [new GlowFilter(iColor,fAlpha,fRange,fRange,2,1,false,false)];
         stRectangleFrame.graphics.clear();
         stRectangleFrame.graphics.drawRect(rect.x,rect.y,rect.width,rect.height);
         return stRectangleFrame;
      }
   }
}

