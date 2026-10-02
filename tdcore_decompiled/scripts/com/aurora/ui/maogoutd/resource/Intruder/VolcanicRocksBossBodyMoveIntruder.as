package com.aurora.ui.maogoutd.resource.Intruder
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.avatar.a_3924;
   import com.aurora.ui.maogoutd.resource.defender.a_3962;
   import com.aurora.ui.maogoutd.resource.effect.a_4108;
   import flash.display.FrameLabel;
   
   public class VolcanicRocksBossBodyMoveIntruder extends a_4206
   {
      
      private var m_iStartTimeNum:int;
      
      private var m_isDropHited:Boolean;
      
      private var m_numTargetYPos:Number;
      
      public var m_isGoAhead:Boolean;
      
      protected var m_stPosFieldGrid:a_3491;
      
      public function VolcanicRocksBossBodyMoveIntruder()
      {
         super();
         a_1481 = false;
      }
      
      public static function a_3926() : a_4206
      {
         return PoolManager.getInstance().CheckOutOne(VolcanicRocksBossBodyMoveIntruder) as VolcanicRocksBossBodyMoveIntruder;
      }
      
      override protected function getBindMovie() : Class
      {
         return VolcanicRocksBossBodyMoveIntruderMovie;
      }
      
      override public function a_1797(iGlobalMoveFighterID:int, iIntruderMoveDirection:int) : Boolean
      {
         super.a_1797(iGlobalMoveFighterID,iIntruderMoveDirection);
         a_1350 = a_3491.a_1080 / 80;
         if(iIntruderMoveDirection < 0)
         {
            a_1350 *= -1;
         }
         a_1339 = 1800;
         a_1377 = 900;
         a_1279 = -width * 0.5;
         a_1272 = 0;
         a_1463 = true;
         this.m_isGoAhead = false;
         this.m_isDropHited = false;
         return true;
      }
      
      override protected function ResetMovieStatus() : Boolean
      {
         a_3419();
         return true;
      }
      
      override public function a_3969(iRduceLifeValue:int) : Boolean
      {
         super.a_3969(iRduceLifeValue);
         a_3419();
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
         if(Boolean(m_stCurrentFieldGrid) && a_1339 > 0)
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
         if(!(stBaseDefense is a_3924))
         {
            super.a_4215(stBaseDefense);
         }
         return true;
      }
      
      override public function a_4216(iCurrentTime:int) : Boolean
      {
         if(!a_1460)
         {
            this.m_iStartTimeNum = iCurrentTime;
            a_1460 = true;
            this.m_stPosFieldGrid = m_stCurrentFieldGrid;
            this.m_numTargetYPos = y;
            if(this.m_isGoAhead)
            {
               a_1275 = 2;
               gotoAndStop((a_1276[2] as FrameLabel).frame + int(Math.random() * 8));
            }
            else
            {
               a_1275 = 0;
               gotoAndStop((a_1276[0] as FrameLabel).frame);
            }
         }
         if(this.m_isGoAhead)
         {
            if(m_stCurrentFieldGrid.m_stAttackFighter is a_3924)
            {
               a_1464 = true;
            }
            else
            {
               a_1464 = false;
            }
            super.a_4216(iCurrentTime);
            if(a_1273 == a_1274)
            {
               gotoAndStop((a_1276[2] as FrameLabel).frame);
            }
            if(iCurrentTime - this.m_iStartTimeNum > 300)
            {
               this.a_3969(iLifeValue);
               this.a_4212();
            }
         }
         return true;
      }
      
      override public function a_4208(iEffectType:int, iEffectTime:int, stBaseEffect:a_4108 = null) : void
      {
      }
      
      public function DropHited() : void
      {
         if(!this.m_isDropHited && Boolean(m_stCurrentFieldGrid))
         {
            this.m_isDropHited = true;
            a_1275 = 0;
            gotoAndStop((a_1276[1] as FrameLabel).frame);
            BattleFieldView.a_1048.play();
            m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3466();
         }
      }
   }
}

