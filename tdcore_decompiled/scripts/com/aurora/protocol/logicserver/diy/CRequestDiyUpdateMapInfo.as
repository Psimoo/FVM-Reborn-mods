package com.aurora.protocol.logicserver.diy
{
   import com.aurora.protocol.a_2664;
   import com.aurora.protocol.common.CMessageBody;
   import flash.utils.ByteArray;
   
   public class CRequestDiyUpdateMapInfo implements CMessageBody
   {
      
      public var m_iPlatformID:int;
      
      public var m_iGroupID:int;
      
      public var m_iUin:int;
      
      public var m_iMapID:int;
      
      public var m_sName:String;
      
      public var m_sDesc:String;
      
      public var a_1119:int;
      
      public var m_iReadyTime:int;
      
      public var m_iMaxCardStar:int;
      
      public var m_iTimeLimit:int;
      
      public var m_bIsBanPet:int;
      
      public var m_bIsBanEquip:int;
      
      public var m_bPlayerLimit:int;
      
      public var m_iFireNum:int;
      
      public var m_iMouseLevel:int;
      
      public var m_iScenes:int;
      
      public function CRequestDiyUpdateMapInfo()
      {
         super();
      }
      
      public function encode(byte_array:ByteArray, encode_length:int) : Boolean
      {
         a_2664.encode_int32(byte_array,this.m_iPlatformID);
         a_2664.encode_int32(byte_array,this.m_iGroupID);
         a_2664.encode_int32(byte_array,this.m_iUin);
         a_2664.encode_int32(byte_array,this.m_iMapID);
         a_2664.encode_string(byte_array,this.m_sName,32);
         a_2664.encode_string(byte_array,this.m_sDesc,512);
         a_2664.encode_int32(byte_array,this.a_1119);
         a_2664.encode_int32(byte_array,this.m_iReadyTime);
         a_2664.encode_int32(byte_array,this.m_iMaxCardStar);
         a_2664.encode_int32(byte_array,this.m_iTimeLimit);
         a_2664.encode_int8(byte_array,this.m_bIsBanPet);
         a_2664.encode_int8(byte_array,this.m_bIsBanEquip);
         a_2664.encode_int8(byte_array,this.m_bPlayerLimit);
         a_2664.encode_int32(byte_array,this.m_iFireNum);
         a_2664.encode_int32(byte_array,this.m_iMouseLevel);
         a_2664.encode_int32(byte_array,this.m_iScenes);
         return true;
      }
      
      public function decode(byte_array:ByteArray, decode_length:int) : Boolean
      {
         this.m_iPlatformID = a_2664.decode_int32(byte_array);
         this.m_iGroupID = a_2664.decode_int32(byte_array);
         this.m_iUin = a_2664.decode_int32(byte_array);
         this.m_iMapID = a_2664.decode_int32(byte_array);
         this.m_sName = a_2664.decode_string(byte_array,32);
         this.m_sDesc = a_2664.decode_string(byte_array,512);
         this.a_1119 = a_2664.decode_int32(byte_array);
         this.m_iReadyTime = a_2664.decode_int32(byte_array);
         this.m_iMaxCardStar = a_2664.decode_int32(byte_array);
         this.m_iTimeLimit = a_2664.decode_int32(byte_array);
         this.m_bIsBanPet = a_2664.decode_int8(byte_array);
         this.m_bIsBanEquip = a_2664.decode_int8(byte_array);
         this.m_bPlayerLimit = a_2664.decode_int8(byte_array);
         this.m_iFireNum = a_2664.decode_int32(byte_array);
         this.m_iMouseLevel = a_2664.decode_int32(byte_array);
         this.m_iScenes = a_2664.decode_int32(byte_array);
         return true;
      }
      
      public function dump() : Boolean
      {
         return false;
      }
   }
}

