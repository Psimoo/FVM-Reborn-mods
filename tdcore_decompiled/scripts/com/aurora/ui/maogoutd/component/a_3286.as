package com.aurora.ui.maogoutd.component
{
   public class a_3286
   {
      
      public var iBookID:int;
      
      public var iCoin:int;
      
      public var iBookLevel:int;
      
      public var arrItems:Array;
      
      public var iSkillUsed:int;
      
      public var iSkillOpened:int;
      
      public var nSkillLevel:int;
      
      public var iCardID:int;
      
      public var effectDesc:String;
      
      public var bookName:String;
      
      public var iPoint:int;
      
      public var iType:int;
      
      public var iFatherCard:int;
      
      public var iAllCount:int;
      
      public var iMaxLevel:int;
      
      public var iMinLevel:int;
      
      public function a_3286()
      {
         super();
      }
      
      public function getCurrentUpItem(used:int) : Object
      {
         var item:Object = null;
         var upItem:Object = null;
         this.arrItems.sortOn("level");
         var count:int = 0;
         for each(item in this.arrItems)
         {
            count += item.count;
            if(count > used)
            {
               upItem = item;
               break;
            }
         }
         return upItem;
      }
      
      public function getLevelItemSumCount(level:int) : int
      {
         var levelItem:Object = null;
         var sum:int = 0;
         var minItem:Object = this.getMinLevelItem();
         var n:int = level - minItem.level;
         for(var index:int = 0; index < n; index++)
         {
            levelItem = this.arrItems[index];
            sum += levelItem.count;
         }
         return sum;
      }
      
      public function getMaxLevelItem() : Object
      {
         var item:Object = null;
         var maxLevel:int = 0;
         var maxItem:Object = null;
         for each(item in this.arrItems)
         {
            if(item.level > maxLevel)
            {
               maxLevel = int(item.level);
               maxItem = item;
            }
         }
         return maxItem;
      }
      
      public function getMinLevelItem() : Object
      {
         var item:Object = null;
         var minLevel:int = 10;
         var minItem:Object = null;
         for each(item in this.arrItems)
         {
            if(item.level < minLevel)
            {
               minLevel = int(item.level);
               minItem = item;
            }
         }
         return minItem;
      }
      
      public function get CurrentLevel() : int
      {
         var upItem:Object = null;
         var maxItem:Object = null;
         var iLevel:int = 0;
         if(this.iSkillOpened != 0 || this.iSkillUsed != 0)
         {
            if(this.iSkillOpened != this.iSkillUsed)
            {
               upItem = this.getCurrentUpItem(this.iSkillUsed);
               iLevel = upItem.level - 1;
            }
            else
            {
               maxItem = this.getMaxLevelItem();
               iLevel = int(maxItem.level);
            }
         }
         return iLevel;
      }
   }
}

