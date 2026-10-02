package com.aurora.ui.maogoutd.crossshop
{
   import a_4754.a_1825;
   import com.aurora.ui.maogoutd.component.a_3228;
   import com.aurora.ui.maogoutd.crossshop.xml.ExchangeItemInfo;
   import flash.display.Bitmap;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import flash.text.TextField;
   import flash.utils.Dictionary;
   
   public class ExchangeCardImage extends Sprite
   {
      
      public var m_bmpImage:Bitmap;
      
      public var m_textEnergy:TextField;
      
      public var a_862:ExchangeItemInfo;
      
      public function ExchangeCardImage()
      {
         super();
         this.m_bmpImage = new Bitmap();
         this.m_bmpImage.x = 10;
         this.m_bmpImage.y = 10;
         addChild(this.m_bmpImage);
         this.m_textEnergy = new TextField();
         this.m_textEnergy.x = 35;
         this.m_textEnergy.y = 62;
         this.m_textEnergy.width = 50;
         this.m_textEnergy.height = 30;
         this.m_textEnergy.mouseEnabled = false;
         addChild(this.m_textEnergy);
         addEventListener(MouseEvent.ROLL_OVER,this.onMouseRollOverEvent);
         addEventListener(MouseEvent.ROLL_OUT,this.onMouseRollOutEvent);
      }
      
      public function setImage(info:ExchangeItemInfo, iUse:String) : void
      {
         this.a_862 = info;
         var dictImage:Dictionary = ExchangeDataModel.getinstance().dictImage;
         if(dictImage[info.m_iItemID] != null)
         {
            visible = true;
            this.m_bmpImage.bitmapData = (dictImage[info.m_iItemID].data as Bitmap).bitmapData;
            if(info.m_iType == 1)
            {
               this.m_textEnergy.text = iUse;
               this.m_bmpImage.x = 18;
            }
            else
            {
               this.m_textEnergy.text = "";
               this.m_bmpImage.x = 10;
            }
         }
         else
         {
            visible = false;
         }
      }
      
      private function onMouseRollOverEvent(e:MouseEvent) : void
      {
         var point:Point = this.localToGlobal(new Point(width,height));
         var attr:a_3228 = null;
         if(this.a_862 != null)
         {
            attr = new a_3228();
            attr.CardID = this.a_862.m_iItemID;
            attr.IsBind = this.a_862.m_iBind;
            attr.ExpiredTime = -1;
            if(this.a_862.m_iTime != -1)
            {
               attr.ExpiredTime = -2;
               attr.DeltaTime = this.a_862.m_iTime;
            }
            a_1825.e.onShowCardTip(this.a_862.m_iItemID,point,width,height,attr);
         }
      }
      
      private function onMouseRollOutEvent(e:MouseEvent) : void
      {
         if(this.a_862 != null)
         {
            a_1825.e.onHideCardTip(this.a_862.m_iItemID);
         }
      }
   }
}

