package com.aurora.protocol.hallserver
{
   import com.aurora.protocol.a_2664;
   import com.aurora.protocol.common.CMessageBody;
   import com.aurora.protocol.logicserver.a_2898;
   import flash.utils.ByteArray;
   
   public class a_2836 implements CMessageBody
   {
      
      public var m_nResultID:int;
      
      public var m_iRoleUin:int;
      
      public var m_nCardCount:int;
      
      public var m_arrCardInfos:Array;
      
      public var m_nSkillCount:int;
      
      public var m_arrSkillInfos:Array;
      
      private var a_862:a_2898;
      
      private var a_863:a_2855;
      
      public function a_2836()
      {
         super();
      }
      
      public function encode(byte_array:ByteArray, encode_length:int) : Boolean
      {
         return true;
      }
      
      public function decode(byte_array:ByteArray, decode_length:int) : Boolean
      {
         var index:int = 0;
         var cardInfo:a_2898 = null;
         var skill:a_2855 = null;
         this.m_nResultID = a_2664.decode_int16(byte_array);
         var propertyArray:Array = [];
         if(this.m_nResultID == 0)
         {
            this.m_iRoleUin = a_2664.decode_int32(byte_array);
            this.m_nCardCount = a_2664.decode_int16(byte_array);
            this.m_arrCardInfos = [];
            index = 0;
            for(index = 0; index < this.m_nCardCount; index++)
            {
               cardInfo = new a_2898();
               cardInfo.decode(byte_array,decode_length);
               this.m_arrCardInfos.push(cardInfo);
            }
            this.m_nSkillCount = a_2664.decode_int16(byte_array);
            this.m_arrSkillInfos = [];
            for(index = 0; index < this.m_nSkillCount; index++)
            {
               skill = new a_2855();
               skill.decode(byte_array,decode_length);
               this.m_arrSkillInfos.push(skill);
            }
         }
         return a_2664.a_2666(this,propertyArray,byte_array,decode_length);
      }
      
      public function dump() : Boolean
      {
         return false;
      }
   }
}

