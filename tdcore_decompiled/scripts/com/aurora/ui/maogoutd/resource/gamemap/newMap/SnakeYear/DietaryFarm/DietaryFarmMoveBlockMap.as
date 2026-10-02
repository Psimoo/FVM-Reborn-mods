package com.aurora.ui.maogoutd.resource.gamemap.newMap.SnakeYear.DietaryFarm
{
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.moveBlock.MoveBlockFieldGrid;
   import com.aurora.ui.maogoutd.resource.moveBlock.MoveBlockMap;
   
   public class DietaryFarmMoveBlockMap extends MoveBlockMap
   {
      
      private var m_iMoveSum:int = 0;
      
      private var iEndGridNum:int = 0;
      
      public function DietaryFarmMoveBlockMap(iOffsetX:int = 0, iOffsetY:int = 0)
      {
         super(iOffsetX,iOffsetY);
      }
      
      private function AddMoveSum(iNextGridNum:int) : void
      {
         ++this.m_iMoveSum;
         this.iEndGridNum = iNextGridNum;
      }
      
      override public function ReleaseMoveMap() : void
      {
         this.m_iMoveSum = 0;
         this.iEndGridNum = 0;
         super.ReleaseMoveMap();
      }
      
      override protected function MoveUp() : void
      {
         var iAddY:Number = 0;
         if(this.m_iMoveSum >= 5 && y <= this.iEndGridNum * a_3491.a_1081)
         {
            this.m_iMoveSum = 0;
            m_iSleepTime = 15 * 20;
         }
         else if(y > m_stMoveBlockData.m_iStartYGridNo * a_3491.a_1081)
         {
            if(y - m_stMoveBlockData.m_iSpeed > m_stMoveBlockData.m_iStartYGridNo * a_3491.a_1081)
            {
               iAddY = -m_stMoveBlockData.m_iSpeed;
               y -= m_stMoveBlockData.m_iSpeed;
               m_stMoveBlockFieldGrid.m_iYGridNo = Math.floor((y + a_3491.a_1081 / 2) / a_3491.a_1081);
            }
            else
            {
               iAddY = -(y - m_stMoveBlockData.m_iStartYGridNo * a_3491.a_1081);
               y = m_stMoveBlockData.m_iStartYGridNo * a_3491.a_1081;
            }
            if(m_stMoveBlockFieldGrid.m_iLastYGridNo != m_stMoveBlockFieldGrid.m_iYGridNo)
            {
               m_stMoveBlockFieldGrid.m_iYGridNo = m_stMoveBlockFieldGrid.m_iLastYGridNo;
               m_stMoveBlockFieldGrid.m_iDirection = MoveBlockFieldGrid.MOVE_UP;
               if(m_stCurrentBattleFieldView.MoveHandler(m_stMoveBlockFieldGrid))
               {
                  --m_stMoveBlockFieldGrid.m_iLastYGridNo;
                  --m_stMoveBlockFieldGrid.m_iYGridNo;
                  this.AddMoveSum(m_stMoveBlockFieldGrid.m_iYGridNo);
               }
               if(m_stMoveBlockFieldGrid.m_iLastYGridNo != m_stMoveBlockFieldGrid.m_iYGridNo)
               {
                  throw new Error("相差不是一点点");
               }
            }
            MoveDisplayObject(0,iAddY);
         }
         else
         {
            m_stMoveBlockFieldGrid.m_iDirection = getDirection(m_stMoveBlockFieldGrid.m_iDirection);
         }
      }
      
      override protected function MoveDown() : void
      {
         var iAddY:Number = 0;
         if(this.m_iMoveSum >= 5 && y >= this.iEndGridNum * a_3491.a_1081)
         {
            this.m_iMoveSum = 0;
            m_iSleepTime = 15 * 20;
         }
         else if(y < m_stMoveBlockData.m_iEndYGridNo * a_3491.a_1081)
         {
            if(y + m_stMoveBlockData.m_iSpeed < m_stMoveBlockData.m_iEndYGridNo * a_3491.a_1081)
            {
               iAddY = m_stMoveBlockData.m_iSpeed;
               y += iAddY;
               m_stMoveBlockFieldGrid.m_iYGridNo = Math.floor((y + a_3491.a_1081 / 2) / a_3491.a_1081);
            }
            else
            {
               iAddY = m_stMoveBlockData.m_iEndYGridNo * a_3491.a_1081 - y;
               y = m_stMoveBlockData.m_iEndYGridNo * a_3491.a_1081;
            }
            if(m_stMoveBlockFieldGrid.m_iLastYGridNo != m_stMoveBlockFieldGrid.m_iYGridNo)
            {
               m_stMoveBlockFieldGrid.m_iYGridNo = m_stMoveBlockFieldGrid.m_iLastYGridNo;
               m_stMoveBlockFieldGrid.m_iDirection = MoveBlockFieldGrid.MOVE_DOWN;
               if(m_stCurrentBattleFieldView.MoveHandler(m_stMoveBlockFieldGrid))
               {
                  ++m_stMoveBlockFieldGrid.m_iLastYGridNo;
                  ++m_stMoveBlockFieldGrid.m_iYGridNo;
                  this.AddMoveSum(m_stMoveBlockFieldGrid.m_iYGridNo);
               }
               else
               {
                  trace("MoveHandler 失败了");
               }
               if(m_stMoveBlockFieldGrid.m_iLastYGridNo != m_stMoveBlockFieldGrid.m_iYGridNo)
               {
                  throw new Error("相差不是一点点");
               }
            }
            MoveDisplayObject(0,iAddY);
         }
         else
         {
            m_stMoveBlockFieldGrid.m_iDirection = getDirection(m_stMoveBlockFieldGrid.m_iDirection);
         }
      }
      
      override protected function MoveLeft() : void
      {
         var iAddX:Number = 0;
         if(this.m_iMoveSum >= 5 && x <= this.iEndGridNum * a_3491.a_1080)
         {
            this.m_iMoveSum = 0;
            m_iSleepTime = 15 * 20;
         }
         else if(x > m_stMoveBlockData.m_iStartXGridNo * a_3491.a_1080)
         {
            if(x - m_stMoveBlockData.m_iSpeed > m_stMoveBlockData.m_iStartXGridNo * a_3491.a_1080)
            {
               if(CheckCanMove())
               {
                  iAddX = -m_stMoveBlockData.m_iSpeed;
                  x -= m_stMoveBlockData.m_iSpeed;
                  m_stMoveBlockFieldGrid.m_iXGridNo = Math.floor((x + a_3491.a_1080 / 2) / a_3491.a_1080);
               }
            }
            else
            {
               iAddX = -(x - m_stMoveBlockData.m_iStartXGridNo * a_3491.a_1080);
               x = m_stMoveBlockData.m_iStartXGridNo * a_3491.a_1080;
            }
            if(m_stMoveBlockFieldGrid.m_iLastXGridNo != m_stMoveBlockFieldGrid.m_iXGridNo)
            {
               m_stMoveBlockFieldGrid.m_iXGridNo = m_stMoveBlockFieldGrid.m_iLastXGridNo;
               m_stMoveBlockFieldGrid.m_iDirection = MoveBlockFieldGrid.MOVE_LEFT;
               if(m_stCurrentBattleFieldView.MoveHandler(m_stMoveBlockFieldGrid))
               {
                  --m_stMoveBlockFieldGrid.m_iLastXGridNo;
                  --m_stMoveBlockFieldGrid.m_iXGridNo;
                  this.AddMoveSum(m_stMoveBlockFieldGrid.m_iXGridNo);
               }
               if(m_stMoveBlockFieldGrid.m_iLastXGridNo != m_stMoveBlockFieldGrid.m_iXGridNo)
               {
                  throw new Error("相差不是一点点");
               }
            }
            MoveDisplayObject(iAddX,0);
         }
         else
         {
            m_stMoveBlockFieldGrid.m_iDirection = getDirection(m_stMoveBlockFieldGrid.m_iDirection);
         }
      }
      
      override protected function MoveRight() : void
      {
         var iAddX:Number = 0;
         if(this.m_iMoveSum >= 5 && x >= this.iEndGridNum * a_3491.a_1080)
         {
            this.m_iMoveSum = 0;
            m_iSleepTime = 15 * 20;
         }
         else if(x < m_stMoveBlockData.m_iEndXGridNo * a_3491.a_1080)
         {
            if(x + m_stMoveBlockData.m_iSpeed < m_stMoveBlockData.m_iEndXGridNo * a_3491.a_1080)
            {
               iAddX = m_stMoveBlockData.m_iSpeed;
               x += iAddX;
               m_stMoveBlockFieldGrid.m_iXGridNo = Math.floor((x + a_3491.a_1080 / 2) / a_3491.a_1080);
            }
            else
            {
               iAddX = m_stMoveBlockData.m_iEndXGridNo * a_3491.a_1080 - x;
               x = m_stMoveBlockData.m_iEndXGridNo * a_3491.a_1080;
            }
            if(m_stMoveBlockFieldGrid.m_iLastXGridNo != m_stMoveBlockFieldGrid.m_iXGridNo)
            {
               m_stMoveBlockFieldGrid.m_iXGridNo = m_stMoveBlockFieldGrid.m_iLastXGridNo;
               m_stMoveBlockFieldGrid.m_iDirection = MoveBlockFieldGrid.MOVE_RIGHT;
               if(m_stCurrentBattleFieldView.MoveHandler(m_stMoveBlockFieldGrid))
               {
                  ++m_stMoveBlockFieldGrid.m_iLastXGridNo;
                  ++m_stMoveBlockFieldGrid.m_iXGridNo;
                  this.AddMoveSum(m_stMoveBlockFieldGrid.m_iXGridNo);
               }
               if(m_stMoveBlockFieldGrid.m_iLastXGridNo != m_stMoveBlockFieldGrid.m_iXGridNo)
               {
                  throw new Error("相差不是一点点");
               }
            }
            MoveDisplayObject(iAddX,0);
         }
         else
         {
            m_stMoveBlockFieldGrid.m_iDirection = getDirection(m_stMoveBlockFieldGrid.m_iDirection);
         }
      }
   }
}

