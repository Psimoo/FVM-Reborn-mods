package com.aurora.ui.maogoutd.resource.gamemap.newMap.DragonYear.ColdStarRing
{
   import a_4718.b_181;
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.defender.a_3962;
   import com.aurora.ui.maogoutd.resource.gamemap.newMap.BaseGameMoveMap;
   import com.aurora.ui.maogoutd.resource.moveBlock.MoveBlockMap;
   import flash.display.FrameLabel;
   
   public class ColdStarRingObstacleMoveIntruder extends a_4206
   {
      
      private var MAX_INJURED_LIFE:int = 1;
      
      private var m_stBlockMap:MoveBlockMap;
      
      private var m_stMap:IColdStarRingMap;
      
      public function ColdStarRingObstacleMoveIntruder()
      {
         super();
      }
      
      public static function a_3926() : ColdStarRingObstacleMoveIntruder
      {
         return PoolManager.getInstance().CheckOutOne(ColdStarRingObstacleMoveIntruder) as ColdStarRingObstacleMoveIntruder;
      }
      
      override protected function getBindMovie() : Class
      {
         return ColdStarRingObstacleMoveIntruderMovie;
      }
      
      override public function a_1797(iGlobalMoveFighterID:int, iIntruderMoveDirection:int) : Boolean
      {
         super.a_1797(iGlobalMoveFighterID,iIntruderMoveDirection);
         a_1350 = 0;
         if(iIntruderMoveDirection < 0)
         {
            a_1350 *= -1;
         }
         a_1339 = 1;
         this.MAX_INJURED_LIFE = 1;
         a_1279 = 0;
         m_iYDisplayCenterPos = -5;
         a_1272 = 0;
         a_1481 = false;
         a_1464 = true;
         a_1463 = true;
         BoomIsReduceLife = true;
         return true;
      }
      
      public function InitData(hp:int, blockMap:MoveBlockMap, map:IColdStarRingMap) : void
      {
         a_1339 = hp;
         this.MAX_INJURED_LIFE = hp * 0.3;
         this.m_stBlockMap = blockMap;
         this.m_stMap = map;
      }
      
      private function BackGrid() : void
      {
         var moveMap:BaseGameMoveMap = null;
         if(this.m_stMap != null && this.m_stBlockMap != null)
         {
            moveMap = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.GetGameMoveMap();
            if(moveMap != null)
            {
               moveMap.RemoveMoveDisplayObject(this);
            }
            this.m_stMap.RemoveTargetgrid(this.m_stBlockMap);
            this.m_stMap = null;
            this.m_stBlockMap = null;
         }
      }
      
      override protected function a_3940() : Boolean
      {
         this.BackGrid();
         super.a_3940();
         return true;
      }
      
      override protected function ResetMovieStatus() : Boolean
      {
         if(a_1339 > this.MAX_INJURED_LIFE)
         {
            if(a_1275 != 0)
            {
               a_1275 = 0;
               gotoAndStop((a_1276[0] as FrameLabel).frame);
            }
            a_3419();
         }
         else if(a_1339 > 0)
         {
            if(a_1275 != 1)
            {
               a_1275 = 1;
               gotoAndStop((a_1276[1] as FrameLabel).frame);
            }
            a_3419();
         }
         else if(a_1339 <= 0 && a_1275 != 2)
         {
            a_1275 = 2;
            gotoAndStop((a_1276[2] as FrameLabel).frame);
            a_3419();
            if(m_stCurrentFieldGrid)
            {
               m_stCurrentFieldGrid.a_3457(this);
               m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3457(this);
            }
            this.play();
         }
         return true;
      }
      
      override public function a_4213() : Boolean
      {
         this.a_3969(900);
         if(a_1339 <= 0)
         {
            this.a_4212();
         }
         if(a_1339 <= 0)
         {
            this.BackGrid();
         }
         return true;
      }
      
      override public function a_4212() : Boolean
      {
         if(m_stCurrentFieldGrid)
         {
            this.a_3969(900);
         }
         else
         {
            a_1339 = 0;
            this.a_3940();
         }
         if(a_1339 <= 0)
         {
            this.BackGrid();
         }
         return true;
      }
      
      override public function a_3969(iRduceLifeValue:int) : Boolean
      {
         super.a_3969(iRduceLifeValue);
         if(a_1339 <= 0)
         {
            this.BackGrid();
         }
         return true;
      }
      
      override public function a_4215(stBaseDefense:a_3962) : Boolean
      {
         super.a_4215(stBaseDefense);
         return true;
      }
      
      override public function a_4216(iCurrentTime:int) : Boolean
      {
         var numOrigXPos:Number = x;
         super.a_4216(iCurrentTime);
         if(a_1457 == b_181.a_424 && (x > a_3491.a_1080 * 4 && a_1283 || x < a_3491.a_1080 * 5 && !a_1283))
         {
            y += Math.tan(15 * Math.PI / 180) * Math.abs(numOrigXPos - x);
         }
         return true;
      }
      
      override public function play() : void
      {
         super.play();
      }
   }
}

