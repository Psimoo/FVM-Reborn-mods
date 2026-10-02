package com.aurora.ui.maogoutd.resource.Intruder
{
   import a_4718.b_182;
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.defender.a_3962;
   import com.aurora.ui.maogoutd.resource.effect.a_4108;
   import com.aurora.ui.maogoutd.resource.shot.MouseSnailKetchupShot;
   import flash.display.FrameLabel;
   
   public class DeepSeaSnailMoveIntruder extends a_4206
   {
      
      private var m_iStartTime:uint = 0;
      
      public function DeepSeaSnailMoveIntruder()
      {
         super();
         a_1464 = true;
         a_1481 = false;
      }
      
      public static function a_3926() : a_4206
      {
         return PoolManager.getInstance().CheckOutOne(DeepSeaSnailMoveIntruder) as DeepSeaSnailMoveIntruder;
      }
      
      override protected function getBindMovie() : Class
      {
         return DeepSeaSnailMoveIntruderMovie;
      }
      
      override public function a_1797(iGlobalMoveFighterID:int, iIntruderMoveDirection:int) : Boolean
      {
         super.a_1797(iGlobalMoveFighterID,iIntruderMoveDirection);
         a_1350 = a_3491.a_1080 / 60;
         if(iIntruderMoveDirection < 0)
         {
            a_1350 *= -1;
         }
         a_1339 = 1800;
         a_1279 = -width * 0.5;
         this.m_iStartTime = 0;
         return true;
      }
      
      override protected function ResetMovieStatus() : Boolean
      {
         if(a_1339 > 50)
         {
            a_3419();
         }
         else if(a_1339 > 0)
         {
            a_3419();
         }
         else if(a_1339 <= 0 && a_1275 != 2)
         {
            a_1275 = 2;
            gotoAndStop((a_1276[2] as FrameLabel).frame);
            a_3419();
            if(null != m_stCurrentFieldGrid)
            {
               m_stCurrentFieldGrid.a_3457(this);
               m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3457(this);
            }
            play();
         }
         return true;
      }
      
      override public function a_3969(iRduceLifeValue:int) : Boolean
      {
         super.a_3969(iRduceLifeValue);
         if(a_1339 == 50)
         {
            a_3419();
         }
         else if(a_1339 <= 0 && a_1275 != 2)
         {
            a_1275 = 2;
            gotoAndStop((a_1276[2] as FrameLabel).frame);
            a_3419();
            if(null != m_stCurrentFieldGrid)
            {
               m_stCurrentFieldGrid.a_3457(this);
               m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3457(this);
            }
            play();
         }
         return true;
      }
      
      override public function a_4210() : Boolean
      {
         this.a_3969(900);
         if(a_1339 <= 0)
         {
            if(m_stCurrentFieldGrid)
            {
               m_stCurrentFieldGrid.a_3457(this);
               m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3457(this);
            }
            a_3940();
         }
         return true;
      }
      
      override public function a_4211(iCutLifeValue:int) : Boolean
      {
         if(iCutLifeValue > 200)
         {
            iCutLifeValue = 200;
         }
         this.a_3969(iCutLifeValue);
         if(a_1339 <= 0)
         {
            if(m_stCurrentFieldGrid)
            {
               m_stCurrentFieldGrid.a_3457(this);
               m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3457(this);
            }
            a_3940();
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
      
      override public function a_4213() : Boolean
      {
         this.a_3969(900);
         return true;
      }
      
      override public function a_4215(stBaseDefense:a_3962) : Boolean
      {
         super.a_4215(stBaseDefense);
         return true;
      }
      
      override public function a_4216(iCurrentTime:int) : Boolean
      {
         var stLastWaitShot:MouseSnailKetchupShot = null;
         var numShotXPos:Number = NaN;
         var numShotYPos:Number = NaN;
         super.a_4216(iCurrentTime);
         var iXGridNo:int = int(x / a_3491.a_1080);
         if(a_1283)
         {
            iXGridNo = BattleFieldView.a_1011 - 1 - iXGridNo;
         }
         if(0 == this.m_iStartTime)
         {
            this.m_iStartTime = iCurrentTime;
         }
         var iShotHurtForEach:int = 0;
         var iShotMoveSpeed:int = 0;
         if(iCurrentTime - this.m_iStartTime > 30 && (iCurrentTime - this.m_iStartTime - 30) % 60 == 0)
         {
            stLastWaitShot = MouseSnailKetchupShot.a_4344() as MouseSnailKetchupShot;
            if(null == stLastWaitShot)
            {
               return false;
            }
            numShotXPos = 0.5 * width;
            if(a_1283)
            {
               numShotXPos = -numShotXPos;
            }
            numShotXPos = x + numShotXPos;
            numShotYPos = y + 0.9 * width;
            stLastWaitShot.a_1797(0,iShotMoveSpeed,iShotHurtForEach,numShotXPos,numShotYPos,m_stCurrentFieldGrid.m_stCurrentBattbleFieldView,m_stCurrentFieldGrid);
            parent.addChild(stLastWaitShot);
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
   }
}

