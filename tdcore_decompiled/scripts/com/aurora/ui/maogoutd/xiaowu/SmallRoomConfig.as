package com.aurora.ui.maogoutd.xiaowu
{
   import flash.utils.Dictionary;
   
   public class SmallRoomConfig
   {
      
      private static var m_pInstance:SmallRoomConfig;
      
      public var m_roomVec:Vector.<ItemConfigVO>;
      
      public var m_wallVec:Vector.<ItemConfigVO>;
      
      public var m_themeVec:Vector.<ItemConfigVO>;
      
      public var m_FoodVec:Vector.<ItemConfigVO>;
      
      public var m_dictDesc:Dictionary;
      
      public function SmallRoomConfig()
      {
         super();
      }
      
      public static function Get() : SmallRoomConfig
      {
         if(!m_pInstance)
         {
            m_pInstance = new SmallRoomConfig();
         }
         return m_pInstance;
      }
      
      public function a_2040(xml:XML) : void
      {
         var ele:XML = null;
         var item:XML = null;
         var type:int = 0;
         var good:ItemConfigVO = null;
         if(xml == null)
         {
            return;
         }
         this.m_themeVec = new Vector.<ItemConfigVO>();
         this.m_wallVec = new Vector.<ItemConfigVO>();
         this.m_roomVec = new Vector.<ItemConfigVO>();
         this.m_FoodVec = new Vector.<ItemConfigVO>();
         this.m_dictDesc = new Dictionary();
         for each(ele in xml.element)
         {
            type = int(ele.@type);
            for each(item in ele.item)
            {
               good = new ItemConfigVO();
               good.m_ItemType = type;
               good.m_buyState = true;
               good.m_putState = false;
               good.m_iItemID = item.@id;
               good.m_iItemName = item.@name;
               good.m_iItemDesc = item.@desc;
               good.m_iItemCost = item.@cost;
               good.m_iItemWidth = item.@m_width;
               good.m_iItemHeight = item.@m_height;
               good.m_iItemComfort = item.@comfort;
               good.m_ItemX = item.@m_itemX;
               good.m_ItemY = item.@m_itemY;
               this.m_dictDesc[good.m_iItemID] = good;
               switch(type)
               {
                  case 1:
                     this.m_roomVec.push(good);
                     break;
                  case 2:
                     this.m_wallVec.push(good);
                     break;
                  case 3:
                     this.m_themeVec.push(good);
                     break;
                  case 4:
                     this.m_FoodVec.push(good);
               }
            }
         }
      }
   }
}

