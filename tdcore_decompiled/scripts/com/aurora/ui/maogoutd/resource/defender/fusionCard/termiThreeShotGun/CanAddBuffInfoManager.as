package com.aurora.ui.maogoutd.resource.defender.fusionCard.termiThreeShotGun
{
   import flash.display.DisplayObjectContainer;
   import flash.filters.GlowFilter;
   import flash.text.TextField;
   import flash.text.TextFormat;
   import flash.utils.Dictionary;
   
   public class CanAddBuffInfoManager
   {
      
      private static var _instance:CanAddBuffInfoManager;
      
      private var _buffTextDic:Dictionary = new Dictionary();
      
      private var _parentLayer:DisplayObjectContainer;
      
      public function CanAddBuffInfoManager()
      {
         super();
      }
      
      public static function Get() : CanAddBuffInfoManager
      {
         if(!_instance)
         {
            _instance = new CanAddBuffInfoManager();
         }
         return _instance;
      }
      
      public function createBuffText() : TextField
      {
         var txt:TextField = null;
         txt = new TextField();
         var fmt:TextFormat = new TextFormat("Arial",14,16777113,true);
         txt.defaultTextFormat = fmt;
         txt.mouseEnabled = false;
         txt.selectable = false;
         txt.multiline = false;
         txt.wordWrap = false;
         txt.autoSize = "left";
         txt.filters = [new GlowFilter(0,1,2,2,10)];
         return txt;
      }
      
      public function updateBuffText(txt:TextField, addtimes:int, secondsLeft:Number, hitCount:int = -1) : void
      {
         if(hitCount >= 0)
         {
            txt.multiline = true;
            txt.wordWrap = false;
            txt.text = "叠" + addtimes + "\n剩" + secondsLeft + "s\n" + hitCount + "次";
         }
         else
         {
            txt.text = "叠" + addtimes + "\n剩" + secondsLeft + "s";
         }
      }
      
      public function HideBuffText(txt:TextField) : void
      {
         if(!txt)
         {
            return;
         }
         txt.visible = false;
         if(txt.parent)
         {
            txt.parent.removeChild(txt);
         }
      }
   }
}

