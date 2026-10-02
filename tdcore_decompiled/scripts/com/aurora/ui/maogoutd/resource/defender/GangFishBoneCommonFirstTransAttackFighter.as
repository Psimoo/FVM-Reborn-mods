package com.aurora.ui.maogoutd.resource.defender
{
   import a_4718.b_182;
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import flash.display.FrameLabel;
   
   public class GangFishBoneCommonFirstTransAttackFighter extends a_3960
   {
      
      protected var a_1309:int = 26;
      
      protected var m_iHurtForOnce:int = 20;
      
      protected var a_1321:int = 0;
      
      public function GangFishBoneCommonFirstTransAttackFighter()
      {
         super();
         a_1095 = 125;
         a_1096 = true;
         a_1331 = false;
         a_1332 = true;
      }
      
      public static function a_3926() : a_3960
      {
         return PoolManager.getInstance().CheckOutOne(GangFishBoneCommonFirstTransAttackFighter) as GangFishBoneCommonFirstTransAttackFighter;
      }
      
      override protected function getBindMovie() : Class
      {
         return GangFishBoneCommonFirstTransAttackFighterMovie;
      }
      
      override public function a_1797(stFieldGrid:a_3491) : Boolean
      {
         this.a_1321 = 0;
         a_1331 = false;
         super.a_1797(stFieldGrid);
         this.m_iHurtForOnce = this.a_3965();
         this.a_1309 = 26 - this.a_3966();
         a_1339 = 3600;
         return true;
      }
      
      override protected function a_3964() : int
      {
         return 500;
      }
      
      override public function a_3961(iCurrentTime:int) : Boolean
      {
         var stMoveIntruder:a_4206 = null;
         super.a_3961(iCurrentTime);
         var stPreFieldGrid:a_3491 = a_1334.m_stCurrentBattbleFieldView.a_3438(a_1334.m_iXGridNo - 1,a_1334.m_iYGridNo);
         if(iCurrentTime >= this.a_1321 + this.a_1309 && (Boolean(a_1334.a_1511.length > 0) || Boolean(stPreFieldGrid && (stPreFieldGrid.m_stAttackFighter && stPreFieldGrid.m_stAttackFighter.iBreadFighterType > 0 || stPreFieldGrid.m_stProtector) && stPreFieldGrid.a_1511.length > 0)))
         {
            this.a_1321 = iCurrentTime;
            a_1275 = 0;
            gotoAndStop((a_1276[1] as FrameLabel).frame);
         }
         if(a_1273 == a_1274 - 2)
         {
            BattleFieldView.a_1038.play();
            if(Boolean(stPreFieldGrid) && (Boolean(stPreFieldGrid.m_stAttackFighter && stPreFieldGrid.m_stAttackFighter.iBreadFighterType > 0) || Boolean(stPreFieldGrid.m_stProtector)))
            {
               for each(stMoveIntruder in stPreFieldGrid.a_1511.slice())
               {
                  if(stMoveIntruder.iSpaceState == 0 && !stMoveIntruder.isCannotSeeByFighter)
                  {
                     stMoveIntruder.a_3969(this.m_iHurtForOnce);
                     stMoveIntruder.a_4208(b_182.a_432,1);
                  }
               }
            }
            for each(stMoveIntruder in a_1334.a_1511.slice())
            {
               if(8388624 == stMoveIntruder.m_stMoveIntruderTypeID || 8389123 == stMoveIntruder.m_stMoveIntruderTypeID || 8389017 == stMoveIntruder.m_stMoveIntruderTypeID || 8389644 == stMoveIntruder.m_stMoveIntruderTypeID)
               {
                  stMoveIntruder.a_3969(stMoveIntruder.iLifeValue);
                  a_3969(900);
               }
               else if(134235477 == stMoveIntruder.m_stMoveIntruderTypeID || 8389715 == stMoveIntruder.m_stMoveIntruderTypeID || 8389716 == stMoveIntruder.m_stMoveIntruderTypeID)
               {
                  stMoveIntruder.a_3969(10000);
                  stMoveIntruder.a_4208(b_182.a_432,1);
               }
               else if(stMoveIntruder.iSpaceState == 0 && !stMoveIntruder.isCannotSeeByFighter)
               {
                  stMoveIntruder.a_3969(this.m_iHurtForOnce);
                  stMoveIntruder.a_4208(b_182.a_432,1);
               }
            }
            gotoAndStop(1);
         }
         return true;
      }
      
      override protected function a_3965() : int
      {
         var iStarDegreeEffect:int = 20;
         switch(a_1094)
         {
            case 0:
               iStarDegreeEffect = 20;
               break;
            case 1:
               iStarDegreeEffect = 24;
               break;
            case 2:
               iStarDegreeEffect = 28;
               break;
            case 3:
               iStarDegreeEffect = 32;
               break;
            case 4:
               iStarDegreeEffect = 38;
               break;
            case 5:
               iStarDegreeEffect = 44;
               break;
            case 6:
               iStarDegreeEffect = 50;
               break;
            case 7:
               iStarDegreeEffect = 58;
               break;
            case 8:
               iStarDegreeEffect = 68;
               break;
            case 9:
               iStarDegreeEffect = 80;
               break;
            case 10:
               iStarDegreeEffect = 100;
               break;
            case 11:
               iStarDegreeEffect = 120;
               break;
            case 12:
               iStarDegreeEffect = 140;
               break;
            case 13:
               iStarDegreeEffect = 160;
               break;
            case 14:
               iStarDegreeEffect = 180;
               break;
            case 15:
               iStarDegreeEffect = 200;
               break;
            case 16:
               iStarDegreeEffect = 220;
         }
         return iStarDegreeEffect;
      }
      
      override protected function a_3966() : int
      {
         return 1 * m_iSkillDegree;
      }
   }
}

