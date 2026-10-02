package com.aurora.ui.maogoutd.mota
{
   import a_4721.a_1761;
   import a_4739.a_1826;
   import a_4754.a_1825;
   import a_4754.a_2161;
   import a_4767.b_176;
   import a_4789.a_4657;
   import com.aurora.protocol.a_2664;
   import flash.utils.ByteArray;
   
   public class MiShiProtocal
   {
      
      private static var a_751:b_176;
      
      private static var instance:MiShiProtocal;
      
      private var a_732:a_1826;
      
      public var m_iType:Boolean;
      
      public var m_iGrade:uint;
      
      public var m_aryTreasureCardInfo:Array;
      
      public var m_aryItemInfo:Array;
      
      private var m_iResult:int;
      
      private var m_MiBaoKuInfo:MiBaoKuInfo;
      
      public function MiShiProtocal()
      {
         super();
         this.a_732 = new a_1826(this);
         this.registerDecoder();
         if(!this.m_MiBaoKuInfo)
         {
            this.m_MiBaoKuInfo = new MiBaoKuInfo();
         }
      }
      
      public static function getInstance() : MiShiProtocal
      {
         if(instance == null)
         {
            instance = new MiShiProtocal();
            a_751 = a_1825.e.GetTDLobbyLogic() as b_176;
         }
         return instance;
      }
      
      private function registerDecoder() : void
      {
         this.a_732.register(a_1761.enmGameLobbyDataCmd_CS_GetMiBaoKuInfo,this.ResponseMiBaoKuInfo);
         this.a_732.register(a_1761.enmGameLobbyDataCmd_CS_MiBaoKuExcavat,this.ResponseExcavatInfo);
         this.a_732.register(a_1761.enmGameLobbyDataCmd_CS_MiBaoKuReflush,this.ResponseReflush);
         this.a_732.register(a_1761.enmGameLobbyDataCmd_CS_MiBaoKuRestart,this.ResponseRestart);
      }
      
      public function a_1842(iRoomID:int, aryByteData:ByteArray) : void
      {
         var enmGameDataType_SC:uint = 0;
         if(aryByteData.length > 0)
         {
            enmGameDataType_SC = aryByteData.readUnsignedByte();
            trace("enmGameDataType_SC=" + enmGameDataType_SC);
            this.a_732.excute(enmGameDataType_SC,aryByteData);
         }
      }
      
      public function RequestMiBaoKuInfo() : void
      {
         var by:ByteArray = new ByteArray();
         by.writeByte(a_1761.enmGameLobbyDataCmd_CS_GetMiBaoKuInfo);
         var m_oEnterRoom:Object = a_2161.e.getEnterRoom();
         a_751.sendMatchGameData(m_oEnterRoom.m_iServerID,m_oEnterRoom.m_iRoomID,by);
      }
      
      public function RequestExcavatInfo(iItemId:int) : void
      {
         var by:ByteArray = new ByteArray();
         by.writeByte(a_1761.enmGameLobbyDataCmd_CS_MiBaoKuExcavat);
         var m_oEnterRoom:Object = a_2161.e.getEnterRoom();
         a_2664.encode_int8(by,this.m_MiBaoKuInfo.m_iType);
         a_2664.encode_int8(by,this.m_MiBaoKuInfo.m_iGrade);
         a_2664.encode_int8(by,iItemId);
         a_751.sendMatchGameData(m_oEnterRoom.m_iServerID,m_oEnterRoom.m_iRoomID,by);
      }
      
      public function RequestReflush() : void
      {
         var by:ByteArray = new ByteArray();
         by.writeByte(a_1761.enmGameLobbyDataCmd_CS_MiBaoKuReflush);
         var m_oEnterRoom:Object = a_2161.e.getEnterRoom();
         a_2664.encode_int8(by,this.m_MiBaoKuInfo.m_iType);
         a_2664.encode_int8(by,this.m_MiBaoKuInfo.m_iGrade);
         a_751.sendMatchGameData(m_oEnterRoom.m_iServerID,m_oEnterRoom.m_iRoomID,by);
      }
      
      public function RequestRestart() : void
      {
         var by:ByteArray = new ByteArray();
         by.writeByte(a_1761.enmGameLobbyDataCmd_CS_MiBaoKuRestart);
         var m_oEnterRoom:Object = a_2161.e.getEnterRoom();
         a_751.sendMatchGameData(m_oEnterRoom.m_iServerID,m_oEnterRoom.m_iRoomID,by);
      }
      
      private function ResponseMiBaoKuInfo(aryByteData:ByteArray) : void
      {
         this.m_iResult = a_2664.decode_int8(aryByteData);
         if(0 == this.m_iResult)
         {
            this.EncodeSCMiBaoKuInfo(aryByteData);
            a_4657.getInstance().execute("SetMiBaoKuData",this,this.m_MiBaoKuInfo);
         }
         else
         {
            this.ShowMiShiResultTip(this.m_iResult);
         }
      }
      
      private function ResponseExcavatInfo(aryByteData:ByteArray) : void
      {
         var iBox:int = a_2664.decode_int8(aryByteData);
         this.m_iResult = a_2664.decode_int8(aryByteData);
         if(0 == this.m_iResult)
         {
            this.EncodeSCMiBaoKuInfo(aryByteData);
            a_4657.getInstance().execute("UpdataMiBaoKuNextGrade",this,this.m_MiBaoKuInfo,iBox);
         }
         else
         {
            this.ShowMiShiResultTip(this.m_iResult);
         }
      }
      
      private function ResponseReflush(aryByteData:ByteArray) : void
      {
         this.m_iResult = a_2664.decode_int8(aryByteData);
         if(0 == this.m_iResult)
         {
            this.EncodeSCMiBaoKuInfo(aryByteData);
            a_4657.getInstance().execute("SetMiBaoKuData",this,this.m_MiBaoKuInfo);
         }
         else
         {
            this.ShowMiShiResultTip(this.m_iResult);
         }
      }
      
      private function ResponseRestart(aryByteData:ByteArray) : void
      {
         this.m_iResult = a_2664.decode_int8(aryByteData);
         if(0 == this.m_iResult)
         {
            this.EncodeSCMiBaoKuInfo(aryByteData);
            a_4657.getInstance().execute("SetMiBaoKuData",this,this.m_MiBaoKuInfo);
         }
         else
         {
            this.ShowMiShiResultTip(this.m_iResult);
         }
      }
      
      private function EncodeSCMiBaoKuInfo(aryByteData:ByteArray) : void
      {
         var oData:Object = null;
         var iLength:int = 0;
         var i:int = 0;
         this.m_MiBaoKuInfo.m_iRestart = a_2664.decode_int8(aryByteData);
         this.m_MiBaoKuInfo.m_iType = a_2664.decode_int8(aryByteData);
         this.m_MiBaoKuInfo.m_iType = 0 > this.m_MiBaoKuInfo.m_iType ? 0 : this.m_MiBaoKuInfo.m_iType;
         this.m_MiBaoKuInfo.m_iGrade = a_2664.decode_int8(aryByteData);
         iLength = a_2664.decode_int32(aryByteData);
         for(i = 0; i < iLength; i++)
         {
            oData = {};
            oData.iCardId = a_2664.decode_int32(aryByteData);
            oData.iStar = a_2664.decode_int8(aryByteData);
            this.m_MiBaoKuInfo.m_aryTreasureCardInfo[i] = oData;
         }
         iLength = a_2664.decode_int32(aryByteData);
         for(i = 0; i < iLength; i++)
         {
            oData = {};
            oData.iID = a_2664.decode_int8(aryByteData);
            oData.iOpen = a_2664.decode_int8(aryByteData);
            oData.iItemType = a_2664.decode_int8(aryByteData);
            oData.iItemId = a_2664.decode_int32(aryByteData);
            oData.iCount = a_2664.decode_int32(aryByteData);
            this.m_MiBaoKuInfo.m_aryItemInfo[i] = oData;
         }
      }
      
      private function ShowMiShiResultTip(iResult:int) : void
      {
         var szTipMsg:String = null;
         switch(iResult)
         {
            case 1:
               szTipMsg = "魔塔通关层数不够";
               break;
            case 2:
               szTipMsg = "秘宝窟探宝次数不够";
               break;
            case 3:
               szTipMsg = "相应秘宝窟关卡不存在";
               break;
            case 4:
               szTipMsg = "金币不足";
               break;
            case 5:
               szTipMsg = "点券不足";
               break;
            case 6:
               szTipMsg = "挖掘失败";
               break;
            case 7:
               szTipMsg = "魔塔通关层数不够";
               break;
            case 8:
               szTipMsg = "魔塔通关层数不够";
               break;
            case 9:
               szTipMsg = "此位置已经被挖掘";
               break;
            default:
               szTipMsg = "未知错误";
         }
         a_4657.getInstance().execute("ShowMiBaoKuTip",this,szTipMsg);
      }
   }
}

