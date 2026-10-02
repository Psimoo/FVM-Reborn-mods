package com.aurora.protocol.hallserver.consortia
{
   import com.aurora.protocol.a_2664;
   import com.aurora.protocol.common.CMessageBody;
   import flash.utils.ByteArray;
   
   public class a_2763 implements CMessageBody
   {
      
      public var m_iUIN:int;
      
      public var m_iContribute:int;
      
      public var m_cTitle:int;
      
      public var m_czName:String;
      
      public var m_iLastActivity:int;
      
      public var m_iScore:int;
      
      public var m_iMonthContribute:int;
      
      public var m_iMonthScore:int;
      
      public var m_iJoinTime:int;
      
      public var m_iCoin:int;
      
      public function a_2763()
      {
         super();
      }
      
      public function encode(byte_array:ByteArray, encode_length:int) : Boolean
      {
         return false;
      }
      
      public function decode(byte_array:ByteArray, decode_length:int) : Boolean
      {
         var body_size:int = a_2664.decode_int16(byte_array);
         this.m_iUIN = a_2664.decode_int32(byte_array);
         this.m_iContribute = a_2664.decode_int32(byte_array);
         this.m_cTitle = a_2664.decode_int8(byte_array);
         this.m_czName = a_2664.decode_string(byte_array,32);
         this.m_iLastActivity = a_2664.decode_int32(byte_array);
         this.m_iScore = a_2664.decode_int32(byte_array);
         this.m_iMonthContribute = a_2664.decode_int32(byte_array);
         this.m_iMonthScore = a_2664.decode_int32(byte_array);
         this.m_iJoinTime = a_2664.decode_int32(byte_array);
         this.m_iCoin = a_2664.decode_int32(byte_array);
         return true;
      }
      
      public function dump() : Boolean
      {
         return false;
      }
   }
}

