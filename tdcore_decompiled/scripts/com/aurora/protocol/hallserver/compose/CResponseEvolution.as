package com.aurora.protocol.hallserver.compose
{
   import com.aurora.protocol.a_2664;
   import flash.utils.ByteArray;
   
   public class CResponseEvolution
   {
      
      public var m_iResultID:int;
      
      public var m_iUin:int;
      
      public var m_iCardID:int;
      
      public var m_iItemCount:int;
      
      public var m_arrItems:Array;
      
      public function CResponseEvolution()
      {
         super();
      }
      
      public function decode(byteArr:ByteArray) : Boolean
      {
         var i:int = 0;
         var a_862:Object = null;
         this.m_iResultID = a_2664.decode_int16(byteArr);
         this.m_iUin = a_2664.decode_int32(byteArr);
         this.m_iCardID = a_2664.decode_int32(byteArr);
         this.m_iItemCount = a_2664.decode_int32(byteArr);
         if(this.m_iResultID == 0)
         {
            this.m_arrItems = new Array();
            for(i = 0; i < this.m_iItemCount; i++)
            {
               a_862 = {};
               a_862.m_iItemID = a_2664.decode_int32(byteArr);
               a_862.m_iItemSeq = a_2664.decode_int32(byteArr);
               this.m_arrItems.push(a_862);
            }
         }
         return true;
      }
   }
}

