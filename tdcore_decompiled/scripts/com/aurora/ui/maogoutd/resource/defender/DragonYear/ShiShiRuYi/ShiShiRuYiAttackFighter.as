package com.aurora.ui.maogoutd.resource.defender.DragonYear.ShiShiRuYi
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.defender.a_3953;
   import flash.display.FrameLabel;
   
   public class ShiShiRuYiAttackFighter extends a_3953
   {
      
      private static const MAX_ATTACK_RANGE:int = 1;
      
      private static const CLONE_RANGE:int = 0;
      
      private var m_isUsed:Boolean = false;
      
      private var m_isAttacked:Boolean = false;
      
      private var a_1350:int;
      
      private var m_iStartFrameID:int;
      
      private var m_iAttackFrameNo:int;
      
      private var m_iAttackXGridNo:int;
      
      private var m_iAttackYGridNo:int;
      
      private var m_fMoveSpeed:Number;
      
      public function ShiShiRuYiAttackFighter()
      {
         super();
         a_1095 = ShiShiRuYiDefine.DEFENSE_PRICE;
         a_1304 = 0;
         a_1313 = true;
      }
      
      public static function a_3926() : a_3953
      {
         return PoolManager.getInstance().CheckOutOne(ShiShiRuYiAttackFighter) as ShiShiRuYiAttackFighter;
      }
      
      override protected function getBindMovie() : Class
      {
         return ShiShiRuYiAttackFighterMovie;
      }
      
      override public function a_1797(stFieldGrid:a_3491) : Boolean
      {
         super.a_1797(stFieldGrid);
         this.m_isUsed = false;
         this.m_isAttacked = false;
         this.a_1350 = 0;
         a_1339 = ShiShiRuYiDefine.MAX_LIFE_VALUE;
         return true;
      }
      
      override protected function a_3964() : int
      {
         return ShiShiRuYiDefine.a_3965(a_1094);
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
            if(a_1273 == (a_1276[this.m_iAttackFrameNo] as FrameLabel).frame + 14)
            {
               this.a_3969(iLifeValue);
            }
         }
      }
      
      override public function a_3954(iCurrentTime:int) : Boolean
      {
         var stBackFieldGrid:a_3491 = null;
         var stFrontFieldGrid:a_3491 = null;
         var offsetY:int = 0;
         if(!this.m_isUsed)
         {
            if(this.CheckIsStartAttack())
            {
               a_1275 = this.m_iAttackFrameNo;
               gotoAndStop((a_1276[this.m_iAttackFrameNo] as FrameLabel).frame);
               BattleFieldView.a_1036.play();
               this.m_isUsed = true;
            }
         }
         if(this.m_isUsed)
         {
            if(this.IsCanMove)
            {
               x += this.m_fMoveSpeed;
            }
            if(a_1273 == (a_1276[this.m_iAttackFrameNo] as FrameLabel).frame + 10 && !this.m_isAttacked)
            {
               this.m_isAttacked = true;
               BattleFieldView.ms_shizi_93.play();
               for(offsetY = -CLONE_RANGE; offsetY <= CLONE_RANGE; offsetY++)
               {
                  this.AttackGrid(this.m_iAttackXGridNo,this.m_iAttackYGridNo + offsetY);
               }
            }
         }
         return true;
      }
      
      private function get IsCanMove() : Boolean
      {
         var iFramePos:int = a_1273 - this.m_iStartFrameID;
         return iFramePos >= 2 && iFramePos <= 7;
      }
      
      private function CheckIsStartAttack() : Boolean
      {
         var m_iXGridNo:int = 0;
         var m_iYGridNo:int = 0;
         var offsetY:int = 0;
         var tempFieldGrid:a_3491 = null;
         var stBaseMoveIntruder:a_4206 = null;
         var m_iAttackDir:int = 0;
         for(var offsetX:int = -MAX_ATTACK_RANGE; offsetX <= MAX_ATTACK_RANGE; offsetX++)
         {
            if(offsetX <= 0)
            {
               m_iXGridNo = a_1334.m_iXGridNo + offsetX + MAX_ATTACK_RANGE;
            }
            else
            {
               m_iXGridNo = a_1334.m_iXGridNo - offsetX;
            }
            if(!(m_iXGridNo < 0 || m_iXGridNo > BattleFieldView.a_1011))
            {
               offsetY = -MAX_ATTACK_RANGE;
               loop1:
               while(offsetY <= MAX_ATTACK_RANGE)
               {
                  m_iYGridNo = a_1334.m_iYGridNo + offsetY;
                  tempFieldGrid = a_1334.m_stCurrentBattbleFieldView.a_3438(m_iXGridNo,m_iYGridNo);
                  if(Boolean(tempFieldGrid) && tempFieldGrid.a_1511.length > 0)
                  {
                     for each(stBaseMoveIntruder in tempFieldGrid.a_1511)
                     {
                        if(stBaseMoveIntruder.iSpaceState == 0 && !stBaseMoveIntruder.isCannotSeeByFighter || stBaseMoveIntruder.iSpaceState == 1)
                        {
                           m_iAttackDir = m_iXGridNo - a_1334.m_iXGridNo > 0 ? 1 : -1;
                           if(a_1334.m_iXGridNo == m_iXGridNo)
                           {
                              m_iAttackDir = 0;
                           }
                           this.m_iAttackXGridNo = a_1334.m_iXGridNo + m_iAttackDir;
                           this.m_iAttackYGridNo = a_1334.m_iYGridNo;
                           this.m_iAttackFrameNo = m_iAttackDir >= 0 ? 2 : 3;
                           this.m_iStartFrameID = (a_1276[this.m_iAttackFrameNo] as FrameLabel).frame;
                           this.m_fMoveSpeed = (m_iAttackDir > 0 ? 1 : -1) * a_3491.a_1080 / (0.6 * 20);
                           if(m_iAttackDir == 0)
                           {
                              this.m_fMoveSpeed = 0;
                           }
                           if(a_1283)
                           {
                              this.a_1350 *= -1;
                           }
                           return true;
                           break loop1;
                        }
                     }
                  }
                  offsetY++;
               }
            }
         }
         return false;
      }
      
      private function AttackGrid(iAttackXGridNo:int, iAttackYGridNo:int) : Boolean
      {
         var xIndex:int = 0;
         var arrMoveIntruder:Array = null;
         var stMoveIntruder:a_4206 = null;
         if(iAttackYGridNo < 0 || iAttackYGridNo >= BattleFieldView.a_1012)
         {
            return false;
         }
         var xStart:int = Math.max(iAttackXGridNo - MAX_ATTACK_RANGE,0);
         var xEnd:int = Math.min(iAttackXGridNo + MAX_ATTACK_RANGE,BattleFieldView.a_1011 - 1);
         var yStart:int = Math.max(iAttackYGridNo - MAX_ATTACK_RANGE,0);
         var yEnd:int = Math.min(iAttackYGridNo + MAX_ATTACK_RANGE,BattleFieldView.a_1012 - 1);
         var stFieldGridVector:Array = a_1334.m_stCurrentBattbleFieldView.stFieldGridsVector;
         for(var yIndex:int = yStart; yIndex <= yEnd; yIndex++)
         {
            for(xIndex = xStart; xIndex <= xEnd; xIndex++)
            {
               arrMoveIntruder = stFieldGridVector[yIndex][xIndex].a_1511.slice();
               for each(stMoveIntruder in arrMoveIntruder)
               {
                  if(stMoveIntruder.iSpaceState == 0 || stMoveIntruder.iSpaceState == 1)
                  {
                     stMoveIntruder.BruisAttackID = this.a_3512();
                     stMoveIntruder.a_4213();
                     if(stMoveIntruder.iLifeValue > 0)
                     {
                        stMoveIntruder.a_4213();
                     }
                  }
               }
            }
         }
         return false;
      }
   }
}

