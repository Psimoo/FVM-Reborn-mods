package com.aurora.ui.maogoutd.resource.shot
{
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import flash.display.FrameLabel;
   
   public class ResidualFlameShot extends a_4348
   {
      
      private static var ms_stResidualFlameShotVector:Array = new Array();
      
      private var m_targetField:a_3491;
      
      private var appearedTimes:int = 0;
      
      public var m_GemoLevel:int = -1;
      
      private var m_HurtTimes:int;
      
      private var m_BurnTimes:int;
      
      private var m_startBurn:int;
      
      private var m_iCount:int;
      
      public function ResidualFlameShot()
      {
         super();
         a_1279 = -width * 0.5;
         a_1588 = true;
      }
      
      public static function a_4344() : a_4348
      {
         var stResidualFlameShot:ResidualFlameShot = ms_stResidualFlameShotVector.pop();
         if(null == stResidualFlameShot)
         {
            stResidualFlameShot = new ResidualFlameShot();
         }
         BattleFieldView.a_1017.play();
         return stResidualFlameShot;
      }
      
      override protected function getBindMovie() : Class
      {
         return ResidualFlameShotMovie;
      }
      
      override public function a_1797(iGlobalID:int, numSpeed:Number, iHurtPower:int, iXpos:int, iYpos:int, stCurrentBattleView:BattleFieldView, stStartFieldGrid:a_3491, isBothWayShot:Boolean = false, numHotMultiplier:Number = 1, iThreeRowShotType:int = 0) : Boolean
      {
         super.a_1797(iGlobalID,numSpeed,iHurtPower,iXpos,iYpos,stCurrentBattleView,stStartFieldGrid,isBothWayShot,numHotMultiplier);
         this.m_iCount = 0;
         this.m_HurtTimes = this.GetSkillBurtSecond();
         this.m_BurnTimes = this.GetSkillBurtTime();
         this.appearedTimes = 0;
         return true;
      }
      
      override protected function a_3940() : Boolean
      {
         super.a_3940();
         if(-1 == ms_stResidualFlameShotVector.indexOf(this))
         {
            ms_stResidualFlameShotVector.push(this);
         }
         return true;
      }
      
      override public function a_4216(iCurrentTime:int) : void
      {
         if(m_isHited)
         {
            nextFrame();
            if(a_1273 == a_1274 || a_1278 != null)
            {
               m_bActive.Value = false;
               this.a_3940();
            }
            return;
         }
         if(a_1588)
         {
            nextFrame();
            if(a_1273 == a_1274 || a_1278 != null)
            {
               gotoAndStop((a_1276[a_1275] as FrameLabel).frame);
            }
         }
         if(this.appearedTimes == 0)
         {
            this.appearedTimes = iCurrentTime;
         }
         var arr:Array = a_1276;
         if(a_1273 == 6)
         {
            a_1275 = 1;
            gotoAndStop((a_1276[1] as FrameLabel).frame);
         }
         if(a_1273 == 22)
         {
            a_1275 = 1;
            gotoAndStop((a_1276[1] as FrameLabel).frame);
         }
         if(iCurrentTime - this.appearedTimes >= this.m_BurnTimes && a_1275 != 2)
         {
            m_isHited = true;
            a_1275 = 2;
            gotoAndStop((a_1276[2] as FrameLabel).frame);
         }
         if((iCurrentTime - this.m_startBurn) % int(this.m_BurnTimes / this.m_HurtTimes) == 0)
         {
            this.a_4360();
         }
      }
      
      private function a_4360() : void
      {
         var stMoveIntruder:a_4206 = null;
         var iReduceLife:int = 0;
         ++this.m_iCount;
         trace("m_iCount:" + this.m_iCount);
         var arrMoveIntruder:Array = a_1584.a_1511.slice();
         for each(stMoveIntruder in arrMoveIntruder)
         {
            iReduceLife = a_1579;
            stMoveIntruder.a_4209(iReduceLife);
         }
      }
      
      private function GetSkillBurtSecond() : int
      {
         var iEffectValue:int = 1;
         switch(this.m_GemoLevel)
         {
            case 0:
               iEffectValue = 2;
               break;
            case 1:
               iEffectValue = 2;
               break;
            case 2:
               iEffectValue = 2;
               break;
            case 3:
               iEffectValue = 3;
               break;
            case 4:
               iEffectValue = 3;
               break;
            case 5:
               iEffectValue = 3;
               break;
            case 6:
               iEffectValue = 4;
               break;
            case 7:
               iEffectValue = 4;
               break;
            case 8:
               iEffectValue = 4;
               break;
            case 9:
               iEffectValue = 5;
               break;
            case 10:
               iEffectValue = 6;
         }
         return iEffectValue;
      }
      
      private function GetSkillBurtTime() : int
      {
         var iEffectValue:int = 2;
         switch(this.m_GemoLevel)
         {
            case 0:
               iEffectValue = 3;
               break;
            case 1:
               iEffectValue = 3;
               break;
            case 2:
               iEffectValue = 4;
               break;
            case 3:
               iEffectValue = 4;
               break;
            case 4:
               iEffectValue = 5;
               break;
            case 5:
               iEffectValue = 5;
               break;
            case 6:
               iEffectValue = 6;
               break;
            case 7:
               iEffectValue = 7;
               break;
            case 8:
               iEffectValue = 8;
               break;
            case 9:
               iEffectValue = 9;
               break;
            case 10:
               iEffectValue = 10;
         }
         return iEffectValue * 20;
      }
   }
}

