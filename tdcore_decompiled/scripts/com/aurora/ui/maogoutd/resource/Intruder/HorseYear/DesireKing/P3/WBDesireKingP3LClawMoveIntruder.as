package com.aurora.ui.maogoutd.resource.Intruder.HorseYear.DesireKing.P3
{
   import a_4718.b_182;
   import a_4754.a_2161;
   import com.adobe.utils.RandomSeed;
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.Base.BaseGameMoveIntruder;
   import com.aurora.ui.maogoutd.game.Util.BattleEffectUtil;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.HorseYear.DesireKing.WBDesireKingRainbowNoteEffect;
   import com.aurora.ui.maogoutd.resource.Intruder.HorseYear.DesireKing.WBDesireKingRainbowNoteMovie;
   import com.aurora.ui.maogoutd.resource.effect.a_4108;
   
   public class WBDesireKingP3LClawMoveIntruder extends BaseGameMoveIntruder
   {
      
      private var m_lMoveArray:Array = [[[3,1,0],[1,3,1],[4,3,2],[3,5,3]],[[1,3,1],[3,1,0],[4,3,2],[3,5,3]],[[4,3,2],[3,1,0],[1,3,1],[3,5,3]],[[3,5,3],[3,1,0],[1,3,1],[4,3,2]]];
      
      private var m_stRandomSeed:RandomSeed = new RandomSeed();
      
      private var m_iSkillCount:int = 0;
      
      private var m_iWaitTotalTime:int = 0;
      
      private var m_iMoveIndex:int = 0;
      
      public function WBDesireKingP3LClawMoveIntruder()
      {
         super();
      }
      
      public static function a_3926() : WBDesireKingP3LClawMoveIntruder
      {
         return PoolManager.getInstance().CheckOutOne(WBDesireKingP3LClawMoveIntruder,WBDesireKingP3LClawMovie) as WBDesireKingP3LClawMoveIntruder;
      }
      
      override public function a_1797(iGlobalMoveFighterID:int, iIntruderMoveDirection:int) : Boolean
      {
         MAX_LIFE = 500000000;
         INJURED_LIFE = 0;
         ONE_GRID_SPEED = 1.7;
         super.a_1797(iGlobalMoveFighterID,iIntruderMoveDirection);
         SetSpeed(0);
         a_1481 = false;
         a_1464 = true;
         this.m_iSkillCount = 0;
         tagCom.AddTag(401);
         AddTag(5);
         AddTag(10);
         a_1465 = 3;
         return true;
      }
      
      public function InitData() : void
      {
         this.m_iMoveIndex = this.m_stRandomSeed.nextInt(this.m_lMoveArray.length);
         SetMoveToPosition(this.m_lMoveArray[this.m_iMoveIndex][0][0],this.m_lMoveArray[this.m_iMoveIndex][0][1]);
         a_1283 = m_fMoveSpeedX > 0;
         this.m_iWaitTotalTime = 0;
         SetAnimation(0,0);
      }
      
      override protected function ResetMovieStatus() : Boolean
      {
         if(a_1339 <= 0)
         {
            SetDeadAnim(2);
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
         var iNoX:int = 0;
         var iNoY:int = 0;
         var idx:int = 0;
         if(!a_1460)
         {
            enterRoom = a_2161.e.getEnterRoom();
            this.m_stRandomSeed.setSeed(enterRoom.m_RandomSeed,1000);
            a_1460 = true;
         }
         if(this.m_iSkillCount >= 3)
         {
            return true;
         }
         MoveUpdate();
         if(a_1581 <= 0 && this.m_iWaitTotalTime <= 0)
         {
            this.m_iWaitTotalTime = 20 * 5;
            a_1283 = false;
         }
         if(this.m_iWaitTotalTime > 0)
         {
            --this.m_iWaitTotalTime;
            if(this.m_iWaitTotalTime == 60)
            {
               SetAnimation(1,1);
               iNoX = m_stCurrentFieldGrid.m_iXGridNo;
               iNoY = m_stCurrentFieldGrid.m_iYGridNo;
               this.CreateRainbow(iNoX - 1,iNoY);
               this.CreateRainbow(iNoX + 1,iNoY);
               this.CreateRainbow(iNoX,iNoY - 1);
               this.CreateRainbow(iNoX,iNoY + 1);
               this.CreateRainbow(iNoX,iNoY);
            }
            else if(this.m_iWaitTotalTime == 0)
            {
               ++this.m_iSkillCount;
               if(this.m_iSkillCount >= 3)
               {
                  this.a_4158();
               }
               else
               {
                  idx = this.m_stRandomSeed.nextInt(this.m_lMoveArray[this.m_iMoveIndex].length - 1) + 1;
                  SetMoveToPosition(this.m_lMoveArray[this.m_iMoveIndex][idx][0],this.m_lMoveArray[this.m_iMoveIndex][idx][1]);
                  a_1283 = m_fMoveSpeedX > 0;
                  this.m_iMoveIndex = this.m_lMoveArray[this.m_iMoveIndex][idx][2];
                  SetAnimation(0,0);
               }
            }
         }
         return true;
      }
      
      private function CreateRainbow(iNoX:int, iNoY:int) : void
      {
         var grid:a_3491 = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(iNoX,iNoY);
         if(grid == null)
         {
            return;
         }
         var effect:WBDesireKingRainbowNoteEffect = BattleEffectUtil.CreateGameEffect(WBDesireKingRainbowNoteEffect,WBDesireKingRainbowNoteMovie,grid) as WBDesireKingRainbowNoteEffect;
         effect.InitData(grid);
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

