package com.aurora.ui.maogoutd.verifyInGame
{
   import a_4763.a_2439;
   import flash.display.MovieClip;
   import flash.events.Event;
   
   public class TDVerifyInGameUI extends MovieClip
   {
      
      public var readInputVerifyMc:MovieClip;
      
      private var readInputVerify:TDReadInputVerify;
      
      public var numVerifyMc:MovieClip;
      
      public var pieceVerifyMc:MovieClip;
      
      private var numVerify:TDRandNumVerify;
      
      private var pieceVerify:TDPieceVerify;
      
      private var verifyData:Object;
      
      private var isDebug:Boolean;
      
      public function TDVerifyInGameUI()
      {
         super();
         this.isDebug = false;
         addEventListener(Event.ADDED_TO_STAGE,this.a_4587);
      }
      
      private function a_4587(e:Event) : void
      {
         var type:int = 0;
         var minX:Number = NaN;
         var maxX:Number = NaN;
         var minY:Number = NaN;
         var maxY:Number = NaN;
         this.addEventListener(Event.REMOVED_FROM_STAGE,this.onRemovedFromStage);
         this.numVerifyMc.visible = false;
         this.pieceVerifyMc.visible = false;
         this.readInputVerifyMc.visible = false;
         this.verifyData = a_2439.getInstance().GetVerifyInGame();
         if(Boolean(this.verifyData) && this.verifyData.m_iType == 6)
         {
            this.readInputVerifyMc.visible = true;
            this.readInputVerify = new TDReadInputVerify();
            this.readInputVerify.init(this.readInputVerifyMc);
            this.readInputVerify.show();
         }
         else
         {
            type = int(Math.random() * 2);
            if(type == 0)
            {
               this.numVerifyMc.visible = true;
               this.numVerify = new TDRandNumVerify(this.numVerifyMc,this.isDebug);
               this.addChild(this.numVerify);
               minX = -100;
               maxX = 100;
               minY = -100;
               maxY = 100;
               this.numVerifyMc.x = minX + Math.random() * (maxX - minX);
               this.numVerifyMc.y = minY + Math.random() * (maxY - minY);
            }
            else if(type == 1)
            {
               this.pieceVerifyMc.visible = true;
               this.pieceVerify = new TDPieceVerify(this.pieceVerifyMc,this.isDebug);
               this.addChild(this.pieceVerify);
            }
         }
      }
      
      protected function onRemovedFromStage(a_4730:Event) : void
      {
         this.removeEventListener(Event.REMOVED_FROM_STAGE,this.onRemovedFromStage);
         if(this.readInputVerify)
         {
            this.readInputVerify.hide();
            this.readInputVerify = null;
         }
         if(this.numVerify)
         {
            this.removeChild(this.numVerify);
            this.numVerify.destroy();
            this.numVerify = null;
         }
         if(this.pieceVerify)
         {
            this.removeChild(this.pieceVerify);
            this.pieceVerify.destroy();
            this.pieceVerify = null;
         }
      }
   }
}

