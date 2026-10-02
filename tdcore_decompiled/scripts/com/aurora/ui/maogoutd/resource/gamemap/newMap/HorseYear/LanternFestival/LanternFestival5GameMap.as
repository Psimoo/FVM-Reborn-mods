package com.aurora.ui.maogoutd.resource.gamemap.newMap.HorseYear.LanternFestival
{
   import com.aurora.ui.maogoutd.resource.gamemap.a_4187;
   
   public class LanternFestival5GameMap extends LanternFestivalBaseGameMap
   {
      
      private static var a_1445:a_4187 = new a_4187();
      
      public function LanternFestival5GameMap()
      {
         super();
         a_1445.m_iBattleFieldStageType = 0;
         a_1445.m_iBattleModType = 0;
         a_1445.m_iWeatherType = 0;
         m_OutArray = [[2,0],[1,1],[6,0],[7,1],[1,5],[2,6],[6,6],[7,5]];
         m_TotalObstaclePos = [];
         m_arrPot = [[7,0,null],[6,1,null],[6,5,null],[7,6,null]];
      }
      
      override public function a_4176() : a_4187
      {
         return a_1445;
      }
      
      override public function OnTimeInterval(iTimeNum:uint) : void
      {
         var idx:int = 0;
         if(iTimeNum == 1)
         {
            CreateRice(2,1);
            CreateRice(2,5);
         }
         else if(iTimeNum != 0 && iTimeNum % (20 * 35) == 0)
         {
            idx = int(m_stRandomSeed.nextInt(4));
            if(idx == 0)
            {
               CreateRice(1,0);
            }
            else if(idx == 1)
            {
               CreateRice(2,1);
            }
            else if(idx == 2)
            {
               CreateRice(1,6);
            }
            else if(idx == 3)
            {
               CreateRice(2,5);
            }
         }
         super.OnTimeInterval(iTimeNum);
      }
   }
}

