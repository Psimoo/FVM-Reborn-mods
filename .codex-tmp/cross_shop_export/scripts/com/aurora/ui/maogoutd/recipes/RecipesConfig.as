package com.aurora.ui.maogoutd.recipes
{
   import a_4714.AssetType;
   import a_4714.AssetsItemData;
   import a_4714.AssetsLoader;
   import com.aurora.ui.maogoutd.recipes.datatype.MenuConfigStruct;
   import com.aurora.ui.maogoutd.recipes.datatype.RecipesAttrStruct;
   import com.aurora.ui.maogoutd.recipes.datatype.RecipesComposeStruct;
   import com.aurora.ui.maogoutd.recipes.datatype.RecipesMenuListItemStruct;
   import com.aurora.ui.maogoutd.recipes.datatype.RecipesOpenRuleStruct;
   import flash.utils.Dictionary;
   
   public class RecipesConfig
   {
      
      private static var m_Instace:RecipesConfig = new RecipesConfig();
      
      private var m_aryRecipesConfig:Array;
      
      private var m_iToRecipesNum:int;
      
      private var m_aryOpenRule:Array;
      
      public function RecipesConfig()
      {
         super();
         if(m_Instace)
         {
            return;
         }
      }
      
      public static function GetInstance() : RecipesConfig
      {
         return m_Instace;
      }
      
      public function GetRecipesConfig() : Array
      {
         return this.m_aryRecipesConfig;
      }
      
      public function LoaderRecipesXml() : void
      {
         if(this.m_aryRecipesConfig)
         {
            return;
         }
         var loader:AssetsLoader = new AssetsLoader();
         var dict:Dictionary = new Dictionary();
         dict["cookery"] = new AssetsItemData("./config/cookery.xml",AssetType.TXT,"cookery");
         loader.load(dict,{"onComplete":this.a_3003});
      }
      
      private function a_3003(dict:Dictionary) : void
      {
         if(Boolean(dict) && Boolean(dict["cookery"]))
         {
            this.AnalyXml(new XML(dict["cookery"].data));
            RecipesData.GetInstance().SetRecipesConfig(this.m_aryRecipesConfig,this.m_aryOpenRule,this.m_iToRecipesNum);
         }
      }
      
      private function AnalyXml(xmlConfig:XML) : void
      {
         var stuRecipesType:MenuConfigStruct = null;
         var aryRecipes:Array = null;
         var id:int = 0;
         var menu:XML = null;
         var xmlComposeRules:XML = null;
         var xmlRecipesInfo:RecipesMenuListItemStruct = null;
         var xmlAttr:XML = null;
         var aryCompose:Array = null;
         var aryAttr:Array = null;
         var recipesAttr:RecipesAttrStruct = null;
         var xmlItems:XML = null;
         var recipesComp:RecipesComposeStruct = null;
         var rule:XML = null;
         var xmlEnable:XML = null;
         var openRule:RecipesOpenRuleStruct = null;
         var attr:XML = null;
         var item:XML = null;
         var szCard:String = null;
         if(!this.m_aryRecipesConfig)
         {
            this.m_aryRecipesConfig = [];
         }
         var xmlClass:XML = xmlConfig.Classification[0];
         var dictType:Dictionary = new Dictionary();
         for each(menu in xmlClass.Menu)
         {
            stuRecipesType = new MenuConfigStruct();
            id = parseInt(menu.@id);
            stuRecipesType.m_MenuId = id;
            aryRecipes = [];
            dictType[id] = aryRecipes;
            stuRecipesType.m_aryListItem = aryRecipes;
            this.m_aryRecipesConfig.push(stuRecipesType);
         }
         this.m_iToRecipesNum = 0;
         xmlComposeRules = xmlConfig.ComposeRules[0];
         for each(rule in xmlComposeRules.Rule)
         {
            ++this.m_iToRecipesNum;
            aryAttr = [];
            aryCompose = [];
            xmlRecipesInfo = new RecipesMenuListItemStruct();
            xmlRecipesInfo.m_iSortId = rule.@id;
            xmlRecipesInfo.m_szRecipesId = rule.@dishID;
            id = parseInt(rule.@dishID);
            xmlRecipesInfo.m_iRecipesId = id;
            id = id >> 24 & 0xFF;
            xmlRecipesInfo.m_iValue = parseInt(rule.@value);
            xmlRecipesInfo.m_szRecipesName = rule.@name;
            xmlRecipesInfo.m_szRecipesDesc = rule.@desc;
            xmlRecipesInfo.m_szRecipesFuncDesc = rule.@funcdesc;
            xmlRecipesInfo.m_aryAttr = aryAttr;
            xmlRecipesInfo.m_aryCompose = aryCompose;
            aryRecipes = dictType[id];
            aryRecipes.push(xmlRecipesInfo);
            for each(attr in rule.Attr)
            {
               recipesAttr = new RecipesAttrStruct();
               recipesAttr.m_iAttrType = parseInt(attr.@type);
               szCard = attr.@attrCard;
               recipesAttr.m_aryCardId = szCard.split("|");
               recipesAttr.m_iValue = parseInt(attr.@add);
               aryAttr.push(recipesAttr);
            }
            xmlItems = rule.Items[0];
            for each(item in xmlItems.Item)
            {
               recipesComp = new RecipesComposeStruct();
               recipesComp.m_iCardId = parseInt(item.@id);
               recipesComp.m_iCardStar = parseInt(item.@level);
               if(311427072 == (recipesComp.m_iCardId & 0xFFF00000))
               {
                  xmlRecipesInfo.m_iPropRecipesId = recipesComp.m_iCardId;
               }
               else
               {
                  aryCompose.push(recipesComp);
               }
            }
            xmlRecipesInfo.m_ToProgress = aryCompose.length;
         }
         xmlEnable = xmlConfig.CookeryEnableRules[0];
         if(!this.m_aryOpenRule)
         {
            this.m_aryOpenRule = [];
         }
         for each(rule in xmlEnable.Rule)
         {
            openRule = new RecipesOpenRuleStruct();
            openRule.m_iFoodPoint = parseInt(rule.@value);
            openRule.m_iMaxOpen = parseInt(rule.@max);
            this.m_aryOpenRule.push(openRule);
         }
      }
   }
}

