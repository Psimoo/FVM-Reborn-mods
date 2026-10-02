package com.aurora.ui.maogoutd.resource.Intruder.WonderLand.boss.CrazyAlice
{
   import a_4718.b_182;
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.effect.a_4108;
   import flash.display.FrameLabel;
   
   public class MazeObstacleThreeMoveIntruder extends a_4206
   {
      
      private const FULL_HP:int = 90000;
      
      private const HURT_HP:int = 45000;
      
      private const DEAD_HP:int = 0;
      
      private var m_iAppearedTime:int;
      
      public function MazeObstacleThreeMoveIntruder()
      {
         super();
         a_1481 = false;
      }
      
      public static function a_3926() : a_4206
      {
         return PoolManager.getInstance().CheckOutOne(MazeObstacleThreeMoveIntruder) as MazeObstacleThreeMoveIntruder;
      }
      
      override protected function getBindMovie() : Class
      {
         return MazeObstacleThreeMoveIntruderMovie;
      }
      
      override public function a_1797(iGlobalMoveFighterID:int, iIntruderMoveDirection:int) : Boolean
      {
         super.a_1797(iGlobalMoveFighterID,iIntruderMoveDirection);
         a_1350 = a_3491.a_1080 / (1 * 20);
         if(iIntruderMoveDirection < 0)
         {
            a_1350 *= -1;
         }
         a_1339 = this.FULL_HP;
         BoomIsReduceLife = true;
         a_1464 = true;
         a_1462 = false;
         this.m_iAppearedTime = 0;
         a_1279 = 5;
         a_1467 = -52;
         return true;
      }
      
      override protected function a_3940() : Boolean
      {
         if(m_stCurrentFieldGrid != null)
         {
            if(m_stCurrentFieldGrid.m_stMouseObstacle)
            {
               m_stCurrentFieldGrid.m_stMouseObstacle = null;
            }
            this.ClearShield(m_stCurrentFieldGrid);
         }
         super.a_3940();
         return true;
      }
      
      override protected function ResetMovieStatus() : Boolean
      {
         if(a_1339 <= this.HURT_HP)
         {
            if(a_1339 <= 0)
            {
               if(a_1339 <= 0)
               {
                  if(m_stCurrentFieldGrid)
                  {
                     m_stCurrentFieldGrid.a_3457(this);
                     m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3457(this);
                  }
                  this.a_3940();
               }
            }
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
         super.a_4210();
         return true;
      }
      
      override public function nextFrame() : void
      {
         super.nextFrame();
         if(a_1278 != null || a_1273 == a_1274)
         {
            this.gotoAndStop((a_1276[a_1275] as FrameLabel).frame);
         }
      }
      
      override public function gotoAndStop(frame:Object, scene:String = null) : void
      {
         super.gotoAndStop(frame);
      }
      
      override public function a_4216(iCurrentTime:int) : Boolean
      {
         if(!a_1460)
         {
            a_1460 = true;
            a_1275 = 1;
            this.gotoAndStop((a_1276[0] as FrameLabel).frame);
            this.addShield(m_stCurrentFieldGrid);
         }
         if(iCurrentTime % 2 == 0)
         {
         }
         return true;
      }
      
      protected function addShield(stFieldGrid:a_3491) : Boolean
      {
         this.a_3502(stFieldGrid);
         if(stFieldGrid != null && 0 == stFieldGrid.m_iFieldGridType)
         {
            stFieldGrid.m_iFieldGridType = 4;
         }
         return true;
      }
      
      protected function a_3502(stFieldGrid:a_3491) : Boolean
      {
         if(null == stFieldGrid)
         {
            return false;
         }
         return stFieldGrid.ClearFieldGridDefenseWithOption();
      }
      
      protected function ClearShield(stFieldGrid:a_3491) : Boolean
      {
         if(stFieldGrid != null && stFieldGrid.m_iFieldGridType == 4)
         {
            stFieldGrid.m_iFieldGridType = 0;
         }
         return true;
      }
      
      override public function a_4208(iEffectType:int, iEffectTime:int, stBaseEffect:a_4108 = null) : void
      {
         if(b_182.a_432 == iEffectType)
         {
            super.a_4208(iEffectType,iEffectTime,stBaseEffect);
         }
      }
      
      override public function ShowBoomDieEffect() : void
      {
      }
   }
}

