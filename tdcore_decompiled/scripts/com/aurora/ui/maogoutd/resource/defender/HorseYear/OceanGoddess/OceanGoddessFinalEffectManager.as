package com.aurora.ui.maogoutd.resource.defender.HorseYear.OceanGoddess
{
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.EffectManager;
   import com.aurora.ui.maogoutd.resource.defender.HorseYear.OceanGoddess.effect.OceanGoddessFinalCornerEffectMovie;
   import com.aurora.ui.maogoutd.resource.effect.BaseGameEffect;
   
   public class OceanGoddessFinalEffectManager
   {
      
      private static var _instance:OceanGoddessFinalEffectManager;
      
      private static const POS_LEFT_TOP:int = 0;
      
      private static const POS_RIGHT_TOP:int = 1;
      
      private static const POS_LEFT_BOTTOM:int = 2;
      
      private static const POS_RIGHT_BOTTOM:int = 3;
      
      private var m_Effects:Array = [null,null,null,null];
      
      protected var stFieldGrid:a_3491;
      
      public var m_cardCount:int;
      
      public function OceanGoddessFinalEffectManager()
      {
         super();
      }
      
      public static function get instance() : OceanGoddessFinalEffectManager
      {
         if(_instance == null)
         {
            _instance = new OceanGoddessFinalEffectManager();
         }
         return _instance;
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
      }
      
      private function showEffect(pos:int) : void
      {
         var gridX:int = 0;
         var gridY:int = 0;
         var offsetX:int = 0;
         var offsetY:int = 0;
         var grid:a_3491 = null;
         var effect:BaseGameEffect = null;
         if(Boolean(!this.stFieldGrid) || Boolean(this.m_Effects[pos]) || this.m_cardCount < 4)
         {
            return;
         }
         var scaleX:Number = 1;
         var scaleY:Number = 1;
         offsetX = 0;
         offsetY = 0;
         switch(pos)
         {
            case POS_LEFT_TOP:
               gridX = 0;
               gridY = 0;
               scaleX = -1;
               scaleY = 1;
               break;
            case POS_RIGHT_TOP:
               gridX = BattleFieldView.a_1011 - 1;
               gridY = 0;
               scaleX = 1;
               scaleY = 1;
               break;
            case POS_LEFT_BOTTOM:
               gridX = 0;
               gridY = BattleFieldView.a_1012 - 1;
               scaleX = -1;
               scaleY = -1;
               offsetY = 14;
               break;
            case POS_RIGHT_BOTTOM:
               gridX = BattleFieldView.a_1011 - 1;
               gridY = BattleFieldView.a_1012 - 1;
               scaleX = 1;
               scaleY = -1;
               offsetY = 14;
         }
         grid = this.stFieldGrid.m_stCurrentBattbleFieldView.a_3438(gridX,gridY);
         effect = EffectManager.getInstance().CheckOutEffect(OceanGoddessFinalCornerEffectMovie);
         effect.scaleX = scaleX;
         effect.scaleY = scaleY;
         effect.SetAnimation(0,false);
         effect.x = (gridX + 0.5) * a_3491.a_1080 + offsetX;
         effect.y = (gridY + 0.5) * a_3491.a_1081 + offsetY;
         this.m_Effects[pos] = effect;
         grid.m_stCurrentBattbleFieldView.AddToBattleView(effect,BattleLayerDefine.EFFECTS_BASE_TYPE,grid);
      }
      
      public function removeEffect(effect:Object) : void
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
         if(this.m_cardCount >= 4)
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
         this.stFieldGrid = null;
      }
   }
}

