package com.aurora.ui.maogoutd.resource.gamemap.newMap.SnakeYear.WorldBoss
{
   import a_4718.b_182;
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.defender.a_3962;
   import com.aurora.ui.maogoutd.resource.effect.a_4108;
   import flash.display.FrameLabel;
   
   public class FastFoodSolider1MoveIntruder extends a_4206
   {
      
      private var MAX_INJURED_LIFE:int = 1;
      
      private var m_iNoY:int = -1;
      
      public function FastFoodSolider1MoveIntruder()
      {
         super();
      }
      
      public static function a_3926() : FastFoodSolider1MoveIntruder
      {
         return PoolManager.getInstance().CheckOutOne(FastFoodSolider1MoveIntruder) as FastFoodSolider1MoveIntruder;
      }
      
      override protected function getBindMovie() : Class
      {
         return FastFoodSolider1MoveIntruderMovie;
      }
      
      override public function a_1797(iGlobalMoveFighterID:int, iIntruderMoveDirection:int) : Boolean
      {
         super.a_1797(iGlobalMoveFighterID,iIntruderMoveDirection);
         a_1350 = 0;
         if(iIntruderMoveDirection < 0)
         {
            a_1350 *= -1;
         }
         a_1339 = 1;
         this.MAX_INJURED_LIFE = 1;
         a_1279 = 0;
         m_iYDisplayCenterPos = -5;
         a_1272 = 0;
         a_1481 = false;
         a_1464 = true;
         a_1463 = true;
         BoomIsReduceLife = true;
         a_1339 = 100000;
         this.MAX_INJURED_LIFE = a_1339 * 0.3;
         this.SetAnimationOnce2Loop2(0,1);
         this.m_iNoY = -1;
         tagCom.AddTag(40003);
         return true;
      }
      
      override protected function ResetMovieStatus() : Boolean
      {
         if(a_1339 > this.MAX_INJURED_LIFE)
         {
            if(a_1275 != 1)
            {
               a_1275 = 1;
               gotoAndStop((a_1276[1] as FrameLabel).frame);
            }
            a_3419();
         }
         else if(a_1339 > 0)
         {
            if(a_1275 != 2)
            {
               a_1275 = 2;
               gotoAndStop((a_1276[2] as FrameLabel).frame);
            }
            a_3419();
         }
         else if(a_1339 <= 0 && a_1275 != 3)
         {
            a_1275 = 3;
            gotoAndStop((a_1276[3] as FrameLabel).frame);
            a_3419();
            if(m_stCurrentFieldGrid)
            {
               m_stCurrentFieldGrid.a_3457(this);
               m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3457(this);
            }
            this.play();
         }
         return true;
      }
      
      override public function a_4208(iEffectType:int, iEffectTime:int, stBaseEffect:a_4108 = null) : void
      {
         if(b_182.a_432 == iEffectType)
         {
            super.a_4208(iEffectType,iEffectTime,stBaseEffect);
         }
      }
      
      override public function a_4213() : Boolean
      {
         this.a_3969(900);
         if(a_1339 <= 0)
         {
            this.a_4212();
         }
         return true;
      }
      
      override public function a_4212() : Boolean
      {
         if(m_stCurrentFieldGrid)
         {
            this.a_3969(900);
         }
         else
         {
            a_1339 = 0;
            a_3940();
         }
         return true;
      }
      
      override public function a_3969(iRduceLifeValue:int) : Boolean
      {
         super.a_3969(iRduceLifeValue);
         return true;
      }
      
      override public function a_4215(stBaseDefense:a_3962) : Boolean
      {
         super.a_4215(stBaseDefense);
         return true;
      }
      
      override public function a_4216(iCurrentTime:int) : Boolean
      {
         var stNextFieldGrid:a_3491 = null;
         if(!a_1460)
         {
            a_1460 = true;
         }
         if(null == m_stCurrentFieldGrid)
         {
            return false;
         }
         var iXGridNo:int = int(x / a_3491.a_1080);
         var iYGridNo:int = int(y / a_3491.a_1080);
         if(this.m_iNoY == -1)
         {
            this.m_iNoY = iYGridNo;
         }
         if(iYGridNo != this.m_iNoY)
         {
            m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.addChildAt(this,m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3440(iYGridNo));
         }
         if(m_stCurrentFieldGrid.m_iXGridNo != iXGridNo || m_stCurrentFieldGrid.m_iYGridNo != iYGridNo)
         {
            stNextFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(iXGridNo,iYGridNo);
            ChangeFieldGrid(stNextFieldGrid);
         }
         if(m_stMianYiEffect != null)
         {
            m_stMianYiEffect.x = x + 0.5 * (width - m_stMianYiEffect.width) + stDisplayBitmap.x - 20;
            m_stMianYiEffect.y = y + m_stMianYiEffect.height + stDisplayBitmap.y - 50;
         }
         if(m_stShanDianEffect != null)
         {
            m_stShanDianEffect.x = x + 0.5 * (width - m_stShanDianEffect.width) + stDisplayBitmap.x - 20;
            m_stShanDianEffect.y = y + 0.5 * (height - m_stShanDianEffect.height) + stDisplayBitmap.y;
         }
         if(m_stPoisonGasEffect != null)
         {
            m_stPoisonGasEffect.x = x + 0.5 * width + stDisplayBitmap.x;
            m_stPoisonGasEffect.y = y + stDisplayBitmap.y;
         }
         if(m_stSnakePoisonEffect != null)
         {
            m_stSnakePoisonEffect.x = x + 0.5 * width + stDisplayBitmap.x;
            m_stSnakePoisonEffect.y = y + stDisplayBitmap.y;
         }
         return true;
      }
      
      override public function play() : void
      {
         super.play();
      }
      
      public function SetAnimationOnce2Loop2(onceAnimIdx:int, loopAnimIdx:int) : void
      {
         a_1275 = loopAnimIdx;
         gotoAndStop((a_1276[onceAnimIdx] as FrameLabel).frame);
         a_3419();
      }
   }
}

