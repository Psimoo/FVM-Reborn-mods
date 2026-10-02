package com.aurora.ui.maogoutd.resource.defender.TigerYear.ElectricTiger
{
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.Intruder.newBoss.BaseBossMoveIntruder;
   import com.aurora.ui.maogoutd.resource.shot.a_4348;
   import flash.display.FrameLabel;
   import flash.geom.Point;
   
   public class ElectricTigerSecondAttackFighterShot extends a_4348
   {
      
      private static var ms_stElectricTigerSecondAttackFighterShotVector:Array = new Array();
      
      public var m_isParentAttackDie:Boolean = false;
      
      private var startPosition:Point;
      
      private var TargetMouse:a_4206;
      
      private var tempMouseOne:a_4206;
      
      private var tempMouseTwo:a_4206;
      
      private var tempMouseThree:a_4206;
      
      private var stSputteShotArr:Array = new Array();
      
      private var appearedTimes:int = 0;
      
      private var dis:Number;
      
      private var m_targetMouseArray:Array = new Array();
      
      private var m_MouseArr:Array = new Array(8392723,8389315,8388773,8389220,8389219,8389116,8388743,8388727,8388642,8388627);
      
      private var stTempPosition:Point;
      
      public function ElectricTigerSecondAttackFighterShot()
      {
         super();
         a_1279 = 6 - 42 + 10 + 10;
         m_iYDisplayCenterPos = -63 + 15 + 28;
         a_1588 = true;
         a_1275 = 0;
      }
      
      public static function a_4344() : a_4348
      {
         var stElectricTigerSecondAttackFighterShot:ElectricTigerSecondAttackFighterShot = ms_stElectricTigerSecondAttackFighterShotVector.pop();
         if(null == stElectricTigerSecondAttackFighterShot)
         {
            stElectricTigerSecondAttackFighterShot = new ElectricTigerSecondAttackFighterShot();
         }
         BattleFieldView.a_1017.play();
         return stElectricTigerSecondAttackFighterShot;
      }
      
      override protected function getBindMovie() : Class
      {
         return ElectricTigerSecondAttackFighterShotMovie;
      }
      
      override public function a_1797(iGlobalID:int, numSpeed:Number, iHurtPower:int, iXpos:int, iYpos:int, stCurrentBattleView:BattleFieldView, stStartFieldGrid:a_3491, isBothWayShot:Boolean = false, numHotMultiplier:Number = 1, iThreeRowShotType:int = 0) : Boolean
      {
         var stSputteShot:ElectricTigerSputterShot = null;
         if(a_1283)
         {
            iXpos = stStartFieldGrid.m_iXGridNo * a_3491.a_1080 - 30;
            iYpos = stStartFieldGrid.m_iYGridNo * a_3491.a_1081 - 10;
         }
         else
         {
            iXpos = stStartFieldGrid.m_iXGridNo * a_3491.a_1080 + 30;
            iYpos = stStartFieldGrid.m_iYGridNo * a_3491.a_1081 - 10;
         }
         this.startPosition = new Point(iXpos,iYpos);
         this.CaculateScale();
         a_1271 = true;
         if(this.TargetMouse != null)
         {
            this.TargetMouse.m_isShowShandian = true;
         }
         super.a_1797(iGlobalID,0,iHurtPower,iXpos,iYpos,stCurrentBattleView,stStartFieldGrid,isBothWayShot,numHotMultiplier,iThreeRowShotType);
         m_isPenetrate = true;
         this.m_isParentAttackDie = false;
         this.appearedTimes = 0;
         while(this.stSputteShotArr.length > 0)
         {
            stSputteShot = this.stSputteShotArr.pop();
            stSputteShot.a_4350();
         }
         this.tempMouseOne = null;
         if(this.a_3431(this.stTargetMouse) > 0)
         {
            this.tempMouseOne = this.m_targetMouseArray[0];
            this.RealeaseSputterShotOne(this.stTargetMouse);
         }
         if(this.tempMouseOne != null)
         {
            this.tempMouseTwo = null;
            if(this.a_3431(this.tempMouseOne) > 0)
            {
               this.tempMouseTwo = this.m_targetMouseArray[0];
               this.RealeaseSputterShotTwo(this.tempMouseOne);
            }
         }
         if(this.tempMouseTwo != null)
         {
            this.tempMouseThree = null;
            if(this.a_3431(this.tempMouseTwo) > 0)
            {
               this.tempMouseThree = this.m_targetMouseArray[0];
               this.RealeaseSputterShotThree(this.tempMouseTwo);
            }
         }
         return true;
      }
      
      override public function a_4216(iCurrentTime:int) : void
      {
         if(iCurrentTime % 2 == 0)
         {
            nextFrame();
            if(a_1278 != null)
            {
               gotoAndStop((a_1276[a_1275] as FrameLabel).frame);
            }
            if(a_1273 == a_1274)
            {
               gotoAndStop((a_1276[0] as FrameLabel).frame);
            }
         }
         if(this.appearedTimes == 0)
         {
            this.appearedTimes = iCurrentTime;
         }
         if(this.m_isParentAttackDie)
         {
            this.a_3940();
            return;
         }
         if(Boolean(this.stTargetMouse) && Boolean(this.stTargetMouse.parent) && this.stTargetMouse.iLifeValue > 0)
         {
            if(Math.abs(this.stTargetMouse.m_stCurrentFieldGrid.m_iXGridNo - a_1584.m_iXGridNo) > 3 || Math.abs(this.stTargetMouse.m_stCurrentFieldGrid.m_iYGridNo - a_1584.m_iYGridNo) > 3)
            {
               this.a_3940();
               return;
            }
            if((iCurrentTime - this.appearedTimes) % (1 * 20) == 0)
            {
               if(!(this.stTargetMouse != null && this.stTargetMouse.m_stCurrentFieldGrid != null && this.stTargetMouse.iLifeValue > 0))
               {
                  this.a_3940();
                  return;
               }
               if(this.stTargetMouse.iLifeValue - GetFinalDamage() <= 0)
               {
                  this.stTargetMouse.iDIYLife = 0;
                  if(!this.stTargetMouse.isCannotSeeByInsurance)
                  {
                     this.stTargetMouse.ShowBoomDieEffect();
                     this.stTargetMouse.a_3432();
                  }
                  else
                  {
                     this.stTargetMouse.a_3969(GetFinalDamage());
                  }
                  return;
               }
               this.stTargetMouse.a_3969(GetFinalDamage());
            }
            if(iCurrentTime - this.appearedTimes >= 3 * 20)
            {
               this.a_3940();
               return;
            }
            this.CaculateScale();
            return;
         }
         this.a_3940();
      }
      
      public function CaculateScale() : void
      {
         var MouseY:Number = NaN;
         var MouseX:Number = NaN;
         var dy:Number = NaN;
         var dx:Number = NaN;
         var ratation:Number = NaN;
         if(this.stTargetMouse != null && this.startPosition != null)
         {
            MouseY = this.stTargetMouse.y + this.stTargetMouse.stDisplayBitmap.y + this.stTargetMouse.height / 2;
            MouseX = this.stTargetMouse.x + this.stTargetMouse.stDisplayBitmap.x + this.stTargetMouse.width / 2;
            dy = MouseY - this.startPosition.y;
            dx = MouseX - this.startPosition.x;
            ratation = Math.atan2(dy,dx);
            this.rotation = ratation * 180 / Math.PI;
            this.dis = Point.distance(this.startPosition,new Point(MouseX,MouseY));
            stOriginalMovieClip.bgMask.width = this.dis;
            stOriginalMovieClip.mc_end.x = this.dis - 12;
         }
         else
         {
            this.a_3940();
         }
      }
      
      public function a_3431(baseMoveIntruder:a_4206) : int
      {
         var tempFG:a_3491 = null;
         var xIndex:int = 0;
         var stMoveIntruder:a_4206 = null;
         var xx:a_4206 = null;
         if(baseMoveIntruder == null || baseMoveIntruder != null && baseMoveIntruder.m_stCurrentFieldGrid == null)
         {
            return 0;
         }
         var MouseY:Number = baseMoveIntruder.y + baseMoveIntruder.stDisplayBitmap.y + baseMoveIntruder.height / 2;
         var MouseX:Number = baseMoveIntruder.x + baseMoveIntruder.stDisplayBitmap.x + baseMoveIntruder.width / 2;
         this.stTempPosition = new Point(MouseX,MouseY);
         var startFieldGrid:a_3491 = baseMoveIntruder.m_stCurrentFieldGrid;
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
                     if(stMoveIntruder != this.stTargetMouse && stMoveIntruder != this.tempMouseOne && stMoveIntruder != this.tempMouseTwo && stMoveIntruder.iLifeValue > 0 && !stMoveIntruder.isCannotSeeByFighter && (stMoveIntruder.iSpaceState == 0 || stMoveIntruder.iSpaceState == 2))
                     {
                        if(stMoveIntruder is BaseBossMoveIntruder)
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
         for(var i:int = 0; i < this.m_targetMouseArray.length; i++)
         {
            xx = this.m_targetMouseArray[i];
            trace("溅射目标m_iXGridNo::" + xx.m_stCurrentFieldGrid.m_iXGridNo + "溅射目标m_iYGridNo" + xx.m_stCurrentFieldGrid.m_iYGridNo);
         }
         return this.m_targetMouseArray.length;
      }
      
      private function OnSortToken(a:a_4206, b:a_4206) : int
      {
         var aMouseY:Number = a.y + a.stDisplayBitmap.y + a.height / 2;
         var aMouseX:Number = a.x + a.stDisplayBitmap.x + a.width / 2;
         var bMouseY:Number = b.y + b.stDisplayBitmap.y + b.height / 2;
         var bMouseX:Number = b.x + a.stDisplayBitmap.x + b.width / 2;
         var disa:Number = Point.distance(this.stTempPosition,new Point(aMouseX,aMouseY));
         var disb:Number = Point.distance(this.stTempPosition,new Point(bMouseX,bMouseY));
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
      
      private function RealeaseSputterShotOne(baseMoveIntruder:a_4206) : void
      {
         var stFieldGrid:a_3491 = baseMoveIntruder.m_stCurrentFieldGrid;
         if(stFieldGrid == null)
         {
            return;
         }
         var stPoisonShot:a_4348 = ElectricTigerSputterShot.a_4344();
         ElectricTigerSputterShot(stPoisonShot).stParentMouse = baseMoveIntruder;
         ElectricTigerSputterShot(stPoisonShot).stTargetMouse = this.tempMouseOne;
         var iPosX:int = baseMoveIntruder.x + baseMoveIntruder.stDisplayBitmap.x + baseMoveIntruder.width / 2;
         var iPosY:int = baseMoveIntruder.y + baseMoveIntruder.stDisplayBitmap.y + baseMoveIntruder.height / 2;
         stPoisonShot.a_1797(0,0,a_1579 * 1,iPosX,iPosY,stFieldGrid.m_stCurrentBattbleFieldView,stFieldGrid);
         stFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(stPoisonShot,BattleLayerDefine.SHOT_TYPE,stFieldGrid);
         this.stSputteShotArr.push(stPoisonShot);
      }
      
      private function RealeaseSputterShotTwo(baseMoveIntruder:a_4206) : void
      {
         var stFieldGrid:a_3491 = baseMoveIntruder.m_stCurrentFieldGrid;
         if(stFieldGrid == null)
         {
            return;
         }
         var stPoisonShot:a_4348 = ElectricTigerSputterShot.a_4344();
         ElectricTigerSputterShot(stPoisonShot).stParentMouse = baseMoveIntruder;
         ElectricTigerSputterShot(stPoisonShot).stTargetMouse = this.tempMouseTwo;
         var iPosX:int = baseMoveIntruder.x + baseMoveIntruder.stDisplayBitmap.x + baseMoveIntruder.width / 2;
         var iPosY:int = baseMoveIntruder.y + baseMoveIntruder.stDisplayBitmap.y + baseMoveIntruder.height / 2;
         stPoisonShot.a_1797(0,0,a_1579 * 1,iPosX,iPosY,stFieldGrid.m_stCurrentBattbleFieldView,stFieldGrid);
         stFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(stPoisonShot,BattleLayerDefine.SHOT_TYPE,stFieldGrid);
         this.stSputteShotArr.push(stPoisonShot);
      }
      
      private function RealeaseSputterShotThree(baseMoveIntruder:a_4206) : void
      {
         var stFieldGrid:a_3491 = baseMoveIntruder.m_stCurrentFieldGrid;
         if(stFieldGrid == null)
         {
            return;
         }
         var stPoisonShot:a_4348 = ElectricTigerSputterShot.a_4344();
         ElectricTigerSputterShot(stPoisonShot).stParentMouse = baseMoveIntruder;
         ElectricTigerSputterShot(stPoisonShot).stTargetMouse = this.tempMouseThree;
         var iPosX:int = baseMoveIntruder.x + baseMoveIntruder.stDisplayBitmap.x + baseMoveIntruder.width / 2;
         var iPosY:int = baseMoveIntruder.y + baseMoveIntruder.stDisplayBitmap.y + baseMoveIntruder.height / 2;
         stPoisonShot.a_1797(0,0,a_1579 * 1,iPosX,iPosY,stFieldGrid.m_stCurrentBattbleFieldView,stFieldGrid);
         stFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(stPoisonShot,BattleLayerDefine.SHOT_TYPE,stFieldGrid);
         this.stSputteShotArr.push(stPoisonShot);
      }
      
      override protected function a_3940() : Boolean
      {
         var stVector:Array = null;
         var stSputteShot:ElectricTigerSputterShot = null;
         while(m_HitMouseArray.length > 0)
         {
            m_HitMouseArray.pop();
         }
         if(a_1583)
         {
            stVector = a_1583.m_stBaseShotVector[m_iYGridNo];
            if(-1 != stVector.indexOf(this))
            {
               stVector.splice(stVector.indexOf(this),1);
            }
         }
         if(parent)
         {
            parent.removeChild(this);
         }
         visible = false;
         gotoAndStop(1);
         if(-1 == ms_stElectricTigerSecondAttackFighterShotVector.indexOf(this))
         {
            ms_stElectricTigerSecondAttackFighterShotVector.push(this);
         }
         while(this.stSputteShotArr.length > 0)
         {
            stSputteShot = this.stSputteShotArr.pop();
            stSputteShot.m_isParentAttackDie = true;
         }
         if(this.TargetMouse != null)
         {
            this.TargetMouse.m_isShowShandian = false;
         }
         if(this.tempMouseOne != null)
         {
            this.tempMouseOne.m_isShowShandian = false;
         }
         if(this.tempMouseTwo != null)
         {
            this.tempMouseTwo.m_isShowShandian = false;
         }
         if(this.tempMouseThree != null)
         {
            this.tempMouseThree.m_isShowShandian = false;
         }
         this.m_isParentAttackDie = false;
         return true;
      }
      
      public function get stTargetMouse() : a_4206
      {
         return this.TargetMouse;
      }
      
      public function set stTargetMouse(value:a_4206) : void
      {
         this.TargetMouse = value;
      }
   }
}

