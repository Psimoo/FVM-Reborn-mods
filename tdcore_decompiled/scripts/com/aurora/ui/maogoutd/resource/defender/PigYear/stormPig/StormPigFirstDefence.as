package com.aurora.ui.maogoutd.resource.defender.PigYear.stormPig
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.defender.a_3953;
   import com.aurora.ui.maogoutd.resource.shot.a_4348;
   import flash.display.FrameLabel;
   
   public class StormPigFirstDefence extends a_3953
   {
      
      private var m_isShoted:Boolean;
      
      private var hasHitMouseArray:Array = new Array();
      
      private var hitFieldGrid:Array = new Array();
      
      public function StormPigFirstDefence()
      {
         super();
         a_1312 = 0;
         a_1095 = 225;
         a_1310 = 8;
         a_1338 = 10;
         a_1337 = 5;
         a_1333 = true;
         a_1339 = 60;
         a_1309 = StormPigXiaDefence.a_3966(m_iSkillDegree);
         a_1311 = StormPigXiaDefence.a_3965(a_1094);
      }
      
      public static function a_3926() : a_3953
      {
         return PoolManager.getInstance().CheckOutOne(StormPigFirstDefence,StormPigFirstDefenceMovie) as StormPigFirstDefence;
      }
      
      override public function a_1797(stFieldGrid:a_3491) : Boolean
      {
         a_1310 = 12;
         a_1322 = 0;
         super.a_1797(stFieldGrid);
         this.m_isShoted = false;
         a_1313 = true;
         a_1275 = 0;
         a_1339 = 60;
         a_1309 = StormPigXiaDefence.a_3966(m_iSkillDegree);
         a_1311 = StormPigXiaDefence.a_3965(a_1094);
         tagCom.AddTag(30031);
         return true;
      }
      
      override public function a_3954(iCurrentTime:int) : Boolean
      {
         var stLastWaitShot:a_4348 = null;
         var stNewShot:a_4348 = null;
         var numShotXpos:Number = NaN;
         var i:int = 0;
         var stStartField:a_3491 = null;
         var len:int = 0;
         var k:int = 0;
         var j:int = 0;
         var i2:int = 0;
         var stShot:a_4348 = null;
         var startFieldGrid:a_3491 = null;
         var tempX:int = 0;
         var tempY:int = 0;
         if(iCurrentTime > m_iPlaceTimeIntervals + a_1308 && iCurrentTime >= a_1321 + a_1309)
         {
            this.a_3431(a_1334);
            if(this.hitFieldGrid.length == 0)
            {
               return true;
            }
            a_1321 = iCurrentTime;
            a_1323 = 0;
            for(k = 0; k < a_1324.length; k++)
            {
               a_1324.pop();
            }
            len = this.hitFieldGrid.length <= 7 ? int(this.hitFieldGrid.length) : 7;
            for(j = 0; j < len; j++)
            {
               stLastWaitShot = StormPigFirstShot.a_4344();
               if(null == stLastWaitShot)
               {
                  return false;
               }
               a_1324.push(stLastWaitShot);
            }
            a_1307 = a_1273;
            a_1275 = 0;
            gotoAndStop((a_1276[1] as FrameLabel).frame);
         }
         if(iCurrentTime - a_1321 == a_1310 + a_1317 * a_1323 && a_1324.length > 0)
         {
            len = this.hitFieldGrid.length <= 7 ? int(this.hitFieldGrid.length) : 7;
            for(i2 = 0; i2 < len; i2++)
            {
               stShot = a_1324.pop();
               startFieldGrid = this.hitFieldGrid[i2];
               tempX = startFieldGrid.m_iXGridNo * a_3491.a_1080 + 0.5 * (a_3491.a_1080 - stShot.width);
               tempY = startFieldGrid.m_iInitialYGridNo * a_3491.a_1081 + 0.5 * (a_3491.a_1081 - stShot.height) - 300 + 90;
               stShot.a_1797(0,a_1312,a_1311,tempX,tempY,a_1334.m_stCurrentBattbleFieldView,startFieldGrid);
               parent.addChildAt(stShot,a_1334.m_stCurrentBattbleFieldView.a_3433());
            }
         }
         return true;
      }
      
      public function a_3431(stFieldGrid:a_3491) : void
      {
         var stNearestMoveIntruder:a_4206 = null;
         var stMoveIntruder:a_4206 = null;
         this.hitFieldGrid = new Array();
         var m_arrBaseMoveIntruderVector:Array = a_1334.m_stCurrentBattbleFieldView.m_arrBaseMoveIntruderVector;
         var a_1011:int = BattleFieldView.a_1011;
         for each(stMoveIntruder in m_arrBaseMoveIntruderVector)
         {
            if(stMoveIntruder.iLifeValue > 0 && !stMoveIntruder.isCannotSeeByFighter && 1 != stMoveIntruder.iSpaceState)
            {
               if(stMoveIntruder.m_stCurrentFieldGrid.m_iXGridNo >= 0 && stMoveIntruder.m_stCurrentFieldGrid.m_iXGridNo <= 8)
               {
                  this.hitFieldGrid.push(stMoveIntruder.m_stCurrentFieldGrid);
               }
            }
         }
      }
      
      override protected function a_3964() : int
      {
         return 600;
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
         return width * 0.9;
      }
      
      override protected function a_3956() : Number
      {
         return -0.1 * height;
      }
   }
}

