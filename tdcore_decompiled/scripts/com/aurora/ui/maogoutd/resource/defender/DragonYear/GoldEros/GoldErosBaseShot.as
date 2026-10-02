package com.aurora.ui.maogoutd.resource.defender.DragonYear.GoldEros
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.shot.a_4348;
   import flash.display.FrameLabel;
   import flash.geom.Point;
   import flash.utils.Dictionary;
   
   public class GoldErosBaseShot extends a_4348
   {
      
      private var stTempPosition:Point;
      
      private var stMoveIntruder:a_4206;
      
      public function GoldErosBaseShot()
      {
         super();
         a_1587 = 1;
         a_1279 = -21;
         m_iYDisplayCenterPos = -10;
         a_1573 = 1;
         a_1578 = true;
         a_1588 = true;
      }
      
      public static function a_4344() : a_4348
      {
         BattleFieldView.a_1017.play();
         return PoolManager.getInstance().CheckOutOne(GoldErosBaseShot) as GoldErosBaseShot;
      }
      
      override protected function getBindMovie() : Class
      {
         return GoldErosBaseShotMovie;
      }
      
      override public function a_1797(iGlobalID:int, numSpeed:Number, iHurtPower:int, iXpos:int, iYpos:int, stCurrentBattleView:BattleFieldView, stStartFieldGrid:a_3491, isBothWayShot:Boolean = false, numHotMultiplier:Number = 1, iThreeRowShotType:int = 0) : Boolean
      {
         this.stTempPosition = new Point((stStartFieldGrid.m_iXGridNo + 0.5) * a_3491.a_1080,(stStartFieldGrid.m_iYGridNo + 0.5) * a_3491.a_1081);
         super.a_1797(iGlobalID,numSpeed,iHurtPower,iXpos,iYpos,stCurrentBattleView,stStartFieldGrid,isBothWayShot,numHotMultiplier);
         m_iFollowingShotSpaceState = 3;
         m_isShotHighSkySpace = true;
         gotoAndStop(m_isSpecial);
         tagCom.AddTag(30);
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
         this.stMoveIntruder = this.a_3431();
         if(null != this.stMoveIntruder)
         {
            numXDistance = this.stMoveIntruder.x - x;
            numYDistance = this.stMoveIntruder.y + 0.5 * this.stMoveIntruder.height - y;
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
         return true;
      }
      
      override protected function a_4351() : void
      {
         if(x < 0 || x > BattleFieldView.a_1013)
         {
            this.a_3940();
            return;
         }
         var stBaseMoveIntruder:a_4206 = this.a_3431();
         if(null != stBaseMoveIntruder && hitTestObject(stBaseMoveIntruder))
         {
            if(stBaseMoveIntruder.tagCom.HasTag(40002))
            {
               this.a_3940();
               return;
            }
            this.a_4360(stBaseMoveIntruder.m_stCurrentFieldGrid,stBaseMoveIntruder);
            a_4352(stBaseMoveIntruder);
            m_isHited = true;
            gotoAndStop((a_1276[a_1587] as FrameLabel).frame);
         }
      }
      
      private function a_4360(stHitenFieldGrid:a_3491, stHitenMouseIntruder:a_4206) : void
      {
         var stFieldGrid:a_3491 = null;
         var j:int = 0;
         var arrMouveIntruder:Array = null;
         var stMouseIntruder:a_4206 = null;
         if(stHitenFieldGrid == null)
         {
            return;
         }
         var lx:int = stHitenFieldGrid.m_iXGridNo - 1;
         var rx:int = stHitenFieldGrid.m_iXGridNo + 1;
         var dy:int = stHitenFieldGrid.m_iYGridNo - 1;
         var uy:int = stHitenFieldGrid.m_iYGridNo + 1;
         for(var i:int = lx; i <= rx; i++)
         {
            for(j = dy; j <= uy; j++)
            {
               stFieldGrid = a_1583.a_3438(i,j);
               if(null != stFieldGrid)
               {
                  arrMouveIntruder = stFieldGrid.a_1511.slice();
                  for each(stMouseIntruder in arrMouveIntruder)
                  {
                     if(null != stMouseIntruder && stMouseIntruder != stHitenMouseIntruder && (stMouseIntruder.iSpaceState != 0 || (!stMouseIntruder.isCannotSeeByFighter || stMouseIntruder.iSpaceState == 1)))
                     {
                        stMouseIntruder.a_3969(int(a_1579 * 0.4));
                     }
                  }
               }
            }
         }
         BattleFieldView.ms_tanhuanghu84.play();
      }
      
      public function a_3431() : a_4206
      {
         var moveIntruder:a_4206 = null;
         var priorityOrder:Array = null;
         var priority:int = 0;
         var spaceState:int = 0;
         var nearestIntruder:a_4206 = null;
         var intruderLists:Dictionary = new Dictionary();
         intruderLists[3] = [];
         intruderLists[1] = [];
         intruderLists[2] = [];
         intruderLists[0] = [];
         for each(moveIntruder in a_1583.m_arrBaseMoveIntruderVector)
         {
            if(moveIntruder.iLifeValue > 0 && (!a_1283 && x <= moveIntruder.x) && (!moveIntruder.isCannotSeeByFighter || moveIntruder.iSpaceState == 1) && moveIntruder.m_stCurrentFieldGrid.m_iYGridNo == m_iYGridNo)
            {
               spaceState = moveIntruder.iSpaceState;
               if(intruderLists[spaceState] != null)
               {
                  intruderLists[spaceState].push(moveIntruder);
               }
               else
               {
                  intruderLists[0].push(moveIntruder);
               }
            }
         }
         priorityOrder = [3,1,2,0];
         for each(priority in priorityOrder)
         {
            if(intruderLists[priority].length > 0)
            {
               intruderLists[priority].sort(this.OnSortToken);
               return intruderLists[priority][0];
            }
         }
         return nearestIntruder;
      }
      
      private function OnSortToken(a:a_4206, b:a_4206) : int
      {
         if(this.stTempPosition == null)
         {
            return 0;
         }
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

