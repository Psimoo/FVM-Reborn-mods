package com.aurora.ui.maogoutd.resource.defender.CattleYear.FoodBox
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.avatar.a_3924;
   import com.aurora.ui.maogoutd.resource.defender.AttackBuffManager;
   import com.aurora.ui.maogoutd.resource.defender.a_3953;
   
   public class FoodBoxBaseAttackFighter extends a_3953
   {
      
      private var m_AttackBufRate:Number;
      
      private var m_AttackBuffName:String;
      
      public function FoodBoxBaseAttackFighter()
      {
         super();
         a_1095 = FoodBoxDefence.DEFENSE_PRICE;
         a_1313 = true;
         a_1310 = 10;
         a_1317 = 3;
         a_1333 = true;
      }
      
      public static function a_3926() : a_3953
      {
         return PoolManager.getInstance().CheckOutOne(FoodBoxBaseAttackFighter) as FoodBoxBaseAttackFighter;
      }
      
      override protected function getBindMovie() : Class
      {
         return FoodBoxBaseAttackFighterMovie;
      }
      
      override public function a_1797(stFieldGrid:a_3491) : Boolean
      {
         super.a_1797(stFieldGrid);
         canReceiveAttackBuff = false;
         if(m_bServerIssued)
         {
            a_1339 = FoodBoxDefence.GetCardLifeByStarDegree(a_1094);
            if(a_1336)
            {
               a_1338 = 10;
               a_1337 = -11;
               a_1336.y += 2;
               a_1336.x += 15;
            }
            else
            {
               a_1338 = 12;
               a_1337 = -14;
            }
            this.m_AttackBuffName = this.a_3512() + "_" + m_iDefenseGlobalID;
            this.m_AttackBufRate = FoodBoxDefence.a_3965(a_1094);
         }
         return true;
      }
      
      override protected function a_3964() : int
      {
         return FoodBoxDefence.a_3964(m_iSkillDegree);
      }
      
      override public function a_3969(iRduceLifeValue:int) : Boolean
      {
         super.a_3969(iRduceLifeValue);
         return true;
      }
      
      override public function a_3954(iCurrentTime:int) : Boolean
      {
         AttackBuffManager.instance.UpdateBuffRange(this.m_AttackBuffName,stFieldGrid,1,1,this.FilterTarget,this.ApplyBuffToTarget);
         return true;
      }
      
      private function FilterTarget(fighter:a_3953) : Boolean
      {
         if(!fighter)
         {
            return false;
         }
         if(fighter is a_3924)
         {
            return false;
         }
         if(!fighter.canReceiveAttackBuff)
         {
            return false;
         }
         return true;
      }
      
      private function ApplyBuffToTarget(sourceID:String, target:a_3953) : void
      {
         if(!target)
         {
            return;
         }
         target.AddAttackBuffFromSource(sourceID,this.m_AttackBufRate);
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
      
      override public function a_3940() : Boolean
      {
         if(m_bServerIssued)
         {
            AttackBuffManager.instance.RemoveBuffBySource(this.m_AttackBuffName);
         }
         super.a_3940();
         a_1338 = 0;
         a_1337 = 0;
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

