package com.aurora.ui.maogoutd.weddingRoom.sweetLand
{
   import flash.utils.Dictionary;
   
   public class SweetIslandXml
   {
      
      private static var m_pInstance:SweetIslandXml;
      
      public var m_arrOpenTime:Array;
      
      public var m_dicTjbzOpenTime:Dictionary;
      
      public function SweetIslandXml()
      {
         super();
         this.m_dicTjbzOpenTime = new Dictionary();
      }
      
      public static function Get() : SweetIslandXml
      {
         if(!m_pInstance)
         {
            m_pInstance = new SweetIslandXml();
         }
         return m_pInstance;
      }
      
      public function a_2040(xml:XML) : void
      {
         var item:XML = null;
         var sMapID:String = null;
         var arrOpenTime:Array = null;
         var open:XML = null;
         if(!this.m_arrOpenTime)
         {
            this.m_arrOpenTime = new Array();
         }
         this.m_arrOpenTime.length = 0;
         for each(item in xml.systemOpen.open)
         {
            this.m_arrOpenTime.push([int(item.@startTime),int(item.@endTime)]);
         }
         for each(item in xml.tjbz_Open.map)
         {
            sMapID = String(item.@id);
            arrOpenTime = new Array();
            for each(open in item.open)
            {
               arrOpenTime.push([int(open.@startTime),int(open.@endTime)]);
            }
            this.m_dicTjbzOpenTime[sMapID] = arrOpenTime;
         }
      }
      
      public function CheckTjbzIsOpen(sMapID:String, systemTime:int) : Boolean
      {
         var arrOpenTime:Array = this.m_dicTjbzOpenTime[sMapID];
         if(arrOpenTime == null || arrOpenTime.length == 0)
         {
            return false;
         }
         for(var i:int = 0; i < arrOpenTime.length; i++)
         {
            if(arrOpenTime[i][0] <= systemTime && systemTime < arrOpenTime[i][1])
            {
               return true;
            }
         }
         return false;
      }
   }
}

