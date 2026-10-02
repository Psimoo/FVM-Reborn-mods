package com.aurora.ui.maogoutd.resource.defender.SnakeYear.GoldFateGoddesses
{
   import a_4728.a_1778;
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.DefensePlaceHelper;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.defender.SnakeYear.GoldFateGoddesses.Effect.GoldFateGoddessesBaseBottomEffect;
   import com.aurora.ui.maogoutd.resource.defender.SnakeYear.GoldFateGoddesses.Effect.Low.LowGradeBaseEffect;
   import com.aurora.ui.maogoutd.resource.defender.SnakeYear.GoldFateGoddesses.Effect.Up.UpGradeBaseEffect;
   import com.aurora.ui.maogoutd.resource.defender.a_3962;
   import com.aurora.ui.maogoutd.resource.defender.a_3976;
   import com.aurora.ui.maogoutd.resource.effect.a_4108;
   import flash.display.FrameLabel;
   import flash.events.Event;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   
   public class GoldFateGoddessesBaseDefense extends a_3976
   {
      
      private var m_stTiemr:Timer;
      
      private var m_iAppearedTime:int;
      
      private var m_UpGradeLeve:int;
      
      private var m_Range:int;
      
      private var m_TickTime:int;
      
      private var m_WaiteTime:int;
      
      private var GoldFateGoddessesBottomEffect:a_4108;
      
      private var m_Skilled:Boolean = false;
      
      private var stBaseDefense:a_3962;
      
      private var newStarDegree:int;
      
      private var gradeLevels:Array = [{
         "GradeLevel":1,
         "Probability":50
      },{
         "GradeLevel":2,
         "Probability":15
      },{
         "GradeLevel":3,
         "Probability":5
      },{
         "GradeLevel":4,
         "Probability":2
      },{
         "GradeLevel":-1,
         "Probability":20
      },{
         "GradeLevel":-2,
         "Probability":8
      },{
         "GradeLevel":-3,
         "Probability":0
      }];
      
      public function GoldFateGoddessesBaseDefense()
      {
         super();
         a_1095 = GoldFateGoddessesDefence.DEFENSE_PRICE;
         this.m_stTiemr = new Timer(100);
      }
      
      public static function a_3926() : GoldFateGoddessesBaseDefense
      {
         return PoolManager.getInstance().CheckOutOne(GoldFateGoddessesBaseDefense) as GoldFateGoddessesBaseDefense;
      }
      
      override protected function getBindMovie() : Class
      {
         return GoldFateGoddessesBaseDefenseMovie;
      }
      
      override public function a_1797(stFieldGrid:a_3491) : Boolean
      {
         super.a_1797(stFieldGrid);
         if(m_bServerIssued)
         {
            this.AddSnakeBottomEffect();
            this.m_stTiemr.addEventListener(TimerEvent.TIMER,this.a_4003);
            this.play();
            this.m_iAppearedTime = -10;
            this.m_UpGradeLeve = 0;
            this.m_Range = 1;
            a_1339 = 1000;
            this.m_Skilled = false;
            a_1338 = -30;
            this.m_TickTime = GoldFateGoddessesDefence.a_3966(m_iSkillDegree);
            this.m_WaiteTime = 0;
            if(stFieldGrid)
            {
               stFieldGrid.m_stCurrentBattbleFieldView.m_arrEffectArray.push(this);
            }
         }
         return true;
      }
      
      override protected function a_3964() : int
      {
         return GoldFateGoddessesDefence.a_3964(a_1094);
      }
      
      override public function a_3940() : Boolean
      {
         var stVector:Array = null;
         if(m_bServerIssued)
         {
            a_1338 = -30;
            this.m_stTiemr.removeEventListener(TimerEvent.TIMER,this.a_4003);
            this.m_stTiemr.stop();
            stVector = stFieldGrid.m_stCurrentBattbleFieldView.m_arrEffectArray;
            if(-1 != stVector.indexOf(this) && stFieldGrid != null)
            {
               stVector.splice(stVector.indexOf(this),1);
            }
            if(this.GoldFateGoddessesBottomEffect)
            {
               if(a_1334.m_stCurrentBattbleFieldView.GetGameMoveMap())
               {
                  a_1334.m_stCurrentBattbleFieldView.GetGameMoveMap().RemoveMoveDisplayObject(this.GoldFateGoddessesBottomEffect);
               }
               this.GoldFateGoddessesBottomEffect.a_3940();
               this.GoldFateGoddessesBottomEffect = null;
            }
         }
         return super.a_3940();
      }
      
      public function play() : void
      {
         this.m_stTiemr.start();
      }
      
      public function stop() : void
      {
         this.m_stTiemr.stop();
      }
      
      internal function GetUpGradeLevel(randomNum:int) : int
      {
         var item:Object = null;
         var accumulatedProbability:int = 0;
         for each(item in this.gradeLevels)
         {
            accumulatedProbability += item.Probability;
            if(randomNum <= accumulatedProbability)
            {
               return item.GradeLevel;
            }
         }
         return 0;
      }
      
      private function a_4003(a_4730:Event) : void
      {
         var stAurDataEvent:a_1778 = null;
         if(this.m_iAppearedTime == -10)
         {
            this.m_iAppearedTime = 0;
            this.m_UpGradeLeve = this.GetUpGradeLevel(BattleFieldView.m_stUpGradeRandomSeed.nextInt(100) + 1);
         }
         nextFrame();
         if(a_1273 == a_1274)
         {
            gotoAndStop((a_1276[a_1275] as FrameLabel).frame);
         }
         if(a_1273 == 11)
         {
            this.addEffectRange();
         }
         else if(a_1273 == 25)
         {
            if(a_1275 != 1)
            {
               a_1275 = 1;
               gotoAndStop((a_1276[1] as FrameLabel).frame);
               this.m_WaiteTime = 26;
            }
         }
         if(this.m_WaiteTime > 0)
         {
            --this.m_WaiteTime;
            if(this.m_WaiteTime == 3)
            {
               if(this.GoldFateGoddessesBottomEffect != null)
               {
                  this.GoldFateGoddessesBottomEffect.ShowPlayAnimation(2,2);
               }
            }
            else if(this.m_WaiteTime == 0)
            {
               if(Boolean(a_1334.m_stCurrentBattbleFieldView.isOwnBattleField && root) && Boolean(!this.m_Skilled) && !m_iBeOtherPlaced)
               {
                  stAurDataEvent = new a_1778("GameCardCoolDown");
                  stAurDataEvent.dataObject = [this.a_3512(),[]];
                  root.dispatchEvent(stAurDataEvent);
                  m_iDieType = 5;
               }
               a_3969(this.iLifeValue);
            }
         }
      }
      
      private function addEffectRange() : void
      {
         var xIndex:int = 0;
         var tempFieldGrid:a_3491 = null;
         var arrUpgradeDefense:Array = null;
         var isUpGradeEffectPlayed:Boolean = false;
         var isLowGradeEffectPlayed:Boolean = false;
         var xStart:int = Math.max(a_1334.m_iXGridNo - this.m_Range,0);
         var xEnd:int = Math.min(a_1334.m_iXGridNo + this.m_Range,BattleFieldView.a_1011 - 1);
         var yStart:int = Math.max(a_1334.m_iYGridNo - this.m_Range,0);
         var yEnd:int = Math.min(a_1334.m_iYGridNo + this.m_Range,BattleFieldView.a_1012 - 1);
         var stFieldGridVector:Array = a_1334.m_stCurrentBattbleFieldView.stFieldGridsVector;
         for(var yIndex:int = yStart; yIndex <= yEnd; yIndex++)
         {
            for(xIndex = xStart; xIndex <= xEnd; xIndex++)
            {
               tempFieldGrid = a_1334.m_stCurrentBattbleFieldView.a_3438(xIndex,yIndex);
               if(tempFieldGrid != null)
               {
                  arrUpgradeDefense = GoldFateGoddessesDefence.getUpgradeDefenseArr(tempFieldGrid);
                  isUpGradeEffectPlayed = false;
                  isLowGradeEffectPlayed = false;
                  for each(this.stBaseDefense in arrUpgradeDefense)
                  {
                     if(this.stBaseDefense != null)
                     {
                        if(this.m_UpGradeLeve > 0)
                        {
                           this.newStarDegree = Math.min(this.stBaseDefense.a_1094 + this.m_UpGradeLeve,16);
                           this.m_Skilled = true;
                           if(!isUpGradeEffectPlayed)
                           {
                              this.AddUpGradeBaseEffect(tempFieldGrid,this.m_UpGradeLeve);
                              isUpGradeEffectPlayed = true;
                           }
                           if(this.newStarDegree != this.stBaseDefense.a_1094 && this.stBaseDefense.a_1094 < 16)
                           {
                              DefensePlaceHelper.getInstance().ReplaceDefenseAndPost(this.stBaseDefense,this.newStarDegree,-1);
                           }
                        }
                        else if(this.m_UpGradeLeve < 0)
                        {
                           this.m_Skilled = true;
                           if(!isLowGradeEffectPlayed)
                           {
                              this.AddLowGradeBaseEffect(tempFieldGrid,this.m_UpGradeLeve);
                              isLowGradeEffectPlayed = true;
                           }
                           this.newStarDegree = Math.max(this.stBaseDefense.a_1094 + this.m_UpGradeLeve,0);
                           if(this.newStarDegree != this.stBaseDefense.a_1094)
                           {
                              DefensePlaceHelper.getInstance().ReplaceDefenseAndPost(this.stBaseDefense,this.newStarDegree,this.m_TickTime);
                           }
                        }
                     }
                  }
               }
            }
         }
      }
      
      private function AddLowGradeBaseEffect(stFieldGrid:a_3491, m_Level:int) : void
      {
         var effect:LowGradeBaseEffect = null;
         if(stFieldGrid)
         {
            effect = LowGradeBaseEffect.a_3926();
            effect.m_Level = Math.abs(m_Level);
            effect.a_1797(false);
            effect.x = (stFieldGrid.m_iXGridNo + 0.5) * a_3491.a_1080;
            effect.y = (stFieldGrid.m_iYGridNo + 0.5) * a_3491.a_1081 + 25;
            stFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(effect,BattleLayerDefine.EFFECTS_TOP_TYPE,stFieldGrid);
            effect.play();
         }
      }
      
      private function AddUpGradeBaseEffect(stFieldGrid:a_3491, m_Level:int) : void
      {
         var effect:UpGradeBaseEffect = null;
         if(stFieldGrid)
         {
            effect = UpGradeBaseEffect.a_3926();
            effect.m_Level = Math.abs(m_Level);
            effect.a_1797(false);
            effect.x = (stFieldGrid.m_iXGridNo + 0.5) * a_3491.a_1080;
            effect.y = (stFieldGrid.m_iYGridNo + 0.5) * a_3491.a_1081 + 25;
            stFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(effect,BattleLayerDefine.EFFECTS_TOP_TYPE,stFieldGrid);
            effect.play();
         }
      }
      
      private function AddSnakeBottomEffect() : void
      {
         if(Boolean(a_1334) && this.GoldFateGoddessesBottomEffect == null)
         {
            this.GoldFateGoddessesBottomEffect = GoldFateGoddessesBaseBottomEffect.a_3926();
            this.GoldFateGoddessesBottomEffect.a_1797(false);
            this.GoldFateGoddessesBottomEffect.x = (a_1334.m_iXGridNo + 0.5) * a_3491.a_1080;
            this.GoldFateGoddessesBottomEffect.y = (a_1334.m_iYGridNo + 0.5) * a_3491.a_1081;
            a_1334.m_stCurrentBattbleFieldView.AddToBattleView(this.GoldFateGoddessesBottomEffect,BattleLayerDefine.EFFECTS_BASE_TYPE,a_1334);
            if(a_1334.m_stCurrentBattbleFieldView.GetGameMoveMap())
            {
               a_1334.m_stCurrentBattbleFieldView.GetGameMoveMap().AddMoveDisplayObject(this.GoldFateGoddessesBottomEffect,a_1334.m_iXGridNo,a_1334.m_iYGridNo);
            }
            this.GoldFateGoddessesBottomEffect.play();
         }
      }
   }
}

