package com.aurora.ui.maogoutd.newguide.animation
{
   import flash.display.DisplayObjectContainer;
   import flash.display.Sprite;
   import flash.display.Stage;
   import flash.system.ApplicationDomain;
   import flash.utils.Dictionary;
   import flash.utils.Timer;
   
   public class BaseAnimation extends Sprite
   {
      
      protected static var _resDomain:ApplicationDomain;
      
      private static var _resDict:Dictionary;
      
      private static var _timeOutTimer:Timer;
      
      protected var _container:Stage;
      
      protected var _lobbyUI:DisplayObjectContainer;
      
      protected var _guideStepArr:Array;
      
      protected var _currentStep:Object;
      
      public function BaseAnimation(container:Stage, lobbyUI:DisplayObjectContainer, resDomain:ApplicationDomain)
      {
         super();
         this._container = container;
         this._lobbyUI = lobbyUI;
         if(_resDomain == null)
         {
            _resDomain = resDomain;
         }
      }
      
      public static function getResourceByName(class_name:String, create_new:Boolean = false) : Object
      {
         if(_resDict == null)
         {
            _resDict = new Dictionary();
         }
         var CLASS:Class = _resDomain.getDefinition(class_name) as Class;
         if(CLASS == null)
         {
            throw new Error("类定义不存在,请检查代码.");
         }
         if(create_new)
         {
            return new CLASS();
         }
         if(_resDict[class_name] == null)
         {
            _resDict[class_name] = new CLASS();
         }
         return _resDict[class_name];
      }
      
      public static function FormatMsgToHTMLMsg(msg:String) : String
      {
         var htmlMsg:String = null;
         htmlMsg = msg.replace(/&l/g,"<");
         htmlMsg = htmlMsg.replace(/&r/g,">");
         htmlMsg = htmlMsg.replace(/&q/g,"\"");
         htmlMsg = htmlMsg.replace(/&j/g,"#");
         return htmlMsg.replace(/&x/g,"/");
      }
      
      public function showAnimation(cfg:Object) : void
      {
         this._container.addChild(this);
      }
   }
}

