package a_4752
{
   import a_4720.a_1751;
   import flash.utils.Dictionary;
   
   public class a_2033
   {
      
      private static var instance:a_2033;
      
      public var m_arrVcNote:Array;
      
      public var m_arrVsNote:Array;
      
      public var m_arrVsMode:Array;
      
      public var m_dictVsInfo:Dictionary;
      
      public var m_arrVcTongGuang:Array;
      
      public var m_dictLibao:Dictionary;
      
      public function a_2033()
      {
         super();
         this.m_dictVsInfo = new Dictionary(true);
         this.m_dictLibao = new Dictionary(true);
      }
      
      public static function getInstance() : a_2033
      {
         if(instance == null)
         {
            instance = new a_2033();
         }
         return instance;
      }
      
      public function a_2034(gameLevelXML:XML) : Boolean
      {
         var noteXml:XML = null;
         var vsXml:XML = null;
         var modelXml:XML = null;
         var vcXml:XML = null;
         var note:String = null;
         var type:int = 0;
         var vsLevel:Object = null;
         var arrVsItem:Array = null;
         var itemVsXml:XML = null;
         var itemVs:Object = null;
         var model:Object = null;
         var arrItem:Array = null;
         var itemXml:XML = null;
         var item:Object = null;
         var tongGuang:Object = null;
         var arrVcItem:Array = null;
         var itemVcXml:XML = null;
         var szLibaoID:String = null;
         var itemVc:Object = null;
         var attrXml:XML = null;
         var arrLibao:Array = null;
         var str:String = null;
         var arrBao:Array = null;
         if(gameLevelXML != null)
         {
            this.m_arrVcNote = [];
            this.m_arrVsNote = [];
            for each(noteXml in gameLevelXML.GameNote.item)
            {
               note = noteXml.@note;
               type = int(noteXml.@type);
               if(type == 0)
               {
                  this.m_arrVcNote.push(note);
               }
               if(type == 0 || type == 1)
               {
                  this.m_arrVsNote.push(note);
               }
            }
            for each(vsXml in gameLevelXML.vs_info.levels)
            {
               vsLevel = new Object();
               arrVsItem = [];
               for each(itemVsXml in vsXml.item)
               {
                  itemVs = new Object();
                  itemVs.iCount = int(itemVsXml.@i_count);
                  itemVs.szDesc = String(itemVsXml.@i_desc);
                  itemVs.iExpiryDate = itemVsXml.@i_expiry_date;
                  itemVs.iIsBind = itemVsXml.@i_is_bind;
                  itemVs.iCardID = itemVsXml.@id;
                  arrVsItem.push(itemVs);
               }
               vsLevel.iExpEnd = Number(vsXml.@exp_end);
               vsLevel.iExpStart = Number(vsXml.@exp_start);
               vsLevel.iLevel = Number(vsXml.@level);
               vsLevel.szLevelName = String(vsXml.@level_name);
               vsLevel.iGameMapID = Number(vsXml.@map_id);
               vsLevel.iModel = Number(vsXml.@model);
               vsLevel.arrLevelItem = arrVsItem;
               this.m_dictVsInfo[vsLevel.iLevel] = vsLevel;
            }
            this.m_arrVsMode = [];
            for each(modelXml in gameLevelXML.vs_model.model)
            {
               model = new Object();
               arrItem = [];
               for each(itemXml in modelXml.item)
               {
                  item = new Object();
                  item.szLevel = String(itemXml.@level);
                  item.szPoint = String(itemXml.@point);
                  arrItem.push(item);
               }
               model.arrItem = arrItem;
               model.iModelID = int(modelXml.@model_id);
               model.szDesc = String(modelXml.@desc);
               model.szName = String(modelXml.@name);
               this.m_arrVsMode.push(model);
            }
            this.m_arrVcTongGuang = [];
            for each(vcXml in gameLevelXML.tongGuan_award.levels)
            {
               tongGuang = new Object();
               arrVcItem = [];
               tongGuang.iLevel = int(vcXml.@level);
               for each(itemVcXml in vcXml.item)
               {
                  itemVc = new Object();
                  itemVc.iCount = int(itemVcXml.@i_count);
                  itemVc.szDesc = String(itemVcXml.@i_desc);
                  itemVc.iExpiryDate = Number(itemVcXml.@i_expiry_date);
                  itemVc.iIsBind = Number(itemVcXml.@i_is_bind);
                  itemVc.iCardID = Number(itemVcXml.@id);
                  itemVc.iAttrType = 0;
                  itemVc.iAttrValue = 0;
                  for each(attrXml in itemVcXml.attr)
                  {
                     itemVc.iAttrType = Number(attrXml.@i_attr_type);
                     itemVc.iAttrValue = Number(attrXml.@i_attr_value);
                  }
                  arrVcItem.push(itemVc);
               }
               szLibaoID = String(vcXml.@libao_id);
               if(szLibaoID != null && szLibaoID.length > 0)
               {
                  arrLibao = szLibaoID.split("|");
                  for each(str in arrLibao)
                  {
                     arrBao = str.split("_");
                     if(arrBao != null && arrBao.length > 3)
                     {
                        this.m_dictLibao[arrBao[1]] = tongGuang.iLevel;
                     }
                  }
               }
               tongGuang.arrLevelItem = arrVcItem;
               tongGuang.iExpEnd = Number(vcXml.@exp_end);
               tongGuang.iExpStart = Number(vcXml.@exp_start);
               tongGuang.szLevelName = String(vcXml.@level_name);
               tongGuang.iGameMapID = int(vcXml.@map_id);
               tongGuang.szMapName = String(vcXml.@map_name);
               this.m_arrVcTongGuang.push(tongGuang);
            }
         }
         return true;
      }
      
      public function getVsLevel(iVsExp:Number) : Object
      {
         var vsLevel:Object = null;
         var level:Object = this.m_dictVsInfo[1];
         for each(vsLevel in this.m_dictVsInfo)
         {
            if(vsLevel.iExpStart <= iVsExp && vsLevel.iExpEnd > iVsExp)
            {
               level = vsLevel;
               break;
            }
         }
         return level;
      }
      
      public function getGameLevel(iGamePoint:Number) : Object
      {
         var vcLevel:Object = null;
         var level:Object = null;
         if(this.m_arrVcTongGuang != null)
         {
            for each(vcLevel in this.m_arrVcTongGuang)
            {
               if(vcLevel.iExpStart <= iGamePoint && vcLevel.iExpEnd > iGamePoint)
               {
                  level = vcLevel;
                  break;
               }
            }
         }
         if(level == null)
         {
            level = this.m_arrVcTongGuang[this.m_arrVcTongGuang.length - 1];
         }
         return level;
      }
      
      public function getGamePoint(iGameLevel:int) : int
      {
         var level:int = 0;
         if(this.m_arrVcTongGuang != null)
         {
            if(iGameLevel >= 1 && iGameLevel <= 70)
            {
               level = int(this.m_arrVcTongGuang[iGameLevel - 1].iExpStart);
            }
         }
         return level;
      }
      
      public function getPlayVsMode(iVsExp:int) : int
      {
         var nowVsModel:int = a_1751.enmGameMode_ChuJi;
         var vsLevel:Object = this.getVsLevel(iVsExp);
         if(null != vsLevel)
         {
            nowVsModel = int(vsLevel.iModel);
         }
         return nowVsModel;
      }
   }
}

