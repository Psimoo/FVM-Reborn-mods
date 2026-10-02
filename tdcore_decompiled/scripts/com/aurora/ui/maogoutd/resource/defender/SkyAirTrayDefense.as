package com.aurora.ui.maogoutd.resource.defender
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.a_3491;
   import flash.display.FrameLabel;
   
   public class SkyAirTrayDefense extends a_3976
   {
      
      private var m_iStartTime:int = -1;
      
      public function SkyAirTrayDefense()
      {
         super();
         a_1095 = 25;
         a_1338 = 5;
         a_1281 = false;
         m_iToolType = 2;
      }
      
      public static function a_3926() : a_3976
      {
         return PoolManager.getInstance().CheckOutOne(SkyAirTrayDefense) as SkyAirTrayDefense;
      }
      
      override protected function getBindMovie() : Class
      {
         return SkyAirTrayDefenseMovie;
      }
      
      override public function a_1797(stFieldGrid:a_3491) : Boolean
      {
         super.a_1797(stFieldGrid);
         a_1339 = this.a_3965();
         this.m_iStartTime = -1;
         return true;
      }
      
      override protected function a_3964() : int
      {
         return 100 - this.a_3966();
      }
      
      override public function a_3969(iRduceLifeValue:int) : Boolean
      {
         super.a_3969(iRduceLifeValue);
         if(a_1339 > 600)
         {
            a_1275 = 0;
         }
         else if(a_1339 > 200)
         {
            a_1275 = 1;
         }
         else if(a_1339 > 0)
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
      
      override protected function a_3965() : int
      {
         var iStarDegreeEffect:int = 3600;
         switch(a_1094)
         {
            case 0:
               iStarDegreeEffect = 3600;
               break;
            case 1:
               iStarDegreeEffect = 3800;
               break;
            case 2:
               iStarDegreeEffect = 4000;
               break;
            case 3:
               iStarDegreeEffect = 4200;
               break;
            case 4:
               iStarDegreeEffect = 4500;
               break;
            case 5:
               iStarDegreeEffect = 4800;
               break;
            case 6:
               iStarDegreeEffect = 5100;
               break;
            case 7:
               iStarDegreeEffect = 5700;
               break;
            case 8:
               iStarDegreeEffect = 6300;
               break;
            case 9:
               iStarDegreeEffect = 6900;
               break;
            case 10:
               iStarDegreeEffect = 7700;
               break;
            case 11:
               iStarDegreeEffect = 8500;
               break;
            case 12:
               iStarDegreeEffect = 9300;
               break;
            case 13:
               iStarDegreeEffect = 10100;
               break;
            case 14:
               iStarDegreeEffect = 10900;
               break;
            case 15:
               iStarDegreeEffect = 11700;
               break;
            case 16:
               iStarDegreeEffect = 12500;
         }
         return iStarDegreeEffect;
      }
      
      override protected function a_3966() : int
      {
         return 10 * m_iSkillDegree;
      }
   }
}

