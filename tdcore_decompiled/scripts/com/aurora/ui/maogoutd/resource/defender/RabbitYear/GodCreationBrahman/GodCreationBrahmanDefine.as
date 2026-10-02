package com.aurora.ui.maogoutd.resource.defender.RabbitYear.GodCreationBrahman
{
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.defender.a_3953;
   import com.aurora.ui.maogoutd.resource.defender.a_3959;
   import com.aurora.ui.maogoutd.resource.defender.a_3960;
   import com.aurora.ui.maogoutd.resource.defender.a_3962;
   import com.aurora.ui.maogoutd.resource.defender.a_3971;
   import com.aurora.ui.maogoutd.resource.defender.a_3975;
   import com.aurora.ui.maogoutd.resource.defender.defenderSet.IDefenderSet;
   
   public class GodCreationBrahmanDefine
   {
      
      internal static const DEFENSE_PRICE:int = 325;
      
      internal static const REDUCE_PRICE:int = 50;
      
      internal static const REDUCE_TIME:int = 30;
      
      public function GodCreationBrahmanDefine()
      {
         super();
      }
      
      internal static function a_3964(iStarDegree:int) : int
      {
         return a_3965(iStarDegree);
      }
      
      internal static function a_3965(iStarDegree:int) : int
      {
         var iStarDegreeEffect:Number = 0;
         switch(iStarDegree)
         {
            case 0:
               iStarDegreeEffect = 55;
               break;
            case 1:
               iStarDegreeEffect = 54;
               break;
            case 2:
               iStarDegreeEffect = 53;
               break;
            case 3:
               iStarDegreeEffect = 52;
               break;
            case 4:
               iStarDegreeEffect = 50;
               break;
            case 5:
               iStarDegreeEffect = 48;
               break;
            case 6:
               iStarDegreeEffect = 46;
               break;
            case 7:
               iStarDegreeEffect = 43;
               break;
            case 8:
               iStarDegreeEffect = 40;
               break;
            case 9:
               iStarDegreeEffect = 37;
               break;
            case 10:
               iStarDegreeEffect = 34;
               break;
            case 11:
               iStarDegreeEffect = 31;
               break;
            case 12:
               iStarDegreeEffect = 28;
               break;
            case 13:
               iStarDegreeEffect = 25;
               break;
            case 14:
               iStarDegreeEffect = 22;
               break;
            case 15:
               iStarDegreeEffect = 19;
               break;
            case 16:
               iStarDegreeEffect = 15;
         }
         return 10 * iStarDegreeEffect;
      }
      
      internal static function CanCopyCard(m_stCopyBaseDefense:a_3962, stFieldGrid:a_3491) : Boolean
      {
         var coveredDefense:a_3962 = null;
         var stDefenderSet:IDefenderSet = null;
         var m_CanAddCard:Boolean = true;
         if(stFieldGrid == null || m_stCopyBaseDefense == null)
         {
            return false;
         }
         if(stFieldGrid.m_stAttackFighter is IDefenderSet && (stFieldGrid.m_stAttackFighter as IDefenderSet).IsUpgradeID(m_stCopyBaseDefense.a_3512()))
         {
            stDefenderSet = stFieldGrid.m_stAttackFighter as IDefenderSet;
            m_CanAddCard = !stDefenderSet.IsFull() ? true : false;
         }
         else if((m_stCopyBaseDefense.iUpgradeID & 0xFF0000) > 0)
         {
            coveredDefense = stFieldGrid.getIUpgradeDefense();
            if(m_stCopyBaseDefense is a_3975 && null != stFieldGrid.m_stProtector && stFieldGrid.m_stProtector.iUpgradeID == (m_stCopyBaseDefense.iUpgradeID & 0xFFFF))
            {
               stFieldGrid.m_stProtector.a_3969(stFieldGrid.m_stProtector.iLifeValue);
               m_CanAddCard = true;
            }
            else if(m_stCopyBaseDefense is a_3953 && null != stFieldGrid.m_stAttackFighter && stFieldGrid.m_stAttackFighter.iUpgradeID == (m_stCopyBaseDefense.iUpgradeID & 0xFFFF))
            {
               stFieldGrid.m_stAttackFighter.a_3969(stFieldGrid.m_stAttackFighter.iLifeValue);
               m_CanAddCard = true;
            }
            else if(m_stCopyBaseDefense is a_3960 && null != stFieldGrid.m_stBoomDefense && stFieldGrid.m_stBoomDefense.iUpgradeID == (m_stCopyBaseDefense.iUpgradeID & 0xFFFF))
            {
               stFieldGrid.m_stBoomDefense.a_3969(stFieldGrid.m_stBoomDefense.iLifeValue);
               m_CanAddCard = true;
            }
            else if(m_stCopyBaseDefense is a_3971 && null != stFieldGrid.m_stFlowerDefense && stFieldGrid.m_stFlowerDefense.iUpgradeID == (m_stCopyBaseDefense.iUpgradeID & 0xFFFF))
            {
               stFieldGrid.m_stFlowerDefense.a_3969(stFieldGrid.m_stFlowerDefense.iLifeValue);
               m_CanAddCard = true;
            }
            else if(m_stCopyBaseDefense is a_3959 && null != stFieldGrid.m_stBaseAuxiliaryFighter && stFieldGrid.m_stBaseAuxiliaryFighter.iUpgradeID == (m_stCopyBaseDefense.iUpgradeID & 0xFFFF))
            {
               stFieldGrid.m_stBaseAuxiliaryFighter.a_3969(stFieldGrid.m_stBaseAuxiliaryFighter.iLifeValue);
               m_CanAddCard = true;
            }
            else if(m_stCopyBaseDefense is a_3959 && stFieldGrid.TryConsumeUpgradeMatchNewSlot(m_stCopyBaseDefense))
            {
               m_CanAddCard = true;
            }
            else if(Boolean(coveredDefense) && m_stCopyBaseDefense.iUpgradeArray.indexOf(coveredDefense.a_3512()) != -1)
            {
               coveredDefense.a_3969(coveredDefense.iLifeValue);
               m_CanAddCard = true;
            }
            else
            {
               m_CanAddCard = false;
            }
         }
         return m_CanAddCard;
      }
   }
}

