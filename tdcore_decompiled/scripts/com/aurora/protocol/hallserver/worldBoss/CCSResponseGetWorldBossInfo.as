package com.aurora.protocol.hallserver.worldBoss
{
   import com.aurora.protocol.a_2664;
   import com.aurora.protocol.common.CMessageBody;
   import com.aurora.ui.maogoutd.role.a_4461;
   import flash.utils.ByteArray;
   
   public class CCSResponseGetWorldBossInfo implements CMessageBody
   {
      
      public var m_nResultID:int;
      
      public var m_iUin:int;
      
      public var m_cSeasonID:int;
      
      public var m_cBossID:int;
      
      public var m_cBuffID:int;
      
      public var m_cFightCount:int;
      
      public var m_nPreCrossRank:int;
      
      public var m_nPreGroupRank:int;
      
      public var m_nPreConsortiaRank:int;
      
      public var m_nCrossRank:int;
      
      public var m_nGroupRank:int;
      
      public var m_nConsortiaRank:int;
      
      public var m_cPreLevel:int;
      
      public var m_cPreGrade:int;
      
      public var m_nScore:int;
      
      public var m_cLevel:int;
      
      public var m_cGrade:int;
      
      public var m_iAwardFlag:int;
      
      public var m_iPreAwardFlag:int;
      
      public var m_cUpGradeFlag:int;
      
      public var m_cTopFlag:int;
      
      public var m_cTopLevel:int;
      
      public var m_cTopGrade:int;
      
      public var m_cTopPlatform:int;
      
      public var m_nTopGroup:int;
      
      public var m_cTopKillBossID:int;
      
      public var m_iTopKillBossHP:int;
      
      public var m_iTopUin:int;
      
      public var m_iTopExp:Number;
      
      public var m_cSex:int;
      
      public var m_nAvatarBufferSize:int;
      
      public var m_arrAvatarInfo:Array;
      
      public var m_isChariman:int;
      
      public var m_cCrossConsRank:int;
      
      public var m_isPreChariman:int;
      
      public var m_cPreCrossConsRank:int;
      
      public var m_nSkipScore:int;
      
      public var m_sUserName:String;
      
      public var m_ishowcard:int;
      
      public var m_iMapID:int;
      
      public var divideAwardFlag:int;
      
      public function CCSResponseGetWorldBossInfo()
      {
         super();
      }
      
      public function encode(byte_array:ByteArray, encode_length:int) : Boolean
      {
         return false;
      }
      
      public function decode(byte_array:ByteArray, decode_length:int) : Boolean
      {
         var byteArr:ByteArray = null;
         var msg:String = null;
         var heroItem:a_4461 = null;
         var tempAry:Array = null;
         var list:Array = null;
         var i:int = 0;
         var tmp:String = null;
         var ids:Array = null;
         var id:int = 0;
         var param:int = 0;
         this.m_nResultID = a_2664.decode_int16(byte_array);
         this.m_iUin = a_2664.decode_int32(byte_array);
         this.m_cSeasonID = a_2664.decode_int8(byte_array);
         this.m_cBossID = a_2664.decode_int16(byte_array);
         this.m_cBuffID = a_2664.decode_int32(byte_array);
         this.m_cFightCount = a_2664.decode_int8(byte_array);
         this.m_nPreCrossRank = a_2664.decode_int16(byte_array);
         this.m_nPreGroupRank = a_2664.decode_int16(byte_array);
         this.m_nPreConsortiaRank = a_2664.decode_int16(byte_array);
         this.m_nCrossRank = a_2664.decode_int16(byte_array);
         this.m_nGroupRank = a_2664.decode_int16(byte_array);
         this.m_nConsortiaRank = a_2664.decode_int16(byte_array);
         this.m_cPreLevel = a_2664.decode_int8(byte_array);
         this.m_cPreGrade = a_2664.decode_int8(byte_array);
         this.m_nScore = a_2664.decode_int32(byte_array);
         this.m_cLevel = a_2664.decode_int8(byte_array);
         this.m_cGrade = a_2664.decode_int8(byte_array);
         this.m_iAwardFlag = a_2664.decode_int32(byte_array);
         this.m_iPreAwardFlag = a_2664.decode_int32(byte_array);
         this.m_cUpGradeFlag = a_2664.decode_int8(byte_array);
         this.m_isChariman = a_2664.decode_int8(byte_array);
         this.m_cCrossConsRank = a_2664.decode_int8(byte_array);
         this.m_isPreChariman = a_2664.decode_int8(byte_array);
         this.m_cPreCrossConsRank = a_2664.decode_int8(byte_array);
         this.m_nSkipScore = a_2664.decode_int16(byte_array);
         this.m_iMapID = a_2664.decode_int32(byte_array);
         this.divideAwardFlag = a_2664.decode_int8(byte_array);
         this.m_cTopFlag = a_2664.decode_int8(byte_array);
         if(this.m_cTopFlag == 1)
         {
            this.m_cTopLevel = a_2664.decode_int8(byte_array);
            this.m_cTopGrade = a_2664.decode_int8(byte_array);
            this.m_cTopPlatform = a_2664.decode_int8(byte_array);
            this.m_nTopGroup = a_2664.decode_int16(byte_array);
            this.m_cTopKillBossID = a_2664.decode_int16(byte_array);
            this.m_iTopKillBossHP = a_2664.decode_int32(byte_array);
            this.m_iTopUin = a_2664.decode_int32(byte_array);
            this.m_iTopExp = a_2664.decode_uint64(byte_array);
            this.m_cSex = a_2664.decode_int8(byte_array);
            this.m_arrAvatarInfo = [];
            byteArr = new ByteArray();
            this.m_nAvatarBufferSize = a_2664.decode_int16(byte_array);
            a_2664.decode_memory(byte_array,byteArr,this.m_nAvatarBufferSize);
            byteArr.position = 0;
            msg = byteArr.readMultiByte(byteArr.bytesAvailable,"utf-8");
            tempAry = msg.split(",");
            if(Boolean(tempAry) && tempAry.length > 0)
            {
               this.m_sUserName = tempAry[0];
               if(tempAry.length > 1)
               {
                  list = tempAry[1].split("|");
                  for(i = 0; i < list.length; i++)
                  {
                     tmp = list[i];
                     ids = tmp.split("-");
                     id = int(ids[0]);
                     if(ids.length > 1)
                     {
                        param = int(ids[1]);
                        if(id > 10000)
                        {
                           heroItem = new a_4461();
                           heroItem.m_iItemID = id;
                           heroItem.m_iTypeValue = param;
                           this.m_arrAvatarInfo.push(heroItem);
                        }
                        else if(id == 0)
                        {
                           this.m_ishowcard = -param;
                        }
                     }
                     else if(id > 10000)
                     {
                        heroItem = new a_4461();
                        heroItem.m_iItemID = id;
                        this.m_arrAvatarInfo.push(heroItem);
                     }
                     else
                     {
                        this.m_ishowcard = id;
                     }
                  }
               }
            }
         }
         return true;
      }
      
      public function dump() : Boolean
      {
         return false;
      }
   }
}

