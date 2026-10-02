package com.aurora.ui.maogoutd.resource.Intruder.DragonYear.SummerLittleMouse
{
   import a_4718.b_181;
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.defender.a_3962;
   import com.aurora.ui.maogoutd.resource.effect.AddBloodEffect;
   import com.aurora.ui.maogoutd.resource.effect.SpaceMarkEffect;
   import com.aurora.ui.maogoutd.resource.effect.a_4143;
   import flash.display.FrameLabel;
   
   public class SpaceSignalMouseMoveIntruder extends a_4206
   {
      
      private static const MAX_LIFE:int = 2400;
      
      private static const MAX_INJURED_LIFE:int = MAX_LIFE * 0.3;
      
      private static const ONE_GRID_SPEED:int = 6;
      
      private var m_hasAddHpMouseArr:Array = new Array();
      
      private var m_bSeekTarget:Boolean = false;
      
      private var m_iCreateAddHPTick:int = 0;
      
      private var m_bHasCreateSignal:Boolean = false;
      
      public function SpaceSignalMouseMoveIntruder()
      {
         super();
      }
      
      public static function a_3926() : a_4206
      {
         return PoolManager.getInstance().CheckOutOne(SpaceSignalMouseMoveIntruder) as SpaceSignalMouseMoveIntruder;
      }
      
      override protected function getBindMovie() : Class
      {
         return SpaceSignalMouseMoveIntruderMovie;
      }
      
      override public function a_1797(iGlobalMoveFighterID:int, iIntruderMoveDirection:int) : Boolean
      {
         super.a_1797(iGlobalMoveFighterID,iIntruderMoveDirection);
         a_1350 = a_3491.a_1080 / (20 * ONE_GRID_SPEED);
         if(iIntruderMoveDirection < 0)
         {
            a_1350 *= -1;
         }
         a_1465 = 3;
         a_1464 = true;
         a_1339 = MAX_LIFE;
         a_1279 = -width * 0.2;
         m_iYDisplayCenterPos = -30;
         a_1272 = 0;
         this.m_bSeekTarget = false;
         this.m_iCreateAddHPTick = 0;
         this.m_bHasCreateSignal = false;
         this.m_hasAddHpMouseArr.length = 0;
         return true;
      }
      
      public function SetAnimation(animIdx:int, addIdx:int = 0) : void
      {
         if(a_1339 > 0 && a_1339 < MAX_INJURED_LIFE)
         {
            animIdx += addIdx;
         }
         if(a_1275 != animIdx)
         {
            a_1275 = animIdx;
            gotoAndStop((a_1276[animIdx] as FrameLabel).frame);
            a_3419();
         }
      }
      
      public function SetAnimationOnce2Loop(onceAnimIdx:int, loopAnimIdx:int, addIdx:int = 0) : void
      {
         if(a_1339 > 0 && a_1339 < MAX_INJURED_LIFE)
         {
            onceAnimIdx += addIdx;
            loopAnimIdx += addIdx;
         }
         a_1275 = loopAnimIdx;
         gotoAndStop((a_1276[onceAnimIdx] as FrameLabel).frame);
         a_3419();
      }
      
      override protected function a_3940() : Boolean
      {
         this.m_hasAddHpMouseArr.length = 0;
         this.m_bSeekTarget = false;
         super.a_3940();
         return true;
      }
      
      override protected function ResetMovieStatus() : Boolean
      {
         if(a_1339 <= 0 && a_1275 != 10)
         {
            a_1275 = 10;
            gotoAndStop((a_1276[10] as FrameLabel).frame);
            a_3419();
            if(m_stCurrentFieldGrid)
            {
               m_stCurrentFieldGrid.a_3457(this);
               m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3457(this);
            }
            this.play();
         }
         else if(this.m_iCreateAddHPTick > 40)
         {
            this.SetAnimation(5,3);
         }
         else
         {
            this.SetAnimation(0,1);
         }
         return true;
      }
      
      override public function a_3969(iRduceLifeValue:int) : Boolean
      {
         super.a_3969(iRduceLifeValue);
         return true;
      }
      
      override public function a_4212() : Boolean
      {
         if(m_stCurrentFieldGrid)
         {
            this.a_3969(900);
         }
         else
         {
            a_1339 = 0;
            this.a_3940();
         }
         return true;
      }
      
      override public function a_4213() : Boolean
      {
         a_1339 = 0;
         if(m_stCurrentFieldGrid)
         {
            m_stCurrentFieldGrid.a_3457(this);
            m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3457(this);
         }
         this.a_3940();
         return true;
      }
      
      override public function a_4210() : Boolean
      {
         var stSmallMouseBoomdie:a_4143 = null;
         if(m_stCurrentFieldGrid != null && m_stCurrentFieldGrid.m_iHurtRate <= 0)
         {
            return true;
         }
         this.a_3969(900);
         if(a_1339 <= 0)
         {
            if(m_stCurrentFieldGrid)
            {
               m_stCurrentFieldGrid.a_3457(this);
               m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3457(this);
            }
            stSmallMouseBoomdie = a_4143.a_3926();
            stSmallMouseBoomdie.a_1797(a_1283);
            stSmallMouseBoomdie.x = x;
            stSmallMouseBoomdie.y = y;
            parent.addChildAt(stSmallMouseBoomdie,parent.getChildIndex(this));
            this.a_3940();
         }
         return true;
      }
      
      override public function a_4215(stBaseDefense:a_3962) : Boolean
      {
         super.a_4215(stBaseDefense);
         return true;
      }
      
      override public function a_4216(iCurrentTime:int) : Boolean
      {
         var stFieldGridVector:Array = null;
         var xEnd:int = 0;
         var a_1334:a_3491 = null;
         var maxHP:int = 0;
         var iIndex:int = 0;
         var grid:a_3491 = null;
         var stSpaceMarkEffect:SpaceMarkEffect = null;
         var i:int = 0;
         var item:a_4206 = null;
         var stAddBloodEffect:AddBloodEffect = null;
         if(!a_1460)
         {
            a_1460 = true;
         }
         if(m_stCurrentFieldGrid.m_iXGridNo == 8 && x <= 8.25 * a_3491.a_1080 && !this.m_bSeekTarget)
         {
            this.m_bSeekTarget = true;
            this.SetAnimationOnce2Loop(2,0,1);
            this.m_iCreateAddHPTick = 1;
         }
         if((a_1273 == 27 || a_1273 == 43) && this.m_bHasCreateSignal == false)
         {
            this.m_bHasCreateSignal = true;
            stFieldGridVector = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.stFieldGridsVector;
            xEnd = BattleFieldView.a_1011 - 1;
            a_1334 = null;
            maxHP = 0;
            for(iIndex = 0; iIndex <= xEnd; iIndex++)
            {
               grid = stFieldGridVector[m_stCurrentFieldGrid.m_iYGridNo][iIndex];
               if(grid != null)
               {
                  if(grid.m_stAttackFighter != null && grid.m_stAttackFighter.iLifeValue > maxHP)
                  {
                     maxHP = grid.m_stAttackFighter.iLifeValue;
                     a_1334 = grid;
                  }
                  else if(grid.m_stFlowerDefense != null && grid.m_stFlowerDefense.iLifeValue > maxHP)
                  {
                     maxHP = grid.m_stFlowerDefense.iLifeValue;
                     a_1334 = grid;
                  }
                  else if(grid.m_stBaseAuxiliaryFighter != null && grid.m_stBaseAuxiliaryFighter.iLifeValue > maxHP)
                  {
                     maxHP = grid.m_stBaseAuxiliaryFighter.iLifeValue;
                     a_1334 = grid;
                  }
                  else if(grid.m_stProtector != null && grid.m_stProtector.iLifeValue > maxHP)
                  {
                     maxHP = grid.m_stProtector.iLifeValue;
                     a_1334 = grid;
                  }
                  else if(grid.m_stTrayDefense != null && grid.m_stTrayDefense.iLifeValue > maxHP)
                  {
                     maxHP = grid.m_stTrayDefense.iLifeValue;
                     a_1334 = grid;
                  }
               }
            }
            if(a_1334 != null && a_1334.m_stSpaceMarkEffect == null)
            {
               stSpaceMarkEffect = SpaceMarkEffect.a_3926();
               stSpaceMarkEffect.a_1797(false,a_1334);
               stSpaceMarkEffect.a_3958 = 10;
            }
         }
         if(this.m_iCreateAddHPTick > 0)
         {
            ++this.m_iCreateAddHPTick;
            if(this.m_iCreateAddHPTick == 40)
            {
               this.SetAnimationOnce2Loop(4,5,3);
            }
         }
         if(a_1275 == 5 || a_1275 == 8)
         {
            for(i = 0; i < m_stCurrentFieldGrid.a_1511.length; i++)
            {
               item = m_stCurrentFieldGrid.a_1511[i];
               if(item.globalMoveFighterID != globalMoveFighterID && this.m_hasAddHpMouseArr.indexOf(item.globalMoveFighterID) == -1 && item.iSpaceState == 0)
               {
                  this.m_hasAddHpMouseArr.push(item.globalMoveFighterID);
                  item.a_3969(-20000);
                  stAddBloodEffect = AddBloodEffect.a_3926();
                  stAddBloodEffect.a_1797(false);
                  stAddBloodEffect.x = item.x;
                  stAddBloodEffect.y = item.y;
                  m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(stAddBloodEffect,BattleLayerDefine.EFFECTS_TOP_TYPE);
               }
            }
            return true;
         }
         if(this.m_bSeekTarget == true)
         {
            return true;
         }
         var numOrigXPos:Number = x;
         super.a_4216(iCurrentTime);
         if(a_1457 == b_181.a_424 && (x > a_3491.a_1080 * 4 && a_1283 || x < a_3491.a_1080 * 5 && !a_1283))
         {
            y += Math.tan(15 * Math.PI / 180) * Math.abs(numOrigXPos - x);
         }
         return true;
      }
      
      override public function play() : void
      {
         super.play();
      }
   }
}

