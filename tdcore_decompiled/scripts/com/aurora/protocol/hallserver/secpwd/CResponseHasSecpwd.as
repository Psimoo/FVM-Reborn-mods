package com.aurora.protocol.hallserver.secpwd
{
   import com.aurora.protocol.a_2664;
   import flash.utils.ByteArray;
   
   public class CResponseHasSecpwd
   {
      
      public var m_nResultID:int;
      
      public var m_iUin:int;
      
      public var m_iHasSecpwd:int;
      
      public function CResponseHasSecpwd()
      {
         super();
      }
      
      public function decode(byteArr:ByteArray) : Boolean
      {
         this.m_nResultID = a_2664.decode_int16(byteArr);
         this.m_iUin = a_2664.decode_int32(byteArr);
         this.m_iHasSecpwd = a_2664.decode_int32(byteArr);
         return true;
      }
   }
}

