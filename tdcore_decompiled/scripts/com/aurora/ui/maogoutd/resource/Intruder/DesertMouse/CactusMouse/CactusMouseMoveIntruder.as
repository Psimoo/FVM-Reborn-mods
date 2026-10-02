package com.aurora.ui.maogoutd.resource.Intruder.DesertMouse.CactusMouse
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.avatar.a_3924;
   import com.aurora.ui.maogoutd.resource.defender.a_3962;
   import com.aurora.ui.maogoutd.resource.shot.a_4348;
   import flash.display.FrameLabel;
   
   public class CactusMouseMoveIntruder extends a_4206
   {
      
      private static const MAX_LIFE:int = 1200;
      
      private static const MAX_INJURED_LIFE:int = MAX_LIFE * 0.3;
      
      protected var m_isThrowOver:Boolean;
      
      protected var m_iThrowBoomTime:int;
      
      protected var a_1304:uint = 0;
      
      protected var a_1311:int = 90;
      
      protected var a_1312:int = 15;
      
      public function CactusMouseMoveIntruder()
      {
         super();
      }
      
      public static function a_3926() : a_4206
      {
         return PoolManager.getInstance().CheckOutOne(CactusMouseMoveIntruder) as CactusMouseMoveIntruder;
      }
      
      override protected function getBindMovie() : Class
      {
         return CactusMouseMoveIntruderMovie;
      }
      
      override public function a_1797(iGlobalMoveFighterID:int, iIntruderMoveDirection:int) : Boolean
      {
         super.a_1797(iGlobalMoveFighterID,iIntruderMoveDirection);
         a_1350 = a_3491.a_1080 / 60;
         if(iIntruderMoveDirection < 0)
         {
            a_1350 *= -1;
         }
         a_1339 = MAX_LIFE;
         a_1279 = -width * 0.5 + 15;
         this.m_iThrowBoomTime = 0;
         this.m_isThrowOver = false;
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
         if(a_1339 > MAX_INJURED_LIFE)
         {
            if(!this.m_isThrowOver)
            {
               return false;
            }
            if(a_1475)
            {
               if(a_1275 != 8)
               {
                  a_1275 = 8;
                  gotoAndStop((a_1276[8] as FrameLabel).frame);
               }
            }
            else if(this.m_isThrowOver)
            {
               if(a_1275 != 6)
               {
                  a_1275 = 6;
                  gotoAndStop((a_1276[6] as FrameLabel).frame);
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
            if(!this.m_isThrowOver)
            {
               return false;
            }
            if(a_1475)
            {
               if(a_1275 != 9)
               {
                  a_1275 = 9;
                  gotoAndStop((a_1276[9] as FrameLabel).frame);
               }
            }
            else if(this.m_isThrowOver)
            {
               if(a_1275 != 7)
               {
                  a_1275 = 7;
                  gotoAndStop((a_1276[7] as FrameLabel).frame);
               }
            }
            else if(a_1275 != 1)
            {
               a_1275 = 1;
               gotoAndStop((a_1276[1] as FrameLabel).frame);
            }
         }
         else if(a_1339 <= 0 && a_1275 != 10)
         {
            a_1275 = 10;
            gotoAndStop((a_1276[10] as FrameLabel).frame);
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
         return true;
      }
      
      override public function a_4210() : Boolean
      {
         if(m_stCurrentFieldGrid)
         {
            m_stCurrentFieldGrid.a_3457(this);
            m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3457(this);
         }
         super.a_4210();
         return true;
      }
      
      override public function a_4215(stBaseDefense:a_3962) : Boolean
      {
         super.a_4215(stBaseDefense);
         return true;
      }
      
      override public function a_4216(iCurrentTime:int) : Boolean
      {
         var stStartFieldGrid:a_3491 = null;
         var stLastWaitShot:a_4348 = null;
         var m_stTargetFieldGrid2:a_3491 = null;
         var m_stTargetFieldGrid1:a_3491 = null;
         if(this.m_iThrowBoomTime > 0)
         {
            trace("m_iCurrentFrame::" + a_1273);
            --this.m_iThrowBoomTime;
            if(this.m_iThrowBoomTime == 14)
            {
               stStartFieldGrid = m_stCurrentFieldGrid;
               m_stTargetFieldGrid2 = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(5,m_stCurrentFieldGrid.m_iYGridNo);
               if(Boolean(stStartFieldGrid) && !(m_stTargetFieldGrid2.m_stAttackFighter is a_3924))
               {
                  stLastWaitShot = CactusMouseShot.a_4344();
                  stLastWaitShot.iShotSequenceNum = 2;
                  stLastWaitShot.a_1797(0,this.a_1312,this.a_1311,x,y,m_stCurrentFieldGrid.m_stCurrentBattbleFieldView,stStartFieldGrid);
                  m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(stLastWaitShot,BattleLayerDefine.SHOT_TYPE);
               }
            }
            else if(this.m_iThrowBoomTime == 4)
            {
               stStartFieldGrid = m_stCurrentFieldGrid;
               m_stTargetFieldGrid1 = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(3,m_stCurrentFieldGrid.m_iYGridNo);
               if(Boolean(stStartFieldGrid) && !(m_stTargetFieldGrid1.m_stAttackFighter is a_3924))
               {
                  stLastWaitShot = CactusMouseShot.a_4344();
                  stLastWaitShot.iShotSequenceNum = 1;
                  stLastWaitShot.a_1797(0,this.a_1312,this.a_1311,x,y,m_stCurrentFieldGrid.m_stCurrentBattbleFieldView,stStartFieldGrid);
                  m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(stLastWaitShot,BattleLayerDefine.SHOT_TYPE);
               }
            }
            else if(this.m_iThrowBoomTime == 0)
            {
               this.m_isThrowOver = true;
            }
         }
         else
         {
            this.ResetMovieStatus();
            super.a_4216(iCurrentTime);
            if(!this.m_isThrowOver && m_stCurrentFieldGrid.m_iXGridNo == 7 && this.m_iThrowBoomTime == 0)
            {
               this.m_iThrowBoomTime = 22;
               if(a_1339 > MAX_INJURED_LIFE)
               {
                  a_1275 = 4;
                  gotoAndStop((a_1276[4] as FrameLabel).frame);
               }
               else if(a_1339 > 0)
               {
                  a_1275 = 5;
                  gotoAndStop((a_1276[5] as FrameLabel).frame);
               }
            }
         }
         return true;
      }
      
      private function addEarthHole(stFieldGrid:a_3491) : void
      {
         var stCactusMouseEarthHole:CactusMouseEarthHole = null;
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
            stCactusMouseEarthHole = CactusMouseEarthHole.a_3926();
            stCactusMouseEarthHole.m_stCurrentFieldGrid = m_stCurrentFieldGrid;
            stCactusMouseEarthHole.a_1797(a_1283);
            stCactusMouseEarthHole.m_iOldFieldGridType = m_iOldFieldGridType;
            stCactusMouseEarthHole.x = a_3491.a_1080 * stFieldGrid.m_iXGridNo + 0.5 * (a_3491.a_1080 - stCactusMouseEarthHole.width);
            stCactusMouseEarthHole.y = a_3491.a_1081 * stFieldGrid.m_iYGridNo + (a_3491.a_1081 - stCactusMouseEarthHole.height);
            stFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(stCactusMouseEarthHole,BattleLayerDefine.OBSTACL_TYPE,stFieldGrid);
            if(stFieldGrid.m_stCurrentBattbleFieldView.GetGameMoveMap())
            {
               stFieldGrid.m_stCurrentBattbleFieldView.GetGameMoveMap().AddMoveDisplayObject(stCactusMouseEarthHole,stFieldGrid.m_iXGridNo,stFieldGrid.m_iYGridNo);
            }
            stCactusMouseEarthHole.play();
            stFieldGrid.m_stMouseEarthHole = stCactusMouseEarthHole;
            if(a_1283)
            {
               stCactusMouseEarthHole.x = BattleFieldView.a_1013 - stCactusMouseEarthHole.x;
            }
         }
      }
      
      protected function a_3955() : Number
      {
         return -0.08 * width;
      }
      
      protected function a_3956() : Number
      {
         return -0.08 * height;
      }
   }
}

