package com.aurora.ui.maogoutd.resource.defender.SnakeYear.goldLightBader
{
   import a_4718.b_182;
   import a_4728.a_1778;
   import a_4729.a_1789;
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.defender.SnakeYear.goldLightBader.effect.DarkSkillTopEffect;
   import com.aurora.ui.maogoutd.resource.defender.SnakeYear.goldLightBader.effect.FinalKillBottomEffect;
   import com.aurora.ui.maogoutd.resource.defender.SnakeYear.goldLightBader.effect.FinalKillTopEffect;
   import com.aurora.ui.maogoutd.resource.defender.SnakeYear.goldLightBader.effect.FiveBySevenBombEffect;
   import com.aurora.ui.maogoutd.resource.defender.SnakeYear.goldLightBader.effect.SevenBySevenBombEffect;
   import com.aurora.ui.maogoutd.resource.defender.a_3953;
   import com.aurora.ui.maogoutd.resource.effect.a_4108;
   import flash.display.FrameLabel;
   
   public class GoldLightBaderFinalAttackFighter extends a_3953
   {
      
      private static const CONTINUE_TIME:int = 2.1 * 20;
      
      private static const HURT_TICKS:Array = [5,9,12,16,19,22,27,30,34,37];
      
      private var m_BottomEffect:a_4108;
      
      private var m_TopEffect:a_4108;
      
      private var m_DarkSkillTopEffect:a_4108;
      
      private var m_FinalKillTopEffect:a_4108;
      
      private var m_FinalKillBottomEffect:a_4108;
      
      private var m_ShotTick:int;
      
      private var m_HurtIndex:int;
      
      private var a_1573:int = 1;
      
      private var m_iHolyRangeX:int = 2;
      
      private var m_iHolyRangeY:int = 3;
      
      private var m_HuttMultiplier:Number;
      
      public function GoldLightBaderFinalAttackFighter()
      {
         super();
         a_1095 = GoldLightBaderDefence.DEFENSE_PRICE;
         a_1313 = true;
         a_1310 = 14;
      }
      
      public static function a_3926() : a_3953
      {
         return PoolManager.getInstance().CheckOutOne(GoldLightBaderFinalAttackFighter,GoldLightBaderFinalAttackFighterMovie) as GoldLightBaderFinalAttackFighter;
      }
      
      override public function a_1797(stFieldGrid:a_3491) : Boolean
      {
         super.a_1797(stFieldGrid);
         tagCom.AddTag(30034);
         if(m_bServerIssued)
         {
            a_1311 = GoldLightBaderDefence.a_3965(a_1094);
            a_1309 = GoldLightBaderDefence.a_3966(m_iSkillDegree);
            this.m_ShotTick = this.m_HurtIndex = 0;
            this.RefreshHolyMultiplier();
            if(this.m_HuttMultiplier > 1)
            {
               this.AddDarkSkillTopEffect();
            }
            a_1789.getInstance().removeEventListener("DefenseCardCountChange",this.a_3483);
            a_1789.getInstance().addEventListener("DefenseCardCountChange",this.a_3483);
         }
         return true;
      }
      
      override protected function a_3964() : int
      {
         return GoldLightBaderDefence.a_3964(m_iSkillDegree);
      }
      
      override public function a_3957(iCurrentTime:int) : void
      {
         if(iCurrentTime % 2 == 0)
         {
            if(a_1278 == null)
            {
               a_1278 = "待机";
            }
            super.a_3957(iCurrentTime);
         }
      }
      
      override public function a_3954(iCurrentTime:int) : Boolean
      {
         var elapsed:int = 0;
         if(this.m_ShotTick > 0)
         {
            --this.m_ShotTick;
            elapsed = CONTINUE_TIME - this.m_ShotTick;
            if(this.m_HurtIndex < HURT_TICKS.length && elapsed == HURT_TICKS[this.m_HurtIndex])
            {
               this.BurningInjury();
               ++this.m_HurtIndex;
            }
            if(this.m_ShotTick == 0)
            {
               if(this.m_BottomEffect)
               {
                  this.m_BottomEffect.stop();
                  this.m_BottomEffect.visible = false;
               }
               if(this.m_TopEffect)
               {
                  this.m_TopEffect.stop();
                  this.m_TopEffect.visible = false;
               }
               return false;
            }
            return false;
         }
         if(iCurrentTime > m_iPlaceTimeIntervals + a_1308 && iCurrentTime >= a_1321 + a_1309)
         {
            a_1321 = iCurrentTime;
            a_1307 = 1;
            a_1275 = 0;
            gotoAndStop((a_1276[1] as FrameLabel).frame);
         }
         if(iCurrentTime - a_1321 == a_1310)
         {
            this.AddBottomEffect();
            this.AddTopEffect();
            this.m_HurtIndex = 0;
            this.m_ShotTick = CONTINUE_TIME;
         }
         return true;
      }
      
      private function AddBottomEffect() : void
      {
         if(!a_1334)
         {
            return;
         }
         if(!this.m_BottomEffect)
         {
            this.m_BottomEffect = FinalKillBottomEffect.a_3926();
            this.m_BottomEffect.a_1797(false);
            this.m_BottomEffect.x = (a_1334.m_iXGridNo + 0.5) * a_3491.a_1080;
            this.m_BottomEffect.y = (a_1334.m_iYGridNo + 0.5) * a_3491.a_1081;
            a_1334.m_stCurrentBattbleFieldView.AddToBattleView(this.m_BottomEffect,BattleLayerDefine.EFFECTS_BASE_TYPE,a_1334);
            if(a_1334.m_stCurrentBattbleFieldView.GetGameMoveMap())
            {
               a_1334.m_stCurrentBattbleFieldView.GetGameMoveMap().AddMoveDisplayObject(this.m_BottomEffect,a_1334.m_iXGridNo,a_1334.m_iYGridNo);
            }
         }
         this.m_BottomEffect.visible = true;
         this.m_BottomEffect.gotoAndStop(1);
         this.m_BottomEffect.play();
      }
      
      private function RemoveBottomEffect() : void
      {
         if(Boolean(a_1334) && Boolean(this.m_BottomEffect))
         {
            if(a_1334.m_stCurrentBattbleFieldView.GetGameMoveMap())
            {
               a_1334.m_stCurrentBattbleFieldView.GetGameMoveMap().RemoveMoveDisplayObject(this.m_BottomEffect);
            }
            this.m_BottomEffect.a_3940();
            this.m_BottomEffect = null;
         }
      }
      
      private function AddTopEffect() : void
      {
         if(!a_1334)
         {
            return;
         }
         if(!this.m_TopEffect)
         {
            this.m_TopEffect = FinalKillTopEffect.a_3926();
            this.m_TopEffect.a_1797(false);
            this.m_TopEffect.x = (a_1334.m_iXGridNo + 0.5) * a_3491.a_1080;
            this.m_TopEffect.y = (a_1334.m_iYGridNo + 0.5) * a_3491.a_1081;
            a_1334.m_stCurrentBattbleFieldView.AddToBattleView(this.m_TopEffect,BattleLayerDefine.EFFECTS_TOP_TYPE,a_1334);
            if(a_1334.m_stCurrentBattbleFieldView.GetGameMoveMap())
            {
               a_1334.m_stCurrentBattbleFieldView.GetGameMoveMap().AddMoveDisplayObject(this.m_TopEffect,a_1334.m_iXGridNo,a_1334.m_iYGridNo);
            }
         }
         this.m_TopEffect.visible = true;
         this.m_TopEffect.gotoAndStop(1);
         this.m_TopEffect.play();
      }
      
      private function RemoveTopEffect() : void
      {
         if(Boolean(a_1334) && Boolean(this.m_TopEffect))
         {
            if(a_1334.m_stCurrentBattbleFieldView.GetGameMoveMap())
            {
               a_1334.m_stCurrentBattbleFieldView.GetGameMoveMap().RemoveMoveDisplayObject(this.m_TopEffect);
            }
            this.m_TopEffect.a_3940();
            this.m_TopEffect = null;
         }
      }
      
      public function BurningInjury() : void
      {
         var stTargetFieldGrid:a_3491 = null;
         var xIndex:int = 0;
         var arrMoveIntruder:Array = null;
         var len:int = 0;
         var i:int = 0;
         var intruder:a_4206 = null;
         var lifeBefore:int = 0;
         if(!a_1334)
         {
            return;
         }
         var xStart:int = Math.max(a_1334.m_iXGridNo - this.m_iHolyRangeX,0);
         var xEnd:int = Math.min(a_1334.m_iXGridNo + this.m_iHolyRangeX,BattleFieldView.a_1011 - 1);
         var yStart:int = Math.max(a_1334.m_iYGridNo - this.m_iHolyRangeY,0);
         var yEnd:int = Math.min(a_1334.m_iYGridNo + this.m_iHolyRangeY,BattleFieldView.a_1012 - 1);
         var tickDmg:int = a_1311 * this.m_HuttMultiplier;
         for(var yIndex:int = yStart; yIndex <= yEnd; yIndex++)
         {
            for(xIndex = xStart; xIndex <= xEnd; xIndex++)
            {
               stTargetFieldGrid = a_1334.m_stCurrentBattbleFieldView.a_3438(xIndex,yIndex);
               if(stTargetFieldGrid)
               {
                  arrMoveIntruder = stTargetFieldGrid.IntruderArray;
                  len = int(arrMoveIntruder.length);
                  for(i = 0; i < len; i++)
                  {
                     intruder = arrMoveIntruder[i];
                     if(!(!intruder || intruder.iLifeValue <= 0 || !intruder.visible))
                     {
                        if(BattleFieldView.m_UnPopularMouse.indexOf(intruder.m_stMoveIntruderTypeID) == -1)
                        {
                           if(this.a_1573 > 0)
                           {
                              intruder.a_4208(b_182.a_432,this.a_1573);
                           }
                           lifeBefore = intruder.iLifeValue;
                           intruder.a_3969(tickDmg);
                           if(intruder.iLifeValue <= 0 && !intruder.IsBossIntruder && !intruder.IsWaterIntruder && Boolean(intruder.parent))
                           {
                              intruder.ShowBoomDieEffect();
                              intruder.a_3432();
                           }
                        }
                     }
                  }
               }
            }
         }
      }
      
      private function RefreshHolyMultiplier() : void
      {
         if(!a_1334)
         {
            this.m_HuttMultiplier = 1;
            return;
         }
         this.m_HuttMultiplier = GoldLightBaderDefence.GetFinalLightBaderHolyMultiplier(a_1334);
      }
      
      private function a_3483(stDataEvent:a_1778) : void
      {
         var iDefenseTypeID:int = int(stDataEvent.dataObject[0]);
         if(iDefenseTypeID == 286400570 || iDefenseTypeID == 286400571 || iDefenseTypeID == 286400572 || iDefenseTypeID == 286400573)
         {
            this.RefreshHolyMultiplier();
            if(this.m_HuttMultiplier > 1)
            {
               this.AddDarkSkillTopEffect();
            }
            else
            {
               this.RemoveDarkSkillTopEffect();
            }
         }
      }
      
      private function AddDarkSkillTopEffect() : void
      {
         if(!a_1334)
         {
            return;
         }
         if(!this.m_DarkSkillTopEffect)
         {
            this.m_DarkSkillTopEffect = DarkSkillTopEffect.a_3926();
            this.m_DarkSkillTopEffect.a_1797(false);
            this.m_DarkSkillTopEffect.x = this.x + (a_1283 ? -53 : 53);
            this.m_DarkSkillTopEffect.y = this.y;
            a_1334.m_stCurrentBattbleFieldView.AddToBattleView(this.m_DarkSkillTopEffect,BattleLayerDefine.EFFECT_LAYER_TOP_TYPE,a_1334);
            if(a_1334.m_stCurrentBattbleFieldView.GetGameMoveMap())
            {
               a_1334.m_stCurrentBattbleFieldView.GetGameMoveMap().AddMoveDisplayObject(this.m_DarkSkillTopEffect,a_1334.m_iXGridNo,a_1334.m_iYGridNo);
            }
            this.m_DarkSkillTopEffect.play();
         }
      }
      
      private function RemoveDarkSkillTopEffect() : void
      {
         if(Boolean(a_1334) && Boolean(this.m_DarkSkillTopEffect))
         {
            if(a_1334.m_stCurrentBattbleFieldView.GetGameMoveMap())
            {
               a_1334.m_stCurrentBattbleFieldView.GetGameMoveMap().RemoveMoveDisplayObject(this.m_DarkSkillTopEffect);
            }
            this.m_DarkSkillTopEffect.ShowPlayAnimation(2,2);
            this.m_DarkSkillTopEffect = null;
         }
      }
      
      override public function SpecialSkillCallBack(... args) : void
      {
         if(args[0] == 1)
         {
            this.TriggerBoomSkill();
         }
      }
      
      private function TriggerBoomSkill() : void
      {
         var stTargetFieldGrid:a_3491 = null;
         var xIndex:int = 0;
         var arrMoveIntruder:Array = null;
         var len:int = 0;
         var i:int = 0;
         var intruder:a_4206 = null;
         if(!a_1334)
         {
            return;
         }
         var bf:BattleFieldView = a_1334.m_stCurrentBattbleFieldView;
         var supreme:Boolean = GoldLightBaderDefence.HasSupremeDarkGod(a_1334);
         var boomRangeX:int = supreme ? 3 : this.m_iHolyRangeX;
         var boomRangeY:int = supreme ? 3 : this.m_iHolyRangeY;
         var eliteDmg:int = supreme ? 3000 : 2000;
         this.addBoomEffect(supreme);
         var xStart:int = Math.max(a_1334.m_iXGridNo - boomRangeX,0);
         var xEnd:int = Math.min(a_1334.m_iXGridNo + boomRangeX,BattleFieldView.a_1011 - 1);
         var yStart:int = Math.max(a_1334.m_iYGridNo - boomRangeY,0);
         var yEnd:int = Math.min(a_1334.m_iYGridNo + boomRangeY,BattleFieldView.a_1012 - 1);
         for(var yIndex:int = yStart; yIndex <= yEnd; yIndex++)
         {
            for(xIndex = xStart; xIndex <= xEnd; xIndex++)
            {
               stTargetFieldGrid = bf.a_3438(xIndex,yIndex);
               if(stTargetFieldGrid)
               {
                  arrMoveIntruder = stTargetFieldGrid.IntruderArray;
                  len = int(arrMoveIntruder.length);
                  for(i = 0; i < len; i++)
                  {
                     intruder = arrMoveIntruder[i];
                     if(!(!intruder || intruder.iLifeValue <= 0 || !intruder.visible))
                     {
                        if(BattleFieldView.m_UnPopularMouse.indexOf(intruder.m_stMoveIntruderTypeID) == -1)
                        {
                           if(intruder.IsElite)
                           {
                              intruder.a_3969(eliteDmg);
                           }
                           else
                           {
                              intruder.a_4210();
                           }
                        }
                     }
                  }
               }
            }
         }
         if(!this.m_TopEffect)
         {
            this.m_TopEffect = FinalKillTopEffect.a_3926();
            this.m_TopEffect.a_1797(false);
            this.m_TopEffect.x = (a_1334.m_iXGridNo + 0.5) * a_3491.a_1080;
            this.m_TopEffect.y = (a_1334.m_iYGridNo + 0.5) * a_3491.a_1081;
            a_1334.m_stCurrentBattbleFieldView.AddToBattleView(this.m_TopEffect,BattleLayerDefine.EFFECTS_BASE_TYPE,a_1334);
            if(a_1334.m_stCurrentBattbleFieldView.GetGameMoveMap())
            {
               a_1334.m_stCurrentBattbleFieldView.GetGameMoveMap().AddMoveDisplayObject(this.m_TopEffect,a_1334.m_iXGridNo,a_1334.m_iYGridNo);
            }
         }
         this.m_TopEffect.visible = true;
         this.m_TopEffect.gotoAndStop(1);
         this.m_TopEffect.play();
      }
      
      private function addBoomEffect(supremeDarkGod:Boolean) : void
      {
         var booEffect:a_4108 = null;
         if(!a_1334)
         {
            return;
         }
         booEffect = supremeDarkGod ? SevenBySevenBombEffect.a_3926() : FiveBySevenBombEffect.a_3926();
         booEffect.a_1797(false);
         booEffect.x = (a_1334.m_iXGridNo + 0.5) * a_3491.a_1080;
         booEffect.y = (a_1334.m_iYGridNo + 0.5) * a_3491.a_1081;
         a_1334.m_stCurrentBattbleFieldView.AddToBattleView(booEffect,BattleLayerDefine.EFFECTS_TOP_TYPE,a_1334);
         booEffect.play();
         this.AddFinalKillEffects();
      }
      
      private function AddFinalKillEffects() : void
      {
         if(!a_1334)
         {
            return;
         }
         if(!this.m_FinalKillBottomEffect)
         {
            this.m_FinalKillBottomEffect = FinalKillBottomEffect.a_3926();
            this.m_FinalKillBottomEffect.a_1797(false);
            this.m_FinalKillBottomEffect.x = (a_1334.m_iXGridNo + 0.5) * a_3491.a_1080;
            this.m_FinalKillBottomEffect.y = (a_1334.m_iYGridNo + 0.5) * a_3491.a_1081;
            a_1334.m_stCurrentBattbleFieldView.AddToBattleView(this.m_FinalKillBottomEffect,BattleLayerDefine.EFFECTS_BASE_TYPE,a_1334);
         }
         this.m_FinalKillBottomEffect.visible = true;
         this.m_FinalKillBottomEffect.gotoAndStop(1);
         this.m_FinalKillBottomEffect.play();
         if(!this.m_FinalKillTopEffect)
         {
            this.m_FinalKillTopEffect = FinalKillTopEffect.a_3926();
            this.m_FinalKillTopEffect.a_1797(false);
            this.m_FinalKillTopEffect.x = (a_1334.m_iXGridNo + 0.5) * a_3491.a_1080;
            this.m_FinalKillTopEffect.y = (a_1334.m_iYGridNo + 0.5) * a_3491.a_1081;
            a_1334.m_stCurrentBattbleFieldView.AddToBattleView(this.m_FinalKillTopEffect,BattleLayerDefine.EFFECTS_TOP_TYPE,a_1334);
         }
         this.m_FinalKillTopEffect.visible = true;
         this.m_FinalKillTopEffect.gotoAndStop(1);
         this.m_FinalKillTopEffect.play();
      }
      
      private function RemoveFinalKillEffects() : void
      {
         if(Boolean(a_1334) && Boolean(this.m_FinalKillBottomEffect))
         {
            this.m_FinalKillBottomEffect.a_3940();
            this.m_FinalKillBottomEffect = null;
         }
         if(Boolean(a_1334) && Boolean(this.m_FinalKillTopEffect))
         {
            this.m_FinalKillTopEffect.a_3940();
            this.m_FinalKillTopEffect = null;
         }
      }
      
      override public function a_3940() : Boolean
      {
         this.RemoveBottomEffect();
         this.RemoveTopEffect();
         this.RemoveFinalKillEffects();
         this.RemoveDarkSkillTopEffect();
         a_1789.getInstance().removeEventListener("DefenseCardCountChange",this.a_3483);
         super.a_3940();
         return true;
      }
      
      override protected function a_3955() : Number
      {
         return 0.9 * width;
      }
      
      override protected function a_3956() : Number
      {
         return 0.3 * height + 25;
      }
      
      override protected function a_3966() : int
      {
         return 5 * m_iSkillDegree;
      }
   }
}

