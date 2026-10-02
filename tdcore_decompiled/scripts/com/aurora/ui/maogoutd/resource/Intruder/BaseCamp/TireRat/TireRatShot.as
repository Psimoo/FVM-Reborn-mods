package com.aurora.ui.maogoutd.resource.Intruder.BaseCamp.TireRat
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.shot.a_4348;
   import flash.display.FrameLabel;
   
   public class TireRatShot extends a_4348
   {
      
      private var a_1598:a_3491;
      
      private var BoomDefense:Array = new Array(286458144,294846544,286457950,286457951,286394688,286394702,286394703);
      
      public function TireRatShot()
      {
         super();
         m_iYDisplayCenterPos = -29.2;
         a_1588 = true;
         a_1275 = 0;
         a_1587 = 0;
         a_1578 = true;
      }
      
      public static function a_4344() : a_4348
      {
         return PoolManager.getInstance().CheckOutOne(TireRatShot) as TireRatShot;
      }
      
      override protected function getBindMovie() : Class
      {
         return TireRatShotMovie;
      }
      
      override public function a_1797(iGlobalID:int, numSpeed:Number, iHurtPower:int, iXpos:int, iYpos:int, stCurrentBattleView:BattleFieldView, stStartFieldGrid:a_3491, isBothWayShot:Boolean = false, numHotMultiplier:Number = 1, iThreeRowShotType:int = 0) : Boolean
      {
         super.a_1797(iGlobalID,numSpeed,iHurtPower,iXpos,iYpos,stCurrentBattleView,stStartFieldGrid,isBothWayShot,numHotMultiplier);
         a_1447 = 0;
         m_numYSpeed = 0;
         m_numXSpeed = m_numXSpeed;
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
               a_3940();
            }
            return;
         }
         if(a_1588)
         {
            nextFrame();
            if(a_1273 == a_1276[0].frame - 1 || a_1278 != null)
            {
               a_1275 = 1;
               gotoAndStop((a_1276[a_1275] as FrameLabel).frame);
            }
            if(a_1273 == a_1274 || a_1278 != null)
            {
               a_1275 = 1;
               gotoAndStop((a_1276[a_1275] as FrameLabel).frame);
            }
         }
         if(0 == a_1447)
         {
            a_1447 = iCurrentTime;
         }
         this.a_4373();
         x += m_numXSpeed;
         y += m_numYSpeed;
      }
      
      private function a_4373() : void
      {
         var iXGridNo:int = 0;
         var stFieldGrid:a_3491 = null;
         if(a_1283)
         {
            iXGridNo = BattleFieldView.a_1011 - 1 - int(x / a_3491.a_1080);
         }
         else
         {
            iXGridNo = int(x / a_3491.a_1080);
         }
         var xx:int = int(y / a_3491.a_1081);
         var iYGridNo:int = m_iYGridNo;
         if(x < 0 || x >= BattleFieldView.a_1013 || y + 30 > a_3491.a_1081 * (m_iYGridNo + 1))
         {
            a_3940();
            return;
         }
         stFieldGrid = a_1583.a_3438(iXGridNo,iYGridNo);
         if(stFieldGrid != null && stFieldGrid.a_3492())
         {
            m_isHited = true;
            if(null != stFieldGrid.m_stBoomDefense && this.BoomDefense.indexOf(stFieldGrid.m_stBoomDefense.a_3512()) != -1)
            {
               trace("无法秒杀鱼刺..");
            }
            else
            {
               stFieldGrid.ClearFieldGridDefenseNoraml();
            }
         }
      }
   }
}

