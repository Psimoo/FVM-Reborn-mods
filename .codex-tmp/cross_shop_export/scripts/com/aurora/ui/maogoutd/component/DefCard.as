package com.aurora.ui.maogoutd.component
{
   import a_4754.a_1825;
   import com.aurora.utils.bitmap.ColorMatrix;
   import flash.display.Bitmap;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.filters.ColorMatrixFilter;
   import flash.geom.Point;
   import flash.text.TextField;
   import flash.utils.clearInterval;
   import flash.utils.setTimeout;
   
   public class DefCard extends Sprite
   {
      
      public var cardAttr:a_3228;
      
      public var cardDesc:a_3306;
      
      public var loading:MovieClip;
      
      public var useText:TextField;
      
      public var expiredmc:MovieClip;
      
      public var defStar:MovieClip;
      
      public var bingmc:MovieClip;
      
      public var countText:TextField;
      
      private var isClick:Boolean;
      
      private var image:Bitmap;
      
      private var a_939:int;
      
      public function DefCard(_cardAttr:a_3228)
      {
         super();
         this.isClick = true;
         this.name = "CARD";
         this.cardAttr = _cardAttr;
         this.loading.visible = true;
         this.mouseChildren = false;
         this.image = new Bitmap();
         this.addChildAt(this.image,1);
         this.updateView();
         this.buttonMode = true;
         this.useHandCursor = true;
         this.addEvent();
      }
      
      private function onMouseRollOverEvent(a_4730:MouseEvent) : void
      {
         clearInterval(this.a_939);
         this.a_939 = setTimeout(this.onDefCardTipTimerComplete,500);
      }
      
      private function onMouseRollOutEvent(a_4730:MouseEvent) : void
      {
         clearInterval(this.a_939);
         a_1825.e.onHideCardTip(this.cardAttr.CardID);
      }
      
      private function onDefCardTipTimerComplete() : void
      {
         trace("CardTipTimerComplete");
         var point:Point = this.localToGlobal(new Point(this.width,this.height));
         a_1825.e.onShowCardTip(this.cardAttr.CardID,point,this.width,this.height,this.cardAttr);
      }
      
      public function updateView() : void
      {
         if(!this.cardAttr)
         {
            return;
         }
         this.Expired = this.cardAttr.IsExpiredTime;
         this.useText.text = this.cardAttr.UseNumber;
         this.DefStar = this.cardAttr.TypeValue;
         this.Bind = this.cardAttr.IsBind;
         this.showCardCount();
      }
      
      public function set CardClickStatus(isClick:Boolean) : void
      {
         this.isClick = isClick;
         if(this.isClick)
         {
            this.removeMatrixDefCard();
         }
         else
         {
            this.addMatrixDefCard();
         }
      }
      
      public function get CardClickStatus() : Boolean
      {
         return this.isClick;
      }
      
      private function addMatrixDefCard(saturation:int = -100) : void
      {
         var cm:ColorMatrix = new ColorMatrix();
         cm.adjustColor(0,0,saturation,0);
         this.image.filters = [new ColorMatrixFilter(cm)];
      }
      
      private function removeMatrixDefCard() : void
      {
         var cm:ColorMatrix = new ColorMatrix();
         cm.adjustColor(0,0,0,0);
         this.image.filters = [new ColorMatrixFilter(cm)];
      }
      
      public function set Image(image:Bitmap) : void
      {
         this.loading.visible = false;
         if(image != null && image.bitmapData != null)
         {
            if(this.contains(this.loading))
            {
               this.removeChild(this.loading);
            }
            this.image.bitmapData = image.bitmapData;
            if(this.image.bitmapData.width > 44)
            {
               this.image.scaleX = Number((44 / this.image.bitmapData.width).toFixed(2));
               this.image.scaleY = Number((44 / this.image.bitmapData.height).toFixed(2));
            }
            this.image.smoothing = true;
            this.image.x = int((40 - this.image.width) / 2);
            this.image.y = int((50 - this.image.height) / 2);
         }
      }
      
      public function get Image() : Bitmap
      {
         return this.image;
      }
      
      public function cloneImage() : Bitmap
      {
         var bitmap:Bitmap = new Bitmap();
         if(this.image != null && this.image.bitmapData != null)
         {
            bitmap.bitmapData = this.image.bitmapData.clone();
         }
         return bitmap;
      }
      
      public function set Expired(isExpired:Boolean) : void
      {
         this.expiredmc.visible = isExpired;
      }
      
      public function set UseNumber(useNumber:String) : void
      {
         this.useText.text = "" + useNumber;
      }
      
      public function set DefStar(iStar:int) : void
      {
         if(iStar == 0)
         {
            this.defStar.visible = false;
         }
         else
         {
            this.defStar.gotoAndStop(iStar);
            this.defStar.visible = true;
         }
      }
      
      public function set Bind(isBind:int) : void
      {
         if(isBind == 1)
         {
            this.bingmc.visible = true;
         }
         else
         {
            this.bingmc.visible = false;
         }
      }
      
      public function addEvent() : void
      {
         this.addEventListener(MouseEvent.ROLL_OVER,this.onMouseRollOverEvent);
         this.addEventListener(MouseEvent.ROLL_OUT,this.onMouseRollOutEvent);
      }
      
      public function showCardCount() : void
      {
         var count:int = 0;
         if((this.cardAttr.CardID & 0xFF000000) == 285212672)
         {
            this.useText.visible = true;
         }
         else
         {
            this.useText.visible = false;
         }
         if(this.cardAttr.CardCount > 1)
         {
            count = this.cardAttr.CardCount > 9999 ? 9999 : this.cardAttr.CardCount;
            this.countText.htmlText = "<b>×" + count + "</b>";
            this.countText.visible = true;
            this.addChild(this.countText);
         }
         else
         {
            this.countText.visible = false;
         }
      }
      
      public function removeEvent() : void
      {
         this.removeEventListener(MouseEvent.ROLL_OVER,this.onMouseRollOverEvent);
         this.removeEventListener(MouseEvent.ROLL_OUT,this.onMouseRollOutEvent);
      }
   }
}

