package com.aurora.ui.maogoutd.resource.gamemap.newMap.SnakeYear.SkyCherryParty.Effect
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.effect.a_4108;
   import flash.display.FrameLabel;
   import flash.events.Event;
   
   public class SkyCherryPartyGrideDefenceLigthingEffect extends a_4108
   {
      
      private var m_iStartTime:int;
      
      public var stOriginalFieldGrid:a_3491;
      
      public var stCallBackFunc:Function = null;
      
      private var stEffect:SkyCherryPartyDefenceLigthingRangeEffect;
      
      public function SkyCherryPartyGrideDefenceLigthingEffect()
      {
         super();
         a_1279 = -42;
         m_iYDisplayCenterPos = -74;
      }
      
      public static function a_3926() : SkyCherryPartyGrideDefenceLigthingEffect
      {
         return PoolManager.getInstance().CheckOutOne(SkyCherryPartyGrideDefenceLigthingEffect) as SkyCherryPartyGrideDefenceLigthingEffect;
      }
      
      override protected function getBindMovie() : Class
      {
         return SkyCherryPartyGrideDefenceLigthingEffectMovie;
      }
      
      override public function a_1797(isReversed:Boolean) : Boolean
      {
         super.a_1797(isReversed);
         this.m_iStartTime = 0;
         this.stEffect = null;
         play();
         return true;
      }
      
      override protected function a_4109(a_4730:Event) : void
      {
         ++this.m_iStartTime;
         nextFrame();
         if(a_1273 == a_1274 || a_1278 != null)
         {
            gotoAndStop((a_1276[a_1275] as FrameLabel).frame);
         }
         if(this.m_iStartTime % 50 == 0)
         {
            this.addLightEffectRange(this.stOriginalFieldGrid);
         }
      }
      
      private function addLightEffectRange(grid:a_3491) : void
      {
         var xIndex:int = 0;
         var grid1:a_3491 = null;
         var arrMoveIntruder:Array = null;
         var stMoveIntruder:a_4206 = null;
         if(!grid)
         {
            return;
         }
         if(this.stEffect == null)
         {
            this.stEffect = SkyCherryPartyDefenceLigthingRangeEffect.a_3926();
            this.stEffect.stOriginalFieldGrid = grid;
            this.stEffect.stCallBackFunc = this.LightEffectRangeOver;
            this.stEffect.a_1797(false);
            this.stEffect.x = (grid.m_iXGridNo + 0.5) * a_3491.a_1080;
            this.stEffect.y = (grid.m_iYGridNo + 0.5) * a_3491.a_1081;
            grid.m_stCurrentBattbleFieldView.AddToBattleView(this.stEffect,BattleLayerDefine.EFFECTS_TOP_TYPE,grid);
         }
         var xStart:int = Math.max(grid.m_iXGridNo - 2,0);
         var xEnd:int = Math.min(grid.m_iXGridNo + 2,BattleFieldView.a_1011 - 1);
         var yStart:int = Math.max(grid.m_iYGridNo - 2,0);
         var yEnd:int = Math.min(grid.m_iYGridNo + 2,BattleFieldView.a_1012 - 1);
         for(var yIndex:int = yStart; yIndex <= yEnd; yIndex++)
         {
            for(xIndex = xStart; xIndex <= xEnd; xIndex++)
            {
               grid1 = grid.m_stCurrentBattbleFieldView.a_3438(xIndex,yIndex);
               if(grid1)
               {
                  arrMoveIntruder = grid1.IntruderArray;
                  for each(stMoveIntruder in arrMoveIntruder)
                  {
                     if(stMoveIntruder.iLifeValue > 0)
                     {
                        stMoveIntruder.PowerfulBombReduceLifeRate(1000 / 900);
                     }
                  }
               }
            }
         }
      }
      
      private function LightEffectRangeOver() : void
      {
         this.stEffect = null;
      }
      
      override public function a_3940() : Boolean
      {
         this.stOriginalFieldGrid = null;
         if(this.stEffect)
         {
            this.stEffect.a_3940();
            this.stEffect = null;
         }
         super.a_3940();
         return true;
      }
   }
}

