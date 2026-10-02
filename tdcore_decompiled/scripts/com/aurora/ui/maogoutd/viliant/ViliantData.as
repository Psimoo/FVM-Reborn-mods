package com.aurora.ui.maogoutd.viliant
{
   public class ViliantData
   {
      
      private static var m_pInstance:ViliantData;
      
      public static var defaultChallengeNumber:int = 2;
      
      public var mapData:XML;
      
      public function ViliantData()
      {
         super();
      }
      
      public static function Get() : ViliantData
      {
         if(!m_pInstance)
         {
            m_pInstance = new ViliantData();
         }
         return m_pInstance;
      }
      
      public function a_2040(xml:XML) : void
      {
         this.mapData = xml;
      }
   }
}

