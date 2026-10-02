package com.aurora.ui.maogoutd.resource.Intruder.RabbitYear.boss.LazyRabbit
{
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.shot.a_4348;
   import flash.display.FrameLabel;
   
   public class RadishEarthHoleShot extends a_4348
   {
      
      private static var ms_stMouseEarthHoleShotVector:Array = new Array();
      
      public var a_1598:a_3491;
      
      private var m_iStopTime:int = 0;
      
      public function RadishEarthHoleShot()
      {
         super();
         a_1279 = -43;
         m_iYDisplayCenterPos = -61;
         a_1576 = true;
         a_1588 = true;
         a_1275 = 0;
         a_1587 = 1;
      }
      
      public static function a_4344() : a_4348
      {
         var stMouseEarthHoleShot:RadishEarthHoleShot = ms_stMouseEarthHoleShotVector.pop();
         if(null == stMouseEarthHoleShot)
         {
            stMouseEarthHoleShot = new RadishEarthHoleShot();
         }
         BattleFieldView.a_1017.play();
         return stMouseEarthHoleShot;
      }
      
      override protected function getBindMovie() : Class
      {
         return RadishEarthHoleShotMovie;
      }
      
      override public function a_1797(iGlobalID:int, numSpeed:Number, iHurtPower:int, iXpos:int, iYpos:int, stCurrentBattleView:BattleFieldView, stStartFieldGrid:a_3491, isBothWayShot:Boolean = false, numHotMultiplier:Number = 1, iThreeRowShotType:int = 0) : Boolean
      {
         super.a_1797(iGlobalID,numSpeed,iHurtPower,iXpos,iYpos,stCurrentBattleView,stStartFieldGrid,isBothWayShot,numHotMultiplier);
         a_1447 = 0;
         this.m_iStopTime = 0;
         return true;
      }
      
      override protected function a_4349() : Boolean
      {
         var iXDistance:int = 0;
         var iYDistance:int = 0;
         var numTime:Number = NaN;
         if(this.a_1598 != null)
         {
            iXDistance = (this.a_1598.m_iXGridNo + 0.5) * a_3491.a_1080 - a_1585 + 4 - 10;
            iYDistance = (this.a_1598.m_iYGridNo + 0.5) * a_3491.a_1081 - a_1586 + 2 - 4;
            numTime = 5;
            m_numXSpeed = iXDistance / numTime;
            m_numYSpeed = iYDistance / numTime;
            a_1581 = numTime;
         }
         return true;
      }
      
      override protected function a_3940() : Boolean
      {
         if(this.a_1598 != null && this.a_1598.m_iFieldGridType == 1)
         {
            this.a_1598.m_iFieldGridType = 0;
         }
         super.a_3940();
         if(-1 == ms_stMouseEarthHoleShotVector.indexOf(this))
         {
            ms_stMouseEarthHoleShotVector.push(this);
         }
         return true;
      }
      
      override public function a_4216(iCurrentTime:int) : void
      {
         if(m_isHited)
         {
            nextFrame();
            if(a_1273 == a_1274 || a_1278 != null)
            {
               gotoAndStop((a_1276[a_1587] as FrameLabel).frame);
            }
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
         x += m_numXSpeed;
         y += m_numYSpeed;
         if(iCurrentTime - a_1447 == a_1581)
         {
            m_isHited = true;
            gotoAndStop((a_1276[a_1587] as FrameLabel).frame);
            if(this.a_1598 != null)
            {
               x = (this.a_1598.m_iXGridNo + 0.5) * a_3491.a_1080 + 4 - 10;
               y = (this.a_1598.m_iYGridNo + 0.5) * a_3491.a_1081 + 2 - 4;
               this.parent.removeChild(this);
               this.a_1598.m_stCurrentBattbleFieldView.AddToBattleView(this,BattleLayerDefine.EFFECTS_BASE_TYPE,this.a_1598);
               if(0 == this.a_1598.m_iFieldGridType)
               {
                  this.a_1598.m_iFieldGridType = 1;
               }
               this.a_3502(this.a_1598);
            }
         }
      }
      
      private function a_4373() : void
      {
         var iXGridNo:int = 0;
         var stFieldGrid:a_3491 = null;
         if(a_1283)
         {
            iXGridNo = BattleFieldView.a_1011 - 1 - int(x / a_3491.a_1080);
         }
         else
         {
            iXGridNo = int(x / a_3491.a_1080);
         }
         var iYGridNo:int = int(y / a_3491.a_1081);
         stFieldGrid = a_1583.a_3438(iXGridNo,iYGridNo);
         if(stFieldGrid == this.a_1598)
         {
            if(!a_1283)
            {
               x = stFieldGrid.m_iXGridNo * a_3491.a_1080 + 30;
            }
            else
            {
               x = BattleFieldView.a_1013 - (stFieldGrid.m_iXGridNo * a_3491.a_1080 + (a_3491.a_1080 - width) / 2);
            }
            y = stFieldGrid.m_iYGridNo * a_3491.a_1081 - 5;
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

