package com.aurora.protocol.hallserver.tarot
{
   import com.aurora.protocol.a_2664;
   import com.aurora.ui.maogoutd.choujiang.CardInfoStruct;
   import flash.utils.ByteArray;
   
   public class CResponseTarot
   {
      
      public var m_iUin:int;
      
      public var m_nResultID:int;
      
      public var m_iCount:int;
      
      public var m_arrAwards:Array;
      
      public function CResponseTarot()
      {
         super();
      }
      
      public function decode(byteArr:ByteArray) : Boolean
      {
         var i:int = 0;
         var a_862:CardInfoStruct = null;
         this.m_iUin = a_2664.decode_int32(byteArr);
         this.m_nResultID = a_2664.decode_int32(byteArr);
         this.m_iCount = a_2664.decode_int32(byteArr);
         if(this.m_nResultID == 0)
         {
            this.m_arrAwards = new Array();
            for(i = 0; i < this.m_iCount; i++)
            {
               a_862 = new CardInfoStruct();
               a_862.m_iItemID = a_2664.decode_int32(byteArr);
               a_862.m_iAttr = a_2664.decode_int16(byteArr);
               a_862.m_iTime = a_2664.decode_int32(byteArr);
               a_862.m_iNum = a_2664.decode_int16(byteArr);
               a_862.m_iBox = a_2664.decode_int16(byteArr);
               a_862.m_iPool = a_2664.decode_int16(byteArr);
               this.m_arrAwards.push(a_862);
            }
         }
         return true;
      }
   }
}

