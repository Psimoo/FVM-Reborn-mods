package com.aurora.ui.maogoutd.game
{
   import a_4718.b_203;
   import a_4728.a_1778;
   import com.aurora.ui.maogoutd.resource.ISmallGameDetailInfoMap;
   import com.aurora.ui.maogoutd.resource.tools.a_4406;
   import com.aurora.ui.maogoutd.resource.tools.a_4411;
   import com.aurora.ui.maogoutd.resource.tools.a_4423;
   import com.aurora.ui.maogoutd.resource.tools.a_4436;
   import com.aurora.ui.maogoutd.resource.tools.a_4438;
   import com.aurora.ui.maogoutd.resource.tools.a_4441;
   import com.aurora.ui.maogoutd.resource.tools.a_4443;
   import com.aurora.ui.maogoutd.resource.tools.a_4445;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   
   public class a_3574 extends Sprite implements ISmallGameDetailInfoMap
   {
      
      public static var a_1080:int;
      
      public static var a_1081:int;
      
      public static var a_1121:int;
      
      public static var a_1122:int;
      
      public var m_stSelectedGridAlert:a_4445;
      
      public var m_arrInsuranceAlertVector:Array;
      
      public var m_arrAvatarAlertVector:Array;
      
      public var m_arrBeShotAimedAlertVector:Array;
      
      public var m_arrProduceEnergyDefenseAlertVector:Array;
      
      public var m_arrRemoteAttackFighterAlertVector:Array;
      
      public var m_arrRemoteAttackDefenseAlertVector:Array;
      
      public var m_arrOtherDefenseAlert:Array;
      
      public function a_3574()
      {
         super();
      }
      
      public function a_1797() : Boolean
      {
         if(this.m_arrInsuranceAlertVector is Array)
         {
            this.a_3579();
         }
         a_1080 = 15;
         a_1081 = 15;
         a_1121 = a_1080 * BattleFieldView.a_1011;
         a_1122 = a_1081 * BattleFieldView.a_1012;
         this.m_stSelectedGridAlert = new a_4445();
         this.m_arrInsuranceAlertVector = new Array();
         this.m_arrAvatarAlertVector = new Array();
         this.m_arrBeShotAimedAlertVector = new Array();
         this.m_arrProduceEnergyDefenseAlertVector = new Array();
         this.m_arrRemoteAttackFighterAlertVector = new Array();
         this.m_arrRemoteAttackDefenseAlertVector = new Array();
         this.m_arrOtherDefenseAlert = new Array();
         for(var i:int = 0; i < BattleFieldView.a_1012; i++)
         {
            this.m_arrAvatarAlertVector[i] = new Array();
            this.m_arrBeShotAimedAlertVector[i] = new Array();
            this.m_arrProduceEnergyDefenseAlertVector[i] = new Array();
            this.m_arrRemoteAttackFighterAlertVector[i] = new Array();
            this.m_arrRemoteAttackDefenseAlertVector[i] = new Array();
            this.m_arrOtherDefenseAlert[i] = new Array();
         }
         addEventListener(MouseEvent.CLICK,this.a_3076);
         return true;
      }
      
      public function a_3575(iAlertType:int, iXGridNo:int, iYGridNo:int) : Boolean
      {
         var stAvatarPostionAlert:a_4406 = null;
         var stInsuranceAlert:a_4423 = null;
         var stBeShotAimedAlert:a_4411 = null;
         var stProduceEnergyDefenseAlert:a_4438 = null;
         var stRemoteAttackFigterAlert:a_4443 = null;
         var stRemoteAttackDefenseAlert:a_4441 = null;
         var stOtherDefenseAlert:a_4436 = null;
         if(iXGridNo < 0 || iXGridNo >= BattleFieldView.a_1011 || iYGridNo < 0 || iYGridNo >= BattleFieldView.a_1012)
         {
            return false;
         }
         if(iAlertType == b_203.a_437)
         {
            this.m_stSelectedGridAlert.a_1797();
            this.m_stSelectedGridAlert.x = a_1121 - (a_1080 * iXGridNo + 0.5 * (a_1080 - this.m_stSelectedGridAlert.width)) - this.m_stSelectedGridAlert.width;
            this.m_stSelectedGridAlert.y = a_1081 * iYGridNo + 0.5 * (a_1081 - this.m_stSelectedGridAlert.height);
            addChildAt(this.m_stSelectedGridAlert,1);
         }
         else if(iAlertType == b_203.a_438)
         {
            if(null == this.m_arrAvatarAlertVector[iYGridNo][iXGridNo])
            {
               this.m_arrAvatarAlertVector[iYGridNo][iXGridNo] = a_4406.a_3926();
            }
            stAvatarPostionAlert = this.m_arrAvatarAlertVector[iYGridNo][iXGridNo];
            stAvatarPostionAlert.a_1797();
            stAvatarPostionAlert.x = a_1121 - (a_1080 * iXGridNo + 0.5 * (a_1080 - stAvatarPostionAlert.width)) - stAvatarPostionAlert.width;
            stAvatarPostionAlert.y = a_1081 * iYGridNo + 0.5 * (a_1081 - stAvatarPostionAlert.height);
            addChild(stAvatarPostionAlert);
         }
         else if(iAlertType == b_203.a_439)
         {
            if(null == this.m_arrInsuranceAlertVector[iYGridNo])
            {
               this.m_arrInsuranceAlertVector[iYGridNo] = a_4423.a_3926();
            }
            stInsuranceAlert = this.m_arrInsuranceAlertVector[iYGridNo];
            stInsuranceAlert.a_1797();
            stInsuranceAlert.x = a_1121;
            stInsuranceAlert.y = a_1081 * iYGridNo + 0.5 * (a_1081 - stInsuranceAlert.height);
            addChild(stInsuranceAlert);
         }
         else if(iAlertType == b_203.a_440)
         {
            if(null == this.m_arrBeShotAimedAlertVector[iYGridNo][iXGridNo])
            {
               this.m_arrBeShotAimedAlertVector[iYGridNo][iXGridNo] = a_4411.a_3926();
            }
            stBeShotAimedAlert = this.m_arrBeShotAimedAlertVector[iYGridNo][iXGridNo];
            stBeShotAimedAlert.a_1797();
            stBeShotAimedAlert.x = a_1121 - (a_1080 * iXGridNo + 0.5 * (a_1080 - stBeShotAimedAlert.width)) - stBeShotAimedAlert.width;
            stBeShotAimedAlert.y = a_1081 * iYGridNo + 0.5 * (a_1081 - stBeShotAimedAlert.height);
            addChild(stBeShotAimedAlert);
         }
         else if(iAlertType == b_203.a_441)
         {
            if(null == this.m_arrProduceEnergyDefenseAlertVector[iYGridNo][iXGridNo])
            {
               this.m_arrProduceEnergyDefenseAlertVector[iYGridNo][iXGridNo] = a_4438.a_3926();
            }
            stProduceEnergyDefenseAlert = this.m_arrProduceEnergyDefenseAlertVector[iYGridNo][iXGridNo];
            stProduceEnergyDefenseAlert.a_1797();
            stProduceEnergyDefenseAlert.x = a_1121 - (a_1080 * iXGridNo + 0.5 * (a_1080 - stProduceEnergyDefenseAlert.width)) - stProduceEnergyDefenseAlert.width;
            stProduceEnergyDefenseAlert.y = a_1081 * iYGridNo + 0.5 * (a_1081 - stProduceEnergyDefenseAlert.height);
            addChild(stProduceEnergyDefenseAlert);
         }
         else if(iAlertType == b_203.a_442)
         {
            if(null == this.m_arrRemoteAttackFighterAlertVector[iYGridNo][iXGridNo])
            {
               this.m_arrRemoteAttackFighterAlertVector[iYGridNo][iXGridNo] = a_4443.a_3926();
            }
            stRemoteAttackFigterAlert = this.m_arrRemoteAttackFighterAlertVector[iYGridNo][iXGridNo];
            stRemoteAttackFigterAlert.a_1797();
            stRemoteAttackFigterAlert.x = a_1121 - (a_1080 * iXGridNo + 0.5 * (a_1080 - stRemoteAttackFigterAlert.width)) - stRemoteAttackFigterAlert.width;
            stRemoteAttackFigterAlert.y = a_1081 * iYGridNo + 0.5 * (a_1081 - stRemoteAttackFigterAlert.height);
            addChild(stRemoteAttackFigterAlert);
         }
         else if(iAlertType == b_203.a_443)
         {
            if(null == this.m_arrRemoteAttackDefenseAlertVector[iYGridNo][iXGridNo])
            {
               this.m_arrRemoteAttackDefenseAlertVector[iYGridNo][iXGridNo] = a_4441.a_3926();
            }
            stRemoteAttackDefenseAlert = this.m_arrRemoteAttackDefenseAlertVector[iYGridNo][iXGridNo];
            stRemoteAttackDefenseAlert.a_1797();
            stRemoteAttackDefenseAlert.x = a_1121 - (a_1080 * iXGridNo + 0.5 * (a_1080 - stRemoteAttackDefenseAlert.width)) - stRemoteAttackDefenseAlert.width;
            stRemoteAttackDefenseAlert.y = a_1081 * iYGridNo + 0.5 * (a_1081 - stRemoteAttackDefenseAlert.height);
            addChild(stRemoteAttackDefenseAlert);
         }
         else if(iAlertType == b_203.a_444)
         {
            if(null == this.m_arrOtherDefenseAlert[iYGridNo][iXGridNo])
            {
               this.m_arrOtherDefenseAlert[iYGridNo][iXGridNo] = a_4436.a_3926();
            }
            stOtherDefenseAlert = this.m_arrOtherDefenseAlert[iYGridNo][iXGridNo];
            stOtherDefenseAlert.a_1797();
            stOtherDefenseAlert.x = a_1121 - (a_1080 * iXGridNo + 0.5 * (a_1080 - stOtherDefenseAlert.width)) - stOtherDefenseAlert.width;
            stOtherDefenseAlert.y = a_1081 * iYGridNo + 0.5 * (a_1081 - stOtherDefenseAlert.height);
            addChild(stOtherDefenseAlert);
         }
         return true;
      }
      
      public function a_3576(iXGridNo:int, iYGridNo:int) : Boolean
      {
         if(iXGridNo < 0 || iXGridNo >= BattleFieldView.a_1011 || iYGridNo < 0 || iYGridNo >= BattleFieldView.a_1012)
         {
            return false;
         }
         if(null != this.m_arrAvatarAlertVector[iYGridNo][iXGridNo])
         {
            this.m_arrAvatarAlertVector[iYGridNo][iXGridNo].a_3940();
         }
         if(null != this.m_arrProduceEnergyDefenseAlertVector[iYGridNo][iXGridNo])
         {
            this.m_arrProduceEnergyDefenseAlertVector[iYGridNo][iXGridNo].a_3940();
         }
         if(null != this.m_arrRemoteAttackFighterAlertVector[iYGridNo][iXGridNo])
         {
            this.m_arrRemoteAttackFighterAlertVector[iYGridNo][iXGridNo].a_3940();
         }
         if(null != this.m_arrRemoteAttackDefenseAlertVector[iYGridNo][iXGridNo])
         {
            this.m_arrRemoteAttackDefenseAlertVector[iYGridNo][iXGridNo].a_3940();
         }
         if(null != this.m_arrOtherDefenseAlert[iYGridNo][iXGridNo])
         {
            this.m_arrOtherDefenseAlert[iYGridNo][iXGridNo].a_3940();
         }
         return true;
      }
      
      public function a_3577(iYGridNo:int) : Boolean
      {
         if(iYGridNo < 0 || iYGridNo >= BattleFieldView.a_1012)
         {
            return false;
         }
         if(null != this.m_arrInsuranceAlertVector[iYGridNo])
         {
            this.m_arrInsuranceAlertVector[iYGridNo].a_3940();
         }
         return true;
      }
      
      public function a_3578(iXGridNo:int, iYGridNo:int) : Boolean
      {
         if(iXGridNo < 0 || iXGridNo >= BattleFieldView.a_1011 || iYGridNo < 0 || iYGridNo >= BattleFieldView.a_1012)
         {
            return false;
         }
         if(null != this.m_arrBeShotAimedAlertVector[iYGridNo][iXGridNo])
         {
            this.m_arrBeShotAimedAlertVector[iYGridNo][iXGridNo].a_3940();
         }
         return true;
      }
      
      public function a_3579() : Boolean
      {
         var j:int = 0;
         for(var i:int = 0; i < BattleFieldView.a_1012; i++)
         {
            for(j = 0; j < BattleFieldView.a_1011; j++)
            {
               this.a_3576(j,i);
               this.a_3578(j,i);
            }
            this.a_3577(i);
         }
         return true;
      }
      
      private function a_3076(a_4730:Event) : void
      {
         var iXGridNo:int = int(mouseX / a_1080);
         var iYGridNo:int = int(mouseY / a_1081);
         this.a_3575(b_203.a_437,iXGridNo,iYGridNo);
         var stDataEvent:a_1778 = new a_1778("SmallMapGridClick");
         stDataEvent.dataObject = [iXGridNo,iYGridNo];
         if(root)
         {
            root.dispatchEvent(stDataEvent);
         }
      }
   }
}

