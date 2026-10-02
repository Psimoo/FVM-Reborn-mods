package com.aurora.ui.maogoutd.resource.defender.CattleYear.CoconutFruit
{
   import a_4718.b_182;
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.defender.a_3953;
   import flash.display.FrameLabel;
   
   public class CoconutFruitAttackFighter extends a_3953
   {
      
      private var m_isUsed:Boolean = false;
      
      private var m_isAttacked:Boolean = false;
      
      private var a_1350:int;
      
      public function CoconutFruitAttackFighter()
      {
         super();
         a_1095 = CoconutFruitDefine.DEFENSE_PRICE;
         a_1304 = 0;
      }
      
      public static function a_3926() : a_3953
      {
         return PoolManager.getInstance().CheckOutOne(CoconutFruitAttackFighter) as CoconutFruitAttackFighter;
      }
      
      override protected function getBindMovie() : Class
      {
         return CoconutFruitAttackFighterMovie;
      }
      
      override public function a_1797(stFieldGrid:a_3491) : Boolean
      {
         this.m_isUsed = false;
         this.m_isAttacked = false;
         this.a_1350 = 0;
         super.a_1797(stFieldGrid);
         a_1339 = CoconutFruitDefine.MAX_LIFE_VALUE;
         return true;
      }
      
      override protected function a_3964() : int
      {
         return CoconutFruitDefine.a_3964(a_1094);
      }
      
      override public function a_3969(iRduceLifeValue:int) : Boolean
      {
         super.a_3969(iRduceLifeValue);
         return true;
      }
      
      override public function a_3957(iCurrentTime:int) : void
      {
         if(iCurrentTime % 2 == 0)
         {
            super.a_3957(iCurrentTime);
            trace("m_iCurrentFrame:::" + a_1273);
            if(a_1273 >= (a_1276[a_1275] as FrameLabel).frame + 15)
            {
               a_1275 = 0;
               this.a_3969(a_1339);
            }
         }
      }
      
      override public function a_3954(iCurrentTime:int) : Boolean
      {
         var stBackFieldGrid:a_3491 = null;
         var stFrontFieldGrid:a_3491 = null;
         var arrMoveIntruders:Array = null;
         var stBaseMoveIntruder:a_4206 = null;
         if(!this.m_isUsed)
         {
            stBackFieldGrid = a_1334.m_stCurrentBattbleFieldView.a_3438(a_1334.m_iXGridNo - 1,a_1334.m_iYGridNo);
            stFrontFieldGrid = a_1334.m_stCurrentBattbleFieldView.a_3438(a_1334.m_iXGridNo + 1,a_1334.m_iYGridNo);
            if(Boolean(stBackFieldGrid) && (stBackFieldGrid.a_1511.length > 1 || 1 == stBackFieldGrid.a_1511.length && 0 == stBackFieldGrid.a_1511[0].iSpaceState))
            {
               a_1275 = 1;
               gotoAndStop((a_1276[1] as FrameLabel).frame);
               this.m_isUsed = true;
               this.a_1350 = a_1283 ? 10 : -10;
            }
            else if(a_1334.a_1511.length > 1 || 1 == a_1334.a_1511.length && 0 == a_1334.a_1511[0].iSpaceState)
            {
               a_1275 = 1;
               gotoAndStop((a_1276[1] as FrameLabel).frame);
               this.m_isUsed = true;
            }
            else if(Boolean(stFrontFieldGrid) && (stFrontFieldGrid.a_1511.length > 1 || 1 == stFrontFieldGrid.a_1511.length && 0 == stFrontFieldGrid.a_1511[0].iSpaceState))
            {
               a_1275 = 1;
               gotoAndStop((a_1276[1] as FrameLabel).frame);
               this.m_isUsed = true;
               this.a_1350 = a_1283 ? -10 : 10;
            }
            if(this.m_isUsed)
            {
               BattleFieldView.a_1036.play();
               if(parent)
               {
                  parent.addChild(this);
               }
            }
         }
         if(this.m_isUsed)
         {
            if(a_1273 > (a_1276[a_1275] as FrameLabel).frame + 3 && a_1273 < (a_1276[a_1275] as FrameLabel).frame + 7)
            {
               x += this.a_1350;
            }
            else if(a_1273 == (a_1276[a_1275] as FrameLabel).frame + 8)
            {
               BattleFieldView.a_1037.play();
            }
            else if(!this.m_isAttacked && a_1273 == (a_1276[a_1275] as FrameLabel).frame + 10)
            {
               this.m_isAttacked = true;
               stBackFieldGrid = a_1334.m_stCurrentBattbleFieldView.a_3438(a_1334.m_iXGridNo - 1,a_1334.m_iYGridNo);
               stFrontFieldGrid = a_1334.m_stCurrentBattbleFieldView.a_3438(a_1334.m_iXGridNo + 1,a_1334.m_iYGridNo);
               if(Boolean(stBackFieldGrid) && stBackFieldGrid.a_1511.length > 0)
               {
                  arrMoveIntruders = stBackFieldGrid.a_1511.slice();
                  this.addSuppotHurt(stBackFieldGrid);
               }
               else if(a_1334.a_1511.length > 0)
               {
                  arrMoveIntruders = a_1334.a_1511.slice();
                  this.addSuppotHurt(a_1334);
               }
               else if(Boolean(stFrontFieldGrid) && stFrontFieldGrid.a_1511.length > 0)
               {
                  arrMoveIntruders = stFrontFieldGrid.a_1511.slice();
                  this.addSuppotHurt(stFrontFieldGrid);
               }
               for each(stBaseMoveIntruder in arrMoveIntruders)
               {
                  if(0 == stBaseMoveIntruder.iSpaceState)
                  {
                     stBaseMoveIntruder.BruisAttackID = this.a_3512();
                     stBaseMoveIntruder.a_4213();
                  }
               }
            }
         }
         return true;
      }
      
      public function addSuppotHurt(stFieldGrid:a_3491) : void
      {
         var xIndex:int = 0;
         var arrMoveIntruder:Array = null;
         var stMoveIntruder:a_4206 = null;
         if(stFieldGrid == null)
         {
            return;
         }
         var xStart:int = Math.max(a_1334.m_iXGridNo - 1,0);
         var xEnd:int = Math.min(a_1334.m_iXGridNo + 1,BattleFieldView.a_1011 - 1);
         var yStart:int = Math.max(a_1334.m_iYGridNo - 1,0);
         var yEnd:int = Math.min(a_1334.m_iYGridNo + 1,BattleFieldView.a_1012 - 1);
         var stFieldGridVector:Array = a_1334.m_stCurrentBattbleFieldView.stFieldGridsVector;
         for(var yIndex:int = yStart; yIndex <= yEnd; yIndex++)
         {
            for(xIndex = xStart; xIndex <= xEnd; xIndex++)
            {
               arrMoveIntruder = stFieldGridVector[yIndex][xIndex].a_1511.slice();
               for each(stMoveIntruder in arrMoveIntruder)
               {
                  stMoveIntruder.a_3969(50);
                  if(stMoveIntruder.iLifeValue > 0)
                  {
                     stMoveIntruder.a_4208(b_182.enm_shotEffectXuanYun,30);
                  }
               }
            }
         }
      }
   }
}

