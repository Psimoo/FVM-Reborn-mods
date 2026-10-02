package com.aurora.ui.maogoutd.resource.effect
{
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.avatar.a_3924;
   import flash.display.FrameLabel;
   
   public class BaseDesertFogEffect extends a_4110
   {
      
      private var a_1334:a_3491;
      
      private var m_iRunTick:int = 0;
      
      private var m_iClearTick:int = 0;
      
      private var m_iNoX:int = 0;
      
      private var m_iNoY:int = 0;
      
      private var _battleView:BattleFieldView;
      
      public function BaseDesertFogEffect()
      {
         super();
      }
      
      public function InitData(grid:a_3491, clearTick:int = 0) : void
      {
         this.a_1334 = grid;
         this.m_iClearTick = clearTick;
         this.m_iRunTick = 0;
         this.m_iNoX = grid.m_iXGridNo;
         this.m_iNoY = grid.m_iYGridNo;
         this._battleView = this.a_1334.m_stCurrentBattbleFieldView;
      }
      
      public function InitData2(iNoX:int, iNoY:int, battleView:BattleFieldView) : void
      {
         this.a_1334 = null;
         this.m_iClearTick = 0;
         this.m_iRunTick = 0;
         this.m_iNoX = iNoX;
         this.m_iNoY = iNoY;
         this._battleView = battleView;
      }
      
      public function showFog() : void
      {
         a_1275 = 0;
         gotoAndStop((a_1276[a_1275] as FrameLabel).frame);
      }
      
      public function clearFog() : void
      {
         a_1275 = 2;
         gotoAndStop((a_1276[a_1275] as FrameLabel).frame);
      }
      
      override public function a_3957(iCurrentTime:int) : void
      {
         var grid:a_3491 = null;
         var cc:int = 0;
         var xx:Array = null;
         var hasShadow:Boolean = false;
         for(var i:int = 0; i < BattleFieldView.a_1011; i++)
         {
            grid = this._battleView.a_3438(i,this.m_iNoY);
            if(grid.HasTag(31))
            {
               hasShadow = true;
               break;
            }
         }
         visible = !hasShadow;
         if(a_1275 != 2 && this.m_iClearTick > 0 && visible == true)
         {
            ++this.m_iRunTick;
            if(this.m_iRunTick == this.m_iClearTick)
            {
               this.a_3502(this.a_1334);
               this.m_iRunTick = 0;
            }
         }
         if(iCurrentTime % 2 == 0)
         {
            nextFrame();
            cc = a_1273;
            xx = a_1276;
            if(a_1278 != null)
            {
               gotoAndStop((a_1276[a_1275] as FrameLabel).frame);
            }
            if(a_1273 == (a_1276[0] as FrameLabel).frame)
            {
               a_1275 = 1;
               gotoAndStop((a_1276[a_1275] as FrameLabel).frame);
            }
            if(a_1273 == a_1274)
            {
               a_3940();
            }
         }
      }
      
      protected function a_3502(stFieldGrid:a_3491) : Boolean
      {
         if(stFieldGrid == null)
         {
            return true;
         }
         if(null != stFieldGrid.m_stProtector)
         {
            stFieldGrid.m_stProtector.m_iDieType = 1;
            stFieldGrid.m_stProtector.a_3969(stFieldGrid.m_stProtector.iLifeValue);
         }
         if(null != stFieldGrid.m_stAttackFighter && !(stFieldGrid.m_stAttackFighter is a_3924))
         {
            stFieldGrid.m_stAttackFighter.m_iDieType = 1;
            stFieldGrid.m_stAttackFighter.a_3969(stFieldGrid.m_stAttackFighter.iLifeValue);
         }
         if(null != stFieldGrid.m_stBoomDefense)
         {
            stFieldGrid.m_stBoomDefense.m_iDieType = 1;
            stFieldGrid.m_stBoomDefense.a_3969(stFieldGrid.m_stBoomDefense.iLifeValue);
         }
         if(null != stFieldGrid.m_stFlowerDefense)
         {
            stFieldGrid.m_stFlowerDefense.m_iDieType = 1;
            stFieldGrid.m_stFlowerDefense.a_3969(stFieldGrid.m_stFlowerDefense.iLifeValue);
         }
         if(null != stFieldGrid.m_stBaseAuxiliaryFighter)
         {
            stFieldGrid.m_stBaseAuxiliaryFighter.m_iDieType = 1;
            stFieldGrid.m_stBaseAuxiliaryFighter.a_3969(stFieldGrid.m_stBaseAuxiliaryFighter.iLifeValue);
         }
         stFieldGrid.DamageNewSlot(true,0,true,0,1);
         if(null != stFieldGrid.m_stTrayDefense)
         {
            stFieldGrid.m_stTrayDefense.m_iDieType = 1;
            stFieldGrid.m_stTrayDefense.a_3969(stFieldGrid.m_stTrayDefense.iLifeValue);
         }
         return true;
      }
   }
}

