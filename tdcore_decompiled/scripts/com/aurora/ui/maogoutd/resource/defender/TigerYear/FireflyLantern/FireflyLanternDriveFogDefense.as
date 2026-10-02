package com.aurora.ui.maogoutd.resource.defender.TigerYear.FireflyLantern
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.defender.a_3971;
   
   public class FireflyLanternDriveFogDefense extends a_3971
   {
      
      private var m_arrHurtMouseGlobalID:Array = new Array();
      
      private var m_hurtPower:int;
      
      public function FireflyLanternDriveFogDefense()
      {
         super();
         a_1095 = FireflyDefine.DEFENSE_PRICE;
         a_1344 = 3;
      }
      
      public static function a_3926() : a_3971
      {
         return PoolManager.getInstance().CheckOutOne(FireflyLanternDriveFogDefense) as FireflyLanternDriveFogDefense;
      }
      
      override protected function getBindMovie() : Class
      {
         return FireflyLanternDriveFogDefenseMovie;
      }
      
      override public function a_1797(stFieldGrid:a_3491) : Boolean
      {
         super.a_1797(stFieldGrid);
         stFieldGrid.m_stCurrentBattbleFieldView.a_3462();
         while(this.m_arrHurtMouseGlobalID.length > 0)
         {
            this.m_arrHurtMouseGlobalID.pop();
         }
         this.m_hurtPower = FireflyDefine.a_3966(m_iSkillDegree);
         a_1339 = 150;
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
            if(a_1273 == a_1274)
            {
               gotoAndStop(1);
            }
            if(a_1336)
            {
               a_1336.a_3957(iCurrentTime);
            }
            if(m_stFrozenCardEffect)
            {
               m_stFrozenCardEffect.a_3957(iCurrentTime);
            }
            if(m_stShiHuaEffect)
            {
               m_stShiHuaEffect.a_3957(iCurrentTime);
            }
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
               arrMoveIntruder = stFieldGridVector[yIndex][xIndex].a_1511.slice();
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
      
      override public function a_3940() : Boolean
      {
         var stTempFieldGrid:a_3491 = a_1334;
         while(this.m_arrHurtMouseGlobalID.length > 0)
         {
            this.m_arrHurtMouseGlobalID.pop();
         }
         super.a_3940();
         if(stTempFieldGrid)
         {
            stTempFieldGrid.m_stCurrentBattbleFieldView.a_3462();
         }
         return true;
      }
   }
}

