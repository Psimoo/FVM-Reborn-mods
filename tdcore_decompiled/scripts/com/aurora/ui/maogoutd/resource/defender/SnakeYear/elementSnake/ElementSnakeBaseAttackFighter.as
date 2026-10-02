package com.aurora.ui.maogoutd.resource.defender.SnakeYear.elementSnake
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.defender.SnakeYear.elementSnake.shot.BulletElementBaseShot;
   import com.aurora.ui.maogoutd.resource.defender.SnakeYear.elementSnake.shot.PurpleElementBaseShot;
   import com.aurora.ui.maogoutd.resource.defender.SnakeYear.elementSnake.shot.RedElementBaseShot;
   import com.aurora.ui.maogoutd.resource.defender.SnakeYear.elementSnake.shot.YellowElementBaseShot;
   import com.aurora.ui.maogoutd.resource.defender.a_3953;
   import com.aurora.ui.maogoutd.resource.shot.a_4348;
   import flash.display.FrameLabel;
   
   public class ElementSnakeBaseAttackFighter extends a_3953
   {
      
      private static const SHOT_SEQUENCE:Array = [{
         "shotClass":YellowElementBaseShot,
         "lastShotIndex":1,
         "nextWaitIndex":2
      },{
         "shotClass":PurpleElementBaseShot,
         "lastShotIndex":3,
         "nextWaitIndex":4
      },{
         "shotClass":BulletElementBaseShot,
         "lastShotIndex":5,
         "nextWaitIndex":6
      },{
         "shotClass":RedElementBaseShot,
         "lastShotIndex":7,
         "nextWaitIndex":0
      }];
      
      private var totalShotCount:int = 0;
      
      private var m_nextWaiteIndex:int = 0;
      
      private var m_lastShotIndex:int = 0;
      
      public function ElementSnakeBaseAttackFighter()
      {
         super();
         a_1095 = ElementSnakeDefine.DEFENSE_PRICE;
         a_1313 = true;
         a_1317 = 3;
         a_1338 = 0;
         a_1337 = 0;
         a_1310 = 10;
      }
      
      public static function a_3926() : a_3953
      {
         return PoolManager.getInstance().CheckOutOne(ElementSnakeBaseAttackFighter) as ElementSnakeBaseAttackFighter;
      }
      
      override protected function getBindMovie() : Class
      {
         return ElementSnakeBaseAttackFighterMovie;
      }
      
      override public function a_1797(stFieldGrid:a_3491) : Boolean
      {
         super.a_1797(stFieldGrid);
         a_1309 = ElementSnakeDefine.a_3966(m_iSkillDegree);
         a_1311 = ElementSnakeDefine.a_3965(a_1094);
         this.totalShotCount = this.m_nextWaiteIndex = this.m_lastShotIndex = 0;
         if(a_1336)
         {
            a_1336.y += 4;
         }
         return true;
      }
      
      override protected function a_3964() : int
      {
         return ElementSnakeDefine.a_3964();
      }
      
      override public function a_3969(iRduceLifeValue:int) : Boolean
      {
         super.a_3969(iRduceLifeValue);
         return true;
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
         var shotConfig:Object = null;
         if(iCurrentTime > m_iPlaceTimeIntervals + a_1308 && iCurrentTime >= a_1321 + a_1309)
         {
            if(ElementSnakeDefine.GetFieldIntruderNumForAheadDirection(stFieldGrid) <= 0)
            {
               return false;
            }
            a_1324.length = 0;
            ++this.totalShotCount;
            shotConfig = SHOT_SEQUENCE[(this.totalShotCount - 1) % SHOT_SEQUENCE.length];
            this.m_lastShotIndex = shotConfig.lastShotIndex;
            this.m_nextWaiteIndex = shotConfig.nextWaitIndex;
            stLastWaitShot = shotConfig.shotClass.a_4344();
            if(stLastWaitShot)
            {
               a_1324.push(stLastWaitShot);
            }
            a_1321 = iCurrentTime;
            a_1323 = 0;
            a_1307 = 1;
            a_1275 = this.m_nextWaiteIndex;
            gotoAndStop((a_1276[this.m_lastShotIndex] as FrameLabel).frame);
         }
         if(iCurrentTime - a_1321 == a_1310 + a_1317 * a_1323 && a_1324.length > 0)
         {
            numShotXpos = a_1283 ? -47 : 47;
            stLastWaitShot = a_1324.pop();
            if(stLastWaitShot)
            {
               stLastWaitShot.a_1797(m_iDefenseGlobalID + this.totalShotCount,a_1312,a_1311,x + numShotXpos,y + 54,a_1334.m_stCurrentBattbleFieldView,a_1334);
               a_1334.m_stCurrentBattbleFieldView.AddToBattleView(stLastWaitShot,BattleLayerDefine.SHOT_TYPE,a_1334);
            }
            if(a_1324.length > 0)
            {
               ++a_1323;
            }
         }
         return true;
      }
      
      override protected function a_3955() : Number
      {
         return width * 0.6;
      }
      
      override protected function a_3956() : Number
      {
         return 0.5 * height;
      }
   }
}

