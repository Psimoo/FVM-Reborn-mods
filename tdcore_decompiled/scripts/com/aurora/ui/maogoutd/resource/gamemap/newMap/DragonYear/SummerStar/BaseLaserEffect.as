package com.aurora.ui.maogoutd.resource.gamemap.newMap.DragonYear.SummerStar
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.effect.a_4108;
   import flash.display.FrameLabel;
   import flash.events.Event;
   
   public class BaseLaserEffect extends a_4108
   {
      
      private var m_iStartTime:int;
      
      private var m_arrEffect:Array = new Array();
      
      public var stOriginalFieldGrid:a_3491;
      
      public function BaseLaserEffect()
      {
         super();
         a_1279 = -45.5;
         m_iYDisplayCenterPos = -30;
      }
      
      public static function a_3926() : BaseLaserEffect
      {
         return PoolManager.getInstance().CheckOutOne(BaseLaserEffect) as BaseLaserEffect;
      }
      
      override protected function getBindMovie() : Class
      {
         return BaseLaserEffectMovie;
      }
      
      override public function a_1797(isReversed:Boolean) : Boolean
      {
         super.a_1797(isReversed);
         play();
         this.addShield(this.stOriginalFieldGrid);
         return true;
      }
      
      override protected function a_4109(a_4730:Event) : void
      {
         nextFrame();
         ++this.m_iStartTime;
         if(a_1273 == 6)
         {
            this.addSingleLaserEffect();
         }
         else if(a_1273 == a_1274)
         {
            this.a_3940();
         }
         if(a_1278 != null)
         {
            gotoAndStop((a_1276[a_1275] as FrameLabel).frame);
         }
      }
      
      protected function addShield(stFieldGrid:a_3491) : Boolean
      {
         this.m_iStartTime = 0;
         a_1275 = 1;
         gotoAndStop((a_1276[0] as FrameLabel).frame);
         return true;
      }
      
      protected function ClearShield(stFieldGrid:a_3491) : Boolean
      {
         this.removeEffectMovie();
         return true;
      }
      
      private function addSingleLaserEffect() : void
      {
         var m_iXGridNo:int = 0;
         var m_iYGridNo:int = 0;
         var stTargetFieldGrid:a_3491 = null;
         var i:int = 0;
         var stEffect:SingleLaserEffect = null;
         if(this.stOriginalFieldGrid)
         {
            for(i = 1; i < BattleFieldView.a_1012 - 1; i++)
            {
               stTargetFieldGrid = this.stOriginalFieldGrid.m_stCurrentBattbleFieldView.a_3438(this.stOriginalFieldGrid.m_iXGridNo,i);
               if(stTargetFieldGrid != null)
               {
                  stEffect = SingleLaserEffect.a_3926();
                  stEffect.stOriginalFieldGrid = stTargetFieldGrid;
                  stEffect.a_1797(false);
                  stEffect.x = (stTargetFieldGrid.m_iXGridNo + 0.5) * a_3491.a_1080;
                  stEffect.y = stTargetFieldGrid.m_iYGridNo * a_3491.a_1081;
                  this.stOriginalFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(stEffect,BattleLayerDefine.OBSTACL_TYPE,stTargetFieldGrid);
                  this.m_arrEffect.push(stEffect);
               }
            }
         }
      }
      
      private function removeEffectMovie() : void
      {
         var stEffect:* = undefined;
         while(this.m_arrEffect.length > 0)
         {
            stEffect = this.m_arrEffect.pop();
            if(stEffect)
            {
               stEffect.a_3940();
            }
         }
      }
      
      override public function a_3940() : Boolean
      {
         super.a_3940();
         this.ClearShield(this.stOriginalFieldGrid);
         return true;
      }
   }
}

