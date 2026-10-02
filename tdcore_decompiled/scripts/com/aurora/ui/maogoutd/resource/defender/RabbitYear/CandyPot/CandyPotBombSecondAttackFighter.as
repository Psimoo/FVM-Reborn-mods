package com.aurora.ui.maogoutd.resource.defender.RabbitYear.CandyPot
{
   import a_4754.a_2161;
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.defender.a_3960;
   import flash.display.FrameLabel;
   
   public class CandyPotBombSecondAttackFighter extends a_3960
   {
      
      private var m_AppearedTimes:int = 0;
      
      private var m_disappearFrame:int;
      
      private var stHurtPower:int;
      
      public function CandyPotBombSecondAttackFighter()
      {
         super();
         a_1095 = CandyPotBombDefine.DEFENSE_PRICE;
         a_1330 = 0;
         a_1333 = true;
         a_1337 = 5;
         a_1338 = 0;
      }
      
      public static function a_3926() : a_3960
      {
         return PoolManager.getInstance().CheckOutOne(CandyPotBombSecondAttackFighter) as CandyPotBombSecondAttackFighter;
      }
      
      override protected function getBindMovie() : Class
      {
         return CandyPotBombSecondAttackFighterMovie;
      }
      
      override public function a_1797(stFieldGrid:a_3491) : Boolean
      {
         var enterRoom:Object = null;
         super.a_1797(stFieldGrid);
         if(m_bServerIssued)
         {
            enterRoom = a_2161.e.getEnterRoom();
            m_iDefenseRandomSeed.setSeed(enterRoom.m_RandomSeed,m_iDefenseGlobalID);
            a_1339 = CandyPotBombDefine.MAX_LIFE_VALUE;
            this.m_AppearedTimes = -1;
            this.stHurtPower = CandyPotBombDefine.a_3965(a_1094);
         }
         return true;
      }
      
      override protected function a_3964() : int
      {
         return CandyPotBombDefine.a_3964(m_iSkillDegree);
      }
      
      override public function a_3961(iCurrentTime:int) : Boolean
      {
         var randomNum:int = 0;
         var FrameIndex:int = 0;
         super.a_3961(iCurrentTime);
         if(this.m_AppearedTimes == -1)
         {
            randomNum = m_iDefenseRandomSeed.nextInt(100) + 1;
            if(randomNum <= 20)
            {
               FrameIndex = 2;
            }
            else if(randomNum <= 50)
            {
               FrameIndex = 4;
            }
            else if(randomNum <= 75)
            {
               FrameIndex = 1;
            }
            else
            {
               FrameIndex = 3;
            }
            a_1275 = FrameIndex;
            this.m_AppearedTimes = iCurrentTime;
            this.m_disappearFrame = a_1275 + 1 >= a_1276.length ? a_1274 : int((a_1276[a_1275 + 1] as FrameLabel).frame - 1);
            gotoAndStop((a_1276[0] as FrameLabel).frame);
         }
         if((iCurrentTime & 1) == 0)
         {
            if(a_1273 == 15 || a_1273 == 54 || a_1273 == 93 || a_1273 == 113)
            {
               BattleFieldView.a_1048.play();
               a_1334.m_stCurrentBattbleFieldView.a_3466();
            }
            if(a_1273 == 16)
            {
               this.TatalRangeBoom(a_1334,1);
            }
            else if(a_1273 == 36 || a_1273 == 96)
            {
               this.TatalRangeBoom(a_1334,8);
            }
            else if(a_1273 == 56)
            {
               this.CrossRangeBoom(a_1334,1);
            }
            else if(a_1273 == 74 || a_1273 == 114)
            {
               this.addBoomEffect();
            }
         }
         if(a_1273 == this.m_disappearFrame)
         {
            super.a_3969(a_1339);
            this.a_3940();
         }
         return true;
      }
      
      private function addBoomEffect() : void
      {
         if(stFieldGrid == null)
         {
            return;
         }
         var stCandyPotBoomEffect:CandyPotBoomEffect = CandyPotBoomEffect.a_3926();
         stCandyPotBoomEffect.IsHasColumn = true;
         stCandyPotBoomEffect.a_1797(a_1334.m_iXGridNo,a_1334.m_iYGridNo,a_1334.m_stCurrentBattbleFieldView,this.OnCrossBoomLight);
      }
      
      private function OnCrossBoomLight(stFieldGrid:a_3491) : void
      {
         this.BoomDamage(stFieldGrid);
      }
      
      private function CrossRangeBoom(stFieldGrid:a_3491, range:int) : void
      {
         var stCurFieldGrid:a_3491 = null;
         if(stFieldGrid == null)
         {
            return;
         }
         var xStart:int = range < 0 ? 0 : int(Math.max(stFieldGrid.m_iXGridNo - range,0));
         var xEnd:int = range < 0 ? int(BattleFieldView.a_1011 - 1) : int(Math.min(stFieldGrid.m_iXGridNo + range,BattleFieldView.a_1011 - 1));
         var yStart:int = range < 0 ? 0 : int(Math.max(stFieldGrid.m_iYGridNo - range,0));
         var yEnd:int = range < 0 ? int(BattleFieldView.a_1012 - 1) : int(Math.min(stFieldGrid.m_iYGridNo + range,BattleFieldView.a_1012 - 1));
         for(var xIndex:int = xStart; xIndex <= xEnd; xIndex++)
         {
            stCurFieldGrid = stFieldGrid.m_stCurrentBattbleFieldView.a_3438(xIndex,stFieldGrid.m_iYGridNo);
            this.BoomDamage(stCurFieldGrid);
         }
         for(var yIndex:int = yStart; yIndex <= yEnd; yIndex++)
         {
            if(yIndex != stFieldGrid.m_iYGridNo)
            {
               stCurFieldGrid = stFieldGrid.m_stCurrentBattbleFieldView.a_3438(stFieldGrid.m_iXGridNo,yIndex);
               this.BoomDamage(stCurFieldGrid);
            }
         }
      }
      
      private function TatalRangeBoom(stFieldGrid:a_3491, range:int) : void
      {
         var xIndex:int = 0;
         var IntruderArray:Array = null;
         var iIndex:* = 0;
         var stMoveIntruder:a_4206 = null;
         if(stFieldGrid == null)
         {
            return;
         }
         var xStart:int = Math.max(stFieldGrid.m_iXGridNo - range,0);
         var xEnd:int = Math.min(stFieldGrid.m_iXGridNo + range,BattleFieldView.a_1011 - 1);
         var yStart:int = Math.max(stFieldGrid.m_iYGridNo - range,0);
         var yEnd:int = Math.min(stFieldGrid.m_iYGridNo + range,BattleFieldView.a_1012 - 1);
         var stFieldGridVector:Array = stFieldGrid.m_stCurrentBattbleFieldView.stFieldGridsVector;
         for(var yIndex:int = yStart; yIndex <= yEnd; yIndex++)
         {
            for(xIndex = xStart; xIndex <= xEnd; xIndex++)
            {
               IntruderArray = stFieldGridVector[yIndex][xIndex].a_1511;
               for(iIndex = int(IntruderArray.length - 1); iIndex >= 0; iIndex--)
               {
                  stMoveIntruder = IntruderArray[iIndex] as a_4206;
                  this.ApplyBoomDamage(stMoveIntruder);
               }
            }
         }
      }
      
      private function BoomDamage(stFieldGrid:a_3491) : void
      {
         var stMoveIntruder:a_4206 = null;
         if(stFieldGrid == null)
         {
            return;
         }
         var IntruderArray:Array = stFieldGrid.a_1511;
         for(var iIndex:* = int(IntruderArray.length - 1); iIndex >= 0; iIndex--)
         {
            stMoveIntruder = IntruderArray[iIndex] as a_4206;
            this.ApplyBoomDamage(stMoveIntruder);
         }
      }
      
      private function ApplyBoomDamage(stMoveIntruder:a_4206) : void
      {
         if(!stMoveIntruder.IsElite)
         {
            stMoveIntruder.a_4210();
         }
         else
         {
            stMoveIntruder.PowerfulBombReduceLifeRate(this.stHurtPower / 900,true);
         }
      }
      
      override public function a_3940() : Boolean
      {
         return super.a_3940();
      }
   }
}

