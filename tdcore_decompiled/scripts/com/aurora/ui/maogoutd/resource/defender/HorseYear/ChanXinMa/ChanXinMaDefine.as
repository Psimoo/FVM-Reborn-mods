package com.aurora.ui.maogoutd.resource.defender.HorseYear.ChanXinMa
{
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   
   public class ChanXinMaDefine
   {
      
      internal static const DEFENSE_PRICE:int = 180;
      
      internal static const BARRIER_ENERGY:int = 300;
      
      internal static const ICELLENERGYVALUE:int = 450;
      
      internal static const BASE_MAX_FIRE:int = 1500;
      
      internal static const FIRST_MAX_FIRE:int = 2300;
      
      internal static const SECOND_MAX_FIRE:int = 3680;
      
      public function ChanXinMaDefine()
      {
         super();
      }
      
      internal static function a_3964(iSkillDegree:int) : int
      {
         return a_3966(iSkillDegree);
      }
      
      internal static function a_3966(iSkillDegree:int) : int
      {
         var iSkillDegreeEffect:Number = 55;
         switch(iSkillDegree)
         {
            case 0:
               iSkillDegreeEffect = 55;
               break;
            case 1:
               iSkillDegreeEffect = 52;
               break;
            case 2:
               iSkillDegreeEffect = 49;
               break;
            case 3:
               iSkillDegreeEffect = 46;
               break;
            case 4:
               iSkillDegreeEffect = 43;
               break;
            case 5:
               iSkillDegreeEffect = 40;
               break;
            case 6:
               iSkillDegreeEffect = 35;
               break;
            case 7:
               iSkillDegreeEffect = 30;
               break;
            case 8:
               iSkillDegreeEffect = 20;
         }
         return iSkillDegreeEffect * 10;
      }
      
      internal static function GetRefundRatio(iStarDegree:int) : Number
      {
         var iStarDegreeEffect:int = 0;
         switch(iStarDegree)
         {
            case 0:
               iStarDegreeEffect = 10;
               break;
            case 1:
               iStarDegreeEffect = 12;
               break;
            case 2:
               iStarDegreeEffect = 14;
               break;
            case 3:
               iStarDegreeEffect = 16;
               break;
            case 4:
               iStarDegreeEffect = 18;
               break;
            case 5:
               iStarDegreeEffect = 20;
               break;
            case 6:
               iStarDegreeEffect = 22;
               break;
            case 7:
               iStarDegreeEffect = 24;
               break;
            case 8:
               iStarDegreeEffect = 26;
               break;
            case 9:
               iStarDegreeEffect = 28;
               break;
            case 10:
               iStarDegreeEffect = 30;
               break;
            case 11:
               iStarDegreeEffect = 32;
               break;
            case 12:
               iStarDegreeEffect = 35;
               break;
            case 13:
               iStarDegreeEffect = 40;
               break;
            case 14:
               iStarDegreeEffect = 45;
               break;
            case 15:
               iStarDegreeEffect = 50;
               break;
            case 16:
               iStarDegreeEffect = 55;
         }
         return iStarDegreeEffect / 100;
      }
      
      internal static function CollectRefundEnergy(centerGrid:a_3491, radius:int, refundRatio:Number, clearBarrier:Boolean) : int
      {
         var stFieldGrid:a_3491 = null;
         var xIndex:int = 0;
         if(!centerGrid || !centerGrid.m_stCurrentBattbleFieldView)
         {
            return 0;
         }
         var iTotalCost:int = 0;
         var iDefenseCost:int = 0;
         var iBarrierCount:int = 0;
         var xStart:int = Math.max(centerGrid.m_iXGridNo - radius,0);
         var xEnd:int = Math.min(centerGrid.m_iXGridNo + radius,BattleFieldView.a_1011 - 1);
         var yStart:int = Math.max(centerGrid.m_iYGridNo - radius,0);
         var yEnd:int = Math.min(centerGrid.m_iYGridNo + radius,BattleFieldView.a_1012 - 1);
         var grids:Array = centerGrid.m_stCurrentBattbleFieldView.stFieldGridsVector;
         for(var yIndex:int = yStart; yIndex <= yEnd; yIndex++)
         {
            for(xIndex = xStart; xIndex <= xEnd; xIndex++)
            {
               stFieldGrid = grids[yIndex][xIndex];
               iDefenseCost += GetGridDefenseCost(stFieldGrid);
               if(clearBarrier)
               {
                  iBarrierCount += GetGridMouseObstacleCost(stFieldGrid);
               }
            }
         }
         iTotalCost = int(iDefenseCost * refundRatio) + iBarrierCount * BARRIER_ENERGY;
         if(iTotalCost > 12 * ICELLENERGYVALUE)
         {
            iTotalCost = 12 * ICELLENERGYVALUE;
         }
         return iTotalCost;
      }
      
      internal static function GetGridMouseObstacleCost(stFieldGrid:a_3491) : int
      {
         if(!stFieldGrid)
         {
            return 0;
         }
         var iBarrierCount:int = 0;
         if(stFieldGrid.m_stMouseEarthHole)
         {
            stFieldGrid.m_stMouseEarthHole.a_3940();
            stFieldGrid.m_stMouseEarthHole = null;
            stFieldGrid.m_isExistMouseHole = false;
            iBarrierCount++;
         }
         if(stFieldGrid.m_stBaseLander != null)
         {
            stFieldGrid.m_stBaseLander.a_3940();
            stFieldGrid.m_stBaseLander = null;
         }
         return iBarrierCount;
      }
      
      internal static function GetGridDefenseCost(stFieldGrid:a_3491) : int
      {
         if(!stFieldGrid)
         {
            return 0;
         }
         var iFireCount:int = 0;
         if(stFieldGrid.m_stAttackFighter)
         {
            iFireCount += stFieldGrid.m_stAttackFighter.GetRealPrice();
         }
         if(stFieldGrid.m_stBaseAuxiliaryFighter)
         {
            iFireCount += stFieldGrid.m_stBaseAuxiliaryFighter.GetRealPrice();
         }
         if(stFieldGrid.m_stFlowerDefense)
         {
            iFireCount += stFieldGrid.m_stFlowerDefense.GetRealPrice();
         }
         if(stFieldGrid.m_stBoomDefense)
         {
            iFireCount += stFieldGrid.m_stBoomDefense.GetRealPrice();
         }
         if(stFieldGrid.m_stProtector)
         {
            iFireCount += stFieldGrid.m_stProtector.GetRealPrice();
         }
         if(stFieldGrid.m_stBaseToolDefense)
         {
            iFireCount += stFieldGrid.m_stBaseToolDefense.GetRealPrice();
         }
         return iFireCount;
      }
   }
}

