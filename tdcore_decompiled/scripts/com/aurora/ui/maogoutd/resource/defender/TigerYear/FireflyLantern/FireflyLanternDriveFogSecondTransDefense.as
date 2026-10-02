package com.aurora.ui.maogoutd.resource.defender.TigerYear.FireflyLantern
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.defender.ProduceFireBuffManager;
   import com.aurora.ui.maogoutd.resource.defender.RabbitYear.YanYanRabbit.YanYanRabbitAddFireBuff;
   import com.aurora.ui.maogoutd.resource.defender.a_3962;
   import com.aurora.ui.maogoutd.resource.defender.a_3971;
   import com.aurora.ui.maogoutd.resource.defender.a_3975;
   import flash.utils.Dictionary;
   
   public class FireflyLanternDriveFogSecondTransDefense extends a_3971
   {
      
      private static var s_dicAllowedDefenseType:Dictionary;
      
      private static const PRODUCE_FIRE_RANGE:int = 1;
      
      private var m_EnergyRate:Number;
      
      private var m_isAlive:Boolean = false;
      
      private var m_CanReBirth:Boolean = false;
      
      private var m_produceFireSourceID:String = "";
      
      private var m_arrHurtMouseGlobalID:Array = new Array();
      
      private var m_hurtPower:int;
      
      public function FireflyLanternDriveFogSecondTransDefense()
      {
         super();
         a_1095 = FireflyDefine.DEFENSE_PRICE;
         a_1344 = 3;
      }
      
      public static function a_3926() : a_3971
      {
         return PoolManager.getInstance().CheckOutOne(FireflyLanternDriveFogSecondTransDefense) as FireflyLanternDriveFogSecondTransDefense;
      }
      
      private static function IsAllowedDefenseType(typeId:int) : Boolean
      {
         var id:int = 0;
         if(s_dicAllowedDefenseType == null)
         {
            s_dicAllowedDefenseType = new Dictionary();
            for each(id in BattleFieldView.MS_ALLOWED_DEFENSE_TYPE_IDS)
            {
               s_dicAllowedDefenseType[id] = true;
            }
         }
         return s_dicAllowedDefenseType[typeId] == true;
      }
      
      override protected function getBindMovie() : Class
      {
         return FireflyLanternDriveFogSecondTransDefenseMovie;
      }
      
      override public function a_1797(stFieldGrid:a_3491) : Boolean
      {
         super.a_1797(stFieldGrid);
         gotoAndStop(13);
         this.m_isAlive = this.m_CanReBirth = false;
         if(m_bServerIssued && Boolean(stFieldGrid))
         {
            this.m_EnergyRate = 1.3;
            if(this.m_produceFireSourceID != "")
            {
               ProduceFireBuffManager.instance.RemoveBuffBySource(this.m_produceFireSourceID,this.OnOutOfRange);
            }
            this.m_produceFireSourceID = "FireflySecondProduceFire_" + m_iDefenseGlobalID;
            stFieldGrid.m_stCurrentBattbleFieldView.a_3462();
            this.m_arrHurtMouseGlobalID.length = 0;
            this.m_hurtPower = FireflyDefine.a_3966(m_iSkillDegree);
            a_1339 = 150;
            this.m_isAlive = true;
            this.m_CanReBirth = !Boolean(tagCom.HasTag(30037));
         }
         return true;
      }
      
      override protected function a_3964() : int
      {
         return FireflyDefine.a_3965(a_1094);
      }
      
      override public function a_3969(iRduceLifeValue:int) : Boolean
      {
         super.a_3969(iRduceLifeValue);
         return true;
      }
      
      override public function a_3957(iCurrentTime:int) : void
      {
         this.RealeaseSkill(stFieldGrid);
         if(Boolean(stFieldGrid) && this.m_produceFireSourceID != "")
         {
            ProduceFireBuffManager.instance.UpdateBuffRange(this.m_produceFireSourceID,stFieldGrid,PRODUCE_FIRE_RANGE,PRODUCE_FIRE_RANGE,this.FilterTarget,this.ApplyBuffToTarget,this.OnOutOfRange,true);
         }
         if(iCurrentTime % 3 == 0)
         {
            nextFrame();
            if(a_1273 == a_1274 || a_1278 != null)
            {
               gotoAndStop(1);
            }
            ShowPlayOther(iCurrentTime);
         }
      }
      
      private function RealeaseSkill(stFieldGrid:a_3491) : void
      {
         var xIndex:int = 0;
         var arrMoveIntruder:Array = null;
         var stMoveIntruder:a_4206 = null;
         if(stFieldGrid == null)
         {
            return;
         }
         var xStart:int = Math.max(stFieldGrid.m_iXGridNo - 1,0);
         var xEnd:int = Math.min(stFieldGrid.m_iXGridNo + 1,BattleFieldView.a_1011 - 1);
         var yStart:int = Math.max(stFieldGrid.m_iYGridNo - 1,0);
         var yEnd:int = Math.min(stFieldGrid.m_iYGridNo + 1,BattleFieldView.a_1012 - 1);
         var stFieldGridVector:Array = stFieldGrid.m_stCurrentBattbleFieldView.stFieldGridsVector;
         for(var yIndex:int = yStart; yIndex <= yEnd; yIndex++)
         {
            for(xIndex = xStart; xIndex <= xEnd; xIndex++)
            {
               arrMoveIntruder = stFieldGridVector[yIndex][xIndex].IntruderArray;
               for each(stMoveIntruder in arrMoveIntruder)
               {
                  if(!stMoveIntruder.isCannotSeeByFighter && !stMoveIntruder.m_isHurtByFireFly && stMoveIntruder.m_stCurrentFieldGrid != null && this.m_arrHurtMouseGlobalID.indexOf(stMoveIntruder.globalMoveFighterID) == -1)
                  {
                     stMoveIntruder.a_3969(this.m_hurtPower);
                     stMoveIntruder.m_isHurtByFireFly = true;
                     this.m_arrHurtMouseGlobalID.push(stMoveIntruder.globalMoveFighterID);
                  }
               }
            }
         }
      }
      
      private function FilterTarget(defense:a_3962) : Boolean
      {
         if(!defense || !this.IsProduceFireTarget(defense))
         {
            return false;
         }
         if(!IsAllowedDefenseType(defense.a_3512()))
         {
            return false;
         }
         return this.GetTargetEnergyRate(defense) < this.m_EnergyRate;
      }
      
      private function ApplyBuffToTarget(sourceID:String, target:a_3962) : void
      {
         if(!target || !this.IsProduceFireTarget(target))
         {
            return;
         }
         if(!IsAllowedDefenseType(target.a_3512()))
         {
            return;
         }
         if(this.GetTargetEnergyRate(target) > this.m_EnergyRate)
         {
            return;
         }
         this.SetTargetEnergyRate(target,this.m_EnergyRate);
         var grid:a_3491 = target.stFieldGrid;
         if(grid != null)
         {
            this.addEffect(grid,target);
         }
      }
      
      private function IsProduceFireTarget(defense:a_3962) : Boolean
      {
         return defense is a_3971 || defense is a_3975;
      }
      
      private function GetTargetEnergyRate(defense:a_3962) : Number
      {
         var flower:a_3971 = defense as a_3971;
         if(flower)
         {
            return flower.EnergyRate;
         }
         return (defense as a_3975).EnergyRate;
      }
      
      private function SetTargetEnergyRate(defense:a_3962, rate:Number) : void
      {
         var flower:a_3971 = defense as a_3971;
         if(flower)
         {
            flower.EnergyRate = rate;
         }
         else
         {
            (defense as a_3975).EnergyRate = rate;
         }
      }
      
      private function addEffect(stFieldGrid:a_3491, stBaseDefense:a_3962) : void
      {
         var stEffect:YanYanRabbitAddFireBuff = null;
         if(stBaseDefense.m_AddFireBuff != null)
         {
            return;
         }
         if(stFieldGrid != null)
         {
            stEffect = YanYanRabbitAddFireBuff.a_3926();
            stEffect.a_1797(stBaseDefense.IsReversed());
            if(!stBaseDefense.IsReversed())
            {
               stEffect.x = stFieldGrid.m_iXGridNo * a_3491.a_1080 - 5 + 8;
            }
            else
            {
               stEffect.x = BattleFieldView.a_1013 - (stFieldGrid.m_iXGridNo * a_3491.a_1080 - 5 + 8);
            }
            stEffect.y = stFieldGrid.m_iYGridNo * a_3491.a_1081 + 48;
            stFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(stEffect,BattleLayerDefine.EFFECTS_BASE_TYPE,stFieldGrid);
            if(stFieldGrid.m_stCurrentBattbleFieldView.GetGameMoveMap())
            {
               stFieldGrid.m_stCurrentBattbleFieldView.GetGameMoveMap().AddMoveDisplayObject(stEffect,stFieldGrid.m_iXGridNo,stFieldGrid.m_iYGridNo);
            }
            stEffect.play();
            stBaseDefense.m_AddFireBuff = stEffect;
         }
      }
      
      private function OnOutOfRange(defense:a_3962) : void
      {
         if(!defense || !this.IsProduceFireTarget(defense))
         {
            return;
         }
         if(this.GetTargetEnergyRate(defense) > this.m_EnergyRate)
         {
            return;
         }
         this.SetTargetEnergyRate(defense,1);
         if(defense.m_AddFireBuff != null)
         {
            defense.m_AddFireBuff.a_3940();
            defense.m_AddFireBuff = null;
         }
      }
      
      private function JudgeEateDieSkill(gride:a_3491) : void
      {
         var stMoveIntruder:a_4206 = null;
         if(m_iBeOtherPlaced || !gride || !this.m_CanReBirth)
         {
            return;
         }
         var arrMoveIntruder:Array = gride.IntruderArray;
         var isEateDie:Boolean = false;
         for each(stMoveIntruder in arrMoveIntruder)
         {
            if(stMoveIntruder.isEatingDefense)
            {
               isEateDie = true;
               break;
            }
         }
         if(isEateDie)
         {
            FireflyLanternCopyCardSkill.CopyCardSkill(a_1098,1,gride);
         }
      }
      
      override public function a_3940() : Boolean
      {
         if(this.m_produceFireSourceID != "")
         {
            ProduceFireBuffManager.instance.RemoveBuffBySource(this.m_produceFireSourceID,this.OnOutOfRange);
            this.m_produceFireSourceID = "";
         }
         var stTempFieldGrid:a_3491 = a_1334;
         this.m_arrHurtMouseGlobalID.length = 0;
         super.a_3940();
         if(this.m_isAlive && Boolean(stTempFieldGrid))
         {
            stTempFieldGrid.m_stCurrentBattbleFieldView.a_3462();
            this.JudgeEateDieSkill(stTempFieldGrid);
         }
         stTempFieldGrid = null;
         this.m_isAlive = this.m_CanReBirth = false;
         return true;
      }
   }
}

