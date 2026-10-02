package com.aurora.ui.maogoutd.resource.defender.PigYear.DesertCard.WindBreakGrass
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.avatar.a_3924;
   import com.aurora.ui.maogoutd.resource.defender.PigYear.CureMeow.AddDefBloodEffect;
   import com.aurora.ui.maogoutd.resource.defender.a_3953;
   import flash.display.FrameLabel;
   
   public class WindBreakGrassFirstDefence extends a_3953
   {
      
      public function WindBreakGrassFirstDefence()
      {
         super();
         a_1338 = 0;
         a_1337 = 5;
         a_1095 = WindBreakGrassDefence.DEFENSE_PRICE;
         a_1339 = 60;
         a_1333 = true;
         a_1313 = true;
      }
      
      public static function a_3926() : a_3953
      {
         return PoolManager.getInstance().CheckOutOne(WindBreakGrassFirstDefence) as WindBreakGrassFirstDefence;
      }
      
      override protected function getBindMovie() : Class
      {
         return WindBreakGrassFirstDefenceMovie;
      }
      
      override public function a_1797(stFieldGrid:a_3491) : Boolean
      {
         a_1310 = 30;
         super.a_1797(stFieldGrid);
         a_1309 = WindBreakGrassDefence.a_3966(m_iSkillDegree);
         a_1339 = 30;
         this.addCureEffect();
         return true;
      }
      
      override public function a_3954(iCurrentTime:int) : Boolean
      {
         trace("m_iCurrentFrame:" + a_1273);
         if(iCurrentTime > m_iPlaceTimeIntervals + a_1308 && iCurrentTime >= a_1321 + a_1309)
         {
            a_1321 = iCurrentTime;
            a_1307 = a_1273;
            a_1275 = 0;
            gotoAndStop((a_1276[1] as FrameLabel).frame);
            this.ChangeFiedType(false);
         }
         return true;
      }
      
      private function ChangeFiedType(bole:Boolean) : void
      {
         var stFieldGrid:a_3491 = null;
         var xIndex:int = 0;
         var xStart:int = Math.max(a_1334.m_iXGridNo - 2,0);
         var xEnd:int = Math.min(a_1334.m_iXGridNo + 2,BattleFieldView.a_1011 - 1);
         var yStart:int = Math.max(a_1334.m_iYGridNo - 2,0);
         var yEnd:int = Math.min(a_1334.m_iYGridNo + 2,BattleFieldView.a_1012 - 1);
         var stFieldGridVector:Array = a_1334.m_stCurrentBattbleFieldView.stFieldGridsVector;
         for(var yIndex:int = yStart; yIndex <= yEnd; yIndex++)
         {
            for(xIndex = xStart; xIndex <= xEnd; xIndex++)
            {
               stFieldGrid = stFieldGridVector[yIndex][xIndex];
               stFieldGrid.m_isCanBrokeByWind = bole;
            }
         }
      }
      
      private function addCureEffect() : void
      {
         var stFieldGrid:a_3491 = null;
         var xIndex:int = 0;
         var xStart:int = Math.max(a_1334.m_iXGridNo - 1,0);
         var xEnd:int = Math.min(a_1334.m_iXGridNo + 1,BattleFieldView.a_1011 - 1);
         var yStart:int = Math.max(a_1334.m_iYGridNo - 1,0);
         var yEnd:int = Math.min(a_1334.m_iYGridNo + 1,BattleFieldView.a_1012 - 1);
         var stFieldGridVector:Array = a_1334.m_stCurrentBattbleFieldView.stFieldGridsVector;
         for(var yIndex:int = yStart; yIndex <= yEnd; yIndex++)
         {
            for(xIndex = xStart; xIndex <= xEnd; xIndex++)
            {
               stFieldGrid = stFieldGridVector[yIndex][xIndex];
               this.CureFieldGridDefense(stFieldGrid,-10);
            }
         }
      }
      
      protected function CureFieldGridDefense(stFieldGrid:a_3491, value:int = 10) : Boolean
      {
         var stAddDefBloodEffect:AddDefBloodEffect = null;
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
         return WindBreakGrassDefence.a_3964(a_1094);
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

