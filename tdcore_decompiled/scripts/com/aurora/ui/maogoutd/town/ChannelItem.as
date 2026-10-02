package com.aurora.ui.maogoutd.town
{
   import flash.display.MovieClip;
   import flash.events.MouseEvent;
   import flash.text.TextField;
   
   public class ChannelItem extends MovieClip
   {
      
      public var netStatus:MovieClip;
      
      public var bg:MovieClip;
      
      public var roomNameText:TextField;
      
      public var mc:MovieClip;
      
      private var _roomItem:Object;
      
      public function ChannelItem()
      {
         super();
         this.bg.gotoAndStop(1);
         this.mc.gotoAndStop(1);
         this.mc.visible = false;
         this.netStatus.gotoAndStop(1);
         this.netStatus.visible = false;
         this.mouseChildren = false;
         this.buttonMode = true;
         this.mouseEnabled = true;
         this.addEventListener(MouseEvent.ROLL_OVER,this.onMouseRollOverEvent);
         this.addEventListener(MouseEvent.ROLL_OUT,this.onMouseRollOutEvent);
      }
      
      private function onMouseRollOverEvent(a_4730:MouseEvent) : void
      {
         this.mc.gotoAndPlay(1);
         this.mc.visible = true;
      }
      
      private function onMouseRollOutEvent(a_4730:MouseEvent) : void
      {
         this.mc.gotoAndStop(1);
         this.mc.visible = false;
      }
      
      public function showChannelItem(roomItem:Object) : void
      {
         var color:String = null;
         this._roomItem = roomItem;
         if(roomItem != null)
         {
            this.bg.gotoAndStop(roomItem.index + 1);
            color = "8bdf6d";
            if(roomItem.index == 1)
            {
               color = "f18e4c";
            }
            else if(roomItem.index == 2)
            {
               color = "f36388";
            }
            else if(roomItem.index == 3)
            {
               color = "66ccff";
            }
            if(roomItem.Text != null)
            {
               if(roomItem.iRoomID == 26)
               {
                  this.roomNameText.htmlText = "<font color=\'#ff0000\'><b>" + roomItem.Text + "</b></font>";
               }
               else
               {
                  this.roomNameText.htmlText = "<font color=\'#" + color + "\'><b>" + roomItem.Text + "</b></font>";
               }
            }
            else
            {
               this.roomNameText.htmlText = "<font color=\'#" + color + "\'><b>小笼包</b></font>";
            }
            this.showChannelStatus(roomItem.iPlayerCount);
         }
      }
      
      public function showChannelStatus(count:int) : void
      {
         if(this._roomItem == null)
         {
            return;
         }
         this.netStatus.visible = true;
         this._roomItem.iPlayerCount = count;
         if(count >= this._roomItem.MaxPlayerCount * 0.95)
         {
            this.netStatus.gotoAndStop(2);
         }
         else
         {
            this.netStatus.gotoAndStop(1);
         }
      }
      
      public function get roomItem() : Object
      {
         return this._roomItem;
      }
   }
}

