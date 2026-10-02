package com.aurora.ui.maogoutd.SummerExploreCamp.Control
{
   import a_4716.EnmMeiShiMatchTask;
   import a_4752.a_2037;
   import a_4754.a_2161;
   import com.aurora.ui.maogoutd.SummerExploreCamp.View.Diary.CBattleVO;
   import com.aurora.ui.maogoutd.component.a_3228;
   import com.aurora.ui.maogoutd.handbook.model.HandbookDataAward;
   import com.aurora.ui.maogoutd.role.a_4463;
   import flash.utils.Dictionary;
   
   public class ExploreDiaryConfig
   {
      
      private static var m_pInstance:ExploreDiaryConfig;
      
      public var m_LandCards:Dictionary;
      
      public var m_CardAward:Vector.<HandbookDataAward>;
      
      public var m_BattleAward:Vector.<HandbookDataAward>;
      
      public var m_BattleMapList:Array;
      
      public var m_stRole:a_4463;
      
      public var dictImage:Dictionary = new Dictionary();
      
      public var m_dicCardHave:Dictionary;
      
      public var m_nCompleteIsland:int;
      
      public var m_iAward:int;
      
      public var m_astAdvBattleRecord:Array;
      
      public var m_view:*;
      
      public var dicMapToValid:Dictionary;
      
      public var arrGameModeAchieves:Array;
      
      public var m_CSBackData:Array;
      
      public function ExploreDiaryConfig()
      {
         super();
         this.m_dicCardHave = new Dictionary();
         this.m_astAdvBattleRecord = new Array();
      }
      
      public static function Get() : ExploreDiaryConfig
      {
         if(!m_pInstance)
         {
            m_pInstance = new ExploreDiaryConfig();
         }
         return m_pInstance;
      }
      
      public function a_2040(xml:XML) : void
      {
         var TatalCount:int = 0;
         var temp:ExploreDiaryCardInfo = null;
         var cardArray:Array = null;
         var island:Object = null;
         var vAward:HandbookDataAward = null;
         var szMapID:int = 0;
         if(xml == null)
         {
            return;
         }
         this.m_LandCards = new Dictionary();
         var data:XML = null;
         var item:XML = null;
         for each(data in xml.cardhandbook.island)
         {
            island = new Object();
            island.landID = int(data.@land);
            island.desc = String(data.@desc);
            TatalCount = 0;
            cardArray = new Array();
            for each(item in data.item)
            {
               temp = new ExploreDiaryCardInfo();
               temp.m_iID = int(item.@id);
               temp.m_iItemID = int(item.@itemid);
               temp.m_iTranstype = int(item.@transtype);
               temp.m_iNum = int(item.@num);
               temp.m_iLevel = int(item.@level);
               temp.m_iTime = int(item.@time);
               temp.m_iIsBind = int(item.@isBind);
               temp.m_iName = String(item.@itemname);
               if(temp.m_iNum != 0)
               {
                  TatalCount++;
               }
               cardArray.push(temp);
            }
            island.cardArray = cardArray.concat();
            island.TatalCount = TatalCount;
            this.m_LandCards[island.landID] = island;
         }
         this.m_CardAward = new Vector.<HandbookDataAward>();
         this.m_BattleAward = new Vector.<HandbookDataAward>();
         for each(data in xml.award.item)
         {
            vAward = new HandbookDataAward();
            vAward.iID = int(data.@id);
            vAward.iItemID = int(data.@itemid);
            vAward.iAddValue = int(data.@addvalue);
            vAward.iAddExp = int(data.@addpveexp);
            vAward.iAddDroprate = int(data.@adddroprate);
            vAward.iAddProficiency = int(data.@addproficiency);
            vAward.iAddPvPExp = int(data.@addpvpexp);
            vAward.iIsBind = int(data.@isBind);
            vAward.iTime = int(data.@time);
            vAward.iNeedNum = int(data.@neednum);
            vAward.iType = int(data.@type);
            if(vAward.iType == 1)
            {
               this.m_CardAward.push(vAward);
            }
            else if(vAward.iType == 2)
            {
               this.m_BattleAward.push(vAward);
            }
         }
         this.m_BattleMapList = new Array();
         for each(data in xml.advhandbook.map)
         {
            szMapID = int(data.@id);
            this.m_BattleMapList.push(szMapID);
         }
      }
      
      public function Calculate() : void
      {
         var item:Object = null;
         var attr:a_3228 = null;
         var overState:Boolean = false;
         var i2:int = 0;
         var i:int = 0;
         var NowCount:int = 0;
         var i4:int = 0;
         var TypeValue:int = 0;
         var j:int = 0;
         var k:int = 0;
         this.m_dicCardHave = new Dictionary();
         this.m_stRole = a_2161.e.GetCurrentRole() as a_4463;
         var m_CurCards:Object = a_2161.e.GetTDCardsInfo();
         var allSate:int = 0;
         for each(item in this.m_LandCards)
         {
            overState = this.m_nCompleteIsland & 1 << item.landID - 1 ? true : false;
            if(overState)
            {
               for(i2 = 0; i2 < item.cardArray.length; i2++)
               {
                  item.cardArray[i2].m_hasCard = true;
               }
               item.NowCount = item.TatalCount;
            }
            else
            {
               for(i = 0; i < item.cardArray.length; i++)
               {
                  if(item.cardArray[i].m_iNum > 0)
                  {
                     TypeValue = -1;
                     for(j = 0; j < m_CurCards[0].length; j++)
                     {
                        attr = m_CurCards[0][j];
                        if(attr.CardID == item.cardArray[i].m_iItemID)
                        {
                           if(attr.TypeValue > TypeValue)
                           {
                              TypeValue = attr.TypeValue;
                              item.cardArray[i].m_cardAttr = attr;
                              this.m_dicCardHave[item.cardArray[i].m_iItemID.toString(16)] = true;
                              for(k = 1; k <= item.cardArray[i].m_iTranstype; k++)
                              {
                                 this.m_dicCardHave[item.cardArray[i - k].m_iItemID.toString(16)] = true;
                              }
                           }
                        }
                     }
                  }
               }
               NowCount = 0;
               for(i4 = 0; i4 < item.cardArray.length; i4++)
               {
                  item.cardArray[i4].m_hasCard = false;
                  if(item.cardArray[i4].m_iNum > 0 && Boolean(this.m_dicCardHave[item.cardArray[i4].m_iItemID.toString(16)]))
                  {
                     NowCount++;
                     item.cardArray[i4].m_hasCard = true;
                  }
               }
               item.NowCount = NowCount;
               trace("计算完毕...");
            }
            if(item.NowCount == item.TatalCount && item.TatalCount > 0)
            {
               allSate = 1 << item.landID - 1 | allSate;
            }
         }
         if(this.m_view != null)
         {
            if(allSate != this.m_nCompleteIsland)
            {
               trace("完成了需要向服务器发送请求");
               a_2161.e.RequestUpdateDiaryState(this.m_view.role.m_iRoleUin,3,allSate);
            }
            else
            {
               this.m_view.upDataView();
            }
         }
      }
      
      public function initAchieves() : void
      {
         var i:int = 0;
         var strMapIdvalid:String = null;
         var map:Object = null;
         var iGameMapID:int = 0;
         var achievements:CBattleVO = null;
         var j:int = 0;
         var dictMapMouse:Dictionary = a_2037.getInstance().m_dictMapMouse;
         if(this.arrGameModeAchieves == null)
         {
            this.arrGameModeAchieves = new Array();
            this.dicMapToValid = new Dictionary();
            for(i = 0; i < this.m_BattleMapList.length; i++)
            {
               strMapIdvalid = this.m_BattleMapList[i];
               map = dictMapMouse[strMapIdvalid];
               if(map != null)
               {
                  iGameMapID = int(map.iGameMapID);
                  if((iGameMapID & 0xF0) != 240 && map.iOpen == 1)
                  {
                     achievements = new CBattleVO();
                     achievements.m_iMapID = iGameMapID;
                     achievements.szMapName = map.szMapName;
                     achievements.m_cBestGrade = -1;
                     this.dicMapToValid[iGameMapID] = achievements;
                  }
                  this.arrGameModeAchieves.push(achievements);
               }
            }
         }
         this.m_CSBackData = this.arrGameModeAchieves.concat();
         for(var k:int = 0; k < this.m_astAdvBattleRecord.length; k++)
         {
            for(j = 0; j < this.m_CSBackData.length; j++)
            {
               if(this.m_astAdvBattleRecord[k].m_iMapID == this.m_CSBackData[j].m_iMapID)
               {
                  this.m_CSBackData[j].m_cBestGrade = this.m_astAdvBattleRecord[k].m_cBestGrade;
                  this.m_CSBackData[j].m_iBestScore = this.m_astAdvBattleRecord[k].m_iBestScore;
                  this.m_CSBackData[j].m_iBestScoreUsedTime = this.m_astAdvBattleRecord[k].m_iBestScoreUsedTime;
                  this.m_CSBackData[j].m_iBestScoreDestroyFromMouse = this.m_astAdvBattleRecord[k].m_iBestScoreDestroyFromMouse;
                  break;
               }
            }
         }
      }
      
      public function getErrorMessgaeByResultID(ResultID:int) : String
      {
         switch(ResultID)
         {
            case EnmMeiShiMatchTask.result_id_fail:
               return "未知错误，请重试！";
            case EnmMeiShiMatchTask.result_id_invalid_param:
               return "参数不匹配，请重试！";
            case EnmMeiShiMatchTask.result_id_system:
               return "系统错误！";
            case EnmMeiShiMatchTask.result_id_invalid_uin:
               return "无效的用户UIN！";
            case EnmMeiShiMatchTask.result_id_new_task_complete_repeat:
               return "奖励已经领取！";
            case 1130:
               return "为满足前置条件!";
            default:
               return "未知错误类型:" + ResultID + ", 请联系客服！";
         }
      }
   }
}

