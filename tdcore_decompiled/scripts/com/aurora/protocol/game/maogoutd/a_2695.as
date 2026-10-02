package com.aurora.protocol.game.maogoutd
{
   import com.aurora.protocol.a_2664;
   import com.aurora.protocol.common.CMessageBody;
   import flash.utils.ByteArray;
   
   public class a_2695 implements CMessageBody
   {
      
      public var m_nTotalIntruderWaveNum:int;
      
      public var m_RandomSeed:int;
      
      public var m_iBuffId:int;
      
      public function a_2695()
      {
         super();
      }
      
      public function encode(byte_array:ByteArray, encode_length:int) : Boolean
      {
         var propertyArray:Array = [["m_nTotalIntruderWaveNum","int16"],["m_RandomSeed","int32"],["m_iBuffId","int32"]];
         return a_2664.a_2665(this,propertyArray,byte_array,encode_length);
      }
      
      public function decode(byte_array:ByteArray, decode_length:int) : Boolean
      {
         var propertyArray:Array = [["m_nTotalIntruderWaveNum","int16"],["m_RandomSeed","int32"],["m_iBuffId","int32"]];
         return a_2664.a_2666(this,propertyArray,byte_array,decode_length);
      }
      
      public function dump() : Boolean
      {
         return false;
      }
   }
}

