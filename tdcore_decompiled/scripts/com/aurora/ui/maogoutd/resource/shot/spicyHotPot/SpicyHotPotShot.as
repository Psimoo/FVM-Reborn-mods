package com.aurora.ui.maogoutd.resource.shot.spicyHotPot
{
   import a_4718.b_183;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.shot.a_4348;
   import flash.display.FrameLabel;
   
   public class SpicyHotPotShot extends a_4348
   {
      
      private static var ms_arrShot:Array = new Array();
      
      private static var ms_bIsInit:Boolean = false;
      
      private var m_iAttackGrid:int;
      
      private var m_iCount:int;
      
      public function SpicyHotPotShot()
      {
         super();
         a_1304 = b_183.enm_SpicyHotPot;
         a_1573 = 5;
         a_1279 = -50;
         a_1588 = true;
         a_1275 = 0;
         a_1587 = 1;
      }
      
      public static function a_4344() : a_4348
      {
         var stShot:SpicyHotPotShot = ms_arrShot.pop();
         if(null == stShot)
         {
            stShot = new SpicyHotPotShot();
         }
         return stShot;
      }
      
      override protected function getBindMovie() : Class
      {
         return SpicyHotPotShotMovie;
      }
      
      override public function a_1797(iGlobalID:int, numSpeed:Number, iHurtPower:int, iXpos:int, iYpos:int, stCurrentBattleView:BattleFieldView, stStartFieldGrid:a_3491, isBothWayShot:Boolean = false, numHotMultiplier:Number = 1, iThreeRowShotType:int = 0) : Boolean
      {
         super.a_1797(iGlobalID,numSpeed,iHurtPower,iXpos,iYpos,stCurrentBattleView,stStartFieldGrid,isBothWayShot,numHotMultiplier);
         this.m_iCount = 0;
         a_1588 = true;
         return true;
      }
      
      override public function a_4216(iCurrentTime:int) : void
      {
         var iXGridNo:int = 0;
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
            if(this.m_iCount < ms_iShotLen)
            {
               this.a_4360();
            }
         }
         else if(m_isHited)
         {
            x += m_numXSpeed;
            this.a_4360();
            if(x < 0 || x > BattleFieldView.a_1013)
            {
               this.a_3940();
               return;
            }
            iXGridNo = x / a_3491.a_1080;
            if(a_1283)
            {
               iXGridNo = BattleFieldView.a_1011 - 1 - iXGridNo;
            }
            if(Math.abs(iXGridNo - a_1584.m_iXGridNo) >= ms_iShotLen)
            {
               this.m_iCount = 1;
               m_isHited = false;
            }
            else if(a_1278 != null)
            {
               this.ChangeToFrameLable(a_1587);
            }
         }
         else
         {
            if(this.m_iCount < ms_iShotLen + 1)
            {
               this.a_4360();
            }
            if(a_1273 == a_1274)
            {
               this.a_3940();
            }
         }
      }
      
      private function ChangeToAttackState() : void
      {
         this.m_iAttackGrid = -1;
         m_isHited = true;
         a_1588 = false;
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
         var addCenter:Number = NaN;
         var arrMouveIntruder:Array = null;
         var stMoveIntruder:a_4206 = null;
         ++this.m_iCount;
         var iXGridNo:int = int(x / a_3491.a_1080);
         if(a_1283)
         {
            iXGridNo = BattleFieldView.a_1011 - 1 - iXGridNo;
         }
         if(iXGridNo >= BattleFieldView.a_1011)
         {
            iXGridNo = BattleFieldView.a_1011 - 1;
         }
         else if(iXGridNo < 0)
         {
            iXGridNo = 0;
         }
         var ly:int = Math.max(a_1584.m_iYGridNo - 1,0);
         var ry:int = Math.min(BattleFieldView.a_1012 - 1,a_1584.m_iYGridNo + 1);
         for(var iYGridNo:int = ly; iYGridNo <= ry; iYGridNo++)
         {
            stFieldGrid = a_1583.a_3438(iXGridNo,iYGridNo);
            if(null != stFieldGrid)
            {
               addCenter = stFieldGrid.getStraightShotMultiplier();
               a_1325 = addCenter;
               arrMouveIntruder = stFieldGrid.a_1511.slice();
               for each(stMoveIntruder in arrMouveIntruder)
               {
                  if(null != stMoveIntruder && (0 == stMoveIntruder.iSpaceState || 2 == stMoveIntruder.iSpaceState) && !stMoveIntruder.isCannotSeeByFighter)
                  {
                     a_4352(stMoveIntruder);
                     if(stMoveIntruder.iLifeValue <= 0 && Boolean(stMoveIntruder.m_stCurrentFieldGrid))
                     {
                        stMoveIntruder.a_4210();
                     }
                  }
               }
            }
         }
      }
      
      override protected function a_3940() : Boolean
      {
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

