package com.aurora.ui.maogoutd.resource.defender.CattleYear.Whirlwind
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.Util.BattleDestroyUtil;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.defender.a_3976;
   import flash.events.Event;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   
   public class TornadoCattleBombSecondTransAttackFighter extends a_3976
   {
      
      private var m_stTiemr:Timer;
      
      private var m_MouseArr:Array = new Array(8388616,8388722,8388759,8388628,8388656,8388760,8389317,8389022);
      
      public function TornadoCattleBombSecondTransAttackFighter()
      {
         a_1271 = true;
         super();
         a_1338 = 0;
         a_1279 = 0;
         a_1095 = TornadoCattleBombDefine.DEFENSE_PRICE;
         this.m_stTiemr = new Timer(100);
      }
      
      public static function a_3926() : TornadoCattleBombSecondTransAttackFighter
      {
         return PoolManager.getInstance().CheckOutOne(TornadoCattleBombSecondTransAttackFighter,TornadoCattleBombSecondTransAttackFighterMovie) as TornadoCattleBombSecondTransAttackFighter;
      }
      
      override public function a_1797(stFieldGrid:a_3491) : Boolean
      {
         this.m_stTiemr.addEventListener(TimerEvent.TIMER,this.a_4003);
         this.visible = true;
         gotoAndStop(1);
         this.play();
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
      
      override public function a_3940() : Boolean
      {
         if(m_bServerIssued && Boolean(stFieldGrid))
         {
            stFieldGrid.tagCom.RemoveTag(20022);
         }
         super.a_3940();
         this.m_stTiemr.removeEventListener(TimerEvent.TIMER,this.a_4003);
         this.m_stTiemr.stop();
         return true;
      }
      
      public function play() : void
      {
         this.m_stTiemr.start();
      }
      
      public function stop() : void
      {
         this.m_stTiemr.stop();
      }
      
      private function a_4003(a_4730:Event) : void
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
         nextFrame();
         if(a_1273 == a_1274 - 6)
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
      }
   }
}

