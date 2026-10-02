package com.aurora.ui.maogoutd.handbook.model
{
   public class CardHandbookData
   {
      
      public var iID:int;
      
      public var iItemID:int;
      
      public var sItemName:String;
      
      public var iType:int;
      
      public var iClassify:int;
      
      public var iTransID:int;
      
      public var iTransType:int;
      
      public var iTransID_1:int;
      
      public var iNeedNum:int;
      
      public var iAddType:int;
      
      public var iAddValue:Number;
      
      public var sTypeDesc:String;
      
      public var sEnergyDesc:String;
      
      public var sAreaDesc:String;
      
      public var sAddDesc:String;
      
      public var sAbilityDesc:String;
      
      public var sGetwayDesc:String;
      
      public var sSkilldesc:String;
      
      public var sGrowthDesc:String = "";
      
      public var sBaseFusion:String;
      
      public var iFinalFusion:int;
      
      public var iNeedSkillLevel:int = -1;
      
      public var iNeedCrystalLevel:int = -1;
      
      public var iNeedFusionQualityLevel:int = -1;
      
      public var iCardCollectPt:int;
      
      public var iSkillCollectPt:int;
      
      public var iCrystalCollectPt:int;
      
      public var iFusionQualityLevelPt:int;
      
      public function CardHandbookData()
      {
         super();
      }
      
      public function getBaseFusionAry() : Array
      {
         var ary:Array = [];
         if(this.sBaseFusion != "" || this.sBaseFusion != null)
         {
            ary = this.sBaseFusion.split(";");
         }
         return ary;
      }
   }
}

