package com.aurora.ui.maogoutd.resource.Intruder.WonderLand.GodmotherMouse
{
   import a_4718.b_182;
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.defender.a_3962;
   import com.aurora.ui.maogoutd.resource.effect.a_4108;
   import flash.display.FrameLabel;
   
   public class GodmotherMouseMoveIntruder extends a_4206
   {
      
      private var m_hasFog:Boolean;
      
      private const FULL_HP:int = 1800;
      
      private const HURT_HP:int = 900;
      
      public function GodmotherMouseMoveIntruder()
      {
         super();
         a_1481 = false;
      }
      
      public static function a_3926() : a_4206
      {
         return PoolManager.getInstance().CheckOutOne(GodmotherMouseMoveIntruder) as GodmotherMouseMoveIntruder;
      }
      
      override protected function getBindMovie() : Class
      {
         return GodmotherMouseMoveIntruderMovie;
      }
      
      override public function a_1797(iGlobalMoveFighterID:int, iIntruderMoveDirection:int) : Boolean
      {
         super.a_1797(iGlobalMoveFighterID,iIntruderMoveDirection);
         a_1350 = a_3491.a_1080 / (3 * 20);
         if(iIntruderMoveDirection < 0)
         {
            a_1350 *= -1;
         }
         a_1464 = false;
         a_1339 = this.FULL_HP;
         a_1279 = -width * 0.5;
         a_1462 = false;
         this.m_hasFog = true;
         return true;
      }
      
      override protected function ResetMovieStatus() : Boolean
      {
         var LabelIndex:int = 0;
         if(a_1339 > this.HURT_HP)
         {
            if(a_1475)
            {
               LabelIndex = this.m_hasFog ? 6 : 4;
               if(a_1275 != LabelIndex)
               {
                  a_1275 = LabelIndex;
                  gotoAndStop((a_1276[LabelIndex] as FrameLabel).frame);
               }
            }
            else
            {
               LabelIndex = this.m_hasFog ? 2 : 0;
               if(a_1275 != LabelIndex)
               {
                  a_1275 = LabelIndex;
                  gotoAndStop((a_1276[LabelIndex] as FrameLabel).frame);
               }
            }
            a_3419();
         }
         else if(a_1339 > 0)
         {
            if(a_1475)
            {
               LabelIndex = this.m_hasFog ? 7 : 5;
               if(a_1275 != LabelIndex)
               {
                  a_1275 = LabelIndex;
                  gotoAndStop((a_1276[LabelIndex] as FrameLabel).frame);
               }
            }
            else
            {
               LabelIndex = this.m_hasFog ? 3 : 1;
               if(a_1275 != LabelIndex)
               {
                  a_1275 = LabelIndex;
                  gotoAndStop((a_1276[LabelIndex] as FrameLabel).frame);
               }
            }
            a_3419();
         }
         else if(a_1339 <= 0 && a_1275 != 8)
         {
            a_1275 = 8;
            gotoAndStop((a_1276[8] as FrameLabel).frame);
            a_3419();
            if(m_stCurrentFieldGrid)
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
         if(!this.m_hasFog)
         {
            super.a_3969(iRduceLifeValue);
         }
         return true;
      }
      
      override public function a_4209(iRduceLifeValue:int) : Boolean
      {
         if(!this.m_hasFog)
         {
            super.a_4209(iRduceLifeValue);
         }
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
      
      override public function a_4140(iCurrentTime:int) : void
      {
         super.a_4140(iCurrentTime);
      }
      
      override public function a_4216(iCurrentTime:int) : Boolean
      {
         var stFieldGridVector:Array = null;
         var yStart:int = 0;
         var xStart:int = 0;
         var yEnd:int = 0;
         var xEnd:int = 0;
         var indexY:int = 0;
         var indexX:int = 0;
         if(!a_1460)
         {
            a_1460 = true;
            this.m_hasFog = true;
            this.ResetMovieStatus();
         }
         super.a_4216(iCurrentTime);
         var bIsContinueFind:Boolean = false;
         if(m_stCurrentFieldGrid)
         {
            stFieldGridVector = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.stFieldGridsVector;
            yStart = m_stCurrentFieldGrid.m_iYGridNo - 1 < 0 ? 0 : int(m_stCurrentFieldGrid.m_iYGridNo - 1);
            xStart = m_stCurrentFieldGrid.m_iXGridNo - 1 < 0 ? 0 : int(m_stCurrentFieldGrid.m_iXGridNo - 1);
            yEnd = m_stCurrentFieldGrid.m_iYGridNo + 1 >= BattleFieldView.a_1012 ? int(BattleFieldView.a_1012 - 1) : int(m_stCurrentFieldGrid.m_iYGridNo + 1);
            xEnd = m_stCurrentFieldGrid.m_iXGridNo + 1 >= BattleFieldView.a_1011 ? int(BattleFieldView.a_1011 - 1) : int(m_stCurrentFieldGrid.m_iXGridNo + 1);
            for(indexY = yStart; indexY <= yEnd; indexY++)
            {
               for(indexX = xStart; indexX <= xEnd; indexX++)
               {
                  if(Boolean(stFieldGridVector[indexY][indexX].m_stFlowerDefense) && stFieldGridVector[indexY][indexX].m_stFlowerDefense.iEnergyTypeID == 1)
                  {
                     bIsContinueFind = true;
                     break;
                  }
               }
            }
            if(!bIsContinueFind)
            {
               for(indexY = 0; indexY < BattleFieldView.a_1012; indexY++)
               {
                  for(indexX = 0; indexX < BattleFieldView.a_1011; indexX++)
                  {
                     if(Boolean(stFieldGridVector[indexY][indexX].m_stFlowerDefense) && stFieldGridVector[indexY][indexX].m_stFlowerDefense.iEnergyTypeID == 3)
                     {
                        bIsContinueFind = true;
                        break;
                     }
                  }
               }
            }
            this.m_hasFog = !bIsContinueFind;
            this.ResetMovieStatus();
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

