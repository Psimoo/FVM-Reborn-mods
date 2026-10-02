package com.aurora.ui.maogoutd.resource.Intruder.WonderLand.boss.CrazyAlice
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.effect.a_4108;
   import flash.display.FrameLabel;
   import flash.events.Event;
   
   public class BrokenGridDarkEffect extends a_4108
   {
      
      public var m_TargetFieldGrid:a_3491;
      
      public function BrokenGridDarkEffect()
      {
         super();
         a_1279 = 3;
         m_iYDisplayCenterPos = 9;
      }
      
      public static function a_3926() : BrokenGridDarkEffect
      {
         return PoolManager.getInstance().CheckOutOne(BrokenGridDarkEffect) as BrokenGridDarkEffect;
      }
      
      override protected function getBindMovie() : Class
      {
         return BrokenGridDarkEffectMovie;
      }
      
      override public function a_1797(isReversed:Boolean) : Boolean
      {
         super.a_1797(isReversed);
         a_1275 = 1;
         gotoAndStop((a_1276[0] as FrameLabel).frame);
         this.addShield(this.m_TargetFieldGrid);
         return true;
      }
      
      override protected function a_4109(a_4730:Event) : void
      {
         nextFrame();
         if(a_1278 != null || a_1273 == a_1274)
         {
            gotoAndStop((a_1276[a_1275] as FrameLabel).frame);
         }
      }
      
      protected function addShield(stFieldGrid:a_3491) : Boolean
      {
         if(stFieldGrid != null && stFieldGrid.m_stMouseObstacle != null)
         {
            stFieldGrid.m_stMouseObstacle.a_3969(stFieldGrid.m_stMouseObstacle.iLifeValue);
         }
         if(stFieldGrid != null && stFieldGrid.m_stMouseEarthHole != null)
         {
            stFieldGrid.m_stMouseEarthHole.a_3940();
         }
         if(stFieldGrid != null)
         {
            stFieldGrid.m_iFieldGridType = 3;
         }
         return true;
      }
      
      protected function ClearShield(stFieldGrid:a_3491) : Boolean
      {
         if(stFieldGrid != null)
         {
            stFieldGrid.m_iFieldGridType = 0;
         }
         return true;
      }
      
      override public function a_3940() : Boolean
      {
         var stVector:Array = null;
         super.a_3940();
         this.ClearShield(this.m_TargetFieldGrid);
         if(this.m_TargetFieldGrid)
         {
            stVector = this.m_TargetFieldGrid.m_stCurrentBattbleFieldView.m_arrEffectArray;
            if(-1 != stVector.indexOf(this))
            {
               stVector.splice(stVector.indexOf(this),1);
            }
         }
         return true;
      }
   }
}

