package com.aurora.ui.maogoutd.resource.gamemap.newMap.HorseYear.LanternFestival
{
   import com.aurora.ui.maogoutd.resource.gamemap.a_4187;
   
   public class LanternFestival1GameMap extends LanternFestivalBaseGameMap
   {
      
      private static var a_1445:a_4187 = new a_4187();
      
      private var lastIndex:int = -1;
      
      public function LanternFestival1GameMap()
      {
         super();
         a_1445.m_iBattleFieldStageType = 0;
         a_1445.m_iBattleModType = 0;
         a_1445.m_iWeatherType = 0;
         m_OutArray = [[7,0],[8,0],[7,2],[8,2],[7,4],[8,4],[7,6],[8,6]];
         m_TotalObstaclePos = [];
         m_arrPot = [[8,1,null],[7,1,null],[8,3,null],[7,3,null],[8,5,null],[7,5,null]];
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
            CreateRice(1,3);
            this.lastIndex = 1;
         }
         else if(iTimeNum != 0 && iTimeNum % (20 * 20) == 0)
         {
            idx = int(m_stRandomSeed.nextInt(3));
            while(this.lastIndex == idx)
            {
               idx = int(m_stRandomSeed.nextInt(3));
            }
            this.lastIndex = idx;
            if(idx == 0)
            {
               CreateRice(1,1);
            }
            else if(idx == 1)
            {
               CreateRice(1,3);
            }
            else if(idx == 2)
            {
               CreateRice(1,5);
            }
         }
         super.OnTimeInterval(iTimeNum);
      }
   }
}

