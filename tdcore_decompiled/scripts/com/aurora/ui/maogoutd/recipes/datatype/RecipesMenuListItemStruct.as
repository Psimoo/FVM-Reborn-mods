package com.aurora.ui.maogoutd.recipes.datatype
{
   public class RecipesMenuListItemStruct
   {
      
      public static const RECIPES_LISTITEM_CLOSE:uint = 1;
      
      public static const RECIPES_LISTITEM_OPEN:uint = 2;
      
      public static const RECIPES_LISTITEM_ACTIVE:uint = 3;
      
      public var m_iSortId:int;
      
      public var m_iRecipesId:int;
      
      public var m_iPropRecipesId:int;
      
      public var m_szRecipesId:String;
      
      public var m_szRecipesName:String;
      
      public var m_szRecipesFuncDesc:String;
      
      public var m_szRecipesDesc:String;
      
      public var m_ToProgress:int;
      
      public var m_aryCompose:Array;
      
      public var m_aryAttr:Array;
      
      public var m_iValue:int;
      
      public var m_iStatus:int;
      
      public var m_CuProgress:int;
      
      public function RecipesMenuListItemStruct()
      {
         super();
      }
   }
}

