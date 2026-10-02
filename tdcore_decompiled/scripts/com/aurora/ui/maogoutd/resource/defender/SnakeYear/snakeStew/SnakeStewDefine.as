package com.aurora.ui.maogoutd.resource.defender.SnakeYear.snakeStew
{
   import a_4718.b_183;
   
   public class SnakeStewDefine
   {
      
      public function SnakeStewDefine()
      {
         super();
      }
      
      internal static function GetShotTypeID(iType:int = 0) : uint
      {
         return b_183.enm_AthenaShot;
      }
      
      internal static function a_3964(iStarDegree:int = 0) : int
      {
         return a_3966(iStarDegree);
      }
      
      internal static function a_3966(iStarDegree:int) : int
      {
         var iStarDegreeEffect:Number = 0;
         switch(iStarDegree)
         {
            case 0:
               iStarDegreeEffect = 480;
               break;
            case 1:
               iStarDegreeEffect = 470;
               break;
            case 2:
               iStarDegreeEffect = 460;
               break;
            case 3:
               iStarDegreeEffect = 450;
               break;
            case 4:
               iStarDegreeEffect = 430;
               break;
            case 5:
               iStarDegreeEffect = 410;
               break;
            case 6:
               iStarDegreeEffect = 390;
               break;
            case 7:
               iStarDegreeEffect = 370;
               break;
            case 8:
               iStarDegreeEffect = 350;
               break;
            case 9:
               iStarDegreeEffect = 320;
               break;
            case 10:
               iStarDegreeEffect = 290;
               break;
            case 11:
               iStarDegreeEffect = 260;
               break;
            case 12:
               iStarDegreeEffect = 230;
               break;
            case 13:
               iStarDegreeEffect = 200;
               break;
            case 14:
               iStarDegreeEffect = 160;
               break;
            case 15:
               iStarDegreeEffect = 120;
               break;
            case 16:
               iStarDegreeEffect = 70;
         }
         return iStarDegreeEffect;
      }
   }
}

