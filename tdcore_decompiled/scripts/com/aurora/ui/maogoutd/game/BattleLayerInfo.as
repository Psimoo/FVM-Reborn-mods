package com.aurora.ui.maogoutd.game
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import flash.display.DisplayObject;
   
   public class BattleLayerInfo
   {
      
      public var m_iType:int;
      
      public var a_1598:a_3491;
      
      public var m_stDisplayObject:DisplayObject;
      
      public function BattleLayerInfo()
      {
         super();
         this.a_1598 = new a_3491(null,0,0);
      }
      
      public static function a_3926() : BattleLayerInfo
      {
         return PoolManager.getInstance().CheckOutOne(BattleLayerInfo) as BattleLayerInfo;
      }
      
      public function a_4330() : void
      {
         this.m_stDisplayObject = null;
         PoolManager.getInstance().CheckInOne(this);
      }
   }
}

