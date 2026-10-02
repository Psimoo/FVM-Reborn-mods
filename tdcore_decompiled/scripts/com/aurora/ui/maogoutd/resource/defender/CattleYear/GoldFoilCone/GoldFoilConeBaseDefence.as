package com.aurora.ui.maogoutd.resource.defender.CattleYear.GoldFoilCone
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.avatar.a_3924;
   import com.aurora.ui.maogoutd.resource.defender.PigYear.CureMeow.AddDefBloodEffect;
   import com.aurora.ui.maogoutd.resource.defender.a_3953;
   
   public class GoldFoilConeBaseDefence extends a_3953
   {
      
      private var stWaitTimes:int = -10;
      
      private var m_hasFinishSkill:Boolean = true;
      
      public function GoldFoilConeBaseDefence()
      {
         super();
         a_1095 = GoldFoilConeDefence.DEFENSE_PRICE;
         a_1333 = true;
         a_1313 = true;
      }
      
      public static function a_3926() : a_3953
      {
         return PoolManager.getInstance().CheckOutOne(GoldFoilConeBaseDefence) as GoldFoilConeBaseDefence;
      }
      
      override protected function getBindMovie() : Class
      {
         return GoldFoilConeBaseDefenceMovie;
      }
      
      override public function a_1797(stFieldGrid:a_3491) : Boolean
      {
         a_1310 = 30;
         super.a_1797(stFieldGrid);
         a_1338 = -height * 0.5 + 30;
         a_1337 = -width * 0.5 + 40;
         a_1309 = GoldFoilConeDefence.a_3966(m_iSkillDegree);
         this.stWaitTimes = -10;
         this.m_hasFinishSkill = false;
         return true;
      }
      
      override public function a_3954(iCurrentTime:int) : Boolean
      {
         if(this.stWaitTimes == -10)
         {
            a_1321 = iCurrentTime;
            a_1307 = a_1273;
            a_1275 = 0;
            this.ChangeFiedType(false);
            this.stWaitTimes = 0;
         }
         ++this.stWaitTimes;
         if(this.stWaitTimes >= iShotIntervalTimeNum)
         {
            this.m_hasFinishSkill = true;
            this.ChangeFiedType(true);
            m_iDieType = 5;
            this.a_3969(a_1339);
            m_iDieType = 0;
         }
         return true;
      }
      
      private function ChangeFiedType(bole:Boolean) : void
      {
         var stTargetFieldGrid:a_3491 = null;
         var xIndex:int = 0;
         var xStart:int = Math.max(stFieldGrid.m_iXGridNo - 1,0);
         var xEnd:int = Math.min(stFieldGrid.m_iXGridNo + 1,BattleFieldView.a_1011 - 1);
         var yStart:int = Math.max(stFieldGrid.m_iYGridNo - 1,0);
         var yEnd:int = Math.min(stFieldGrid.m_iYGridNo + 1,BattleFieldView.a_1012 - 1);
         for(var yIndex:int = yStart; yIndex <= yEnd; yIndex++)
         {
            for(xIndex = xStart; xIndex <= xEnd; xIndex++)
            {
               stTargetFieldGrid = stFieldGrid.m_stCurrentBattbleFieldView.a_3438(xIndex,yIndex);
               stTargetFieldGrid.m_isCanBrokeByLight = bole;
            }
         }
      }
      
      private function addCureEffect() : void
      {
         var stTargetFieldGrid:a_3491 = null;
         var xIndex:int = 0;
         var xStart:int = Math.max(stFieldGrid.m_iXGridNo - 2,0);
         var xEnd:int = Math.min(stFieldGrid.m_iXGridNo + 2,BattleFieldView.a_1011 - 1);
         var yStart:int = Math.max(stFieldGrid.m_iYGridNo - 2,0);
         var yEnd:int = Math.min(stFieldGrid.m_iYGridNo + 2,BattleFieldView.a_1012 - 1);
         for(var yIndex:int = yStart; yIndex <= yEnd; yIndex++)
         {
            for(xIndex = xStart; xIndex <= xEnd; xIndex++)
            {
               stTargetFieldGrid = stFieldGrid.m_stCurrentBattbleFieldView.a_3438(xIndex,yIndex);
               this.CureFieldGridDefense(stTargetFieldGrid,-10);
            }
         }
      }
      
      protected function CureFieldGridDefense(stFieldGrid:a_3491, value:int = 10) : Boolean
      {
         var stAddDefBloodEffect:AddDefBloodEffect = null;
         if(stFieldGrid == null)
         {
            return false;
         }
         if(stFieldGrid.a_3492() && !(stFieldGrid.m_stAttackFighter is a_3924))
         {
            stAddDefBloodEffect = AddDefBloodEffect.a_3926();
            stAddDefBloodEffect.a_1797(false);
            stAddDefBloodEffect.x = stFieldGrid.m_iXGridNo * a_3491.a_1080 + 0.5 * (a_3491.a_1080 - stAddDefBloodEffect.width);
            stAddDefBloodEffect.y = stFieldGrid.m_iYGridNo * a_3491.a_1081 + 0.5 * (a_3491.a_1081 - stAddDefBloodEffect.height);
            stFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(stAddDefBloodEffect,BattleLayerDefine.EFFECTS_TOP_TYPE);
         }
         if(null != stFieldGrid.m_stBaseToolDefense)
         {
            stFieldGrid.m_stBaseToolDefense.a_3969(value);
         }
         else if(null != stFieldGrid.m_stProtector)
         {
            stFieldGrid.m_stProtector.a_3969(value);
         }
         else if(null != stFieldGrid.m_stAttackFighter && !(stFieldGrid.m_stAttackFighter is a_3924))
         {
            stFieldGrid.m_stAttackFighter.a_3969(value);
         }
         else if(null != stFieldGrid.m_stBoomDefense)
         {
            stFieldGrid.m_stBoomDefense.a_3969(value);
         }
         else if(null != stFieldGrid.m_stFlowerDefense)
         {
            stFieldGrid.m_stFlowerDefense.a_3969(value);
         }
         else if(null != stFieldGrid.m_stBaseAuxiliaryFighter)
         {
            stFieldGrid.m_stBaseAuxiliaryFighter.a_3969(value);
         }
         else if(stFieldGrid.HasNewSlot())
         {
            stFieldGrid.DamageNewSlot(false,0,false,value,-1);
         }
         else if(null != stFieldGrid.m_stTrayDefense)
         {
            stFieldGrid.m_stTrayDefense.a_3969(value);
         }
         return true;
      }
      
      override protected function a_3964() : int
      {
         return GoldFoilConeDefence.a_3964(a_1094);
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
         }
      }
      
      override public function a_3940() : Boolean
      {
         if(this.stWaitTimes != -10 && !this.m_hasFinishSkill && stFieldGrid != null)
         {
            this.ChangeFiedType(true);
         }
         super.a_3940();
         return true;
      }
      
      override protected function a_3955() : Number
      {
         return width * 0.9;
      }
      
      override protected function a_3956() : Number
      {
         return -0.1 * height;
      }
   }
}

