package com.aurora.ui.maogoutd.resource.defender.TigerYear.JiaoTiger
{
   public class JiaoTigerBombDefine
   {
      
      internal static const DEFENSE_PRICE:int = 75;
      
      internal static const FIRSTTRANS_DEFENSE_PRICE:int = 175;
      
      internal static const SECONDTRANS_DEFENSE_PRICE:int = 225;
      
      internal static const MAX_LIFE_VALUE:int = 50;
      
      public function JiaoTigerBombDefine()
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
               iStarDegreeEffect = 50;
               break;
            case 1:
               iStarDegreeEffect = 48;
               break;
            case 2:
               iStarDegreeEffect = 46;
               break;
            case 3:
               iStarDegreeEffect = 44;
               break;
            case 4:
               iStarDegreeEffect = 42;
               break;
            case 5:
               iStarDegreeEffect = 40;
               break;
            case 6:
               iStarDegreeEffect = 38;
               break;
            case 7:
               iStarDegreeEffect = 35;
               break;
            case 8:
               iStarDegreeEffect = 32;
               break;
            case 9:
               iStarDegreeEffect = 29;
               break;
            case 10:
               iStarDegreeEffect = 26;
               break;
            case 11:
               iStarDegreeEffect = 23;
               break;
            case 12:
               iStarDegreeEffect = 20;
               break;
            case 13:
               iStarDegreeEffect = 17;
               break;
            case 14:
               iStarDegreeEffect = 14;
               break;
            case 15:
               iStarDegreeEffect = 11;
               break;
            case 16:
               iStarDegreeEffect = 7;
         }
         return 10 * iStarDegreeEffect;
      }
   }
}

