package com.aurora.ui.maogoutd.resource.moveBlock
{
   public class MoveBlockFieldGrid
   {
      
      public static const MOVE_UP:int = 1;
      
      public static const MOVE_DOWN:int = 2;
      
      public static const MOVE_LEFT:int = 3;
      
      public static const MOVE_RIGHT:int = 4;
      
      public var m_iDirection:int;
      
      public var m_iXGridNo:int;
      
      public var m_iYGridNo:int;
      
      public var m_iLastXGridNo:int;
      
      public var m_iLastYGridNo:int;
      
      public var m_iHeight:int;
      
      public var m_iWidth:int;
      
      public function MoveBlockFieldGrid()
      {
         super();
      }
      
      public static function GetMoveBlockFieldGrid(iX:int, iY:int, iHeight:int, iWidth:int) : MoveBlockFieldGrid
      {
         var stBlock:MoveBlockFieldGrid = new MoveBlockFieldGrid();
         stBlock.m_iXGridNo = iX;
         stBlock.m_iYGridNo = iY;
         stBlock.m_iHeight = iHeight;
         stBlock.m_iWidth = iWidth;
         return stBlock;
      }
   }
}

