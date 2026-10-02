package com.aurora.protocol.game.maogoutd
{
   import com.aurora.protocol.a_2664;
   import com.aurora.protocol.common.CMessageBody;
   import flash.utils.ByteArray;
   
   public class a_2709 implements CMessageBody
   {
      
      public var m_byTableMasterSitID:int;
      
      public var m_byIsGameCanStart:int;
      
      public var m_byPlayerCount:int;
      
      public var m_arrPlayerStatusInfo:Array;
      
      private var a_859:CTDPlayerStatusInfo;
      
      public function a_2709()
      {
         super();
      }
      
      public function encode(byte_array:ByteArray, encode_length:int) : Boolean
      {
         var propertyArray:Array = [["m_byTableMasterSitID","int8"],["m_byIsGameCanStart","int8"],["m_byPlayerCount","int8"],["m_arrPlayerStatusInfo",["object","com.aurora.protocol.game.maogoutd.CTDPlayerStatusInfo","nosize"]]];
         return a_2664.a_2665(this,propertyArray,byte_array,encode_length);
      }
      
      public function decode(byte_array:ByteArray, decode_length:int) : Boolean
      {
         var propertyArray:Array = [["m_byTableMasterSitID","int8"],["m_byIsGameCanStart","int8"],["m_byPlayerCount","int8"],["m_arrPlayerStatusInfo",["object","com.aurora.protocol.game.maogoutd.CTDPlayerStatusInfo","nosize"]]];
         return a_2664.a_2666(this,propertyArray,byte_array,decode_length);
      }
      
      public function dump() : Boolean
      {
         return false;
      }
   }
}

