package com.aurora.ui.maogoutd.game
{
   import flash.utils.Dictionary;
   
   public class CardUpgradeXML
   {
      
      private static var m_pInstance:CardUpgradeXML;
      
      public var m_UpGradeDict:Dictionary = new Dictionary();
      
      public var m_MaxDefenseDict:Dictionary = new Dictionary();
      
      public var m_DefenseColorTypeDict:Dictionary = new Dictionary();
      
      public function CardUpgradeXML()
      {
         super();
      }
      
      public static function Get() : CardUpgradeXML
      {
         if(!m_pInstance)
         {
            m_pInstance = new CardUpgradeXML();
         }
         return m_pInstance;
      }
      
      public function a_2040(xml:XML) : void
      {
         var item:XML = null;
         var addList:Array = null;
         var i:int = 0;
         var desc:String = null;
         var upgradeList:Array = null;
         this.m_UpGradeDict = new Dictionary();
         this.m_DefenseColorTypeDict = new Dictionary();
         for each(item in xml.CardUpgrade.item)
         {
            desc = item.@desc.toString();
            upgradeList = item.@Upgrade.toString().split(",").map(function(str:String, ... rest):int
            {
               return int(str);
            });
            for(i = 0; i < upgradeList.length; i++)
            {
               this.m_DefenseColorTypeDict[int(upgradeList[i])] = int(item.@cardtype);
            }
            if(upgradeList.length > 0)
            {
               this.m_UpGradeDict[desc] = upgradeList;
            }
         }
         this.m_MaxDefenseDict = new Dictionary();
         for each(item in xml.MaxDefense.item)
         {
            addList = item.@ids.toString().split(",").map(function(str:String, ... rest):int
            {
               return int(str);
            });
            for(i = 0; i < addList.length; i++)
            {
               this.m_MaxDefenseDict[addList[i]] = item.@desc.toString();
            }
         }
      }
   }
}

