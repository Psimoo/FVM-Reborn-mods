package com.aurora.ui.maogoutd.resource.defender.goldGod
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.defender.a_3953;
   import com.aurora.ui.maogoutd.resource.shot.a_4348;
   import flash.display.FrameLabel;
   
   public class GoldGodFinalTransAttackFighter extends a_3953
   {
      
      public function GoldGodFinalTransAttackFighter()
      {
         super();
         a_1337 = -2;
         a_1312 = 15;
         a_1313 = true;
         a_1310 = 30;
         a_1317 = 8;
         a_1095 = GoldGodDefine.DEFENSE_PRICE;
         a_1309 = GoldGodDefine.a_3966(m_iSkillDegree);
         a_1311 = GoldGodDefine.a_3965(a_1094) * (GoldGodDefine.HURT_ADDTION + 1);
      }
      
      public static function a_3926() : a_3953
      {
         return PoolManager.getInstance().CheckOutOne(GoldGodFinalTransAttackFighter,GoldGodFinalTransAttackFighterMovie) as GoldGodFinalTransAttackFighter;
      }
      
      override public function a_1797(stFieldGrid:a_3491) : Boolean
      {
         super.a_1797(stFieldGrid);
         a_1309 = GoldGodDefine.a_3966(m_iSkillDegree);
         a_1311 = GoldGodDefine.a_3965(a_1094) * (GoldGodDefine.HURT_ADDTION + 1);
         tagCom.AddTag(30031);
         return true;
      }
      
      override public function a_3954(iCurrentTime:int) : Boolean
      {
         var stLastWaitShot:a_4348 = null;
         var numShotXpos:Number = NaN;
         var i:int = 0;
         if(iCurrentTime > m_iPlaceTimeIntervals + a_1308 && iCurrentTime >= a_1321 + a_1309)
         {
            if(a_1334.m_stCurrentBattbleFieldView.GetAllNearestIntruder() == null)
            {
               return false;
            }
            a_1324 = [];
            a_1321 = iCurrentTime;
            for(i = 0; i < 5; i++)
            {
               stLastWaitShot = GoldGodFinalShot.a_4344();
               if(null == stLastWaitShot)
               {
                  return false;
               }
               a_1324.push(stLastWaitShot);
            }
            a_1323 = 0;
            a_1307 = 11;
            a_1275 = 0;
            gotoAndStop((a_1276[1] as FrameLabel).frame);
         }
         if(iCurrentTime - a_1321 == a_1310 + a_1317 * a_1323 && a_1324.length > 0)
         {
            stLastWaitShot = a_1324.pop();
            stLastWaitShot.iShotSequenceNum = a_1323;
            stLastWaitShot.ms_iCritFrameLable = 1;
            stLastWaitShot.a_1797(0,a_1312,a_1311,x + 85,y,a_1334.m_stCurrentBattbleFieldView,a_1334);
            parent.addChildAt(stLastWaitShot,a_1334.m_stCurrentBattbleFieldView.a_3433());
            if(a_1324.length > 0)
            {
               ++a_1323;
            }
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

