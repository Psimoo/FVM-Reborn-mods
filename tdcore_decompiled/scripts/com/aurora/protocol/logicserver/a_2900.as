package com.aurora.protocol.logicserver
{
   import com.aurora.protocol.a_2664;
   import com.aurora.protocol.common.CMessageBody;
   import flash.utils.ByteArray;
   
   public class a_2900 implements CMessageBody
   {
      
      public var m_byCardStoreType:int;
      
      public var m_nCardStoreNum:int;
      
      public var m_nCardStoreOpenedNum:int;
      
      public var m_nSlotPackCount:int;
      
      public var m_astSlotInfo:Array;
      
      public function a_2900()
      {
         super();
      }
      
      public function encode(byte_array:ByteArray, encode_length:int) : Boolean
      {
         var propertyArray:Array = [["m_byCardStoreType","int8"],["m_nCardStoreNum","int16"],["m_nCardStoreOpenedNum","int16"]];
         return a_2664.a_2665(this,propertyArray,byte_array,encode_length);
      }
      
      public function decode(byte_array:ByteArray, decode_length:int) : Boolean
      {
         var objSlotInfo:Object = null;
         var body_size:int = a_2664.decode_int16(byte_array);
         this.m_byCardStoreType = a_2664.decode_int8(byte_array);
         this.m_nCardStoreNum = a_2664.decode_int16(byte_array);
         this.m_nCardStoreOpenedNum = a_2664.decode_int16(byte_array);
         this.m_nSlotPackCount = a_2664.decode_int16(byte_array);
         this.m_astSlotInfo = new Array();
         for(var i:int = 0; i < this.m_nSlotPackCount; i++)
         {
            a_2664.decode_int16(byte_array);
            objSlotInfo = {};
            objSlotInfo.m_cPackagePosi = a_2664.decode_int8(byte_array);
            objSlotInfo.m_nPackAdd = a_2664.decode_int16(byte_array);
            this.m_nCardStoreOpenedNum += objSlotInfo.m_nPackAdd;
            objSlotInfo.m_iItemID = a_2664.decode_int32(byte_array);
            this.m_astSlotInfo.push(objSlotInfo);
         }
         return true;
      }
      
      public function dump() : Boolean
      {
         return false;
      }
   }
}

