package com.aurora.protocol.hallserver
{
   import com.aurora.protocol.a_2664;
   import com.aurora.protocol.common.CMessageBody;
   import flash.utils.ByteArray;
   
   public class a_2837 implements CMessageBody
   {
      
      public var m_nResultID:int;
      
      public var m_szReasonMessage:String;
      
      public var m_iRoleUin:int;
      
      public var m_iUserSex:int;
      
      public var m_szRoleName:String;
      
      public var m_iRoleScore:int;
      
      public var m_szHeroItemString:String;
      
      public var m_iRoleAttack:int;
      
      public var m_iRoleDefense:int;
      
      public var m_byShowCard:int;
      
      public var m_nHeroItemCount:int;
      
      public var m_arrHeroInfo:Array;
      
      public var m_iGameScore:int;
      
      public var m_iGamePoint:Number;
      
      public var m_iVsExp:int;
      
      public var m_iVsScore:int;
      
      private var m_HeroItem:CHeroItem;
      
      public function a_2837()
      {
         super();
      }
      
      public function encode(byte_array:ByteArray, encode_length:int) : Boolean
      {
         var propertyArray:Array = [["m_nResultID","int16"]];
         if(this.m_nResultID == 0)
         {
            propertyArray.push(["m_iRoleUin","int32"]);
            propertyArray.push(["m_iUserSex","int8"]);
            propertyArray.push(["m_szRoleName","string",32]);
            propertyArray.push(["m_iRoleScore","int32"]);
            propertyArray.push(["m_szHeroItemString","string",1024]);
            propertyArray.push(["m_iRoleAttack","int32"]);
            propertyArray.push(["m_iRoleDefense","int32"]);
            propertyArray.push(["m_byShowCard","int8"]);
            propertyArray.push(["m_nHeroItemCount","int16"]);
            propertyArray.push(["m_arrHeroInfo",["object","com.aurora.protocol.hallserver.CHeroItem"]]);
            propertyArray.push(["m_iGameScore","int32"]);
            propertyArray.push(["m_iGamePoint","int32"]);
         }
         else
         {
            propertyArray.push(["m_szReasonMessage","string",2048]);
         }
         return a_2664.a_2665(this,propertyArray,byte_array,encode_length);
      }
      
      public function decode(byte_array:ByteArray, decode_length:int) : Boolean
      {
         var i:int = 0;
         var stItem:CHeroItem = null;
         this.m_nResultID = a_2664.decode_int16(byte_array);
         if(this.m_nResultID == 0)
         {
            this.m_iRoleUin = a_2664.decode_int32(byte_array);
            this.m_iUserSex = a_2664.decode_int8(byte_array);
            this.m_szRoleName = a_2664.decode_string(byte_array,32);
            this.m_iRoleScore = a_2664.decode_int32(byte_array);
            this.m_szHeroItemString = a_2664.decode_string(byte_array,1024);
            this.m_iRoleAttack = a_2664.decode_int32(byte_array);
            this.m_iRoleDefense = a_2664.decode_int32(byte_array);
            this.m_byShowCard = a_2664.decode_int8(byte_array);
            this.m_nHeroItemCount = a_2664.decode_int16(byte_array);
            this.m_arrHeroInfo = [];
            for(i = 0; i < this.m_nHeroItemCount; i++)
            {
               stItem = new CHeroItem();
               a_2664.decode_int16(byte_array);
               stItem.decode(byte_array,decode_length);
               this.m_arrHeroInfo.push(stItem);
            }
            this.m_iGameScore = a_2664.decode_int32(byte_array);
            this.m_iGamePoint = a_2664.decode_uint64(byte_array);
            this.m_iVsExp = a_2664.decode_int32(byte_array);
            this.m_iVsScore = a_2664.decode_int32(byte_array);
         }
         else
         {
            this.m_szReasonMessage = a_2664.decode_string(byte_array,2048);
         }
         return true;
      }
      
      public function dump() : Boolean
      {
         return false;
      }
   }
}

