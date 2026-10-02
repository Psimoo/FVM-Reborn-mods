package com.aurora.ui.maogoutd.resource.defender.HorseYear.tangrenma
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.defender.a_3953;
   import com.aurora.ui.maogoutd.resource.shot.a_4348;
   import flash.display.FrameLabel;
   
   public class TangRenMaFirstDefense extends a_3953
   {
      
      private var m_appearedTimes:int = 0;
      
      private var m_isPlayingCopySpawnAnimation:Boolean = false;
      
      public function TangRenMaFirstDefense()
      {
         super();
         a_1095 = TangRenMaDefense.DEFENSE_PRICE;
         a_1310 = TangRenMaDefense.SHOT_DELAY_TIMENUM;
         a_1317 = TangRenMaDefense.CONTINUE_SHOT_INTERVAL;
         a_1313 = true;
         a_1333 = true;
         a_1337 = 7;
      }
      
      public static function a_3926() : TangRenMaFirstDefense
      {
         return PoolManager.getInstance().CheckOutOne(TangRenMaFirstDefense) as TangRenMaFirstDefense;
      }
      
      override public function a_1797(stFieldGrid:a_3491) : Boolean
      {
         super.a_1797(stFieldGrid);
         if(m_bServerIssued)
         {
            a_1309 = TangRenMaDefense.a_3966(m_iSkillDegree);
            a_1311 = TangRenMaDefense.a_3965(a_1094);
            if(a_1336)
            {
               a_1336.x -= 4;
            }
         }
         this.m_appearedTimes = 0;
         this.m_isPlayingCopySpawnAnimation = false;
         return true;
      }
      
      override protected function getBindMovie() : Class
      {
         return TangRenMaFirstDefenseMovie;
      }
      
      override public function a_3954(iCurrentTime:int) : Boolean
      {
         if(this.m_appearedTimes == 0)
         {
            this.m_appearedTimes = iCurrentTime;
         }
         this.updateCopySpawnAnimation(iCurrentTime);
         if(this.m_isPlayingCopySpawnAnimation)
         {
            return false;
         }
         if(iCurrentTime <= m_iPlaceTimeIntervals + a_1308)
         {
            return false;
         }
         if(iCurrentTime >= a_1321 + a_1309)
         {
            if(!TangRenMaDefense.HasTargetInView(a_1334))
            {
               return false;
            }
            this.startStraightShotCycle(iCurrentTime);
         }
         if(iCurrentTime - a_1321 == a_1310 + a_1317 * a_1323 && a_1324.length > 0)
         {
            this.emitNextStraightShot();
         }
         return true;
      }
      
      private function updateCopySpawnAnimation(iCurrentTime:int) : void
      {
         if(iCurrentTime - this.m_appearedTimes != 0 && (iCurrentTime - this.m_appearedTimes) % 200 == 0)
         {
            a_1275 = 0;
            a_1307 = 12;
            gotoAndStop((a_1276[2] as FrameLabel).frame);
            this.m_isPlayingCopySpawnAnimation = true;
         }
         if(this.m_isPlayingCopySpawnAnimation && iCurrentTime % 2 == 0)
         {
            if(a_1273 == 34)
            {
               TangRenMaDefense.SpawnCopyDefenses(a_1334,286402366,a_1094,m_iSkillDegree,2);
            }
            else if(a_1273 == 37)
            {
               this.m_isPlayingCopySpawnAnimation = false;
            }
         }
      }
      
      private function startStraightShotCycle(iCurrentTime:int) : void
      {
         var stLastWaitShot:a_4348 = null;
         a_1324.length = 0;
         a_1321 = iCurrentTime;
         for(var j:int = 0; j < 3; j++)
         {
            stLastWaitShot = TangRenMaFirstStraightShot.a_4344();
            a_1324.push(stLastWaitShot);
         }
         a_1323 = 0;
         a_1307 = 1;
         a_1275 = 0;
         gotoAndStop((a_1276[1] as FrameLabel).frame);
      }
      
      private function emitNextStraightShot() : void
      {
         var numShotXpos:Number = NaN;
         var stShot:a_4348 = a_1324.pop();
         if(stShot)
         {
            numShotXpos = a_1283 ? -50 : 50;
            stShot.a_1797(0,a_1312,a_1311,x + numShotXpos,y + 40,a_1334.m_stCurrentBattbleFieldView,a_1334);
            a_1334.m_stCurrentBattbleFieldView.AddToBattleView(stShot,BattleLayerDefine.SHOT_TYPE,a_1334);
         }
         if(a_1324.length > 0)
         {
            ++a_1323;
         }
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
         this.m_appearedTimes = 0;
         this.m_isPlayingCopySpawnAnimation = false;
         return super.a_3940();
      }
   }
}

