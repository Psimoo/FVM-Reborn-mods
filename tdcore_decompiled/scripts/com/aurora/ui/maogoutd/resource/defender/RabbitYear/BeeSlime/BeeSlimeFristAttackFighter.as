package com.aurora.ui.maogoutd.resource.defender.RabbitYear.BeeSlime
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.defender.a_3953;
   import com.aurora.ui.maogoutd.resource.defender.a_3962;
   import com.aurora.ui.maogoutd.resource.defender.a_4012;
   import com.aurora.ui.maogoutd.resource.shot.a_4348;
   import flash.display.FrameLabel;
   
   public class BeeSlimeFristAttackFighter extends a_3953
   {
      
      private var m_appearedTimes:int = 0;
      
      private var m_isShowAddSmall:Boolean;
      
      private var m_arrPos:Array = [[0,-1],[1,-1],[1,0],[1,1],[0,1],[-1,1],[-1,0],[-1,-1]];
      
      private var bornIndex:int;
      
      private var stTargetFieldGrid:a_3491;
      
      public function BeeSlimeFristAttackFighter()
      {
         super();
         a_1095 = BeeSlimeDefine.DEFENSE_PRICE;
         a_1313 = true;
         a_1310 = 12;
         a_1317 = 2;
         a_1333 = true;
         a_1309 = 2.5 * 20;
         a_1311 = BeeSlimeDefine.a_3965(a_1094);
      }
      
      public static function a_3926() : a_3953
      {
         return PoolManager.getInstance().CheckOutOne(BeeSlimeFristAttackFighter) as BeeSlimeFristAttackFighter;
      }
      
      protected function get appearedTimes() : int
      {
         return this.m_appearedTimes;
      }
      
      protected function set appearedTimes(value:int) : void
      {
         this.m_appearedTimes = value;
      }
      
      override protected function getBindMovie() : Class
      {
         return BeeSlimeFristAttackFighterMovie;
      }
      
      override public function a_1797(stFieldGrid:a_3491) : Boolean
      {
         super.a_1797(stFieldGrid);
         a_1309 = 2.5 * 20;
         a_1311 = BeeSlimeDefine.a_3965(a_1094);
         this.bornIndex = 0;
         this.appearedTimes = 0;
         this.m_isShowAddSmall = false;
         return true;
      }
      
      override public function a_3954(iCurrentTime:int) : Boolean
      {
         var stLastWaitShot:a_4348 = null;
         var numShotXpos:Number = NaN;
         var i:int = 0;
         var stStartField:a_3491 = null;
         var j:int = 0;
         if(this.appearedTimes == 0)
         {
            this.appearedTimes = iCurrentTime;
         }
         if(this.m_isShowAddSmall && iCurrentTime % 2 == 0)
         {
            if(a_1273 == 35)
            {
               this.addSmallDefense();
            }
            else if(a_1273 == 37)
            {
               this.m_isShowAddSmall = false;
            }
         }
         if(iCurrentTime - this.appearedTimes != 0 && (iCurrentTime - this.appearedTimes) % (10 * 20) == 0)
         {
            if(this.CaculateCanAddDefence())
            {
               a_1275 = 0;
               a_1307 = 12;
               this.gotoAndStop((a_1276[2] as FrameLabel).frame);
               this.m_isShowAddSmall = true;
            }
         }
         if(this.m_isShowAddSmall)
         {
            return false;
         }
         if(iCurrentTime > m_iPlaceTimeIntervals + a_1308 && iCurrentTime >= a_1321 + a_1309)
         {
            if(BeeSlimeDefine.GetFieldIntruderNumForAheadDirection(a_1334) <= 0)
            {
               return true;
            }
            a_1324.length = 0;
            for(j = 0; j < 2; j++)
            {
               stLastWaitShot = BeeSlimeFristShot.a_4344();
               if(null == stLastWaitShot)
               {
                  return false;
               }
               a_1324.push(stLastWaitShot);
            }
            a_1321 = iCurrentTime;
            a_1323 = 0;
            a_1307 = 12;
            a_1275 = 0;
            this.gotoAndStop((a_1276[1] as FrameLabel).frame);
         }
         if(iCurrentTime - a_1321 == a_1310 + a_1317 * a_1323 && a_1324.length > 0)
         {
            numShotXpos = 55;
            if(a_1283)
            {
               numShotXpos = -numShotXpos;
            }
            stLastWaitShot = a_1324.pop();
            if(stLastWaitShot)
            {
               stLastWaitShot.a_1797(0,a_1312,a_1311,x + numShotXpos,y + 17,a_1334.m_stCurrentBattbleFieldView,a_1334);
               a_1334.m_stCurrentBattbleFieldView.AddToBattleView(stLastWaitShot,BattleLayerDefine.SHOT_TYPE,a_1334);
            }
            if(a_1324.length > 0)
            {
               ++a_1323;
            }
         }
         return true;
      }
      
      override public function gotoAndStop(frame:Object, scene:String = null) : void
      {
         super.gotoAndStop(frame,scene);
      }
      
      private function addSmallDefense() : void
      {
         var addResult:Boolean = false;
         var stInitialFieldGrid:a_3491 = null;
         var stSmallSlimeDefense:a_3953 = a_4012.getInstance().a_4013(286394526) as a_3953;
         if(stSmallSlimeDefense)
         {
            stSmallSlimeDefense.iDefenseTypeID = 286394526;
            stSmallSlimeDefense.a_1094 = a_1094;
            stSmallSlimeDefense.m_iSkillDegree = m_iSkillDegree;
            stSmallSlimeDefense.m_iPlaceTimeIntervals = a_1334.m_stCurrentBattbleFieldView.iTimeIntervalNum;
            stSmallSlimeDefense.m_iDefenseGlobalID = a_1334.m_stCurrentBattbleFieldView.a_2180();
            addResult = a_1334.m_stCurrentBattbleFieldView.a_3441(stSmallSlimeDefense,this.stTargetFieldGrid.m_iXGridNo,this.stTargetFieldGrid.m_iYGridNo);
            if(addResult)
            {
               stInitialFieldGrid = a_1334.m_stCurrentBattbleFieldView.a_3438(this.stTargetFieldGrid.m_iXGridNo,this.stTargetFieldGrid.m_iYGridNo);
               a_3962.a_1088.a_2059(stSmallSlimeDefense.m_iDefenseGlobalID,stSmallSlimeDefense.a_3512(),stInitialFieldGrid.m_iInitialXGridNo,stInitialFieldGrid.m_iInitialYGridNo,0,0,a_1094);
               stSmallSlimeDefense.a_3940();
            }
            else
            {
               stSmallSlimeDefense.a_3940();
            }
         }
      }
      
      public function CaculateCanAddDefence() : Boolean
      {
         var index:int = 0;
         var m_iXGridNo:int = 0;
         var m_iYGridNo:int = 0;
         var stSmallSlimeDefense:a_3953 = null;
         if(stFieldGrid == null)
         {
            return false;
         }
         var canAdd:Boolean = false;
         for(var j:int = 0; j < this.m_arrPos.length; j++)
         {
            ++this.bornIndex;
            if(this.bornIndex >= this.m_arrPos.length)
            {
               this.bornIndex = 0;
            }
            m_iXGridNo = stFieldGrid.m_iXGridNo + this.m_arrPos[this.bornIndex][0];
            m_iYGridNo = stFieldGrid.m_iYGridNo + this.m_arrPos[this.bornIndex][1];
            this.stTargetFieldGrid = a_1334.m_stCurrentBattbleFieldView.a_3438(m_iXGridNo,m_iYGridNo);
            stSmallSlimeDefense = a_4012.getInstance().a_4013(286394526) as a_3953;
            if(this.a_3443(stSmallSlimeDefense,this.stTargetFieldGrid))
            {
               canAdd = true;
               break;
            }
         }
         return canAdd;
      }
      
      public function a_3443(attackFighter:a_3953, stFieldGrid:a_3491) : Boolean
      {
         if(stFieldGrid == null || null == attackFighter || null != stFieldGrid.m_stAttackFighter || null != stFieldGrid.m_stBoomDefense || null != stFieldGrid.m_stBaseAuxiliaryFighter || null != stFieldGrid.m_stFlowerDefense || !attackFighter.isCanInWater && stFieldGrid.m_isNeedTray && null == stFieldGrid.m_stTrayDefense || attackFighter.isCanInWater && (!stFieldGrid.m_isNeedTray || stFieldGrid.m_isNeedTray && null != stFieldGrid.m_stTrayDefense) || attackFighter.isOnlyOnTray && null == stFieldGrid.m_stTrayDefense || stFieldGrid.m_isExistMouseHole || stFieldGrid.m_iFieldGridType != 0)
         {
            return false;
         }
         return true;
      }
      
      override protected function a_3955() : Number
      {
         return 0.5 * width;
      }
      
      override protected function a_3956() : Number
      {
         return 0.1 * height;
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
      
      override protected function a_3964() : int
      {
         return BeeSlimeDefine.a_3964(m_iSkillDegree);
      }
      
      override public function a_3940() : Boolean
      {
         super.a_3940();
         this.m_appearedTimes = 0;
         return true;
      }
   }
}

