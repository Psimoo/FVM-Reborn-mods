package com.aurora.protocol.task
{
   import com.aurora.protocol.a_2664;
   import com.aurora.protocol.common.CMessageBody;
   import com.aurora.protocol.hallserver.CUpdateHeroInfo;
   import flash.utils.ByteArray;
   
   public class a_2999 implements CMessageBody
   {
      
      public var m_nResultID:int;
      
      public var m_iUin:int;
      
      public var m_iTaskID:int;
      
      public var m_szReasonMessage:String;
      
      public var m_uiMoney:int;
      
      public var m_uiGold:int;
      
      public var m_uiExp:int;
      
      public var m_uiConistraPoint:int;
      
      public var m_uiConistraScore:int;
      
      public var m_unItemsCount:int;
      
      public var m_szItems:Array;
      
      public var m_nHeroAwardSize:int;
      
      public var m_szHeroAward:Array;
      
      private var stItem:a_2989;
      
      private var stHeroInfo:CUpdateHeroInfo;
      
      public function a_2999()
      {
         super();
      }
      
      public function encode(byte_array:ByteArray, encode_length:int) : Boolean
      {
         return false;
      }
      
      public function decode(byte_array:ByteArray, decode_length:int) : Boolean
      {
         var propertyArray:Array = [];
         this.m_nResultID = a_2664.decode_int16(byte_array);
         this.m_iUin = a_2664.decode_int32(byte_array);
         this.m_iTaskID = a_2664.decode_int32(byte_array);
         if(this.m_nResultID == 0)
         {
            this.m_uiMoney = a_2664.decode_int32(byte_array);
            this.m_uiGold = a_2664.decode_int32(byte_array);
            this.m_uiExp = a_2664.decode_int32(byte_array);
            this.m_uiConistraPoint = a_2664.decode_int32(byte_array);
            this.m_uiConistraScore = a_2664.decode_int32(byte_array);
         }
         else
         {
            this.m_szReasonMessage = a_2664.decode_string(byte_array,4096);
         }
         return a_2664.a_2666(this,propertyArray,byte_array,decode_length);
      }
      
      public function dump() : Boolean
      {
         return false;
      }
   }
}

