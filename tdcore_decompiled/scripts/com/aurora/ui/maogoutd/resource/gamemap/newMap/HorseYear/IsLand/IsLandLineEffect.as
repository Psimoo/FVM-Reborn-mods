package com.aurora.ui.maogoutd.resource.gamemap.newMap.HorseYear.IsLand
{
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.defender.a_3953;
   import com.aurora.ui.maogoutd.resource.effect.base.BaseOriginEffect;
   import com.aurora.ui.maogoutd.resource.gamemap.newMap.HorseYear.IsLand.Movie.IsLandLineEffectMovie;
   import flash.geom.Point;
   
   public class IsLandLineEffect extends BaseOriginEffect
   {
      
      private var remainTick:int = -1;
      
      private var _card:a_3953;
      
      private var _effect:DragonSuppressingPillarEffect;
      
      public function IsLandLineEffect()
      {
         super();
      }
      
      override public function a_3014() : void
      {
         alpha = 1;
         super.a_3014();
      }
      
      public function UpdateLine(iSNoX:int, iSNoY:int, iENoX:int, iENoY:int) : void
      {
         var startPosition:Point = null;
         var endPosition:Point = null;
         startPosition = new Point(a_3491.a_1080 * (iSNoX + 0.5),a_3491.a_1081 * (iSNoY + 0.5));
         endPosition = new Point(a_3491.a_1080 * (iENoX + 0.5),a_3491.a_1081 * (iENoY + 0.5));
         x = startPosition.x;
         y = startPosition.y;
         var dy:Number = endPosition.y - startPosition.y;
         var dx:Number = endPosition.x - startPosition.x;
         var ratation:Number = Math.atan2(dy,dx);
         this.rotation = ratation * 180 / Math.PI;
         var dis:Number = Point.distance(startPosition,endPosition);
         (m_stMovieClip as IsLandLineEffectMovie).bgMask.width = dis;
      }
      
      public function RemoveLine(effect:DragonSuppressingPillarEffect, card:a_3953) : void
      {
         if(this.remainTick > 0)
         {
            return;
         }
         this._card = card;
         this._effect = effect;
         SetAnimation(1);
         this.remainTick = 30;
      }
      
      override protected function OnPlayNextFrame() : void
      {
         super.OnPlayNextFrame();
         if(this.remainTick > 0)
         {
            --this.remainTick;
            if(this.remainTick == 0)
            {
               SetAnimation(2,true);
            }
         }
         if(a_1273 == 12 && m_bEndRelease == true)
         {
            this._card.SpecialSkillCallBack(-1);
            this._effect.RemoveCard(this._card);
         }
      }
   }
}

