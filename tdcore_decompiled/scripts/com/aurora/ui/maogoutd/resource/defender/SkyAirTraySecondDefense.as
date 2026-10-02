package com.aurora.ui.maogoutd.resource.defender
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import flash.display.FrameLabel;
   
   public class SkyAirTraySecondDefense extends a_3976
   {
      
      private var m_iStartTime:int = -1;
      
      public function SkyAirTraySecondDefense()
      {
         super();
         a_1095 = 0;
         a_1338 = 5;
         a_1281 = false;
         m_iToolType = 2;
      }
      
      public static function a_3926() : a_3976
      {
         return PoolManager.getInstance().CheckOutOne(SkyAirTraySecondDefense) as SkyAirTraySecondDefense;
      }
      
      override protected function getBindMovie() : Class
      {
         return SkyAirTraySecondDefenseMovie;
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
      
      private function ChangeFrameIfNeed(index:int) : void
      {
         var frame:int = 0;
         if(a_1275 != index)
         {
            a_1275 = index;
            frame = (a_1276[index] as FrameLabel).frame;
            gotoAndStop(frame);
         }
      }
      
      override public function a_3969(iRduceLifeValue:int) : Boolean
      {
         if(Boolean(a_1339 - iRduceLifeValue <= 0 && m_iDieType == 1) && Boolean(a_1334) && a_1334.m_hasFireEffect)
         {
            this.ChangeFrameIfNeed(3);
            a_1339 = 1;
            return true;
         }
         super.a_3969(iRduceLifeValue);
         if(a_1339 > 600)
         {
            this.ChangeFrameIfNeed(0);
         }
         else if(a_1339 > 200)
         {
            this.ChangeFrameIfNeed(1);
         }
         else if(a_1339 > 0)
         {
            this.ChangeFrameIfNeed(2);
         }
         return true;
      }
      
      override public function a_3957(iCurrentTime:int) : void
      {
         if(iCurrentTime % 2 == 0)
         {
            nextFrame();
            if(a_1278 != null)
            {
               gotoAndStop((a_1276[a_1275] as FrameLabel).frame);
            }
            if(a_1273 == a_1274 - 5)
            {
               this.a_4210();
               return;
            }
            if(a_1273 == a_1274)
            {
               super.a_3969(a_1339);
               return;
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
         if(iCurrentTime - this.m_iStartTime == 24000)
         {
            this.a_3969(a_1339);
         }
      }
      
      public function a_4210() : void
      {
         var stMoveIntruder:a_4206 = null;
         if(a_1334 == null)
         {
            return;
         }
         var arrMoveIntruder:Array = stFieldGrid.a_1511.slice();
         for each(stMoveIntruder in arrMoveIntruder)
         {
            stMoveIntruder.a_4210();
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
         return iStarDegreeEffect * 10;
      }
      
      override protected function a_3966() : int
      {
         return 10 * m_iSkillDegree;
      }
   }
}

