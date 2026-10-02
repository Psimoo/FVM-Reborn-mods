package com.aurora.ui.maogoutd.resource.skill
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   
   public class AntiInjurySkill extends BaseSkill
   {
      
      private static const MAX_REDUCELIFE:int = 2100;
      
      public function AntiInjurySkill()
      {
         super();
      }
      
      public static function a_3926() : AntiInjurySkill
      {
         return PoolManager.getInstance().CheckOutOne(AntiInjurySkill) as AntiInjurySkill;
      }
      
      override public function a_1797() : void
      {
         super.a_1797();
      }
      
      override public function OnTimeInterval(iTimeNum:uint) : void
      {
         var stFieldGridVector:Array = null;
         var stAvatarFieldGrid:a_3491 = null;
         var yStart:int = 0;
         var xStart:int = 0;
         var yEnd:int = 0;
         var xEnd:int = 0;
         var yIndex:int = 0;
         var xIndex:int = 0;
         var arrMoveIntruder:Array = null;
         var stMoveIntruder:a_4206 = null;
         var iReduceLife:int = 0;
         super.OnTimeInterval(iTimeNum);
         if(Boolean(iTimeNum % 50 == 0 && m_stBattleFieldView) && Boolean(m_stBaseAvatar) && Boolean(m_stBaseAvatar.stFieldGrid))
         {
            stFieldGridVector = m_stBattleFieldView.stFieldGridsVector;
            stAvatarFieldGrid = m_stBaseAvatar.stFieldGrid;
            yStart = stAvatarFieldGrid.m_iYGridNo - 1 < 0 ? 0 : int(stAvatarFieldGrid.m_iYGridNo - 1);
            xStart = stAvatarFieldGrid.m_iXGridNo - 2 < 0 ? 0 : int(stAvatarFieldGrid.m_iXGridNo - 2);
            yEnd = stAvatarFieldGrid.m_iYGridNo + 1 >= BattleFieldView.a_1012 ? int(BattleFieldView.a_1012 - 1) : int(stAvatarFieldGrid.m_iYGridNo + 1);
            xEnd = stAvatarFieldGrid.m_iXGridNo + 1 >= BattleFieldView.a_1011 ? int(BattleFieldView.a_1011 - 1) : int(stAvatarFieldGrid.m_iXGridNo + 1);
            for(yIndex = yStart; yIndex <= yEnd; yIndex++)
            {
               for(xIndex = xStart; xIndex <= xEnd; xIndex++)
               {
                  arrMoveIntruder = stFieldGridVector[yIndex][xIndex].a_1511.slice();
                  for each(stMoveIntruder in arrMoveIntruder)
                  {
                     if(stMoveIntruder.iLifeValue > 0)
                     {
                        iReduceLife = stMoveIntruder.iLifeValue * this.GetSkillEffect();
                        if(iReduceLife > MAX_REDUCELIFE)
                        {
                           iReduceLife = MAX_REDUCELIFE;
                        }
                        stMoveIntruder.a_3969(iReduceLife);
                     }
                  }
               }
            }
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
      
      protected function GetSkillEffect() : Number
      {
         var numReduceLifeRate:Number = 0.02;
         if(m_iSkillDegree == 1)
         {
            numReduceLifeRate = 0.025;
         }
         else if(m_iSkillDegree == 2)
         {
            numReduceLifeRate = 0.03;
         }
         else if(m_iSkillDegree == 3)
         {
            numReduceLifeRate = 0.04;
         }
         else if(m_iSkillDegree == 4)
         {
            numReduceLifeRate = 0.05;
         }
         else if(m_iSkillDegree == 5)
         {
            numReduceLifeRate = 0.06;
         }
         else if(m_iSkillDegree == 6)
         {
            numReduceLifeRate = 0.08;
         }
         else if(m_iSkillDegree == 7)
         {
            numReduceLifeRate = 0.1;
         }
         else if(m_iSkillDegree == 8)
         {
            numReduceLifeRate = 0.12;
         }
         else if(m_iSkillDegree == 9)
         {
            numReduceLifeRate = 0.15;
         }
         else if(m_iSkillDegree == 10)
         {
            numReduceLifeRate = 0.18;
         }
         return numReduceLifeRate;
      }
   }
}

