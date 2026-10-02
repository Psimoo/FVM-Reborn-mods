package com.aurora.ui.maogoutd.resource.defender.PigYear.CallWealthMeow
{
   import a_4718.b_182;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.shot.a_4348;
   import flash.display.FrameLabel;
   
   public class CallWealthMeowSecondShot extends a_4348
   {
      
      private static var ms_arrShot:Array = new Array();
      
      public var m_stMouseIntruder:a_4206;
      
      private var a_1607:a_4206;
      
      public function CallWealthMeowSecondShot()
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
      
      public static function a_4344() : CallWealthMeowSecondShot
      {
         var stShot:CallWealthMeowSecondShot = ms_arrShot.pop();
         if(null == stShot)
         {
            stShot = new CallWealthMeowSecondShot();
         }
         return stShot;
      }
      
      override protected function getBindMovie() : Class
      {
         return CallWealthMeowSecondShotMovie;
      }
      
      override public function a_1797(iGlobalID:int, numSpeed:Number, iHurtPower:int, iXpos:int, iYpos:int, stCurrentBattleView:BattleFieldView, stStartFieldGrid:a_3491, isBothWayShot:Boolean = false, numHotMultiplier:Number = 1, iThreeRowShotType:int = 0) : Boolean
      {
         super.a_1797(iGlobalID,numSpeed,iHurtPower,iXpos,iYpos,stCurrentBattleView,stStartFieldGrid,isBothWayShot,numHotMultiplier);
         a_1447 = 0;
         m_numXSpeed *= -1;
         a_1275 = 1;
         a_1587 = 1;
         a_1574 = 0;
         gotoAndStop((a_1276[1] as FrameLabel).frame);
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
            if(a_1273 == a_1274 - 4 || a_1278 != null)
            {
               BattleFieldView.ms_zhaocaimiao_87.play();
               if(this.m_stMouseIntruder != null)
               {
                  if(Math.random() * 100 <= 2)
                  {
                     this.m_stMouseIntruder.a_4208(b_182.enm_shotEffectXuanYun,15);
                  }
                  this.a_4352(this.m_stMouseIntruder);
               }
            }
            if(a_1273 == a_1274 || a_1278 != null)
            {
               m_bActive.Value = false;
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
      
      override public function a_4352(baseMoveIntruder:a_4206) : Boolean
      {
         m_bActive.Value = false;
         if(a_1576 || a_1575)
         {
            if(ms_iCritFrameLable == 2)
            {
               baseMoveIntruder.ReduceLifeIgnoreArmor2(0.3 * GetFinalDamage(),[102]);
            }
            else
            {
               baseMoveIntruder.ReduceLifeIgnoreArmor2(GetFinalDamage(),[102]);
            }
         }
         else if(ms_iCritFrameLable == 2)
         {
            baseMoveIntruder.ReduceLife2(0.3 * GetFinalDamage(),[102]);
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
         if(-1 == ms_arrShot.indexOf(this))
         {
            ms_arrShot.push(this);
         }
         super.a_3940();
         return true;
      }
   }
}

