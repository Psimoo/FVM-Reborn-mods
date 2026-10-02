package com.aurora.protocol.hallserver
{
   import com.aurora.protocol.a_2664;
   import com.aurora.protocol.common.CMessageBody;
   import flash.utils.ByteArray;
   
   public class CSystemMessage implements CMessageBody
   {
      
      public var FirLevel:int;
      
      public var SecLevel:int;
      
      public var m_nMessageSize:int;
      
      public var m_szSystemMessage:ByteArray;
      
      public var m_szMessage:String;
      
      public var holder:Array;
      
      public var repString:Array;
      
      public function CSystemMessage()
      {
         super();
      }
      
      public function encode(byte_array:ByteArray, encode_length:int) : Boolean
      {
         return false;
      }
      
      public function decode(byte_array:ByteArray, decode_length:int) : Boolean
      {
         var propertyArray:Array = [["FirLevel","int32"],["SecLevel","int32"],["uin","int32"],["nick","string",64],["partneruin","int32"],["partnernick","string",64],["rivaluin","int32"],["rivalnick","string",64],["firstnick","string",64],["secondnick","string",64],["thirdnick","string",64],["mapname","string",64],["player1","string",64],["player2","string",64],["item","string",32],["welfare","string",32],["cons","string",64],["ben","string",32],["buff","string",32],["box","string",32],["win","int16"]];
         a_2664.a_2666(this,propertyArray,byte_array,decode_length);
         return true;
      }
      
      public function dump() : Boolean
      {
         return false;
      }
   }
}

