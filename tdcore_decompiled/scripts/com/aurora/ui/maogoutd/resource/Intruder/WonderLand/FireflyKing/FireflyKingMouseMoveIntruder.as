package com.aurora.ui.maogoutd.resource.Intruder.WonderLand.FireflyKing
{
   import a_4718.b_182;
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4255;
   import com.aurora.ui.maogoutd.resource.defender.a_3962;
   import com.aurora.ui.maogoutd.resource.effect.a_4108;
   import flash.display.FrameLabel;
   
   public class FireflyKingMouseMoveIntruder extends a_4206
   {
      
      private const FULL_HP:int = 3600;
      
      private const HURT_HP:int = 1800;
      
      private const DEAD_HP:int = 0;
      
      private var m_DieCalling:Boolean;
      
      public function FireflyKingMouseMoveIntruder()
      {
         super();
         a_1279 = -width * 0.3;
         a_1467 = -28;
      }
      
      public static function a_3926() : a_4206
      {
         return PoolManager.getInstance().CheckOutOne(FireflyKingMouseMoveIntruder) as FireflyKingMouseMoveIntruder;
      }
      
      override protected function getBindMovie() : Class
      {
         return FireflyKingMouseMoveIntruderMovie;
      }
      
      override public function a_1797(iGlobalMoveFighterID:int, iIntruderMoveDirection:int) : Boolean
      {
         super.a_1797(iGlobalMoveFighterID,iIntruderMoveDirection);
         a_1350 = a_3491.a_1080 / (7 * 20);
         if(iIntruderMoveDirection < 0)
         {
            a_1350 *= -1;
         }
         this.m_DieCalling = false;
         a_1339 = this.FULL_HP;
         a_1377 = 20;
         a_1465 = 3;
         BoomIsReduceLife = true;
         a_1279 = -width * 0.2;
         a_1272 = 0;
         return true;
      }
      
      override protected function ResetMovieStatus() : Boolean
      {
         if(a_1339 > this.HURT_HP)
         {
            if(a_1475)
            {
               if(a_1275 != 2)
               {
                  a_1275 = 2;
                  gotoAndStop((a_1276[2] as FrameLabel).frame);
               }
            }
            else if(a_1275 != 0)
            {
               a_1275 = 0;
               gotoAndStop((a_1276[0] as FrameLabel).frame);
            }
            a_3419();
         }
         else if(a_1339 > 0)
         {
            if(a_1475)
            {
               if(a_1275 != 3)
               {
                  a_1275 = 3;
                  gotoAndStop((a_1276[3] as FrameLabel).frame);
               }
            }
            else if(a_1275 != 1)
            {
               a_1275 = 1;
               gotoAndStop((a_1276[1] as FrameLabel).frame);
            }
            a_3419();
         }
         else if(a_1339 <= 0)
         {
            if(a_1275 != 5)
            {
               a_1275 = 5;
               gotoAndStop((a_1276[5] as FrameLabel).frame);
               this.m_DieCalling = true;
            }
         }
         return true;
      }
      
      override public function a_3969(iRduceLifeValue:int) : Boolean
      {
         super.a_3969(iRduceLifeValue);
         return true;
      }
      
      override public function a_4210() : Boolean
      {
         super.a_4210();
         return true;
      }
      
      override public function a_4215(stBaseDefense:a_3962) : Boolean
      {
         super.a_4215(stBaseDefense);
         return true;
      }
      
      override public function a_4216(iCurrentTime:int) : Boolean
      {
         var numOrigXPos:Number = x;
         if(!this.m_DieCalling)
         {
            super.a_4216(iCurrentTime);
         }
         if(iCurrentTime % 2 == 0)
         {
            if(a_1273 == 74)
            {
               this.RealeaseMouse();
               a_1339 = 0;
               if(m_stCurrentFieldGrid)
               {
                  m_stCurrentFieldGrid.a_3457(this);
                  m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3457(this);
               }
               a_3940();
            }
         }
         return true;
      }
      
      private function RealeaseMouse() : void
      {
         var iXGridNo:int = 0;
         var iYGridNo:int = 0;
         var stBaseMoveIntruder:* = undefined;
         var stStartFieldGrid:a_3491 = null;
         if(null == m_stCurrentFieldGrid)
         {
            return;
         }
         iXGridNo = m_stCurrentFieldGrid.m_iXGridNo;
         iYGridNo = m_stCurrentFieldGrid.m_iYGridNo - 1;
         stStartFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(iXGridNo,iYGridNo);
         if(stStartFieldGrid != null)
         {
            stBaseMoveIntruder = a_4255.getInstance().a_4256(8389421);
            if(null == stBaseMoveIntruder)
            {
               throw Error("前端map_mouse.xml配置 MouseID节点 缺少老鼠ID：" + (8389421).toString(16));
            }
            stBaseMoveIntruder.a_1797((globalMoveFighterID << 16) + iYGridNo,-1);
            stBaseMoveIntruder.m_stMoveIntruderTypeID = 8389421;
            stBaseMoveIntruder.x = x + 13;
            stBaseMoveIntruder.y = iYPosSkewing + stBaseMoveIntruder.iYPosSkewing + (stStartFieldGrid.m_iYGridNo + 1) * a_3491.a_1081 - stBaseMoveIntruder.height - 3;
            stStartFieldGrid.m_stCurrentBattbleFieldView.a_3459(stBaseMoveIntruder,stStartFieldGrid,false);
         }
         iXGridNo = m_stCurrentFieldGrid.m_iXGridNo;
         iYGridNo = m_stCurrentFieldGrid.m_iYGridNo;
         stStartFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(iXGridNo,iYGridNo);
         if(stStartFieldGrid != null)
         {
            stBaseMoveIntruder = a_4255.getInstance().a_4256(8389421);
            if(null == stBaseMoveIntruder)
            {
               throw Error("前端map_mouse.xml配置 MouseID节点 缺少老鼠ID：" + (8389421).toString(16));
            }
            stBaseMoveIntruder.a_1797((globalMoveFighterID << 16) + iYGridNo,-1);
            stBaseMoveIntruder.m_stMoveIntruderTypeID = 8389421;
            stBaseMoveIntruder.x = x + 13;
            stBaseMoveIntruder.y = iYPosSkewing + stBaseMoveIntruder.iYPosSkewing + (stStartFieldGrid.m_iYGridNo + 1) * a_3491.a_1081 - stBaseMoveIntruder.height - 3;
            stStartFieldGrid.m_stCurrentBattbleFieldView.a_3459(stBaseMoveIntruder,stStartFieldGrid,false);
         }
         iXGridNo = m_stCurrentFieldGrid.m_iXGridNo;
         iYGridNo = m_stCurrentFieldGrid.m_iYGridNo + 1;
         stStartFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(iXGridNo,iYGridNo);
         if(stStartFieldGrid != null)
         {
            stBaseMoveIntruder = a_4255.getInstance().a_4256(8389421);
            if(null == stBaseMoveIntruder)
            {
               throw Error("前端map_mouse.xml配置 MouseID节点 缺少老鼠ID：" + (8389421).toString(16));
            }
            stBaseMoveIntruder.a_1797((globalMoveFighterID << 16) + iYGridNo,-1);
            stBaseMoveIntruder.m_stMoveIntruderTypeID = 8389421;
            stBaseMoveIntruder.x = x + 13;
            stBaseMoveIntruder.y = iYPosSkewing + stBaseMoveIntruder.iYPosSkewing + (stStartFieldGrid.m_iYGridNo + 1) * a_3491.a_1081 - stBaseMoveIntruder.height - 3;
            stStartFieldGrid.m_stCurrentBattbleFieldView.a_3459(stBaseMoveIntruder,stStartFieldGrid,false);
         }
      }
      
      override public function a_4208(iEffectType:int, iEffectTime:int, stBaseEffect:a_4108 = null) : void
      {
         if(iEffectType != b_182.a_434 && iEffectType != b_182.enm_shotEffectFreezeStop && iEffectType != b_182.a_433)
         {
            super.a_4208(iEffectType,iEffectTime,stBaseEffect);
         }
      }
      
      override public function play() : void
      {
         super.play();
      }
   }
}

