package com.aurora.ui.maogoutd.resource.Intruder.Desert.HermitCrabBoss
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.avatar.a_3924;
   import flash.display.FrameLabel;
   
   public class HermitCrabStoneIntruder extends a_4206
   {
      
      private const FULL_HP:int = 1500;
      
      private const HURT_HP:int = 750;
      
      private const DEAD_HP:int = 0;
      
      private var m_iAppearedTime:int;
      
      private var m_hitted:Boolean;
      
      public function HermitCrabStoneIntruder()
      {
         super();
         a_1481 = false;
      }
      
      public static function a_3926() : a_4206
      {
         return PoolManager.getInstance().CheckOutOne(HermitCrabStoneIntruder) as HermitCrabStoneIntruder;
      }
      
      override protected function getBindMovie() : Class
      {
         return HermitCrabStoneIntruderMovie;
      }
      
      override public function a_1797(iGlobalMoveFighterID:int, iIntruderMoveDirection:int) : Boolean
      {
         super.a_1797(iGlobalMoveFighterID,iIntruderMoveDirection);
         a_1275 = 1;
         gotoAndStop((a_1276[1] as FrameLabel).frame);
         this.m_hitted = false;
         a_1350 = 0;
         if(iIntruderMoveDirection < 0)
         {
            a_1350 *= -1;
         }
         a_1339 = this.FULL_HP;
         a_1464 = true;
         a_1462 = true;
         this.m_iAppearedTime = 0;
         a_1279 = -24;
         a_1467 = 10;
         return true;
      }
      
      override protected function a_3940() : Boolean
      {
         super.a_3940();
         if(m_stCurrentFieldGrid != null && m_stCurrentFieldGrid.m_iFieldGridType == 1)
         {
            m_stCurrentFieldGrid.m_iFieldGridType = 0;
         }
         return true;
      }
      
      override protected function ResetMovieStatus() : Boolean
      {
         a_3419();
         return true;
      }
      
      override public function a_3969(iRduceLifeValue:int) : Boolean
      {
         return true;
      }
      
      override public function a_4210() : Boolean
      {
         this.a_3969(900);
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
      
      override public function a_4216(iCurrentTime:int) : Boolean
      {
         if(!a_1460)
         {
            a_1465 = 0;
            if(a_1275 != 1)
            {
               a_1275 = 1;
               gotoAndStop((a_1276[1] as FrameLabel).frame);
            }
            a_1460 = true;
            this.m_iAppearedTime = iCurrentTime;
         }
         if(a_1274 - a_1273 == 4 && !this.m_hitted)
         {
            this.a_3502(m_stCurrentFieldGrid);
            this.SuputtingHurt(m_stCurrentFieldGrid);
            this.m_hitted = true;
         }
         if(a_1274 - a_1273 == 0)
         {
            this.a_3940();
         }
         return true;
      }
      
      protected function SuputtingHurt(a_1334:a_3491) : Boolean
      {
         var stFieldGrid:a_3491 = null;
         var xIndex:int = 0;
         var xStart:int = Math.max(a_1334.m_iXGridNo - 1,0);
         var xEnd:int = Math.min(a_1334.m_iXGridNo + 1,BattleFieldView.a_1011 - 1);
         var yStart:int = Math.max(a_1334.m_iYGridNo - 1,0);
         var yEnd:int = Math.min(a_1334.m_iYGridNo + 1,BattleFieldView.a_1012 - 1);
         var stFieldGridVector:Array = a_1334.m_stCurrentBattbleFieldView.stFieldGridsVector;
         var hurtValue:int = 10;
         for(var yIndex:int = yStart; yIndex <= yEnd; yIndex++)
         {
            for(xIndex = xStart; xIndex <= xEnd; xIndex++)
            {
               stFieldGrid = a_1334.m_stCurrentBattbleFieldView.a_3438(xIndex,yIndex);
               if(stFieldGrid != null)
               {
                  if(null != stFieldGrid.m_stProtector)
                  {
                     stFieldGrid.m_stProtector.a_3969(hurtValue);
                  }
                  if(null != stFieldGrid.m_stAttackFighter && !(stFieldGrid.m_stAttackFighter is a_3924))
                  {
                     stFieldGrid.m_stAttackFighter.a_3969(hurtValue);
                  }
                  if(null != stFieldGrid.m_stBoomDefense)
                  {
                     stFieldGrid.m_stBoomDefense.a_3969(hurtValue);
                  }
                  if(null != stFieldGrid.m_stFlowerDefense)
                  {
                     stFieldGrid.m_stFlowerDefense.a_3969(hurtValue);
                  }
                  if(null != stFieldGrid.m_stBaseAuxiliaryFighter)
                  {
                     stFieldGrid.m_stBaseAuxiliaryFighter.a_3969(hurtValue);
                  }
                  if(stFieldGrid.HasNewSlot())
                  {
                     stFieldGrid.DamageNewSlot(true,0,false,hurtValue,-1);
                  }
                  if(null != stFieldGrid.m_stTrayDefense)
                  {
                     stFieldGrid.m_stTrayDefense.a_3969(hurtValue);
                  }
               }
            }
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
   }
}

