package com.aurora.ui.maogoutd.resource.defender.dogBeam
{
   import a_4718.b_183;
   
   public class DogBeamDefine
   {
      
      internal static const SHOT_DELAY_TIMENUM:int = 10;
      
      internal static const CONTINUE_SHOT_INTERVAL:int = 8;
      
      internal static const DEFENSE_PRICE:int = 275;
      
      public function DogBeamDefine()
      {
         super();
      }
      
      internal static function GetShotTypeID(iType:int = 0) : uint
      {
         return b_183.enm_SagittariusShot;
      }
      
      internal static function a_3964(iStarDegree:int = 0) : int
      {
         return 150;
      }
      
      internal static function a_3966(iSkillDegree:int, iState:int = 0) : int
      {
         if(iState == 0)
         {
            if(iSkillDegree == 8)
            {
               return 22 - iSkillDegree - 1;
            }
            return 22 - iSkillDegree;
         }
         if(iSkillDegree == 8)
         {
            return 27 - iSkillDegree - 1;
         }
         return 27 - iSkillDegree;
      }
      
      internal static function a_3965(iStarDegree:int, iState:int = 0) : int
      {
         var iStarDegreeEffect:int = 0;
         if(iState == 0)
         {
            switch(iStarDegree)
            {
               case 0:
                  iStarDegreeEffect = 90;
                  break;
               case 1:
                  iStarDegreeEffect = 100;
                  break;
               case 2:
                  iStarDegreeEffect = 110;
                  break;
               case 3:
                  iStarDegreeEffect = 120;
                  break;
               case 4:
                  iStarDegreeEffect = 140;
                  break;
               case 5:
                  iStarDegreeEffect = 160;
                  break;
               case 6:
                  iStarDegreeEffect = 180;
                  break;
               case 7:
                  iStarDegreeEffect = 210;
                  break;
               case 8:
                  iStarDegreeEffect = 260;
                  break;
               case 9:
                  iStarDegreeEffect = 330;
                  break;
               case 10:
                  iStarDegreeEffect = 450;
                  break;
               case 11:
                  iStarDegreeEffect = 570;
                  break;
               case 12:
                  iStarDegreeEffect = 700;
                  break;
               case 13:
                  iStarDegreeEffect = 830;
                  break;
               case 14:
                  iStarDegreeEffect = 960;
                  break;
               case 15:
                  iStarDegreeEffect = 1090;
                  break;
               case 16:
                  iStarDegreeEffect = 1240;
            }
         }
         else if(iState == 1)
         {
            switch(iStarDegree)
            {
               case 0:
                  iStarDegreeEffect = 80;
                  break;
               case 1:
                  iStarDegreeEffect = 90;
                  break;
               case 2:
                  iStarDegreeEffect = 100;
                  break;
               case 3:
                  iStarDegreeEffect = 110;
                  break;
               case 4:
                  iStarDegreeEffect = 130;
                  break;
               case 5:
                  iStarDegreeEffect = 150;
                  break;
               case 6:
                  iStarDegreeEffect = 170;
                  break;
               case 7:
                  iStarDegreeEffect = 190;
                  break;
               case 8:
                  iStarDegreeEffect = 230;
                  break;
               case 9:
                  iStarDegreeEffect = 320;
                  break;
               case 10:
                  iStarDegreeEffect = 430;
                  break;
               case 11:
                  iStarDegreeEffect = 540;
                  break;
               case 12:
                  iStarDegreeEffect = 650;
                  break;
               case 13:
                  iStarDegreeEffect = 760;
                  break;
               case 14:
                  iStarDegreeEffect = 880;
                  break;
               case 15:
                  iStarDegreeEffect = 1000;
                  break;
               case 16:
                  iStarDegreeEffect = 1140;
            }
         }
         else if(iState == 2)
         {
            switch(iStarDegree)
            {
               case 0:
                  iStarDegreeEffect = 50;
                  break;
               case 1:
                  iStarDegreeEffect = 55;
                  break;
               case 2:
                  iStarDegreeEffect = 60;
                  break;
               case 3:
                  iStarDegreeEffect = 65;
                  break;
               case 4:
                  iStarDegreeEffect = 70;
                  break;
               case 5:
                  iStarDegreeEffect = 80;
                  break;
               case 6:
                  iStarDegreeEffect = 90;
                  break;
               case 7:
                  iStarDegreeEffect = 110;
                  break;
               case 8:
                  iStarDegreeEffect = 140;
                  break;
               case 9:
                  iStarDegreeEffect = 170;
                  break;
               case 10:
                  iStarDegreeEffect = 230;
                  break;
               case 11:
                  iStarDegreeEffect = 300;
                  break;
               case 12:
                  iStarDegreeEffect = 360;
                  break;
               case 13:
                  iStarDegreeEffect = 420;
                  break;
               case 14:
                  iStarDegreeEffect = 490;
                  break;
               case 15:
                  iStarDegreeEffect = 560;
                  break;
               case 16:
                  iStarDegreeEffect = 640;
            }
         }
         return iStarDegreeEffect;
      }
   }
}

