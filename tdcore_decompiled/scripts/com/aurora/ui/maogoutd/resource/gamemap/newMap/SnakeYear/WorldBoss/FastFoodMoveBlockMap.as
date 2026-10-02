package com.aurora.ui.maogoutd.resource.gamemap.newMap.SnakeYear.WorldBoss
{
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.moveBlock.MoveBlockMap;
   
   public class FastFoodMoveBlockMap extends MoveBlockMap
   {
      
      private var m_stMap:FastFoodBar1GameMap;
      
      private var m_stMoveIntruder:a_4206;
      
      private var m_iCreateType:int;
      
      public function FastFoodMoveBlockMap(iOffsetX:int = 0, iOffsetY:int = 0)
      {
         super(iOffsetX,iOffsetY);
      }
      
      override protected function OnArriedBound() : void
      {
         if(m_stMoveBlockData.m_iDirectionType == 4)
         {
            this.m_stMap.RemoveTargetgrid(this);
         }
      }
      
      override public function ReleaseMoveMap() : void
      {
         this.ChangeGridType(8);
         var m_iXGridNo:int = getMoveBlockFieldGrid().m_iXGridNo;
         var m_iYGridNo:int = getMoveBlockFieldGrid().m_iYGridNo;
         var grid:a_3491 = this.m_stMap.m_stCurrentBattleFieldView.a_3438(m_iXGridNo,m_iYGridNo);
         this.a_3502(grid);
         if(this.m_stMoveIntruder != null)
         {
            this.m_stMoveIntruder.a_3969(this.m_stMoveIntruder.iLifeValue);
            this.m_stMoveIntruder = null;
            this.m_stMap.CreateSmoke(m_iXGridNo,m_iYGridNo);
         }
         super.ReleaseMoveMap();
      }
      
      private function ChangeGridType(type:int) : void
      {
         var m_iXGridNo:int = getMoveBlockFieldGrid().m_iXGridNo;
         var m_iYGridNo:int = getMoveBlockFieldGrid().m_iYGridNo;
         var grid:a_3491 = this.m_stMap.m_stCurrentBattleFieldView.a_3438(m_iXGridNo,m_iYGridNo);
         grid.m_iFieldGridType = type;
      }
      
      protected function a_3502(stFieldGrid:a_3491) : Boolean
      {
         if(null == stFieldGrid)
         {
            return false;
         }
         return stFieldGrid.ClearFieldGridDefenseWithOption(false,true,true,2);
      }
      
      public function CreateBlock(map:FastFoodBar1GameMap, createType:int) : void
      {
         this.m_stMap = map;
         this.m_iCreateType = createType;
         SetBattleFieldView(map.m_stCurrentBattleFieldView);
         MoveStart();
         this.UpdateCreateBlock();
      }
      
      override public function OnTimeInterval(iTimeNum:uint) : void
      {
         super.OnTimeInterval(iTimeNum);
         this.UpdateCheck();
      }
      
      private function UpdateCheck() : void
      {
         if(m_stMoveBlockData.m_iDirectionType == 4)
         {
            if(this.IsDeadMouse())
            {
               this.m_stMoveIntruder = null;
               this.ChangeGridType(0);
            }
            else
            {
               this.ChangeGridType(8);
            }
         }
         else if(m_stMoveBlockData.m_iDirectionType == 3)
         {
            if(this.IsDeadMouse())
            {
               this.m_stMoveIntruder = null;
               this.ChangeGridType(0);
            }
            else
            {
               this.ChangeGridType(8);
            }
         }
      }
      
      public function IsDeadMouse() : Boolean
      {
         return this.m_stMoveIntruder == null || this.m_stMoveIntruder.iLifeValue <= 0;
      }
      
      public function Refresh2MAX() : void
      {
         if(this.m_stMoveIntruder != null)
         {
            this.m_stMoveIntruder.a_3969(this.m_stMoveIntruder.iLifeValue);
            this.m_stMoveIntruder = null;
         }
         this.UpdateCreateBlock(3);
         var m_iXGridNo:int = getMoveBlockFieldGrid().m_iXGridNo;
         var m_iYGridNo:int = getMoveBlockFieldGrid().m_iYGridNo;
         this.m_stMap.CreateSmoke(m_iXGridNo,m_iYGridNo);
      }
      
      private function UpdateCreateBlock(createType:int = -1) : void
      {
         var stMoveIntruder:a_4206 = null;
         var iOffsetY:int = 0;
         var battleView:BattleFieldView = this.m_stMap.m_stCurrentBattleFieldView;
         var m_iXGridNo:int = getMoveBlockFieldGrid().m_iXGridNo;
         var m_iYGridNo:int = getMoveBlockFieldGrid().m_iYGridNo;
         var grid:a_3491 = battleView.a_3438(m_iXGridNo,m_iYGridNo);
         if(grid == null)
         {
            return;
         }
         this.a_3502(grid);
         if(createType == -1)
         {
            createType = this.m_iCreateType;
         }
         if(createType == 0)
         {
            grid.m_iFieldGridType = 0;
         }
         else
         {
            grid.m_iFieldGridType = 8;
         }
         if(createType == 4)
         {
            createType = this.m_stMap.m_stRandomSeed.nextInt(3) + 1;
         }
         var iOffsetX:int = 0;
         iOffsetY = 0;
         if(createType == 1)
         {
            stMoveIntruder = FastFoodSolider1MoveIntruder.a_3926();
            iOffsetX = -18;
            iOffsetY = -18;
         }
         else if(createType == 2)
         {
            stMoveIntruder = FastFoodSolider2MoveIntruder.a_3926();
            iOffsetX = -24;
            iOffsetY = -27;
         }
         else if(createType == 3)
         {
            stMoveIntruder = FastFoodSolider3MoveIntruder.a_3926();
            iOffsetX = -29;
            iOffsetY = -40;
         }
         if(stMoveIntruder)
         {
            this.m_stMoveIntruder = stMoveIntruder;
            stMoveIntruder.a_1797((1 << 16) + m_iYGridNo + 150,-1);
            stMoveIntruder.m_stMoveIntruderTypeID = 134217728;
            if(battleView.GetGameMoveMap())
            {
               battleView.GetGameMoveMap().AddMoveDisplayObject(stMoveIntruder,m_iXGridNo,m_iYGridNo);
            }
            if(grid != null)
            {
               battleView.a_3459(stMoveIntruder,grid,false,BattleLayerDefine.INTRUDER_LAND_TYPE);
               stMoveIntruder.x = x + iOffsetX + 30;
               stMoveIntruder.y = y + iOffsetY + 32;
            }
         }
      }
   }
}

