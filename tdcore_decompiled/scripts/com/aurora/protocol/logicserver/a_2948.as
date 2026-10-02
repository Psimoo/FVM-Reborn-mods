package com.aurora.protocol.logicserver
{
   import a_4717.EnmAntiFlag;
   import com.aurora.protocol.a_2664;
   import com.aurora.protocol.common.CMessageBody;
   import com.aurora.protocol.game.CPlayerDetail;
   import com.aurora.protocol.game.CPlayerGameConfig;
   import flash.utils.ByteArray;
   
   public class a_2948 implements CMessageBody
   {
      
      public var m_nResultID:int;
      
      public var m_bAct:int;
      
      public var m_iRoomID:int;
      
      public var m_iMatchID:int;
      
      public var m_iLeftTime:int;
      
      public var m_iHeadTableID:int;
      
      public var m_iTailTableID:int;
      
      public var m_stPlayerDetail:CPlayerDetail;
      
      public var m_stPlayerGameConfig:CPlayerGameConfig;
      
      public var m_iFlag:int;
      
      public var m_szKeyInfoHashcode:ByteArray;
      
      public var m_szIdentInfoHashcode:ByteArray;
      
      public var m_szReasonMsg:String;
      
      public function a_2948()
      {
         super();
      }
      
      public function encode(byte_array:ByteArray, encode_length:int) : Boolean
      {
         var propertyArray:Array = [["m_nResultID","int16"],["m_bAct","int8"],["m_iRoomID","int32"],["m_iMatchID","int32"],["m_iLeftTime","int32"]];
         if(this.m_nResultID == 0)
         {
            propertyArray.push(["m_iHeadTableID","int32"]);
            propertyArray.push(["m_iTailTableID","int32"]);
            propertyArray.push(["m_stPlayerDetail","object","com.aurora.protocol.game.CPlayerDetail","nosize"]);
            propertyArray.push(["m_stPlayerGameConfig","object","com.aurora.protocol.game.CPlayerGameConfig"]);
            propertyArray.push(["m_iFlag","int32"]);
            if(this.m_iFlag & EnmAntiFlag.enm_antibot_room)
            {
               propertyArray.push(["m_szKeyInfoHashcode","memory",16,"nosize"]);
               propertyArray.push(["m_szIdentInfoHashcode","memory",16,"nosize"]);
            }
         }
         else
         {
            propertyArray.push(["m_szReasonMsg","string",2048]);
         }
         return a_2664.a_2665(this,propertyArray,byte_array,encode_length);
      }
      
      public function decode(byte_array:ByteArray, decode_length:int) : Boolean
      {
         this.m_nResultID = a_2664.decode_int16(byte_array);
         var propertyArray:Array = [["m_bAct","int8"],["m_iRoomID","int32"],["m_iMatchID","int32"],["m_iLeftTime","int32"]];
         if(this.m_nResultID == 0)
         {
            propertyArray.push(["m_iHeadTableID","int32"]);
            propertyArray.push(["m_iTailTableID","int32"]);
            propertyArray.push(["m_stPlayerDetail","object","com.aurora.protocol.game.CPlayerDetail","nosize"]);
            propertyArray.push(["m_stPlayerGameConfig","object","com.aurora.protocol.game.CPlayerGameConfig"]);
            propertyArray.push(["m_iFlag","int32"]);
            if(!a_2664.a_2666(this,propertyArray,byte_array,decode_length))
            {
               return false;
            }
            if(this.m_iFlag & EnmAntiFlag.enm_antibot_room)
            {
               propertyArray = new Array();
               propertyArray.push(["m_szKeyInfoHashcode","memory",16,"nosize"]);
               propertyArray.push(["m_szIdentInfoHashcode","memory",16,"nosize"]);
               if(!a_2664.a_2666(this,propertyArray,byte_array,decode_length))
               {
                  return false;
               }
            }
            return true;
         }
         propertyArray.push(["m_szReasonMsg","string",2048]);
         return a_2664.a_2666(this,propertyArray,byte_array,decode_length);
      }
      
      public function dump() : Boolean
      {
         return false;
      }
   }
}

