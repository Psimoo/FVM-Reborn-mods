package com.aurora.ui.maogoutd.resource.Intruder.DesertMouse.HotAirBalloon
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.shot.a_4348;
   
   public class HotAirBalloonMouseBombShot extends a_4348
   {
      
      public function HotAirBalloonMouseBombShot()
      {
         super();
         a_1275 = 0;
         a_1587 = 0;
         a_1279 = -width * 0.5;
         a_1588 = true;
      }
      
      public static function a_4344() : a_4348
      {
         BattleFieldView.a_1017.play();
         return PoolManager.getInstance().CheckOutOne(HotAirBalloonMouseBombShot) as HotAirBalloonMouseBombShot;
      }
      
      override protected function getBindMovie() : Class
      {
         return HotAirBalloonMouseBombShotMovie;
      }
      
      override public function a_1797(iGlobalID:int, numSpeed:Number, iHurtPower:int, iXpos:int, iYpos:int, stCurrentBattleView:BattleFieldView, stStartFieldGrid:a_3491, isBothWayShot:Boolean = false, numHotMultiplier:Number = 1, iThreeRowShotType:int = 0) : Boolean
      {
         super.a_1797(iGlobalID,numSpeed,iHurtPower,iXpos,iYpos,stCurrentBattleView,stStartFieldGrid,isBothWayShot,numHotMultiplier);
         this.InitData();
         return true;
      }
      
      protected function InitData() : void
      {
         m_numXSpeed = -m_numXSpeed;
         gotoAndStop(1);
         m_isHited = false;
         a_1588 = true;
      }
      
      override public function a_4216(iCurrentTime:int) : void
      {
         trace("m_iCurrentFrame::::" + a_1273);
         if(m_isHited)
         {
            nextFrame();
            if(a_1273 == a_1274 - 12)
            {
               this.bommAction(a_1584);
            }
            if(a_1273 == a_1274)
            {
               a_3940();
            }
            return;
         }
         if(a_1588)
         {
            nextFrame();
            if(a_1273 == a_1274 - 7)
            {
               this.bommAction(a_1584);
            }
            if(a_1273 == a_1274 || null != a_1278)
            {
               m_isHited = true;
               a_1588 = false;
            }
         }
         if(0 == a_1447)
         {
            a_1447 = iCurrentTime;
         }
      }
      
      private function bommAction(a_1334:a_3491) : void
      {
         var xIndex:int = 0;
         var xStart:int = Math.max(a_1334.m_iXGridNo - 0,0);
         var xEnd:int = Math.min(a_1334.m_iXGridNo + 0,BattleFieldView.a_1011 - 1);
         var yStart:int = Math.max(a_1334.m_iYGridNo - 0,0);
         var yEnd:int = Math.min(a_1334.m_iYGridNo + 0,BattleFieldView.a_1012 - 1);
         var stFieldGridVector:Array = a_1334.m_stCurrentBattbleFieldView.stFieldGridsVector;
         for(var yIndex:int = yStart; yIndex <= yEnd; yIndex++)
         {
            for(xIndex = xStart; xIndex <= xEnd; xIndex++)
            {
               this.a_3502(stFieldGridVector[yIndex][xIndex]);
            }
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

