package com.aurora.ui.maogoutd.resource.Intruder.newBoss.captainAmerica
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4255;
   import com.aurora.ui.maogoutd.resource.effect.a_4108;
   
   public class CaptainAmericaRainbowMoveIntruder extends a_4206
   {
      
      private static const MAX_LIFE:int = 5000;
      
      private var m_bIsRealeaseMouse:Boolean;
      
      public function CaptainAmericaRainbowMoveIntruder()
      {
         super();
         a_1467 = 25;
         a_1279 = 15;
      }
      
      public static function a_3926() : CaptainAmericaRainbowMoveIntruder
      {
         return PoolManager.getInstance().CheckOutOne(CaptainAmericaRainbowMoveIntruder) as CaptainAmericaRainbowMoveIntruder;
      }
      
      override protected function getBindMovie() : Class
      {
         return CaptainAmericaRainbowMoveIntruderMovie;
      }
      
      override public function get width() : Number
      {
         return 124;
      }
      
      override public function get height() : Number
      {
         return 64;
      }
      
      override public function a_1797(iGlobalMoveFighterID:int, iIntruderMoveDirection:int) : Boolean
      {
         super.a_1797(iGlobalMoveFighterID,iIntruderMoveDirection);
         a_1339 = MAX_LIFE;
         a_1465 = 3;
         a_1350 = 0;
         this.m_bIsRealeaseMouse = false;
         return true;
      }
      
      override public function a_4208(iEffectType:int, iEffectTime:int, stBaseEffect:a_4108 = null) : void
      {
      }
      
      override public function a_4210() : Boolean
      {
         a_3969(900);
         return true;
      }
      
      override public function a_4211(iCutLifeValue:int) : Boolean
      {
         return false;
      }
      
      override protected function ResetMovieStatus() : Boolean
      {
         return true;
      }
      
      override public function a_4216(iCurrentTime:int) : Boolean
      {
         var stBaseMoveIntruder:a_4206 = null;
         if(!this.m_bIsRealeaseMouse && a_1273 == a_1274 - 5)
         {
            this.m_bIsRealeaseMouse = true;
            stBaseMoveIntruder = a_4255.getInstance().a_4256(8388766);
            if(null == stBaseMoveIntruder)
            {
               throw Error("前端map_mouse.xml配置 MouseID节点 缺少老鼠ID：" + (8388766).toString(16));
            }
            if(null == m_stCurrentFieldGrid)
            {
               throw Error(this.toString() + "::GoAhead->m_stCurrentFieldGrid is null");
            }
            stBaseMoveIntruder.m_stMoveIntruderTypeID = 8388766;
            stBaseMoveIntruder.x = (m_stCurrentFieldGrid.m_iXGridNo + 0.5) * a_3491.a_1080;
            stBaseMoveIntruder.y = stBaseMoveIntruder.iYPosSkewing + (m_stCurrentFieldGrid.m_iYGridNo + 1) * a_3491.a_1081 - stBaseMoveIntruder.height;
            m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3459(stBaseMoveIntruder,m_stCurrentFieldGrid,true);
         }
         else if(a_1273 == a_1274)
         {
            a_3940();
         }
         return true;
      }
   }
}

