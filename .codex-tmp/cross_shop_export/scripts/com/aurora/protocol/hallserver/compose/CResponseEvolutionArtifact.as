package com.aurora.protocol.hallserver.compose
{
   import com.aurora.protocol.a_2664;
   import flash.utils.ByteArray;
   
   public class CResponseEvolutionArtifact
   {
      
      public var m_iResultID:int;
      
      public var m_iUin:int;
      
      public var m_iItemID:int;
      
      public var m_iCostGemLv:int;
      
      public var m_nDelCount:int;
      
      public var m_vDelInfo:Vector.<DelItemInfo>;
      
      public var m_nAddCount:int;
      
      public var m_vAddInfo:Vector.<DelItemInfo>;
      
      public var m_szReasonMessage:String;
      
      public function CResponseEvolutionArtifact()
      {
         super();
         this.m_vDelInfo = new Vector.<DelItemInfo>();
         this.m_vAddInfo = new Vector.<DelItemInfo>();
      }
      
      public function decode(byteArr:ByteArray) : Boolean
      {
         var i:int = 0;
         this.m_iResultID = a_2664.decode_int16(byteArr);
         if(this.m_iResultID != 0)
         {
            this.m_szReasonMessage = a_2664.decode_string(byteArr,4096);
         }
         else
         {
            this.m_iUin = a_2664.decode_int32(byteArr);
            this.m_iItemID = a_2664.decode_int32(byteArr);
            this.m_iCostGemLv = a_2664.decode_int32(byteArr);
            this.m_nDelCount = a_2664.decode_int16(byteArr);
            this.m_vDelInfo.length = 0;
            for(i = 0; i < this.m_nDelCount; i++)
            {
               this.m_vDelInfo[i] = new DelItemInfo();
               this.m_vDelInfo[i].decode(byteArr,0);
            }
            this.m_nAddCount = a_2664.decode_int16(byteArr);
            this.m_vAddInfo.length = 0;
            for(i = 0; i < this.m_nAddCount; i++)
            {
               this.m_vAddInfo[i] = new DelItemInfo();
               this.m_vAddInfo[i].decode(byteArr,0);
            }
         }
         return true;
      }
   }
}

