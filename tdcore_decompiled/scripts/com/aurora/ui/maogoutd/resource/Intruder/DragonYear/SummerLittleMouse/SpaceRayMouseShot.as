package com.aurora.ui.maogoutd.resource.Intruder.DragonYear.SummerLittleMouse
{
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.avatar.a_3924;
   import com.aurora.ui.maogoutd.resource.shot.a_4348;
   import flash.display.FrameLabel;
   
   public class SpaceRayMouseShot extends a_4348
   {
      
      private static var ms_stSpaceRayMouseShotVector:Array = new Array();
      
      private var m_iNoX:int = -1;
      
      private var m_lHamburger:Array = [286458096,286401870,286401871];
      
      public function SpaceRayMouseShot()
      {
         super();
         a_1279 = -width * 0.5;
         a_1573 = 1;
      }
      
      public static function a_4344() : SpaceRayMouseShot
      {
         var stSpaceRayMouseShot:SpaceRayMouseShot = ms_stSpaceRayMouseShotVector.pop();
         if(null == stSpaceRayMouseShot)
         {
            stSpaceRayMouseShot = new SpaceRayMouseShot();
         }
         BattleFieldView.a_1017.play();
         return stSpaceRayMouseShot;
      }
      
      override protected function getBindMovie() : Class
      {
         return SpaceRayMouseShotMovie;
      }
      
      override public function a_1797(iGlobalID:int, numSpeed:Number, iHurtPower:int, iXpos:int, iYpos:int, stCurrentBattleView:BattleFieldView, stStartFieldGrid:a_3491, isBothWayShot:Boolean = false, numHotMultiplier:Number = 1, iThreeRowShotType:int = 0) : Boolean
      {
         super.a_1797(iGlobalID,numSpeed,iHurtPower,iXpos,iYpos,stCurrentBattleView,stStartFieldGrid,isBothWayShot,numHotMultiplier);
         a_1447 = 0;
         m_numXSpeed *= -1;
         return true;
      }
      
      public function InitField(iNoX:int) : void
      {
         this.m_iNoX = iNoX;
      }
      
      override protected function a_3940() : Boolean
      {
         super.a_3940();
         if(-1 == ms_stSpaceRayMouseShotVector.indexOf(this))
         {
            ms_stSpaceRayMouseShotVector.push(this);
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
         var m_stCurrentFieldGrid:a_3491 = null;
         if(a_1283)
         {
            iXGridNo = BattleFieldView.a_1011 - 1 - int(x / a_3491.a_1080);
         }
         else
         {
            iXGridNo = int(x / a_3491.a_1080);
         }
         var iYGridNo:int = m_iYGridNo;
         if(iXGridNo == this.m_iNoX)
         {
            m_stCurrentFieldGrid = a_1583.a_3438(iXGridNo,iYGridNo);
            if(m_stCurrentFieldGrid != null)
            {
               if(Boolean(m_stCurrentFieldGrid.m_stAttackFighter) && (m_stCurrentFieldGrid.m_stAttackFighter is a_3924 || this.m_lHamburger.indexOf(m_stCurrentFieldGrid.m_stAttackFighter.a_3512()) != -1))
               {
                  trace("m_stCurrentFieldGrid.m_stAttackFighter.GetDefenseTypeID():" + m_stCurrentFieldGrid.m_stAttackFighter.a_3512());
                  this.a_3940();
               }
               else
               {
                  this.addEarthHole(m_stCurrentFieldGrid);
                  this.a_3940();
               }
               return;
            }
         }
         if(x < 0 || x >= BattleFieldView.a_1013 + 50 || y > a_3491.a_1081 * m_iYGridNo)
         {
            trace("x < 0 || x >= BattleFieldView.ms_iBattleFieldWidth, HitTest failed. x:" + x + ", BattleFieldView.ms_iBattleFieldWidth:" + BattleFieldView.a_1013);
            this.a_3940();
            return;
         }
      }
      
      private function addEarthHole(stFieldGrid:a_3491) : void
      {
         var stSpaceRayMouseEarthHole:SpaceRayMouseEarthHole = null;
         if(stFieldGrid.m_stMouseEarthHole)
         {
            stFieldGrid.m_stMouseEarthHole.a_3940();
            stFieldGrid.m_stMouseEarthHole = null;
         }
         stSpaceRayMouseEarthHole = SpaceRayMouseEarthHole.a_3926();
         stSpaceRayMouseEarthHole.m_stCurrentFieldGrid = stFieldGrid;
         stSpaceRayMouseEarthHole.a_1797(a_1283);
         stSpaceRayMouseEarthHole.x = a_3491.a_1080 * (stFieldGrid.m_iXGridNo + 0.5) - 25;
         stSpaceRayMouseEarthHole.y = a_3491.a_1081 * (stFieldGrid.m_iYGridNo + 0.5) - 15;
         stFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(stSpaceRayMouseEarthHole,BattleLayerDefine.OBSTACL_TYPE,stFieldGrid);
         if(stFieldGrid.m_stCurrentBattbleFieldView.GetGameMoveMap())
         {
            stFieldGrid.m_stCurrentBattbleFieldView.GetGameMoveMap().AddMoveDisplayObject(stSpaceRayMouseEarthHole,stFieldGrid.m_iXGridNo,stFieldGrid.m_iYGridNo);
         }
         stSpaceRayMouseEarthHole.play();
         stFieldGrid.m_stMouseEarthHole = stSpaceRayMouseEarthHole;
         if(a_1283)
         {
            stSpaceRayMouseEarthHole.x = BattleFieldView.a_1013 - stSpaceRayMouseEarthHole.x;
         }
      }
   }
}

