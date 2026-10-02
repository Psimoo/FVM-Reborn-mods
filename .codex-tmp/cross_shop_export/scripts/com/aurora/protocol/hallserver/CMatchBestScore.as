package com.aurora.protocol.hallserver
{
   import com.aurora.protocol.a_2664;
   import com.aurora.protocol.common.CMessageBody;
   import flash.utils.ByteArray;
   
   public class CMatchBestScore implements CMessageBody
   {
      
      public var m_iMatchID:int;
      
      public var m_szMatchDesc:String;
      
      public var m_nBestRanking:int;
      
      public var m_nBestRankingCount:int;
      
      public function CMatchBestScore()
      {
         super();
      }
      
      public function encode(byte_array:ByteArray, encode_length:int) : Boolean
      {
         var propertyArray:Array = [["m_iMatchID","int32"],["m_szMatchDesc","string",1024],["m_nBestRanking","int16"],["m_nBestRankingCount","int16"]];
         return a_2664.a_2665(this,propertyArray,byte_array,encode_length);
      }
      
      public function decode(byte_array:ByteArray, decode_length:int) : Boolean
      {
         var propertyArray:Array = [["m_iMatchID","int32"],["m_szMatchDesc","string",1024],["m_nBestRanking","int16"],["m_nBestRankingCount","int16"]];
         return a_2664.a_2666(this,propertyArray,byte_array,decode_length);
      }
      
      public function dump() : Boolean
      {
         return false;
      }
   }
}

