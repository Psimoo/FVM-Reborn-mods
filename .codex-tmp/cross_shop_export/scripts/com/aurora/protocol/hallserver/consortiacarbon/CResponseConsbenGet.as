package com.aurora.protocol.hallserver.consortiacarbon
{
   import com.aurora.protocol.a_2664;
   import com.aurora.protocol.common.CMessageBody;
   import flash.utils.ByteArray;
   
   public class CResponseConsbenGet implements CMessageBody
   {
      
      public var m_nResultID:int;
      
      public var m_iUin:int;
      
      public var m_iConsID:int;
      
      public var m_iProgress:Array;
      
      public function CResponseConsbenGet()
      {
         super();
      }
      
      public function encode(byte_array:ByteArray, encode_length:int) : Boolean
      {
         return false;
      }
      
      public function decode(byte_array:ByteArray, decode_length:int) : Boolean
      {
         var temp:int = 0;
         this.m_nResultID = a_2664.decode_int16(byte_array);
         this.m_iUin = a_2664.decode_int32(byte_array);
         this.m_iConsID = a_2664.decode_int32(byte_array);
         this.m_iProgress = [];
         for(var i:int = 0; i < 3; i++)
         {
            temp = a_2664.decode_int32(byte_array);
            this.m_iProgress.push(temp);
         }
         return true;
      }
      
      public function dump() : Boolean
      {
         return false;
      }
   }
}

