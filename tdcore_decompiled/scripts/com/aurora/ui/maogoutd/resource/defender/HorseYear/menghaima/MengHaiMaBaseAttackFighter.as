package com.aurora.ui.maogoutd.resource.defender.HorseYear.menghaima
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.defender.a_3953;
   import com.aurora.ui.maogoutd.resource.shot.a_4348;
   import flash.display.FrameLabel;
   
   public class MengHaiMaBaseAttackFighter extends a_3953
   {
      
      private var totalShotCount:int = 0;
      
      private var m_iTrans:int = 0;
      
      public function MengHaiMaBaseAttackFighter()
      {
         super();
         a_1313 = true;
         a_1333 = true;
         a_1095 = MengHaiMaDefine.DEFENSE_PRICE;
         a_1310 = 12;
         a_1317 = MengHaiMaDefine.CONTINUE_SHOT_INTERVAL;
      }
      
      public static function a_3926() : a_3953
      {
         var defender:MengHaiMaBaseAttackFighter = PoolManager.getInstance().CheckOutOne(MengHaiMaBaseAttackFighter,MengHaiMaBaseAttackFighterMovie) as MengHaiMaBaseAttackFighter;
         defender.m_iTrans = 0;
         return defender;
      }
      
      public static function GetFreeInstance1() : a_3953
      {
         var defender:MengHaiMaBaseAttackFighter = PoolManager.getInstance().CheckOutOne(MengHaiMaBaseAttackFighter,MengHaiMaFirstAttackFighterMovie) as MengHaiMaBaseAttackFighter;
         defender.m_iTrans = 1;
         return defender;
      }
      
      public static function GetFreeInstance2() : a_3953
      {
         var defender:MengHaiMaBaseAttackFighter = PoolManager.getInstance().CheckOutOne(MengHaiMaBaseAttackFighter,MengHaiMaSecondAttackFighterMovie) as MengHaiMaBaseAttackFighter;
         defender.m_iTrans = 2;
         return defender;
      }
      
      override public function a_1797(stFieldGrid:a_3491) : Boolean
      {
         super.a_1797(stFieldGrid);
         if(m_bServerIssued)
         {
            a_1309 = MengHaiMaDefine.a_3966(m_iSkillDegree);
            a_1311 = MengHaiMaDefine.a_3965(a_1094);
            this.totalShotCount = 0;
         }
         return true;
      }
      
      override public function a_3954(iCurrentTime:int) : Boolean
      {
         var stLastWaitShot:a_4348 = null;
         var max:int = 0;
         var i:int = 0;
         var numShotXpos:Number = NaN;
         if(iCurrentTime <= m_iPlaceTimeIntervals + a_1308)
         {
            return false;
         }
         if(iCurrentTime >= a_1321 + a_1309)
         {
            if(!this.IsCanAttack())
            {
               return false;
            }
            a_1324.length = 0;
            a_1321 = iCurrentTime;
            max = this.m_iTrans == 2 ? 5 : 3;
            for(i = 0; i < max; i++)
            {
               if(this.m_iTrans == 0)
               {
                  stLastWaitShot = MengHaiMaBaseShot.a_4344();
               }
               else if(this.m_iTrans == 1)
               {
                  stLastWaitShot = MengHaiMaBaseShot.GetFreeShot1();
               }
               else if(this.m_iTrans == 2)
               {
                  stLastWaitShot = MengHaiMaBaseShot.GetFreeShot2();
               }
               a_1324.push(stLastWaitShot);
            }
            a_1323 = 0;
            a_1307 = 1;
            a_1275 = 0;
            gotoAndStop((a_1276[1] as FrameLabel).frame);
         }
         if(iCurrentTime - a_1321 == a_1310 + a_1317 * a_1323 && a_1324.length > 0)
         {
            numShotXpos = a_1283 ? -60 : 60;
            ++this.totalShotCount;
            stLastWaitShot = a_1324.pop();
            if(stLastWaitShot)
            {
               (stLastWaitShot as MengHaiMaBaseShot).stTargetMoveIntruder = this.GetTheFarthestIntruder();
               stLastWaitShot.a_1797(m_iDefenseGlobalID + this.totalShotCount,a_1312,a_1311,x + numShotXpos,y + 34,a_1334.m_stCurrentBattbleFieldView,a_1334);
               a_1334.m_stCurrentBattbleFieldView.AddToBattleView(stLastWaitShot,BattleLayerDefine.SHOT_TYPE,a_1334);
            }
            if(a_1324.length > 0)
            {
               ++a_1323;
            }
         }
         return true;
      }
      
      private function IsCanAttack() : Boolean
      {
         var farthest:a_4206 = null;
         var intruder:a_4206 = null;
         if(!a_1334)
         {
            return false;
         }
         var maxDistSq:Number = -1;
         var intruders:Array = a_1334.m_stCurrentBattbleFieldView.m_arrBaseMoveIntruderVector;
         for(var i:int = 0; i < intruders.length; i++)
         {
            intruder = intruders[i];
            if(MengHaiMaDefine.CheckAttack(intruder,this.m_iTrans))
            {
               return true;
            }
         }
         return false;
      }
      
      private function GetTheFarthestIntruder() : a_4206
      {
         var farthest:a_4206 = null;
         var intruder:a_4206 = null;
         if(!a_1334)
         {
            return null;
         }
         var maxDistSq:Number = -1;
         var intruders:Array = a_1334.m_stCurrentBattbleFieldView.m_arrBaseMoveIntruderVector;
         var arr:Array = [];
         for(var i:int = 0; i < intruders.length; i++)
         {
            intruder = intruders[i];
            if(MengHaiMaDefine.CheckAttack(intruder,this.m_iTrans))
            {
               if(intruder.IsBossIntruder)
               {
                  return intruder;
               }
               arr.push(intruder);
            }
         }
         if(arr.length == 0)
         {
            return null;
         }
         arr.sort(this.OnSortToken);
         return arr[0];
      }
      
      private function OnSortToken(a:a_4206, b:a_4206) : int
      {
         var dxA:Number = NaN;
         var dyA:Number = NaN;
         var distA:Number = NaN;
         var dxB:Number = NaN;
         var dyB:Number = NaN;
         var distB:Number = NaN;
         if(a.iInitialLifeValue > b.iInitialLifeValue)
         {
            return -1;
         }
         if(a.iInitialLifeValue < b.iInitialLifeValue)
         {
            return 1;
         }
         dxA = a.x - x;
         dyA = a.y - y;
         distA = dxA * dxA + dyA * dyA;
         dxB = b.x - x;
         dyB = b.y - y;
         distB = dxB * dxB + dyB * dyB;
         if(Math.abs(distA) < Math.abs(distB))
         {
            return -1;
         }
         if(Math.abs(distA) > Math.abs(distB))
         {
            return 1;
         }
         return 0;
      }
      
      override protected function a_3955() : Number
      {
         return 70;
      }
      
      override protected function a_3956() : Number
      {
         return 25;
      }
      
      override protected function a_3964() : int
      {
         return MengHaiMaDefine.a_3964(a_1094);
      }
      
      override public function a_3957(iCurrentTime:int) : void
      {
         if((iCurrentTime & 1) == 0)
         {
            super.a_3957(iCurrentTime);
         }
      }
   }
}

