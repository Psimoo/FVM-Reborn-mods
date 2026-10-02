package com.aurora.ui.maogoutd.resource.defender
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import flash.display.FrameLabel;
   
   public class BreadMiddleSelfBoomFighter extends a_3953
   {
      
      private var m_isStartBoom:Boolean = false;
      
      public function BreadMiddleSelfBoomFighter()
      {
         super();
         a_1335 = 65543;
         a_1095 = 150;
         a_1096 = true;
         a_1319 = 2;
      }
      
      public static function a_3926() : a_3953
      {
         return PoolManager.getInstance().CheckOutOne(BreadMiddleSelfBoomFighter,BreadMiddleSelfBoomFighterMovie) as BreadMiddleSelfBoomFighter;
      }
      
      override public function a_1797(stFieldGrid:a_3491) : Boolean
      {
         super.a_1797(stFieldGrid);
         a_1311 = 180;
         a_1339 = 1000 + this.a_3965();
         this.m_isStartBoom = false;
         tagCom.AddTag(30030);
         return true;
      }
      
      override protected function a_3964() : int
      {
         return this.a_3966();
      }
      
      override public function a_3969(iRduceLifeValue:int) : Boolean
      {
         if(1 == m_iDieType && iRduceLifeValue >= iLifeValue)
         {
            if(a_1275 != 3)
            {
               a_1275 = 3;
               gotoAndStop((a_1276[3] as FrameLabel).frame);
            }
            this.m_isStartBoom = true;
            return true;
         }
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
         var stFieldGridVector:Array = null;
         var yStart:int = 0;
         var xStart:int = 0;
         var yEnd:int = 0;
         var xEnd:int = 0;
         var yIndex:int = 0;
         var xIndex:int = 0;
         var arrMoveIntruder:Array = null;
         var stMoveIntruder:a_4206 = null;
         if(iCurrentTime % 2 == 0)
         {
            super.a_3957(iCurrentTime);
            if(Boolean(a_1334) && Boolean(this.m_isStartBoom) && a_1273 == a_1274 - 5)
            {
               BattleFieldView.a_1048.play();
               a_1334.m_stCurrentBattbleFieldView.a_3466();
               stFieldGridVector = a_1334.m_stCurrentBattbleFieldView.stFieldGridsVector;
               yStart = a_1334.m_iYGridNo - 1 < 0 ? 0 : int(a_1334.m_iYGridNo - 1);
               xStart = a_1334.m_iXGridNo - 2 < 0 ? 0 : int(a_1334.m_iXGridNo - 2);
               yEnd = a_1334.m_iYGridNo + 1 >= BattleFieldView.a_1012 ? int(BattleFieldView.a_1012 - 1) : int(a_1334.m_iYGridNo + 1);
               xEnd = a_1334.m_iXGridNo + 1 >= BattleFieldView.a_1011 ? int(BattleFieldView.a_1011 - 1) : int(a_1334.m_iXGridNo + 1);
               for(yIndex = yStart; yIndex <= yEnd; yIndex++)
               {
                  for(xIndex = xStart; xIndex <= xEnd; xIndex++)
                  {
                     arrMoveIntruder = stFieldGridVector[yIndex][xIndex].a_1511.slice();
                     for each(stMoveIntruder in arrMoveIntruder)
                     {
                        stMoveIntruder.a_4210();
                     }
                  }
               }
            }
            if(this.m_isStartBoom && a_1273 == a_1274 - 1)
            {
               super.a_3969(iLifeValue);
               if(a_1339 <= 0)
               {
                  a_3940();
               }
            }
         }
      }
      
      override protected function a_3965() : int
      {
         var iStarDegreeEffect:int = 100;
         switch(a_1094)
         {
            case 0:
               iStarDegreeEffect = 100;
               break;
            case 1:
               iStarDegreeEffect = 105;
               break;
            case 2:
               iStarDegreeEffect = 110;
               break;
            case 3:
               iStarDegreeEffect = 115;
               break;
            case 4:
               iStarDegreeEffect = 123;
               break;
            case 5:
               iStarDegreeEffect = 131;
               break;
            case 6:
               iStarDegreeEffect = 139;
               break;
            case 7:
               iStarDegreeEffect = 150;
               break;
            case 8:
               iStarDegreeEffect = 161;
               break;
            case 9:
               iStarDegreeEffect = 172;
               break;
            case 10:
               iStarDegreeEffect = 182;
               break;
            case 11:
               iStarDegreeEffect = 202;
               break;
            case 12:
               iStarDegreeEffect = 222;
               break;
            case 13:
               iStarDegreeEffect = 242;
               break;
            case 14:
               iStarDegreeEffect = 262;
               break;
            case 15:
               iStarDegreeEffect = 282;
               break;
            case 16:
               iStarDegreeEffect = 302;
         }
         return iStarDegreeEffect;
      }
      
      override protected function a_3966() : int
      {
         var iSkillDegreeEffect:int = 50;
         switch(m_iSkillDegree)
         {
            case 0:
               iSkillDegreeEffect = 50;
               break;
            case 1:
               iSkillDegreeEffect = 48;
               break;
            case 2:
               iSkillDegreeEffect = 45;
               break;
            case 3:
               iSkillDegreeEffect = 32;
               break;
            case 4:
               iSkillDegreeEffect = 38;
               break;
            case 5:
               iSkillDegreeEffect = 34;
               break;
            case 6:
               iSkillDegreeEffect = 30;
               break;
            case 7:
               iSkillDegreeEffect = 25;
               break;
            case 8:
            case 9:
               iSkillDegreeEffect = 20;
               break;
            case 10:
            case 11:
            case 12:
               iSkillDegreeEffect = 15;
               break;
            case 13:
            case 14:
            case 15:
               iSkillDegreeEffect = 10;
               break;
            case 16:
               iSkillDegreeEffect = 5;
               break;
            default:
               iSkillDegreeEffect = 50;
         }
         return 10 * iSkillDegreeEffect;
      }
   }
}

