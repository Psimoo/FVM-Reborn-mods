package com.aurora.ui.maogoutd.newguide.animation
{
   import com.aurora.ui.maogoutd.newguide.event.AnimationEvent;
   import flash.display.DisplayObjectContainer;
   import flash.display.Stage;
   import flash.events.EventDispatcher;
   import flash.system.ApplicationDomain;
   import flash.utils.Dictionary;
   
   public class AnimationManager extends EventDispatcher
   {
      
      private var _resDomain:ApplicationDomain;
      
      private var _stage:Stage;
      
      private var _lobbyUI:DisplayObjectContainer;
      
      private var _config:Dictionary;
      
      private var _animationInsDict:Dictionary;
      
      public function AnimationManager(s:Stage, lobbyUI:DisplayObjectContainer, resDomain:ApplicationDomain, animationConfig:Dictionary)
      {
         super();
         this._resDomain = resDomain;
         this._stage = s;
         this._lobbyUI = lobbyUI;
         this._config = animationConfig;
         this._animationInsDict = new Dictionary();
      }
      
      public function showAnimation(animation_id:int, config:Dictionary = null) : void
      {
         if(config != null)
         {
            this._config = config;
         }
         var c_name:String = this._config[animation_id].name;
         if(c_name == null)
         {
            return;
         }
         c_name = "com.aurora.ui.maogoutd.newguide.animation." + c_name;
         var CLASS:Class = this._resDomain.getDefinition(c_name) as Class;
         var animationIns:BaseAnimation = this._animationInsDict[c_name];
         if(animationIns == null)
         {
            animationIns = new CLASS(this._stage,this._lobbyUI,this._resDomain) as BaseAnimation;
            animationIns.addEventListener(AnimationEvent.EVENT,this.animationEventHandler);
            animationIns.addEventListener(AnimationEvent.ANIMATION_COMPLETE,this.animationEventHandler);
            this._animationInsDict[c_name] = animationIns;
         }
         animationIns.showAnimation(this._config[animation_id].animation);
      }
      
      public function animationEventHandler(e:AnimationEvent) : void
      {
         dispatchEvent(e);
      }
   }
}

