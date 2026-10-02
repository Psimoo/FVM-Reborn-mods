package com.aurora.ui.maogoutd.resource.shot.boss.hulk
{
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.shot.boss.BaseBossShot;
   
   public class HulkPunchShot extends BaseBossShot
   {
      
      private static var ms_arrShot:Array = new Array();
      
      private var m_iAttackTimes:int;
      
      private var m_iStartXGridNo:int;
      
      private var m_iStartYGridNo:int;
      
      public function HulkPunchShot()
      {
         super();
         m_bIsInvincible = true;
         a_1279 = -15 - a_3491.a_1080 * 0.5;
         fYShift = -186;
      }
      
      public static function a_4344() : HulkPunchShot
      {
         var stBaseShot:HulkPunchShot = null;
         stBaseShot = ms_arrShot.pop();
         if(null == stBaseShot)
         {
            stBaseShot = new HulkPunchShot();
         }
         stBaseShot.visible = true;
         return stBaseShot;
      }
      
      override protected function a_3940() : Boolean
      {
         super.a_3940();
         if(-1 == ms_arrShot.indexOf(this))
         {
            ms_arrShot.push(this);
         }
         return true;
      }
      
      override protected function getBindMovie() : Class
      {
         return HulkPunchShotMovie;
      }
      
      override public function a_1797(iGlobalID:int, numSpeed:Number, iHurtPower:int, iXpos:int, iYpos:int, stCurrentBattleView:BattleFieldView, stStartFieldGrid:a_3491, isBothWayShot:Boolean = false, numHotMultiplier:Number = 1, iThreeRowShotType:int = 0) : Boolean
      {
         super.a_1797(iGlobalID,numSpeed,iHurtPower,iXpos,iYpos,stCurrentBattleView,stStartFieldGrid,isBothWayShot,numHotMultiplier);
         m_numXSpeed = m_numYSpeed = 0;
         this.m_iAttackTimes = 0;
         this.m_iStartXGridNo = stStartFieldGrid.m_iXGridNo;
         this.m_iStartYGridNo = stStartFieldGrid.m_iYGridNo;
         return true;
      }
      
      override public function a_4216(iCurrentTime:int) : void
      {
         var iLimitYGridNo:int = 0;
         var iYGridNo:* = 0;
         if(iCurrentTime & 1)
         {
            return;
         }
         nextFrame();
         if(2 == a_1273 || 6 == a_1273 || 9 == a_1273)
         {
            iLimitYGridNo = Math.max(0,this.m_iStartYGridNo - 2);
            for(iYGridNo = this.m_iStartYGridNo; iYGridNo >= iLimitYGridNo; iYGridNo--)
            {
               ClearFieldGrid(this.m_iStartXGridNo - this.m_iAttackTimes,iYGridNo);
            }
            ++this.m_iAttackTimes;
         }
         else if(a_1273 == a_1274)
         {
            this.a_3940();
         }
      }
   }
}

