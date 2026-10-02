package com.aurora.ui.maogoutd.resource.gamemap.newMap.HorseYear.LanternFestival
{
   import com.aurora.ui.maogoutd.resource.gamemap.a_4187;
   
   public class LanternFestival2GameMap extends LanternFestivalBaseGameMap
   {
      
      private static var a_1445:a_4187 = new a_4187();
      
      private var lastIndex:int = -1;
      
      public function LanternFestival2GameMap()
      {
         super();
         a_1445.m_iBattleFieldStageType = 0;
         a_1445.m_iBattleModType = 0;
         a_1445.m_iWeatherType = 0;
         m_OutArray = [];
         m_TotalObstaclePos = [[1,0],[1,1],[1,5],[1,6],[6,2],[7,3],[8,4]];
         m_arrPot = [[5,2,null],[6,3,null],[7,4,null]];
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
            CreateRice(0,2);
            CreateRice(2,4);
            this.lastIndex = -1;
         }
         else if(iTimeNum != 0 && iTimeNum % (25 * 20) == 0)
         {
            idx = int(m_stRandomSeed.nextInt(3));
            while(this.lastIndex == idx)
            {
               idx = int(m_stRandomSeed.nextInt(3));
            }
            this.lastIndex = idx;
            if(idx == 0)
            {
               CreateRice(0,2);
            }
            else if(idx == 1)
            {
               CreateRice(1,3);
            }
            else if(idx == 2)
            {
               CreateRice(2,4);
            }
         }
         super.OnTimeInterval(iTimeNum);
      }
   }
}

