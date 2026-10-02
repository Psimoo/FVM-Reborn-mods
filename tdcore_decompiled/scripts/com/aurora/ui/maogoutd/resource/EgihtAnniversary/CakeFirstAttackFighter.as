package com.aurora.ui.maogoutd.resource.EgihtAnniversary
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.defender.a_3953;
   import com.aurora.ui.maogoutd.resource.shot.a_4348;
   import flash.display.FrameLabel;
   
   public class CakeFirstAttackFighter extends a_3953
   {
      
      private var totalShotCount:int = 0;
      
      private var shotCount:int = 0;
      
      private var m_lastShotType:int = 0;
      
      private var m_nextShotType:int = 0;
      
      private var m_nextWaiteType:int = 0;
      
      public function CakeFirstAttackFighter()
      {
         super();
         a_1335 = 6;
         a_1337 = -18;
         a_1311 = this.a_3965() * 1.5;
         a_1309 = 40 - this.a_3966();
         a_1312 = 15;
         a_1095 = 150;
         a_1339 = 5;
         a_1310 = 12;
         a_1333 = true;
         a_1313 = true;
         a_1317 = 8;
      }
      
      public static function a_3926() : a_3953
      {
         return PoolManager.getInstance().CheckOutOne(CakeFirstAttackFighter,CakeFirstAttackFighterMovie) as CakeFirstAttackFighter;
      }
      
      override public function a_1797(stFieldGrid:a_3491) : Boolean
      {
         a_1310 = 12;
         super.a_1797(stFieldGrid);
         a_1311 = this.a_3965() * 1.5;
         a_1309 = 40 - this.a_3966();
         this.shotCount = 2;
         this.totalShotCount = this.m_nextWaiteType = this.m_lastShotType = this.m_nextShotType = 0;
         if(a_1336)
         {
            a_1336.x += 18;
         }
         return true;
      }
      
      override public function a_3954(iCurrentTime:int) : Boolean
      {
         var stLastWaitShot:a_4348 = null;
         var numShotXpos:Number = NaN;
         if(iCurrentTime > m_iPlaceTimeIntervals + a_1308 && iCurrentTime >= a_1321 + a_1309)
         {
            if(this.GetFieldIntruderNumForFiveDirection(a_1334) <= 0)
            {
               return true;
            }
            a_1321 = iCurrentTime;
            a_1324.length = 0;
            if(this.shotCount <= 0)
            {
               stLastWaitShot = EgihtShapedFirstShot.a_4344();
               this.shotCount = 2;
               this.m_lastShotType = 4;
            }
            else
            {
               stLastWaitShot = CakeShapedFirstShot.a_4344();
               this.m_lastShotType = 1;
               --this.shotCount;
            }
            if(null == stLastWaitShot)
            {
               return false;
            }
            a_1324.push(stLastWaitShot);
            if(this.shotCount <= 0)
            {
               this.m_nextShotType = 1;
            }
            else
            {
               this.m_nextShotType = 0;
            }
            switch(this.m_nextShotType)
            {
               case 2:
                  this.m_nextWaiteType = 3;
                  break;
               case 0:
                  this.m_nextWaiteType = 1;
            }
            if(this.shotCount <= 0)
            {
               this.m_nextShotType = 4;
            }
            else
            {
               this.m_nextShotType = 1;
            }
            switch(this.m_nextShotType)
            {
               case 4:
                  this.m_nextWaiteType = 2;
                  break;
               case 1:
                  this.m_nextWaiteType = 5;
            }
            a_1307 = 0;
            a_1275 = this.m_nextWaiteType;
            gotoAndStop((a_1276[this.m_lastShotType] as FrameLabel).frame);
         }
         if(iCurrentTime - a_1321 == a_1310 && a_1324.length > 0)
         {
            numShotXpos = 92;
            if(a_1283)
            {
               numShotXpos = -numShotXpos;
            }
            stLastWaitShot = a_1324.pop();
            if(stLastWaitShot)
            {
               stLastWaitShot.a_1797(0,a_1312,a_1311,x + numShotXpos,y,a_1334.m_stCurrentBattbleFieldView,a_1334);
               a_1334.m_stCurrentBattbleFieldView.AddToBattleView(stLastWaitShot,BattleLayerDefine.SHOT_TYPE,a_1334);
            }
         }
         return true;
      }
      
      public function GetFieldIntruderNumForFiveDirection(stFieldGrid:a_3491) : int
      {
         var iTotalIntruderNum:int = 0;
         var i:int = 0;
         if(stFieldGrid)
         {
            for(i = stFieldGrid.m_iXGridNo; i < BattleFieldView.a_1011; i++)
            {
               iTotalIntruderNum += a_1334.m_stCurrentBattbleFieldView.a_3438(i,stFieldGrid.m_iYGridNo).a_1511.length;
            }
         }
         return iTotalIntruderNum;
      }
      
      override protected function a_3964() : int
      {
         return 70;
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
            nextFrame();
            if(a_1273 == 70)
            {
               a_1275 = 0;
               gotoAndStop((a_1276[a_1275] as FrameLabel).frame);
            }
            else if(a_1273 == 35)
            {
               a_1275 = 3;
               gotoAndStop((a_1276[a_1275] as FrameLabel).frame);
            }
            else if(a_1278 != null)
            {
               gotoAndStop((a_1276[a_1275] as FrameLabel).frame);
            }
            if(a_1273 == a_1274)
            {
               gotoAndStop(a_1307);
            }
            super.ShowPlayOther(iCurrentTime);
         }
      }
      
      override protected function a_3955() : Number
      {
         return width * 0.9;
      }
      
      override protected function a_3956() : Number
      {
         return -0.1 * height;
      }
      
      override protected function a_3965() : int
      {
         var iStarDegreeEffect:Number = 4.5;
         switch(a_1094)
         {
            case 0:
               iStarDegreeEffect = 4.5;
               break;
            case 1:
               iStarDegreeEffect = 5.5;
               break;
            case 2:
               iStarDegreeEffect = 6.5;
               break;
            case 3:
               iStarDegreeEffect = 7;
               break;
            case 4:
               iStarDegreeEffect = 9;
               break;
            case 5:
               iStarDegreeEffect = 11;
               break;
            case 6:
               iStarDegreeEffect = 14;
               break;
            case 7:
               iStarDegreeEffect = 17;
               break;
            case 8:
               iStarDegreeEffect = 20;
               break;
            case 9:
               iStarDegreeEffect = 23;
               break;
            case 10:
               iStarDegreeEffect = 28;
               break;
            case 11:
               iStarDegreeEffect = 36;
               break;
            case 12:
               iStarDegreeEffect = 45;
               break;
            case 13:
               iStarDegreeEffect = 55;
               break;
            case 14:
               iStarDegreeEffect = 66;
               break;
            case 15:
               iStarDegreeEffect = 78;
               break;
            case 16:
               iStarDegreeEffect = 90;
         }
         return 10 * iStarDegreeEffect;
      }
      
      override protected function a_3966() : int
      {
         switch(m_iSkillDegree)
         {
            case 0:
               return 0;
            case 1:
               return 1;
            case 2:
               return 2;
            case 3:
               return 3;
            case 4:
               return 4;
            case 5:
               return 5;
            case 6:
               return 6;
            case 7:
               return 7;
            case 8:
               return 10;
            default:
               return 0;
         }
      }
   }
}

