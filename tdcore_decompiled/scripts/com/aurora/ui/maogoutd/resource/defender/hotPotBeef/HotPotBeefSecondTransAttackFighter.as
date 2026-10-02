package com.aurora.ui.maogoutd.resource.defender.hotPotBeef
{
   import a_4715.EncrypIntEx;
   import a_4718.b_182;
   import a_4718.b_183;
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.defender.a_3953;
   import flash.display.FrameLabel;
   
   public class HotPotBeefSecondTransAttackFighter extends a_3953
   {
      
      private var m_iLaunchShotCount:EncrypIntEx;
      
      public function HotPotBeefSecondTransAttackFighter()
      {
         super();
         this.m_iLaunchShotCount = new EncrypIntEx();
         this.m_iLaunchShotCount.Value = 10;
         a_1323 = this.m_iLaunchShotCount.Value;
         a_1304 = b_183.enm_HotPotBeefShot;
         a_1337 = -10;
         a_1338 = 10;
         a_1312 = 0;
         a_1309 = HotPotBeefDefine.a_3966(m_iSkillDegree);
         a_1311 = HotPotBeefDefine.a_3965(a_1094) * (1 + HotPotBeefDefine.FIRSTTRANS_ADDITION);
         a_1310 = 16;
         a_1317 = 6;
         a_1095 = HotPotBeefDefine.DEFENSE_PRICE + 75;
         a_1314 = false;
      }
      
      public static function a_3926() : a_3953
      {
         return PoolManager.getInstance().CheckOutOne(HotPotBeefSecondTransAttackFighter) as HotPotBeefSecondTransAttackFighter;
      }
      
      override protected function getBindMovie() : Class
      {
         return HotPotBeefSecondTransAttackFighterMovie;
      }
      
      override public function a_1797(stFieldGrid:a_3491) : Boolean
      {
         super.a_1797(stFieldGrid);
         a_1323 = this.m_iLaunchShotCount.Value;
         a_1309 = HotPotBeefDefine.a_3966(m_iSkillDegree);
         a_1311 = HotPotBeefDefine.a_3965(a_1094) * (1 + HotPotBeefDefine.FIRSTTRANS_ADDITION);
         a_1310 = 16;
         a_1317 = 6;
         a_1314 = false;
         return true;
      }
      
      override public function a_3954(iCurrentTime:int) : Boolean
      {
         if(iCurrentTime > m_iPlaceTimeIntervals + a_1308 && iCurrentTime >= a_1321 + a_1309)
         {
            a_1321 = iCurrentTime;
            a_1323 = 0;
            a_1307 = 1;
            a_1275 = 0;
            gotoAndStop((a_1276[1] as FrameLabel).frame);
         }
         if(a_1323 < this.m_iLaunchShotCount.Value && iCurrentTime >= a_1321 + a_1310 + a_1323 * a_1317)
         {
            ++a_1323;
            this.a_4360();
         }
         return true;
      }
      
      private function a_4360() : void
      {
         var stFieldGrid:a_3491 = null;
         var iAdd:int = 0;
         var arrMouveIntruder:Array = null;
         var stMoveIntruder:a_4206 = null;
         var iYGridNo:int = a_1334.m_iYGridNo;
         var lx:int = a_1334.m_iXGridNo;
         var rx:int = 0;
         var iAttackLen:int = 6;
         var addCenter:Number = a_1334.getStraightShotMultiplier();
         if(a_1283)
         {
            iAdd = -1;
            rx = Math.max(-1,lx - iAttackLen);
         }
         else
         {
            iAdd = 1;
            rx = Math.min(BattleFieldView.a_1011,lx + iAttackLen);
         }
         for(var iXGridNo:int = lx; iXGridNo != rx; iXGridNo += iAdd)
         {
            stFieldGrid = a_1334.m_stCurrentBattbleFieldView.a_3438(iXGridNo,iYGridNo);
            if(null != stFieldGrid)
            {
               arrMouveIntruder = stFieldGrid.a_1511.slice();
               for each(stMoveIntruder in arrMouveIntruder)
               {
                  if(null != stMoveIntruder && (0 == stMoveIntruder.iSpaceState || 2 == stMoveIntruder.iSpaceState) && !stMoveIntruder.isCannotSeeByFighter)
                  {
                     stMoveIntruder.a_4209(a_1311 * addCenter);
                     if(stMoveIntruder.iLifeValue <= 0 && Boolean(stMoveIntruder.m_stCurrentFieldGrid))
                     {
                        stMoveIntruder.a_4210();
                     }
                     else
                     {
                        stMoveIntruder.a_4208(b_182.a_432,5);
                     }
                  }
               }
            }
         }
      }
      
      override protected function a_3955() : Number
      {
         return 55;
      }
      
      override protected function a_3956() : Number
      {
         return -25;
      }
      
      override public function a_3957(iCurrentTime:int) : void
      {
         if((iCurrentTime & 1) == 0)
         {
            super.a_3957(iCurrentTime);
         }
      }
      
      override protected function a_3964() : int
      {
         return HotPotBeefDefine.a_3964();
      }
   }
}

