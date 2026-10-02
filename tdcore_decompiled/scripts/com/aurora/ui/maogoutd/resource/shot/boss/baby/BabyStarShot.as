package com.aurora.ui.maogoutd.resource.shot.boss.baby
{
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.shot.a_4348;
   import com.aurora.ui.maogoutd.resource.shot.boss.BaseBossShot;
   
   public class BabyStarShot extends BaseBossShot
   {
      
      private static var ms_arrShot:Array = new Array();
      
      private var m_iAttackTimes:int;
      
      public function BabyStarShot()
      {
         super();
      }
      
      public static function a_4344() : a_4348
      {
         var stBaseShot:a_4348 = null;
         stBaseShot = ms_arrShot.pop();
         if(null == stBaseShot)
         {
            stBaseShot = new BabyStarShot();
         }
         stBaseShot.visible = true;
         BattleFieldView.a_1017.play();
         return stBaseShot;
      }
      
      override protected function getBindMovie() : Class
      {
         return BabyStarShotMovie;
      }
      
      override public function a_1797(iGlobalID:int, numSpeed:Number, iHurtPower:int, iXpos:int, iYpos:int, stCurrentBattleView:BattleFieldView, stStartFieldGrid:a_3491, isBothWayShot:Boolean = false, numHotMultiplier:Number = 1, iThreeRowShotType:int = 0) : Boolean
      {
         super.a_1797(iGlobalID,numSpeed,iHurtPower,iXpos,iYpos,stCurrentBattleView,stStartFieldGrid,isBothWayShot,numHotMultiplier);
         m_numXSpeed = m_numYSpeed = 0;
         this.m_iAttackTimes = 0;
         return true;
      }
      
      override public function a_4216(iCurrentTime:int) : void
      {
         if(iCurrentTime & 1)
         {
            return;
         }
         if(1 == a_1273)
         {
            ClearFieldGrid(a_1584.m_iXGridNo,a_1584.m_iYGridNo,true);
         }
         nextFrame();
         x += m_numXSpeed;
         y += m_numYSpeed;
         if(null != a_1278)
         {
            ++this.m_iAttackTimes;
            ClearFieldGrid(a_1584.m_iXGridNo - 3 * this.m_iAttackTimes,a_1584.m_iYGridNo,true);
         }
         else if(a_1273 == a_1274)
         {
            this.a_3940();
         }
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
   }
}

