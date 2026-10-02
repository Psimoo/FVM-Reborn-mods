package com.aurora.ui.maogoutd.resource.defender.TigerYear.AcidLemonBomb
{
   import a_4718.b_182;
   import a_4754.a_2161;
   import com.adobe.utils.RandomSeed;
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.Util.BattleDestroyUtil;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.defender.a_3960;
   
   public class AcidLemonBombFirstAttackFighter extends a_3960
   {
      
      private var m_MouseEarthHoleNum:int;
      
      public var m_stRandomSeed:RandomSeed = new RandomSeed();
      
      private var m_arrPos:Array = [[-3,-2],[-3,-1],[-3,0],[-3,1],[-3,2],[-2,2],[-1,2],[0,2],[1,2],[2,2],[3,2],[3,1],[3,0],[3,-1],[3,-2],[2,-2],[1,-2],[0,-2],[-1,-2],[-2,-2],[-2,-1],[-2,0],[-2,1],[-1,1],[0,1],[1,1],[2,1],[2,0],[2,-1],[1,-1],[0,-1],[-1,-1],[0,0]];
      
      public function AcidLemonBombFirstAttackFighter()
      {
         super();
         a_1095 = AcidLemonBombDefine.DEFENSE_PRICE;
         a_1330 = 0;
         a_1333 = true;
      }
      
      public static function a_3926() : a_3960
      {
         return PoolManager.getInstance().CheckOutOne(AcidLemonBombFirstAttackFighter) as AcidLemonBombFirstAttackFighter;
      }
      
      override protected function getBindMovie() : Class
      {
         return AcidLemonBombFirstAttackFighterMovie;
      }
      
      override public function a_1797(stFieldGrid:a_3491) : Boolean
      {
         var enterRoom:Object = null;
         super.a_1797(stFieldGrid);
         a_1339 = AcidLemonBombDefine.MAX_LIFE_VALUE;
         this.m_MouseEarthHoleNum = 0;
         if(m_bServerIssued)
         {
            enterRoom = a_2161.e.getEnterRoom();
            this.m_stRandomSeed.setSeed(enterRoom.m_RandomSeed,1000 + s_GlobalInitCount);
         }
         return true;
      }
      
      override protected function a_3964() : int
      {
         return AcidLemonBombDefine.a_3964(a_1094);
      }
      
      override public function a_3961(iCurrentTime:int) : Boolean
      {
         var stStartFieldGrid:a_3491 = null;
         super.a_3961(iCurrentTime);
         if(a_1329 == iCurrentTime && a_1273 == 9)
         {
            stStartFieldGrid = a_1334.m_stCurrentBattbleFieldView.a_3438(a_1334.m_iXGridNo,0);
            stStartFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(this,BattleLayerDefine.OBSTACL_TYPE,stStartFieldGrid);
            if(a_1336 != null)
            {
               a_1336.visible = false;
            }
            this.ClearMouseEarthHole();
            this.a_4360();
         }
         if(a_1273 == a_1274)
         {
            super.a_3969(a_1339);
            a_3940();
         }
         return true;
      }
      
      private function ClearMouseEarthHole() : void
      {
         var iXGridNo:int = 0;
         var iYGridNo:int = 0;
         var stCurFieldGrid:a_3491 = null;
         if(stFieldGrid == null)
         {
            return;
         }
         BattleFieldView.a_1048.play();
         stFieldGrid.m_stCurrentBattbleFieldView.a_3466();
         this.m_MouseEarthHoleNum = 0;
         var iLen:int = int(this.m_arrPos.length);
         for(var i:int = 0; i < iLen; i++)
         {
            if(this.m_MouseEarthHoleNum < 3)
            {
               iXGridNo = stFieldGrid.m_iXGridNo + this.m_arrPos[i][1];
               iYGridNo = stFieldGrid.m_iYGridNo + this.m_arrPos[i][0];
               stCurFieldGrid = a_1334.m_stCurrentBattbleFieldView.a_3438(iXGridNo,iYGridNo);
               if(BattleDestroyUtil.ClearMouseHole(stCurFieldGrid))
               {
                  ++this.m_MouseEarthHoleNum;
               }
            }
         }
      }
      
      private function a_4360() : void
      {
         var xIndex:int = 0;
         var arrMoveIntruder:Array = null;
         var stMoveIntruder:a_4206 = null;
         var randomNum:int = 0;
         var xStart:int = Math.max(a_1334.m_iXGridNo - 2,0);
         var xEnd:int = Math.min(a_1334.m_iXGridNo + 2,BattleFieldView.a_1011 - 1);
         var yStart:int = Math.max(a_1334.m_iYGridNo - 3,0);
         var yEnd:int = Math.min(a_1334.m_iYGridNo + 3,BattleFieldView.a_1012 - 1);
         var stFieldGridVector:Array = a_1334.m_stCurrentBattbleFieldView.stFieldGridsVector;
         for(var yIndex:int = yStart; yIndex <= yEnd; yIndex++)
         {
            for(xIndex = xStart; xIndex <= xEnd; xIndex++)
            {
               arrMoveIntruder = stFieldGridVector[yIndex][xIndex].a_1511.slice();
               for each(stMoveIntruder in arrMoveIntruder)
               {
                  randomNum = this.m_stRandomSeed.nextInt(100) + 1;
                  if(randomNum <= 30)
                  {
                     stMoveIntruder.a_4208(b_182.a_435,25);
                  }
               }
            }
         }
      }
   }
}

