package com.aurora.ui.maogoutd.resource.defender.HorseYear.qiaotouNoodles
{
   import a_4718.b_182;
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.Util.BattleEffectUtil;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.defender.a_3953;
   import com.aurora.ui.maogoutd.resource.gamemap.newMap.HorseYear.IsLand.DragonSuppressingPillarEffect;
   import com.aurora.ui.maogoutd.resource.gamemap.newMap.HorseYear.IsLand.IsLandLineManager;
   import flash.display.FrameLabel;
   
   public class QiaotouRiceNoodlesAttackFighter extends a_3953
   {
      
      public var trans:int = 0;
      
      private var checkTick:int = 0;
      
      private var zhu:DragonSuppressingPillarEffect = null;
      
      private var readyDead:Boolean = false;
      
      public function QiaotouRiceNoodlesAttackFighter()
      {
         super();
         a_1323 = 1;
         a_1337 = 0;
         a_1338 = 0;
         a_1312 = 0;
         a_1309 = QiaotouRiceNoodlesDefine.a_3966(m_iSkillDegree);
         a_1311 = QiaotouRiceNoodlesDefine.a_3965(a_1094);
         a_1310 = 6;
         a_1095 = 200;
         a_1314 = false;
         a_1313 = true;
      }
      
      public static function a_3926() : a_3953
      {
         var tower:QiaotouRiceNoodlesAttackFighter = PoolManager.getInstance().CheckOutOne(QiaotouRiceNoodlesAttackFighter,QiaotouRiceNoodlesBaseAttackFighterMovie) as QiaotouRiceNoodlesAttackFighter;
         if(tower != null)
         {
            tower.trans = 0;
         }
         return tower;
      }
      
      public static function GetFreeInstance1() : a_3953
      {
         var tower:QiaotouRiceNoodlesAttackFighter = PoolManager.getInstance().CheckOutOne(QiaotouRiceNoodlesAttackFighter,QiaotouRiceNoodlesFirstAttackFighterMovie) as QiaotouRiceNoodlesAttackFighter;
         if(tower != null)
         {
            tower.trans = 1;
         }
         return tower;
      }
      
      public static function GetFreeInstance2() : a_3953
      {
         var tower:QiaotouRiceNoodlesAttackFighter = PoolManager.getInstance().CheckOutOne(QiaotouRiceNoodlesAttackFighter,QiaotouRiceNoodlesSecondAttackFighterMovie) as QiaotouRiceNoodlesAttackFighter;
         if(tower != null)
         {
            tower.trans = 2;
         }
         return tower;
      }
      
      override public function a_1797(stFieldGrid:a_3491) : Boolean
      {
         super.a_1797(stFieldGrid);
         tagCom.AddTag(30038);
         a_1323 = 1;
         a_1309 = QiaotouRiceNoodlesDefine.a_3966(m_iSkillDegree);
         a_1311 = QiaotouRiceNoodlesDefine.a_3965(a_1094);
         a_1310 = 6;
         a_1314 = false;
         a_1339 = 150;
         this.zhu = null;
         this.readyDead = false;
         this.checkTick = 0;
         return true;
      }
      
      private function CheckNoodles() : void
      {
         if(this.zhu == null)
         {
            this.zhu = IsLandLineManager.getInstance().GetNearestZhu(stFieldGrid.m_iXGridNo,stFieldGrid.m_iYGridNo);
            if(this.zhu != null)
            {
               this.zhu.AddCard(this);
            }
         }
      }
      
      override public function SpecialSkillCallBack(... args) : void
      {
         if(args.length == 1 && args[0] == -1)
         {
            this.SetAutoDead();
         }
      }
      
      public function SetAutoDead() : void
      {
         m_iDieType = 2;
         this.readyDead = true;
         if(a_1275 != 2)
         {
            a_1275 = 2;
            gotoAndStop((a_1276[2] as FrameLabel).frame);
         }
      }
      
      override public function a_3969(iReduceLifeValue:int) : Boolean
      {
         var arrMoveIntruder:Array = null;
         var intruder:a_4206 = null;
         if(Boolean(a_1334 && iReduceLifeValue > 0) && Boolean(m_iDieType == 1) && this.trans >= 1)
         {
            arrMoveIntruder = a_1334.IntruderArray;
            for each(intruder in arrMoveIntruder)
            {
               if(intruder.isEatingDefense)
               {
                  intruder.a_3969(iReduceLifeValue);
                  break;
               }
            }
         }
         super.a_3969(iReduceLifeValue);
         return true;
      }
      
      override public function a_3957(iCurrentTime:int) : void
      {
         if(iCurrentTime % 2 == 0)
         {
            ++this.checkTick;
            if(this.readyDead == false && this.checkTick > 5)
            {
               this.CheckNoodles();
            }
            super.a_3957(iCurrentTime);
            if(a_1273 == a_1274 - 1)
            {
               m_iDieType = 2;
               super.a_3969(iLifeValue);
               if(a_1339 <= 0)
               {
                  this.a_3940();
               }
            }
         }
      }
      
      override public function a_3940() : Boolean
      {
         if(this.zhu != null)
         {
            this.zhu.RemoveCard(this);
            this.zhu = null;
         }
         return super.a_3940();
      }
      
      private function CanAttack() : Boolean
      {
         var grid:a_3491 = null;
         var j:int = 0;
         loop0:
         for(var i:int = -2; i <= 2; )
         {
            j = -2;
            while(true)
            {
               if(j > 2)
               {
                  i++;
                  continue loop0;
               }
               grid = a_1334.m_stCurrentBattbleFieldView.a_3438(a_1334.m_iXGridNo + i,a_1334.m_iYGridNo + j);
               if(Boolean(grid) && grid.a_1511.length > 0)
               {
                  break;
               }
               j++;
            }
            return true;
         }
         return false;
      }
      
      override public function a_3954(iCurrentTime:int) : Boolean
      {
         var grid:a_3491 = null;
         var i:int = 0;
         var j:int = 0;
         var arrMoveIntruder:Array = null;
         var stMoveIntruder:a_4206 = null;
         if(this.readyDead)
         {
            return true;
         }
         if(a_1340)
         {
            return true;
         }
         if(iCurrentTime > m_iPlaceTimeIntervals + a_1308 && iCurrentTime >= a_1321 + a_1309 && this.CanAttack())
         {
            a_1321 = iCurrentTime;
            a_1323 = 0;
            a_1307 = 1;
            a_1275 = 0;
            gotoAndStop((a_1276[1] as FrameLabel).frame);
         }
         if(a_1321 != 0 && iCurrentTime - a_1321 == a_1310)
         {
            ++a_1323;
            for(i = -2; i <= 2; i++)
            {
               for(j = -2; j <= 2; j++)
               {
                  grid = a_1334.m_stCurrentBattbleFieldView.a_3438(a_1334.m_iXGridNo + i,a_1334.m_iYGridNo + j);
                  if(grid != null)
                  {
                     arrMoveIntruder = grid.a_1511.slice();
                     for each(stMoveIntruder in arrMoveIntruder)
                     {
                        if(stMoveIntruder.iSpaceState == 0 && !stMoveIntruder.isCannotSeeByFighter)
                        {
                           if(stMoveIntruder.iLifeValue > 0 && stMoveIntruder.m_stCurrentFieldGrid != null)
                           {
                              BattleEffectUtil.AddHitEffect(stMoveIntruder,QiaotouRiceNoodlesHitEffectMovie);
                           }
                           if(this.trans >= 2)
                           {
                              stMoveIntruder.a_3969(a_1311 * 1.3);
                           }
                           else
                           {
                              stMoveIntruder.a_3969(a_1311);
                           }
                           stMoveIntruder.a_4208(b_182.a_432,1);
                        }
                     }
                  }
               }
            }
         }
         return true;
      }
      
      override protected function a_3955() : Number
      {
         return 55;
      }
      
      override protected function a_3956() : Number
      {
         return -25;
      }
      
      override protected function a_3964() : int
      {
         return 150;
      }
   }
}

