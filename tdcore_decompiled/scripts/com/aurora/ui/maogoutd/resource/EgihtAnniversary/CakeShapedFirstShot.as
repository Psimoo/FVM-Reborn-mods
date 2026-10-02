package com.aurora.ui.maogoutd.resource.EgihtAnniversary
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.resource.shot.a_4348;
   import flash.display.FrameLabel;
   
   public class CakeShapedFirstShot extends a_4348
   {
      
      public function CakeShapedFirstShot()
      {
         super();
         a_1279 = -40;
         m_iYDisplayCenterPos = -6;
         a_1573 = 1;
         a_1576 = true;
         a_1588 = true;
         a_1275 = 1;
         a_1587 = 2;
      }
      
      public static function a_4344() : a_4348
      {
         BattleFieldView.a_1017.play();
         return PoolManager.getInstance().CheckOutOne(CakeShapedFirstShot,CakeShapedFirstShotMovie) as CakeShapedFirstShot;
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
               a_4352(m_PTMoveIntruder);
               SputterHurt(m_PTMoveIntruder.m_stCurrentFieldGrid,m_PTMoveIntruder);
            }
         }
         else if(Math.abs(x - m_PTPosition.x) <= 0.5 && Boolean(m_PTFieldGrid))
         {
            m_isHited = true;
            if(a_1276.length > 0)
            {
               gotoAndStop((a_1276[a_1587] as FrameLabel).frame);
            }
            SputterHurt(m_PTFieldGrid,null);
         }
      }
   }
}

