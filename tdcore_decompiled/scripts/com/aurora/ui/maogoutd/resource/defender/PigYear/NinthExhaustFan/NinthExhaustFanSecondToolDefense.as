package com.aurora.ui.maogoutd.resource.defender.PigYear.NinthExhaustFan
{
   import a_4781.TimeoutManager;
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.Util.BattleDestroyUtil;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.defender.a_3953;
   import com.aurora.ui.maogoutd.resource.shot.a_4348;
   import flash.display.FrameLabel;
   
   public class NinthExhaustFanSecondToolDefense extends a_3953
   {
      
      private var a_1368:int;
      
      protected var m_iBlowAwayTime:int = 25;
      
      protected var m_iTimeoutIntval:int = -1;
      
      private var m_iCurrentTime:int;
      
      public function NinthExhaustFanSecondToolDefense()
      {
         super();
         a_1313 = true;
         a_1095 = NinthExhaustFanDefense.DEFENSE_PRICE;
         a_1317 = 3;
         a_1310 = 1;
      }
      
      public static function a_3926() : NinthExhaustFanSecondToolDefense
      {
         return PoolManager.getInstance().CheckOutOne(NinthExhaustFanSecondToolDefense) as NinthExhaustFanSecondToolDefense;
      }
      
      override protected function getBindMovie() : Class
      {
         return NinthExhaustFanSecondToolDefenseMovie;
      }
      
      override public function a_1797(stFieldGrid:a_3491) : Boolean
      {
         this.a_1368 = 0;
         this.m_iBlowAwayTime = NinthExhaustFanDefense.a_3965(a_1094);
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
         if(Boolean(a_1334) && this.m_iTimeoutIntval < 0)
         {
            this.HandleFanDieEffect();
         }
         else
         {
            super.a_3969(iRduceLifeValue);
         }
         return true;
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
         this.m_iCurrentTime = iCurrentTime;
         if(this.a_1368 > 25)
         {
            this.HandleFanDieEffect();
         }
      }
      
      private function HandleFanDieEffect() : void
      {
         var stBaseMoveIntruder:a_4206 = null;
         if(!a_1334 || this.m_iTimeoutIntval >= 0)
         {
            return;
         }
         a_1334.m_stCurrentBattbleFieldView.m_stLargeFogEffect.a_4130();
         var arrBaseMoveIntruderVector:Array = a_1334.m_stCurrentBattbleFieldView.m_arrBaseMoveIntruderVector.slice();
         for each(stBaseMoveIntruder in arrBaseMoveIntruderVector)
         {
            if(stBaseMoveIntruder.m_stMoveIntruderTypeID == 134235393 || stBaseMoveIntruder.m_stMoveIntruderTypeID == 8389647 || stBaseMoveIntruder.tagCom.HasTag(452))
            {
               stBaseMoveIntruder.a_4214();
            }
            else if(3 == stBaseMoveIntruder.iSpaceState && NinthExhaustFanDefense.m_MouseArr.indexOf(stBaseMoveIntruder.m_stMoveIntruderTypeID) != -1)
            {
               stBaseMoveIntruder.a_4212();
            }
         }
         BattleDestroyUtil.UseFanTool(a_1334);
         TimeoutManager.getInstance().addTimeout(this.m_iDefenseGlobalID.toString(),this.m_iBlowAwayTime * 1000,a_1334.m_stCurrentBattbleFieldView.a_3462);
         this.m_iTimeoutIntval = 1;
         a_1324 = [];
         for(var i:int = 0; i < 5; i++)
         {
            this.LaunchShot(a_1334);
         }
         a_1321 = this.m_iCurrentTime;
         a_1323 = 0;
         this.AddDelyShot();
         m_iDieType = 5;
         super.a_3969(a_1339);
         m_iDieType = 0;
      }
      
      private function LaunchShot(stStartField:a_3491) : void
      {
         if(!stStartField)
         {
            return;
         }
         var numShotXpos:Number = (a_1334.m_iXGridNo + 0.5) * a_3491.a_1080;
         var numShotYpos:Number = (a_1334.m_iYGridNo + 0.5) * a_3491.a_1081;
         var stLastWaitShot:a_4348 = NinthExhaustFanNormalShot.a_4344();
         if(stLastWaitShot != null)
         {
            stLastWaitShot.m_isSpecial = a_1323;
            stLastWaitShot.a_1797(0,a_1312,90,numShotXpos,numShotYpos,stStartField.m_stCurrentBattbleFieldView,stStartField);
            stStartField.m_stCurrentBattbleFieldView.AddToBattleView(stLastWaitShot,BattleLayerDefine.SHOT_TYPE,stStartField);
         }
         ++a_1323;
      }
      
      private function AddDelyShot() : void
      {
         var m_SnakeBottomEffect:NinthExhaustFanDelyShotEffect = null;
         if(a_1334)
         {
            m_SnakeBottomEffect = NinthExhaustFanDelyShotEffect.a_3926();
            m_SnakeBottomEffect.stOriginalFieldGrid = a_1334;
            m_SnakeBottomEffect.a_1797(false);
            m_SnakeBottomEffect.x = (a_1334.m_iXGridNo + 0.5) * a_3491.a_1080;
            m_SnakeBottomEffect.y = (a_1334.m_iYGridNo + 0.5) * a_3491.a_1081;
            a_1334.m_stCurrentBattbleFieldView.AddToBattleView(m_SnakeBottomEffect,BattleLayerDefine.SHOT_TYPE,a_1334);
            m_SnakeBottomEffect.play();
         }
      }
   }
}

