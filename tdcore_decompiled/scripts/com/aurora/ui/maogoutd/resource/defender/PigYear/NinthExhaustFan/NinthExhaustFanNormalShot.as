package com.aurora.ui.maogoutd.resource.defender.PigYear.NinthExhaustFan
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.shot.a_4348;
   import flash.display.FrameLabel;
   import flash.geom.Point;
   
   public class NinthExhaustFanNormalShot extends a_4348
   {
      
      private var m_target:a_4206 = null;
      
      private var m_isFollowingShotStarted:Boolean = false;
      
      private var m_shotTickDelay:int = 5;
      
      private var m_targetMouseArray:Array = new Array();
      
      private var m_MouseArr:Array = new Array(8392723,8389315,8388773,8389220,8389219,8389116,8388743,8388727,8388642,8388627);
      
      private var stTempPosition:Point;
      
      public function NinthExhaustFanNormalShot()
      {
         super();
         a_1279 = -21;
         m_iYDisplayCenterPos = -18;
         a_1573 = 1;
         a_1578 = true;
         a_1588 = true;
         m_isShotHighSkySpace = true;
         a_1587 = 0;
      }
      
      public static function a_4344() : a_4348
      {
         BattleFieldView.a_1017.play();
         return PoolManager.getInstance().CheckOutOne(NinthExhaustFanNormalShot) as NinthExhaustFanNormalShot;
      }
      
      override protected function getBindMovie() : Class
      {
         return NinthExhaustFanNormalShotMovie;
      }
      
      override public function a_1797(iGlobalID:int, numSpeed:Number, iHurtPower:int, iXpos:int, iYpos:int, stCurrentBattleView:BattleFieldView, stStartFieldGrid:a_3491, isBothWayShot:Boolean = false, numHotMultiplier:Number = 1, iThreeRowShotType:int = 0) : Boolean
      {
         super.a_1797(iGlobalID,numSpeed,iHurtPower,iXpos,iYpos,stCurrentBattleView,stStartFieldGrid,isBothWayShot,numHotMultiplier,iThreeRowShotType);
         this.m_target = null;
         this.m_isFollowingShotStarted = false;
         this.m_shotTickDelay = 5 * m_isSpecial;
         return true;
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
         y += m_numYSpeed;
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
         this.m_target = a_1583.a_3431();
         if(this.m_target != null && this.m_target.iLifeValue > 0 && !this.m_isFollowingShotStarted)
         {
            this.m_isFollowingShotStarted = true;
         }
         if(this.m_isFollowingShotStarted)
         {
            if(this.m_shotTickDelay > 0)
            {
               --this.m_shotTickDelay;
               return false;
            }
         }
         if(this.m_target != null && this.m_target.iLifeValue > 0)
         {
            numXDistance = this.m_target.x + this.m_target.stDisplayBitmap.x + this.m_target.width / 2 - x;
            numYDistance = this.m_target.y + this.m_target.stDisplayBitmap.y + this.m_target.height / 2 - y;
            numMaxDistance = Math.max(Math.abs(numXDistance),Math.abs(numYDistance));
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
            iModNum = Math.max(Math.abs(int(numXSpeed - m_numXSpeed)),5);
            m_numXSpeed += (numXSpeed - m_numXSpeed) % (iModNum + 1);
            iModNum = Math.max(Math.abs(int(numYSpeed - m_numYSpeed)),5);
            m_numYSpeed += (numYSpeed - m_numYSpeed) % (iModNum + 1);
            return true;
         }
         return this.m_isFollowingShotStarted;
      }
      
      override protected function a_4351() : void
      {
         var iXGridNo:int = 0;
         var i:int = 0;
         var index:int = 0;
         var stLastWaitShot:NinthExhaustFanSmallShot = null;
         var angle:Number = NaN;
         var spreadDist:Number = NaN;
         var offsetX:Number = NaN;
         var offsetY:Number = NaN;
         var startX:Number = NaN;
         var startY:Number = NaN;
         if(x < -20 || x > BattleFieldView.a_1013 + 20)
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
         var stFieldGrid:a_3491 = a_1583.a_3438(iXGridNo,iYGridNo);
         if(stFieldGrid == null)
         {
            m_bActive.Value = false;
            a_3940();
            return;
         }
         var stBaseMoveIntruder:a_4206 = a_1583.a_3431();
         if(Boolean(stBaseMoveIntruder) && Boolean(hitTestObject(stBaseMoveIntruder)) && this.isHitCenter(stBaseMoveIntruder))
         {
            a_4352(stBaseMoveIntruder);
            if(stBaseMoveIntruder.iLifeValue > 0)
            {
               this.a_3431(stBaseMoveIntruder);
               for(i = 0; i < 4; i++)
               {
                  if(stFieldGrid)
                  {
                     index = i % this.m_targetMouseArray.length;
                     stLastWaitShot = NinthExhaustFanSmallShot.a_4344() as NinthExhaustFanSmallShot;
                     stLastWaitShot.m_target = this.m_targetMouseArray[index];
                     angle = Math.PI / 2 * i;
                     spreadDist = 20 + Math.random() * 10;
                     offsetX = Math.cos(angle) * spreadDist;
                     offsetY = Math.sin(angle) * spreadDist;
                     startX = x + offsetX;
                     startY = y + offsetY;
                     stLastWaitShot.a_1797(0,15,180,startX,startY,stFieldGrid.m_stCurrentBattbleFieldView,stFieldGrid);
                     stFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(stLastWaitShot,BattleLayerDefine.SHOT_TYPE);
                  }
               }
            }
            a_3940();
         }
      }
      
      public function a_3431(baseMoveIntruder:a_4206) : int
      {
         var tempFG:a_3491 = null;
         var xIndex:int = 0;
         var stMoveIntruder:a_4206 = null;
         if(baseMoveIntruder == null || baseMoveIntruder.m_stCurrentFieldGrid == null)
         {
            return 0;
         }
         this.stTempPosition = new Point(x,y);
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
                     if(stMoveIntruder.iLifeValue > 0 && !stMoveIntruder.isCannotSeeByFighter && stMoveIntruder.iSpaceState != 1)
                     {
                        if(stMoveIntruder.IsBossIntruder)
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
      
      private function isHitCenter(a:a_4206) : Boolean
      {
         var aMouseX:Number = a.x + a.stDisplayBitmap.x + a.width / 2;
         var hitRange:Number = 25;
         return Math.abs(aMouseX - x) <= hitRange;
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

