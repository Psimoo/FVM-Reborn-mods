package com.aurora.ui.maogoutd.resource.defender.PigYear.BullockFrog
{
   import a_4715.EncrypIntEx;
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.defender.a_3953;
   import flash.display.FrameLabel;
   
   public class BullockFrogBaseDefence extends a_3953
   {
      
      private var m_iEatLifeValueEx:EncrypIntEx;
      
      private var m_arrPos:Array = [[0,0]];
      
      private var stFG:a_3491;
      
      public function BullockFrogBaseDefence()
      {
         super();
         this.m_iEatLifeValueEx = new EncrypIntEx(900 * 1.3);
         a_1095 = 155;
      }
      
      public static function a_3926() : a_3953
      {
         return PoolManager.getInstance().CheckOutOne(BullockFrogBaseDefence) as BullockFrogBaseDefence;
      }
      
      override protected function getBindMovie() : Class
      {
         return BullockFrogBaseDefenceMovie;
      }
      
      override public function a_1797(stFieldGrid:a_3491) : Boolean
      {
         super.a_1797(stFieldGrid);
         a_1339 = 70;
         a_1309 = this.a_3965();
         a_1321 = 0;
         this.m_iEatLifeValueEx.Value = 900 * 1.3;
         return true;
      }
      
      override protected function a_3964() : int
      {
         return 70;
      }
      
      override public function a_3969(iRduceLifeValue:int) : Boolean
      {
         super.a_3969(iRduceLifeValue);
         return true;
      }
      
      public function boomDie() : void
      {
         var iXGridNo:int = 0;
         var iYGridNo:int = 0;
         var stCurFieldGrid:a_3491 = null;
         var arrMoveIntruder:Array = null;
         var stMoveIntruder:a_4206 = null;
         var iLen:int = int(this.m_arrPos.length);
         for(var i:int = 0; i < iLen; i++)
         {
            iXGridNo = this.stFG.m_iXGridNo + this.m_arrPos[i][0];
            iYGridNo = this.stFG.m_iYGridNo + this.m_arrPos[i][1];
            stCurFieldGrid = this.stFG.m_stCurrentBattbleFieldView.a_3438(iXGridNo,iYGridNo);
            if(null != stCurFieldGrid)
            {
               arrMoveIntruder = stCurFieldGrid.a_1511.slice();
               for each(stMoveIntruder in arrMoveIntruder)
               {
                  if(stMoveIntruder.iLifeValue > 0)
                  {
                     stMoveIntruder.a_4210();
                  }
               }
            }
         }
      }
      
      override public function a_3957(iCurrentTime:int) : void
      {
         if(iCurrentTime % 2 == 0)
         {
            super.a_3957(iCurrentTime);
         }
         if(iCurrentTime - a_1321 == a_1309 - 20 && 2 == a_1275)
         {
            a_1275 = 0;
            a_1307 = 1;
            gotoAndStop((a_1276[3] as FrameLabel).frame);
         }
      }
      
      override public function a_3954(iCurrentTime:int) : Boolean
      {
         var stNextField:a_3491 = null;
         var stNextNextField:a_3491 = null;
         var stBaseMoveIntruder:a_4206 = null;
         var stTempBaseMoveIntruder:a_4206 = null;
         if(m_iDieType == 1 && a_1339 <= 10)
         {
            this.a_3940();
            this.boomDie();
         }
         this.stFG = a_1334;
         if(iCurrentTime > m_iPlaceTimeIntervals + a_1308 && iCurrentTime > a_1321 + a_1309)
         {
            stNextField = a_1334.m_stCurrentBattbleFieldView.a_3438(a_1334.m_iXGridNo + 1,a_1334.m_iYGridNo);
            stNextNextField = a_1334.m_stCurrentBattbleFieldView.a_3438(a_1334.m_iXGridNo + 2,a_1334.m_iYGridNo);
            if(a_1334.a_1511.length > 1 || 1 == a_1334.a_1511.length && 0 == a_1334.a_1511[0].iSpaceState || null != stNextField && (stNextField.a_1511.length > 1 || 1 == stNextField.a_1511.length && 0 == stNextField.a_1511[0].iSpaceState))
            {
               a_1321 = iCurrentTime;
               a_1275 = 2;
               gotoAndStop((a_1276[1] as FrameLabel).frame);
            }
         }
         if(iCurrentTime - a_1321 == 10)
         {
            stNextField = a_1334.m_stCurrentBattbleFieldView.a_3438(a_1334.m_iXGridNo + 1,a_1334.m_iYGridNo);
            stNextNextField = a_1334.m_stCurrentBattbleFieldView.a_3438(a_1334.m_iXGridNo + 2,a_1334.m_iYGridNo);
            if(a_1334.a_1511.length > 1 || 1 == a_1334.a_1511.length && 0 == a_1334.a_1511[0].iSpaceState)
            {
               for each(stTempBaseMoveIntruder in a_1334.a_1511)
               {
                  if(Boolean(stTempBaseMoveIntruder) && 0 == stTempBaseMoveIntruder.iSpaceState)
                  {
                     stBaseMoveIntruder = stTempBaseMoveIntruder;
                     break;
                  }
               }
            }
            else if(null != stNextField && (stNextField.a_1511.length > 1 || 1 == stNextField.a_1511.length && 0 == stNextField.a_1511[0].iSpaceState))
            {
               for each(stTempBaseMoveIntruder in stNextField.a_1511)
               {
                  if(Boolean(stTempBaseMoveIntruder) && 0 == stTempBaseMoveIntruder.iSpaceState)
                  {
                     stBaseMoveIntruder = stTempBaseMoveIntruder;
                     break;
                  }
               }
            }
            if(null != stBaseMoveIntruder)
            {
               stBaseMoveIntruder.a_4211(this.m_iEatLifeValueEx.Value);
            }
            BattleFieldView.a_1034.play();
         }
         return true;
      }
      
      override protected function a_3965() : int
      {
         var iStarDegreeEffect:int = 0;
         switch(a_1094)
         {
            case 0:
               iStarDegreeEffect = 30;
               break;
            case 1:
               iStarDegreeEffect = 29;
               break;
            case 2:
               iStarDegreeEffect = 28;
               break;
            case 3:
               iStarDegreeEffect = 27;
               break;
            case 4:
               iStarDegreeEffect = 26;
               break;
            case 5:
               iStarDegreeEffect = 25;
               break;
            case 6:
               iStarDegreeEffect = 24;
               break;
            case 7:
               iStarDegreeEffect = 23;
               break;
            case 8:
               iStarDegreeEffect = 22;
               break;
            case 9:
               iStarDegreeEffect = 20;
               break;
            case 10:
               iStarDegreeEffect = 18;
               break;
            case 11:
               iStarDegreeEffect = 14;
               break;
            case 12:
               iStarDegreeEffect = 10;
               break;
            case 13:
               iStarDegreeEffect = 6;
               break;
            case 14:
               iStarDegreeEffect = 4;
               break;
            case 15:
               iStarDegreeEffect = 5;
               break;
            case 16:
               iStarDegreeEffect = 2;
         }
         return 20 * iStarDegreeEffect;
      }
   }
}

