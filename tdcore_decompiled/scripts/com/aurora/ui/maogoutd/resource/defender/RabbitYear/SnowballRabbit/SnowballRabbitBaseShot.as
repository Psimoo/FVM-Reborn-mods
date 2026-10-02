package com.aurora.ui.maogoutd.resource.defender.RabbitYear.SnowballRabbit
{
   import a_4718.b_182;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.shot.a_4348;
   
   public class SnowballRabbitBaseShot extends a_4348
   {
      
      private static var ms_arrShot:Array = new Array();
      
      public var a_1607:a_4206;
      
      public function SnowballRabbitBaseShot()
      {
         super();
         a_1279 = -width * 0.5;
         a_1574 = 0;
         a_1573 = 1;
         a_1578 = true;
         m_isShotHighSkySpace = true;
         a_1576 = false;
         a_1577 = false;
      }
      
      public static function a_4344() : SnowballRabbitBaseShot
      {
         var stShot:SnowballRabbitBaseShot = ms_arrShot.pop();
         if(null == stShot)
         {
            stShot = new SnowballRabbitBaseShot();
         }
         return stShot;
      }
      
      override protected function getBindMovie() : Class
      {
         return SnowballRabbitBaseShotMovie;
      }
      
      override public function a_1797(iGlobalID:int, numSpeed:Number, iHurtPower:int, iXpos:int, iYpos:int, stCurrentBattleView:BattleFieldView, stStartFieldGrid:a_3491, isBothWayShot:Boolean = false, numHotMultiplier:Number = 1, iThreeRowShotType:int = 0) : Boolean
      {
         super.a_1797(iGlobalID,numSpeed,iHurtPower,iXpos,iYpos,stCurrentBattleView,stStartFieldGrid,isBothWayShot,numHotMultiplier);
         a_1588 = true;
         a_1573 = 1;
         return true;
      }
      
      override public function a_4216(iCurrentTime:int) : void
      {
         if(a_1588)
         {
            nextFrame();
            if(a_1273 == 5)
            {
               BattleFieldView.ms_xueqiutu_89.play();
               if(this.a_1607)
               {
                  this.a_4352(this.a_1607);
               }
            }
            else if(a_1273 == a_1274)
            {
               m_bActive.Value = false;
               this.a_3940();
            }
         }
         if(0 == a_1447)
         {
            a_1447 = iCurrentTime;
         }
      }
      
      private function a_4360(stHitenFieldGrid:a_3491) : void
      {
         var stFieldGrid:a_3491 = null;
         var j:int = 0;
         var arrMouveIntruder:Array = null;
         var stMouseIntruder:a_4206 = null;
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
                     if(null != stMouseIntruder && stMouseIntruder != this.a_1607 && (stMouseIntruder.iSpaceState != 0 || !stMouseIntruder.isCannotSeeByFighter))
                     {
                        stMouseIntruder.ReduceLifeIgnoreArmor2(GetFinalDamage() * 0.2,[102]);
                     }
                  }
               }
            }
         }
      }
      
      override public function a_4352(baseMoveIntruder:a_4206) : Boolean
      {
         if(!m_isPenetrate)
         {
            m_bActive.Value = false;
         }
         if(a_1576 || a_1575)
         {
            baseMoveIntruder.ReduceLifeIgnoreArmor2(GetFinalDamage(),[102]);
         }
         else
         {
            baseMoveIntruder.ReduceLife2(GetFinalDamage(),[102]);
         }
         if(a_1573 > 0)
         {
            baseMoveIntruder.a_4208(b_182.a_432,a_1573);
         }
         if(a_1574 > 0)
         {
            if(baseMoveIntruder.iArmorLifeValue <= 0 || a_1576)
            {
               baseMoveIntruder.a_4208(b_182.a_433,a_1574 * a_1326);
            }
         }
         if(a_1325 > 5)
         {
            baseMoveIntruder.a_4208(b_182.a_433,0);
         }
         if(m_isShowColdSlow)
         {
            baseMoveIntruder.a_4208(b_182.a_433,150);
         }
         return true;
      }
      
      override protected function a_3940() : Boolean
      {
         this.a_1607 = null;
         ms_iCritFrameLable = 0;
         if(-1 == ms_arrShot.indexOf(this))
         {
            ms_arrShot.push(this);
         }
         super.a_3940();
         return true;
      }
   }
}

