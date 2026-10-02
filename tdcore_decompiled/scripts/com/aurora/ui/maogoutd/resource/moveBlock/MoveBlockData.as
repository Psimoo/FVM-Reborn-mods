package com.aurora.ui.maogoutd.resource.moveBlock
{
   public class MoveBlockData
   {
      
      public var m_iID:int;
      
      public var m_iDefultDirection:int;
      
      public var m_iDefultXGridNo:int;
      
      public var m_iDefultYGridNo:int;
      
      public var m_iStartXGridNo:int;
      
      public var m_iStartYGridNo:int;
      
      public var m_iEndXGridNo:int;
      
      public var m_iEndYGridNo:int;
      
      public var m_iHeight:int;
      
      public var m_iWidth:int;
      
      public var m_iSpeed:Number;
      
      public var m_iStartResidenceTime:int;
      
      public var m_iEndResideceTime:int;
      
      public var m_iShowWidth:int;
      
      public var m_iShowHeight:int;
      
      public var m_iDirectionType:int;
      
      public var m_iLoopGo:Boolean = true;
      
      public var m_WaitTime:int = 0;
      
      public var m_Index:int = 0;
      
      public function MoveBlockData()
      {
         super();
         trace("cao!!");
      }
   }
}

