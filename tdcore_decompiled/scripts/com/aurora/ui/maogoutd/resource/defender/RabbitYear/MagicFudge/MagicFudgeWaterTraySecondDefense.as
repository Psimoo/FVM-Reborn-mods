package com.aurora.ui.maogoutd.resource.defender.RabbitYear.MagicFudge
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.defender.a_3977;
   import com.aurora.ui.maogoutd.resource.tools.a_4448;
   import flash.display.FrameLabel;
   
   public class MagicFudgeWaterTraySecondDefense extends a_3977
   {
      
      private var a_1363:a_4448;
      
      private var m_BomDie:Boolean = false;
      
      private var m_arrPos:Array = [[-1,0],[1,0],[0,0],[0,-1],[0,1]];
      
      public function MagicFudgeWaterTraySecondDefense()
      {
         super();
         a_1095 = 0;
         a_1338 = 3;
         m_iOffsetByY = 40;
         a_1281 = false;
      }
      
      public static function a_3926() : a_3977
      {
         return PoolManager.getInstance().CheckOutOne(MagicFudgeWaterTraySecondDefense) as MagicFudgeWaterTraySecondDefense;
      }
      
      override protected function getBindMovie() : Class
      {
         return MagicFudgeWaterTraySecondDefenseMovie;
      }
      
      override public function a_1797(stFieldGrid:a_3491) : Boolean
      {
         super.a_1797(stFieldGrid);
         a_1339 = MagicFudgeDefine.GetWaterCardStarDegreeEffectValue(a_1094);
         a_1275 = 1;
         if(a_1336)
         {
            a_1336.x += 2;
            a_1336.y += 0;
         }
         this.m_BomDie = false;
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
         return true;
      }
      
      override public function a_3957(iCurrentTime:int) : void
      {
         if(Boolean(null == this.a_1363) && Boolean(parent) && !this.m_BomDie)
         {
            this.a_1363 = a_4448.a_3926();
            this.a_1363.a_1797(a_1283);
            if(a_1283)
            {
               this.a_1363.x = x - 0.5 * (width - this.a_1363.width) + 5 + 7;
            }
            else
            {
               this.a_1363.x = x + 0.5 * (width - this.a_1363.width) - 5 + 7;
            }
            this.a_1363.y = y + height - 0.5 * this.a_1363.height - 19;
            parent.addChildAt(this.a_1363,0);
         }
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
            if(this.a_1363)
            {
               this.a_1363.nextFrame();
            }
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
      
      override public function a_3940() : Boolean
      {
         if(this.a_1363)
         {
            this.a_1363.a_3940();
            this.a_1363 = null;
         }
         gotoAndStop(1);
         super.a_3940();
         return true;
      }
   }
}

