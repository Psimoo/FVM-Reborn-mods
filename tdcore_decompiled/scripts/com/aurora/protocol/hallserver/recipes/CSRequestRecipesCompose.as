package com.aurora.protocol.hallserver.recipes
{
   import com.aurora.protocol.a_2664;
   import com.aurora.protocol.common.CMessageBody;
   import com.aurora.ui.maogoutd.recipes.datatype.RecipesComposeStruct;
   import flash.utils.ByteArray;
   
   public class CSRequestRecipesCompose implements CMessageBody
   {
      
      public var m_iUIN:int;
      
      public var m_iRuleID:int;
      
      public var m_iCookeryID:int;
      
      public var m_iValue:int;
      
      public var m_aryMaterial:Array;
      
      public var m_iPropRecipesId:int;
      
      public function CSRequestRecipesCompose()
      {
         super();
      }
      
      public function encode(byte_array:ByteArray, encode_length:int) : Boolean
      {
         var stuRecipesInfo:RecipesComposeStruct = null;
         a_2664.encode_int32(byte_array,this.m_iUIN);
         a_2664.encode_int32(byte_array,this.m_iRuleID);
         a_2664.encode_int32(byte_array,this.m_iCookeryID);
         a_2664.encode_int32(byte_array,this.m_iValue);
         a_2664.encode_int16(byte_array,this.m_aryMaterial.length + 1);
         a_2664.encode_int32(byte_array,this.m_iPropRecipesId);
         a_2664.encode_int32(byte_array,0);
         for(var i:int = 0; i < this.m_aryMaterial.length; i++)
         {
            stuRecipesInfo = this.m_aryMaterial[i];
            a_2664.encode_int32(byte_array,stuRecipesInfo.m_iCardId);
            a_2664.encode_int32(byte_array,stuRecipesInfo.m_iSequence);
         }
         return true;
      }
      
      public function decode(byte_array:ByteArray, decode_length:int) : Boolean
      {
         return false;
      }
      
      public function dump() : Boolean
      {
         return false;
      }
   }
}

