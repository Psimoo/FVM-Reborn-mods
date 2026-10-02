package com.aurora.ui.maogoutd.compositemap.data
{
   import flash.display.BitmapData;
   
   public class ComMapRes
   {
      
      public var m_strURL:String;
      
      public var m_pBitmapData:BitmapData;
      
      public function ComMapRes()
      {
         super();
      }
      
      public function ToString() : String
      {
         return this.m_pBitmapData.height.toString() + this.m_pBitmapData.width.toString();
      }
   }
}

