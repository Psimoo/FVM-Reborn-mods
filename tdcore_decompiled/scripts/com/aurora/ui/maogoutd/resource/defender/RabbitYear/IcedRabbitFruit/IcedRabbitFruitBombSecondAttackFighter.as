package com.aurora.ui.maogoutd.resource.defender.RabbitYear.IcedRabbitFruit
{
   import a_4718.b_182;
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.defender.a_3960;
   import com.aurora.ui.maogoutd.resource.effect.a_4126;
   
   public class IcedRabbitFruitBombSecondAttackFighter extends a_3960
   {
      
      public function IcedRabbitFruitBombSecondAttackFighter()
      {
         super();
         a_1095 = IcedRabbitFruitBombDefine.DEFENSE_PRICE;
         a_1330 = 0;
         a_1333 = true;
      }
      
      public static function a_3926() : a_3960
      {
         return PoolManager.getInstance().CheckOutOne(IcedRabbitFruitBombSecondAttackFighter) as IcedRabbitFruitBombSecondAttackFighter;
      }
      
      override protected function getBindMovie() : Class
      {
         return IcedRabbitFruitBombSecondAttackFighterMovie;
      }
      
      override public function a_1797(stFieldGrid:a_3491) : Boolean
      {
         super.a_1797(stFieldGrid);
         a_1339 = IcedRabbitFruitBombDefine.MAX_LIFE_VALUE;
         return true;
      }
      
      override protected function a_3964() : int
      {
         return IcedRabbitFruitBombDefine.a_3964(a_1094);
      }
      
      override public function a_3961(iCurrentTime:int) : Boolean
      {
         var stFieldGridVector:Array = null;
         var yStart:int = 0;
         var xStart:int = 0;
         var yEnd:int = 0;
         var xEnd:int = 0;
         var y:int = 0;
         var x:int = 0;
         var arrMoveIntruder:Array = null;
         var stMoveIntruder:a_4206 = null;
         var stIceFreezeUpEffect:a_4126 = null;
         super.a_3961(iCurrentTime);
         if(a_1329 == iCurrentTime && a_1273 == a_1274 - 9)
         {
            this.TatalRangeBoom(stFieldGrid,1);
            BattleFieldView.a_1050.play();
            stFieldGridVector = a_1334.m_stCurrentBattbleFieldView.stFieldGridsVector;
            yStart = 0;
            xStart = 0;
            yEnd = BattleFieldView.a_1012 - 1;
            xEnd = BattleFieldView.a_1011 - 1;
            for(y = yStart; y <= yEnd; y++)
            {
               for(x = xStart; x <= xEnd; x++)
               {
                  arrMoveIntruder = stFieldGridVector[y][x].a_1511.slice();
                  for each(stMoveIntruder in arrMoveIntruder)
                  {
                     if(stMoveIntruder.visible)
                     {
                        stIceFreezeUpEffect = a_4126.a_3926();
                     }
                     stMoveIntruder.a_4208(b_182.a_434,40,stIceFreezeUpEffect);
                     stMoveIntruder.a_4208(b_182.a_433,200);
                  }
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
      
      private function TatalRangeBoom(stFieldGrid:a_3491, range:int) : void
      {
         var xIndex:int = 0;
         var stTargetFieldGrid:a_3491 = null;
         var arrMoveIntruder:Array = null;
         var stMoveIntruder:a_4206 = null;
         if(stFieldGrid == null)
         {
            return;
         }
         var xStart:int = Math.max(stFieldGrid.m_iXGridNo - range,0);
         var xEnd:int = Math.min(stFieldGrid.m_iXGridNo + range,BattleFieldView.a_1011 - 1);
         var yStart:int = Math.max(stFieldGrid.m_iYGridNo - range,0);
         var yEnd:int = Math.min(stFieldGrid.m_iYGridNo + range,BattleFieldView.a_1012 - 1);
         for(var yIndex:int = yStart; yIndex <= yEnd; yIndex++)
         {
            for(xIndex = xStart; xIndex <= xEnd; xIndex++)
            {
               stTargetFieldGrid = stFieldGrid.m_stCurrentBattbleFieldView.a_3438(xIndex,yIndex);
               if(stTargetFieldGrid)
               {
                  arrMoveIntruder = stTargetFieldGrid.IntruderArray;
                  for each(stMoveIntruder in arrMoveIntruder)
                  {
                     if(stMoveIntruder.iLifeValue > 0)
                     {
                        stMoveIntruder.a_4210();
                        if(stMoveIntruder.iLifeValue <= 0 && !stMoveIntruder.IsBossIntruder)
                        {
                           this.CreateSmallMouse(stTargetFieldGrid);
                        }
                     }
                  }
               }
            }
         }
      }
      
      private function CreateSmallMouse(gride:a_3491) : void
      {
         var smalIceMouse:SmalIceMouseEffect = null;
         if(Boolean(gride) && Boolean(!gride.tagCom.HasTag(20001)) && SmalIceMouseEffect.MaxmouseCount < 8)
         {
            smalIceMouse = SmalIceMouseEffect.a_3926();
            smalIceMouse.stOriginalFieldGrid = gride;
            smalIceMouse.WaitTime = 25;
            smalIceMouse.a_1797(a_1283);
            smalIceMouse.x = a_3491.a_1080 * (gride.m_iXGridNo + 0.5);
            smalIceMouse.y = a_3491.a_1081 * (gride.m_iYGridNo + 0.5);
            gride.m_stCurrentBattbleFieldView.AddToBattleView(smalIceMouse,BattleLayerDefine.OBSTACL_TYPE,gride);
         }
      }
   }
}

