package com.aurora.ui.maogoutd.resource.defender.TigerYear.FireflyLantern
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.defender.a_3971;
   
   public class FireflyLanternDriveFogFirstTransDefense extends a_3971
   {
      
      private var m_isAlive:Boolean = false;
      
      private var m_CanReBirth:Boolean = false;
      
      private var m_arrHurtMouseGlobalID:Array = new Array();
      
      private var m_hurtPower:int;
      
      public function FireflyLanternDriveFogFirstTransDefense()
      {
         super();
         a_1095 = FireflyDefine.DEFENSE_PRICE;
         a_1344 = 3;
      }
      
      public static function a_3926() : a_3971
      {
         return PoolManager.getInstance().CheckOutOne(FireflyLanternDriveFogFirstTransDefense) as FireflyLanternDriveFogFirstTransDefense;
      }
      
      override protected function getBindMovie() : Class
      {
         return FireflyLanternDriveFogFirstTransDefenseMovie;
      }
      
      override public function a_1797(stFieldGrid:a_3491) : Boolean
      {
         super.a_1797(stFieldGrid);
         gotoAndStop(13);
         this.m_isAlive = this.m_CanReBirth = false;
         if(m_bServerIssued && Boolean(stFieldGrid))
         {
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

