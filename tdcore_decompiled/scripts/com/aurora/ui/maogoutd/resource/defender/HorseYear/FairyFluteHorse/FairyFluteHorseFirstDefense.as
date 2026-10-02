package com.aurora.ui.maogoutd.resource.defender.HorseYear.FairyFluteHorse
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.defender.HorseYear.FairyFluteHorse.shot.FairyFluteHorseCommonShot;
   import com.aurora.ui.maogoutd.resource.defender.a_3953;
   import com.aurora.ui.maogoutd.resource.shot.a_4348;
   
   public class FairyFluteHorseFirstDefense extends a_3953
   {
      
      private static const MAX_FLUTE_COUNT:int = 3;
      
      private var m_iFluteCount:int = 0;
      
      private var m_targetIntruder:a_4206;
      
      public function FairyFluteHorseFirstDefense()
      {
         super();
         a_1095 = FairyFluteHorseDefense.DEFENSE_PRICE;
         a_1313 = true;
         a_1310 = FairyFluteHorseDefense.SHOT_DELAY_TIMENUM;
         a_1317 = FairyFluteHorseDefense.CONTINUE_SHOT_INTERVAL;
         a_1338 = 7;
         m_SecondExtraSlotType = 2;
      }
      
      public static function a_3926() : FairyFluteHorseFirstDefense
      {
         var inst:FairyFluteHorseFirstDefense = null;
         inst = PoolManager.getInstance().CheckOutOne(FairyFluteHorseFirstDefense) as FairyFluteHorseFirstDefense;
         inst.visible = true;
         return inst;
      }
      
      override protected function getBindMovie() : Class
      {
         return FairyFluteHorseFirstDefenseMovie;
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
      
      override public function a_1797(stFieldGrid:a_3491) : Boolean
      {
         super.a_1797(stFieldGrid);
         if(m_bServerIssued)
         {
            this.m_iFluteCount = 0;
            a_1311 = FairyFluteHorseDefense.a_3965(a_1094);
            a_1309 = FairyFluteHorseDefense.a_3966(m_iSkillDegree);
            a_1321 = 0;
            this.m_targetIntruder = null;
         }
         return true;
      }
      
      override public function a_3954(iCurrentTime:int) : Boolean
      {
         var showShot:a_4348 = null;
         if(iCurrentTime <= m_iPlaceTimeIntervals + a_1308)
         {
            return false;
         }
         if(this.m_iFluteCount >= MAX_FLUTE_COUNT)
         {
            if(iCurrentTime - a_1321 < a_1310 || a_1324.length == 0)
            {
               return false;
            }
            this.m_targetIntruder = FairyFluteHorseDefense.GetGlobalTarget(a_1334,x,y);
            if(this.m_targetIntruder)
            {
               a_1321 = iCurrentTime;
               this.LaunchPendingShots(this.m_targetIntruder);
               this.m_iFluteCount = 0;
               this.m_targetIntruder = null;
            }
            return false;
         }
         if(iCurrentTime >= a_1321 + a_1309)
         {
            if(this.m_iFluteCount == 0 && a_1324.length == 0)
            {
               this.CreatePendingShots();
            }
            if(a_1324.length > this.m_iFluteCount)
            {
               showShot = a_1324[this.m_iFluteCount] as a_4348;
               if(showShot)
               {
                  showShot.visible = true;
               }
               ++this.m_iFluteCount;
               a_1321 = iCurrentTime;
            }
         }
         return true;
      }
      
      private function CreatePendingShots() : void
      {
         var pendingOffsetY:Number = NaN;
         var stShot:a_4348 = null;
         var fluteShot:FairyFluteHorseCommonShot = null;
         var numShotXpos:Number = a_1283 ? -45 : 45;
         for(var i:int = 0; i < MAX_FLUTE_COUNT; i++)
         {
            pendingOffsetY = 51 - i * 20;
            stShot = FairyFluteHorseCommonShot.a_4344(1);
            stShot.a_1797(0,a_1312,a_1311,x + numShotXpos,y + pendingOffsetY,a_1334.m_stCurrentBattbleFieldView,a_1334);
            fluteShot = stShot as FairyFluteHorseCommonShot;
            if(fluteShot)
            {
               fluteShot.SetPendingLaunch(true);
               fluteShot.m_BossDamageRate = 2.1;
               fluteShot.m_isSpecial = 1;
            }
            stShot.visible = false;
            a_1334.m_stCurrentBattbleFieldView.AddToBattleView(stShot,BattleLayerDefine.SHOT_TYPE,a_1334);
            a_1324.push(stShot);
         }
      }
      
      private function LaunchPendingShots(launchTarget:a_4206) : void
      {
         var pendingShot:a_4348 = null;
         var fluteShot:FairyFluteHorseCommonShot = null;
         for each(pendingShot in a_1324)
         {
            fluteShot = pendingShot as FairyFluteHorseCommonShot;
            if(fluteShot)
            {
               fluteShot.LaunchToTarget(launchTarget);
            }
         }
         a_1324.length = 0;
      }
      
      override public function a_3940() : Boolean
      {
         var stShot:a_4348 = null;
         for each(stShot in a_1324.slice())
         {
            if(stShot)
            {
               stShot.a_4350();
            }
         }
         a_1324.length = 0;
         this.m_iFluteCount = 0;
         this.m_targetIntruder = null;
         return super.a_3940();
      }
   }
}

