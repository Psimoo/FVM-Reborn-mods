package com.aurora.ui.maogoutd.resource.Intruder.BaseCamp.boss.TravelRecordPlayer
{
   import a_4718.b_182;
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.effect.a_4108;
   import flash.display.FrameLabel;
   
   public class MoonMoveIntruder extends a_4206
   {
      
      private const FULL_HP:int = 200000;
      
      private const HURT_HP:int = 100000;
      
      private const DEAD_HP:int = 0;
      
      private var m_iAppearedTime:int;
      
      public function MoonMoveIntruder()
      {
         super();
         a_1481 = false;
      }
      
      public static function a_3926() : a_4206
      {
         return PoolManager.getInstance().CheckOutOne(MoonMoveIntruder) as MoonMoveIntruder;
      }
      
      override protected function getBindMovie() : Class
      {
         return MoonMoveIntruderMovie;
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
         BoomIsReduceLife = false;
         a_1464 = true;
         a_1462 = false;
         a_1463 = true;
         a_1279 = -10;
         a_1467 = 6;
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
            if(m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.GetGameMoveMap())
            {
               m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.GetGameMoveMap().AddMoveDisplayObject(this,m_stCurrentFieldGrid.m_iXGridNo,m_stCurrentFieldGrid.m_iYGridNo);
            }
         }
         super.a_3940();
         return true;
      }
      
      override protected function ResetMovieStatus() : Boolean
      {
         if(a_1339 <= 0)
         {
            if(a_1275 != 1)
            {
               a_1275 = 1;
               gotoAndStop((a_1276[1] as FrameLabel).frame);
               if(Boolean(parent) && parent.contains(this))
               {
                  parent.removeChild(this);
               }
               m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(this,BattleLayerDefine.EFFECTS_TOP_TYPE,m_stCurrentFieldGrid);
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
      
      override public function a_4216(iCurrentTime:int) : Boolean
      {
         var xStart:int = 0;
         var xEnd:int = 0;
         var yStart:int = 0;
         var yEnd:int = 0;
         var stFieldGridVector:Array = null;
         var yIndex:int = 0;
         var xIndex:int = 0;
         var stFieldGrid:a_3491 = null;
         if(!a_1460)
         {
            a_1460 = true;
            a_1275 = 0;
            gotoAndStop((a_1276[0] as FrameLabel).frame);
            this.m_iAppearedTime = 0;
            this.addShield(m_stCurrentFieldGrid);
         }
         if(iCurrentTime % 2 == 0)
         {
            if(a_1273 == 15)
            {
               xStart = Math.max(m_stCurrentFieldGrid.m_iXGridNo - 2,0);
               xEnd = Math.min(m_stCurrentFieldGrid.m_iXGridNo + 2,BattleFieldView.a_1011 - 1);
               yStart = Math.max(m_stCurrentFieldGrid.m_iYGridNo - 2,0);
               yEnd = Math.min(m_stCurrentFieldGrid.m_iYGridNo + 2,BattleFieldView.a_1012 - 1);
               stFieldGridVector = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.stFieldGridsVector;
               for(yIndex = yStart; yIndex <= yEnd; yIndex++)
               {
                  for(xIndex = xStart; xIndex <= xEnd; xIndex++)
                  {
                     stFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(xIndex,yIndex);
                     this.a_3502(stFieldGrid);
                  }
               }
            }
            else if(a_1273 == a_1274)
            {
               this.a_3940();
            }
         }
         if(this.m_iAppearedTime >= 7 * 20)
         {
            if(a_1275 != 1)
            {
               a_1275 = 1;
               gotoAndStop((a_1276[1] as FrameLabel).frame);
               if(Boolean(parent) && parent.contains(this))
               {
                  parent.removeChild(this);
               }
               m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(this,BattleLayerDefine.EFFECTS_TOP_TYPE,m_stCurrentFieldGrid);
            }
         }
         else if(this.m_iAppearedTime >= 0)
         {
            ++this.m_iAppearedTime;
         }
         return true;
      }
      
      protected function addShield(stFieldGrid:a_3491) : Boolean
      {
         this.a_3502(stFieldGrid);
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

