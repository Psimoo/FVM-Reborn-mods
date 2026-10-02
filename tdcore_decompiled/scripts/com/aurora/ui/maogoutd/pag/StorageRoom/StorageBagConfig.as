package com.aurora.ui.maogoutd.pag.StorageRoom
{
   import flash.utils.Dictionary;
   
   public class StorageBagConfig
   {
      
      private static var _instance:StorageBagConfig;
      
      public var storageBagDict:Dictionary;
      
      public var storageBagGoodDict:Dictionary;
      
      public function StorageBagConfig()
      {
         super();
         if(_instance)
         {
            throw new Error("StorageBagConfig 是单例类，不能实例化多次");
         }
      }
      
      public static function GetInstance() : StorageBagConfig
      {
         if(!_instance)
         {
            _instance = new StorageBagConfig();
         }
         return _instance;
      }
      
      public function a_2040(xml:XML) : void
      {
         var items:XML = null;
         var bag:XML = null;
         var vo:StorageBagVO = null;
         var unlockItem:XML = null;
         var expandItem:XML = null;
         var expandItemVO:ExpandItemsVO = null;
         this.storageBagDict = new Dictionary();
         this.storageBagGoodDict = new Dictionary();
         for each(items in xml.items.item)
         {
            this.storageBagGoodDict[int(items.@id)] = String(items.@nameCN);
         }
         for each(bag in xml.storageBag)
         {
            vo = new StorageBagVO();
            vo.id = int(bag.@id);
            vo.iStoreName = bag.@name.toString();
            vo.maxStoreRow = int(bag.@maxStorerowCount);
            if(Boolean(bag.unlock) && bag.unlock.item.length() > 0)
            {
               for each(unlockItem in bag.unlock.item)
               {
                  vo.unlockItems.push({
                     "itemID":int(unlockItem.@itemID),
                     "num":int(unlockItem.@num),
                     "isBind":int(unlockItem.@isBind)
                  });
               }
            }
            else
            {
               vo.isUnlocked = true;
            }
            if(Boolean(bag.expand) && bag.expand.item.length() > 0)
            {
               for each(expandItem in bag.expand.item)
               {
                  expandItemVO = new ExpandItemsVO();
                  expandItemVO.itemID = int(expandItem.@itemID);
                  expandItemVO.perRowCount = Number(expandItem.@rowCount);
                  expandItemVO.itemsPerRow = Math.ceil(1 / expandItemVO.perRowCount);
                  vo.expandItems.push(expandItemVO);
               }
            }
            this.storageBagDict[vo.id] = vo;
         }
      }
      
      public function getStorageBag(id:int) : StorageBagVO
      {
         return this.storageBagDict[id];
      }
      
      public function getStorageGoodsName(id:int) : String
      {
         return this.storageBagGoodDict[id];
      }
      
      public function checkUnlock(id:int, playerItems:Object) : Boolean
      {
         var unlockObj:Object = null;
         var vo:StorageBagVO = this.getStorageBag(id);
         if(!vo)
         {
            return false;
         }
         if(vo.isUnlocked)
         {
            return true;
         }
         for each(unlockObj in vo.unlockItems)
         {
            if(playerItems[unlockObj.itemID] >= unlockObj.num)
            {
               vo.isUnlocked = true;
               return true;
            }
         }
         return false;
      }
      
      public function calculateExpandRows(id:int, playerItems:Object) : Number
      {
         var expandObj:Object = null;
         var vo:StorageBagVO = this.getStorageBag(id);
         if(!vo)
         {
            return 0;
         }
         var rows:Number = 0;
         for each(expandObj in vo.expandItems)
         {
            if(playerItems[expandObj.itemID] > 0)
            {
               rows += expandObj.row;
            }
         }
         return rows;
      }
   }
}

