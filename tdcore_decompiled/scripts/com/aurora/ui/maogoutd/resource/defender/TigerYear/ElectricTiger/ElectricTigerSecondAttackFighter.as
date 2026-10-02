package com.aurora.ui.maogoutd.resource.defender.TigerYear.ElectricTiger
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.Intruder.newBoss.BaseBossMoveIntruder;
   import com.aurora.ui.maogoutd.resource.defender.a_3953;
   import flash.display.FrameLabel;
   import flash.geom.Point;
   
   public class ElectricTigerSecondAttackFighter extends a_3953
   {
      
      private var m_isShoted:Boolean;
      
      private var m_arrShotArray:Array = [];
      
      private var m_targetMouseArray:Array = new Array();
      
      private var m_MouseArr:Array = new Array(8392723,8389315,8388773,8389220,8389219,8389116,8388743,8388727,8388642,8388627);
      
      private var startPosition:Point;
      
      public function ElectricTigerSecondAttackFighter()
      {
         super();
         a_1095 = ElectricTigerDefine.DEFENSE_PRICE;
         a_1333 = true;
      }
      
      public static function a_3926() : a_3953
      {
         return PoolManager.getInstance().CheckOutOne(ElectricTigerSecondAttackFighter) as ElectricTigerSecondAttackFighter;
      }
      
      override protected function getBindMovie() : Class
      {
         return ElectricTigerSecondAttackFighterMovie;
      }
      
      override public function a_1797(stFieldGrid:a_3491) : Boolean
      {
         super.a_1797(stFieldGrid);
         a_1311 = ElectricTigerDefine.a_3965(a_1094);
         a_1309 = ElectricTigerDefine.a_3966(m_iSkillDegree);
         this.startPosition = new Point(stFieldGrid.m_iXGridNo * a_3491.a_1080 + 30,stFieldGrid.m_iYGridNo * a_3491.a_1081 + 30);
         this.m_isShoted = false;
         a_1313 = true;
         a_1275 = 0;
         a_1310 = 12;
         a_1317 = 3;
         a_1339 = 200;
         return true;
      }
      
      override public function a_3954(iCurrentTime:int) : Boolean
      {
         var stLastWaitShot:ElectricTigerSecondAttackFighterShot = null;
         var numShotXpos:Number = NaN;
         var i:int = 0;
         var stStartField:a_3491 = null;
         var stShot:ElectricTigerSecondAttackFighterShot = null;
         var j:int = 0;
         if(iCurrentTime > m_iPlaceTimeIntervals + a_1308 && iCurrentTime >= a_1321 + a_1309)
         {
            if(this.a_3431(stFieldGrid) <= 0)
            {
               return false;
            }
            for each(stShot in this.m_arrShotArray)
            {
               stShot.m_isParentAttackDie = true;
               this.m_arrShotArray.slice(this.m_arrShotArray.indexOf(stShot),1);
            }
            while(a_1324.length > 0)
            {
               stLastWaitShot = a_1324.pop();
               stLastWaitShot.a_4350();
            }
            a_1321 = iCurrentTime;
            for(j = 1; j < 3; j++)
            {
               if(this.m_targetMouseArray.length >= j)
               {
                  stLastWaitShot = ElectricTigerSecondAttackFighterShot.a_4344() as ElectricTigerSecondAttackFighterShot;
                  if(null == stLastWaitShot)
                  {
                     return false;
                  }
                  ElectricTigerSecondAttackFighterShot(stLastWaitShot).stTargetMouse = this.m_targetMouseArray[j - 1];
                  a_1324.push(stLastWaitShot);
               }
            }
            a_1307 = 13;
            a_1323 = 0;
            a_1275 = 0;
            gotoAndStop((a_1276[1] as FrameLabel).frame);
         }
         if(iCurrentTime - a_1321 == a_1310 + a_1317 * a_1323 && a_1324.length > 0)
         {
            numShotXpos = this.a_3955();
            if(a_1283)
            {
               numShotXpos = -numShotXpos;
            }
            stLastWaitShot = a_1324.pop();
            stLastWaitShot.iShotSequenceNum = a_1323;
            ElectricTigerSecondAttackFighterShot(stLastWaitShot).stTargetMouse = this.m_targetMouseArray[a_1323];
            stLastWaitShot.a_1797(0,a_1312,a_1311,x,y,stFieldGrid.m_stCurrentBattbleFieldView,stFieldGrid);
            parent.addChildAt(stLastWaitShot,stFieldGrid.m_stCurrentBattbleFieldView.a_3433());
            this.m_arrShotArray.push(stLastWaitShot);
            if(a_1324.length > 0)
            {
               ++a_1323;
            }
         }
         return true;
      }
      
      public function a_3431(startFieldGrid:a_3491) : int
      {
         var tempFG:a_3491 = null;
         var xIndex:int = 0;
         var stMoveIntruder:a_4206 = null;
         if(startFieldGrid == null)
         {
            return 0;
         }
         while(this.m_targetMouseArray.length > 0)
         {
            this.m_targetMouseArray.pop();
         }
         var iTotalIntruderNum:int = 0;
         var xStart:int = Math.max(startFieldGrid.m_iXGridNo - 3,0);
         var xEnd:int = Math.min(startFieldGrid.m_iXGridNo + 3,BattleFieldView.a_1011 - 1);
         var yStart:int = Math.max(startFieldGrid.m_iYGridNo - 3,0);
         var yEnd:int = Math.min(startFieldGrid.m_iYGridNo + 3,BattleFieldView.a_1012 - 1);
         var numDistance:Number = -1;
         var bossArray:Array = new Array();
         var eliteArray:Array = new Array();
         var normalArray:Array = new Array();
         for(var yIndex:int = yStart; yIndex <= yEnd; yIndex++)
         {
            for(xIndex = xStart; xIndex <= xEnd; xIndex++)
            {
               tempFG = startFieldGrid.m_stCurrentBattbleFieldView.a_3438(xIndex,yIndex);
               if(tempFG)
               {
                  for each(stMoveIntruder in tempFG.a_1511)
                  {
                     if(stMoveIntruder.iLifeValue > 0 && !stMoveIntruder.isCannotSeeByFighter && (stMoveIntruder.iSpaceState == 0 || stMoveIntruder.iSpaceState == 2))
                     {
                        if(stMoveIntruder is BaseBossMoveIntruder || stMoveIntruder.isCannotSeeByInsurance)
                        {
                           bossArray.push(stMoveIntruder);
                        }
                        else if(this.m_MouseArr.indexOf(stMoveIntruder.m_stMoveIntruderTypeID) != -1)
                        {
                           eliteArray.push(stMoveIntruder);
                        }
                        else
                        {
                           normalArray.push(stMoveIntruder);
                        }
                     }
                  }
               }
            }
         }
         bossArray.sort(this.OnSortToken);
         eliteArray.sort(this.OnSortToken);
         normalArray.sort(this.OnSortToken);
         this.m_targetMouseArray = this.m_targetMouseArray.concat(bossArray).concat(eliteArray).concat(normalArray);
         return this.m_targetMouseArray.length;
      }
      
      private function OnSortToken(a:a_4206, b:a_4206) : int
      {
         var aMouseY:Number = a.y + a.stDisplayBitmap.y + a.height / 2;
         var aMouseX:Number = a.x + a.stDisplayBitmap.x + a.width / 2;
         var bMouseY:Number = b.y + b.stDisplayBitmap.y + b.height / 2;
         var bMouseX:Number = b.x + a.stDisplayBitmap.x + b.width / 2;
         var disa:Number = Point.distance(this.startPosition,new Point(aMouseX,aMouseY));
         var disb:Number = Point.distance(this.startPosition,new Point(bMouseX,bMouseY));
         if(Math.abs(disa) < Math.abs(disb))
         {
            return -1;
         }
         if(Math.abs(disa) > Math.abs(disb))
         {
            return 1;
         }
         return 0;
      }
      
      override protected function a_3964() : int
      {
         return ElectricTigerDefine.a_3964(m_iSkillDegree);
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
         var stShot:ElectricTigerSecondAttackFighterShot = null;
         super.a_3940();
         for each(stShot in this.m_arrShotArray)
         {
            stShot.m_isParentAttackDie = true;
            this.m_arrShotArray.slice(this.m_arrShotArray.indexOf(stShot),1);
         }
         this.m_arrShotArray = [];
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

