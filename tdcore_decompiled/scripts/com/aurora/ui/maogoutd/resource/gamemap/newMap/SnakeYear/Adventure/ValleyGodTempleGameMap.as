package com.aurora.ui.maogoutd.resource.gamemap.newMap.SnakeYear.Adventure
{
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4255;
   
   public class ValleyGodTempleGameMap extends SeasonBaseGameMap
   {
      
      public function ValleyGodTempleGameMap()
      {
         super();
         m_lGrid1 = new Array([0,3],[0,4],[0,5],[1,3],[1,4],[1,5],[2,3],[2,4],[2,5]);
         m_lGrid2 = new Array([4,3],[4,4],[4,5],[5,3],[5,4],[5,5],[6,3],[6,4],[6,5]);
         m_TotalObstaclePos = new Array([2,0],[6,0],[2,1],[6,1],[2,2],[6,2],[2,3],[6,3],[2,4],[6,4],[2,5],[6,5],[2,6],[6,6],[3,3],[4,3],[5,3]);
      }
      
      override public function OnTimeInterval(iTimeNum:uint) : void
      {
         var grid1:a_3491 = null;
         var grid2:a_3491 = null;
         var i:int = 0;
         for(i = 0; i < m_ringBallArray.length; i++)
         {
            if(m_ringBallArray[i] != null)
            {
               m_ringBallArray[i].RunTick();
            }
         }
         for(i = 0; i < m_rayArray.length; i++)
         {
            if(m_rayArray[i] != null)
            {
               m_rayArray[i].RunTick();
            }
         }
         --m_iCreateTick;
         if(m_iCreateTick == 940)
         {
            CreateShadow();
         }
         else if(m_iCreateTick <= 0)
         {
            lBallPath.length = 0;
            grid1 = CreateBestGrid(m_lGrid1);
            grid2 = CreateBestGrid(m_lGrid2);
            CreateBall(grid1);
            CreateBall(grid2);
            ++m_iCreateCount;
            m_iCreateTick = 50 * 20;
         }
      }
      
      override public function AbsorbBall(index:int, rayIndex:int) : Boolean
      {
         var ball:PhotosphereEffect = null;
         var grid:a_3491 = null;
         var stBaseMoveIntruder:a_4206 = null;
         ball = m_ringBallArray[index];
         if(ball != null)
         {
            grid = ball.m_targetGrid;
            if(rayIndex < 3)
            {
               stBaseMoveIntruder = a_4255.getInstance().a_4256(8389131);
               stBaseMoveIntruder.m_stMoveIntruderTypeID = 8389131;
            }
            else
            {
               stBaseMoveIntruder = a_4255.getInstance().a_4256(8389132);
               stBaseMoveIntruder.m_stMoveIntruderTypeID = 8389132;
            }
            stBaseMoveIntruder.a_1797((1 << 16) + grid.m_iYGridNo,-1);
            stBaseMoveIntruder.x = grid.m_iXGridNo * a_3491.a_1080;
            stBaseMoveIntruder.y = grid.m_iYGridNo * a_3491.a_1081;
            _battleView.a_3459(stBaseMoveIntruder,grid,true,BattleLayerDefine.INTRUDER_LAND_TYPE);
            stBaseMoveIntruder.SpecialSkillCallBack();
            ball.ReleaseBall();
            m_ringBallArray[index] = null;
            return true;
         }
         return false;
      }
   }
}

