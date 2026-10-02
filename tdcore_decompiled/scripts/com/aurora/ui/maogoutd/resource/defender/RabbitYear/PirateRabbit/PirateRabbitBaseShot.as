package com.aurora.ui.maogoutd.resource.defender.RabbitYear.PirateRabbit
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.Intruder.newBoss.BaseBossMoveIntruder;
   import com.aurora.ui.maogoutd.resource.shot.a_4348;
   import flash.display.FrameLabel;
   import flash.geom.Point;
   
   public class PirateRabbitBaseShot extends a_4348
   {
      
      public var layer:int = 0;
      
      private var m_targetMouseArray:Array = new Array();
      
      private var m_MouseArr:Array = new Array(8392723,8389315,8388773,8389220,8389219,8389116,8388743,8388727,8388642,8388627);
      
      private var stTempPosition:Point;
      
      public function PirateRabbitBaseShot()
      {
         super();
         a_1279 = -35;
         m_iYDisplayCenterPos = -13;
         a_1573 = 1;
         a_1578 = true;
         a_1588 = true;
         m_isHited = false;
         a_1587 = 1;
      }
      
      public static function a_4344() : a_4348
      {
         BattleFieldView.a_1017.play();
         var shot:PirateRabbitBaseShot = PoolManager.getInstance().CheckOutOne(PirateRabbitBaseShot,PirateRabbitBaseShotMovie) as PirateRabbitBaseShot;
         shot.layer = 0;
         return shot;
      }
      
      public static function GetFreeShot1() : a_4348
      {
         BattleFieldView.a_1017.play();
         var shot:PirateRabbitBaseShot = PoolManager.getInstance().CheckOutOne(PirateRabbitBaseShot,PirateRabbitBaseShot1Movie) as PirateRabbitBaseShot;
         shot.layer = 1;
         return shot;
      }
      
      public static function GetFreeShot2() : a_4348
      {
         BattleFieldView.a_1017.play();
         var shot:PirateRabbitBaseShot = PoolManager.getInstance().CheckOutOne(PirateRabbitBaseShot,PirateRabbitBaseShot2Movie) as PirateRabbitBaseShot;
         shot.layer = 2;
         return shot;
      }
      
      override public function a_4216(iCurrentTime:int) : void
      {
         if(m_isHited && !m_isPenetrate)
         {
            nextFrame();
            if(a_1273 == a_1274 || a_1278 != null)
            {
               m_bActive.Value = false;
               a_3940();
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
         this.a_4351();
         if(a_1578)
         {
            if(!this.FollowingShotHandle())
            {
               return;
            }
         }
         x += m_numXSpeed;
      }
      
      override protected function FollowingShotHandle() : Boolean
      {
         var numXDistance:Number = NaN;
         var numYDistance:Number = NaN;
         var numMaxDistance:Number = NaN;
         var iMaxConstTime:int = 0;
         var numXSpeed:Number = NaN;
         var numYSpeed:Number = NaN;
         var iModNum:int = 0;
         var stMoveIntruder:a_4206 = a_1583.a_3431(m_iFollowingShotSpaceState);
         if(null != stMoveIntruder)
         {
            numXDistance = stMoveIntruder.x - x;
            numYDistance = stMoveIntruder.y + 0.5 * stMoveIntruder.height - y;
            numMaxDistance = Math.abs(numXDistance) > Math.abs(numYDistance) ? Math.abs(numXDistance) : Math.abs(numYDistance);
            if(numMaxDistance > BattleFieldView.a_1013 && numMaxDistance > BattleFieldView.a_1014)
            {
               a_3940();
               return false;
            }
            iMaxConstTime = numMaxDistance / 10;
            if(iMaxConstTime < 1)
            {
               iMaxConstTime = 1;
            }
            numXSpeed = numXDistance / iMaxConstTime;
            numYSpeed = numYDistance / iMaxConstTime;
            if(m_numXSpeed != numXSpeed)
            {
               iModNum = Math.abs(int(numXSpeed - m_numXSpeed)) > 5 ? int(Math.abs(int(numXSpeed - m_numXSpeed))) : 5;
               m_numXSpeed += (numXSpeed - m_numXSpeed) % (iModNum + 1);
            }
            if(m_numYSpeed != numYSpeed)
            {
               iModNum = Math.abs(int(numYSpeed - m_numYSpeed)) > 5 ? int(Math.abs(int(numYSpeed - m_numYSpeed))) : 5;
               m_numYSpeed += (numYSpeed - m_numYSpeed) % (iModNum + 1);
            }
         }
         y += m_numYSpeed;
         return true;
      }
      
      override protected function a_4351() : void
      {
         var iXGridNo:int = 0;
         var stFieldGrid:a_3491 = null;
         var stBaseMoveIntruder:a_4206 = null;
         var num:int = 0;
         var i:int = 0;
         var stLastWaitShot:PirateRabbitSmallShot = null;
         var HurtMu:int = 0;
         if(x < 0 || x > BattleFieldView.a_1013)
         {
            this.a_3940();
            return;
         }
         if(a_1283)
         {
            iXGridNo = BattleFieldView.a_1011 - 1 - int(x / a_3491.a_1080);
         }
         else
         {
            iXGridNo = int(x / a_3491.a_1080);
         }
         var iYGridNo:int = int(y / a_3491.a_1081);
         stFieldGrid = a_1583.a_3438(iXGridNo,iYGridNo);
         if(stFieldGrid == null)
         {
            m_bActive.Value = false;
            a_3940();
            return;
         }
         stBaseMoveIntruder = a_1583.a_3431();
         if(Boolean(stBaseMoveIntruder) && hitTestObject(stBaseMoveIntruder))
         {
            a_4352(stBaseMoveIntruder);
            m_isHited = true;
            gotoAndStop((a_1276[a_1587] as FrameLabel).frame);
            if(stBaseMoveIntruder.iLifeValue > 0)
            {
               this.a_3431(stBaseMoveIntruder);
               num = this.m_targetMouseArray.length > 3 ? 3 : int(this.m_targetMouseArray.length);
               for(i = 0; i < num; i++)
               {
                  if(stFieldGrid)
                  {
                     HurtMu = m_isSpecial == 1 ? 2 : 3;
                     if(this.layer == 0)
                     {
                        stLastWaitShot = PirateRabbitSmallShot.a_4344() as PirateRabbitSmallShot;
                     }
                     else if(this.layer == 1)
                     {
                        stLastWaitShot = PirateRabbitSmallShot.GetFreeShot1() as PirateRabbitSmallShot;
                     }
                     else
                     {
                        stLastWaitShot = PirateRabbitSmallShot.GetFreeShot2() as PirateRabbitSmallShot;
                     }
                     stLastWaitShot.TargetMouse = this.m_targetMouseArray[i];
                     stLastWaitShot.a_1797(0,15,a_1579 * HurtMu,x,y,stFieldGrid.m_stCurrentBattbleFieldView,stFieldGrid);
                     stFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(stLastWaitShot,BattleLayerDefine.SHOT_TYPE);
                  }
               }
            }
         }
      }
      
      public function a_3431(baseMoveIntruder:a_4206) : int
      {
         var tempFG:a_3491 = null;
         var xIndex:int = 0;
         var stMoveIntruder:a_4206 = null;
         if(baseMoveIntruder == null || baseMoveIntruder != null && baseMoveIntruder.m_stCurrentFieldGrid == null)
         {
            return 0;
         }
         var MouseY:Number = baseMoveIntruder.y + baseMoveIntruder.stDisplayBitmap.y + baseMoveIntruder.height / 2;
         var MouseX:Number = baseMoveIntruder.x + baseMoveIntruder.stDisplayBitmap.x + baseMoveIntruder.width / 2;
         this.stTempPosition = new Point(MouseX,MouseY);
         var startFieldGrid:a_3491 = baseMoveIntruder.m_stCurrentFieldGrid;
         while(this.m_targetMouseArray.length > 0)
         {
            this.m_targetMouseArray.pop();
         }
         var iTotalIntruderNum:int = 0;
         var xStart:int = Math.max(startFieldGrid.m_iXGridNo - 2,0);
         var xEnd:int = Math.min(startFieldGrid.m_iXGridNo + 2,BattleFieldView.a_1011 - 1);
         var yStart:int = Math.max(startFieldGrid.m_iYGridNo - 2,0);
         var yEnd:int = Math.min(startFieldGrid.m_iYGridNo + 2,BattleFieldView.a_1012 - 1);
         var numDistance:Number = -1;
         var bossArray:Array = new Array();
         var eliteArray:Array = new Array();
         var normalArray:Array = new Array();
         for(var yIndex:int = yStart; yIndex <= yEnd; yIndex++)
         {
            for(xIndex = xStart; xIndex <= xEnd; xIndex++)
            {
               tempFG = startFieldGrid.m_stCurrentBattbleFieldView.a_3438(xIndex,yIndex);
               if(tempFG)
               {
                  for each(stMoveIntruder in tempFG.a_1511)
                  {
                     if(stMoveIntruder != baseMoveIntruder && stMoveIntruder.iLifeValue > 0 && !stMoveIntruder.isCannotSeeByFighter && stMoveIntruder.iSpaceState != 1)
                     {
                        if(stMoveIntruder is BaseBossMoveIntruder)
                        {
                           bossArray.push(stMoveIntruder);
                        }
                        else if(this.m_MouseArr.indexOf(stMoveIntruder.m_stMoveIntruderTypeID) != -1)
                        {
                           eliteArray.push(stMoveIntruder);
                        }
                        else
                        {
                           normalArray.push(stMoveIntruder);
                        }
                     }
                  }
               }
            }
         }
         bossArray.sort(this.OnSortToken);
         eliteArray.sort(this.OnSortToken);
         normalArray.sort(this.OnSortToken);
         this.m_targetMouseArray = this.m_targetMouseArray.concat(bossArray).concat(eliteArray).concat(normalArray);
         return this.m_targetMouseArray.length;
      }
      
      private function OnSortToken(a:a_4206, b:a_4206) : int
      {
         var aMouseY:Number = a.y + a.stDisplayBitmap.y + a.height / 2;
         var aMouseX:Number = a.x + a.stDisplayBitmap.x + a.width / 2;
         var bMouseY:Number = b.y + b.stDisplayBitmap.y + b.height / 2;
         var bMouseX:Number = b.x + a.stDisplayBitmap.x + b.width / 2;
         var disa:Number = Point.distance(this.stTempPosition,new Point(aMouseX,aMouseY));
         var disb:Number = Point.distance(this.stTempPosition,new Point(bMouseX,bMouseY));
         if(Math.abs(disa) < Math.abs(disb))
         {
            return -1;
         }
         if(Math.abs(disa) > Math.abs(disb))
         {
            return 1;
         }
         return 0;
      }
   }
}

