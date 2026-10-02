package com.aurora.ui.maogoutd.resource.defender.DishChicken
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.defender.a_3977;
   import com.aurora.ui.maogoutd.resource.tools.a_4448;
   
   public class DishChickenDefense extends a_3977
   {
      
      private var a_1363:a_4448;
      
      private var a_1398:DishChickenHead;
      
      private var m_isPlaced:Boolean = false;
      
      public function DishChickenDefense()
      {
         super();
         a_1095 = 25;
         a_1338 = 5;
         a_1281 = false;
      }
      
      public static function a_3926() : a_3977
      {
         return PoolManager.getInstance().CheckOutOne(DishChickenDefense) as DishChickenDefense;
      }
      
      override protected function getBindMovie() : Class
      {
         return DishChickenDefenseMovie;
      }
      
      override public function a_1797(stFieldGrid:a_3491) : Boolean
      {
         this.m_isPlaced = false;
         this.a_1398 = DishChickenHead.a_3926();
         this.a_1398.a_1797(a_1283);
         this.a_1398.x = 0;
         this.a_1398.y = 0;
         this.a_1398.visible = true;
         super.a_1797(stFieldGrid);
         a_1339 = 50 + this.a_3965();
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
         return 70 - this.a_3966();
      }
      
      override public function a_3969(iRduceLifeValue:int) : Boolean
      {
         super.a_3969(iRduceLifeValue);
         return true;
      }
      
      override public function a_3957(iCurrentTime:int) : void
      {
         var stBattbleFieldView:BattleFieldView = null;
         if(null == this.a_1363 && Boolean(parent))
         {
            this.a_1363 = a_4448.a_3926();
            this.a_1363.a_1797(a_1283);
            if(a_1283)
            {
               this.a_1363.x = x - 0.5 * (width - this.a_1363.width) + 5;
            }
            else
            {
               this.a_1363.x = x + 0.5 * (width - this.a_1363.width) - 5;
            }
            this.a_1363.y = y + height - 0.5 * this.a_1363.height - 20;
            parent.addChildAt(this.a_1363,0);
         }
         if(iCurrentTime % 2 == 0)
         {
            super.a_3957(iCurrentTime);
            if(this.a_1363)
            {
               this.a_1363.nextFrame();
            }
            if(this.a_1398)
            {
               this.a_1398.nextFrame();
            }
         }
         if(!this.m_isPlaced)
         {
            this.a_1398.a_1797(a_1283);
            this.a_1398.x = x + 2;
            this.a_1398.y = y - 4;
            stBattbleFieldView = a_1334.m_stCurrentBattbleFieldView;
            stBattbleFieldView.AddToBattleView(this.a_1398,BattleLayerDefine.DEFENSE_PROTECTOR_AFTER_TYPE,a_1334);
            this.m_isPlaced = true;
         }
      }
      
      override public function a_3940() : Boolean
      {
         if(this.a_1363)
         {
            this.a_1363.a_3940();
            this.a_1363 = null;
         }
         super.a_3940();
         if(this.a_1398)
         {
            this.a_1398.a_3940();
            this.a_1398 = null;
         }
         return true;
      }
      
      override protected function a_3965() : int
      {
         var iStarDegreeEffect:int = 0;
         if(a_1094 <= 6)
         {
            iStarDegreeEffect = 10 * a_1094;
         }
         else if(a_1094 > 6 && a_1094 <= 9)
         {
            iStarDegreeEffect = 10 * 6 + 20 * (a_1094 - 6);
         }
         else if(a_1094 > 9)
         {
            iStarDegreeEffect = 10 * 6 + 20 * 3 + 30 * (a_1094 - 9);
         }
         return iStarDegreeEffect;
      }
      
      override protected function a_3966() : int
      {
         return 5 * m_iSkillDegree;
      }
   }
}

