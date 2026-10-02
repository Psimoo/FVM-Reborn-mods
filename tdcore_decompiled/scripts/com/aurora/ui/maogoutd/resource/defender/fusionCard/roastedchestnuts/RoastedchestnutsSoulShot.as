package com.aurora.ui.maogoutd.resource.defender.fusionCard.roastedchestnuts
{
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.effect.a_4108;
   import com.aurora.ui.maogoutd.resource.shot.a_4348;
   import flash.display.FrameLabel;
   import flash.geom.Point;
   
   public class RoastedchestnutsSoulShot extends a_4348
   {
      
      private static var ms_arrShot:Array = new Array();
      
      private static const CONTINUE_TIME:int = 36 + 6;
      
      private var m_iStartAttckTime:int;
      
      private var m_iLoopFrame:int;
      
      private var m_iDisappearFrame:int;
      
      private var m_iCurrentShowFrameLable:int = -1;
      
      private var m_iCount:int;
      
      public function RoastedchestnutsSoulShot()
      {
         super();
         a_1573 = 5;
         a_1576 = true;
         a_1588 = true;
         a_1275 = 0;
         a_1587 = 2;
         this.m_iLoopFrame = 3;
         this.m_iDisappearFrame = 4;
         m_iYDisplayCenterPos = -4;
         a_1279 = -25;
      }
      
      public static function a_4344() : RoastedchestnutsSoulShot
      {
         var stShot:RoastedchestnutsSoulShot = ms_arrShot.pop();
         if(null == stShot)
         {
            stShot = new RoastedchestnutsSoulShot();
         }
         BattleFieldView.a_1018.play();
         return stShot;
      }
      
      override protected function getBindMovie() : Class
      {
         return RoastedchestnutsSoulShotMovie;
      }
      
      override public function a_1797(param1:int, param2:Number, param3:int, param4:int, param5:int, param6:BattleFieldView, param7:a_3491, param8:Boolean = false, param9:Number = 1, param10:int = 0) : Boolean
      {
         alpha = 1;
         super.a_1797(param1,param2,param3,param4,param5,param6,param7,param8,param9,param10);
         return true;
      }
      
      override protected function a_4349() : Boolean
      {
         var numDistance:Number = NaN;
         var stFieldGrid:a_3491 = null;
         var targetX:Number = NaN;
         var targetY:Number = NaN;
         var distance:Number = NaN;
         m_PTPosition = new Point();
         m_PTFieldGrid = a_1584.m_stCurrentBattbleFieldView.a_3438(m_PTargetXGridNo,m_PTargetYGridNo);
         if(!m_PTFieldGrid)
         {
            m_PTFieldGrid = a_1283 ? a_1583.a_3438(0,m_iYGridNo) : a_1583.a_3438(BattleFieldView.a_1011 - 1,m_iYGridNo);
         }
         targetX = (m_PTFieldGrid.m_iXGridNo + (a_1283 ? -0.5 : 0.5)) * a_3491.a_1080;
         targetY = (m_PTFieldGrid.m_iYGridNo + 0.5) * a_3491.a_1081;
         m_PTPosition.x = targetX;
         m_PTPosition.y = targetY;
         var dx:Number = m_PTPosition.x - x;
         var dy:Number = m_PTPosition.y - y;
         distance = Math.abs(dx);
         m_ProtationRadian = Math.atan2(dy,dx);
         m_PStartY = y;
         m_PStartX = x;
         a_1581 = int(Math.sqrt(dx * dx + dy * dy) / m_numXSpeed);
         if(a_1581 < 2)
         {
            a_1581 = 2;
         }
         m_numYSpeed = distance < 2 * a_3491.a_1080 ? a_3491.a_1081 * 0.6 / a_1581 : 3 * a_3491.a_1081 / a_1581;
         m_PrealXSpeed = m_numXSpeed * Math.cos(m_ProtationRadian);
         m_PbaseYDirection = m_numXSpeed * Math.sin(m_ProtationRadian);
         return true;
      }
      
      override public function a_4216(iCurrentTime:int) : void
      {
         if(m_isHited)
         {
            nextFrame();
            if(iCurrentTime - this.m_iStartAttckTime == 3)
            {
               this.a_4210();
            }
            if(iCurrentTime - this.m_iStartAttckTime >= CONTINUE_TIME)
            {
               if(a_1273 == a_1274)
               {
                  this.a_3940();
               }
            }
            else
            {
               if((iCurrentTime - this.m_iStartAttckTime & 3) == 0)
               {
                  this.a_4360();
               }
               if(a_1278 != null && (this.m_iCurrentShowFrameLable == this.m_iLoopFrame || this.m_iCurrentShowFrameLable == a_1587))
               {
                  this.ChangeToFrameLable(this.m_iLoopFrame);
               }
            }
            return;
         }
         if(a_1588)
         {
            nextFrame();
            if(a_1273 == a_1274 || a_1278 != null)
            {
               gotoAndStop((a_1276[a_1275] as FrameLabel).frame);
            }
         }
         if(0 == a_1447)
         {
            a_1447 = iCurrentTime;
         }
         if(a_1576)
         {
            if(a_1576)
            {
               UpdateParabolaPosition(iCurrentTime);
            }
            if(m_isHited)
            {
               this.ChangeToAttackState(iCurrentTime);
            }
         }
      }
      
      override protected function HitParabolaTest() : void
      {
         super.HitParabolaTest();
      }
      
      private function ChangeToAttackState(iCurrentTime:int) : void
      {
         a_1583.AddToBattleView(this,BattleLayerDefine.EFFECTS_BASE_TYPE);
         this.m_iStartAttckTime = iCurrentTime;
         this.m_iCount = 0;
         alpha = 0.5;
         this.ChangeToFrameLable(a_1587);
         this.x = (m_PTFieldGrid.m_iXGridNo + (a_1283 ? -0.5 : 0.5)) * a_3491.a_1080;
         this.y = (m_PTFieldGrid.m_iYGridNo + 0.5) * a_3491.a_1081;
         this.AddBoomEffect();
      }
      
      private function ChangeToFrameLable(iFrameLable:int) : void
      {
         this.m_iCurrentShowFrameLable = iFrameLable;
         gotoAndStop((a_1276[this.m_iCurrentShowFrameLable] as FrameLabel).frame);
      }
      
      private function a_4360() : void
      {
         var stFieldGrid:a_3491 = null;
         var j:int = 0;
         var arrMouveIntruder:Array = null;
         var stMoveIntruder:a_4206 = null;
         ++this.m_iCount;
         var lx:int = Math.max(0,m_PTFieldGrid.m_iXGridNo - 1);
         var rx:int = Math.min(BattleFieldView.a_1011 - 1,m_PTFieldGrid.m_iXGridNo + 1);
         var dy:int = Math.max(0,m_PTFieldGrid.m_iYGridNo - 1);
         var uy:int = Math.min(BattleFieldView.a_1012 - 1,m_PTFieldGrid.m_iYGridNo + 1);
         for(var i:int = lx; i <= rx; i++)
         {
            for(j = dy; j <= uy; j++)
            {
               stFieldGrid = a_1583.a_3438(i,j);
               if(null != stFieldGrid)
               {
                  arrMouveIntruder = stFieldGrid.a_1511.slice();
                  for each(stMoveIntruder in arrMouveIntruder)
                  {
                     if(null != stMoveIntruder && (0 == stMoveIntruder.iSpaceState || 2 == stMoveIntruder.iSpaceState) && !stMoveIntruder.isCannotSeeByFighter)
                     {
                        a_4352(stMoveIntruder);
                        if(stMoveIntruder.iLifeValue <= 0 && !stMoveIntruder.IsBossIntruder && Boolean(stMoveIntruder.parent))
                        {
                           stMoveIntruder.ShowBoomDieEffect();
                           stMoveIntruder.a_3432();
                        }
                     }
                  }
               }
            }
         }
      }
      
      private function AddBoomEffect() : void
      {
         var m_BottomEffect:a_4108 = null;
         if(Boolean(a_1583) && Boolean(m_iSuperShotType > 0) && Boolean(a_1584))
         {
            m_BottomEffect = RoastedchestnutsBoomEffect.a_3926();
            m_BottomEffect.a_1797(false);
            m_BottomEffect.x = (m_PTargetXGridNo + 0.5) * a_3491.a_1080;
            m_BottomEffect.y = (m_PTargetYGridNo + 0.5) * a_3491.a_1081;
            a_1583.AddToBattleView(m_BottomEffect,BattleLayerDefine.EFFECTS_TOP_TYPE,a_1584);
            m_BottomEffect.play();
         }
      }
      
      public function a_4210() : void
      {
         var xIndex:int = 0;
         var stFieldGrid:a_3491 = null;
         var arrMoveIntruder:Array = null;
         var stMoveIntruder:a_4206 = null;
         if(!a_1583 || m_iSuperShotType == 0)
         {
            return;
         }
         var xStart:int = Math.max(m_PTargetXGridNo - 1,0);
         var xEnd:int = Math.min(m_PTargetXGridNo + 1,BattleFieldView.a_1011 - 1);
         var yStart:int = Math.max(m_PTargetYGridNo - 1,0);
         var yEnd:int = Math.min(m_PTargetYGridNo + 1,BattleFieldView.a_1012 - 1);
         for(var yIndex:int = yStart; yIndex <= yEnd; yIndex++)
         {
            for(xIndex = xStart; xIndex <= xEnd; xIndex++)
            {
               stFieldGrid = a_1583.a_3438(xIndex,yIndex);
               arrMoveIntruder = stFieldGrid.a_1511.slice();
               for each(stMoveIntruder in arrMoveIntruder)
               {
                  stMoveIntruder.a_4210();
                  if(stMoveIntruder.iLifeValue > 0)
                  {
                     stMoveIntruder.a_3969(m_isSpecial - 900);
                     if(stMoveIntruder.iLifeValue <= 0 && !stMoveIntruder.IsBossIntruder && !stMoveIntruder.IsWaterIntruder && Boolean(stMoveIntruder.parent))
                     {
                        stMoveIntruder.ShowBoomDieEffect();
                        stMoveIntruder.a_3432();
                     }
                  }
               }
            }
         }
      }
      
      override protected function a_3940() : Boolean
      {
         trace("************Friedposshot m_iCount = " + this.m_iCount);
         super.a_3940();
         if(-1 == ms_arrShot.indexOf(this))
         {
            ms_arrShot.push(this);
         }
         m_isHited = false;
         return true;
      }
   }
}

