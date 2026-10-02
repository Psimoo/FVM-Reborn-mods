package com.aurora.ui.maogoutd.resource.defender.DragonYear.BubbleDragon
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.StaticFieldGrid;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.effect.a_4108;
   import flash.display.FrameLabel;
   import flash.events.Event;
   import flash.geom.Point;
   
   public class BubbleDragonSpecialBuffer extends a_4108
   {
      
      private var m_iStartTime:int;
      
      public var a_1598:StaticFieldGrid;
      
      public var m_iXGridNo:int;
      
      public var m_iYGridNo:int;
      
      public var m_startPosition:Point = new Point();
      
      private var m_numXSpeed:Number;
      
      private var m_numYSpeed:Number;
      
      private var a_1581:int;
      
      private var m_stLifeValue:int;
      
      public function BubbleDragonSpecialBuffer()
      {
         super();
         a_1279 = -33.5;
         m_iYDisplayCenterPos = -33.5 + 5;
      }
      
      public static function a_3926() : BubbleDragonSpecialBuffer
      {
         return PoolManager.getInstance().CheckOutOne(BubbleDragonSpecialBuffer) as BubbleDragonSpecialBuffer;
      }
      
      public function get a_1339() : int
      {
         return this.m_stLifeValue;
      }
      
      public function set a_1339(value:int) : void
      {
         this.m_stLifeValue = value;
      }
      
      override protected function getBindMovie() : Class
      {
         return BubbleDragonSpecialBufferMovie;
      }
      
      override public function a_1797(isReseaved:Boolean) : Boolean
      {
         super.a_1797(isReseaved);
         a_1275 = 0;
         play();
         this.addShield(this.a_1598);
         this.m_iStartTime = 0;
         this.a_1339 = 200;
         m_MoveState = true;
         this.setMoveToPosition(15);
         return true;
      }
      
      override public function a_3940() : Boolean
      {
         super.a_3940();
         this.ClearShield(this.a_1598);
         a_1275 = 0;
         this.a_1598 = null;
         return true;
      }
      
      override protected function a_4109(a_4730:Event) : void
      {
         var stFieldGrid:a_3491 = null;
         var arrMoveIntruder:Array = null;
         var stMoveIntruder:a_4206 = null;
         nextFrame();
         if(a_1273 == a_1274 - 4)
         {
            stFieldGrid = this.a_1598.m_stCurrentBattbleFieldView.a_3438(this.a_1598.m_iXGridNo,this.a_1598.m_iInitialYGridNo);
            if(stFieldGrid)
            {
               arrMoveIntruder = stFieldGrid.a_1511.slice();
               for each(stMoveIntruder in arrMoveIntruder)
               {
                  stMoveIntruder.a_4210();
               }
            }
         }
         else if(a_1273 == a_1274)
         {
            this.a_3940();
            return;
         }
         if(a_1278 != null)
         {
            gotoAndStop((a_1276[a_1275] as FrameLabel).frame);
         }
         ++this.m_iStartTime;
         if(this.a_1581 > 0)
         {
            x += this.m_numXSpeed;
            y += this.m_numYSpeed;
            --this.a_1581;
            if(this.a_1581 <= 0)
            {
               y = (this.a_1598.m_iYGridNo + 0.5) * a_3491.a_1081;
               x = (this.a_1598.m_iXGridNo + 0.5) * a_3491.a_1080;
               m_MoveState = false;
               stFieldGrid = this.a_1598.m_stCurrentBattbleFieldView.a_3438(this.a_1598.m_iXGridNo,this.a_1598.m_iInitialYGridNo);
               if(stFieldGrid)
               {
                  stFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(this,BattleLayerDefine.OBSTACL_TYPE,stFieldGrid);
               }
               this.ChekcBoom();
            }
         }
         else if(this.a_1581 == 0 && m_MoveState)
         {
            y = (this.a_1598.m_iYGridNo + 0.5) * a_3491.a_1081;
            x = (this.a_1598.m_iXGridNo + 0.5) * a_3491.a_1080;
            m_MoveState = false;
            stFieldGrid = this.a_1598.m_stCurrentBattbleFieldView.a_3438(this.a_1598.m_iXGridNo,this.a_1598.m_iInitialYGridNo);
            if(stFieldGrid)
            {
               stFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(this,BattleLayerDefine.OBSTACL_TYPE,stFieldGrid);
            }
            this.ChekcBoom();
         }
      }
      
      private function ChekcBoom() : void
      {
         var stFieldGrid:StaticFieldGrid = null;
         var m_FindCount:int = 0;
         var iXIndex:* = 0;
         var iYIndex:int = 0;
         var stFieldGridVector:Array = this.a_1598.m_stCurrentBattbleFieldView.stStaticFieldGridVector;
         for(iXIndex = int(BattleFieldView.a_1011 - 1); iXIndex > BattleFieldView.a_1011 - 3; iXIndex--)
         {
            for(iYIndex = 0; iYIndex < BattleFieldView.a_1012; iYIndex++)
            {
               stFieldGrid = stFieldGridVector[iYIndex][iXIndex];
               if(stFieldGrid != null && stFieldGrid.m_stSpecialBuffer != null && !stFieldGrid.m_stSpecialBuffer.m_MoveState)
               {
                  m_FindCount++;
               }
            }
         }
         if(m_FindCount == 14)
         {
            for(iXIndex = int(BattleFieldView.a_1011 - 1); iXIndex > BattleFieldView.a_1011 - 3; iXIndex--)
            {
               for(iYIndex = 0; iYIndex < BattleFieldView.a_1012; iYIndex++)
               {
                  stFieldGrid = stFieldGridVector[iYIndex][iXIndex];
                  if(stFieldGrid != null && stFieldGrid.m_stSpecialBuffer != null)
                  {
                     stFieldGrid.m_stSpecialBuffer.SpecialSkillCallBack();
                  }
               }
            }
         }
      }
      
      override public function SpecialSkillCallBack(... args) : void
      {
         this.a_3969(this.a_1339);
      }
      
      protected function ClearShield(stFieldGrid:StaticFieldGrid) : Boolean
      {
         if(stFieldGrid)
         {
            if(stFieldGrid.m_stSpecialBuffer == this)
            {
               stFieldGrid.m_stSpecialBuffer = null;
            }
            else
            {
               trace("error!!!");
            }
         }
         return true;
      }
      
      protected function addShield(stFieldGrid:StaticFieldGrid) : Boolean
      {
         if(stFieldGrid != null && stFieldGrid.m_stSpecialBuffer == null)
         {
            stFieldGrid.m_stSpecialBuffer = this;
         }
         return true;
      }
      
      private function setMoveToPosition(fMoveSpeed:int) : void
      {
         var fPosY:Number = NaN;
         var fPosX:Number = NaN;
         var fDistanceX:Number = NaN;
         var fDistanceY:Number = NaN;
         var fDistance:Number = NaN;
         var iMoveTick:int = 0;
         if(this.a_1598)
         {
            fPosY = (this.a_1598.m_iYGridNo + 0.5) * a_3491.a_1081;
            fPosX = (this.a_1598.m_iXGridNo + 0.5) * a_3491.a_1080;
            fDistanceX = fPosX - this.m_startPosition.x;
            fDistanceY = fPosY - this.m_startPosition.y;
            fDistance = Math.max(Math.abs(fDistanceX),Math.abs(fDistanceY));
            iMoveTick = fDistance / Math.abs(fMoveSpeed);
            if(iMoveTick > 0)
            {
               this.m_numYSpeed = fDistanceY / iMoveTick;
               this.m_numXSpeed = fDistanceX / iMoveTick;
            }
            this.a_1581 = iMoveTick;
         }
      }
      
      public function a_3969(iRduceLifeValue:int) : Boolean
      {
         this.a_1339 -= iRduceLifeValue;
         if(this.a_1339 <= 0)
         {
            if(a_1275 != 1)
            {
               a_1275 = 1;
               gotoAndStop((a_1276[1] as FrameLabel).frame);
            }
         }
         return true;
      }
   }
}

