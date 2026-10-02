package com.aurora.ui.maogoutd.pag
{
   import flash.utils.Dictionary;
   
   public class RecipeXMLParser
   {
      
      private static var _instance:RecipeXMLParser;
      
      private var _recipeMap:Dictionary;
      
      private var _GoldHelpRecipeMap:Dictionary;
      
      private var _GoldHelpCardRecipeMap:Dictionary;
      
      public function RecipeXMLParser(enforcer:SingletonEnforcer)
      {
         super();
         this._recipeMap = new Dictionary();
         this._GoldHelpRecipeMap = new Dictionary();
         this._GoldHelpCardRecipeMap = new Dictionary();
      }
      
      public static function instance() : RecipeXMLParser
      {
         if(!_instance)
         {
            _instance = new RecipeXMLParser(new SingletonEnforcer());
         }
         return _instance;
      }
      
      public function parse(xml:XML) : void
      {
         this._recipeMap = new Dictionary();
         this._GoldHelpRecipeMap = new Dictionary();
         this._GoldHelpCardRecipeMap = new Dictionary();
         this.parseRecipeNodes(xml.recipes.recipe);
         this.parseGoldRecipeNodes(xml.GoldHelperRecipes.recipe);
      }
      
      private function parseRecipeNodes(nodeList:XMLList) : void
      {
         var node:XML = null;
         var type:int = 0;
         var id:int = 0;
         var cards:Array = null;
         var item:RecipeItem = null;
         for each(node in nodeList)
         {
            type = int(node.@recipe_type);
            id = int(node.@recipe_id);
            cards = String(node.@cards).split(",");
            item = new RecipeItem(type,id,cards);
            this._recipeMap[id] = item;
         }
      }
      
      private function parseGoldRecipeNodes(nodeList:XMLList) : void
      {
         var node:XML = null;
         var type:int = 0;
         var id:int = 0;
         var cards:Array = null;
         var item:RecipeItem = null;
         var i:int = 0;
         for each(node in nodeList)
         {
            type = int(node.@recipe_type);
            id = int(node.@recipe_id);
            cards = String(node.@cards).split(",");
            item = new RecipeItem(type,id,cards);
            this._GoldHelpRecipeMap[id] = item;
            for(i = 0; i < cards.length; i++)
            {
               this._GoldHelpCardRecipeMap[int(cards[i])] = item;
            }
         }
      }
      
      public function getGoldHelpRecipeByCard(card:int) : RecipeItem
      {
         return this._GoldHelpCardRecipeMap[card];
      }
      
      public function getGoldHelpRecipeByID(card:int) : RecipeItem
      {
         return this._GoldHelpRecipeMap[card];
      }
      
      public function getRecipeByID(id:int) : RecipeItem
      {
         return this._recipeMap[id];
      }
   }
}

class SingletonEnforcer
{
   
   public function SingletonEnforcer()
   {
      super();
   }
}
