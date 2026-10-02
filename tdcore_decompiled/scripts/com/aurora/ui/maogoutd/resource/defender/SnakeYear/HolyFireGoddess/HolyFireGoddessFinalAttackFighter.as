package com.aurora.ui.maogoutd.resource.defender.SnakeYear.HolyFireGoddess
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.defender.a_3953;
   import com.aurora.ui.maogoutd.resource.shot.a_4348;
   import flash.display.FrameLabel;
   
   public class HolyFireGoddessFinalAttackFighter extends a_3953
   {
      
      private var totalShotCount:int = 0;
      
      public function HolyFireGoddessFinalAttackFighter()
      {
         super();
         a_1095 = HolyFireGoddessDefence.DEFENSE_PRICE;
         a_1313 = true;
         a_1310 = 12;
         a_1333 = true;
      }
      
      public static function a_3926() : a_3953
      {
         return PoolManager.getInstance().CheckOutOne(HolyFireGoddessFinalAttackFighter,HolyFireGoddessFinalAttackFighterMovie) as HolyFireGoddessFinalAttackFighter;
      }
      
      override public function a_1797(stFieldGrid:a_3491) : Boolean
      {
         super.a_1797(stFieldGrid);
         tagCom.AddTag(30034);
         this.totalShotCount = 0;
         a_1311 = 1.6 * HolyFireGoddessDefence.a_3965(a_1094);
         a_1309 = HolyFireGoddessDefence.a_3966(m_iSkillDegree);
         if(a_1336)
         {
            a_1336.x += 2;
         }
         return true;
      }
      
      override protected function a_3964() : int
      {
         return HolyFireGoddessDefence.a_3964(m_iSkillDegree);
      }
      
      override public function a_3957(iCurrentTime:int) : void
      {
         if(iCurrentTime % 2 == 0)
         {
            super.a_3957(iCurrentTime);
         }
      }
      
      override public function a_3954(iCurrentTime:int) : Boolean
      {
         var stLastWaitShot:a_4348 = null;
         var numShotXpos:Number = NaN;
         if(iCurrentTime > m_iPlaceTimeIntervals + a_1308 && iCurrentTime >= a_1321 + a_1309)
         {
            if(HolyFireGoddessDefence.GetFieldIntruderNumForAheadDirection(a_1334,1,true) <= 0)
            {
               return false;
            }
            a_1324.length = 0;
            a_1321 = iCurrentTime;
            ++this.totalShotCount;
            stLastWaitShot = HolyFireGoddessFinalShot.a_4344();
            if(null == stLastWaitShot)
            {
               return false;
            }
            a_1324.push(stLastWaitShot);
            a_1307 = 1;
            a_1275 = 0;
            gotoAndStop((a_1276[1] as FrameLabel).frame);
         }
         if(iCurrentTime - a_1321 == a_1310 && a_1324.length > 0)
         {
            numShotXpos = a_1283 ? -104 : 104;
            stLastWaitShot = a_1324.pop();
            if(stLastWaitShot)
            {
               stLastWaitShot.a_1797(m_iDefenseGlobalID + this.totalShotCount,a_1312,a_1311,x + numShotXpos,y + 148,a_1334.m_stCurrentBattbleFieldView,a_1334);
               a_1334.m_stCurrentBattbleFieldView.AddToBattleView(stLastWaitShot,BattleLayerDefine.SHOT_TYPE,a_1334);
            }
         }
         return true;
      }
      
      override protected function a_3955() : Number
      {
         return 0.95 * width;
      }
      
      override protected function a_3956() : Number
      {
         return 0.3 * height;
      }
   }
}

