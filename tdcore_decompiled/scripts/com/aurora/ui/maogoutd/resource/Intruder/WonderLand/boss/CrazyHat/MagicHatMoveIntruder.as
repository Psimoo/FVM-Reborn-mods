package com.aurora.ui.maogoutd.resource.Intruder.WonderLand.boss.CrazyHat
{
   import a_4718.b_182;
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.effect.a_4108;
   import com.aurora.ui.maogoutd.resource.shot.a_4348;
   import flash.display.FrameLabel;
   
   public class MagicHatMoveIntruder extends a_4206
   {
      
      private static var intervalId:uint = 0;
      
      private const FULL_HP:int = 90000;
      
      private const HURT_HP:int = 45000;
      
      private const DEAD_HP:int = 0;
      
      private var m_iAppearedTime:int;
      
      protected var a_1324:Array = [];
      
      private var mouseCount:int = 0;
      
      private var m_bIsStartShot:Boolean;
      
      private var m_bIsDropDown:Boolean;
      
      public function MagicHatMoveIntruder()
      {
         super();
         a_1481 = false;
      }
      
      public static function a_3926() : a_4206
      {
         return PoolManager.getInstance().CheckOutOne(MagicHatMoveIntruder) as MagicHatMoveIntruder;
      }
      
      override protected function getBindMovie() : Class
      {
         return MagicHatMoveIntruderMovie;
      }
      
      override public function a_1797(iGlobalMoveFighterID:int, iIntruderMoveDirection:int) : Boolean
      {
         super.a_1797(iGlobalMoveFighterID,iIntruderMoveDirection);
         a_1350 = a_3491.a_1080 / (1 * 20);
         if(iIntruderMoveDirection < 0)
         {
            a_1350 *= -1;
         }
         a_1339 = this.FULL_HP;
         BoomIsReduceLife = true;
         a_1464 = true;
         a_1462 = false;
         this.m_iAppearedTime = 0;
         a_1279 = -9;
         a_1467 = -80;
         this.m_bIsStartShot = false;
         this.m_bIsDropDown = false;
         return true;
      }
      
      override protected function a_3940() : Boolean
      {
         if(m_stCurrentFieldGrid != null)
         {
            if(m_stCurrentFieldGrid.m_stMouseObstacle)
            {
               m_stCurrentFieldGrid.m_stMouseObstacle = null;
            }
            this.ClearShield(m_stCurrentFieldGrid);
         }
         super.a_3940();
         this.m_bIsStartShot = false;
         this.m_bIsDropDown = false;
         return true;
      }
      
      override protected function ResetMovieStatus() : Boolean
      {
         if(a_1339 > this.HURT_HP)
         {
            if(!this.m_bIsDropDown)
            {
               if(this.m_bIsStartShot)
               {
                  if(a_1275 != 2)
                  {
                     a_1275 = 2;
                     this.gotoAndStop((a_1276[2] as FrameLabel).frame);
                  }
               }
               else if(a_1275 != 1)
               {
                  a_1275 = 1;
                  this.gotoAndStop((a_1276[1] as FrameLabel).frame);
               }
            }
            a_3419();
         }
         else if(a_1339 > 0)
         {
            if(!this.m_bIsDropDown)
            {
               if(this.m_bIsStartShot)
               {
                  if(a_1275 != 5)
                  {
                     a_1275 = 5;
                     this.gotoAndStop((a_1276[5] as FrameLabel).frame);
                  }
               }
               else if(a_1275 != 4)
               {
                  a_1275 = 4;
                  this.gotoAndStop((a_1276[4] as FrameLabel).frame);
               }
            }
            a_3419();
         }
         else if(a_1339 <= 0)
         {
            if(m_stCurrentFieldGrid)
            {
               m_stCurrentFieldGrid.a_3457(this);
               m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3457(this);
            }
            this.a_3940();
         }
         return true;
      }
      
      override public function a_3969(iRduceLifeValue:int) : Boolean
      {
         super.a_3969(iRduceLifeValue);
         return true;
      }
      
      override public function a_4210() : Boolean
      {
         super.a_4210();
         return true;
      }
      
      override public function nextFrame() : void
      {
         super.nextFrame();
         if(a_1278 != null || a_1273 == a_1274)
         {
            this.gotoAndStop((a_1276[a_1275] as FrameLabel).frame);
         }
      }
      
      override public function gotoAndStop(frame:Object, scene:String = null) : void
      {
         super.gotoAndStop(frame);
      }
      
      override public function a_4216(iCurrentTime:int) : Boolean
      {
         var i:int = 0;
         var stMoveIntruder:a_4206 = null;
         var j:* = 0;
         if(!a_1460)
         {
            a_1460 = true;
            this.m_bIsDropDown = true;
            a_1275 = 1;
            this.gotoAndStop((a_1276[0] as FrameLabel).frame);
            this.addShield(m_stCurrentFieldGrid);
         }
         if(!this.m_bIsStartShot && !this.m_bIsDropDown && m_stCurrentFieldGrid != null && m_stCurrentFieldGrid.a_1511.length > 0)
         {
            this.mouseCount = 0;
            for(i = 0; i < m_stCurrentFieldGrid.a_1511.length; i++)
            {
               stMoveIntruder = m_stCurrentFieldGrid.a_1511[i];
               if(!stMoveIntruder.isCannotSeeByInsurance && stMoveIntruder != this)
               {
                  stMoveIntruder.a_4212();
                  ++this.mouseCount;
               }
            }
            if(this.mouseCount > 0)
            {
               this.m_bIsStartShot = true;
               this.ResetMovieStatus();
            }
         }
         if(iCurrentTime % 2 == 0)
         {
            if(a_1273 == 11 || a_1273 == 35)
            {
               this.m_bIsDropDown = false;
            }
            else if(a_1273 == 21 || a_1273 == 45)
            {
               for(j = this.mouseCount; j >= 1; j--)
               {
                  this.addSaluteShot(m_stCurrentFieldGrid,j);
               }
            }
            else if(a_1273 == 24 || a_1273 == 47)
            {
               this.m_bIsStartShot = false;
               this.ResetMovieStatus();
            }
         }
         return true;
      }
      
      private function addSaluteShot(stStartField:a_3491, index:int) : void
      {
         if(stStartField == null)
         {
            return;
         }
         var stLastWaitShot:a_4348 = SaluteShot.a_4344();
         var iPosX:int = stStartField.m_iXGridNo * a_3491.a_1080 - 17 - index * 60;
         var iPosY:int = stStartField.m_iYGridNo * a_3491.a_1081 + 40;
         stLastWaitShot.a_1797(0,10,50,iPosX,iPosY,m_stCurrentFieldGrid.m_stCurrentBattbleFieldView,stStartField,false,1,0);
         m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(stLastWaitShot,BattleLayerDefine.EFFECTS_BASE_TYPE,stStartField);
      }
      
      protected function addShield(stFieldGrid:a_3491) : Boolean
      {
         if(stFieldGrid != null && 0 == stFieldGrid.m_iFieldGridType)
         {
            stFieldGrid.m_iFieldGridType = 4;
         }
         this.a_3502(stFieldGrid);
         return true;
      }
      
      protected function a_3502(stFieldGrid:a_3491) : Boolean
      {
         if(null == stFieldGrid)
         {
            return false;
         }
         return stFieldGrid.ClearFieldGridDefenseWithOption();
      }
      
      protected function ClearShield(stFieldGrid:a_3491) : Boolean
      {
         if(stFieldGrid != null && stFieldGrid.m_iFieldGridType == 4)
         {
            stFieldGrid.m_iFieldGridType = 0;
         }
         return true;
      }
      
      override public function a_4208(iEffectType:int, iEffectTime:int, stBaseEffect:a_4108 = null) : void
      {
         if(b_182.a_432 == iEffectType)
         {
            super.a_4208(iEffectType,iEffectTime,stBaseEffect);
         }
      }
      
      override public function ShowBoomDieEffect() : void
      {
      }
   }
}

