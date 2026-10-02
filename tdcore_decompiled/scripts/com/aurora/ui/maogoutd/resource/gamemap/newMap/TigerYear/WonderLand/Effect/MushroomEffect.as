package com.aurora.ui.maogoutd.resource.gamemap.newMap.TigerYear.WonderLand.Effect
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.effect.a_4135;
   import flash.display.FrameLabel;
   import flash.events.Event;
   
   public class MushroomEffect extends a_4135
   {
      
      public function MushroomEffect()
      {
         super();
         a_1279 = 10 - 45 + 5;
         m_iYDisplayCenterPos = 46 - 111;
      }
      
      public static function a_3926() : MushroomEffect
      {
         return PoolManager.getInstance().CheckOutOne(MushroomEffect) as MushroomEffect;
      }
      
      override protected function getBindMovie() : Class
      {
         return MushroomEffectMovie;
      }
      
      override public function a_1797(isReversed:Boolean) : Boolean
      {
         super.a_1797(isReversed);
         if(m_stCurrentFieldGrid != null)
         {
            m_iOldFieldGridType = m_stCurrentFieldGrid.m_iFieldGridType;
         }
         this.addShield(m_stCurrentFieldGrid);
         a_1275 = 1;
         a_1271 = true;
         return true;
      }
      
      override public function a_3940() : Boolean
      {
         if(a_1275 != 2)
         {
            a_1275 = 2;
            gotoAndStop((a_1276[2] as FrameLabel).frame);
         }
         this.ClearShield(m_stCurrentFieldGrid);
         gotoAndStop(1);
         stop();
         PoolManager.getInstance().CheckInOne(this);
         return true;
      }
      
      override protected function a_4109(a_4730:Event) : void
      {
         nextFrame();
         if(a_1278 != null)
         {
            gotoAndStop((a_1276[a_1275] as FrameLabel).frame);
         }
         if(a_1273 == a_1274)
         {
         }
      }
      
      protected function addShield(stFieldGrid:a_3491) : Boolean
      {
         if(stFieldGrid != null && 0 == stFieldGrid.m_iFieldGridType)
         {
            stFieldGrid.m_iFieldGridType = 3;
            stFieldGrid.m_stMouseEarthHole = this;
         }
         a_3502(stFieldGrid);
         return true;
      }
      
      protected function ClearShield(stFieldGrid:a_3491) : Boolean
      {
         if(stFieldGrid != null)
         {
            stFieldGrid.m_iFieldGridType = m_iOldFieldGridType;
         }
         if(stFieldGrid != null)
         {
            stFieldGrid.m_stMouseEarthHole = null;
         }
         return true;
      }
   }
}

