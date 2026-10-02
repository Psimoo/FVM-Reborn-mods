package com.aurora.ui.maogoutd.resource.gamemap.newMap.SnakeYear.SkyCherryParty.CrispyKite
{
   import a_4718.b_182;
   import a_4754.a_2161;
   import com.adobe.utils.RandomSeed;
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.avatar.a_3924;
   import com.aurora.ui.maogoutd.resource.effect.a_4108;
   import flash.display.FrameLabel;
   
   public class CrispyKiteMouseMoveIntruder extends a_4206
   {
      
      protected var m_stRandomSeed:RandomSeed = new RandomSeed();
      
      protected var a_1598:a_3491;
      
      private var m_iYGridNo:int;
      
      private var m_iXGridNo:int;
      
      private const FULL_HP:int = 10000;
      
      private const HURT_HP:int = 1000;
      
      private const KILL_HP:int = 50;
      
      private var m_stMouseState:int;
      
      public function CrispyKiteMouseMoveIntruder()
      {
         a_1279 = -48;
         m_iYDisplayCenterPos = 16;
         a_1464 = true;
         a_1463 = true;
         super();
         a_1481 = false;
      }
      
      public static function a_3926() : a_4206
      {
         return PoolManager.getInstance().CheckOutOne(CrispyKiteMouseMoveIntruder) as CrispyKiteMouseMoveIntruder;
      }
      
      override protected function getBindMovie() : Class
      {
         return CrispyKiteMouseMoveIntruderMovie;
      }
      
      override public function a_1797(iGlobalMoveFighterID:int, iIntruderMoveDirection:int) : Boolean
      {
         super.a_1797(iGlobalMoveFighterID,iIntruderMoveDirection);
         visible = false;
         a_1339 = this.FULL_HP;
         a_1465 = 3;
         m_SecondDieFrame = 50;
         AddTag(10);
         this.m_stMouseState = 0;
         m_iIntruderState = 1;
         return true;
      }
      
      override public function a_4140(iCurrentTime:int) : void
      {
         super.a_4140(iCurrentTime);
      }
      
      override protected function a_3940() : Boolean
      {
         if(m_stCurrentFieldGrid)
         {
            m_stCurrentFieldGrid.m_stCrispyKiteMouse = null;
            if(this.m_stMouseState != 6)
            {
               this.AddCrispyKiteKillEffect();
            }
         }
         super.a_3940();
         this.a_1598 = null;
         return true;
      }
      
      override protected function ResetMovieStatus() : Boolean
      {
         if(a_1339 > 0)
         {
            if(a_1275 != this.m_stMouseState)
            {
               a_1275 = this.m_stMouseState;
               gotoAndStop((a_1276[a_1275] as FrameLabel).frame);
               if(this.m_stMouseState == 6 && Boolean(m_stCurrentFieldGrid))
               {
                  a_1339 = 0;
                  m_stCurrentFieldGrid.a_3457(this);
                  m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3457(this);
               }
            }
            a_3419();
         }
         else
         {
            if(a_1275 != 4)
            {
               this.m_stMouseState = 4;
               a_1275 = 4;
               gotoAndStop((a_1276[a_1275] as FrameLabel).frame);
            }
            if(m_stCurrentFieldGrid)
            {
               m_stCurrentFieldGrid.a_3457(this);
               m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3457(this);
            }
            a_3419();
         }
         return true;
      }
      
      override public function a_4216(iCurrentTime:int) : Boolean
      {
         var enterRoom:Object = null;
         var maxTry:int = 0;
         var i:int = 0;
         var iXGridNo:int = 0;
         var iYGridNo:int = 0;
         var grid:a_3491 = null;
         if(null == m_stCurrentFieldGrid)
         {
            return false;
         }
         if(!a_1460)
         {
            enterRoom = a_2161.e.getEnterRoom();
            this.m_stRandomSeed.setSeed(enterRoom.m_RandomSeed,1000);
            if(this.a_1598 == null)
            {
               maxTry = 50;
               for(i = 0; i < maxTry; i++)
               {
                  iXGridNo = this.m_stRandomSeed.nextInt(5) + 2;
                  iYGridNo = int(this.m_stRandomSeed.nextInt(BattleFieldView.a_1012));
                  grid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(iXGridNo,iYGridNo);
                  if(grid != null && grid.m_stCrispyKiteMouse == null && grid.m_stCrispyKiteEffect == null)
                  {
                     this.m_iXGridNo = iXGridNo;
                     this.m_iYGridNo = iYGridNo;
                     this.a_1598 = grid;
                     break;
                  }
               }
               if(this.a_1598 == null)
               {
                  this.a_1598 = m_stCurrentFieldGrid;
               }
            }
            this.ChangeToFieldGrid(this.a_1598);
            x = a_3491.a_1080 * (this.a_1598.m_iXGridNo + 0.5);
            y = iYPosSkewing + a_3491.a_1081 * this.a_1598.m_iYGridNo + (a_3491.a_1081 - this.height);
            m_stCurrentFieldGrid.m_stCrispyKiteMouse = this;
            visible = true;
            a_1460 = true;
         }
         if(a_1273 == 6)
         {
            this.m_stMouseState = 1;
            this.ResetMovieStatus();
         }
         else if(a_1273 == 42)
         {
            this.killFieldGridDefense(m_stCurrentFieldGrid);
         }
         else if(a_1273 == 50)
         {
            this.a_3940();
         }
         if(this.m_stMouseState == 2 && iCurrentTime % 20 == 0)
         {
            this.a_3502(m_stCurrentFieldGrid);
         }
         return true;
      }
      
      override public function a_4208(iEffectType:int, iEffectTime:int, stBaseEffect:a_4108 = null) : void
      {
         switch(iEffectType)
         {
            case b_182.a_435:
               if(m_iIntruderState == 1)
               {
                  RemoveTag(10);
                  m_iIntruderState = 0;
                  super.a_3969(a_1339);
               }
               break;
            case b_182.a_432:
               super.a_4208(iEffectType,iEffectTime,stBaseEffect);
               break;
            case b_182.a_433:
               if(m_iIntruderState == 1)
               {
                  RemoveTag(10);
                  m_iIntruderState = 0;
                  this.ResetMovieStatus();
               }
               super.a_4208(iEffectType,iEffectTime,stBaseEffect);
         }
      }
      
      protected function ChangeToFieldGrid(stNextFieldGrid:a_3491) : Boolean
      {
         if(null == stNextFieldGrid)
         {
            return false;
         }
         if(m_stCurrentFieldGrid.m_iInitialXGridNo == stNextFieldGrid.m_iInitialXGridNo && m_stCurrentFieldGrid.m_iInitialYGridNo == stNextFieldGrid.m_iInitialYGridNo)
         {
            return true;
         }
         ChangeFieldGrid(stNextFieldGrid);
         m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.addChildAt(this,m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3440(this.a_1598.m_iYGridNo));
         return true;
      }
      
      override public function SpecialSkillCallBack(... args) : void
      {
         if(args[0] as a_3491)
         {
            this.a_1598 = args[0];
            this.m_iXGridNo = this.a_1598.m_iXGridNo;
            this.m_iYGridNo = this.a_1598.m_iYGridNo;
         }
         else
         {
            this.m_stMouseState = args[0];
            this.ResetMovieStatus();
         }
      }
      
      override public function ReduceAllLife(iRduceLifeValue:int, bIsIgnoreArmor:Boolean = false, ishowHuijing:Boolean = false) : Boolean
      {
         super.ReduceAllLife(1000,bIsIgnoreArmor,ishowHuijing);
         return true;
      }
      
      override public function a_3969(iRduceLifeValue:int) : Boolean
      {
         super.a_3969(this.HURT_HP);
         return true;
      }
      
      override public function a_4209(iRduceLifeValue:int) : Boolean
      {
         super.a_4209(this.HURT_HP);
         return true;
      }
      
      override public function a_4212() : Boolean
      {
         this.KillSelf();
         return true;
      }
      
      override public function a_4213() : Boolean
      {
         this.KillSelf();
         return true;
      }
      
      override public function a_4210() : Boolean
      {
         this.KillSelf();
         return true;
      }
      
      override public function a_4214() : Boolean
      {
         this.KillSelf();
         return true;
      }
      
      private function KillSelf() : void
      {
         super.a_3969(this.HURT_HP);
      }
      
      private function AddCrispyKiteKillEffect() : void
      {
         var m_CrispyKiteKillEffect:CrispyKiteKillEffect = null;
         if(m_stCurrentFieldGrid)
         {
            m_CrispyKiteKillEffect = CrispyKiteKillEffect.a_3926();
            m_CrispyKiteKillEffect.stOriginalFieldGrid = m_stCurrentFieldGrid;
            m_CrispyKiteKillEffect.a_1797(false);
            m_CrispyKiteKillEffect.x = (m_stCurrentFieldGrid.m_iXGridNo + 0.5) * a_3491.a_1080;
            m_CrispyKiteKillEffect.y = (m_stCurrentFieldGrid.m_iYGridNo + 0.5) * a_3491.a_1081;
            m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(m_CrispyKiteKillEffect,BattleLayerDefine.EFFECTS_BASE_TYPE,m_stCurrentFieldGrid);
            m_CrispyKiteKillEffect.play();
         }
      }
      
      protected function a_3502(stFieldGrid:a_3491) : Boolean
      {
         if(stFieldGrid == null)
         {
            return true;
         }
         return stFieldGrid.ClearFieldGridDefenseOnlyFrozen();
      }
      
      protected function killFieldGridDefense(stFieldGrid:a_3491) : Boolean
      {
         this.KillDefense(stFieldGrid.m_stProtector);
         this.KillDefense(stFieldGrid.m_stAttackFighter is a_3924 ? null : stFieldGrid.m_stAttackFighter);
         this.KillDefense(stFieldGrid.m_stBoomDefense);
         this.KillDefense(stFieldGrid.m_stFlowerDefense);
         this.KillDefense(stFieldGrid.m_stBaseAuxiliaryFighter);
         this.KillDefense(stFieldGrid.m_stTrayDefense);
         return true;
      }
      
      private function KillDefense(target:Object) : void
      {
         if(target)
         {
            target.m_iDieType = 1;
            target.a_3969(target.iLifeValue);
         }
      }
   }
}

