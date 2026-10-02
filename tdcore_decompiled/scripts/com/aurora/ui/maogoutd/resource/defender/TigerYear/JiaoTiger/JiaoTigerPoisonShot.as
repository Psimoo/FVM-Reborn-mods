package com.aurora.ui.maogoutd.resource.defender.TigerYear.JiaoTiger
{
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.shot.a_4348;
   import flash.display.FrameLabel;
   
   public class JiaoTigerPoisonShot extends a_4348
   {
      
      private static var ms_stJiaoTigerPoisonShotVector:Array = new Array();
      
      private var m_HurtTimes:int;
      
      private var m_BurnTimes:int;
      
      private var m_iContinueTick:int = 0;
      
      private var appearedTimes:int = 0;
      
      private var m_iCount:int;
      
      public function JiaoTigerPoisonShot()
      {
         super();
         a_1279 = -50;
         a_1573 = 1;
         a_1588 = true;
         a_1275 = 0;
         a_1587 = 0;
      }
      
      public static function a_4344() : a_4348
      {
         var stJiaoTigerPoisonShot:JiaoTigerPoisonShot = ms_stJiaoTigerPoisonShotVector.pop();
         if(null == stJiaoTigerPoisonShot)
         {
            stJiaoTigerPoisonShot = new JiaoTigerPoisonShot();
         }
         return stJiaoTigerPoisonShot;
      }
      
      override protected function a_3940() : Boolean
      {
         super.a_3940();
         if(-1 == ms_stJiaoTigerPoisonShotVector.indexOf(this))
         {
            ms_stJiaoTigerPoisonShotVector.push(this);
         }
         this.m_iContinueTick = 0;
         return true;
      }
      
      override protected function getBindMovie() : Class
      {
         return JiaoTigerPoisonShotMovie;
      }
      
      override public function a_1797(iGlobalID:int, numSpeed:Number, iHurtPower:int, iXpos:int, iYpos:int, stCurrentBattleView:BattleFieldView, stStartFieldGrid:a_3491, isBothWayShot:Boolean = false, numHotMultiplier:Number = 1, iThreeRowShotType:int = 0) : Boolean
      {
         super.a_1797(iGlobalID,numSpeed,iHurtPower,iXpos,iYpos - 10,stCurrentBattleView,stStartFieldGrid,isBothWayShot,numHotMultiplier);
         this.m_iCount = 0;
         this.m_HurtTimes = 5;
         this.m_BurnTimes = 8 * 20;
         this.appearedTimes = 0;
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
         if(iCurrentTime - this.appearedTimes >= this.m_BurnTimes)
         {
            this.a_3940();
            return;
         }
         if((iCurrentTime - this.appearedTimes) % (this.m_BurnTimes / this.m_HurtTimes) == 0)
         {
            this.a_4360();
         }
      }
      
      private function a_4360() : void
      {
         ++this.m_iCount;
         trace("m_iCount:" + this.m_iCount);
         if(this.m_iCount <= 5)
         {
            this.AttackMoveIntruder();
         }
      }
      
      private function AttackMoveIntruder() : void
      {
         var stMoveIntruder:a_4206 = null;
         if(a_1584 != null)
         {
            for each(stMoveIntruder in a_1584.a_1511.slice())
            {
               if(0 == stMoveIntruder.iSpaceState)
               {
                  a_4352(stMoveIntruder);
               }
            }
         }
      }
   }
}

