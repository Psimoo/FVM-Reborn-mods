package com.aurora.ui.maogoutd.resource.defender.fusionCard.SmellSquid
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.defender.a_3953;
   import com.aurora.ui.maogoutd.resource.shot.a_4348;
   import flash.display.FrameLabel;
   
   public class SmellSquidDeepAttackFighter extends a_3953
   {
      
      public function SmellSquidDeepAttackFighter()
      {
         super();
         a_1095 = SmellSquidDefine.DEFENSE_PRICE;
         a_1313 = true;
         a_1310 = 14;
         a_1317 = 2;
         m_iYDisplayCenterPos = 0;
         a_1333 = true;
         a_1309 = SmellSquidDefine.a_3966(m_iSkillDegree);
         a_1311 = SmellSquidDefine.a_3965(a_1094) + SmellSquidDefine.GetCardGradeDegreeEffectValue(m_iGradeDegree);
      }
      
      public static function a_3926() : a_3953
      {
         return PoolManager.getInstance().CheckOutOne(SmellSquidDeepAttackFighter,SmellSquidDeepAttackFighterMovie) as SmellSquidDeepAttackFighter;
      }
      
      override public function a_1797(stFieldGrid:a_3491) : Boolean
      {
         super.a_1797(stFieldGrid);
         a_1309 = SmellSquidDefine.a_3966(m_iSkillDegree);
         a_1311 = SmellSquidDefine.a_3965(a_1094) + SmellSquidDefine.GetCardGradeDegreeEffectValue(m_iGradeDegree);
         if(a_1336 != null)
         {
            a_1336.x += 4;
         }
         return true;
      }
      
      override protected function a_3964() : int
      {
         return SmellSquidDefine.a_3964(m_iSkillDegree);
      }
      
      override public function a_3954(iCurrentTime:int) : Boolean
      {
         var stLastWaitShot:a_4348 = null;
         var numShotXpos:Number = NaN;
         var i:int = 0;
         if(iCurrentTime > m_iPlaceTimeIntervals + a_1308 && iCurrentTime >= a_1321 + a_1309)
         {
            if(SmellSquidDefine.GetFieldIntruderNumForFiveDirection(a_1334) <= 0)
            {
               return true;
            }
            while(a_1324.length > 0)
            {
               stLastWaitShot = a_1324.pop();
               stLastWaitShot.a_4350();
            }
            a_1321 = iCurrentTime;
            a_1323 = 0;
            a_1307 = 12;
            a_1275 = 0;
            gotoAndStop((a_1276[1] as FrameLabel).frame);
         }
         if(iCurrentTime - a_1321 == a_1310 + a_1317 * a_1323 && a_1323 < 3)
         {
            if(a_1334.m_iXGridNo < BattleFieldView.a_1011 - 1)
            {
               this.AddMyShot(3);
            }
            if(a_1334.m_iXGridNo > 0)
            {
               this.AddMyShot(4);
            }
            if(a_1323 < 2)
            {
               if(a_1334.m_iYGridNo > 0 && a_1334.m_iXGridNo > 0)
               {
                  this.AddMyShot(8);
               }
               if(a_1334.m_iYGridNo < BattleFieldView.a_1012 - 1 && a_1334.m_iXGridNo > 0)
               {
                  this.AddMyShot(6);
               }
               if(a_1334.m_iYGridNo < BattleFieldView.a_1012 - 1)
               {
                  this.AddMyShot(2);
               }
               if(a_1334.m_iYGridNo < BattleFieldView.a_1012 - 1 && a_1334.m_iXGridNo < BattleFieldView.a_1011 - 1)
               {
                  this.AddMyShot(7);
               }
               if(a_1334.m_iYGridNo > 0 && a_1334.m_iXGridNo < BattleFieldView.a_1011 - 1)
               {
                  this.AddMyShot(5);
               }
               if(a_1334.m_iYGridNo > 0)
               {
                  this.AddMyShot(1);
               }
            }
            ++a_1323;
         }
         return true;
      }
      
      private function AddMyShot(m_isSpecial:int) : void
      {
         var stLastWaitShot:SmellSquidSoulShot = SmellSquidSoulShot.a_4344();
         stLastWaitShot.m_isSpecial = m_isSpecial;
         stLastWaitShot.m_iSuperShotType = 1;
         stLastWaitShot.a_1797(0,a_1312,a_1311,x + 37,y + 62,a_1334.m_stCurrentBattbleFieldView,a_1334);
         parent.addChildAt(stLastWaitShot,a_1334.m_stCurrentBattbleFieldView.a_3433());
      }
      
      override public function a_3957(iCurrentTime:int) : void
      {
         if(iCurrentTime % 2 == 0)
         {
            if(a_1278 == null)
            {
               a_1278 = "待机";
            }
            super.a_3957(iCurrentTime);
         }
      }
      
      override protected function a_3955() : Number
      {
         return 0.9 * width;
      }
      
      override protected function a_3956() : Number
      {
         return 0.3 * height;
      }
      
      override protected function a_3966() : int
      {
         return 5 * m_iSkillDegree;
      }
   }
}

