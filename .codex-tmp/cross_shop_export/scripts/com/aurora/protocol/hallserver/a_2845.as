package com.aurora.protocol.hallserver
{
   import com.aurora.protocol.a_2664;
   import com.aurora.protocol.common.CMessageBody;
   import flash.utils.ByteArray;
   
   public class a_2845 implements CMessageBody
   {
      
      public var m_iSrcUin:int;
      
      public var m_nResultID:int;
      
      public var m_nItemCount:int;
      
      public var m_arrCardUpdatePosition:Array;
      
      public function a_2845()
      {
         super();
      }
      
      public function encode(byte_array:ByteArray, encode_length:int) : Boolean
      {
         var propertyArray:Array = [];
         propertyArray.push(["m_iSrcUin","int32"]);
         propertyArray.push(["m_nResultID","int16"]);
         if(this.m_nResultID == 0)
         {
            propertyArray.push(["m_arrCardUpdatePosition",["object","com.aurora.protocol.logicserver.CCardUpdatePosition"]]);
         }
         return a_2664.a_2665(this,propertyArray,byte_array,encode_length);
      }
      
      public function decode(byte_array:ByteArray, decode_length:int) : Boolean
      {
         var propertyArray:Array = [];
         this.m_iSrcUin = a_2664.decode_int32(byte_array);
         this.m_nResultID = a_2664.decode_int16(byte_array);
         if(this.m_nResultID == 0)
         {
            propertyArray.push(["m_arrCardUpdatePosition",["object","com.aurora.protocol.logicserver.CCardUpdatePosition"]]);
         }
         return a_2664.a_2666(this,propertyArray,byte_array,decode_length);
      }
      
      public function dump() : Boolean
      {
         return false;
      }
   }
}

