package com.aurora.ui.maogoutd.resource.defender.Athena
{
   import a_4718.b_183;
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.defender.a_3953;
   
   public class AthenaFirstTransAttackFighter extends a_3953
   {
      
      public function AthenaFirstTransAttackFighter()
      {
         super();
         a_1304 = b_183.enm_AthenaShot;
         a_1337 = -2;
         a_1312 = 15;
         a_1313 = true;
         a_1310 = 10;
         a_1317 = 8;
         a_1095 = AthenaDefine.DEFENSE_PRICE;
         a_1096 = false;
         a_1314 = false;
         a_1309 = AthenaDefine.a_3966(m_iSkillDegree);
         a_1311 = AthenaDefine.a_3965(a_1094);
      }
      
      public static function a_3926() : a_3953
      {
         return PoolManager.getInstance().CheckOutOne(AthenaFirstTransAttackFighter,AthenaFirstTransAttackFighterMovie) as AthenaFirstTransAttackFighter;
      }
      
      override public function a_1797(stFieldGrid:a_3491) : Boolean
      {
         super.a_1797(stFieldGrid);
         a_1309 = AthenaDefine.a_3966(m_iSkillDegree);
         a_1311 = AthenaDefine.a_3965(a_1094);
         tagCom.AddTag(30031);
         return true;
      }
      
      override public function a_3954(iCurrentTime:int) : Boolean
      {
         if(a_1334.m_stCurrentBattbleFieldView.a_3431())
         {
            super.a_3954(iCurrentTime);
         }
         return true;
      }
      
      override protected function a_3964() : int
      {
         return AthenaDefine.a_3964();
      }
      
      override public function a_3957(iCurrentTime:int) : void
      {
         if(iCurrentTime % 2 == 0)
         {
            super.a_3957(iCurrentTime);
         }
      }
      
      override protected function a_3955() : Number
      {
         return 30;
      }
      
      override protected function a_3956() : Number
      {
         return 20;
      }
   }
}

