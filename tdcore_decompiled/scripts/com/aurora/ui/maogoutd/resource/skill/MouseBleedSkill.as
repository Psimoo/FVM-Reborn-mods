package com.aurora.ui.maogoutd.resource.skill
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.effect.MouseBleedSkillEffect;
   
   public class MouseBleedSkill extends BaseSkill
   {
      
      private var m_arrMouseBleedSkillEffect:Array = new Array();
      
      private var m_isAddMouseBleedSkillEffect:Boolean = false;
      
      public function MouseBleedSkill()
      {
         super();
      }
      
      public static function a_3926() : MouseBleedSkill
      {
         return PoolManager.getInstance().CheckOutOne(MouseBleedSkill) as MouseBleedSkill;
      }
      
      override public function a_1797() : void
      {
         super.a_1797();
         this.m_isAddMouseBleedSkillEffect = false;
      }
      
      override public function OnTimeInterval(iTimeInterval:uint) : void
      {
         var _loc_10:MouseBleedSkillEffect = null;
         var _loc_2:Array = null;
         var _loc_3:a_3491 = null;
         var _loc_4:int = 0;
         var _loc_5:int = 0;
         var _loc_6:int = 0;
         var _loc_7:int = 0;
         var _loc_8:int = 0;
         var _loc_9:int = 0;
         _loc_10 = null;
         var _loc_11:Array = null;
         var _loc_12:a_4206 = null;
         super.OnTimeInterval(iTimeInterval);
         if(Boolean(iTimeInterval % 40 == 0 && m_stBattleFieldView) && Boolean(m_stBaseAvatar) && Boolean(m_stBaseAvatar.stFieldGrid))
         {
            _loc_2 = m_stBattleFieldView.stFieldGridsVector;
            _loc_3 = m_stBaseAvatar.stFieldGrid;
            _loc_4 = _loc_3.m_iYGridNo - 1 < 0 ? 0 : int(_loc_3.m_iYGridNo - 1);
            _loc_5 = _loc_3.m_iXGridNo - 1 < 0 ? 0 : int(_loc_3.m_iXGridNo - 1);
            _loc_6 = _loc_3.m_iYGridNo + 1 >= BattleFieldView.a_1012 ? int(BattleFieldView.a_1012 - 1) : int(_loc_3.m_iYGridNo + 1);
            _loc_7 = _loc_3.m_iXGridNo + 1 >= BattleFieldView.a_1011 ? int(BattleFieldView.a_1011 - 1) : int(_loc_3.m_iXGridNo + 1);
            if(!this.m_isAddMouseBleedSkillEffect)
            {
               this.m_isAddMouseBleedSkillEffect = true;
               _loc_8 = _loc_4;
               while(_loc_8 <= _loc_6)
               {
                  _loc_9 = _loc_5;
                  while(_loc_9 <= _loc_7)
                  {
                     _loc_10 = MouseBleedSkillEffect.a_3926();
                     _loc_10.x = _loc_9 * a_3491.a_1080 + 0.5 * (a_3491.a_1080 - _loc_10.width);
                     if(!m_stBattleFieldView.isOwnBattleField)
                     {
                        _loc_10.x = BattleFieldView.a_1013 - _loc_10.x;
                     }
                     _loc_10.y = _loc_8 * a_3491.a_1081 + 0.5 * (a_3491.a_1081 - _loc_10.height);
                     m_stBattleFieldView.addChildAt(_loc_10,1);
                     this.m_arrMouseBleedSkillEffect.push(_loc_10);
                     _loc_9++;
                  }
                  _loc_8++;
               }
            }
            _loc_8 = _loc_4;
            while(_loc_8 <= _loc_6)
            {
               _loc_9 = _loc_5;
               while(_loc_9 <= _loc_7)
               {
                  _loc_11 = _loc_2[_loc_8][_loc_9].a_1511.slice();
                  for each(_loc_12 in _loc_11)
                  {
                     if(_loc_12.iLifeValue > 0)
                     {
                        _loc_12.a_3969(this.GetSkillEffect());
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
      
      override public function UseSkill(iID:int) : void
      {
         super.UseSkill(iID);
      }
      
      override public function a_4330() : void
      {
         var _loc_1:MouseBleedSkillEffect = null;
         super.a_4330();
         for each(_loc_1 in this.m_arrMouseBleedSkillEffect)
         {
            _loc_1.a_4330();
         }
         this.m_arrMouseBleedSkillEffect = new Array();
      }
      
      protected function GetSkillEffect() : Number
      {
         var _loc_1:Number = 5;
         if(m_iSkillDegree == 1)
         {
            _loc_1 = 10;
         }
         else if(m_iSkillDegree == 2)
         {
            _loc_1 = 15;
         }
         else if(m_iSkillDegree == 3)
         {
            _loc_1 = 20;
         }
         else if(m_iSkillDegree == 4)
         {
            _loc_1 = 25;
         }
         else if(m_iSkillDegree == 5)
         {
            _loc_1 = 30;
         }
         else if(m_iSkillDegree == 6)
         {
            _loc_1 = 40;
         }
         else if(m_iSkillDegree == 7)
         {
            _loc_1 = 50;
         }
         else if(m_iSkillDegree == 8)
         {
            _loc_1 = 60;
         }
         else if(m_iSkillDegree == 9)
         {
            _loc_1 = 80;
         }
         else if(m_iSkillDegree == 10)
         {
            _loc_1 = 100;
         }
         return _loc_1;
      }
   }
}

