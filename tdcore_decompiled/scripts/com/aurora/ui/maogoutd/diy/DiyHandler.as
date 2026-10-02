package com.aurora.ui.maogoutd.diy
{
   import a_4714.AssetType;
   import a_4714.AssetsItemData;
   import a_4714.AssetsLoader;
   import a_4720.a_1748;
   import a_4728.a_1778;
   import a_4729.EventType;
   import a_4729.a_1789;
   import a_4731.CommonEvent;
   import a_4754.a_1825;
   import a_4754.a_2155;
   import a_4754.a_2161;
   import a_4767.b_176;
   import a_4789.a_4657;
   import com.aurora.ui.maogoutd.ClientLog.MessageTipHandler;
   import com.aurora.ui.maogoutd.crossserver.CrossXml;
   import com.aurora.ui.maogoutd.diy.laboratory.view.MapDetailInfoView;
   import com.aurora.ui.maogoutd.diy.myChapter.data.ChapterData;
   import com.aurora.ui.maogoutd.diy.myChapter.data.TableInfoData;
   import com.aurora.ui.maogoutd.diy.myChapter.view.NormalSureView;
   import com.aurora.ui.maogoutd.diy.myChapter.view.PublishHintView;
   import com.aurora.ui.maogoutd.diy.myEditor.data.BossStepData;
   import com.aurora.ui.maogoutd.diy.myEditor.data.EnemyStepData;
   import com.aurora.ui.maogoutd.diy.myEditor.data.MapStepData;
   import com.aurora.ui.maogoutd.diy.myEditor.data.WaveData;
   import com.aurora.ui.maogoutd.diy.xml.DIYConfigData;
   import com.aurora.ui.maogoutd.iface.ITDMessageTip;
   import com.aurora.ui.maogoutd.role.a_4463;
   import com.aurora.ui.maogoutd.version.VersionMD5;
   import flash.display.DisplayObject;
   import flash.display.Stage;
   import flash.geom.Rectangle;
   import flash.utils.ByteArray;
   import flash.utils.Dictionary;
   
   public class DiyHandler
   {
      
      private static var m_stDiyHandler:DiyHandler;
      
      public static var DRAFT_LOT_ID:int;
      
      public static var PUBLISH_LOT_ID:int;
      
      public var m_pDiyLaboratoryUI:DisplayObject;
      
      public var m_pMyChapterUI:DisplayObject;
      
      public var updateMyChapterUI:Function;
      
      public var updateDiyLaboratoryUI:Function;
      
      public var updateEditorUI:Function;
      
      public var updateTimeLine:Function;
      
      public var updateBlood:Function;
      
      public var updateStateBar:Function;
      
      public var updatePwdError:Function;
      
      public var updateLandform:Function;
      
      public var ROW:int = 7;
      
      public var COL:int = 9;
      
      private var randPool:Vector.<TableInfoData>;
      
      public var draftCnt:int;
      
      public var arrDraftMap:Vector.<ChapterData>;
      
      public var publishedCnt:int;
      
      public var arrPublishedMap:Vector.<ChapterData>;
      
      public var m_ConfigData:DIYConfigData;
      
      public var m_iDraftsLot:int;
      
      public var m_iPublishsLot:int;
      
      public var dictStoreUnlock:Dictionary;
      
      public var arrMapList:Vector.<ChapterData>;
      
      public var dictPlayerMapInfo:Dictionary;
      
      public var tableCnt:int;
      
      public var arrTableList:Vector.<TableInfoData>;
      
      public var m_vDictMonsterBlood:Vector.<Dictionary>;
      
      public var m_vDictMonsterBlood1:Vector.<Dictionary>;
      
      public var m_iCurrentTablePage:int;
      
      public var m_iCurrentTableIndex:int;
      
      public var m_iCurrentTableId:int;
      
      public var m_iSelectBoss:int = 0;
      
      public var m_iBossType:int = 0;
      
      public var enterPwd:String;
      
      public var m_vCardIn:Vector.<Vector.<int>>;
      
      public var m_vBarrierIn:Vector.<Vector.<int>>;
      
      public var m_dictImageData:Dictionary;
      
      public var m_iSelectedSceneIndex:int;
      
      public var m_iSelectedMonsterIndex:int;
      
      public var m_iSelectedBossIndex:int;
      
      public var m_iSelectedWaveIndex:int;
      
      public var m_bMonsterChange:Boolean;
      
      public var m_iCurrentMapID:int;
      
      public var m_stRole:a_4463;
      
      public var m_stCurrentChapterData:ChapterData;
      
      public var m_vWaveInfo:Vector.<WaveData>;
      
      public var m_bWaveFlag:Vector.<ByteArray>;
      
      public var m_bMonsterOnHand:Boolean;
      
      public var m_bEditPanelShow:Boolean;
      
      public var m_sMosnterUrlOnHand:String;
      
      public var m_iChatFlag:int;
      
      public var pStage:Stage;
      
      public var m_iCurrentRankType:int = 20;
      
      public var m_iMapCount:int = 0;
      
      public var m_iSelectType:int = 1;
      
      public var m_iSelectCardOrBarrier:int = -1;
      
      private var m_stHallLandInfoBinary:ByteArray;
      
      public function DiyHandler()
      {
         super();
         this.m_ConfigData = DIYConfigData.Get();
         a_1789.getInstance().addEventListener(EventType.DIY_GET_SELF_MAP,this.OnCResponseDiyGetSelfMap);
         a_1789.getInstance().addEventListener(EventType.DIY_STORE_INFO,this.OnCResponseGetDiyStoreInfo);
         a_1789.getInstance().addEventListener(EventType.DIY_CREATE_MAP,this.OnCResponseDiyCreateMap);
         a_1789.getInstance().addEventListener(EventType.DIY_GET_MAP_INFO,this.OnCResponseDiyGetMapInfo);
         a_1789.getInstance().addEventListener(EventType.DIY_UPDATE_MAP_INFO,this.OnCResponseDiyUpdateMapInfo);
         a_1789.getInstance().addEventListener(EventType.DIY_GET_MAP_WAVE_INFO,this.OnCResponseDiyGetMapWaveInfo);
         a_1789.getInstance().addEventListener(EventType.DIY_UPDATE_MAP_WAVE_INFO,this.OnCResponseDiyUpdateMapWaveInfo);
         a_1789.getInstance().addEventListener(EventType.DIY_PUBLISH_MAP,this.CResponseDiyPublishMap);
         a_1789.getInstance().addEventListener(EventType.DIY_DEL_MAP,this.OnCResponseDiyDelMap);
         a_1789.getInstance().addEventListener(EventType.DIY_GET_MAP_LIST,this.OnCResponseDiyGetMapList);
         a_1789.getInstance().addEventListener(EventType.DIY_GET_PLAYER_MAP_DATA,this.CResponseGetDiyPlayerMapData);
         a_1789.getInstance().addEventListener(EventType.DIY_ROOM_LIST,this.OnCResponseDiyRoomList);
         a_1789.getInstance().addEventListener(EventType.Diy_SitDown_Success,this.OnSitDown);
         a_1789.getInstance().addEventListener(EventType.NOTIFY_DIY_ROOM_STATE,this.NotifyDiyRoomState);
         a_1789.getInstance().addEventListener(EventType.CROSS_GET_TABLE_INFO,this.OnCResponseCrossGetTableInfo);
         a_1789.getInstance().addEventListener(EventType.NOTIFY_DIY_ROOM_INFO_LIST,this.NotifyDiyRoomInfoList);
         a_1789.getInstance().addEventListener(EventType.Diy_SitDown_Failed,this.a_2547);
         a_1789.getInstance().addEventListener(EventType.DIY_APPRAISE_MAP,this.OnCCSResponseAppraiseDIYMap);
         a_1789.getInstance().addEventListener(EventType.DIY_GET_COIN,this.OnCCSResponseReceiveDIYCoin);
         a_1789.getInstance().addEventListener(EventType.DIY_GET_MAP_LAND_FORM,this.OnCCSResponseGetMapLandForm);
         a_1789.getInstance().addEventListener(EventType.DIY_UPDATE_MAP_LAND_FORM,this.OnCCSResponseUpdateMapLandForm);
         a_1789.getInstance().addEventListener(EventType.DIY_NOTIFY_MAP_LAND_FORM,this.OnCCSResponseNotifyDIYCoin);
         this.m_stHallLandInfoBinary = new ByteArray();
      }
      
      public static function GetInstance() : DiyHandler
      {
         if(null == m_stDiyHandler)
         {
            m_stDiyHandler = new DiyHandler();
            m_stDiyHandler.Load();
         }
         return m_stDiyHandler;
      }
      
      public function get dictImage() : Dictionary
      {
         if(this.m_dictImageData == null)
         {
            this.m_dictImageData = new Dictionary();
         }
         return this.m_dictImageData;
      }
      
      public function SetSelectedSceneIndex(index:int) : void
      {
         this.m_iSelectedSceneIndex = index;
      }
      
      public function SetSelectedMonsterIndex(index:int) : void
      {
         this.m_iSelectedMonsterIndex = index;
         this.updateBlood();
      }
      
      public function SetSelectedBossIndex(index:int) : void
      {
         this.m_iSelectedBossIndex = index;
         this.updateBlood();
      }
      
      public function SetSelectedWaveIndex(index:int) : void
      {
         this.m_iSelectedWaveIndex = index;
      }
      
      public function SetCurrentEditMapID(iMapID:int) : void
      {
         this.m_iCurrentMapID = iMapID;
      }
      
      public function OnSetScene() : void
      {
         var j:int = 0;
         for(var i:int = 0; i < this.ROW; i++)
         {
            for(j = 0; j < this.COL; j++)
            {
               this.m_vBarrierIn[i][j] = 0;
               this.m_vCardIn[i][j] = 0;
            }
         }
         this.ProduceMapLandInfoData();
      }
      
      public function OnCCSResponseNotifyDIYCoin(e:CommonEvent) : void
      {
         var i:int = 0;
         var iNum:int = 0;
         var arr:Array = null;
         var j:int = 0;
         var iRow:int = 0;
         var iCol:int = 0;
         var iValue:int = 0;
         var obj:Object = null;
         if(e.Data.m_nResultID == 0)
         {
            for(i = 0; i < this.ROW; i++)
            {
               for(j = 0; j < this.COL; j++)
               {
                  this.m_vBarrierIn[i][j] = 0;
                  this.m_vCardIn[i][j] = 0;
               }
            }
            e.Data.m_szData.position = 0;
            if(e.Data.m_iDataSize <= 1)
            {
               if(this.updateLandform != null)
               {
                  this.updateLandform();
               }
               this.m_stHallLandInfoBinary = this.EncodeLandToBinary();
               return;
            }
            iNum = int(e.Data.m_szData.readByte());
            arr = [];
            for(i = 0; i < iNum; i++)
            {
               iRow = int(e.Data.m_szData.readByte());
               iCol = int(e.Data.m_szData.readByte());
               iValue = int(e.Data.m_szData.readInt());
               if(iValue < 1000)
               {
                  this.m_vBarrierIn[iRow][iCol] = iValue;
                  obj = {};
                  obj.x = iCol;
                  obj.y = iRow;
                  obj.value = iValue;
                  arr.push(obj);
               }
               else
               {
                  this.m_vCardIn[iRow][iCol] = iValue;
               }
            }
            this.m_ConfigData.m_iCurrentMapID = e.Data.m_iMapID;
            this.m_ConfigData.m_arrBarrir = arr;
            if(this.updateLandform != null)
            {
               this.updateLandform();
            }
            this.m_stHallLandInfoBinary = this.EncodeLandToBinary();
         }
      }
      
      public function OnCCSResponseUpdateMapLandForm(e:CommonEvent) : void
      {
         MessageTipHandler.Get().a_3146("地图信息更新成功");
         this.updateLandform();
      }
      
      public function OnCCSResponseGetMapLandForm(e:CommonEvent) : void
      {
         var i:int = 0;
         var iNum:int = 0;
         var j:int = 0;
         var iRow:int = 0;
         var iCol:int = 0;
         var iValue:int = 0;
         if(e.Data.m_nResultID == 0)
         {
            for(i = 0; i < this.ROW; i++)
            {
               for(j = 0; j < this.COL; j++)
               {
                  this.m_vBarrierIn[i][j] = 0;
                  this.m_vCardIn[i][j] = 0;
               }
            }
            e.Data.m_szData.position = 0;
            if(e.Data.m_iDataSize <= 1)
            {
               this.updateLandform();
               this.m_stHallLandInfoBinary = this.EncodeLandToBinary();
               return;
            }
            iNum = int(e.Data.m_szData.readByte());
            for(i = 0; i < iNum; i++)
            {
               iRow = int(e.Data.m_szData.readByte());
               iCol = int(e.Data.m_szData.readByte());
               iValue = int(e.Data.m_szData.readInt());
               if(iValue < 1000)
               {
                  this.m_vBarrierIn[iRow][iCol] = iValue;
               }
               else
               {
                  this.m_vCardIn[iRow][iCol] = iValue;
               }
            }
            this.updateLandform();
            this.m_stHallLandInfoBinary = this.EncodeLandToBinary();
         }
      }
      
      public function a_1797() : void
      {
         this.enterPwd = "";
         this.checkLotId();
         this.m_iDraftsLot = this.m_ConfigData.m_iDraftsLot;
         this.m_iPublishsLot = this.m_ConfigData.m_iPublishsLot;
         var i:int = 0;
         var j:int = 0;
         this.m_vCardIn = new Vector.<Vector.<int>>();
         this.m_vBarrierIn = new Vector.<Vector.<int>>();
         for(i = 0; i < this.ROW; i++)
         {
            this.m_vCardIn.push(new Vector.<int>());
            this.m_vBarrierIn.push(new Vector.<int>());
            for(j = 0; j < this.COL; j++)
            {
               this.m_vCardIn[i].push(0);
               this.m_vBarrierIn[i].push(0);
            }
         }
         this.draftCnt = 0;
         this.arrDraftMap = new Vector.<ChapterData>();
         for(i = 0; i < 20; i++)
         {
            this.arrDraftMap.push(new ChapterData());
         }
         this.publishedCnt = 0;
         this.arrPublishedMap = new Vector.<ChapterData>();
         for(i = 0; i < 20; i++)
         {
            this.arrPublishedMap.push(new ChapterData());
         }
         this.dictStoreUnlock = new Dictionary();
         this.dictPlayerMapInfo = new Dictionary();
         this.m_stCurrentChapterData = new ChapterData();
         this.arrMapList = new Vector.<ChapterData>();
         for(j = 0; j < 30; j++)
         {
            this.arrMapList.push(new ChapterData());
         }
         this.tableCnt = 0;
         this.arrTableList = new Vector.<TableInfoData>();
         for(i = 0; i < 32; i++)
         {
            this.arrTableList.push(new TableInfoData());
            this.arrTableList[i].isShow = false;
         }
         this.m_vWaveInfo = new Vector.<WaveData>();
         this.m_bWaveFlag = new Vector.<ByteArray>();
         for(i = 0; i < 30; i++)
         {
            this.m_vWaveInfo.push(new WaveData());
            this.m_bWaveFlag.push(null);
         }
         this.m_stRole = a_2161.e.GetCurrentRole() as a_4463;
         this.m_dictImageData = new Dictionary();
         this.m_vDictMonsterBlood = new Vector.<Dictionary>();
         this.m_vDictMonsterBlood.length = 0;
         for(i = 0; i < 30; i++)
         {
            this.m_vDictMonsterBlood.push(new Dictionary());
         }
         this.m_vDictMonsterBlood1 = new Vector.<Dictionary>();
         this.m_vDictMonsterBlood1.length = 0;
         for(i = 0; i < 30; i++)
         {
            this.m_vDictMonsterBlood1.push(new Dictionary());
         }
      }
      
      private function checkLotId() : void
      {
         for(var i:int = 0; i < this.m_ConfigData.m_vShopData.length; i++)
         {
            if(this.m_ConfigData.m_vShopData[i].iType == 1)
            {
               DRAFT_LOT_ID = this.m_ConfigData.m_vShopData[i].iShopID;
            }
            if(this.m_ConfigData.m_vShopData[i].iType == 2)
            {
               PUBLISH_LOT_ID = this.m_ConfigData.m_vShopData[i].iShopID;
            }
         }
      }
      
      public function CreateTable(iMapID:int, strPassword:String) : void
      {
         (a_1825.e.GetTDLobbyLogic() as b_176).a_2485(-1,-1,-1,0,"跨服竞技uin:" + this.m_stRole.m_iRoleUin,strPassword,[iMapID],a_1748.enmGameMode_vComputer | 0x010000);
      }
      
      public function QuickJoinByMapId(iMapId:int) : void
      {
         (a_1825.e.GetTDLobbyLogic() as b_176).a_2485(-1,-1,-3,0,"跨服竞技uin:" + this.m_stRole.m_iRoleUin,"",[iMapId],a_1748.enmGameMode_vComputer | 0x010000);
      }
      
      public function EnterTable(roomId:int, iMapID:int, strPassword:String) : void
      {
         (a_1825.e.GetTDLobbyLogic() as b_176).a_2485(-1,-1,roomId,-1,"跨服竞技uin:" + this.m_stRole.m_iRoleUin,strPassword,[iMapID],a_1748.enmGameMode_vComputer | 0x010000);
      }
      
      public function QuickJoinTable() : void
      {
         var index:* = 0;
         if(this.randPool == null)
         {
            this.randPool = new Vector.<TableInfoData>();
         }
         this.randPool.length = 0;
         for(var i:int = 0; i < this.arrTableList.length; i++)
         {
            if(this.arrTableList[i].isShow && !this.arrTableList[i].m_bLock)
            {
               this.randPool.push(this.arrTableList[i]);
            }
         }
         if(this.randPool.length != 0)
         {
            index = int(Math.floor(Math.random() * this.randPool.length));
            if(index == this.randPool.length)
            {
               index--;
            }
            this.EnterTable(this.randPool[index].m_iRoomID,this.randPool[index].m_iMapID,"");
         }
      }
      
      public function EnterTableByTableId(tableId:int, pwd:String = "") : void
      {
         this.enterPwd = pwd;
         a_4657.getInstance().execute("OnCRequestCrossGetTableInfo",this,tableId);
      }
      
      private function OnCResponseCrossGetTableInfo(e:CommonEvent) : void
      {
         var roomId:int = 0;
         var mapId:int = 0;
         if(e.Data.m_nResultID == 0)
         {
            roomId = int(e.Data.m_iTableID);
            mapId = int(e.Data.m_iMapID);
            this.EnterTable(roomId,mapId,this.enterPwd);
         }
      }
      
      public function OnCRequestDiyGetSelfMap(iType:int, iFrom:int, iNum:int) : void
      {
         a_4657.getInstance().execute("OnCRequestDiyGetSelfMap",this,this.m_stRole.m_iRoleUin,iType,iFrom,iNum);
      }
      
      public function OnCRequestGetDiyStoreInfo(iId:int = -1) : void
      {
         a_4657.getInstance().execute("OnCRequestGetDiyStoreInfo",this,this.m_stRole.m_iRoleUin,iId);
      }
      
      public function OnCRequestDiyCreateMap(iMapId:int = 0) : void
      {
         a_4657.getInstance().execute("OnCRequestDiyCreateMap",this,this.m_stRole.m_iRoleUin,iMapId);
      }
      
      public function OnCRequestDiyGetMapInfo(iMapId:int = -1) : void
      {
         if(iMapId < 0)
         {
            iMapId = this.m_iCurrentMapID;
         }
         a_4657.getInstance().execute("OnCRequestDiyGetMapInfo",this,this.m_stRole.m_iRoleUin,iMapId);
      }
      
      public function OnCRequestDiyUpdateMapInfo(obj:Object) : void
      {
         a_4657.getInstance().execute("OnCRequestDiyUpdateMapInfo",this,this.m_stRole.m_iRoleUin,this.m_iCurrentMapID,obj);
      }
      
      public function OnCRequestDiyGetMapWave() : void
      {
         if(this.m_bWaveFlag[this.m_iSelectedWaveIndex] == null)
         {
            a_4657.getInstance().execute("OnCRequestDiyGetMapWave",this,this.m_stRole.m_iRoleUin,this.m_iCurrentMapID,this.m_iSelectedWaveIndex,0);
         }
         else
         {
            this.updateTimeLine();
            this.updateEditorUI();
            this.OnUpdateBossIndex();
            this.updateBlood();
         }
      }
      
      public function OnCRequestUpdateDiyTerrain(m_iDataSize:int, m_ByteData:ByteArray) : void
      {
         a_4657.getInstance().execute("OnCRequestUpdateDiyTerrain",this,this.m_stRole.m_iRoleUin,this.m_iCurrentMapID,m_iDataSize,m_ByteData);
      }
      
      public function OnCRequestGetDiyTerrain() : void
      {
         a_4657.getInstance().execute("OnCRequestGetDiyTerrain",this,this.m_stRole.m_iRoleUin,this.m_iCurrentMapID,0);
      }
      
      public function OnCRequestDiyUpdateMapWave(m_iDataSize:int, m_ByteData:ByteArray) : void
      {
         a_4657.getInstance().execute("OnCRequestDiyUpdateMapWave",this,this.m_stRole.m_iRoleUin,this.m_iCurrentMapID,this.m_iSelectedWaveIndex,m_iDataSize,m_ByteData);
      }
      
      public function OnCRequestDiyPublishMap() : void
      {
         a_4657.getInstance().execute("OnCRequestDiyPublishMap",this,this.m_stRole.m_iRoleUin,this.m_stCurrentChapterData.m_iMapID,this.m_stCurrentChapterData.m_szName,this.m_stCurrentChapterData.m_szDesc);
      }
      
      public function OnCRequestDiyDelMap(iMapId:int) : void
      {
         a_4657.getInstance().execute("OnCRequestDiyDelMap",this,this.m_stRole.m_iRoleUin,iMapId);
      }
      
      public function OnCRequestDiyGetMapList(iType:int, szSearch:String = "") : void
      {
         a_4657.getInstance().execute("OnCRequestDiyGetMapList",this,this.m_stRole.m_iRoleUin,iType,szSearch);
      }
      
      public function OnCRequestGetDiyPlayerMapData(vMapId:Vector.<int>) : void
      {
         a_4657.getInstance().execute("OnCRequestGetDiyPlayerMapData",this,this.m_stRole.m_iRoleUin,vMapId);
      }
      
      public function OnCRequestDiyRoomList() : void
      {
         a_4657.getInstance().execute("OnCRequestCrossRoomList",this,this.m_stRole.m_iRoleUin,27,5,0);
      }
      
      public function OnCCSRequestAppraiseDIYMap(iMapID:int, iOpt:int) : void
      {
         a_4657.getInstance().execute("OnCCSRequestAppraiseDIYMap",this,this.m_stRole.m_iRoleUin,iMapID,iOpt);
      }
      
      public function OnCCSRequestReceiveDIYCoin(iMapID:int) : void
      {
         a_4657.getInstance().execute("OnCCSRequestReceiveDIYCoin",this,this.m_stRole.m_iRoleUin,iMapID);
      }
      
      private function OnCResponseDiyGetSelfMap(e:CommonEvent) : void
      {
         var iFrom:int = 0;
         var i:int = 0;
         if(e.Data.m_nResultID == 0)
         {
            iFrom = int(e.Data.m_iFrom);
            if(e.Data.m_iType == 1)
            {
               this.draftCnt = e.Data.m_iCount;
               for(i = 0; i < this.draftCnt; i++)
               {
                  this.arrDraftMap[iFrom + i].m_iMapID = e.Data.m_astSampleMapInfo[i].m_iMapID;
                  this.arrDraftMap[iFrom + i].a_1119 = e.Data.m_astSampleMapInfo[i].a_1119;
                  this.arrDraftMap[iFrom + i].m_iMaxCardStar = e.Data.m_astSampleMapInfo[i].m_iMaxCardStar;
                  this.arrDraftMap[iFrom + i].m_iFireNum = e.Data.m_astSampleMapInfo[i].m_iFireNum;
                  this.arrDraftMap[iFrom + i].m_iMouseLevel = e.Data.m_astSampleMapInfo[i].m_iMouseLevel;
                  this.arrDraftMap[iFrom + i].m_iScenes = e.Data.m_astSampleMapInfo[i].m_iScenes;
                  this.arrDraftMap[iFrom + i].m_bIsPassTest = e.Data.m_astSampleMapInfo[i].m_bIsPassTest;
                  this.arrDraftMap[iFrom + i].m_iDraftDstID = e.Data.m_astSampleMapInfo[i].m_iDraftDstID;
                  this.arrDraftMap[iFrom + i].m_szName = e.Data.m_astSampleMapInfo[i].m_szName;
               }
            }
            if(e.Data.m_iType == 2)
            {
               this.publishedCnt = e.Data.m_iCount;
               for(i = 0; i < this.publishedCnt; i++)
               {
                  this.arrPublishedMap[iFrom + i].m_iMapID = e.Data.m_astSampleMapInfo[i].m_iMapID;
                  this.arrPublishedMap[iFrom + i].m_iScenes = e.Data.m_astSampleMapInfo[i].m_iScenes;
                  this.arrPublishedMap[iFrom + i].m_iPraise = e.Data.m_astSampleMapInfo[i].m_iPraise;
                  this.arrPublishedMap[iFrom + i].m_iTread = e.Data.m_astSampleMapInfo[i].m_iTread;
                  this.arrPublishedMap[iFrom + i].m_iTotalNum = e.Data.m_astSampleMapInfo[i].m_iTotalNum;
                  this.arrPublishedMap[iFrom + i].m_iTotalPassNum = e.Data.m_astSampleMapInfo[i].m_iTotalPassNum;
                  this.arrPublishedMap[iFrom + i].m_szName = e.Data.m_astSampleMapInfo[i].m_szName;
                  this.arrPublishedMap[iFrom + i].m_iDIYCoin = e.Data.m_astSampleMapInfo[i].m_iDIYB;
               }
            }
            if(this.updateMyChapterUI != null)
            {
               this.updateMyChapterUI();
            }
         }
      }
      
      private function OnCResponseGetDiyStoreInfo(e:CommonEvent) : void
      {
         var len:int = 0;
         var i:int = 0;
         var shopId:int = 0;
         if(e.Data.m_nResultID == 0)
         {
            len = int(e.Data.m_iDiyStoreInfoCnt);
            for(i = 0; i < len; i++)
            {
               shopId = int(e.Data.m_iDiyStoreInfo[i].m_iId);
               if(shopId == DRAFT_LOT_ID)
               {
                  this.m_iDraftsLot = this.m_ConfigData.m_iDraftsLot + e.Data.m_iDiyStoreInfo[i].m_iNum;
               }
               else if(shopId == PUBLISH_LOT_ID)
               {
                  this.m_iPublishsLot = this.m_ConfigData.m_iPublishsLot + e.Data.m_iDiyStoreInfo[i].m_iNum;
               }
               else
               {
                  this.dictStoreUnlock[e.Data.m_iDiyStoreInfo[i].m_iId] = e.Data.m_iDiyStoreInfo[i].m_iNum;
               }
            }
            if(this.updateMyChapterUI != null)
            {
               this.updateMyChapterUI();
            }
         }
      }
      
      private function OnCResponseDiyCreateMap(e:CommonEvent) : void
      {
         if(e.Data.m_nResultID == 0)
         {
            DiyHandler.GetInstance().SetCurrentEditMapID(e.Data.m_iMapID);
            this.OnCRequestDiyGetSelfMap(1,0,20);
         }
         else if(e.Data.m_nResultID == 1320)
         {
            MessageTipHandler.Get().a_3146("商店信息未拉取到");
         }
         else if(e.Data.m_nResultID == 1331)
         {
            MessageTipHandler.Get().a_3146("创建关卡时超过草稿上限");
         }
         else if(e.Data.m_nResultID == 1332)
         {
            MessageTipHandler.Get().a_3146("编辑已发布关卡时关卡已经在草稿中了");
         }
      }
      
      private function OnCResponseDiyGetMapInfo(e:CommonEvent) : void
      {
         var i:int = 0;
         var textTip:ITDMessageTip = null;
         if(e.Data.m_nResultID == 0)
         {
            this.m_stCurrentChapterData.m_iMapID = e.Data.m_iMapID;
            this.m_stCurrentChapterData.m_iDraftDstID = e.Data.m_iDraftDstID;
            this.m_stCurrentChapterData.m_bIsPassTest = e.Data.m_bIsPassTest;
            this.m_stCurrentChapterData.m_szName = e.Data.m_szName;
            this.m_stCurrentChapterData.m_szDesc = e.Data.m_szDesc;
            this.m_stCurrentChapterData.a_1119 = e.Data.a_1119;
            this.m_stCurrentChapterData.m_iReadyTime = e.Data.m_iReadyTime;
            this.m_stCurrentChapterData.m_iMaxCardStar = e.Data.m_iMaxCardStar;
            this.m_stCurrentChapterData.m_iTimeLimit = e.Data.m_iTimeLimit;
            this.m_stCurrentChapterData.m_bIsBanPet = e.Data.m_bIsBanPet;
            this.m_stCurrentChapterData.m_bIsDraft = e.Data.m_bIsDraft;
            this.m_stCurrentChapterData.m_bIsBanEquip = e.Data.m_bIsBanEquip;
            this.m_stCurrentChapterData.m_bPlayerLimit = e.Data.m_bPlayerLimit;
            this.m_stCurrentChapterData.m_iFireNum = e.Data.m_iFireNum;
            this.m_stCurrentChapterData.m_iMouseLevel = e.Data.m_iMouseLevel;
            this.m_stCurrentChapterData.m_iScenes = e.Data.m_iScenes;
            this.m_stCurrentChapterData.m_iPraise = e.Data.m_iPraise;
            this.m_stCurrentChapterData.m_iTread = e.Data.m_iTread;
            this.m_stCurrentChapterData.m_iTread = e.Data.m_iTread;
            this.m_stCurrentChapterData.m_iTotalNum = e.Data.m_iTotalNum;
            this.m_stCurrentChapterData.m_iTotalPassNum = e.Data.m_iTotalPassNum;
            this.m_stCurrentChapterData.m_szAuthorName = e.Data.m_szAuthorName;
            this.m_stCurrentChapterData.m_iPlatformID = e.Data.m_iAuthorPlatformID;
            this.m_stCurrentChapterData.m_iGroupID = e.Data.m_iAuthorGroupID;
            this.m_stCurrentChapterData.m_iGreatRank = e.Data.m_iGreatRank;
            this.m_iCurrentMapID = e.Data.m_iMapID;
            if(this.updateMyChapterUI != null)
            {
               PublishHintView.Get().updateView();
            }
            if(this.updateDiyLaboratoryUI != null)
            {
               this.updateDiyLaboratoryUI();
               MapDetailInfoView.Get().updateView();
            }
            this.m_vWaveInfo.length = 0;
            this.m_bWaveFlag.length = 0;
            for(i = 0; i < 30; i++)
            {
               this.m_vWaveInfo.push(new WaveData());
               this.m_bWaveFlag.push(null);
            }
            if(null != this.updateEditorUI)
            {
               this.updateEditorUI();
            }
         }
         else
         {
            textTip = a_2155.e.GetMessageTip() as ITDMessageTip;
            textTip.showTextTip(this.pStage,"没有拉取到关卡基础信息",new Rectangle(),0.2,30,1.5);
         }
      }
      
      private function OnCResponseDiyUpdateMapInfo(e:CommonEvent) : void
      {
         var textTip:ITDMessageTip = null;
         if(e.Data.m_nResultID == 0)
         {
            textTip = a_2155.e.GetMessageTip() as ITDMessageTip;
            textTip.showTextTip(this.pStage,"关卡基础信息已保存",new Rectangle(),0.2,30,1.5);
         }
      }
      
      private function OnUpdateBossIndex() : void
      {
         var k:* = 0;
         var stWaveData:WaveData = this.m_vWaveInfo[this.m_iSelectedWaveIndex];
         if(Boolean(stWaveData) && Boolean(stWaveData.szMapStep) && stWaveData.szMapStep.length > 0)
         {
            if(null != stWaveData.szMapStep[0].stStepBoss && stWaveData.szMapStep[0].stStepBoss.length > 0)
            {
               for(k = int(this.m_ConfigData.m_vBossData.length - 1); k >= 0; k--)
               {
                  if(this.m_ConfigData.m_vBossData[k].iBossID == stWaveData.szMapStep[0].stStepBoss[0].szStepBossID)
                  {
                     this.m_iSelectedBossIndex = k;
                     break;
                  }
               }
            }
         }
      }
      
      private function OnCResponseDiyGetMapWaveInfo(e:CommonEvent) : void
      {
         var stWaveData:WaveData = null;
         var iVersion:int = 0;
         var i:int = 0;
         var stMapStep:MapStepData = null;
         var j:int = 0;
         var stEnemy:EnemyStepData = null;
         var stBoss:BossStepData = null;
         var k:int = 0;
         if(e.Data.m_nResultID == 0)
         {
            stWaveData = this.m_vWaveInfo[this.m_iSelectedWaveIndex];
            stWaveData.szMapStep.length = 0;
            e.Data.m_szData.position = 0;
            if(e.Data.m_iDataSize <= 0)
            {
               this.updateTimeLine();
               this.updateEditorUI();
               this.updateBlood();
               return;
            }
            iVersion = int(e.Data.m_szData.readByte());
            stWaveData.iDelay = e.Data.m_szData.readInt();
            stWaveData.iSize = e.Data.m_szData.readInt();
            for(i = 0; i < stWaveData.iSize; i++)
            {
               stMapStep = new MapStepData();
               stMapStep.iDelayTime = e.Data.m_szData.readInt();
               stMapStep.iSize = e.Data.m_szData.readInt();
               for(j = 0; j < stMapStep.iSize; j++)
               {
                  stEnemy = new EnemyStepData();
                  stEnemy.iszEnemyID = e.Data.m_szData.readInt();
                  stEnemy.nDelayTime = e.Data.m_szData.readShort();
                  stEnemy.cRow = e.Data.m_szData.readByte();
                  stEnemy.iLife = e.Data.m_szData.readInt();
                  stMapStep.szMapEnmey.push(stEnemy);
                  this.m_vDictMonsterBlood[this.m_iSelectedWaveIndex][stEnemy.iszEnemyID] = stEnemy.iLife;
               }
               stMapStep.nCountDown = e.Data.m_szData.readInt();
               stMapStep.iTombHole = e.Data.m_szData.readInt();
               stMapStep.nNumStepBoss = e.Data.m_szData.readByte();
               for(j = 0; j < stMapStep.nNumStepBoss; j++)
               {
                  stBoss = new BossStepData();
                  stBoss.szStepBossID = e.Data.m_szData.readInt();
                  stBoss.iLife = e.Data.m_szData.readInt();
                  stMapStep.stStepBoss.push(stBoss);
                  if(j == 0)
                  {
                     this.m_vDictMonsterBlood[this.m_iSelectedWaveIndex][stBoss.szStepBossID] = stBoss.iLife;
                  }
                  else
                  {
                     this.m_vDictMonsterBlood1[this.m_iSelectedWaveIndex][stBoss.szStepBossID] = stBoss.iLife;
                  }
                  for(k = 0; k < this.m_ConfigData.m_vBossData.length; k++)
                  {
                     if(this.m_ConfigData.m_vBossData[k].iBossID == stMapStep.stStepBoss[0].szStepBossID)
                     {
                        this.m_iSelectedBossIndex = k;
                        break;
                     }
                  }
               }
               stMapStep.iStepBossEnemyLoopTime = e.Data.m_szData.readInt();
               stMapStep.cIgnoreType = e.Data.m_szData.readByte();
               stMapStep.m_stMouseLines.Decode(e.Data.m_szData,e.Data.m_cCodeVersion);
               stWaveData.szMapStep.push(stMapStep);
               this.m_bWaveFlag[this.m_iSelectedWaveIndex] = e.Data.m_szData;
            }
            this.updateTimeLine();
            this.updateEditorUI();
            this.updateBlood();
         }
      }
      
      private function OnCResponseDiyUpdateMapWaveInfo(e:CommonEvent) : void
      {
         var textTip:ITDMessageTip = null;
         if(e.Data.m_nResultID == 0)
         {
            textTip = a_2155.e.GetMessageTip() as ITDMessageTip;
            textTip.showTextTip(this.pStage,"关卡波次信息已保存",new Rectangle(),0.2,30,1.5);
         }
         else if(e.Data.m_nResultID == 1321)
         {
            MessageTipHandler.Get().a_3146("波结构解析失败");
         }
      }
      
      private function CResponseDiyPublishMap(e:CommonEvent) : void
      {
         var publishHint:PublishHintView = null;
         if(e.Data.m_nResultID == 0)
         {
            publishHint = PublishHintView.Get();
            if(publishHint.parent)
            {
               publishHint.parent.removeChild(publishHint);
            }
            this.OnCRequestDiyGetSelfMap(2,0,20);
            this.OnCRequestDiyGetSelfMap(1,0,20);
         }
         else if(e.Data.m_nResultID == 1320)
         {
            MessageTipHandler.Get().a_3146("商店信息未拉取到");
         }
         else if(e.Data.m_nResultID == 1335)
         {
            MessageTipHandler.Get().a_3146("发布槽位已满");
         }
         else if(e.Data.m_nResultID == 1336)
         {
            MessageTipHandler.Get().a_3146("关卡名字不合法");
         }
         else if(e.Data.m_nResultID == 1337)
         {
            MessageTipHandler.Get().a_3146("关卡描述不合法");
         }
         else
         {
            MessageTipHandler.Get().a_3146("错误ID" + e.Data.m_nResultID.toString());
         }
      }
      
      private function OnCResponseDiyDelMap(e:CommonEvent) : void
      {
         var normalSureView:NormalSureView = null;
         if(e.Data.m_nResultID == 0)
         {
            normalSureView = NormalSureView.GetView();
            if(normalSureView.parent)
            {
               normalSureView.parent.removeChild(normalSureView);
            }
            this.OnCRequestDiyGetSelfMap(1,0,20);
         }
      }
      
      private function OnCResponseDiyGetMapList(e:CommonEvent) : void
      {
         var vMapId:Vector.<int> = null;
         var iType:int = 0;
         var iCount:int = 0;
         var i:int = 0;
         var stSampleMapInfo:Object = null;
         if(e.Data.m_nResultID == 0)
         {
            vMapId = new Vector.<int>();
            iType = int(e.Data.m_iType);
            iCount = int(e.Data.m_iCount);
            this.m_iMapCount = iCount;
            if(this.m_iMapCount > 30)
            {
               this.m_iMapCount = 30;
            }
            if(iType != 0)
            {
               this.m_iCurrentRankType = iType;
            }
            i = 0;
            while(i < iCount && i < 30)
            {
               stSampleMapInfo = e.Data.m_astSampleMapInfo[i];
               this.arrMapList[i].m_iPlatformID = stSampleMapInfo.m_iPlatformID;
               this.arrMapList[i].m_iGroupID = stSampleMapInfo.m_iGroupID;
               this.arrMapList[i].m_szAuthorName = stSampleMapInfo.m_szAuthorName;
               this.arrMapList[i].m_iVersion = stSampleMapInfo.m_iVersion;
               this.arrMapList[i].m_iMapID = stSampleMapInfo.m_iMapID;
               this.arrMapList[i].m_szName = stSampleMapInfo.m_szName;
               this.arrMapList[i].m_iTotalNum = stSampleMapInfo.m_iTotalNum;
               this.arrMapList[i].m_iTotalPassNum = stSampleMapInfo.m_iTotalPassNum;
               this.arrMapList[i].m_iPraise = stSampleMapInfo.m_iPraise;
               this.arrMapList[i].m_iTread = stSampleMapInfo.m_iTread;
               this.arrMapList[i].m_iScenes = stSampleMapInfo.m_iScenes;
               this.arrMapList[i].m_iTimeLimit = stSampleMapInfo.m_iTimeLimit;
               this.arrMapList[i].m_iMouseLevel = stSampleMapInfo.m_iMouseLevel;
               this.arrMapList[i].a_1119 = stSampleMapInfo.a_1119;
               this.arrMapList[i].m_iMaxCardStar = stSampleMapInfo.m_iMaxCardStar;
               this.arrMapList[i].m_iHot = stSampleMapInfo.m_iHot;
               this.arrMapList[i].m_szDesc = stSampleMapInfo.m_sDesc;
               vMapId.push(this.arrMapList[i].m_iMapID);
               i++;
            }
            this.OnCRequestGetDiyPlayerMapData(vMapId);
         }
      }
      
      private function CResponseGetDiyPlayerMapData(e:CommonEvent) : void
      {
         var iCount:int = 0;
         var i:int = 0;
         var mapId:int = 0;
         if(e.Data.m_nResultID == 0)
         {
            iCount = int(e.Data.m_iMapCount);
            for(i = 0; i < iCount; i++)
            {
               mapId = int(e.Data.m_vDiyMapInfo[i].m_iMapID);
               this.dictPlayerMapInfo[mapId] = e.Data.m_vDiyMapInfo[i];
            }
            if(this.updateDiyLaboratoryUI != null)
            {
               this.updateDiyLaboratoryUI();
            }
         }
      }
      
      private function OnCResponseDiyRoomList(e:CommonEvent) : void
      {
         var iCount:int = 0;
         var i:int = 0;
         if(e.Data.m_nResultID == 0)
         {
            iCount = int(e.Data.m_iRoomCount);
            this.tableCnt = iCount;
            for(i = 0; i < iCount; i++)
            {
               this.arrTableList[i].m_bLock = e.Data.m_vRoomInfo[i].m_bLock;
               this.arrTableList[i].m_iCreateTime = e.Data.m_vRoomInfo[i].m_iCreateTime;
               this.arrTableList[i].m_iGameState = e.Data.m_vRoomInfo[i].m_iGameState;
               this.arrTableList[i].m_iGroupID = e.Data.m_vRoomInfo[i].m_iGroupID;
               this.arrTableList[i].m_iMapID = e.Data.m_vRoomInfo[i].m_iMapID;
               this.arrTableList[i].m_iPlatformID = e.Data.m_vRoomInfo[i].m_iPlatformID;
               this.arrTableList[i].m_iRoomID = e.Data.m_vRoomInfo[i].m_iRoomID;
               this.arrTableList[i].m_iTeamState = e.Data.m_vRoomInfo[i].m_iTeamState;
               this.arrTableList[i].m_strPassword = e.Data.m_vRoomInfo[i].m_strPassword;
               this.arrTableList[i].m_szMapName = e.Data.m_vRoomInfo[i].m_szMapName;
               this.arrTableList[i].m_szName = e.Data.m_vRoomInfo[i].m_szName;
               this.arrTableList[i].isShow = true;
            }
            if(this.updateDiyLaboratoryUI != null)
            {
               this.updateDiyLaboratoryUI();
            }
         }
      }
      
      private function OnSitDown(e:a_1778) : void
      {
         if(null != this.updateDiyLaboratoryUI)
         {
            if(MapDetailInfoView.Get().parent)
            {
               if(MapDetailInfoView.Get().parent.parent)
               {
                  MapDetailInfoView.Get().parent.parent.removeChild(MapDetailInfoView.Get().parent);
               }
               MapDetailInfoView.Get().parent.removeChild(MapDetailInfoView.Get());
            }
            if(Boolean(this.m_pDiyLaboratoryUI) && Boolean(this.m_pDiyLaboratoryUI.parent))
            {
               this.m_pDiyLaboratoryUI.parent.removeChild(this.m_pDiyLaboratoryUI);
            }
            if(Boolean(this.m_pMyChapterUI) && Boolean(this.m_pMyChapterUI.parent))
            {
               this.m_pMyChapterUI.parent.removeChild(this.m_pMyChapterUI);
            }
         }
         this.updateDiyLaboratoryUI();
      }
      
      private function a_2547(e:a_1778) : void
      {
         var tableId:int = 0;
         if(e.dataObject.m_nResultID == 2069)
         {
            tableId = int(e.dataObject.m_iTableID);
            this.updatePwdError(tableId);
         }
         else if(e.dataObject.m_nResultID == 2052)
         {
            MessageTipHandler.Get().a_3146("房间不存在");
         }
         else if(e.dataObject.m_nResultID == 2051)
         {
            MessageTipHandler.Get().a_3146("没有合适的房间");
         }
         else if(e.dataObject.m_nResultID == 1324)
         {
            MessageTipHandler.Get().a_3146("单个波次里没有老鼠");
         }
         else if(e.dataObject.m_nResultID == 1322)
         {
            MessageTipHandler.Get().a_3146("拉取关卡信息失败");
         }
         else if(e.dataObject.m_nResultID == 1323)
         {
            MessageTipHandler.Get().a_3146("拉取波次信息失败");
         }
         else if(e.dataObject.m_nResultID == 1325)
         {
            MessageTipHandler.Get().a_3146("玩家不在DIY区");
         }
         else if(e.dataObject.m_nResultID == 2054)
         {
            MessageTipHandler.Get().a_3146("游戏已开始");
         }
         else if(e.dataObject.m_nResultID == 2053)
         {
            MessageTipHandler.Get().a_3146("房间已满");
         }
         else
         {
            MessageTipHandler.Get().a_3146("未知的错误发生了：" + e.dataObject.m_nResultID);
         }
      }
      
      private function NotifyDiyRoomState(e:CommonEvent) : void
      {
         var i:int = 0;
         var j:int = 0;
         var tableId:int = 0;
         var gameState:int = 0;
         var teamState:int = 0;
         if(this.arrTableList == null)
         {
            return;
         }
         if(e.Data.m_nCount > 0)
         {
            for(i = 0; i < e.Data.m_nCount; i++)
            {
               j = 0;
               tableId = int(e.Data.m_vTableStatusInfo[i].m_iTableID);
               gameState = int(e.Data.m_vTableStatusInfo[i].m_iGameState);
               teamState = int(e.Data.m_vTableStatusInfo[i].m_iTeamState);
               if(gameState == 1)
               {
                  if(teamState % 4 * int(teamState / 4) == 0)
                  {
                     for(j = 0; j < this.arrTableList.length; j++)
                     {
                        if(tableId == this.arrTableList[j].m_iRoomID)
                        {
                           this.arrTableList[j].isShow = true;
                           this.arrTableList[j].m_iTeamState = teamState;
                           this.arrTableList[j].m_iGameState = gameState;
                           break;
                        }
                     }
                  }
                  else
                  {
                     if(tableId == this.m_iCurrentTableId)
                     {
                        this.m_iCurrentTableId = -1;
                        this.m_iCurrentTableIndex = -1;
                     }
                     for(j = 0; j < this.arrTableList.length; j++)
                     {
                        if(tableId == this.arrTableList[j].m_iRoomID)
                        {
                           this.arrTableList[j].isShow = false;
                           this.arrTableList[j].m_iTeamState = teamState;
                           this.arrTableList[j].m_iGameState = gameState;
                           break;
                        }
                     }
                  }
               }
               else
               {
                  if(tableId == this.m_iCurrentTableId)
                  {
                     this.m_iCurrentTableId = -1;
                     this.m_iCurrentTableIndex = -1;
                  }
                  for(j = 0; j < this.arrTableList.length; j++)
                  {
                     if(tableId == this.arrTableList[j].m_iRoomID)
                     {
                        this.arrTableList[j].isShow = false;
                        this.arrTableList[j].m_iTeamState = teamState;
                        this.arrTableList[j].m_iGameState = gameState;
                        break;
                     }
                  }
               }
            }
            if(this.updateDiyLaboratoryUI != null)
            {
               this.updateDiyLaboratoryUI(true);
            }
         }
      }
      
      private function NotifyDiyRoomInfoList(e:CommonEvent) : void
      {
         if(e.Data.m_nCount > 0)
         {
         }
      }
      
      private function OnCCSResponseReceiveDIYCoin(e:CommonEvent) : void
      {
         if(e.Data.m_nResultID == 0)
         {
            MessageTipHandler.Get().a_3146("领取成功");
         }
      }
      
      private function OnCCSResponseAppraiseDIYMap(e:CommonEvent) : void
      {
         if(e.Data.m_nResultID == 0)
         {
         }
      }
      
      public function ProduceMapInfoData() : void
      {
         var requestObj:Object = {};
         requestObj.m_sName = this.m_stCurrentChapterData.m_szName;
         requestObj.m_sDesc = this.m_stCurrentChapterData.m_szDesc;
         requestObj.a_1119 = this.m_stCurrentChapterData.a_1119;
         requestObj.m_iReadyTime = this.m_stCurrentChapterData.m_iReadyTime;
         requestObj.m_iMaxCardStar = this.m_stCurrentChapterData.m_iMaxCardStar;
         requestObj.m_iTimeLimit = this.m_stCurrentChapterData.m_iTimeLimit;
         requestObj.m_bIsBanPet = this.m_stCurrentChapterData.m_bIsBanPet;
         requestObj.m_bIsBanEquip = this.m_stCurrentChapterData.m_bIsBanEquip;
         requestObj.m_bPlayerLimit = this.m_stCurrentChapterData.m_bPlayerLimit;
         requestObj.m_iFireNum = this.m_stCurrentChapterData.m_iFireNum;
         requestObj.m_iMouseLevel = this.m_stCurrentChapterData.m_iMouseLevel;
         requestObj.m_iScenes = this.m_stCurrentChapterData.m_iScenes;
         for(var i:int = int(requestObj.a_1119); i < 30; i++)
         {
            this.m_vWaveInfo[i].iDelay = 0;
            this.m_vWaveInfo[i].iSize = 0;
            this.m_vWaveInfo[i].szMapStep.length = 0;
            this.m_bWaveFlag[this.m_iSelectedWaveIndex] = null;
         }
         this.updateEditorUI();
         this.OnCRequestDiyUpdateMapInfo(requestObj);
      }
      
      public function ProduceMapWaveInfoData() : void
      {
         var str:ByteArray = this.DecodeWaveToBinary();
         if(!this.EqualByteArray(str,this.m_bWaveFlag[this.m_iSelectedWaveIndex]))
         {
            this.m_bWaveFlag[this.m_iSelectedWaveIndex] = str;
            this.OnCRequestDiyUpdateMapWave(str.length,str);
         }
      }
      
      public function ProduceMapLandInfoData() : void
      {
         var str:ByteArray = this.EncodeLandToBinary();
         if(!this.EqualByteArray(str,this.m_stHallLandInfoBinary))
         {
            this.m_stHallLandInfoBinary = str;
            this.OnCRequestUpdateDiyTerrain(str.length,str);
         }
      }
      
      public function EqualByteArray(a:ByteArray, b:ByteArray) : Boolean
      {
         var last:int = 0;
         if(!a || !b)
         {
            return false;
         }
         if(a.length != b.length)
         {
            return false;
         }
         a.position = b.position = 0;
         var posA:int = int(a.position);
         var posB:int = int(b.position);
         var result:Boolean = true;
         a.position = b.position = 0;
         while(a.bytesAvailable >= 4)
         {
            if(a.readUnsignedInt() != b.readUnsignedInt())
            {
               result = false;
               break;
            }
         }
         if(result && a.bytesAvailable != 0)
         {
            last = int(a.bytesAvailable);
            result = last == 1 ? a.readByte() == b.readByte() : (last == 2 ? a.readShort() == b.readShort() : (last == 3 ? a.readShort() == b.readShort() && a.readByte() == b.readByte() : true));
         }
         a.position = posA;
         b.position = posB;
         return result;
      }
      
      public function DecodeWaveToBinary() : ByteArray
      {
         var stMapStep:MapStepData = null;
         var j:int = 0;
         var stEnemy:EnemyStepData = null;
         var stBoss:BossStepData = null;
         var ret:ByteArray = new ByteArray();
         var stWaveData:WaveData = this.m_vWaveInfo[this.m_iSelectedWaveIndex];
         ret.writeByte(0);
         ret.writeInt(stWaveData.iDelay);
         ret.writeInt(stWaveData.iSize);
         for(var i:int = 0; i < stWaveData.iSize; i++)
         {
            stMapStep = stWaveData.szMapStep[i];
            ret.writeInt(stMapStep.iDelayTime);
            ret.writeInt(stMapStep.iSize);
            for(j = 0; j < stMapStep.szMapEnmey.length; j++)
            {
               stEnemy = stMapStep.szMapEnmey[j];
               ret.writeInt(stEnemy.iszEnemyID);
               ret.writeShort(stEnemy.nDelayTime);
               ret.writeByte(stEnemy.cRow);
               ret.writeInt(stEnemy.iLife);
            }
            ret.writeInt(stMapStep.nCountDown);
            ret.writeInt(stMapStep.iTombHole);
            ret.writeByte(stMapStep.nNumStepBoss);
            for(j = 0; j < stMapStep.nNumStepBoss; j++)
            {
               stBoss = stMapStep.stStepBoss[j];
               ret.writeInt(stBoss.szStepBossID);
               ret.writeInt(stBoss.iLife);
            }
            ret.writeInt(stMapStep.iStepBossEnemyLoopTime);
            ret.writeByte(stMapStep.cIgnoreType);
            stMapStep.m_stMouseLines.Encode(ret);
         }
         return ret;
      }
      
      public function EncodeLandToBinary() : ByteArray
      {
         var j:int = 0;
         var ret:ByteArray = new ByteArray();
         var long:int = 0;
         for(var i:int = 0; i < this.ROW; i++)
         {
            for(j = 0; j < this.COL; j++)
            {
               if(this.m_vBarrierIn[i][j] != 0)
               {
                  long += 1;
               }
               if(this.m_vCardIn[i][j] != 0)
               {
                  long += 1;
               }
            }
         }
         ret.writeByte(long);
         for(i = 0; i < this.ROW; i++)
         {
            for(j = 0; j < this.COL; j++)
            {
               if(this.m_vBarrierIn[i][j] != 0)
               {
                  ret.writeByte(i);
                  ret.writeByte(j);
                  ret.writeInt(this.m_vBarrierIn[i][j]);
               }
            }
         }
         for(i = 0; i < this.ROW; i++)
         {
            for(j = 0; j < this.COL; j++)
            {
               if(this.m_vCardIn[i][j] != 0)
               {
                  ret.writeByte(i);
                  ret.writeByte(j);
                  ret.writeInt(this.m_vCardIn[i][j]);
               }
            }
         }
         return ret;
      }
      
      public function DecodeLandToBinary() : void
      {
      }
      
      private function Load() : void
      {
         var loader:AssetsLoader = new AssetsLoader();
         var dict:Dictionary = new Dictionary();
         dict["cross"] = new AssetsItemData("./config/cross.xml?t=" + VersionMD5.Get().GetVersion("config/cross.xml"),AssetType.TXT,"config/cross.xml");
         loader.load(dict,{"onComplete":this.loadedHandler});
      }
      
      private function loadedHandler(dict:Dictionary) : void
      {
         if(dict["config/cross.xml"] != null && dict["config/cross.xml"].data != null)
         {
            CrossXml.Get().Analy(new XML(dict["config/cross.xml"].data));
         }
      }
      
      public function ClearUp() : void
      {
         var j:int = 0;
         this.m_iSelectedSceneIndex = 0;
         this.m_iSelectedMonsterIndex = 0;
         this.m_iSelectedBossIndex = 0;
         this.m_iSelectedWaveIndex = 0;
         for(var i:int = 0; i < this.ROW; i++)
         {
            for(j = 0; j < this.COL; j++)
            {
               this.m_vBarrierIn[i][j] = 0;
               this.m_vCardIn[i][j] = 0;
            }
         }
      }
   }
}

