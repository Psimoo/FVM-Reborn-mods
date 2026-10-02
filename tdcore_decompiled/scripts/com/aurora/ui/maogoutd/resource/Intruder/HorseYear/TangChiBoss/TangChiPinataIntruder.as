package com.aurora.ui.maogoutd.resource.Intruder.HorseYear.TangChiBoss
{
   import a_4718.b_180;
   import a_4728.a_1778;
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.energy.a_4157;
   import com.aurora.ui.maogoutd.resource.energy.a_4162;
   import flash.display.FrameLabel;
   import flash.events.MouseEvent;
   import flash.utils.setTimeout;
   
   public class TangChiPinataIntruder extends a_4206
   {
      
      private static const MAX_LIFE:int = 90000;
      
      private static const MAX_INJURED_LIFE:int = 30000;
      
      private static const ONE_GRID_SPEED:int = 0;
      
      private var m_bUseSkill:Boolean = false;
      
      public function TangChiPinataIntruder()
      {
         super();
      }
      
      public static function a_3926() : TangChiPinataIntruder
      {
         return PoolManager.getInstance().CheckOutOne(TangChiPinataIntruder) as TangChiPinataIntruder;
      }
      
      override protected function getBindMovie() : Class
      {
         return TangChiPinataIntruderMovie;
      }
      
      override public function ShowBatDieEffect() : void
      {
      }
      
      override public function a_1797(iGlobalMoveFighterID:int, iIntruderMoveDirection:int) : Boolean
      {
         super.a_1797(iGlobalMoveFighterID,iIntruderMoveDirection);
         a_1350 = a_3491.a_1080 / (20 * ONE_GRID_SPEED);
         if(iIntruderMoveDirection < 0)
         {
            a_1350 *= -1;
         }
         a_1339 = MAX_LIFE;
         a_1279 = -width * 0.2 - 31;
         m_iYDisplayCenterPos = -38;
         a_1481 = false;
         a_1464 = true;
         a_1463 = true;
         a_1272 = 0;
         this.SetAnimationOnce2Loop(1,2,1,2);
         AddTag(5);
         this.m_bUseSkill = false;
         tagCom.AddTag(501);
         return true;
      }
      
      override public function PowerfulBombReduceLifeRate(fRate:Number = 0.3, bIsIgnoreArmor:Boolean = false) : Boolean
      {
         if(a_1339 <= 0)
         {
            return false;
         }
         if(bIsIgnoreArmor)
         {
            a_4209(BOOM_INJURE_LIFE * fRate);
         }
         else
         {
            a_3969(BOOM_INJURE_LIFE * fRate);
         }
         return true;
      }
      
      private function AddSkill() : void
      {
         if(this.m_bUseSkill == true)
         {
            return;
         }
         if(m_stCurrentFieldGrid == null)
         {
            return;
         }
         this.ProdudeEnergy();
         this.CardCoolDown();
      }
      
      private function ProdudeEnergy() : void
      {
         var stFreeEnergy:a_4157 = null;
         var stFieldGrid:a_3491 = m_stCurrentFieldGrid;
         for(var iIndex:int = -2; iIndex <= 2; iIndex++)
         {
            stFreeEnergy = a_4162.getInstance().a_4163(b_180.a_420);
            stFreeEnergy.m_stCurrentBattleField = stFieldGrid.m_stCurrentBattbleFieldView;
            stFreeEnergy.a_1797(0,20,x - 15 * iIndex,y);
            stFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(stFreeEnergy,BattleLayerDefine.EFFECTS_TOP_TYPE);
            setTimeout(this.onDispathEvent,500,stFreeEnergy);
         }
      }
      
      public function CardCoolDown() : void
      {
         var stMoveIntruder:a_4206 = null;
         var xIndex:int = 0;
         var tempFieldGrid:a_3491 = null;
         var stAurDataEvent:a_1778 = null;
         var stFieldGrid:a_3491 = m_stCurrentFieldGrid;
         var m_coolDownCard:Array = [];
         var xStart:int = stFieldGrid.m_iXGridNo - 1;
         var xEnd:int = stFieldGrid.m_iXGridNo + 1;
         var yStart:int = stFieldGrid.m_iYGridNo - 1;
         var yEnd:int = stFieldGrid.m_iYGridNo + 1;
         for(var yIndex:int = yStart; yIndex <= yEnd; yIndex++)
         {
            for(xIndex = xStart; xIndex <= xEnd; xIndex++)
            {
               tempFieldGrid = stFieldGrid.m_stCurrentBattbleFieldView.a_3438(xIndex,yIndex);
               if(tempFieldGrid != null)
               {
                  for each(stMoveIntruder in tempFieldGrid.a_1511.slice())
                  {
                     if(stMoveIntruder.m_stMoveIntruderTypeID != 134224562)
                     {
                        stMoveIntruder.ReduceLife2(4000,[112]);
                     }
                  }
                  if(tempFieldGrid.m_stProtector != null)
                  {
                     m_coolDownCard.push(tempFieldGrid.m_stProtector.a_3512());
                  }
                  if(tempFieldGrid.m_stAttackFighter != null)
                  {
                     m_coolDownCard.push(tempFieldGrid.m_stAttackFighter.a_3512());
                  }
                  if(tempFieldGrid.m_stTrayDefense != null)
                  {
                     m_coolDownCard.push(tempFieldGrid.m_stTrayDefense.a_3512());
                  }
                  if(tempFieldGrid.m_stBoomDefense != null)
                  {
                     m_coolDownCard.push(tempFieldGrid.m_stBoomDefense.a_3512());
                  }
                  if(tempFieldGrid.m_stFlowerDefense != null)
                  {
                     m_coolDownCard.push(tempFieldGrid.m_stFlowerDefense.a_3512());
                  }
                  if(tempFieldGrid.m_stBaseAuxiliaryFighter != null)
                  {
                     m_coolDownCard.push(tempFieldGrid.m_stBaseAuxiliaryFighter.a_3512());
                  }
               }
            }
         }
         if(stFieldGrid.m_stCurrentBattbleFieldView.isOwnBattleField && Boolean(root))
         {
            stAurDataEvent = new a_1778("GameCardCoolDown");
            stAurDataEvent.dataObject = [4294967290,m_coolDownCard,0];
            root.dispatchEvent(stAurDataEvent);
         }
      }
      
      private function onDispathEvent(stFreeEnergy:a_4157) : void
      {
         stFreeEnergy.dispatchEvent(new MouseEvent(MouseEvent.MOUSE_OVER));
      }
      
      override protected function a_3940() : Boolean
      {
         this.AddSkill();
         super.a_3940();
         return true;
      }
      
      override protected function ResetMovieStatus() : Boolean
      {
         if(a_1339 > 0)
         {
            if(a_1273 >= 12)
            {
               this.SetAnimation(2,3);
            }
         }
         else
         {
            this.SetAnimation(4,4);
            if(m_stCurrentFieldGrid)
            {
               m_stCurrentFieldGrid.a_3457(this);
               m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3457(this);
            }
            play();
         }
         return true;
      }
      
      override public function a_4216(iCurrentTime:int) : Boolean
      {
         var numOrigXPos:Number = x;
         super.a_4216(iCurrentTime);
         SetGameMapModePicnicPosition(numOrigXPos);
         return true;
      }
      
      public function InDamage() : Boolean
      {
         return a_1339 > 0 && a_1339 < MAX_INJURED_LIFE;
      }
      
      public function SetAnimation(animIdx:int, damageIdx:int) : void
      {
         if(this.InDamage())
         {
            animIdx = damageIdx;
         }
         if(a_1275 != animIdx)
         {
            a_1275 = animIdx;
            gotoAndStop((a_1276[animIdx] as FrameLabel).frame);
            a_3419();
         }
      }
      
      public function SetAnimationOnce2Loop(onceAnimIdx:int, loopAnimIdx:int, onceAnimIdx2:int, loopAnimIdx2:int) : void
      {
         if(this.InDamage())
         {
            onceAnimIdx += onceAnimIdx2;
            loopAnimIdx += loopAnimIdx2;
         }
         a_1275 = loopAnimIdx;
         gotoAndStop((a_1276[onceAnimIdx] as FrameLabel).frame);
         a_3419();
      }
      
      override public function a_4213() : Boolean
      {
         a_3969(a_1339);
         return true;
      }
      
      override public function a_4210() : Boolean
      {
         a_3969(a_1339);
         return true;
      }
      
      override public function a_4212() : Boolean
      {
         a_3969(900);
         return true;
      }
   }
}

