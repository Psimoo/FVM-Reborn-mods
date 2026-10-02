package com.aurora.protocol.hallserver
{
   import a_4716.a_1731;
   import com.aurora.protocol.a_2664;
   import com.aurora.protocol.game.CPlayerGameConfig;
   import com.aurora.ui.maogoutd.mota.MiShiMacroConfig;
   import flash.utils.ByteArray;
   
   public class a_2745
   {
      
      public var m_nGameID:int;
      
      public var m_iExperiencePoint:int;
      
      public var m_iAchievement:int;
      
      public var m_iPoint:int;
      
      public var m_iWinRound:int;
      
      public var m_iLoseRound:int;
      
      public var m_iDrawRound:int;
      
      public var m_iEscapeRound:int;
      
      public var m_iOrgID:int;
      
      public var m_nPosition:int;
      
      public var m_uiTotalSecs:int;
      
      public var m_szLastDate:String;
      
      public var m_stGameConfig:CPlayerGameConfig;
      
      public var m_stExtGameInfo:a_2744;
      
      public var m_iHeroCount:int;
      
      public var m_oMiShi:Object;
      
      public var m_Reserved:int;
      
      public function a_2745()
      {
         super();
      }
      
      public function encode(byte_array:ByteArray, encode_length:int) : Boolean
      {
         return true;
      }
      
      public function decode(byte_array:ByteArray, decode_length:int, iFlag:int) : Boolean
      {
         var size:int = a_2664.decode_int16(byte_array);
         this.m_nGameID = a_2664.decode_int16(byte_array);
         if(iFlag & a_1731.a_340)
         {
            this.m_iExperiencePoint = a_2664.decode_int32(byte_array);
            this.m_iAchievement = a_2664.decode_int32(byte_array);
            this.m_iPoint = a_2664.decode_int32(byte_array);
            this.m_iHeroCount = a_2664.decode_int32(byte_array);
         }
         if(iFlag & a_1731.a_341)
         {
            this.m_iWinRound = a_2664.decode_int32(byte_array);
            this.m_iLoseRound = a_2664.decode_int32(byte_array);
            this.m_iDrawRound = a_2664.decode_int32(byte_array);
            this.m_iEscapeRound = a_2664.decode_int32(byte_array);
         }
         if(iFlag & a_1731.a_342)
         {
            this.m_oMiShi = {};
            this.m_iOrgID = a_2664.decode_int32(byte_array);
            this.m_nPosition = a_2664.decode_int32(byte_array);
            this.m_oMiShi.m_iLJSID = a_2664.decode_int32(byte_array);
            this.m_oMiShi.m_iCJGID = a_2664.decode_int32(byte_array);
            this.m_oMiShi.m_iWWWID = a_2664.decode_int32(byte_array);
            this.m_oMiShi.m_iSJGID = a_2664.decode_int32(byte_array);
            this.m_oMiShi.m_iMBKID = a_2664.decode_int32(byte_array);
            this.m_Reserved = a_2664.decode_int32(byte_array);
         }
         if(iFlag & a_1731.a_343)
         {
            this.m_uiTotalSecs = a_2664.decode_int32(byte_array);
         }
         if(iFlag & a_1731.a_344)
         {
            this.m_szLastDate = a_2664.decode_string(byte_array,30);
         }
         if(iFlag & a_1731.a_345)
         {
            this.m_stExtGameInfo = new a_2744();
            this.m_stExtGameInfo.decode(byte_array,decode_length);
         }
         if(iFlag & a_1731.a_346)
         {
            this.m_stGameConfig = new CPlayerGameConfig();
            this.m_stGameConfig.decode(byte_array,decode_length);
         }
         if(!(iFlag & a_1731.a_347))
         {
         }
         if(!(iFlag & a_1731.a_348))
         {
         }
         return true;
      }
      
      public function GetMiShiUseNum(iMiShiType:int) : Object
      {
         var iInfo:int = 0;
         switch(iMiShiType)
         {
            case MiShiMacroConfig.MISHI_TYPE_LJS:
               iInfo = int(this.m_oMiShi.m_iLJSID);
               break;
            case MiShiMacroConfig.MISHI_TYPE_CJG:
               iInfo = int(this.m_oMiShi.m_iCJGID);
               break;
            case MiShiMacroConfig.MISHI_TYPE_WWW:
               iInfo = int(this.m_oMiShi.m_iWWWID);
               break;
            case MiShiMacroConfig.MISHI_TYPE_SJG:
               iInfo = int(this.m_oMiShi.m_iSJGID);
               break;
            case MiShiMacroConfig.MISHI_TYPE_MBK:
               iInfo = int(this.m_oMiShi.m_iMBKID);
         }
         return this.AnalyInfo(iInfo);
      }
      
      public function GetDepthSeaUseNum() : Object
      {
         return this.AnalyInfo(this.m_Reserved);
      }
      
      private function AnalyInfo(iInfo:int) : Object
      {
         var oInfo:Object = null;
         if(iInfo > 0)
         {
            oInfo = {};
            oInfo.iTatalUseNum = iInfo >> 24;
            oInfo.iBuyUseNum = (iInfo & 0xFF0000) >> 16;
            oInfo.iUsedUseNum = (iInfo & 0xFF00) >> 8;
            oInfo.iLeftUseNum = iInfo & 0xFF;
         }
         return oInfo;
      }
   }
}

