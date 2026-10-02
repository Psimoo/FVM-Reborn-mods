package com.aurora.ui.maogoutd.resource.Intruder.IceSnowZombie.ZombieIceThrowerMouse
{
   import a_4718.b_181;
   import a_4718.b_182;
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.defender.a_3962;
   import com.aurora.ui.maogoutd.resource.effect.a_4108;
   import com.aurora.ui.maogoutd.resource.shot.a_4348;
   import flash.display.FrameLabel;
   
   public class ZombieIceThrowerMouseMoveIntruder extends a_4206
   {
      
      private var a_1447:int = 0;
      
      protected var a_1304:uint = 0;
      
      protected var a_1309:int = 60;
      
      protected var a_1310:int = 0;
      
      protected var a_1311:int = 10;
      
      protected var a_1312:int = 10;
      
      protected var a_1321:int = 0;
      
      private var a_1324:Array = [];
      
      private const FULL_HP:int = 1250;
      
      private const HURT_HP:int = 600;
      
      private const DEAD_HP:int = 0;
      
      public function ZombieIceThrowerMouseMoveIntruder()
      {
         super();
      }
      
      public static function a_3926() : a_4206
      {
         return PoolManager.getInstance().CheckOutOne(ZombieIceThrowerMouseMoveIntruder) as ZombieIceThrowerMouseMoveIntruder;
      }
      
      override protected function getBindMovie() : Class
      {
         return ZombieIceThrowerMouseMoveIntruderMovie;
      }
      
      override public function a_1797(iGlobalMoveFighterID:int, iIntruderMoveDirection:int) : Boolean
      {
         super.a_1797(iGlobalMoveFighterID,iIntruderMoveDirection);
         a_1350 = a_3491.a_1080 / 60;
         if(iIntruderMoveDirection < 0)
         {
            a_1350 *= -1;
         }
         a_1339 = this.FULL_HP;
         a_1279 = -width * 0.4;
         a_1272 = 0;
         this.a_1447 = 0;
         this.a_1310 = 10;
         this.a_1321 = 0;
         return true;
      }
      
      override protected function ResetMovieStatus() : Boolean
      {
         if(a_1339 > 150)
         {
            if(a_1275 != 1)
            {
               a_1275 = 1;
               gotoAndStop((a_1276[1] as FrameLabel).frame);
            }
         }
         else if(a_1339 > 0)
         {
            if(a_1275 != 2)
            {
               a_1275 = 2;
               gotoAndStop((a_1276[2] as FrameLabel).frame);
            }
         }
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
      
      override public function a_3969(iRduceLifeValue:int) : Boolean
      {
         super.a_3969(iRduceLifeValue);
         if(a_1339 == 150)
         {
            if(a_1275 != 2)
            {
               a_1275 = 2;
               gotoAndStop((a_1276[2] as FrameLabel).frame);
            }
         }
         else if(a_1339 <= 0)
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
      
      override public function a_4210() : Boolean
      {
         if(null != m_stCurrentFieldGrid)
         {
            m_stCurrentFieldGrid.a_3457(this);
            m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3457(this);
         }
         super.a_4210();
         return true;
      }
      
      override public function a_4215(stBaseDefense:a_3962) : Boolean
      {
         super.a_4215(stBaseDefense);
         return true;
      }
      
      override public function a_4216(iCurrentTime:int) : Boolean
      {
         var stFieldGrid:a_3491 = null;
         var stLastWaitShot:a_4348 = null;
         var numShotXpos:Number = NaN;
         var shotPower:int = 0;
         var numOrigXPos:Number = x;
         if(this.a_1447 < 20)
         {
            x += a_1350;
            ++this.a_1447;
            return true;
         }
         var isExistDefenseAhead:Boolean = false;
         for(var i:int = 0; i <= m_stCurrentFieldGrid.m_iXGridNo; i++)
         {
            stFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(i,m_stCurrentFieldGrid.m_iYGridNo);
            if(Boolean(stFieldGrid) && stFieldGrid.a_3492())
            {
               isExistDefenseAhead = true;
               break;
            }
         }
         if(isExistDefenseAhead)
         {
            if(iCurrentTime >= this.a_1321 + this.a_1309)
            {
               this.a_1321 = iCurrentTime;
               stLastWaitShot = ZombieIceThrowerShot.a_4344();
               if(null == stLastWaitShot)
               {
                  return false;
               }
               this.a_1324.push(stLastWaitShot);
               if(a_1339 > 150)
               {
                  a_1275 = 1;
                  gotoAndStop((a_1276[3] as FrameLabel).frame);
               }
               else
               {
                  a_1275 = 2;
                  gotoAndStop((a_1276[4] as FrameLabel).frame);
               }
            }
            if(iCurrentTime - this.a_1321 == this.a_1310 && this.a_1324.length > 0)
            {
               numShotXpos = this.a_3955();
               if(a_1283)
               {
                  numShotXpos = -numShotXpos;
               }
               stLastWaitShot = this.a_1324.pop();
               if(stLastWaitShot)
               {
                  shotPower = HasTag(40009) ? 0 : this.a_1311;
                  stLastWaitShot.a_1797(0,this.a_1312,shotPower,x + numShotXpos,y + this.a_3956(),m_stCurrentFieldGrid.m_stCurrentBattbleFieldView,m_stCurrentFieldGrid);
                  parent.addChild(stLastWaitShot);
               }
            }
         }
         else
         {
            if(0 != a_1275)
            {
               a_1275 = 0;
               gotoAndStop((a_1276[0] as FrameLabel).frame);
            }
            super.a_4216(iCurrentTime);
         }
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
      
      override public function a_4208(iEffectType:int, iEffectTime:int, stBaseEffect:a_4108 = null) : void
      {
         if(b_182.a_433 != iEffectType && b_182.a_434 != iEffectType)
         {
            super.a_4208(iEffectType,iEffectTime,stBaseEffect);
         }
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

