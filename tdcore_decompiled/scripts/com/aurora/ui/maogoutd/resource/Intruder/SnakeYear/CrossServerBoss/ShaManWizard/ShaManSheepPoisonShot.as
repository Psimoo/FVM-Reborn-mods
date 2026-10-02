package com.aurora.ui.maogoutd.resource.Intruder.SnakeYear.CrossServerBoss.ShaManWizard
{
   import a_4718.b_183;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.avatar.a_3924;
   import com.aurora.ui.maogoutd.resource.shot.a_4348;
   import flash.display.FrameLabel;
   
   public class ShaManSheepPoisonShot extends a_4348
   {
      
      private static var ms_stShaManSheepPoisonShotVector:Array = new Array();
      
      public var CONTINUE_TICK:int = 160;
      
      private var m_iContinueTick:int = 0;
      
      public function ShaManSheepPoisonShot()
      {
         super();
         a_1279 = 0;
         a_1573 = 1;
         a_1588 = true;
         a_1304 = b_183.enm_Poison;
         a_1275 = 0;
      }
      
      public static function a_4344() : ShaManSheepPoisonShot
      {
         var stShaManSheepPoisonShot:ShaManSheepPoisonShot = ms_stShaManSheepPoisonShotVector.pop();
         if(null == stShaManSheepPoisonShot)
         {
            stShaManSheepPoisonShot = new ShaManSheepPoisonShot();
         }
         return stShaManSheepPoisonShot;
      }
      
      override protected function a_3940() : Boolean
      {
         super.a_3940();
         if(-1 == ms_stShaManSheepPoisonShotVector.indexOf(this))
         {
            ms_stShaManSheepPoisonShotVector.push(this);
         }
         this.m_iContinueTick = 0;
         return true;
      }
      
      override protected function getBindMovie() : Class
      {
         return ShaManSheepPoisonShotMovie;
      }
      
      override public function a_1797(iGlobalID:int, numSpeed:Number, iHurtPower:int, iXpos:int, iYpos:int, stCurrentBattleView:BattleFieldView, stStartFieldGrid:a_3491, isBothWayShot:Boolean = false, numHotMultiplier:Number = 1, iThreeRowShotType:int = 0) : Boolean
      {
         super.a_1797(iGlobalID,numSpeed,iHurtPower,iXpos,iYpos - 10,stCurrentBattleView,stStartFieldGrid,isBothWayShot,numHotMultiplier);
         a_1447 = 0;
         gotoAndStop(1);
         this.m_iContinueTick = this.CONTINUE_TICK;
         return true;
      }
      
      override public function a_4216(iCurrentTime:int) : void
      {
         if(a_1588)
         {
            nextFrame();
            if(a_1273 == a_1274 || a_1278 != null)
            {
               gotoAndStop((a_1276[a_1275] as FrameLabel).frame);
            }
         }
         if(this.m_iContinueTick > 0)
         {
            this.AttackMoveIntruder();
            --this.m_iContinueTick;
         }
         else if(a_1273 == a_1274 - 1)
         {
            this.a_3940();
         }
      }
      
      private function AttackMoveIntruder() : void
      {
         if(this.m_iContinueTick == 0)
         {
            return;
         }
         if(this.m_iContinueTick == 1 || this.m_iContinueTick % 20 == 0)
         {
            this.HitBaseDefence();
         }
      }
      
      private function HitBaseDefence() : void
      {
         this.SuputingHurt(a_1584,a_1579);
      }
      
      private function SuputingHurt(stFieldGrid:a_3491, value:int) : void
      {
         if(null != stFieldGrid.m_stProtector)
         {
            stFieldGrid.m_stProtector.a_3969(value);
         }
         if(null != stFieldGrid.m_stAttackFighter && !(stFieldGrid.m_stAttackFighter is a_3924))
         {
            stFieldGrid.m_stAttackFighter.a_3969(value);
         }
         if(null != stFieldGrid.m_stBoomDefense)
         {
            stFieldGrid.m_stBoomDefense.a_3969(value);
         }
         if(null != stFieldGrid.m_stFlowerDefense)
         {
            stFieldGrid.m_stFlowerDefense.a_3969(value);
         }
         if(stFieldGrid.HasNewSlot())
         {
            stFieldGrid.DamageNewSlot(true,0,false,value,-1);
         }
         if(null != stFieldGrid.m_stBaseAuxiliaryFighter)
         {
            stFieldGrid.m_stBaseAuxiliaryFighter.a_3969(value);
         }
         if(null != stFieldGrid.m_stTrayDefense)
         {
            stFieldGrid.m_stTrayDefense.a_3969(value);
         }
      }
   }
}

