package com.aurora.ui.maogoutd.resource.defender.fusionCard.HaiXing
{
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.defender.fusionCard.HaiXing.shot.HaixingFusionFollowShot;
   
   public class HaixingFusionDefence
   {
      
      internal static const DEFENSE_PRICE:int = 175;
      
      internal static const SHOT_DELAY_TIMENUM:int = 8;
      
      internal static const CONTINUE_SHOT_INTERVAL:int = 2;
      
      internal static const SHOT_SPAWN_RADIUS:Number = 20;
      
      public function HaixingFusionDefence()
      {
         super();
      }
      
      internal static function a_3964(iSkillDegree:int = 0) : int
      {
         return 70;
      }
      
      internal static function a_3966(iSkillDegree:int) : int
      {
         var iSkillDegreeEffect:Number = 1.3;
         switch(iSkillDegree)
         {
            case 0:
               iSkillDegreeEffect = 1.3;
               break;
            case 1:
               iSkillDegreeEffect = 1.25;
               break;
            case 2:
               iSkillDegreeEffect = 1.2;
               break;
            case 3:
               iSkillDegreeEffect = 1.15;
               break;
            case 4:
               iSkillDegreeEffect = 1.1;
               break;
            case 5:
               iSkillDegreeEffect = 1.05;
               break;
            case 6:
               iSkillDegreeEffect = 1;
               break;
            case 7:
               iSkillDegreeEffect = 0.9;
               break;
            case 8:
               iSkillDegreeEffect = 0.8;
         }
         return iSkillDegreeEffect * 20;
      }
      
      internal static function a_3965(iStarDegree:int) : int
      {
         var iStarDegreeEffect:int = 5;
         switch(iStarDegree)
         {
            case 0:
               iStarDegreeEffect = 5;
               break;
            case 1:
               iStarDegreeEffect = 6;
               break;
            case 2:
               iStarDegreeEffect = 7;
               break;
            case 3:
               iStarDegreeEffect = 8;
               break;
            case 4:
               iStarDegreeEffect = 10;
               break;
            case 5:
               iStarDegreeEffect = 12;
               break;
            case 6:
               iStarDegreeEffect = 14;
               break;
            case 7:
               iStarDegreeEffect = 17;
               break;
            case 8:
               iStarDegreeEffect = 20;
               break;
            case 9:
               iStarDegreeEffect = 23;
               break;
            case 10:
               iStarDegreeEffect = 28;
               break;
            case 11:
               iStarDegreeEffect = 36;
               break;
            case 12:
               iStarDegreeEffect = 46;
               break;
            case 13:
               iStarDegreeEffect = 57;
               break;
            case 14:
               iStarDegreeEffect = 69;
               break;
            case 15:
               iStarDegreeEffect = 82;
               break;
            case 16:
               iStarDegreeEffect = 97;
         }
         return 10 * iStarDegreeEffect;
      }
      
      internal static function GetCardPrimaryValueByGradeDegree(iGradeDegree:int) : int
      {
         var iGradeDegreeValue:Number = 0;
         switch(iGradeDegree)
         {
            case 1:
               iGradeDegreeValue = 1.8;
               break;
            case 2:
               iGradeDegreeValue = 2.1;
               break;
            case 3:
               iGradeDegreeValue = 2.4;
               break;
            case 4:
               iGradeDegreeValue = 3;
               break;
            case 5:
               iGradeDegreeValue = 3.5;
               break;
            case 6:
               iGradeDegreeValue = 4;
               break;
            case 7:
               iGradeDegreeValue = 5;
               break;
            case 8:
               iGradeDegreeValue = 6;
               break;
            case 9:
               iGradeDegreeValue = 7;
               break;
            case 10:
               iGradeDegreeValue = 8.5;
               break;
            case 11:
               iGradeDegreeValue = 10;
               break;
            case 12:
               iGradeDegreeValue = 13;
               break;
            case 13:
               iGradeDegreeValue = 16;
               break;
            case 14:
               iGradeDegreeValue = 20;
               break;
            case 15:
               iGradeDegreeValue = 24;
               break;
            case 16:
               iGradeDegreeValue = 30;
         }
         return iGradeDegreeValue * 10;
      }
      
      internal static function GetCardDeepValueByGradeDegree(iGradeDegree:int) : Number
      {
         var iGradeDegreeValue:Number = 0;
         switch(iGradeDegree)
         {
            case 1:
               iGradeDegreeValue = 0.07;
               break;
            case 2:
               iGradeDegreeValue = 0.08;
               break;
            case 3:
               iGradeDegreeValue = 0.09;
               break;
            case 4:
               iGradeDegreeValue = 0.1;
               break;
            case 5:
               iGradeDegreeValue = 0.11;
               break;
            case 6:
               iGradeDegreeValue = 0.12;
               break;
            case 7:
               iGradeDegreeValue = 0.13;
               break;
            case 8:
               iGradeDegreeValue = 0.14;
               break;
            case 9:
               iGradeDegreeValue = 0.15;
               break;
            case 10:
               iGradeDegreeValue = 0.16;
               break;
            case 11:
               iGradeDegreeValue = 0.17;
               break;
            case 12:
               iGradeDegreeValue = 0.18;
               break;
            case 13:
               iGradeDegreeValue = 0.2;
               break;
            case 14:
               iGradeDegreeValue = 0.25;
               break;
            case 15:
               iGradeDegreeValue = 0.35;
               break;
            case 16:
               iGradeDegreeValue = 0.5;
         }
         return iGradeDegreeValue;
      }
      
      internal static function GetCardSoulValueByGradeDegree(iGradeDegree:int) : int
      {
         var iGradeDegreeValue:Number = 0;
         switch(iGradeDegree)
         {
            case 1:
               iGradeDegreeValue = 2;
               break;
            case 2:
               iGradeDegreeValue = 2.5;
               break;
            case 3:
               iGradeDegreeValue = 3;
               break;
            case 4:
               iGradeDegreeValue = 3.5;
               break;
            case 5:
               iGradeDegreeValue = 4;
               break;
            case 6:
               iGradeDegreeValue = 5.5;
               break;
            case 7:
               iGradeDegreeValue = 7;
               break;
            case 8:
               iGradeDegreeValue = 8.5;
               break;
            case 9:
               iGradeDegreeValue = 10;
               break;
            case 10:
               iGradeDegreeValue = 11.5;
               break;
            case 11:
               iGradeDegreeValue = 13;
               break;
            case 12:
               iGradeDegreeValue = 15;
               break;
            case 13:
               iGradeDegreeValue = 18;
               break;
            case 14:
               iGradeDegreeValue = 25;
               break;
            case 15:
               iGradeDegreeValue = 30;
               break;
            case 16:
               iGradeDegreeValue = 40;
         }
         return iGradeDegreeValue * 10;
      }
      
      internal static function GetFieldIntruderNumForFiveDirection(stFieldGrid:a_3491) : int
      {
         var j:int = 0;
         var k:* = 0;
         var iTotalIntruderNum:int = 0;
         var i:int = 0;
         if(!stFieldGrid)
         {
            return 0;
         }
         for(i = 0; i < stFieldGrid.m_iXGridNo; i++)
         {
            iTotalIntruderNum += stFieldGrid.m_stCurrentBattbleFieldView.stFieldRowIntruderStatusArray[stFieldGrid.m_iYGridNo];
         }
         for(i = 0; i < stFieldGrid.m_iYGridNo; i++)
         {
            iTotalIntruderNum += stFieldGrid.m_stCurrentBattbleFieldView.a_3438(stFieldGrid.m_iXGridNo,i).a_1511.length;
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
            for(k = stFieldGrid.m_iYGridNo; k > 0; k--)
            {
               iTotalIntruderNum += stFieldGrid.m_stCurrentBattbleFieldView.a_3438(i,k).a_1511.length;
            }
         }
         return iTotalIntruderNum;
      }
      
      internal static function GetShotSpawnPos(numCenterX:Number, numCenterY:Number, iDirection:int, arrPos:Array) : Boolean
      {
         var numAngle:Number = GetShotAngleByDirection(iDirection);
         if(isNaN(numAngle))
         {
            return false;
         }
         arrPos[0] = int(numCenterX + SHOT_SPAWN_RADIUS * Math.cos(numAngle));
         arrPos[1] = int(numCenterY + SHOT_SPAWN_RADIUS * Math.sin(numAngle));
         return true;
      }
      
      private static function GetShotAngleByDirection(iDirection:int) : Number
      {
         switch(iDirection)
         {
            case 1:
               return Math.PI;
            case 2:
               return -Math.PI / 2;
            case 3:
               return Math.PI / 2;
            case 4:
               return -Math.PI / 4;
            case 5:
               return Math.PI / 4;
            default:
               return NaN;
         }
      }
      
      public static function a_3431(gride:a_3491, orgX:Number, orgY:Number) : a_4206
      {
         var nearest:a_4206 = null;
         var intruder:a_4206 = null;
         var dx:Number = NaN;
         var dy:Number = NaN;
         var distSq:Number = NaN;
         if(!gride)
         {
            return null;
         }
         var minDistSq:Number = Number.MAX_VALUE;
         var intruders:Array = gride.m_stCurrentBattbleFieldView.m_arrBaseMoveIntruderVector;
         for each(intruder in intruders)
         {
            if(!(intruder.iSpaceState == 1 || intruder.iLifeValue <= 0 || !intruder.m_stCurrentFieldGrid))
            {
               if(!intruder.isCannotSeeByFighter)
               {
                  dx = intruder.x - orgX;
                  dy = intruder.y - orgY;
                  distSq = dx * dx + dy * dy;
                  if(distSq < minDistSq)
                  {
                     minDistSq = distSq;
                     nearest = intruder;
                  }
               }
            }
         }
         return nearest;
      }
      
      public static function addFollowingShot(gride:a_3491, orgX:Number, orgY:Number, iShotSpeed:Number, iShotHurt:int, transIndex:int = 2) : void
      {
         if(!gride || !gride.m_stCurrentBattbleFieldView)
         {
            return;
         }
         var stMoveIntruder:a_4206 = a_3431(gride,orgX,orgY);
         if(!stMoveIntruder)
         {
            return;
         }
         var stFollowShot:HaixingFusionFollowShot = HaixingFusionFollowShot.a_4344(transIndex);
         if(!stFollowShot)
         {
            return;
         }
         if(orgY > BattleFieldView.a_1014 - 1)
         {
            orgY = BattleFieldView.a_1014 - 1;
         }
         else if(orgY < 0)
         {
            orgY = 0;
         }
         if(orgX > BattleFieldView.a_1013 - 1)
         {
            orgX = BattleFieldView.a_1013 - 1;
         }
         else if(orgX < 0)
         {
            orgX = 0;
         }
         stFollowShot.a_1797(0,iShotSpeed,iShotHurt,orgX,orgY,gride.m_stCurrentBattbleFieldView,gride);
         stFollowShot.stTargetMoveIntruder = stMoveIntruder;
         gride.m_stCurrentBattbleFieldView.AddToBattleView(stFollowShot,BattleLayerDefine.SHOT_TYPE,gride);
      }
   }
}

