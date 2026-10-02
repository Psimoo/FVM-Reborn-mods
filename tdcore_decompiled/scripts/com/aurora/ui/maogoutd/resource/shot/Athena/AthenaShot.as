package com.aurora.ui.maogoutd.resource.shot.Athena
{
   import a_4718.b_183;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.shot.a_4348;
   import flash.display.FrameLabel;
   
   public class AthenaShot extends a_4348
   {
      
      private static var ms_arrShot:Array = new Array();
      
      private var a_1607:a_4206;
      
      public function AthenaShot()
      {
         super();
         a_1279 = -width * 0.5;
         a_1304 = b_183.enm_AthenaShot;
         a_1573 = 1;
         a_1578 = true;
         m_isShotHighSkySpace = true;
         a_1576 = false;
         a_1577 = false;
      }
      
      public static function a_4344() : AthenaShot
      {
         var stShot:AthenaShot = ms_arrShot.pop();
         if(null == stShot)
         {
            stShot = new AthenaShot();
         }
         return stShot;
      }
      
      override protected function getBindMovie() : Class
      {
         return AthenaShotMovie;
      }
      
      override public function a_1797(iGlobalID:int, numSpeed:Number, iHurtPower:int, iXpos:int, iYpos:int, stCurrentBattleView:BattleFieldView, stStartFieldGrid:a_3491, isBothWayShot:Boolean = false, numHotMultiplier:Number = 1, iThreeRowShotType:int = 0) : Boolean
      {
         super.a_1797(iGlobalID,numSpeed,iHurtPower,iXpos,iYpos,stCurrentBattleView,stStartFieldGrid,isBothWayShot,numHotMultiplier);
         a_1304 = b_183.enm_AthenaShot;
         a_1447 = 0;
         m_numXSpeed *= -1;
         a_1275 = 0;
         a_1587 = 1;
         gotoAndStop(1);
         a_1578 = true;
         m_isShotHighSkySpace = true;
         a_1576 = false;
         a_1577 = false;
         a_1573 = 1;
         return true;
      }
      
      override protected function a_4351() : void
      {
         var stMoveIntruder:a_4206 = null;
         if(x <= 0 || x > BattleFieldView.a_1013)
         {
            this.a_3940();
            return;
         }
         stMoveIntruder = a_1583.a_3431();
         if(null != stMoveIntruder && hitTestObject(stMoveIntruder))
         {
            m_isHited = true;
            if(a_1276.length > 0)
            {
               gotoAndStop((a_1276[a_1587] as FrameLabel).frame);
            }
            this.a_4360(stMoveIntruder.m_stCurrentFieldGrid);
         }
      }
      
      private function a_4360(stHitenFieldGrid:a_3491) : void
      {
         var stFieldGrid:a_3491 = null;
         var j:int = 0;
         var arrMouveIntruder:Array = null;
         var stMouseIntruder:a_4206 = null;
         this.x = (0.5 + stHitenFieldGrid.m_iXGridNo) * a_3491.a_1080;
         this.y = (stHitenFieldGrid.m_iYGridNo - 0.5) * a_3491.a_1081 + 10;
         var lx:int = stHitenFieldGrid.m_iXGridNo - 1;
         var rx:int = stHitenFieldGrid.m_iXGridNo + 1;
         var dy:int = stHitenFieldGrid.m_iYGridNo - 1;
         var uy:int = stHitenFieldGrid.m_iYGridNo + 1;
         for(var i:int = lx; i <= rx; i++)
         {
            for(j = dy; j <= uy; j++)
            {
               stFieldGrid = a_1583.a_3438(i,j);
               if(null != stFieldGrid)
               {
                  arrMouveIntruder = stFieldGrid.a_1511.slice();
                  for each(stMouseIntruder in arrMouveIntruder)
                  {
                     if(null != stMouseIntruder && false == stMouseIntruder.isCannotSeeByFighter)
                     {
                        HitMoveIntruder2(stMouseIntruder,[103]);
                     }
                  }
               }
            }
         }
         BattleFieldView.ms_yadianna82.play();
      }
      
      override protected function a_3940() : Boolean
      {
         this.a_1607 = null;
         if(-1 == ms_arrShot.indexOf(this))
         {
            ms_arrShot.push(this);
         }
         super.a_3940();
         return true;
      }
   }
}

