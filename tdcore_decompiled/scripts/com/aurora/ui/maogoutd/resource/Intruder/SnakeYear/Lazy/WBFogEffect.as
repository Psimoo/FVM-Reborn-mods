package com.aurora.ui.maogoutd.resource.Intruder.SnakeYear.Lazy
{
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.Util.BattleDestroyUtil;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.defender.a_3953;
   import com.aurora.ui.maogoutd.resource.effect.BaseGameEffect;
   import flash.display.FrameLabel;
   import flash.events.Event;
   
   public class WBFogEffect extends BaseGameEffect
   {
      
      public var m_TargetFieldGrid:a_3491;
      
      public var m_iState:int = 0;
      
      public var m_iFogTick:int = 0;
      
      public function WBFogEffect()
      {
         super();
      }
      
      public function InitData(grid:a_3491) : void
      {
         this.m_TargetFieldGrid = grid;
         this.m_iState = 1;
         this.m_iFogTick = 0;
         SetAnimationOnce2Loop(0,1);
         this.m_TargetFieldGrid.tagCom.AddTag(137);
      }
      
      override public function a_3940() : Boolean
      {
         this.m_TargetFieldGrid.tagCom.RemoveTag(137);
         super.a_3940();
         this.m_iState = 2;
         return true;
      }
      
      override protected function a_4109(a_4730:Event) : void
      {
         var state:int = 0;
         if(this.m_iState == 0 || this.m_iState == 1)
         {
            state = this.IsLight() ? 0 : 1;
            if(state != this.m_iState)
            {
               this.m_iFogTick = 0;
            }
            this.m_iState = state;
            if(this.m_iState == 1)
            {
               ++this.m_iFogTick;
               if(this.m_iFogTick == 11)
               {
                  this.m_iFogTick = 0;
                  BattleDestroyUtil.DamageOneGrid(this.m_TargetFieldGrid,10);
               }
            }
            if(this.HasFan())
            {
               if(this.m_iState != 1)
               {
                  this.a_3940();
                  return;
               }
               SetAnimation(2,true);
               this.m_iState = 2;
            }
         }
         if(this.m_iState == 0)
         {
            visible = false;
         }
         else
         {
            visible = true;
            nextFrame();
            if(a_1278 != null)
            {
               gotoAndStop((a_1276[a_1275] as FrameLabel).frame);
            }
            if(a_1273 == a_1274)
            {
               this.a_3940();
            }
         }
      }
      
      private function HasFan() : Boolean
      {
         var indexX:int = 0;
         var attackFighter:a_3953 = null;
         var typeID:int = 0;
         if(this.m_TargetFieldGrid == null)
         {
            return false;
         }
         var stFieldGridVector:Array = this.m_TargetFieldGrid.m_stCurrentBattbleFieldView.stFieldGridsVector;
         loop0:
         for(var indexY:int = 0; indexY < BattleFieldView.a_1012; )
         {
            indexX = 0;
            while(true)
            {
               if(indexX >= BattleFieldView.a_1011)
               {
                  indexY++;
                  continue loop0;
               }
               attackFighter = stFieldGridVector[indexY][indexX].m_stAttackFighter;
               if(attackFighter != null)
               {
                  typeID = attackFighter.a_3512();
                  if(typeID == 286851424 || typeID == 286851408 || typeID == 286851614 || typeID == 286851615)
                  {
                     break;
                  }
               }
               indexX++;
            }
            return true;
         }
         return false;
      }
      
      private function IsLight() : Boolean
      {
         var indexX:int = 0;
         if(this.m_TargetFieldGrid == null)
         {
            return false;
         }
         var stFieldGridVector:Array = this.m_TargetFieldGrid.m_stCurrentBattbleFieldView.stFieldGridsVector;
         var yStart:int = this.m_TargetFieldGrid.m_iYGridNo - 1 < 0 ? 0 : int(this.m_TargetFieldGrid.m_iYGridNo - 1);
         var xStart:int = this.m_TargetFieldGrid.m_iXGridNo - 1 < 0 ? 0 : int(this.m_TargetFieldGrid.m_iXGridNo - 1);
         var yEnd:int = this.m_TargetFieldGrid.m_iYGridNo + 1 >= BattleFieldView.a_1012 ? int(BattleFieldView.a_1012 - 1) : int(this.m_TargetFieldGrid.m_iYGridNo + 1);
         var xEnd:int = this.m_TargetFieldGrid.m_iXGridNo + 1 >= BattleFieldView.a_1011 ? int(BattleFieldView.a_1011 - 1) : int(this.m_TargetFieldGrid.m_iXGridNo + 1);
         loop0:
         for(var indexY:int = yStart; indexY <= yEnd; )
         {
            indexX = xStart;
            while(true)
            {
               if(indexX > xEnd)
               {
                  indexY++;
                  continue loop0;
               }
               if(Boolean(stFieldGridVector[indexY][indexX].m_stFlowerDefense) && stFieldGridVector[indexY][indexX].m_stFlowerDefense.iEnergyTypeID == 1)
               {
                  break;
               }
               indexX++;
            }
            return true;
         }
         loop2:
         for(indexY = 0; indexY < BattleFieldView.a_1012; )
         {
            indexX = 0;
            while(true)
            {
               if(indexX >= BattleFieldView.a_1011)
               {
                  indexY++;
                  continue loop2;
               }
               if(Boolean(stFieldGridVector[indexY][indexX].m_stFlowerDefense) && stFieldGridVector[indexY][indexX].m_stFlowerDefense.iEnergyTypeID == 3)
               {
                  break;
               }
               indexX++;
            }
            return true;
         }
         return false;
      }
   }
}

