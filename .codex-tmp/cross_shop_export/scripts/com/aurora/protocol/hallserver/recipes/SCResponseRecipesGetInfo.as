package com.aurora.protocol.hallserver.recipes
{
   import com.aurora.protocol.a_2664;
   import com.aurora.protocol.common.CMessageBody;
   import com.aurora.ui.maogoutd.recipes.datatype.RecipesStructPlayerInfo;
   import flash.utils.ByteArray;
   
   public class SCResponseRecipesGetInfo implements CMessageBody
   {
      
      public var m_nResult:int;
      
      public var m_iUIN:int;
      
      public var m_iValue:int;
      
      public var m_aryRecipesInfo:Array;
      
      public var strMessage:String;
      
      public function SCResponseRecipesGetInfo()
      {
         super();
      }
      
      public function encode(byte_array:ByteArray, encode_length:int) : Boolean
      {
         return false;
      }
      
      public function decode(byte_array:ByteArray, decode_length:int) : Boolean
      {
         var stRecipesPlayer:RecipesStructPlayerInfo = null;
         this.m_nResult = a_2664.decode_int16(byte_array);
         this.m_iUIN = a_2664.decode_int32(byte_array);
         if(0 != this.m_nResult)
         {
            this.strMessage = a_2664.decode_string(byte_array,1024);
            return false;
         }
         this.m_iValue = a_2664.decode_int32(byte_array);
         var iLength:int = a_2664.decode_int16(byte_array);
         if(!this.m_aryRecipesInfo)
         {
            this.m_aryRecipesInfo = [];
         }
         for(var i:int = 0; i < iLength; i++)
         {
            stRecipesPlayer = new RecipesStructPlayerInfo();
            stRecipesPlayer.m_iRecipesId = a_2664.decode_int32(byte_array);
            stRecipesPlayer.m_iStatus = a_2664.decode_int32(byte_array);
            stRecipesPlayer.m_iExe1 = a_2664.decode_int32(byte_array);
            stRecipesPlayer.m_iExe2 = a_2664.decode_int32(byte_array);
            stRecipesPlayer.m_iExe3 = a_2664.decode_int32(byte_array);
            stRecipesPlayer.m_iExe4 = a_2664.decode_int32(byte_array);
            stRecipesPlayer.m_iExe5 = a_2664.decode_int32(byte_array);
            stRecipesPlayer.m_iExe6 = a_2664.decode_int32(byte_array);
            this.m_aryRecipesInfo.push(stRecipesPlayer);
         }
         return true;
      }
      
      public function dump() : Boolean
      {
         return false;
      }
   }
}

