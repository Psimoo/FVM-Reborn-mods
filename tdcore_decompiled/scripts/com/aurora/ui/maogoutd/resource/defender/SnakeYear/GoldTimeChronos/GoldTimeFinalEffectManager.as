package com.aurora.ui.maogoutd.resource.defender.SnakeYear.GoldTimeChronos
{
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.defender.SnakeYear.GoldTimeChronos.Effect.GoldTimeFinalBottomEffect;
   import flash.events.Event;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   
   public class GoldTimeFinalEffectManager
   {
      
      private static var _instance:GoldTimeFinalEffectManager;
      
      private static const POS_LEFT_TOP:int = 0;
      
      private static const POS_RIGHT_TOP:int = 1;
      
      private static const POS_LEFT_BOTTOM:int = 2;
      
      private static const POS_RIGHT_BOTTOM:int = 3;
      
      private var a_1109:Timer;
      
      private var m_Effects:Array = [null,null,null,null];
      
      protected var stFieldGrid:a_3491;
      
      public var m_cardCount:int;
      
      public function GoldTimeFinalEffectManager()
      {
         super();
         this.a_1109 = new Timer(50);
         this.a_1109.addEventListener(TimerEvent.TIMER,this.a_4109);
      }
      
      public static function get instance() : GoldTimeFinalEffectManager
      {
         if(_instance == null)
         {
            _instance = new GoldTimeFinalEffectManager();
         }
         return _instance;
      }
      
      public function play() : void
      {
         if(!this.a_1109.running)
         {
            this.a_1109.start();
         }
      }
      
      public function stop() : void
      {
         if(this.a_1109.running)
         {
            this.a_1109.stop();
         }
      }
      
      protected function a_4109(a_4730:Event) : void
      {
         this.showPlay(1);
      }
      
      public function showAll(a_1334:a_3491) : void
      {
         if(this.stFieldGrid == null)
         {
            this.stFieldGrid = a_1334;
         }
         this.showEffect(POS_LEFT_TOP);
         this.showEffect(POS_RIGHT_TOP);
         this.showEffect(POS_LEFT_BOTTOM);
         this.showEffect(POS_RIGHT_BOTTOM);
         if(!this.a_1109.running)
         {
            this.play();
         }
      }
      
      private function showEffect(pos:int) : void
      {
         var gridX:int = 0;
         var gridY:int = 0;
         var offsetY:int = 0;
         var grid:a_3491 = null;
         var effect:GoldTimeFinalBottomEffect = null;
         if(!this.stFieldGrid || Boolean(this.m_Effects[pos]))
         {
            return;
         }
         var scaleX:Number = 1;
         var scaleY:Number = 1;
         var offsetX:int = 0;
         offsetY = 0;
         switch(pos)
         {
            case POS_LEFT_TOP:
               gridX = 0;
               gridY = 0;
               scaleX = -1;
               scaleY = -1;
               offsetX = 42;
               offsetY = 49;
               break;
            case POS_RIGHT_TOP:
               gridX = BattleFieldView.a_1011 - 1;
               gridY = 0;
               scaleX = 1;
               scaleY = -1;
               offsetX = -45;
               offsetY = 49;
               break;
            case POS_LEFT_BOTTOM:
               gridX = 0;
               gridY = BattleFieldView.a_1012 - 1;
               scaleX = -1;
               scaleY = 1;
               offsetX = 42;
               offsetY = -34;
               break;
            case POS_RIGHT_BOTTOM:
               gridX = BattleFieldView.a_1011 - 1;
               gridY = BattleFieldView.a_1012 - 1;
               scaleX = 1;
               scaleY = 1;
               offsetX = -45;
               offsetY = -34;
         }
         grid = this.stFieldGrid.m_stCurrentBattbleFieldView.a_3438(gridX,gridY);
         effect = GoldTimeFinalBottomEffect.a_3926();
         effect.a_1797(false);
         effect.scaleX = scaleX;
         effect.scaleY = scaleY;
         effect.x = (gridX + 0.5) * a_3491.a_1080 + offsetX;
         effect.y = (gridY + 0.5) * a_3491.a_1081 + offsetY;
         this.m_Effects[pos] = effect;
         grid.m_stCurrentBattbleFieldView.AddToBattleView(effect,BattleLayerDefine.EFFECTS_BASE_TYPE,grid);
      }
      
      public function removeEffect(effect:*) : void
      {
         for(var i:int = 0; i < 4; i++)
         {
            if(this.m_Effects[i] != null && effect == this.m_Effects[i])
            {
               this.m_Effects[i] = null;
               break;
            }
         }
      }
      
      public function hideAll() : void
      {
         if(this.m_cardCount > 0)
         {
            return;
         }
         for(var i:int = 0; i < 4; i++)
         {
            if(this.m_Effects[i])
            {
               this.m_Effects[i].a_3940();
               this.m_Effects[i] = null;
            }
         }
         this.stop();
         this.stFieldGrid = null;
      }
      
      public function showPlay(iCurrentTime:int) : void
      {
         for(var i:int = 0; i < 4; i++)
         {
            if(this.m_Effects[i])
            {
               this.m_Effects[i].a_4140(iCurrentTime);
            }
         }
      }
      
      public function ShowPlayAnimation(startIndex:int, loopIndex:int) : void
      {
         for(var i:int = 0; i < 4; i++)
         {
            if(this.m_Effects[i])
            {
               this.m_Effects[i].ShowPlayAnimation(startIndex,loopIndex);
            }
         }
      }
   }
}

