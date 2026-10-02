package com.aurora.ui.maogoutd.resource.defender.HorseYear.qimenHorse
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.defender.HorseYear.qimenHorse.effect.QimenHorseBaseAttackFighterMovie;
   import com.aurora.ui.maogoutd.resource.defender.HorseYear.qimenHorse.effect.QimenHorseFirstAttackFighterMovie;
   import com.aurora.ui.maogoutd.resource.defender.HorseYear.qimenHorse.effect.QimenHorseSecondAttackFighterMovie;
   import com.aurora.ui.maogoutd.resource.defender.a_3953;
   
   public class QimenHorseBaseAttackFighter extends a_3953
   {
      
      public var trans:int = 0;
      
      private var hasAddTag:Boolean = false;
      
      public function QimenHorseBaseAttackFighter()
      {
         super();
         a_1095 = QimenHorseDefine.DEFENSE_PRICE;
         a_1313 = true;
         a_1333 = true;
      }
      
      public static function a_3926() : a_3953
      {
         var attacker:QimenHorseBaseAttackFighter = PoolManager.getInstance().CheckOutOne(QimenHorseBaseAttackFighter,QimenHorseBaseAttackFighterMovie) as QimenHorseBaseAttackFighter;
         if(attacker != null)
         {
            attacker.trans = 0;
         }
         return attacker;
      }
      
      public static function GetFreeInstance1() : a_3953
      {
         var attacker:QimenHorseBaseAttackFighter = PoolManager.getInstance().CheckOutOne(QimenHorseBaseAttackFighter,QimenHorseFirstAttackFighterMovie) as QimenHorseBaseAttackFighter;
         if(attacker != null)
         {
            attacker.trans = 1;
         }
         return attacker;
      }
      
      public static function GetFreeInstance2() : a_3953
      {
         var attacker:QimenHorseBaseAttackFighter = PoolManager.getInstance().CheckOutOne(QimenHorseBaseAttackFighter,QimenHorseSecondAttackFighterMovie) as QimenHorseBaseAttackFighter;
         if(attacker != null)
         {
            attacker.trans = 2;
         }
         return attacker;
      }
      
      override public function a_1797(stFieldGrid:a_3491) : Boolean
      {
         super.a_1797(stFieldGrid);
         if(this.trans == 0)
         {
            a_1309 = 1.5 * 20;
            a_1311 = QimenHorseDefine.a_3965(a_1094);
         }
         else
         {
            a_1309 = 20;
            a_1311 = QimenHorseDefine.a_3965(a_1094) * 1.3;
         }
         this.hasAddTag = false;
         return true;
      }
      
      override protected function a_3964() : int
      {
         return QimenHorseDefine.a_3964(m_iSkillDegree);
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
         if(this.hasAddTag == false)
         {
            this.hasAddTag = true;
            QimenHorseManager.getInstance().AddOne(this);
         }
         QimenHorseManager.getInstance().a_3897(iCurrentTime);
         return true;
      }
      
      override public function a_3940() : Boolean
      {
         if(this.hasAddTag == true)
         {
            this.hasAddTag = false;
            QimenHorseManager.getInstance().RemoveOne(this);
         }
         super.a_3940();
         return true;
      }
   }
}

