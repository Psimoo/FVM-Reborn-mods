package com.aurora.ui.maogoutd.resource.Intruder.HorseYear.DesireKing
{
   import a_4728.a_1778;
   import a_4729.a_1789;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.Util.BattleDestroyUtil;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.HorseYear.DesireKing.Child.WBDesireChildMutAnglerMoveIntruder;
   import com.aurora.ui.maogoutd.resource.Intruder.HorseYear.DesireKing.Child.WBDesireChildMutLobCannonMoveIntruder;
   import com.aurora.ui.maogoutd.resource.Intruder.HorseYear.DesireKing.Child.WBDesireChildMutPineBreadMoveIntruder;
   import com.aurora.ui.maogoutd.resource.Intruder.HorseYear.DesireKing.Child.WBDesireChildMutWineLampMoveIntruder;
   import com.aurora.ui.maogoutd.resource.Intruder.HorseYear.DesireKing.Child.WBVariationCardMoveIntruder;
   import com.aurora.ui.maogoutd.resource.avatar.a_3924;
   import com.aurora.ui.maogoutd.resource.effect.BaseGameEffect;
   import flash.events.Event;
   
   public class WBDesireKingRainbowNoteEffect extends BaseGameEffect
   {
      
      private static var CHANGE_HP:int = 50;
      
      private static var DAMAGE_HP:int = 10;
      
      private var stFieldGrid:a_3491;
      
      private var _runTick:int = 0;
      
      public function WBDesireKingRainbowNoteEffect()
      {
         super();
      }
      
      override protected function a_4109(a_4730:Event) : void
      {
         super.a_4109(a_4730);
         ++this._runTick;
         if(this._runTick == 10 || this._runTick == 20 || this._runTick == 30 || this._runTick == 40 || this._runTick == 50)
         {
            this.a_3969();
            if(this._runTick == 50)
            {
               this.ToTheEnd();
            }
         }
         else if(!WBDesireKingUtil.HasRainbowDamageDefence(this.stFieldGrid))
         {
            this.ToTheEnd();
            return;
         }
      }
      
      public function ToTheEnd() : void
      {
         SetAnimation(2,true);
         this._runTick = 51;
      }
      
      public function InitData(grid:a_3491) : void
      {
         this.stFieldGrid = grid;
         this._runTick = 0;
         SetAnimationOnce2Loop(0,1);
         this.ChangeHp();
         a_1789.getInstance().addEventListener("WBDesireKingDead",this.OnWBDesireKingDead);
      }
      
      private function OnWBDesireKingDead(stDataEvent:a_1778) : void
      {
         this.a_3940();
      }
      
      private function ChangeHp() : void
      {
         if(null != this.stFieldGrid.m_stAttackFighter && this.stFieldGrid.m_stAttackFighter is a_3924)
         {
            return;
         }
         if(null != this.stFieldGrid.m_stBaseToolDefense)
         {
            this.stFieldGrid.m_stBaseToolDefense.a_1339 = CHANGE_HP;
         }
         if(null != this.stFieldGrid.m_stProtector)
         {
            this.stFieldGrid.m_stProtector.a_1339 = CHANGE_HP;
         }
         if(null != this.stFieldGrid.m_stAttackFighter && !(this.stFieldGrid.m_stAttackFighter is a_3924))
         {
            this.stFieldGrid.m_stAttackFighter.a_1339 = CHANGE_HP;
         }
         if(null != this.stFieldGrid.m_stBoomDefense)
         {
            this.stFieldGrid.m_stBoomDefense.a_1339 = CHANGE_HP;
         }
         if(null != this.stFieldGrid.m_stFlowerDefense)
         {
            this.stFieldGrid.m_stFlowerDefense.a_1339 = CHANGE_HP;
         }
         if(null != this.stFieldGrid.m_stBaseAuxiliaryFighter)
         {
            this.stFieldGrid.m_stBaseAuxiliaryFighter.a_1339 = CHANGE_HP;
         }
      }
      
      private function Change2Bread() : void
      {
         BattleDestroyUtil.ClearOneGridIgnoreFangYu(this.stFieldGrid);
         this.CreateMouse(WBDesireChildMutPineBreadMoveIntruder.a_3926());
      }
      
      private function Change2Fish() : void
      {
         BattleDestroyUtil.ClearOneGridIgnoreFangYu(this.stFieldGrid);
         this.CreateMouse(WBDesireChildMutAnglerMoveIntruder.a_3926());
      }
      
      private function Change2God() : void
      {
         BattleDestroyUtil.ClearOneGridIgnoreFangYu(this.stFieldGrid);
         this.CreateMouse(WBDesireChildMutLobCannonMoveIntruder.a_3926());
      }
      
      private function Change2Lamp() : void
      {
         BattleDestroyUtil.ClearOneGridIgnoreFangYu(this.stFieldGrid);
         this.CreateMouse(WBDesireChildMutWineLampMoveIntruder.a_3926());
      }
      
      protected function CreateMouse(mouse:WBVariationCardMoveIntruder) : void
      {
         mouse.a_1797((1 << 16) + this.stFieldGrid.m_iYGridNo + 100 + this.stFieldGrid.m_iXGridNo,-1);
         mouse.m_stMoveIntruderTypeID = 134234385;
         this.stFieldGrid.m_stCurrentBattbleFieldView.a_3459(mouse,this.stFieldGrid,false,BattleLayerDefine.INTRUDER_LAND_TYPE);
         mouse.x = (this.stFieldGrid.m_iXGridNo + 0.5) * a_3491.a_1080;
         mouse.y = (this.stFieldGrid.m_iYGridNo + 0.5) * a_3491.a_1081;
      }
      
      private function a_3969() : void
      {
         var type:int = 0;
         if(null != this.stFieldGrid.m_stAttackFighter && this.stFieldGrid.m_stAttackFighter is a_3924)
         {
            return;
         }
         if(null != this.stFieldGrid.m_stBaseToolDefense)
         {
            this.stFieldGrid.m_stBaseToolDefense.m_iDieType = 1;
            this.stFieldGrid.m_stBaseToolDefense.a_3969(DAMAGE_HP);
         }
         if(null != this.stFieldGrid.m_stProtector)
         {
            this.stFieldGrid.m_stProtector.m_iDieType = 1;
            this.stFieldGrid.m_stProtector.a_3969(DAMAGE_HP);
            if(this.stFieldGrid.m_stProtector == null)
            {
               this.Change2Bread();
               return;
            }
         }
         if(null != this.stFieldGrid.m_stAttackFighter && !(this.stFieldGrid.m_stAttackFighter is a_3924))
         {
            type = 0;
            if(this.stFieldGrid.m_stAttackFighter.tagCom.HasTag(30030))
            {
               type = 1;
            }
            else if(this.stFieldGrid.m_stAttackFighter.tagCom.HasTag(30031))
            {
               type = 2;
            }
            this.stFieldGrid.m_stAttackFighter.m_iDieType = 1;
            this.stFieldGrid.m_stAttackFighter.a_3969(DAMAGE_HP);
            if(this.stFieldGrid.m_stAttackFighter == null)
            {
               if(type == 0)
               {
                  this.Change2Fish();
               }
               else if(type == 1)
               {
                  this.Change2Bread();
               }
               else
               {
                  this.Change2God();
               }
               return;
            }
         }
         if(null != this.stFieldGrid.m_stBoomDefense)
         {
            this.stFieldGrid.m_stBoomDefense.m_iDieType = 1;
            this.stFieldGrid.m_stBoomDefense.a_3969(DAMAGE_HP);
         }
         if(null != this.stFieldGrid.m_stFlowerDefense)
         {
            this.stFieldGrid.m_stFlowerDefense.m_iDieType = 1;
            this.stFieldGrid.m_stFlowerDefense.a_3969(DAMAGE_HP);
            if(this.stFieldGrid.m_stFlowerDefense == null)
            {
               this.Change2Lamp();
               return;
            }
         }
         if(null != this.stFieldGrid.m_stBaseAuxiliaryFighter)
         {
            this.stFieldGrid.m_stBaseAuxiliaryFighter.m_iDieType = 1;
            this.stFieldGrid.m_stBaseAuxiliaryFighter.a_3969(DAMAGE_HP);
         }
      }
      
      override public function a_3940() : Boolean
      {
         a_1789.getInstance().removeEventListener("WBDesireKingDead",this.OnWBDesireKingDead);
         return super.a_3940();
      }
   }
}

