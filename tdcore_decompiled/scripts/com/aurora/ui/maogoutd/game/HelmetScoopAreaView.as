package com.aurora.ui.maogoutd.game
{
   import a_4753.b_150;
   import com.aurora.ui.maogoutd.IPlaceOnHandView;
   import com.aurora.ui.maogoutd.resource.defender.a_3953;
   import com.aurora.ui.maogoutd.resource.defender.a_3960;
   import com.aurora.ui.maogoutd.resource.defender.a_3962;
   import com.aurora.ui.maogoutd.resource.defender.a_3971;
   import com.aurora.ui.maogoutd.resource.defender.a_3975;
   import com.aurora.ui.maogoutd.resource.defender.a_3976;
   import com.aurora.ui.maogoutd.resource.tools.HelmetCopperScoop;
   import com.aurora.ui.maogoutd.resource.tools.HelmetGoldenScoop;
   import com.aurora.ui.maogoutd.resource.tools.HelmetSilverScoop;
   import com.aurora.ui.maogoutd.resource.tools.a_4421;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.ui.Mouse;
   import flash.ui.MouseCursor;
   
   public class HelmetScoopAreaView extends Sprite implements IPlaceOnHandView
   {
      
      public static var a_1088:b_150;
      
      public static var a_1089:a_3411;
      
      public var m_stHelmetScoopDisplay:MovieClip;
      
      public var m_stLessCardsScoopBackGround:Sprite;
      
      public var m_stMoreCardsScoopBackGround:Sprite;
      
      public var m_stLastCardsScoopBackGround:Sprite;
      
      private var m_byScoopType:int = 1;
      
      private var a_1098:uint;
      
      private var a_1099:BitmapData;
      
      private var a_1100:Bitmap;
      
      private var a_1105:a_3962;
      
      public function HelmetScoopAreaView()
      {
         super();
         this.m_stHelmetScoopDisplay.gotoAndStop(1);
         var stBaseDefense:a_3962 = a_4421.a_3926();
         this.a_1098 = stBaseDefense.a_3512();
         this.a_1099 = new BitmapData(stBaseDefense.width,stBaseDefense.height,true,0);
         this.a_1099.draw(stBaseDefense);
         stBaseDefense.a_3940();
         this.a_1100 = new Bitmap(this.a_1099);
         this.a_1100.alpha = 0.6;
         addEventListener(MouseEvent.MOUSE_DOWN,this.a_3076);
      }
      
      public function SetScoopType(byScoopType:int) : void
      {
         var stBaseDefense:a_3962 = null;
         if(this.m_byScoopType == byScoopType)
         {
            return;
         }
         this.m_byScoopType = byScoopType;
         if(1 == this.m_byScoopType)
         {
            stBaseDefense = a_4421.a_3926();
            this.a_1098 = stBaseDefense.a_3512();
            this.a_1099 = new BitmapData(stBaseDefense.width,stBaseDefense.height,true,0);
            this.a_1099.draw(stBaseDefense);
            stBaseDefense.a_3940();
         }
         else if(2 == this.m_byScoopType)
         {
            stBaseDefense = HelmetCopperScoop.a_3926();
            this.a_1098 = stBaseDefense.a_3512();
            this.a_1099 = new BitmapData(stBaseDefense.width,stBaseDefense.height,true,0);
            this.a_1099.draw(stBaseDefense);
            stBaseDefense.a_3940();
         }
         else if(3 == this.m_byScoopType)
         {
            stBaseDefense = HelmetSilverScoop.a_3926();
            this.a_1098 = stBaseDefense.a_3512();
            this.a_1099 = new BitmapData(stBaseDefense.width,stBaseDefense.height,true,0);
            this.a_1099.draw(stBaseDefense);
            stBaseDefense.a_3940();
         }
         else if(4 == this.m_byScoopType)
         {
            stBaseDefense = HelmetGoldenScoop.a_3926();
            this.a_1098 = stBaseDefense.a_3512();
            this.a_1099 = new BitmapData(stBaseDefense.width,stBaseDefense.height,true,0);
            this.a_1099.draw(stBaseDefense);
            stBaseDefense.a_3940();
         }
         this.m_stHelmetScoopDisplay.gotoAndStop(this.m_byScoopType);
         this.a_1100.bitmapData = this.a_1099;
      }
      
      public function a_3555(isEnable:Boolean) : void
      {
         if(isEnable)
         {
            addEventListener(MouseEvent.MOUSE_DOWN,this.a_3076);
            this.m_stHelmetScoopDisplay.visible = true;
         }
         else
         {
            removeEventListener(MouseEvent.MOUSE_DOWN,this.a_3076);
            this.m_stHelmetScoopDisplay.visible = false;
         }
      }
      
      public function a_3517() : void
      {
         if(this.a_1105)
         {
            if(Boolean(this.a_1100) && Boolean(this.a_1100.parent) && this.a_1100.parent.contains(this.a_1100))
            {
               this.a_1100.parent.removeChild(this.a_1100);
            }
            this.a_1105.removeEventListener(MouseEvent.CLICK,this.OnBaseDefenseMouseClick);
            a_1089.removeEventListener(MouseEvent.MOUSE_MOVE,this.OnBaseDefenseMouseMove,true);
            a_1089.IsExistDefensePlaceOnHand = false;
            this.a_1105.a_3940();
            this.a_1105 = null;
         }
      }
      
      private function a_3076(a_4730:Event) : void
      {
         var stHelmetScoop:a_3976 = null;
         if(a_1089.IsExistDefensePlaceOnHand)
         {
            return;
         }
         if(1 == this.m_byScoopType)
         {
            stHelmetScoop = a_4421.a_3926();
         }
         else if(2 == this.m_byScoopType)
         {
            stHelmetScoop = HelmetCopperScoop.a_3926();
         }
         else if(3 == this.m_byScoopType)
         {
            stHelmetScoop = HelmetSilverScoop.a_3926();
         }
         else if(4 == this.m_byScoopType)
         {
            stHelmetScoop = HelmetGoldenScoop.a_3926();
         }
         stHelmetScoop.m_isMyPlacedTool = true;
         this.a_1105 = stHelmetScoop;
         if(null != this.a_1105)
         {
            this.a_1105.visible = true;
            if(this.a_1105.parent)
            {
               this.a_1105.parent.removeChild(this.a_1105);
            }
            a_1089.addChild(this.a_1105);
            this.a_1105.x = a_1089.mouseX - this.a_1105.width * 0.1;
            this.a_1105.y = a_1089.mouseY - this.a_1105.height * 0.75;
            this.a_1105.addEventListener(MouseEvent.CLICK,this.OnBaseDefenseMouseClick);
            a_1089.addEventListener(MouseEvent.MOUSE_MOVE,this.OnBaseDefenseMouseMove,true,1000);
            a_1089.IsExistDefensePlaceOnHand = true;
            Mouse.cursor = MouseCursor.ARROW;
            removeEventListener(MouseEvent.MOUSE_DOWN,this.a_3076);
            BattleFieldView.a_1026.play();
            a_1089.SetLastCardViewOnHand(this);
         }
      }
      
      private function OnBaseDefenseMouseMove(a_4730:MouseEvent) : void
      {
         var stMyBattleFieldView:BattleFieldView = null;
         var iXGridNo:int = 0;
         var iYGridNo:int = 0;
         var stFieldGrid:a_3491 = null;
         this.a_1105.x = a_1089.mouseX - this.a_1105.width * 0.1;
         this.a_1105.y = a_1089.mouseY - this.a_1105.height * 0.75;
         stMyBattleFieldView = a_1089.a_3413().m_stMyBattleFieldView;
         if(stMyBattleFieldView.mouseX > 0 && stMyBattleFieldView.mouseX < BattleFieldView.a_1013 && stMyBattleFieldView.mouseY > 0 && stMyBattleFieldView.mouseY < BattleFieldView.a_1014)
         {
            iXGridNo = int(stMyBattleFieldView.mouseX / a_3491.a_1080);
            iYGridNo = int(stMyBattleFieldView.mouseY / a_3491.a_1081);
            stFieldGrid = stMyBattleFieldView.a_3438(iXGridNo,iYGridNo);
            if(this.a_1105 is a_3975 && null != stFieldGrid.m_stProtector || this.a_1105 is a_3953 && null != stFieldGrid.m_stAttackFighter || this.a_1105 is a_3960 && (null != stFieldGrid.m_stBoomDefense || null != stFieldGrid.m_stAttackFighter) || this.a_1105 is a_3971 && (null != stFieldGrid.m_stFlowerDefense || null != stFieldGrid.m_stAttackFighter))
            {
               trace("OnBaseDefenseMouseMove stFieldGrid 己被占用, 移动阴影不显示");
               this.a_1100.visible = false;
               return;
            }
            this.a_1100.visible = true;
            this.a_1100.x = iXGridNo * a_3491.a_1080 + (a_3491.a_1080 - this.a_1100.width) * 0.5;
            this.a_1100.y = iYGridNo * a_3491.a_1081 + (a_3491.a_1081 - this.a_1100.height) * 0.5;
            stMyBattleFieldView.addChild(this.a_1100);
         }
         else
         {
            this.a_1100.visible = false;
         }
      }
      
      private function OnBaseDefenseMouseClick(a_4730:Event) : void
      {
         var stMyBattleFieldView:BattleFieldView = null;
         var iXGridNo:int = 0;
         var iYGridNo:int = 0;
         var stFieldGrid:a_3491 = null;
         var byIsTool:int = 0;
         var stInitialFieldGrid:a_3491 = null;
         trace("OnBaseDefenseMouseClick");
         stMyBattleFieldView = a_1089.a_3413().m_stMyBattleFieldView;
         if(stMyBattleFieldView.mouseX > 0 && stMyBattleFieldView.mouseX < BattleFieldView.a_1013 && stMyBattleFieldView.mouseY > 0 && stMyBattleFieldView.mouseY < BattleFieldView.a_1014)
         {
            iXGridNo = int(stMyBattleFieldView.mouseX / a_3491.a_1080);
            iYGridNo = int(stMyBattleFieldView.mouseY / a_3491.a_1081);
            stFieldGrid = stMyBattleFieldView.a_3438(iXGridNo,iYGridNo);
            if(this.a_1105 is a_3975 && null != stFieldGrid.m_stProtector || this.a_1105 is a_3953 && null != stFieldGrid.m_stAttackFighter || this.a_1105 is a_3960 && (null != stFieldGrid.m_stBoomDefense || null != stFieldGrid.m_stAttackFighter) || this.a_1105 is a_3971 && (null != stFieldGrid.m_stFlowerDefense || null != stFieldGrid.m_stAttackFighter))
            {
               trace("OnBaseDefenseMouseClick stFieldGrid 己被占用, 放置不成功");
               return;
            }
            this.a_1105.x = iXGridNo * a_3491.a_1080 + (a_3491.a_1080 - this.a_1105.width) * 0.5;
            this.a_1105.y = iYGridNo * a_3491.a_1081 + (a_3491.a_1081 - this.a_1105.height) * 0.5;
            if(!stMyBattleFieldView.a_3441(this.a_1105,iXGridNo,iYGridNo))
            {
               trace("stMyBattleFieldView.AddBaseDefense failed , 放置不成功");
               return;
            }
            byIsTool = 0;
            if(this.a_1105 is a_4421 || this.a_1105 is HelmetCopperScoop || this.a_1105 is HelmetSilverScoop || this.a_1105 is HelmetGoldenScoop)
            {
               byIsTool = 1;
            }
            this.a_1105.m_iDefenseGlobalID = stMyBattleFieldView.a_2180();
            stInitialFieldGrid = stMyBattleFieldView.a_3438(iXGridNo,iYGridNo);
            a_1088.a_2059(this.a_1105.m_iDefenseGlobalID,this.a_1098,stInitialFieldGrid.m_iInitialXGridNo,stInitialFieldGrid.m_iInitialYGridNo,byIsTool);
            Mouse.cursor = MouseCursor.ARROW;
         }
         else
         {
            this.a_1105.a_3940();
            Mouse.cursor = MouseCursor.BUTTON;
         }
         addEventListener(MouseEvent.MOUSE_DOWN,this.a_3076);
         if(this.a_1100.parent)
         {
            this.a_1100.parent.removeChild(this.a_1100);
         }
         this.a_1105.removeEventListener(MouseEvent.CLICK,this.OnBaseDefenseMouseClick);
         a_1089.removeEventListener(MouseEvent.MOUSE_MOVE,this.OnBaseDefenseMouseMove,true);
         a_1089.IsExistDefensePlaceOnHand = false;
         this.a_1105 = null;
      }
      
      public function BackToPanleGameCardOnHand() : void
      {
         this.a_1105.a_3940();
         Mouse.cursor = MouseCursor.BUTTON;
         addEventListener(MouseEvent.MOUSE_DOWN,this.a_3076);
         if(this.a_1100.parent)
         {
            this.a_1100.parent.removeChild(this.a_1100);
         }
         this.a_1105.removeEventListener(MouseEvent.CLICK,this.OnBaseDefenseMouseClick);
         a_1089.removeEventListener(MouseEvent.MOUSE_MOVE,this.OnBaseDefenseMouseMove,true);
         a_1089.IsExistDefensePlaceOnHand = false;
         this.a_1105 = null;
      }
   }
}

