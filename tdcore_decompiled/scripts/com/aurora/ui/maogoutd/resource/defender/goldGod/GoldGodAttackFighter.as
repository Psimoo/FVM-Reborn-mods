package com.aurora.ui.maogoutd.resource.defender.goldGod
{
   import a_4718.b_183;
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.defender.a_3953;
   import com.aurora.ui.maogoutd.resource.shot.a_4348;
   import com.aurora.ui.maogoutd.resource.shot.a_4388;
   import flash.display.FrameLabel;
   
   public class GoldGodAttackFighter extends a_3953
   {
      
      public function GoldGodAttackFighter()
      {
         super();
         a_1304 = b_183.enm_GoldGodShot;
         a_1337 = 0;
         a_1312 = 15;
         a_1313 = true;
         a_1310 = 10;
         a_1317 = 8;
         a_1095 = GoldGodDefine.DEFENSE_PRICE;
         a_1096 = false;
         a_1314 = false;
         a_1309 = GoldGodDefine.a_3966(m_iSkillDegree);
         a_1311 = GoldGodDefine.a_3965(a_1094);
      }
      
      public static function a_3926() : a_3953
      {
         return PoolManager.getInstance().CheckOutOne(GoldGodAttackFighter,GoldGodAttackFighterMovie) as GoldGodAttackFighter;
      }
      
      override public function a_1797(stFieldGrid:a_3491) : Boolean
      {
         super.a_1797(stFieldGrid);
         a_1309 = GoldGodDefine.a_3966(m_iSkillDegree);
         a_1311 = GoldGodDefine.a_3965(a_1094);
         tagCom.AddTag(30031);
         return true;
      }
      
      override public function a_3954(iCurrentTime:int) : Boolean
      {
         var stLastWaitShot:a_4348 = null;
         var numShotXpos:Number = NaN;
         var i:int = 0;
         if(a_1334.m_stCurrentBattbleFieldView.a_3431())
         {
            if(iCurrentTime > m_iPlaceTimeIntervals + a_1308 && iCurrentTime >= a_1321 + a_1309)
            {
               stLastWaitShot = a_4388.getInstance().a_4389(a_1304);
               if(stLastWaitShot)
               {
                  a_1321 = iCurrentTime;
                  a_1323 = 0;
                  a_1324.push(stLastWaitShot);
                  for(i = 0; i < 1; i++)
                  {
                     stLastWaitShot = a_4388.getInstance().a_4389(a_1304);
                     if(null == stLastWaitShot)
                     {
                        return false;
                     }
                     a_1324.push(stLastWaitShot);
                  }
                  a_1307 = a_1273;
                  a_1275 = 0;
                  gotoAndStop((a_1276[1] as FrameLabel).frame);
               }
            }
            if(iCurrentTime - a_1321 == a_1310 + a_1317 * a_1323 && a_1324.length > 0)
            {
               if(a_1323 == 0)
               {
                  stLastWaitShot = a_1324.pop();
                  stLastWaitShot.iShotSequenceNum = a_1323;
                  stLastWaitShot.ms_iCritFrameLable = 0;
                  stLastWaitShot.a_1797(0,a_1312,a_1311,x + 85,y,a_1334.m_stCurrentBattbleFieldView,a_1334);
                  parent.addChildAt(stLastWaitShot,a_1334.m_stCurrentBattbleFieldView.a_3433());
               }
               else if(a_1323 == 1)
               {
                  stLastWaitShot = a_1324.pop();
                  stLastWaitShot.iShotSequenceNum = a_1323;
                  stLastWaitShot.ms_iCritFrameLable = 0;
                  stLastWaitShot.a_1797(0,a_1312,a_1311,x + 85,y,a_1334.m_stCurrentBattbleFieldView,a_1334);
                  parent.addChildAt(stLastWaitShot,a_1334.m_stCurrentBattbleFieldView.a_3433());
               }
               if(a_1324.length > 0)
               {
                  ++a_1323;
               }
            }
            return true;
         }
         return true;
      }
      
      override protected function a_3964() : int
      {
         return GoldGodDefine.a_3964();
      }
      
      override public function a_3957(iCurrentTime:int) : void
      {
         if(iCurrentTime % 2 == 0)
         {
            super.a_3957(iCurrentTime);
         }
      }
      
      override protected function a_3955() : Number
      {
         return 30;
      }
      
      override protected function a_3956() : Number
      {
         return 20;
      }
   }
}

