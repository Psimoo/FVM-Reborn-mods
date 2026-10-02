package com.aurora.ui.maogoutd.resource.defender.HorseYear.evilAvocado
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.defender.HorseYear.evilAvocado.shot.EvilAvocadoCommonShot;
   import com.aurora.ui.maogoutd.resource.defender.a_3953;
   import flash.display.FrameLabel;
   
   public class EvilAvocadoBaseAttackFighter extends a_3953
   {
      
      public function EvilAvocadoBaseAttackFighter()
      {
         super();
         a_1095 = EvilAvocadoDefine.DEFENSE_PRICE;
         a_1313 = true;
         a_1310 = EvilAvocadoDefine.SHOT_DELAY_TIMENUM;
         a_1317 = EvilAvocadoDefine.CONTINUE_SHOT_INTERVAL;
         a_1333 = true;
      }
      
      public static function a_3926() : a_3953
      {
         return PoolManager.getInstance().CheckOutOne(EvilAvocadoBaseAttackFighter,EvilAvocadoBaseAttackFighterMovie) as EvilAvocadoBaseAttackFighter;
      }
      
      override public function a_1797(stFieldGrid:a_3491) : Boolean
      {
         super.a_1797(stFieldGrid);
         if(m_bServerIssued)
         {
            a_1309 = EvilAvocadoDefine.a_3966(m_iSkillDegree);
            a_1311 = EvilAvocadoDefine.a_3965(a_1094);
         }
         return true;
      }
      
      override protected function a_3964() : int
      {
         return EvilAvocadoDefine.a_3964(a_1094);
      }
      
      override public function a_3969(iRduceLifeValue:int) : Boolean
      {
         super.a_3969(iRduceLifeValue);
         return true;
      }
      
      override public function a_3954(iCurrentTime:int) : Boolean
      {
         if(iCurrentTime > m_iPlaceTimeIntervals + a_1308 && iCurrentTime >= a_1321 + a_1309)
         {
            if(EvilAvocadoDefine.GetFieldIntruderNumForFiveDirection(a_1334) <= 0)
            {
               return true;
            }
            a_1321 = iCurrentTime;
            a_1323 = 0;
            a_1307 = 1;
            a_1275 = 0;
            gotoAndStop((a_1276[1] as FrameLabel).frame);
         }
         if(iCurrentTime - a_1321 == a_1310 + a_1317 * a_1323 && a_1323 < 1)
         {
            this.FireThreeDirectionShots();
            ++a_1323;
         }
         return true;
      }
      
      private function FireThreeDirectionShots() : void
      {
         this.AddMyShot(1);
         this.AddMyShot(4);
         this.AddMyShot(5);
      }
      
      private function AddMyShot(iDirection:int) : void
      {
         var stLastWaitShot:EvilAvocadoCommonShot = EvilAvocadoCommonShot.a_4344(0);
         if(null == stLastWaitShot || !stFieldGrid)
         {
            return;
         }
         stLastWaitShot.m_isSpecial = iDirection;
         var numShotXpos:Number = this.a_3955();
         if(a_1283)
         {
            numShotXpos = -numShotXpos;
         }
         stLastWaitShot.a_1797(0,a_1312,a_1311,x + numShotXpos,y + this.a_3956(),a_1334.m_stCurrentBattbleFieldView,a_1334);
         stFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(stLastWaitShot,BattleLayerDefine.SHOT_TYPE,stFieldGrid);
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
      
      override public function a_3940() : Boolean
      {
         super.a_3940();
         return true;
      }
      
      override protected function a_3955() : Number
      {
         return 63;
      }
      
      override protected function a_3956() : Number
      {
         return 40;
      }
   }
}

