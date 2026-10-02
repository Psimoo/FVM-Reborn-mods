package com.aurora.protocol.hallserver
{
   import com.aurora.protocol.a_2664;
   import com.aurora.protocol.common.CMessageBody;
   import flash.utils.ByteArray;
   
   public class a_2838 implements CMessageBody
   {
      
      public var m_nResultID:int;
      
      public var m_szReasonMessage:String;
      
      public var m_iMyUIN:int;
      
      public var m_cRoleCount:int;
      
      public var m_arrRoleInfo:Array;
      
      public var m_iGroupID:int;
      
      private var a_864:CRole;
      
      public function a_2838()
      {
         super();
      }
      
      public function encode(byte_array:ByteArray, encode_length:int) : Boolean
      {
         var propertyArray:Array = [["m_nResultID","int16"]];
         if(this.m_nResultID == 0)
         {
            propertyArray.push(["m_iMyUIN","int32"]);
            propertyArray.push(["m_cRoleCount","int8"]);
            propertyArray.push(["m_arrRoleInfo",["object","com.aurora.protocol.hallserver.CRole"]]);
         }
         else
         {
            propertyArray.push(["m_szReasonMessage","string",2048]);
         }
         return a_2664.a_2665(this,propertyArray,byte_array,encode_length);
      }
      
      public function decode(byte_array:ByteArray, decode_length:int) : Boolean
      {
         var stRole:CRole = null;
         var i:int = 0;
         this.m_nResultID = a_2664.decode_int16(byte_array);
         var propertyArray:Array = [];
         if(this.m_nResultID == 0)
         {
            this.m_iMyUIN = a_2664.decode_int32(byte_array);
            this.m_iGroupID = a_2664.decode_int32(byte_array);
            this.m_cRoleCount = a_2664.decode_int8(byte_array);
            this.m_arrRoleInfo = [];
            for(i = 0; i < this.m_cRoleCount; i++)
            {
               stRole = new CRole();
               a_2664.decode_int16(byte_array);
               stRole.decode(byte_array,decode_length);
               this.m_arrRoleInfo.push(stRole);
            }
         }
         else
         {
            this.m_szReasonMessage = a_2664.decode_string(byte_array,2048);
         }
         return true;
      }
      
      public function dump() : Boolean
      {
         return false;
      }
   }
}

