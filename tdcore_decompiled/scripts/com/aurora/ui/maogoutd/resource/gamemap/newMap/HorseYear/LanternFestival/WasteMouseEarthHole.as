package com.aurora.ui.maogoutd.resource.gamemap.newMap.HorseYear.LanternFestival
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.effect.AddBloodEffect;
   import com.aurora.ui.maogoutd.resource.effect.a_4135;
   import flash.display.FrameLabel;
   import flash.events.Event;
   import flash.utils.setTimeout;
   
   public class WasteMouseEarthHole extends a_4135
   {
      
      public function WasteMouseEarthHole()
      {
         super();
      }
      
      public static function a_3926() : WasteMouseEarthHole
      {
         return PoolManager.getInstance().CheckOutOne(WasteMouseEarthHole) as WasteMouseEarthHole;
      }
      
      override protected function getBindMovie() : Class
      {
         return WasteMouseEarthHoleMovie;
      }
      
      override public function a_1797(isReversed:Boolean) : Boolean
      {
         a_1279 = -30;
         m_iYDisplayCenterPos = 16;
         super.a_1797(isReversed);
         if(m_stCurrentFieldGrid != null)
         {
            timerout = setTimeout(this.OnClearPigBarrierField,120 * 1000,m_stCurrentFieldGrid);
         }
         this.addShield(m_stCurrentFieldGrid);
         a_1275 = -1;
         ShowPlayAnimation(0,1);
         return true;
      }
      
      protected function OnClearPigBarrierField(stFieldGrid:a_3491) : Boolean
      {
         PlayAnimation(2);
         return true;
      }
      
      protected function addShield(stFieldGrid:a_3491) : Boolean
      {
         if(stFieldGrid != null)
         {
            stFieldGrid.m_stMouseEarthHole = this;
         }
         return true;
      }
      
      protected function ClearShield(stFieldGrid:a_3491) : Boolean
      {
         if(stFieldGrid != null)
         {
            stFieldGrid.m_stMouseEarthHole = null;
         }
         return true;
      }
      
      override public function a_3940() : Boolean
      {
         this.ClearShield(m_stCurrentFieldGrid);
         super.a_3940();
         PoolManager.getInstance().CheckInOne(this);
         return true;
      }
      
      override protected function a_4109(a_4730:Event) : void
      {
         var i:int = 0;
         var item:a_4206 = null;
         var stAddBloodEffect:AddBloodEffect = null;
         if(m_stCurrentFieldGrid != null)
         {
            for(i = 0; i < m_stCurrentFieldGrid.a_1511.length; i++)
            {
               item = m_stCurrentFieldGrid.a_1511[i];
               if(item.iSpaceState == 0 && item.IsBossIntruder == false)
               {
                  item.a_3969(-30000);
                  stAddBloodEffect = AddBloodEffect.a_3926();
                  stAddBloodEffect.a_1797(false);
                  stAddBloodEffect.x = item.x;
                  stAddBloodEffect.y = item.y;
                  m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(stAddBloodEffect,BattleLayerDefine.EFFECTS_TOP_TYPE);
                  ClearPigBarrierField(m_stCurrentFieldGrid);
                  break;
               }
            }
         }
         nextFrame();
         if(a_1273 == a_1274)
         {
            ClearPigBarrierField(m_stCurrentFieldGrid);
            return;
         }
         if(a_1278 != null)
         {
            gotoAndStop((a_1276[a_1275] as FrameLabel).frame);
         }
      }
   }
}

