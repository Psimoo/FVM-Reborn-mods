package com.aurora.protocol.game.maogoutd
{
   import com.aurora.protocol.a_2664;
   import com.aurora.protocol.common.CMessageBody;
   import flash.utils.ByteArray;
   
   public class CRequestPostEntityStateChange implements CMessageBody
   {
      
      public var m_iTimeNum:int;
      
      public var m_byTeamNo:int;
      
      public var m_byChangeCount:int;
      
      public var m_arrChange:Array;
      
      public function CRequestPostEntityStateChange()
      {
         super();
      }
      
      public function encode(byte_array:ByteArray, encode_length:int) : Boolean
      {
         a_2664.encode_int32(byte_array,this.m_iTimeNum);
         a_2664.encode_int8(byte_array,this.m_byTeamNo);
         a_2664.encode_int8(byte_array,this.m_byChangeCount);
         var iEncodeLen:int = 0;
         for(var i:int = 0; i < this.m_byChangeCount; i++)
         {
            (this.m_arrChange[i] as CEntityStateChange).encode(byte_array,iEncodeLen);
         }
         return true;
      }
      
      public function decode(byte_array:ByteArray, decode_length:int) : Boolean
      {
         var iDecodeLen:int = 0;
         var stVanishDefender:CEntityStateChange = null;
         this.m_iTimeNum = a_2664.decode_uint32(byte_array);
         this.m_byTeamNo = a_2664.decode_int8(byte_array);
         this.m_byChangeCount = a_2664.decode_int8(byte_array);
         this.m_arrChange = [];
         for(var i:uint = 0; i < this.m_byChangeCount; i++)
         {
            stVanishDefender = new CEntityStateChange();
            stVanishDefender.decode(byte_array,iDecodeLen);
            this.m_arrChange[i] = stVanishDefender;
         }
         return true;
      }
      
      public function dump() : Boolean
      {
         return false;
      }
   }
}

