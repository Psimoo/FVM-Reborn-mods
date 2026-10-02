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
            if(data.@type >= 1 && data.@type <= 3 || data.@type == 19 || data.@type == 42 || data.@type == 35 || data.@type == 32)
            {
               for each(addConfig in data.levels.level)
               {
                  temp.m_iAddition.push(addConfig.@add);
                  temp.m_iShowAdd.push(addConfig.@showadd);
               }
            }
            else
            {
               for each(addConfig in data.levels.level)
               {
                  temp.m_iAddition.push(addConfig.@add);
               }
            }
            this.m_vLevelConfigs.push(temp);
         }
      }
   }
}

