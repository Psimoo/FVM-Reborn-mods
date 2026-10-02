package com.aurora.ui.maogoutd.resource.defender.RabbitYear.MagicFudge
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.defender.a_3976;
   import flash.display.FrameLabel;
   
   public class MagicFudgeToolFirstDefense extends a_3976
   {
      
      private var m_iStartTime:int = -1;
      
      private var m_arrPos:Array = [[-1,0],[1,0],[0,0],[0,-1],[0,1]];
      
      public function MagicFudgeToolFirstDefense()
      {
         super();
         a_1095 = MagicFudgeDefine.DEFENSE_PRICE;
         a_1338 = 15;
         a_1281 = false;
         m_iToolType = 2;
      }
      
      public static function a_3926() : a_3976
      {
         return PoolManager.getInstance().CheckOutOne(MagicFudgeToolFirstDefense) as MagicFudgeToolFirstDefense;
      }
      
      override protected function getBindMovie() : Class
      {
         return MagicFudgeToolFirstDefenseMovie;
      }
      
      override public function a_1797(stFieldGrid:a_3491) : Boolean
      {
         super.a_1797(stFieldGrid);
         a_1339 = MagicFudgeDefine.GetLandCardStarDegreeEffectValue(a_1094);
         a_1275 = 1;
         this.m_iStartTime = -1;
         return true;
      }
      
      override protected function a_3964() : int
      {
         return MagicFudgeDefine.a_3966(m_iSkillDegree);
      }
      
      override public function a_3969(iRduceLifeValue:int) : Boolean
      {
         if(a_1339 - iRduceLifeValue <= 0)
         {
            if(m_iDieType == 1 || m_iDieType == 2)
            {
               this.a_4360();
            }
         }
         super.a_3969(iRduceLifeValue);
         if(a_1339 > 200)
         {
            a_1275 = 1;
         }
         else if(a_1339 > 0)
         {
            a_1275 = 2;
         }
         return true;
      }
      
      override public function a_3957(iCurrentTime:int) : void
      {
         if(iCurrentTime % 2 == 0)
         {
            nextFrame();
            if(a_1278 != null || a_1273 == a_1274)
            {
               gotoAndStop((a_1276[a_1275] as FrameLabel).frame);
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
         if(this.m_iStartTime < 0)
         {
            this.m_iStartTime = iCurrentTime;
         }
         if(iCurrentTime - this.m_iStartTime > 24000)
         {
            super.a_3969(a_1339);
         }
      }
      
      private function a_4360() : void
      {
         var iXGridNo:int = 0;
         var iYGridNo:int = 0;
         var stCurFieldGrid:a_3491 = null;
         var arrMoveIntruder:Array = null;
         var stMoveIntruder:a_4206 = null;
         if(stFieldGrid == null)
         {
            return;
         }
         this.addBoomEffect();
         BattleFieldView.a_1048.play();
         a_1334.m_stCurrentBattbleFieldView.a_3466();
         var iLen:int = int(this.m_arrPos.length);
         for(var i:int = 0; i < iLen; i++)
         {
            iXGridNo = stFieldGrid.m_iXGridNo + this.m_arrPos[i][0];
            iYGridNo = stFieldGrid.m_iYGridNo + this.m_arrPos[i][1];
            stCurFieldGrid = a_1334.m_stCurrentBattbleFieldView.a_3438(iXGridNo,iYGridNo);
            if(null != stCurFieldGrid)
            {
               arrMoveIntruder = stCurFieldGrid.a_1511.slice();
               for each(stMoveIntruder in arrMoveIntruder)
               {
                  if(stMoveIntruder.iLifeValue > 0)
                  {
                     stMoveIntruder.a_4210();
                  }
               }
            }
         }
      }
      
      public function addBoomEffect() : void
      {
         var stAddBloodEffect:MagicFudgeBoomEffect = null;
         stAddBloodEffect = MagicFudgeBoomEffect.a_3926();
         stAddBloodEffect.a_1797(false);
         stAddBloodEffect.x = a_1334.m_iXGridNo * a_3491.a_1080 + 30;
         stAddBloodEffect.y = a_1334.m_iYGridNo * a_3491.a_1081 + 34;
         a_1334.m_stCurrentBattbleFieldView.AddToBattleView(stAddBloodEffect,BattleLayerDefine.EFFECTS_TOP_TYPE,a_1334);
      }
   }
}

