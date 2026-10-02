package com.aurora.ui.maogoutd.resource.Intruder.HorseYear.DesireKing.P3
{
   import a_4728.a_1778;
   import a_4729.a_1789;
   import com.aurora.ui.maogoutd.game.Util.BattleDestroyUtil;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.HorseYear.DesireKing.WBDesireKingUtil;
   import com.aurora.ui.maogoutd.resource.effect.BaseGameEffect;
   import flash.events.Event;
   
   public class WBDesireKingP3TPEffect extends BaseGameEffect
   {
      
      public static const ROLL_TIME:int = 50;
      
      private var _grid:a_3491;
      
      private var _tick:int = 0;
      
      private var _rollTick:int = -1;
      
      private var _firstLight:Boolean = false;
      
      public function WBDesireKingP3TPEffect()
      {
         super();
      }
      
      public function InitData(grid:a_3491) : void
      {
         this._grid = grid;
         this._tick = 0;
         this._rollTick = -1;
         this._firstLight = false;
         SetAnimation(0);
         this.AddTags();
         BattleDestroyUtil.ClearOneGridIgnoreFangYu(grid);
         a_1789.getInstance().addEventListener("WBDesireKing3Skill5",this.OnWBDesireKing3Skill5);
      }
      
      private function OnWBDesireKing3Skill5(stDataEvent:a_1778) : void
      {
         this.BeginRoll();
      }
      
      override protected function a_4109(a_4730:Event) : void
      {
         super.a_4109(a_4730);
         ++this._tick;
         if(this._rollTick != -1)
         {
            if(this._tick - this._rollTick >= ROLL_TIME)
            {
               if(this.HasLight())
               {
                  SetAnimationOnce2Loop(3,0);
                  this._rollTick = -1;
                  this.AddTags();
               }
            }
         }
         else if(this._firstLight && !this.HasLight())
         {
            this.BeginRoll();
         }
      }
      
      private function HasLight() : Boolean
      {
         var grid:a_3491 = null;
         var j:int = 0;
         loop0:
         for(var i:int = -1; i <= 1; )
         {
            j = -1;
            while(true)
            {
               if(j > 1)
               {
                  i++;
                  continue loop0;
               }
               grid = this._grid.m_stCurrentBattbleFieldView.a_3438(this._grid.m_iXGridNo + i,this._grid.m_iYGridNo + j);
               if(WBDesireKingUtil.HasLight(grid))
               {
                  break;
               }
               j++;
            }
            return true;
         }
         return false;
      }
      
      private function AddTags() : void
      {
         var grid:a_3491 = null;
         var j:int = 0;
         for(var i:int = -1; i <= 1; i++)
         {
            for(j = -1; j <= 1; j++)
            {
               grid = this._grid.m_stCurrentBattbleFieldView.a_3438(this._grid.m_iXGridNo + i,this._grid.m_iYGridNo + j);
               if(grid != null)
               {
                  grid.tagCom.AddTag(20027);
               }
            }
         }
      }
      
      private function RemoveTags() : void
      {
         var grid:a_3491 = null;
         var j:int = 0;
         for(var i:int = -1; i <= 1; i++)
         {
            for(j = -1; j <= 1; j++)
            {
               grid = this._grid.m_stCurrentBattbleFieldView.a_3438(this._grid.m_iXGridNo + i,this._grid.m_iYGridNo + j);
               if(grid != null)
               {
                  grid.tagCom.RemoveTag(20027);
               }
            }
         }
      }
      
      public function BeginRoll() : void
      {
         this._rollTick = this._tick;
         this._firstLight = true;
         this.RemoveTags();
         SetAnimationOnce2Loop(1,2);
      }
      
      override public function a_3940() : Boolean
      {
         a_1789.getInstance().removeEventListener("WBDesireKing3Skill5",this.OnWBDesireKing3Skill5);
         return super.a_3940();
      }
   }
}

