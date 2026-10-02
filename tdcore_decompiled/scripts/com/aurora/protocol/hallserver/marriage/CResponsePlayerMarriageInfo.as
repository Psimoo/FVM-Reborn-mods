package com.aurora.protocol.hallserver.marriage
{
   import com.aurora.protocol.a_2664;
   import com.aurora.protocol.hallserver.CResponseBase;
   import flash.utils.ByteArray;
   
   public class CResponsePlayerMarriageInfo extends CResponseBase
   {
      
      public var m_iUin:int;
      
      public var m_iMarriageState:int;
      
      public var m_iCertificateLevel:int;
      
      public var m_iPartnerUin:int;
      
      public var m_iDivorceCount:int;
      
      public var m_iLastDivorceTime:int;
      
      public var m_iWeddingTime:int;
      
      public var m_iWeekWeddingCount:int;
      
      public var m_strPartnerName:String;
      
      public function CResponsePlayerMarriageInfo()
      {
         super();
      }
      
      override public function decode(byte_array:ByteArray, decode_length:int) : Boolean
      {
         m_nResultID = a_2664.decode_int16(byte_array);
         var arrPropertyArray:Array = [];
         if(m_nResultID == 0)
         {
            arrPropertyArray.push(["m_iUin","int32"]);
            arrPropertyArray.push(["m_iMarriageState","int32"]);
            arrPropertyArray.push(["m_iCertificateLevel","int32"]);
            arrPropertyArray.push(["m_iPartnerUin","int32"]);
            arrPropertyArray.push(["m_iDivorceCount","int32"]);
            arrPropertyArray.push(["m_iLastDivorceTime","int32"]);
            arrPropertyArray.push(["m_iWeddingTime","int32"]);
            arrPropertyArray.push(["m_iWeekWeddingCount","int32"]);
            arrPropertyArray.push(["m_strPartnerName","string",2048]);
         }
         return a_2664.a_2666(this,arrPropertyArray,byte_array,decode_length);
      }
   }
}

