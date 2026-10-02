package com.aurora.ui.maogoutd.resource.gamemap.newMap.SnakeYear.SkyCherryParty.Effect
{
   import flash.display.Bitmap;
   
   public class AirBitmapPool
   {
      
      private static var _instance:AirBitmapPool;
      
      private var _pool:Vector.<Bitmap>;
      
      private var _maxCount:int = 50;
      
      public function AirBitmapPool(enforcer:SingletonEnforcer)
      {
         super();
         this._pool = new Vector.<Bitmap>();
      }
      
      public static function Get() : AirBitmapPool
      {
         if(!_instance)
         {
            _instance = new AirBitmapPool(new SingletonEnforcer());
         }
         return _instance;
      }
      
      public function GetAirBitmap() : Bitmap
      {
         var bmp:Bitmap = null;
         if(this._pool.length > 0)
         {
            bmp = this._pool.pop();
         }
         else
         {
            bmp = new Bitmap();
         }
         return bmp;
      }
      
      public function Recycle(bmp:Bitmap) : void
      {
         if(!this._pool)
         {
            return;
         }
         bmp.bitmapData = null;
         if(bmp.parent)
         {
            bmp.parent.removeChild(bmp);
         }
         if(this._pool.indexOf(bmp) == -1)
         {
            this._pool.push(bmp);
         }
      }
   }
}

class SingletonEnforcer
{
   
   public function SingletonEnforcer()
   {
      super();
   }
}
