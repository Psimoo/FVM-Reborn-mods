package com.aurora.ui.maogoutd.resource.skill
{
   import a_4718.b_182;
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.effect.DecelerateSkillEffect;
   
   public class DecelerateSkill extends BaseSkill
   {
      
      public function DecelerateSkill()
      {
         super();
      }
      
      public static function a_3926() : DecelerateSkill
      {
         return PoolManager.getInstance().CheckOutOne(DecelerateSkill) as DecelerateSkill;
      }
      
      override public function a_1797() : void
      {
         super.a_1797();
      }
      
      override public function OnTimeInterval(iTimeInterval:uint) : void
      {
         var _loc_2:Array = null;
         var _loc_8:int = 0;
         var _loc_9:int = 0;
         var _loc_10:DecelerateSkillEffect = null;
         _loc_2 = null;
         var _loc_3:a_3491 = null;
         var _loc_4:int = 0;
         var _loc_5:int = 0;
         var _loc_6:int = 0;
         var _loc_7:int = 0;
         _loc_8 = 0;
         _loc_9 = 0;
         _loc_10 = null;
         var _loc_11:Array = null;
         var _loc_12:a_4206 = null;
         super.OnTimeInterval(iTimeInterval);
         if(Boolean(iTimeInterval % this.GetSkillEffect() == 0 && m_stBattleFieldView) && Boolean(m_stBaseAvatar) && Boolean(m_stBaseAvatar.stFieldGrid))
         {
            _loc_2 = m_stBattleFieldView.stFieldGridsVector;
            _loc_3 = m_stBaseAvatar.stFieldGrid;
            _loc_4 = _loc_3.m_iYGridNo - 1 < 0 ? 0 : int(_loc_3.m_iYGridNo - 1);
            _loc_5 = _loc_3.m_iXGridNo - 1 < 0 ? 0 : int(_loc_3.m_iXGridNo - 1);
            _loc_6 = _loc_3.m_iYGridNo + 1 >= BattleFieldView.a_1012 ? int(BattleFieldView.a_1012 - 1) : int(_loc_3.m_iYGridNo + 1);
            _loc_7 = _loc_3.m_iXGridNo + 1 >= BattleFieldView.a_1011 ? int(BattleFieldView.a_1011 - 1) : int(_loc_3.m_iXGridNo + 1);
            _loc_8 = _loc_4;
            while(_loc_8 <= _loc_6)
            {
               _loc_9 = _loc_5;
               while(_loc_9 <= _loc_7)
               {
                  _loc_10 = DecelerateSkillEffect.a_3926();
                  _loc_10.a_1797(!m_stBattleFieldView.isOwnBattleField);
                  _loc_10.x = _loc_9 * a_3491.a_1080 + 0.5 * (a_3491.a_1080 - _loc_10.width);
                  if(!m_stBattleFieldView.isOwnBattleField)
                  {
                     _loc_10.x = BattleFieldView.a_1013 - _loc_10.x;
                  }
                  _loc_10.y = _loc_8 * a_3491.a_1081 + 0.5 * (a_3491.a_1081 - _loc_10.height);
                  m_stBattleFieldView.addChildAt(_loc_10,1);
                  _loc_11 = _loc_2[_loc_8][_loc_9].a_1511.slice();
                  for each(_loc_12 in _loc_11)
                  {
                     if(_loc_12.iLifeValue > 0)
                     {
                        _loc_12.a_4208(b_182.a_433,40);
                     }
                  }
                  _loc_9++;
               }
               _loc_8++;
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
      
      protected function GetSkillEffect() : int
      {
         var iEffectValue:int = 20;
         if(m_iSkillDegree == 1)
         {
            iEffectValue = 19;
         }
         else if(m_iSkillDegree == 2)
         {
            iEffectValue = 18;
         }
         else if(m_iSkillDegree == 3)
         {
            iEffectValue = 17;
         }
         else if(m_iSkillDegree == 4)
         {
            iEffectValue = 16;
         }
         else if(m_iSkillDegree == 5)
         {
            iEffectValue = 15;
         }
         else if(m_iSkillDegree == 6)
         {
            iEffectValue = 14;
         }
         else if(m_iSkillDegree == 7)
         {
            iEffectValue = 12;
         }
         else if(m_iSkillDegree == 8)
         {
            iEffectValue = 10;
         }
         else if(m_iSkillDegree == 9)
         {
            iEffectValue = 8;
         }
         else if(m_iSkillDegree == 10)
         {
            iEffectValue = 5;
         }
         return 20 * iEffectValue;
      }
   }
}

