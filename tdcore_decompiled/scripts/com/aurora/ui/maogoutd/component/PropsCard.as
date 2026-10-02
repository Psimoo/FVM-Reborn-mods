package com.aurora.ui.maogoutd.component
{
   import a_4754.a_1825;
   import a_4781.HtmlUtils;
   import com.aurora.ui.maogoutd.compose.ComposeConfig;
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
   
   public class PropsCard extends Sprite
   {
      
      public var cardAttr:a_3228;
      
      public var openCardBG:MovieClip;
      
      public var loading:MovieClip;
      
      public var useText:TextField;
      
      public var expiredmc:MovieClip;
      
      public var countText:TextField;
      
      public var countTextExp:TextField;
      
      public var PackageCountText:TextField;
      
      public var bingmc:MovieClip;
      
      public var defStar:MovieClip;
      
      public var armyGemBg:ArmyGemBg;
      
      private var isClick:Boolean;
      
      private var image:Bitmap;
      
      private var a_939:int;
      
      public function PropsCard(attr:a_3228)
      {
         var id:int = 0;
         var iCardType:int = 0;
         var aryCanSlotType:Array = null;
         var type:String = null;
         super();
         this.name = "CARD";
         this.cardAttr = attr;
         this.mouseChildren = false;
         this.loading.visible = true;
         this.loading.gotoAndPlay(1);
         this.buttonMode = true;
         this.countText.visible = false;
         this.countTextExp.visible = false;
         this.PackageCountText.visible = false;
         this.bingmc.visible = false;
         this.image = new Bitmap();
         this.addChild(this.image);
         this.addChild(this.expiredmc);
         this.addChild(this.bingmc);
         this.addChild(this.defStar);
         this.Expired = this.cardAttr.IsExpiredTime;
         this.isClick = true;
         this.doubleClickEnabled = true;
         this.addEvent();
         this.showCardCount();
         id = this.cardAttr.CardID;
         this.defStar.visible = false;
         this.armyGemBg.visible = false;
         if(343932928 == (id & 0xFFF00000) || 344981504 == (id & 0xFFF00000))
         {
            this.showStarLevel(this.cardAttr.m_arrExtraAttr);
         }
         else
         {
            iCardType = id & 0xFFF00000;
            aryCanSlotType = ComposeConfig.getInstance().GetCanSlotItem();
            for each(type in aryCanSlotType)
            {
               if(parseInt(type) == iCardType)
               {
                  this.showCardBg(this.cardAttr.m_arrExtraAttr);
                  break;
               }
            }
         }
         this.Bind = attr.IsBind;
         this.openCardBG.visible = !this.cardAttr.IsAwards;
      }
      
      private function showStarLevel(arrExtraAttr:Array) : void
      {
         var iStar:int = 0;
         if(null != arrExtraAttr && arrExtraAttr.length > 0)
         {
            iStar = int(arrExtraAttr[0].m_iItemAdd);
            if(iStar > 0)
            {
               this.defStar.gotoAndStop(iStar);
               this.defStar.visible = true;
            }
            else
            {
               this.defStar.gotoAndStop(1);
               this.defStar.visible = false;
            }
         }
      }
      
      public function showCardBg(arrExtraAttr:Array) : void
      {
         var iMax:int = 0;
         var i:int = 0;
         if(null != arrExtraAttr && arrExtraAttr.length > 0)
         {
            iMax = -1;
            for(i = 0; i < arrExtraAttr.length; i++)
            {
               if(arrExtraAttr[i].m_cItemType == 11)
               {
                  iMax = iMax > arrExtraAttr[i].m_iItemAdd ? iMax : int(arrExtraAttr[i].m_iItemAdd);
               }
            }
            if(iMax > 0)
            {
               this.armyGemBg.setLevel(iMax);
               this.armyGemBg.visible = true;
            }
         }
      }
      
      private function onMouseRollOverEvent(a_4730:MouseEvent) : void
      {
         clearInterval(this.a_939);
         this.a_939 = setTimeout(this.onPropsCardTipTimerComplete,500);
      }
      
      private function onMouseRollOutEvent(a_4730:MouseEvent) : void
      {
         clearInterval(this.a_939);
         a_1825.e.onHideCardTip(this.cardAttr.CardID);
      }
      
      private function onPropsCardTipTimerComplete() : void
      {
         var point:Point = this.localToGlobal(new Point(this.width,this.height));
         a_1825.e.onShowCardTip(this.cardAttr.CardID,point,this.width,this.height,this.cardAttr);
      }
      
      public function updateView() : void
      {
         if(!this.cardAttr)
         {
            return;
         }
         this.useText.text = this.cardAttr.UseNumber;
         var id:int = this.cardAttr.CardID;
         if(343932928 == (id & 0xFFF00000) || 344981504 == (id & 0xFFF00000))
         {
            this.showStarLevel(this.cardAttr.m_arrExtraAttr);
         }
         else
         {
            this.showCardBg(this.cardAttr.m_arrExtraAttr);
         }
         this.Bind = this.cardAttr.IsBind;
      }
      
      public function set UseNumber(useNumber:String) : void
      {
         this.useText.text = "" + useNumber;
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
      
      private function addMatrixDefCard() : void
      {
         var cm:ColorMatrix = new ColorMatrix();
         cm.adjustColor(0,0,-100,0);
         this.filters = [new ColorMatrixFilter(cm)];
      }
      
      private function removeMatrixDefCard() : void
      {
         var cm:ColorMatrix = new ColorMatrix();
         cm.adjustColor(0,0,0,0);
         this.filters = [new ColorMatrixFilter(cm)];
      }
      
      public function set Image(m_image:Bitmap) : void
      {
         var iCardID:int = 0;
         this.loading.visible = false;
         if(m_image != null && m_image.bitmapData != null)
         {
            if(this.contains(this.loading))
            {
               this.removeChild(this.loading);
            }
            this.image.bitmapData = m_image.bitmapData;
            this.image.smoothing = true;
            this.image.scaleX = 1;
            this.image.scaleY = 1;
            iCardID = this.cardAttr.CardID;
            if((iCardID & 0xFF000000) == 335544320 && (iCardID & 0xFFF00000) != 348127232 && (iCardID & 0xFFF00000) != 343932928 && (iCardID & 0xFFF00000) != 344981504)
            {
               this.image.scaleX = 0.6;
               this.image.scaleY = 0.6;
            }
            this.image.x = 1;
            this.image.y = 2;
            this.countTextExp.y = this.countText.y = this.bingmc.y = this.image.y + this.image.height - this.bingmc.height >= 31 ? this.image.y + this.image.height - this.bingmc.height : 31;
         }
      }
      
      public function get Image() : Bitmap
      {
         return this.image;
      }
      
      public function cloneImage() : Bitmap
      {
         var bitmap:Bitmap = null;
         if(this.image != null && this.image.bitmapData != null)
         {
            bitmap = new Bitmap();
            bitmap.bitmapData = this.image.bitmapData.clone();
         }
         return bitmap;
      }
      
      public function set Expired(isExpired:Boolean) : void
      {
         this.expiredmc.visible = isExpired;
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
      
      public function showCardCount() : void
      {
         var firstStr:String = null;
         var secondStr:String = null;
         var plainText:String = null;
         var html:String = null;
         var line1:String = null;
         var line2:String = null;
         var count:int = 0;
         if(int(this.cardAttr.UseNumber) > 0)
         {
            this.useText.visible = true;
         }
         else
         {
            this.useText.visible = false;
         }
         if(this.cardAttr.IsHoliday)
         {
            this.countText.visible = true;
            this.countTextExp.visible = false;
            this.PackageCountText.visible = false;
            firstStr = this.cardAttr.PackageCount.toString();
            secondStr = "/" + this.cardAttr.CardCount.toString();
            plainText = firstStr + secondStr;
            if(this.cardAttr.PackageCount < this.cardAttr.CardCount)
            {
               if(plainText.length <= 6)
               {
                  html = "<b>" + HtmlUtils.GetHtmlText(firstStr,"#ff5151",11,false) + HtmlUtils.GetHtmlText(secondStr,"#FFFFFF",11,false) + "</b>";
                  this.countText.htmlText = html;
               }
               else
               {
                  line1 = HtmlUtils.GetHtmlText(firstStr,"#ff5151",10,false);
                  line2 = HtmlUtils.GetHtmlText(secondStr,"#FFFFFF",10,false);
                  this.PackageCountText.htmlText = "<b>" + line1 + "</b>";
                  this.countText.htmlText = "<b>" + line2 + "</b>";
                  this.PackageCountText.visible = true;
                  this.addChild(this.PackageCountText);
               }
            }
            else
            {
               this.countText.htmlText = "<b>" + this.cardAttr.CardCount + "</b>";
            }
            this.addChild(this.countText);
         }
         else if(this.cardAttr.CardCount > 1)
         {
            count = this.cardAttr.CardCount > 32767 ? 32767 : this.cardAttr.CardCount;
            if(count == 32767)
            {
               this.countTextExp.htmlText = "<b>" + count + "</b>";
               this.countTextExp.visible = true;
               this.countText.visible = false;
               this.addChild(this.countTextExp);
            }
            else
            {
               this.countText.htmlText = "<b>" + count + "</b>";
               this.countText.visible = true;
               this.countTextExp.visible = false;
               this.addChild(this.countText);
            }
         }
         else
         {
            this.countText.visible = false;
            this.countTextExp.visible = false;
         }
      }
      
      public function cloneCard() : PropsCard
      {
         var clonedCard:PropsCard = new PropsCard(this.cardAttr.clone());
         clonedCard.cardAttr.CardPositionID = this.cardAttr.CardPositionID;
         if(this.image != null && this.image.bitmapData != null)
         {
            clonedCard.Image = this.cloneImage();
         }
         return clonedCard;
      }
      
      public function addEvent() : void
      {
         this.addEventListener(MouseEvent.ROLL_OVER,this.onMouseRollOverEvent);
         this.addEventListener(MouseEvent.ROLL_OUT,this.onMouseRollOutEvent);
      }
      
      public function removeEvent() : void
      {
         this.removeEventListener(MouseEvent.ROLL_OVER,this.onMouseRollOverEvent);
         this.removeEventListener(MouseEvent.ROLL_OUT,this.onMouseRollOutEvent);
      }
      
      public function resetWithAttr(attr:a_3228) : void
      {
         var iCardType:int = 0;
         var aryCanSlotType:Array = null;
         var type:String = null;
         this.name = "CARD";
         this.cardAttr = attr;
         this.mouseChildren = false;
         this.loading.visible = true;
         this.loading.gotoAndPlay(1);
         this.buttonMode = true;
         this.countText.visible = false;
         this.countTextExp.visible = false;
         this.bingmc.visible = false;
         this.image = new Bitmap();
         this.addChild(this.image);
         this.addChild(this.expiredmc);
         this.addChild(this.bingmc);
         this.addChild(this.defStar);
         this.Expired = this.cardAttr.IsExpiredTime;
         this.isClick = true;
         this.doubleClickEnabled = true;
         this.addEvent();
         this.showCardCount();
         var id:int = this.cardAttr.CardID;
         this.defStar.visible = false;
         this.armyGemBg.visible = false;
         if(343932928 == (id & 0xFFF00000) || 344981504 == (id & 0xFFF00000))
         {
            this.showStarLevel(this.cardAttr.m_arrExtraAttr);
         }
         else
         {
            iCardType = id & 0xFFF00000;
            aryCanSlotType = ComposeConfig.getInstance().GetCanSlotItem();
            for each(type in aryCanSlotType)
            {
               if(parseInt(type) == iCardType)
               {
                  this.showCardBg(this.cardAttr.m_arrExtraAttr);
                  break;
               }
            }
         }
         this.Bind = attr.IsBind;
         this.openCardBG.visible = !this.cardAttr.IsAwards;
      }
      
      public function dispose() : void
      {
         if(Boolean(this.image) && this.contains(this.image))
         {
            this.removeChild(this.image);
            this.image = null;
         }
         this.removeEvent();
         clearInterval(this.a_939);
      }
   }
}

