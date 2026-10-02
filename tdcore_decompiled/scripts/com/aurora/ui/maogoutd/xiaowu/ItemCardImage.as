package com.aurora.ui.maogoutd.xiaowu
{
   import a_4754.a_1825;
   import com.aurora.ui.maogoutd.component.a_3228;
   import flash.display.Bitmap;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import flash.utils.Dictionary;
   
   public class ItemCardImage extends Sprite
   {
      
      public var m_bmpImage:Bitmap;
      
      private var m_stData:ItemConfigVO;
      
      public function ItemCardImage()
      {
         super();
         this.m_bmpImage = new Bitmap();
         this.m_bmpImage.x = 10;
         this.m_bmpImage.y = 10;
         addChild(this.m_bmpImage);
         addEventListener(MouseEvent.ROLL_OVER,this.onMouseRollOverEvent);
         addEventListener(MouseEvent.ROLL_OUT,this.onMouseRollOutEvent);
      }
      
      public function setImage(info:ItemConfigVO) : void
      {
         var dictImage:Dictionary = null;
         if(info.m_ItemType == 4)
         {
            this.m_bmpImage.x = 10;
            this.m_bmpImage.y = 10;
         }
         else
         {
            this.m_bmpImage.x = 0;
            this.m_bmpImage.y = 0;
         }
         this.m_stData = info;
         dictImage = LoadImageUtill.getinstance().dictImage;
         if(dictImage[info.m_iItemID + 268435456] != null)
         {
            visible = true;
            this.m_bmpImage.bitmapData = (dictImage[info.m_iItemID + 268435456].data as Bitmap).bitmapData;
         }
         else
         {
            visible = false;
         }
      }
      
      private function onMouseRollOverEvent(e:MouseEvent) : void
      {
         var attr:a_3228 = null;
         var point:Point = this.localToGlobal(new Point(width,height));
         attr = null;
         if(this.m_stData != null)
         {
            if((this.m_stData.m_iItemID & 0xFFFF0000) == 588382208 || (this.m_stData.m_iItemID & 0xFFF00000) == 612368384)
            {
               attr = new a_3228();
               attr.CardID = this.m_stData.m_iItemID;
               attr.ExpiredTime = -2;
            }
            a_1825.e.onShowCardTip(this.m_stData.m_iItemID,point,width,height,attr);
         }
      }
      
      private function onMouseRollOutEvent(e:MouseEvent) : void
      {
         if(this.m_stData != null)
         {
            a_1825.e.onHideCardTip(this.m_stData.m_iItemID);
         }
      }
   }
}

