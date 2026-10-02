package com.aurora.protocol.logicserver
{
   import com.aurora.protocol.a_2664;
   import com.aurora.protocol.common.CMessageBody;
   import flash.utils.ByteArray;
   
   public class a_2898 implements CMessageBody
   {
      
      public var m_iCardID:int;
      
      public var m_iCardSeq:int;
      
      public var m_nCardCount:int;
      
      public var m_nCardUsedCount:int;
      
      public var m_nCardPosition:int;
      
      public var m_iExpiredTime:int;
      
      public var m_iDeltaTime:int;
      
      public var m_iUsedTime:int;
      
      public var m_cIsBind:int;
      
      public var m_nExtraAttrCount:int;
      
      public var m_arrCardExtraAttr:Array;
      
      private var a_865:CCardExtraAttr;
      
      public function a_2898()
      {
         super();
      }
      
      public function encode(byte_array:ByteArray, encode_length:int) : Boolean
      {
         var propertyArray:Array = [["m_iCardID","int32"],["m_iCardSeq","int32"],["m_nCardCount","int16"],["m_nCardUsedCount","int16"],["m_nCardPosition","int16"],["m_iExpiredTime","int32"],["m_iDeltaTime","int32"],["m_iUsedTime","int32"],["m_cIsBind","int8"],["m_nExtraAttrCount","int16"],["m_arrCardExtraAttr",["object","com.aurora.protocol.logicserver.CCardExtraAttr"]]];
         return a_2664.a_2665(this,propertyArray,byte_array,encode_length);
      }
      
      public function decode(byte_array:ByteArray, decode_length:int) : Boolean
      {
         var attr:CCardExtraAttr = null;
         var body_size:int = a_2664.decode_int16(byte_array);
         this.m_iCardID = a_2664.decode_int32(byte_array);
         this.m_iCardSeq = a_2664.decode_int32(byte_array);
         this.m_nCardCount = a_2664.decode_int16(byte_array);
         this.m_nCardUsedCount = a_2664.decode_int16(byte_array);
         this.m_nCardPosition = a_2664.decode_int16(byte_array);
         this.m_iExpiredTime = a_2664.decode_int32(byte_array);
         this.m_iDeltaTime = a_2664.decode_int32(byte_array);
         this.m_iUsedTime = a_2664.decode_int32(byte_array);
         this.m_cIsBind = a_2664.decode_int8(byte_array);
         this.m_nExtraAttrCount = a_2664.decode_int16(byte_array);
         trace(this.m_iCardID,this.m_iCardSeq,this.m_nCardCount,this.m_nCardUsedCount,this.m_nCardPosition,this.m_iExpiredTime,this.m_iDeltaTime,this.m_iUsedTime,this.m_cIsBind,this.m_cIsBind,this.m_nExtraAttrCount);
         this.m_arrCardExtraAttr = [];
         for(var index:int = 0; index < this.m_nExtraAttrCount; index++)
         {
            attr = new CCardExtraAttr();
            attr.decode(byte_array,decode_length);
            this.m_arrCardExtraAttr.push(attr);
         }
         return true;
      }
      
      public function dump() : Boolean
      {
         return false;
      }
   }
}

