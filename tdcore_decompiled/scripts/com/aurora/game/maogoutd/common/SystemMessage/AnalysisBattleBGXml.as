package com.aurora.game.maogoutd.common.SystemMessage
{
   import flash.utils.Dictionary;
   
   public class AnalysisBattleBGXml
   {
      
      private static var m_pInstance:AnalysisBattleBGXml;
      
      private var m_dictMusic:Dictionary;
      
      public function AnalysisBattleBGXml()
      {
         super();
      }
      
      public static function Get() : AnalysisBattleBGXml
      {
         if(!m_pInstance)
         {
            m_pInstance = new AnalysisBattleBGXml();
         }
         return m_pInstance;
      }
      
      public function get dictMusic() : Dictionary
      {
         if(this.m_dictMusic == null)
         {
            this.m_dictMusic = new Dictionary();
         }
         return this.m_dictMusic;
      }
      
      public function a_2040(xml:XML) : void
      {
         var item:XML = null;
         var map:Object = null;
         var szMapID:int = 0;
         var bossBg:String = null;
         for each(item in xml.map)
         {
            map = new Object();
            szMapID = int(item.@id);
            map.szMapID = szMapID;
            map.CommBG = item.@CommBG.toString();
            map.CommQuickBG = item.@CommQuickBG.toString();
            bossBg = item.@BossBG.toString();
            if(bossBg.indexOf("|") == -1)
            {
               map.BossBG = bossBg;
            }
            else
            {
               map.BossBGArray = bossBg.split("|");
            }
            this.dictMusic[szMapID] = map;
         }
      }
   }
}

