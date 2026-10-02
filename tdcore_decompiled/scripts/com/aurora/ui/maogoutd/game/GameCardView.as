package com.aurora.ui.maogoutd.game
{
   import a_4724.AvatarDetailInfo;
   import a_4728.a_1778;
   import a_4752.GameStringManager;
   import a_4752.GlobalVariables;
   import a_4752.a_2036;
   import a_4753.b_150;
   import a_4754.a_2161;
   import a_4774.a_3004;
   import com.aurora.ui.maogoutd.ClientLog.MessageTipHandler;
   import com.aurora.ui.maogoutd.IPlaceOnHandView;
   import com.aurora.ui.maogoutd.game.Util.BattleCardUtil;
   import com.aurora.ui.maogoutd.game.Util.BattleVOUtil;
   import com.aurora.ui.maogoutd.game.Util.BitMapManager;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.defender.a_3953;
   import com.aurora.ui.maogoutd.resource.defender.a_3959;
   import com.aurora.ui.maogoutd.resource.defender.a_3960;
   import com.aurora.ui.maogoutd.resource.defender.a_3962;
   import com.aurora.ui.maogoutd.resource.defender.a_3971;
   import com.aurora.ui.maogoutd.resource.defender.a_3975;
   import com.aurora.ui.maogoutd.resource.defender.a_3976;
   import com.aurora.ui.maogoutd.resource.defender.a_4012;
   import com.aurora.ui.maogoutd.resource.defender.defenderSet.IDefenderSet;
   import com.aurora.ui.maogoutd.resource.effect.AurShadow;
   import com.aurora.ui.maogoutd.resource.gamemap.newMap.HorseYear.IsLand.IsLandLineManager;
   import com.aurora.ui.maogoutd.resource.tools.a_4421;
   import com.aurora.ui.maogoutd.role.a_4463;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.Loader;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.events.ContextMenuEvent;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import flash.text.TextField;
   import flash.text.TextFieldAutoSize;
   import flash.ui.ContextMenu;
   import flash.ui.ContextMenuItem;
   import flash.utils.ByteArray;
   import flash.utils.Dictionary;
   import flash.utils.Timer;
   
   public class GameCardView extends Sprite implements IPlaceOnHandView
   {
      
      public static var a_1088:b_150;
      
      public static var a_1089:a_3411;
      
      public static var a_1090:Array;
      
      public static var a_1091:Array;
      
      public static var ms_arrCardEffectAddArray:Array;
      
      public static var a_1092:ContextMenu;
      
      private static var ms_stRedDangerFieldAlarmBitmap:Bitmap;
      
      public static var m_iIsCopyCard:Boolean;
      
      public static var m_iCanCopyCard:Boolean;
      
      public static var m_iBeCopyCard:Boolean;
      
      public static var m_iCopyFieldGrid:a_3491;
      
      public static var m_iCopyByWhoID:String;
      
      public static var ms_arrLocalizedDataArray:Array = [];
      
      public static var m_iCopyFieldGridDic:Dictionary = new Dictionary();
      
      public var m_stCardStarDegreeMovie:MovieClip;
      
      public var m_stCardGradeDegreeMovie:MovieClip;
      
      public var m_stCardPriceText:TextField;
      
      public var m_stCardGrowTimesText:TextField;
      
      public var m_szCardName:String = "";
      
      public var m_iOnHand:Boolean;
      
      private var a_1093:TextField;
      
      private var a_1094:int = 0;
      
      private var m_iGradeDegree:int = 0;
      
      private var a_1095:int = 0;
      
      private var a_1096:Boolean;
      
      private var a_1097:int = 0;
      
      private var m_iDefenseTypeIDEx:uint = 0;
      
      private var a_1099:BitmapData;
      
      private var a_1100:Bitmap;
      
      private var m_stReplaceBitmap1:Bitmap;
      
      private var m_stReplaceBitmap2:Bitmap;
      
      private var m_lastMoveFieldGrid:a_3491;
      
      private var a_1101:BitmapData;
      
      private var a_1102:BitmapData;
      
      private var a_1103:Bitmap;
      
      private var a_1104:BitmapData;
      
      private var a_1105:a_3962;
      
      public var m_stCopyBaseDefense:a_3962;
      
      private var a_1106:Number;
      
      private var a_1107:Timer;
      
      private var m_szLastGrowTimesText:String = null;
      
      private var m_step:int = 0;
      
      private var placeCount:int = 0;
      
      private var a_1108:int = 0;
      
      private var m_strVersion:String = "0000201601010101";
      
      public var cardIndex:int = 0;
      
      private var ChangeInToOrder:Array = [];
      
      private var coveredDefense:a_3962;
      
      private var m_IsReduceGrowTime:Boolean;
      
      private var m_CardGrownTotalTime:int;
      
      private var m_ReduceRate:Number = 1;
      
      private var m_GrowHistory:Array = [];
      
      public function GameCardView(iDefenseTypeID:uint)
      {
         var key:* = undefined;
         var a_1105:a_3962 = null;
         var iCardEffectAddValue:int = 0;
         var arrCardEffectAddValueArray:Array = null;
         var stCardInfo:Object = null;
         var stCardBitMapLoader:Loader = null;
         var stCancelCardMenuItem:ContextMenuItem = null;
         super();
         this.m_iOnHand = false;
         m_iIsCopyCard = false;
         m_iBeCopyCard = false;
         m_iCanCopyCard = true;
         m_iCopyByWhoID = "";
         this.m_IsReduceGrowTime = false;
         GlobalVariables.getInstance().m_iLastDefender = -1;
         for(key in GlobalVariables.getInstance().m_prevPlacedCardDic)
         {
            GlobalVariables.getInstance().m_prevPlacedCardDic[key] = null;
            delete GlobalVariables.getInstance().m_prevPlacedCardDic[key];
         }
         this.GenerateMultiCircleCoordinates(8);
         if(null == a_1092)
         {
            a_1092 = new ContextMenu();
            a_1092.hideBuiltInItems();
            stCancelCardMenuItem = new ContextMenuItem("取消卡片");
            stCancelCardMenuItem.addEventListener(ContextMenuEvent.MENU_ITEM_SELECT,this.a_3519);
            if(a_1092.customItems)
            {
               a_1092.customItems.push(stCancelCardMenuItem);
            }
         }
         if(null == ms_stRedDangerFieldAlarmBitmap)
         {
            ms_stRedDangerFieldAlarmBitmap = new Bitmap(BitMapManager.getInstance().GetRedDangerFieldAlarmBitmapData());
         }
         this.a_1098 = iDefenseTypeID;
         a_1105 = a_4012.getInstance().a_4013(this.a_1098);
         if(null == a_1105)
         {
            throw Error("Error For DefenseTypeID:" + this.a_1098);
         }
         a_1105.iDefenseTypeID = this.a_1098;
         this.a_1095 = a_1105.iDefensePrice;
         this.a_1096 = a_1105.isNeedAdditionPrice;
         if(a_1089.a_3413().m_stMyBattleFieldView.GetGameMoveMap())
         {
            a_1089.a_3413().m_stMyBattleFieldView.GetGameMoveMap().RemoveMoveDisplayObject(a_1105);
         }
         arrCardEffectAddValueArray = this.GetGameCardEffectAddArray(this.a_1098,a_1105.a_3512(),10);
         for each(iCardEffectAddValue in arrCardEffectAddValueArray)
         {
            this.a_1095 -= iCardEffectAddValue;
         }
         this.m_stCardStarDegreeMovie.gotoAndStop(1);
         this.m_stCardGradeDegreeMovie.gotoAndStop(1);
         this.a_1094 = 0;
         this.m_iGradeDegree = 0;
         for each(stCardInfo in a_1091)
         {
            if(stCardInfo.m_iCardID == this.a_1098)
            {
               this.a_1094 = stCardInfo.m_byCardDegreeLevel;
               this.m_iGradeDegree = stCardInfo.m_byCardGradeLevel;
               break;
            }
         }
         if(this.a_1094 > 0 && this.a_1094 <= 16)
         {
            this.m_stCardStarDegreeMovie.visible = true;
            this.m_stCardStarDegreeMovie.gotoAndStop(this.a_1094);
         }
         else
         {
            this.m_stCardStarDegreeMovie.visible = false;
            this.m_stCardStarDegreeMovie.gotoAndStop(1);
         }
         if(this.m_iGradeDegree > 0 && this.m_iGradeDegree <= 16)
         {
            this.m_stCardGradeDegreeMovie.visible = true;
            this.m_stCardGradeDegreeMovie.gotoAndStop(this.m_iGradeDegree);
         }
         else
         {
            this.m_stCardGradeDegreeMovie.visible = false;
            this.m_stCardGradeDegreeMovie.gotoAndStop(1);
         }
         this.m_stCardPriceText.text = this.a_1095.toString();
         this.m_stCardPriceText.selectable = false;
         this.m_stCardGrowTimesText.selectable = false;
         this.m_stCardGrowTimesText.mouseEnabled = false;
         this.m_ReduceRate = 1;
         this.m_GrowHistory = [];
         this.UpdateGrowTimesText("");
         buttonMode = true;
         this.a_1099 = new BitmapData(a_1105.width,a_1105.height,true,0);
         this.a_1099.draw(a_1105);
         a_1105.a_3940();
         this.a_1100 = new Bitmap(this.a_1099);
         this.a_1100.alpha = 0.6;
         if(this.a_1098 == 288950079 || this.a_1098 == 287572013 || this.a_1098 == 292552863 || this.a_1098 == 288950029)
         {
            this.m_stReplaceBitmap1 = new Bitmap(this.a_1099);
            this.m_stReplaceBitmap1.alpha = 0.6;
            this.m_stReplaceBitmap2 = new Bitmap(this.a_1099);
            this.m_stReplaceBitmap2.alpha = 0.6;
         }
         this.a_1102 = new BitmapData(53,70,true,2571059013);
         this.a_1101 = this.a_1102.clone();
         this.a_1103 = new Bitmap(this.a_1102);
         this.a_1104 = new BitmapData(53,70,true,1075452449);
         stCardBitMapLoader = new Loader();
         var szDefenseTypeIDStr:String = iDefenseTypeID.toString(16).toLowerCase();
         var szCardPicUrl:String = "resource/pic/0x" + "000000".substr(szDefenseTypeIDStr.length) + szDefenseTypeIDStr + ".png";
         var stVersion:Date = this.GetVersionByKey(szCardPicUrl);
         if(null != stVersion)
         {
            if(stVersion is Date)
            {
               szCardPicUrl += "?v=" + this.GetTimeStringByDate(stVersion as Date);
            }
            else
            {
               szCardPicUrl += "?v=" + stVersion;
            }
         }
         else
         {
            szCardPicUrl = szCardPicUrl.concat("?v=" + this.m_strVersion);
         }
         new a_3004().loadFileToLoader(stCardBitMapLoader,szCardPicUrl);
         stCardBitMapLoader.y = 5;
         addChildAt(stCardBitMapLoader,0);
         this.a_1103.y = 5;
         this.m_step = this.placeCount = 0;
         addEventListener(MouseEvent.MOUSE_DOWN,this.a_3076);
         var iReduceGrownTime:int = 0;
         arrCardEffectAddValueArray = this.GetGameCardEffectAddArray(this.a_1098,a_1105.a_3512(),8);
         for each(iCardEffectAddValue in arrCardEffectAddValueArray)
         {
            iReduceGrownTime += iCardEffectAddValue;
         }
         this.CalEndGrownTotalTime(a_1105,iReduceGrownTime);
         this.a_1106 = this.a_1102.height / this.m_CardGrownTotalTime;
         this.a_1107 = new Timer(100);
         this.a_1093 = new TextField();
         this.a_1093.background = true;
         this.a_1093.backgroundColor = 16764006;
         this.a_1093.border = true;
         this.a_1093.borderColor = 3355443;
         this.a_1093.textColor = 0;
         addEventListener(MouseEvent.MOUSE_OVER,this.a_3073);
         addEventListener(MouseEvent.MOUSE_OUT,this.OnMouseOutEvent);
      }
      
      private function get a_1098() : uint
      {
         return this.m_iDefenseTypeIDEx;
      }
      
      private function set a_1098(iValue:uint) : void
      {
         this.m_iDefenseTypeIDEx = iValue;
      }
      
      public function get stGrowTimer() : Timer
      {
         return this.a_1107;
      }
      
      public function get iStarDegree() : int
      {
         return this.a_1094;
      }
      
      private function CalEndGrownTotalTime(stBaseDefense:a_3962, iReduceGrownTime:int) : void
      {
         var iCostTime:int = stBaseDefense.a_3963() - iReduceGrownTime;
         var buffId:int = a_4206.m_iViewBuffId;
         if(buffId == 320012352)
         {
            this.m_CardGrownTotalTime = iCostTime * 0.5;
         }
         else if(buffId == 320012432 && BattleFieldView.m_lTraceCard.indexOf(this.a_1098) != -1)
         {
            this.m_CardGrownTotalTime = 7 * 10;
         }
         else
         {
            this.m_CardGrownTotalTime = iCostTime;
         }
      }
      
      private function CompletionPreZero(strSrc:String, iLen:int = 2) : String
      {
         for(var i:int = strSrc.length; i < iLen; i++)
         {
            strSrc = "0" + strSrc;
         }
         return strSrc;
      }
      
      private function GetTimeStringByDate(stDate:Date) : String
      {
         var strVersion:String = "";
         strVersion += stDate.getFullYear();
         strVersion += this.CompletionPreZero((stDate.getMonth() + 1).toString());
         strVersion += this.CompletionPreZero(stDate.getDate().toString());
         strVersion += this.CompletionPreZero(stDate.getHours().toString());
         strVersion += this.CompletionPreZero(stDate.getMinutes().toString());
         return strVersion + this.CompletionPreZero(stDate.getSeconds().toString());
      }
      
      private function GetVersionByKey(strUrl:String) : *
      {
         if(null == a_1090)
         {
            return new Date();
         }
         if(null == a_1090[strUrl])
         {
            MessageTipHandler.Get().a_3146(GameStringManager.getInstance().getString(139895,[strUrl]));
            return null;
         }
         return a_1090[strUrl];
      }
      
      public function get stBaseDefense() : a_3962
      {
         return this.a_1105;
      }
      
      public function get iDefensePrice() : int
      {
         var iPrice:int = this.a_1095;
         if(this.a_1096)
         {
            iPrice = this.a_1095 + this.a_1097;
         }
         return iPrice;
      }
      
      public function get iNeedAdditionPrice() : Boolean
      {
         return this.a_1096;
      }
      
      public function set iGrowTimes(v:int) : void
      {
         this.a_1108 = v;
      }
      
      public function get iGrowTimes() : int
      {
         return this.a_1108;
      }
      
      public function a_3512() : int
      {
         return this.a_1098;
      }
      
      public function a_3513() : void
      {
         addChildAt(this.a_1103,1);
         removeEventListener(MouseEvent.MOUSE_DOWN,this.a_3076);
         buttonMode = false;
      }
      
      public function a_3514() : void
      {
         if(contains(this.a_1103))
         {
            removeChild(this.a_1103);
         }
         buttonMode = true;
         if(this.a_1108 == 0)
         {
            this.m_step = this.placeCount = 0;
            addEventListener(MouseEvent.MOUSE_DOWN,this.a_3076);
         }
         this.a_1102.copyPixels(this.a_1101,new Rectangle(0,0,this.a_1102.width,this.a_1102.height),new Point(0,0));
      }
      
      public function a_3515(iAdditionPrice:int) : void
      {
         this.a_1097 = iAdditionPrice;
         if(this.a_1096)
         {
            this.m_stCardPriceText.text = (this.a_1095 + this.a_1097).toString();
         }
      }
      
      public function a_3516() : void
      {
         if(a_2036.getInstance().tagCom.HasTag(300 + this.cardIndex))
         {
            return;
         }
         this.a_1107.stop();
         this.a_1108 = 0;
         this.m_ReduceRate = 1;
         this.m_GrowHistory = [];
         this.UpdateGrowTimesText("");
         a_1089.a_3412().a_3480(0);
         if(!contains(this.a_1103))
         {
            this.m_step = this.placeCount = 0;
            addEventListener(MouseEvent.MOUSE_DOWN,this.a_3076);
         }
         var szAlertText:String = "";
         if(contains(this.a_1103))
         {
            szAlertText += "<font color=\'#FF0000\'>" + (ms_arrLocalizedDataArray["没有足够的火苗"] ? ms_arrLocalizedDataArray["没有足够的火苗"] : "没有足够的火苗") + "</font><br>";
         }
         this.a_1093.htmlText = szAlertText + "<font color=\'0x000000\'>" + this.m_szCardName + "</font>";
      }
      
      public function a_3517() : void
      {
         if(this.a_1105)
         {
            if(Boolean(this.a_1100) && Boolean(this.a_1100.parent) && this.a_1100.parent.contains(this.a_1100))
            {
               this.a_1100.parent.removeChild(this.a_1100);
            }
            if(Boolean(this.m_stReplaceBitmap1) && Boolean(this.m_stReplaceBitmap1.parent) && this.m_stReplaceBitmap1.parent.contains(this.m_stReplaceBitmap1))
            {
               this.m_stReplaceBitmap1.parent.removeChild(this.m_stReplaceBitmap1);
            }
            if(Boolean(this.m_stReplaceBitmap2) && Boolean(this.m_stReplaceBitmap2.parent) && this.m_stReplaceBitmap2.parent.contains(this.m_stReplaceBitmap2))
            {
               this.m_stReplaceBitmap2.parent.removeChild(this.m_stReplaceBitmap2);
            }
            IsLandLineManager.getInstance().HideVirtual();
            this.a_1105.removeEventListener(MouseEvent.CLICK,this.OnBaseDefenseMouseClick);
            a_1089.removeEventListener(MouseEvent.MOUSE_MOVE,this.OnBaseDefenseMouseMove,true);
            a_1089.IsExistDefensePlaceOnHand = false;
            this.a_1105.a_3940();
            this.a_1105 = null;
            this.m_lastMoveFieldGrid = null;
         }
      }
      
      public function BackToPanleGameCardOnHand() : void
      {
         var stMyBattleFieldView:BattleFieldView = null;
         var stMyBattleFieldView2:BattleFieldView = null;
         this.a_3517();
         if(this.m_step == 1)
         {
            this.a_1108 = 0;
            this.m_ReduceRate = 1;
            this.m_GrowHistory = [];
            this.UpdateGrowTimesText("");
            a_1089.a_3412().a_3480(this.iDefensePrice);
         }
         else if(this.m_step == 2)
         {
            if(this.a_1098 == 288950029)
            {
               stMyBattleFieldView = a_1089.a_3413().m_stMyBattleFieldView;
               DefensePlaceHelper.getInstance().PostFinalBrahmaStateChange(stMyBattleFieldView);
               BattleFieldView.ms_isMyPlaced = false;
               this.a_1107.start();
               this.m_iOnHand = false;
            }
            else if(BattleCardUtil.IsQiaotouRiceNoodles(this.a_1098))
            {
               stMyBattleFieldView2 = a_1089.a_3413().m_stMyBattleFieldView;
               DefensePlaceHelper.getInstance().PostFinalBrahmaStateChange(stMyBattleFieldView2);
               BattleFieldView.ms_isMyPlaced = false;
               this.a_1107.start();
               this.m_iOnHand = false;
            }
         }
      }
      
      private function GetGameCardEffectAddArray(bySeatID:int, iGameCardID:int, iEffectTypeID:int) : Array
      {
         return AvatarDetailInfo.getCardEffectValueArray(ms_arrCardEffectAddArray,iGameCardID,iEffectTypeID);
      }
      
      public function OnGameCardCopy(iPlaceID:int, copyByWhoID:String) : void
      {
         this.m_stCopyBaseDefense = a_4012.getInstance().a_4013(iPlaceID);
         this.m_stCopyBaseDefense.iDefenseTypeID = iPlaceID;
         m_iBeCopyCard = true;
         m_iCopyByWhoID = copyByWhoID;
         this.OnBaseDefenseMouseClick(null);
      }
      
      public function onCloseCopyCardProcess(iPlaceID:String) : void
      {
         m_iBeCopyCard = false;
         m_iCanCopyCard = true;
      }
      
      public function SetState() : void
      {
         m_iCanCopyCard = true;
      }
      
      private function a_3076(a_4730:Event) : void
      {
         if(a_1089.IsExistDefensePlaceOnHand)
         {
            return;
         }
         this.a_1105 = a_4012.getInstance().a_4013(this.a_1098);
         if(null != this.a_1105)
         {
            this.m_iOnHand = true;
            a_1089.a_3412().a_3481(this.iDefensePrice);
            this.a_1105.iDefenseTypeID = this.a_1098;
            this.a_1105.visible = true;
            this.a_1105.gotoAndStop(1);
            a_1089.addChild(this.a_1105);
            this.a_1105.x = a_1089.mouseX - this.a_1105.width * 0.5;
            this.a_1105.y = a_1089.mouseY - this.a_1105.height * 0.75;
            this.a_1105.addEventListener(MouseEvent.CLICK,this.OnBaseDefenseMouseClick);
            a_1089.addEventListener(MouseEvent.MOUSE_MOVE,this.OnBaseDefenseMouseMove,true);
            a_1089.IsExistDefensePlaceOnHand = true;
            a_1089.SetLastCardViewOnHand(this);
            addChildAt(this.a_1103,1);
            this.a_1108 = 1;
            ++this.m_step;
            BattleFieldView.ms_naka13.play();
            removeEventListener(MouseEvent.MOUSE_DOWN,this.a_3076);
            this.a_1105.contextMenu = a_1092;
         }
         if(stage)
         {
            stage.focus = stage;
         }
      }
      
      private function OnBaseDefenseMouseMove(a_4730:MouseEvent) : void
      {
         var iXGridNo:int = 0;
         var iYGridNo:int = 0;
         var stFieldGrid:a_3491 = null;
         var iExtraCount:int = 0;
         var iLoopCnt:int = 0;
         var iCnt:int = 0;
         var stStartField:a_3491 = null;
         var m_followBitmap:Bitmap = null;
         if(stage)
         {
            stage.focus = stage;
         }
         this.a_1105.x = a_1089.mouseX - this.a_1105.width * 0.5;
         this.a_1105.y = a_1089.mouseY - this.a_1105.height * 0.75;
         var stMyBattleFieldView:BattleFieldView = a_1089.a_3413().m_stMyBattleFieldView;
         if(stMyBattleFieldView.mouseX > 0 && stMyBattleFieldView.mouseX < BattleFieldView.a_1013 && stMyBattleFieldView.mouseY > 0 && stMyBattleFieldView.mouseY < BattleFieldView.a_1014)
         {
            iXGridNo = int(stMyBattleFieldView.mouseX / a_3491.a_1080);
            iYGridNo = int(stMyBattleFieldView.mouseY / a_3491.a_1081);
            stFieldGrid = stMyBattleFieldView.a_3438(iXGridNo,iYGridNo);
            if(this.a_1105 is a_3975 && null != stFieldGrid.m_stProtector || this.a_1105 is a_3953 && !this.CanPlaceAttackDefense(this.a_1105,stFieldGrid) || this.a_1105 is a_3960 && (null != stFieldGrid.m_stBoomDefense || null != stFieldGrid.m_stAttackFighter) || this.a_1105 is a_3971 && (null != stFieldGrid.m_stFlowerDefense || null != stFieldGrid.m_stAttackFighter))
            {
               this.a_1100.visible = false;
               if(this.m_stReplaceBitmap1)
               {
                  this.m_stReplaceBitmap1.visible = false;
               }
               if(this.m_stReplaceBitmap2)
               {
                  this.m_stReplaceBitmap2.visible = false;
               }
               IsLandLineManager.getInstance().HideVirtual();
               return;
            }
            if(this.m_lastMoveFieldGrid != stFieldGrid)
            {
               this.m_lastMoveFieldGrid = stFieldGrid;
               if(this.a_1098 == 288950079 || this.a_1098 == 287572013 || this.a_1098 == 292552863 || this.a_1098 == 288950029)
               {
                  iExtraCount = DefensePlaceHelper.getInstance().getPlaceCountByPlaceID(this.a_1098,this.m_step);
                  iLoopCnt = 0;
                  iCnt = 0;
                  while(iLoopCnt < this.ChangeInToOrder.length && iCnt < iExtraCount)
                  {
                     stStartField = stMyBattleFieldView.a_3438(stFieldGrid.m_iXGridNo + this.ChangeInToOrder[iLoopCnt][0],stFieldGrid.m_iYGridNo + this.ChangeInToOrder[iLoopCnt][1]);
                     if(stStartField != null && stStartField != stFieldGrid && stStartField.CheckAddDefense(this.a_1105))
                     {
                        m_followBitmap = this["m_stReplaceBitmap" + (iCnt + 1)];
                        if(m_followBitmap)
                        {
                           m_followBitmap.visible = true;
                           m_followBitmap.x = this.a_1105.iXPosSheft + stStartField.m_iXGridNo * a_3491.a_1080 + (a_3491.a_1080 - m_followBitmap.width) * 0.5;
                           m_followBitmap.y = this.a_1105.iYPosSheft + stStartField.m_iYGridNo * a_3491.a_1081 + (a_3491.a_1081 - this.a_1105.height - 5);
                           stMyBattleFieldView.addChild(m_followBitmap);
                        }
                        iCnt++;
                     }
                     iLoopCnt++;
                  }
               }
               this.a_1100.visible = true;
               this.a_1100.x = this.a_1105.iXPosSheft + iXGridNo * a_3491.a_1080 + (a_3491.a_1080 - this.a_1100.width) * 0.5;
               this.a_1100.y = this.a_1105.iYPosSheft + iYGridNo * a_3491.a_1081 + (a_3491.a_1081 - this.a_1105.height - 5);
               stMyBattleFieldView.addChild(this.a_1100);
               IsLandLineManager.getInstance().UpdateVirtual(this.a_1098,iXGridNo,iYGridNo,stMyBattleFieldView);
            }
            if(this.a_1105 is a_3953 && (this.a_1105 as a_3953).iBattleFighterType == 2)
            {
               ms_stRedDangerFieldAlarmBitmap.visible = true;
               ms_stRedDangerFieldAlarmBitmap.x = a_3491.a_1080 * iXGridNo;
               ms_stRedDangerFieldAlarmBitmap.y = a_3491.a_1081 * iYGridNo + 10;
               stMyBattleFieldView.m_stOpponentBattleFieldInstance.addChildAt(ms_stRedDangerFieldAlarmBitmap,1);
            }
         }
         else
         {
            this.a_1100.visible = false;
            if(this.m_stReplaceBitmap1)
            {
               this.m_stReplaceBitmap1.visible = false;
            }
            if(this.m_stReplaceBitmap2)
            {
               this.m_stReplaceBitmap2.visible = false;
            }
            IsLandLineManager.getInstance().HideVirtual();
            ms_stRedDangerFieldAlarmBitmap.visible = false;
         }
      }
      
      private function CheckNeedRecByPlace(a_4730:Event) : void
      {
         if(a_4730 != null && !BattleFieldView.JudgeIsCopyCard(this.a_1098) && !BattleFieldView.JudgeIsCooldownCard(this.a_1098))
         {
            GlobalVariables.getInstance().m_iLastDefender = this.a_1098;
         }
      }
      
      private function PostExtraPlacementsByCardID(bIsDefenderSet:Boolean, stMyBattleFieldView:BattleFieldView, stFieldGrid:a_3491, stDefense:a_3962, cardID:int, byIsTool:int = 0, IsCaclueCoolDown:int = 0, iStarDegree:int = 20, iCost:int = 0) : void
      {
         var iExtraCount:int = 0;
         var stStartField:a_3491 = null;
         var iLoopCnt:int = 0;
         var iCnt:int = 0;
         var m_stShowdowBitmap:Bitmap = null;
         var stTargetFieldGird:a_3491 = null;
         if(!stMyBattleFieldView || !stFieldGrid || !stDefense)
         {
            return;
         }
         var placedId:int = stDefense.a_3512();
         if(this.placeCount > 0 && (placedId == 287572013 || placedId == 292552863 || placedId == 288950029 || BattleCardUtil.IsQiaotouRiceNoodles(this.a_1098)))
         {
            IsCaclueCoolDown = 2;
         }
         var stInitialFieldGrid:a_3491 = stMyBattleFieldView.a_3438(stFieldGrid.m_iXGridNo,stFieldGrid.m_iYGridNo);
         a_1088.a_2059(stDefense.m_iDefenseGlobalID,this.a_1098,stInitialFieldGrid.m_iInitialXGridNo,stInitialFieldGrid.m_iInitialYGridNo,byIsTool,IsCaclueCoolDown,iStarDegree,iCost);
         this.LockFieldGrid(stFieldGrid,cardID);
         this.UpdateCardBuff(this.a_1098,stDefense);
         if(placedId == 287572013 || placedId == 292552863 || placedId == 288950029)
         {
            iExtraCount = DefensePlaceHelper.getInstance().getPlaceCountByPlaceID(cardID,this.m_step);
            iLoopCnt = 0;
            iCnt = 0;
            while(iLoopCnt < this.ChangeInToOrder.length && iCnt < iExtraCount)
            {
               stStartField = stMyBattleFieldView.a_3438(stFieldGrid.m_iXGridNo + this.ChangeInToOrder[iLoopCnt][0],stFieldGrid.m_iYGridNo + this.ChangeInToOrder[iLoopCnt][1]);
               if(stStartField != null && stStartField != stFieldGrid && stStartField.CheckAddDefense(stDefense))
               {
                  stInitialFieldGrid = stMyBattleFieldView.a_3438(stStartField.m_iXGridNo,stStartField.m_iYGridNo);
                  if(this.placeCount > 0 && (placedId == 287572013 || placedId == 292552863 || placedId == 288950029))
                  {
                     IsCaclueCoolDown = 2;
                  }
                  a_1088.a_2059(stMyBattleFieldView.a_2180(),cardID,stInitialFieldGrid.m_iInitialXGridNo,stInitialFieldGrid.m_iInitialYGridNo,byIsTool,IsCaclueCoolDown,iStarDegree,iCost);
                  this.LockFieldGrid(stStartField,cardID);
                  iCnt++;
               }
               iLoopCnt++;
            }
         }
         if(!bIsDefenderSet)
         {
            if(stDefense.isNeedAddShawdow)
            {
               m_stShowdowBitmap = new Bitmap();
               m_stShowdowBitmap.x = stDefense.iXPosSheft + a_3491.a_1080 * (stFieldGrid.m_iXGridNo + 0.1);
               m_stShowdowBitmap.y = stDefense.iYPosSheft + stFieldGrid.m_iYGridNo * a_3491.a_1081 + (a_3491.a_1081 - stDefense.height - 5) + stDefense.height - 20;
               m_stShowdowBitmap.bitmapData = AurShadow.a_4106();
               m_stShowdowBitmap.width = 50;
               m_stShowdowBitmap.height = 25;
               m_stShowdowBitmap.alpha = 0.6;
               stTargetFieldGird = stMyBattleFieldView.a_3438(stFieldGrid.m_iXGridNo,stFieldGrid.m_iYGridNo);
               stMyBattleFieldView.AddToBattleView(m_stShowdowBitmap,BattleLayerDefine.DEFENSE_SHADOW_TYPE,stTargetFieldGird);
               stDefense.m_stShadowRefence = m_stShowdowBitmap;
               if(stMyBattleFieldView.GetGameMoveMap())
               {
                  stMyBattleFieldView.GetGameMoveMap().AddMoveDisplayObject(stDefense.m_stShadowRefence,stFieldGrid.m_iXGridNo,stFieldGrid.m_iYGridNo);
               }
            }
         }
         var role:a_4463 = a_2161.e.GetCurrentRole() as a_4463;
         if(Boolean(role) && role.m_iGamePoint > 10)
         {
            stDefense.a_3940();
         }
      }
      
      private function LockFieldGrid(gride:a_3491, cardID:*) : void
      {
         var InitialName:String = null;
         if(!gride)
         {
            return;
         }
         ++this.placeCount;
         var role:a_4463 = a_2161.e.GetCurrentRole() as a_4463;
         if(Boolean(role) && role.m_iGamePoint > 10)
         {
            if(cardID == 288950029)
            {
               InitialName = gride.m_iInitialXGridNo + "_" + gride.m_iInitialYGridNo;
               DefensePlaceHelper.getInstance().m_PlaceTriggerdic[InitialName] = gride;
               DefensePlaceHelper.getInstance().m_LastPlaceFinalBrahmaGrid = gride;
               if(this.placeCount == 5)
               {
                  DefensePlaceHelper.getInstance().m_FinalBrahmaTriggerGrid = DefensePlaceHelper.getInstance().m_LastPlaceFinalBrahmaGrid;
               }
               gride.m_dicCannotAddCard["finalBrahmaPlace"] = true;
            }
         }
      }
      
      private function CheckIsInRange(checkFieldGrid:a_3491, targetFieldGrid:a_3491, range:int) : Boolean
      {
         if(checkFieldGrid != null && targetFieldGrid != null)
         {
            if(checkFieldGrid.m_iXGridNo > targetFieldGrid.m_iXGridNo + range || checkFieldGrid.m_iXGridNo < targetFieldGrid.m_iXGridNo - range || checkFieldGrid.m_iYGridNo > targetFieldGrid.m_iYGridNo + range || checkFieldGrid.m_iYGridNo < targetFieldGrid.m_iYGridNo - range)
            {
               return false;
            }
         }
         return true;
      }
      
      private function CanPlaceAttackDefense(baseDefense:a_3962, stFieldGrid:a_3491) : Boolean
      {
         return DefensePlaceHelper.getInstance().CanPlaceAttackDefense(baseDefense,stFieldGrid);
      }
      
      private function GenerateMultiCircleCoordinates(maxCircle:int) : void
      {
         this.ChangeInToOrder = [[0,0],[0,-1],[0,1],[1,0],[-1,0],[-1,-1],[-1,1],[1,-1],[1,1],[-2,0],[2,0],[0,-2],[0,2],[-2,-1],[-2,1],[2,-1],[2,1],[-1,-2],[-1,2],[1,-2],[1,2],[-2,-2],[-2,2],[2,-2],[2,2]];
         for(var i:int = 3; i <= maxCircle; i++)
         {
            this.ChangeInToOrder = this.ChangeInToOrder.concat(this.GenerateCircleCoordinates(i));
         }
      }
      
      private function GenerateCircleCoordinates(n:int) : Array
      {
         var result:Array = [];
         for(var i:int = -n; i <= n; i++)
         {
            result.push([i,-n]);
            result.push([i,n]);
            if(i != -n && i != n)
            {
               result.push([-n,i]);
               result.push([n,i]);
            }
         }
         return result;
      }
      
      private function PalceVersatileDefense(stFieldGrid:a_3491) : void
      {
         var stInitialFieldGrid:a_3491 = null;
         var iLoopCnt:int = 0;
         var iCnt:int = 0;
         var stStartField:a_3491 = null;
         var stCardInfo:Object = null;
         var iCardEffectAddValue:int = 0;
         var arrCardEffectAddValueArray:Array = null;
         var iReduceGrownTime:int = 0;
         if(stFieldGrid == null)
         {
            return;
         }
         var stMyBattleFieldView:BattleFieldView = a_1089.a_3413().m_stMyBattleFieldView;
         var iTotalTime:int = this.a_1098 == 288950079 ? 3 : 1;
         if(!stFieldGrid.CheckAddDefense(this.a_1105))
         {
            trace("无法放百变蛇, 放置不成功");
            return;
         }
         iLoopCnt = 0;
         iCnt = 0;
         while(iLoopCnt < this.ChangeInToOrder.length && iCnt < iTotalTime)
         {
            stStartField = stMyBattleFieldView.a_3438(stFieldGrid.m_iXGridNo + this.ChangeInToOrder[iLoopCnt][0],stFieldGrid.m_iYGridNo + this.ChangeInToOrder[iLoopCnt][1]);
            if(stStartField != null && stStartField.CheckAddDefense(this.a_1105))
            {
               stInitialFieldGrid = stMyBattleFieldView.a_3438(stStartField.m_iXGridNo,stStartField.m_iYGridNo);
               this.a_1105.m_iRealDefensePrice = this.a_1105.iDefensePrice;
               a_1088.a_2059(this.a_1105.m_iDefenseGlobalID,this.a_1098,stInitialFieldGrid.m_iInitialXGridNo,stInitialFieldGrid.m_iInitialYGridNo,1,2,20,this.a_1105.GetRealPrice());
               iCnt++;
            }
            iLoopCnt++;
         }
         if(iCnt > 0)
         {
            this.a_1105.a_1094 = 0;
            this.a_1105.m_iSkillDegree = 0;
            for each(stCardInfo in a_1091)
            {
               if(stCardInfo.m_iCardID == this.a_1105.a_3512())
               {
                  this.a_1105.a_1094 = stCardInfo.m_byCardDegreeLevel;
                  this.a_1105.m_iSkillDegree = stCardInfo.m_byCardSkillLevel;
                  break;
               }
            }
            iReduceGrownTime = 0;
            arrCardEffectAddValueArray = this.GetGameCardEffectAddArray(this.a_1098,this.a_1105.a_3512(),8);
            for each(iCardEffectAddValue in arrCardEffectAddValueArray)
            {
               iReduceGrownTime += iCardEffectAddValue;
            }
            if(!this.a_1107.running)
            {
               this.CalEndGrownTotalTime(this.a_1105,iReduceGrownTime);
               this.a_1106 = this.a_1102.height / this.m_CardGrownTotalTime;
            }
            this.stBaseDefense.a_3940();
            BattleFieldView.ms_isMyPlaced = false;
            this.a_1107.start();
            this.m_iOnHand = false;
            if(this.a_1100.parent)
            {
               this.a_1100.parent.removeChild(this.a_1100);
            }
            if(Boolean(this.m_stReplaceBitmap1) && Boolean(this.m_stReplaceBitmap1.parent) && this.m_stReplaceBitmap1.parent.contains(this.m_stReplaceBitmap1))
            {
               this.m_stReplaceBitmap1.parent.removeChild(this.m_stReplaceBitmap1);
            }
            if(Boolean(this.m_stReplaceBitmap2) && Boolean(this.m_stReplaceBitmap2.parent) && this.m_stReplaceBitmap2.parent.contains(this.m_stReplaceBitmap2))
            {
               this.m_stReplaceBitmap2.parent.removeChild(this.m_stReplaceBitmap2);
            }
            IsLandLineManager.getInstance().HideVirtual();
            this.a_1105.removeEventListener(MouseEvent.CLICK,this.OnBaseDefenseMouseClick);
            a_1089.removeEventListener(MouseEvent.MOUSE_MOVE,this.OnBaseDefenseMouseMove,true);
            a_1089.IsExistDefensePlaceOnHand = false;
            this.a_1105.contextMenu = null;
            this.a_1105 = null;
            this.m_lastMoveFieldGrid = null;
            ms_stRedDangerFieldAlarmBitmap.visible = false;
         }
      }
      
      private function OnBaseDefenseMouseClick(a_4730:Event) : void
      {
         var stStartField:a_3491 = null;
         var iXGridNo:int = 0;
         var iYGridNo:int = 0;
         var m_MoveDefense:a_3962 = null;
         var stFieldGrid:a_3491 = null;
         var stInitialFieldGrid:a_3491 = null;
         var stDefenderTemp:a_3962 = null;
         var bIsDefenderSet:Boolean = false;
         var stCardInfo:Object = null;
         var iCardEffectAddValue:int = 0;
         var arrCardEffectAddValueArray:Array = null;
         var iReduceGrownTime:int = 0;
         var cardID:int = 0;
         var stDefenderSet:IDefenderSet = null;
         var byIsTool:int = 0;
         var stAurDataEvent:a_1778 = null;
         var iCurrentMoney:int = 0;
         var iShotHurtForEach:int = 0;
         var stMyBattleFieldView:BattleFieldView = a_1089.a_3413().m_stMyBattleFieldView;
         var iPlaceTimeNum:int = stMyBattleFieldView.iTimeIntervalNum;
         var iLoopCnt:int = 0;
         var iCnt:int = 0;
         var iAddDefence:int = 0;
         var IsCaclueCoolDown:int = 0;
         var isCanUse:Boolean = true;
         if(a_4206.m_iViewBuffId == 320012352)
         {
            if(BattleFieldView.m_lCantUseCardsInBuff.indexOf(this.a_1098) != -1)
            {
               isCanUse = true;
            }
            else if(this.a_1105 is a_3976)
            {
               isCanUse = false;
            }
         }
         if(isCanUse && (stMyBattleFieldView.mouseX > 0 && stMyBattleFieldView.mouseX < BattleFieldView.a_1013 && stMyBattleFieldView.mouseY > 0 && stMyBattleFieldView.mouseY < BattleFieldView.a_1014 || m_iBeCopyCard))
         {
            iXGridNo = int(stMyBattleFieldView.mouseX / a_3491.a_1080);
            iYGridNo = int(stMyBattleFieldView.mouseY / a_3491.a_1081);
            stFieldGrid = stMyBattleFieldView.a_3438(iXGridNo,iYGridNo);
            if(this.a_1098 == 288950064 || this.a_1098 == 288950078 || this.a_1098 == 288950079)
            {
               this.PalceVersatileDefense(stFieldGrid);
               return;
            }
            if(stFieldGrid != null && (Boolean(stFieldGrid.m_stVersatileDefense) || Boolean(stFieldGrid.m_SoulPuppetIntruder) || Boolean(stFieldGrid.m_dicCannotAddCard["finalBrahmaPlace"])))
            {
               trace("格子已有百变蛇,不能放置东西！！！");
               return;
            }
            if(BattleFieldView.JudgeIsCopyCard(this.a_1098))
            {
               m_iCopyFieldGrid = stMyBattleFieldView.a_3438(iXGridNo,iYGridNo);
               m_iCopyFieldGridDic[m_iCopyFieldGrid.m_iInitialXGridNo + "_" + m_iCopyFieldGrid.m_iInitialYGridNo + "_" + iPlaceTimeNum] = m_iCopyFieldGrid;
               GlobalVariables.getInstance().m_prevPlacedCardDic[m_iCopyFieldGrid.m_iInitialXGridNo + "_" + m_iCopyFieldGrid.m_iInitialYGridNo + "_" + iPlaceTimeNum] = GlobalVariables.getInstance().m_iLastDefender;
               BattleVOUtil.m_GodCreationFinalCopyCard = GlobalVariables.getInstance().m_iLastDefender;
               m_iIsCopyCard = true;
            }
            if(this.a_1098 == 288950032 || this.a_1098 == 288950046 || this.a_1098 == 288950047)
            {
               if(stMyBattleFieldView.m_OtherLockMoveDefense != null && stMyBattleFieldView.m_OtherLockMoveDefense.stFieldGrid == stFieldGrid || stMyBattleFieldView.m_OtherUnLockMoveDefense != null && stMyBattleFieldView.m_OtherUnLockMoveDefense.stFieldGrid == stFieldGrid)
               {
                  return;
               }
               if(stMyBattleFieldView.m_LockMoveDefense == null)
               {
                  m_MoveDefense = stFieldGrid.getMoveDefense(this.a_1098);
                  if(m_MoveDefense == null)
                  {
                     return;
                  }
                  stMyBattleFieldView.m_MoveDefense = m_MoveDefense;
               }
               else
               {
                  if(stMyBattleFieldView.m_UnLockMoveDefense != null)
                  {
                     return;
                  }
                  if(stMyBattleFieldView.m_LockMoveDefense.stFieldGrid == stFieldGrid)
                  {
                     stMyBattleFieldView.m_LockMoveDefense.a_3969(stMyBattleFieldView.m_LockMoveDefense.iLifeValue);
                     stMyBattleFieldView.m_MoveDefense = null;
                     this.a_3516();
                     a_1089.a_3412().a_3480(this.iDefensePrice);
                     this.a_3517();
                     return;
                  }
                  if(this.a_1098 == 288950032 && stMyBattleFieldView.m_LockMoveDefense != null && !this.CheckIsInRange(stFieldGrid,stMyBattleFieldView.m_LockMoveDefense.stFieldGrid,2))
                  {
                     return;
                  }
                  m_iIsCopyCard = true;
                  if(stMyBattleFieldView.m_UnLockMoveDefense == null && stMyBattleFieldView.m_LockMoveDefense != null)
                  {
                     m_MoveDefense = stMyBattleFieldView.m_LockMoveDefense.stFieldGrid.getMoveDefense(this.a_1098);
                     if(m_MoveDefense != null && stMyBattleFieldView.m_MoveDefense != m_MoveDefense)
                     {
                        stMyBattleFieldView.m_MoveDefense = m_MoveDefense;
                     }
                  }
               }
            }
            else
            {
               if(stMyBattleFieldView.m_UnLockMoveDefense != null && (stMyBattleFieldView.m_UnLockMoveDefense.stFieldGrid == stFieldGrid || stMyBattleFieldView.m_LockMoveDefense != null && stMyBattleFieldView.m_LockMoveDefense.stFieldGrid == stFieldGrid))
               {
                  trace("移动格子已上锁,不能放置东西！！！");
                  return;
               }
               if(stMyBattleFieldView.m_OtherUnLockMoveDefense != null && (stMyBattleFieldView.m_OtherUnLockMoveDefense.stFieldGrid == stFieldGrid || stMyBattleFieldView.m_OtherLockMoveDefense != null && stMyBattleFieldView.m_OtherLockMoveDefense.stFieldGrid == stFieldGrid))
               {
                  trace("移动格子已上锁,不能放置东西！！！");
                  return;
               }
            }
            if(stFieldGrid != null && stFieldGrid.m_stDesertFogEffect != null && stFieldGrid.m_stDesertFogEffect.visible == true)
            {
               trace("放置不成功 沙尘暴格子不能放置东西！！！");
               return;
            }
            if(!m_iBeCopyCard && stFieldGrid != null && stFieldGrid.m_isShowFrozen)
            {
               trace("放置不成功 冰冻格子不能放置东西！！！");
               return;
            }
            if(m_iBeCopyCard)
            {
               m_iBeCopyCard = false;
               m_iCanCopyCard = true;
               stFieldGrid = m_iCopyFieldGridDic[m_iCopyByWhoID];
               if(stFieldGrid != null && stFieldGrid.m_isShowFrozen)
               {
                  trace("放置不成功 冰冻格子不能放置东西！！！");
                  return;
               }
               bIsDefenderSet = false;
               if(stFieldGrid.m_stAttackFighter is IDefenderSet && (stFieldGrid.m_stAttackFighter as IDefenderSet).IsUpgradeID(this.m_stCopyBaseDefense.a_3512()))
               {
                  stDefenderSet = stFieldGrid.m_stAttackFighter as IDefenderSet;
                  if(stDefenderSet.IsFull())
                  {
                     trace("放置不成功 卡套已经满了！！！");
                     return;
                  }
                  bIsDefenderSet = true;
                  this.m_stCopyBaseDefense.visible = false;
               }
               else if((this.m_stCopyBaseDefense.iUpgradeID & 0xFF0000) > 0)
               {
                  this.coveredDefense = stFieldGrid.getIUpgradeDefense();
                  if(this.m_stCopyBaseDefense is a_3975 && null != stFieldGrid.m_stProtector && stFieldGrid.m_stProtector.iUpgradeID == (this.m_stCopyBaseDefense.iUpgradeID & 0xFFFF))
                  {
                     iAddDefence = int(stFieldGrid.m_stProtector.m_iRealDefensePrice);
                     stFieldGrid.m_stProtector.a_3969(stFieldGrid.m_stProtector.iLifeValue);
                  }
                  else if(this.m_stCopyBaseDefense is a_3953 && null != stFieldGrid.m_stAttackFighter && stFieldGrid.m_stAttackFighter.iUpgradeID == (this.m_stCopyBaseDefense.iUpgradeID & 0xFFFF))
                  {
                     iAddDefence = int(stFieldGrid.m_stAttackFighter.m_iRealDefensePrice);
                     stFieldGrid.m_stAttackFighter.a_3969(stFieldGrid.m_stAttackFighter.iLifeValue);
                  }
                  else if(this.m_stCopyBaseDefense is a_3960 && null != stFieldGrid.m_stBoomDefense && stFieldGrid.m_stBoomDefense.iUpgradeID == (this.m_stCopyBaseDefense.iUpgradeID & 0xFFFF))
                  {
                     iAddDefence = int(stFieldGrid.m_stBoomDefense.m_iRealDefensePrice);
                     stFieldGrid.m_stBoomDefense.a_3969(stFieldGrid.m_stBoomDefense.iLifeValue);
                  }
                  else if(this.m_stCopyBaseDefense is a_3971 && null != stFieldGrid.m_stFlowerDefense && stFieldGrid.m_stFlowerDefense.iUpgradeID == (this.m_stCopyBaseDefense.iUpgradeID & 0xFFFF))
                  {
                     iAddDefence = int(stFieldGrid.m_stFlowerDefense.m_iRealDefensePrice);
                     stFieldGrid.m_stFlowerDefense.a_3969(stFieldGrid.m_stFlowerDefense.iLifeValue);
                  }
                  else if(this.m_stCopyBaseDefense is a_3959 && null != stFieldGrid.m_stBaseAuxiliaryFighter && stFieldGrid.m_stBaseAuxiliaryFighter.iUpgradeID == (this.m_stCopyBaseDefense.iUpgradeID & 0xFFFF))
                  {
                     iAddDefence = int(stFieldGrid.m_stBaseAuxiliaryFighter.m_iRealDefensePrice);
                     stFieldGrid.m_stBaseAuxiliaryFighter.a_3969(stFieldGrid.m_stBaseAuxiliaryFighter.iLifeValue);
                  }
                  else
                  {
                     if(!(Boolean(this.coveredDefense) && this.m_stCopyBaseDefense.iUpgradeArray.indexOf(this.coveredDefense.a_3512()) != -1))
                     {
                        return;
                     }
                     iAddDefence = int(this.coveredDefense.m_iRealDefensePrice);
                     this.coveredDefense.a_3969(this.coveredDefense.iLifeValue);
                  }
               }
               else if(this.m_stCopyBaseDefense is a_3975 && null != stFieldGrid.m_stProtector || this.m_stCopyBaseDefense is a_3953 && !this.CanPlaceAttackDefense(this.m_stCopyBaseDefense,stFieldGrid) || this.m_stCopyBaseDefense is a_3960 && (null != stFieldGrid.m_stBoomDefense || null != stFieldGrid.m_stAttackFighter) || this.m_stCopyBaseDefense is a_3971 && (null != stFieldGrid.m_stFlowerDefense || null != stFieldGrid.m_stAttackFighter))
               {
                  trace("OnBaseDefenseMouseClick stFieldGrid 己被占用, 放置不成功");
                  return;
               }
               this.m_stCopyBaseDefense.a_1094 = 0;
               this.m_stCopyBaseDefense.m_iSkillDegree = 0;
               for each(stCardInfo in a_1091)
               {
                  if(stCardInfo.m_iCardID == this.m_stCopyBaseDefense.a_3512())
                  {
                     this.m_stCopyBaseDefense.a_1094 = stCardInfo.m_byCardDegreeLevel;
                     this.m_stCopyBaseDefense.m_iSkillDegree = stCardInfo.m_byCardSkillLevel;
                     break;
                  }
               }
               arrCardEffectAddValueArray = this.GetGameCardEffectAddArray(this.a_1098,this.m_stCopyBaseDefense.a_3512(),8);
               for each(iCardEffectAddValue in arrCardEffectAddValueArray)
               {
                  iReduceGrownTime += iCardEffectAddValue;
               }
               if(!this.a_1107.running)
               {
                  this.a_1106 = this.a_1102.height / (this.m_stCopyBaseDefense.a_3963() - iReduceGrownTime);
                  this.m_CardGrownTotalTime = this.m_stCopyBaseDefense.a_3963() - iReduceGrownTime;
               }
               BattleFieldView.ms_isMyPlaced = true;
               if(bIsDefenderSet || stMyBattleFieldView.a_3441(this.m_stCopyBaseDefense,stFieldGrid.m_iXGridNo,stFieldGrid.m_iYGridNo))
               {
                  byIsTool = 0;
                  if(this.m_stCopyBaseDefense is a_4421)
                  {
                     byIsTool = 1;
                  }
                  if(Boolean(root) && Boolean(root.parent) && Boolean(root.parent.parent))
                  {
                     stAurDataEvent = new a_1778("AurSetCardAndEnergyForAntiPluginEvent");
                     iCurrentMoney = a_1089.a_3412().iMoneyCount;
                     iShotHurtForEach = this.m_stCopyBaseDefense as a_3953 ? (this.m_stCopyBaseDefense as a_3953).iShotHurtForEach : 0;
                     stAurDataEvent.dataObject = [iCurrentMoney,iShotHurtForEach];
                     root.parent.parent.dispatchEvent(stAurDataEvent);
                  }
                  this.CheckNeedRecByPlace(a_4730);
                  this.m_stCopyBaseDefense.m_iPlaceTimeIntervals = stMyBattleFieldView.iTimeIntervalNum;
                  this.m_stCopyBaseDefense.m_iDefenseGlobalID = stMyBattleFieldView.a_2180();
                  stInitialFieldGrid = stMyBattleFieldView.a_3438(stFieldGrid.m_iXGridNo,stFieldGrid.m_iYGridNo);
                  this.m_stCopyBaseDefense.m_iRealDefensePrice = this.m_stCopyBaseDefense.iDefensePrice + iAddDefence;
                  this.PostExtraPlacementsByCardID(bIsDefenderSet,stMyBattleFieldView,stFieldGrid,this.m_stCopyBaseDefense,this.a_1098,1,2,20,this.m_stCopyBaseDefense.GetRealPrice());
                  BattleFieldView.ms_isMyPlaced = false;
                  return;
               }
               BattleFieldView.ms_isMyPlaced = false;
               trace("stMyBattleFieldView.AddBaseDefense failed , 放置不成功");
               return;
            }
            if(m_iIsCopyCard)
            {
               m_iCanCopyCard = false;
               m_iIsCopyCard = false;
               stDefenderTemp = null;
               if(this.a_1098 == 288949504 || this.a_1098 == 288949518 || this.a_1098 == 288949519)
               {
                  stDefenderTemp = a_4012.getInstance().a_4013(CardGrowPanelView(this.parent).m_iLastDeathDefender);
                  if(CardGrowPanelView(this.parent).m_iLastDeathDefender == -1)
                  {
                     stDefenderTemp = this.a_1105;
                     m_iCanCopyCard = true;
                  }
               }
               else if(this.a_1098 == 288949760 || this.a_1098 == 288949774 || this.a_1098 == 288949775)
               {
                  stDefenderTemp = this.a_1105;
                  m_iCanCopyCard = true;
               }
               else if(this.a_1098 == 288950032 || this.a_1098 == 288950046 || this.a_1098 == 288950047)
               {
                  stDefenderTemp = stMyBattleFieldView.m_MoveDefense;
                  m_iCanCopyCard = true;
               }
               else
               {
                  cardID = int(GlobalVariables.getInstance().m_prevPlacedCardDic[stFieldGrid.m_iInitialXGridNo + "_" + stFieldGrid.m_iInitialYGridNo + "_" + iPlaceTimeNum]);
                  stDefenderTemp = a_4012.getInstance().a_4013(cardID);
                  if(cardID == -1)
                  {
                     stDefenderTemp = this.a_1105;
                     m_iCanCopyCard = true;
                  }
               }
               bIsDefenderSet = false;
               if(stFieldGrid.m_stAttackFighter is IDefenderSet && (stFieldGrid.m_stAttackFighter as IDefenderSet).IsUpgradeID(stDefenderTemp.a_3512()))
               {
                  stDefenderSet = stFieldGrid.m_stAttackFighter as IDefenderSet;
                  if(stDefenderSet.IsFull())
                  {
                     trace("放置不成功 卡套已经满了！！！");
                     m_iCanCopyCard = true;
                     return;
                  }
                  bIsDefenderSet = true;
                  this.a_1105.visible = false;
               }
               else if((stDefenderTemp.iUpgradeID & 0xFF0000) > 0)
               {
                  this.coveredDefense = stFieldGrid.getIUpgradeDefense();
                  if(!(stDefenderTemp is a_3975 && null != stFieldGrid.m_stProtector && stFieldGrid.m_stProtector.iUpgradeID == (stDefenderTemp.iUpgradeID & 0xFFFF)))
                  {
                     if(!(stDefenderTemp is a_3953 && null != stFieldGrid.m_stAttackFighter && stFieldGrid.m_stAttackFighter.iUpgradeID == (stDefenderTemp.iUpgradeID & 0xFFFF)))
                     {
                        if(!(stDefenderTemp is a_3960 && null != stFieldGrid.m_stBoomDefense && stFieldGrid.m_stBoomDefense.iUpgradeID == (stDefenderTemp.iUpgradeID & 0xFFFF)))
                        {
                           if(!(stDefenderTemp is a_3971 && null != stFieldGrid.m_stFlowerDefense && stFieldGrid.m_stFlowerDefense.iUpgradeID == (stDefenderTemp.iUpgradeID & 0xFFFF)))
                           {
                              if(!(stDefenderTemp is a_3959 && null != stFieldGrid.m_stBaseAuxiliaryFighter && stFieldGrid.m_stBaseAuxiliaryFighter.iUpgradeID == (stDefenderTemp.iUpgradeID & 0xFFFF)))
                              {
                                 if(!(Boolean(this.coveredDefense) && stDefenderTemp.iUpgradeArray.indexOf(this.coveredDefense.a_3512()) != -1))
                                 {
                                    m_iCanCopyCard = true;
                                    return;
                                 }
                              }
                           }
                        }
                     }
                  }
               }
               else
               {
                  if(stDefenderTemp is a_3975 && null != stFieldGrid.m_stProtector || stDefenderTemp is a_3953 && !this.CanPlaceAttackDefense(stDefenderTemp,stFieldGrid) || stDefenderTemp is a_3960 && (null != stFieldGrid.m_stAttackFighter || null != stFieldGrid.m_stFlowerDefense || null != stFieldGrid.m_stBaseAuxiliaryFighter || null != stFieldGrid.m_stBoomDefense) || stDefenderTemp is a_3971 && (null != stFieldGrid.m_stAttackFighter || null != stFieldGrid.m_stFlowerDefense || null != stFieldGrid.m_stBaseAuxiliaryFighter || null != stFieldGrid.m_stBoomDefense))
                  {
                     trace("OnBaseDefenseMouseClick stFieldGrid 己被占用, 放置不成功");
                     m_iCanCopyCard = true;
                     return;
                  }
                  if(this.a_1098 == 288950032 || this.a_1098 == 288950046 || this.a_1098 == 288950047)
                  {
                     if(!stFieldGrid.CheckAddDefense(stDefenderTemp))
                     {
                        trace("无法放置载具, 放置不成功");
                        m_iCanCopyCard = true;
                        return;
                     }
                  }
               }
               this.a_1105.a_1094 = 0;
               this.a_1105.m_iSkillDegree = 0;
               for each(stCardInfo in a_1091)
               {
                  if(stCardInfo.m_iCardID == this.a_1105.a_3512())
                  {
                     this.a_1105.a_1094 = stCardInfo.m_byCardDegreeLevel;
                     this.a_1105.m_iSkillDegree = stCardInfo.m_byCardSkillLevel;
                     break;
                  }
               }
               iReduceGrownTime = 0;
               arrCardEffectAddValueArray = this.GetGameCardEffectAddArray(this.a_1098,this.a_1105.a_3512(),8);
               for each(iCardEffectAddValue in arrCardEffectAddValueArray)
               {
                  iReduceGrownTime += iCardEffectAddValue;
               }
               if(!this.a_1107.running)
               {
                  this.CalEndGrownTotalTime(this.a_1105,iReduceGrownTime);
                  this.a_1106 = this.a_1102.height / this.m_CardGrownTotalTime;
               }
               BattleFieldView.ms_isMyPlaced = true;
               if(!(bIsDefenderSet || stMyBattleFieldView.a_3441(this.a_1105,stFieldGrid.m_iXGridNo,stFieldGrid.m_iYGridNo)))
               {
                  BattleFieldView.ms_isMyPlaced = false;
                  trace("stMyBattleFieldView.AddBaseDefense failed , 放置不成功");
                  m_iCanCopyCard = true;
                  return;
               }
               byIsTool = 0;
               if(this.a_1105 is a_4421)
               {
                  byIsTool = 1;
               }
               if(Boolean(root) && Boolean(root.parent) && Boolean(root.parent.parent))
               {
                  stAurDataEvent = new a_1778("AurSetCardAndEnergyForAntiPluginEvent");
                  iCurrentMoney = a_1089.a_3412().iMoneyCount;
                  iShotHurtForEach = this.a_1105 as a_3953 ? (this.a_1105 as a_3953).iShotHurtForEach : 0;
                  stAurDataEvent.dataObject = [iCurrentMoney,iShotHurtForEach];
                  root.parent.parent.dispatchEvent(stAurDataEvent);
               }
               this.CheckNeedRecByPlace(a_4730);
               this.a_1105.m_iPlaceTimeIntervals = stMyBattleFieldView.iTimeIntervalNum;
               this.a_1105.m_iDefenseGlobalID = stMyBattleFieldView.a_2180();
               stInitialFieldGrid = stMyBattleFieldView.a_3438(stFieldGrid.m_iXGridNo,stFieldGrid.m_iYGridNo);
               this.a_1105.m_iRealDefensePrice = this.a_1105.iDefensePrice;
               IsCaclueCoolDown = this.m_IsReduceGrowTime ? 3 : 0;
               this.m_IsReduceGrowTime = false;
               this.PostExtraPlacementsByCardID(bIsDefenderSet,stMyBattleFieldView,stFieldGrid,this.a_1105,this.a_1098,byIsTool,IsCaclueCoolDown,20,this.a_1105.GetRealPrice());
               this.m_iOnHand = false;
               if(this.a_1098 != 288950029 || this.a_1098 == 288950029 && this.m_step == 2 || BattleCardUtil.IsQiaotouRiceNoodles(this.a_1098) && this.m_step == 2)
               {
                  BattleFieldView.ms_isMyPlaced = false;
                  this.a_1107.start();
               }
            }
            else
            {
               bIsDefenderSet = false;
               if(stFieldGrid.m_stAttackFighter is IDefenderSet && (stFieldGrid.m_stAttackFighter as IDefenderSet).IsUpgradeID(this.a_1105.a_3512()))
               {
                  stDefenderSet = stFieldGrid.m_stAttackFighter as IDefenderSet;
                  if(stDefenderSet.IsFull())
                  {
                     trace("放置不成功 卡套已经满了！！！");
                     return;
                  }
                  bIsDefenderSet = true;
                  this.a_1105.visible = false;
               }
               else if((this.a_1105.iUpgradeID & 0xFF0000) > 0)
               {
                  this.coveredDefense = stFieldGrid.getIUpgradeDefense();
                  if(this.a_1105 is a_3975 && null != stFieldGrid.m_stProtector && stFieldGrid.m_stProtector.iUpgradeID == (this.a_1105.iUpgradeID & 0xFFFF) && !stFieldGrid.m_stProtector.m_isShowFrozen)
                  {
                     iAddDefence = int(stFieldGrid.m_stProtector.m_iRealDefensePrice);
                     stFieldGrid.m_stProtector.a_3969(stFieldGrid.m_stProtector.iLifeValue);
                  }
                  else if(this.a_1105 is a_3953 && null != stFieldGrid.m_stAttackFighter && stFieldGrid.m_stAttackFighter.iUpgradeID == (this.a_1105.iUpgradeID & 0xFFFF) && !stFieldGrid.m_stAttackFighter.m_isShowFrozen)
                  {
                     iAddDefence = int(stFieldGrid.m_stAttackFighter.m_iRealDefensePrice);
                     stFieldGrid.m_stAttackFighter.a_3969(stFieldGrid.m_stAttackFighter.iLifeValue);
                  }
                  else if(this.a_1105 is a_3960 && null != stFieldGrid.m_stBoomDefense && stFieldGrid.m_stBoomDefense.iUpgradeID == (this.a_1105.iUpgradeID & 0xFFFF) && !stFieldGrid.m_stBoomDefense.m_isShowFrozen)
                  {
                     iAddDefence = int(stFieldGrid.m_stBoomDefense.m_iRealDefensePrice);
                     stFieldGrid.m_stBoomDefense.a_3969(stFieldGrid.m_stBoomDefense.iLifeValue);
                  }
                  else if(this.a_1105 is a_3971 && null != stFieldGrid.m_stFlowerDefense && stFieldGrid.m_stFlowerDefense.iUpgradeID == (this.a_1105.iUpgradeID & 0xFFFF) && !stFieldGrid.m_stFlowerDefense.m_isShowFrozen)
                  {
                     iAddDefence = int(stFieldGrid.m_stFlowerDefense.m_iRealDefensePrice);
                     stFieldGrid.m_stFlowerDefense.a_3969(stFieldGrid.m_stFlowerDefense.iLifeValue);
                  }
                  else if(this.a_1105 is a_3959 && null != stFieldGrid.m_stBaseAuxiliaryFighter && stFieldGrid.m_stBaseAuxiliaryFighter.iUpgradeID == (this.a_1105.iUpgradeID & 0xFFFF) && !stFieldGrid.m_stBaseAuxiliaryFighter.m_isShowFrozen)
                  {
                     iAddDefence = int(stFieldGrid.m_stBaseAuxiliaryFighter.m_iRealDefensePrice);
                     stFieldGrid.m_stBaseAuxiliaryFighter.a_3969(stFieldGrid.m_stBaseAuxiliaryFighter.iLifeValue);
                  }
                  else
                  {
                     if(!(Boolean(this.coveredDefense) && this.a_1105.iUpgradeArray.indexOf(this.coveredDefense.a_3512()) != -1))
                     {
                        return;
                     }
                     iAddDefence = int(this.coveredDefense.m_iRealDefensePrice);
                     this.coveredDefense.a_3969(this.coveredDefense.iLifeValue);
                  }
               }
               else if(this.a_1105 is a_3975 && null != stFieldGrid.m_stProtector || this.a_1105 is a_3953 && !this.CanPlaceAttackDefense(this.a_1105,stFieldGrid) || this.a_1105 is a_3960 && (null != stFieldGrid.m_stBoomDefense || null != stFieldGrid.m_stAttackFighter) || this.a_1105 is a_3971 && (null != stFieldGrid.m_stFlowerDefense || null != stFieldGrid.m_stAttackFighter))
               {
                  trace("OnBaseDefenseMouseClick stFieldGrid 己被占用, 放置不成功");
                  return;
               }
               this.a_1105.a_1094 = 0;
               this.a_1105.m_iSkillDegree = 0;
               for each(stCardInfo in a_1091)
               {
                  if(stCardInfo.m_iCardID == this.a_1105.a_3512())
                  {
                     this.a_1105.a_1094 = stCardInfo.m_byCardDegreeLevel;
                     this.a_1105.m_iSkillDegree = stCardInfo.m_byCardSkillLevel;
                     break;
                  }
               }
               arrCardEffectAddValueArray = this.GetGameCardEffectAddArray(this.a_1098,this.a_1105.a_3512(),8);
               for each(iCardEffectAddValue in arrCardEffectAddValueArray)
               {
                  iReduceGrownTime += iCardEffectAddValue;
               }
               if(!this.a_1107.running)
               {
                  this.CalEndGrownTotalTime(this.a_1105,iReduceGrownTime);
                  this.a_1106 = this.a_1102.height / this.m_CardGrownTotalTime;
               }
               BattleFieldView.ms_isMyPlaced = true;
               this.a_1105.m_iRealDefensePrice = this.iDefensePrice + iAddDefence;
               if(!(bIsDefenderSet || stMyBattleFieldView.a_3441(this.a_1105,stFieldGrid.m_iXGridNo,stFieldGrid.m_iYGridNo)))
               {
                  BattleFieldView.ms_isMyPlaced = false;
                  trace("stMyBattleFieldView.AddBaseDefense failed , 放置不成功");
                  return;
               }
               byIsTool = 0;
               if(this.a_1105 is a_4421)
               {
                  byIsTool = 1;
               }
               if(Boolean(root) && Boolean(root.parent) && Boolean(root.parent.parent))
               {
                  stAurDataEvent = new a_1778("AurSetCardAndEnergyForAntiPluginEvent");
                  iCurrentMoney = a_1089.a_3412().iMoneyCount;
                  iShotHurtForEach = this.a_1105 as a_3953 ? (this.a_1105 as a_3953).iShotHurtForEach : 0;
                  stAurDataEvent.dataObject = [iCurrentMoney,iShotHurtForEach];
                  root.parent.parent.dispatchEvent(stAurDataEvent);
               }
               this.CheckNeedRecByPlace(a_4730);
               this.a_1105.m_iPlaceTimeIntervals = stMyBattleFieldView.iTimeIntervalNum;
               this.a_1105.m_iDefenseGlobalID = stMyBattleFieldView.a_2180();
               stInitialFieldGrid = stMyBattleFieldView.a_3438(stFieldGrid.m_iXGridNo,stFieldGrid.m_iYGridNo);
               IsCaclueCoolDown = this.m_IsReduceGrowTime ? 3 : 0;
               this.m_IsReduceGrowTime = false;
               this.PostExtraPlacementsByCardID(bIsDefenderSet,stMyBattleFieldView,stFieldGrid,this.a_1105,this.a_1098,byIsTool,IsCaclueCoolDown,20,this.a_1105.GetRealPrice());
               BattleFieldView.ms_isMyPlaced = false;
               this.a_1107.start();
               this.m_iOnHand = false;
            }
         }
         else
         {
            if(this.m_step == 1)
            {
               this.a_1108 = 0;
               this.m_ReduceRate = 1;
               this.m_GrowHistory = [];
               this.UpdateGrowTimesText("");
               this.a_1105.a_3940();
               a_1089.a_3412().a_3480(this.iDefensePrice);
            }
            if((this.a_1098 == 288950029 || BattleCardUtil.IsQiaotouRiceNoodles(this.a_1098)) && this.m_step == 2)
            {
               this.a_1105.a_3940();
               DefensePlaceHelper.getInstance().PostFinalBrahmaStateChange(stMyBattleFieldView);
               BattleFieldView.ms_isMyPlaced = false;
               this.a_1107.start();
               this.m_iOnHand = false;
            }
         }
         if(this.a_1100.parent)
         {
            this.a_1100.parent.removeChild(this.a_1100);
         }
         if(Boolean(this.m_stReplaceBitmap1) && Boolean(this.m_stReplaceBitmap1.parent) && this.m_stReplaceBitmap1.parent.contains(this.m_stReplaceBitmap1))
         {
            this.m_stReplaceBitmap1.parent.removeChild(this.m_stReplaceBitmap1);
         }
         if(Boolean(this.m_stReplaceBitmap2) && Boolean(this.m_stReplaceBitmap2.parent) && this.m_stReplaceBitmap2.parent.contains(this.m_stReplaceBitmap2))
         {
            this.m_stReplaceBitmap2.parent.removeChild(this.m_stReplaceBitmap2);
         }
         IsLandLineManager.getInstance().HideVirtual();
         this.a_1105.removeEventListener(MouseEvent.CLICK,this.OnBaseDefenseMouseClick);
         a_1089.removeEventListener(MouseEvent.MOUSE_MOVE,this.OnBaseDefenseMouseMove,true);
         a_1089.IsExistDefensePlaceOnHand = false;
         this.a_1105.contextMenu = null;
         this.a_1105 = null;
         this.m_lastMoveFieldGrid = null;
         ms_stRedDangerFieldAlarmBitmap.visible = false;
         if(!this.m_iOnHand && (this.a_1098 == 288950029 || BattleCardUtil.IsQiaotouRiceNoodles(this.a_1098)) && this.m_step < 2)
         {
            this.a_3076(null);
         }
      }
      
      public function a_3518(a_4730:Event) : void
      {
         if(!this.a_1107.running)
         {
            return;
         }
         if(a_2036.getInstance().isShowGrowTimes)
         {
            this.UpdateGrowTimesText((this.m_CardGrownTotalTime - this.a_1108).toString());
         }
         else
         {
            this.UpdateGrowTimesText(null);
         }
         var stRect:Rectangle = new Rectangle(0,0,this.a_1102.width,this.a_1108 * this.a_1106);
         var stBitArray:ByteArray = this.a_1104.getPixels(stRect);
         stBitArray.position = 0;
         this.a_1102.setPixels(stRect,stBitArray);
         if(this.a_1108 * this.a_1106 >= this.a_1102.height)
         {
            this.a_3516();
            return;
         }
         if(a_2036.getInstance().tagCom.HasSum("StopCD_" + this.a_1098.toString()))
         {
            return;
         }
         ++this.a_1108;
      }
      
      private function UpdateGrowTimesText(value:String) : void
      {
         var isVisible:Boolean = a_2036.getInstance().isShowGrowTimes;
         this.m_stCardGrowTimesText.visible = isVisible;
         if(isVisible && value != null && this.m_szLastGrowTimesText != value)
         {
            this.m_stCardGrowTimesText.text = value;
            this.m_szLastGrowTimesText = value;
         }
      }
      
      public function ReduceGrowTimeRate(value:Number) : void
      {
         var stRect:Rectangle = null;
         var stBitArray:ByteArray = null;
         if(!this.a_1107.running)
         {
            return;
         }
         this.m_IsReduceGrowTime = true;
         var lessTime:Number = int(this.m_CardGrownTotalTime * value) - this.a_1108;
         if(lessTime > 0)
         {
            this.a_1108 += int(this.m_CardGrownTotalTime * (1 - value));
            this.UpdateGrowTimesText((int(this.m_CardGrownTotalTime) - this.a_1108).toString());
            stRect = new Rectangle(0,0,this.a_1102.width,this.a_1108 * this.a_1106);
            stBitArray = this.a_1104.getPixels(stRect);
            stBitArray.position = 0;
            this.a_1102.setPixels(stRect,stBitArray);
         }
         else
         {
            this.a_3516();
         }
      }
      
      public function AddGrowTime(second:Number) : void
      {
         if(!this.a_1107.running)
         {
            this.a_1107.start();
            this.m_CardGrownTotalTime = 10 * second;
            this.a_1106 = this.a_1102.height / this.m_CardGrownTotalTime;
            addChildAt(this.a_1103,1);
            this.a_1108 = 1;
            removeEventListener(MouseEvent.MOUSE_DOWN,this.a_3076);
         }
         else
         {
            this.m_CardGrownTotalTime += 10 * second;
            this.a_1106 = this.a_1102.height / this.m_CardGrownTotalTime;
            this.a_1102.copyPixels(this.a_1101,new Rectangle(0,0,this.a_1102.width,this.a_1102.height),new Point(0,0));
         }
         this.a_3517();
         this.UpdateGrowTimesText((int(this.m_CardGrownTotalTime) - this.a_1108).toString());
         var stRect:Rectangle = new Rectangle(0,0,this.a_1102.width,this.a_1108 * this.a_1106);
         var stBitArray:ByteArray = this.a_1104.getPixels(stRect);
         stBitArray.position = 0;
         this.a_1102.setPixels(stRect,stBitArray);
      }
      
      private function UpdateCardBuff(bySeatID:int, stBaseDefense:a_3962) : void
      {
         var iCardEffectAddValue:int = 0;
         var arrCardEffectAddValueArray:Array = null;
         arrCardEffectAddValueArray = this.GetGameCardEffectAddArray(bySeatID,stBaseDefense.a_3512(),1);
         for each(iCardEffectAddValue in arrCardEffectAddValueArray)
         {
            stBaseDefense.a_3969(-stBaseDefense.iLifeValue * iCardEffectAddValue / 100);
         }
         arrCardEffectAddValueArray = this.GetGameCardEffectAddArray(bySeatID,stBaseDefense.a_3512(),2);
         for each(iCardEffectAddValue in arrCardEffectAddValueArray)
         {
            stBaseDefense.a_3969(-iCardEffectAddValue);
         }
         arrCardEffectAddValueArray = this.GetGameCardEffectAddArray(bySeatID,stBaseDefense.a_3512(),3);
         for each(iCardEffectAddValue in arrCardEffectAddValueArray)
         {
            if(stBaseDefense as a_3953)
            {
               (stBaseDefense as a_3953).AddShotHurtRate(iCardEffectAddValue / 100);
            }
         }
         arrCardEffectAddValueArray = this.GetGameCardEffectAddArray(bySeatID,stBaseDefense.a_3512(),4);
         for each(iCardEffectAddValue in arrCardEffectAddValueArray)
         {
            if(stBaseDefense as a_3953)
            {
               (stBaseDefense as a_3953).AddShotHurtForEach(iCardEffectAddValue);
            }
         }
         arrCardEffectAddValueArray = this.GetGameCardEffectAddArray(bySeatID,stBaseDefense.a_3512(),5);
         for each(iCardEffectAddValue in arrCardEffectAddValueArray)
         {
            if(stBaseDefense as a_3953)
            {
               (stBaseDefense as a_3953).ReduceShotIntervalTime(iCardEffectAddValue);
            }
         }
         arrCardEffectAddValueArray = this.GetGameCardEffectAddArray(bySeatID,stBaseDefense.a_3512(),6);
         for each(iCardEffectAddValue in arrCardEffectAddValueArray)
         {
            if(stBaseDefense as a_3953)
            {
               (stBaseDefense as a_3953).ReduceShotIntervalTime((stBaseDefense as a_3953).iShotIntervalTimeNum * iCardEffectAddValue / 100);
            }
         }
         arrCardEffectAddValueArray = this.GetGameCardEffectAddArray(bySeatID,stBaseDefense.a_3512(),7);
         for each(iCardEffectAddValue in arrCardEffectAddValueArray)
         {
            if(stBaseDefense as a_3953)
            {
               (stBaseDefense as a_3953).ReduceShotIntervalTime(iCardEffectAddValue);
            }
         }
         arrCardEffectAddValueArray = this.GetGameCardEffectAddArray(bySeatID,stBaseDefense.a_3512(),9);
         for each(iCardEffectAddValue in arrCardEffectAddValueArray)
         {
            if(stBaseDefense as a_3959)
            {
               (stBaseDefense as a_3959).AddHotMultiplierEffect(iCardEffectAddValue / 100);
            }
         }
         arrCardEffectAddValueArray = this.GetGameCardEffectAddArray(bySeatID,stBaseDefense.a_3512(),11);
         for each(iCardEffectAddValue in arrCardEffectAddValueArray)
         {
            if(stBaseDefense as a_3971)
            {
               (stBaseDefense as a_3971).AddEnergyValueEachTime(iCardEffectAddValue);
            }
         }
         arrCardEffectAddValueArray = this.GetGameCardEffectAddArray(bySeatID,stBaseDefense.a_3512(),12);
         for each(iCardEffectAddValue in arrCardEffectAddValueArray)
         {
            if(stBaseDefense as a_3971)
            {
               (stBaseDefense as a_3971).ReduceProduceEnergyTimeInterval(iCardEffectAddValue);
            }
         }
      }
      
      private function a_3073(a_4730:Event) : void
      {
         this.a_1093.width = 100;
         this.a_1093.height = 35;
         this.a_1093.multiline = true;
         this.a_1093.autoSize = TextFieldAutoSize.CENTER;
         var szAlertText:String = "";
         if(this.a_1108 > 0)
         {
            szAlertText += "<font color=\'#FF0000\'>" + (ms_arrLocalizedDataArray["正在生长中"] ? ms_arrLocalizedDataArray["正在生长中"] : "正在生长中") + "</font><br>";
         }
         else if(this.a_1103.parent)
         {
            szAlertText += "<font color=\'#FF0000\'>" + (ms_arrLocalizedDataArray["没有足够的火苗"] ? ms_arrLocalizedDataArray["没有足够的火苗"] : "没有足够的火苗") + "</font><br>";
         }
         this.a_1093.htmlText = szAlertText + "<font color=\'0x000000\'>" + this.m_szCardName + "</font>";
         this.a_1093.x = x;
         this.a_1093.y = y + height + 2;
         if(parent)
         {
            parent.addChild(this.a_1093);
         }
      }
      
      private function OnMouseOutEvent(a_4730:Event) : void
      {
         if(Boolean(this.a_1093) && Boolean(this.a_1093.parent))
         {
            this.a_1093.parent.removeChild(this.a_1093);
         }
      }
      
      private function a_3519(stEvent:Event) : Boolean
      {
         a_1089.a_3412().a_3477(4294967295);
         return true;
      }
   }
}

