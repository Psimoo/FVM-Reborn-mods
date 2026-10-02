package com.aurora.ui.maogoutd.compose.Fusion
{
   import com.aurora.ui.maogoutd.component.a_3228;
   import flash.utils.Dictionary;
   
   public class CardFusionConfig
   {
      
      private static var m_pInstance:CardFusionConfig;
      
      public var m_SelectRecipeInfo:CardFusionItem = null;
      
      public var m_iPackgaeAgentCount:int;
      
      public var m_iPackgaeAgentCardID:int;
      
      private var fusionRateMap:Dictionary = new Dictionary();
      
      private var fusionTypeInfo:Dictionary = new Dictionary();
      
      private var fusionRecipeMap:Dictionary = new Dictionary();
      
      private var fusionBaseConfig:Dictionary = new Dictionary();
      
      private var gradeRuleConfig:Dictionary = new Dictionary();
      
      private var fusionCardMap:Dictionary = new Dictionary();
      
      public function CardFusionConfig()
      {
         super();
      }
      
      public static function Get() : CardFusionConfig
      {
         if(!m_pInstance)
         {
            m_pInstance = new CardFusionConfig();
         }
         return m_pInstance;
      }
      
      public function a_2040(xml:XML) : void
      {
         this.parseFusionRate(xml.fusionRate[0]);
         this.parseFusionTab(xml.fusion[0]);
         this.parseFusionBaseConfig(xml.fusionBaseConfig[0]);
         this.parseGradeRuleConfig(xml.gradeRuleConfig[0]);
      }
      
      private function parseFusionTab(fusionXML:XML) : void
      {
         var tab:XML = null;
         var type:int = 0;
         var minStar:int = 0;
         var recipeList:Vector.<CardFusionItem> = null;
         var element:XML = null;
         var recipe:CardFusionItem = null;
         var mainID:Array = null;
         var obtainNode:XML = null;
         var items:XMLList = null;
         var obtainID:Array = null;
         var i:int = 0;
         var obtain:FusionObtainItem = null;
         var fusionMain:int = 0;
         for each(tab in fusionXML.fusion_tab)
         {
            type = int(tab.@type);
            minStar = int(tab.@minStar);
            this.fusionTypeInfo[type] = {"minStar":minStar};
            recipeList = new Vector.<CardFusionItem>();
            for each(element in tab.element)
            {
               recipe = new CardFusionItem();
               recipe.m_iRecipeID = int(element.@recipe_id);
               mainID = String(element.@main_id).split("|");
               recipe.m_iFirstMainID = mainID[0];
               if(mainID.length == 2)
               {
                  recipe.m_iSecondMainID = mainID[1];
               }
               recipe.m_iMainLevel = int(element.@main_level);
               recipe.m_iMainGrade = int(element.@main_grade);
               recipe.m_iAgentCount = int(element.@agent_count);
               recipe.m_iType = type;
               obtainNode = element.obtain[0];
               if(obtainNode)
               {
                  obtainID = String(obtainNode.@id).split("|");
                  for(i = 0; i < obtainID.length; i++)
                  {
                     obtain = new FusionObtainItem();
                     obtain.m_iObtainID = int(obtainID[i]);
                     obtain.m_iName = String(obtainNode.@name);
                     obtain.m_iDesc = String(obtainNode.@desc);
                     obtain.m_iType = int(element.@recipe_type);
                     obtain.m_iFusionType = type;
                     obtain.m_isGold = Boolean(int(obtainNode.@GoldType) == 1);
                     fusionMain = i == 0 ? recipe.m_iFirstMainID : recipe.m_iSecondMainID;
                     obtain.m_iOriginalCard.push(fusionMain);
                     if(this.fusionCardMap[fusionMain])
                     {
                        obtain.m_iOriginalCard = this.fusionCardMap[fusionMain].m_iOriginalCard.concat(obtain.m_iOriginalCard);
                     }
                     recipe.m_vecObtainInfos.push(obtain);
                     this.fusionCardMap[obtain.m_iObtainID] = obtain;
                  }
               }
               items = element.cost.item;
               if(items.length() > 0)
               {
                  recipe.m_iSubCardID = int(items[0].@item_id);
                  recipe.m_iMinSubCardLevel = int(items[0].@main_level);
               }
               recipeList.push(recipe);
               this.fusionRecipeMap[type + "_" + recipe.m_iRecipeID] = recipe;
            }
         }
      }
      
      private function parseFusionRate(xml:XML) : void
      {
         var item:XML = null;
         var id:int = 0;
         for each(item in xml.item)
         {
            id = int(item.@id);
            this.fusionRateMap[id] = {
               "rate_basic":Number(item.@rate_basic),
               "rate_deep":Number(item.@rate_deep),
               "rate_soul":Number(item.@rate_soul)
            };
         }
      }
      
      public function getFusionRateByIdAndType(id:int, type:int) : Number
      {
         var rate:Object = this.fusionRateMap[id];
         if(!rate)
         {
            return 0;
         }
         switch(type)
         {
            case 13:
               return rate.rate_basic;
            case 14:
               return rate.rate_deep;
            case 15:
               return rate.rate_soul;
            default:
               return 0;
         }
      }
      
      private function parseFusionBaseConfig(xml:XML) : void
      {
         var item:XML = null;
         var type:int = 0;
         for each(item in xml.item)
         {
            type = int(item.@type);
            this.fusionBaseConfig[type] = {
               "gold_cost":int(item.@gold_cost),
               "insurance_cost":int(item.@insurance_cost)
            };
         }
      }
      
      public function getFusionBaseConfigByType(type:int) : Object
      {
         var base:Object = this.fusionBaseConfig[type];
         if(!base)
         {
            return null;
         }
         return base;
      }
      
      private function parseGradeRuleConfig(xml:XML) : void
      {
         var item:XML = null;
         var level:int = 0;
         for each(item in xml.level_up)
         {
            level = int(item.@level);
            this.gradeRuleConfig[level] = {
               "foodSpirit_id":int(item.@foodSpirit_id),
               "success_rate":Number(item.@success_rate),
               "fail_drop":int(item.@fail_drop),
               "count":int(item.@count),
               "clover":int(item.@clover),
               "insurance":int(item.@insurance),
               "gold":int(item.@gold)
            };
         }
      }
      
      public function getGradeRuleByLevel(level:int) : Object
      {
         return this.gradeRuleConfig[level];
      }
      
      public function getMinStarByeType(type:int) : int
      {
         return this.fusionTypeInfo[type].minStar;
      }
      
      public function getRecipeInfo(type:int, recipe_id:int) : CardFusionItem
      {
         return this.fusionRecipeMap[type + "_" + recipe_id];
      }
      
      public function hasRecipe(type:int, recipe_id:int) : Boolean
      {
         return this.fusionRecipeMap[type + "_" + recipe_id] != null;
      }
      
      public function getFusionInfo(cardAttr:a_3228) : FusionObtainItem
      {
         return cardAttr ? this.fusionCardMap[cardAttr.CardID] : null;
      }
      
      public function GetRecipeByDefCard(iType:int, cardID:int) : CardFusionItem
      {
         var key:String = null;
         var value:CardFusionItem = null;
         for(key in this.fusionRecipeMap)
         {
            value = this.fusionRecipeMap[key];
            if(value.m_iType == iType && value.isRuleCard(cardID))
            {
               return value;
            }
         }
         return null;
      }
   }
}

