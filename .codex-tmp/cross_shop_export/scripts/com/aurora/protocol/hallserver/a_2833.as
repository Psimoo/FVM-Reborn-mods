package com.aurora.protocol.hallserver
{
   import com.aurora.protocol.a_2664;
   import com.aurora.protocol.common.CMessageBody;
   import flash.utils.ByteArray;
   
   public class a_2833 implements CMessageBody
   {
      
      public var m_nResultID:int;
      
      public var m_iUin:int;
      
      public var m_nGameID:int;
      
      public var m_nAchievementsCount:int;
      
      public var m_stAchievements:Array;
      
      private var cAchievements:CAchievements;
      
      public var m_szReasonMessage:String;
      
      public function a_2833()
      {
         super();
      }
      
      public function encode(byte_array:ByteArray, encode_length:int) : Boolean
      {
         return false;
      }
      
      public function decode(byte_array:ByteArray, decode_length:int) : Boolean
      {
         var i:int = 0;
         var stAch:CAchievements = null;
         var len:int = 0;
         this.m_nResultID = a_2664.decode_int16(byte_array);
         this.m_iUin = a_2664.decode_int32(byte_array);
         this.m_nGameID = a_2664.decode_int16(byte_array);
         if(this.m_nResultID == 0)
         {
            this.m_nAchievementsCount = a_2664.decode_int16(byte_array);
            this.m_stAchievements = [];
            for(i = 0; i < this.m_nAchievementsCount; i++)
            {
               stAch = new CAchievements();
               len = a_2664.decode_int16(byte_array);
               stAch.decode(byte_array,decode_length);
               this.m_stAchievements.push(stAch);
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

