package com.aurora.ui.maogoutd.resource.skill
{
   import a_4718.b_182;
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   
   public class GodShenEyeSkill extends BaseSkill
   {
      
      private var m_isSkillUsed:Boolean = false;
      
      private var a_1408:Array;
      
      public function GodShenEyeSkill()
      {
         super();
      }
      
      public static function a_3926() : GodShenEyeSkill
      {
         return PoolManager.getInstance().CheckOutOne(GodShenEyeSkill) as GodShenEyeSkill;
      }
      
      override public function a_1797() : void
      {
         super.a_1797();
         this.m_isSkillUsed = false;
         m_uiSkillCoolingTime = 50;
         this.a_1408 = [];
      }
      
      override public function OnTimeInterval(iTimeNum:uint) : void
      {
         super.OnTimeInterval(iTimeNum);
         if(iTimeNum % GetSkillCoolingTime() == 0 && AvatarIsOk && null != m_stBattleFieldView)
         {
            this.RealeaseSkillAttack();
         }
      }
      
      override public function GetSkillCostCoolingTime() : uint
      {
         return 1;
      }
      
      override public function UseSkill(iRandomNum:int) : void
      {
         super.UseSkill(iRandomNum);
      }
      
      override public function a_4330() : void
      {
         super.a_4330();
         this.m_isSkillUsed = false;
         this.a_1408 = null;
      }
      
      private function RealeaseSkillAttack() : void
      {
         var iYGridNo:int = 0;
         var arrMoveIntruder:Array = null;
         var stBaseMoveIntruder:a_4206 = null;
         var iReduceLife:int = 0;
         var ColdSlowTime:int = 0;
         var stFieldGrid:a_3491 = m_stBaseAvatar.stFieldGrid;
         var iXCenterGridNo:int = stFieldGrid.m_iXGridNo;
         var iYCenterGridNo:int = stFieldGrid.m_iYGridNo;
         var iAttackRange:int = 2;
         var iStartXGridNo:int = Math.max(iXCenterGridNo - iAttackRange,0);
         var iStartYGridNo:int = Math.max(iYCenterGridNo - iAttackRange,0);
         var iEndXGridNo:int = Math.min(iXCenterGridNo + iAttackRange,BattleFieldView.a_1011 - 1);
         var iEndYGridNo:int = Math.min(iYCenterGridNo + iAttackRange,BattleFieldView.a_1012 - 1);
         var stFieldGridsVector:Array = m_stBattleFieldView.stFieldGridsVector;
         for(var iXGridNo:int = iStartXGridNo; iXGridNo <= iEndXGridNo; iXGridNo++)
         {
            for(iYGridNo = iStartYGridNo; iYGridNo <= iEndYGridNo; iYGridNo++)
            {
               arrMoveIntruder = stFieldGridsVector[iYGridNo][iXGridNo].a_1511.slice();
               for each(stBaseMoveIntruder in arrMoveIntruder)
               {
                  if(stBaseMoveIntruder.iLifeValue > 0 && -1 == this.a_1408.indexOf(stBaseMoveIntruder))
                  {
                     iReduceLife = this.GetSkillReduceLifeValue();
                     stBaseMoveIntruder.a_3969(iReduceLife);
                     ColdSlowTime = this.GetSkillColdSlowValue();
                     this.a_1408.push(stBaseMoveIntruder);
                     stBaseMoveIntruder.a_4208(b_182.a_433,ColdSlowTime);
                  }
               }
            }
         }
      }
      
      protected function GetSkillReduceLifeValue() : Number
      {
         var numEffectValue:Number = 150;
         if(m_iSkillDegree == 1)
         {
            numEffectValue = 200;
         }
         else if(m_iSkillDegree == 2)
         {
            numEffectValue = 250;
         }
         else if(m_iSkillDegree == 3)
         {
            numEffectValue = 300;
         }
         else if(m_iSkillDegree == 4)
         {
            numEffectValue = 350;
         }
         else if(m_iSkillDegree == 5)
         {
            numEffectValue = 400;
         }
         else if(m_iSkillDegree == 6)
         {
            numEffectValue = 450;
         }
         else if(m_iSkillDegree == 7)
         {
            numEffectValue = 500;
         }
         else if(m_iSkillDegree == 8)
         {
            numEffectValue = 550;
         }
         else if(m_iSkillDegree == 9)
         {
            numEffectValue = 600;
         }
         else if(m_iSkillDegree == 10)
         {
            numEffectValue = 650;
         }
         else if(m_iSkillDegree == 11)
         {
            numEffectValue = 700;
         }
         else if(m_iSkillDegree == 12)
         {
            numEffectValue = 750;
         }
         else if(m_iSkillDegree == 13)
         {
            numEffectValue = 800;
         }
         else if(m_iSkillDegree == 14)
         {
            numEffectValue = 850;
         }
         else if(m_iSkillDegree == 15)
         {
            numEffectValue = 1000;
         }
         return numEffectValue;
      }
      
      protected function GetSkillColdSlowValue() : Number
      {
         var _loc_1:Number = 3;
         if(m_iSkillDegree == 1)
         {
            _loc_1 = 3;
         }
         else if(m_iSkillDegree == 2)
         {
            _loc_1 = 3;
         }
         else if(m_iSkillDegree == 3)
         {
            _loc_1 = 3.5;
         }
         else if(m_iSkillDegree == 4)
         {
            _loc_1 = 3.5;
         }
         else if(m_iSkillDegree == 5)
         {
            _loc_1 = 3.5;
         }
         else if(m_iSkillDegree == 6)
         {
            _loc_1 = 4;
         }
         else if(m_iSkillDegree == 7)
         {
            _loc_1 = 4;
         }
         else if(m_iSkillDegree == 8)
         {
            _loc_1 = 4;
         }
         else if(m_iSkillDegree == 9)
         {
            _loc_1 = 4.5;
         }
         else if(m_iSkillDegree == 10)
         {
            _loc_1 = 4.5;
         }
         else if(m_iSkillDegree == 11)
         {
            _loc_1 = 4.5;
         }
         else if(m_iSkillDegree == 12)
         {
            _loc_1 = 5;
         }
         else if(m_iSkillDegree == 13)
         {
            _loc_1 = 5;
         }
         else if(m_iSkillDegree == 14)
         {
            _loc_1 = 5;
         }
         else if(m_iSkillDegree == 15)
         {
            _loc_1 = 6;
         }
         return _loc_1 * 10;
      }
   }
}

