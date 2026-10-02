package com.aurora.ui.maogoutd.resource.shot.hotPotBeef
{
   import a_4718.b_183;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.shot.a_4348;
   import flash.display.FrameLabel;
   
   public class HotPotBeefShot extends a_4348
   {
      
      private static var ms_arrShot:Array = new Array();
      
      private static const CONTINUE_TIME:int = 56 + 3;
      
      private var m_iStartShowTime:int;
      
      private var m_iCount:int;
      
      public function HotPotBeefShot()
      {
         super();
         a_1304 = b_183.enm_HotPotBeefShot;
         a_1573 = 2;
         a_1588 = true;
         a_1275 = 0;
         a_1587 = 1;
      }
      
      public static function a_4344() : HotPotBeefShot
      {
         var stShot:HotPotBeefShot = ms_arrShot.pop();
         if(null == stShot)
         {
            stShot = new HotPotBeefShot();
         }
         return stShot;
      }
      
      override protected function getBindMovie() : Class
      {
         return HotPotBeefShotMovie;
      }
      
      override public function a_1797(iGlobalID:int, numSpeed:Number, iHurtPower:int, iXpos:int, iYpos:int, stCurrentBattleView:BattleFieldView, stStartFieldGrid:a_3491, isBothWayShot:Boolean = false, numHotMultiplier:Number = 1, iThreeRowShotType:int = 0) : Boolean
      {
         a_1588 = true;
         return super.a_1797(iGlobalID,numSpeed,iHurtPower,iXpos,iYpos,stCurrentBattleView,stStartFieldGrid,isBothWayShot,numHotMultiplier);
      }
      
      override public function a_4216(iCurrentTime:int) : void
      {
         nextFrame();
         if(a_1588)
         {
            if(0 == a_1447)
            {
               a_1447 = iCurrentTime;
            }
            if(a_1278 != null)
            {
               this.ChangeToAttackState();
            }
         }
         else if(m_isHited)
         {
            if(this.m_iStartShowTime >= CONTINUE_TIME)
            {
               m_isHited = false;
            }
            else
            {
               if(this.m_iStartShowTime % 6 == 0)
               {
                  this.a_4360();
               }
               if(a_1278 != null)
               {
                  this.ChangeToFrameLable(a_1587);
               }
            }
            ++this.m_iStartShowTime;
         }
         else if(a_1273 == a_1274)
         {
            this.a_3940();
         }
      }
      
      private function ChangeToAttackState() : void
      {
         m_isHited = true;
         a_1588 = false;
         this.m_iStartShowTime = 0;
         this.m_iCount = 0;
         this.ChangeToFrameLable(a_1587);
      }
      
      private function ChangeToFrameLable(iFrameLable:int) : void
      {
         gotoAndStop((a_1276[iFrameLable] as FrameLabel).frame);
      }
      
      private function a_4360() : void
      {
         var stFieldGrid:a_3491 = null;
         var arrMouveIntruder:Array = null;
         var stMoveIntruder:a_4206 = null;
         ++this.m_iCount;
         var lx:int = a_1584.m_iXGridNo;
         var rx:int = Math.min(BattleFieldView.a_1011 - 1,lx + 4);
         var iYGridNo:int = a_1584.m_iYGridNo;
         for(var iXGridNo:int = lx; iXGridNo <= rx; iXGridNo++)
         {
            stFieldGrid = a_1583.a_3438(iXGridNo,iYGridNo);
            if(null != stFieldGrid)
            {
               arrMouveIntruder = stFieldGrid.a_1511.slice();
               for each(stMoveIntruder in arrMouveIntruder)
               {
                  if(null != stMoveIntruder && (0 == stMoveIntruder.iSpaceState || 2 == stMoveIntruder.iSpaceState) && !stMoveIntruder.isCannotSeeByFighter)
                  {
                     a_4352(stMoveIntruder);
                  }
               }
            }
         }
      }
      
      override protected function a_3940() : Boolean
      {
         trace("************HotPot m_iCount = " + this.m_iCount);
         super.a_3940();
         if(-1 == ms_arrShot.indexOf(this))
         {
            ms_arrShot.push(this);
         }
         a_1588 = true;
         m_isHited = false;
         return true;
      }
   }
}

