package com.aurora.ui.maogoutd.resource.defender.PigYear.GodIceCanonIraq
{
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.shot.a_4348;
   
   public class GodIceCanonIraqThirdShot extends a_4348
   {
      
      private static var ms_arrShot:Array = new Array();
      
      public var a_1607:a_4206;
      
      private var m_range:int = 1;
      
      public function GodIceCanonIraqThirdShot()
      {
         super();
         a_1279 = -18;
         m_iYDisplayCenterPos = -318;
         a_1573 = 1;
         m_isShotHighSkySpace = true;
         a_1588 = true;
      }
      
      public static function a_4344() : GodIceCanonIraqThirdShot
      {
         var stShot:GodIceCanonIraqThirdShot = ms_arrShot.pop();
         if(null == stShot)
         {
            stShot = new GodIceCanonIraqThirdShot();
         }
         return stShot;
      }
      
      override protected function getBindMovie() : Class
      {
         return GodIceCanonIraqThirdShotMovie;
      }
      
      override public function a_1797(iGlobalID:int, numSpeed:Number, iHurtPower:int, iXpos:int, iYpos:int, stCurrentBattleView:BattleFieldView, stStartFieldGrid:a_3491, isBothWayShot:Boolean = false, numHotMultiplier:Number = 1, iThreeRowShotType:int = 0) : Boolean
      {
         super.a_1797(iGlobalID,numSpeed,iHurtPower,iXpos,iYpos,stCurrentBattleView,stStartFieldGrid,isBothWayShot,numHotMultiplier);
         return true;
      }
      
      override public function a_4216(iCurrentTime:int) : void
      {
         if(a_1588)
         {
            nextFrame();
            if(a_1273 == 5)
            {
               BattleFieldView.ms_bingshen_90.play();
               if(Boolean(this.a_1607) && this.a_1607.iLifeValue > 0)
               {
                  HitMoveIntruder2(this.a_1607,[102]);
               }
               this.a_4360(a_1584);
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
         var power:int = 0;
         for(var i:int = stHitenFieldGrid.m_iXGridNo - this.m_range; i <= stHitenFieldGrid.m_iXGridNo + this.m_range; i++)
         {
            for(j = stHitenFieldGrid.m_iYGridNo - this.m_range; j <= stHitenFieldGrid.m_iYGridNo + this.m_range; j++)
            {
               stFieldGrid = a_1583.a_3438(i,j);
               if(null != stFieldGrid)
               {
                  arrMouveIntruder = stFieldGrid.a_1511.slice();
                  for each(stMouseIntruder in arrMouveIntruder)
                  {
                     if(stMouseIntruder != this.a_1607 && stMouseIntruder.visible && stMouseIntruder.iLifeValue > 0 && (stMouseIntruder.iSpaceState != 0 || !stMouseIntruder.isCannotSeeByFighter))
                     {
                        power = GetFinalDamage() * 0.45;
                        stMouseIntruder.ReduceLife2(power,[102]);
                     }
                  }
               }
            }
         }
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

