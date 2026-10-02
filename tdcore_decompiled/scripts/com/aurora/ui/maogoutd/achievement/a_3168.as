package com.aurora.ui.maogoutd.achievement
{
   import a_4720.a_1756;
   import a_4723.a_1767;
   import a_4752.GameStringManager;
   import flash.utils.Dictionary;
   
   public class a_3168
   {
      
      private static var instance:a_3168;
      
      public var dictAchieveMenu:Dictionary;
      
      public var arrAchieves:Array;
      
      public var dictAchieves:Dictionary;
      
      public var achiValue:int;
      
      public var isLegal:Boolean;
      
      public function a_3168()
      {
         super();
         this.dictAchieves = new Dictionary();
         this.dictAchieveMenu = new Dictionary();
         this.arrAchieves = [];
         this.achiValue = 0;
      }
      
      public static function getInstance() : a_3168
      {
         if(instance == null)
         {
            instance = new a_3168();
         }
         return instance;
      }
      
      public function a_3169(achieveXML:XML) : Boolean
      {
         var itemXml:XML = null;
         var huodong:String = null;
         var item:Object = null;
         var achiValue:int = 0;
         var award:String = null;
         var catalog:String = null;
         var id:int = 0;
         var luaScript:String = null;
         var subCatalog:String = null;
         var suffix:String = null;
         var target:String = null;
         var title:String = null;
         var index:int = 0;
         var arrDesc:Array = null;
         var temp:Array = null;
         var ih:Object = null;
         this.dictAchieveMenu[GameStringManager.getInstance().getString(132464)] = 0;
         this.dictAchieveMenu[GameStringManager.getInstance().getString(132465)] = 1;
         this.dictAchieveMenu[GameStringManager.getInstance().getString(132466)] = 2;
         this.dictAchieveMenu[GameStringManager.getInstance().getString(132467)] = 3;
         this.dictAchieveMenu[GameStringManager.getInstance().getString(132468)] = 4;
         this.dictAchieveMenu[GameStringManager.getInstance().getString(132469)] = 5;
         this.dictAchieveMenu[GameStringManager.getInstance().getString(132470)] = 6;
         this.dictAchieveMenu[GameStringManager.getInstance().getString(132475)] = 7;
         if(achieveXML != null && this.arrAchieves.length == 0)
         {
            for each(itemXml in achieveXML.item)
            {
               item = new Object();
               achiValue = int(itemXml.@achi_value);
               award = itemXml.@award;
               catalog = itemXml.@catalog;
               id = int(itemXml.@id);
               luaScript = itemXml.@lua_script;
               subCatalog = itemXml.@sub_catalog;
               suffix = itemXml.@suffix;
               target = itemXml.@target;
               title = itemXml.@name;
               item.achiValue = achiValue;
               item.award = award;
               item.catalog = catalog;
               item.id = id;
               item.title = title;
               item.luaScript = luaScript;
               item.subCatalog = subCatalog;
               item.suffix = suffix;
               item.target = target;
               item.arrScript = [];
               item.iAccomplishedDate = 0;
               item.iUserDef1 = 0;
               item.iTaskStatus = 0;
               item.iAcceptDate = 0;
               if(luaScript.length > 0)
               {
                  item.arrScript = this.a_2026(luaScript);
               }
               index = int(this.dictAchieveMenu[catalog]);
               if(index < 8)
               {
                  arrDesc = this.arrAchieves[index];
                  if(arrDesc == null)
                  {
                     arrDesc = [];
                     arrDesc.push(item);
                     this.arrAchieves[index] = arrDesc;
                  }
                  else
                  {
                     arrDesc.push(item);
                  }
                  this.dictAchieves[id] = item;
               }
            }
            huodong = GameStringManager.getInstance().getString(132471);
            for(index = 0; index < 8; index++)
            {
               temp = this.arrAchieves[index];
               if(temp == null)
               {
                  ih = new Object();
                  ih.achiValue = 0;
                  ih.award = 0;
                  ih.catalog = huodong;
                  ih.id = 0;
                  ih.luaScript = "";
                  ih.subCatalog = "";
                  ih.suffix = "";
                  ih.target = "";
                  item.arrScript = [];
                  this.arrAchieves[index] = [ih];
               }
            }
         }
         return true;
      }
      
      public function update(arrCompAchieve:Array) : void
      {
         var dict:Dictionary = null;
         var compItem:Object = null;
         var arrItemData:Array = null;
         var item:Object = null;
         var temp:Object = null;
         if(arrCompAchieve != null && arrCompAchieve.length > 0)
         {
            dict = new Dictionary();
            for each(compItem in arrCompAchieve)
            {
               dict[compItem.m_iTaskID] = compItem;
            }
            for each(arrItemData in this.arrAchieves)
            {
               for each(item in arrItemData)
               {
                  temp = dict[item.id];
                  if(temp != null)
                  {
                     item.iTaskStatus = temp.m_iTaskStatus;
                     item.iAcceptDate = temp.m_iAcceptDate;
                     item.iAccomplishedDate = temp.m_iAccomplishedDate;
                     item.iUserDef1 = temp.m_iUserDef1;
                     if(item.iTaskStatus == 4)
                     {
                        this.achiValue += item.achiValue;
                     }
                  }
               }
            }
         }
      }
      
      public function accomplishItem(iTaskID:int) : void
      {
         var arrItemData:Array = null;
         var item:Object = null;
         for each(arrItemData in this.arrAchieves)
         {
            for each(item in arrItemData)
            {
               if(item.id == iTaskID)
               {
                  item.iTaskStatus = a_1756.enm_TaskOverdateStatus;
                  item.iAcceptDate = a_1767.getInstance().SystemTime;
                  item.iAccomplishedDate = a_1767.getInstance().SystemTime;
                  item.iUserDef1 = item.achiValue;
                  if(item.iTaskStatus == 4)
                  {
                     this.achiValue += item.achiValue;
                  }
               }
            }
         }
      }
      
      private function a_2024(fun:String) : Array
      {
         var para:String = null;
         var i:int = 0;
         while(-1 != fun.search(" "))
         {
            fun = fun.replace(" ","");
         }
         var FUN:Array = new Array();
         var splitArr:Array = fun.split("(");
         FUN[0] = splitArr[0];
         var paras:String = splitArr[1];
         paras = paras.replace(")","");
         var paraArr:Array = paras.split(",");
         if((paraArr[0] as String).length > 0)
         {
            for(i = 0; i < paraArr.length; i++)
            {
               para = paraArr[i];
               if(-1 != para.search("0x"))
               {
                  para = para.replace("0x","");
                  paraArr[i] = parseInt(para,16);
               }
               else
               {
                  paraArr[i] = int(para);
               }
            }
            FUN[1] = paraArr;
         }
         return FUN;
      }
      
      private function a_2026(str:String) : Array
      {
         var taskScript:Array = new Array();
         var arrScript:Array = str.split("|");
         for(var i:uint = 0; i < arrScript.length; i++)
         {
            taskScript.push(this.a_2024(arrScript[i]));
         }
         return taskScript;
      }
   }
}

