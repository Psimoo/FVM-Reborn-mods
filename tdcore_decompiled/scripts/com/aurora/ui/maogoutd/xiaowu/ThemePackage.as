package com.aurora.ui.maogoutd.xiaowu
{
   import a_4714.AssetsLoader;
   import com.aurora.ui.maogoutd.starpieceshop.StarShopPager;
   import flash.display.DisplayObjectContainer;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.utils.Dictionary;
   
   public class ThemePackage extends Sprite
   {
      
      private var m_width:Number;
      
      private var m_height:Number;
      
      private var m_dataProvice:Vector.<ItemConfigVO>;
      
      public var m_vStarCard:Vector.<ThemeItem>;
      
      public var m_iPage:int;
      
      public var m_iAllPage:int;
      
      public var m_stLoader:AssetsLoader;
      
      public var m_spPager:StarShopPager;
      
      private var m_allItem:int = 12;
      
      private var m_rowItem:int = 6;
      
      public var m_PackageType:int = 0;
      
      public function ThemePackage()
      {
         var i:int = 0;
         super();
         this.m_stLoader = new AssetsLoader();
         this.m_spPager = new StarShopPager();
         this.m_spPager.x = 225;
         this.m_spPager.y = 324;
         addChild(this.m_spPager);
         this.m_vStarCard = new Vector.<ThemeItem>();
         for(i = 0; i < this.m_allItem; i++)
         {
            this.m_vStarCard.push(new ThemeItem());
            this.m_vStarCard[i].x = 8 + 96 * int(i % this.m_rowItem);
            this.m_vStarCard[i].y = 8 + 152 * int(i / this.m_rowItem);
            addChild(this.m_vStarCard[i]);
         }
         this.m_spPager.nextbtn.addEventListener(MouseEvent.CLICK,this.onNextPage);
         this.m_spPager.prebtn.addEventListener(MouseEvent.CLICK,this.onPrePage);
      }
      
      public function showCardPackage(display:DisplayObjectContainer) : void
      {
         this.x = display.x;
         this.y = display.y;
         this.m_height = display.height;
         this.m_width = display.width;
      }
      
      private function onPrePage(e:MouseEvent) : void
      {
         if(this.m_iPage > 1)
         {
            --this.m_iPage;
            this.showCurrentPage();
         }
      }
      
      private function onNextPage(e:MouseEvent) : void
      {
         if(this.m_iPage < this.m_iAllPage)
         {
            ++this.m_iPage;
            this.showCurrentPage();
         }
      }
      
      public function resetPage() : void
      {
         this.m_iPage = 1;
         if(this.m_dataProvice.length % this.m_allItem == 0)
         {
            this.m_iAllPage = this.m_dataProvice.length / this.m_allItem;
         }
         else
         {
            this.m_iAllPage = int(this.m_dataProvice.length / this.m_allItem) + 1;
         }
         this.showCurrentPage();
      }
      
      public function showCurrentPage() : void
      {
         var i:int = 0;
         var index:int = 0;
         var dictImage:Dictionary = LoadImageUtill.getinstance().dictImage;
         this.m_spPager.m_textPage.text = this.m_iPage.toString() + "/" + this.m_iAllPage.toString();
         for(i = 0; i < this.m_allItem; i++)
         {
            index = (this.m_iPage - 1) * this.m_allItem + i;
            if(index >= this.m_dataProvice.length)
            {
               this.m_vStarCard[i].visible = false;
            }
            else
            {
               if(dictImage[this.m_dataProvice[index].m_iItemID + 268435456] == null)
               {
                  LoadImageUtill.getinstance().loadIcon(this.m_dataProvice[index].m_iItemID,this.onImageLoadComplete);
               }
               this.m_vStarCard[i].visible = true;
               this.m_vStarCard[i].setCard(this.m_dataProvice[index]);
            }
         }
      }
      
      public function updateCurrentPage() : void
      {
         var i:int = 0;
         var index:int = 0;
         this.m_spPager.m_textPage.text = this.m_iPage.toString() + "/" + this.m_iAllPage.toString();
         for(i = 0; i < this.m_allItem; i++)
         {
            index = (this.m_iPage - 1) * this.m_allItem + i;
            if(index >= this.m_dataProvice.length)
            {
               this.m_vStarCard[i].visible = false;
            }
            else
            {
               this.m_vStarCard[i].visible = true;
               this.m_vStarCard[i].setCard(this.m_dataProvice[index]);
            }
         }
      }
      
      public function onImageLoadComplete(dict:Dictionary) : void
      {
         var key:Object = null;
         var dictImage:Dictionary = LoadImageUtill.getinstance().dictImage;
         for(key in dict)
         {
            dictImage[key] = dict[key];
         }
         this.updateCurrentPage();
      }
      
      public function get dataProvice() : Vector.<ItemConfigVO>
      {
         return this.m_dataProvice;
      }
      
      public function set dataProvice(value:Vector.<ItemConfigVO>) : void
      {
         this.m_dataProvice = value;
         if(this.m_dataProvice == null)
         {
            this.m_dataProvice = new Vector.<ItemConfigVO>();
         }
         this.resetPage();
      }
      
      public function onBuyBack(m_ItemID:int) : void
      {
         var item:ItemConfigVO = null;
         for(var j:int = 0; j < this.m_dataProvice.length; j++)
         {
            item = this.m_dataProvice[j];
            if(item.m_iItemID == m_ItemID)
            {
               item.m_buyState = false;
               break;
            }
         }
         this.updateCurrentPage();
      }
      
      public function onPutDownBack(m_ItemID:int, bool:Boolean) : void
      {
         var item:ItemConfigVO = null;
         for(var j:int = 0; j < this.m_dataProvice.length; j++)
         {
            item = this.m_dataProvice[j];
            if((Number(m_ItemID) & 0xFFF00000) == 364904448)
            {
               item.m_putState = item.m_iItemID == m_ItemID ? true : false;
            }
            else if(item.m_iItemID == m_ItemID)
            {
               item.m_putState = bool;
               break;
            }
         }
         this.updateCurrentPage();
      }
   }
}

