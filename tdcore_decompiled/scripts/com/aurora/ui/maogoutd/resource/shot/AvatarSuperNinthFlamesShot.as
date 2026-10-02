package com.aurora.ui.maogoutd.resource.shot
{
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import flash.display.FrameLabel;
   
   public class AvatarSuperNinthFlamesShot extends a_4348
   {
      
      private static var ms_stAvatarSuperNinthFlamesShotVector:Array = new Array();
      
      private static const ADD_DIC:Array = [[6,0],[7,0],[8,0],[6,1],[8,1],[6,2],[8,2],[6,3],[7,3],[8,3],[8,4],[8,5],[6,6],[7,6],[8,6]];
      
      public var a_1598:a_3491;
      
      public var m_iTransEnergyCount:int = 5;
      
      public var m_iFlag:Boolean = true;
      
      public var m_iSupperingRate:Number = 0;
      
      public var m_GemoLevel:int = -1;
      
      public function AvatarSuperNinthFlamesShot()
      {
         super();
         a_1279 = -width * 0.3;
         a_1573 = 1;
         a_1576 = true;
         a_1588 = true;
         a_1275 = 0;
         a_1587 = 1;
         this.m_iFlag = false;
      }
      
      public static function a_4344() : a_4348
      {
         var stAvatarSuperNinthFlamesShot:AvatarSuperNinthFlamesShot = ms_stAvatarSuperNinthFlamesShotVector.pop();
         if(null == stAvatarSuperNinthFlamesShot)
         {
            stAvatarSuperNinthFlamesShot = new AvatarSuperNinthFlamesShot();
         }
         BattleFieldView.a_1017.play();
         return stAvatarSuperNinthFlamesShot;
      }
      
      override protected function getBindMovie() : Class
      {
         return AvatarSuperNinthFlamesShotMovie;
      }
      
      override public function a_1797(iGlobalID:int, numSpeed:Number, iHurtPower:int, iXpos:int, iYpos:int, stCurrentBattleView:BattleFieldView, stStartFieldGrid:a_3491, isBothWayShot:Boolean = false, numHotMultiplier:Number = 1, iThreeRowShotType:int = 0) : Boolean
      {
         super.a_1797(iGlobalID,numSpeed,iHurtPower,iXpos,iYpos,stCurrentBattleView,stStartFieldGrid,isBothWayShot,numHotMultiplier);
         a_1447 = 0;
         m_numXSpeed *= -1;
         a_1275 = 0;
         a_1587 = 1;
         gotoAndStop(1);
         this.m_iFlag = false;
         return true;
      }
      
      override protected function a_4349() : Boolean
      {
         var iXGridNo:int = 0;
         var stFieldGrid:a_3491 = null;
         var iTargetPos:int = 0;
         var numDistance:Number = NaN;
         if(a_1283)
         {
            iXGridNo = BattleFieldView.a_1011 - 1 - int(x / a_3491.a_1080);
         }
         else
         {
            iXGridNo = int(x / a_3491.a_1080);
         }
         if(this.a_1598)
         {
            iTargetPos = a_1283 ? int(BattleFieldView.a_1013 - a_3491.a_1080 * (this.a_1598.m_iXGridNo + 0.5)) : int(a_3491.a_1080 * (this.a_1598.m_iXGridNo + 0.5));
            numDistance = Math.abs(iTargetPos - x);
            a_1581 = Math.abs(int(numDistance / m_numXSpeed));
            if(numDistance < a_3491.a_1080)
            {
               if(a_1581 < 2)
               {
                  a_1581 = 2;
               }
               m_numYSpeed = 0.5 * numDistance / a_1581;
            }
            else
            {
               m_numYSpeed = 3 * a_3491.a_1081 / a_1581;
            }
         }
         return true;
      }
      
      override protected function a_3940() : Boolean
      {
         super.a_3940();
         this.m_iFlag = false;
         this.m_iSupperingRate = 0;
         if(-1 == ms_stAvatarSuperNinthFlamesShotVector.indexOf(this))
         {
            ms_stAvatarSuperNinthFlamesShotVector.push(this);
         }
         this.m_iTransEnergyCount = 5;
         return true;
      }
      
      override public function a_4216(iCurrentTime:int) : void
      {
         if(m_isHited)
         {
            if(a_1273 == 7)
            {
               this.a_3961();
            }
            else if(a_1273 == a_1274)
            {
               this.addShot();
               this.a_3940();
            }
            nextFrame();
            return;
         }
         if(a_1588)
         {
            nextFrame();
            if(a_1273 == a_1274 || a_1278 != null)
            {
               gotoAndStop((a_1276[a_1275] as FrameLabel).frame);
            }
         }
         if(0 == a_1447)
         {
            a_1447 = iCurrentTime;
         }
         if(iCurrentTime - a_1447 < 40)
         {
            if(y > -110)
            {
               y -= 30;
            }
            else if(visible)
            {
               visible = false;
               if(a_1275 != 0)
               {
                  a_1275 = 0;
                  gotoAndStop((a_1276[0] as FrameLabel).frame);
               }
            }
         }
         else
         {
            if(!this.m_iFlag)
            {
               this.a_1598 = a_1583.a_3438(7,3);
               this.m_iFlag = true;
            }
            if(this.a_1598)
            {
               visible = true;
               gotoAndStop((a_1276[a_1587] as FrameLabel).frame);
               if(!a_1283)
               {
                  x = this.a_1598.m_iXGridNo * a_3491.a_1080 + 0.5 * (a_3491.a_1080 - width);
               }
               else
               {
                  x = BattleFieldView.a_1013 - (this.a_1598.m_iXGridNo * a_3491.a_1080 + (a_3491.a_1080 - width) * 0.5);
               }
               if(y < BattleFieldView.a_1014)
               {
                  y += 30;
                  this.a_4373();
               }
               else
               {
                  this.a_3940();
               }
            }
            else
            {
               this.a_3940();
            }
         }
      }
      
      private function a_4373() : void
      {
         if(x < 0 || x >= BattleFieldView.a_1013 || y > a_3491.a_1081 * (this.a_1598.m_iYGridNo + 1))
         {
            trace("x < 0 || x >= BattleFieldView.ms_iBattleFieldWidth, HitTest failed. x:" + x + ", BattleFieldView.ms_iBattleFieldWidth:" + BattleFieldView.a_1013);
            this.a_3940();
            return;
         }
         var stFieldGrid:a_3491 = this.a_1598;
         if(y > stFieldGrid.m_iYGridNo * a_3491.a_1081 - 130)
         {
            m_isHited = true;
            if(a_1276.length > 0)
            {
               gotoAndStop((a_1276[a_1587] as FrameLabel).frame);
            }
            return;
         }
      }
      
      private function a_3961() : void
      {
         var xIndex:int = 0;
         var arrMoveIntruder:Array = null;
         var stMoveIntruder:a_4206 = null;
         var iReduceLife:int = 0;
         var xStart:int = 6;
         var xEnd:int = BattleFieldView.a_1011 - 1;
         var yStart:int = 0;
         var yEnd:int = BattleFieldView.a_1012 - 1;
         var stFieldGridVector:Array = a_1584.m_stCurrentBattbleFieldView.stFieldGridsVector;
         for(var yIndex:int = yStart; yIndex <= yEnd; yIndex++)
         {
            for(xIndex = xStart; xIndex <= xEnd; xIndex++)
            {
               arrMoveIntruder = stFieldGridVector[yIndex][xIndex].a_1511.slice();
               for each(stMoveIntruder in arrMoveIntruder)
               {
                  iReduceLife = a_1579;
                  stMoveIntruder.a_4209(iReduceLife);
               }
            }
         }
      }
      
      private function addShot() : void
      {
         var stFieldGrid:a_3491 = null;
         var iXGridNo:int = 0;
         var iYGridNo:int = 0;
         var stStartField:a_3491 = null;
         var stLastWaitShot:a_4348 = null;
         var iPosX:int = 0;
         var iPosY:int = 0;
         var iLen:int = int(ADD_DIC.length);
         for(var i:int = 0; i < iLen; i++)
         {
            iXGridNo = int(ADD_DIC[i][0]);
            iYGridNo = int(ADD_DIC[i][1]);
            stStartField = a_1583.a_3438(iXGridNo,iYGridNo);
            if(stStartField)
            {
               stLastWaitShot = ResidualFlameShot.a_4344();
               ResidualFlameShot(stLastWaitShot).m_GemoLevel = this.m_GemoLevel;
               iPosX = stStartField.m_iXGridNo * a_3491.a_1080 - 17;
               iPosY = stStartField.m_iYGridNo * a_3491.a_1081 - 20;
               stLastWaitShot.a_1797(0,0,50,iPosX,iPosY,a_1583,stStartField,false,1,0);
               a_1583.AddToBattleView(stLastWaitShot,BattleLayerDefine.EFFECTS_BASE_TYPE,stStartField);
            }
         }
      }
   }
}

