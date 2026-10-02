package com.aurora.game.maogoutd.common.marriage
{
   import flash.utils.Dictionary;
   
   public class WeddingSeatXML
   {
      
      private var m_dictSeatNum:Dictionary;
      
      public function WeddingSeatXML()
      {
         super();
      }
      
      public function AnalysisXML(stXML:XML) : void
      {
         var child:XML = null;
         var iLevel:int = 0;
         var iSeatNum:int = 0;
         this.m_dictSeatNum = new Dictionary();
         for each(child in stXML.item)
         {
            iLevel = int(child.@weddinglevel);
            iSeatNum = int(child.@seatNum);
            this.m_dictSeatNum[iLevel] = iSeatNum;
         }
      }
      
      public function GetSeatNumByLevel(iWeddingLevel:int) : int
      {
         return this.m_dictSeatNum[iWeddingLevel];
      }
   }
}

