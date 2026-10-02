package com.aurora.ui.maogoutd.game
{
   import flash.display.SimpleButton;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   
   public class ExitGameConfirmView extends Sprite
   {
      
      public var m_stCloseButton:SimpleButton;
      
      public var m_stConfirmButton:SimpleButton;
      
      public var m_stCancelButton:SimpleButton;
      
      public function ExitGameConfirmView()
      {
         super();
         this.m_stCloseButton.addEventListener(MouseEvent.CLICK,this.OnHideConfirmView);
         this.m_stCancelButton.addEventListener(MouseEvent.CLICK,this.OnHideConfirmView);
      }
      
      private function OnHideConfirmView(a_4730:Event) : void
      {
         this.visible = false;
      }
   }
}

