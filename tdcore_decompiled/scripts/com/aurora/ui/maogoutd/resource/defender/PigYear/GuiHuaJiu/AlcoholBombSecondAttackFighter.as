package com.aurora.ui.maogoutd.resource.defender.PigYear.GuiHuaJiu
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.defender.a_3953;
   import com.aurora.ui.maogoutd.resource.shot.a_4348;
   import flash.display.FrameLabel;
   
   public class AlcoholBombSecondAttackFighter extends a_3953
   {
      
      private static const CROSS_OFFSET:Array = [[0,0],[-1,0],[1,0],[0,-1],[0,1]];
      
      private var m_isMouseBiteDeathTriggered:Boolean;
      
      private var m_isShotSpawned:Boolean;
      
      public function AlcoholBombSecondAttackFighter()
      {
         super();
         a_1095 = AlcoholBombDefine.DEFENSE_PRICE;
         a_1308 = 0;
         a_1333 = true;
         a_1313 = true;
      }
      
      public static function a_3926() : a_3953
      {
         return PoolManager.getInstance().CheckOutOne(AlcoholBombSecondAttackFighter) as AlcoholBombSecondAttackFighter;
      }
      
      override protected function getBindMovie() : Class
      {
         return AlcoholBombSecondAttackFighterMovie;
      }
      
      override public function a_1797(stFieldGrid:a_3491) : Boolean
      {
         super.a_1797(stFieldGrid);
         if(m_bServerIssued)
         {
            a_1311 = 100;
            a_1339 = AlcoholBombDefine.a_3965(a_1094);
            canReceiveAttackBuff = false;
            this.m_isMouseBiteDeathTriggered = this.m_isShotSpawned = false;
         }
         return true;
      }
      
      override protected function a_3964() : int
      {
         return AlcoholBombDefine.a_3964(m_iSkillDegree);
      }
      
      override public function a_3969(iRduceLifeValue:int) : Boolean
      {
         if(m_iDieType == 1 && a_1339 - iRduceLifeValue <= 0)
         {
            this.m_isMouseBiteDeathTriggered = true;
            if(a_1275 != 1)
            {
               a_1275 = 1;
               gotoAndStop((a_1276[a_1275] as FrameLabel).frame);
            }
            return true;
         }
         return super.a_3969(iRduceLifeValue);
      }
      
      override public function a_3940() : Boolean
      {
         if(Boolean(this.m_isMouseBiteDeathTriggered) && Boolean(a_1334) && !this.m_isShotSpawned)
         {
            this.RealeaseCrossAlcoholShot();
         }
         super.a_3940();
         return true;
      }
      
      override public function a_3954(iCurrentTime:int) : Boolean
      {
         if((iCurrentTime & 1) != 0)
         {
            return false;
         }
         if(a_1273 == a_1274 - 9)
         {
            BattleFieldView.a_1048.play();
            a_1334.m_stCurrentBattbleFieldView.a_3466();
            this.CrossRangeBoom(a_1334);
         }
         if(a_1273 == a_1274 - 1)
         {
            this.RealeaseCrossAlcoholShot();
            super.a_3969(a_1339);
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
      
      private function RealeaseCrossAlcoholShot() : void
      {
         var iXGridNo:int = 0;
         var iYGridNo:int = 0;
         var stTargetFieldGrid:a_3491 = null;
         var arrOffset:Array = null;
         if(this.m_isShotSpawned)
         {
            return;
         }
         if(!a_1334 || !a_1334.m_stCurrentBattbleFieldView)
         {
            return;
         }
         this.m_isShotSpawned = true;
         for each(arrOffset in CROSS_OFFSET)
         {
            iXGridNo = a_1334.m_iXGridNo + arrOffset[0];
            iYGridNo = a_1334.m_iYGridNo + arrOffset[1];
            if(!(iXGridNo < 0 || iXGridNo >= BattleFieldView.a_1011 || iYGridNo < 0 || iYGridNo >= BattleFieldView.a_1012))
            {
               stTargetFieldGrid = a_1334.m_stCurrentBattbleFieldView.a_3438(iXGridNo,iYGridNo);
               this.RealeaseAlcoholShot(stTargetFieldGrid);
            }
         }
      }
      
      protected function RealeaseAlcoholShot(stFieldGrid:a_3491) : void
      {
         if(!stFieldGrid)
         {
            return;
         }
         var stAlcoholShot:a_4348 = AlcoholSecondShot.a_4344();
         stAlcoholShot.iShotSequenceNum = 0;
         var iPosX:int = stFieldGrid.m_iXGridNo * a_3491.a_1080 - 25;
         var iPosY:int = stFieldGrid.m_iYGridNo * a_3491.a_1081 - 5;
         stAlcoholShot.a_1797(0,0,a_1311,iPosX,iPosY,stFieldGrid.m_stCurrentBattbleFieldView,stFieldGrid);
         stFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(stAlcoholShot,BattleLayerDefine.EFFECTS_BASE_TYPE,stFieldGrid);
      }
      
      private function CrossRangeBoom(stFieldGrid:a_3491) : void
      {
         var iXGridNo:int = 0;
         var iYGridNo:int = 0;
         var stCurFieldGrid:a_3491 = null;
         var arrOffset:Array = null;
         if(stFieldGrid == null)
         {
            return;
         }
         for each(arrOffset in CROSS_OFFSET)
         {
            iXGridNo = stFieldGrid.m_iXGridNo + arrOffset[0];
            iYGridNo = stFieldGrid.m_iYGridNo + arrOffset[1];
            if(!(iXGridNo < 0 || iXGridNo >= BattleFieldView.a_1011 || iYGridNo < 0 || iYGridNo >= BattleFieldView.a_1012))
            {
               stCurFieldGrid = stFieldGrid.m_stCurrentBattbleFieldView.a_3438(iXGridNo,iYGridNo);
               this.BoomDamage(stCurFieldGrid);
            }
         }
      }
      
      private function BoomDamage(stFieldGrid:a_3491) : void
      {
         var stMoveIntruder:a_4206 = null;
         if(stFieldGrid == null)
         {
            return;
         }
         var arrMoveIntruder:Array = stFieldGrid.IntruderArray;
         for each(stMoveIntruder in arrMoveIntruder)
         {
            if(!(!stMoveIntruder || stMoveIntruder.iLifeValue <= 0 || !stMoveIntruder.m_stCurrentFieldGrid))
            {
               stMoveIntruder.a_4210();
               if(Boolean(stMoveIntruder) && stMoveIntruder.iLifeValue > 0)
               {
                  GuiHuaJiuBuff.AddDrunkBuff(stMoveIntruder,stMoveIntruder.m_stCurrentFieldGrid);
               }
            }
         }
      }
   }
}

