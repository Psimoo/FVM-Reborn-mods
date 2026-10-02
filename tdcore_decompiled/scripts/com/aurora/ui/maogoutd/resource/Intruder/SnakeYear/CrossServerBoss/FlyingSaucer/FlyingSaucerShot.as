package com.aurora.ui.maogoutd.resource.Intruder.SnakeYear.CrossServerBoss.FlyingSaucer
{
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.avatar.a_3924;
   import com.aurora.ui.maogoutd.resource.shot.a_4348;
   import flash.display.FrameLabel;
   
   public class FlyingSaucerShot extends a_4348
   {
      
      private static var ms_stAnubisShotVector:Array = new Array();
      
      private var m_targetField:a_3491;
      
      private var appearedTimes:int = 0;
      
      public var m_GemoLevel:int = -1;
      
      private var m_HurtTimes:int;
      
      private var m_BurnTimes:int;
      
      private var m_startBurn:int;
      
      private var m_iCount:int;
      
      public function FlyingSaucerShot()
      {
         super();
         a_1279 = -width * 0.5 + 4;
         m_iYDisplayCenterPos = 16;
         a_1588 = true;
      }
      
      public static function a_4344() : a_4348
      {
         var stAnubisShot:FlyingSaucerShot = ms_stAnubisShotVector.pop();
         if(null == stAnubisShot)
         {
            stAnubisShot = new FlyingSaucerShot();
         }
         BattleFieldView.a_1017.play();
         return stAnubisShot;
      }
      
      override protected function getBindMovie() : Class
      {
         return FlyingSaucerShotMovie;
      }
      
      override public function a_1797(iGlobalID:int, numSpeed:Number, iHurtPower:int, iXpos:int, iYpos:int, stCurrentBattleView:BattleFieldView, stStartFieldGrid:a_3491, isBothWayShot:Boolean = false, numHotMultiplier:Number = 1, iThreeRowShotType:int = 0) : Boolean
      {
         super.a_1797(iGlobalID,numSpeed,iHurtPower,iXpos,iYpos,stCurrentBattleView,stStartFieldGrid,isBothWayShot,numHotMultiplier);
         this.m_iCount = 0;
         this.m_HurtTimes = 4;
         this.m_BurnTimes = 9 * 20;
         this.appearedTimes = 0;
         return true;
      }
      
      override protected function a_3940() : Boolean
      {
         super.a_3940();
         if(-1 == ms_stAnubisShotVector.indexOf(this))
         {
            ms_stAnubisShotVector.push(this);
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
               m_bActive.Value = false;
               this.a_3940();
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
         if(this.appearedTimes == 0)
         {
            this.appearedTimes = iCurrentTime;
         }
         if(iCurrentTime - this.appearedTimes >= this.m_BurnTimes)
         {
            this.a_3940();
         }
         if((iCurrentTime - this.appearedTimes) % (this.m_BurnTimes / this.m_HurtTimes) == 0)
         {
            this.a_4360();
         }
      }
      
      private function a_4360() : void
      {
         ++this.m_iCount;
         trace("m_iCount:" + this.m_iCount);
         this.CureFieldGridDefense(a_1584,30);
      }
      
      protected function CureFieldGridDefense(stFieldGrid:a_3491, value:int = 10) : Boolean
      {
         if(stFieldGrid == null)
         {
            return false;
         }
         if(null != stFieldGrid.m_stBaseToolDefense)
         {
            stFieldGrid.m_stBaseToolDefense.a_3969(value);
         }
         else if(null != stFieldGrid.m_stProtector)
         {
            stFieldGrid.m_stProtector.a_3969(value);
         }
         else if(null != stFieldGrid.m_stAttackFighter && !(stFieldGrid.m_stAttackFighter is a_3924))
         {
            stFieldGrid.m_stAttackFighter.a_3969(value);
         }
         else if(null != stFieldGrid.m_stBoomDefense)
         {
            stFieldGrid.m_stBoomDefense.a_3969(value);
         }
         else if(null != stFieldGrid.m_stFlowerDefense)
         {
            stFieldGrid.m_stFlowerDefense.a_3969(value);
         }
         else if(null != stFieldGrid.m_stBaseAuxiliaryFighter)
         {
            stFieldGrid.m_stBaseAuxiliaryFighter.a_3969(value);
         }
         else if(stFieldGrid.HasNewSlot())
         {
            stFieldGrid.DamageNewSlot(false,0,false,value,-1);
         }
         else if(null != stFieldGrid.m_stTrayDefense)
         {
            stFieldGrid.m_stTrayDefense.a_3969(value);
         }
         return true;
      }
   }
}

