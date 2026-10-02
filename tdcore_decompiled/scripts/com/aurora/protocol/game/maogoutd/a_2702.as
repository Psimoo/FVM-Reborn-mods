package com.aurora.protocol.game.maogoutd
{
   import com.aurora.protocol.a_2664;
   import com.aurora.protocol.common.CMessageBody;
   import flash.utils.ByteArray;
   
   public class a_2702 implements CMessageBody
   {
      
      public var m_bySeatID:int;
      
      public var m_uiTickCount:uint;
      
      public var m_byTeamNo:int;
      
      public var m_byDefenderCount:int;
      
      public var m_arrVanishDefender:Array;
      
      private var a_857:CVanishDefender;
      
      public function a_2702()
      {
         super();
      }
      
      public function encode(byte_array:ByteArray, encode_length:int) : Boolean
      {
         var propertyArray:Array = [["m_bySeatID","int8"],["m_uiTickCount","uint32"],["m_byTeamNo","int8"],["m_byDefenderCount","int8"],["m_arrVanishDefender",["object","com.aurora.protocol.game.maogoutd.CVanishDefender","nosize"]]];
         return a_2664.a_2665(this,propertyArray,byte_array,encode_length);
      }
      
      public function decode(byte_array:ByteArray, decode_length:int) : Boolean
      {
         var iDecodeLen:int = 0;
         var stVanishDefender:CVanishDefender = null;
         this.m_bySeatID = a_2664.decode_int8(byte_array);
         this.m_uiTickCount = a_2664.decode_uint32(byte_array);
         this.m_byTeamNo = a_2664.decode_int8(byte_array);
         this.m_byDefenderCount = a_2664.decode_int8(byte_array);
         this.m_arrVanishDefender = [];
         for(var i:uint = 0; i < this.m_byDefenderCount; i++)
         {
            stVanishDefender = new CVanishDefender();
            stVanishDefender.decode(byte_array,iDecodeLen);
            this.m_arrVanishDefender[i] = stVanishDefender;
         }
         return true;
      }
      
      public function dump() : Boolean
      {
         return false;
      }
   }
}

