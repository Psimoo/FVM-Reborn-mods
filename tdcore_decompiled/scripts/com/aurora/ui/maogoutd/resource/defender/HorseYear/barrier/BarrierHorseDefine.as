package com.aurora.ui.maogoutd.resource.defender.HorseYear.barrier
{
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   
   public class BarrierHorseDefine
   {
      
      internal static const DEFENSE_PRICE:int = 180;
      
      internal static const SHOT_INTERVAL:int = 20 * 2;
      
      public function BarrierHorseDefine()
      {
         super();
      }
      
      internal static function a_3964(iSkillDegree:int = 0) : int
      {
         return 25 * 10;
      }
      
      internal static function a_3965(iStarDegree:int) : int
      {
         var iStarDegreeEffect:Number = 6;
         switch(iStarDegree)
         {
            case 0:
               iStarDegreeEffect = 7;
               break;
            case 1:
               iStarDegreeEffect = 8;
               break;
            case 2:
               iStarDegreeEffect = 9;
               break;
            case 3:
               iStarDegreeEffect = 12;
               break;
            case 4:
               iStarDegreeEffect = 14;
               break;
            case 5:
               iStarDegreeEffect = 16;
               break;
            case 6:
               iStarDegreeEffect = 18;
               break;
            case 7:
               iStarDegreeEffect = 22;
               break;
            case 8:
               iStarDegreeEffect = 26;
               break;
            case 9:
               iStarDegreeEffect = 30;
               break;
            case 10:
               iStarDegreeEffect = 34;
               break;
            case 11:
               iStarDegreeEffect = 38;
               break;
            case 12:
               iStarDegreeEffect = 45;
               break;
            case 13:
               iStarDegreeEffect = 52;
               break;
            case 14:
               iStarDegreeEffect = 59;
               break;
            case 15:
               iStarDegreeEffect = 66;
               break;
            case 16:
               iStarDegreeEffect = 73;
         }
         return iStarDegreeEffect * 10;
      }
      
      internal static function a_3966(iSkillDegree:int) : int
      {
         var iSkillDegreeEffect:Number = 25;
         switch(iSkillDegree)
         {
            case 0:
               iSkillDegreeEffect = 25;
               break;
            case 1:
               iSkillDegreeEffect = 26;
               break;
            case 2:
               iSkillDegreeEffect = 27;
               break;
            case 3:
               iSkillDegreeEffect = 28;
               break;
            case 4:
               iSkillDegreeEffect = 30;
               break;
            case 5:
               iSkillDegreeEffect = 33;
               break;
            case 6:
               iSkillDegreeEffect = 36;
               break;
            case 7:
               iSkillDegreeEffect = 40;
               break;
            case 8:
               iSkillDegreeEffect = 45;
         }
         return iSkillDegreeEffect * 20;
      }
      
      internal static function DamageGrid(grid:a_3491, trans:int, hurtPower:Number) : void
      {
         var stMoveIntruder:a_4206 = null;
         if(grid == null)
         {
            return;
         }
         var arrMoveIntruder:Array = grid.a_1511.slice();
         for each(stMoveIntruder in arrMoveIntruder)
         {
            DamageMouse(stMoveIntruder,trans,hurtPower);
         }
      }
      
      internal static function DamageMouse(stMoveIntruder:a_4206, trans:int, hurtPower:Number) : void
      {
         var sum:int = 0;
         var damageRate:Number = NaN;
         if(stMoveIntruder.IsElite == false)
         {
            if(stMoveIntruder.iSpaceState != 1)
            {
               stMoveIntruder.a_4210();
               stMoveIntruder.PowerfulBombReduceLifeRate(1);
            }
         }
         else if(trans == 1)
         {
            stMoveIntruder.PowerfulBombReduceLifeRate(hurtPower / 900);
         }
         else
         {
            sum = stMoveIntruder.tagCom.GetSum("barrier_horse_damage") + 1;
            damageRate = 1;
            if(sum == 1)
            {
               damageRate = 1;
            }
            else if(sum == 2)
            {
               damageRate = 1.2;
            }
            else if(sum == 3)
            {
               damageRate = 1.4;
            }
            else if(sum == 4)
            {
               damageRate = 1.6;
            }
            else if(sum == 5)
            {
               damageRate = 1.8;
            }
            else if(sum == 6)
            {
               damageRate = 2;
            }
            else if(sum == 7)
            {
               damageRate = 2.5;
            }
            else
            {
               damageRate = 3;
            }
            if(trans == 3)
            {
               damageRate *= 2;
            }
            stMoveIntruder.tagCom.AddSum("barrier_horse_damage");
            stMoveIntruder.PowerfulBombReduceLifeRate(damageRate * hurtPower / 900);
         }
      }
   }
}

