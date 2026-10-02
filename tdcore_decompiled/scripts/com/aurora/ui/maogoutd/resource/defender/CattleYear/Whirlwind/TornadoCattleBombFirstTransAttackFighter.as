package com.aurora.ui.maogoutd.resource.defender.CattleYear.Whirlwind
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.Util.BattleDestroyUtil;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.defender.a_3960;
   
   public class TornadoCattleBombFirstTransAttackFighter extends a_3960
   {
      
      private var m_MouseArr:Array = new Array(8388616,8388722,8388759,8388628,8388656,8388760,8389317,8389022);
      
      public function TornadoCattleBombFirstTransAttackFighter()
      {
         super();
         a_1095 = TornadoCattleBombDefine.FIRSTTRANS_DEFENSE_PRICE;
         a_1330 = 0;
         a_1333 = true;
         a_1279 = 10;
      }
      
      public static function a_3926() : a_3960
      {
         return PoolManager.getInstance().CheckOutOne(TornadoCattleBombFirstTransAttackFighter,TornadoCattleBombFirstTransAttackFighterMovie) as TornadoCattleBombFirstTransAttackFighter;
      }
      
      override public function a_3940() : Boolean
      {
         if(m_bServerIssued && Boolean(stFieldGrid))
         {
            stFieldGrid.tagCom.RemoveTag(20022);
         }
         super.a_3940();
         return true;
      }
      
      override public function a_1797(stFieldGrid:a_3491) : Boolean
      {
         super.a_1797(stFieldGrid);
         if(m_bServerIssued && Boolean(stFieldGrid))
         {
            stFieldGrid.tagCom.AddTag(20022);
         }
         a_1339 = TornadoCattleBombDefine.MAX_LIFE_VALUE;
         return true;
      }
      
      override protected function a_3964() : int
      {
         return TornadoCattleBombDefine.a_3964(a_1094);
      }
      
      override public function a_3961(iCurrentTime:int) : Boolean
      {
         var arrBaseMoveIntruderVector:Array = null;
         var stBaseMoveIntruder:a_4206 = null;
         var xStart:int = 0;
         var xEnd:int = 0;
         var yStart:int = 0;
         var yEnd:int = 0;
         var stFieldGridVector:Array = null;
         var yIndex:int = 0;
         var xIndex:int = 0;
         var stFieldGridi:a_3491 = null;
         super.a_3961(iCurrentTime);
         if(a_1329 == iCurrentTime && a_1273 == a_1274 - 6)
         {
            BattleFieldView.a_1048.play();
            a_1334.m_stCurrentBattbleFieldView.a_3466();
            arrBaseMoveIntruderVector = a_1334.m_stCurrentBattbleFieldView.m_arrBaseMoveIntruderVector.slice();
            for each(stBaseMoveIntruder in arrBaseMoveIntruderVector)
            {
               if(3 == stBaseMoveIntruder.iSpaceState && this.m_MouseArr.indexOf(stBaseMoveIntruder.m_stMoveIntruderTypeID) != -1)
               {
                  stBaseMoveIntruder.a_4212();
               }
            }
            xStart = 0;
            xEnd = BattleFieldView.a_1011 - 1;
            yStart = 0;
            yEnd = BattleFieldView.a_1012 - 1;
            stFieldGridVector = a_1334.m_stCurrentBattbleFieldView.stFieldGridsVector;
            for(yIndex = yStart; yIndex <= yEnd; yIndex++)
            {
               for(xIndex = xStart; xIndex <= xEnd; xIndex++)
               {
                  stFieldGridi = stFieldGrid.m_stCurrentBattbleFieldView.stFieldGridsVector[yIndex][xIndex];
                  BattleDestroyUtil.ClearMouseHole(stFieldGridi,true,true);
               }
            }
         }
         if(a_1273 == a_1274)
         {
            super.a_3969(a_1339);
         }
         return true;
      }
   }
}

