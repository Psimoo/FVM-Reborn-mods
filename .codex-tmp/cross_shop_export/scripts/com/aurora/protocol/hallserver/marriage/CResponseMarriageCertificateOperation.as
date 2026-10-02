package com.aurora.protocol.hallserver.marriage
{
   import com.aurora.protocol.a_2664;
   import com.aurora.protocol.common.CMessageBody;
   import com.aurora.protocol.hallserver.CResponseBase;
   import flash.utils.ByteArray;
   
   public class CResponseMarriageCertificateOperation extends CResponseBase implements CMessageBody
   {
      
      public var m_iUin:int;
      
      public var m_iOperateType:int;
      
      public var m_nValueNum:int;
      
      public var m_vValue:Vector.<int>;
      
      public var m_strInfo:String;
      
      public function CResponseMarriageCertificateOperation()
      {
         super();
         this.m_vValue = new Vector.<int>();
      }
      
      override public function decode(byte_array:ByteArray, decode_length:int) : Boolean
      {
         var i:int = 0;
         var iValue:int = 0;
         m_nResultID = a_2664.decode_int16(byte_array);
         if(m_nResultID == 0)
         {
            this.m_iUin = a_2664.decode_int32(byte_array);
            this.m_iOperateType = a_2664.decode_int32(byte_array);
            this.m_nValueNum = a_2664.decode_int16(byte_array);
            this.m_vValue.length = 0;
            for(i = 0; i < this.m_nValueNum; i++)
            {
               iValue = a_2664.decode_int32(byte_array);
               this.m_vValue.push(iValue);
            }
            this.m_strInfo = a_2664.decode_string(byte_array,2048);
         }
         return true;
      }
      
      public function get SerializationInfo() : Array
      {
         var arrAllInfo:Array = [];
         arrAllInfo.push(this.m_iOperateType);
         arrAllInfo.push([]);
         for(var i:int = 0; i < this.m_nValueNum; i++)
         {
            arrAllInfo[1].push(this.m_vValue[i]);
         }
         arrAllInfo[1].push(this.m_strInfo);
         return arrAllInfo;
      }
   }
}

