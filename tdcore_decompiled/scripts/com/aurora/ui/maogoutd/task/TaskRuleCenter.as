package com.aurora.ui.maogoutd.task
{
   import a_4716.a_1728;
   import a_4720.a_1747;
   import a_4720.a_1748;
   import a_4720.a_1756;
   import a_4731.LocalTaskEvents;
   import a_4754.a_2161;
   import flash.utils.Dictionary;
   
   public class TaskRuleCenter
   {
      
      public static const MAIN_TASK_ID:uint = 16777216;
      
      public static const BRANCH_TASK_ID:uint = 33554432;
      
      public static const EVERYDAY_TASK_ID:uint = 50331648;
      
      public static const PARTY_TASK_ID:uint = 67108864;
      
      public static const ACTION_TASK_ID:uint = 83886080;
      
      public static const MAX_TASK_TYPE:uint = 5;
      
      public static const TASK_ID_MASKBIT:uint = 251658240;
      
      public static const Result_Ignore:uint = 0;
      
      public static const Result_Finish:uint = 1;
      
      public static const Result_Save:uint = 2;
      
      private static var ms_Grade_SSS:uint = 0;
      
      private static var ms_Grade_SS:uint = 1;
      
      private static var ms_Grade_S:uint = 2;
      
      private static var ms_Grade_A:uint = 3;
      
      private static var ms_Grade_B:uint = 4;
      
      private static var ms_Grade_C:uint = 5;
      
      private static var ms_Grade_D:uint = 6;
      
      private static var ms_Grade_E:uint = 7;
      
      private static var ms_Grade_F:uint = 8;
      
      public static var MapBit_SeLaDao_Lu:uint = 1;
      
      public static var MapBit_SeLaDao_Shui:uint = 2;
      
      public static var MapBit_XiangBing_Lu:uint = 4;
      
      public static var MapBit_XiangBing_Shui:uint = 8;
      
      public static var MapBit_BuDingDao:uint = 16;
      
      public static var MapBit_KeKeDao_Wu:uint = 32;
      
      public static var MapBit_KeKeDao_Shui:uint = 64;
      
      public static var MapBit_MusiDao:uint = 128;
      
      public static var MapBit_QuqiDao:uint = 256;
      
      public static var MapBit_BudingDao_Shui:uint = 512;
      
      public static var MapBit_BudingYe:uint = 1024;
      
      public static var MapBit_GaliRI:uint = 2048;
      
      public static var MapBit_Shendian:uint = 4096;
      
      public static var MapBit_Shenyuan:uint = 8192;
      
      public static var MapBit_MapCount:uint = 12;
      
      private static var MapBit_All:uint = MapBit_SeLaDao_Lu | MapBit_SeLaDao_Shui | MapBit_XiangBing_Lu | MapBit_XiangBing_Shui | MapBit_BuDingDao | MapBit_KeKeDao_Wu | MapBit_KeKeDao_Shui | MapBit_MusiDao | MapBit_QuqiDao | MapBit_BudingDao_Shui | MapBit_BudingYe | MapBit_GaliRI;
      
      private static var MapBit_All_Extra:uint = MapBit_All | MapBit_Shendian | MapBit_Shenyuan;
      
      public static var MapBit_JieMo_Ri:uint = 1;
      
      public static var MapBit_JieMo_Ye:uint = 2;
      
      public static var MapBit_BoHe_Ri:uint = 4;
      
      public static var MapBit_BoHe_Ye:uint = 8;
      
      public static var MapBit_ZhiShi:uint = 16;
      
      public static var MapBit_TanShao_Ri:uint = 32;
      
      public static var MapBit_TanShao_Ye:uint = 64;
      
      public static var MapBit_MoCha_Ri:uint = 128;
      
      public static var MapBit_MoCha_Ye:uint = 256;
      
      public static var MapBit_MaQiDuo:uint = 512;
      
      public static var MapBit_MianHuaTang_Ri:uint = 1024;
      
      public static var MapBit_MianHuaTang_Ye:uint = 2048;
      
      public static var MapBit_GuoJiang_Ri:uint = 4096;
      
      public static var MapBit_GuoJiang_Ye:uint = 8192;
      
      public static var MapBit_XueDing:uint = 16384;
      
      public static var MapBit2_MapCount:uint = 12;
      
      private static var MapBit2_All:uint = MapBit_JieMo_Ri | MapBit_JieMo_Ye | MapBit_BoHe_Ri | MapBit_BoHe_Ye | MapBit_TanShao_Ri | MapBit_TanShao_Ye | MapBit_MoCha_Ri | MapBit_MoCha_Ye | MapBit_MianHuaTang_Ri | MapBit_MianHuaTang_Ye | MapBit_GuoJiang_Ri | MapBit_GuoJiang_Ye;
      
      private static var MapBit2_All_Extra:uint = MapBit2_All | MapBit_ZhiShi | MapBit_MaQiDuo | MapBit_XueDing;
      
      public static var BUILD_AUCTION_ID:uint = 1;
      
      public static var BUILD_PASSGRADE_ID:uint = 2;
      
      public static var OPERATION_LOCAL_SIGN:uint = 1;
      
      public static var OPERATION_LOCAL_WISH:uint = 2;
      
      private static var MapBit_HuiXiang_Day:uint = 1;
      
      private static var MapBit_HuiXiang_Night:uint = 2;
      
      private static var MapBit_ZhiRan_Day:uint = 4;
      
      private static var MapBit_ZhiRan_Night:uint = 8;
      
      private static var MapBit_LuLiao:uint = 16;
      
      private static var MapBit_YueGui_Day:uint = 32;
      
      private static var MapBit_YueGui_Night:uint = 64;
      
      private static var MapBit_XiangYe_Day:uint = 128;
      
      private static var MapBit_XiangYe_Night:uint = 256;
      
      private static var MapBit_XiangLiao:uint = 512;
      
      private static var MapBit_HuaJiao_Day:uint = 1024;
      
      private static var MapBit_HuaJiao_Night:uint = 2048;
      
      private static var MapBit_DingXiang_Day:uint = 4096;
      
      private static var MapBit_DingXiang_Night:uint = 8192;
      
      private static var MapBit_ShiSanXiang:uint = 16384;
      
      private static var MapBit_SkyCaslte_MapCount:uint = 12;
      
      private static var MapBit_SkyCaslte_All:uint = MapBit_HuiXiang_Day | MapBit_HuiXiang_Night | MapBit_ZhiRan_Day | MapBit_ZhiRan_Night | MapBit_YueGui_Day | MapBit_YueGui_Night | MapBit_XiangYe_Day | MapBit_XiangYe_Night | MapBit_HuaJiao_Day | MapBit_HuaJiao_Night | MapBit_DingXiang_Day | MapBit_DingXiang_Night;
      
      private static var MapBit_SkyCaslte_All_Extra:uint = MapBit_SkyCaslte_All | MapBit_LuLiao | MapBit_XiangLiao | MapBit_ShiSanXiang;
      
      private static var MapBit_JinQiangYu_Day:uint = 1;
      
      private static var MapBit_ShanHu_Day:uint = 2;
      
      private static var MapBit_ShanHu_Night:uint = 4;
      
      private static var MapBit_BeiJiBei_Day:uint = 8;
      
      private static var MapBit_HaiKui_Day:uint = 16;
      
      private static var MapBit_HaiKui_Night:uint = 32;
      
      private static var MapBit_TianFuLuo_Night:uint = 64;
      
      private static var MapBit_SeafloorWhirlpool_MapCount:uint = 7;
      
      private static var MapBit_SeafloorWhirlpool_All:uint = MapBit_JinQiangYu_Day | MapBit_ShanHu_Day | MapBit_ShanHu_Night | MapBit_HaiKui_Day | MapBit_HaiKui_Night;
      
      private static var MapBit_SeafloorWhirlpool_All_Extra:uint = MapBit_SeafloorWhirlpool_All | MapBit_BeiJiBei_Day | MapBit_TianFuLuo_Night;
      
      private var m_pResult:Object;
      
      private var m_pTask:a_4517;
      
      private var m_uiOprate:uint;
      
      private var m_iCardID:int;
      
      private var m_iAdditinal:int;
      
      private var m_iAdditinal2:int;
      
      private var m_arrAchieves:Array;
      
      private var m_pExtraObject:Object;
      
      public function TaskRuleCenter()
      {
         super();
      }
      
      private function GetMapBitByMapID(mapID:int) : uint
      {
         switch(mapID)
         {
            case a_1747.enmGameMap_BuDingDao:
               return MapBit_BuDingDao;
            case a_1747.enmGameMap_KeKeDao_Shui:
               return MapBit_KeKeDao_Shui;
            case a_1747.enmGameMap_KeKeDao_Wu:
               return MapBit_KeKeDao_Wu;
            case a_1747.enmGameMap_SeLaDao_Lu:
               return MapBit_SeLaDao_Lu;
            case a_1747.enmGameMap_SelaDao_Shui:
               return MapBit_SeLaDao_Shui;
            case a_1747.enmGameMap_XiangBing_Lu:
               return MapBit_XiangBing_Lu;
            case a_1747.enmGameMap_XiangBing_Shui:
               return MapBit_XiangBing_Shui;
            case a_1747.enmGameMap_BuDingDao_Shui:
               return MapBit_BudingDao_Shui;
            case a_1747.enmGameMap_MuSiDao:
               return MapBit_MusiDao;
            case a_1747.enmGameMap_QuQiDao:
               return MapBit_QuqiDao;
            case a_1747.enmGameMap_Wujing1:
               return MapBit_Shenyuan;
            case a_1747.enmGameMap_ShenDian:
               return MapBit_Shendian;
            case a_1747.enmGameMap_GaliRi:
               return MapBit_GaliRI;
            case a_1747.enmGameMap_BudingYe:
               return MapBit_BudingYe;
            default:
               return MapBit_SeLaDao_Lu;
         }
      }
      
      private function GetMapBitByMapID2(mapID:int) : uint
      {
         switch(mapID)
         {
            case a_1747.enmGameMap_JieMo_Ri:
               return MapBit_JieMo_Ri;
            case a_1747.enmGameMap_JieMo_Ye:
               return MapBit_JieMo_Ye;
            case a_1747.enmGameMap_BoHe_Ri:
               return MapBit_BoHe_Ri;
            case a_1747.enmGameMap_BoHe_Ye:
               return MapBit_BoHe_Ye;
            case a_1747.enmGameMap_TanShao_Ri:
               return MapBit_TanShao_Ri;
            case a_1747.enmGameMap_TanShao_Ye:
               return MapBit_TanShao_Ye;
            case a_1747.enmGameMap_MoCha_Ri:
               return MapBit_MoCha_Ri;
            case a_1747.enmGameMap_MoCha_Ye:
               return MapBit_MoCha_Ye;
            case a_1747.enmGameMap_MianHuaTang_Ri:
               return MapBit_MianHuaTang_Ri;
            case a_1747.enmGameMap_MianHuaTang_Ye:
               return MapBit_MianHuaTang_Ye;
            case a_1747.enmGameMap_GuoJiang_Ri:
               return MapBit_GuoJiang_Ri;
            case a_1747.enmGameMap_GuoJiang_Ye:
               return MapBit_GuoJiang_Ye;
            case a_1747.enmGameMap_ZhiShi:
               return MapBit_ZhiShi;
            case a_1747.enmGameMap_MaQiDuo:
               return MapBit_MaQiDuo;
            case a_1747.enmGameMap_XueDing:
               return MapBit_XueDing;
            default:
               return 0;
         }
      }
      
      private function GetSkyCastleMapBitByMapID(mapID:int) : uint
      {
         switch(mapID)
         {
            case a_1747.enmGameMap_HuiXiang_Day:
               return MapBit_HuiXiang_Day;
            case a_1747.enmGameMap_HuiXiang_Night:
               return MapBit_HuiXiang_Night;
            case a_1747.enmGameMap_ZhiRan_Day:
               return MapBit_ZhiRan_Day;
            case a_1747.enmGameMap_ZhiRan_Night:
               return MapBit_ZhiRan_Night;
            case a_1747.enmGameMap_LuLiao:
               return MapBit_LuLiao;
            case a_1747.enmGameMap_YueGui_Day:
               return MapBit_YueGui_Day;
            case a_1747.enmGameMap_YueGui_Night:
               return MapBit_YueGui_Night;
            case a_1747.enmGameMap_XiangYe_Day:
               return MapBit_XiangYe_Day;
            case a_1747.enmGameMap_XiangYe_Night:
               return MapBit_XiangYe_Night;
            case a_1747.enmGameMap_XiangLiao:
               return MapBit_XiangLiao;
            case a_1747.enmGameMap_HuaJiao_Day:
               return MapBit_HuaJiao_Day;
            case a_1747.enmGameMap_HuaJiao_Night:
               return MapBit_HuaJiao_Night;
            case a_1747.enmGameMap_DingXiang_Day:
               return MapBit_DingXiang_Day;
            case a_1747.enmGameMap_DingXiang_Night:
               return MapBit_DingXiang_Night;
            case a_1747.enmGameMap_ShiSanXiang:
               return MapBit_ShiSanXiang;
            default:
               return 0;
         }
      }
      
      private function GetSeafloorWhirlpoolMapBitByMapID(mapID:int) : uint
      {
         switch(mapID)
         {
            case a_1747.enmGameMap_JinQiangYu_Day:
               return MapBit_JinQiangYu_Day;
            case a_1747.enmGameMap_ShanHu_Day:
               return MapBit_ShanHu_Day;
            case a_1747.enmGameMap_ShanHu_Night:
               return MapBit_ShanHu_Night;
            case a_1747.enmGameMap_BeiJiBei_Day:
               return MapBit_BeiJiBei_Day;
            case a_1747.enmGameMap_HaiKui_Day:
               return MapBit_HaiKui_Day;
            case a_1747.enmGameMap_HaiKui_Night:
               return MapBit_HaiKui_Night;
            case a_1747.enmGameMap_TianFuLuo_Night:
               return MapBit_TianFuLuo_Night;
            default:
               return 0;
         }
      }
      
      private function CheckCardsMaskBit(result:Object, mask:uint) : Boolean
      {
         var userCard:Object = null;
         var arrUserCard:Array = result.arrUserCard;
         for each(userCard in arrUserCard)
         {
            if(285212672 == (0xFF000000 & userCard.m_iPlayerCardID) && Boolean(userCard.m_iPlayerCardID & mask))
            {
               return true;
            }
         }
         return false;
      }
      
      private function IsMeiWeiIsland() : Boolean
      {
         return this.m_pResult != null && 0 == this.GetMapBitByMapID(this.m_pResult.iMapID);
      }
      
      private function IsHuoShanIsland() : Boolean
      {
         return this.m_pResult != null && 0 != this.GetMapBitByMapID2(this.m_pResult.iMapID);
      }
      
      private function IsSkyCastleIsland() : Boolean
      {
         return this.m_pResult != null && 0 != this.GetSkyCastleMapBitByMapID(this.m_pResult.iMapID);
      }
      
      private function IsSeafloorWhirlpoolIsland() : Boolean
      {
         return this.m_pResult != null && 0 != this.GetSeafloorWhirlpoolMapBitByMapID(this.m_pResult.iMapID);
      }
      
      private function Is2VSComputerMode() : Boolean
      {
         return this.m_pResult != null && this.m_pResult.byGameMode == a_1748.enmGameMode_2vComputer;
      }
      
      private function Is2VS2Mode() : Boolean
      {
         return this.m_pResult != null && this.m_pResult.byGameMode == a_1748.enmGameMode_2v2;
      }
      
      private function IsComputerMode() : Boolean
      {
         return this.m_pResult != null && (this.m_pResult.byGameMode == a_1748.enmGameMode_1vComputer || this.m_pResult.byGameMode == a_1748.enmGameMode_2vComputer);
      }
      
      private function IsVSMode() : Boolean
      {
         return this.m_pResult != null && (this.m_pResult.byGameMode == a_1748.enmGameMode_1v1 || this.m_pResult.byGameMode == a_1748.enmGameMode_2v2);
      }
      
      private function IsMap(mapID:int) : Boolean
      {
         return this.m_pResult != null && mapID == this.m_pResult.iMapID;
      }
      
      private function IsRoundTimeLessThen(time:int) : Boolean
      {
         return this.m_pResult != null && this.m_pResult.iRoundTime <= time;
      }
      
      private function IsWin() : Boolean
      {
         if(null == this.m_pResult)
         {
            return false;
         }
         if(this.IsVSMode())
         {
            return 1 == this.m_pResult.iWin && this.m_pResult.iRoundTime >= 120;
         }
         return 1 == this.m_pResult.iWin;
      }
      
      private function IsAvatarPosition(pos:int) : Boolean
      {
         return this.m_pResult != null && this.m_pResult.byRolePosition >= pos - 1;
      }
      
      private function IsRestEnergy(require:int) : Boolean
      {
         return this.m_pResult != null && this.m_pResult.iRestEnergy >= require;
      }
      
      private function IsAllDayCards() : Boolean
      {
         return this.m_pResult != null && false == this.CheckCardsMaskBit(this.m_pResult,4096);
      }
      
      private function IsAllNightCards() : Boolean
      {
         var userCard:Object = null;
         if(null == this.m_pResult)
         {
            return false;
         }
         var arrUserCard:Array = this.m_pResult.arrUserCard;
         for each(userCard in arrUserCard)
         {
            if(285212672 == (0xFF000000 & userCard.m_iPlayerCardID) && 289275941 != userCard.m_iPlayerCardID)
            {
               if(0 == (userCard.m_iPlayerCardID & 0xF000))
               {
                  return false;
               }
            }
         }
         return true;
      }
      
      private function CheckTimes(times:int) : uint
      {
         this.m_pTask.m_iUserDef1 += 1;
         if(this.m_pTask.m_iUserDef1 >= times)
         {
            return Result_Finish;
         }
         return Result_Save;
      }
      
      private function HasAwardItem(id:int, count:int) : uint
      {
         if(null == this.m_pResult)
         {
            return Result_Ignore;
         }
         var nCount:int = 0;
         for(var i:uint = 0; i < this.m_pResult.arrPickUpItemInfos.length; i++)
         {
            if(id == this.m_pResult.arrPickUpItemInfos[i].m_iItemID)
            {
               nCount++;
            }
         }
         if(nCount == 0)
         {
            return Result_Ignore;
         }
         this.m_pTask.m_iUserDef1 += nCount;
         if(this.m_pTask.m_iUserDef1 >= count)
         {
            return Result_Finish;
         }
         return Result_Save;
      }
      
      private function IsGotLottery(count:int) : uint
      {
         if(null == this.m_pResult)
         {
            return Result_Ignore;
         }
         if(this.m_pResult.iHonourCount <= 0)
         {
            return Result_Ignore;
         }
         this.m_pTask.m_iUserDef1 += this.m_pResult.iHonourCount;
         if(this.m_pTask.m_iUserDef1 >= count)
         {
            return Result_Finish;
         }
         return Result_Save;
      }
      
      private function IsComputerStep(step:int) : Boolean
      {
         if(null == this.m_pResult)
         {
            return false;
         }
         return this.m_pResult.byRoundStep >= step;
      }
      
      private function IsPlaceAllCardLimit(count:int) : Boolean
      {
         var userCard:Object = null;
         if(null == this.m_pResult)
         {
            return false;
         }
         var arrUserCard:Array = this.m_pResult.arrUserCard;
         var total:int = 0;
         for each(userCard in arrUserCard)
         {
            if(285212672 == (0xFF000000 & userCard.m_iPlayerCardID))
            {
               total += userCard.m_nUsedCount;
            }
         }
         return total <= count;
      }
      
      private function IsAllCardAmountLower(count:int) : Boolean
      {
         var userCard:Object = null;
         if(null == this.m_pResult)
         {
            return false;
         }
         var arrUserCard:Array = this.m_pResult.arrUserCard;
         var total:int = 0;
         for each(userCard in arrUserCard)
         {
            if(285212672 == (0xFF000000 & userCard.m_iPlayerCardID))
            {
               total++;
            }
         }
         if(total > count)
         {
            return false;
         }
         arrUserCard = this.m_pResult.stTeamUseCards;
         total = 0;
         for each(userCard in arrUserCard)
         {
            if(285212672 == (0xFF000000 & userCard.m_iPlayerCardID))
            {
               total++;
            }
         }
         if(total > count)
         {
            return false;
         }
         return true;
      }
      
      private function AllDoNotHasCards(cardID:int) : Boolean
      {
         var userCard:Object = null;
         if(null == this.m_pResult)
         {
            return false;
         }
         var arrUserCard:Array = this.m_pResult.arrUserCard;
         for each(userCard in arrUserCard)
         {
            if(cardID == userCard.m_iPlayerCardID)
            {
               return false;
            }
         }
         arrUserCard = this.m_pResult.stTeamUseCards;
         for each(userCard in arrUserCard)
         {
            if(cardID == userCard.m_iPlayerCardID)
            {
               return false;
            }
         }
         return true;
      }
      
      private function DoNotHasCards(card:uint) : Boolean
      {
         return false == this.HasCards(card);
      }
      
      private function HasCards(card:uint) : Boolean
      {
         var userCard:Object = null;
         if(null == this.m_pResult)
         {
            return false;
         }
         var arrUserCard:Array = this.m_pResult.arrUserCard;
         for each(userCard in arrUserCard)
         {
            if(card == userCard.m_iPlayerCardID)
            {
               return true;
            }
         }
         return false;
      }
      
      private function IsBossID(bossID:int) : Boolean
      {
         if(null == this.m_pResult)
         {
            return false;
         }
         return bossID == this.m_pResult.iBossID;
      }
      
      private function IsDiffSex() : Boolean
      {
         if(null == this.m_pResult)
         {
            return false;
         }
         return this.m_pResult.iTeamMateSex != this.m_pResult.iMySex;
      }
      
      private function IsGrade(grade:uint) : Boolean
      {
         if(null == this.m_pResult)
         {
            return false;
         }
         return this.m_pResult.nGrade >= 0 && this.m_pResult.nGrade <= grade;
      }
      
      private function IsShenyuanWave(require:int) : Boolean
      {
         if(null == this.m_pResult)
         {
            return false;
         }
         return this.m_pResult.iCurrentWave >= require;
      }
      
      private function IsKillOppBuild(count:int) : uint
      {
         if(null == this.m_pResult)
         {
            return Result_Ignore;
         }
         var userdef1:int = this.m_pTask.m_iUserDef1;
         this.m_pTask.m_iUserDef1 += this.m_pResult.nDestroyOppBuildingCount;
         if(this.m_pTask.m_iUserDef1 >= count)
         {
            return Result_Finish;
         }
         if(userdef1 != this.m_pTask.m_iUserDef1)
         {
            return Result_Save;
         }
         return Result_Ignore;
      }
      
      private function IsTeammateLevelLowerThen(level:int) : Boolean
      {
         if(null == this.m_pResult)
         {
            return false;
         }
         return this.m_pResult.iTeamLevel <= level;
      }
      
      private function IsTeammateLevelDetal(value:int) : Boolean
      {
         if(null == this.m_pResult)
         {
            return false;
         }
         if(value >= 0)
         {
            return this.m_pResult.iMyLevel - this.m_pResult.iTeamLevel >= value;
         }
         return this.m_pResult.iMyLevel - this.m_pResult.iTeamLevel <= value;
      }
      
      private function IsKilledEnemy(enemyID:int, count:int) : uint
      {
         var enemy:Object = null;
         if(null == this.m_pResult)
         {
            return Result_Ignore;
         }
         var arrEnemys:Array = this.m_pResult.arrKilledMiceInfos;
         var userdef1:int = this.m_pTask.m_iUserDef1;
         for each(enemy in arrEnemys)
         {
            if(enemy.m_iMouseTypeID == enemyID)
            {
               this.m_pTask.m_iUserDef1 += enemy.m_nMouseCount;
               break;
            }
         }
         if(this.m_pTask.m_iUserDef1 >= count)
         {
            return Result_Finish;
         }
         if(userdef1 != this.m_pTask.m_iUserDef1)
         {
            return Result_Save;
         }
         return Result_Ignore;
      }
      
      private function IsDeadCardLowerThen(count:int) : Boolean
      {
         if(null == this.m_pResult)
         {
            return false;
         }
         return this.m_pResult.nDestroyByEnemyBuildingCount <= count;
      }
      
      private function IsPlaceCardLimit(cardID:int, count:int) : Boolean
      {
         var card:Object = null;
         if(null == this.m_pResult)
         {
            return false;
         }
         var arrCards:Array = this.m_pResult.arrUserCard;
         for each(card in arrCards)
         {
            if(card.m_iPlayerCardID == cardID)
            {
               if(card.m_nUsedCount <= count)
               {
                  return true;
               }
               return false;
            }
         }
         return true;
      }
      
      private function IsPlaceCard(cardID:int, count:int) : uint
      {
         var card:Object = null;
         if(null == this.m_pResult)
         {
            return Result_Ignore;
         }
         var arrCards:Array = this.m_pResult.arrUserCard;
         var userdef1:int = this.m_pTask.m_iUserDef1;
         for each(card in arrCards)
         {
            if(card.m_iPlayerCardID == cardID)
            {
               this.m_pTask.m_iUserDef1 += card.m_nUsedCount;
               break;
            }
         }
         if(this.m_pTask.m_iUserDef1 >= count)
         {
            return Result_Finish;
         }
         if(userdef1 != this.m_pTask.m_iUserDef1)
         {
            return Result_Save;
         }
         return Result_Ignore;
      }
      
      private function IsAllAchievements(require:int) : uint
      {
         var ach:Object = null;
         if(null == this.m_arrAchieves)
         {
            return Result_Ignore;
         }
         var mapBit2:uint = 0;
         var userdef1:int = this.m_pTask.m_iUserDef1;
         this.m_pTask.m_iUserDef1 = 0;
         for each(ach in this.m_arrAchieves)
         {
            if((ach.m_nGameType == a_1748.enmGameMode_2vComputer || ach.m_nGameType == a_1748.enmGameMode_1vComputer) && ach.m_cBestGrade <= require)
            {
               mapBit2 = this.GetMapBitByMapID(ach.m_nMapID);
               if(MapBit_Shenyuan != mapBit2 && MapBit_Shendian != mapBit2)
               {
                  this.m_pTask.m_iUserDef1 |= mapBit2;
               }
            }
         }
         if(this.m_pTask.m_iUserDef1 == MapBit_All)
         {
            return Result_Finish;
         }
         if(userdef1 != this.m_pTask.m_iUserDef1)
         {
            return Result_Save;
         }
         return Result_Ignore;
      }
      
      private function IsHuoShanAllAchievements(require:int, mode:int) : uint
      {
         var ach:Object = null;
         if(null == this.m_arrAchieves)
         {
            return Result_Ignore;
         }
         var mapBit2:uint = 0;
         var userdef1:int = this.m_pTask.m_iUserDef1;
         this.m_pTask.m_iUserDef1 = 0;
         for each(ach in this.m_arrAchieves)
         {
            if((0 == mode || ach.m_nGameType == mode) && ach.m_cBestGrade <= require)
            {
               mapBit2 = this.GetMapBitByMapID2(ach.m_nMapID);
               if(MapBit_ZhiShi != mapBit2 && MapBit_MaQiDuo != mapBit2 && MapBit_XueDing != mapBit2)
               {
                  this.m_pTask.m_iUserDef1 |= mapBit2;
               }
            }
         }
         if(this.m_pTask.m_iUserDef1 == MapBit2_All)
         {
            return Result_Finish;
         }
         if(userdef1 != this.m_pTask.m_iUserDef1)
         {
            return Result_Save;
         }
         return Result_Ignore;
      }
      
      private function IsSkyCastleAllAchievements(require:int, mode:int) : uint
      {
         var ach:Object = null;
         if(null == this.m_arrAchieves)
         {
            return Result_Ignore;
         }
         var mapSkyCaslteBit:uint = 0;
         var userdef1:int = this.m_pTask.m_iUserDef1;
         this.m_pTask.m_iUserDef1 = 0;
         for each(ach in this.m_arrAchieves)
         {
            if((0 == mode || ach.m_nGameType == mode) && ach.m_cBestGrade <= require)
            {
               mapSkyCaslteBit = this.GetSkyCastleMapBitByMapID(ach.m_nMapID);
               if(MapBit_LuLiao != mapSkyCaslteBit && MapBit_XiangLiao != mapSkyCaslteBit && MapBit_ShiSanXiang != mapSkyCaslteBit)
               {
                  this.m_pTask.m_iUserDef1 |= mapSkyCaslteBit;
               }
            }
         }
         if(MapBit_SkyCaslte_All == this.m_pTask.m_iUserDef1)
         {
            return Result_Finish;
         }
         if(userdef1 != this.m_pTask.m_iUserDef1)
         {
            return Result_Save;
         }
         return Result_Ignore;
      }
      
      private function IsSeafloorWhirlpoolAllAchievements(require:int, mode:int) : uint
      {
         var ach:Object = null;
         if(null == this.m_arrAchieves)
         {
            return Result_Ignore;
         }
         var mapSeafloorWhirlpoolBit:uint = 0;
         var userdef1:int = this.m_pTask.m_iUserDef1;
         this.m_pTask.m_iUserDef1 = 0;
         for each(ach in this.m_arrAchieves)
         {
            if((0 == mode || ach.m_nGameType == mode) && ach.m_cBestGrade <= require)
            {
               mapSeafloorWhirlpoolBit = this.GetSeafloorWhirlpoolMapBitByMapID(ach.m_nMapID);
               this.m_pTask.m_iUserDef1 |= mapSeafloorWhirlpoolBit;
            }
         }
         if(MapBit_SkyCaslte_All == this.m_pTask.m_iUserDef1)
         {
            return Result_Finish;
         }
         if(userdef1 != this.m_pTask.m_iUserDef1)
         {
            return Result_Save;
         }
         return Result_Ignore;
      }
      
      private function IsLevelUp(nLevel:int) : Boolean
      {
         return this.m_iAdditinal >= nLevel;
      }
      
      private function IsVSLevelUp(nLevel:int) : Boolean
      {
         return this.m_iAdditinal2 >= nLevel;
      }
      
      private function IsSaveLevelUp(nLevel:int) : uint
      {
         var userDef1:int = this.m_pTask.m_iUserDef1;
         this.m_pTask.m_iUserDef1 = this.m_iAdditinal;
         if(this.m_pTask.m_iUserDef1 >= nLevel)
         {
            return Result_Finish;
         }
         if(this.m_pTask.m_iUserDef1 != userDef1)
         {
            return Result_Save;
         }
         return Result_Ignore;
      }
      
      private function IsLocalTask(nTaskEventID:int, nPara:int = 0) : Boolean
      {
         if(0 == nPara)
         {
            return this.m_iAdditinal == nTaskEventID;
         }
         return this.m_iAdditinal == nTaskEventID && this.m_iAdditinal2 == nPara;
      }
      
      private function IsSendDalaba(nCount:int) : uint
      {
         this.m_pTask.m_iUserDef1 += this.m_iAdditinal;
         if(this.m_pTask.m_iUserDef1 >= nCount)
         {
            return Result_Finish;
         }
         return Result_Save;
      }
      
      private function IsShopConsum(nType:int, nCount:int) : uint
      {
         var consume:int = 0;
         if(nType == 0)
         {
            consume = this.m_iAdditinal;
         }
         else if(nType == 1)
         {
            consume = this.m_iAdditinal2;
         }
         this.m_pTask.m_iUserDef1 += consume;
         if(this.m_pTask.m_iUserDef1 >= nCount)
         {
            return Result_Finish;
         }
         return Result_Save;
      }
      
      private function IsShopConsumSingle(nType:int) : Boolean
      {
         if(nType == 0)
         {
            return this.m_iAdditinal > 0;
         }
         if(nType == 1)
         {
            return this.m_iAdditinal2 > 0;
         }
         return false;
      }
      
      private function IsAddNewFriend() : Boolean
      {
         return a_4514.a_704 == this.m_uiOprate;
      }
      
      private function IsAddConistra() : Boolean
      {
         return a_4514.a_705 == this.m_uiOprate || a_4514.a_706 == this.m_uiOprate;
      }
      
      private function IsLeaveConistra() : Boolean
      {
         return a_4514.a_711 == this.m_uiOprate;
      }
      
      private function IsCreateConistra() : Boolean
      {
         return a_4514.a_706 == this.m_uiOprate;
      }
      
      private function IsConistraLevel(level:int) : Boolean
      {
         if(a_4514.a_707 == this.m_uiOprate)
         {
            return this.m_pExtraObject != null && this.m_pExtraObject.iLevel >= level;
         }
         return false;
      }
      
      private function IsConistraShopLevel(level:int) : Boolean
      {
         if(a_4514.a_707 == this.m_uiOprate)
         {
            return this.m_pExtraObject != null && this.m_pExtraObject.iShopLevel >= level;
         }
         return false;
      }
      
      private function IsConistraComposeLevel(level:int) : Boolean
      {
         if(a_4514.a_707 == this.m_uiOprate)
         {
            return this.m_pExtraObject != null && this.m_pExtraObject.iComposeLevel >= level;
         }
         return false;
      }
      
      private function IsConistraSkillLevel(level:int) : Boolean
      {
         if(a_4514.a_707 == this.m_uiOprate)
         {
            return this.m_pExtraObject != null && this.m_pExtraObject.iSkillLevel >= level;
         }
         return false;
      }
      
      private function IsConistraBattle() : Boolean
      {
         if(null == this.m_pResult)
         {
            return false;
         }
         return this.m_pResult.byIsConstraBattle == 1;
      }
      
      private function IsOfferConistraPoint(nRequire:int) : uint
      {
         var nOld:int = this.m_pTask.m_iUserDef1;
         if(a_4514.a_710 == this.m_uiOprate)
         {
            this.m_pTask.m_iUserDef1 += this.m_iAdditinal;
         }
         if(this.m_pTask.m_iUserDef1 >= nRequire)
         {
            return Result_Finish;
         }
         if(nOld != this.m_pTask.m_iUserDef1)
         {
            return Result_Save;
         }
         return Result_Ignore;
      }
      
      private function IsConistraShopping() : Boolean
      {
         return a_4514.a_708 == this.m_uiOprate;
      }
      
      private function IsConistraStrengthen() : Boolean
      {
         return a_4514.a_709 == this.m_uiOprate;
      }
      
      private function GetConistraScore(nRequire:int) : uint
      {
         if(null == this.m_pResult)
         {
            return Result_Ignore;
         }
         var nOld:int = this.m_pTask.m_iUserDef1;
         this.m_pTask.m_iUserDef1 += this.m_pResult.iConstraScore;
         if(this.m_pTask.m_iUserDef1 >= nRequire)
         {
            return Result_Finish;
         }
         if(nOld != this.m_pTask.m_iUserDef1)
         {
            return Result_Save;
         }
         return Result_Ignore;
      }
      
      private function IsStrengthenCard(nLevel:uint) : Boolean
      {
         return this.m_uiOprate == a_4514.a_1646 && this.m_iAdditinal >= nLevel;
      }
      
      private function IsCreateCard(cardID:int, star:int = 0) : Boolean
      {
         return this.m_uiOprate == a_4514.a_1645 && this.m_iAdditinal >= star && (0 == cardID || this.m_iCardID == cardID);
      }
      
      private function IsHP(value:int) : Boolean
      {
         var dic:Dictionary = this.m_pExtraObject as Dictionary;
         if(null != dic)
         {
            if(dic[a_1728.enmTiLi] != null)
            {
               return dic[a_1728.enmTiLi] >= value;
            }
         }
         return false;
      }
      
      private function GetItem(id:int) : Boolean
      {
         var dicItems:Dictionary = null;
         var dic:Dictionary = this.m_pExtraObject as Dictionary;
         if(null != dic)
         {
            dicItems = dic[a_1728.enmZhuangBei];
            if(Boolean(dicItems) && dicItems[id] != null)
            {
               return true;
            }
         }
         return false;
      }
      
      private function GetItemTypeCount(itemType:int, nRequireCount:int) : Boolean
      {
         var dicItems:Dictionary = null;
         var id:int = 0;
         var dic:Dictionary = this.m_pExtraObject as Dictionary;
         var count:int = 0;
         if(null != dic)
         {
            dicItems = dic[a_1728.enmZhuangBei];
            for each(id in dicItems)
            {
               if(itemType == (id & 0xFFF00000))
               {
                  count++;
               }
            }
         }
         return count >= nRequireCount;
      }
      
      private function UseItem(id:int) : Boolean
      {
         return id == this.m_iAdditinal2;
      }
      
      private function GetAchievement(id:int) : Boolean
      {
         var dic:Dictionary = null;
         if(null != this.m_pExtraObject)
         {
            dic = this.m_pExtraObject as Dictionary;
            if(null != dic && null != dic[id])
            {
               return dic[id].iTaskStatus == a_1756.enm_TaskOverdateStatus;
            }
         }
         return false;
      }
      
      private function GetAchievementType(type:int) : Boolean
      {
         var item:Object = null;
         if(null == this.m_pExtraObject || false == this.m_pExtraObject is Dictionary)
         {
            return false;
         }
         var dic:Dictionary = this.m_pExtraObject as Dictionary;
         for each(item in dic)
         {
            if(item.id != this.m_pTask.m_iTaskID && type == (item.id & 0xFFF00000) && item.id < 323026997 && item.iTaskStatus != a_1756.enm_TaskOverdateStatus)
            {
               return false;
            }
         }
         return true;
      }
      
      private function FinishTask(type:int) : Boolean
      {
         if(0 == type)
         {
            return true;
         }
         if(1 == type)
         {
            return PARTY_TASK_ID == (this.m_iAdditinal2 & TASK_ID_MASKBIT);
         }
         if(2 == type)
         {
            return EVERYDAY_TASK_ID == (this.m_iAdditinal2 & TASK_ID_MASKBIT);
         }
         return false;
      }
      
      private function Is1VSComputerMode() : Boolean
      {
         if(null == this.m_pResult)
         {
            return false;
         }
         return this.m_pResult.byGameMode == a_1748.enmGameMode_1vComputer;
      }
      
      private function Is1VS1Mode() : Boolean
      {
         if(null == this.m_pResult)
         {
            return false;
         }
         return this.m_pResult.byGameMode == a_1748.enmGameMode_1v1;
      }
      
      private function IsVSLevelDetal(value:int) : Boolean
      {
         if(null == this.m_pResult)
         {
            return false;
         }
         if(this.Is1VS1Mode())
         {
            if(value > 0)
            {
               return this.m_pResult.iMyLevel - this.m_pResult.iOppLevel >= value;
            }
            return this.m_pResult.iMyLevel - this.m_pResult.iOppLevel <= value;
         }
         return false;
      }
      
      private function IsVSRank(value:int) : Boolean
      {
         return null != this.m_pExtraObject && this.m_pExtraObject.iVSRank > 0 && this.m_pExtraObject.iVSRank <= value;
      }
      
      private function CheckSkillLevel(nLevel:int, nCount:int) : uint
      {
         var dicItems:Dictionary = null;
         var id:int = 0;
         var dic:Dictionary = this.m_pExtraObject as Dictionary;
         var nBeforeDef1:int = this.m_pTask.m_iUserDef1;
         if(null != dic)
         {
            dicItems = dic[a_1728.enmJiNeng];
            if(null != dicItems)
            {
               this.m_pTask.m_iUserDef1 = 0;
               for each(id in dicItems)
               {
                  if(id >= nLevel)
                  {
                     ++this.m_pTask.m_iUserDef1;
                  }
               }
            }
         }
         if(this.m_pTask.m_iUserDef1 >= nCount)
         {
            return Result_Finish;
         }
         if(nBeforeDef1 != this.m_pTask.m_iUserDef1)
         {
            return Result_Save;
         }
         return Result_Ignore;
      }
      
      private function CheckSkillLevelByID(nLevel:int, cardID:int) : Boolean
      {
         var dicItems:Dictionary = null;
         var dic:Dictionary = this.m_pExtraObject as Dictionary;
         if(null != dic)
         {
            dicItems = dic[a_1728.enmJiNeng];
            return null != dicItems && null != dicItems[cardID] && dicItems[cardID] >= nLevel;
         }
         return false;
      }
      
      private function IsStrengthenCardByID(cardID:int, nLevel:uint) : Boolean
      {
         return this.m_uiOprate == a_4514.a_1646 && this.m_iAdditinal >= nLevel && cardID == this.m_iCardID;
      }
      
      private function IsMapGrade(mapID:int, gameMode:int, gradeValue:int) : uint
      {
         var ach:Object = null;
         if(null == this.m_arrAchieves)
         {
            return Result_Ignore;
         }
         var mapBit2:uint = 0;
         var userdef1:int = this.m_pTask.m_iUserDef1;
         for each(ach in this.m_arrAchieves)
         {
            if(0 != mapID)
            {
               if(ach.m_nGameType == gameMode && mapID == ach.m_nMapID)
               {
                  return ach.m_cBestGrade <= gradeValue ? Result_Finish : Result_Ignore;
               }
            }
            else if(ach.m_nGameType == gameMode && ach.m_cBestGrade <= gradeValue)
            {
               mapBit2 = this.GetMapBitByMapID(ach.m_nMapID);
               this.m_pTask.m_iUserDef1 |= mapBit2;
            }
         }
         if(this.m_pTask.m_iUserDef1 == MapBit_All_Extra)
         {
            return Result_Finish;
         }
         if(userdef1 != this.m_pTask.m_iUserDef1)
         {
            return Result_Save;
         }
         return Result_Ignore;
      }
      
      private function IsMapGrade2(mapID:int, gameMode:int, gradeValue:int) : uint
      {
         var ach:Object = null;
         if(null == this.m_arrAchieves)
         {
            return Result_Ignore;
         }
         var mapBit2:uint = 0;
         var userdef1:int = this.m_pTask.m_iUserDef1;
         for each(ach in this.m_arrAchieves)
         {
            if(0 != mapID)
            {
               if(ach.m_nGameType == gameMode && mapID == ach.m_nMapID)
               {
                  return ach.m_cBestGrade <= gradeValue ? Result_Finish : Result_Ignore;
               }
            }
            else if(ach.m_nGameType == gameMode && ach.m_cBestGrade <= gradeValue)
            {
               mapBit2 = this.GetMapBitByMapID2(ach.m_nMapID);
               this.m_pTask.m_iUserDef1 |= mapBit2;
            }
         }
         if(this.m_pTask.m_iUserDef1 == MapBit2_All_Extra)
         {
            return Result_Finish;
         }
         if(userdef1 != this.m_pTask.m_iUserDef1)
         {
            return Result_Save;
         }
         return Result_Ignore;
      }
      
      private function IsLevelRank(level:int) : Boolean
      {
         return null != this.m_pExtraObject && this.m_pExtraObject.iLevelRank > 0 && this.m_pExtraObject.iLevelRank <= level;
      }
      
      private function IsWealthRank(level:int) : Boolean
      {
         return null != this.m_pExtraObject && this.m_pExtraObject.iWealthRank > 0 && this.m_pExtraObject.iWealthRank <= level;
      }
      
      private function IsGoldCount(count:int) : Boolean
      {
         var dic:Dictionary = this.m_pExtraObject as Dictionary;
         if(null != dic)
         {
            if(dic[a_1728.enmJinBi] != null)
            {
               return dic[a_1728.enmJinBi] >= count;
            }
         }
         return false;
      }
      
      private function IsMedalCount(count:int) : Boolean
      {
         var dic:Dictionary = this.m_pExtraObject as Dictionary;
         if(null != dic)
         {
            if(dic[a_1728.enmJiangZhang] != null)
            {
               return dic[a_1728.enmJiangZhang] >= count;
            }
         }
         return false;
      }
      
      private function IsMatchPointCount(count:int) : Boolean
      {
         var dic:Dictionary = this.m_pExtraObject as Dictionary;
         if(null != dic)
         {
            if(dic[a_1728.enmBiSaiJiFen] != null)
            {
               return dic[a_1728.enmBiSaiJiFen] >= count;
            }
         }
         return false;
      }
      
      private function PresentToOthers() : Boolean
      {
         return this.m_iCardID == 1;
      }
      
      private function IsAchievementPointSum(value:int) : uint
      {
         var userdef1:int = this.m_pTask.m_iUserDef1;
         this.m_pTask.m_iUserDef1 = this.m_iAdditinal2;
         if(this.m_pTask.m_iUserDef1 >= value)
         {
            return Result_Finish;
         }
         if(userdef1 != this.m_pTask.m_iUserDef1)
         {
            return Result_Save;
         }
         return Result_Ignore;
      }
      
      public function Execute(fun:Array) : uint
      {
         if(null == fun)
         {
            return Result_Ignore;
         }
         var execute:Function = this[fun[0]];
         if(null == execute)
         {
            return Result_Ignore;
         }
         var paraArr:Array = fun[1];
         if(null == paraArr)
         {
            return uint(execute());
         }
         switch(paraArr.length)
         {
            case 1:
               return uint(execute(paraArr[0]));
            case 2:
               return uint(execute(paraArr[0],paraArr[1]));
            case 3:
               return uint(execute(paraArr[0],paraArr[1],paraArr[2]));
            case 4:
               return uint(execute(paraArr[0],paraArr[1],paraArr[2],paraArr[3]));
            case 5:
               return uint(execute(paraArr[0],paraArr[1],paraArr[2],paraArr[3],paraArr[4]));
            case 6:
               return uint(execute(paraArr[0],paraArr[1],paraArr[2],paraArr[3],paraArr[4],paraArr[5]));
            default:
               return 0;
         }
      }
      
      private function isUseLeaf(type:uint, num:uint) : uint
      {
         if(null == this.m_pExtraObject)
         {
            return Result_Ignore;
         }
         var userDef1:int = this.m_pTask.m_iUserDef1;
         if(0 == type)
         {
            this.m_pTask.m_iUserDef1 += this.m_pExtraObject.iGoldLeaf;
            if(this.m_pTask.m_iUserDef1 >= num)
            {
               return TaskRuleCenter.Result_Finish;
            }
         }
         else
         {
            this.m_pTask.m_iUserDef1 += this.m_pExtraObject.iSliverLeaf;
            if(this.m_pTask.m_iUserDef1 >= num)
            {
               return TaskRuleCenter.Result_Finish;
            }
         }
         if(userDef1 != this.m_pTask.m_iUserDef1)
         {
            return Result_Save;
         }
         return Result_Ignore;
      }
      
      private function isHasAwardSomeItem(iCardId0:int, iNum0:int, iCardId1:int = 0, iNum1:int = 0, iCardId2:int = 0, iNum2:int = 0) : uint
      {
         var arrProps:Array = null;
         var iFinish:* = 0;
         var i:int = 0;
         if(null != this.m_pExtraObject)
         {
            arrProps = this.m_pExtraObject as Array;
            iFinish = 1;
            if(iCardId1 != 0)
            {
               iFinish++;
            }
            if(iCardId2 != 0)
            {
               iFinish++;
            }
            if(null != arrProps && 0 != arrProps.length)
            {
               for(i = 0; i < arrProps.length; i++)
               {
                  if(iCardId0 == arrProps[i].CardID && iNum0 <= arrProps[i].CardCount)
                  {
                     iFinish--;
                  }
                  if(iCardId1 == arrProps[i].CardID && iNum1 <= arrProps[i].CardCount)
                  {
                     iFinish--;
                  }
                  if(iCardId2 == arrProps[i].CardID && iNum2 <= arrProps[i].CardCount)
                  {
                     iFinish--;
                  }
               }
               if(0 == iFinish)
               {
                  return Result_Finish;
               }
            }
         }
         return Result_Ignore;
      }
      
      private function isArmySlot(iSlotNum:int) : uint
      {
         if(this.m_uiOprate == a_4514.TaskOperate_Armys)
         {
            if(iSlotNum > -1)
            {
               if(this.m_iAdditinal < iSlotNum)
               {
                  return Result_Ignore;
               }
               return Result_Finish;
            }
         }
         return Result_Ignore;
      }
      
      private function isGemSrengthen(isEmbedded:int, iLevel:int) : uint
      {
         if(this.m_uiOprate == a_4514.TaskOperate_Gem_Strengthen)
         {
            if(0 == isEmbedded)
            {
               if(iLevel > -1)
               {
                  if(this.m_iAdditinal >= iLevel)
                  {
                     return Result_Finish;
                  }
               }
            }
            else if(343932928 != (this.m_iCardID & 0xFFF00000))
            {
               if(iLevel > -1)
               {
                  if(this.m_iAdditinal >= iLevel)
                  {
                     return Result_Finish;
                  }
               }
            }
         }
         return Result_Ignore;
      }
      
      private function isAcheiveShrengthenArmy(iType:int, iNum:int) : uint
      {
         if(this.m_uiOprate == a_4482.TaskOperate_Armys)
         {
            if(iType == this.m_iCardID)
            {
               if(this.m_iAdditinal >= iNum)
               {
                  return Result_Finish;
               }
            }
         }
         return Result_Ignore;
      }
      
      private function isAcheiveStrengthenGem(iNum:int, iLevel:int, iCardId:int = 0) : uint
      {
         if(this.m_uiOprate == a_4482.TaskOperate_Gem_Strengthen)
         {
            if(0 == iCardId)
            {
               if(1 == iNum)
               {
                  if(this.m_iAdditinal >= iLevel)
                  {
                     return Result_Finish;
                  }
               }
               else if(this.m_iAdditinal == iLevel)
               {
                  ++this.m_pTask.m_iUserDef1;
                  if(this.m_pTask.m_iUserDef1 >= iNum)
                  {
                     return Result_Finish;
                  }
                  return Result_Save;
               }
            }
            else if(this.m_iCardID == iCardId)
            {
               if(this.m_iAdditinal >= iLevel)
               {
                  return Result_Finish;
               }
            }
         }
         return Result_Ignore;
      }
      
      private function isAcheiveDecomposGem(iNum:int = 0) : uint
      {
         if(this.m_uiOprate == a_4482.TaskOperate_Gem_Decompose)
         {
            return Result_Finish;
         }
         return Result_Ignore;
      }
      
      private function isHomeCook(iLevel:int) : uint
      {
         if(this.m_uiOprate == a_4514.TaskOperate_Home_Cook)
         {
            if(1 == this.m_iCardID)
            {
               if(this.m_iAdditinal >= iLevel)
               {
                  return Result_Finish;
               }
            }
         }
         return Result_Ignore;
      }
      
      private function isHomeSteal() : uint
      {
         if(this.m_uiOprate == a_4514.TaskOperate_Home_Cook)
         {
            if(0 == this.m_iCardID)
            {
               return Result_Finish;
            }
         }
         return Result_Ignore;
      }
      
      private function isMoTaMap() : Boolean
      {
         return this.m_pResult != null && (this.m_pResult.iMapID > 65536 ? true : false);
      }
      
      private function moTaRank(iRank:int) : Boolean
      {
         if(LocalTaskEvents.TASK_MOTA_RANK == this.m_iAdditinal)
         {
            return iRank >= this.m_iAdditinal2;
         }
         return false;
      }
      
      private function IsMotaMap(iFloor:int) : Boolean
      {
         var floor:int = 0;
         if(this.m_pResult != null && null != this.m_pResult.iMapID)
         {
            floor = this.m_pResult.iMapID >> 16;
            return iFloor == floor;
         }
         return false;
      }
      
      private function isHasStrongCardItem(iNum0:int = 1, iCardId:int = 1) : uint
      {
         var stro1:uint = 0;
         var stro2:uint = 0;
         var arrProps:Array = null;
         var i:int = 0;
         if(null != this.m_pExtraObject)
         {
            stro1 = 0;
            stro2 = 0;
            arrProps = this.m_pExtraObject as Array;
            if(null != arrProps && 0 != arrProps.length)
            {
               for(i = 0; i < arrProps.length; i++)
               {
                  if(1 == iCardId && 285212686 == (arrProps[i].CardID & 0xFF00000F))
                  {
                     stro1++;
                     if(stro1 >= iNum0)
                     {
                        return Result_Finish;
                     }
                  }
                  if(2 == iCardId && 285212687 == (arrProps[i].CardID & 0xFF00000F))
                  {
                     stro2++;
                     if(stro2 >= iNum0)
                     {
                        return Result_Finish;
                     }
                  }
               }
            }
         }
         return Result_Ignore;
      }
      
      private function IsTryRegister() : uint
      {
         if(LocalTaskEvents.TASK_TRY_REGISTER == this.m_iAdditinal)
         {
            return Result_Finish;
         }
         return Result_Ignore;
      }
      
      private function IsVIP(iVipType:int) : uint
      {
         var m_enterRoom:Object = null;
         var iVip:Boolean = false;
         var iYearVip:Boolean = false;
         if(LocalTaskEvents.TASK_VIP == this.m_iAdditinal)
         {
            m_enterRoom = a_2161.e.getEnterRoom();
            iVip = Boolean(m_enterRoom.m_isYellowGem);
            iYearVip = Boolean(m_enterRoom.m_isYearYellowGem);
            switch(iVipType)
            {
               case 1:
                  if(iVip)
                  {
                     return Result_Finish;
                  }
                  break;
               case 2:
                  if(iYearVip)
                  {
                     return Result_Finish;
                  }
                  break;
               case 3:
                  if(iVip || iYearVip)
                  {
                     return Result_Finish;
                  }
            }
         }
         return Result_Ignore;
      }
      
      private function IsTaskEveryDay() : uint
      {
         if(LocalTaskEvents.TASK_EVERY_DAY == this.m_iAdditinal)
         {
            return Result_Finish;
         }
         return Result_Ignore;
      }
      
      private function VisitBuild(iBuildID:int) : uint
      {
         if(this.m_iAdditinal != LocalTaskEvents.TASK_VISIT_BUILD)
         {
            return Result_Ignore;
         }
         if(this.m_iAdditinal2 == iBuildID)
         {
            return Result_Finish;
         }
         return Result_Ignore;
      }
      
      private function EasyOperation(iOperationID:int) : uint
      {
         if(this.m_iAdditinal != LocalTaskEvents.TASK_EASY_OPERATION)
         {
            return Result_Ignore;
         }
         if(this.m_iAdditinal2 == iOperationID)
         {
            return Result_Finish;
         }
         return Result_Ignore;
      }
      
      private function UseProps(iPropsID:int) : uint
      {
         if(this.m_iAdditinal != LocalTaskEvents.TASK_USE_PROPS)
         {
            return Result_Ignore;
         }
         if(this.m_iAdditinal2 == iPropsID)
         {
            return Result_Finish;
         }
         return Result_Ignore;
      }
      
      private function DoFunctions(functions:Array) : uint
      {
         var uiResult:uint = Result_Ignore;
         if(null == functions)
         {
            return uiResult;
         }
         for(var i:int = 0; i < functions.length; i++)
         {
            uiResult = this.Execute(functions[i]);
            if(uiResult == Result_Ignore)
            {
               break;
            }
         }
         return uiResult;
      }
      
      public function HandleTaskType1(task:a_4517, result:Object, functions:Array) : uint
      {
         this.m_pTask = task;
         this.m_pResult = result;
         return this.DoFunctions(functions);
      }
      
      public function HandleTaskLevelUp(task:a_4517, nLevel:int, nVsLevel:int, functions:Array) : uint
      {
         this.m_pTask = task;
         this.m_iAdditinal = nLevel;
         this.m_iAdditinal2 = nVsLevel;
         return this.DoFunctions(functions);
      }
      
      public function HandleLocalTask(task:a_4517, localTaskEventID:uint, cardID:int, functions:Array, pExtra:Object = null) : uint
      {
         this.m_pTask = task;
         this.m_iAdditinal = localTaskEventID;
         this.m_iAdditinal2 = cardID;
         this.m_pExtraObject = pExtra;
         return this.DoFunctions(functions);
      }
      
      public function HandleDalabaTask(task:a_4517, sendCount:int, functions:Array) : uint
      {
         this.m_pTask = task;
         this.m_iAdditinal = sendCount;
         return this.DoFunctions(functions);
      }
      
      public function HandleConsumTask(task:a_4517, iCommodityCoinPrice:int, iCommodityCharmPrice:int, functions:Array, bAsPresent:Boolean = false) : uint
      {
         this.m_pTask = task;
         this.m_iAdditinal = iCommodityCoinPrice;
         this.m_iAdditinal2 = iCommodityCharmPrice;
         this.m_iCardID = int(bAsPresent);
         return this.DoFunctions(functions);
      }
      
      public function HandleTaskTypeAchievements(task:a_4517, achieves:Array, functions:Array) : uint
      {
         this.m_pTask = task;
         this.m_arrAchieves = achieves;
         return this.DoFunctions(functions);
      }
      
      public function HandleTaskType2(task:a_4517, oprate:uint, iAddition:int, pExtra:Object, functions:Array) : uint
      {
         this.m_uiOprate = oprate;
         this.m_iAdditinal = iAddition;
         this.m_pExtraObject = pExtra;
         this.m_pTask = task;
         return this.DoFunctions(functions);
      }
      
      public function HandleTaskType3(task:a_4517, oprate:uint, card:uint, param:uint, functions:Array) : uint
      {
         this.m_uiOprate = oprate;
         this.m_pTask = task;
         this.m_iCardID = card;
         this.m_iAdditinal = param;
         return this.DoFunctions(functions);
      }
      
      public function HandleTaskAchievement(task:a_4517, dicAchieves:Object, functions:Array) : uint
      {
         this.m_pTask = task;
         this.m_pExtraObject = dicAchieves;
         return this.DoFunctions(functions);
      }
   }
}

