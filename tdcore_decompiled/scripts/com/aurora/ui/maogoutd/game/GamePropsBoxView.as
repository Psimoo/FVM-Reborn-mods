package com.aurora.ui.maogoutd.game
{
   import com.aurora.ui.maogoutd.TDGame2V2BattleUI;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4255;
   import com.aurora.ui.maogoutd.resource.props.EnmPropEffectType;
   import com.aurora.ui.maogoutd.resource.props.IBaseProp;
   import flash.display.DisplayObjectContainer;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   
   public class GamePropsBoxView extends Sprite
   {
      
      public var m_stFirstProp:IBaseProp;
      
      public var m_stSecondProp:IBaseProp;
      
      public var m_stThirdProp:IBaseProp;
      
      public var m_stFirstPropDisplayButton:Sprite;
      
      public var m_stSecondPropDisplayButton:Sprite;
      
      public var m_stThirdPropDisplayButton:Sprite;
      
      private var a_1114:a_4206;
      
      private var a_1115:Sprite;
      
      public function GamePropsBoxView()
      {
         super();
      }
      
      public function a_3541() : Boolean
      {
         this.m_stFirstProp = null;
         if(this.m_stFirstPropDisplayButton)
         {
            this.m_stFirstPropDisplayButton.removeEventListener(MouseEvent.CLICK,this.a_3543);
            this.m_stFirstPropDisplayButton.removeEventListener(MouseEvent.CLICK,this.a_3544);
            this.m_stFirstPropDisplayButton.removeEventListener(MouseEvent.CLICK,this.a_3545);
            this.m_stFirstPropDisplayButton = null;
         }
         this.m_stSecondProp = null;
         if(this.m_stSecondPropDisplayButton)
         {
            this.m_stSecondPropDisplayButton.removeEventListener(MouseEvent.CLICK,this.a_3543);
            this.m_stSecondPropDisplayButton.removeEventListener(MouseEvent.CLICK,this.a_3544);
            this.m_stSecondPropDisplayButton.removeEventListener(MouseEvent.CLICK,this.a_3545);
            this.m_stSecondPropDisplayButton = null;
         }
         this.m_stThirdProp = null;
         if(this.m_stThirdPropDisplayButton)
         {
            this.m_stThirdPropDisplayButton.removeEventListener(MouseEvent.CLICK,this.a_3543);
            this.m_stThirdPropDisplayButton.removeEventListener(MouseEvent.CLICK,this.a_3544);
            this.m_stThirdPropDisplayButton.removeEventListener(MouseEvent.CLICK,this.a_3545);
            this.m_stThirdPropDisplayButton = null;
         }
         return true;
      }
      
      public function a_3542(stBaseProp:IBaseProp) : Boolean
      {
         var stPropDisplayButton:Sprite = null;
         if(null == stBaseProp || Boolean(this.m_stFirstProp) && Boolean(this.m_stSecondProp) && Boolean(this.m_stThirdProp))
         {
            return false;
         }
         stPropDisplayButton = stBaseProp.a_4326();
         stPropDisplayButton.buttonMode = true;
         if(null == this.m_stFirstProp)
         {
            stPropDisplayButton.x = 0;
            stPropDisplayButton.y = 0;
            this.m_stFirstProp = stBaseProp;
            this.m_stFirstPropDisplayButton = stPropDisplayButton;
            stPropDisplayButton.addEventListener(MouseEvent.CLICK,this.a_3543);
         }
         else if(null == this.m_stSecondProp)
         {
            stPropDisplayButton.x = 0;
            stPropDisplayButton.y = 60;
            this.m_stSecondProp = stBaseProp;
            this.m_stSecondPropDisplayButton = stPropDisplayButton;
            stPropDisplayButton.addEventListener(MouseEvent.CLICK,this.a_3544);
         }
         else if(null == this.m_stThirdProp)
         {
            stPropDisplayButton.x = 0;
            stPropDisplayButton.y = 120;
            this.m_stThirdProp = stBaseProp;
            this.m_stThirdPropDisplayButton = stPropDisplayButton;
            stPropDisplayButton.addEventListener(MouseEvent.CLICK,this.a_3545);
         }
         addChild(stPropDisplayButton);
         if(-1 == TDGame2V2BattleUI.a_921.m_arrDropPropArray.indexOf(stPropDisplayButton))
         {
            TDGame2V2BattleUI.a_921.m_arrDropPropArray.push(stPropDisplayButton);
         }
         return true;
      }
      
      private function a_3543(a_4730:MouseEvent) : void
      {
         var stPropDisplayButton:Sprite = null;
         var stBaseMoveIntruder:a_4206 = null;
         var stMyBattleFieldView:BattleFieldView = null;
         stPropDisplayButton = a_4730.currentTarget as Sprite;
         stPropDisplayButton.removeEventListener(MouseEvent.CLICK,this.a_3543);
         stPropDisplayButton.removeEventListener(MouseEvent.CLICK,this.a_3544);
         stPropDisplayButton.removeEventListener(MouseEvent.CLICK,this.a_3545);
         if(this.m_stFirstProp.a_4328().m_iEffectTypeID == EnmPropEffectType.a_1568)
         {
            stBaseMoveIntruder = a_4255.getInstance().a_4256(this.m_stFirstProp.a_4328().m_iEffectValue);
            if(stBaseMoveIntruder)
            {
               stBaseMoveIntruder.a_1797(0,1);
               stBaseMoveIntruder.gotoAndStop(1);
               stBaseMoveIntruder.x = root.mouseX;
               stBaseMoveIntruder.y = root.mouseY - stBaseMoveIntruder.height * 0.75;
               stBaseMoveIntruder.mouseEnabled = true;
               stBaseMoveIntruder.addEventListener(MouseEvent.CLICK,this.a_3546);
               root.addEventListener(MouseEvent.MOUSE_MOVE,this.a_3549,true);
               this.a_1114 = stBaseMoveIntruder;
               (root as DisplayObjectContainer).addChild(stBaseMoveIntruder);
               this.a_1115 = stPropDisplayButton;
            }
            else
            {
               this.m_stFirstProp.a_4329(stPropDisplayButton);
               this.m_stFirstProp = null;
            }
         }
         else
         {
            stMyBattleFieldView = TDGame2V2BattleUI.a_921.m_stBattleFieldFor4View.m_stMyBattleFieldView;
            TDGame2V2BattleUI.a_1088.a_2072([stMyBattleFieldView.iTimeIntervalNum,this.m_stFirstProp.a_4322(),0,0]);
            this.m_stFirstProp = null;
         }
      }
      
      private function a_3544(a_4730:MouseEvent) : void
      {
         var stPropDisplayButton:Sprite = null;
         var stBaseMoveIntruder:a_4206 = null;
         var stMyBattleFieldView:BattleFieldView = null;
         stPropDisplayButton = a_4730.currentTarget as Sprite;
         stPropDisplayButton.removeEventListener(MouseEvent.CLICK,this.a_3543);
         stPropDisplayButton.removeEventListener(MouseEvent.CLICK,this.a_3544);
         stPropDisplayButton.removeEventListener(MouseEvent.CLICK,this.a_3545);
         if(this.m_stSecondProp.a_4328().m_iEffectTypeID == EnmPropEffectType.a_1568)
         {
            stBaseMoveIntruder = a_4255.getInstance().a_4256(this.m_stSecondProp.a_4328().m_iEffectValue);
            if(stBaseMoveIntruder)
            {
               stBaseMoveIntruder.a_1797(0,1);
               stBaseMoveIntruder.gotoAndStop(1);
               stBaseMoveIntruder.x = root.mouseX;
               stBaseMoveIntruder.y = root.mouseY - stBaseMoveIntruder.height * 0.75;
               stBaseMoveIntruder.mouseEnabled = true;
               stBaseMoveIntruder.addEventListener(MouseEvent.CLICK,this.a_3547);
               root.addEventListener(MouseEvent.MOUSE_MOVE,this.a_3549,true);
               this.a_1114 = stBaseMoveIntruder;
               (root as DisplayObjectContainer).addChild(stBaseMoveIntruder);
               this.a_1115 = stPropDisplayButton;
            }
            else
            {
               this.m_stSecondProp.a_4329(stPropDisplayButton);
               this.m_stSecondProp = null;
            }
         }
         else
         {
            stMyBattleFieldView = TDGame2V2BattleUI.a_921.m_stBattleFieldFor4View.m_stMyBattleFieldView;
            TDGame2V2BattleUI.a_1088.a_2072([stMyBattleFieldView.iTimeIntervalNum,this.m_stSecondProp.a_4322(),0,0]);
            this.m_stSecondProp = null;
         }
      }
      
      private function a_3545(a_4730:MouseEvent) : void
      {
         var stPropDisplayButton:Sprite = null;
         var stBaseMoveIntruder:a_4206 = null;
         var stMyBattleFieldView:BattleFieldView = null;
         stPropDisplayButton = a_4730.currentTarget as Sprite;
         stPropDisplayButton.removeEventListener(MouseEvent.CLICK,this.a_3543);
         stPropDisplayButton.removeEventListener(MouseEvent.CLICK,this.a_3544);
         stPropDisplayButton.removeEventListener(MouseEvent.CLICK,this.a_3545);
         if(this.m_stThirdProp.a_4328().m_iEffectTypeID == EnmPropEffectType.a_1568)
         {
            stBaseMoveIntruder = a_4255.getInstance().a_4256(this.m_stThirdProp.a_4328().m_iEffectValue);
            if(stBaseMoveIntruder)
            {
               stBaseMoveIntruder.a_1797(0,1);
               stBaseMoveIntruder.gotoAndStop(1);
               stBaseMoveIntruder.x = root.mouseX;
               stBaseMoveIntruder.y = root.mouseY - stBaseMoveIntruder.height * 0.75;
               stBaseMoveIntruder.mouseEnabled = true;
               stBaseMoveIntruder.addEventListener(MouseEvent.CLICK,this.a_3548);
               root.addEventListener(MouseEvent.MOUSE_MOVE,this.a_3549,true);
               this.a_1114 = stBaseMoveIntruder;
               (root as DisplayObjectContainer).addChild(stBaseMoveIntruder);
               this.a_1115 = stPropDisplayButton;
            }
            else
            {
               this.m_stThirdProp.a_4329(stPropDisplayButton);
               this.m_stThirdProp = null;
            }
         }
         else
         {
            stMyBattleFieldView = TDGame2V2BattleUI.a_921.m_stBattleFieldFor4View.m_stMyBattleFieldView;
            TDGame2V2BattleUI.a_1088.a_2072([stMyBattleFieldView.iTimeIntervalNum,this.m_stThirdProp.a_4322(),0,0]);
            this.m_stThirdProp = null;
         }
      }
      
      private function a_3546(a_4730:MouseEvent) : void
      {
         var iXGridNo:int = 0;
         var iYGridNo:int = 0;
         if(null == this.a_1114 || null == this.a_1115)
         {
            return;
         }
         var stMyBattleFieldView:BattleFieldView = TDGame2V2BattleUI.a_921.m_stBattleFieldFor4View.m_stMyBattleFieldView;
         var stOpponentBattleFieldView:BattleFieldView = TDGame2V2BattleUI.a_921.m_stBattleFieldFor4View.m_stOpponentBattleFieldView;
         if(stOpponentBattleFieldView.mouseX > 0 && stOpponentBattleFieldView.mouseX < BattleFieldView.a_1013 && stOpponentBattleFieldView.mouseY > 0 && stOpponentBattleFieldView.mouseY < BattleFieldView.a_1014 && Boolean(this.m_stFirstProp))
         {
            iXGridNo = BattleFieldView.a_1011 - 1;
            iYGridNo = int(stOpponentBattleFieldView.mouseY / a_3491.a_1081);
            if(stOpponentBattleFieldView.a_3438(iXGridNo,iYGridNo).m_isNeedTray && 304023566 != this.m_stFirstProp.a_4322())
            {
               this.a_1114.startDrag();
               return;
            }
            TDGame2V2BattleUI.a_1088.a_2072([stMyBattleFieldView.iTimeIntervalNum + 20,this.m_stFirstProp.a_4322(),iXGridNo,iYGridNo]);
            this.a_1114.stopDrag();
            this.a_1114.removeEventListener(MouseEvent.CLICK,this.a_3546);
            if(contains(this.a_1114))
            {
               removeChild(this.a_1114);
            }
            this.a_1114.a_4212();
            this.a_1114 = null;
            this.m_stFirstProp.a_4329(this.a_1115);
            this.m_stFirstProp = null;
            TDGame2V2BattleUI.a_921.m_arrDropPropArray.splice(TDGame2V2BattleUI.a_921.m_arrDropPropArray.indexOf(this.a_1115),1);
            this.a_1115 = null;
         }
         else
         {
            this.a_1114.stopDrag();
            this.a_1114.removeEventListener(MouseEvent.CLICK,this.a_3546);
            if(contains(this.a_1114))
            {
               removeChild(this.a_1114);
            }
            this.a_1114.a_4212();
            this.a_1114 = null;
            this.a_1115.addEventListener(MouseEvent.CLICK,this.a_3543);
         }
      }
      
      private function a_3547(a_4730:MouseEvent) : void
      {
         var iXGridNo:int = 0;
         var iYGridNo:int = 0;
         if(null == this.a_1114 || null == this.a_1115)
         {
            return;
         }
         var stMyBattleFieldView:BattleFieldView = TDGame2V2BattleUI.a_921.m_stBattleFieldFor4View.m_stMyBattleFieldView;
         var stOpponentBattleFieldView:BattleFieldView = TDGame2V2BattleUI.a_921.m_stBattleFieldFor4View.m_stOpponentBattleFieldView;
         if(stOpponentBattleFieldView.mouseX > 0 && stOpponentBattleFieldView.mouseX < BattleFieldView.a_1013 && stOpponentBattleFieldView.mouseY > 0 && stOpponentBattleFieldView.mouseY < BattleFieldView.a_1014 && Boolean(this.m_stSecondProp))
         {
            iXGridNo = BattleFieldView.a_1011 - 1;
            iYGridNo = int(stOpponentBattleFieldView.mouseY / a_3491.a_1081);
            TDGame2V2BattleUI.a_1088.a_2072([stMyBattleFieldView.iTimeIntervalNum + 20,this.m_stSecondProp.a_4322(),iXGridNo,iYGridNo]);
            this.a_1114.stopDrag();
            this.a_1114.removeEventListener(MouseEvent.CLICK,this.a_3547);
            if(contains(this.a_1114))
            {
               removeChild(this.a_1114);
            }
            this.a_1114.a_4212();
            this.a_1114 = null;
            this.m_stSecondProp.a_4329(this.a_1115);
            this.m_stSecondProp = null;
            TDGame2V2BattleUI.a_921.m_arrDropPropArray.splice(TDGame2V2BattleUI.a_921.m_arrDropPropArray.indexOf(this.a_1115),1);
            this.a_1115 = null;
         }
         else
         {
            this.a_1114.stopDrag();
            this.a_1114.removeEventListener(MouseEvent.CLICK,this.a_3547);
            if(contains(this.a_1114))
            {
               removeChild(this.a_1114);
            }
            this.a_1114.a_4212();
            this.a_1114 = null;
            this.a_1115.addEventListener(MouseEvent.CLICK,this.a_3544);
         }
      }
      
      private function a_3548(a_4730:MouseEvent) : void
      {
         var iXGridNo:int = 0;
         var iYGridNo:int = 0;
         if(null == this.a_1114 || null == this.a_1115)
         {
            return;
         }
         var stMyBattleFieldView:BattleFieldView = TDGame2V2BattleUI.a_921.m_stBattleFieldFor4View.m_stMyBattleFieldView;
         var stOpponentBattleFieldView:BattleFieldView = TDGame2V2BattleUI.a_921.m_stBattleFieldFor4View.m_stOpponentBattleFieldView;
         if(stOpponentBattleFieldView.mouseX > 0 && stOpponentBattleFieldView.mouseX < BattleFieldView.a_1013 && stOpponentBattleFieldView.mouseY > 0 && stOpponentBattleFieldView.mouseY < BattleFieldView.a_1014 && Boolean(this.m_stThirdProp))
         {
            iXGridNo = BattleFieldView.a_1011 - 1;
            iYGridNo = int(stOpponentBattleFieldView.mouseY / a_3491.a_1081);
            TDGame2V2BattleUI.a_1088.a_2072([stMyBattleFieldView.iTimeIntervalNum + 20,this.m_stThirdProp.a_4322(),iXGridNo,iYGridNo]);
            this.a_1114.stopDrag();
            this.a_1114.removeEventListener(MouseEvent.CLICK,this.a_3548);
            if(contains(this.a_1114))
            {
               removeChild(this.a_1114);
            }
            this.a_1114.a_4212();
            this.a_1114 = null;
            this.m_stThirdProp.a_4329(this.a_1115);
            this.m_stThirdProp = null;
            TDGame2V2BattleUI.a_921.m_arrDropPropArray.splice(TDGame2V2BattleUI.a_921.m_arrDropPropArray.indexOf(this.a_1115),1);
            this.a_1115 = null;
         }
         else
         {
            this.a_1114.stopDrag();
            this.a_1114.removeEventListener(MouseEvent.CLICK,this.a_3548);
            if(contains(this.a_1114))
            {
               removeChild(this.a_1114);
            }
            this.a_1114.a_4212();
            this.a_1114 = null;
            this.a_1115.addEventListener(MouseEvent.CLICK,this.a_3545);
         }
      }
      
      private function a_3549(a_4730:MouseEvent) : void
      {
         if(this.a_1114)
         {
            this.a_1114.x = root.mouseX;
            this.a_1114.y = root.mouseY - this.a_1114.height * 0.5;
         }
      }
   }
}

