package com.aurora.ui.maogoutd.resource.Intruder.WonderLand.Vallon
{
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.shot.a_4348;
   import flash.display.FrameLabel;
   
   public class VallonBomShot extends a_4348
   {
      
      private static var ms_stVallonBomShotVector:Array = new Array();
      
      private var m_isTargetFieldGrid:a_3491;
      
      public function VallonBomShot()
      {
         super();
         a_1279 = -width * 0.5 + 15 - 28;
         m_iYDisplayCenterPos = 20 - 28;
         a_1573 = 1;
         a_1576 = true;
      }
      
      public static function a_4344() : a_4348
      {
         var stVallonBomShot:VallonBomShot = ms_stVallonBomShotVector.pop();
         if(null == stVallonBomShot)
         {
            stVallonBomShot = new VallonBomShot();
         }
         BattleFieldView.a_1017.play();
         return stVallonBomShot;
      }
      
      override protected function getBindMovie() : Class
      {
         return VallonBomShotMovie;
      }
      
      override public function a_1797(iGlobalID:int, numSpeed:Number, iHurtPower:int, iXpos:int, iYpos:int, stCurrentBattleView:BattleFieldView, stStartFieldGrid:a_3491, isBothWayShot:Boolean = false, numHotMultiplier:Number = 1, iThreeRowShotType:int = 0) : Boolean
      {
         super.a_1797(iGlobalID,numSpeed,iHurtPower,iXpos,iYpos,stCurrentBattleView,stStartFieldGrid,isBothWayShot,numHotMultiplier);
         a_1447 = 0;
         m_numXSpeed *= -1;
         a_1587 = 1;
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
         var isExistDefenseAhead:Boolean = false;
         for(var i:* = iXGridNo; i >= 0; i--)
         {
            stFieldGrid = a_1583.a_3438(i,m_iYGridNo);
            if(Boolean(stFieldGrid) && stFieldGrid.a_3492())
            {
               isExistDefenseAhead = true;
               this.m_isTargetFieldGrid = stFieldGrid;
               break;
            }
         }
         if(!isExistDefenseAhead)
         {
            stFieldGrid = a_1583.a_3438(0,m_iYGridNo);
            isExistDefenseAhead = true;
            this.m_isTargetFieldGrid = stFieldGrid;
         }
         if(isExistDefenseAhead)
         {
            iTargetPos = a_1283 ? int(BattleFieldView.a_1013 - a_3491.a_1080 * (stFieldGrid.m_iXGridNo + 0.5)) : int(a_3491.a_1080 * (stFieldGrid.m_iXGridNo + 0.5));
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
         if(-1 == ms_stVallonBomShotVector.indexOf(this))
         {
            ms_stVallonBomShotVector.push(this);
         }
         return true;
      }
      
      override public function a_4216(iCurrentTime:int) : void
      {
         var stTargetFieldGrid:a_3491 = null;
         var xStart:int = 0;
         var xEnd:int = 0;
         var yStart:int = 0;
         var yEnd:int = 0;
         var stFieldGridVector:Array = null;
         var yIndex:int = 0;
         var xIndex:int = 0;
         var numYMove:Number = NaN;
         if(m_isHited)
         {
            if(a_1273 == a_1274 - 12)
            {
               BattleFieldView.a_1048.play();
               this.m_isTargetFieldGrid.m_stCurrentBattbleFieldView.a_3466();
               xStart = this.m_isTargetFieldGrid.m_iXGridNo - 0;
               xEnd = this.m_isTargetFieldGrid.m_iXGridNo + 0;
               yStart = this.m_isTargetFieldGrid.m_iYGridNo - 0;
               yEnd = this.m_isTargetFieldGrid.m_iYGridNo + 0;
               stFieldGridVector = this.m_isTargetFieldGrid.m_stCurrentBattbleFieldView.stFieldGridsVector;
               for(yIndex = yStart; yIndex <= yEnd; yIndex++)
               {
                  for(xIndex = xStart; xIndex <= xEnd; xIndex++)
                  {
                     stTargetFieldGrid = this.m_isTargetFieldGrid.m_stCurrentBattbleFieldView.a_3438(xIndex,yIndex);
                     this.a_3502(stTargetFieldGrid);
                  }
               }
            }
            if(a_1273 == a_1274)
            {
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
         this.a_4373();
         if(iCurrentTime - a_1447 <= a_1581)
         {
            x += m_numXSpeed;
         }
         if(a_1576)
         {
            numYMove = 2 * m_numYSpeed * (iCurrentTime - a_1447) / a_1581 - m_numYSpeed;
            y += numYMove > 30 ? 30 : numYMove;
         }
      }
      
      private function a_4373() : void
      {
         var iXGridNo:int = 0;
         if(a_1283)
         {
            iXGridNo = BattleFieldView.a_1011 - 1 - int(x / a_3491.a_1080);
         }
         else
         {
            iXGridNo = int(x / a_3491.a_1080);
         }
         var iYGridNo:int = int(y / a_3491.a_1081);
         if(x < 0 || x >= BattleFieldView.a_1013 || y > a_3491.a_1081 * (this.m_isTargetFieldGrid.m_iYGridNo + 1))
         {
            trace("x < 0 || x >= BattleFieldView.ms_iBattleFieldWidth, HitTest failed. x:" + x + ", BattleFieldView.ms_iBattleFieldWidth:" + BattleFieldView.a_1013);
            this.a_3940();
            return;
         }
         var stFieldGrid:a_3491 = a_1583.a_3438(iXGridNo,iYGridNo);
         if(stFieldGrid == this.m_isTargetFieldGrid)
         {
            BattleFieldView.a_1048.play();
            this.m_isTargetFieldGrid.m_stCurrentBattbleFieldView.a_3466();
            m_isHited = true;
            if(a_1276.length > 0)
            {
               gotoAndStop((a_1276[a_1587] as FrameLabel).frame);
            }
            return;
         }
      }
      
      protected function a_3502(stFieldGrid:a_3491) : Boolean
      {
         if(null == stFieldGrid)
         {
            return false;
         }
         return stFieldGrid.ClearFieldGridDefenseWithOption();
      }
   }
}

