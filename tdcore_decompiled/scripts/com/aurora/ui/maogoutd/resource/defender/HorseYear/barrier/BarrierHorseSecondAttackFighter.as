package com.aurora.ui.maogoutd.resource.defender.HorseYear.barrier
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.defender.a_3976;
   import flash.display.FrameLabel;
   
   public class BarrierHorseSecondAttackFighter extends a_3976
   {
      
      private var skillCom:BarrierHorseComponent;
      
      private var hasAddTag:Boolean = false;
      
      private var m_iInitNoX:int = -1;
      
      private var m_iInitNoY:int = -1;
      
      private var m_stBattleView:BattleFieldView;
      
      public function BarrierHorseSecondAttackFighter()
      {
         super();
         a_1095 = BarrierHorseDefine.DEFENSE_PRICE;
         a_1333 = true;
         a_1338 = -30;
         a_1337 = 15;
         this.skillCom = new BarrierHorseComponent();
      }
      
      public static function a_3926() : BarrierHorseSecondAttackFighter
      {
         return PoolManager.getInstance().CheckOutOne(BarrierHorseSecondAttackFighter) as BarrierHorseSecondAttackFighter;
      }
      
      override protected function getBindMovie() : Class
      {
         return BarrierHorseSecondAttackFighterMovie;
      }
      
      override public function a_1797(stFieldGrid:a_3491) : Boolean
      {
         super.a_1797(stFieldGrid);
         a_1339 = 350;
         this.hasAddTag = false;
         if(m_bServerIssued && Boolean(stFieldGrid))
         {
            if(stFieldGrid.m_stBattleBarrierHorseDefense)
            {
               stFieldGrid.m_stBattleBarrierHorseDefense.a_3940();
            }
            stFieldGrid.m_stBattleBarrierHorseDefense = this;
            if(a_1336)
            {
               a_1336.y = height - a_1336.height + 7;
            }
         }
         return true;
      }
      
      override public function a_3957(iCurrentTime:int) : void
      {
         var nextFieldGrid:a_3491 = null;
         if(this.hasAddTag == false)
         {
            this.hasAddTag = true;
            this.m_iInitNoX = stFieldGrid.m_iXGridNo;
            this.m_iInitNoY = stFieldGrid.m_iYGridNo;
            this.m_stBattleView = stFieldGrid.m_stCurrentBattbleFieldView;
            tagCom.AddTag(20021);
            this.skillCom.InitData(this,3,-27,21);
         }
         if(stFieldGrid.m_iXGridNo != this.m_iInitNoX || stFieldGrid.m_iYGridNo != this.m_iInitNoY)
         {
            nextFieldGrid = this.m_stBattleView.a_3438(this.m_iInitNoX,this.m_iInitNoY);
            if(nextFieldGrid.m_stBattleBarrierHorseDefense == null)
            {
               stFieldGrid.m_stBattleBarrierHorseDefense = null;
               nextFieldGrid.m_stBattleBarrierHorseDefense = this;
               stFieldGrid = nextFieldGrid;
            }
         }
         this.skillCom.a_3897(iCurrentTime);
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
         buffCom.UpdateBuff(2);
      }
      
      override protected function a_3964() : int
      {
         return BarrierHorseDefine.a_3964(m_iSkillDegree);
      }
      
      override public function a_3940() : Boolean
      {
         if(this.hasAddTag == true)
         {
            this.hasAddTag = false;
            this.skillCom.Remove();
         }
         if(m_bServerIssued)
         {
            if(stFieldGrid != null)
            {
               stFieldGrid.m_stBattleBarrierHorseDefense = null;
            }
         }
         super.a_3940();
         return true;
      }
   }
}

