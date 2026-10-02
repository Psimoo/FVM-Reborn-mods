package com.aurora.ui.maogoutd.resource.defender.CattleYear.CoconutFruit
{
   import a_4718.b_182;
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.defender.a_3953;
   import flash.display.FrameLabel;
   
   public class CoconutFruitFirstAttackFighter extends a_3953
   {
      
      private static const STUN_FRAMES:int = 30;
      
      private static const KILL_RANGE:int = 1;
      
      private var m_isSkilling:Boolean = false;
      
      private var m_isAttacked:Boolean = false;
      
      private var m_numMoveSpeedX:Number;
      
      private var m_numMoveSpeedY:Number;
      
      private var m_iAnimStartFrame:int;
      
      private var m_stAttackTargetGrid:a_3491;
      
      private var m_iAttackCount:int;
      
      public function CoconutFruitFirstAttackFighter()
      {
         super();
         a_1095 = CoconutFruitDefine.DEFENSE_PRICE;
         a_1313 = true;
      }
      
      public static function a_3926() : a_3953
      {
         return PoolManager.getInstance().CheckOutOne(CoconutFruitFirstAttackFighter) as CoconutFruitFirstAttackFighter;
      }
      
      override protected function getBindMovie() : Class
      {
         return CoconutFruitFirstAttackFighterMovie;
      }
      
      override public function a_1797(stFieldGrid:a_3491) : Boolean
      {
         this.m_isSkilling = false;
         this.m_isAttacked = false;
         this.m_numMoveSpeedX = 0;
         this.m_numMoveSpeedY = 0;
         this.m_iAnimStartFrame = 0;
         this.m_stAttackTargetGrid = null;
         this.m_iAttackCount = 0;
         super.a_1797(stFieldGrid);
         a_1339 = CoconutFruitDefine.MAX_LIFE_VALUE;
         return true;
      }
      
      override protected function a_3964() : int
      {
         return CoconutFruitDefine.a_3964(a_1094);
      }
      
      override public function a_3957(iCurrentTime:int) : void
      {
         if(iCurrentTime % 2 == 0)
         {
            super.a_3957(iCurrentTime);
         }
      }
      
      override public function a_3940() : Boolean
      {
         this.m_isSkilling = false;
         this.m_isAttacked = false;
         this.m_numMoveSpeedX = 0;
         this.m_numMoveSpeedY = 0;
         this.m_iAnimStartFrame = 0;
         this.m_stAttackTargetGrid = null;
         this.m_iAttackCount = 0;
         super.a_3940();
         return true;
      }
      
      override public function a_3954(iCurrentTime:int) : Boolean
      {
         if(!this.m_isSkilling && this.m_iAttackCount == 0)
         {
            this.TryStartFirstAttack();
         }
         if(this.m_isSkilling)
         {
            this.HandleAttackTimeline(iCurrentTime);
         }
         else if(this.m_iAttackCount > 0)
         {
            this.HandleRoundFinished();
         }
         return true;
      }
      
      private function HandleRoundFinished() : void
      {
         a_1275 = 0;
         a_3969(a_1339);
      }
      
      private function TryStartFirstAttack() : void
      {
         this.m_stAttackTargetGrid = this.FindPrimaryTargetGrid();
         if(!this.m_stAttackTargetGrid)
         {
            return;
         }
         this.a_3974(1,this.m_stAttackTargetGrid);
      }
      
      private function HandleAttackTimeline(iCurrentTime:int) : void
      {
         if(a_1273 > this.m_iAnimStartFrame + 3 && a_1273 < this.m_iAnimStartFrame + 7)
         {
            x += this.m_numMoveSpeedX;
            y += this.m_numMoveSpeedY;
            return;
         }
         if((iCurrentTime & 1) == 0)
         {
            return;
         }
         if(a_1273 == this.m_iAnimStartFrame + 8)
         {
            BattleFieldView.a_1037.play();
         }
         else if(!this.m_isAttacked && a_1273 == this.m_iAnimStartFrame + 10)
         {
            this.m_isAttacked = true;
            this.AttackInSquare(this.m_stAttackTargetGrid,KILL_RANGE);
         }
         else if(a_1273 >= this.m_iAnimStartFrame + 15)
         {
            this.m_isSkilling = false;
            ++this.m_iAttackCount;
         }
      }
      
      private function a_3974(iFrameLabel:int, stTargetGrid:a_3491) : void
      {
         a_1275 = iFrameLabel;
         this.m_iAnimStartFrame = (a_1276[iFrameLabel] as FrameLabel).frame;
         gotoAndStop(this.m_iAnimStartFrame);
         this.m_isSkilling = true;
         this.m_isAttacked = false;
         this.SetMoveSpeedByTarget(stTargetGrid);
         BattleFieldView.a_1036.play();
         if(parent)
         {
            parent.addChild(this);
         }
      }
      
      private function FindPrimaryTargetGrid() : a_3491
      {
         var stBackFieldGrid:a_3491 = a_1334.m_stCurrentBattbleFieldView.a_3438(a_1334.m_iXGridNo - 1,a_1334.m_iYGridNo);
         var stFrontFieldGrid:a_3491 = a_1334.m_stCurrentBattbleFieldView.a_3438(a_1334.m_iXGridNo + 1,a_1334.m_iYGridNo);
         if(this.IsHasGroundIntruder(stBackFieldGrid))
         {
            return stBackFieldGrid;
         }
         if(this.IsHasGroundIntruder(a_1334))
         {
            return a_1334;
         }
         if(this.IsHasGroundIntruder(stFrontFieldGrid))
         {
            return stFrontFieldGrid;
         }
         return null;
      }
      
      private function SetMoveSpeedByTarget(stTargetGrid:a_3491) : void
      {
         if(!stTargetGrid || !a_1334)
         {
            this.m_numMoveSpeedX = 0;
            this.m_numMoveSpeedY = 0;
            return;
         }
         var dx:Number = (stTargetGrid.m_iXGridNo - a_1334.m_iXGridNo) * a_3491.a_1080;
         var dy:Number = (stTargetGrid.m_iYGridNo - a_1334.m_iYGridNo) * a_3491.a_1081;
         this.m_numMoveSpeedX = dx / 6;
         this.m_numMoveSpeedY = dy / 6;
      }
      
      private function IsHasGroundIntruder(stFieldGrid:a_3491) : Boolean
      {
         var stBaseMoveIntruder:a_4206 = null;
         if(!stFieldGrid || stFieldGrid.a_1511.length <= 0)
         {
            return false;
         }
         for each(stBaseMoveIntruder in stFieldGrid.a_1511)
         {
            if(Boolean(stBaseMoveIntruder) && stBaseMoveIntruder.iSpaceState == 0)
            {
               return true;
            }
         }
         return false;
      }
      
      private function AttackInSquare(stCenterGrid:a_3491, iRange:int) : void
      {
         var iDefenseTypeID:int = 0;
         iDefenseTypeID = a_3512();
         var iStunFrames:int = STUN_FRAMES;
         this.ForEachGroundIntruderInSquare(stCenterGrid,iRange,function(stBaseMoveIntruder:a_4206):void
         {
            stBaseMoveIntruder.BruisAttackID = iDefenseTypeID;
            stBaseMoveIntruder.a_4213();
         });
      }
      
      private function ForEachGroundIntruderInSquare(stCenterGrid:a_3491, iRange:int, funEach:Function) : void
      {
         var xIndex:int = 0;
         var arrMoveIntruders:Array = null;
         var stMoveIntruder:a_4206 = null;
         if(!stCenterGrid || !a_1334 || !a_1334.m_stCurrentBattbleFieldView || funEach == null)
         {
            return;
         }
         var xStart:int = Math.max(stCenterGrid.m_iXGridNo - iRange,0);
         var xEnd:int = Math.min(stCenterGrid.m_iXGridNo + iRange,BattleFieldView.a_1011 - 1);
         var yStart:int = Math.max(stCenterGrid.m_iYGridNo - iRange,0);
         var yEnd:int = Math.min(stCenterGrid.m_iYGridNo + iRange,BattleFieldView.a_1012 - 1);
         var stFieldGridVector:Array = a_1334.m_stCurrentBattbleFieldView.stFieldGridsVector;
         for(var yIndex:int = yStart; yIndex <= yEnd; yIndex++)
         {
            for(xIndex = xStart; xIndex <= xEnd; xIndex++)
            {
               arrMoveIntruders = stFieldGridVector[yIndex][xIndex].a_1511.slice();
               for each(stMoveIntruder in arrMoveIntruders)
               {
                  if(stMoveIntruder)
                  {
                     if(stMoveIntruder.iSpaceState == 0)
                     {
                        funEach(stMoveIntruder);
                     }
                     if(stMoveIntruder.iLifeValue > 0)
                     {
                        stMoveIntruder.a_3969(100);
                     }
                     if(stMoveIntruder.iLifeValue > 0)
                     {
                        stMoveIntruder.a_4208(b_182.enm_shotEffectXuanYun,STUN_FRAMES);
                     }
                  }
               }
            }
         }
      }
   }
}

