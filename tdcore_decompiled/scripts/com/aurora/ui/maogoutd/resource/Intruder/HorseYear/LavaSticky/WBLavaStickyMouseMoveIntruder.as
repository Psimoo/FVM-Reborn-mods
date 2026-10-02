package com.aurora.ui.maogoutd.resource.Intruder.HorseYear.LavaSticky
{
   import a_4718.b_182;
   import com.adobe.utils.RandomSeed;
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.Base.BaseGameMoveIntruder;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.effect.a_4108;
   
   public class WBLavaStickyMouseMoveIntruder extends BaseGameMoveIntruder
   {
      
      private var m_bChange:Boolean = false;
      
      private var battleView:BattleFieldView;
      
      private var m_stRandomSeed:RandomSeed = new RandomSeed();
      
      private var a_1334:a_3491;
      
      private var m_iAttackIndex:int = 0;
      
      private var m_bLastAttackAnim:Boolean = false;
      
      public function WBLavaStickyMouseMoveIntruder()
      {
         super();
      }
      
      public static function a_3926() : WBLavaStickyMouseMoveIntruder
      {
         return PoolManager.getInstance().CheckOutOne(WBLavaStickyMouseMoveIntruder,WBLavaStickyMouseMoveIntruderMovie) as WBLavaStickyMouseMoveIntruder;
      }
      
      override public function a_1797(iGlobalMoveFighterID:int, iIntruderMoveDirection:int) : Boolean
      {
         MAX_LIFE = 40000;
         INJURED_LIFE = 5000;
         ONE_GRID_SPEED = 5;
         super.a_1797(iGlobalMoveFighterID,iIntruderMoveDirection);
         a_1481 = false;
         a_1464 = true;
         this.m_bChange = false;
         SetAnimationOnce2Loop(0,1,0,1);
         tagCom.AddTag(401);
         this.m_iAttackIndex = 0;
         this.m_bLastAttackAnim = false;
         AddTag(5);
         AddTag(10);
         return true;
      }
      
      override protected function ResetMovieStatus() : Boolean
      {
         if(a_1339 > 0)
         {
            if(this.m_bChange == true)
            {
               SetAnimation(2,4);
            }
            else
            {
               SetAnimation(1,3);
            }
         }
         else
         {
            this.a_1334 = m_stCurrentFieldGrid;
            SetDeadAnim(5);
         }
         return true;
      }
      
      override public function a_4216(iCurrentTime:int) : Boolean
      {
         var bAttack:Boolean = false;
         var numOrigXPos:Number = x;
         if(!a_1460)
         {
            a_1460 = true;
            this.battleView = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView;
            this.m_stRandomSeed.setSeed(globalMoveFighterID - m_stCurrentFieldGrid.m_iYGridNo,globalMoveFighterID + m_stCurrentFieldGrid.m_iYGridNo);
         }
         super.a_4216(iCurrentTime);
         SetGameMapModePicnicPosition(numOrigXPos);
         if(m_stCurrentFieldGrid != null)
         {
            if(m_stCurrentFieldGrid.m_hasFireEffect)
            {
               AddTag(10);
            }
            else
            {
               RemoveTag(10);
            }
            if(this.m_bChange == false && this.CheckFieldGridList1())
            {
               SetSpeed(0);
               this.m_bChange = true;
               this.ResetMovieStatus();
            }
            else if(this.m_bChange == true && !this.CheckFieldGridList1())
            {
               SetSpeed(ONE_GRID_SPEED);
               this.m_bChange = false;
               this.m_iAttackIndex = 0;
               this.ResetMovieStatus();
            }
            if(iCurrentTime % 2 == 1)
            {
               bAttack = this.CheckAttackAnim();
               if(this.m_bLastAttackAnim == false && bAttack == true)
               {
                  ++this.m_iAttackIndex;
                  if(this.m_iAttackIndex >= 3)
                  {
                     this.m_iAttackIndex = 0;
                     this.AddShot(this.GetFieldGridList1(m_stCurrentFieldGrid.m_iXGridNo,m_stCurrentFieldGrid.m_iYGridNo));
                  }
               }
               this.m_bLastAttackAnim = bAttack;
            }
            if(m_stCurrentFieldGrid.m_isNeedTray == true)
            {
               a_1339 = 0;
               this.ResetMovieStatus();
            }
         }
         return true;
      }
      
      private function CheckAttackAnim() : Boolean
      {
         return a_1273 == 20 || a_1273 == 40 || a_1273 == 50 || a_1273 == 54;
      }
      
      override public function a_4140(iCurrentTime:int) : void
      {
         var bAttack:Boolean = false;
         super.a_4140(iCurrentTime);
         if(iCurrentTime % 2 == 0 && a_1275 == 5)
         {
            bAttack = this.CheckAttackAnim();
            if(this.m_bLastAttackAnim == false && bAttack == true)
            {
               if(a_1273 == 50)
               {
                  this.AddAllShot(this.GetFieldGridList3(this.a_1334.m_iXGridNo,this.a_1334.m_iYGridNo));
               }
               else if(a_1273 == 54)
               {
                  this.AddAllShot(this.GetFieldGridList2(this.a_1334.m_iXGridNo,this.a_1334.m_iYGridNo));
               }
            }
            this.m_bLastAttackAnim = bAttack;
         }
      }
      
      private function CheckFieldGridList1() : Boolean
      {
         var j:int = 0;
         if(m_stCurrentFieldGrid == null)
         {
            return false;
         }
         var iNoX:int = m_stCurrentFieldGrid.m_iXGridNo;
         var iNoY:int = m_stCurrentFieldGrid.m_iYGridNo;
         loop0:
         for(var i:int = 0; i <= 4; )
         {
            j = -2;
            while(true)
            {
               if(j > 2)
               {
                  i++;
                  continue loop0;
               }
               if(this.HasBuDing(iNoX - i,iNoY + j))
               {
                  break;
               }
               j++;
            }
            return true;
         }
         return false;
      }
      
      private function GetFieldGridList1(iNoX:int, iNoY:int) : Array
      {
         var j:int = 0;
         var list:Array = [];
         for(var i:int = 0; i <= 4; i++)
         {
            for(j = -2; j <= 2; j++)
            {
               if(this.HasBuDing(iNoX - i,iNoY + j))
               {
                  list.push([iNoX - i,iNoY + j]);
               }
            }
         }
         return list;
      }
      
      private function GetFieldGridList2(iNoX:int, iNoY:int) : Array
      {
         var j:int = 0;
         var list:Array = [];
         for(var i:int = 0; i <= 4; i++)
         {
            for(j = -2; j <= 2; j++)
            {
               if(i > 2 || Math.abs(j) == 2)
               {
                  if(this.HasBuDing(iNoX - i,iNoY + j))
                  {
                     list.push([iNoX - i,iNoY + j]);
                  }
               }
            }
         }
         return list;
      }
      
      private function GetFieldGridList3(iNoX:int, iNoY:int) : Array
      {
         var j:int = 0;
         var list:Array = [];
         for(var i:int = 0; i <= 2; i++)
         {
            for(j = -1; j <= 1; j++)
            {
               if(this.HasBuDing(iNoX - i,iNoY + j))
               {
                  list.push([iNoX - i,iNoY + j]);
               }
            }
         }
         return list;
      }
      
      private function HasBuDing(iNoX:int, iNoY:int) : Boolean
      {
         if(this.battleView == null)
         {
            return false;
         }
         var stFieldGrid:a_3491 = this.battleView.a_3438(iNoX,iNoY);
         if(stFieldGrid != null && stFieldGrid.m_stBaseAuxiliaryFighter != null && stFieldGrid.m_stBaseAuxiliaryFighter.numMoveSpeedMultiplier == -1)
         {
            return true;
         }
         return false;
      }
      
      private function AddOneShot(iNoX:int, iNoY:int) : void
      {
         if(this.battleView == null)
         {
            return;
         }
         var grid:a_3491 = this.battleView.a_3438(iNoX,iNoY);
         if(grid == null)
         {
            return;
         }
         var shot:WBLavaStickyShot = WBLavaStickyShot.a_4344();
         shot.SetTargetDefense(grid);
         var shotSpeed:Number = 20;
         if(a_1470 < 1 || a_1469 > 1 || a_1468 > 1)
         {
            shotSpeed = 10;
         }
         shot.a_1797(0,shotSpeed,0,x + 30,y + 1,this.battleView,grid);
         this.battleView.AddToBattleView(shot,BattleLayerDefine.SHOT_TYPE,grid);
      }
      
      private function AddAllShot(listArray:Array) : void
      {
         for(var i:int = 0; i < listArray.length; i++)
         {
            this.AddOneShot(listArray[i][0],listArray[i][1]);
         }
      }
      
      private function AddShot(listArray:Array) : void
      {
         if(listArray.length == 0)
         {
            return;
         }
         var idx:int = int(this.m_stRandomSeed.nextInt(listArray.length));
         this.AddOneShot(listArray[idx][0],listArray[idx][1]);
      }
      
      override public function a_4212() : Boolean
      {
         if(m_stCurrentFieldGrid != null && m_stCurrentFieldGrid.m_iXGridNo <= 1)
         {
            return super.a_4212();
         }
         return false;
      }
      
      override public function a_4208(iEffectType:int, iEffectTime:int, stBaseEffect:a_4108 = null) : void
      {
         if(b_182.a_435 == iEffectType || b_182.enm_shotEffectXuanYun == iEffectType)
         {
            return;
         }
         if(b_182.a_433 == iEffectType || b_182.enm_shotEffectFreezeStop == iEffectType || b_182.a_434 == iEffectType)
         {
            if(iEffectTime > 0)
            {
               if(iLifeValue > 4500)
               {
                  a_1339 = 4500;
                  this.ResetMovieStatus();
               }
               else
               {
                  ReduceLife2(500,[50001]);
               }
            }
            super.a_4208(iEffectType,iEffectTime,stBaseEffect);
         }
         else
         {
            super.a_4208(iEffectType,iEffectTime,stBaseEffect);
         }
      }
      
      override public function a_4213() : Boolean
      {
         return false;
      }
      
      override public function a_4210() : Boolean
      {
         return false;
      }
      
      override public function ShowBatDieEffect() : void
      {
      }
      
      override public function PowerfulBombReduceLifeRate(fRate:Number = 0.3, bIsIgnoreArmor:Boolean = false) : Boolean
      {
         if(a_1339 <= 0)
         {
            return false;
         }
         if(bIsIgnoreArmor)
         {
            a_4209(BOOM_INJURE_LIFE * fRate);
         }
         else
         {
            a_3969(BOOM_INJURE_LIFE * fRate);
         }
         return true;
      }
   }
}

