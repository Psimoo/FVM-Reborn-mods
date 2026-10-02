package com.aurora.protocol.hallserver.marriage
{
   import com.aurora.protocol.a_2664;
   import com.aurora.protocol.common.CMessageBody;
   import flash.utils.ByteArray;
   
   public class WeddingInfoItem implements CMessageBody
   {
      
      public var m_iCreatorUin:int;
      
      public var m_strCreatorName:String;
      
      public var m_iPartnerUin:int;
      
      public var m_strPartnerName:String;
      
      public var m_iStartTimeStamp:int;
      
      public var m_iWeddingLevel:int;
      
      public var m_iDressType:int;
      
      public var m_iIsHasPassword:int;
      
      public var m_strPassword:String;
      
      public var m_strDeclaration:String;
      
      public var m_iCurTimeStamp:int;
      
      public function WeddingInfoItem()
      {
         super();
      }
      
      public function encode(byte_array:ByteArray, encode_length:int) : Boolean
      {
         return false;
      }
      
      public function decode(byte_array:ByteArray, decode_length:int) : Boolean
      {
         var arrPropertyArray:Array = [];
         arrPropertyArray.push(["m_iCreatorUin","int32"]);
         arrPropertyArray.push(["m_strCreatorName","string",2048]);
         arrPropertyArray.push(["m_iPartnerUin","int32"]);
         arrPropertyArray.push(["m_strPartnerName","string",2048]);
         arrPropertyArray.push(["m_iStartTimeStamp","int32"]);
         arrPropertyArray.push(["m_iWeddingLevel","int8"]);
         arrPropertyArray.push(["m_iDressType","int8"]);
         arrPropertyArray.push(["m_iIsHasPassword","int8"]);
         arrPropertyArray.push(["m_strPassword","string",2048]);
         arrPropertyArray.push(["m_strDeclaration","string",2048]);
         return a_2664.a_2666(this,arrPropertyArray,byte_array,decode_length);
      }
      
      public function dump() : Boolean
      {
         return false;
      }
   }
}

