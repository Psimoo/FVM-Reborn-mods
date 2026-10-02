package com.aurora.ui.maogoutd.pag
{
   public class CryAdditionXML
   {
      
      private static var m_pInstance:CryAdditionXML;
      
      public var m_vLevelConfigs:Vector.<CrystalLevelAdditionConfig>;
      
      public function CryAdditionXML()
      {
         super();
      }
      
      public static function Get() : CryAdditionXML
      {
         if(!m_pInstance)
         {
            m_pInstance = new CryAdditionXML();
         }
         return m_pInstance;
      }
      
      public function a_2040(addition:XML) : void
      {
         var data:XML = null;
         var addConfig:XML = null;
         var temp:CrystalLevelAdditionConfig = null;
         this.m_vLevelConfigs = new Vector.<CrystalLevelAdditionConfig>();
         for each(data in addition.addition.crystone)
         {
            temp = new CrystalLevelAdditionConfig();
            temp.m_iCryID = data.@id;
            temp.m_iType = data.@type;
            temp.m_sDec = data.@dec;
            for each(addConfig in data.levels.level)
            {
               temp.m_iAddition.push(Number(addConfig.@add));
               if(addConfig.hasOwnProperty("@showadd"))
               {
                  temp.m_iShowAdd.push(Number(addConfig.@showadd));
               }
            }
            this.m_vLevelConfigs.push(temp);
         }
      }
   }
}

