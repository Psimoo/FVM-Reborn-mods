package com.aurora.ui.maogoutd.resource.Intruder.SnakeYear.CrossServerMouse.CactusMouse
{
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.shot.a_4348;
   import flash.display.FrameLabel;
   
   public class CactusMouseShot extends a_4348
   {
      
      private static var ms_stCactusMouseShotVector:Array = new Array();
      
      private var a_1598:a_3491;
      
      private var m_stCurrentFieldGrid:a_3491;
      
      public function CactusMouseShot()
      {
         super();
         a_1279 = -width * 0.5;
         a_1573 = 1;
         a_1576 = true;
      }
      
      public static function a_4344() : a_4348
      {
         var stCactusMouseShot:CactusMouseShot = ms_stCactusMouseShotVector.pop();
         if(null == stCactusMouseShot)
         {
            stCactusMouseShot = new CactusMouseShot();
         }
         BattleFieldView.a_1017.play();
         return stCactusMouseShot;
      }
      
      override protected function getBindMovie() : Class
      {
         return CactusMouseShotMovie;
      }
      
      override public function a_1797(iGlobalID:int, numSpeed:Number, iHurtPower:int, iXpos:int, iYpos:int, stCurrentBattleView:BattleFieldView, stStartFieldGrid:a_3491, isBothWayShot:Boolean = false, numHotMultiplier:Number = 1, iThreeRowShotType:int = 0) : Boolean
      {
         super.a_1797(iGlobalID,numSpeed,iHurtPower,iXpos,iYpos,stCurrentBattleView,stStartFieldGrid,isBothWayShot,numHotMultiplier);
         a_1447 = 0;
         m_numXSpeed *= -1;
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
         switch(a_1580)
         {
            case 1:
               stFieldGrid = a_1583.a_3438(3,m_iYGridNo);
               break;
            case 2:
               stFieldGrid = a_1583.a_3438(5,m_iYGridNo);
         }
         this.a_1598 = stFieldGrid;
         if(this.a_1598 != null)
         {
            iTargetPos = a_1283 ? int(BattleFieldView.a_1013 - a_3491.a_1080 * (this.a_1598.m_iXGridNo + 0.5)) : int(a_3491.a_1080 * (this.a_1598.m_iXGridNo + 1 + 0.5) - 17);
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
         if(this.m_stCurrentFieldGrid != null)
         {
            this.addEarthHole(this.m_stCurrentFieldGrid);
         }
         super.a_3940();
         if(-1 == ms_stCactusMouseShotVector.indexOf(this))
         {
            ms_stCactusMouseShotVector.push(this);
         }
         return true;
      }
      
      override public function a_4216(iCurrentTime:int) : void
      {
         var numYMove:Number = NaN;
         if(m_isHited)
         {
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
         x += m_numXSpeed;
         if(a_1576)
         {
            numYMove = 2 * m_numYSpeed * (iCurrentTime - a_1447) / a_1581 + 1 - m_numYSpeed;
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
         var iYGridNo:int = m_iYGridNo;
         this.m_stCurrentFieldGrid = a_1583.a_3438(iXGridNo,iYGridNo);
         if(x < 0 || x >= BattleFieldView.a_1013 || y > a_3491.a_1081 * m_iYGridNo)
         {
            trace("x < 0 || x >= BattleFieldView.ms_iBattleFieldWidth, HitTest failed. x:" + x + ", BattleFieldView.ms_iBattleFieldWidth:" + BattleFieldView.a_1013);
            this.a_3940();
            return;
         }
      }
      
      private function addEarthHole(stFieldGrid:a_3491) : void
      {
         var stCactusMouseEarthHole:CactusMouseEarthHole = null;
         if(stFieldGrid.m_stMouseEarthHole)
         {
            stFieldGrid.m_stMouseEarthHole.a_3940();
            stFieldGrid.m_stMouseEarthHole = null;
         }
         var m_iOldFieldGridType:int = stFieldGrid.m_iFieldGridType;
         if(0 == stFieldGrid.m_iFieldGridType)
         {
            stFieldGrid.m_iFieldGridType = 1;
         }
         if(stFieldGrid.m_iFieldGridType == 1)
         {
            if(stFieldGrid.m_stBaseLander != null)
            {
               stFieldGrid.m_stBaseLander.a_3940();
               stFieldGrid.m_stBaseLander = null;
            }
            stCactusMouseEarthHole = CactusMouseEarthHole.a_3926();
            stCactusMouseEarthHole.m_stCurrentFieldGrid = stFieldGrid;
            stCactusMouseEarthHole.a_1797(a_1283);
            stCactusMouseEarthHole.m_iOldFieldGridType = m_iOldFieldGridType;
            stCactusMouseEarthHole.x = a_3491.a_1080 * stFieldGrid.m_iXGridNo + 0.5 * (a_3491.a_1080 - stCactusMouseEarthHole.width);
            stCactusMouseEarthHole.y = a_3491.a_1081 * stFieldGrid.m_iYGridNo + (a_3491.a_1081 - stCactusMouseEarthHole.height);
            stFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(stCactusMouseEarthHole,BattleLayerDefine.OBSTACL_TYPE,stFieldGrid);
            if(stFieldGrid.m_stCurrentBattbleFieldView.GetGameMoveMap())
            {
               stFieldGrid.m_stCurrentBattbleFieldView.GetGameMoveMap().AddMoveDisplayObject(stCactusMouseEarthHole,stFieldGrid.m_iXGridNo,stFieldGrid.m_iYGridNo);
            }
            stCactusMouseEarthHole.play();
            stFieldGrid.m_stMouseEarthHole = stCactusMouseEarthHole;
            stFieldGrid.m_stCurrentBattbleFieldView.m_arrEffectArray.push(stCactusMouseEarthHole);
            if(a_1283)
            {
               stCactusMouseEarthHole.x = BattleFieldView.a_1013 - stCactusMouseEarthHole.x;
            }
         }
      }
   }
}

