package com.aurora.ui.maogoutd.resource.Intruder.HorseYear.DesireKing.P3
{
   import a_4718.b_182;
   import a_4754.a_2161;
   import com.adobe.utils.RandomSeed;
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.Base.BaseGameMoveIntruder;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.Util.BattleRandomUtil;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.HorseYear.DesireKing.Child.WBDesireChildCalamityRatMoveIntruder;
   import com.aurora.ui.maogoutd.resource.Intruder.HorseYear.DesireKing.WBDesireKingUtil;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.Intruder.newBoss.BaseBossMoveIntruder;
   import com.aurora.ui.maogoutd.resource.effect.a_4108;
   
   public class WBDesireKingP3RClawMoveIntruder extends BaseGameMoveIntruder
   {
      
      private var m_iState:int = 0;
      
      private var m_iStateTime:int = 0;
      
      private var m_stRandomSeed:RandomSeed = new RandomSeed();
      
      private var m_stBoss:BaseBossMoveIntruder;
      
      private var m_iSkillCount:int = 0;
      
      private var m_stTransportedMoveIntruder:a_4206;
      
      public function WBDesireKingP3RClawMoveIntruder()
      {
         super();
      }
      
      public static function a_3926() : WBDesireKingP3RClawMoveIntruder
      {
         return PoolManager.getInstance().CheckOutOne(WBDesireKingP3RClawMoveIntruder,WBDesireKingP3RClawMovie) as WBDesireKingP3RClawMoveIntruder;
      }
      
      override public function a_1797(iGlobalMoveFighterID:int, iIntruderMoveDirection:int) : Boolean
      {
         MAX_LIFE = 500000000;
         INJURED_LIFE = 0;
         ONE_GRID_SPEED = 0.45;
         super.a_1797(iGlobalMoveFighterID,iIntruderMoveDirection);
         SetSpeed(0);
         a_1481 = false;
         a_1464 = true;
         tagCom.AddTag(401);
         AddTag(5);
         AddTag(10);
         a_1465 = 3;
         return true;
      }
      
      public function InitData(boss:BaseBossMoveIntruder) : void
      {
         SetAnimation(0,0);
         SetMoveToPosition(m_stCurrentFieldGrid.m_iXGridNo - 1,m_stCurrentFieldGrid.m_iYGridNo,0.9);
         this.m_iState = 0;
         this.m_iSkillCount = 0;
         this.m_stBoss = boss;
         this.m_stTransportedMoveIntruder = null;
      }
      
      override protected function ResetMovieStatus() : Boolean
      {
         if(a_1339 <= 0)
         {
            SetDeadAnim(4);
         }
         return true;
      }
      
      public function a_4158() : void
      {
         a_1339 = 0;
         this.ResetMovieStatus();
      }
      
      override public function a_4216(iCurrentTime:int) : Boolean
      {
         var enterRoom:Object = null;
         if(!a_1460)
         {
            enterRoom = a_2161.e.getEnterRoom();
            this.m_stRandomSeed.setSeed(enterRoom.m_RandomSeed,1000);
            a_1460 = true;
         }
         MoveUpdate();
         if(this.m_iState == 0)
         {
            if(a_1581 == 0)
            {
               this.m_iState = 1;
               this.m_iStateTime = 1.5 * 20;
            }
         }
         else if(this.m_iState == 1)
         {
            --this.m_iStateTime;
            if(this.m_iStateTime == 20)
            {
               WBDesireKingUtil.LockCards(5,m_stCurrentFieldGrid.m_stCurrentBattbleFieldView);
            }
            else if(this.m_iStateTime == 0)
            {
               SetAnimation(1,1);
               this.m_iState = 2;
            }
         }
         else if(this.m_iState == 2)
         {
            if(a_1273 == 22)
            {
               this.CreateBox();
               SetAnimation(2,2);
               this.m_iStateTime = 1 * 20;
               this.m_iState = 3;
            }
         }
         else if(this.m_iState == 3)
         {
            --this.m_iStateTime;
            if(this.m_iStateTime == 0)
            {
               this.DoSkillLoop();
            }
         }
         else if(this.m_iState == 4)
         {
            if(a_1581 == 0)
            {
               this.m_iState = 5;
               this.m_iStateTime = 20;
            }
         }
         else if(this.m_iState == 5)
         {
            --this.m_iStateTime;
            if(this.m_iStateTime == 10)
            {
               this.BeginTent();
            }
            else if(this.m_iStateTime == 0)
            {
               this.m_iState = 6;
               SetMoveToPosition(3 + this.m_stRandomSeed.nextInt(2),1 + this.m_stRandomSeed.nextInt(5),1.6);
            }
         }
         else if(this.m_iState == 6)
         {
            if(a_1581 == 0)
            {
               this.m_iState = 7;
               this.m_iStateTime = 20;
            }
         }
         else if(this.m_iState == 7)
         {
            --this.m_iStateTime;
            if(this.m_iStateTime == 10)
            {
               this.EndTent();
            }
            else if(this.m_iStateTime == 0)
            {
               this.DoSkillLoop();
            }
         }
         else if(this.m_iState == 8)
         {
            --this.m_iStateTime;
            if(this.m_iStateTime == 0)
            {
               this.DoSkillLoop();
            }
         }
         return true;
      }
      
      private function DoSkillLoop() : void
      {
         ++this.m_iSkillCount;
         if(this.m_iSkillCount <= 2)
         {
            this.m_iState = 4;
            SetAnimation(2,2);
            SetMoveToPosition(8,this.m_stRandomSeed.nextInt(7),0.45);
         }
         else
         {
            this.a_4158();
         }
      }
      
      private function BeginTent() : void
      {
         this.m_stTransportedMoveIntruder = WBDesireChildCalamityRatMoveIntruder.a_3926();
         this.m_stTransportedMoveIntruder.a_1797(0,-1);
         this.m_stTransportedMoveIntruder.iGlobalMoveFighterID = (this.m_stBoss.globalMoveFighterID << 16) + 1;
         this.m_stTransportedMoveIntruder.m_stMoveIntruderTypeID = 134235589;
         this.m_stTransportedMoveIntruder.x = 0;
         this.m_stTransportedMoveIntruder.y = 15;
         addChildAt(this.m_stTransportedMoveIntruder,0);
         this.m_stTransportedMoveIntruder.gotoAndStop(9);
         SetAnimation(3,3);
      }
      
      private function StopTent() : void
      {
         if(this.m_stTransportedMoveIntruder != null)
         {
            this.m_stTransportedMoveIntruder.a_3432();
            this.m_stTransportedMoveIntruder = null;
         }
      }
      
      private function EndTent() : void
      {
         if(this.m_stTransportedMoveIntruder == null)
         {
            return;
         }
         m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3459(this.m_stTransportedMoveIntruder,m_stCurrentFieldGrid);
         m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(this.m_stTransportedMoveIntruder,BattleLayerDefine.INTRUDER_LAND_TYPE,m_stCurrentFieldGrid);
         this.m_stTransportedMoveIntruder.x = (m_stCurrentFieldGrid.m_iXGridNo + 0.5) * a_3491.a_1080;
         this.m_stTransportedMoveIntruder.y = (m_stCurrentFieldGrid.m_iYGridNo + 0.5) * a_3491.a_1081;
         this.m_stTransportedMoveIntruder = null;
      }
      
      protected function CreateBox() : void
      {
         var m_stRandomArr:Array = null;
         var m_TargetFieldGrid:a_3491 = null;
         var boxMouse:WBDesireKingP3BoxMoveIntruder = null;
         var i:int = 0;
         var iNoY:int = m_stCurrentFieldGrid.m_iYGridNo;
         m_stRandomArr = [];
         for(i = 0; i < 4; i++)
         {
            if(i * 2 != iNoY)
            {
               m_stRandomArr.push([2,i * 2,0]);
            }
         }
         m_stRandomArr = BattleRandomUtil.ShuffleArray(m_stRandomArr,this.m_stRandomSeed);
         var bornArr:Array = BattleRandomUtil.ShuffleArray([1,1,1,1,2],this.m_stRandomSeed);
         m_stRandomArr = [[6,iNoY,0],[4,iNoY,0],[2,iNoY,0]].concat(m_stRandomArr);
         for(i = 0; i < 4; i++)
         {
            m_stRandomArr[i][2] = bornArr[i];
         }
         m_TargetFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(m_stRandomArr[0][0],m_stRandomArr[0][1]);
         boxMouse = WBDesireKingP3BoxMoveIntruder.a_3926();
         boxMouse.a_1797((1 << 16) + 1000 + m_stRandomArr[0][1] * 100 + m_stRandomArr[0][0],-1);
         boxMouse.m_stMoveIntruderTypeID = 134235591;
         m_TargetFieldGrid.m_stCurrentBattbleFieldView.a_3459(boxMouse,m_TargetFieldGrid,false,BattleLayerDefine.INTRUDER_LAND_TYPE);
         boxMouse.x = (m_TargetFieldGrid.m_iXGridNo + 0.5) * a_3491.a_1080;
         boxMouse.y = (m_TargetFieldGrid.m_iYGridNo + 0.5) * a_3491.a_1081;
         boxMouse.InitData(m_stRandomArr,this.m_stBoss);
      }
      
      override protected function a_3940() : Boolean
      {
         this.StopTent();
         super.a_3940();
         return true;
      }
      
      override public function a_4212() : Boolean
      {
         return false;
      }
      
      override public function a_4208(iEffectType:int, iEffectTime:int, stBaseEffect:a_4108 = null) : void
      {
         if(b_182.a_432 == iEffectType)
         {
            super.a_4208(iEffectType,iEffectTime,stBaseEffect);
         }
      }
      
      override public function a_4213() : Boolean
      {
         return false;
      }
      
      override public function a_4210() : Boolean
      {
         if(this.m_iState == 6)
         {
            this.m_iState = 8;
            this.m_iStateTime = 20 * 2;
            a_1581 = 0;
            m_fMoveSpeedX = 0;
            m_fMoveSpeedY = 0;
            this.StopTent();
         }
         return false;
      }
      
      override public function ShowBatDieEffect() : void
      {
      }
      
      override public function a_3969(value:int) : Boolean
      {
         return false;
      }
      
      override public function a_4209(value:int) : Boolean
      {
         return false;
      }
      
      override public function PowerfulBombReduceLifeRate(fRate:Number = 0.3, bIsIgnoreArmor:Boolean = false) : Boolean
      {
         return false;
      }
   }
}

