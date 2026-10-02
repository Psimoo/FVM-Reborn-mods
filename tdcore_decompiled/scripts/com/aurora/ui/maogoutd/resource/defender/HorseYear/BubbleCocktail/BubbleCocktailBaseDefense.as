package com.aurora.ui.maogoutd.resource.defender.HorseYear.BubbleCocktail
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.CharmBoomConfig;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.defender.HorseYear.BubbleCocktail.effect.BubbleCocktailBaseBoomEffectMovie;
   import com.aurora.ui.maogoutd.resource.defender.a_3953;
   import flash.display.FrameLabel;
   
   public class BubbleCocktailBaseDefense extends a_3953
   {
      
      private var stCharmMoveIntruder:a_4206;
      
      public function BubbleCocktailBaseDefense()
      {
         super();
         a_1095 = BubbleCocktailBombDefine.DEFENSE_PRICE;
         a_1308 = 0;
         a_1333 = true;
         a_1313 = true;
         a_1337 = 3;
      }
      
      public static function a_3926() : a_3953
      {
         return PoolManager.getInstance().CheckOutOne(BubbleCocktailBaseDefense) as BubbleCocktailBaseDefense;
      }
      
      override protected function getBindMovie() : Class
      {
         return BubbleCocktailBaseDefenseMovie;
      }
      
      override public function a_1797(stFieldGrid:a_3491) : Boolean
      {
         super.a_1797(stFieldGrid);
         if(m_bServerIssued)
         {
            this.stCharmMoveIntruder = null;
            a_1311 = BubbleCocktailBombDefine.a_3965(a_1094);
            canReceiveAttackBuff = false;
         }
         return true;
      }
      
      override public function a_3957(iCurrentTime:int) : void
      {
         if(iCurrentTime % 2 == 0)
         {
            super.a_3957(iCurrentTime);
         }
      }
      
      override protected function a_3964() : int
      {
         return BubbleCocktailBombDefine.a_3964(m_iSkillDegree);
      }
      
      override public function a_3969(iRduceLifeValue:int) : Boolean
      {
         if(a_1339 - iRduceLifeValue <= 0)
         {
            if(m_iDieType == 1)
            {
               if(a_1275 != 1)
               {
                  a_1275 = 1;
                  gotoAndStop((a_1276[a_1275] as FrameLabel).frame);
               }
            }
            else
            {
               super.a_3969(iRduceLifeValue);
            }
         }
         else
         {
            super.a_3969(iRduceLifeValue);
         }
         return true;
      }
      
      override public function a_3954(iCurrentTime:int) : Boolean
      {
         var xStart:int = 0;
         var xEnd:int = 0;
         var yStart:int = 0;
         var yEnd:int = 0;
         var stFieldGridVector:Array = null;
         var yIndex:int = 0;
         var xIndex:int = 0;
         var arrMoveIntruder:Array = null;
         var stMoveIntruder:a_4206 = null;
         if((iCurrentTime & 1) != 0)
         {
            return false;
         }
         if(a_1273 == a_1274 - 9)
         {
            BattleFieldView.a_1048.play();
            a_1334.m_stCurrentBattbleFieldView.a_3466();
            xStart = Math.max(a_1334.m_iXGridNo - 0,0);
            xEnd = Math.min(a_1334.m_iXGridNo + 1,BattleFieldView.a_1011 - 1);
            yStart = Math.max(a_1334.m_iYGridNo - 0,0);
            yEnd = Math.min(a_1334.m_iYGridNo + 0,BattleFieldView.a_1012 - 1);
            stFieldGridVector = a_1334.m_stCurrentBattbleFieldView.stFieldGridsVector;
            for(yIndex = yStart; yIndex <= yEnd; yIndex++)
            {
               for(xIndex = xStart; xIndex <= xEnd; xIndex++)
               {
                  arrMoveIntruder = stFieldGridVector[yIndex][xIndex].a_1511.slice();
                  for each(stMoveIntruder in arrMoveIntruder)
                  {
                     if(this.stCharmMoveIntruder == null && stMoveIntruder.isEatingDefense && 0 == stMoveIntruder.iSpaceState && stMoveIntruder.CanCharm && !stMoveIntruder.IsCharmed)
                     {
                        this.stCharmMoveIntruder = stMoveIntruder;
                     }
                     if(stMoveIntruder != this.stCharmMoveIntruder)
                     {
                        stMoveIntruder.a_4210();
                     }
                  }
               }
            }
            if(null != this.stCharmMoveIntruder)
            {
               this.stCharmMoveIntruder.ApplyCharmConfig(CharmBoomConfig.Create(a_3512(),1,a_1311,0,0,BubbleCocktailBaseBoomEffectMovie));
            }
         }
         if(a_1273 == a_1274 - 1)
         {
            super.a_3969(a_1339);
         }
         return true;
      }
      
      override public function a_3940() : Boolean
      {
         return super.a_3940();
      }
   }
}

