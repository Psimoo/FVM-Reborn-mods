package com.aurora.protocol.hallserver
{
   import com.aurora.protocol.a_2664;
   import com.aurora.protocol.common.CMessageBody;
   import com.aurora.protocol.logicserver.CCardStoreUpdate;
   import flash.utils.ByteArray;
   
   public class a_2847 implements CMessageBody
   {
      
      public var m_iSrcUin:int;
      
      public var m_iDstUin:int;
      
      public var m_nResultID:int;
      
      public var m_cHeroSexFlag:int;
      
      public var m_cHeroSex:int;
      
      public var m_cHeroScoreFlag:int;
      
      public var m_iHeroScore:int;
      
      public var m_cHeroAttackFlag:int;
      
      public var m_iHeroAttack:int;
      
      public var m_cHeroDefenseFlag:int;
      
      public var m_iHeroDefense:int;
      
      public var m_cHeroUserIDFlag:int;
      
      public var m_iHeroUserID:int;
      
      public var m_nHeroItemCount:int;
      
      public var m_arrUpdateHeroInfo:Array;
      
      public var m_nHeroSlotCount:int;
      
      public var m_arrCardSlotInfo:Array;
      
      public var m_cHeroNameFlag:int;
      
      public var m_szHeroName:String;
      
      public var m_cHeroItemFlag:int;
      
      public var m_szHeroItem:String;
      
      private var stUpdateHeroInfo:CUpdateHeroInfoRes;
      
      private var stCCardStoreUpdate:CCardStoreUpdate;
      
      public function a_2847()
      {
         super();
      }
      
      public function encode(byte_array:ByteArray, encode_length:int) : Boolean
      {
         var propertyArray:Array = [];
         propertyArray.push(["m_iSrcUin","int32"]);
         propertyArray.push(["m_iDstUin","int32"]);
         propertyArray.push(["m_cHeroSexFlag","int8"]);
         propertyArray.push(["m_cHeroSex","int8"]);
         propertyArray.push(["m_nResultID","int16"]);
         propertyArray.push(["m_cHeroScoreFlag","int8"]);
         propertyArray.push(["m_iHeroScore","int32"]);
         propertyArray.push(["m_cHeroAttackFlag","int8"]);
         propertyArray.push(["m_iHeroAttack","int32"]);
         propertyArray.push(["m_cHeroDefenseFlag","int8"]);
         propertyArray.push(["m_iHeroDefense","int32"]);
         propertyArray.push(["m_cHeroUserIDFlag","int8"]);
         propertyArray.push(["m_iHeroUserID","int32"]);
         propertyArray.push(["m_nHeroItemCount","int16"]);
         propertyArray.push(["m_arrUpdateHeroInfo",["object","com.aurora.protocol.hallserver.CUpdateHeroInfoRes"]]);
         propertyArray.push(["m_nHeroSlotCount","int16"]);
         propertyArray.push(["m_arrCardSlotInfo",["object","com.aurora.protocol.logicserver.CCardStoreUpdate"]]);
         propertyArray.push(["m_cHeroNameFlag","int8"]);
         propertyArray.push(["m_szHeroName","string",64]);
         propertyArray.push(["m_cHeroItemFlag","int8"]);
         propertyArray.push(["m_szHeroItem","string",1024]);
         return a_2664.a_2665(this,propertyArray,byte_array,encode_length);
      }
      
      public function decode(byte_array:ByteArray, decode_length:int) : Boolean
      {
         var propertyArray:Array = [];
         this.m_iSrcUin = a_2664.decode_int32(byte_array);
         this.m_iDstUin = a_2664.decode_int32(byte_array);
         this.m_nResultID = a_2664.decode_int16(byte_array);
         if(this.m_nResultID == 0)
         {
            propertyArray.push(["m_cHeroSexFlag","int8"]);
            propertyArray.push(["m_cHeroSex","int8"]);
            propertyArray.push(["m_cHeroScoreFlag","int8"]);
            propertyArray.push(["m_iHeroScore","int32"]);
            propertyArray.push(["m_cHeroAttackFlag","int8"]);
            propertyArray.push(["m_iHeroAttack","int32"]);
            propertyArray.push(["m_cHeroDefenseFlag","int8"]);
            propertyArray.push(["m_iHeroDefense","int32"]);
            propertyArray.push(["m_cHeroUserIDFlag","int8"]);
            propertyArray.push(["m_iHeroUserID","int32"]);
            propertyArray.push(["m_nHeroItemCount","int16"]);
            propertyArray.push(["m_arrUpdateHeroInfo",["object","com.aurora.protocol.hallserver.CUpdateHeroInfoRes"]]);
            propertyArray.push(["m_nHeroSlotCount","int16"]);
            propertyArray.push(["m_arrCardSlotInfo",["object","com.aurora.protocol.logicserver.CCardStoreUpdate"]]);
            propertyArray.push(["m_cHeroNameFlag","int8"]);
            propertyArray.push(["m_szHeroName","string",64]);
            propertyArray.push(["m_cHeroItemFlag","int8"]);
            propertyArray.push(["m_szHeroItem","string",1024]);
         }
         return a_2664.a_2666(this,propertyArray,byte_array,decode_length);
      }
      
      public function dump() : Boolean
      {
         return false;
      }
   }
}

