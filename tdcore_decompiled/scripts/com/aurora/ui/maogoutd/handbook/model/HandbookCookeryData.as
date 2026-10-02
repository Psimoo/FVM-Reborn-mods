package com.aurora.ui.maogoutd.handbook.model
{
   public class HandbookCookeryData
   {
      
      public var iID:int;
      
      public var iItemID:int;
      
      public var iDishID:int;
      
      public var sItemName:String;
      
      public var iType:int;
      
      public var iClassify:int;
      
      public var iCardCollectPt:int;
      
      public var awardCookeryPt:int;
      
      public var sAttrFunDes:String;
      
      public var sDesc:String;
      
      public var limitAry:Array;
      
      public var iRecipesId:int;
      
      public function HandbookCookeryData()
      {
         super();
         this.limitAry = [];
      }
   }
}

