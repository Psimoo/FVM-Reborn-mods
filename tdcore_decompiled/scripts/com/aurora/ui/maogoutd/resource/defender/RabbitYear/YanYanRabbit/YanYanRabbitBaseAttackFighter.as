package com.aurora.ui.maogoutd.resource.defender.RabbitYear.YanYanRabbit
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.defender.ProduceFireBuffManager;
   import com.aurora.ui.maogoutd.resource.defender.a_3953;
   import com.aurora.ui.maogoutd.resource.defender.a_3962;
   import com.aurora.ui.maogoutd.resource.defender.a_3971;
   import com.aurora.ui.maogoutd.resource.defender.a_3975;
   import flash.utils.Dictionary;
   
   public class YanYanRabbitBaseAttackFighter extends a_3953
   {
      
      private static var s_dicAllowedDefenseType:Dictionary;
      
      private static const PRODUCE_FIRE_RANGE:int = 1;
      
      private var m_EnergyRate:Number;
      
      private var m_produceFireSourceID:String = "";
      
      public function YanYanRabbitBaseAttackFighter()
      {
         super();
         a_1095 = YanYanRabbitDefence.DEFENSE_PRICE;
         a_1313 = true;
         a_1310 = 10;
         a_1317 = 3;
         a_1337 = 0;
         a_1333 = true;
      }
      
      public static function a_3926() : a_3953
      {
         return PoolManager.getInstance().CheckOutOne(YanYanRabbitBaseAttackFighter) as YanYanRabbitBaseAttackFighter;
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
         return YanYanRabbitBaseAttackFighterMovie;
      }
      
      override public function a_1797(stFieldGrid:a_3491) : Boolean
      {
         super.a_1797(stFieldGrid);
         if(m_bServerIssued && Boolean(stFieldGrid))
         {
            this.m_EnergyRate = YanYanRabbitDefence.a_3965(a_1094);
            if(this.m_produceFireSourceID != "")
            {
               ProduceFireBuffManager.instance.RemoveBuffBySource(this.m_produceFireSourceID,this.OnOutOfRange);
            }
            this.m_produceFireSourceID = "YanYanRabbitProduceFire_" + m_iDefenseGlobalID;
         }
         return true;
      }
      
      override protected function a_3964() : int
      {
         return YanYanRabbitDefence.a_3964(m_iSkillDegree);
      }
      
      override public function a_3969(iRduceLifeValue:int) : Boolean
      {
         super.a_3969(iRduceLifeValue);
         return true;
      }
      
      override public function a_3954(iCurrentTime:int) : Boolean
      {
         if(Boolean(stFieldGrid) && this.m_produceFireSourceID != "")
         {
            ProduceFireBuffManager.instance.UpdateBuffRange(this.m_produceFireSourceID,stFieldGrid,PRODUCE_FIRE_RANGE,PRODUCE_FIRE_RANGE,this.FilterTarget,this.ApplyBuffToTarget,this.OnOutOfRange,true);
         }
         return true;
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
      
      override public function a_3940() : Boolean
      {
         if(this.m_produceFireSourceID != "")
         {
            ProduceFireBuffManager.instance.RemoveBuffBySource(this.m_produceFireSourceID,this.OnOutOfRange);
            this.m_produceFireSourceID = "";
         }
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

