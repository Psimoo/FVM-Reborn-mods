package com.aurora.ui.maogoutd.crossshop
{
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol101")]
   public class ExchangeMoneyShow extends Sprite
   {
      
      public var m_stNumber:FragmentNumber;
      
      public var m_IconMc:MovieClip;
      
      public var m_TipMc:Tip;
      
      public function ExchangeMoneyShow()
      {
         super();
         this.m_stNumber = new FragmentNumber();
         this.m_stNumber.x = 45;
         this.m_stNumber.y = 15;
         addChild(this.m_stNumber);
         this.m_TipMc.visible = false;
         addEventListener(MouseEvent.ROLL_OVER,this.onMouseRollOverEvent);
         addEventListener(MouseEvent.ROLL_OUT,this.onMouseRollOutEvent);
      }
      
      protected function onMouseRollOutEvent(a_4730:MouseEvent) : void
      {
         this.m_TipMc.visible = false;
      }
      
      protected function onMouseRollOverEvent(a_4730:MouseEvent) : void
      {
         this.m_TipMc.visible = true;
      }
      
      public function setNumber(iNum:int) : void
      {
         this.m_stNumber.setNumber(iNum);
      }
      
      public function setMoneyType(iType:int) : void
      {
         this.m_IconMc.gotoAndStop(iType);
         this.m_TipMc.setValue(iType);
      }
   }
}

