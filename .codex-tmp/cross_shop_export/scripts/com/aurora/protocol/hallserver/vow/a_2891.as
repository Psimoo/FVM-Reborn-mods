package com.aurora.protocol.hallserver.vow
{
   import com.aurora.protocol.a_2664;
   import com.aurora.protocol.common.CMessageBody;
   import flash.utils.ByteArray;
   
   public class a_2891 implements CMessageBody
   {
      
      public var m_nResultID:int;
      
      public var m_iUin:int;
      
      public var m_astItem:Array;
      
      public var m_szReasonMessage:String;
      
      public function a_2891()
      {
         super();
      }
      
      public function encode(byte_array:ByteArray, encode_length:int) : Boolean
      {
         return false;
      }
      
      public function decode(byte_array:ByteArray, decode_length:int) : Boolean
      {
         var size:int = 0;
         var size2:int = 0;
         var i:int = 0;
         var j:int = 0;
         var tempObj:Object = null;
         var tempObj2:Object = null;
         var tempArr:Array = null;
         var m_nGoodItemsCount:int = 0;
         var m_nLeastItemsCount:int = 0;
         this.m_nResultID = a_2664.decode_int16(byte_array);
         this.m_iUin = a_2664.decode_int32(byte_array);
         if(this.m_nResultID == 0)
         {
            m_nGoodItemsCount = a_2664.decode_int16(byte_array);
            this.m_astItem = new Array();
            for(i = 0; i < m_nGoodItemsCount; i++)
            {
               tempObj = {};
               tempObj2 = {};
               size = a_2664.decode_int16(byte_array);
               tempObj["m_iUin"] = a_2664.decode_int32(byte_array);
               tempObj["m_szName"] = a_2664.decode_string(byte_array,128);
               tempObj["m_nLevel"] = a_2664.decode_int16(byte_array);
               tempObj["m_nCount"] = a_2664.decode_int16(byte_array);
               tempObj["m_iBoxID"] = a_2664.decode_int32(byte_array);
               tempObj["m_iTime"] = a_2664.decode_int32(byte_array);
               size2 = a_2664.decode_int16(byte_array);
               tempObj2["m_iCardID"] = a_2664.decode_int32(byte_array);
               tempObj2["m_iSeq"] = a_2664.decode_int32(byte_array);
               tempObj2["m_iAttrType"] = a_2664.decode_int32(byte_array);
               tempObj2["m_iAttrAdd"] = a_2664.decode_int32(byte_array);
               tempObj["m_stAttr"] = [tempObj2];
               this.m_astItem.push(tempObj);
            }
            m_nLeastItemsCount = a_2664.decode_int16(byte_array);
            for(i = 0; i < m_nLeastItemsCount; i++)
            {
               tempObj = {};
               size = a_2664.decode_int16(byte_array);
               tempObj["m_iUin"] = a_2664.decode_int32(byte_array);
               tempObj["m_szName"] = a_2664.decode_string(byte_array,128);
               tempObj["m_nLevel"] = a_2664.decode_int16(byte_array);
               tempObj["m_nCount"] = a_2664.decode_int16(byte_array);
               tempObj["m_iBoxID"] = a_2664.decode_int32(byte_array);
               tempObj["m_iTime"] = a_2664.decode_int32(byte_array);
               size = int(tempObj["m_nCount"]);
               tempArr = new Array(size);
               tempObj["m_stAttr"] = tempArr;
               for(j = 0; j < size; j++)
               {
                  tempObj2 = {};
                  size2 = a_2664.decode_int16(byte_array);
                  tempObj2["m_iCardID"] = a_2664.decode_int32(byte_array);
                  tempObj2["m_iSeq"] = a_2664.decode_int32(byte_array);
                  tempObj2["m_iAttrType"] = a_2664.decode_int32(byte_array);
                  tempObj2["m_iAttrAdd"] = a_2664.decode_int32(byte_array);
                  tempArr[j] = tempObj2;
               }
               this.m_astItem.push(tempObj);
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

