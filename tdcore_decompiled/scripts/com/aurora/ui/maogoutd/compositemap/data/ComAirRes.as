package com.aurora.ui.maogoutd.compositemap.data
{
   import com.u321.go.xutils.ObjectPool;
   import flash.display.Bitmap;
   
   public class ComAirRes extends Bitmap
   {
      
      public var m_strRes:String;
      
      public function ComAirRes()
      {
         super();
      }
      
      public function a_4451() : ComAirRes
      {
         var stComAirRes:ComAirRes = ObjectPool.CheckOut(ComAirRes) as ComAirRes;
         stComAirRes.m_strRes = this.m_strRes;
         stComAirRes.bitmapData = this.bitmapData;
         return stComAirRes;
      }
   }
}

