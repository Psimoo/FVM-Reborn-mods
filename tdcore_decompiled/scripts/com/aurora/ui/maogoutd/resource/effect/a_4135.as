package com.aurora.ui.maogoutd.resource.effect
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.avatar.a_3924;
   import com.aurora.ui.maogoutd.resource.gamemap.newMap.HorseYear.FWA.WBFWAMouseHole1Movie;
   import com.aurora.ui.maogoutd.resource.gamemap.newMap.HorseYear.FWA.WBFWAMouseHole2Movie;
   import com.aurora.ui.maogoutd.resource.gamemap.newMap.HorseYear.FWA.WBFWAMouseHole3Movie;
   import flash.events.Event;
   import flash.utils.clearTimeout;
   
   public class a_4135 extends a_4108
   {
      
      public var m_stCurrentFieldGrid:a_3491;
      
      public var timerout:int = -1;
      
      public var m_iOldFieldGridType:int;
      
      public var type:int = 0;
      
      public function a_4135()
      {
         super();
      }
      
      public static function a_3926() : a_4135
      {
         var earthHole:a_4135 = PoolManager.getInstance().CheckOutOne(a_4135,MouseEarthHoleMovie) as a_4135;
         earthHole.type = 0;
         return earthHole;
      }
      
      public static function GetFreeInstanceWB1() : a_4135
      {
         var earthHole:a_4135 = null;
         earthHole = PoolManager.getInstance().CheckOutOne(a_4135,WBFWAMouseHole1Movie) as a_4135;
         earthHole.type = 1;
         earthHole.a_1279 = -4;
         earthHole.m_iYDisplayCenterPos = -6;
         return earthHole;
      }
      
      public static function GetFreeInstanceWB2() : a_4135
      {
         var earthHole:a_4135 = null;
         earthHole = PoolManager.getInstance().CheckOutOne(a_4135,WBFWAMouseHole2Movie) as a_4135;
         earthHole.type = 2;
         earthHole.a_1279 = -4;
         earthHole.m_iYDisplayCenterPos = -4;
         return earthHole;
      }
      
      public static function GetFreeInstanceWB3() : a_4135
      {
         var earthHole:a_4135 = null;
         earthHole = PoolManager.getInstance().CheckOutOne(a_4135,WBFWAMouseHole3Movie) as a_4135;
         earthHole.type = 3;
         earthHole.a_1279 = -4;
         earthHole.m_iYDisplayCenterPos = -4;
         return earthHole;
      }
      
      override public function a_1797(isReversed:Boolean) : Boolean
      {
         this.m_iOldFieldGridType = -1;
         this.timerout = -1;
         this.a_3502(this.m_stCurrentFieldGrid);
         return super.a_1797(isReversed);
      }
      
      override public function a_3940() : Boolean
      {
         if(this.timerout)
         {
            clearTimeout(this.timerout);
            this.timerout = -1;
         }
         if(this.m_iOldFieldGridType != -1 && this.m_stCurrentFieldGrid != null)
         {
            this.m_stCurrentFieldGrid.m_iFieldGridType = this.m_iOldFieldGridType;
            this.m_stCurrentFieldGrid = null;
            this.m_iOldFieldGridType = -1;
         }
         super.a_3940();
         return true;
      }
      
      override protected function a_4109(a_4730:Event) : void
      {
         nextFrame();
         if(a_1273 == a_1274)
         {
            stop();
         }
      }
      
      protected function ClearPigBarrierField(stFieldGrid:a_3491) : Boolean
      {
         if(stFieldGrid == null)
         {
            return false;
         }
         if(stFieldGrid.m_stMouseEarthHole)
         {
            stFieldGrid.m_stMouseEarthHole.a_3940();
            stFieldGrid.m_stMouseEarthHole = null;
         }
         if(stFieldGrid.m_stBaseLander != null)
         {
            stFieldGrid.m_stBaseLander.a_3940();
            stFieldGrid.m_stBaseLander = null;
         }
         if(this.m_iOldFieldGridType != -1)
         {
            stFieldGrid.m_iFieldGridType = this.m_iOldFieldGridType;
         }
         return true;
      }
      
      protected function a_3502(stFieldGrid:a_3491) : Boolean
      {
         if(stFieldGrid == null)
         {
            return false;
         }
         if(null != stFieldGrid.m_stProtector)
         {
            stFieldGrid.m_stProtector.m_iDieType = 1;
            stFieldGrid.m_stProtector.a_3969(stFieldGrid.m_stProtector.iLifeValue);
         }
         if(null != stFieldGrid.m_stAttackFighter && !(stFieldGrid.m_stAttackFighter is a_3924))
         {
            stFieldGrid.m_stAttackFighter.m_iDieType = 1;
            stFieldGrid.m_stAttackFighter.a_3969(stFieldGrid.m_stAttackFighter.iLifeValue);
         }
         if(null != stFieldGrid.m_stBoomDefense)
         {
            stFieldGrid.m_stBoomDefense.m_iDieType = 1;
            stFieldGrid.m_stBoomDefense.a_3969(stFieldGrid.m_stBoomDefense.iLifeValue);
         }
         if(null != stFieldGrid.m_stFlowerDefense)
         {
            stFieldGrid.m_stFlowerDefense.m_iDieType = 1;
            stFieldGrid.m_stFlowerDefense.a_3969(stFieldGrid.m_stFlowerDefense.iLifeValue);
         }
         if(null != stFieldGrid.m_stBaseAuxiliaryFighter)
         {
            stFieldGrid.m_stBaseAuxiliaryFighter.m_iDieType = 1;
            stFieldGrid.m_stBaseAuxiliaryFighter.a_3969(stFieldGrid.m_stBaseAuxiliaryFighter.iLifeValue);
         }
         stFieldGrid.DamageNewSlot(true,0,true,0,1);
         if(null != stFieldGrid.m_stTrayDefense)
         {
            stFieldGrid.m_stTrayDefense.m_iDieType = 1;
            stFieldGrid.m_stTrayDefense.a_3969(stFieldGrid.m_stTrayDefense.iLifeValue);
         }
         return true;
      }
   }
}

