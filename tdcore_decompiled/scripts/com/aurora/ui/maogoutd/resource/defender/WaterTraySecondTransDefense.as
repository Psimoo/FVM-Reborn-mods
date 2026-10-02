package com.aurora.ui.maogoutd.resource.defender
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.tools.a_4448;
   import flash.display.FrameLabel;
   
   public class WaterTraySecondTransDefense extends a_3977
   {
      
      private var a_1363:a_4448;
      
      private var m_bHasBeenBitten:Boolean = false;
      
      private var m_bHasBoom:Boolean = false;
      
      public function WaterTraySecondTransDefense()
      {
         super();
         a_1095 = 0;
         a_1338 = 5;
         a_1281 = false;
      }
      
      public static function a_3926() : a_3977
      {
         return PoolManager.getInstance().CheckOutOne(WaterTraySecondTransDefense) as WaterTraySecondTransDefense;
      }
      
      override protected function getBindMovie() : Class
      {
         return WaterTraySecondTransDefenseMovie;
      }
      
      override public function get height() : Number
      {
         return 55;
      }
      
      override public function a_1797(stFieldGrid:a_3491) : Boolean
      {
         super.a_1797(stFieldGrid);
         a_1339 = 50 + this.a_3965();
         this.m_bHasBeenBitten = false;
         this.m_bHasBoom = false;
         this.SetAnimation(0);
         return true;
      }
      
      override protected function a_3964() : int
      {
         return 70 - this.a_3966();
      }
      
      override public function a_3969(iRduceLifeValue:int) : Boolean
      {
         if(!this.m_bHasBeenBitten && iRduceLifeValue > 0 && m_iDieType != 2)
         {
            this.m_bHasBeenBitten = true;
            SetAnimationOnce2Loop(1,2);
         }
         super.a_3969(iRduceLifeValue);
         return true;
      }
      
      private function ProduceBoomEffect() : void
      {
         var stUpGrid:a_3491 = null;
         var stDownGrid:a_3491 = null;
         var stLeftGrid:a_3491 = null;
         var stRightGrid:a_3491 = null;
         BattleFieldView.a_1048.play();
         a_1334.m_stCurrentBattbleFieldView.a_3466();
         var xStart:int = Math.max(a_1334.m_iXGridNo - 1,0);
         var xEnd:int = Math.min(a_1334.m_iXGridNo + 1,BattleFieldView.a_1011 - 1);
         var yStart:int = Math.max(a_1334.m_iYGridNo - 1,0);
         var yEnd:int = Math.min(a_1334.m_iYGridNo + 1,BattleFieldView.a_1012 - 1);
         var stFieldGridVector:Array = a_1334.m_stCurrentBattbleFieldView.stFieldGridsVector;
         this.BoomGridMouses(a_1334);
         if(a_1334.m_iYGridNo - 1 >= 0)
         {
            stUpGrid = a_1334.m_stCurrentBattbleFieldView.a_3438(a_1334.m_iXGridNo,a_1334.m_iYGridNo - 1);
            if(null != stUpGrid)
            {
               this.BoomGridMouses(stUpGrid);
            }
         }
         if(a_1334.m_iYGridNo + 1 < BattleFieldView.a_1012)
         {
            stDownGrid = a_1334.m_stCurrentBattbleFieldView.a_3438(a_1334.m_iXGridNo,a_1334.m_iYGridNo + 1);
            if(null != stDownGrid)
            {
               this.BoomGridMouses(stDownGrid);
            }
         }
         if(a_1334.m_iXGridNo - 1 >= 0)
         {
            stLeftGrid = a_1334.m_stCurrentBattbleFieldView.a_3438(a_1334.m_iXGridNo - 1,a_1334.m_iYGridNo);
            if(null != stLeftGrid)
            {
               this.BoomGridMouses(stLeftGrid);
            }
         }
         if(a_1334.m_iXGridNo + 1 < BattleFieldView.a_1011)
         {
            stRightGrid = a_1334.m_stCurrentBattbleFieldView.a_3438(a_1334.m_iXGridNo + 1,a_1334.m_iYGridNo);
            if(null != stRightGrid)
            {
               this.BoomGridMouses(stRightGrid);
            }
         }
      }
      
      private function BoomGridMouses(stFieldGrid:a_3491) : void
      {
         var stMoveIntruder:a_4206 = null;
         if(null == stFieldGrid)
         {
            return;
         }
         var arrMoveIntruder:Array = stFieldGrid.a_1511.slice();
         for each(stMoveIntruder in arrMoveIntruder)
         {
            if(Boolean(stMoveIntruder) && stMoveIntruder.iLifeValue > 0)
            {
               stMoveIntruder.a_4210();
            }
         }
      }
      
      private function AddBoomEffect() : void
      {
         var stEffect:WaterTrayBoomEffect = null;
         stEffect = WaterTrayBoomEffect.a_3926();
         stEffect.a_1797(a_1283);
         stEffect.x = a_1334.m_iXGridNo * a_3491.a_1080 - 30;
         stEffect.y = a_1334.m_iYGridNo * a_3491.a_1081 - 32;
         a_1334.m_stCurrentBattbleFieldView.AddToBattleView(stEffect,BattleLayerDefine.SHOT_TYPE,a_1334);
      }
      
      override public function a_3957(iCurrentTime:int) : void
      {
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
            this.a_1363.y = y + this.height - 0.5 * this.a_1363.height - 20;
            parent.addChildAt(this.a_1363,0);
         }
         if(iCurrentTime % 2 == 0)
         {
            if(this.m_bHasBeenBitten && !this.m_bHasBoom && a_1273 == 16)
            {
               this.m_bHasBoom = true;
               this.ProduceBoomEffect();
               this.AddBoomEffect();
            }
            super.a_3957(iCurrentTime);
            if(a_1278 != null)
            {
               gotoAndStop((a_1276[a_1275] as FrameLabel).frame);
            }
            if(this.a_1363)
            {
               this.a_1363.nextFrame();
            }
         }
      }
      
      private function SetAnimation(animIdx:int) : void
      {
         if(a_1275 != animIdx)
         {
            a_1275 = animIdx;
            gotoAndStop((a_1276[animIdx] as FrameLabel).frame);
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

