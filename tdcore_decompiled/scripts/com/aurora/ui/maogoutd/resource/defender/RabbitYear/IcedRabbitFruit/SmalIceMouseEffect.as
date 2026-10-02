package com.aurora.ui.maogoutd.resource.defender.RabbitYear.IcedRabbitFruit
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.effect.a_4108;
   import flash.display.FrameLabel;
   import flash.events.Event;
   
   public class SmalIceMouseEffect extends a_4108
   {
      
      public static var MaxmouseCount:int = 0;
      
      private var m_iStartTime:int;
      
      private var m_iboomSkill:Boolean;
      
      public var stOriginalFieldGrid:a_3491;
      
      private var m_iWaitTime:int;
      
      public function SmalIceMouseEffect()
      {
         super();
         a_1279 = -30;
         m_iYDisplayCenterPos = -30;
      }
      
      public static function a_3926() : SmalIceMouseEffect
      {
         return PoolManager.getInstance().CheckOutOne(SmalIceMouseEffect) as SmalIceMouseEffect;
      }
      
      override protected function getBindMovie() : Class
      {
         return SmalIceMouseEffectMovie;
      }
      
      override public function a_1797(isReversed:Boolean) : Boolean
      {
         super.a_1797(isReversed);
         this.m_iStartTime = 0;
         this.m_iboomSkill = false;
         a_1275 = 0;
         this.addShield(this.stOriginalFieldGrid);
         play();
         return true;
      }
      
      public function get WaitTime() : int
      {
         return this.m_iWaitTime;
      }
      
      public function set WaitTime(iWaitTime:int) : void
      {
         this.m_iWaitTime = iWaitTime;
      }
      
      override protected function a_4109(a_4730:Event) : void
      {
         nextFrame();
         if(a_1278 != null)
         {
            gotoAndStop((a_1276[a_1275] as FrameLabel).frame);
         }
         if(a_1273 == a_1274 - 5 && !this.m_iboomSkill)
         {
            this.m_iboomSkill = true;
            this.TatalRangeBoom(this.stOriginalFieldGrid,2);
         }
         else if(a_1273 == a_1274)
         {
            this.a_3940();
         }
         ++this.m_iStartTime;
         if(this.m_iboomSkill)
         {
            return;
         }
         if(this.m_iStartTime > this.WaitTime * 10 || Boolean(this.m_iStartTime >= 10 && this.stOriginalFieldGrid) && Boolean(this.stOriginalFieldGrid.m_isOccupy))
         {
            if(a_1275 != 1)
            {
               a_1275 = 1;
               gotoAndStop((a_1276[a_1275] as FrameLabel).frame);
            }
         }
      }
      
      protected function addShield(stFieldGrid:a_3491) : Boolean
      {
         if(!stFieldGrid)
         {
            return false;
         }
         if(stFieldGrid.m_stCurrentBattbleFieldView.GetGameMoveMap())
         {
            stFieldGrid.m_stCurrentBattbleFieldView.GetGameMoveMap().AddMoveDisplayObject(this,stFieldGrid.m_iXGridNo,stFieldGrid.m_iYGridNo);
         }
         stFieldGrid.tagCom.AddTag(20001);
         stFieldGrid.m_stCurrentBattbleFieldView.m_arrEffectArray.push(this);
         ++MaxmouseCount;
         return true;
      }
      
      protected function ClearShield(stFieldGrid:a_3491) : Boolean
      {
         if(!stFieldGrid)
         {
            return false;
         }
         if(stFieldGrid.m_stCurrentBattbleFieldView.GetGameMoveMap())
         {
            stFieldGrid.m_stCurrentBattbleFieldView.GetGameMoveMap().RemoveMoveDisplayObject(this);
         }
         stFieldGrid.tagCom.RemoveTag(20001);
         var stVector:Array = stFieldGrid.m_stCurrentBattbleFieldView.m_arrEffectArray;
         if(-1 != stVector.indexOf(this))
         {
            stVector.splice(stVector.indexOf(this),1);
         }
         --MaxmouseCount;
         return true;
      }
      
      private function TatalRangeBoom(stFieldGrid:a_3491, range:int) : void
      {
         var xIndex:int = 0;
         var arrMoveIntruder:Array = null;
         var stMoveIntruder:a_4206 = null;
         if(stFieldGrid == null)
         {
            return;
         }
         var xStart:int = Math.max(stFieldGrid.m_iXGridNo - range,0);
         var xEnd:int = Math.min(stFieldGrid.m_iXGridNo + range,BattleFieldView.a_1011 - 1);
         var yStart:int = Math.max(stFieldGrid.m_iYGridNo - range,0);
         var yEnd:int = Math.min(stFieldGrid.m_iYGridNo + range,BattleFieldView.a_1012 - 1);
         var stFieldGridVector:Array = stFieldGrid.m_stCurrentBattbleFieldView.stFieldGridsVector;
         for(var yIndex:int = yStart; yIndex <= yEnd; yIndex++)
         {
            for(xIndex = xStart; xIndex <= xEnd; xIndex++)
            {
               arrMoveIntruder = stFieldGridVector[yIndex][xIndex].IntruderArray;
               for each(stMoveIntruder in arrMoveIntruder)
               {
                  if(stMoveIntruder.iLifeValue > 0)
                  {
                     stMoveIntruder.a_4210();
                  }
               }
            }
         }
      }
      
      override public function a_3940() : Boolean
      {
         this.ClearShield(this.stOriginalFieldGrid);
         this.stOriginalFieldGrid = null;
         super.a_3940();
         return true;
      }
   }
}

