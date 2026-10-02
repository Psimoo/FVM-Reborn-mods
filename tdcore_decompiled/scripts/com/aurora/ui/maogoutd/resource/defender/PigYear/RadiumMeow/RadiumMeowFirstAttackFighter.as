package com.aurora.ui.maogoutd.resource.defender.PigYear.RadiumMeow
{
   import a_4718.b_182;
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.defender.a_3953;
   import flash.display.FrameLabel;
   
   public class RadiumMeowFirstAttackFighter extends a_3953
   {
      
      private var m_isShoted:Boolean;
      
      private var m_arrRadiumMeowBaseShotArray:Array = [];
      
      public function RadiumMeowFirstAttackFighter()
      {
         super();
         a_1309 = 60;
         a_1312 = 0;
         a_1095 = RadiumMeowDefence.DEFENSE_PRICE;
         a_1310 = 8;
         a_1333 = true;
      }
      
      public static function a_3926() : a_3953
      {
         return PoolManager.getInstance().CheckOutOne(RadiumMeowFirstAttackFighter) as RadiumMeowFirstAttackFighter;
      }
      
      override protected function getBindMovie() : Class
      {
         return RadiumMeowFirstAttackFighterMovie;
      }
      
      override public function a_1797(stFieldGrid:a_3491) : Boolean
      {
         a_1310 = 12;
         super.a_1797(stFieldGrid);
         a_1311 = RadiumMeowDefence.a_3965(a_1094);
         a_1309 = 60;
         a_1339 = RadiumMeowDefence.LIFE_VALUE;
         this.m_isShoted = false;
         a_1313 = true;
         return true;
      }
      
      override public function a_3954(iCurrentTime:int) : Boolean
      {
         var stLastWaitShot:RadiumMeowBaseShot = null;
         var numShotXpos:Number = NaN;
         var stStartField:a_3491 = null;
         var yIndex:int = 0;
         var xIndex:int = 0;
         var arrMoveIntruder:Array = null;
         var stMoveIntruder:a_4206 = null;
         var stFieldGridVector:Array = a_1334.m_stCurrentBattbleFieldView.stFieldGridsVector;
         var yStart:int = a_1334.m_iYGridNo - 1 < 0 ? 0 : int(a_1334.m_iYGridNo - 1);
         var xStart:int = a_1334.m_iXGridNo - 1 < 0 ? 0 : int(a_1334.m_iXGridNo - 1);
         var yEnd:int = a_1334.m_iYGridNo + 1 >= BattleFieldView.a_1012 ? int(BattleFieldView.a_1012 - 1) : int(a_1334.m_iYGridNo + 1);
         var xEnd:int = a_1334.m_iXGridNo + 1 >= BattleFieldView.a_1011 ? int(BattleFieldView.a_1011 - 1) : int(a_1334.m_iXGridNo + 1);
         if(iCurrentTime - m_iPlaceTimeIntervals - a_1308 > RadiumMeowDefence.a_3966(m_iSkillDegree))
         {
            this.a_3969(a_1339);
         }
         if(iCurrentTime > m_iPlaceTimeIntervals + a_1308 && !this.m_isShoted && a_1334 != null)
         {
            gotoAndStop((a_1276[1] as FrameLabel).frame);
            this.m_isShoted = true;
            a_1321 = iCurrentTime;
            a_1323 = 1;
            stLastWaitShot = RadiumMeowBaseShot.GetFreeShot1() as RadiumMeowBaseShot;
            if(null == stLastWaitShot)
            {
               return false;
            }
            this.m_arrRadiumMeowBaseShotArray.push(stLastWaitShot);
            stLastWaitShot.iShotSequenceNum = a_1323;
            stLastWaitShot.a_1797(0,a_1312,a_1311,x,y,a_1334.m_stCurrentBattbleFieldView,a_1334);
            parent.addChildAt(stLastWaitShot,a_1334.m_stCurrentBattbleFieldView.a_3433());
            stLastWaitShot.x = a_1334.m_iXGridNo * a_3491.a_1080 + 0.5 * (a_3491.a_1080 - stLastWaitShot.width) - 5;
            stLastWaitShot.y = a_1334.m_iYGridNo * a_3491.a_1081 + 0.5 * (a_3491.a_1081 - stLastWaitShot.height - 110) + 68;
            a_1307 = a_1273;
         }
         if(this.m_isShoted)
         {
            if(iCurrentTime % 20 == 0)
            {
               for(yIndex = yStart; yIndex <= yEnd; yIndex++)
               {
                  for(xIndex = xStart; xIndex <= xEnd; xIndex++)
                  {
                     arrMoveIntruder = stFieldGridVector[yIndex][xIndex].a_1511.slice();
                     for each(stMoveIntruder in arrMoveIntruder)
                     {
                        if(!(0 == stMoveIntruder.iSpaceState && stMoveIntruder.isCannotSeeByFighter))
                        {
                           stMoveIntruder.a_4209(a_1311);
                           if(Math.random() * 100 <= 15)
                           {
                              stMoveIntruder.a_4208(b_182.enm_shotEffectXuanYun,30);
                           }
                        }
                     }
                  }
               }
            }
         }
         return true;
      }
      
      override protected function a_3964() : int
      {
         return RadiumMeowDefence.a_3964(m_iSkillDegree);
      }
      
      override public function a_3969(iRduceLifeValue:int) : Boolean
      {
         super.a_3969(iRduceLifeValue);
         return true;
      }
      
      override public function a_3957(iCurrentTime:int) : void
      {
         if(iCurrentTime % 2 == 0)
         {
            super.a_3957(iCurrentTime);
         }
      }
      
      override public function a_3940() : Boolean
      {
         var stRadiumMeowFirstAttackFighterShot:RadiumMeowBaseShot = null;
         super.a_3940();
         for each(stRadiumMeowFirstAttackFighterShot in this.m_arrRadiumMeowBaseShotArray)
         {
            stRadiumMeowFirstAttackFighterShot.m_isParentAttackDie = true;
         }
         this.m_arrRadiumMeowBaseShotArray = [];
         return true;
      }
      
      override protected function a_3955() : Number
      {
         return width * 0.9;
      }
      
      override protected function a_3956() : Number
      {
         return -0.1 * height;
      }
   }
}

