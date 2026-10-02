package com.aurora.protocol.game.maogoutd
{
   import a_4715.EncrypUintEx;
   import com.aurora.protocol.a_2664;
   import com.aurora.protocol.common.CMessageBody;
   import flash.utils.ByteArray;
   
   public class a_2704 implements CMessageBody
   {
      
      public var m_uiTickCount:uint;
      
      public var m_byPlayerSeatID:uint;
      
      public var m_uiGlobalID:uint;
      
      private var m_uiTypeIDEx:EncrypUintEx = new EncrypUintEx();
      
      public var m_byRow:uint;
      
      public var m_byColumn:uint;
      
      public var m_IsCaclueCoolDown:int;
      
      public var a_1094:int;
      
      public var m_iCost:int;
      
      public var m_iTickTime:int;
      
      public var m_iOrigSeatID:int;
      
      public var m_iProtectBuffTime:int;
      
      public function a_2704()
      {
         super();
      }
      
      public function get m_uiTypeID() : uint
      {
         return this.m_uiTypeIDEx.Value;
      }
      
      public function set m_uiTypeID(iValue:uint) : void
      {
         this.m_uiTypeIDEx.Value = iValue;
      }
      
      public function encode(byte_array:ByteArray, encode_length:int) : Boolean
      {
         var propertyArray:Array = [["m_uiTickCount","uint32"],["m_byPlayerSeatID","uint8"],["m_uiGlobalID","uint32"],["m_uiTypeID","uint32"],["m_byRow","uint8"],["m_byColumn","uint8"],["m_IsCaclueCoolDown","uint8"],["a_1094","uint8"],["m_iCost","uint16"],["m_iTickTime","uint32"],["m_iOrigSeatID","uint32"],["m_iProtectBuffTime","uint32"]];
         return a_2664.a_2665(this,propertyArray,byte_array,encode_length);
      }
      
      public function decode(byte_array:ByteArray, decode_length:int) : Boolean
      {
         var propertyArray:Array = [["m_uiTickCount","uint32"],["m_byPlayerSeatID","uint8"],["m_uiGlobalID","uint32"],["m_uiTypeID","uint32"],["m_byRow","uint8"],["m_byColumn","uint8"],["m_IsCaclueCoolDown","uint8"],["a_1094","uint8"],["m_iCost","uint16"],["m_iTickTime","int32"],["m_iOrigSeatID","int32"],["m_iProtectBuffTime","uint32"]];
         return a_2664.a_2666(this,propertyArray,byte_array,decode_length);
      }
      
      public function dump() : Boolean
      {
         return false;
      }
   }
}

