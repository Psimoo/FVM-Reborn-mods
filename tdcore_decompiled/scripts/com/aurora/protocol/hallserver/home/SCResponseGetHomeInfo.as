package com.aurora.protocol.hallserver.home
{
   import com.aurora.protocol.a_2664;
   import com.aurora.protocol.common.CMessageBody;
   import flash.utils.ByteArray;
   
   public class SCResponseGetHomeInfo implements CMessageBody
   {
      
      public var m_nResultID:int;
      
      public var m_iUin:int;
      
      public var m_iHappyValue:int;
      
      public var m_iActiveFightCount:int;
      
      public var m_iDayActiveFightCount:int;
      
      public var m_nOvenCount:int;
      
      public var m_astOvenInfo:Array;
      
      public var m_iTotalStealCount:int;
      
      public var m_iDayStealCount:int;
      
      public var m_aryFightInfo:Array;
      
      public var m_iDayMaxStealCount:int;
      
      public var m_iDayMaxFightCount:int;
      
      public var m_iFightTime:int;
      
      public var m_szReasonMessage:String;
      
      public function SCResponseGetHomeInfo()
      {
         super();
      }
      
      public function encode(byte_array:ByteArray, encode_length:int) : Boolean
      {
         return false;
      }
      
      public function decode(byte_array:ByteArray, decode_length:int) : Boolean
      {
         var i:int = 0;
         var obj:Object = null;
         var length:int = 0;
         this.m_nResultID = a_2664.decode_int16(byte_array);
         if(0 == this.m_nResultID)
         {
            this.m_iUin = a_2664.decode_int32(byte_array);
            this.m_iHappyValue = a_2664.decode_int32(byte_array);
            this.m_iActiveFightCount = a_2664.decode_int32(byte_array);
            this.m_iDayActiveFightCount = a_2664.decode_int32(byte_array);
            this.m_nOvenCount = a_2664.decode_int16(byte_array);
            this.m_astOvenInfo = [];
            for(i = 0; i < this.m_nOvenCount; i++)
            {
               obj = {};
               length = a_2664.decode_int16(byte_array);
               obj.m_iOvenID = a_2664.decode_int32(byte_array);
               obj.m_iFormulaItemID = a_2664.decode_int32(byte_array);
               obj.m_iProduceItemID = a_2664.decode_int32(byte_array);
               obj.m_iProduceItemCount = a_2664.decode_int32(byte_array);
               obj.m_iTotalProduceItemCount = a_2664.decode_int32(byte_array);
               obj.m_iDemandCookTime = a_2664.decode_int32(byte_array);
               obj.m_iLastCookTime = a_2664.decode_int32(byte_array);
               obj.m_cCookStatus = a_2664.decode_int8(byte_array);
               obj.m_iProduceAttrValue = a_2664.decode_int32(byte_array);
               this.m_astOvenInfo.push(obj);
            }
            this.m_iTotalStealCount = a_2664.decode_int32(byte_array);
            this.m_iDayStealCount = a_2664.decode_int32(byte_array);
            this.m_aryFightInfo = [];
            for(i = 0; i < this.m_iDayActiveFightCount; i++)
            {
               this.m_aryFightInfo[i] = a_2664.decode_int32(byte_array);
            }
            this.m_iDayMaxStealCount = a_2664.decode_int32(byte_array);
            this.m_iDayMaxFightCount = a_2664.decode_int32(byte_array);
            this.m_iFightTime = a_2664.decode_int32(byte_array);
            return true;
         }
         this.m_szReasonMessage = a_2664.decode_string(byte_array,4096);
         return false;
      }
      
      public function dump() : Boolean
      {
         return false;
      }
   }
}

