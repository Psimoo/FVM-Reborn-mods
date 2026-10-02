package com.aurora.protocol.hallserver.recipes
{
   import com.aurora.protocol.a_2664;
   import com.aurora.protocol.common.CMessageBody;
   import com.aurora.ui.maogoutd.recipes.datatype.RecipesStructRecipesInfo;
   import flash.utils.ByteArray;
   
   public class SCResponseRecipesCompose implements CMessageBody
   {
      
      public var m_nResult:int;
      
      public var m_iUIN:int;
      
      public var m_iRuleID:int;
      
      public var m_iCookeryID:int;
      
      public var m_iValue:int;
      
      public var m_aryMaterial:Array;
      
      public var m_strMessage:String;
      
      public function SCResponseRecipesCompose()
      {
         super();
      }
      
      public function encode(byte_array:ByteArray, encode_length:int) : Boolean
      {
         return false;
      }
      
      public function decode(byte_array:ByteArray, decode_length:int) : Boolean
      {
         var stuRecipesInfo:RecipesStructRecipesInfo = null;
         this.m_nResult = a_2664.decode_int16(byte_array);
         if(this.m_nResult != 0)
         {
            this.m_strMessage = a_2664.decode_string(byte_array,1024);
            return false;
         }
         this.m_iUIN = a_2664.decode_int32(byte_array);
         this.m_iRuleID = a_2664.decode_int32(byte_array);
         this.m_iCookeryID = a_2664.decode_int32(byte_array);
         this.m_iValue = a_2664.decode_int32(byte_array);
         var iLength:int = a_2664.decode_int16(byte_array);
         this.m_aryMaterial = [];
         for(var i:int = 0; i < iLength; i++)
         {
            stuRecipesInfo = new RecipesStructRecipesInfo();
            stuRecipesInfo.m_RecipesId = a_2664.decode_int32(byte_array);
            stuRecipesInfo.m_RecipesSequense = a_2664.decode_int32(byte_array);
         }
         return true;
      }
      
      public function dump() : Boolean
      {
         return false;
      }
   }
}

