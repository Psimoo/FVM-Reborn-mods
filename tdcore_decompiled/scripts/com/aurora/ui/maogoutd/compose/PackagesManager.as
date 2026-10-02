package com.aurora.ui.maogoutd.compose
{
   import a_4714.AssetType;
   import a_4714.AssetsItemData;
   import a_4714.AssetsLoader;
   import a_4716.a_1730;
   import a_4716.a_1733;
   import a_4752.GameStringManager;
   import a_4752.IGameStringManager;
   import a_4754.a_2161;
   import com.aurora.ui.maogoutd.component.DefCard;
   import com.aurora.ui.maogoutd.component.PropsCard;
   import com.aurora.ui.maogoutd.component.PropsGrid;
   import com.aurora.ui.maogoutd.component.a_3228;
   import com.aurora.ui.maogoutd.compose.Fusion.CardFusionConfig;
   import com.aurora.ui.maogoutd.pag.a_3859;
   import com.aurora.ui.maogoutd.pag.a_3871;
   import com.aurora.ui.maogoutd.role.a_4461;
   import com.aurora.ui.maogoutd.role.a_4463;
   import flash.display.Bitmap;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.utils.Dictionary;
   
   public class PackagesManager extends Sprite
   {
      
      public var ppPackage:PopPropsCardPackage;
      
      public var mcPackage3:MovieClip;
      
      public var mcPackage2:MovieClip;
      
      public var mcPackage1:MovieClip;
      
      public var mcMaskBg:MovieClip;
      
      public var mcPackageNames:MovieClip;
      
      public var mcPackage2Names:MovieClip;
      
      private const PACKAGE_SIZE:int = 200;
      
      private const DIAMOND_IDS:Array = [305529104,305529120,305529360,305529376,305529616,305529632,305529872,305529888,305594640,305594656];
      
      private var propsPackage:a_3871;
      
      private var equipmentPackage:a_3871;
      
      private var m_stCharmCrystalPackage:a_3871;
      
      private var defCardPackage:a_3859;
      
      private var defCardPackageSize:int;
      
      private var tempNotBindingMixedCardAttr:a_3228;
      
      private var _consortiaData:Object;
      
      private var _type:int = -1;
      
      private var gsManager:IGameStringManager;
      
      public function PackagesManager()
      {
         super();
         this.init();
      }
      
      public static function createCard(cardAttr:a_3228, clickAbled:Boolean = true) : Sprite
      {
         var card:Sprite = null;
         if(cardAttr == null)
         {
            throw new Error("PackageManager::Error:在调用createCard方法时，提供的CardAttr为null!");
         }
         var cardType:int = cardAttr.GoodsCardType;
         if(cardType == 1)
         {
            card = new DefCard(cardAttr);
            DefCard(card).CardClickStatus = clickAbled;
         }
         else
         {
            card = new PropsCard(cardAttr);
            PropsCard(card).CardClickStatus = clickAbled;
         }
         loadCardImage(card,cardAttr,cardType);
         return card;
      }
      
      public static function getCardAttr(card:Sprite) : a_3228
      {
         if(card is DefCard)
         {
            return DefCard(card).cardAttr;
         }
         return PropsCard(card).cardAttr;
      }
      
      public static function getCardClickStatus(card:Sprite) : Boolean
      {
         if(card is DefCard)
         {
            return DefCard(card).CardClickStatus;
         }
         return PropsCard(card).CardClickStatus;
      }
      
      public static function isExistingCard(card:Sprite) : Boolean
      {
         if(card == null)
         {
            return false;
         }
         return getCardClickStatus(card);
      }
      
      public static function isPerpetualCard(card:Sprite) : Boolean
      {
         if(card is PropsCard)
         {
            throw new Error("PackagesManager::isPerpetualCard>>永久卡属性只针对防御卡！");
         }
         var attr:a_3228 = getCardAttr(card);
         return attr.ExpiredTime == -1 || attr.ExpiredTime == -2 && attr.DeltaTime == -1;
      }
      
      public static function isBindingCard(card:Sprite) : Boolean
      {
         var cardAttr:a_3228 = getCardAttr(card);
         return cardAttr.IsBind == 1;
      }
      
      public static function isMixedCard(CardID:int) : Boolean
      {
         var type:int = getCardType(CardID);
         return type == ConstantCompose.CARD_TYPE_PERFUME || type == ConstantCompose.CARD_TYPE_CRYSTAL || type == ConstantCompose.CARD_TYPE_SUPER_CRYSTAL;
      }
      
      public static function getPerpetualCards(cards:Array) : Array
      {
         var card:Sprite = null;
         var a:Array = new Array();
         var i:int = 0;
         var len:int = int(cards.length);
         while(i < len)
         {
            card = cards[i];
            if(isPerpetualCard(card))
            {
               a.push(cards[i]);
            }
            i++;
         }
         return a;
      }
      
      public static function getCardType(CardID:int) : int
      {
         var tempID1:int = CardID & 0xFFF00000;
         var tempID2:int = CardID & 0xFFFF0000;
         var tempID3:int = CardID & 0xFFFFFF00;
         if(tempID2 == 310378496)
         {
            return ConstantCompose.CARD_TYPE_CHARM_CRYSTAL_STONE;
         }
         if(tempID2 == 310444032)
         {
            return ConstantCompose.CARD_TYPE_CHARM_CRYSTAL_COMPOSE;
         }
         if(tempID2 == 310509568)
         {
            return ConstantCompose.CARD_TYPE_CHARM_CRYSTAL_RECIPE;
         }
         if(tempID1 == 344981504)
         {
            return ConstantCompose.CARD_TYPE_CHARM_CRYSTAL;
         }
         if(tempID2 == 314507264)
         {
            return ConstantCompose.PROPS_FUSIONAGENT;
         }
         if(tempID2 == 314441728)
         {
            return ConstantCompose.PROPS_FOODSPIRIT;
         }
         if(tempID1 == 313524224)
         {
            return ConstantCompose.PROPS_FUSIONRECIPE;
         }
         if(tempID2 == 306315264)
         {
            return ConstantCompose.CARD_TYPE_FORMULA;
         }
         if(tempID2 == 306249728)
         {
            return ConstantCompose.CARD_TYPE_MATERIAL;
         }
         if(tempID2 == 305397760)
         {
            return ConstantCompose.CARD_TYPE_PERFUME;
         }
         if(tempID2 == 305201152)
         {
            return ConstantCompose.CARD_TYPE_FRESH;
         }
         if(tempID2 == 305463296)
         {
            return ConstantCompose.CARD_TYPE_REDUCE;
         }
         if(tempID2 == 305332224)
         {
            return ConstantCompose.CARD_TYPE_PROTECT;
         }
         if(tempID2 == 305266688)
         {
            return ConstantCompose.CARD_TYPE_CLOVER;
         }
         if(tempID3 == 309330176)
         {
            return ConstantCompose.CARD_TYPE_SUPER_CRYSTAL;
         }
         if(tempID1 == 309329920)
         {
            return ConstantCompose.CARD_TYPE_CRYSTAL;
         }
         if(tempID2 == 305594368)
         {
            return ConstantCompose.CARD_TYPE_SEPARATE;
         }
         if(tempID2 == 305528832)
         {
            return ConstantCompose.CARD_TYPE_DIAMOND;
         }
         if(tempID1 > 335544320 && tempID1 < 352321536 && tempID1 != 343932928)
         {
            return ConstantCompose.CARD_TYPE_WEAPON;
         }
         if(tempID1 == 343932928)
         {
            return ConstantCompose.CARD_TYPE_GEM;
         }
         if(tempID1 == 325058560)
         {
            return ConstantCompose.CARD_TYPE_CERTIFICATE;
         }
         if(tempID2 == 303038464)
         {
            return ConstantCompose.CARD_TYPE_GOLD_CARD_EVOLUTION_CERTIFICATE;
         }
         if(tempID2 == 303104000)
         {
            return ConstantCompose.CARD_TYPE_ARTIFACT_EVOLUTION_CERTIFICATE;
         }
         if(tempID2 == 303169536)
         {
            return ConstantCompose.CARD_TYPE_GEM_EVOLUTION_CERTIFICATE;
         }
         return ConstantCompose.CARD_TYPE_DEFENSE;
      }
      
      public static function getCardID(type:int) : int
      {
         var id:int = 0;
         switch(type)
         {
            case ConstantCompose.CARD_TYPE_FORMULA:
               id = 306315264;
               break;
            case ConstantCompose.CARD_TYPE_MATERIAL:
               id = 306249728;
               break;
            case ConstantCompose.CARD_TYPE_PERFUME:
               id = 305397760;
               break;
            case ConstantCompose.CARD_TYPE_FRESH:
               id = 305201168;
               break;
            case ConstantCompose.CARD_TYPE_REDUCE:
               id = 305463312;
               break;
            case ConstantCompose.CARD_TYPE_PROTECT:
               id = 305332240;
               break;
            case ConstantCompose.CARD_TYPE_CLOVER:
               id = 305266704;
               break;
            case ConstantCompose.CARD_TYPE_CRYSTAL:
               id = 309329952;
               break;
            case ConstantCompose.CARD_TYPE_SUPER_CRYSTAL:
               id = 309330192;
               break;
            case ConstantCompose.CARD_TYPE_SEPARATE:
               id = 305594656;
               break;
            case ConstantCompose.CARD_TYPE_DIAMOND:
               id = 305529120;
               break;
            case ConstantCompose.CARD_TYPE_WEAPON:
               id = 335544320;
               break;
            case ConstantCompose.CARD_TYPE_GEM:
               id = 343932928;
               break;
            case ConstantCompose.CARD_TYPE_CERTIFICATE:
               id = 325058560;
               break;
            default:
               id = -1;
         }
         return id;
      }
      
      public static function getCardName(CardID:int) : String
      {
         var gsManager:IGameStringManager = GameStringManager.getInstance();
         var tempID1:int = CardID & 0xFFF00000;
         var tempID2:int = CardID & 0xFFFF0000;
         var tempID3:int = CardID & 0xFFFFFF00;
         if(tempID2 == 305397760)
         {
            return gsManager.getString(4342);
         }
         if(tempID2 == 305201152)
         {
            return gsManager.getString(4343);
         }
         if(tempID2 == 305463296)
         {
            return gsManager.getString(4352);
         }
         if(tempID2 == 305332224)
         {
            return gsManager.getString(4345);
         }
         if(tempID2 == 305266688)
         {
            return gsManager.getString(4344);
         }
         if(tempID3 == 309330176)
         {
            return "高级水晶";
         }
         if(tempID1 == 309329920)
         {
            return gsManager.getString(4346);
         }
         if(tempID2 == 306315264)
         {
            return gsManager.getString(4124);
         }
         if(tempID2 == 306249728)
         {
            return gsManager.getString(4125);
         }
         if(tempID2 == 305594368)
         {
            return gsManager.getString(4348);
         }
         if(tempID3 == 305529088)
         {
            return gsManager.getString(4349);
         }
         if(tempID3 == 305529344)
         {
            return gsManager.getString(4350);
         }
         if(tempID3 == 305529600)
         {
            return gsManager.getString(4351);
         }
         if(tempID3 == 305529856)
         {
            return gsManager.getString(4353);
         }
         if(tempID1 == 336592896)
         {
            return gsManager.getString(4178);
         }
         if(tempID1 == 343932928)
         {
            return gsManager.getString(4347);
         }
         return gsManager.getString(4177);
      }
      
      public static function getGemLevel(attr:a_3228) : int
      {
         var obj:Object = null;
         if(!attr || !attr.m_arrExtraAttr)
         {
            return 0;
         }
         var level:int = 0;
         var i:int = 0;
         var n:int = int(attr.m_arrExtraAttr.length);
         while(i < n)
         {
            obj = attr.m_arrExtraAttr[i];
            if(obj.m_cItemType == 10)
            {
               level = int(obj.m_iItemAdd);
               break;
            }
            i++;
         }
         return level;
      }
      
      private static function loadCardImage(card:Sprite, cardAttr:a_3228, cardType:int) : void
      {
         var loader:AssetsLoader = new AssetsLoader();
         var dict:Dictionary = new Dictionary(true);
         var id:String = cardAttr.URLID;
         var assetsData:AssetsItemData = new AssetsItemData(cardAttr.URL,AssetType.JPG,id);
         dict[id] = assetsData;
         loader.load(dict,{
            "onComplete":cardImageLoadOnComplete,
            "onCompleteParms":[card,id,cardType]
         });
      }
      
      private static function cardImageLoadOnComplete(dict:Dictionary, card:Sprite, id:String, cardType:int) : void
      {
         var bmp:Bitmap = new Bitmap();
         if(dict[id] != null)
         {
            if(dict[id].data is Bitmap)
            {
               bmp = dict[id].data as Bitmap;
            }
         }
         if(cardType == 1)
         {
            DefCard(card).Image = bmp;
         }
         else
         {
            PropsCard(card).Image = bmp;
         }
      }
      
      public function set consortiaData(value:Object) : void
      {
         this._consortiaData = value;
      }
      
      public function updateData() : void
      {
         ComposeData.getInstance().resetCardCount();
         this.updatePackage();
      }
      
      public function showPackage(type:int) : void
      {
         if(this._type == type)
         {
            return;
         }
         this._type = type;
         if(this.propsPackage.parent)
         {
            this.propsPackage.parent.removeChild(this.propsPackage);
         }
         if(this.defCardPackage.parent)
         {
            this.defCardPackage.parent.removeChild(this.defCardPackage);
         }
         if(this.equipmentPackage.parent)
         {
            this.equipmentPackage.parent.removeChild(this.equipmentPackage);
         }
         if(this.m_stCharmCrystalPackage.parent)
         {
            this.m_stCharmCrystalPackage.parent.removeChild(this.m_stCharmCrystalPackage);
         }
         if(this.mcMaskBg.parent)
         {
            this.mcMaskBg.parent.removeChild(this.mcMaskBg);
         }
         this.mcPackageNames.gotoAndStop("empty");
         this.mcPackage2Names.gotoAndStop("empty");
         switch(type)
         {
            case ConstantCompose.PANE_TYPE_MAKE:
            case ConstantCompose.PANE_TYPE_REMAKE:
            case ConstantCompose.PANE_TYPE_UPGRADE_CARD:
            case ConstantCompose.PANE_TYPE_TRANSFER_CARD:
            case ConstantCompose.PANE_TYPE_GOLD_CARD_EVOLUTION:
               if(type == ConstantCompose.PANE_TYPE_UPGRADE_CARD || type == ConstantCompose.PANE_TYPE_TRANSFER_CARD || type == ConstantCompose.PANE_TYPE_GOLD_CARD_EVOLUTION)
               {
                  addChild(this.mcMaskBg);
                  this.mcPackageNames.gotoAndStop("defCard");
                  this.defCardPackage.showCardPackage(this.mcPackage3);
               }
               else
               {
                  addChild(this.propsPackage);
                  this.mcPackageNames.gotoAndStop("empty");
                  this.defCardPackage.showCardPackage(this.mcPackage2);
               }
               this.updateDefCardPackage();
               this.updatePropsPackage();
               addChild(this.defCardPackage);
               break;
            case ConstantCompose.PANE_TYPE_UPGRADE_WEAPON:
            case ConstantCompose.PANE_TYPE_UPGRADE_GEM:
            case ConstantCompose.PANE_TYPE_RESOLVE_GEM:
            case ConstantCompose.PANE_TYPE_ARTIFACT_EVOLUTION:
               addChild(this.mcMaskBg);
               this.mcPackageNames.gotoAndStop("weapon");
               this.updateEquipmentPackage();
               addChild(this.equipmentPackage);
               break;
            case ConstantCompose.PANE_TYPE_GEM_EVOLUTION:
               addChild(this.mcMaskBg);
               this.mcPackageNames.gotoAndStop("weapon");
               this.updateGemoPackage();
               addChild(this.equipmentPackage);
               break;
            case ConstantCompose.PANE_TYPE_CHARM_CRYSTAL_COMPOSE:
            case ConstantCompose.PANE_TYPE_CHARM_CRYSTAL_UPGRADE:
            case ConstantCompose.PANE_TYPE_CHARM_CRYSTAL_DECOMPOSE:
               this.mcPackageNames.gotoAndStop(type == ConstantCompose.PANE_TYPE_CHARM_CRYSTAL_COMPOSE ? "repice" : "crystal");
               this.UpdateCrystalPackage();
               this.m_stCharmCrystalPackage.showCardPackage(this.mcPackage3);
               addChild(this.mcMaskBg);
               addChild(this.m_stCharmCrystalPackage);
               break;
            case ConstantCompose.PANE_TYPE_CARD_PRIMARYFUSION:
            case ConstantCompose.PANE_TYPE_CARD_DEEPFUSIONFUSION:
            case ConstantCompose.PANE_TYPE_CARD_SOULFUSIONFUSION:
               this.mcPackageNames.gotoAndStop("cookBook");
               this.mcPackage2Names.gotoAndStop("defCard");
               this.defCardPackage.showCardPackage(this.mcPackage2);
               addChild(this.defCardPackage);
               this.updateDefCardPackage();
               addChild(this.propsPackage);
               this.updatePropsPackage();
               break;
            case ConstantCompose.PANE_TYPE_CARD_UPGRADE:
               this.mcPackageNames.gotoAndStop("fusionCard");
               this.defCardPackage.showCardPackage(this.mcPackage3);
               addChild(this.mcMaskBg);
               addChild(this.defCardPackage);
               this.updateDefCardPackage();
               break;
            default:
               trace("PackagesManager::showPackage>>default");
         }
         this.updatePPPackage();
      }
      
      public function getMixedCardTotalCount(card:Sprite) : int
      {
         var cardAttr:a_3228 = getCardAttr(card);
         if(!PackagesManager.isMixedCard(cardAttr.CardID))
         {
            throw new Error("PackagesManager::getMixedCardTotalCount-->参数错误。0x" + cardAttr.CardID.toString(16) + "不支持混合使用！");
         }
         var dictTempMixedCardCount:Dictionary = ComposeData.getInstance().dictPropsCardCount;
         var temp:a_3228 = this.getSameMixedCardAttr(cardAttr.CardID);
         var count:int = int(dictTempMixedCardCount[cardAttr.CardID]);
         if(temp)
         {
            count += dictTempMixedCardCount[temp.CardID];
         }
         return count;
      }
      
      public function getBindingMixedCardCount(card:Sprite) : int
      {
         var cardAttr:a_3228 = getCardAttr(card);
         if(!isMixedCard(cardAttr.CardID))
         {
            throw new Error("PackagesManager::getBindingMixedCardCount-->参数错误");
         }
         var count:int = cardAttr.CardCount - (null == this.tempNotBindingMixedCardAttr ? 0 : this.tempNotBindingMixedCardAttr.CardCount);
         this.tempNotBindingMixedCardAttr = null;
         return count;
      }
      
      public function getAgentCardID(count:int) : PropsCard
      {
         var card:PropsCard = null;
         var cardID:int = 0;
         var tempID1:int = 0;
         var countNow:int = 0;
         var allCards:Array = this.ppPackage.getPackage().getAllPropsCard();
         var bindCardID:int = 314507280;
         var unbindCardID:int = 314507296;
         switch(this._type)
         {
            case ConstantCompose.PANE_TYPE_CARD_PRIMARYFUSION:
               bindCardID = 314507280;
               unbindCardID = 314507296;
               break;
            case ConstantCompose.PANE_TYPE_CARD_DEEPFUSIONFUSION:
               bindCardID = 314507536;
               unbindCardID = 314507552;
               break;
            case ConstantCompose.PANE_TYPE_CARD_SOULFUSIONFUSION:
               bindCardID = 314507792;
               unbindCardID = 314507808;
         }
         CardFusionConfig.Get().m_iPackgaeAgentCount = 0;
         CardFusionConfig.Get().m_iPackgaeAgentCardID = bindCardID;
         var candidateBind:PropsCard = null;
         var candidateUnbind:PropsCard = null;
         var maxCard:PropsCard = null;
         var maxCount:int = 0;
         for(var i:int = 0; i < allCards.length; i++)
         {
            card = allCards[i];
            cardID = card.cardAttr.CardID;
            tempID1 = cardID & 0xFFFF0000;
            if(314507264 == tempID1)
            {
               countNow = card.cardAttr.CardCount;
               if(cardID == bindCardID && countNow >= count)
               {
                  candidateBind = card;
               }
               else if(cardID == unbindCardID && countNow >= count)
               {
                  candidateUnbind = card;
               }
               if(countNow > maxCount)
               {
                  maxCount = countNow;
                  maxCard = card;
               }
               if(Boolean(candidateBind) && Boolean(candidateUnbind))
               {
                  break;
               }
            }
         }
         if(candidateBind)
         {
            CardFusionConfig.Get().m_iPackgaeAgentCount = candidateBind.cardAttr.CardCount;
            CardFusionConfig.Get().m_iPackgaeAgentCardID = candidateBind.cardAttr.CardID;
            return candidateBind;
         }
         if(candidateUnbind)
         {
            CardFusionConfig.Get().m_iPackgaeAgentCount = candidateUnbind.cardAttr.CardCount;
            CardFusionConfig.Get().m_iPackgaeAgentCardID = candidateUnbind.cardAttr.CardID;
            return candidateUnbind;
         }
         if(maxCard)
         {
            CardFusionConfig.Get().m_iPackgaeAgentCount = maxCard.cardAttr.CardCount;
            CardFusionConfig.Get().m_iPackgaeAgentCardID = maxCard.cardAttr.CardID;
            return null;
         }
         return null;
      }
      
      public function getFusionMinLeveCard(id:int) : DefCard
      {
         var tempdef:DefCard = null;
         var allCards:Array = this.defCardPackage.getAllDefCard().concat();
         var returnDef:DefCard = null;
         var grade:int = 0;
         var leve:int = 12;
         if(CardFusionConfig.Get().m_SelectRecipeInfo.m_iFirstMainID == id || CardFusionConfig.Get().m_SelectRecipeInfo.m_iSecondMainID == id)
         {
            leve = CardFusionConfig.Get().m_SelectRecipeInfo.m_iMainLevel;
            grade = CardFusionConfig.Get().m_SelectRecipeInfo.m_iMainGrade;
         }
         else if(CardFusionConfig.Get().m_SelectRecipeInfo.m_iSubCardID == id)
         {
            leve = CardFusionConfig.Get().m_SelectRecipeInfo.m_iMinSubCardLevel;
         }
         var i:int = 0;
         var len:int = int(allCards.length);
         while(i < len)
         {
            tempdef = allCards[i];
            if(id == tempdef.cardAttr.CardID && tempdef.cardAttr.TypeValue >= leve && tempdef.cardAttr.GradeLevel >= grade)
            {
               if(returnDef == null)
               {
                  returnDef = tempdef;
               }
               else if(tempdef.cardAttr.TypeValue < returnDef.cardAttr.TypeValue)
               {
                  returnDef = tempdef;
               }
            }
            i++;
         }
         return returnDef;
      }
      
      public function packageIsFull(type:int) : Boolean
      {
         var openSize:int = int(a_2161.e.GetPackageOpenedNumByType(type));
         var usedSize:int = int((a_2161.e.GetCardsByType(type) as Array).length);
         return usedSize >= openSize;
      }
      
      public function resetCardsToPane(cards:Array) : void
      {
         var card:Sprite = null;
         var cardAttr:a_3228 = null;
         var cardType:int = 0;
         if(!cards || cards.length == 0)
         {
            return;
         }
         var i:int = 0;
         var n:int = int(cards.length);
         while(i < n)
         {
            card = cards[i];
            cardAttr = PackagesManager.getCardAttr(card);
            cardType = PackagesManager.getCardType(cardAttr.CardID);
            switch(cardType)
            {
               case ConstantCompose.CARD_TYPE_DEFENSE:
                  this.defCardPackage.removeDefCard(DefCard(card));
                  break;
               case ConstantCompose.CARD_TYPE_WEAPON:
               case ConstantCompose.CARD_TYPE_GEM:
                  this.equipmentPackage.removePropsCard(PropsCard(card));
                  break;
               default:
                  if(PackagesManager.isMixedCard(cardAttr.CardID))
                  {
                     if(this.tempNotBindingMixedCardAttr)
                     {
                        this.getPropsPackage(cardType).removePropsCardAttr(this.tempNotBindingMixedCardAttr);
                        cardAttr.CardCount -= this.tempNotBindingMixedCardAttr.CardCount;
                     }
                  }
                  this.getPropsPackage(cardType).removePropsCardAttr(cardAttr);
            }
            i++;
         }
      }
      
      public function removeCard(card:Sprite, needCount:int = 1) : Sprite
      {
         var cardAttr2:a_3228 = null;
         var removeCard:Sprite = null;
         var cardAttr:a_3228 = PackagesManager.getCardAttr(card);
         var type:int = PackagesManager.getCardType(cardAttr.CardID);
         if(type == ConstantCompose.CARD_TYPE_DEFENSE)
         {
            this.defCardPackage.removeDefCard(DefCard(card));
            return card;
         }
         if((type == ConstantCompose.CARD_TYPE_WEAPON || type == ConstantCompose.CARD_TYPE_GEM) && type != ConstantCompose.CARD_TYPE_CHARM_CRYSTAL_RECIPE)
         {
            this.equipmentPackage.removePropsCardAttr(cardAttr);
            return card;
         }
         if(type == ConstantCompose.CARD_TYPE_CERTIFICATE)
         {
            this.ppPackage.getPackage().removePropsCard(PropsCard(card));
            return card;
         }
         if(type == ConstantCompose.CARD_TYPE_CHARM_CRYSTAL_STONE)
         {
            needCount = 0;
         }
         if(PackagesManager.isMixedCard(cardAttr.CardID))
         {
            if(needCount <= 1)
            {
               needCount = this.getMixedCardNeedCount(cardAttr.CardID);
            }
            if(cardAttr.CardCount < needCount)
            {
               if(this.getMixedCardTotalCount(card) < needCount)
               {
                  throw new Error("PackagesManager::removeCard>>删除混合卡牌出错！背包数据异常！");
               }
               cardAttr2 = this.getSameMixedCardAttr(cardAttr.CardID);
               if(!cardAttr2)
               {
                  throw new Error("PackagesManager::removeCard>>删除混合卡牌出错！配置文件中没有对应的卡牌数据，或者背包数据异常！");
               }
               if(PackagesManager.isBindingCard(card))
               {
                  cardAttr2 = cardAttr2.clone();
                  cardAttr2.CardCount = needCount - cardAttr.CardCount;
                  this.ppPackage.getPackage().removePropsCardAttr(cardAttr2);
                  this.tempNotBindingMixedCardAttr = cardAttr2;
                  cardAttr2 = cardAttr;
               }
               else
               {
                  this.tempNotBindingMixedCardAttr = cardAttr.clone();
                  cardAttr2 = cardAttr2.clone();
                  cardAttr2.CardCount = needCount - cardAttr.CardCount;
                  this.ppPackage.getPackage().removePropsCardAttr(cardAttr);
               }
            }
            else
            {
               cardAttr2 = cardAttr.clone();
               cardAttr2.CardCount = needCount;
            }
         }
         else
         {
            cardAttr2 = cardAttr.clone();
            cardAttr2.CardCount = needCount;
         }
         this.getPropsPackage(type).removePropsCardAttr(cardAttr2);
         cardAttr2.CardCount = needCount;
         return createCard(cardAttr2);
      }
      
      public function addCard(card:Sprite) : Boolean
      {
         var cardAttr:a_3228 = getCardAttr(card);
         var type:int = getCardType(cardAttr.CardID);
         switch(type)
         {
            case ConstantCompose.CARD_TYPE_DEFENSE:
               return this.defCardPackage.showCardByDefGrid(DefCard(card),cardAttr.CardPositionID);
            case ConstantCompose.CARD_TYPE_WEAPON:
               return this.equipmentPackage.showCardByPropsGrid(PropsCard(card),cardAttr.CardPositionID);
            default:
               var tempPropsPackage:a_3871 = this.getPropsPackage(type);
               if(isMixedCard(cardAttr.CardID))
               {
                  if(this.tempNotBindingMixedCardAttr)
                  {
                     if(tempPropsPackage.getPropsCard(this.tempNotBindingMixedCardAttr.ID) != null)
                     {
                        tempPropsPackage.addPropsCardAttr(this.tempNotBindingMixedCardAttr);
                     }
                     else
                     {
                        tempPropsPackage.showCardByPropsGrid(PropsCard(createCard(this.tempNotBindingMixedCardAttr)),this.tempNotBindingMixedCardAttr.CardPositionID);
                     }
                     cardAttr.CardCount -= this.tempNotBindingMixedCardAttr.CardCount;
                     PropsCard(card).showCardCount();
                     this.tempNotBindingMixedCardAttr = null;
                  }
               }
               this.CheckEquipHandler(cardAttr);
               if(tempPropsPackage.getPropsCard(cardAttr.ID) != null)
               {
                  tempPropsPackage.addPropsCardAttr(getCardAttr(card));
               }
               else
               {
                  tempPropsPackage.showCardByPropsGrid(PropsCard(card),cardAttr.CardPositionID);
               }
               return true;
         }
      }
      
      public function getCardsByIds(ids:Array) : Array
      {
         var a:Array = [];
         var i:int = 0;
         var len:int = int(ids.length);
         while(i < len)
         {
            this.getCardById(Number(ids[i]),a);
            i++;
         }
         return a;
      }
      
      public function getDiamond(pst:int) : Sprite
      {
         var ids:Array = [];
         var n:int = int(this.DIAMOND_IDS.length);
         if(pst < (n - 2) * 0.5)
         {
            n -= 2;
         }
         for(var i:int = pst * 2; i < n; i++)
         {
            ids.push(this.DIAMOND_IDS[i]);
         }
         var cards:Array = this.getCardsByIds(ids);
         return cards[0];
      }
      
      public function getDiamondID(pst:int) : int
      {
         return this.DIAMOND_IDS[pst * 2 + 1];
      }
      
      public function needCountReply(card:Sprite, needCount:int = 1) : void
      {
         var currentCount:int = 0;
         var cardName:String = null;
         var msg:String = null;
         var cardAttr:a_3228 = PackagesManager.getCardAttr(card);
         if(PackagesManager.getCardType(cardAttr.CardID) == ConstantCompose.CARD_TYPE_CRYSTAL || PackagesManager.getCardType(cardAttr.CardID) == ConstantCompose.CARD_TYPE_SUPER_CRYSTAL)
         {
            currentCount = this.getMixedCardTotalCount(card);
            if(currentCount < needCount)
            {
               cardName = PackagesManager.getCardName(cardAttr.CardID);
               msg = this.gsManager.getString(69686,[needCount,cardName,cardName]);
               dispatchEvent(new ComposeUIEvent(ComposeUIEvent.SHOW_TIP,msg));
            }
            else
            {
               dispatchEvent(new ComposeUIEvent(ComposeUIEvent.REQUEST_ADD_CRYSTAL,{
                  "card":card,
                  "needCount":needCount
               }));
            }
         }
      }
      
      private function init() : void
      {
         this.gsManager = GameStringManager.getInstance();
         this.initPackages();
         addEventListener(MouseEvent.CLICK,this.thisClickHandler);
      }
      
      private function initPackages() : void
      {
         this.propsPackage = new a_3871();
         addChild(this.propsPackage);
         this.propsPackage.showCardPackage(this.mcPackage1);
         this.propsPackage.setSize(this.PACKAGE_SIZE,7,1);
         this.defCardPackage = new a_3859();
         this.defCardPackageSize = this.PACKAGE_SIZE;
         addChild(this.defCardPackage);
         this.defCardPackage.showCardPackage(this.mcPackage2);
         this.defCardPackage.setSize(this.PACKAGE_SIZE,7,1);
         this.equipmentPackage = new a_3871();
         addChild(this.equipmentPackage);
         this.equipmentPackage.showCardPackage(this.mcPackage3);
         this.equipmentPackage.setSize(this.PACKAGE_SIZE,7,1);
         this.m_stCharmCrystalPackage = new a_3871();
         addChild(this.m_stCharmCrystalPackage);
         this.m_stCharmCrystalPackage.showCardPackage(this.mcPackage3);
         this.m_stCharmCrystalPackage.setSize(this.PACKAGE_SIZE,7,1);
         removeChild(this.mcPackage1);
         removeChild(this.mcPackage2);
         removeChild(this.mcPackage3);
      }
      
      private function updatePackage() : void
      {
         this.updatePropsPackage();
         if(this._type == ConstantCompose.PANE_TYPE_GEM_EVOLUTION)
         {
            this.updateGemoPackage();
         }
         else
         {
            this.updateEquipmentPackage();
         }
         this.updateDefCardPackage();
         this.updatePPPackage();
         this.UpdateCrystalPackage();
      }
      
      private function updateGemoPackage() : void
      {
         var i:int = 0;
         var n:int = 0;
         var cardAttr:a_3228 = null;
         var type:int = 0;
         var card:PropsCard = null;
         var equipmentCardData:Array = ComposeData.getInstance().equipmentCardData;
         if(!equipmentCardData)
         {
            return;
         }
         var isGenDecompose:Boolean = this._type == ConstantCompose.PANE_TYPE_GEM_EVOLUTION;
         var arrCards:Array = [];
         for(i = 0; i < equipmentCardData.length; i++)
         {
            cardAttr = equipmentCardData[i];
            if(!(isGenDecompose && (cardAttr.CardID & 0xFFF00000) == 336592896))
            {
               if((cardAttr.CardID & 0xFFF00000) != 344981504)
               {
                  cardAttr.CardPositionID = arrCards.length;
                  type = getCardType(cardAttr.CardID);
                  if(type == ConstantCompose.CARD_TYPE_GEM)
                  {
                     card = new PropsCard(cardAttr);
                     arrCards.push(card);
                  }
               }
            }
         }
         this.equipmentPackage.dataProvider = arrCards;
      }
      
      private function updateEquipmentPackage() : void
      {
         var i:int = 0;
         var n:int = 0;
         var cardAttr:a_3228 = null;
         var type:int = 0;
         var card:PropsCard = null;
         var card1:PropsCard = null;
         var equipmentCardData:Array = ComposeData.getInstance().equipmentCardData;
         if(!equipmentCardData)
         {
            return;
         }
         var isGenDecompose:Boolean = this._type == ConstantCompose.PANE_TYPE_RESOLVE_GEM;
         var arrCards:Array = [];
         for(i = 0; i < equipmentCardData.length; i++)
         {
            cardAttr = equipmentCardData[i];
            if(!(isGenDecompose && (cardAttr.CardID & 0xFFF00000) == 336592896))
            {
               if((cardAttr.CardID & 0xFFF00000) != 344981504)
               {
                  cardAttr.CardPositionID = arrCards.length;
                  if(this._type == ConstantCompose.PANE_TYPE_ARTIFACT_EVOLUTION)
                  {
                     type = getCardType(cardAttr.CardID);
                     if(type == ConstantCompose.CARD_TYPE_WEAPON)
                     {
                        card = new PropsCard(cardAttr);
                        arrCards.push(card);
                     }
                  }
                  else
                  {
                     card1 = new PropsCard(cardAttr);
                     arrCards.push(card1);
                  }
               }
            }
         }
         this.equipmentPackage.dataProvider = arrCards;
      }
      
      private function updateDefCardPackage() : void
      {
         var cardAttr:a_3228 = null;
         var obj:Boolean = false;
         var minValue:int = 0;
         var ef:int = 0;
         var defCardData:Array = ComposeData.getInstance().defCardData;
         if(!defCardData)
         {
            return;
         }
         var isRemake:Boolean = ConstantCompose.PANE_TYPE_REMAKE == this._type;
         var isTransfer:Boolean = ConstantCompose.PANE_TYPE_TRANSFER_CARD == this._type;
         var data:Array = new Array();
         var numExpiredTimeCards:int = 0;
         var i:int = 0;
         for(var n:int = int(defCardData.length); i < n; i++)
         {
            cardAttr = defCardData[i];
            if(!isRemake && cardAttr.IsExpiredTime)
            {
               numExpiredTimeCards++;
            }
            else
            {
               if(isTransfer)
               {
                  obj = ComposeConfig.getInstance().isTransferCard(cardAttr.CardID);
                  if(obj == false)
                  {
                     continue;
                  }
               }
               else if(this._type == ConstantCompose.PANE_TYPE_CARD_PRIMARYFUSION || this._type == ConstantCompose.PANE_TYPE_CARD_DEEPFUSIONFUSION || this._type == ConstantCompose.PANE_TYPE_CARD_SOULFUSIONFUSION)
               {
                  minValue = CardFusionConfig.Get().getMinStarByeType(this._type);
                  if(cardAttr.TypeValue < minValue)
                  {
                     continue;
                  }
                  ef = cardAttr.CardID & 0x0F;
                  if(ef != 15 && ef != 12 && ef != 13 && cardAttr.GradeLevel < 1)
                  {
                     continue;
                  }
               }
               else if(this._type == ConstantCompose.PANE_TYPE_CARD_UPGRADE)
               {
                  if(cardAttr.GradeLevel < 1)
                  {
                     continue;
                  }
               }
               cardAttr.CardPositionID = data.length;
               data.push(new DefCard(cardAttr));
            }
         }
         this.defCardPackageSize = int(a_2161.e.GetPackageOpenedNumByType(a_1730.card_slot_package_game_card));
         this.defCardPackage.setSize(this.defCardPackageSize - numExpiredTimeCards,7,1);
         var tempListPosition:Number = this.defCardPackage.getListPosition();
         this.defCardPackage.dataProvider = data;
         this.defCardPackage.setListPosition(tempListPosition);
      }
      
      private function updatePropsPackage() : void
      {
         var cardAttr:a_3228 = null;
         var cardID:int = 0;
         var mainType:int = 0;
         var subType:int = 0;
         var propsCardData:Array = ComposeData.getInstance().propsCardData;
         if(!propsCardData)
         {
            return;
         }
         var isRemake:Boolean = ConstantCompose.PANE_TYPE_REMAKE == this._type;
         var data:Array = new Array();
         var i:int = 0;
         var len:int = int(propsCardData.length);
         while(i < len)
         {
            cardAttr = propsCardData[i];
            cardID = cardAttr.CardID;
            mainType = cardID & 0xFFF00000;
            subType = cardID & 0xFFFF0000;
            if(!(cardID == a_1733.enm_DaLaBa || cardID == a_1733.enm_WordBossDaLaBa || mainType == 307232768 || mainType == 304087040))
            {
               if(!(isRemake && subType == 306315264))
               {
                  if(this._type == ConstantCompose.PANE_TYPE_CARD_PRIMARYFUSION || this._type == ConstantCompose.PANE_TYPE_CARD_DEEPFUSIONFUSION || this._type == ConstantCompose.PANE_TYPE_CARD_SOULFUSIONFUSION)
                  {
                     if(CardFusionConfig.Get().hasRecipe(this._type,cardID))
                     {
                        cardAttr.CardPositionID = data.length;
                        data.push(new PropsCard(cardAttr));
                     }
                  }
                  else if(subType == 306315264 || subType == 306249728)
                  {
                     cardAttr.CardPositionID = data.length;
                     data.push(new PropsCard(cardAttr));
                  }
               }
            }
            i++;
         }
         this.propsPackage.dataProvider = data;
      }
      
      private function UpdateCrystalPackage() : void
      {
         var i:int = 0;
         var tempID:int = 0;
         var cardAttr:a_3228 = null;
         var card:PropsCard = null;
         var type:int = 0;
         var bIsEquip:Boolean = false;
         var bIsClick:Boolean = false;
         var heroItem:a_4461 = null;
         var equipmentCardData:Array = ComposeData.getInstance().equipmentCardData;
         var propsCardData:Array = ComposeData.getInstance().propsCardData;
         var roleData:a_4463 = a_2161.e.GetCurrentRole() as a_4463;
         if(!equipmentCardData)
         {
            return;
         }
         var arrCards:Array = [];
         var isCrystalDecompose:Boolean = this._type == ConstantCompose.PANE_TYPE_CHARM_CRYSTAL_DECOMPOSE;
         for(i = 0; i < propsCardData.length; i++)
         {
            cardAttr = propsCardData[i] as a_3228;
            type = getCardType(cardAttr.CardID);
            if(type == ConstantCompose.CARD_TYPE_CHARM_CRYSTAL_RECIPE)
            {
               cardAttr.CardPositionID = arrCards.length;
               card = new PropsCard(cardAttr);
               arrCards.push(card);
            }
         }
         for(i = 0; i < equipmentCardData.length; i++)
         {
            cardAttr = equipmentCardData[i] as a_3228;
            type = getCardType(cardAttr.CardID);
            if(type == ConstantCompose.CARD_TYPE_CHARM_CRYSTAL)
            {
               bIsClick = false;
               bIsEquip = false;
               for each(heroItem in roleData.m_arrHeroItemID)
               {
                  if(heroItem.m_iItemID == cardAttr.CardID && heroItem.m_iItemSeq == cardAttr.CardSeq)
                  {
                     if(isCrystalDecompose)
                     {
                        bIsClick = true;
                     }
                     bIsEquip = true;
                     break;
                  }
               }
               cardAttr.m_bIsEquip = bIsEquip;
               cardAttr.m_bIsClick = bIsClick;
               cardAttr.CardPositionID = arrCards.length;
               card = new PropsCard(cardAttr);
               arrCards.push(card);
            }
         }
         this.m_stCharmCrystalPackage.dataProvider = arrCards;
      }
      
      public function CheckEquipHandler(cardAttr:a_3228) : void
      {
         var bIsEquip:Boolean = false;
         var bIsClick:Boolean = false;
         var heroItem:a_4461 = null;
         var roleData:a_4463 = a_2161.e.GetCurrentRole() as a_4463;
         var isCrystalDecompose:Boolean = this._type == ConstantCompose.PANE_TYPE_CHARM_CRYSTAL_DECOMPOSE;
         bIsClick = false;
         bIsEquip = false;
         for each(heroItem in roleData.m_arrHeroItemID)
         {
            if(heroItem.m_iItemID == cardAttr.CardID && heroItem.m_iItemSeq == cardAttr.CardSeq)
            {
               if(isCrystalDecompose)
               {
                  bIsClick = true;
               }
               bIsEquip = true;
               break;
            }
         }
         cardAttr.m_bIsClick = bIsClick;
         cardAttr.m_bIsEquip = bIsEquip;
      }
      
      private function updatePPPackage() : void
      {
         var cardAttr:a_3228 = null;
         var tempID1:int = 0;
         var tempID2:int = 0;
         var CardID:int = 0;
         var b:Boolean = false;
         var propsCardData:Array = ComposeData.getInstance().propsCardData;
         var specialCardData:Array = ComposeData.getInstance().specialCardData;
         if(!propsCardData && !specialCardData)
         {
            return;
         }
         var data:Array = new Array();
         var i:int = 0;
         var len:int = int(propsCardData.length);
         while(i < len)
         {
            CardID = int(propsCardData[i].CardID);
            tempID1 = CardID & 0xFFF00000;
            tempID2 = CardID & 0xFFFF0000;
            b = false;
            switch(this._type)
            {
               case ConstantCompose.PANE_TYPE_MAKE:
                  b = tempID2 == 305201152 || tempID2 == 305397760;
                  break;
               case ConstantCompose.PANE_TYPE_REMAKE:
                  b = tempID2 == 305201152 || tempID2 == 305463296;
                  break;
               case ConstantCompose.PANE_TYPE_UPGRADE_CARD:
                  b = tempID2 == 305266688;
                  break;
               case ConstantCompose.PANE_TYPE_UPGRADE_WEAPON:
                  b = tempID2 == 305528832 || tempID2 == 305594368;
                  break;
               case ConstantCompose.PANE_TYPE_UPGRADE_GEM:
                  b = tempID2 == 305266688 || tempID1 == 309329920;
                  break;
               case ConstantCompose.PANE_TYPE_RESOLVE_GEM:
                  b = tempID1 == 309329920;
                  break;
               case ConstantCompose.PANE_TYPE_CHARM_CRYSTAL_COMPOSE:
                  b = tempID2 == 310444032;
                  break;
               case ConstantCompose.PANE_TYPE_CHARM_CRYSTAL_UPGRADE:
                  b = tempID2 == 310378496;
                  break;
               case ConstantCompose.PANE_TYPE_GOLD_CARD_EVOLUTION:
                  b = tempID2 == 303038464;
                  break;
               case ConstantCompose.PANE_TYPE_ARTIFACT_EVOLUTION:
                  b = tempID2 == 303104000;
                  break;
               case ConstantCompose.PANE_TYPE_GEM_EVOLUTION:
                  b = tempID2 == 303169536;
                  break;
               case ConstantCompose.PANE_TYPE_CARD_PRIMARYFUSION:
                  b = CardID == 314507280 || CardID == 314507296;
                  break;
               case ConstantCompose.PANE_TYPE_CARD_DEEPFUSIONFUSION:
                  b = CardID == 314507536 || CardID == 314507552;
                  break;
               case ConstantCompose.PANE_TYPE_CARD_SOULFUSIONFUSION:
                  b = CardID == 314507792 || CardID == 314507808;
                  break;
               case ConstantCompose.PANE_TYPE_CARD_UPGRADE:
                  b = tempID2 == 305266688 || tempID2 == 314441728;
                  break;
               default:
                  trace("PackagesManager::updatePPPackage>>default>_type=" + this._type);
            }
            if(b)
            {
               cardAttr = propsCardData[i];
               cardAttr.CardPositionID = data.length;
               data.push(new PropsCard(cardAttr));
            }
            i++;
         }
         for(var j:int = 0; j < specialCardData.length; j++)
         {
            CardID = int(specialCardData[j].CardID);
            tempID1 = CardID & 0xFFF00000;
            tempID2 = CardID & 0xFFFF0000;
            b = false;
            switch(this._type)
            {
               case ConstantCompose.PANE_TYPE_TRANSFER_CARD:
                  b = tempID1 == 325058560;
            }
            if(b)
            {
               cardAttr = specialCardData[j];
               cardAttr.CardPositionID = data.length;
               data.push(new PropsCard(cardAttr));
            }
         }
         this.ppPackage.getPackage().dataProvider = data;
         this.ppPackage.updateData();
      }
      
      public function getCardById(id:int, arr:Array) : void
      {
         var allCards:Array = null;
         var type:int = getCardType(id);
         if(type == ConstantCompose.CARD_TYPE_DEFENSE)
         {
            allCards = this.defCardPackage.getAllDefCard();
         }
         else if(type == ConstantCompose.CARD_TYPE_CERTIFICATE)
         {
            allCards = this.ppPackage.getUniqueCards();
         }
         else if(type == ConstantCompose.CARD_TYPE_CHARM_CRYSTAL_COMPOSE)
         {
            this.ppPackage.getPackage().sortPropsCardPackage(null);
            allCards = this.ppPackage.getPackage().getAllPropsCard();
         }
         else
         {
            allCards = this.getPropsPackage(type).getAllPropsCard();
         }
         var i:int = 0;
         var len:int = int(allCards.length);
         while(i < len)
         {
            if(id == allCards[i].cardAttr.CardID)
            {
               arr.push(allCards[i]);
            }
            i++;
         }
      }
      
      public function isHasCard(id:int, minTypeValue:int, minGradelv:int) : Boolean
      {
         var allCards:Array = null;
         var type:int = getCardType(id);
         if(type == ConstantCompose.CARD_TYPE_DEFENSE)
         {
            allCards = this.defCardPackage.getAllDefCard();
         }
         else if(type == ConstantCompose.CARD_TYPE_CERTIFICATE)
         {
            allCards = this.ppPackage.getUniqueCards();
         }
         else if(type == ConstantCompose.CARD_TYPE_CHARM_CRYSTAL_COMPOSE)
         {
            this.ppPackage.getPackage().sortPropsCardPackage(null);
            allCards = this.ppPackage.getPackage().getAllPropsCard();
         }
         else
         {
            allCards = this.getPropsPackage(type).getAllPropsCard();
         }
         var i:int = 0;
         var len:int = int(allCards.length);
         while(i < len)
         {
            if(id == allCards[i].cardAttr.CardID && allCards[i].cardAttr.TypeValue >= minTypeValue && allCards[i].cardAttr.GradeLevel >= minGradelv)
            {
               return true;
            }
            i++;
         }
         return false;
      }
      
      private function getPropsPackage(type:int) : a_3871
      {
         var pcPackage:a_3871 = null;
         if(type == ConstantCompose.CARD_TYPE_DEFENSE)
         {
            return null;
         }
         switch(type)
         {
            case ConstantCompose.CARD_TYPE_FORMULA:
            case ConstantCompose.CARD_TYPE_MATERIAL:
            case ConstantCompose.PROPS_FUSIONRECIPE:
               pcPackage = this.propsPackage;
               break;
            case ConstantCompose.CARD_TYPE_WEAPON:
            case ConstantCompose.CARD_TYPE_GEM:
               pcPackage = this.equipmentPackage;
               break;
            case ConstantCompose.CARD_TYPE_CHARM_CRYSTAL:
            case ConstantCompose.CARD_TYPE_CHARM_CRYSTAL_RECIPE:
               pcPackage = this.m_stCharmCrystalPackage;
               break;
            case ConstantCompose.CARD_TYPE_CHARM_CRYSTAL_COMPOSE:
            case ConstantCompose.PROPS_FUSIONAGENT:
            case ConstantCompose.PROPS_FOODSPIRIT:
               pcPackage = this.ppPackage.getPackage();
               break;
            default:
               pcPackage = this.ppPackage.getPackage();
         }
         return pcPackage;
      }
      
      private function getSameMixedCardAttr(id:int) : a_3228
      {
         var sameItem:XML = ComposeConfig.getInstance().getSameTypeAssistantItem(id);
         if(!sameItem)
         {
            return null;
         }
         var id2:int = int(sameItem.@id);
         if(id2 <= 0)
         {
            return null;
         }
         var arrCard:Array = [];
         this.getCardById(id2,arrCard);
         if(arrCard.length > 0)
         {
            return getCardAttr(arrCard[0]);
         }
         return null;
      }
      
      public function getMixedCardNeedCount(id:int) : int
      {
         var type:int = 0;
         var objStart:Object = null;
         var needCount:int = 1;
         var AssistantItem:XML = ComposeConfig.getInstance().getAssistantItem(id);
         if(AssistantItem)
         {
            needCount = int(AssistantItem.@count);
            if(this._consortiaData)
            {
               if(this._consortiaData.level > 0)
               {
                  type = PackagesManager.getCardType(id);
                  objStart = this._consortiaData.config[this._consortiaData.level];
                  switch(type)
                  {
                     case ConstantCompose.CARD_TYPE_PERFUME:
                        needCount = objStart["start" + AssistantItem.@value.toString()] * 1;
                        break;
                     default:
                        trace("default>>type=" + type);
                  }
               }
            }
         }
         return needCount;
      }
      
      private function cloneCardsArray(a:Array) : Array
      {
         var na:Array = a.concat();
         var i:int = 0;
         var len:int = int(na.length);
         while(i < len)
         {
            na[i] = na[i].clone();
            i++;
         }
         return na;
      }
      
      private function thisClickHandler(a_4730:MouseEvent) : void
      {
         var card:Sprite = null;
         var cardAttr:a_3228 = null;
         var needCount:int = 0;
         var currentCount:int = 0;
         var cardName:String = null;
         var msg:String = null;
         if(a_4730.target is PropsCard || a_4730.target is DefCard)
         {
            if(a_4730.target is PropsCard)
            {
               if(!a_4730.target.CardClickStatus)
               {
                  return;
               }
            }
            card = Sprite(a_4730.target);
            if(this._type == ConstantCompose.PANE_TYPE_CHARM_CRYSTAL_DECOMPOSE || this._type == ConstantCompose.PANE_TYPE_CHARM_CRYSTAL_UPGRADE)
            {
               if(card.parent as PropsGrid)
               {
                  (card.parent as PropsGrid).alreadymc.visible = false;
               }
            }
            cardAttr = PackagesManager.getCardAttr(card);
            if(PackagesManager.getCardType(cardAttr.CardID) == ConstantCompose.CARD_TYPE_CRYSTAL || PackagesManager.getCardType(cardAttr.CardID) == ConstantCompose.CARD_TYPE_SUPER_CRYSTAL)
            {
               dispatchEvent(new ComposeUIEvent(ComposeUIEvent.ASK_NEED_COUNT,card));
               return;
            }
            if(PackagesManager.isMixedCard(cardAttr.CardID))
            {
               needCount = this.getMixedCardNeedCount(cardAttr.CardID);
               currentCount = this.getMixedCardTotalCount(card);
               if(currentCount < needCount)
               {
                  cardName = PackagesManager.getCardName(cardAttr.CardID);
                  msg = this.gsManager.getString(69686,[needCount,cardName,cardName]);
                  dispatchEvent(new ComposeUIEvent(ComposeUIEvent.SHOW_TIP,msg));
                  return;
               }
            }
            dispatchEvent(new ComposeUIEvent(ComposeUIEvent.REQUEST_ADD_CARD,card));
         }
      }
   }
}

