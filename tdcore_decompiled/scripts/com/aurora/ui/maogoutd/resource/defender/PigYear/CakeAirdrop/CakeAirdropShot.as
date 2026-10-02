package com.aurora.ui.maogoutd.resource.defender.PigYear.CakeAirdrop
{
   import a_4718.b_182;
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.shot.SecretWish.CollisionHit;
   import com.aurora.ui.maogoutd.resource.shot.a_4348;
   import flash.geom.Rectangle;
   
   public class CakeAirdropShot extends a_4348
   {
      
      private var a_1607:a_4206;
      
      public function CakeAirdropShot()
      {
         super();
         a_1279 = -width * 0.5;
         a_1574 = 100;
         a_1573 = 1;
         a_1578 = true;
         m_isShotHighSkySpace = true;
         a_1576 = false;
         a_1577 = false;
      }
      
      public static function a_4344() : CakeAirdropShot
      {
         return PoolManager.getInstance().CheckOutOne(CakeAirdropShot,CakeAirdropShotMovie) as CakeAirdropShot;
      }
      
      public static function GetFreeShot1() : CakeAirdropShot
      {
         return PoolManager.getInstance().CheckOutOne(CakeAirdropShot,CakeAirdropShot1Movie) as CakeAirdropShot;
      }
      
      override public function a_1797(iGlobalID:int, numSpeed:Number, iHurtPower:int, iXpos:int, iYpos:int, stCurrentBattleView:BattleFieldView, stStartFieldGrid:a_3491, isBothWayShot:Boolean = false, numHotMultiplier:Number = 1, iThreeRowShotType:int = 0) : Boolean
      {
         var stMoveIntruder:a_4206 = null;
         if(stStartFieldGrid != null && stStartFieldGrid.a_1511.length != 0)
         {
            stMoveIntruder = stStartFieldGrid.a_1511[0];
            super.a_1797(iGlobalID,numSpeed,iHurtPower,stMoveIntruder.x,stMoveIntruder.y + 0.5 * stMoveIntruder.height - 180,stCurrentBattleView,stStartFieldGrid,isBothWayShot,numHotMultiplier);
         }
         else
         {
            super.a_1797(iGlobalID,numSpeed,iHurtPower,iXpos,iYpos,stCurrentBattleView,stStartFieldGrid,isBothWayShot,numHotMultiplier);
         }
         a_1447 = 0;
         m_numXSpeed *= -1;
         a_1275 = 0;
         a_1587 = 0;
         gotoAndStop(1);
         a_1578 = false;
         m_isShotHighSkySpace = true;
         a_1576 = false;
         a_1577 = false;
         a_1573 = 1;
         m_isHited = true;
         return true;
      }
      
      override public function a_4216(iCurrentTime:int) : void
      {
         if(m_isHited)
         {
            nextFrame();
            if(a_1273 == a_1274 - 5 || a_1278 != null)
            {
               m_bActive.Value = false;
               this.a_4360(a_1584);
               this.a_3940();
            }
            return;
         }
         if(a_1588)
         {
            nextFrame();
            if(a_1273 == a_1274 || a_1278 != null)
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
         var arrMouveIntruder:Array = null;
         var stMouseIntruder:a_4206 = null;
         var rect:Rectangle = null;
         if(stHitenFieldGrid)
         {
            arrMouveIntruder = stHitenFieldGrid.m_stCurrentBattbleFieldView.m_arrBaseMoveIntruderVector;
            for each(stMouseIntruder in arrMouveIntruder)
            {
               if(null != stMouseIntruder && false == stMouseIntruder.isCannotSeeByFighter)
               {
                  rect = CollisionHit.complexIntersectionRectangle(this,stMouseIntruder);
                  if(rect.width != 0 && rect.height != 0)
                  {
                     stMouseIntruder.a_4210();
                     if(m_isSpecial == 1)
                     {
                        if(Math.random() * 100 <= 15 && stMouseIntruder.iLifeValue > 0)
                        {
                           stMouseIntruder.a_4208(b_182.enm_shotEffectXuanYun,20);
                        }
                     }
                  }
               }
            }
         }
      }
      
      override public function a_4352(baseMoveIntruder:a_4206) : Boolean
      {
         m_bActive.Value = false;
         if(a_1576 || a_1575)
         {
            if(ms_iCritFrameLable == 2)
            {
               baseMoveIntruder.a_4209(0.3 * GetFinalDamage());
            }
            else
            {
               baseMoveIntruder.a_4209(GetFinalDamage());
            }
         }
         else if(ms_iCritFrameLable == 2)
         {
            baseMoveIntruder.a_3969(0.3 * GetFinalDamage());
         }
         else
         {
            baseMoveIntruder.a_3969(GetFinalDamage());
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
         if(a_1325 > 1)
         {
            baseMoveIntruder.a_4208(b_182.a_433,0);
         }
         return true;
      }
      
      override protected function a_3940() : Boolean
      {
         this.a_1607 = null;
         ms_iCritFrameLable = 0;
         super.a_3940();
         return true;
      }
   }
}

