package com.aurora.ui.maogoutd.resource.defender
{
   import a_4715.EncrypIntEx;
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import flash.display.FrameLabel;
   
   public class HamburgerEaterSecondAttackFighter extends a_3953
   {
      
      private var m_iEatLifeValueEx:EncrypIntEx;
      
      private var m_MouseArr:Array = new Array(8388649,8392745,8389221,8388631,8388749,8388750,8392727,8388624,8388647,8388870,8388725,8388741,8388977,8388993,8389114,8389218,8389314,8393073,8393089,8393111);
      
      public function HamburgerEaterSecondAttackFighter()
      {
         super();
         this.m_iEatLifeValueEx = new EncrypIntEx(900);
         a_1095 = 150;
      }
      
      public static function a_3926() : a_3953
      {
         return PoolManager.getInstance().CheckOutOne(HamburgerEaterSecondAttackFighter) as HamburgerEaterSecondAttackFighter;
      }
      
      override protected function getBindMovie() : Class
      {
         return HamburgerEaterSecondAttackFighterMovie;
      }
      
      override public function a_1797(stFieldGrid:a_3491) : Boolean
      {
         super.a_1797(stFieldGrid);
         a_1309 = 800 - this.a_3965();
         a_1321 = 0;
         this.m_iEatLifeValueEx.Value = 900;
         return true;
      }
      
      override protected function a_3964() : int
      {
         return 70;
      }
      
      override public function a_3969(iRduceLifeValue:int) : Boolean
      {
         super.a_3969(iRduceLifeValue);
         return true;
      }
      
      override public function a_3957(iCurrentTime:int) : void
      {
         var stEffect:HamburgerFogEffect = null;
         if(iCurrentTime % 2 == 0)
         {
            super.a_3957(iCurrentTime);
         }
         if(iCurrentTime - a_1321 == a_1309 - 20 && 2 == a_1275)
         {
            a_1275 = 0;
            a_1307 = 1;
            gotoAndStop((a_1276[3] as FrameLabel).frame);
            stEffect = HamburgerFogEffect.a_3926();
            stEffect.InitData(stFieldGrid);
            stEffect.a_1797(false);
            stEffect.x = stFieldGrid.m_iXGridNo * a_3491.a_1080 - 90;
            stEffect.y = stFieldGrid.m_iYGridNo * a_3491.a_1081 - 32;
            stFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(stEffect,BattleLayerDefine.SHOT_TYPE,stFieldGrid);
            stFieldGrid.m_stCurrentBattbleFieldView.m_arrEffectArray.push(stEffect);
         }
      }
      
      private function CheckMouse(iNoX:int, iNoY:int) : Boolean
      {
         var stMoveIntruder:a_4206 = null;
         var stNextField:a_3491 = a_1334.m_stCurrentBattbleFieldView.a_3438(iNoX,iNoY);
         if(stNextField == null)
         {
            return false;
         }
         var arrMoveIntruder:Array = stNextField.a_1511.slice();
         for each(stMoveIntruder in arrMoveIntruder)
         {
            if(0 == stMoveIntruder.iSpaceState && !stMoveIntruder.IsBossIntruder)
            {
               if(!(this.m_MouseArr.indexOf(stMoveIntruder.m_stMoveIntruderTypeID) != -1 || stMoveIntruder.isCannotSeeByInsurance || stMoveIntruder.isGoHeadNotEatDefense || stMoveIntruder.isCannotSeeByFighter))
               {
                  return true;
               }
            }
         }
         return false;
      }
      
      override public function a_3954(iCurrentTime:int) : Boolean
      {
         var iNoX:int = 0;
         var iNoY:int = 0;
         if(iCurrentTime > m_iPlaceTimeIntervals + a_1308 && iCurrentTime > a_1321 + a_1309)
         {
            iNoX = a_1334.m_iXGridNo;
            iNoY = a_1334.m_iYGridNo;
            if(this.CheckMouse(iNoX,iNoY) || this.CheckMouse(iNoX + 1,iNoY) || this.CheckMouse(iNoX + 2,iNoY) || this.CheckMouse(iNoX + 3,iNoY))
            {
               a_1321 = iCurrentTime;
               a_1275 = 2;
               gotoAndStop((a_1276[1] as FrameLabel).frame);
            }
         }
         if(iCurrentTime - a_1321 == 10)
         {
            this.AttractMouseToFrontGrid();
         }
         return true;
      }
      
      private function AttractMouseToFrontGrid() : void
      {
         var stCheckFieldGrid:a_3491 = null;
         var stMoveIntruder:a_4206 = null;
         var stTargetFieldGrid:a_3491 = a_1334;
         var hasEatenMouse:Boolean = false;
         for(var i:int = 0; i <= 3; i++)
         {
            stCheckFieldGrid = a_1334.m_stCurrentBattbleFieldView.a_3438(a_1334.m_iXGridNo + i,a_1334.m_iYGridNo);
            if(null != stCheckFieldGrid)
            {
               for each(stMoveIntruder in stCheckFieldGrid.a_1511.slice())
               {
                  if(this.Attach2Here(stMoveIntruder))
                  {
                     hasEatenMouse = true;
                  }
               }
            }
         }
         if(hasEatenMouse)
         {
            BattleFieldView.a_1034.play();
         }
      }
      
      private function Attach2Here(stMoveIntruder:a_4206) : Boolean
      {
         if(stMoveIntruder.IsBossIntruder)
         {
            return false;
         }
         if(stMoveIntruder.isCannotSeeByFighter)
         {
            return false;
         }
         if(stMoveIntruder.iLifeValue < 0)
         {
            return false;
         }
         if(0 != stMoveIntruder.iSpaceState)
         {
            return false;
         }
         if(this.m_MouseArr.indexOf(stMoveIntruder.m_stMoveIntruderTypeID) != -1)
         {
            return false;
         }
         if(stMoveIntruder.isCannotSeeByInsurance)
         {
            return false;
         }
         if(stMoveIntruder.isGoHeadNotEatDefense)
         {
            return false;
         }
         stFieldGrid.a_3457(stMoveIntruder);
         stFieldGrid.m_stCurrentBattbleFieldView.a_3457(stMoveIntruder);
         var arrBaseMoveIntruderVector:Array = stFieldGrid.m_stCurrentBattbleFieldView.m_arrBaseMoveIntruderVector;
         if(-1 != arrBaseMoveIntruderVector.indexOf(stMoveIntruder))
         {
            arrBaseMoveIntruderVector.splice(arrBaseMoveIntruderVector.indexOf(stMoveIntruder),1);
         }
         stFieldGrid.m_stCurrentBattbleFieldView.a_3459(stMoveIntruder,stFieldGrid,false);
         stMoveIntruder.x = a_3491.a_1080 * (stFieldGrid.m_iXGridNo + 0.8);
         stMoveIntruder.a_4211(this.m_iEatLifeValueEx.Value);
         return true;
      }
      
      override protected function a_3965() : int
      {
         var iStarDegreeEffect:int = 0;
         if(a_1094 <= 3)
         {
            iStarDegreeEffect = 1 * a_1094;
         }
         else if(a_1094 > 3 && a_1094 <= 6)
         {
            iStarDegreeEffect = 1 * 3 + 2 * (a_1094 - 3);
         }
         else if(a_1094 > 6 && a_1094 <= 9)
         {
            iStarDegreeEffect = 1 * 3 + 2 * 3 + 3 * (a_1094 - 6);
         }
         else if(a_1094 > 9 && a_1094 <= 13)
         {
            iStarDegreeEffect = 1 * 3 + 2 * 3 + 3 * 3 + 4 * (a_1094 - 9);
         }
         else if(a_1094 == 14)
         {
            iStarDegreeEffect = 36;
         }
         else if(a_1094 == 15)
         {
            iStarDegreeEffect = 38;
         }
         else if(a_1094 == 16)
         {
            iStarDegreeEffect = 39;
         }
         return 20 * iStarDegreeEffect;
      }
   }
}

