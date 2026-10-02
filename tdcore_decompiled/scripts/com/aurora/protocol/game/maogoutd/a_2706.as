package com.aurora.protocol.game.maogoutd
{
   import com.aurora.protocol.a_2664;
   import com.aurora.protocol.common.CMessageBody;
   import flash.utils.ByteArray;
   
   public class a_2706 implements CMessageBody
   {
      
      public var m_bySeatID:int;
      
      public var m_bySelectedIndex:int;
      
      public var m_nSize:int;
      
      public var m_arrAwards:Array;
      
      private var stAward:CAward;
      
      public function a_2706()
      {
         super();
      }
      
      public function encode(byte_array:ByteArray, encode_length:int) : Boolean
      {
         var propertyArray:Array = [["m_bySeatID","int8"],["m_bySelectedIndex","int8"],["m_nSize","int16"],["m_arrAwards",["object","com.aurora.protocol.game.maogoutd.CAward"]]];
         return a_2664.a_2665(this,propertyArray,byte_array,encode_length);
      }
      
      public function decode(byte_array:ByteArray, decode_length:int) : Boolean
      {
         var propertyArray:Array = [["m_bySeatID","int8"],["m_bySelectedIndex","int8"],["m_nSize","int16"],["m_arrAwards",["object","com.aurora.protocol.game.maogoutd.CAward"]]];
         return a_2664.a_2666(this,propertyArray,byte_array,decode_length);
      }
      
      public function dump() : Boolean
      {
         return false;
      }
   }
}

