package com.aurora.ui.maogoutd.component.tip
{
   import a_4723.a_1767;
   import a_4752.GameStringManager;
   import a_4752.a_2036;
   import a_4752.a_2041;
   import a_4754.a_2161;
   import com.aurora.ui.maogoutd.component.a_3228;
   import com.aurora.ui.maogoutd.component.a_3286;
   import com.aurora.ui.maogoutd.component.a_3306;
   import com.aurora.ui.maogoutd.compose.Fusion.CardFusionConfig;
   import com.aurora.ui.maogoutd.compose.Fusion.FusionObtainItem;
   import com.aurora.ui.maogoutd.game.CardUpgradeXML;
   import com.aurora.ui.maogoutd.handbook.controller.HandbookController;
   import com.aurora.utils.bitmap.ColorMatrix;
   import flash.display.DisplayObject;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.filters.ColorMatrixFilter;
   import flash.text.TextField;
   import flash.utils.Dictionary;
   import flash.utils.getDefinitionByName;
   
   public class DefCardTip extends Sprite implements CardTip
   {
      
      private static var gradeClassDic:Dictionary = new Dictionary();
      
      public var nameText:TextField;
      
      public var usemc:MovieClip;
      
      public var goldcardIcon:Sprite;
      
      public var TypeText:TextField;
      
      public var AreaText:TextField;
      
      public var DescText0:TextField;
      
      public var DescText1:TextField;
      
      public var DescText2:TextField;
      
      public var DescText3:TextField;
      
      public var DescText4:TextField;
      
      public var DescText5:TextField;
      
      public var DescText6:TextField;
      
      public var day:TextField;
      
      public var night:TextField;
      
      public var water:TextField;
      
      public var FusionAddAttrText:TextField;
      
      public var FusionAttrText:TextField;
      
      public var AddAttrText:TextField;
      
      public var AttrText:TextField;
      
      public var TimeText:TextField;
      
      public var TimeTip:TextField;
      
      public var JiText:TextField;
      
      public var NengText:TextField;
      
      public var m_GradeSp:Sprite;
      
      public var SkillText:TextField;
      
      public var bindmc:MovieClip;
      
      public var defStar:MovieClip;
      
      public var tipbg:TipBG;
      
      public var zTip0:TextField;
      
      public var zTip1:TextField;
      
      public var zTip2:TextField;
      
      public var zTip3:TextField;
      
      public var zTip4:TextField;
      
      public var zTip5:TextField;
      
      public var zTip6:TextField;
      
      public var m_dictZhuanZhiID:Dictionary;
      
      public var m_iCardID:int;
      
      public var m_iGradeLv:int;
      
      public var leiText:TextField;
      
      public var xingText:TextField;
      
      public var haoText:TextField;
      
      public var nengText:TextField;
      
      public var areaWordText:TextField;
      
      public var conditionWordText:TextField;
      
      public var goldHelpText:TextField;
      
      public var goldHelpValueText:TextField;
      
      public var handbookText:TextField;
      
      public var handbookValueText:TextField;
      
      public var fusionTypemc:MovieClip;
      
      private var originalY:Array;
      
      private var fusionInfo:FusionObtainItem;
      
      private var isFusion:Boolean;
      
      private var m_Grademc:MovieClip;
      
      public function DefCardTip()
      {
         super();
         this.defStar.gotoAndStop(1);
         this.defStar.visible = false;
         this.bindmc.gotoAndStop(1);
         this.bindmc.visible = false;
         this.TimeText.visible = false;
         this.TimeTip.visible = false;
         this.AddAttrText.visible = false;
         this.AttrText.visible = false;
         this.FusionAddAttrText.visible = false;
         this.FusionAttrText.visible = false;
         this.m_dictZhuanZhiID = new Dictionary();
         this.init();
         this.originalY = [this.zTip4.y,this.zTip5.y,this.zTip6.y,this.goldcardIcon.y,this.fusionTypemc.y];
      }
      
      public function showCardTip(tipDesc:a_3306, attr:a_3228) : void
      {
         if(tipDesc == null)
         {
            return;
         }
         this.m_iCardID = tipDesc.CardID;
         this.fusionInfo = CardFusionConfig.Get().getFusionInfo(attr);
         this.m_iGradeLv = attr ? attr.GradeLevel : 0;
         this.adjustLayout();
         this.showTextColorsAndVisibility();
         this.showCommonInfo(tipDesc,attr);
      }
      
      private function showTextColorsAndVisibility() : void
      {
         var isGold:Boolean = false;
         isGold = this.beGoldCard();
         var color:String = isGold ? "#ffff00" : "#aac8e1";
         this.leiText.htmlText = this.wrapColor("类",color);
         this.xingText.htmlText = this.wrapColor("型",color);
         this.haoText.htmlText = this.wrapColor("耗",color);
         this.nengText.htmlText = this.wrapColor("能",color);
         this.areaWordText.htmlText = this.wrapColor("作用范围",color);
         this.conditionWordText.htmlText = this.wrapColor("使用条件",color);
         this.handbookText.htmlText = this.wrapColor("图鉴加成","#ff00ff");
         this.goldHelpText.visible = isGold;
         this.goldHelpValueText.visible = isGold;
         if(isGold)
         {
            this.goldHelpText.htmlText = this.wrapColor("金卡援护","#ff00ff");
         }
         this.goldcardIcon.visible = isGold;
      }
      
      private function showCommonInfo(tipDesc:a_3306, attr:a_3228) : void
      {
         this.showArea(tipDesc.Area);
         this.showDesc(tipDesc.Desc,tipDesc.CardID);
         this.showType(tipDesc.Type);
         this.showUse(tipDesc.Use);
         this.showName(tipDesc.Name,tipDesc.CardID);
         this.showEffectCondition(tipDesc.Effect);
         var CardID:int = tipDesc.CardID;
         this.showAddAttr(CardID & 0x0F,tipDesc.AttrType);
         this.showCardAttr(attr);
         this.showSkillText(CardID,attr);
      }
      
      private function adjustLayout() : void
      {
         var isGold:Boolean = false;
         var isFusion:Boolean = false;
         var extraHeight:Number = NaN;
         var bootmOffset:Number = NaN;
         isGold = this.beGoldCard();
         isFusion = Boolean(this.fusionInfo != null);
         var baseHeight:Number = 337;
         extraHeight = isGold ? 33 : 0;
         var fusionOffset:Number = isFusion ? 99 : 0;
         bootmOffset = isFusion ? 33 : 0;
         this.tipbg.setSize(0,0,230,baseHeight + extraHeight + fusionOffset + bootmOffset);
         this.zTip4.y = this.DescText4.y = this.originalY[0] + extraHeight;
         this.zTip5.y = this.DescText5.y = this.originalY[1] + extraHeight;
         this.zTip6.y = this.DescText6.y = this.originalY[2] + extraHeight;
         this.SkillText.y = this.JiText.y = this.NengText.y = this.tipbg.height - 72 - bootmOffset;
         this.AddAttrText.y = this.AttrText.y = this.tipbg.height - 49.1 - bootmOffset;
         this.FusionAddAttrText.y = this.FusionAttrText.y = this.tipbg.height - 59.1;
         this.TimeTip.y = this.TimeText.y = this.bindmc.y = this.tipbg.height - 24.2;
         this.zTip3.visible = this.DescText3.visible = isGold;
         this.zTip4.visible = this.DescText4.visible = this.zTip5.visible = this.DescText5.visible = this.zTip6.visible = this.DescText6.visible = this.FusionAddAttrText.visible = this.FusionAttrText.visible = this.fusionTypemc.visible = isFusion;
         this.nameText.x = 0.5 * (this.tipbg.width - this.nameText.width);
         if(isFusion)
         {
            if(gradeClassDic[this.m_iGradeLv] == null)
            {
               gradeClassDic[this.m_iGradeLv] = this.getGradeLevel(this.m_iGradeLv);
            }
            this.m_Grademc = gradeClassDic[this.m_iGradeLv];
            if(this.m_Grademc)
            {
               this.m_Grademc.gotoAndPlay(1);
               this.m_GradeSp.addChild(this.m_Grademc);
               this.m_Grademc.addEventListener(Event.ENTER_FRAME,this.onLoop);
            }
         }
         var offsetBottom:int = this.m_iGradeLv >= 15 ? 2 : 0;
         var gradeHeight:Number = isFusion && Boolean(this.m_Grademc) ? this.m_Grademc.height + offsetBottom : 0;
         this.goldcardIcon.y = this.originalY[3] + (isFusion ? gradeHeight : 0);
         this.fusionTypemc.y = this.originalY[4] + (isGold ? gradeHeight + 14 : offsetBottom);
      }
      
      private function getGradeLevel(degree:int) : MovieClip
      {
         var className:String = null;
         var clazz:Class = null;
         var instance:MovieClip = null;
         try
         {
            className = "GradeLevel" + degree;
            clazz = getDefinitionByName(className) as Class;
            instance = new clazz() as MovieClip;
            return instance;
         }
         catch(e:Error)
         {
            trace("未找到类: " + className);
            return null;
         }
      }
      
      private function onLoop(e:Event) : void
      {
         if(this.m_Grademc.currentFrame == this.m_Grademc.totalFrames)
         {
            this.m_Grademc.gotoAndPlay(2);
         }
      }
      
      public function onHideCardTip() : void
      {
         if(this.m_Grademc)
         {
            this.m_Grademc.removeEventListener(Event.ENTER_FRAME,this.onLoop);
            if(this.m_Grademc.parent)
            {
               this.m_Grademc.parent.removeChild(this.m_Grademc);
            }
            gradeClassDic[this.m_iGradeLv] = this.m_Grademc;
            this.m_Grademc = null;
         }
      }
      
      private function wrapColor(text:String, color:String) : String
      {
         return "<font color=\'" + color + "\'>" + text + "</font>";
      }
      
      private function fixAllTextFields() : void
      {
         var textFields:Array = null;
         var tf:TextField = null;
         if(a_2036.getInstance().isChromeManufacturer)
         {
            textFields = [this.nameText,this.TypeText,this.AreaText,this.DescText0,this.DescText1,this.DescText2,this.DescText3,this.day,this.night,this.water,this.AddAttrText,this.AttrText,this.FusionAddAttrText,this.FusionAttrText,this.TimeText,this.TimeTip,this.JiText,this.NengText,this.SkillText,this.zTip1,this.zTip2,this.zTip3,this.leiText,this.xingText,this.haoText,this.nengText,this.areaWordText,this.conditionWordText,this.goldHelpText,this.goldHelpValueText,this.handbookText,this.handbookValueText];
            for each(tf in textFields)
            {
               this.fixPepperFontBug(tf);
            }
         }
      }
      
      private function fixPepperFontBug(tf:TextField) : void
      {
         if(tf.multiline && tf.numLines > 1)
         {
            tf.height = tf.textHeight + 2.5 + 2;
         }
         else
         {
            tf.height = tf.textHeight + 2;
         }
      }
      
      public function beGoldCard() : Boolean
      {
         if(Boolean(this.fusionInfo) && this.fusionInfo.m_isGold)
         {
            return true;
         }
         if((this.m_iCardID & 0x0F) == 10 || (this.m_iCardID & 0x0F) == 11 || (this.m_iCardID & 0x0F) == 12 || (this.m_iCardID & 0x0F) == 13)
         {
            return true;
         }
         return false;
      }
      
      private function showEffectCondition(effect:String) : void
      {
         var arrEffect:Array = null;
         if(effect != null && effect != "")
         {
            arrEffect = effect.split(",");
            if(arrEffect[1] != "")
            {
               if(this.beGoldCard())
               {
                  this.night.htmlText = "<font color=\'#ffff00\'>" + "" + arrEffect[1] + "</font>";
               }
               else
               {
                  this.night.text = "" + arrEffect[1];
               }
            }
            else
            {
               this.night.text = "";
            }
            if(arrEffect[0] != "")
            {
               if(this.beGoldCard())
               {
                  this.day.htmlText = "<font color=\'#ffff00\'>" + "" + arrEffect[0] + "</font>";
               }
               else
               {
                  this.day.text = "" + arrEffect[0];
               }
               this.night.x = 91;
            }
            else
            {
               this.day.text = "";
               this.night.x = 64;
            }
            if(arrEffect[0] == "" || arrEffect[1] == "")
            {
               this.water.x = 91;
            }
            else
            {
               this.water.x = 122;
            }
            if(arrEffect[2] != "")
            {
               if(this.beGoldCard())
               {
                  this.water.htmlText = "<font color=\'#ffff00\'>" + "" + arrEffect[2] + "</font>";
               }
               else
               {
                  this.water.text = "" + arrEffect[2];
               }
            }
            else
            {
               this.water.text = "";
            }
         }
         else
         {
            this.day.visible = false;
            this.night.visible = false;
            this.water.visible = false;
         }
      }
      
      private function showUse(Use:String) : void
      {
         if(this.beGoldCard())
         {
            this.usemc.useText.htmlText = "<font color=\'#ffff00\'>" + Use + "" + "</font>";
         }
         else
         {
            this.usemc.useText.htmlText = Use + "";
         }
      }
      
      private function showName(Name:String, CardID:int) : void
      {
         var color:String = null;
         var coloruint:uint = 0;
         if(Name != null)
         {
            color = "";
            if(this.beGoldCard())
            {
               color = "ffff00";
            }
            else if(CardUpgradeXML.Get().m_DefenseColorTypeDict[CardID] == 3)
            {
               color = "ff5676";
            }
            else
            {
               coloruint = a_3297.getInstance().checkObjLevel(CardID);
               color = coloruint.toString(16);
            }
            this.nameText.htmlText = "<b><font color=\'#" + color + "\'>" + Name + "</font></b>";
         }
         else
         {
            this.nameText.htmlText = "";
         }
      }
      
      private function showType(Type:String) : void
      {
         if(Type != null)
         {
            if(this.beGoldCard())
            {
               this.TypeText.htmlText = "<font color=\'#ffff00\'>" + Type + "</font>";
            }
            else
            {
               this.TypeText.text = Type;
            }
         }
         else
         {
            this.TypeText.text = "";
         }
      }
      
      private function showArea(Area:String) : void
      {
         if(Area != null)
         {
            if(this.beGoldCard())
            {
               this.AreaText.htmlText = "<font color=\'#ffff00\'>" + Area + "</font>";
            }
            else
            {
               this.AreaText.text = Area;
            }
         }
         else
         {
            this.AreaText.text = "";
         }
      }
      
      private function showDesc(desc:String, iCardID:int) : void
      {
         var wu:String = null;
         var tf:TextField = null;
         var text:String = null;
         var ef:int = 0;
         if(!desc || this.DescText1 == null)
         {
            return;
         }
         var arrDesc:Array = desc.split("|");
         var size:int = this.beGoldCard() ? 4 : 3;
         if(this.fusionInfo != null)
         {
            size = 7;
         }
         var descCount:int = Math.min(arrDesc.length,size);
         for(var i:int = 0; i < size; i++)
         {
            wu = i >= 4 ? GameStringManager.getInstance().getString(131608) : GameStringManager.getInstance().getString(133270);
            tf = this["DescText" + i];
            text = i < descCount && arrDesc[i] != "" ? arrDesc[i] : wu;
            tf.htmlText = text;
         }
         if(this.beGoldCard())
         {
            this.zTip1.text = "三转能力";
            this.zTip2.text = "四转能力";
         }
         else
         {
            this.zTip1.text = "一转能力";
            this.zTip2.text = "二转能力";
         }
         if(this.fusionInfo != null)
         {
            this.setTextColor([1,2],2031360);
            this.setTextColor([3],16711680);
            this.setTipColor([1,2],2031360);
            this.setTipColor([3],16711680);
            switch(this.fusionInfo.m_iFusionType)
            {
               case 13:
                  this.setTipColor([4],16744448);
                  this.setTextColor([4],16744448);
                  this.setTipColor([5,6],6710886);
                  this.setTextColor([5,6],6710886);
                  break;
               case 14:
                  this.setTextColor([4,5],16744448);
                  this.setTipColor([4,5],16744448);
                  this.setTipColor([6],6710886);
                  this.setTextColor([6],6710886);
                  break;
               case 15:
                  this.setTextColor([4,5],16744448);
                  this.setTextColor([6],16744448);
                  this.setTipColor([4,5],16744448);
                  this.setTipColor([6],16744448);
            }
         }
         else
         {
            ef = iCardID & 0x0F;
            if(iCardID == 286326884 || iCardID == 286458068)
            {
               ef = 14;
            }
            switch(ef)
            {
               case 14:
               case 11:
                  this.setTipColor([1],2031360);
                  this.setTextColor([1],2031360);
                  this.setTipColor([2,3],6710886);
                  this.setTextColor([2,3],6710886);
                  break;
               case 15:
               case 12:
                  this.setTextColor([1,2],2031360);
                  this.setTipColor([1,2],2031360);
                  this.setTipColor([3],6710886);
                  this.setTextColor([3],6710886);
                  break;
               case 13:
                  this.setTextColor([1,2],2031360);
                  this.setTextColor([3],16711680);
                  this.setTipColor([1,2],2031360);
                  this.setTipColor([3],16711680);
                  break;
               default:
                  this.setTipColor([1,2,3],6710886);
                  this.setTextColor([1,2,3],6710886);
            }
         }
         if(arrDesc.length != size)
         {
            wu = GameStringManager.getInstance().getString(133270);
            this.setTextValue([1,2],wu);
            this.setTextColor([1,2],6710886);
            this.setTipColor([1,2],6710886);
         }
      }
      
      private function setTextColor(indexList:Array, color:uint) : void
      {
         var i:int = 0;
         var tf:TextField = null;
         for each(i in indexList)
         {
            tf = this["DescText" + i];
            if(tf)
            {
               tf.textColor = color;
            }
         }
      }
      
      private function setTipColor(indexList:Array, color:uint) : void
      {
         var i:int = 0;
         var tip:TextField = null;
         for each(i in indexList)
         {
            tip = this["zTip" + i];
            if(tip)
            {
               tip.textColor = color;
            }
         }
      }
      
      private function setTextValue(indexList:Array, text:String) : void
      {
         var i:int = 0;
         var tf:TextField = null;
         for each(i in indexList)
         {
            tf = this["DescText" + i];
            if(tf)
            {
               tf.htmlText = text;
            }
         }
      }
      
      private function showCardAttr(attr:a_3228) : void
      {
         var isGold:Boolean = false;
         var systemTime:int = 0;
         var expTime:Number = NaN;
         isGold = this.beGoldCard();
         if(attr == null)
         {
            this.bindmc.visible = false;
            this.TimeText.visible = false;
            this.TimeTip.visible = false;
            this.defStar.visible = false;
         }
         else
         {
            this.bindmc.visible = true;
            this.TimeText.visible = true;
            if(isGold)
            {
               this.TimeTip.htmlText = "<font color=\'#ffff00\'>" + "有效时间" + "</font>";
            }
            else
            {
               this.TimeTip.text = "有效时间";
            }
            this.TimeTip.visible = true;
            if(attr.IsBind == 1)
            {
               this.bindmc.gotoAndStop(attr.IsBind);
            }
            else
            {
               this.bindmc.gotoAndStop(2);
            }
            if(attr.ExpiredTime == -1)
            {
               if(isGold)
               {
                  this.TimeText.htmlText = "<font color=\'#ffff00\'>" + GameStringManager.getInstance().getString(132448) + "</font>";
               }
               else
               {
                  this.TimeText.text = GameStringManager.getInstance().getString(132448);
               }
            }
            else if(attr.ExpiredTime == -2)
            {
               if(attr.DeltaTime == -1)
               {
                  if(isGold)
                  {
                     this.TimeText.htmlText = "<font color=\'#ffff00\'>" + GameStringManager.getInstance().getString(132448) + "</font>";
                  }
                  else
                  {
                     this.TimeText.text = GameStringManager.getInstance().getString(132448);
                  }
               }
               else if(isGold)
               {
                  this.TimeText.htmlText = "<font color=\'#ffff00\'>" + "" + Math.round(attr.DeltaTime / (60 * 60 * 24)) + GameStringManager.getInstance().getString(131854) + "</font>";
               }
               else
               {
                  this.TimeText.text = "" + Math.round(attr.DeltaTime / (60 * 60 * 24)) + GameStringManager.getInstance().getString(131854);
               }
            }
            else
            {
               systemTime = a_1767.getInstance().SystemTime;
               expTime = (attr.ExpiredTime - systemTime) / (60 * 60 * 24);
               if(expTime < 0)
               {
                  if(isGold)
                  {
                     this.TimeText.htmlText = "<font color=\'#ffff00\'>" + GameStringManager.getInstance().getString(132449) + "</font>";
                  }
                  else
                  {
                     this.TimeText.text = GameStringManager.getInstance().getString(132449);
                  }
               }
               else if(expTime > 1)
               {
                  if(isGold)
                  {
                     this.TimeText.htmlText = "<font color=\'#ffff00\'>" + "" + Math.round(expTime) + GameStringManager.getInstance().getString(131854) + "</font>";
                  }
                  else
                  {
                     this.TimeText.text = "" + Math.round(expTime) + GameStringManager.getInstance().getString(131854);
                  }
               }
               else
               {
                  expTime = Math.round((attr.ExpiredTime - systemTime) / (60 * 60));
                  if(isGold)
                  {
                     this.TimeText.htmlText = "<font color=\'#ffff00\'>" + "" + int(expTime) + GameStringManager.getInstance().getString(132411) + "</font>";
                  }
                  else
                  {
                     this.TimeText.text = "" + int(expTime) + GameStringManager.getInstance().getString(132411);
                  }
               }
            }
            if(attr.TypeValue == 0)
            {
               this.defStar.visible = false;
            }
            else
            {
               this.defStar.visible = true;
               this.defStar.gotoAndStop(attr.TypeValue);
            }
            if(this.fusionInfo)
            {
               this.fusionTypemc.gotoAndStop(this.fusionInfo.m_iType);
               this.m_GradeSp.x = this.defStar.x + (this.defStar.width - this.m_GradeSp.width) * 0.5;
            }
         }
      }
      
      private function getZhuanZhiID(iCardID:int) : int
      {
         if(null != this.m_dictZhuanZhiID[iCardID])
         {
            iCardID = int(this.m_dictZhuanZhiID[iCardID]);
         }
         return iCardID;
      }
      
      private function showSkillText(iCardID:int, attr:a_3228) : void
      {
         var dictHelper:Dictionary = null;
         var arrSkillCards:Array = null;
         var skill:Object = null;
         var arrBooks:Array = null;
         var skillBook:a_3286 = null;
         var str:String = null;
         var iSkillOpened:int = 0;
         var iSkillUsed:int = 0;
         var iCurrentSkillOpened:int = 0;
         var iCurrentLevel:int = 0;
         var iCurrentUsed:int = 0;
         var upItem:Object = null;
         var maxItem:Object = null;
         var arrCards:Array = a_2161.e.GetTDCardsInfo() as Array;
         var dict:Dictionary = a_2041.getInstance().m_dictSkillCards;
         if(this.beGoldCard())
         {
            dictHelper = a_2041.getInstance().m_dictGoldSkillHelper;
            if(dictHelper[iCardID] != null)
            {
               if((iCardID & 0xFFFFFFF0) == 286326864)
               {
                  this.goldHelpValueText.htmlText = "<font color=\'#aac8e1\'>" + "火苗能量 +" + dictHelper[iCardID].toString() + "</font>";
               }
               else
               {
                  this.goldHelpValueText.htmlText = "<font color=\'#aac8e1\'>" + "攻击力 +" + dictHelper[iCardID].toString() + "</font>";
               }
               this.goldHelpValueText.visible = true;
            }
            else
            {
               this.goldHelpValueText.visible = false;
            }
         }
         this.handbookValueText.htmlText = "<font color=\'#aac8e1\'>" + HandbookController.Get().AddString(iCardID) + "</font>";
         this.SkillText.htmlText = GameStringManager.getInstance().getString(133269);
         var m_iCardID:int = this.getZhuanZhiID(iCardID);
         if(dict[m_iCardID] == null)
         {
            this.SkillText.htmlText = GameStringManager.getInstance().getString(133264);
         }
         if(attr != null && arrCards != null && arrCards.length > 3)
         {
            arrSkillCards = arrCards[4];
            for each(skill in arrSkillCards)
            {
               if(m_iCardID == skill.m_iSkillID)
               {
                  arrBooks = dict[m_iCardID];
                  for each(skillBook in arrBooks)
                  {
                     if(skill.m_nSkillLevel == skillBook.iBookLevel)
                     {
                        skillBook.iSkillOpened = skill.m_iSkillOpened;
                        skillBook.iSkillUsed = skill.m_iSkillUsed;
                        skillBook.nSkillLevel = skill.m_nSkillLevel;
                        break;
                     }
                     skillBook.iSkillUsed = 0;
                     skillBook.nSkillLevel = 0;
                     skillBook.iSkillOpened = 0;
                  }
                  str = "LV." + skillBook.CurrentLevel + "";
                  iSkillOpened = skillBook.iSkillOpened;
                  iSkillUsed = skillBook.iSkillUsed;
                  if(iSkillOpened == iSkillUsed && iSkillUsed != 0 && skillBook.nSkillLevel > 0)
                  {
                     if(skillBook.nSkillLevel == 4)
                     {
                        str += "(" + GameStringManager.getInstance().getString(133265) + ")";
                     }
                     else if(skillBook.nSkillLevel == 3)
                     {
                        str += "(" + GameStringManager.getInstance().getString(140040) + ")";
                     }
                     else if(skillBook.nSkillLevel == 2)
                     {
                        str += "(" + GameStringManager.getInstance().getString(133266) + ")";
                     }
                     if(skillBook.nSkillLevel == 1)
                     {
                        str += "(" + GameStringManager.getInstance().getString(133267) + ")";
                     }
                  }
                  else
                  {
                     iCurrentSkillOpened = 0;
                     iCurrentLevel = 0;
                     iCurrentUsed = iSkillUsed;
                     if(iSkillOpened != iSkillUsed)
                     {
                        upItem = skillBook.getCurrentUpItem(iSkillUsed);
                        iCurrentSkillOpened = int(upItem.count);
                        iCurrentLevel = upItem.level - 1;
                        iCurrentUsed = iSkillUsed - skillBook.getLevelItemSumCount(upItem.level);
                     }
                     else
                     {
                        maxItem = skillBook.getMaxLevelItem();
                        iCurrentSkillOpened = int(maxItem.count);
                        iCurrentUsed = iCurrentSkillOpened;
                        iCurrentLevel = int(maxItem.level);
                     }
                     str += "(" + iCurrentUsed + "/" + iCurrentSkillOpened + ")";
                  }
                  this.SkillText.htmlText = str;
                  break;
               }
            }
         }
      }
      
      private function showAddAttr(addAttr:int, attr:String) : void
      {
         var COLOR_GOLD:String = "#ffff00";
         var STR_ADD_ATTR:String = GameStringManager.getInstance().getString(133268);
         var STR_FUSION_ATTR:String = GameStringManager.getInstance().getString(131604);
         var isGold:Boolean = this.beGoldCard();
         if(isGold)
         {
            this.AddAttrText.htmlText = this.formatColorText(STR_ADD_ATTR,COLOR_GOLD);
         }
         else
         {
            this.AddAttrText.text = STR_ADD_ATTR;
         }
         this.AddAttrText.visible = true;
         if(attr != null)
         {
            this.AttrText.htmlText = attr;
            this.AttrText.visible = true;
         }
         else
         {
            this.AttrText.text = "";
            this.AttrText.visible = false;
         }
         if(this.fusionInfo != null)
         {
            this.FusionAddAttrText.htmlText = isGold ? this.formatColorText(STR_FUSION_ATTR,COLOR_GOLD) : STR_FUSION_ATTR;
            this.FusionAttrText.htmlText = this.fusionInfo.m_iDesc;
            this.FusionAddAttrText.visible = true;
            this.FusionAttrText.visible = true;
         }
         else
         {
            this.FusionAddAttrText.visible = false;
            this.FusionAttrText.visible = false;
         }
      }
      
      private function formatColorText(text:String, color:String) : String
      {
         return "<font color=\'" + color + "\'>" + text + "</font>";
      }
      
      private function addMatrix(mc:DisplayObject, saturation:int = -100) : void
      {
         var cm:ColorMatrix = new ColorMatrix();
         cm.adjustColor(0,0,saturation,0);
         mc.filters = [new ColorMatrixFilter(cm)];
      }
      
      private function init() : void
      {
         var key:String = null;
         var upgradeIDHex:Array = null;
         var i:int = 0;
         this.m_dictZhuanZhiID[286457936] = 286457936;
         this.m_dictZhuanZhiID[294846480] = 294846480;
         this.m_dictZhuanZhiID[294846494] = 294846480;
         this.m_dictZhuanZhiID[294846495] = 294846480;
         this.m_dictZhuanZhiID[294846496] = 294846496;
         this.m_dictZhuanZhiID[294846510] = 294846496;
         this.m_dictZhuanZhiID[294846511] = 294846496;
         this.m_dictZhuanZhiID[294850656] = 294850656;
         this.m_dictZhuanZhiID[294850670] = 294850656;
         this.m_dictZhuanZhiID[294850671] = 294850656;
         this.m_dictZhuanZhiID[289603632] = 289603632;
         this.m_dictZhuanZhiID[286457934] = 289603632;
         this.m_dictZhuanZhiID[286457951] = 289603632;
         this.m_dictZhuanZhiID[286458176] = 286458176;
         this.m_dictZhuanZhiID[286458190] = 286458176;
         this.m_dictZhuanZhiID[286458191] = 286458176;
         this.m_dictZhuanZhiID[286457952] = 286457952;
         this.m_dictZhuanZhiID[286457966] = 286457952;
         this.m_dictZhuanZhiID[286457967] = 286457952;
         this.m_dictZhuanZhiID[286588948] = 286588948;
         this.m_dictZhuanZhiID[286588958] = 286588948;
         this.m_dictZhuanZhiID[286588959] = 286588948;
         this.m_dictZhuanZhiID[286326804] = 286326804;
         this.m_dictZhuanZhiID[286326814] = 286326804;
         this.m_dictZhuanZhiID[286326815] = 286326804;
         this.m_dictZhuanZhiID[294846528] = 294846528;
         this.m_dictZhuanZhiID[294846542] = 294846528;
         this.m_dictZhuanZhiID[294846543] = 294846528;
         this.m_dictZhuanZhiID[286330916] = 286330916;
         this.m_dictZhuanZhiID[286330926] = 286330916;
         this.m_dictZhuanZhiID[286330927] = 286330916;
         this.m_dictZhuanZhiID[286855520] = 286855520;
         this.m_dictZhuanZhiID[286855534] = 286855520;
         this.m_dictZhuanZhiID[286855535] = 286855520;
         this.m_dictZhuanZhiID[294846544] = 294846544;
         this.m_dictZhuanZhiID[286457950] = 294846544;
         this.m_dictZhuanZhiID[286457983] = 294846544;
         this.m_dictZhuanZhiID[288948688] = 288948688;
         this.m_dictZhuanZhiID[288948702] = 288948688;
         this.m_dictZhuanZhiID[288948703] = 288948688;
         this.m_dictZhuanZhiID[286392336] = 286392336;
         this.m_dictZhuanZhiID[286392350] = 286392336;
         this.m_dictZhuanZhiID[286392351] = 286392336;
         this.m_dictZhuanZhiID[294846608] = 294846608;
         this.m_dictZhuanZhiID[294846622] = 294846608;
         this.m_dictZhuanZhiID[294846623] = 294846608;
         this.m_dictZhuanZhiID[286392448] = 286392448;
         this.m_dictZhuanZhiID[286392462] = 286392448;
         this.m_dictZhuanZhiID[286392463] = 286392448;
         this.m_dictZhuanZhiID[286458272] = 286458272;
         this.m_dictZhuanZhiID[286458286] = 286458272;
         this.m_dictZhuanZhiID[286458287] = 286458272;
         this.m_dictZhuanZhiID[288817204] = 288817204;
         this.m_dictZhuanZhiID[288817214] = 288817204;
         this.m_dictZhuanZhiID[286523444] = 286523444;
         this.m_dictZhuanZhiID[286523454] = 286523444;
         this.m_dictZhuanZhiID[288949248] = 288949248;
         this.m_dictZhuanZhiID[288949262] = 288949248;
         this.m_dictZhuanZhiID[288949263] = 288949248;
         this.m_dictZhuanZhiID[286392464] = 286392464;
         this.m_dictZhuanZhiID[286392478] = 286392464;
         this.m_dictZhuanZhiID[286392479] = 286392464;
         this.m_dictZhuanZhiID[286392576] = 286392576;
         this.m_dictZhuanZhiID[286392590] = 286392576;
         this.m_dictZhuanZhiID[286392591] = 286392576;
         this.m_dictZhuanZhiID[286392592] = 286392592;
         this.m_dictZhuanZhiID[286392606] = 286392592;
         this.m_dictZhuanZhiID[286392607] = 286392592;
         this.m_dictZhuanZhiID[286392608] = 286392608;
         this.m_dictZhuanZhiID[286392622] = 286392608;
         this.m_dictZhuanZhiID[286392623] = 286392608;
         this.m_dictZhuanZhiID[286392624] = 286392624;
         this.m_dictZhuanZhiID[286392638] = 286392624;
         this.m_dictZhuanZhiID[286392639] = 286392624;
         this.m_dictZhuanZhiID[286392640] = 286392640;
         this.m_dictZhuanZhiID[286392654] = 286392640;
         this.m_dictZhuanZhiID[286392655] = 286392640;
         this.m_dictZhuanZhiID[288949504] = 288949504;
         this.m_dictZhuanZhiID[288949518] = 288949504;
         this.m_dictZhuanZhiID[288949519] = 288949504;
         this.m_dictZhuanZhiID[286392672] = 286392672;
         this.m_dictZhuanZhiID[286392686] = 286392672;
         this.m_dictZhuanZhiID[286392687] = 286392672;
         this.m_dictZhuanZhiID[286392656] = 286392656;
         this.m_dictZhuanZhiID[286392670] = 286392656;
         this.m_dictZhuanZhiID[286392671] = 286392656;
         this.m_dictZhuanZhiID[286392688] = 286392688;
         this.m_dictZhuanZhiID[286392702] = 286392688;
         this.m_dictZhuanZhiID[286392703] = 286392688;
         this.m_dictZhuanZhiID[286462112] = 286462112;
         this.m_dictZhuanZhiID[286462126] = 286462112;
         this.m_dictZhuanZhiID[286462127] = 286462112;
         this.m_dictZhuanZhiID[286393152] = 286393152;
         this.m_dictZhuanZhiID[286393166] = 286393152;
         this.m_dictZhuanZhiID[286393167] = 286393152;
         this.m_dictZhuanZhiID[286462272] = 286462272;
         this.m_dictZhuanZhiID[286462286] = 286462272;
         this.m_dictZhuanZhiID[286462287] = 286462272;
         this.m_dictZhuanZhiID[286458240] = 286458240;
         this.m_dictZhuanZhiID[286458254] = 286458240;
         this.m_dictZhuanZhiID[286458255] = 286458240;
         this.m_dictZhuanZhiID[286462464] = 286462464;
         this.m_dictZhuanZhiID[286462478] = 286462464;
         this.m_dictZhuanZhiID[286462479] = 286462464;
         this.m_dictZhuanZhiID[286393424] = 286393424;
         this.m_dictZhuanZhiID[286393438] = 286393424;
         this.m_dictZhuanZhiID[286393440] = 286393440;
         this.m_dictZhuanZhiID[286393454] = 286393440;
         this.m_dictZhuanZhiID[286393455] = 286393440;
         this.m_dictZhuanZhiID[286393456] = 286393456;
         this.m_dictZhuanZhiID[286393470] = 286393456;
         this.m_dictZhuanZhiID[286393471] = 286393456;
         this.m_dictZhuanZhiID[288817248] = 288817248;
         this.m_dictZhuanZhiID[288817262] = 288817248;
         this.m_dictZhuanZhiID[286393472] = 286393472;
         this.m_dictZhuanZhiID[286393486] = 286393472;
         this.m_dictZhuanZhiID[286393487] = 286393472;
         this.m_dictZhuanZhiID[286393488] = 286393488;
         this.m_dictZhuanZhiID[286393502] = 286393488;
         this.m_dictZhuanZhiID[286393503] = 286393488;
         this.m_dictZhuanZhiID[286393600] = 286393600;
         this.m_dictZhuanZhiID[286393614] = 286393600;
         this.m_dictZhuanZhiID[286393615] = 286393600;
         this.m_dictZhuanZhiID[286393632] = 286393632;
         this.m_dictZhuanZhiID[286393646] = 286393632;
         this.m_dictZhuanZhiID[286393647] = 286393632;
         this.m_dictZhuanZhiID[286393664] = 286393664;
         this.m_dictZhuanZhiID[286393678] = 286393664;
         this.m_dictZhuanZhiID[286393679] = 286393664;
         this.m_dictZhuanZhiID[286393680] = 286393680;
         this.m_dictZhuanZhiID[286393694] = 286393680;
         this.m_dictZhuanZhiID[286393695] = 286393680;
         this.m_dictZhuanZhiID[286393696] = 286393696;
         this.m_dictZhuanZhiID[286393710] = 286393696;
         this.m_dictZhuanZhiID[286393711] = 286393696;
         this.m_dictZhuanZhiID[286393712] = 286393712;
         this.m_dictZhuanZhiID[286393726] = 286393712;
         this.m_dictZhuanZhiID[286393727] = 286393712;
         this.m_dictZhuanZhiID[286393728] = 286393728;
         this.m_dictZhuanZhiID[286393742] = 286393728;
         this.m_dictZhuanZhiID[286393743] = 286393728;
         this.m_dictZhuanZhiID[286393744] = 286393744;
         this.m_dictZhuanZhiID[286393758] = 286393744;
         this.m_dictZhuanZhiID[286393759] = 286393744;
         this.m_dictZhuanZhiID[286393856] = 286393856;
         this.m_dictZhuanZhiID[286393872] = 286393872;
         this.m_dictZhuanZhiID[286393886] = 286393872;
         this.m_dictZhuanZhiID[286393887] = 286393872;
         this.m_dictZhuanZhiID[286393888] = 286393888;
         this.m_dictZhuanZhiID[286393902] = 286393888;
         this.m_dictZhuanZhiID[286393903] = 286393888;
         this.m_dictZhuanZhiID[286393930] = 286393930;
         this.m_dictZhuanZhiID[286393931] = 286393930;
         this.m_dictZhuanZhiID[286393932] = 286393930;
         this.m_dictZhuanZhiID[286393933] = 286393930;
         this.m_dictZhuanZhiID[286393946] = 286393946;
         this.m_dictZhuanZhiID[286393947] = 286393946;
         this.m_dictZhuanZhiID[286393948] = 286393946;
         this.m_dictZhuanZhiID[286393949] = 286393946;
         this.m_dictZhuanZhiID[286393952] = 286393952;
         this.m_dictZhuanZhiID[286393966] = 286393952;
         this.m_dictZhuanZhiID[286393967] = 286393952;
         this.m_dictZhuanZhiID[286393968] = 286393968;
         this.m_dictZhuanZhiID[286393982] = 286393968;
         this.m_dictZhuanZhiID[286393983] = 286393968;
         this.m_dictZhuanZhiID[286393984] = 286393984;
         this.m_dictZhuanZhiID[286393998] = 286393984;
         this.m_dictZhuanZhiID[286394112] = 286394112;
         this.m_dictZhuanZhiID[286394126] = 286394112;
         this.m_dictZhuanZhiID[286394127] = 286394112;
         this.m_dictZhuanZhiID[286394144] = 286394144;
         this.m_dictZhuanZhiID[286394158] = 286394144;
         this.m_dictZhuanZhiID[286394159] = 286394144;
         this.m_dictZhuanZhiID[286394176] = 286394176;
         this.m_dictZhuanZhiID[286394190] = 286394176;
         this.m_dictZhuanZhiID[286394191] = 286394176;
         this.m_dictZhuanZhiID[287637520] = 287637520;
         this.m_dictZhuanZhiID[287637534] = 287637520;
         this.m_dictZhuanZhiID[287637535] = 287637520;
         this.m_dictZhuanZhiID[286394240] = 286394240;
         this.m_dictZhuanZhiID[286394254] = 286394240;
         this.m_dictZhuanZhiID[286394255] = 286394240;
         this.m_dictZhuanZhiID[286462304] = 286462304;
         this.m_dictZhuanZhiID[286462318] = 286462304;
         this.m_dictZhuanZhiID[286462319] = 286462304;
         this.m_dictZhuanZhiID[286396464] = 286396464;
         this.m_dictZhuanZhiID[286396478] = 286396464;
         this.m_dictZhuanZhiID[286396479] = 286396464;
         this.m_dictZhuanZhiID[286466560] = 286466560;
         this.m_dictZhuanZhiID[286466574] = 286466560;
         this.m_dictZhuanZhiID[286466575] = 286466560;
         this.m_dictZhuanZhiID[286466368] = 286466368;
         this.m_dictZhuanZhiID[286466382] = 286466368;
         this.m_dictZhuanZhiID[286466383] = 286466368;
         this.m_dictZhuanZhiID[286462368] = 286462368;
         this.m_dictZhuanZhiID[286462382] = 286462368;
         this.m_dictZhuanZhiID[286462383] = 286462368;
         this.m_dictZhuanZhiID[286851668] = 286851668;
         this.m_dictZhuanZhiID[286851678] = 286851668;
         this.m_dictZhuanZhiID[286851679] = 286851668;
         this.m_dictZhuanZhiID[286396480] = 286396480;
         this.m_dictZhuanZhiID[286396494] = 286396480;
         this.m_dictZhuanZhiID[286396495] = 286396480;
         this.m_dictZhuanZhiID[286392704] = 286392704;
         this.m_dictZhuanZhiID[286392718] = 286392704;
         this.m_dictZhuanZhiID[286392719] = 286392704;
         this.m_dictZhuanZhiID[286392720] = 286392720;
         this.m_dictZhuanZhiID[286392734] = 286392720;
         this.m_dictZhuanZhiID[286392735] = 286392720;
         this.m_dictZhuanZhiID[286392832] = 286392832;
         this.m_dictZhuanZhiID[286392846] = 286392832;
         this.m_dictZhuanZhiID[286392847] = 286392832;
         this.m_dictZhuanZhiID[286458672] = 286458672;
         this.m_dictZhuanZhiID[286458686] = 286458672;
         this.m_dictZhuanZhiID[286458687] = 286458672;
         this.m_dictZhuanZhiID[286392848] = 286392848;
         this.m_dictZhuanZhiID[286392862] = 286392848;
         this.m_dictZhuanZhiID[286392863] = 286392848;
         this.m_dictZhuanZhiID[287506468] = 287506468;
         this.m_dictZhuanZhiID[287506478] = 287506468;
         this.m_dictZhuanZhiID[287506479] = 287506468;
         this.m_dictZhuanZhiID[286459072] = 286459072;
         this.m_dictZhuanZhiID[286459086] = 286459072;
         this.m_dictZhuanZhiID[286459087] = 286459072;
         this.m_dictZhuanZhiID[286459104] = 286459104;
         this.m_dictZhuanZhiID[286459118] = 286459104;
         this.m_dictZhuanZhiID[286459119] = 286459104;
         this.m_dictZhuanZhiID[286392928] = 286392928;
         this.m_dictZhuanZhiID[286392942] = 286392928;
         this.m_dictZhuanZhiID[286392943] = 286392928;
         this.m_dictZhuanZhiID[286523920] = 286523920;
         this.m_dictZhuanZhiID[286523934] = 286523920;
         this.m_dictZhuanZhiID[286396512] = 286396512;
         this.m_dictZhuanZhiID[286396526] = 286396512;
         this.m_dictZhuanZhiID[286392912] = 286392912;
         this.m_dictZhuanZhiID[286392926] = 286392912;
         this.m_dictZhuanZhiID[286392927] = 286392912;
         this.m_dictZhuanZhiID[288817232] = 288817232;
         this.m_dictZhuanZhiID[288817246] = 288817232;
         this.m_dictZhuanZhiID[288817247] = 288817232;
         this.m_dictZhuanZhiID[286458544] = 286458544;
         this.m_dictZhuanZhiID[286458558] = 286458544;
         this.m_dictZhuanZhiID[286458559] = 286458544;
         this.m_dictZhuanZhiID[286392976] = 286392976;
         this.m_dictZhuanZhiID[286392990] = 286392976;
         this.m_dictZhuanZhiID[286392991] = 286392976;
         this.m_dictZhuanZhiID[286392960] = 286392960;
         this.m_dictZhuanZhiID[286392974] = 286392960;
         this.m_dictZhuanZhiID[286462474] = 286462474;
         this.m_dictZhuanZhiID[286462475] = 286462474;
         this.m_dictZhuanZhiID[286462476] = 286462474;
         this.m_dictZhuanZhiID[286462477] = 286462474;
         this.m_dictZhuanZhiID[286392618] = 286392618;
         this.m_dictZhuanZhiID[286392619] = 286392618;
         this.m_dictZhuanZhiID[286392620] = 286392618;
         this.m_dictZhuanZhiID[286392621] = 286392618;
         this.m_dictZhuanZhiID[291700752] = 291700752;
         this.m_dictZhuanZhiID[291700766] = 291700752;
         this.m_dictZhuanZhiID[291700767] = 291700752;
         this.m_dictZhuanZhiID[291700992] = 291700992;
         this.m_dictZhuanZhiID[291701006] = 291700992;
         this.m_dictZhuanZhiID[291701007] = 291700992;
         this.m_dictZhuanZhiID[286457956] = 286457956;
         this.m_dictZhuanZhiID[286458078] = 286457956;
         this.m_dictZhuanZhiID[286458079] = 286457956;
         this.m_dictZhuanZhiID[286458084] = 286458084;
         this.m_dictZhuanZhiID[286458094] = 286458084;
         this.m_dictZhuanZhiID[286458095] = 286458084;
         this.m_dictZhuanZhiID[294846580] = 294846580;
         this.m_dictZhuanZhiID[294846590] = 294846580;
         this.m_dictZhuanZhiID[294846591] = 294846580;
         this.m_dictZhuanZhiID[286326868] = 286326868;
         this.m_dictZhuanZhiID[286326884] = 286326868;
         this.m_dictZhuanZhiID[286326879] = 286326868;
         this.m_dictZhuanZhiID[286458020] = 286458020;
         this.m_dictZhuanZhiID[286458062] = 286458020;
         this.m_dictZhuanZhiID[286458062] = 286458020;
         this.m_dictZhuanZhiID[286457972] = 286457972;
         this.m_dictZhuanZhiID[286457982] = 286457972;
         this.m_dictZhuanZhiID[286457871] = 286457972;
         this.m_dictZhuanZhiID[286458256] = 286458256;
         this.m_dictZhuanZhiID[286458270] = 286458256;
         this.m_dictZhuanZhiID[286458271] = 286458256;
         this.m_dictZhuanZhiID[286458052] = 286458052;
         this.m_dictZhuanZhiID[286458068] = 286458052;
         this.m_dictZhuanZhiID[286458063] = 286458052;
         this.m_dictZhuanZhiID[286392372] = 286392372;
         this.m_dictZhuanZhiID[286392382] = 286392372;
         this.m_dictZhuanZhiID[286392383] = 286392372;
         this.m_dictZhuanZhiID[286392352] = 286392352;
         this.m_dictZhuanZhiID[286392366] = 286392352;
         this.m_dictZhuanZhiID[286392367] = 286392352;
         this.m_dictZhuanZhiID[286458064] = 286458064;
         this.m_dictZhuanZhiID[286458110] = 286458064;
         this.m_dictZhuanZhiID[286458111] = 286458064;
         this.m_dictZhuanZhiID[286396432] = 286396432;
         this.m_dictZhuanZhiID[286396446] = 286396432;
         this.m_dictZhuanZhiID[286396447] = 286396432;
         this.m_dictZhuanZhiID[294846560] = 294846560;
         this.m_dictZhuanZhiID[294846574] = 294846560;
         this.m_dictZhuanZhiID[294846575] = 294846560;
         this.m_dictZhuanZhiID[286851412] = 286851412;
         this.m_dictZhuanZhiID[286851422] = 286851412;
         this.m_dictZhuanZhiID[286851423] = 286851412;
         this.m_dictZhuanZhiID[286392436] = 286392436;
         this.m_dictZhuanZhiID[286392446] = 286392436;
         this.m_dictZhuanZhiID[286392447] = 286392436;
         this.m_dictZhuanZhiID[287571988] = 287571988;
         this.m_dictZhuanZhiID[287572014] = 287571988;
         this.m_dictZhuanZhiID[287572015] = 287571988;
         this.m_dictZhuanZhiID[286458480] = 286458480;
         this.m_dictZhuanZhiID[286458494] = 286458480;
         this.m_dictZhuanZhiID[286458495] = 286458480;
         this.m_dictZhuanZhiID[286458736] = 286458736;
         this.m_dictZhuanZhiID[286458750] = 286458736;
         this.m_dictZhuanZhiID[286458751] = 286458736;
         this.m_dictZhuanZhiID[286458496] = 286458496;
         this.m_dictZhuanZhiID[286458510] = 286458496;
         this.m_dictZhuanZhiID[286458511] = 286458496;
         this.m_dictZhuanZhiID[286458532] = 286458532;
         this.m_dictZhuanZhiID[286458542] = 286458532;
         this.m_dictZhuanZhiID[286458543] = 286458532;
         this.m_dictZhuanZhiID[288817220] = 288817220;
         this.m_dictZhuanZhiID[288817230] = 288817220;
         this.m_dictZhuanZhiID[288817231] = 288817220;
         this.m_dictZhuanZhiID[286458432] = 286458432;
         this.m_dictZhuanZhiID[286458446] = 286458432;
         this.m_dictZhuanZhiID[286458447] = 286458432;
         this.m_dictZhuanZhiID[286458448] = 286458448;
         this.m_dictZhuanZhiID[286458462] = 286458448;
         this.m_dictZhuanZhiID[286458463] = 286458448;
         this.m_dictZhuanZhiID[286458464] = 286458464;
         this.m_dictZhuanZhiID[286458478] = 286458464;
         this.m_dictZhuanZhiID[286458479] = 286458464;
         this.m_dictZhuanZhiID[286458852] = [286458852];
         this.m_dictZhuanZhiID[286458862] = [286458852];
         this.m_dictZhuanZhiID[286458863] = [286458852];
         this.m_dictZhuanZhiID[286458820] = [286458820];
         this.m_dictZhuanZhiID[286458830] = [286458820];
         this.m_dictZhuanZhiID[286458831] = [286458820];
         this.m_dictZhuanZhiID[286458724] = [286458724];
         this.m_dictZhuanZhiID[286458734] = [286458724];
         this.m_dictZhuanZhiID[286458735] = [286458724];
         this.m_dictZhuanZhiID[286458628] = [286458628];
         this.m_dictZhuanZhiID[286458638] = [286458628];
         this.m_dictZhuanZhiID[286458639] = [286458628];
         this.m_dictZhuanZhiID[286327636] = [286327636];
         this.m_dictZhuanZhiID[286327646] = [286327636];
         this.m_dictZhuanZhiID[286327647] = [286327636];
         this.m_dictZhuanZhiID[286458788] = [286458788];
         this.m_dictZhuanZhiID[286458798] = [286458788];
         this.m_dictZhuanZhiID[286458799] = [286458788];
         this.m_dictZhuanZhiID[286331684] = [286331684];
         this.m_dictZhuanZhiID[286331694] = [286331684];
         this.m_dictZhuanZhiID[286331695] = [286331684];
         this.m_dictZhuanZhiID[294847348] = [294847348];
         this.m_dictZhuanZhiID[294847358] = [294847348];
         this.m_dictZhuanZhiID[294847359] = [294847348];
         this.m_dictZhuanZhiID[286393140] = [286393140];
         this.m_dictZhuanZhiID[286393150] = [286393140];
         this.m_dictZhuanZhiID[286393151] = [286393140];
         this.m_dictZhuanZhiID[288949204] = [288949204];
         this.m_dictZhuanZhiID[288949214] = [288949204];
         this.m_dictZhuanZhiID[288949215] = [288949204];
         this.m_dictZhuanZhiID[286458090] = [286458090];
         this.m_dictZhuanZhiID[286458091] = [286458090];
         this.m_dictZhuanZhiID[286458092] = [286458090];
         this.m_dictZhuanZhiID[286458093] = [286458090];
         this.m_dictZhuanZhiID[286457866] = [286457866];
         this.m_dictZhuanZhiID[286457867] = [286457866];
         this.m_dictZhuanZhiID[286457868] = [286457866];
         this.m_dictZhuanZhiID[286457869] = [286457866];
         this.m_dictZhuanZhiID[286458058] = [286458058];
         this.m_dictZhuanZhiID[286458059] = [286458058];
         this.m_dictZhuanZhiID[286458060] = [286458058];
         this.m_dictZhuanZhiID[286458061] = [286458058];
         this.m_dictZhuanZhiID[286326874] = [286326874];
         this.m_dictZhuanZhiID[286326875] = [286326874];
         this.m_dictZhuanZhiID[286326876] = [286326874];
         this.m_dictZhuanZhiID[286326877] = [286326874];
         this.m_dictZhuanZhiID[286851418] = [286851418];
         this.m_dictZhuanZhiID[286851419] = [286851418];
         this.m_dictZhuanZhiID[286851420] = [286851418];
         this.m_dictZhuanZhiID[286851421] = [286851418];
         this.m_dictZhuanZhiID[294846586] = [294846586];
         this.m_dictZhuanZhiID[294846587] = [294846586];
         this.m_dictZhuanZhiID[294846588] = [294846586];
         this.m_dictZhuanZhiID[294846589] = [294846586];
         this.m_dictZhuanZhiID[286458074] = [286458074];
         this.m_dictZhuanZhiID[286458075] = [286458074];
         this.m_dictZhuanZhiID[286458076] = [286458074];
         this.m_dictZhuanZhiID[286458077] = [286458074];
         this.m_dictZhuanZhiID[287572010] = [287572010];
         this.m_dictZhuanZhiID[287572011] = [287572010];
         this.m_dictZhuanZhiID[287572012] = [287572010];
         this.m_dictZhuanZhiID[287572013] = [287572010];
         this.m_dictZhuanZhiID[294846618] = [294846618];
         this.m_dictZhuanZhiID[294846619] = [294846618];
         this.m_dictZhuanZhiID[294846620] = [294846618];
         this.m_dictZhuanZhiID[294846621] = [294846618];
         this.m_dictZhuanZhiID[286458160] = [286458160];
         this.m_dictZhuanZhiID[286458174] = [286458160];
         this.m_dictZhuanZhiID[286458175] = [286458160];
         this.m_dictZhuanZhiID[286458004] = [286458004];
         this.m_dictZhuanZhiID[286457902] = [286458004];
         this.m_dictZhuanZhiID[286457903] = [286458004];
         this.m_dictZhuanZhiID[286457984] = [286457984];
         this.m_dictZhuanZhiID[286457886] = [286457984];
         this.m_dictZhuanZhiID[286457887] = [286457984];
         this.m_dictZhuanZhiID[287375396] = [287375396];
         this.m_dictZhuanZhiID[287375406] = [287375396];
         this.m_dictZhuanZhiID[287375407] = [287375396];
         this.m_dictZhuanZhiID[286458132] = [286458132];
         this.m_dictZhuanZhiID[286458142] = [286458132];
         this.m_dictZhuanZhiID[286458143] = [286458132];
         this.m_dictZhuanZhiID[286851428] = [286851428];
         this.m_dictZhuanZhiID[286851438] = [286851428];
         this.m_dictZhuanZhiID[286851439] = [286851428];
         this.m_dictZhuanZhiID[286458212] = [286458212];
         this.m_dictZhuanZhiID[286458222] = [286458212];
         this.m_dictZhuanZhiID[286458223] = [286458212];
         this.m_dictZhuanZhiID[289603636] = [289603636];
         this.m_dictZhuanZhiID[289603646] = [289603636];
         this.m_dictZhuanZhiID[289603647] = [289603636];
         this.m_dictZhuanZhiID[286458148] = [286458148];
         this.m_dictZhuanZhiID[286458158] = [286458148];
         this.m_dictZhuanZhiID[286458159] = [286458148];
         this.m_dictZhuanZhiID[286458116] = [286458116];
         this.m_dictZhuanZhiID[286458126] = [286458116];
         this.m_dictZhuanZhiID[286458127] = [286458116];
         this.m_dictZhuanZhiID[286589012] = [286589012];
         this.m_dictZhuanZhiID[286589022] = [286589012];
         this.m_dictZhuanZhiID[286589023] = [286589012];
         this.m_dictZhuanZhiID[286588996] = [286588996];
         this.m_dictZhuanZhiID[286589006] = [286588996];
         this.m_dictZhuanZhiID[286588964] = [286588964];
         this.m_dictZhuanZhiID[286588974] = [286588964];
         this.m_dictZhuanZhiID[286588975] = [286588964];
         this.m_dictZhuanZhiID[286392884] = [286392884];
         this.m_dictZhuanZhiID[286392894] = [286392884];
         this.m_dictZhuanZhiID[286392895] = [286392884];
         this.m_dictZhuanZhiID[294846596] = [294846596];
         this.m_dictZhuanZhiID[294846606] = [294846596];
         this.m_dictZhuanZhiID[294846607] = [294846596];
         this.m_dictZhuanZhiID[286855632] = [286855632];
         this.m_dictZhuanZhiID[286855646] = [286855632];
         this.m_dictZhuanZhiID[286855647] = [286855632];
         this.m_dictZhuanZhiID[286458192] = [286458192];
         this.m_dictZhuanZhiID[286458206] = [286458192];
         this.m_dictZhuanZhiID[286458207] = [286458192];
         this.m_dictZhuanZhiID[286393088] = [286393088];
         this.m_dictZhuanZhiID[286393102] = [286393088];
         this.m_dictZhuanZhiID[286393103] = [286393088];
         this.m_dictZhuanZhiID[286393104] = [286393104];
         this.m_dictZhuanZhiID[286393118] = [286393104];
         this.m_dictZhuanZhiID[286393119] = [286393104];
         this.m_dictZhuanZhiID[286393120] = [286393120];
         this.m_dictZhuanZhiID[286393134] = [286393120];
         this.m_dictZhuanZhiID[286393135] = [286393120];
         this.m_dictZhuanZhiID[286393216] = [286393216];
         this.m_dictZhuanZhiID[286393230] = [286393216];
         this.m_dictZhuanZhiID[286393231] = [286393216];
         this.m_dictZhuanZhiID[286393200] = [286393200];
         this.m_dictZhuanZhiID[286393214] = [286393200];
         this.m_dictZhuanZhiID[288490367] = [286393200];
         this.m_dictZhuanZhiID[286393184] = [286393184];
         this.m_dictZhuanZhiID[286393198] = [286393184];
         this.m_dictZhuanZhiID[286393199] = [286393184];
         this.m_dictZhuanZhiID[286393344] = [286393344];
         this.m_dictZhuanZhiID[286393358] = [286393344];
         this.m_dictZhuanZhiID[286393359] = [286393344];
         this.m_dictZhuanZhiID[286393370] = [286393370];
         this.m_dictZhuanZhiID[286393371] = [286393370];
         this.m_dictZhuanZhiID[286393372] = [286393370];
         this.m_dictZhuanZhiID[286393373] = [286393370];
         this.m_dictZhuanZhiID[286393392] = [286393392];
         this.m_dictZhuanZhiID[286393406] = [286393392];
         this.m_dictZhuanZhiID[286393407] = [286393392];
         this.m_dictZhuanZhiID[286393408] = [286393408];
         this.m_dictZhuanZhiID[286393422] = [286393408];
         this.m_dictZhuanZhiID[286393423] = [286393408];
         this.m_dictZhuanZhiID[286394256] = [286394256];
         this.m_dictZhuanZhiID[286394270] = [286394256];
         this.m_dictZhuanZhiID[286394271] = [286394256];
         this.m_dictZhuanZhiID[286394368] = [286394368];
         this.m_dictZhuanZhiID[286394382] = [286394368];
         this.m_dictZhuanZhiID[286394383] = [286394368];
         this.m_dictZhuanZhiID[286394384] = [286394384];
         this.m_dictZhuanZhiID[286394398] = [286394384];
         this.m_dictZhuanZhiID[286394399] = [286394384];
         this.m_dictZhuanZhiID[286394400] = [286394400];
         this.m_dictZhuanZhiID[286394414] = [286394400];
         this.m_dictZhuanZhiID[286394415] = [286394400];
         this.m_dictZhuanZhiID[286394416] = [286394416];
         this.m_dictZhuanZhiID[286394430] = [286394416];
         this.m_dictZhuanZhiID[286394431] = [286394416];
         this.m_dictZhuanZhiID[288949760] = [288949760];
         this.m_dictZhuanZhiID[288949774] = [288949760];
         this.m_dictZhuanZhiID[288949775] = [288949760];
         this.m_dictZhuanZhiID[286394464] = [286394464];
         this.m_dictZhuanZhiID[286394478] = [286394464];
         this.m_dictZhuanZhiID[286394479] = [286394464];
         this.m_dictZhuanZhiID[286394480] = [286394480];
         this.m_dictZhuanZhiID[286394494] = [286394480];
         this.m_dictZhuanZhiID[286394495] = [286394480];
         this.m_dictZhuanZhiID[286394634] = [286394634];
         this.m_dictZhuanZhiID[286394635] = [286394634];
         this.m_dictZhuanZhiID[286394636] = [286394634];
         this.m_dictZhuanZhiID[286394637] = [286394634];
         this.m_dictZhuanZhiID[286394656] = [286394656];
         this.m_dictZhuanZhiID[286394670] = [286394656];
         this.m_dictZhuanZhiID[286394671] = [286394656];
         this.m_dictZhuanZhiID[286394688] = [286394688];
         this.m_dictZhuanZhiID[286394702] = [286394688];
         this.m_dictZhuanZhiID[286394703] = [286394688];
         this.m_dictZhuanZhiID[286394704] = [286394704];
         this.m_dictZhuanZhiID[286394718] = [286394704];
         this.m_dictZhuanZhiID[286394719] = [286394704];
         this.m_dictZhuanZhiID[286400544] = [286400544];
         this.m_dictZhuanZhiID[286400558] = [286400544];
         this.m_dictZhuanZhiID[286400559] = [286400544];
         this.m_dictZhuanZhiID[288497728] = [288497728];
         this.m_dictZhuanZhiID[288497742] = [288497728];
         this.m_dictZhuanZhiID[288497743] = [288497728];
         this.m_dictZhuanZhiID[286400592] = [286400592];
         this.m_dictZhuanZhiID[286400606] = [286400592];
         this.m_dictZhuanZhiID[286400607] = [286400592];
         this.m_dictZhuanZhiID[286400618] = [286400618];
         this.m_dictZhuanZhiID[286400619] = [286400618];
         this.m_dictZhuanZhiID[286400620] = [286400618];
         this.m_dictZhuanZhiID[286400621] = [286400618];
         this.m_dictZhuanZhiID[288950016] = [288950016];
         this.m_dictZhuanZhiID[288950030] = [288950016];
         this.m_dictZhuanZhiID[288950031] = [288950016];
         this.m_dictZhuanZhiID[286400640] = [286400640];
         this.m_dictZhuanZhiID[286400654] = [286400640];
         this.m_dictZhuanZhiID[286400655] = [286400640];
         this.m_dictZhuanZhiID[286400656] = [286400656];
         this.m_dictZhuanZhiID[286400670] = [286400656];
         this.m_dictZhuanZhiID[286400671] = [286400656];
         this.m_dictZhuanZhiID[286400768] = [286400768];
         this.m_dictZhuanZhiID[286400782] = [286400768];
         this.m_dictZhuanZhiID[286400783] = [286400768];
         this.m_dictZhuanZhiID[286400784] = [286400784];
         this.m_dictZhuanZhiID[286400798] = [286400784];
         this.m_dictZhuanZhiID[286400799] = [286400784];
         this.m_dictZhuanZhiID[286400800] = [286400800];
         this.m_dictZhuanZhiID[286400814] = [286400800];
         this.m_dictZhuanZhiID[286400815] = [286400800];
         this.m_dictZhuanZhiID[287572016] = [287572016];
         this.m_dictZhuanZhiID[287572030] = [287572016];
         this.m_dictZhuanZhiID[287572031] = [287572016];
         this.m_dictZhuanZhiID[288950032] = [288950032];
         this.m_dictZhuanZhiID[288950046] = [288950032];
         this.m_dictZhuanZhiID[288950047] = [288950032];
         this.m_dictZhuanZhiID[286400896] = [286400896];
         this.m_dictZhuanZhiID[286400910] = [286400896];
         this.m_dictZhuanZhiID[286400911] = [286400896];
         this.m_dictZhuanZhiID[286400912] = [286400912];
         this.m_dictZhuanZhiID[286400926] = [286400912];
         this.m_dictZhuanZhiID[286400927] = [286400912];
         this.m_dictZhuanZhiID[286401050] = [286401050];
         this.m_dictZhuanZhiID[286401051] = [286401050];
         this.m_dictZhuanZhiID[286401052] = [286401050];
         this.m_dictZhuanZhiID[286401053] = [286401050];
         this.m_dictZhuanZhiID[286401056] = [286401056];
         this.m_dictZhuanZhiID[286401070] = [286401056];
         this.m_dictZhuanZhiID[286401071] = [286401056];
         this.m_dictZhuanZhiID[286401072] = [286401072];
         this.m_dictZhuanZhiID[286401086] = [286401072];
         this.m_dictZhuanZhiID[286401087] = [286401072];
         this.m_dictZhuanZhiID[286401136] = [286401136];
         this.m_dictZhuanZhiID[286401150] = [286401136];
         this.m_dictZhuanZhiID[286401151] = [286401136];
         this.m_dictZhuanZhiID[286401104] = [286401104];
         this.m_dictZhuanZhiID[286401118] = [286401104];
         this.m_dictZhuanZhiID[286401119] = [286401104];
         this.m_dictZhuanZhiID[286401120] = [286401120];
         this.m_dictZhuanZhiID[286401134] = [286401120];
         this.m_dictZhuanZhiID[286401135] = [286401120];
         this.m_dictZhuanZhiID[286401168] = [286401168];
         this.m_dictZhuanZhiID[286401182] = [286401168];
         this.m_dictZhuanZhiID[286401183] = [286401168];
         this.m_dictZhuanZhiID[286401296] = [286401296];
         this.m_dictZhuanZhiID[286401310] = [286401296];
         this.m_dictZhuanZhiID[286401311] = [286401296];
         this.m_dictZhuanZhiID[286401312] = [286401312];
         this.m_dictZhuanZhiID[286401326] = [286401312];
         this.m_dictZhuanZhiID[286401327] = [286401312];
         this.m_dictZhuanZhiID[286401338] = [286401338];
         this.m_dictZhuanZhiID[288950059] = [286401338];
         this.m_dictZhuanZhiID[288950060] = [286401338];
         this.m_dictZhuanZhiID[288950061] = [286401338];
         this.m_dictZhuanZhiID[286401344] = [286401344];
         this.m_dictZhuanZhiID[286401358] = [286401344];
         this.m_dictZhuanZhiID[286401359] = [286401344];
         this.m_dictZhuanZhiID[286401360] = [286401360];
         this.m_dictZhuanZhiID[286401374] = [286401360];
         this.m_dictZhuanZhiID[286401375] = [286401360];
         this.m_dictZhuanZhiID[286401392] = [286401392];
         this.m_dictZhuanZhiID[286401406] = [286401392];
         this.m_dictZhuanZhiID[286401407] = [286401392];
         this.m_dictZhuanZhiID[288950064] = [288950064];
         this.m_dictZhuanZhiID[288950078] = [288950064];
         this.m_dictZhuanZhiID[288950079] = [288950064];
         this.m_dictZhuanZhiID[286401408] = [286401408];
         this.m_dictZhuanZhiID[286401422] = [286401408];
         this.m_dictZhuanZhiID[286401423] = [286401408];
         this.m_dictZhuanZhiID[286401424] = [286401424];
         this.m_dictZhuanZhiID[286401438] = [286401424];
         this.m_dictZhuanZhiID[286401439] = [286401424];
         this.m_dictZhuanZhiID[286401536] = [286401536];
         this.m_dictZhuanZhiID[286401550] = [286401536];
         this.m_dictZhuanZhiID[286401551] = [286401536];
         this.m_dictZhuanZhiID[286401552] = [286401552];
         this.m_dictZhuanZhiID[286401566] = [286401552];
         this.m_dictZhuanZhiID[286401567] = [286401552];
         this.m_dictZhuanZhiID[287572032] = [287572032];
         this.m_dictZhuanZhiID[287572046] = [287572032];
         this.m_dictZhuanZhiID[287572047] = [287572032];
         this.m_dictZhuanZhiID[288950080] = [288950080];
         this.m_dictZhuanZhiID[288950094] = [288950080];
         this.m_dictZhuanZhiID[288950095] = [288950080];
         this.m_dictZhuanZhiID[288950272] = [288950272];
         this.m_dictZhuanZhiID[288950286] = [288950272];
         this.m_dictZhuanZhiID[288950287] = [288950272];
         this.m_dictZhuanZhiID[286462144] = [286462144];
         this.m_dictZhuanZhiID[286462158] = [286462144];
         this.m_dictZhuanZhiID[286462159] = [286462144];
         this.m_dictZhuanZhiID[286462064] = [286462064];
         this.m_dictZhuanZhiID[286462078] = [286462064];
         this.m_dictZhuanZhiID[286462079] = [286462064];
         this.m_dictZhuanZhiID[286855616] = [286855616];
         this.m_dictZhuanZhiID[286855630] = [286855616];
         this.m_dictZhuanZhiID[286855631] = [286855616];
         this.m_dictZhuanZhiID[286401568] = [286401568];
         this.m_dictZhuanZhiID[286401582] = [286401568];
         this.m_dictZhuanZhiID[286401583] = [286401568];
         this.m_dictZhuanZhiID[286458000] = [286458000];
         this.m_dictZhuanZhiID[286458014] = [286458000];
         this.m_dictZhuanZhiID[286458015] = [286458000];
         for(key in CardUpgradeXML.Get().m_UpGradeDict)
         {
            upgradeIDHex = CardUpgradeXML.Get().m_UpGradeDict[key];
            for(i = 0; i < upgradeIDHex.length; i++)
            {
               if(this.m_dictZhuanZhiID[upgradeIDHex[i]] == undefined)
               {
                  this.m_dictZhuanZhiID[upgradeIDHex[i]] = upgradeIDHex[0];
               }
            }
         }
         this.m_dictZhuanZhiID[286457876] = 286457876;
         this.m_dictZhuanZhiID[286462064] = 286462064;
         this.m_dictZhuanZhiID[286462144] = 286462144;
         this.m_dictZhuanZhiID[286458112] = 286458112;
         this.m_dictZhuanZhiID[286458208] = 286458208;
         this.m_dictZhuanZhiID[286458224] = 286458224;
         this.m_dictZhuanZhiID[286457888] = 286457888;
         this.m_dictZhuanZhiID[286458144] = 286458144;
         this.m_dictZhuanZhiID[286458208] = 286458208;
         this.m_dictZhuanZhiID[289607700] = 289607700;
         this.m_dictZhuanZhiID[286523412] = 286523412;
         this.m_dictZhuanZhiID[286523424] = 286523424;
         this.m_dictZhuanZhiID[286851568] = 286851568;
         this.m_dictZhuanZhiID[286458384] = 286458384;
         this.m_dictZhuanZhiID[286523636] = 286523636;
         this.m_dictZhuanZhiID[286588996] = 286588996;
         this.m_dictZhuanZhiID[286393168] = 286393168;
         this.m_dictZhuanZhiID[286458368] = 286458368;
         this.m_dictZhuanZhiID[286855648] = 286855648;
         this.m_dictZhuanZhiID[286523936] = 286523936;
         this.m_dictZhuanZhiID[286523952] = 286523952;
      }
   }
}

