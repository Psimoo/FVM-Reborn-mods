package com.aurora.ui.maogoutd.resource.defender.HorseYear.tangrenma.small
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.defender.HorseYear.tangrenma.TangRenMaDefense;
   import com.aurora.ui.maogoutd.resource.defender.a_3953;
   import com.aurora.ui.maogoutd.resource.shot.a_4348;
   import flash.display.FrameLabel;
   
   public class TangRenMaSmallFirstDefense extends a_3953
   {
      
      private var m_appearedTimes:int = 0;
      
      public var m_iShotCountPerCycle:int = 1;
      
      private var m_stTargetIntruder:a_4206;
      
      public function TangRenMaSmallFirstDefense()
      {
         super();
         a_1095 = TangRenMaSmallDefense.DEFENSE_PRICE;
         a_1310 = TangRenMaSmallDefense.SHOT_DELAY_TIMENUM;
         a_1317 = TangRenMaSmallDefense.CONTINUE_SHOT_INTERVAL;
         a_1313 = true;
         a_1333 = true;
         a_1337 = -11;
         a_1312 = 15;
      }
      
      public static function a_3926() : a_3953
      {
         var inst:TangRenMaSmallFirstDefense = null;
         inst = PoolManager.getInstance().CheckOutOne(TangRenMaSmallFirstDefense) as TangRenMaSmallFirstDefense;
         inst.visible = true;
         return inst;
      }
      
      override public function a_1797(stFieldGrid:a_3491) : Boolean
      {
         super.a_1797(stFieldGrid);
         if(m_bServerIssued)
         {
            TangRenMaDefense.ClearPendingCopyGrid(a_1334);
            a_1309 = TangRenMaSmallDefense.a_3966(m_iSkillDegree);
            a_1311 = TangRenMaSmallDefense.a_3965(a_1094);
            if(a_1336)
            {
               a_1336.x += 14;
            }
         }
         this.m_appearedTimes = 0;
         a_1308 = 16;
         a_1275 = 1;
         return true;
      }
      
      override protected function getBindMovie() : Class
      {
         return TangRenMaSmallFirstDefenseMovie;
      }
      
      override protected function a_3964() : int
      {
         return TangRenMaSmallDefense.a_3964(a_1094);
      }
      
      override public function a_3954(iCurrentTime:int) : Boolean
      {
         var nearest:a_4206 = null;
         var k:int = 0;
         var old:a_4348 = null;
         var shot:TangRenMaSmallFirstShot = null;
         var stShot:a_4348 = null;
         var numShotXpos:Number = NaN;
         if(this.m_appearedTimes == 0)
         {
            this.m_appearedTimes = iCurrentTime;
         }
         if(iCurrentTime - this.m_appearedTimes >= TangRenMaSmallDefense.DURATION_FRAMES)
         {
            a_3969(a_1339);
            return false;
         }
         if(iCurrentTime <= m_iPlaceTimeIntervals + a_1308)
         {
            return false;
         }
         if(iCurrentTime >= a_1321 + a_1309)
         {
            nearest = TangRenMaSmallDefense.GetNearestIntruderInFrontRows(a_1334,TangRenMaSmallDefense.ROW_RANGE_SMALL);
            if(!nearest)
            {
               this.m_stTargetIntruder = null;
               return true;
            }
            this.m_stTargetIntruder = nearest;
            while(a_1324.length > 0)
            {
               old = a_1324.pop();
               old.a_4350();
            }
            for(k = 0; k < this.m_iShotCountPerCycle; k++)
            {
               shot = TangRenMaSmallFirstShot.a_4344() as TangRenMaSmallFirstShot;
               if(shot)
               {
                  shot.stTargetMoveIntruder = this.m_stTargetIntruder;
               }
               a_1324.push(shot);
            }
            a_1321 = iCurrentTime;
            a_1323 = 0;
            a_1307 = 6;
            a_1275 = 1;
            gotoAndStop((a_1276[2] as FrameLabel).frame);
         }
         if(iCurrentTime - a_1321 == a_1310 + a_1317 * a_1323 && a_1324.length > 0)
         {
            stShot = a_1324.pop();
            if(stShot)
            {
               numShotXpos = a_1283 ? -49 : 49;
               stShot.a_1797(0,a_1312,a_1311,x + numShotXpos,y + 8,a_1334.m_stCurrentBattbleFieldView,a_1334);
               a_1334.m_stCurrentBattbleFieldView.AddToBattleView(stShot,BattleLayerDefine.SHOT_TYPE,a_1334);
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
      
      override public function a_3940() : Boolean
      {
         this.m_appearedTimes = 0;
         this.m_stTargetIntruder = null;
         return super.a_3940();
      }
      
      override protected function a_3955() : Number
      {
         return 0.9 * width;
      }
      
      override protected function a_3956() : Number
      {
         return 0.3 * height + 25;
      }
   }
}

