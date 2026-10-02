package com.aurora.protocol.hallserver.home
{
   import com.aurora.protocol.a_2664;
   import com.aurora.protocol.common.CMessageBody;
   import flash.utils.ByteArray;
   
   public class SCNotifyHomeEvent implements CMessageBody
   {
      
      public var m_iUin:int;
      
      public var m_iHappyValue:int;
      
      public var m_nOvenCount:int;
      
      public var m_astOvenInfo:Array;
      
      public var m_isAble:int;
      
      public var m_astRecord:Object;
      
      public function SCNotifyHomeEvent()
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
         var length:int = 0;
         var obj:Object = null;
         this.m_iUin = a_2664.decode_int32(byte_array);
         this.m_iHappyValue = a_2664.decode_int32(byte_array);
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
         this.m_isAble = a_2664.decode_int8(byte_array);
         if(1 == this.m_isAble)
         {
            this.m_astRecord = {};
            length = a_2664.decode_int16(byte_array);
            this.m_astRecord.m_iOppositeUin = a_2664.decode_int32(byte_array);
            this.m_astRecord.m_szOppositeName = a_2664.decode_string(byte_array,32);
            this.m_astRecord.m_cRecordType = a_2664.decode_int8(byte_array);
            this.m_astRecord.m_cRecordStatus = a_2664.decode_int8(byte_array);
            this.m_astRecord.m_iRecordTime = a_2664.decode_int32(byte_array);
            this.m_astRecord.m_iStealItemID = a_2664.decode_int32(byte_array);
            this.m_astRecord.m_iCount = a_2664.decode_int32(byte_array);
            this.m_astRecord.m_iItemAttrValue = a_2664.decode_int32(byte_array);
         }
         return true;
      }
      
      public function dump() : Boolean
      {
         return false;
      }
   }
}

