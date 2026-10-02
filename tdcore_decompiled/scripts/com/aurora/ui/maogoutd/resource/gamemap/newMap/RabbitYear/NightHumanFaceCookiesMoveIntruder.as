package com.aurora.ui.maogoutd.resource.gamemap.newMap.RabbitYear
{
   import a_4718.b_182;
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.effect.a_4108;
   import com.aurora.ui.maogoutd.resource.energy.a_4157;
   import flash.display.FrameLabel;
   
   public class NightHumanFaceCookiesMoveIntruder extends a_4206
   {
      
      public var FULL_HP:int = 20000;
      
      private var HURT_HP:int = this.FULL_HP * 0.4;
      
      private var DEAD_HP:int = 0;
      
      private var m_iPickEnergyNum:int;
      
      private var m_SkillCopy:Boolean;
      
      private var m_iAppearedTime:int;
      
      private var m_iWattingTime:int;
      
      public var callBackFun:Function;
      
      public var SkillPickInterval:int;
      
      private var m_BossSate:int = 0;
      
      private var FrameID:int;
      
      public function NightHumanFaceCookiesMoveIntruder()
      {
         super();
         a_1279 = -48;
         a_1467 = 1;
         a_1481 = false;
         scaleX = scaleY = 0.9;
      }
      
      public static function a_3926() : a_4206
      {
         return PoolManager.getInstance().CheckOutOne(NightHumanFaceCookiesMoveIntruder) as NightHumanFaceCookiesMoveIntruder;
      }
      
      override protected function getBindMovie() : Class
      {
         return NightHumanFaceCookiesMoveIntruderMovie;
      }
      
      override public function a_1797(iGlobalMoveFighterID:int, iIntruderMoveDirection:int) : Boolean
      {
         super.a_1797(iGlobalMoveFighterID,iIntruderMoveDirection);
         a_1339 = this.FULL_HP;
         a_1464 = true;
         a_1463 = true;
         this.m_iAppearedTime = 0;
         this.m_iWattingTime = 0;
         this.m_iPickEnergyNum = 0;
         this.m_SkillCopy = false;
         BoomIsReduceLife = true;
         this.HURT_HP = this.FULL_HP * 0.4;
         tagCom.AddTag(40003);
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
         this.m_SkillCopy = false;
         super.a_3940();
         return true;
      }
      
      override public function a_4216(iCurrentTime:int) : Boolean
      {
         if(!a_1460)
         {
            a_1465 = 0;
            this.addShield(m_stCurrentFieldGrid);
            a_1460 = true;
            a_1275 = 0;
            this.m_BossSate = 0;
            this.m_iAppearedTime = iCurrentTime;
            gotoAndStop((a_1276[0] as FrameLabel).frame);
         }
         if(!this.m_SkillCopy && this.m_iPickEnergyNum >= 500)
         {
            this.m_SkillCopy = true;
            if(this.callBackFun != null)
            {
               this.callBackFun();
            }
         }
         if(a_1273 == 10 && this.m_BossSate == 0)
         {
            this.m_iAppearedTime = iCurrentTime;
            this.m_BossSate = 1;
         }
         if((iCurrentTime - this.m_iAppearedTime) % (this.SkillPickInterval * 20) == 0 && this.m_BossSate != 0)
         {
            this.m_iWattingTime = 20 * 4;
            this.m_BossSate = 1;
            this.ResetMovieStatus();
         }
         if(this.m_BossSate == 1)
         {
            if(this.m_iWattingTime > 0)
            {
               --this.m_iWattingTime;
               this.skillPickEnergy();
               if(this.m_iWattingTime == 0)
               {
                  this.m_BossSate = 2;
                  this.ResetMovieStatus();
               }
            }
         }
         if(iCurrentTime % 2 == 0)
         {
            if(a_1273 == 60 || a_1273 == 115)
            {
               this.skillBomDie(m_stCurrentFieldGrid);
            }
            if(a_1273 == 65 || a_1273 == 120 || a_1273 == 135)
            {
               this.a_3940();
            }
         }
         return true;
      }
      
      override protected function ResetMovieStatus() : Boolean
      {
         if(a_1339 > this.HURT_HP)
         {
            if(this.m_iPickEnergyNum >= 4000)
            {
               this.FrameID = this.m_BossSate == 1 ? 5 : 5;
               if(this.m_BossSate == 0)
               {
                  this.FrameID = 0;
               }
               if(a_1275 != this.FrameID)
               {
                  a_1275 = this.FrameID;
                  gotoAndStop((a_1276[this.FrameID] as FrameLabel).frame);
               }
            }
            else if(this.m_iPickEnergyNum >= 450)
            {
               this.FrameID = this.m_BossSate == 1 ? 4 : 3;
               if(this.m_BossSate == 0)
               {
                  this.FrameID = 0;
               }
               if(a_1275 != this.FrameID)
               {
                  a_1275 = this.FrameID;
                  gotoAndStop((a_1276[this.FrameID] as FrameLabel).frame);
               }
            }
            else
            {
               this.FrameID = this.m_BossSate == 1 ? 2 : 1;
               if(this.m_BossSate == 0)
               {
                  this.FrameID = 0;
               }
               if(a_1275 != this.FrameID)
               {
                  a_1275 = this.FrameID;
                  gotoAndStop((a_1276[this.FrameID] as FrameLabel).frame);
               }
            }
            a_3419();
         }
         else if(a_1339 > 0)
         {
            if(this.m_iPickEnergyNum >= 4000)
            {
               this.FrameID = this.m_BossSate == 1 ? 10 : 10;
               if(this.m_BossSate == 0)
               {
                  this.FrameID = 0;
               }
               if(a_1275 != this.FrameID)
               {
                  a_1275 = this.FrameID;
                  gotoAndStop((a_1276[this.FrameID] as FrameLabel).frame);
               }
            }
            else if(this.m_iPickEnergyNum >= 450)
            {
               this.FrameID = this.m_BossSate == 1 ? 9 : 8;
               if(this.m_BossSate == 0)
               {
                  this.FrameID = 0;
               }
               if(a_1275 != this.FrameID)
               {
                  a_1275 = this.FrameID;
                  gotoAndStop((a_1276[this.FrameID] as FrameLabel).frame);
               }
            }
            else
            {
               this.FrameID = this.m_BossSate == 1 ? 7 : 6;
               if(this.m_BossSate == 0)
               {
                  this.FrameID = 0;
               }
               if(a_1275 != this.FrameID)
               {
                  a_1275 = this.FrameID;
                  gotoAndStop((a_1276[this.FrameID] as FrameLabel).frame);
               }
            }
            a_3419();
         }
         else if(a_1339 <= 0)
         {
            this.FrameID = 11;
            if(a_1275 != this.FrameID)
            {
               a_1275 = this.FrameID;
               gotoAndStop((a_1276[this.FrameID] as FrameLabel).frame);
            }
         }
         return true;
      }
      
      override public function nextFrame() : void
      {
         super.nextFrame();
         if(a_1273 == a_1274 && a_1339 <= 0)
         {
            this.a_3940();
            return;
         }
         if(a_1278 != null)
         {
            if(a_1339 <= 0)
            {
               this.a_3940();
               return;
            }
            try
            {
               gotoAndStop((a_1276[a_1275] as FrameLabel).frame);
            }
            catch(error:Error)
            {
               throw new Error("m_iFrameLabelIndex:" + a_1275);
            }
         }
      }
      
      override public function PickEnergyPower(energy:int) : void
      {
         this.m_iPickEnergyNum += energy;
         this.ResetMovieStatus();
      }
      
      override public function a_4208(iEffectType:int, iEffectTime:int, stBaseEffect:a_4108 = null) : void
      {
         if(b_182.a_432 == iEffectType)
         {
            super.a_4208(iEffectType,iEffectTime,stBaseEffect);
         }
      }
      
      private function skillBomDie(a_1334:a_3491) : void
      {
         var stTargetFieldGrid:a_3491 = null;
         var xIndex:int = 0;
         if(a_1334 == null)
         {
            return;
         }
         var xStart:int = Math.max(a_1334.m_iXGridNo - 1,0);
         var xEnd:int = Math.min(a_1334.m_iXGridNo + 1,BattleFieldView.a_1011 - 1);
         var yStart:int = Math.max(a_1334.m_iYGridNo - 1,0);
         var yEnd:int = Math.min(a_1334.m_iYGridNo + 1,BattleFieldView.a_1012 - 1);
         var stFieldGridVector:Array = a_1334.m_stCurrentBattbleFieldView.stFieldGridsVector;
         for(var yIndex:int = yStart; yIndex <= yEnd; yIndex++)
         {
            for(xIndex = xStart; xIndex <= xEnd; xIndex++)
            {
               stTargetFieldGrid = a_1334.m_stCurrentBattbleFieldView.a_3438(xIndex,yIndex);
               this.a_3502(stTargetFieldGrid);
            }
         }
      }
      
      private function skillPickEnergy() : void
      {
         var stBaseEnergy:a_4157 = null;
         if(null != m_stCurrentFieldGrid && Boolean(m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.m_arrBaseEnergyVector))
         {
            for each(stBaseEnergy in m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.m_arrBaseEnergyVector.slice())
            {
               stBaseEnergy.a_4159(x - 42,y - 42 + 64,20,false);
            }
         }
      }
      
      protected function addShield(stFieldGrid:a_3491) : Boolean
      {
         if(stFieldGrid != null && 0 == stFieldGrid.m_iFieldGridType)
         {
            stFieldGrid.m_iFieldGridType = 5;
         }
         if(m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.GetGameMoveMap())
         {
            m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.GetGameMoveMap().AddMoveDisplayObject(this,m_stCurrentFieldGrid.m_iXGridNo,m_stCurrentFieldGrid.m_iYGridNo);
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
         if(stFieldGrid != null && stFieldGrid.m_iFieldGridType == 5)
         {
            stFieldGrid.m_iFieldGridType = 0;
         }
         if(m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.GetGameMoveMap())
         {
            m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.GetGameMoveMap().RemoveMoveDisplayObject(this);
         }
         return true;
      }
      
      override public function a_4213() : Boolean
      {
         return false;
      }
      
      override public function a_4212() : Boolean
      {
         return false;
      }
   }
}

