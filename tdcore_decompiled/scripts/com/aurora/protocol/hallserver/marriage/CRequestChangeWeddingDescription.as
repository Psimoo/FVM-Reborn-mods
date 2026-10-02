package com.aurora.protocol.hallserver.marriage
{
   import com.aurora.protocol.a_2664;
   import com.aurora.protocol.hallserver.CRequestBase;
   import flash.utils.ByteArray;
   
   public class CRequestChangeWeddingDescription extends CRequestBase
   {
      
      public var m_strDeclaration:String;
      
      public function CRequestChangeWeddingDescription()
      {
         super();
      }
      
      override public function encode(byte_array:ByteArray, encode_length:int) : Boolean
      {
         var propertyArray:Array = [["m_iUin","int32"],["m_strDeclaration","string",2048]];
         return a_2664.a_2665(this,propertyArray,byte_array,encode_length);
      }
   }
}

