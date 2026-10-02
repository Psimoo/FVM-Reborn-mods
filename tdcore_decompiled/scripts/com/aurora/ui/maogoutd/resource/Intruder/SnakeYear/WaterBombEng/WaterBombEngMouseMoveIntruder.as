package com.aurora.ui.maogoutd.resource.Intruder.SnakeYear.WaterBombEng
{
   import a_4718.b_181;
   import a_4718.b_182;
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.effect.a_4108;
   import com.aurora.ui.maogoutd.resource.shot.a_4348;
   import flash.display.FrameLabel;
   
   public class WaterBombEngMouseMoveIntruder extends a_4206
   {
      
      private const FULL_HP:int = 3600;
      
      private const HURT_HP:int = 2000;
      
      private const DEAD_HP:int = 0;
      
      private var a_1447:int = 0;
      
      private var m_BornSkill:Boolean;
      
      private var m_DieSkill:Boolean;
      
      protected var a_1309:int = 60;
      
      protected var a_1310:int = 0;
      
      protected var a_1311:int = 50;
      
      protected var a_1312:int = 15;
      
      protected var a_1321:int = 0;
      
      private var a_1324:Array = [];
      
      public function WaterBombEngMouseMoveIntruder()
      {
         super();
         a_1279 = 10;
         a_1467 = -10;
         BoomIsReduceLife = true;
         a_1463 = true;
         m_m_isCannotHurtByInsurance = true;
         a_1461 = true;
      }
      
      public static function a_3926() : a_4206
      {
         return PoolManager.getInstance().CheckOutOne(WaterBombEngMouseMoveIntruder) as WaterBombEngMouseMoveIntruder;
      }
      
      override protected function getBindMovie() : Class
      {
         return WaterBombEngMouseMoveIntruderMovie;
      }
      
      override public function a_1797(iGlobalMoveFighterID:int, iIntruderMoveDirection:int) : Boolean
      {
         super.a_1797(iGlobalMoveFighterID,iIntruderMoveDirection);
         a_1350 = 0;
         if(iIntruderMoveDirection < 0)
         {
            a_1350 *= -1;
         }
         a_1339 = this.FULL_HP;
         this.a_1447 = 0;
         this.a_1310 = 14;
         this.a_1321 = 0;
         this.m_BornSkill = false;
         this.m_DieSkill = true;
         return true;
      }
      
      override protected function ResetMovieStatus() : Boolean
      {
         if(a_1339 <= 0)
         {
            if(a_1275 != 5)
            {
               a_1275 = 5;
               gotoAndStop((a_1276[5] as FrameLabel).frame);
            }
            a_3419();
            if(null != m_stCurrentFieldGrid)
            {
               m_stCurrentFieldGrid.a_3457(this);
               m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3457(this);
            }
            this.play();
         }
         return true;
      }
      
      override public function a_4213() : Boolean
      {
         m_DropDieType = 3;
         super.a_4213();
         m_DropDieType = 0;
         return true;
      }
      
      override public function a_4212() : Boolean
      {
         if(m_DropDieType == 1 || m_DropDieType == 3)
         {
            this.m_DieSkill = false;
            super.a_4212();
         }
         return true;
      }
      
      override public function a_4210() : Boolean
      {
         a_3969(BOOM_INJURE_LIFE);
         return true;
      }
      
      override public function nextFrame() : void
      {
         super.nextFrame();
         if(a_1273 == 71 && this.m_DieSkill)
         {
            this.DieSkill();
            this.m_DieSkill = false;
         }
      }
      
      override public function a_4216(iCurrentTime:int) : Boolean
      {
         var stLastWaitShot:a_4348 = null;
         var numShotXpos:Number = NaN;
         var shotPower:int = 0;
         if(null == m_stCurrentFieldGrid)
         {
            return false;
         }
         if(!a_1460)
         {
            a_1460 = true;
            a_1275 = 2;
            gotoAndStop((a_1276[0] as FrameLabel).frame);
         }
         if(this.m_BornSkill == false)
         {
            if(a_1273 == 17)
            {
               this.a_3502(m_stCurrentFieldGrid);
            }
            else if(a_1273 == 18)
            {
               this.a_1321 = iCurrentTime - this.a_1309 - 1;
               this.m_BornSkill = true;
            }
            return true;
         }
         if(iCurrentTime >= this.a_1321 + this.a_1309)
         {
            this.a_1321 = iCurrentTime;
            this.a_1324.length = 0;
            stLastWaitShot = WaterShot.a_4344() as a_4348;
            if(null == stLastWaitShot)
            {
               return false;
            }
            this.a_1324.push(stLastWaitShot);
            if(a_1339 >= this.HURT_HP)
            {
               a_1275 = 1;
               gotoAndStop((a_1276[2] as FrameLabel).frame);
            }
            else
            {
               a_1275 = 3;
               gotoAndStop((a_1276[4] as FrameLabel).frame);
            }
         }
         if(iCurrentTime - this.a_1321 == this.a_1310 && this.a_1324.length > 0)
         {
            numShotXpos = -37;
            if(a_1283)
            {
               numShotXpos = -numShotXpos;
            }
            stLastWaitShot = this.a_1324.pop();
            if(stLastWaitShot)
            {
               shotPower = HasTag(40009) ? 0 : this.a_1311;
               stLastWaitShot.a_1797(0,this.a_1312,shotPower,x + numShotXpos,y - 8,m_stCurrentFieldGrid.m_stCurrentBattbleFieldView,m_stCurrentFieldGrid);
               m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(stLastWaitShot,BattleLayerDefine.SHOT_TYPE,m_stCurrentFieldGrid);
            }
         }
         var numOrigXPos:Number = x;
         if(a_1457 == b_181.a_424 && (x > a_3491.a_1080 * 4 && a_1283 || x < a_3491.a_1080 * 5 && !a_1283))
         {
            y += Math.tan(15 * Math.PI / 180) * Math.abs(numOrigXPos - x);
         }
         return true;
      }
      
      override public function play() : void
      {
         super.play();
      }
      
      private function DieSkill() : void
      {
         var stTargetFieldGrid:a_3491 = null;
         var numShotXpos:Number = NaN;
         var stLastWaitShot:a_4348 = null;
         if(m_stCurrentFieldGrid == null)
         {
            return;
         }
         for(var i:int = -1; i < 2; i++)
         {
            stTargetFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(m_stCurrentFieldGrid.m_iXGridNo,m_stCurrentFieldGrid.m_iYGridNo + i);
            if(stTargetFieldGrid)
            {
               numShotXpos = -70;
               if(a_1283)
               {
                  numShotXpos = -numShotXpos;
               }
               stLastWaitShot = stLastWaitShot = WaterShot.a_4344() as a_4348;
               stLastWaitShot.a_1797(0,this.a_1312,this.a_1311,x + numShotXpos,y + 12,stTargetFieldGrid.m_stCurrentBattbleFieldView,stTargetFieldGrid);
               stTargetFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(stLastWaitShot,BattleLayerDefine.SHOT_TYPE,stTargetFieldGrid);
            }
         }
      }
      
      override public function a_4208(iEffectType:int, iEffectTime:int, stBaseEffect:a_4108 = null) : void
      {
         if(b_182.a_433 != iEffectType && b_182.a_434 != iEffectType)
         {
            super.a_4208(iEffectType,iEffectTime,stBaseEffect);
         }
      }
      
      protected function a_3502(stFieldGrid:a_3491) : Boolean
      {
         if(null == stFieldGrid)
         {
            return false;
         }
         return stFieldGrid.ClearFieldGridDefenseOnlyFrozen();
      }
      
      protected function a_3955() : Number
      {
         return -0.08 * width;
      }
      
      protected function a_3956() : Number
      {
         return -0.08 * height;
      }
   }
}

