package com.aurora.ui.maogoutd.compositemap
{
   import com.aurora.ui.maogoutd.resource.gamemap.BaseGameMap;
   import com.aurora.ui.maogoutd.resource.gamemap.a_4187;
   import com.aurora.ui.maogoutd.resource.wave.a_4450;
   import flash.display.BitmapData;
   
   public class CompositeMap extends BaseGameMap
   {
      
      private var a_1445:a_4187 = new a_4187();
      
      public function CompositeMap()
      {
         super();
         this.a_1445.m_iBattleFieldStageType = 1;
         this.a_1445.m_iBattleModType = 0;
         this.a_1445.m_iWeatherType = 0;
      }
      
      override public function a_4172() : BitmapData
      {
         return CompositeMapHandler.Get().a_4172();
      }
      
      override public function a_4173() : BitmapData
      {
         return CompositeMapHandler.Get().a_4173();
      }
      
      override public function a_4174() : BitmapData
      {
         return CompositeMapHandler.Get().a_4174();
      }
      
      override public function a_4175() : a_4450
      {
         return null;
      }
      
      override public function a_4176() : a_4187
      {
         return this.a_1445;
      }
      
      override public function a_4177() : void
      {
         CompositeMapHandler.Get().a_4177();
         super.a_4177();
      }
      
      override public function OnTimeInterval(iTimeNum:uint) : void
      {
         CompositeMapHandler.Get().OnTimeInterval(iTimeNum);
      }
      
      public function SetBattleFieldView(stBattleFieldView:Object) : void
      {
         CompositeMapHandler.Get().SetBattleFieldView(stBattleFieldView);
      }
      
      override public function SetBattleFieldTerrain(stBattleFieldObject:Object) : Boolean
      {
         CompositeMapHandler.Get().SetBattleFieldTerrain(stBattleFieldObject);
         return true;
      }
   }
}

