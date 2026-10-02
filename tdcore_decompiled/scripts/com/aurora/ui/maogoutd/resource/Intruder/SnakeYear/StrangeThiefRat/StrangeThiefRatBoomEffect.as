package com.aurora.ui.maogoutd.resource.Intruder.SnakeYear.StrangeThiefRat
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.effect.a_4108;
   import flash.display.FrameLabel;
   import flash.events.Event;
   
   public class StrangeThiefRatBoomEffect extends a_4108
   {
      
      private var m_iStartTime:int;
      
      public var stOriginalFieldGrid:a_3491;
      
      public function StrangeThiefRatBoomEffect()
      {
         super();
         a_1279 = -18.5;
         m_iYDisplayCenterPos = -16;
      }
      
      public static function a_3926() : StrangeThiefRatBoomEffect
      {
         return PoolManager.getInstance().CheckOutOne(StrangeThiefRatBoomEffect) as StrangeThiefRatBoomEffect;
      }
      
      override protected function getBindMovie() : Class
      {
         return StrangeThiefRatBoomEffectMovie;
      }
      
      override public function a_1797(isReversed:Boolean) : Boolean
      {
         super.a_1797(isReversed);
         this.m_iStartTime = 0;
         a_1275 = 0;
         if(this.stOriginalFieldGrid)
         {
            this.stOriginalFieldGrid.m_stCurrentBattbleFieldView.m_arrEffectArray.push(this);
         }
         return true;
      }
      
      override protected function a_4109(a_4730:Event) : void
      {
         ++this.m_iStartTime;
         if(this.m_iStartTime == 10)
         {
            a_1275 = 2;
            gotoAndStop((a_1276[1] as FrameLabel).frame);
         }
         nextFrame();
         if(iCurrentFrame == 19)
         {
            this.AddFogEffect(this.stOriginalFieldGrid);
         }
         if(a_1278 != null)
         {
            gotoAndStop((a_1276[a_1275] as FrameLabel).frame);
         }
         else if(iCurrentFrame == a_1274)
         {
            this.a_3940();
         }
      }
      
      private function AddFogEffect(stCenterGrid:a_3491) : void
      {
         var battleFieldView:BattleFieldView = null;
         var x:int = 0;
         var stTargetGrid:a_3491 = null;
         var fogEffect:StrangeThiefRatFogEffect = null;
         if(stCenterGrid == null)
         {
            return;
         }
         var xStart:int = Math.max(stCenterGrid.m_iXGridNo - 1,0);
         var xEnd:int = Math.min(stCenterGrid.m_iXGridNo + 1,BattleFieldView.a_1011 - 1);
         var yStart:int = Math.max(stCenterGrid.m_iYGridNo - 1,0);
         var yEnd:int = Math.min(stCenterGrid.m_iYGridNo + 1,BattleFieldView.a_1012 - 1);
         battleFieldView = stCenterGrid.m_stCurrentBattbleFieldView;
         for(var y:int = yStart; y <= yEnd; y++)
         {
            for(x = xStart; x <= xEnd; x++)
            {
               stTargetGrid = battleFieldView.a_3438(x,y);
               if(stTargetGrid != null)
               {
                  fogEffect = StrangeThiefRatFogEffect.a_3926() as StrangeThiefRatFogEffect;
                  if(fogEffect != null)
                  {
                     fogEffect.m_MoveState = false;
                     fogEffect.stOriginalFieldGrid = stTargetGrid;
                     fogEffect.a_1797(false);
                     fogEffect.x = (stTargetGrid.m_iXGridNo + 0.5) * a_3491.a_1080;
                     fogEffect.y = (stTargetGrid.m_iYGridNo + 0.5) * a_3491.a_1081;
                     battleFieldView.AddToBattleView(fogEffect,BattleLayerDefine.EFFECTS_TOP_TYPE,stTargetGrid);
                     fogEffect.play();
                  }
               }
            }
         }
      }
      
      private function AddCenterFogEffect(stCenterGrid:a_3491) : void
      {
         var battleFieldView:BattleFieldView = null;
         var fogEffect:StrangeThiefRatFogEffect = null;
         if(stCenterGrid == null)
         {
            return;
         }
         battleFieldView = stCenterGrid.m_stCurrentBattbleFieldView;
         fogEffect = StrangeThiefRatFogEffect.a_3926() as StrangeThiefRatFogEffect;
         if(fogEffect == null)
         {
            return;
         }
         fogEffect.m_MoveState = true;
         fogEffect.stOriginalFieldGrid = stCenterGrid;
         fogEffect.a_1797(false);
         fogEffect.x = (stCenterGrid.m_iXGridNo + 0.5) * a_3491.a_1080;
         fogEffect.y = (stCenterGrid.m_iYGridNo + 0.5) * a_3491.a_1081;
         battleFieldView.AddToBattleView(fogEffect,BattleLayerDefine.EFFECTS_TOP_TYPE,stCenterGrid);
         fogEffect.play();
      }
      
      override public function a_3940() : Boolean
      {
         var stVector:Array = null;
         super.a_3940();
         if(this.stOriginalFieldGrid)
         {
            stVector = this.stOriginalFieldGrid.m_stCurrentBattbleFieldView.m_arrEffectArray;
            if(-1 != stVector.indexOf(this))
            {
               stVector.splice(stVector.indexOf(this),1);
            }
         }
         return true;
      }
   }
}

