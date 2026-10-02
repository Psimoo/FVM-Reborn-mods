package com.aurora.protocol.hallserver.vow
{
   import a_4723.a_1767;
   import com.aurora.protocol.a_2664;
   import com.aurora.protocol.common.CMessageBody;
   import flash.utils.ByteArray;
   
   public class a_2892 implements CMessageBody
   {
      
      public var m_nResultID:int;
      
      public var m_iUin:int;
      
      public var m_nLevel:int;
      
      public var m_nCount:int;
      
      public var m_iBoxID:int;
      
      public var m_iSymbolValue:int;
      
      public var m_stAttr:Array;
      
      public var m_iTime:int;
      
      public var m_szReasonMessage:String;
      
      public function a_2892()
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
         var size:int = 0;
         var tempObj:Object = null;
         var m_nCardDataCount:int = 0;
         var m_nHeroItemDataCount:int = 0;
         var m_nCardAttrCount:int = 0;
         var nItemExtraAttrCount:int = 0;
         var aryExtraAttr:Array = null;
         var size2:int = 0;
         var tempObj2:Object = null;
         var j:int = 0;
         this.m_nResultID = a_2664.decode_int16(byte_array);
         this.m_iUin = a_2664.decode_int32(byte_array);
         this.m_nLevel = a_2664.decode_int16(byte_array);
         this.m_nCount = a_2664.decode_int16(byte_array);
         this.m_iBoxID = a_2664.decode_int32(byte_array);
         this.m_iSymbolValue = a_2664.decode_int32(byte_array);
         this.m_iTime = a_1767.getInstance().SystemTime;
         if(this.m_nResultID == 0)
         {
            m_nCardDataCount = a_2664.decode_int16(byte_array);
            this.m_stAttr = new Array();
            for(i = 0; i < m_nCardDataCount; i++)
            {
               tempObj = {};
               size = a_2664.decode_int16(byte_array);
               tempObj["m_iCardID"] = a_2664.decode_int32(byte_array);
               tempObj["m_iCardSeq"] = a_2664.decode_int32(byte_array);
               tempObj["m_nCardCount"] = a_2664.decode_int16(byte_array);
               tempObj["m_nCardUsedCount"] = a_2664.decode_int16(byte_array);
               tempObj["m_cTimeFlag"] = a_2664.decode_int8(byte_array);
               tempObj["m_iExpiredTime"] = a_2664.decode_int32(byte_array);
               tempObj["m_cIsBind"] = a_2664.decode_int8(byte_array);
               tempObj["m_cUpdateMode"] = a_2664.decode_int8(byte_array);
               tempObj["m_iUsedTime"] = a_2664.decode_int32(byte_array);
               tempObj["m_iDeltaTime"] = a_2664.decode_int32(byte_array);
               this.m_stAttr.push(tempObj);
            }
            m_nHeroItemDataCount = a_2664.decode_int16(byte_array);
            for(i = 0; i < m_nHeroItemDataCount; i++)
            {
               tempObj = {};
               size = a_2664.decode_int16(byte_array);
               tempObj["m_iCardID"] = a_2664.decode_int32(byte_array);
               tempObj["m_iCardSeq"] = a_2664.decode_int32(byte_array);
               tempObj["m_nCardCount"] = a_2664.decode_int16(byte_array);
               tempObj["m_nCardUsedCount"] = a_2664.decode_int16(byte_array);
               tempObj["m_cTimeFlag"] = a_2664.decode_int8(byte_array);
               tempObj["m_iExpiredTime"] = a_2664.decode_int32(byte_array);
               tempObj["m_iUsedTime"] = a_2664.decode_int32(byte_array);
               tempObj["m_iDeltaTime"] = a_2664.decode_int32(byte_array);
               tempObj["m_cUpdateMode"] = a_2664.decode_int8(byte_array);
               tempObj["m_cIsBind"] = a_2664.decode_int8(byte_array);
               tempObj["m_cItemColor"] = a_2664.decode_int8(byte_array);
               nItemExtraAttrCount = a_2664.decode_int16(byte_array);
               aryExtraAttr = new Array(nItemExtraAttrCount);
               tempObj["m_nItemExtraAttrCount"] = nItemExtraAttrCount;
               tempObj["m_aryExtraAttr"] = aryExtraAttr;
               for(j = 0; j < nItemExtraAttrCount; j++)
               {
                  tempObj2 = {};
                  size2 = a_2664.decode_int16(byte_array);
                  tempObj2["m_cItemType"] = a_2664.decode_int8(byte_array);
                  tempObj2["m_iItemAdd"] = a_2664.decode_int32(byte_array);
                  tempObj2["m_iSkillID"] = a_2664.decode_int32(byte_array);
                  tempObj2["m_iPosition"] = a_2664.decode_int32(byte_array);
                  aryExtraAttr[j] = tempObj2;
               }
               this.m_stAttr.push(tempObj);
            }
            m_nCardAttrCount = a_2664.decode_int16(byte_array);
            for(i = 0; i < m_nCardAttrCount; i++)
            {
               tempObj = {};
               size = a_2664.decode_int16(byte_array);
               tempObj["m_iCardID"] = a_2664.decode_int32(byte_array);
               tempObj["m_iSeq"] = a_2664.decode_int32(byte_array);
               tempObj["m_iAttrType"] = a_2664.decode_int32(byte_array);
               tempObj["m_iAttrAdd"] = a_2664.decode_int32(byte_array);
               this.m_stAttr.push(tempObj);
            }
         }
         else
         {
            this.m_szReasonMessage = a_2664.decode_string(byte_array,4096);
         }
         return true;
      }
      
      public function dump() : Boolean
      {
         return false;
      }
   }
}

