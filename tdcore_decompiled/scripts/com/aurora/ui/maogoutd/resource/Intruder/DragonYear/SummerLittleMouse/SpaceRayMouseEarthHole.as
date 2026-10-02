package com.aurora.ui.maogoutd.resource.Intruder.DragonYear.SummerLittleMouse
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
   
   public class SpaceRayMouseEarthHole extends a_4135
   {
      
      public function SpaceRayMouseEarthHole()
      {
         super();
      }
      
      public static function a_3926() : SpaceRayMouseEarthHole
      {
         return PoolManager.getInstance().CheckOutOne(SpaceRayMouseEarthHole) as SpaceRayMouseEarthHole;
      }
      
      override protected function getBindMovie() : Class
      {
         return SpaceRayMouseEarthHoleMovie;
      }
      
      override public function a_1797(isReversed:Boolean) : Boolean
      {
         super.a_1797(isReversed);
         if(m_stCurrentFieldGrid != null)
         {
            timerout = setTimeout(ClearPigBarrierField,60 * 1000,m_stCurrentFieldGrid);
            a_3502(m_stCurrentFieldGrid);
            m_iOldFieldGridType = m_stCurrentFieldGrid.m_iFieldGridType;
         }
         this.addShield(m_stCurrentFieldGrid);
         a_1275 = 0;
         a_1271 = true;
         return true;
      }
      
      protected function addShield(stFieldGrid:a_3491) : Boolean
      {
         if(stFieldGrid != null && 0 == stFieldGrid.m_iFieldGridType)
         {
            stFieldGrid.m_iFieldGridType = 8;
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
               if(item.iSpaceState == 0)
               {
                  item.a_3969(-1000);
                  stAddBloodEffect = AddBloodEffect.a_3926();
                  stAddBloodEffect.a_1797(false);
                  stAddBloodEffect.x = item.x;
                  stAddBloodEffect.y = item.y;
                  m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(stAddBloodEffect,BattleLayerDefine.EFFECTS_TOP_TYPE);
                  ClearPigBarrierField(m_stCurrentFieldGrid);
                  a_3502(m_stCurrentFieldGrid);
                  break;
               }
            }
         }
         nextFrame();
         if(a_1273 == a_1274 || a_1278 != null)
         {
            gotoAndStop((a_1276[0] as FrameLabel).frame);
         }
      }
   }
}

