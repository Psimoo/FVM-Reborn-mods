package com.aurora.protocol.game.maogoutd
{
   import com.aurora.protocol.a_2664;
   import com.aurora.protocol.common.CMessageBody;
   import flash.utils.ByteArray;
   
   public class a_2723 implements CMessageBody
   {
      
      public var m_iPlaceTimeNum:int;
      
      public var m_iDefenderID:int;
      
      public var m_iDefenderTypeID:int;
      
      public var m_byYGridNo:int;
      
      public var m_byXGridNo:int;
      
      public var m_byIsTool:int;
      
      public var m_iCurrentMoney:int;
      
      public var m_iDefenseAttackHurt:int;
      
      public var m_IsCaclueCoolDown:int;
      
      public var a_1094:int;
      
      public var m_iCost:int;
      
      public var m_iTickTime:int;
      
      public var m_iOrigSeatID:int;
      
      public var m_iProtectBuffTime:int;
      
      public function a_2723()
      {
         super();
      }
      
      public function encode(byte_array:ByteArray, encode_length:int) : Boolean
      {
         a_2664.encode_int32(byte_array,this.m_iPlaceTimeNum);
         a_2664.encode_int32(byte_array,this.m_iDefenderID);
         a_2664.encode_int32(byte_array,this.m_iDefenderTypeID);
         a_2664.encode_int8(byte_array,this.m_byYGridNo);
         a_2664.encode_int8(byte_array,this.m_byXGridNo);
         a_2664.encode_int8(byte_array,this.m_byIsTool);
         a_2664.encode_int32(byte_array,this.m_iCurrentMoney);
         a_2664.encode_int32(byte_array,this.m_iDefenseAttackHurt);
         a_2664.encode_int8(byte_array,this.m_IsCaclueCoolDown);
         a_2664.encode_int8(byte_array,this.a_1094);
         a_2664.encode_uint16(byte_array,this.m_iCost);
         a_2664.encode_int32(byte_array,this.m_iTickTime);
         a_2664.encode_int32(byte_array,this.m_iOrigSeatID);
         a_2664.encode_int32(byte_array,this.m_iProtectBuffTime);
         return true;
      }
      
      public function decode(byte_array:ByteArray, decode_length:int) : Boolean
      {
         this.m_iPlaceTimeNum = a_2664.decode_int32(byte_array);
         this.m_iDefenderID = a_2664.decode_int32(byte_array);
         this.m_iDefenderTypeID = a_2664.decode_int32(byte_array);
         this.m_byYGridNo = a_2664.decode_int8(byte_array);
         this.m_byXGridNo = a_2664.decode_int8(byte_array);
         this.m_byIsTool = a_2664.decode_int8(byte_array);
         this.m_iCurrentMoney = a_2664.decode_int32(byte_array);
         this.m_iDefenseAttackHurt = a_2664.decode_int32(byte_array);
         this.m_IsCaclueCoolDown = a_2664.decode_int8(byte_array);
         this.a_1094 = a_2664.decode_int8(byte_array);
         this.m_iCost = a_2664.decode_uint16(byte_array);
         this.m_iTickTime = a_2664.decode_int32(byte_array);
         this.m_iOrigSeatID = a_2664.decode_int32(byte_array);
         return true;
      }
      
      public function dump() : Boolean
      {
         return false;
      }
   }
}

