package com.aurora.ui.maogoutd.resource.gamemap.newMap.SnakeYear.DietaryFarm
{
   import a_4728.a_1778;
   import a_4729.a_1789;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.effect.a_4108;
   import flash.display.FrameLabel;
   import flash.events.Event;
   
   public class DietaryFarmCupMoveIntruder extends a_4108
   {
      
      public var stFieldGrid:a_3491;
      
      private var m_iState:int = 0;
      
      private var m_iLeaveTime:int = 0;
      
      public function DietaryFarmCupMoveIntruder()
      {
         super();
         a_1279 = -5;
         m_iYDisplayCenterPos = 35;
      }
      
      override public function a_1797(isReseaved:Boolean) : Boolean
      {
         super.a_1797(isReseaved);
         PlayAnimation(0);
         this.m_iState = 0;
         this.stFieldGrid.tagCom.AddTag(22);
         this.stFieldGrid.m_iFieldGridType = 4;
         a_1279 = -5;
         m_iYDisplayCenterPos = 35;
         return true;
      }
      
      public function SetOffsetY(offsetY:int) : void
      {
         m_iYDisplayCenterPos = offsetY;
      }
      
      override protected function a_4109(a_4730:Event) : void
      {
         nextFrame();
         if(a_1278 != null)
         {
            gotoAndStop((a_1276[a_1275] as FrameLabel).frame);
         }
         if(a_1273 == 46)
         {
            this.a_4210();
         }
         if(this.m_iState == 3)
         {
            --this.m_iLeaveTime;
            if(this.m_iLeaveTime <= 0)
            {
               this.SetStep(0);
            }
         }
         else if(this.stFieldGrid.m_stBoomDefense != null)
         {
            if(this.stFieldGrid.m_stBoomDefense != null)
            {
               this.stFieldGrid.m_stBoomDefense.m_iDieType = 2;
               this.stFieldGrid.m_stBoomDefense.a_3969(this.stFieldGrid.m_stBoomDefense.iLifeValue);
            }
            ++this.m_iState;
            this.SetStep(this.m_iState);
         }
      }
      
      public function a_4210() : void
      {
         var xIndex:int = 0;
         var arrMoveIntruder:Array = null;
         var stMoveIntruder:a_4206 = null;
         a_1789.getInstance().dispatchEvent(new a_1778("Boom_JunBao_Mouse"));
         BattleFieldView.a_1048.play();
         this.stFieldGrid.m_stCurrentBattbleFieldView.a_3466();
         var xStart:int = Math.max(this.stFieldGrid.m_iXGridNo - 2,0);
         var xEnd:int = Math.min(this.stFieldGrid.m_iXGridNo + 2,BattleFieldView.a_1011 - 1);
         var yStart:int = Math.max(this.stFieldGrid.m_iYGridNo - 2,0);
         var yEnd:int = Math.min(this.stFieldGrid.m_iYGridNo + 2,BattleFieldView.a_1012 - 1);
         var stFieldGridVector:Array = this.stFieldGrid.m_stCurrentBattbleFieldView.stFieldGridsVector;
         for(var yIndex:int = yStart; yIndex <= yEnd; yIndex++)
         {
            for(xIndex = xStart; xIndex <= xEnd; xIndex++)
            {
               arrMoveIntruder = stFieldGridVector[yIndex][xIndex].a_1511.slice();
               for each(stMoveIntruder in arrMoveIntruder)
               {
                  if(stMoveIntruder.IsBossIntruder)
                  {
                     stMoveIntruder.ReduceLife2(40000);
                  }
                  else
                  {
                     stMoveIntruder.ReduceLife2(8000,[110]);
                     if(stMoveIntruder.iLifeValue <= 0)
                     {
                        stMoveIntruder.ShowBoomDieEffect();
                        stMoveIntruder.a_3432();
                     }
                  }
               }
            }
         }
      }
      
      public function SetStep(state:int) : void
      {
         this.m_iState = state;
         if(state == 0)
         {
            this.stFieldGrid.tagCom.AddTag(22);
            ShowPlayAnimation(7,0);
            this.stFieldGrid.m_iFieldGridType = 4;
         }
         else if(state == 1)
         {
            ShowPlayAnimation(1,2);
            this.stFieldGrid.m_iFieldGridType = 4;
         }
         else if(state == 2)
         {
            ShowPlayAnimation(3,4);
            this.stFieldGrid.m_iFieldGridType = 4;
         }
         else if(state == 3)
         {
            this.stFieldGrid.tagCom.RemoveTag(22);
            ShowPlayAnimation(5,6);
            this.m_iLeaveTime = 520;
            this.stFieldGrid.m_iFieldGridType = 8;
         }
      }
      
      override public function a_3940() : Boolean
      {
         this.stFieldGrid.tagCom.RemoveTag(22);
         super.a_3940();
         return true;
      }
   }
}

