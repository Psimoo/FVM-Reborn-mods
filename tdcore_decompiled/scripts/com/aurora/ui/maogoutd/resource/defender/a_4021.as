package com.aurora.ui.maogoutd.resource.defender
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.Util.BattleDestroyUtil;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import flash.display.FrameLabel;
   import flash.utils.setTimeout;
   
   public class a_4021 extends a_3953
   {
      
      private var a_1368:int;
      
      protected var m_iBlowAwayTime:int = 25;
      
      protected var m_iTimeoutIntval:int = -1;
      
      public function a_4021()
      {
         a_1271 = true;
         super();
         a_1095 = 100;
      }
      
      public static function a_3926() : a_4021
      {
         return PoolManager.getInstance().CheckOutOne(a_4021) as a_4021;
      }
      
      override protected function getBindMovie() : Class
      {
         return ExhaustFanToolDefenseMovie;
      }
      
      override public function a_1797(stFieldGrid:a_3491) : Boolean
      {
         this.a_1368 = 0;
         this.m_iBlowAwayTime = 25 + this.a_3965();
         this.visible = true;
         gotoAndStop(1);
         a_1095 = 100;
         this.m_iTimeoutIntval = -1;
         if(m_bServerIssued && Boolean(stFieldGrid))
         {
            stFieldGrid.tagCom.AddTag(20022);
         }
         return super.a_1797(stFieldGrid);
      }
      
      override public function a_3954(iCurrentTime:int) : Boolean
      {
         return true;
      }
      
      override public function a_3957(iCurrentTime:int) : void
      {
         if(iCurrentTime % 2 == 0)
         {
            this.a_4003(iCurrentTime);
         }
      }
      
      override public function a_3969(iRduceLifeValue:int) : Boolean
      {
         var arrBaseMoveIntruderVector:Array = null;
         var stBaseMoveIntruder:a_4206 = null;
         if(Boolean(a_1334) && this.m_iTimeoutIntval < 0)
         {
            a_1334.m_stCurrentBattbleFieldView.m_stLargeFogEffect.a_4130();
            arrBaseMoveIntruderVector = a_1334.m_stCurrentBattbleFieldView.m_arrBaseMoveIntruderVector.slice();
            for each(stBaseMoveIntruder in arrBaseMoveIntruderVector)
            {
               if(3 == stBaseMoveIntruder.iSpaceState)
               {
                  stBaseMoveIntruder.a_4214();
               }
            }
            BattleDestroyUtil.UseFanTool(a_1334);
            this.m_iTimeoutIntval = setTimeout(a_1334.m_stCurrentBattbleFieldView.a_3462,this.m_iBlowAwayTime * 1000);
            m_iDieType = 5;
            this.a_3969(a_1339);
            m_iDieType = 0;
         }
         return super.a_3969(iRduceLifeValue);
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
      
      private function a_4003(iCurrentTime:int) : void
      {
         var arrBaseMoveIntruderVector:Array = null;
         var stBaseMoveIntruder:a_4206 = null;
         nextFrame();
         if(this.a_1368 % 30 == 0)
         {
            BattleFieldView.a_1040.play();
         }
         if(a_1278 != null || a_1273 == a_1274)
         {
            gotoAndStop((a_1276[a_1275] as FrameLabel).frame);
         }
         ++this.a_1368;
         if(this.a_1368 > 25)
         {
            a_1334.m_stCurrentBattbleFieldView.m_stLargeFogEffect.a_4130();
            arrBaseMoveIntruderVector = a_1334.m_stCurrentBattbleFieldView.m_arrBaseMoveIntruderVector.slice();
            for each(stBaseMoveIntruder in arrBaseMoveIntruderVector)
            {
               if(3 == stBaseMoveIntruder.iSpaceState)
               {
                  stBaseMoveIntruder.a_4214();
               }
            }
            BattleDestroyUtil.UseFanTool(a_1334);
            this.m_iTimeoutIntval = setTimeout(a_1334.m_stCurrentBattbleFieldView.a_3462,this.m_iBlowAwayTime * 1000);
            m_iDieType = 5;
            this.a_3969(a_1339);
            m_iDieType = 0;
         }
      }
      
      override protected function a_3965() : int
      {
         var iStarDegreeEffect:int = 0;
         if(a_1094 <= 3)
         {
            iStarDegreeEffect = 2 * a_1094;
         }
         else if(a_1094 > 3 && a_1094 <= 6)
         {
            iStarDegreeEffect = 2 * 3 + 3 * (a_1094 - 3);
         }
         else if(a_1094 > 6 && a_1094 <= 9)
         {
            iStarDegreeEffect = 2 * 3 + 3 * (6 - 3) + 4 * (a_1094 - 6);
         }
         else if(a_1094 > 9)
         {
            iStarDegreeEffect = 2 * 3 + 3 * (6 - 3) + 4 * (9 - 6) + 5 * (a_1094 - 9);
         }
         return 10 * iStarDegreeEffect;
      }
   }
}

