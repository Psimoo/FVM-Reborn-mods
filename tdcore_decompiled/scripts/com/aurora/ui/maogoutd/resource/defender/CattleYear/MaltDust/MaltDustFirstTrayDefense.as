package com.aurora.ui.maogoutd.resource.defender.CattleYear.MaltDust
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.defender.a_3976;
   import flash.display.FrameLabel;
   
   public class MaltDustFirstTrayDefense extends a_3976
   {
      
      private var m_iStartTime:int = -1;
      
      private var m_Max_Life:int = 0;
      
      public function MaltDustFirstTrayDefense()
      {
         super();
         a_1095 = 0;
         a_1338 = 9;
         a_1279 = -3;
         m_iYDisplayCenterPos = 0;
         a_1281 = false;
         m_iToolType = 2;
      }
      
      public static function a_3926() : a_3976
      {
         return PoolManager.getInstance().CheckOutOne(MaltDustFirstTrayDefense) as MaltDustFirstTrayDefense;
      }
      
      override protected function getBindMovie() : Class
      {
         return MaltDustFirstTrayDefenseMovie;
      }
      
      override public function a_1797(stFieldGrid:a_3491) : Boolean
      {
         super.a_1797(stFieldGrid);
         a_1339 = MaltDustDefense.a_3965(a_1094);
         this.m_Max_Life = MaltDustDefense.a_3965(a_1094);
         a_1275 = 1;
         gotoAndStop((a_1276[0] as FrameLabel).frame);
         this.m_iStartTime = -1;
         return true;
      }
      
      override protected function a_3964() : int
      {
         return MaltDustDefense.a_3964(m_iSkillDegree);
      }
      
      override public function a_3969(iRduceLifeValue:int) : Boolean
      {
         super.a_3969(iRduceLifeValue);
         if(a_1339 > this.m_Max_Life * 0.1)
         {
            a_1275 = 1;
         }
         else if(a_1339 > 200)
         {
            a_1275 = 2;
         }
         return true;
      }
      
      override public function a_3957(iCurrentTime:int) : void
      {
         if(iCurrentTime % 2 == 0)
         {
            nextFrame();
            if(a_1278 != null || a_1273 == a_1274)
            {
               gotoAndStop((a_1276[a_1275] as FrameLabel).frame);
            }
            if(a_1336)
            {
               a_1336.a_3957(iCurrentTime);
            }
            if(m_stFrozenCardEffect)
            {
               m_stFrozenCardEffect.a_3957(iCurrentTime);
            }
            if(m_stShiHuaEffect)
            {
               m_stShiHuaEffect.a_3957(iCurrentTime);
            }
         }
         if(this.m_iStartTime < 0)
         {
            this.m_iStartTime = iCurrentTime;
         }
         if(iCurrentTime - this.m_iStartTime > 24000)
         {
            this.a_3969(a_1339);
         }
      }
   }
}

