package com.aurora.ui.maogoutd.resource.energy
{
   import a_4715.EncrypBooleanEx;
   import a_4715.EncrypIntEx;
   import a_4715.EncrypNumber;
   import a_4728.a_1778;
   import a_4753.b_150;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.a_3909;
   import flash.display.DisplayObjectContainer;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   
   public class a_4157 extends a_3909
   {
      
      public static var a_1088:b_150;
      
      public var m_stCurrentBattleField:BattleFieldView;
      
      private var m_iGlobalIDEx:EncrypIntEx = new EncrypIntEx();
      
      private var m_iEnergyPowerEx:EncrypIntEx = new EncrypIntEx();
      
      private var m_iWaitClickTimeEx:EncrypIntEx = new EncrypIntEx();
      
      private var m_isClickedEx:EncrypBooleanEx = new EncrypBooleanEx();
      
      private var m_numXSpeedEx:EncrypNumber = new EncrypNumber();
      
      private var m_numYSpeedEx:EncrypNumber = new EncrypNumber();
      
      private var m_iYMoveDropSpeedEx:EncrypIntEx = new EncrypIntEx();
      
      private var m_isCapturedEx:EncrypBooleanEx;
      
      public function a_4157()
      {
         super();
         buttonMode = true;
      }
      
      private function get m_iGlobalID() : int
      {
         return this.m_iGlobalIDEx.Value;
      }
      
      private function set m_iGlobalID(value:int) : void
      {
         this.m_iGlobalIDEx.Value = value;
      }
      
      public function get iEnergyPower() : int
      {
         return this.a_1434;
      }
      
      private function get a_1434() : int
      {
         return this.m_iEnergyPowerEx.Value;
      }
      
      private function set a_1434(value:int) : void
      {
         this.m_iEnergyPowerEx.Value = value;
      }
      
      private function get a_1436() : int
      {
         return this.m_iWaitClickTimeEx.Value;
      }
      
      private function set a_1436(value:int) : void
      {
         this.m_iWaitClickTimeEx.Value = value;
      }
      
      private function get m_isClicked() : Boolean
      {
         return this.m_isClickedEx.Value;
      }
      
      private function set m_isClicked(value:Boolean) : void
      {
         this.m_isClickedEx.Value = value;
      }
      
      private function get m_numXSpeed() : Number
      {
         return this.m_numXSpeedEx.Value;
      }
      
      private function set m_numXSpeed(value:Number) : void
      {
         this.m_numXSpeedEx.Value = value;
      }
      
      private function get m_numYSpeed() : Number
      {
         return this.m_numYSpeedEx.Value;
      }
      
      private function set m_numYSpeed(value:Number) : void
      {
         this.m_numYSpeedEx.Value = value;
      }
      
      private function get a_1437() : int
      {
         return this.m_iYMoveDropSpeedEx.Value;
      }
      
      private function set a_1437(value:int) : void
      {
         this.m_iYMoveDropSpeedEx.Value = value;
      }
      
      private function get a_1438() : Boolean
      {
         if(!this.m_isCapturedEx)
         {
            this.m_isCapturedEx = new EncrypBooleanEx(false);
         }
         return this.m_isCapturedEx.Value;
      }
      
      private function set a_1438(value:Boolean) : void
      {
         if(!this.m_isCapturedEx)
         {
            this.m_isCapturedEx = new EncrypBooleanEx(false);
         }
         this.m_isCapturedEx.Value = value;
      }
      
      public function get globalID() : int
      {
         return this.m_iGlobalID;
      }
      
      public function a_1797(iGlobalID:int, iEnergyPower:int, numXpos:Number, numYpos:Number, iYMoveDropSpeed:int = 0, iWaitClickTime:int = 153) : Boolean
      {
         this.m_iGlobalID = iGlobalID;
         this.a_1434 = iEnergyPower;
         x = numXpos;
         y = numYpos;
         if(!this.m_stCurrentBattleField.isOwnBattleField)
         {
            x -= 35;
         }
         gotoAndStop(1);
         visible = true;
         this.a_1436 = iWaitClickTime;
         this.m_isClicked = false;
         this.a_1438 = false;
         this.m_numXSpeed = 0;
         this.m_numYSpeed = 0;
         this.a_1437 = iYMoveDropSpeed;
         addEventListener(MouseEvent.MOUSE_DOWN,this.a_4161);
         addEventListener(MouseEvent.MOUSE_OVER,this.a_4161);
         if(Boolean(this.m_stCurrentBattleField) && -1 == this.m_stCurrentBattleField.m_arrBaseEnergyVector.indexOf(this))
         {
            this.m_stCurrentBattleField.m_arrBaseEnergyVector.push(this);
         }
         return true;
      }
      
      public function a_4140(iCurrentTime:int) : void
      {
         this.a_4160(iCurrentTime);
      }
      
      public function a_4158() : Boolean
      {
         return this.a_3940();
      }
      
      public function a_4159(numXPos:Number, numYPos:Number, iMoveSpeed:int = 20, bIsMouseEnabled:Boolean = false) : Boolean
      {
         var iXDistance:int = 0;
         var iYDistance:int = 0;
         if(!this.m_isClicked)
         {
            this.m_isClicked = true;
            this.a_1438 = true;
            if(!bIsMouseEnabled)
            {
               removeEventListener(MouseEvent.MOUSE_DOWN,this.a_4161);
               removeEventListener(MouseEvent.MOUSE_OVER,this.a_4161);
            }
            iXDistance = numXPos - x;
            iYDistance = numYPos - y;
            this.a_1436 = Math.abs(iXDistance) > Math.abs(iYDistance) ? int(Math.abs(int(iXDistance / iMoveSpeed))) : int(Math.abs(int(iYDistance / iMoveSpeed)));
            this.m_numXSpeed = iXDistance / this.a_1436;
            this.m_numYSpeed = iYDistance / this.a_1436;
            BattleFieldView.a_1025.play();
         }
         return true;
      }
      
      protected function a_3940() : Boolean
      {
         var arrBaseEnergyVector:Vector.<a_4157> = null;
         visible = false;
         if(Boolean(parent) && parent.contains(this))
         {
            parent.removeChild(this);
         }
         if(this.m_stCurrentBattleField)
         {
            arrBaseEnergyVector = this.m_stCurrentBattleField.m_arrBaseEnergyVector as Vector.<a_4157>;
            if(-1 != arrBaseEnergyVector.indexOf(this))
            {
               arrBaseEnergyVector.splice(arrBaseEnergyVector.indexOf(this),1);
            }
            this.m_stCurrentBattleField = null;
         }
         return true;
      }
      
      private function a_4160(a_4730:int) : void
      {
         var stDataEvent:a_1778 = null;
         var iXGridNo:int = 0;
         var iYGridNo:int = 0;
         var stTargetFieldGrid:a_3491 = null;
         var iVx:int = 0;
         var iVy:int = 0;
         if(this.m_isClicked && this.a_1436 > 0)
         {
            x += this.m_numXSpeed;
            y += this.m_numYSpeed;
            --this.a_1436;
            if(0 >= this.a_1436)
            {
               if(!this.a_1438 && null != parent)
               {
                  stDataEvent = new a_1778("MoneyFlameClick");
                  stDataEvent.dataObject = this.a_1434;
                  if(root)
                  {
                     root.dispatchEvent(stDataEvent);
                  }
                  a_1088.a_2065(this.a_1434);
               }
               else if(this.a_1438 && null != parent)
               {
                  if(a_1283)
                  {
                     iXGridNo = BattleFieldView.a_1011 - 1 - int((x + 42) / a_3491.a_1080);
                  }
                  else
                  {
                     iXGridNo = int((x + 42) / a_3491.a_1080);
                  }
                  iYGridNo = int((y + 0) / a_3491.a_1081);
                  stTargetFieldGrid = this.m_stCurrentBattleField.a_3438(iXGridNo,iYGridNo);
                  if(stTargetFieldGrid != null && stTargetFieldGrid.m_stMouseObstacle != null)
                  {
                     stTargetFieldGrid.m_stMouseObstacle.PickEnergyPower(this.a_1434);
                  }
                  if(stTargetFieldGrid != null && stTargetFieldGrid.m_stPickFireObject != null)
                  {
                     stTargetFieldGrid.m_stPickFireObject.PickEnergyPower(this.a_1434);
                  }
               }
               this.a_3940();
            }
            return;
         }
         if(0 == this.a_1436 % 2)
         {
            nextFrame();
         }
         if(!this.m_isClicked && this.a_1436 > 140)
         {
            iVx = 0;
            iVy = -10 + 2 * (153 - this.a_1436);
            if(this.a_1437 > 0)
            {
               x += iVx;
               y += this.a_1437;
            }
            else
            {
               x += iVx;
               y += iVy;
            }
         }
         if(this.a_1436 > 0)
         {
            --this.a_1436;
            if(a_1273 == a_1274)
            {
               gotoAndStop(1);
            }
            return;
         }
         this.a_3940();
      }
      
      protected function a_4161(a_4730:Event) : void
      {
         var stRootLocalPoint:Point = null;
         removeEventListener(MouseEvent.MOUSE_DOWN,this.a_4161);
         removeEventListener(MouseEvent.MOUSE_OVER,this.a_4161);
         if(parent == null)
         {
            return;
         }
         var stGlobalPoint:Point = parent.localToGlobal(new Point(x,y));
         stRootLocalPoint = root.globalToLocal(stGlobalPoint);
         x = stRootLocalPoint.x;
         y = stRootLocalPoint.y;
         var stRootContainer:DisplayObjectContainer = root as DisplayObjectContainer;
         if(parent.contains(this))
         {
            parent.removeChild(this);
         }
         this.m_stCurrentBattleField.AddToBattleView(this,BattleLayerDefine.EFFECTS_TOP_TYPE);
         stRootContainer.addChild(this);
         var iXDistance:int = 172 - stRootLocalPoint.x;
         if(this.m_stCurrentBattleField.x < 300 || this.m_stCurrentBattleField.x > 450 && this.m_stCurrentBattleField.x < 800)
         {
            iXDistance = 1 - stRootLocalPoint.x;
         }
         var iYDistance:int = 5 - stRootLocalPoint.y;
         this.a_1436 = Math.abs(iXDistance) > Math.abs(iYDistance) ? int(Math.abs(int(iXDistance / 40))) : int(Math.abs(int(iYDistance / 40)));
         this.a_1436 = this.a_1436 > 30 ? 30 : this.a_1436;
         this.m_isClicked = true;
         this.a_1438 = false;
         this.m_numXSpeed = iXDistance / this.a_1436;
         this.m_numYSpeed = iYDistance / this.a_1436;
         BattleFieldView.a_1025.play();
      }
   }
}

