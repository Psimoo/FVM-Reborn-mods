package com.aurora.ui.maogoutd.resource.Intruder.IceSnowZombie.ZombiePolarBearMouse
{
   import a_4718.b_181;
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.defender.a_3962;
   import com.aurora.ui.maogoutd.resource.effect.a_4143;
   import flash.display.FrameLabel;
   
   public class ZombiePolarBearMouseMoveIntruder extends a_4206
   {
      
      private const FULL_HP:int = 3500;
      
      private const HURT_HP:int = 1750;
      
      private const DEAD_HP:int = 0;
      
      public function ZombiePolarBearMouseMoveIntruder()
      {
         super();
      }
      
      public static function a_3926() : a_4206
      {
         return PoolManager.getInstance().CheckOutOne(ZombiePolarBearMouseMoveIntruder) as ZombiePolarBearMouseMoveIntruder;
      }
      
      override protected function getBindMovie() : Class
      {
         return ZombiePolarBearMouseMoveIntruderMovie;
      }
      
      override public function a_1797(iGlobalMoveFighterID:int, iIntruderMoveDirection:int) : Boolean
      {
         super.a_1797(iGlobalMoveFighterID,iIntruderMoveDirection);
         a_1350 = a_3491.a_1080 / 130;
         if(iIntruderMoveDirection < 0)
         {
            a_1350 *= -1;
         }
         a_1339 = this.FULL_HP;
         a_1279 = -width * 0.3;
         a_1377 = 0;
         a_1476 = 50;
         a_1477 = 0;
         return true;
      }
      
      override protected function a_3940() : Boolean
      {
         if(m_stCurrentFieldGrid != null && m_iDieType != 2)
         {
            this.addEarthHole(m_stCurrentFieldGrid);
         }
         super.a_3940();
         return true;
      }
      
      override protected function ResetMovieStatus() : Boolean
      {
         if(a_1339 > 900)
         {
            if(a_1475)
            {
               if(a_1275 != 2)
               {
                  a_1275 = 2;
                  gotoAndStop((a_1276[2] as FrameLabel).frame);
               }
            }
            else if(a_1275 != 0)
            {
               a_1275 = 0;
               gotoAndStop((a_1276[0] as FrameLabel).frame);
            }
         }
         else if(a_1339 > 0)
         {
            if(a_1475)
            {
               if(a_1275 != 3)
               {
                  a_1275 = 3;
                  gotoAndStop((a_1276[3] as FrameLabel).frame);
               }
            }
            else if(a_1275 != 1)
            {
               a_1275 = 1;
               gotoAndStop((a_1276[1] as FrameLabel).frame);
            }
         }
         else if(a_1339 <= 0 && a_1275 != 4)
         {
            a_1275 = 4;
            gotoAndStop((a_1276[4] as FrameLabel).frame);
            if(m_stCurrentFieldGrid)
            {
               m_stCurrentFieldGrid.a_3457(this);
               m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3457(this);
            }
            play();
         }
         a_3419();
         return true;
      }
      
      override public function a_3969(iRduceLifeValue:int) : Boolean
      {
         super.a_3969(iRduceLifeValue);
         if(a_1339 == 900)
         {
            if(a_1475)
            {
               if(a_1275 != 3)
               {
                  a_1275 = 3;
                  gotoAndStop((a_1276[3] as FrameLabel).frame);
               }
            }
            else if(a_1275 != 1)
            {
               a_1275 = 1;
               gotoAndStop((a_1276[1] as FrameLabel).frame);
            }
         }
         else if(a_1339 <= 0 && a_1275 != 4)
         {
            a_1275 = 4;
            gotoAndStop((a_1276[4] as FrameLabel).frame);
            if(m_stCurrentFieldGrid)
            {
               m_stCurrentFieldGrid.a_3457(this);
               m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3457(this);
            }
            play();
         }
         a_3419();
         return true;
      }
      
      override public function a_4210() : Boolean
      {
         var stSmallMouseBoomdie:a_4143 = null;
         this.a_3969(900);
         if(a_1339 <= 0)
         {
            if(m_stCurrentFieldGrid)
            {
               m_stCurrentFieldGrid.a_3457(this);
               m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3457(this);
            }
            stSmallMouseBoomdie = a_4143.a_3926();
            stSmallMouseBoomdie.a_1797(a_1283);
            stSmallMouseBoomdie.x = x;
            stSmallMouseBoomdie.y = y;
            parent.addChildAt(stSmallMouseBoomdie,parent.getChildIndex(this));
            this.a_3940();
         }
         return true;
      }
      
      override public function a_4211(iCutLifeValue:int) : Boolean
      {
         if(iCutLifeValue > 200)
         {
            iCutLifeValue = 200;
         }
         a_1339 -= iCutLifeValue;
         if(a_1339 <= 0)
         {
            if(m_stCurrentFieldGrid)
            {
               m_stCurrentFieldGrid.a_3457(this);
               m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3457(this);
            }
            this.a_3940();
         }
         return true;
      }
      
      override public function a_4215(stBaseDefense:a_3962) : Boolean
      {
         super.a_4215(stBaseDefense);
         return true;
      }
      
      override public function a_4213() : Boolean
      {
         this.a_3969(900);
         if(a_1339 <= 0)
         {
            a_4212();
         }
         return true;
      }
      
      override public function a_4216(iCurrentTime:int) : Boolean
      {
         var numOrigXPos:Number = x;
         super.a_4216(iCurrentTime);
         if(Boolean(m_stCurrentFieldGrid && null != m_stCurrentFieldGrid.m_stBoomDefense && !m_stCurrentFieldGrid.m_stBoomDefense.isCanBeEaten) && Boolean(iCurrentTime >= a_1477 + a_1476 * (1 / a_1470)) && !a_1464)
         {
            a_1472 = iCurrentTime + 22;
            a_1477 = iCurrentTime;
            a_1475 = true;
            this.a_4215(m_stCurrentFieldGrid.m_stBoomDefense);
            this.ResetMovieStatus();
         }
         if(a_1473 <= 0 && a_1474 <= 0 && iCurrentTime == a_1477 + 22)
         {
            GiantJumpSplashDamageOnGrid(900);
         }
         if(a_1457 == b_181.a_424 && (x > a_3491.a_1080 * 4 && a_1283 || x < a_3491.a_1080 * 5 && !a_1283))
         {
            y += Math.tan(15 * Math.PI / 180) * Math.abs(numOrigXPos - x);
         }
         return true;
      }
      
      private function addEarthHole(stFieldGrid:a_3491) : void
      {
         var stZombiePolarBearMouseEarthHole:ZombiePolarBearMouseEarthHole = null;
         if(stFieldGrid.m_stMouseEarthHole)
         {
            stFieldGrid.m_stMouseEarthHole.a_3940();
            stFieldGrid.m_stMouseEarthHole = null;
         }
         var m_iOldFieldGridType:int = stFieldGrid.m_iFieldGridType;
         if(0 == stFieldGrid.m_iFieldGridType)
         {
            stFieldGrid.m_iFieldGridType = 1;
         }
         if(stFieldGrid.m_iFieldGridType == 1)
         {
            if(stFieldGrid.m_stBaseLander != null)
            {
               stFieldGrid.m_stBaseLander.a_3940();
               stFieldGrid.m_stBaseLander = null;
            }
            stZombiePolarBearMouseEarthHole = ZombiePolarBearMouseEarthHole.a_3926();
            stZombiePolarBearMouseEarthHole.m_stCurrentFieldGrid = m_stCurrentFieldGrid;
            stZombiePolarBearMouseEarthHole.a_1797(a_1283);
            stZombiePolarBearMouseEarthHole.m_iOldFieldGridType = m_iOldFieldGridType;
            stZombiePolarBearMouseEarthHole.x = a_3491.a_1080 * stFieldGrid.m_iXGridNo + 0.5 * (a_3491.a_1080 - stZombiePolarBearMouseEarthHole.width);
            stZombiePolarBearMouseEarthHole.y = a_3491.a_1081 * stFieldGrid.m_iYGridNo + (a_3491.a_1081 - stZombiePolarBearMouseEarthHole.height) - 150;
            stFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(stZombiePolarBearMouseEarthHole,BattleLayerDefine.OBSTACL_TYPE,stFieldGrid);
            if(stFieldGrid.m_stCurrentBattbleFieldView.GetGameMoveMap())
            {
               stFieldGrid.m_stCurrentBattbleFieldView.GetGameMoveMap().AddMoveDisplayObject(stZombiePolarBearMouseEarthHole,stFieldGrid.m_iXGridNo,stFieldGrid.m_iYGridNo);
            }
            stZombiePolarBearMouseEarthHole.play();
            stFieldGrid.m_stMouseEarthHole = stZombiePolarBearMouseEarthHole;
            if(a_1283)
            {
               stZombiePolarBearMouseEarthHole.x = BattleFieldView.a_1013 - stZombiePolarBearMouseEarthHole.x;
            }
         }
      }
   }
}

