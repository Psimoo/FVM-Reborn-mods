package com.aurora.ui.maogoutd.game
{
   import a_4752.GameStringManager;
   import com.aurora.ui.maogoutd.ClientLog.MessageTipHandler;
   import com.aurora.ui.maogoutd.ClientLog.ReportHandler;
   import com.aurora.utils.bitmap.ColorMatrix;
   import flash.display.DisplayObject;
   import flash.display.MovieClip;
   import flash.display.SimpleButton;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.filters.ColorMatrixFilter;
   import flash.text.TextField;
   
   public class ReportView extends Sprite
   {
      
      public var m_stConfirmCheckBoxMc:MovieClip;
      
      public var m_stCloseBtn:SimpleButton;
      
      public var m_stConfirmBtn:SimpleButton;
      
      public var m_stDescText:TextField;
      
      public var m_stCoinDescText:TextField;
      
      public function ReportView()
      {
         super();
         this.m_stConfirmCheckBoxMc.gotoAndStop(1);
         visible = false;
         this.m_stCoinDescText.htmlText = GameStringManager.getInstance().getString(140032);
         this.m_stCoinDescText.filters = this.m_stDescText.filters;
         this.m_stDescText.text = GameStringManager.getInstance().getString(139925);
         this.m_stConfirmCheckBoxMc.addEventListener(MouseEvent.CLICK,this.OnClickConfirmCheckBoxHandler);
         this.m_stConfirmBtn.addEventListener(MouseEvent.CLICK,this.OnClickReportHandler);
      }
      
      private function OnClickReportHandler(e:MouseEvent) : void
      {
         if(!MessageTipHandler.Get().checkCoin(50000))
         {
            return;
         }
         visible = false;
         ReportHandler.Get().OnCCSRequestReportPlayer();
      }
      
      private function OnClickConfirmCheckBoxHandler(e:MouseEvent) : void
      {
         if(!MessageTipHandler.Get().checkCoin(50000))
         {
            return;
         }
         this.m_stConfirmCheckBoxMc.gotoAndStop(this.m_stConfirmCheckBoxMc.currentFrame % 2 + 1);
         this.Enabled = Boolean(this.m_stConfirmCheckBoxMc.currentFrame % 2 == 0);
      }
      
      public function a_3014() : void
      {
         this.visible = true;
         this.Enabled = false;
      }
      
      private function set Enabled(value:Boolean) : void
      {
         if(value)
         {
            this.m_stConfirmCheckBoxMc.gotoAndStop(2);
            this.m_stConfirmBtn.mouseEnabled = true;
            this.removeMatrix(this.m_stConfirmBtn);
         }
         else
         {
            this.m_stConfirmCheckBoxMc.gotoAndStop(1);
            this.m_stConfirmBtn.mouseEnabled = false;
            this.addMatrix(this.m_stConfirmBtn);
         }
      }
      
      public function addMatrix(display:DisplayObject) : void
      {
         var cm:ColorMatrix = new ColorMatrix();
         cm.adjustColor(0,0,-100,0);
         display.filters = [new ColorMatrixFilter(cm)];
      }
      
      public function removeMatrix(display:DisplayObject) : void
      {
         var cm:ColorMatrix = new ColorMatrix();
         cm.adjustColor(0,0,0,0);
         display.filters = [new ColorMatrixFilter(cm)];
      }
   }
}

