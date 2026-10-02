package com.aurora.ui.maogoutd.resource.defender.DragonYear.IceCrystalDragon
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.defender.a_3953;
   import com.aurora.ui.maogoutd.resource.shot.a_4348;
   import flash.display.FrameLabel;
   import flash.geom.Point;
   
   public class IceCrystalDragonFirstDefence extends a_3953
   {
      
      private var hitFieldGrid:Array = new Array();
      
      private var startPosition:Point;
      
      public function IceCrystalDragonFirstDefence()
      {
         super();
         a_1095 = IceCrystalDragonDefence.DEFENSE_PRICE;
         a_1310 = 18;
         a_1317 = 6;
         a_1333 = true;
         a_1313 = true;
         a_1309 = IceCrystalDragonDefence.a_3966(m_iSkillDegree);
         a_1311 = IceCrystalDragonDefence.a_3965(a_1094);
      }
      
      public static function a_3926() : a_3953
      {
         return PoolManager.getInstance().CheckOutOne(IceCrystalDragonFirstDefence,IceCrystalDragonFirstDefenceMovie) as IceCrystalDragonFirstDefence;
      }
      
      override public function a_1797(stFieldGrid:a_3491) : Boolean
      {
         super.a_1797(stFieldGrid);
         a_1309 = IceCrystalDragonDefence.a_3966(m_iSkillDegree);
         a_1311 = IceCrystalDragonDefence.a_3965(a_1094);
         this.startPosition = new Point(stFieldGrid.m_iXGridNo * a_3491.a_1080 + 30,stFieldGrid.m_iYGridNo * a_3491.a_1081 + 30);
         tagCom.AddTag(30031);
         return true;
      }
      
      override public function a_3954(iCurrentTime:int) : Boolean
      {
         var stLastWaitShot:a_4348 = null;
         var stNewShot:a_4348 = null;
         var numShotXpos:Number = NaN;
         var i:int = 0;
         var stStartField:a_3491 = null;
         var HitIndex:int = 0;
         var j:int = 0;
         var k:int = 0;
         var stMoveIntrude:a_4206 = null;
         var pox:int = 0;
         var poy:int = 0;
         if(iCurrentTime > m_iPlaceTimeIntervals + a_1308 && iCurrentTime >= a_1321 + a_1309)
         {
            if(this.a_3431(stFieldGrid) <= 0)
            {
               return false;
            }
            this.hitFieldGrid.sort(this.OnSortToken);
            a_1321 = iCurrentTime;
            a_1323 = 0;
            while(a_1324.length > 0)
            {
               stLastWaitShot = a_1324.pop();
               stLastWaitShot.a_4350();
            }
            for(j = 0; j < 6; j++)
            {
               stLastWaitShot = IceCrystalDragonFirstShot.a_4344();
               if(null == stLastWaitShot)
               {
                  return false;
               }
               a_1324.push(stLastWaitShot);
            }
            a_1307 = a_1273;
            a_1275 = 0;
            gotoAndStop((a_1276[1] as FrameLabel).frame);
         }
         if(iCurrentTime - a_1321 == a_1310 + a_1317 * a_1323 && a_1324.length > 0)
         {
            for(k = 0; k < this.hitFieldGrid.length; k++)
            {
               stLastWaitShot = a_1324.pop();
               if(stLastWaitShot)
               {
                  HitIndex = a_1323 * this.hitFieldGrid.length + k;
                  stMoveIntrude = this.hitFieldGrid[k];
                  if(stMoveIntrude.m_stCurrentFieldGrid != null)
                  {
                     pox = stMoveIntrude.x + stMoveIntrude.stDisplayBitmap.x + stMoveIntrude.width / 2;
                     poy = stMoveIntrude.y + stMoveIntrude.stDisplayBitmap.y + stMoveIntrude.height - 15;
                     IceCrystalDragonFirstShot(stLastWaitShot).stTargetMouseMoveIntruder = stMoveIntrude;
                     stLastWaitShot.a_1797(0,a_1312,a_1311,pox,poy,a_1334.m_stCurrentBattbleFieldView,stMoveIntrude.m_stCurrentFieldGrid);
                     a_1334.m_stCurrentBattbleFieldView.AddToBattleView(stLastWaitShot,BattleLayerDefine.SHOT_TYPE,stMoveIntrude.m_stCurrentFieldGrid);
                  }
               }
            }
            if(a_1324.length > 0)
            {
               ++a_1323;
            }
         }
         return true;
      }
      
      public function a_3431(stFieldGrid:a_3491) : int
      {
         var arrMoveIntruder:Array = null;
         var stMoveIntruder:a_4206 = null;
         var i:int = 0;
         var j:int = 0;
         while(this.hitFieldGrid.length > 0)
         {
            this.hitFieldGrid.pop();
         }
         if(stFieldGrid)
         {
            for(i = 0; i < BattleFieldView.a_1012; i++)
            {
               for(j = 0; j < BattleFieldView.a_1011; j++)
               {
                  arrMoveIntruder = stFieldGrid.m_stCurrentBattbleFieldView.stFieldGridsVector[i][j].a_1511.slice();
                  for each(stMoveIntruder in arrMoveIntruder)
                  {
                     if(stMoveIntruder.iLifeValue > 0 && (stMoveIntruder.iSpaceState != 0 || !stMoveIntruder.isCannotSeeByFighter))
                     {
                        this.hitFieldGrid.push(stMoveIntruder);
                     }
                  }
               }
            }
         }
         return this.hitFieldGrid.length;
      }
      
      private function OnSortToken(a:a_4206, b:a_4206) : int
      {
         var aMouseY:Number = a.y + a.stDisplayBitmap.y + a.height / 2;
         var aMouseX:Number = a.x + a.stDisplayBitmap.x + a.width / 2;
         var bMouseY:Number = b.y + b.stDisplayBitmap.y + b.height / 2;
         var bMouseX:Number = b.x + a.stDisplayBitmap.x + b.width / 2;
         var disa:Number = Point.distance(this.startPosition,new Point(aMouseX,aMouseY));
         var disb:Number = Point.distance(this.startPosition,new Point(bMouseX,bMouseY));
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
      
      override protected function a_3964() : int
      {
         return IceCrystalDragonDefence.a_3964(m_iSkillDegree);
      }
      
      override public function a_3957(iCurrentTime:int) : void
      {
         if(iCurrentTime % 2 == 0)
         {
            super.a_3957(iCurrentTime);
         }
      }
      
      override protected function a_3955() : Number
      {
         return width * 0.9;
      }
      
      override protected function a_3956() : Number
      {
         return -0.1 * height;
      }
   }
}

