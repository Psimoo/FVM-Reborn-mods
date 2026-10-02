package com.aurora.ui.maogoutd.resource.Intruder.WonderLand.boss.RedQueen
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4255;
   import com.aurora.ui.maogoutd.resource.effect.a_4108;
   import flash.events.Event;
   
   public class AddSpadePokerEffect extends a_4108
   {
      
      public var m_TargetFieldGrid:a_3491;
      
      public function AddSpadePokerEffect()
      {
         super();
         a_1279 = -25;
         m_iYDisplayCenterPos = -51;
      }
      
      public static function a_3926() : AddSpadePokerEffect
      {
         return PoolManager.getInstance().CheckOutOne(AddSpadePokerEffect) as AddSpadePokerEffect;
      }
      
      override protected function getBindMovie() : Class
      {
         return AddSpadePokerEffectMovie;
      }
      
      override public function a_1797(isReversed:Boolean) : Boolean
      {
         super.a_1797(isReversed);
         a_1275 = 0;
         this.a_3502(this.m_TargetFieldGrid);
         return true;
      }
      
      override protected function a_4109(a_4730:Event) : void
      {
         nextFrame();
         if(a_1273 == 10)
         {
            this.RealeaseMouse();
         }
         else if(a_1273 == a_1274)
         {
            this.a_3940();
         }
      }
      
      private function RealeaseMouse() : void
      {
         var iXGridNo:int = 0;
         var iYGridNo:int = 0;
         var stBaseMoveIntruder:* = undefined;
         var stStartFieldGrid:a_3491 = null;
         if(null == this.m_TargetFieldGrid)
         {
            return;
         }
         stStartFieldGrid = this.m_TargetFieldGrid;
         if(stStartFieldGrid != null)
         {
            stBaseMoveIntruder = a_4255.getInstance().a_4256(8389418);
            if(null == stBaseMoveIntruder)
            {
               throw Error("前端map_mouse.xml配置 MouseID节点 缺少老鼠ID：" + (8389418).toString(16));
            }
            stBaseMoveIntruder.a_1797((1 << 16) + iYGridNo,-1);
            stBaseMoveIntruder.m_stMoveIntruderTypeID = 8389418;
            stBaseMoveIntruder.x = stStartFieldGrid.m_iXGridNo * a_3491.a_1080;
            stBaseMoveIntruder.y = 0 + stBaseMoveIntruder.iYPosSkewing + (stStartFieldGrid.m_iYGridNo + 1) * a_3491.a_1081 - stBaseMoveIntruder.height;
            stStartFieldGrid.m_stCurrentBattbleFieldView.a_3459(stBaseMoveIntruder,stStartFieldGrid,false);
         }
      }
      
      protected function a_3502(stFieldGrid:a_3491) : Boolean
      {
         if(null == stFieldGrid)
         {
            return false;
         }
         return stFieldGrid.ClearFieldGridDefenseWithOption();
      }
      
      override public function a_3940() : Boolean
      {
         var stVector:Array = null;
         super.a_3940();
         if(this.m_TargetFieldGrid)
         {
            stVector = this.m_TargetFieldGrid.m_stCurrentBattbleFieldView.m_arrEffectArray;
            if(-1 != stVector.indexOf(this))
            {
               stVector.splice(stVector.indexOf(this),1);
            }
         }
         return true;
      }
   }
}

