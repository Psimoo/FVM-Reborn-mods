package com.aurora.ui.maogoutd.PayAward
{
   public class RechargeReceieveItem
   {
      
      private static const USER_SEX_SHARE:int = 0;
      
      private static const USER_SEX_MALE:int = 1;
      
      private static const USER_SEX_FEMALE:int = 2;
      
      public var m_iPosID:int;
      
      public var m_iNeedRechargePoint:int;
      
      public var m_vMaleAwardDatas:Vector.<AwardData>;
      
      public var m_vFemaleAwardDatas:Vector.<AwardData>;
      
      private var m_arrMaleAwardID:Array;
      
      private var m_arrFemaleAwardID:Array;
      
      public function RechargeReceieveItem()
      {
         super();
         this.m_vMaleAwardDatas = new Vector.<AwardData>();
         this.m_vFemaleAwardDatas = new Vector.<AwardData>();
      }
      
      public function GetAwardIDBySex(iUserSex:int) : Array
      {
         var stAwardData:AwardData = null;
         if(null == this.m_arrMaleAwardID)
         {
            this.m_arrMaleAwardID = [];
            for each(stAwardData in this.m_vMaleAwardDatas)
            {
               this.m_arrMaleAwardID.push(stAwardData.m_iItemID);
            }
            this.m_arrFemaleAwardID = [];
            for each(stAwardData in this.m_vFemaleAwardDatas)
            {
               this.m_arrFemaleAwardID.push(stAwardData.m_iItemID);
            }
         }
         if(USER_SEX_MALE == iUserSex)
         {
            return this.m_arrMaleAwardID;
         }
         return this.m_arrFemaleAwardID;
      }
      
      public function GetAwardContainNumBySex(iUserSex:int) : Array
      {
         var stAwardData:AwardData = null;
         var obj:Object = null;
         if(null == this.m_arrMaleAwardID)
         {
            this.m_arrMaleAwardID = [];
            for each(stAwardData in this.m_vMaleAwardDatas)
            {
               obj = new Object();
               obj.m_iItemID = stAwardData.m_iItemID;
               obj.m_iNum = stAwardData.m_iNum;
               this.m_arrMaleAwardID.push(obj);
            }
            this.m_arrFemaleAwardID = [];
            for each(stAwardData in this.m_vFemaleAwardDatas)
            {
               obj = new Object();
               obj.m_iItemID = stAwardData.m_iItemID;
               obj.m_iNum = stAwardData.m_iNum;
               this.m_arrFemaleAwardID.push(obj);
            }
         }
         if(USER_SEX_MALE == iUserSex)
         {
            return this.m_arrMaleAwardID;
         }
         return this.m_arrFemaleAwardID;
      }
      
      public function GetAwardDataBySex(iUserSex:int) : Vector.<AwardData>
      {
         if(USER_SEX_MALE == iUserSex)
         {
            return this.m_vMaleAwardDatas;
         }
         return this.m_vFemaleAwardDatas;
      }
      
      public function AnalysisXML(stXML:XML) : void
      {
         var stAwardData:AwardData = null;
         var stElementXML:XML = null;
         var iUserSex:int = 0;
         this.m_iPosID = stXML.@posID;
         this.m_iNeedRechargePoint = stXML.@rechargePoint;
         this.m_vMaleAwardDatas.length = 0;
         this.m_vFemaleAwardDatas.length = 0;
         for each(stElementXML in stXML.element)
         {
            stAwardData = new AwardData();
            stAwardData.AnalysisXML(stElementXML);
            iUserSex = int(stElementXML.@sex);
            if(USER_SEX_SHARE == iUserSex || USER_SEX_MALE == iUserSex)
            {
               this.m_vMaleAwardDatas.push(stAwardData);
            }
            if(USER_SEX_SHARE == iUserSex || USER_SEX_FEMALE == iUserSex)
            {
               this.m_vFemaleAwardDatas.push(stAwardData);
            }
         }
      }
   }
}

