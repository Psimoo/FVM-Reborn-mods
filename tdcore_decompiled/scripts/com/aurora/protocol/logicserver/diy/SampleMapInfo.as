package com.aurora.protocol.logicserver.diy
{
   import com.aurora.protocol.a_2664;
   import com.aurora.protocol.common.CMessageBody;
   import flash.utils.ByteArray;
   
   public class SampleMapInfo implements CMessageBody
   {
      
      public var m_iMapID:int;
      
      public var m_szName:String;
      
      public var a_1119:int;
      
      public var m_iMaxCardStar:int;
      
      public var m_iFireNum:int;
      
      public var m_iMouseLevel:int;
      
      public var m_iTimeLimit:int;
      
      public var m_iScenes:int;
      
      public var m_bIsPassTest:Boolean;
      
      public var m_iDraftDstID:int;
      
      public var m_iPraise:int;
      
      public var m_iTread:int;
      
      public var m_iTotalNum:int;
      
      public var m_iTotalPassNum:int;
      
      public var m_iPlatformID:int;
      
      public var m_iGroupID:int;
      
      public var m_iUin:int;
      
      public var m_szAuthorName:String;
      
      public var m_iVersion:int;
      
      public var m_iDIYB:int;
      
      public var m_iHot:int;
      
      public var m_sDesc:String;
      
      public function SampleMapInfo()
      {
         super();
      }
      
      public function encode(byte_array:ByteArray, encode_length:int) : Boolean
      {
         return false;
      }
      
      public function decode(byte_array:ByteArray, decode_length:int) : Boolean
      {
         this.m_iMapID = a_2664.decode_int32(byte_array);
         this.m_szName = a_2664.decode_string(byte_array,32);
         this.a_1119 = a_2664.decode_int32(byte_array);
         this.m_iMaxCardStar = a_2664.decode_int32(byte_array);
         this.m_iFireNum = a_2664.decode_int32(byte_array);
         this.m_iMouseLevel = a_2664.decode_int32(byte_array);
         this.m_iTimeLimit = a_2664.decode_int32(byte_array);
         this.m_iScenes = a_2664.decode_int32(byte_array);
         this.m_bIsPassTest = Boolean(a_2664.decode_int8(byte_array) == 1);
         this.m_iDraftDstID = a_2664.decode_int32(byte_array);
         this.m_iPraise = a_2664.decode_int32(byte_array);
         this.m_iTread = a_2664.decode_int32(byte_array);
         this.m_iTotalNum = a_2664.decode_int32(byte_array);
         this.m_iTotalPassNum = a_2664.decode_int32(byte_array);
         this.m_iPlatformID = a_2664.decode_int32(byte_array);
         this.m_iGroupID = a_2664.decode_int32(byte_array);
         this.m_iUin = a_2664.decode_int32(byte_array);
         this.m_szAuthorName = a_2664.decode_string(byte_array,32);
         this.m_iVersion = a_2664.decode_int32(byte_array);
         this.m_iDIYB = a_2664.decode_int32(byte_array);
         this.m_iHot = a_2664.decode_int32(byte_array);
         this.m_sDesc = a_2664.decode_string(byte_array,512);
         return true;
      }
      
      public function dump() : Boolean
      {
         return false;
      }
   }
}

