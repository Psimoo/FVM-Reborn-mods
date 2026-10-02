package com.aurora.ui.maogoutd.resource.defender.HorseYear.yanhuangma
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.defender.a_3953;
   import flash.display.FrameLabel;
   
   public class YanHuangMaBaseAttackFighter extends a_3953
   {
      
      public var trans:int = 0;
      
      public var hasAddTag:Boolean = false;
      
      public function YanHuangMaBaseAttackFighter()
      {
         super();
         a_1095 = YanHuangMaDefence.DEFENSE_PRICE;
         a_1313 = true;
         a_1310 = 10;
         a_1317 = 4;
         a_1333 = true;
      }
      
      public static function a_3926() : YanHuangMaBaseAttackFighter
      {
         var defender:YanHuangMaBaseAttackFighter = PoolManager.getInstance().CheckOutOne(YanHuangMaBaseAttackFighter,YanHuangMaBaseAttackFighterMovie) as YanHuangMaBaseAttackFighter;
         defender.trans = 0;
         return defender;
      }
      
      public static function GetFreeInstance1() : YanHuangMaBaseAttackFighter
      {
         var defender:YanHuangMaBaseAttackFighter = PoolManager.getInstance().CheckOutOne(YanHuangMaBaseAttackFighter,YanHuangMaFirstAttackFighterMovie) as YanHuangMaBaseAttackFighter;
         defender.trans = 1;
         return defender;
      }
      
      public static function GetFreeInstance2() : YanHuangMaBaseAttackFighter
      {
         var defender:YanHuangMaBaseAttackFighter = PoolManager.getInstance().CheckOutOne(YanHuangMaBaseAttackFighter,YanHuangMaSecondAttackFighterMovie) as YanHuangMaBaseAttackFighter;
         defender.trans = 2;
         return defender;
      }
      
      override public function a_1797(stFieldGrid:a_3491) : Boolean
      {
         super.a_1797(stFieldGrid);
         a_1309 = YanHuangMaDefence.a_3966(m_iSkillDegree);
         if(this.trans >= 2)
         {
            a_1311 = YanHuangMaDefence.a_3965(a_1094) * 1.5;
         }
         else
         {
            a_1311 = YanHuangMaDefence.a_3965(a_1094);
         }
         this.hasAddTag = false;
         a_1312 = 10;
         return true;
      }
      
      override protected function a_3964() : int
      {
         return YanHuangMaDefence.a_3964(a_1094);
      }
      
      override public function a_3954(iCurrentTime:int) : Boolean
      {
         if(this.hasAddTag == false && this.trans >= 1)
         {
            this.hasAddTag = true;
            YanHuangMaManager.getInstance().Add(this);
         }
         YanHuangMaManager.getInstance().a_3897(iCurrentTime);
         if(iCurrentTime > m_iPlaceTimeIntervals + a_1308 && iCurrentTime >= a_1321 + a_1309)
         {
            a_1321 = iCurrentTime;
            a_1323 = 0;
            a_1307 = 10;
            a_1275 = 0;
            gotoAndStop((a_1276[1] as FrameLabel).frame);
         }
         if(iCurrentTime - a_1321 == a_1310 + a_1317 * a_1323 && a_1323 < 1)
         {
            this.AddShot(1);
            this.AddShot(2);
            ++a_1323;
         }
         return true;
      }
      
      public function AddRightShot() : void
      {
         this.AddShot(3);
         this.AddShot(4);
      }
      
      private function AddShot(movePath:int) : void
      {
         var shot:YanHuangMaBaseShot = null;
         var grid:a_3491 = null;
         if(this.trans == 0)
         {
            shot = YanHuangMaBaseShot.a_4344();
         }
         else if(this.trans == 1)
         {
            shot = YanHuangMaBaseShot.GetFreeShot1();
         }
         else if(this.trans == 2)
         {
            shot = YanHuangMaBaseShot.GetFreeShot2();
         }
         var targetY:int = (a_1334.m_iYGridNo + 0.5) * a_3491.a_1081;
         if(movePath == 1)
         {
            shot.a_1797(0,a_1312,a_1311,0,targetY - 31,a_1334.m_stCurrentBattbleFieldView,a_1334);
         }
         else if(movePath == 2)
         {
            shot.a_1797(0,a_1312,a_1311,BattleFieldView.a_1013 - 1,targetY + 31,a_1334.m_stCurrentBattbleFieldView,a_1334);
         }
         else if(movePath == 3)
         {
            grid = a_1334.m_stCurrentBattbleFieldView.a_3438(6,0);
            shot.a_1797(0,a_1312,a_1311,419,0,a_1334.m_stCurrentBattbleFieldView,grid);
         }
         else if(movePath == 4)
         {
            grid = a_1334.m_stCurrentBattbleFieldView.a_3438(8,0);
            shot.a_1797(0,a_1312,a_1311,485,0,a_1334.m_stCurrentBattbleFieldView,grid);
         }
         a_1334.m_stCurrentBattbleFieldView.AddToBattleView(shot,BattleLayerDefine.SHOT_TYPE,grid);
         shot.InitData(movePath);
      }
      
      override public function a_3940() : Boolean
      {
         if(this.hasAddTag == true && this.trans >= 1)
         {
            this.hasAddTag = false;
            YanHuangMaManager.getInstance().Remove(this);
         }
         super.a_3940();
         return true;
      }
      
      override public function a_3957(iCurrentTime:int) : void
      {
         if(iCurrentTime % 2 == 0)
         {
            if(a_1278 == null)
            {
               a_1278 = "待机";
            }
            super.a_3957(iCurrentTime);
         }
      }
      
      override protected function a_3955() : Number
      {
         return 0.9 * width;
      }
      
      override protected function a_3956() : Number
      {
         return 0.3 * height + 25;
      }
      
      override protected function a_3966() : int
      {
         return 5 * m_iSkillDegree;
      }
   }
}

