package com.aurora.protocol.hallserver.marriage
{
   import com.aurora.protocol.a_2664;
   import com.aurora.protocol.hallserver.CRequestBase;
   import flash.utils.ByteArray;
   
   public class CRequestReserveWedding extends CRequestBase
   {
      
      public var m_iStartTimeStamp:int;
      
      public var m_iWeddingLevel:int;
      
      public var m_iDressType:int;
      
      public var m_iIsHasPassword:int;
      
      public var m_strPassword:String;
      
      public var m_strDeclaration:String;
      
      public function CRequestReserveWedding()
      {
         super();
      }
      
      override public function encode(byte_array:ByteArray, encode_length:int) : Boolean
      {
         var propertyArray:Array = [["m_iUin","int32"],["m_iStartTimeStamp","int32"],["m_iWeddingLevel","int8"],["m_iDressType","int8"],["m_iIsHasPassword","int8"],["m_strPassword","string",2048],["m_strDeclaration","string",2048]];
         return a_2664.a_2665(this,propertyArray,byte_array,encode_length);
      }
   }
}

