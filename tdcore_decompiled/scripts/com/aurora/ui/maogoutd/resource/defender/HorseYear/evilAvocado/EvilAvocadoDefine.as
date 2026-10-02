package com.aurora.ui.maogoutd.resource.defender.HorseYear.evilAvocado
{
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.shot.a_4348;
   import flash.display.DisplayObject;
   
   public class EvilAvocadoDefine
   {
      
      internal static const SHOT_DELAY_TIMENUM:int = 10;
      
      internal static const CONTINUE_SHOT_INTERVAL:int = 2;
      
      internal static const DEFENSE_PRICE:int = 210;
      
      public function EvilAvocadoDefine()
      {
         super();
      }
      
      internal static function AddShotToBattleView(stShot:a_4348, stFieldGrid:a_3491) : void
      {
         if(!stShot || !stFieldGrid || !stFieldGrid.m_stCurrentBattbleFieldView)
         {
            return;
         }
         var stShotDisplay:DisplayObject = stShot as DisplayObject;
         stFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(stShotDisplay,BattleLayerDefine.SHOT_TYPE,stFieldGrid);
      }
      
      internal static function a_3964(iStarDegree:int) : int
      {
         return 70;
      }
      
      internal static function a_3966(iSkillDegree:int) : int
      {
         var iSkillDegreeEffect:Number = 1.5;
         switch(iSkillDegree)
         {
            case 0:
               iSkillDegreeEffect = 1.5;
               break;
            case 1:
               iSkillDegreeEffect = 1.45;
               break;
            case 2:
               iSkillDegreeEffect = 1.4;
               break;
            case 3:
               iSkillDegreeEffect = 1.35;
               break;
            case 4:
               iSkillDegreeEffect = 1.3;
               break;
            case 5:
               iSkillDegreeEffect = 1.25;
               break;
            case 6:
               iSkillDegreeEffect = 1.2;
               break;
            case 7:
               iSkillDegreeEffect = 1.1;
               break;
            case 8:
               iSkillDegreeEffect = 1;
         }
         return iSkillDegreeEffect * 20;
      }
      
      internal static function a_3965(iStarDegree:int) : int
      {
         var iStarDegreeEffect:int = 0;
         switch(iStarDegree)
         {
            case 0:
               iStarDegreeEffect = 8;
               break;
            case 1:
               iStarDegreeEffect = 9;
               break;
            case 2:
               iStarDegreeEffect = 10;
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
               iStarDegreeEffect = 19;
               break;
            case 7:
               iStarDegreeEffect = 22;
               break;
            case 8:
               iStarDegreeEffect = 26;
               break;
            case 9:
               iStarDegreeEffect = 31;
               break;
            case 10:
               iStarDegreeEffect = 40;
               break;
            case 11:
               iStarDegreeEffect = 50;
               break;
            case 12:
               iStarDegreeEffect = 65;
               break;
            case 13:
               iStarDegreeEffect = 80;
               break;
            case 14:
               iStarDegreeEffect = 95;
               break;
            case 15:
               iStarDegreeEffect = 110;
               break;
            case 16:
               iStarDegreeEffect = 125;
         }
         return 10 * iStarDegreeEffect;
      }
      
      public static function GetFieldIntruderNumForFiveDirection(stFieldGrid:a_3491) : int
      {
         var j:int = 0;
         var k:* = 0;
         var iTotalIntruderNum:int = 0;
         var i:int = 0;
         if(stFieldGrid)
         {
            for(i = stFieldGrid.m_iXGridNo; i < BattleFieldView.a_1011; i++)
            {
               iTotalIntruderNum += stFieldGrid.m_stCurrentBattbleFieldView.stFieldRowIntruderStatusArray[stFieldGrid.m_iYGridNo];
            }
            for(i = stFieldGrid.m_iXGridNo; i < BattleFieldView.a_1011; i++)
            {
               for(j = stFieldGrid.m_iYGridNo; j < BattleFieldView.a_1012; j++)
               {
                  iTotalIntruderNum += stFieldGrid.m_stCurrentBattbleFieldView.a_3438(i,j).a_1511.length;
               }
            }
            for(i = stFieldGrid.m_iXGridNo; i < BattleFieldView.a_1011; i++)
            {
               for(k = stFieldGrid.m_iYGridNo; k >= 0; k--)
               {
                  iTotalIntruderNum += stFieldGrid.m_stCurrentBattbleFieldView.a_3438(i,k).a_1511.length;
               }
            }
         }
         return iTotalIntruderNum;
      }
   }
}

