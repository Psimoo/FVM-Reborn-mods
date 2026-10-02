package com.aurora.protocol.logicserver
{
   import com.aurora.protocol.a_2664;
   import com.aurora.protocol.common.CMessageBody;
   import com.aurora.protocol.game.CPlayerDetail;
   import flash.utils.ByteArray;
   
   public class a_2953 implements CMessageBody
   {
      
      public var m_nResultID:int;
      
      public var m_byACT:int;
      
      public var m_iRoomID:int;
      
      public var m_iTableID:int;
      
      public var m_bySeatID:int;
      
      public var m_iSitdownSequence:int;
      
      public var m_iCrossID:int;
      
      public var m_iMapID:int;
      
      public var m_byGameMode:int;
      
      public var m_bLevel:int;
      
      public var m_nseatmask:int;
      
      public var m_byPlayerCount:int;
      
      public var m_stPlayers:Array;
      
      public var m_szReasonMsg:String;
      
      public function a_2953()
      {
         super();
      }
      
      public function encode(byte_array:ByteArray, encode_length:int) : Boolean
      {
         var propertyArray:Array = [["m_nResultID","int16"],["m_byACT","int8"],["m_iRoomID","int32"],["m_iTableID","int32"],["m_bySeatID","int8"],["m_iSitdownSequence","int32"]];
         if(this.m_nResultID == 0)
         {
            propertyArray.push(["m_iMapID","int32"]);
            propertyArray.push(["m_byGameMode","int8"]);
            propertyArray.push(["m_bLevel","int8"]);
            propertyArray.push(["m_nseatmask","int16"]);
            propertyArray.push(["m_byPlayerCount","int8"]);
            propertyArray.push(["m_stPlayers",["object","com.aurora.protocol.game.CPlayerDetail","nosize"]]);
         }
         else
         {
            propertyArray.push(["m_szReasonMsg","string",2048]);
         }
         return a_2664.a_2665(this,propertyArray,byte_array,encode_length);
      }
      
      public function decode(byte_array:ByteArray, decode_length:int) : Boolean
      {
         var stPlayer:CPlayerDetail = null;
         var i:int = 0;
         this.m_nResultID = a_2664.decode_int16(byte_array);
         this.m_byACT = a_2664.decode_int8(byte_array);
         this.m_iRoomID = a_2664.decode_int32(byte_array);
         this.m_iTableID = a_2664.decode_int32(byte_array);
         this.m_bySeatID = a_2664.decode_int8(byte_array);
         this.m_iSitdownSequence = a_2664.decode_int32(byte_array);
         this.m_iCrossID = a_2664.decode_int32(byte_array);
         if(this.m_nResultID == 0)
         {
            this.m_iMapID = a_2664.decode_int32(byte_array);
            this.m_byGameMode = a_2664.decode_int8(byte_array);
            this.m_bLevel = a_2664.decode_int8(byte_array);
            this.m_nseatmask = a_2664.decode_int16(byte_array);
            this.m_byPlayerCount = a_2664.decode_int8(byte_array);
            this.m_stPlayers = [];
            for(i = 0; i < this.m_byPlayerCount; i++)
            {
               stPlayer = new CPlayerDetail();
               stPlayer.decode(byte_array,decode_length);
               this.m_stPlayers.push(stPlayer);
            }
         }
         else
         {
            this.m_szReasonMsg = a_2664.decode_string(byte_array,2048);
         }
         return true;
      }
      
      public function dump() : Boolean
      {
         return false;
      }
   }
}

