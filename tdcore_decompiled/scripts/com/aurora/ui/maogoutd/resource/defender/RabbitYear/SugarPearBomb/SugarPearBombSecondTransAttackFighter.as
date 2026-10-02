package com.aurora.ui.maogoutd.resource.defender.RabbitYear.SugarPearBomb
{
   import a_4718.b_182;
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.defender.a_3960;
   import flash.display.FrameLabel;
   
   public class SugarPearBombSecondTransAttackFighter extends a_3960
   {
      
      protected var a_1309:int = 26;
      
      protected var m_iHurtForOnce:int = 20;
      
      protected var a_1321:int = 0;
      
      private var m_arrPos:Array = [[-1,0],[1,0],[0,0],[0,-1],[0,1]];
      
      public function SugarPearBombSecondTransAttackFighter()
      {
         super();
         a_1095 = SugarPearBombDefine.DEFENSE_PRICE;
         a_1330 = 0;
         a_1333 = true;
         a_1332 = true;
      }
      
      public static function a_3926() : a_3960
      {
         return PoolManager.getInstance().CheckOutOne(SugarPearBombSecondTransAttackFighter) as SugarPearBombSecondTransAttackFighter;
      }
      
      override protected function getBindMovie() : Class
      {
         return SugarPearBombSecondTransAttackFighterMovie;
      }
      
      override public function a_1797(stFieldGrid:a_3491) : Boolean
      {
         super.a_1797(stFieldGrid);
         a_1339 = SugarPearBombDefine.MAX_LIFE_VALUE;
         this.m_iHurtForOnce = SugarPearBombDefine.a_3965(a_1094) * 1.3;
         this.a_1309 = SugarPearBombDefine.a_3966(m_iSkillDegree);
         a_1331 = false;
         this.a_1321 = 0;
         return true;
      }
      
      override public function a_3969(iRduceLifeValue:int) : Boolean
      {
         if(a_1339 - iRduceLifeValue <= 0)
         {
            if(m_iDieType == 1)
            {
               if(a_1275 != 2)
               {
                  a_1275 = 2;
                  gotoAndStop((a_1276[a_1275] as FrameLabel).frame);
               }
            }
            else
            {
               super.a_3969(iRduceLifeValue);
            }
         }
         else
         {
            super.a_3969(iRduceLifeValue);
         }
         return true;
      }
      
      override protected function a_3964() : int
      {
         return SugarPearBombDefine.a_3964(a_1094);
      }
      
      override public function a_3961(iCurrentTime:int) : Boolean
      {
         var stMoveIntruder:a_4206 = null;
         if(0 == (iCurrentTime & 1))
         {
            return false;
         }
         super.a_3961(iCurrentTime);
         var stPreFieldGrid:a_3491 = a_1334.m_stCurrentBattbleFieldView.a_3438(a_1334.m_iXGridNo - 1,a_1334.m_iYGridNo);
         if(iCurrentTime >= this.a_1321 + this.a_1309 && a_1275 != 2 && (Boolean(a_1334.a_1511.length > 0) || Boolean(stPreFieldGrid && (stPreFieldGrid.m_stAttackFighter && stPreFieldGrid.m_stAttackFighter.iBreadFighterType > 0 || stPreFieldGrid.m_stProtector) && stPreFieldGrid.a_1511.length > 0)))
         {
            this.a_1321 = iCurrentTime;
            a_1275 = 0;
            gotoAndStop((a_1276[1] as FrameLabel).frame);
         }
         if(a_1273 == 16)
         {
            BattleFieldView.a_1038.play();
            if(Boolean(stPreFieldGrid) && (Boolean(stPreFieldGrid.m_stAttackFighter && stPreFieldGrid.m_stAttackFighter.iBreadFighterType > 0) || Boolean(stPreFieldGrid.m_stProtector)))
            {
               for each(stMoveIntruder in stPreFieldGrid.a_1511.slice())
               {
                  if(stMoveIntruder.iSpaceState == 0 && !stMoveIntruder.isCannotSeeByFighter)
                  {
                     stMoveIntruder.a_3969(this.m_iHurtForOnce);
                     stMoveIntruder.a_4208(b_182.a_432,1);
                  }
               }
            }
            for each(stMoveIntruder in a_1334.a_1511.slice())
            {
               if(8388624 == stMoveIntruder.m_stMoveIntruderTypeID || 8389123 == stMoveIntruder.m_stMoveIntruderTypeID || 8389017 == stMoveIntruder.m_stMoveIntruderTypeID || 8389644 == stMoveIntruder.m_stMoveIntruderTypeID)
               {
                  stMoveIntruder.a_3969(stMoveIntruder.iLifeValue);
                  this.a_3969(900);
               }
               else if(134235477 == stMoveIntruder.m_stMoveIntruderTypeID || 8389715 == stMoveIntruder.m_stMoveIntruderTypeID || 8389716 == stMoveIntruder.m_stMoveIntruderTypeID)
               {
                  stMoveIntruder.a_3969(10000);
                  stMoveIntruder.a_4208(b_182.a_432,1);
               }
               else if(stMoveIntruder.iSpaceState == 0 && !stMoveIntruder.isCannotSeeByFighter)
               {
                  stMoveIntruder.a_3969(this.m_iHurtForOnce);
                  stMoveIntruder.a_4208(b_182.a_432,1);
                  if(Math.random() * 100 <= 10 && stMoveIntruder.iLifeValue > 0)
                  {
                     stMoveIntruder.a_4208(b_182.enm_shotEffectXuanYun,15);
                  }
               }
            }
            gotoAndStop(1);
         }
         if(a_1273 == a_1274 - 2)
         {
            this.a_4210();
            return false;
         }
         if(a_1273 == a_1274)
         {
            super.a_3969(a_1339);
            return false;
         }
         return true;
      }
      
      public function a_4210() : void
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
         var stSugarPearBoomEffect:SugarPearBoomEffect = SugarPearBoomEffect.a_3926();
         stSugarPearBoomEffect.IsHasColumn = true;
         stSugarPearBoomEffect.a_1797(a_1334.m_iXGridNo,a_1334.m_iYGridNo,a_1334.m_stCurrentBattbleFieldView);
         BattleFieldView.a_1047.play();
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
   }
}

