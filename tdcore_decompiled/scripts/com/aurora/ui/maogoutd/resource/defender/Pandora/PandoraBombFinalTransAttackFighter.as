package com.aurora.ui.maogoutd.resource.defender.Pandora
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.Buff.BattleBuffData;
   import com.aurora.ui.maogoutd.game.Buff.BattleBuffParams;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.defender.a_3960;
   
   public class PandoraBombFinalTransAttackFighter extends a_3960
   {
      
      internal static const BOOM_HURT_VALUE:int = 1215;
      
      public function PandoraBombFinalTransAttackFighter()
      {
         super();
         a_1095 = PandoraBombDefine.SECONDTRANS_DEFENSE_PRICE;
         a_1330 = 0;
      }
      
      public static function a_3926() : a_3960
      {
         return PoolManager.getInstance().CheckOutOne(PandoraBombFinalTransAttackFighter) as PandoraBombFinalTransAttackFighter;
      }
      
      override protected function getBindMovie() : Class
      {
         return PandoraBombFinalTransAttackFighterMovie;
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
         super.a_3961(iCurrentTime);
         if(a_1329 == iCurrentTime && a_1273 == a_1274 - 6)
         {
            BattleFieldView.a_1048.play();
            a_1334.m_stCurrentBattbleFieldView.a_3466();
            this.DoFullScreenBoom();
         }
         if(a_1273 == a_1274)
         {
            super.a_3969(a_1339);
            a_3940();
         }
         return true;
      }
      
      private function DoFullScreenBoom() : void
      {
         var xIndex:int = 0;
         var stFieldGrid:a_3491 = null;
         var arrMoveIntruder:Array = null;
         var stMoveIntruder:a_4206 = null;
         var buffParams:BattleBuffParams = null;
         var buffData:BattleBuffData = null;
         var bf:BattleFieldView = a_1334.m_stCurrentBattbleFieldView;
         for(var yIndex:int = 0; yIndex < BattleFieldView.a_1012; yIndex++)
         {
            for(xIndex = 0; xIndex < BattleFieldView.a_1011; xIndex++)
            {
               stFieldGrid = bf.a_3438(xIndex,yIndex);
               if(stFieldGrid)
               {
                  arrMoveIntruder = stFieldGrid.IntruderArray;
                  for each(stMoveIntruder in arrMoveIntruder)
                  {
                     if(!(!stMoveIntruder || stMoveIntruder.iLifeValue <= 0 || !stMoveIntruder.visible))
                     {
                        stMoveIntruder.a_4210();
                        if(stMoveIntruder.iLifeValue > 0)
                        {
                           stMoveIntruder.PowerfulBombReduceLifeRate(7100 / 900);
                        }
                        if(stMoveIntruder.iLifeValue > 0 && Boolean(stMoveIntruder.parent))
                        {
                           buffParams = new BattleBuffParams();
                           buffParams.gameMoveClipClass = PandoraBombHeadBuffEffectMovie;
                           buffParams.effectClass = PandoraBombHeadBuffEffect;
                           buffParams.x = 0;
                           buffParams.y = 0;
                           buffParams.offsetType = 4;
                           buffData = stMoveIntruder.buffCom.AddBuff(40006,60,buffParams);
                           if(buffData != null && buffData.stEffect != null)
                           {
                              (buffData.stEffect as PandoraBombHeadBuffEffect).InitData(stMoveIntruder,BOOM_HURT_VALUE);
                              stFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(buffData.stEffect,BattleLayerDefine.EFFECTS_TOP_TYPE,stFieldGrid);
                           }
                        }
                     }
                  }
               }
            }
         }
      }
   }
}

