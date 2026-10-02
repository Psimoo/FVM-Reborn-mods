package com.aurora.ui.maogoutd.pag
{
   public class RecipeItem
   {
      
      public var recipeType:int;
      
      public var recipeID:int;
      
      public var cards:Array;
      
      public function RecipeItem(recipeType:int, recipeID:int, cards:Array)
      {
         super();
         this.recipeType = recipeType;
         this.recipeID = recipeID;
         this.cards = cards;
      }
   }
}

