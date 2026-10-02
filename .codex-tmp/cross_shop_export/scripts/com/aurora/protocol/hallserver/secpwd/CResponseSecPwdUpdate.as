package com.aurora.protocol.hallserver.secpwd
{
   import com.aurora.protocol.a_2664;
   import flash.utils.ByteArray;
   
   public class CResponseSecPwdUpdate
   {
      
      public var m_nResultID:int;
      
      public var m_iUin:int;
      
      public var m_stSecPwd:String;
      
      public function CResponseSecPwdUpdate()
      {
         super();
      }
      
      public function decode(byteArr:ByteArray) : Boolean
      {
         this.m_nResultID = a_2664.decode_int16(byteArr);
         this.m_iUin = a_2664.decode_int32(byteArr);
         this.m_stSecPwd = a_2664.decode_string(byteArr,32);
         return true;
      }
   }
}

