package com.aurora.ui.maogoutd.resource.defender.RabbitYear.ThreeFingRabbit
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.defender.a_3953;
   import flash.display.FrameLabel;
   import flash.geom.Point;
   
   public class ThreeFingRabbitBaseAttackFighter extends a_3953
   {
      
      private var m_arrShotArray:Array = [];
      
      public var m_shotField:Array = new Array();
      
      public var m_ReciveNum:int;
      
      private var startPosition:Point;
      
      private var shotArr:Array;
      
      public function ThreeFingRabbitBaseAttackFighter()
      {
         super();
         a_1095 = ThreeFingRabbitDefine.DEFENSE_PRICE;
         a_1333 = true;
         a_1313 = true;
         a_1096 = true;
         a_1310 = 8;
         a_1338 = 10;
         a_1337 = 5;
      }
      
      public static function a_3926() : a_3953
      {
         return PoolManager.getInstance().CheckOutOne(ThreeFingRabbitBaseAttackFighter) as ThreeFingRabbitBaseAttackFighter;
      }
      
      override protected function getBindMovie() : Class
      {
         return ThreeFingRabbitBaseAttackFighterMovie;
      }
      
      override public function a_1797(stFieldGrid:a_3491) : Boolean
      {
         super.a_1797(stFieldGrid);
         a_1309 = ThreeFingRabbitDefine.a_3965(a_1094);
         a_1339 = 350;
         this.m_ReciveNum = 0;
         return true;
      }
      
      override public function a_3954(iCurrentTime:int) : Boolean
      {
         var stLastWaitShot:ThreeFingRabbitBaseShot = null;
         var numShotXpos:Number = NaN;
         var i:int = 0;
         var stStartField:a_3491 = null;
         var k:int = 0;
         if(iCurrentTime > m_iPlaceTimeIntervals + a_1308 && iCurrentTime >= a_1321 + a_1309)
         {
            while(a_1324.length > 0)
            {
               stLastWaitShot = a_1324.pop();
               stLastWaitShot.a_4350();
            }
            if(this.CaculateField() <= 0)
            {
               return false;
            }
            a_1321 = iCurrentTime;
            for(k = 0; k < this.m_shotField.length; k++)
            {
               this.addShot(this.m_shotField[k]);
            }
            a_1307 = 10;
            a_1323 = 0;
            a_1275 = 0;
            gotoAndStop((a_1276[1] as FrameLabel).frame);
         }
         if(iCurrentTime - a_1321 == a_1310 + a_1317 * a_1323 && a_1324.length > 0)
         {
            while(a_1324.length > 0)
            {
               stLastWaitShot = a_1324.pop();
               if(stLastWaitShot)
               {
                  stLastWaitShot.iShotSequenceNum = a_1323;
                  stLastWaitShot.a_1797(0,a_1312,a_1311,stLastWaitShot.x,stLastWaitShot.y,stFieldGrid.m_stCurrentBattbleFieldView,stFieldGrid);
                  stFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(stLastWaitShot,BattleLayerDefine.SHOT_TYPE,stFieldGrid);
               }
            }
            if(a_1324.length > 0)
            {
               ++a_1323;
            }
         }
         return true;
      }
      
      public function CaculateField() : int
      {
         var stDefense:ThreeFingRabbitBaseAttackFighter = null;
         var stTargetField:a_3491 = null;
         var i:int = 0;
         var tempArr:Array = this.m_shotField.concat();
         while(this.m_shotField.length > 0)
         {
            this.m_shotField.pop();
         }
         for(var k:int = 0; k < tempArr.length; k++)
         {
            stTargetField = tempArr[k];
            if(stTargetField != null && stTargetField.m_stAttackFighter != null && stTargetField.m_stAttackFighter is ThreeFingRabbitBaseAttackFighter)
            {
               stDefense = stTargetField.m_stAttackFighter as ThreeFingRabbitBaseAttackFighter;
               if(stDefense.m_ReciveNum + stDefense.m_shotField.length < 2)
               {
                  this.m_shotField.push(stTargetField);
                  ++stDefense.m_ReciveNum;
               }
            }
         }
         var iCnt:int = 0;
         var j:int = stFieldGrid.m_iYGridNo + 1;
         while(j < BattleFieldView.a_1012 && iCnt < 2 - this.m_ReciveNum - this.m_shotField.length)
         {
            i = 0;
            while(i < BattleFieldView.a_1011 && iCnt < 2)
            {
               stTargetField = stFieldGrid.m_stCurrentBattbleFieldView.a_3438(i,j);
               if(stTargetField != null && this.m_shotField.indexOf(stTargetField) == -1 && stTargetField.m_stAttackFighter != null && stTargetField.m_stAttackFighter is ThreeFingRabbitBaseAttackFighter)
               {
                  stDefense = stTargetField.m_stAttackFighter as ThreeFingRabbitBaseAttackFighter;
                  if(stDefense.m_ReciveNum + stDefense.m_shotField.length < 2)
                  {
                     this.m_shotField.push(stTargetField);
                     ++stDefense.m_ReciveNum;
                     iCnt++;
                  }
               }
               i++;
            }
            j++;
         }
         return this.m_shotField.length;
      }
      
      private function addShot(stTargetFiled:a_3491) : void
      {
         var iAllDistance:Number = NaN;
         var stLastWaitShot:ThreeFingRabbitBaseShot = null;
         this.startPosition = new Point(stFieldGrid.m_iXGridNo * a_3491.a_1080 + 53,stFieldGrid.m_iYGridNo * a_3491.a_1081 + 12);
         var MouseY:Number = stTargetFiled.m_iYGridNo * a_3491.a_1081 + 12 + 20;
         var MouseX:Number = stTargetFiled.m_iXGridNo * a_3491.a_1080 + 53;
         iAllDistance = Point.distance(this.startPosition,new Point(MouseX,MouseY));
         var dy:Number = MouseY - this.startPosition.y;
         var dx:Number = MouseX - this.startPosition.x;
         var Ratation:Number = Math.atan2(dy,dx);
         Ratation = Ratation * 180 / Math.PI;
         if(stTargetFiled != null && stTargetFiled.m_stAttackFighter != null && stTargetFiled.m_stAttackFighter is ThreeFingRabbitBaseAttackFighter)
         {
            stLastWaitShot = ThreeFingRabbitBaseShot.a_4344() as ThreeFingRabbitBaseShot;
            stLastWaitShot.rotation = Ratation;
            stLastWaitShot.x = this.startPosition.x;
            stLastWaitShot.y = this.startPosition.y;
            stLastWaitShot.stOriginalMovieClip.bgMask.width = iAllDistance;
            stLastWaitShot.stOriginalMovieClip.m_HitSprite.width = iAllDistance - 35;
            stLastWaitShot.stOriginalMovieClip.mc_end.x = iAllDistance - 16;
            ThreeFingRabbitBaseShot(stLastWaitShot).stTargetField = stTargetFiled;
            a_1324.push(stLastWaitShot);
         }
      }
      
      override protected function a_3964() : int
      {
         return ThreeFingRabbitDefine.a_3964(m_iSkillDegree);
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
      
      override public function a_3940() : Boolean
      {
         var stLastWaitShot:ThreeFingRabbitBaseShot = null;
         var stTargetField:a_3491 = null;
         var stDefense:ThreeFingRabbitBaseAttackFighter = null;
         while(this.m_arrShotArray.length > 0)
         {
            stLastWaitShot = this.m_arrShotArray.pop();
            stLastWaitShot.a_4350();
         }
         this.m_ReciveNum = 0;
         for(var i:int = 0; i < this.m_shotField.length; i++)
         {
            stTargetField = this.m_shotField.pop();
            if(stTargetField != null && stTargetField.m_stAttackFighter != null && stTargetField.m_stAttackFighter is ThreeFingRabbitBaseAttackFighter)
            {
               stDefense = stTargetField.m_stAttackFighter as ThreeFingRabbitBaseAttackFighter;
               if(stDefense.m_ReciveNum > 0)
               {
                  --stDefense.m_ReciveNum;
               }
            }
         }
         super.a_3940();
         return true;
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

