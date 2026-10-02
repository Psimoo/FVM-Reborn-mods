package com.aurora.ui.maogoutd.resource.defender.Pandora
{
   import a_4718.b_183;
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.defender.a_3960;
   import com.aurora.ui.maogoutd.resource.shot.a_4348;
   import com.aurora.ui.maogoutd.resource.shot.a_4388;
   
   public class PandoraBombSecondTransAttackFighter extends a_3960
   {
      
      public function PandoraBombSecondTransAttackFighter()
      {
         super();
         a_1095 = PandoraBombDefine.SECONDTRANS_DEFENSE_PRICE;
         a_1330 = 0;
         a_1333 = true;
         a_1279 = 0;
      }
      
      public static function a_3926() : a_3960
      {
         return PoolManager.getInstance().CheckOutOne(PandoraBombSecondTransAttackFighter) as PandoraBombSecondTransAttackFighter;
      }
      
      override protected function getBindMovie() : Class
      {
         return PandoraBombSecondTransAttackFighterMovie;
      }
      
      override public function a_1797(stFieldGrid:a_3491) : Boolean
      {
         super.a_1797(stFieldGrid);
         a_1339 = PandoraBombDefine.MAX_LIFE_VALUE;
         return true;
      }
      
      override protected function a_3964() : int
      {
         return PandoraBombDefine.a_3964(a_1094);
      }
      
      override public function a_3961(iCurrentTime:int) : Boolean
      {
         var xStart:int = 0;
         var xEnd:int = 0;
         var yStart:int = 0;
         var yEnd:int = 0;
         var xEffectStart:int = 0;
         var stFieldGridVector:Array = null;
         var yIndex:int = 0;
         var xIndex:int = 0;
         var stFieldGrid:a_3491 = null;
         var arrMoveIntruder:Array = null;
         var stMoveIntruder:a_4206 = null;
         super.a_3961(iCurrentTime);
         if(a_1329 == iCurrentTime && a_1273 == a_1274 - 6)
         {
            BattleFieldView.a_1048.play();
            a_1334.m_stCurrentBattbleFieldView.a_3466();
            xStart = Math.max(a_1334.m_iXGridNo - 2,0);
            xEnd = Math.min(a_1334.m_iXGridNo + 1,BattleFieldView.a_1011 - 1);
            yStart = Math.max(a_1334.m_iYGridNo - 1,0);
            yEnd = Math.min(a_1334.m_iYGridNo + 1,BattleFieldView.a_1012 - 1);
            xEffectStart = Math.max(a_1334.m_iXGridNo - 1,0);
            stFieldGridVector = a_1334.m_stCurrentBattbleFieldView.stFieldGridsVector;
            for(yIndex = yStart; yIndex <= yEnd; yIndex++)
            {
               for(xIndex = xStart; xIndex <= xEnd; xIndex++)
               {
                  stFieldGrid = a_1334.m_stCurrentBattbleFieldView.a_3438(xIndex,yIndex);
                  arrMoveIntruder = stFieldGrid.a_1511.slice();
                  for each(stMoveIntruder in arrMoveIntruder)
                  {
                     stMoveIntruder.a_4210();
                  }
               }
            }
            for(xIndex = 0; xIndex < BattleFieldView.a_1011; xIndex++)
            {
               stFieldGrid = a_1334.m_stCurrentBattbleFieldView.a_3438(xIndex,a_1334.m_iYGridNo);
               this.RealeasePoisonShot(stFieldGrid);
            }
            for(yIndex = 0; yIndex < BattleFieldView.a_1012; yIndex++)
            {
               if(yIndex != a_1334.m_iYGridNo)
               {
                  stFieldGrid = a_1334.m_stCurrentBattbleFieldView.a_3438(a_1334.m_iXGridNo,yIndex);
                  this.RealeasePoisonShot(stFieldGrid);
               }
            }
         }
         if(a_1273 == a_1274)
         {
            super.a_3969(a_1339);
            a_3940();
         }
         return true;
      }
      
      private function RealeasePoisonShot(stFieldGrid:a_3491) : void
      {
         var stPoisonShot:a_4348 = a_4388.getInstance().a_4389(b_183.enm_Poison);
         stPoisonShot.iShotSequenceNum = 0;
         var iPosX:int = (stFieldGrid.m_iXGridNo + 0.5) * a_3491.a_1080;
         var iPosY:int = stFieldGrid.m_iYGridNo * a_3491.a_1081 - 5;
         stPoisonShot.a_1797(0,0,900 * 1.35,iPosX,iPosY,stFieldGrid.m_stCurrentBattbleFieldView,stFieldGrid);
         stFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(stPoisonShot,BattleLayerDefine.EFFECT_LAYER_TRAY_BOTTOM_TYPE,stFieldGrid);
      }
   }
}

