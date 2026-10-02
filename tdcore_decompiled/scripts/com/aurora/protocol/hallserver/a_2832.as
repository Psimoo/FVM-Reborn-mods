package com.aurora.protocol.hallserver
{
   import com.aurora.protocol.a_2664;
   import com.aurora.protocol.common.CMessageBody;
   import com.aurora.protocol.logicserver.CCardStoreUpdate;
   import flash.utils.ByteArray;
   
   public class a_2832 implements CMessageBody
   {
      
      public var m_nResultID:int;
      
      public var m_iRoleUin:int;
      
      public var m_szRoleName:String;
      
      public var m_cHeroSex:int;
      
      public var m_iHeroScore:int;
      
      public var m_iHeroAttack:int;
      
      public var m_iHeroDefense:int;
      
      public var m_iHeroUserID:int;
      
      public var m_nHeroItemCount:int;
      
      public var m_arrUpdateHeroInfo:Array;
      
      public var m_nHeroSlotCount:int;
      
      public var m_arrCardSlotInfo:Array;
      
      public var m_szItemString:String;
      
      public var m_szReasonMessage:String;
      
      private var stUpdateHeroInfoRes:CUpdateHeroInfoRes;
      
      private var stCardSlotUpdate:CCardStoreUpdate;
      
      public function a_2832()
      {
         super();
      }
      
      public function encode(byte_array:ByteArray, encode_length:int) : Boolean
      {
         var propertyArray:Array = [["m_nResultID","int16"]];
         if(this.m_nResultID == 0)
         {
            propertyArray.push(["m_iRoleUin","int32"]);
            propertyArray.push(["m_szRoleName","string",32]);
            propertyArray.push(["m_cHeroSex","int8"]);
            propertyArray.push(["m_iHeroScore","int32"]);
            propertyArray.push(["m_iHeroAttack","int32"]);
            propertyArray.push(["m_iHeroDefense","int32"]);
            propertyArray.push(["m_iHeroUserID","int32"]);
            propertyArray.push(["m_nHeroItemCount","int16"]);
            propertyArray.push(["m_arrUpdateHeroInfo",["object","com.aurora.protocol.hallserver.CUpdateHeroInfoRes"]]);
            propertyArray.push(["m_nHeroSlotCount","int16"]);
            propertyArray.push(["m_arrCardSlotInfo",["object","com.aurora.protocol.logicserver.CCardStoreUpdate"]]);
            propertyArray.push(["m_szItemString","string",512]);
         }
         else
         {
            propertyArray.push(["m_szReasonMessage","string",4096]);
         }
         return a_2664.a_2665(this,propertyArray,byte_array,encode_length);
      }
      
      public function decode(byte_array:ByteArray, decode_length:int) : Boolean
      {
         this.m_nResultID = a_2664.decode_int16(byte_array);
         var propertyArray:Array = [];
         if(this.m_nResultID == 0)
         {
            propertyArray.push(["m_iRoleUin","int32"]);
            propertyArray.push(["m_szRoleName","string",32]);
            propertyArray.push(["m_cHeroSex","int8"]);
            propertyArray.push(["m_iHeroScore","int32"]);
            propertyArray.push(["m_iHeroAttack","int32"]);
            propertyArray.push(["m_iHeroDefense","int32"]);
            propertyArray.push(["m_iHeroUserID","int32"]);
            propertyArray.push(["m_nHeroItemCount","int16"]);
            propertyArray.push(["m_arrUpdateHeroInfo",["object","com.aurora.protocol.hallserver.CUpdateHeroInfoRes"]]);
            propertyArray.push(["m_nHeroSlotCount","int16"]);
            propertyArray.push(["m_arrCardSlotInfo",["object","com.aurora.protocol.logicserver.CCardStoreUpdate"]]);
            propertyArray.push(["m_szItemString","string",512]);
         }
         else
         {
            propertyArray.push(["m_szReasonMessage","string",4096]);
         }
         return a_2664.a_2666(this,propertyArray,byte_array,decode_length);
      }
      
      public function dump() : Boolean
      {
         return false;
      }
   }
}

