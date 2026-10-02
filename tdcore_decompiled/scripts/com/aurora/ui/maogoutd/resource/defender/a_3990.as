package com.aurora.ui.maogoutd.resource.defender
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.a_3491;
   import flash.display.FrameLabel;
   
   public class a_3990 extends a_3953
   {
      
      public function a_3990()
      {
         super();
         a_1095 = 125;
         a_1096 = true;
         a_1319 = 2;
      }
      
      public static function a_3926() : a_3953
      {
         return PoolManager.getInstance().CheckOutOne(a_3990,BreadMiddleFighterMovie) as a_3990;
      }
      
      override public function a_1797(stFieldGrid:a_3491) : Boolean
      {
         super.a_1797(stFieldGrid);
         a_1339 = this.a_3965();
         tagCom.AddTag(30030);
         return true;
      }
      
      override protected function a_3964() : int
      {
         return 300 - this.a_3966();
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
         var iStarDegreeEffect:int = 1000;
         switch(a_1094)
         {
            case 0:
               iStarDegreeEffect = 1000;
               break;
            case 1:
               iStarDegreeEffect = 1050;
               break;
            case 2:
               iStarDegreeEffect = 1100;
               break;
            case 3:
               iStarDegreeEffect = 1150;
               break;
            case 4:
               iStarDegreeEffect = 1230;
               break;
            case 5:
               iStarDegreeEffect = 1310;
               break;
            case 6:
               iStarDegreeEffect = 1390;
               break;
            case 7:
               iStarDegreeEffect = 1500;
               break;
            case 8:
               iStarDegreeEffect = 1610;
               break;
            case 9:
               iStarDegreeEffect = 1720;
               break;
            case 10:
               iStarDegreeEffect = 1820;
               break;
            case 11:
               iStarDegreeEffect = 2020;
               break;
            case 12:
               iStarDegreeEffect = 2220;
               break;
            case 13:
               iStarDegreeEffect = 2420;
               break;
            case 14:
               iStarDegreeEffect = 2620;
               break;
            case 15:
               iStarDegreeEffect = 2820;
               break;
            case 16:
               iStarDegreeEffect = 3020;
         }
         return iStarDegreeEffect;
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

