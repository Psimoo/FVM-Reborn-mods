package com.aurora.ui.maogoutd.resource.defender
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.a_3491;
   import flash.display.FrameLabel;
   
   public class a_4095 extends a_3975
   {
      
      private var a_1398:a_4096;
      
      private var m_isPlaced:Boolean = false;
      
      public function a_4095()
      {
         super();
         a_1095 = 125;
      }
      
      public static function a_3926() : a_3975
      {
         return PoolManager.getInstance().CheckOutOne(a_4095) as a_4095;
      }
      
      override protected function getBindMovie() : Class
      {
         return WatermelonGuardProtectorMovie;
      }
      
      override public function a_1797(stFieldGrid:a_3491) : Boolean
      {
         this.m_isPlaced = false;
         this.a_1398 = a_4096.a_3926();
         this.a_1398.a_1797(a_1283);
         this.a_1398.x = 0;
         this.a_1398.y = 0;
         this.a_1398.visible = true;
         super.a_1797(stFieldGrid);
         a_1339 = 500 + this.a_3965();
         if(stFieldGrid.m_stCurrentBattbleFieldView.GetGameMoveMap())
         {
            stFieldGrid.m_stCurrentBattbleFieldView.GetGameMoveMap().AddMoveDisplayObject(this.a_1398,stFieldGrid.m_iXGridNo,stFieldGrid.m_iYGridNo);
         }
         return true;
      }
      
      override public function set m_isShowFrozen(value:Boolean) : void
      {
         if(this.a_1398 != null)
         {
            this.a_1398.visible = !value;
         }
         super.m_isShowFrozen = value;
      }
      
      override public function set m_isShihua(value:Boolean) : void
      {
         if(this.a_1398 != null)
         {
            this.a_1398.visible = !value;
         }
         super.m_isShihua = value;
      }
      
      override protected function a_3964() : int
      {
         return 300 - this.a_3966();
      }
      
      override public function a_3969(iRduceLifeValue:int) : Boolean
      {
         super.a_3969(iRduceLifeValue);
         if(a_1339 > 320 && a_1275 != 0)
         {
            a_1275 = 0;
            gotoAndStop((a_1276[0] as FrameLabel).frame);
            this.a_1398.gotoAndStop(1);
         }
         else if(a_1339 <= 320 && a_1339 > 180 && a_1275 != 1)
         {
            a_1275 = 1;
            gotoAndStop((a_1276[1] as FrameLabel).frame);
            this.a_1398.gotoAndStop(2);
         }
         else if(a_1339 <= 180 && a_1339 > 0 && a_1275 != 2)
         {
            a_1275 = 2;
            gotoAndStop((a_1276[2] as FrameLabel).frame);
            this.a_1398.gotoAndStop(3);
         }
         else if(a_1339 <= 0)
         {
         }
         return true;
      }
      
      override public function a_3957(iCurrentTime:int) : void
      {
         var stBattbleFieldView:BattleFieldView = null;
         if(iCurrentTime % 2 == 0)
         {
            super.a_3957(iCurrentTime);
         }
         if(!this.m_isPlaced)
         {
            this.a_1398.a_1797(a_1283);
            this.a_1398.x = x + 2;
            this.a_1398.y = y - 4;
            stBattbleFieldView = a_1334.m_stCurrentBattbleFieldView;
            stBattbleFieldView.AddToBattleView(this.a_1398,BattleLayerDefine.DEFENSE_PROTECTOR_BEFORE_TYPE,a_1334);
            this.m_isPlaced = true;
         }
      }
      
      override public function a_3940() : Boolean
      {
         super.a_3940();
         if(this.a_1398)
         {
            this.a_1398.a_3940();
         }
         return true;
      }
      
      override protected function a_3965() : int
      {
         var iStarDegreeEffect:int = 0;
         if(a_1094 <= 3)
         {
            iStarDegreeEffect = 4 * a_1094;
         }
         else if(a_1094 > 3 && a_1094 <= 6)
         {
            iStarDegreeEffect = 4 * 3 + 6 * (a_1094 - 3);
         }
         else if(a_1094 > 6 && a_1094 <= 9)
         {
            iStarDegreeEffect = 4 * 3 + 6 * (6 - 3) + 8 * (a_1094 - 6);
         }
         else if(a_1094 > 9)
         {
            iStarDegreeEffect = 4 * 3 + 6 * (6 - 3) + 8 * 3 + 10 * (a_1094 - 9);
         }
         return 10 * iStarDegreeEffect;
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
   }
}

