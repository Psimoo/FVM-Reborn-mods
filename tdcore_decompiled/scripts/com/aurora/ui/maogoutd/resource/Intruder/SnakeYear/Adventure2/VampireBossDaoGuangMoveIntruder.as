package com.aurora.ui.maogoutd.resource.Intruder.SnakeYear.Adventure2
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.avatar.a_3924;
   import com.aurora.ui.maogoutd.resource.effect.a_4108;
   import flash.display.FrameLabel;
   
   public class VampireBossDaoGuangMoveIntruder extends a_4206
   {
      
      private var m_iStartTimeNum:int;
      
      public function VampireBossDaoGuangMoveIntruder()
      {
         super();
         a_1481 = false;
      }
      
      public static function a_3926() : a_4206
      {
         return PoolManager.getInstance().CheckOutOne(VampireBossDaoGuangMoveIntruder) as VampireBossDaoGuangMoveIntruder;
      }
      
      override protected function getBindMovie() : Class
      {
         return VampireBossDaoGuangMoveIntruderMovie;
      }
      
      override public function a_1797(iGlobalMoveFighterID:int, iIntruderMoveDirection:int) : Boolean
      {
         super.a_1797(iGlobalMoveFighterID,iIntruderMoveDirection);
         a_1339 = 90000;
         a_1279 = 0;
         a_1272 = 0;
         a_1463 = true;
         a_1462 = true;
         gotoAndStop(0);
         a_1275 = 0;
         return true;
      }
      
      override protected function ResetMovieStatus() : Boolean
      {
         a_3419();
         return true;
      }
      
      override public function a_3969(iRduceLifeValue:int) : Boolean
      {
         super.a_3969(iRduceLifeValue);
         a_3419();
         return true;
      }
      
      override public function a_4210() : Boolean
      {
         m_stCurrentFieldGrid.a_3457(this);
         m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3457(this);
         super.a_4210();
         return true;
      }
      
      override public function a_4216(iCurrentTime:int) : Boolean
      {
         var iNoY:int = 0;
         var xIndex:int = 0;
         var yIndex:int = 0;
         var stTempFieldGrid:a_3491 = null;
         if(!a_1460)
         {
            this.m_iStartTimeNum = iCurrentTime;
            a_1460 = true;
            iNoY = m_stCurrentFieldGrid.m_iYGridNo;
            if(iNoY < 3)
            {
               gotoAndStop((a_1276[1] as FrameLabel).frame);
               a_1275 = 1;
               x = BattleFieldView.a_1013 - width - stDisplayBitmap.x + 20;
            }
            else
            {
               gotoAndStop((a_1276[0] as FrameLabel).frame);
               a_1275 = 0;
               x = BattleFieldView.a_1013 - width;
            }
            if(iNoY == 0)
            {
               y = -stDisplayBitmap.y - 10;
            }
            else if(iNoY == 1)
            {
               y = -stDisplayBitmap.y - 10 + 60;
            }
            else if(iNoY == 5)
            {
               y = BattleFieldView.a_1014 - height - 30;
            }
            else
            {
               y = BattleFieldView.a_1014 - height + 30;
            }
         }
         if(iCurrentTime - this.m_iStartTimeNum == 11)
         {
            iNoY = m_stCurrentFieldGrid.m_iYGridNo;
            if(iNoY == 0)
            {
               this.ClearGrid(8,0);
               this.ClearGrid(7,1);
               this.ClearGrid(6,2);
               this.ClearGrid(5,3);
               this.ClearGrid(4,4);
            }
            else if(iNoY == 1)
            {
               this.ClearGrid(8,1);
               this.ClearGrid(7,2);
               this.ClearGrid(6,3);
               this.ClearGrid(5,4);
               this.ClearGrid(4,5);
            }
            else if(iNoY == 6)
            {
               this.ClearGrid(8,6);
               this.ClearGrid(7,5);
               this.ClearGrid(6,4);
               this.ClearGrid(5,3);
               this.ClearGrid(4,2);
            }
            else
            {
               this.ClearGrid(8,5);
               this.ClearGrid(7,4);
               this.ClearGrid(6,3);
               this.ClearGrid(5,2);
               this.ClearGrid(4,1);
            }
         }
         if(iCurrentTime - this.m_iStartTimeNum == 12)
         {
            stop();
         }
         if(iCurrentTime - this.m_iStartTimeNum == 103)
         {
            this.a_3969(iLifeValue);
            a_4212();
         }
         return true;
      }
      
      private function ClearGrid(iNoX:int, iNoY:int) : void
      {
         var grid:a_3491 = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(iNoX,iNoY);
         if(grid != null)
         {
            this.a_3502(grid);
         }
      }
      
      override public function a_4208(iEffectType:int, iEffectTime:int, stBaseEffect:a_4108 = null) : void
      {
      }
      
      protected function a_3502(stFieldGrid:a_3491) : Boolean
      {
         if(null != stFieldGrid.m_stProtector)
         {
            stFieldGrid.m_stProtector.m_iDieType = 1;
            stFieldGrid.m_stProtector.a_3969(stFieldGrid.m_stProtector.iLifeValue);
         }
         if(null != stFieldGrid.m_stAttackFighter && !(stFieldGrid.m_stAttackFighter is a_3924))
         {
            stFieldGrid.m_stAttackFighter.m_iDieType = 1;
            stFieldGrid.m_stAttackFighter.a_3969(stFieldGrid.m_stAttackFighter.iLifeValue);
         }
         if(null != stFieldGrid.m_stBoomDefense)
         {
            stFieldGrid.m_stBoomDefense.m_iDieType = 1;
            stFieldGrid.m_stBoomDefense.a_3969(stFieldGrid.m_stBoomDefense.iLifeValue);
         }
         if(null != stFieldGrid.m_stFlowerDefense)
         {
            stFieldGrid.m_stFlowerDefense.m_iDieType = 1;
            stFieldGrid.m_stFlowerDefense.a_3969(stFieldGrid.m_stFlowerDefense.iLifeValue);
         }
         if(null != stFieldGrid.m_stBaseAuxiliaryFighter)
         {
            stFieldGrid.m_stBaseAuxiliaryFighter.m_iDieType = 1;
            stFieldGrid.m_stBaseAuxiliaryFighter.a_3969(stFieldGrid.m_stBaseAuxiliaryFighter.iLifeValue);
         }
         stFieldGrid.DamageNewSlot(true,0,true,0,1);
         if(null != stFieldGrid.m_stTrayDefense)
         {
            stFieldGrid.m_stTrayDefense.m_iDieType = 1;
            stFieldGrid.m_stTrayDefense.a_3969(stFieldGrid.m_stTrayDefense.iLifeValue);
         }
         return true;
      }
   }
}

