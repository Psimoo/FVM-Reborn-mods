package com.aurora.protocol.game.maogoutd
{
   import com.aurora.protocol.a_2664;
   import com.aurora.protocol.common.CMessageBody;
   import flash.utils.ByteArray;
   
   public class CNotifyEntityStateChange implements CMessageBody
   {
      
      public var m_bySeatID:int;
      
      public var m_uiTickCount:uint;
      
      public var m_byTeamNo:int;
      
      public var m_byDefenderCount:int;
      
      public var m_arrChange:Array;
      
      public function CNotifyEntityStateChange()
      {
         super();
      }
      
      public function encode(byte_array:ByteArray, encode_length:int) : Boolean
      {
         var iEncodeLen:int = 0;
         var stEntityChanger:CEntityStateChange = null;
         a_2664.encode_int8(byte_array,this.m_bySeatID);
         a_2664.encode_int32(byte_array,this.m_uiTickCount);
         a_2664.encode_int8(byte_array,this.m_byTeamNo);
         a_2664.encode_int8(byte_array,this.m_byDefenderCount);
         for(var i:uint = 0; i < this.m_byDefenderCount; i++)
         {
            stEntityChanger = this.m_arrChange[i];
            stEntityChanger.encode(byte_array,iEncodeLen);
         }
         return true;
      }
      
      public function decode(byte_array:ByteArray, decode_length:int) : Boolean
      {
         var iDecodeLen:int = 0;
         var stVanishDefender:CEntityStateChange = null;
         this.m_bySeatID = a_2664.decode_int8(byte_array);
         this.m_uiTickCount = a_2664.decode_uint32(byte_array);
         this.m_byTeamNo = a_2664.decode_int8(byte_array);
         this.m_byDefenderCount = a_2664.decode_int8(byte_array);
         this.m_arrChange = [];
         for(var i:uint = 0; i < this.m_byDefenderCount; i++)
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

