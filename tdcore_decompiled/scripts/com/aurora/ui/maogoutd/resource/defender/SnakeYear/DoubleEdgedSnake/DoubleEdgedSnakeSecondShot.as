package com.aurora.ui.maogoutd.resource.defender.SnakeYear.DoubleEdgedSnake
{
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.defender.SnakeYear.DoubleEdgedSnake.effect.DoubleEdgedSnakeSecondAffectedEffect;
   import com.aurora.ui.maogoutd.resource.effect.a_4108;
   import com.aurora.ui.maogoutd.resource.shot.a_4348;
   import flash.display.FrameLabel;
   
   public class DoubleEdgedSnakeSecondShot extends a_4348
   {
      
      private static var ms_arrSagittariusShotVector:Array = new Array();
      
      private var m_stLastFieldGrid:a_3491;
      
      public function DoubleEdgedSnakeSecondShot()
      {
         super();
         a_1279 = -59;
         m_iYDisplayCenterPos = -15;
         a_1573 = 2;
         a_1275 = 0;
         a_1588 = true;
      }
      
      public static function a_4344() : a_4348
      {
         var stDoubleEdgedSnakeSecondShot:DoubleEdgedSnakeSecondShot = ms_arrSagittariusShotVector.pop();
         if(null == stDoubleEdgedSnakeSecondShot)
         {
            stDoubleEdgedSnakeSecondShot = new DoubleEdgedSnakeSecondShot();
         }
         BattleFieldView.a_1017.play();
         return stDoubleEdgedSnakeSecondShot;
      }
      
      override protected function getBindMovie() : Class
      {
         return DoubleEdgedSnakeSecondShotMovie;
      }
      
      override public function a_1797(param1:int, param2:Number, param3:int, param4:int, param5:int, param6:BattleFieldView, param7:a_3491, param8:Boolean = false, param9:Number = 1, param10:int = 0) : Boolean
      {
         super.a_1797(param1,param2,param3,param4,param5,param6,param7,param8,param9,param10);
         m_isPenetrate = true;
         a_1275 = 0;
         a_1577 = false;
         return true;
      }
      
      override protected function a_3940() : Boolean
      {
         super.a_3940();
         ms_iCritFrameLable = 0;
         m_HitMouseArray = new Array();
         if(-1 == ms_arrSagittariusShotVector.indexOf(this))
         {
            ms_arrSagittariusShotVector.push(this);
         }
         return true;
      }
      
      override public function a_4216(iCurrentTime:int) : void
      {
         if(m_isHited && !m_isPenetrate)
         {
            nextFrame();
            if(a_1273 == a_1274 || a_1278 != null)
            {
               m_isHited = false;
               gotoAndStop((a_1276[a_1275] as FrameLabel).frame);
            }
            return;
         }
         if(a_1588)
         {
            nextFrame();
            if(a_1273 == a_1274 || a_1278 != null)
            {
               gotoAndStop((a_1276[a_1275] as FrameLabel).frame);
            }
         }
         if(0 == a_1447)
         {
            a_1447 = iCurrentTime;
         }
         a_4351();
         x += m_numXSpeed;
      }
      
      override protected function CalculationBoundary() : Boolean
      {
         if(x < 0 || x >= BattleFieldView.a_1013 || a_1576 && y > a_3491.a_1081 * (m_iYGridNo + 1))
         {
            m_bActive.Value = false;
            this.a_3940();
            return true;
         }
         return false;
      }
      
      override protected function CaclueHitMouse(stFieldGrid:a_3491, stMoveIntruder:a_4206) : Boolean
      {
         var rate:Number = NaN;
         if(!stMoveIntruder.isCannotSeeByFighter && (0 == stMoveIntruder.iSpaceState || 2 == stMoveIntruder.iSpaceState) && hitTestObject(stMoveIntruder))
         {
            if(Boolean(stMoveIntruder.iLifeValue > 0) && Boolean(stMoveIntruder.m_stCurrentFieldGrid) && m_HitMouseArray.indexOf(stMoveIntruder) == -1)
            {
               rate = stMoveIntruder.iLifeValue / stMoveIntruder.iInitialLifeValue;
               if(rate <= 0.25)
               {
                  this.AddkillEffect(stMoveIntruder);
                  m_HitMouseArray.push(stMoveIntruder);
                  if(stMoveIntruder.IsElite)
                  {
                     stMoveIntruder.a_3969(GetFinalDamage() * 10);
                  }
                  else
                  {
                     stMoveIntruder.a_3969(stMoveIntruder.iLifeValue);
                  }
               }
               else
               {
                  this.AddHurtEffect(stMoveIntruder);
                  m_HitMouseArray.push(stMoveIntruder);
                  this.a_4352(stMoveIntruder);
               }
               return true;
            }
         }
         return false;
      }
      
      public function AddHurtEffect(stMoveIntruder:a_4206) : void
      {
         var m_effect:a_4108 = null;
         if(stMoveIntruder.m_stCurrentFieldGrid != null && stMoveIntruder.iLifeValue > 0 && !stMoveIntruder.IsBossIntruder)
         {
            m_effect = DoubleEdgedSnakeSecondAffectedEffect.a_3926();
            DoubleEdgedSnakeSecondAffectedEffect(m_effect).m_targetField = stMoveIntruder.m_stCurrentFieldGrid;
            m_effect.a_1797(a_1283);
            m_effect.x = stMoveIntruder.x + 0.5 * stMoveIntruder.width + stMoveIntruder.stDisplayBitmap.x;
            m_effect.y = stMoveIntruder.y + 0.5 * stMoveIntruder.height + stMoveIntruder.stDisplayBitmap.y;
            stMoveIntruder.m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(m_effect,BattleLayerDefine.EFFECTS_TOP_TYPE,stMoveIntruder.m_stCurrentFieldGrid);
         }
      }
      
      public function AddkillEffect(stMoveIntruder:a_4206) : void
      {
         var m_effect:a_4108 = null;
         if(stMoveIntruder.m_stCurrentFieldGrid != null && stMoveIntruder.iLifeValue > 0 && !stMoveIntruder.IsBossIntruder)
         {
            m_effect = DoubleEdgedSnakeKillEffect.a_3926();
            DoubleEdgedSnakeKillEffect(m_effect).m_targetField = stMoveIntruder.m_stCurrentFieldGrid;
            m_effect.a_1797(a_1283);
            m_effect.x = stMoveIntruder.x + 0.5 * stMoveIntruder.width + stMoveIntruder.stDisplayBitmap.x;
            m_effect.y = stMoveIntruder.y + stMoveIntruder.stDisplayBitmap.y;
            stMoveIntruder.m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(m_effect,BattleLayerDefine.EFFECTS_TOP_TYPE,stMoveIntruder.m_stCurrentFieldGrid);
         }
      }
      
      override public function a_4352(baseMoveIntruder:a_4206) : Boolean
      {
         super.a_4352(baseMoveIntruder);
         return true;
      }
   }
}

