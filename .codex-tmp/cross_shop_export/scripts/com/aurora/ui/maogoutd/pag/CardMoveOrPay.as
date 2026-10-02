package com.aurora.ui.maogoutd.pag
{
   import flash.display.MovieClip;
   import flash.display.SimpleButton;
   
   public class CardMoveOrPay extends MovieClip
   {
      
      public var payBtn:SimpleButton;
      
      public var moveBtn:SimpleButton;
      
      public var useBtn:SimpleButton;
      
      public var onceUseBtn:SimpleButton;
      
      public var onceMoveBtn:SimpleButton;
      
      public var onceKeyOpenBtn:SimpleButton;
      
      public function CardMoveOrPay()
      {
         super();
      }
      
      public function showUse() : void
      {
         this.useBtn.visible = true;
         this.useBtn.enabled = true;
         this.payBtn.visible = false;
         this.payBtn.enabled = false;
         this.onceUseBtn.visible = false;
         this.onceUseBtn.enabled = false;
         this.onceMoveBtn.visible = false;
         this.onceMoveBtn.enabled = false;
         this.onceKeyOpenBtn.visible = false;
         this.onceKeyOpenBtn.enabled = false;
      }
      
      public function showPay() : void
      {
         this.useBtn.visible = false;
         this.useBtn.enabled = false;
         this.payBtn.visible = true;
         this.payBtn.enabled = true;
         this.onceUseBtn.visible = false;
         this.onceUseBtn.enabled = false;
         this.onceMoveBtn.visible = false;
         this.onceMoveBtn.enabled = false;
         this.onceKeyOpenBtn.visible = false;
         this.onceKeyOpenBtn.enabled = false;
      }
      
      public function showOnceKeyOpen() : void
      {
         this.useBtn.visible = false;
         this.useBtn.enabled = false;
         this.payBtn.visible = false;
         this.payBtn.enabled = false;
         this.onceUseBtn.visible = true;
         this.onceUseBtn.enabled = true;
         this.onceMoveBtn.visible = true;
         this.onceMoveBtn.enabled = true;
         this.onceKeyOpenBtn.visible = true;
         this.onceKeyOpenBtn.enabled = true;
      }
   }
}

