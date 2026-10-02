package com.aurora.protocol.hallserver.consortia
{
   import a_4716.EnmConsortia;
   import com.aurora.protocol.a_2664;
   import com.aurora.protocol.common.CMessageBody;
   import flash.utils.ByteArray;
   
   public class ConsortiaInfo implements CMessageBody
   {
      
      public var m_iFlag:int;
      
      public var m_iID:int;
      
      public var m_iFounderUIN:int;
      
      public var m_czChairmanName:String;
      
      public var m_czConsortiaName:String;
      
      public var m_iTimestamp:int;
      
      public var m_czConsortiaEnounce:String;
      
      public var m_czConsortiaNotify:String;
      
      public var m_nAdminNum:int;
      
      public var m_aryAdministrators:Array;
      
      public var m_nMemberNum:int;
      
      public var m_aryMember:Array;
      
      public var m_nProposerNum:int;
      
      public var m_aryProposer:Array;
      
      public var m_iScore:int;
      
      public var m_iLevel:int;
      
      public var m_iMoney:int;
      
      public var m_iCoin:int;
      
      public var m_nFlag:int;
      
      public var m_iLeastUpdateTime:int;
      
      public var m_iLeastBalanceTime:int;
      
      public var m_stEstablishment:a_2760;
      
      public var m_stQunInfo:Object;
      
      public function ConsortiaInfo()
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
         var member:a_2763 = null;
         var proposer:a_2788 = null;
         var body_size:int = a_2664.decode_int16(byte_array);
         this.m_iFlag = a_2664.decode_int32(byte_array);
         this.m_iID = a_2664.decode_int32(byte_array);
         if(this.m_iFlag & EnmConsortia.a_360)
         {
            this.m_iFounderUIN = a_2664.decode_int32(byte_array);
            this.m_czChairmanName = a_2664.decode_string(byte_array,32);
            this.m_czConsortiaName = a_2664.decode_string(byte_array,128);
            this.m_iTimestamp = a_2664.decode_int32(byte_array);
         }
         if(this.m_iFlag & EnmConsortia.a_361)
         {
            this.m_czConsortiaEnounce = a_2664.decode_string(byte_array,1024);
         }
         if(this.m_iFlag & EnmConsortia.a_362)
         {
            this.m_czConsortiaNotify = a_2664.decode_string(byte_array,1024);
         }
         if(this.m_iFlag & EnmConsortia.a_363)
         {
            this.m_nAdminNum = a_2664.decode_int16(byte_array);
            this.m_aryAdministrators = new Array();
            for(i = 0; i < this.m_nAdminNum; i++)
            {
               this.m_aryAdministrators.push(a_2664.decode_int32(byte_array));
            }
         }
         if(this.m_iFlag & EnmConsortia.a_365)
         {
            this.m_nMemberNum = a_2664.decode_int16(byte_array);
            this.m_aryMember = new Array();
            for(i = 0; i < this.m_nMemberNum; i++)
            {
               member = new a_2763();
               member.decode(byte_array,0);
               this.m_aryMember.push(member);
            }
         }
         if(this.m_iFlag & EnmConsortia.a_364)
         {
            this.m_nProposerNum = a_2664.decode_int16(byte_array);
            this.m_aryProposer = new Array();
            for(i = 0; i < this.m_nProposerNum; i++)
            {
               proposer = new a_2788();
               proposer.decode(byte_array,0);
               this.m_aryProposer.push(proposer);
            }
         }
         if(this.m_iFlag & EnmConsortia.a_367)
         {
            this.m_iScore = a_2664.decode_int32(byte_array);
         }
         if(this.m_iFlag & EnmConsortia.a_368)
         {
            this.m_iLevel = a_2664.decode_int32(byte_array);
         }
         if(this.m_iFlag & EnmConsortia.a_369)
         {
            this.m_iMoney = a_2664.decode_int32(byte_array);
            this.m_iCoin = a_2664.decode_int32(byte_array);
         }
         if(this.m_iFlag & EnmConsortia.a_370)
         {
            this.m_nFlag = a_2664.decode_int32(byte_array);
         }
         if(this.m_iFlag & EnmConsortia.a_371)
         {
            this.m_iLeastUpdateTime = a_2664.decode_int32(byte_array);
         }
         if(this.m_iFlag & EnmConsortia.a_373)
         {
            this.m_iLeastBalanceTime = a_2664.decode_int32(byte_array);
         }
         if(this.m_iFlag & EnmConsortia.a_366)
         {
            this.m_stEstablishment = new a_2760();
            this.m_stEstablishment.decode(byte_array,0);
         }
         if(this.m_iFlag & EnmConsortia.a_374)
         {
            this.m_stQunInfo = {};
            this.m_stQunInfo.m_iQun1 = a_2664.decode_int32(byte_array);
            this.m_stQunInfo.m_iQun2 = a_2664.decode_int32(byte_array);
            this.m_stQunInfo.m_iQun3 = a_2664.decode_int32(byte_array);
         }
         return true;
      }
      
      public function dump() : Boolean
      {
         return false;
      }
   }
}

