package com.aurora.protocol.miscserver
{
   import com.aurora.protocol.a_2664;
   import com.aurora.protocol.common.CMessageBody;
   import flash.utils.ByteArray;
   
   public class a_2979 implements CMessageBody
   {
      
      public var m_iSrcUin:int;
      
      public var m_nResultID:int;
      
      public var m_iComposeID:int;
      
      public var m_iCardIDRate:int;
      
      public var m_iCardIDProt:int;
      
      public var m_nExtraCount:int;
      
      public var m_aryExtraCompose:Array;
      
      public var m_nResultCount:int;
      
      public var m_aryResultInfo:Array;
      
      private var stComposeResultInfo:ComposeResultInfo;
      
      public function a_2979()
      {
         super();
      }
      
      public function encode(byte_array:ByteArray, encode_length:int) : Boolean
      {
         var propertyArray:Array = [["m_iSrcUin","int32"],["m_nResultID","int16"],["m_iComposeID","int32"],["m_iCardIDRate","int32"],["m_iCardIDProt","int32"],["m_nExtraCount","int16"],["m_aryExtraCompose",["int32"]],["m_nResultCount","int16"],["m_aryResultInfo",["object","com.aurora.protocol.miscserver.ComposeResultInfo"]]];
         return a_2664.a_2665(this,propertyArray,byte_array,encode_length);
      }
      
      public function decode(byte_array:ByteArray, decode_length:int) : Boolean
      {
         var propertyArray:Array = [];
         this.m_iSrcUin = a_2664.decode_int32(byte_array);
         this.m_nResultID = a_2664.decode_int16(byte_array);
         if(this.m_nResultID == 0)
         {
            propertyArray.push(["m_iComposeID","int32"]);
            propertyArray.push(["m_iCardIDRate","int32"]);
            propertyArray.push(["m_iCardIDProt","int32"]);
            propertyArray.push(["m_nExtraCount","int32"]);
            propertyArray.push(["m_aryExtraCompose",["int32"]]);
            propertyArray.push(["m_nResultCount","int16"]);
            propertyArray.push(["m_aryResultInfo",["object","com.aurora.protocol.miscserver.ComposeResultInfo"]]);
         }
         return a_2664.a_2666(this,propertyArray,byte_array,decode_length);
      }
      
      public function dump() : Boolean
      {
         return false;
      }
   }
}

