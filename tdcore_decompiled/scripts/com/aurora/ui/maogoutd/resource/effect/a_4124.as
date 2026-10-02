package com.aurora.ui.maogoutd.resource.effect
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.resource.a_3909;
   import flash.events.Event;
   
   public class a_4124 extends a_3909
   {
      
      public static var a_1411:Array = new Array();
      
      public var m_iCoinValue:int;
      
      public function a_4124()
      {
         super();
      }
      
      public static function a_3926() : a_4124
      {
         return PoolManager.getInstance().CheckOutOne(a_4124,GoldCoinEffectMovie) as a_4124;
      }
      
      public function a_1797(isReseaved:Boolean = false) : Boolean
      {
         a_1283 = isReseaved;
         this.visible = true;
         gotoAndStop(1);
         if(-1 == a_1411.indexOf(this))
         {
            a_1411.push(this);
         }
         return true;
      }
      
      public function a_3940() : Boolean
      {
         var stPickUpEffect:a_4115 = null;
         stPickUpEffect = a_4115.a_3926();
         stPickUpEffect.a_1797(false);
         stPickUpEffect.x = x + 0.5 * (width - stPickUpEffect.width);
         stPickUpEffect.y = y + 0.5 * (height - stPickUpEffect.height);
         if(parent)
         {
            parent.addChild(stPickUpEffect);
         }
         gotoAndStop(1);
         PoolManager.getInstance().CheckInOne(this);
         var idx:int = a_1411.indexOf(this);
         if(-1 != idx)
         {
            a_1411.splice(idx,1);
         }
         return true;
      }
      
      public function a_4003(a_4730:Event) : void
      {
         nextFrame();
         if(a_1273 == a_1274)
         {
            gotoAndStop(1);
         }
      }
   }
}

