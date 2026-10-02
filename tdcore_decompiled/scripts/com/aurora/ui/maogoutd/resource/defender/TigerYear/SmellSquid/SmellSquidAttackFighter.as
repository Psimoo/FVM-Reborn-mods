package com.aurora.ui.maogoutd.resource.defender.TigerYear.SmellSquid
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.defender.a_3953;
   import com.aurora.ui.maogoutd.resource.shot.a_4348;
   import flash.display.FrameLabel;
   
   public class SmellSquidAttackFighter extends a_3953
   {
      
      public function SmellSquidAttackFighter()
      {
         super();
         a_1335 = 65553;
         a_1095 = SmellSquidDefine.DEFENSE_PRICE;
         a_1313 = true;
         a_1310 = 14;
         a_1317 = 2;
         a_1333 = true;
         a_1309 = SmellSquidDefine.a_3966(m_iSkillDegree);
         a_1311 = SmellSquidDefine.a_3965(a_1094);
      }
      
      public static function a_3926() : a_3953
      {
         return PoolManager.getInstance().CheckOutOne(SmellSquidAttackFighter) as SmellSquidAttackFighter;
      }
      
      override protected function getBindMovie() : Class
      {
         return SmellSquidAttackFighterMovie;
      }
      
      override public function a_1797(stFieldGrid:a_3491) : Boolean
      {
         super.a_1797(stFieldGrid);
         a_1309 = SmellSquidDefine.a_3966(m_iSkillDegree);
         a_1311 = SmellSquidDefine.a_3965(a_1094);
         return true;
      }
      
      override protected function a_3964() : int
      {
         return SmellSquidDefine.a_3964(m_iSkillDegree);
      }
      
      override public function a_3969(iRduceLifeValue:int) : Boolean
      {
         super.a_3969(iRduceLifeValue);
         return true;
      }
      
      override public function a_3954(iCurrentTime:int) : Boolean
      {
         var stLastWaitShot:a_4348 = null;
         var numShotXpos:Number = NaN;
         var i:int = 0;
         var j:int = 0;
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
            for(j = 0; j < 1; j++)
            {
               if(a_1334.m_iYGridNo > 0)
               {
                  stLastWaitShot = SmellSquidBaseShot.a_4344();
                  if(null == stLastWaitShot)
                  {
                     return false;
                  }
                  a_1324.push(stLastWaitShot);
               }
               if(a_1334.m_iYGridNo > 0 && a_1334.m_iXGridNo < BattleFieldView.a_1011 - 1)
               {
                  stLastWaitShot = SmellSquidBaseShot.a_4344();
                  if(null == stLastWaitShot)
                  {
                     return false;
                  }
                  a_1324.push(stLastWaitShot);
               }
               if(a_1334.m_iXGridNo < BattleFieldView.a_1011 - 1)
               {
                  stLastWaitShot = SmellSquidBaseShot.a_4344();
                  if(null == stLastWaitShot)
                  {
                     return false;
                  }
                  a_1324.push(stLastWaitShot);
               }
               if(a_1334.m_iYGridNo < BattleFieldView.a_1012 - 1 && a_1334.m_iXGridNo < BattleFieldView.a_1011 - 1)
               {
                  stLastWaitShot = SmellSquidBaseShot.a_4344();
                  if(null == stLastWaitShot)
                  {
                     return false;
                  }
                  a_1324.push(stLastWaitShot);
               }
               if(a_1334.m_iYGridNo < BattleFieldView.a_1012 - 1)
               {
                  stLastWaitShot = SmellSquidBaseShot.a_4344();
                  if(null == stLastWaitShot)
                  {
                     return false;
                  }
                  a_1324.push(stLastWaitShot);
               }
               if(a_1334.m_iYGridNo < BattleFieldView.a_1012 - 1 && a_1334.m_iXGridNo > 0)
               {
                  stLastWaitShot = SmellSquidBaseShot.a_4344();
                  if(null == stLastWaitShot)
                  {
                     return false;
                  }
                  a_1324.push(stLastWaitShot);
               }
               if(a_1334.m_iXGridNo > 0)
               {
                  stLastWaitShot = SmellSquidBaseShot.a_4344();
                  if(null == stLastWaitShot)
                  {
                     return false;
                  }
                  a_1324.push(stLastWaitShot);
               }
               if(a_1334.m_iYGridNo > 0 && a_1334.m_iXGridNo > 0)
               {
                  stLastWaitShot = SmellSquidBaseShot.a_4344();
                  if(null == stLastWaitShot)
                  {
                     return false;
                  }
                  a_1324.push(stLastWaitShot);
               }
            }
            a_1323 = 0;
            a_1307 = 12;
            a_1275 = 0;
            gotoAndStop((a_1276[1] as FrameLabel).frame);
         }
         if(iCurrentTime - a_1321 == a_1310 + a_1317 * a_1323 && a_1324.length > 0)
         {
            if(a_1334.m_iYGridNo > 0 && a_1334.m_iXGridNo > 0)
            {
               stLastWaitShot = a_1324.pop();
               stLastWaitShot.m_isSpecial = 8;
               stLastWaitShot.a_1797(0,a_1312,a_1311,x + 29,y + 45,a_1334.m_stCurrentBattbleFieldView,a_1334);
               parent.addChildAt(stLastWaitShot,a_1334.m_stCurrentBattbleFieldView.a_3433());
            }
            if(a_1334.m_iXGridNo > 0)
            {
               stLastWaitShot = a_1324.pop();
               stLastWaitShot.m_isSpecial = 4;
               stLastWaitShot.a_1797(0,a_1312,a_1311,x + 29,y + 45,a_1334.m_stCurrentBattbleFieldView,a_1334);
               parent.addChildAt(stLastWaitShot,a_1334.m_stCurrentBattbleFieldView.a_3433());
            }
            if(a_1334.m_iYGridNo < BattleFieldView.a_1012 - 1 && a_1334.m_iXGridNo > 0)
            {
               stLastWaitShot = a_1324.pop();
               stLastWaitShot.m_isSpecial = 6;
               stLastWaitShot.a_1797(0,a_1312,a_1311,x + 29,y + 45,a_1334.m_stCurrentBattbleFieldView,a_1334);
               parent.addChildAt(stLastWaitShot,a_1334.m_stCurrentBattbleFieldView.a_3433());
            }
            if(a_1334.m_iYGridNo < BattleFieldView.a_1012 - 1)
            {
               stLastWaitShot = a_1324.pop();
               stLastWaitShot.m_isSpecial = 2;
               stLastWaitShot.a_1797(0,a_1312,a_1311,x + 29,y + 45,a_1334.m_stCurrentBattbleFieldView,a_1334);
               parent.addChildAt(stLastWaitShot,a_1334.m_stCurrentBattbleFieldView.a_3433());
            }
            if(a_1334.m_iYGridNo < BattleFieldView.a_1012 - 1 && a_1334.m_iXGridNo < BattleFieldView.a_1011 - 1)
            {
               stLastWaitShot = a_1324.pop();
               stLastWaitShot.m_isSpecial = 7;
               stLastWaitShot.a_1797(0,a_1312,a_1311,x + 29,y + 45,a_1334.m_stCurrentBattbleFieldView,a_1334);
               parent.addChildAt(stLastWaitShot,a_1334.m_stCurrentBattbleFieldView.a_3433());
            }
            if(a_1334.m_iXGridNo < BattleFieldView.a_1011 - 1)
            {
               stLastWaitShot = a_1324.pop();
               stLastWaitShot.m_isSpecial = 3;
               stLastWaitShot.a_1797(0,a_1312,a_1311,x + 29,y + 45,a_1334.m_stCurrentBattbleFieldView,a_1334);
               parent.addChildAt(stLastWaitShot,a_1334.m_stCurrentBattbleFieldView.a_3433());
            }
            if(a_1334.m_iYGridNo > 0 && a_1334.m_iXGridNo < BattleFieldView.a_1011 - 1)
            {
               stLastWaitShot = a_1324.pop();
               stLastWaitShot.m_isSpecial = 5;
               stLastWaitShot.a_1797(0,a_1312,a_1311,x + 29,y + 45,a_1334.m_stCurrentBattbleFieldView,a_1334);
               parent.addChildAt(stLastWaitShot,a_1334.m_stCurrentBattbleFieldView.a_3433());
            }
            if(a_1334.m_iYGridNo > 0)
            {
               stLastWaitShot = a_1324.pop();
               stLastWaitShot.m_isSpecial = 1;
               stLastWaitShot.a_1797(0,a_1312,a_1311,x + 29,y + 45,a_1334.m_stCurrentBattbleFieldView,a_1334);
               parent.addChildAt(stLastWaitShot,a_1334.m_stCurrentBattbleFieldView.a_3433());
            }
            if(a_1324.length > 0)
            {
               ++a_1323;
            }
         }
         return true;
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

