package com.aurora.ui.maogoutd.resource.Intruder.SnakeYear.CrossServerMouse.HarbahMouse
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.effect.a_4143;
   import flash.display.FrameLabel;
   
   public class DartGunMouseMoveIntruder extends a_4206
   {
      
      private const FULL_HP:int = 9000;
      
      private const HURT_HP:int = 4500;
      
      private const DEAD_HP:int = 0;
      
      private var m_ThrowOverGun:Boolean;
      
      private var a_1502:Boolean;
      
      public function DartGunMouseMoveIntruder()
      {
         super();
      }
      
      public static function a_3926() : a_4206
      {
         return PoolManager.getInstance().CheckOutOne(DartGunMouseMoveIntruder) as DartGunMouseMoveIntruder;
      }
      
      override protected function getBindMovie() : Class
      {
         return DartGunMouseMoveIntruderMovie;
      }
      
      override public function a_1797(iGlobalMoveFighterID:int, iIntruderMoveDirection:int) : Boolean
      {
         super.a_1797(iGlobalMoveFighterID,iIntruderMoveDirection);
         a_1350 = a_3491.a_1080 / (6.5 * 20);
         if(iIntruderMoveDirection < 0)
         {
            a_1350 *= -1;
         }
         a_1339 = this.FULL_HP;
         a_1279 = -width * 0.3;
         a_1272 = 0;
         a_1377 = 0;
         a_1476 = 50;
         a_1477 = 0;
         this.m_ThrowOverGun = false;
         this.a_1502 = false;
         tagCom.AddTag(401);
         return true;
      }
      
      protected function a_2180() : int
      {
         return (globalMoveFighterID << 16) + 1;
      }
      
      override protected function ResetMovieStatus() : Boolean
      {
         if(a_1339 > this.HURT_HP)
         {
            if(this.a_1502)
            {
               if(a_1275 != 4)
               {
                  a_1275 = 4;
                  gotoAndStop((a_1276[4] as FrameLabel).frame);
               }
            }
            else if(a_1475)
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
            a_3419();
         }
         else if(a_1339 > this.DEAD_HP)
         {
            if(this.a_1502)
            {
               if(a_1275 != 5)
               {
                  a_1275 = 5;
                  gotoAndStop((a_1276[5] as FrameLabel).frame);
               }
            }
            else if(a_1475)
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
            a_3419();
         }
         else if(a_1339 <= this.DEAD_HP && a_1275 != 6)
         {
            a_1275 = 6;
            gotoAndStop((a_1276[6] as FrameLabel).frame);
            a_3419();
            if(m_stCurrentFieldGrid)
            {
               m_stCurrentFieldGrid.a_3457(this);
               m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3457(this);
            }
            play();
         }
         return true;
      }
      
      override public function a_3969(iRduceLifeValue:int) : Boolean
      {
         super.a_3969(iRduceLifeValue);
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
            a_3940();
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
            a_3940();
         }
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
         var tagetFieldGrid:a_3491 = null;
         if(!this.m_ThrowOverGun)
         {
            if(m_stCurrentFieldGrid.m_iXGridNo == BattleFieldView.a_1011 - 3)
            {
               if(x <= m_stCurrentFieldGrid.m_iXGridNo * a_3491.a_1080 + a_3491.a_1080 / 2)
               {
                  if(a_1339 > this.HURT_HP)
                  {
                     if(a_1275 != 4)
                     {
                        a_1275 = 0;
                        gotoAndStop((a_1276[4] as FrameLabel).frame);
                     }
                  }
                  else if(a_1275 != 5)
                  {
                     a_1275 = 1;
                     gotoAndStop((a_1276[5] as FrameLabel).frame);
                  }
                  this.a_1502 = true;
                  this.m_ThrowOverGun = true;
               }
            }
            else if(m_stCurrentFieldGrid.m_iXGridNo < BattleFieldView.a_1011 - 3)
            {
               this.m_ThrowOverGun = true;
            }
         }
         if(this.a_1502)
         {
            if(iCurrentTime % 2 == 0)
            {
               trace("m_iCurrentFrame:::::::::" + a_1273);
               if(a_1273 == (a_1276[4] as FrameLabel).frame + 13 || a_1273 == (a_1276[5] as FrameLabel).frame + 13)
               {
                  tagetFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(m_stCurrentFieldGrid.m_iXGridNo - 3,m_stCurrentFieldGrid.m_iYGridNo);
                  if(tagetFieldGrid)
                  {
                     this.addEarthHole(tagetFieldGrid);
                  }
               }
               else if(a_1273 == (a_1276[5] as FrameLabel).frame - 1 || a_1273 == (a_1276[6] as FrameLabel).frame - 1)
               {
                  if(this.a_1502)
                  {
                     this.a_1502 = false;
                  }
               }
            }
         }
         else
         {
            super.a_4216(iCurrentTime);
            if(a_1473 <= 0 && a_1474 <= 0 && iCurrentTime == a_1477 + 22)
            {
               GiantJumpSplashDamageOnGrid(900);
            }
         }
         return true;
      }
      
      private function addEarthHole(stFieldGrid:a_3491) : void
      {
         var stDartGunMouseEarthHole:DartGunMouseEarthHole = null;
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
            stDartGunMouseEarthHole = DartGunMouseEarthHole.a_3926();
            stDartGunMouseEarthHole.m_stCurrentFieldGrid = stFieldGrid;
            stDartGunMouseEarthHole.a_1797(a_1283);
            stDartGunMouseEarthHole.m_iOldFieldGridType = m_iOldFieldGridType;
            stDartGunMouseEarthHole.x = a_3491.a_1080 * stFieldGrid.m_iXGridNo + 0.5 * (a_3491.a_1080 - stDartGunMouseEarthHole.width) + 12;
            stDartGunMouseEarthHole.y = a_3491.a_1081 * stFieldGrid.m_iYGridNo + (a_3491.a_1081 - stDartGunMouseEarthHole.height) - 5;
            stFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(stDartGunMouseEarthHole,BattleLayerDefine.OBSTACL_TYPE,stFieldGrid);
            if(stFieldGrid.m_stCurrentBattbleFieldView.GetGameMoveMap())
            {
               stFieldGrid.m_stCurrentBattbleFieldView.GetGameMoveMap().AddMoveDisplayObject(stDartGunMouseEarthHole,stFieldGrid.m_iXGridNo,stFieldGrid.m_iYGridNo);
            }
            stDartGunMouseEarthHole.play();
            stFieldGrid.m_stMouseEarthHole = stDartGunMouseEarthHole;
            if(a_1283)
            {
               stDartGunMouseEarthHole.x = BattleFieldView.a_1013 - stDartGunMouseEarthHole.x;
            }
         }
      }
      
      override public function a_4140(iCurrentTime:int) : void
      {
         super.a_4140(iCurrentTime);
      }
   }
}

