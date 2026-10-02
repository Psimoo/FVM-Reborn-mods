package com.aurora.ui.maogoutd.resource.defender.RabbitYear.TimeMachine
{
   import a_4728.a_1778;
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.DefensePlaceHelper;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.defender.a_3962;
   import com.aurora.ui.maogoutd.resource.defender.a_3976;
   import flash.display.FrameLabel;
   import flash.events.Event;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   
   public class TimeMachineSeocndDefense extends a_3976
   {
      
      private var m_stTiemr:Timer;
      
      private var m_iAppearedTime:int;
      
      private var m_UpGradeLeve:int;
      
      private var m_Range:int;
      
      public function TimeMachineSeocndDefense()
      {
         a_1271 = true;
         super();
         a_1338 = -30;
         a_1095 = TimeMachineDefence.DEFENSE_PRICE;
         this.m_stTiemr = new Timer(100);
      }
      
      public static function a_3926() : TimeMachineSeocndDefense
      {
         return PoolManager.getInstance().CheckOutOne(TimeMachineSeocndDefense) as TimeMachineSeocndDefense;
      }
      
      override protected function getBindMovie() : Class
      {
         return TimeMachineSeocndDefenseMovie;
      }
      
      override public function a_1797(stFieldGrid:a_3491) : Boolean
      {
         this.m_stTiemr.addEventListener(TimerEvent.TIMER,this.a_4003);
         this.m_iAppearedTime = -10;
         this.m_UpGradeLeve = 0;
         this.m_Range = 1;
         this.visible = true;
         gotoAndStop(1);
         this.play();
         return super.a_1797(stFieldGrid);
      }
      
      override protected function a_3964() : int
      {
         return TimeMachineDefence.a_3964(a_1094);
      }
      
      override public function a_3940() : Boolean
      {
         this.m_stTiemr.removeEventListener(TimerEvent.TIMER,this.a_4003);
         this.m_stTiemr.stop();
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
      
      private function a_4003(a_4730:Event) : void
      {
         var randomNum:int = 0;
         var FrameIndex:int = 0;
         var stBaseDefense:a_3962 = null;
         var newStarDegree:int = 0;
         var skilled:Boolean = false;
         var xStart:int = 0;
         var xEnd:int = 0;
         var yStart:int = 0;
         var yEnd:int = 0;
         var stFieldGridVector:Array = null;
         var yIndex:int = 0;
         var xIndex:int = 0;
         var tempFieldGrid:a_3491 = null;
         var arrUpgradeDefense:Array = null;
         var isUpGradeEffectPlayed:Boolean = false;
         var isLowGradeEffectPlayed:Boolean = false;
         var stAurDataEvent:a_1778 = null;
         if(this.m_iAppearedTime == -10)
         {
            this.m_iAppearedTime = 0;
            randomNum = BattleFieldView.m_stUpGradeRandomSeed.nextInt(100) + 1;
            if(randomNum <= 35)
            {
               this.m_UpGradeLeve = 1;
            }
            else if(randomNum <= 55)
            {
               this.m_UpGradeLeve = 2;
            }
            else if(randomNum <= 60)
            {
               this.m_UpGradeLeve = 3;
            }
            else if(randomNum <= 80)
            {
               this.m_UpGradeLeve = -1;
            }
            else if(randomNum <= 95)
            {
               this.m_UpGradeLeve = -2;
            }
            else if(randomNum <= 100)
            {
               this.m_UpGradeLeve = -3;
            }
            a_1275 = this.m_UpGradeLeve > 0 ? 1 : 2;
            gotoAndStop((a_1276[0] as FrameLabel).frame);
         }
         nextFrame();
         if(a_1273 == 20 || a_1273 == 31)
         {
            skilled = false;
            xStart = Math.max(a_1334.m_iXGridNo - this.m_Range,0);
            xEnd = Math.min(a_1334.m_iXGridNo + this.m_Range,BattleFieldView.a_1011 - 1);
            yStart = Math.max(a_1334.m_iYGridNo - this.m_Range,0);
            yEnd = Math.min(a_1334.m_iYGridNo + this.m_Range,BattleFieldView.a_1012 - 1);
            stFieldGridVector = a_1334.m_stCurrentBattbleFieldView.stFieldGridsVector;
            for(yIndex = yStart; yIndex <= yEnd; yIndex++)
            {
               for(xIndex = xStart; xIndex <= xEnd; xIndex++)
               {
                  tempFieldGrid = a_1334.m_stCurrentBattbleFieldView.a_3438(xIndex,yIndex);
                  if(tempFieldGrid != null)
                  {
                     arrUpgradeDefense = TimeMachineDefence.getUpgradeDefenseArr(tempFieldGrid);
                     isUpGradeEffectPlayed = false;
                     isLowGradeEffectPlayed = false;
                     for each(stBaseDefense in arrUpgradeDefense)
                     {
                        if(stBaseDefense != null)
                        {
                           if(this.m_UpGradeLeve > 0)
                           {
                              skilled = true;
                              if(!isUpGradeEffectPlayed)
                              {
                                 this.AddUpGradeEffect(tempFieldGrid,this.m_UpGradeLeve);
                                 isUpGradeEffectPlayed = true;
                              }
                              newStarDegree = Math.min(stBaseDefense.a_1094 + this.m_UpGradeLeve,16);
                              if(newStarDegree != stBaseDefense.a_1094 && stBaseDefense.a_1094 < 16)
                              {
                                 DefensePlaceHelper.getInstance().ReplaceDefenseAndPost(stBaseDefense,newStarDegree,-1);
                              }
                           }
                           else if(this.m_UpGradeLeve < 0)
                           {
                              skilled = true;
                              if(!isLowGradeEffectPlayed)
                              {
                                 this.AddlowGradeEffect(tempFieldGrid,this.m_UpGradeLeve);
                                 isLowGradeEffectPlayed = true;
                              }
                              newStarDegree = Math.max(stBaseDefense.a_1094 + this.m_UpGradeLeve,0);
                              if(newStarDegree != stBaseDefense.a_1094)
                              {
                                 DefensePlaceHelper.getInstance().ReplaceDefenseAndPost(stBaseDefense,newStarDegree,-1);
                              }
                           }
                        }
                     }
                  }
               }
            }
            if(Boolean(a_1334.m_stCurrentBattbleFieldView.isOwnBattleField && root) && Boolean(!skilled) && !m_iBeOtherPlaced)
            {
               stAurDataEvent = new a_1778("GameCardCoolDown");
               stAurDataEvent.dataObject = [this.a_3512(),[]];
               root.dispatchEvent(stAurDataEvent);
               m_iDieType = 5;
            }
            a_3969(this.iLifeValue);
            return;
         }
         if(a_1278 != null)
         {
            gotoAndStop((a_1276[a_1275] as FrameLabel).frame);
         }
      }
      
      private function AddlowGradeEffect(stFieldGrid:a_3491, m_Level:int) : void
      {
         var effect:lowGradeEffect = null;
         if(stFieldGrid)
         {
            effect = lowGradeEffect.a_3926();
            effect.m_Level = Math.abs(m_Level);
            effect.a_1797(false);
            effect.x = (stFieldGrid.m_iXGridNo + 0.5) * a_3491.a_1080;
            effect.y = (stFieldGrid.m_iYGridNo + 0.5) * a_3491.a_1081 + 25;
            stFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(effect,BattleLayerDefine.EFFECTS_TOP_TYPE,stFieldGrid);
            effect.play();
         }
      }
      
      private function AddUpGradeEffect(stFieldGrid:a_3491, m_Level:int) : void
      {
         var effect:UpGradeEffect = null;
         if(stFieldGrid)
         {
            effect = UpGradeEffect.a_3926();
            effect.m_Level = Math.abs(m_Level);
            effect.a_1797(false);
            effect.x = (stFieldGrid.m_iXGridNo + 0.5) * a_3491.a_1080;
            effect.y = (stFieldGrid.m_iYGridNo + 0.5) * a_3491.a_1081 + 25;
            stFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(effect,BattleLayerDefine.EFFECTS_TOP_TYPE,stFieldGrid);
            effect.play();
         }
      }
   }
}

