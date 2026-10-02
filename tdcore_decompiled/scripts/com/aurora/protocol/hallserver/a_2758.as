package com.aurora.protocol.hallserver
{
   import com.aurora.protocol.a_2664;
   import com.aurora.protocol.common.CMessageBody;
   import com.aurora.protocol.profile.CUserBaseProfile;
   import flash.utils.ByteArray;
   
   public class a_2758 implements CMessageBody
   {
      
      public var m_nResultID:int;
      
      public var m_iUin:int;
      
      public var m_stUserBaseInfo:CUserBaseProfile;
      
      public var m_szReasonMsg:String;
      
      public function a_2758()
      {
         super();
      }
      
      public function encode(byte_array:ByteArray, encode_length:int) : Boolean
      {
         var propertyArray:Array = [["m_nResultID","int16"]];
         if(this.m_nResultID == 0)
         {
            propertyArray.push(["m_iUin","int32"]);
            propertyArray.push(["m_stUserBaseInfo","object","com.aurora.protocol.profile.CUserBaseProfile"]);
         }
         else
         {
            propertyArray.push(["m_szReasonMsg","string",2048]);
         }
         return a_2664.a_2665(this,propertyArray,byte_array,encode_length);
      }
      
      public function decode(byte_array:ByteArray, decode_length:int) : Boolean
      {
         this.m_nResultID = a_2664.decode_int16(byte_array);
         if(this.m_nResultID == 0)
         {
            this.m_iUin = a_2664.decode_int32(byte_array);
            this.m_stUserBaseInfo = new CUserBaseProfile();
            a_2664.decode_int16(byte_array);
            this.m_stUserBaseInfo.decode(byte_array,decode_length);
         }
         else
         {
            this.m_szReasonMsg = a_2664.decode_string(byte_array,2048);
         }
         return true;
      }
      
      public function dump() : Boolean
      {
         return false;
      }
   }
}

