package com.aurora.ui.maogoutd.resource.EgihtAnniversary
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.shot.a_4348;
   import flash.display.FrameLabel;
   
   public class BombShapedSecondShot extends a_4348
   {
      
      public function BombShapedSecondShot()
      {
         super();
         a_1279 = -12;
         m_iYDisplayCenterPos = -17;
         a_1573 = 1;
         a_1576 = true;
         a_1588 = true;
         a_1275 = 0;
         a_1587 = 1;
      }
      
      public static function a_4344() : a_4348
      {
         BattleFieldView.a_1017.play();
         return PoolManager.getInstance().CheckOutOne(BombShapedSecondShot,BombShapedSecondShotMovie) as BombShapedSecondShot;
      }
      
      override protected function a_4349() : Boolean
      {
         CaculateParabolaSpeed();
         return true;
      }
      
      override public function a_4216(iCurrentTime:int) : void
      {
         if(m_isHited && !m_isPenetrate)
         {
            nextFrame();
            if(a_1273 == a_1274 || a_1278 != null)
            {
               m_bActive.Value = false;
               a_3940();
            }
            return;
         }
         if(a_1588)
         {
            nextFrame();
            if(a_1273 == a_1274 || a_1278 != null)
            {
               gotoAndStop((a_1276[a_1275] as FrameLabel).frame);
            }
         }
         if(0 == a_1447)
         {
            a_1447 = iCurrentTime;
         }
         if(a_1576)
         {
            UpdateParabolaPosition(iCurrentTime);
         }
      }
      
      override protected function HitParabolaTest() : void
      {
         if(null != m_PTMoveIntruder && Boolean(m_PTMoveIntruder.m_stCurrentFieldGrid))
         {
            if(hitTestObject(m_PTMoveIntruder))
            {
               m_isHited = true;
               if(a_1276.length > 0)
               {
                  gotoAndStop((a_1276[a_1587] as FrameLabel).frame);
               }
               this.SputterHurt(m_PTMoveIntruder.m_stCurrentFieldGrid,m_PTMoveIntruder);
            }
         }
         else if(Math.abs(x - m_PTPosition.x) <= 0.5 && Boolean(m_PTFieldGrid))
         {
            m_isHited = true;
            if(a_1276.length > 0)
            {
               gotoAndStop((a_1276[a_1587] as FrameLabel).frame);
            }
            this.SputterHurt(m_PTFieldGrid,null);
         }
      }
      
      override protected function SputterHurt(stHitenFieldGrid:a_3491, stHitenMouseIntruder:a_4206) : void
      {
         var xIndex:int = 0;
         var stFieldGrid:a_3491 = null;
         var arrMoveIntruder:Array = null;
         var stMoveIntruder:a_4206 = null;
         if(stHitenFieldGrid == null)
         {
            return;
         }
         var xStart:int = Math.max(stHitenFieldGrid.m_iXGridNo - 1,0);
         var xEnd:int = Math.min(stHitenFieldGrid.m_iXGridNo + 1,BattleFieldView.a_1011 - 1);
         var yStart:int = Math.max(stHitenFieldGrid.m_iYGridNo - 1,0);
         var yEnd:int = Math.min(stHitenFieldGrid.m_iYGridNo + 1,BattleFieldView.a_1012 - 1);
         var stFieldGridVector:Array = stHitenFieldGrid.m_stCurrentBattbleFieldView.stFieldGridsVector;
         for(var yIndex:int = yStart; yIndex <= yEnd; yIndex++)
         {
            for(xIndex = xStart; xIndex <= xEnd; xIndex++)
            {
               stFieldGrid = stHitenFieldGrid.m_stCurrentBattbleFieldView.a_3438(xIndex,yIndex);
               arrMoveIntruder = stFieldGrid.IntruderArray;
               for each(stMoveIntruder in arrMoveIntruder)
               {
                  stMoveIntruder.a_4210();
               }
            }
         }
      }
   }
}

