package com.aurora.ui.maogoutd.resource.defender.flourPackage
{
   import a_4715.EncrypBooleanEx;
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.defender.a_3953;
   import flash.display.FrameLabel;
   
   public class FlourPackageFirstTransAttackFighter extends a_3953
   {
      
      private static const MAX_ATTACK_RANGE:int = 2;
      
      private var m_bIsStartAttack:EncrypBooleanEx;
      
      private var m_fMoveSpeed:Number;
      
      private var m_iAttackDir:int;
      
      private var m_bIsStartMove:Boolean;
      
      private var m_iAttackXGridNo:int;
      
      private var m_iAttackYGridNo:int;
      
      private var m_iStartFrameID:int;
      
      public function FlourPackageFirstTransAttackFighter()
      {
         super();
         a_1095 = FlourPackageDefine.FIRSTTRANS_DEFENSE_PRICE;
         a_1304 = 0;
         this.m_bIsStartAttack = new EncrypBooleanEx();
         a_1313 = true;
      }
      
      public static function a_3926() : a_3953
      {
         return PoolManager.getInstance().CheckOutOne(FlourPackageFirstTransAttackFighter) as FlourPackageFirstTransAttackFighter;
      }
      
      override protected function getBindMovie() : Class
      {
         return FlourPackageFirstTransAttackFighterMovie;
      }
      
      override public function a_1797(stFieldGrid:a_3491) : Boolean
      {
         this.m_fMoveSpeed = 0;
         this.IsStartAttack = false;
         super.a_1797(stFieldGrid);
         a_1339 = FlourPackageDefine.MAX_LIFE_VALUE;
         return true;
      }
      
      protected function set IsStartAttack(bIsStartAttack:Boolean) : void
      {
         this.m_bIsStartAttack.Value = bIsStartAttack;
      }
      
      protected function get IsStartAttack() : Boolean
      {
         return this.m_bIsStartAttack.Value;
      }
      
      override protected function a_3964() : int
      {
         return FlourPackageDefine.a_3964(a_1094);
      }
      
      override public function a_3969(iRduceLifeValue:int) : Boolean
      {
         super.a_3969(iRduceLifeValue);
         return true;
      }
      
      override public function a_3957(iCurrentTime:int) : void
      {
         if(iCurrentTime & 1)
         {
            super.a_3957(iCurrentTime);
            if(a_1273 == a_1274 - 1)
            {
               this.a_3969(iLifeValue);
            }
         }
      }
      
      private function IsHasAttack(iXGridNo:int, iYGridNo:int) : Boolean
      {
         var stBaseMoveIntruder:a_4206 = null;
         var stFieldGrid:a_3491 = a_1334.m_stCurrentBattbleFieldView.a_3438(iXGridNo,iYGridNo);
         if(null != stFieldGrid && stFieldGrid.m_isOccupy && stFieldGrid.a_1511.length > 0)
         {
            for each(stBaseMoveIntruder in stFieldGrid.a_1511.slice())
            {
               if(0 == stBaseMoveIntruder.iSpaceState)
               {
                  return true;
               }
            }
         }
         return false;
      }
      
      private function AttackGrid(iAttackXGridNo:int, iAttackYGridNo:int) : Boolean
      {
         var stFieldGrid:a_3491 = null;
         var arrMoveIntruders:Array = null;
         var stBaseMoveIntruder:a_4206 = null;
         BattleFieldView.a_1037.play();
         var iLeftXGridNo:int = Math.max(iAttackXGridNo - MAX_ATTACK_RANGE + 1,0);
         var iRightXGridNo:int = Math.min(iAttackXGridNo + MAX_ATTACK_RANGE - 1,BattleFieldView.a_1011 - 1);
         for(var iXGridNo:int = iLeftXGridNo; iXGridNo <= iRightXGridNo; iXGridNo++)
         {
            stFieldGrid = a_1334.m_stCurrentBattbleFieldView.a_3438(iXGridNo,iAttackYGridNo);
            if(null != stFieldGrid && stFieldGrid.a_1511.length > 0)
            {
               arrMoveIntruders = stFieldGrid.a_1511.slice();
               if(null != arrMoveIntruders)
               {
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
         }
         return false;
      }
      
      private function get IsCanMove() : Boolean
      {
         var iFramePos:int = a_1273 - this.m_iStartFrameID;
         return iFramePos >= 15 && iFramePos <= 21;
      }
      
      private function get IsCanAttack() : Boolean
      {
         return a_1273 - this.m_iStartFrameID == 22;
      }
      
      override public function a_3954(iCurrentTime:int) : Boolean
      {
         if(0 == (iCurrentTime & 1))
         {
            return false;
         }
         if(this.IsStartAttack)
         {
            if(this.IsCanMove)
            {
               if(!this.m_bIsStartMove)
               {
                  this.CheckIsStartAttack();
                  this.SetMoveSpeed();
                  this.m_bIsStartMove = true;
               }
               x += this.m_fMoveSpeed;
            }
            if(this.IsCanAttack)
            {
               this.AttackGrid(this.m_iAttackXGridNo,this.m_iAttackYGridNo);
               if(parent)
               {
                  parent.addChild(this);
               }
            }
         }
         else
         {
            if(a_1334.m_stCurrentBattbleFieldView.stFieldRowIntruderStatusArray[a_1334.m_iYGridNo] <= 0)
            {
               return false;
            }
            this.m_iAttackYGridNo = a_1334.m_iYGridNo;
            if(this.CheckIsStartAttack())
            {
               BattleFieldView.a_1036.play();
               this.GotoFrameLabelID(1);
               this.SetMoveSpeed();
               if(parent)
               {
                  parent.addChild(this);
               }
               this.m_bIsStartMove = false;
               this.IsStartAttack = true;
            }
         }
         return true;
      }
      
      private function CheckIsStartAttack() : Boolean
      {
         var iLeftXGridNo:int = Math.max(a_1334.m_iXGridNo - MAX_ATTACK_RANGE,0);
         var iRightXGridNo:int = Math.min(a_1334.m_iXGridNo + MAX_ATTACK_RANGE,BattleFieldView.a_1011 - 1);
         for(var iXGridNo:int = iLeftXGridNo; iXGridNo <= iRightXGridNo; iXGridNo++)
         {
            if(this.IsHasAttack(iXGridNo,this.m_iAttackYGridNo))
            {
               this.m_iAttackXGridNo = iXGridNo;
               return true;
            }
         }
         return false;
      }
      
      private function SetMoveSpeed() : void
      {
         var iCurXGridNo:int = a_1334.m_iXGridNo;
         if(iCurXGridNo - MAX_ATTACK_RANGE + 1 < 0)
         {
            this.m_iAttackDir = 1;
         }
         else if(iCurXGridNo + MAX_ATTACK_RANGE - 1 > BattleFieldView.a_1011 - 1)
         {
            this.m_iAttackDir = -1;
         }
         else if(this.m_iAttackXGridNo < iCurXGridNo && iCurXGridNo - MAX_ATTACK_RANGE >= 0)
         {
            this.m_iAttackDir = -1;
         }
         else if(this.m_iAttackXGridNo > iCurXGridNo && iCurXGridNo + MAX_ATTACK_RANGE <= BattleFieldView.a_1011 - 1)
         {
            this.m_iAttackDir = 1;
         }
         else
         {
            this.m_iAttackDir = 0;
         }
         this.m_iAttackXGridNo = iCurXGridNo + this.m_iAttackDir;
         this.m_fMoveSpeed = a_1283 ? -this.m_iAttackDir : this.m_iAttackDir;
         this.m_fMoveSpeed *= a_3491.a_1080 / 7;
      }
      
      private function GotoFrameLabelID(iFrameLabelID:int) : void
      {
         a_1275 = iFrameLabelID;
         gotoAndStop((a_1276[a_1275] as FrameLabel).frame);
         this.m_iStartFrameID = a_1273;
      }
   }
}

