package com.aurora.ui.maogoutd.resource.defender.dogOx
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.CroissantsBreadMoveIntruder;
   import com.aurora.ui.maogoutd.resource.defender.a_3953;
   import flash.display.FrameLabel;
   
   public class DogCroissantsBreadFighter extends a_3953
   {
      
      private var m_isAppeared:Boolean = false;
      
      private var m_iStartTime:int = 0;
      
      private var m_stCroissantsBreadMoveIntruder:CroissantsBreadMoveIntruder;
      
      private var m_iSummonUpMoveIntruderSequence:int = 1;
      
      public function DogCroissantsBreadFighter()
      {
         super();
         a_1095 = 125;
         a_1313 = true;
         a_1320 = 2;
      }
      
      public static function a_3926() : a_3953
      {
         return PoolManager.getInstance().CheckOutOne(DogCroissantsBreadFighter) as DogCroissantsBreadFighter;
      }
      
      override protected function getBindMovie() : Class
      {
         return DogCroissantsBreadFighterMovie;
      }
      
      override public function a_1797(stFieldGrid:a_3491) : Boolean
      {
         super.a_1797(stFieldGrid);
         a_1339 = this.GetCardStarDegreeEffectLifeValue();
         this.m_isAppeared = false;
         this.m_iStartTime = 0;
         a_1275 = 1;
         a_1307 = (a_1276[1] as FrameLabel).frame;
         this.m_iSummonUpMoveIntruderSequence = 1;
         return true;
      }
      
      override protected function a_3964() : int
      {
         return 150 - this.a_3966();
      }
      
      override public function a_3969(iRduceLifeValue:int) : Boolean
      {
         super.a_3969(iRduceLifeValue);
         return true;
      }
      
      override public function a_3954(iCurrentTime:int) : Boolean
      {
         var stTargetFieldGrid:a_3491 = null;
         if(!this.m_isAppeared)
         {
            this.m_iStartTime = iCurrentTime;
            this.m_isAppeared = true;
         }
         if(iCurrentTime - this.m_iStartTime == 28)
         {
            stTargetFieldGrid = a_1334.m_stCurrentBattbleFieldView.m_stOpponentBattleFieldInstance.a_3438(BattleFieldView.a_1011 - 1 - a_1334.m_iXGridNo,a_1334.m_iYGridNo);
            this.m_stCroissantsBreadMoveIntruder = CroissantsBreadMoveIntruder.a_3926() as CroissantsBreadMoveIntruder;
            this.m_stCroissantsBreadMoveIntruder.a_1797(0,1);
            this.m_stCroissantsBreadMoveIntruder.iGlobalMoveFighterID = this.a_4265();
            this.m_stCroissantsBreadMoveIntruder.m_stMoveIntruderTypeID = 8388608;
            a_1334.m_stCurrentBattbleFieldView.m_stOpponentBattleFieldInstance.a_3459(this.m_stCroissantsBreadMoveIntruder,stTargetFieldGrid);
            stTargetFieldGrid.a_3459(this.m_stCroissantsBreadMoveIntruder);
            if(a_1334.m_stCurrentBattbleFieldView.m_stOpponentBattleFieldInstance.m_isOwnBattleField)
            {
               this.m_stCroissantsBreadMoveIntruder.x = a_3491.a_1080 * stTargetFieldGrid.m_iXGridNo + 0.5 * (a_3491.a_1080 - this.m_stCroissantsBreadMoveIntruder.width);
            }
            else
            {
               this.m_stCroissantsBreadMoveIntruder.x = BattleFieldView.a_1013 - (a_3491.a_1080 * stTargetFieldGrid.m_iXGridNo + 0.5 * (a_3491.a_1080 - this.m_stCroissantsBreadMoveIntruder.width));
            }
            this.m_stCroissantsBreadMoveIntruder.m_stReferDefense = this;
            this.m_stCroissantsBreadMoveIntruder.a_3969(this.a_3965());
         }
         return true;
      }
      
      override public function a_3957(iCurrentTime:int) : void
      {
         if(iCurrentTime % 2 == 0)
         {
            super.a_3957(iCurrentTime);
         }
      }
      
      override public function a_3940() : Boolean
      {
         if(Boolean(this.m_stCroissantsBreadMoveIntruder) && this.m_stCroissantsBreadMoveIntruder.iLifeValue > 0)
         {
            this.m_stCroissantsBreadMoveIntruder.a_3969(this.m_stCroissantsBreadMoveIntruder.iLifeValue);
            this.m_stCroissantsBreadMoveIntruder.a_4212();
            this.m_stCroissantsBreadMoveIntruder = null;
         }
         super.a_3940();
         return true;
      }
      
      override protected function a_3965() : int
      {
         var iStarDegreeEffect:int = 0;
         if(a_1094 <= 9)
         {
            iStarDegreeEffect = 5 * a_1094;
         }
         else if(a_1094 > 9)
         {
            iStarDegreeEffect = 5 * 8 + 10 * (a_1094 - 9);
         }
         return -10 * iStarDegreeEffect;
      }
      
      public function GetCardStarDegreeEffectLifeValue() : int
      {
         var iStarDegreeEffect:int = 300;
         switch(a_1094)
         {
            case 0:
               iStarDegreeEffect = 300;
               break;
            case 1:
               iStarDegreeEffect = 350;
               break;
            case 2:
               iStarDegreeEffect = 400;
               break;
            case 3:
               iStarDegreeEffect = 450;
               break;
            case 4:
               iStarDegreeEffect = 500;
               break;
            case 5:
               iStarDegreeEffect = 550;
               break;
            case 6:
               iStarDegreeEffect = 600;
               break;
            case 7:
               iStarDegreeEffect = 650;
               break;
            case 8:
               iStarDegreeEffect = 700;
               break;
            case 9:
               iStarDegreeEffect = 750;
               break;
            case 10:
               iStarDegreeEffect = 800;
               break;
            case 11:
               iStarDegreeEffect = 850;
               break;
            case 12:
               iStarDegreeEffect = 900;
               break;
            case 13:
               iStarDegreeEffect = 1000;
               break;
            case 14:
               iStarDegreeEffect = 1100;
               break;
            case 15:
               iStarDegreeEffect = 1200;
         }
         return iStarDegreeEffect;
      }
      
      override protected function a_3966() : int
      {
         var iSkillDegreeEffect:int = 0;
         if(m_iSkillDegree <= 3)
         {
            iSkillDegreeEffect = 2 * m_iSkillDegree;
         }
         else if(m_iSkillDegree > 3 && m_iSkillDegree <= 6)
         {
            iSkillDegreeEffect = 2 * 3 + 2 * (m_iSkillDegree - 3);
         }
         else if(m_iSkillDegree > 6)
         {
            iSkillDegreeEffect = 2 * 3 + 2 * (6 - 3) + 3 * (m_iSkillDegree - 6);
         }
         return 10 * iSkillDegreeEffect;
      }
      
      protected function a_4265() : int
      {
         return (m_iDefenseGlobalID << 16) + this.m_iSummonUpMoveIntruderSequence++;
      }
   }
}

