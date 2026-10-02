package com.aurora.ui.maogoutd.resource.defender.newSeabedChapters.MianBao
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.defender.a_3953;
   import flash.display.FrameLabel;
   
   public class CrabShellBreadBaseFighter extends a_3953
   {
      
      public function CrabShellBreadBaseFighter()
      {
         super();
         a_1095 = 155;
         a_1096 = false;
         a_1319 = 2;
      }
      
      public static function a_3926() : a_3953
      {
         return PoolManager.getInstance().CheckOutOne(CrabShellBreadBaseFighter) as CrabShellBreadBaseFighter;
      }
      
      override protected function getBindMovie() : Class
      {
         return CrabShellBreadBaseFighterMovie;
      }
      
      override public function a_1797(stFieldGrid:a_3491) : Boolean
      {
         super.a_1797(stFieldGrid);
         a_1339 = this.a_3965();
         return true;
      }
      
      override protected function a_3964() : int
      {
         return 280;
      }
      
      override public function a_3969(iRduceLifeValue:int) : Boolean
      {
         super.a_3969(iRduceLifeValue);
         if(a_1339 == 600)
         {
            a_1275 = 1;
            gotoAndStop((a_1276[1] as FrameLabel).frame);
         }
         else if(a_1339 == 300)
         {
            a_1275 = 2;
            gotoAndStop((a_1276[2] as FrameLabel).frame);
            a_1307 = (a_1276[2] as FrameLabel).frame;
         }
         else if(a_1339 <= 0)
         {
         }
         return true;
      }
      
      override public function a_3957(iCurrentTime:int) : void
      {
         if(iCurrentTime % 2 == 0)
         {
            super.a_3957(iCurrentTime);
         }
      }
      
      override protected function a_3965() : int
      {
         var iStarDegreeEffect:int = 120;
         switch(a_1094)
         {
            case 0:
               iStarDegreeEffect = 120;
               break;
            case 1:
               iStarDegreeEffect = 125;
               break;
            case 2:
               iStarDegreeEffect = 130;
               break;
            case 3:
               iStarDegreeEffect = 135;
               break;
            case 4:
               iStarDegreeEffect = 143;
               break;
            case 5:
               iStarDegreeEffect = 151;
               break;
            case 6:
               iStarDegreeEffect = 169;
               break;
            case 7:
               iStarDegreeEffect = 180;
               break;
            case 8:
               iStarDegreeEffect = 191;
               break;
            case 9:
               iStarDegreeEffect = 202;
               break;
            case 10:
               iStarDegreeEffect = 212;
               break;
            case 11:
               iStarDegreeEffect = 242;
               break;
            case 12:
               iStarDegreeEffect = 262;
               break;
            case 13:
               iStarDegreeEffect = 282;
               break;
            case 14:
               iStarDegreeEffect = 302;
               break;
            case 15:
               iStarDegreeEffect = 322;
               break;
            case 16:
               iStarDegreeEffect = 342;
         }
         return iStarDegreeEffect * 10;
      }
      
      override protected function a_3966() : int
      {
         var iSkillDegreeEffect:int = 0;
         if(m_iSkillDegree <= 3)
         {
            iSkillDegreeEffect = 2 * m_iSkillDegree;
         }
         else if(m_iSkillDegree > 3 && m_iSkillDegree <= 6)
         {
            iSkillDegreeEffect = 2 * 3 + 2 * (m_iSkillDegree - 3);
         }
         else if(m_iSkillDegree > 6)
         {
            iSkillDegreeEffect = 2 * 3 + 2 * (6 - 3) + 3 * (m_iSkillDegree - 6);
         }
         return 10 * iSkillDegreeEffect;
      }
   }
}

