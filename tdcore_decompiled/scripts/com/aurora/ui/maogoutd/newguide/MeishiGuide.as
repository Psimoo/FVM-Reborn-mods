package com.aurora.ui.maogoutd.newguide
{
   import a_4789.a_4657;
   import com.aurora.ui.maogoutd.newguide.animation.AnimationManager;
   import com.aurora.ui.maogoutd.newguide.animation.BaseAnimation;
   import com.aurora.ui.maogoutd.newguide.event.AnimationEvent;
   import flash.display.DisplayObjectContainer;
   import flash.display.Stage;
   import flash.system.ApplicationDomain;
   import flash.utils.Dictionary;
   
   public class MeishiGuide
   {
      
      private static var _instance:MeishiGuide;
      
      private static var _index:int;
      
      private var _lobbyUI:DisplayObjectContainer;
      
      private var _resDomain:ApplicationDomain;
      
      private var _stage:Stage;
      
      private var _animationManagerDict:Dictionary;
      
      private var _animationQuene:Array;
      
      private var _isPlay:Boolean = false;
      
      public function MeishiGuide()
      {
         super();
         if(_index > 0)
         {
            throw new Error("Story Guide Error!");
         }
         ++_index;
         a_4657.getInstance().addListener(this);
         this._animationManagerDict = new Dictionary();
      }
      
      public static function get Instance() : MeishiGuide
      {
         if(_instance == null)
         {
            _instance = new MeishiGuide();
         }
         return _instance;
      }
      
      public function a_3014(s:Stage, lobbyUI:DisplayObjectContainer, resDomain:ApplicationDomain) : void
      {
         this._stage = s;
         this._lobbyUI = lobbyUI;
         this._resDomain = resDomain;
      }
      
      public function getResourceByName(class_name:String) : Object
      {
         return BaseAnimation.getResourceByName(class_name);
      }
      
      public function pushAnimationToQuene(obj:Object) : void
      {
         if(this._animationQuene == null)
         {
            this._animationQuene = [];
         }
         if(this._isPlay)
         {
            this._animationQuene.push(obj);
         }
         else
         {
            this._isPlay = true;
            (this[obj.func] as Function).apply(null,obj.params);
         }
      }
      
      private function playQueneAnimation() : void
      {
         if(this._animationQuene == null || this._animationQuene.length == 0)
         {
            return;
         }
         var obj:Object = this._animationQuene.shift() as Object;
         this._isPlay = true;
         (this[obj.func] as Function).apply(null,obj.params);
      }
      
      public function showLevelUpAnimation(obj:Object) : void
      {
         var level:Dictionary = NewGuideConfig.Instance.getLevelUpConfig();
         if(level[obj.iLevel] == null)
         {
            level[obj.iLevel] = {};
            level[obj.iLevel].name = "LevelUpAnimation";
            level[obj.iLevel].animation = {};
            level[obj.iLevel].animation.show_pos = "";
         }
         level[obj.iLevel].animation.level_data = obj;
         var _animationManager:AnimationManager = this._animationManagerDict["LevelUp"];
         if(_animationManager == null)
         {
            _animationManager = new AnimationManager(this._stage,this._lobbyUI,this._resDomain,level);
            _animationManager.addEventListener(AnimationEvent.EVENT,this.eventHandler);
            _animationManager.addEventListener(AnimationEvent.ANIMATION_COMPLETE,this.eventHandler);
            this._animationManagerDict["LevelUp"] = _animationManager;
         }
         _animationManager.showAnimation(obj.iLevel,level);
      }
      
      public function showStoryGuide(guide_id:int) : void
      {
         var animationConfig:Dictionary = NewGuideConfig.Instance.getStoryGuideConfig(guide_id);
         var _animationManager:AnimationManager = this._animationManagerDict["StoryGuide"];
         if(_animationManager == null)
         {
            _animationManager = new AnimationManager(this._stage,this._lobbyUI,this._resDomain,animationConfig);
            _animationManager.addEventListener(AnimationEvent.EVENT,this.eventHandler);
            _animationManager.addEventListener(AnimationEvent.ANIMATION_COMPLETE,this.eventHandler);
            this._animationManagerDict["StoryGuide"] = _animationManager;
         }
         _animationManager.showAnimation(guide_id & 0x0F00);
      }
      
      public function showStoryGuideByLevel(level:int) : void
      {
         var e:Object = null;
         var animationConfig:Array = NewGuideConfig.Instance.getStoryGuideConfigByLevel(level);
         var obj:Object = {};
         for(var i:int = 0; i < animationConfig.length; i++)
         {
            e = {"m_mData":{
               "type":"story_level",
               "data":animationConfig[i]
            }};
            obj.event_data = e;
            a_4657.getInstance().execute("StoryGuideEventHandler",null,obj);
         }
      }
      
      public function showGuideAnimation(animation_id:int) : void
      {
         var animationConfig:Dictionary = NewGuideConfig.Instance.getAnimationConfig();
         var _animationManager:AnimationManager = this._animationManagerDict["ModelGuide"];
         if(_animationManager == null)
         {
            _animationManager = new AnimationManager(this._stage,this._lobbyUI,this._resDomain,animationConfig);
            _animationManager.addEventListener(AnimationEvent.EVENT,this.eventHandler);
            _animationManager.addEventListener(AnimationEvent.ANIMATION_COMPLETE,this.eventHandler);
            this._animationManagerDict["ModelGuide"] = _animationManager;
         }
         _animationManager.showAnimation(animation_id);
      }
      
      public function showMenuOpenAnimation(animation_id:int) : void
      {
         var menuOpenConfig:Dictionary = NewGuideConfig.Instance.getModelOpenConfig();
         var _animationManager:AnimationManager = this._animationManagerDict["ModelOpen"];
         if(_animationManager == null)
         {
            _animationManager = new AnimationManager(this._stage,this._lobbyUI,this._resDomain,menuOpenConfig);
            _animationManager.addEventListener(AnimationEvent.EVENT,this.eventHandler);
            _animationManager.addEventListener(AnimationEvent.ANIMATION_COMPLETE,this.eventHandler);
            this._animationManagerDict["ModelOpen"] = _animationManager;
         }
         _animationManager.showAnimation(animation_id);
      }
      
      public function showMenuOpenByLevel(level:int) : void
      {
         var e:Object = null;
         var animation_id:Array = NewGuideConfig.Instance.getModelOpenIDsByLevel(level);
         for(var i:int = 0; i < animation_id.length; i++)
         {
            e = {
               "type":"menuopen_level",
               "data":animation_id[i]
            };
            a_4657.getInstance().execute("MenuOpenEventHandler",null,{"event_data":e});
         }
      }
      
      public function showNewCardAnimationByID(animation_id:int) : void
      {
         var newCardConfig:Dictionary = NewGuideConfig.Instance.getNewCardConfig();
         var _animationManager:AnimationManager = this._animationManagerDict["NewCard"];
         if(_animationManager == null)
         {
            _animationManager = new AnimationManager(this._stage,this._lobbyUI,this._resDomain,newCardConfig);
            _animationManager.addEventListener(AnimationEvent.EVENT,this.eventHandler);
            _animationManager.addEventListener(AnimationEvent.ANIMATION_COMPLETE,this.eventHandler);
            this._animationManagerDict["NewCard"] = _animationManager;
         }
         _animationManager.showAnimation(animation_id);
      }
      
      public function showNewCardAnimationByCards(cardIDs:Array) : void
      {
         var animation_id:int = NewGuideConfig.Instance.getNewCardIDByCardsArr(cardIDs);
         if(animation_id != -1)
         {
            this.showNewCardAnimationByID(animation_id);
         }
         else
         {
            this._isPlay = false;
            this.playQueneAnimation();
         }
      }
      
      public function hasLevelCardsAnimation(cardIDs:Array) : Boolean
      {
         var animation_id:int = NewGuideConfig.Instance.getNewCardIDByCardsArr(cardIDs);
         if(animation_id != -1)
         {
            return true;
         }
         return false;
      }
      
      private function eventHandler(e:AnimationEvent) : void
      {
         if(e.type == AnimationEvent.ANIMATION_COMPLETE)
         {
            this._isPlay = false;
            this.playQueneAnimation();
         }
         if(e.m_eData != null && e.m_eData.event_type != null)
         {
            a_4657.getInstance().execute(e.m_eData.event_type + "Handler",null,e.m_eData);
         }
      }
   }
}

