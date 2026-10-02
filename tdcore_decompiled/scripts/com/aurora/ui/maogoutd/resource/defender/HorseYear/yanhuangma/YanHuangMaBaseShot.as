package com.aurora.ui.maogoutd.resource.defender.HorseYear.yanhuangma
{
   import a_4718.b_183;
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.Base.AttackDefenseParams;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.shot.a_4348;
   import com.aurora.ui.maogoutd.resource.shot.a_4388;
   import flash.display.FrameLabel;
   
   public class YanHuangMaBaseShot extends a_4348
   {
      
      private var m_iTrans:int = 0;
      
      private var m_iMovePath:int = 0;
      
      public function YanHuangMaBaseShot()
      {
         super();
         a_1573 = 1;
         a_1588 = true;
      }
      
      public static function a_4344() : YanHuangMaBaseShot
      {
         var shot:YanHuangMaBaseShot = null;
         shot = PoolManager.getInstance().CheckOutOne(YanHuangMaBaseShot,YanHuangMaBaseShotMovie) as YanHuangMaBaseShot;
         shot.m_iTrans = 0;
         shot.a_1279 = -100;
         shot.m_iYDisplayCenterPos = -40;
         return shot;
      }
      
      public static function GetFreeShot1() : YanHuangMaBaseShot
      {
         var shot:YanHuangMaBaseShot = null;
         shot = PoolManager.getInstance().CheckOutOne(YanHuangMaBaseShot,YanHuangMaFirstShotMovie) as YanHuangMaBaseShot;
         shot.m_iTrans = 1;
         shot.a_1279 = -100;
         shot.m_iYDisplayCenterPos = -40;
         return shot;
      }
      
      public static function GetFreeShot2() : YanHuangMaBaseShot
      {
         var shot:YanHuangMaBaseShot = null;
         shot = PoolManager.getInstance().CheckOutOne(YanHuangMaBaseShot,YanHuangMaSecondShotMovie) as YanHuangMaBaseShot;
         shot.m_iTrans = 2;
         shot.a_1279 = -100;
         shot.m_iYDisplayCenterPos = -40;
         return shot;
      }
      
      public function InitData(movePath:int) : void
      {
         this.m_iMovePath = movePath;
         rotationY = 0;
         rotation = 0;
         if(movePath == 1)
         {
            rotationY = 0;
         }
         else if(movePath == 2)
         {
            rotationY = 180;
         }
         else if(movePath == 3)
         {
            rotation = 90;
         }
         else if(movePath == 4)
         {
            rotation = 90;
         }
         else if(movePath == 5)
         {
            rotationY = 180;
         }
         else if(movePath == 6)
         {
            rotationY = 0;
         }
         m_ShowAshEffectType = this.m_iTrans == 2 ? 2 : 0;
      }
      
      override public function a_1797(param1:int, param2:Number, param3:int, param4:int, param5:int, param6:BattleFieldView, param7:a_3491, param8:Boolean = false, param9:Number = 1, param10:int = 0) : Boolean
      {
         super.a_1797(param1,param2,param3,param4,param5,param6,param7,param8,param9,param10);
         rotationY = a_1283 ? 180 : 0;
         m_isPenetrate = true;
         a_1577 = false;
         m_isCanCrossFireAuxiliary = false;
         m_isCanBounceByAuxiliary = false;
         a_1275 = 0;
         m_isShotHighSkySpace = true;
         alpha = 0.55;
         return true;
      }
      
      override public function a_4216(iCurrentTime:int) : void
      {
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
         if(this.m_iMovePath == 1)
         {
            x += m_numXSpeed;
         }
         else if(this.m_iMovePath == 2)
         {
            x -= m_numXSpeed;
         }
         else if(this.m_iMovePath == 3)
         {
            y += m_numXSpeed;
         }
         else if(this.m_iMovePath == 4)
         {
            y += m_numXSpeed;
         }
         else if(this.m_iMovePath == 5)
         {
            x -= m_numXSpeed;
         }
         else if(this.m_iMovePath == 6)
         {
            x += m_numXSpeed;
         }
      }
      
      override protected function CalculationBoundary() : Boolean
      {
         if(x < 0 || x > BattleFieldView.a_1013 + 60 || y < 0 || y > BattleFieldView.a_1014 + 60)
         {
            if(this.m_iMovePath == 1)
            {
               this.AddShot(5);
            }
            else if(this.m_iMovePath == 2)
            {
               this.AddShot(6);
            }
            m_bActive.Value = false;
            a_3940();
            return true;
         }
         return false;
      }
      
      private function AddShot(movePath:int) : void
      {
         var shot:YanHuangMaBaseShot = null;
         var grid:a_3491 = null;
         if(this.m_iTrans == 0)
         {
            shot = YanHuangMaBaseShot.a_4344();
         }
         else if(this.m_iTrans == 1)
         {
            shot = YanHuangMaBaseShot.GetFreeShot1();
         }
         else if(this.m_iTrans == 2)
         {
            shot = YanHuangMaBaseShot.GetFreeShot2();
         }
         var iYGridNo:int = m_isChangeYGridNo ? int(y / a_3491.a_1081) : m_iYGridNo;
         if(shot.attackParam == null)
         {
            shot.attackParam = new AttackDefenseParams();
         }
         shot.attackParam.CopyInit(attackParam);
         if(movePath == 5)
         {
            grid = a_1583.a_3438(0,iYGridNo);
            shot.a_1797(0,Math.abs(m_numXSpeed),0,BattleFieldView.a_1013 - 1,y,a_1583,grid);
         }
         else if(movePath == 6)
         {
            grid = a_1583.a_3438(0,iYGridNo);
            shot.a_1797(0,Math.abs(m_numXSpeed),0,0,y,a_1583,grid);
         }
         a_1583.AddToBattleView(shot,BattleLayerDefine.SHOT_TYPE,grid);
         shot.InitData(movePath);
      }
      
      override protected function ReboundHandler() : void
      {
         m_HitMouseArray = [];
         rotationY = rotationY == -180 ? 0 : -180;
      }
      
      override protected function a_4351() : void
      {
         var iXGridNo:int = 0;
         var stFieldGrid:a_3491 = null;
         var stLastWaitShot:a_4348 = null;
         var numHotMultiplier:Number = NaN;
         var numColdSlowMultiplier:Number = NaN;
         var numMoveSpeedMultiplier:Number = NaN;
         var iNewShotXpos:int = 0;
         if(!m_bActive.Value)
         {
            a_3940();
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
         var iYGridNo:int = m_isChangeYGridNo ? int(y / a_3491.a_1081) : m_iYGridNo;
         if(5 == a_1582 || 6 == a_1582)
         {
            iYGridNo = int(y / a_3491.a_1081);
            if(y <= 0 || y >= BattleFieldView.a_1014)
            {
               m_bActive.Value = false;
               if(this.m_iMovePath == 1)
               {
                  this.AddShot(5);
               }
               else if(this.m_iMovePath == 2)
               {
                  this.AddShot(6);
               }
               a_3940();
               return;
            }
         }
         if(this.CalculationBoundary())
         {
            return;
         }
         stFieldGrid = a_1583.a_3438(iXGridNo,iYGridNo);
         if(stFieldGrid == null)
         {
            if(this.m_iMovePath == 1)
            {
               this.AddShot(5);
            }
            else if(this.m_iMovePath == 2)
            {
               this.AddShot(6);
            }
            m_bActive.Value = false;
            a_3940();
            return;
         }
         if(!a_1576 && a_1577 && a_1571 != iXGridNo && (m_iCrossFireAllGride || a_1584 != stFieldGrid) && null != stFieldGrid.m_stBaseAuxiliaryFighter && !stFieldGrid.m_stBaseAuxiliaryFighter.m_isShowFrozen)
         {
            a_1571 = iXGridNo;
            numHotMultiplier = stFieldGrid.m_stBaseAuxiliaryFighter.numHotMultiplier;
            if(numHotMultiplier > 1 && m_isCanCrossFireAuxiliary)
            {
               if(a_1574 * a_1326 > 0)
               {
                  a_1326 = 0;
                  numHotMultiplier = 1;
                  stLastWaitShot = a_4388.getInstance().a_4389(b_183.b_184);
                  if(null != stLastWaitShot)
                  {
                     iNewShotXpos = x + (a_1283 ? -30 : 30);
                     stLastWaitShot.a_1797(0,15,a_1579,iNewShotXpos,y,a_1583,stFieldGrid,false,a_1325);
                     parent.addChild(stLastWaitShot);
                     m_bActive.Value = false;
                     this.a_3940();
                  }
               }
               else if(numHotMultiplier > a_1325)
               {
                  stLastWaitShot = JudgePassFireTower(stFieldGrid,numHotMultiplier);
                  if(addFireShot(stLastWaitShot,stFieldGrid))
                  {
                     return;
                  }
               }
            }
            numColdSlowMultiplier = stFieldGrid.m_stBaseAuxiliaryFighter.numColdSlowMultiplier;
            if(numColdSlowMultiplier > 1)
            {
               if(a_1325 > 1)
               {
                  a_1326 = 0;
                  numHotMultiplier = 1;
               }
               else if(numColdSlowMultiplier >= a_1326)
               {
                  a_1326 = numColdSlowMultiplier;
               }
            }
            numMoveSpeedMultiplier = stFieldGrid.m_stBaseAuxiliaryFighter.numMoveSpeedMultiplier;
            if(numMoveSpeedMultiplier != 1 && m_numMoveSpeedMultiplier == 1 && m_isCanBounceByAuxiliary)
            {
               m_numMoveSpeedMultiplier = numMoveSpeedMultiplier;
               m_numXSpeed *= m_numMoveSpeedMultiplier;
               m_numYSpeed *= m_numMoveSpeedMultiplier;
               this.ReboundHandler();
               JudgeAddPowerByAuxiliaryFighter(stFieldGrid);
            }
         }
         if(this.m_iMovePath == 1)
         {
            this.HitFieldGrid(stFieldGrid);
            this.HitFieldGrid(a_1583.a_3438(iXGridNo + (a_1283 ? 1 : -1),iYGridNo));
            this.HitFieldGrid(a_1583.a_3438(iXGridNo,iYGridNo + 1));
            this.HitFieldGrid(a_1583.a_3438(iXGridNo + (a_1283 ? 1 : -1),iYGridNo - 1));
         }
         else if(this.m_iMovePath == 2)
         {
            this.HitFieldGrid(stFieldGrid);
            this.HitFieldGrid(a_1583.a_3438(iXGridNo + (a_1283 ? -1 : 1),iYGridNo));
            this.HitFieldGrid(a_1583.a_3438(iXGridNo,iYGridNo - 1));
            this.HitFieldGrid(a_1583.a_3438(iXGridNo + (a_1283 ? -1 : 1),iYGridNo + 1));
         }
         else if(this.m_iMovePath == 3)
         {
            this.HitFieldGrid(stFieldGrid);
            this.HitFieldGrid(a_1583.a_3438(iXGridNo,iYGridNo + 1));
            this.HitFieldGrid(a_1583.a_3438(iXGridNo + 1,iYGridNo));
            this.HitFieldGrid(a_1583.a_3438(iXGridNo + 1,iYGridNo + 1));
         }
         else if(this.m_iMovePath == 4)
         {
            this.HitFieldGrid(stFieldGrid);
            this.HitFieldGrid(a_1583.a_3438(iXGridNo,iYGridNo + 1));
            this.HitFieldGrid(a_1583.a_3438(iXGridNo - 1,iYGridNo));
            this.HitFieldGrid(a_1583.a_3438(iXGridNo - 1,iYGridNo + 1));
         }
         else if(this.m_iMovePath == 5)
         {
            this.HitFieldGrid(stFieldGrid);
            this.HitFieldGrid(a_1583.a_3438(iXGridNo + (a_1283 ? -1 : 1),iYGridNo));
            this.HitFieldGrid(a_1583.a_3438(iXGridNo,iYGridNo + 1));
            this.HitFieldGrid(a_1583.a_3438(iXGridNo + (a_1283 ? -1 : 1),iYGridNo - 1));
         }
         else if(this.m_iMovePath == 6)
         {
            this.HitFieldGrid(stFieldGrid);
            this.HitFieldGrid(a_1583.a_3438(iXGridNo + (a_1283 ? 1 : -1),iYGridNo));
            this.HitFieldGrid(a_1583.a_3438(iXGridNo,iYGridNo - 1));
            this.HitFieldGrid(a_1583.a_3438(iXGridNo + (a_1283 ? 1 : -1),iYGridNo + 1));
         }
      }
      
      private function HitFieldGrid(stFieldGrid:a_3491) : Boolean
      {
         var stMoveIntruder:a_4206 = null;
         var arrMoveIntruder:Array = null;
         var iArrMoveIntruderLength:int = 0;
         var i:int = 0;
         if(stFieldGrid == null)
         {
            return false;
         }
         if(stFieldGrid.m_isOccupy)
         {
            arrMoveIntruder = GetIntruderArrayField(stFieldGrid);
            iArrMoveIntruderLength = int(arrMoveIntruder.length);
            for(i = 0; i < iArrMoveIntruderLength; i++)
            {
               stMoveIntruder = arrMoveIntruder[i];
               if(this.CaclueHitMouse(stFieldGrid,stMoveIntruder))
               {
                  return true;
               }
            }
         }
         return false;
      }
      
      override protected function CaclueHitMouse(stFieldGrid:a_3491, stMoveIntruder:a_4206) : Boolean
      {
         if(!stMoveIntruder.isCannotSeeByFighter && (0 == stMoveIntruder.iSpaceState || 2 == stMoveIntruder.iSpaceState) && hitTestObject(stMoveIntruder))
         {
            if(m_isPenetrate && m_HitMouseArray.indexOf(stMoveIntruder) == -1)
            {
               if(Boolean(a_1583) && a_1583.isOwnBattleField)
               {
                  BattleFieldView.a_1045.play();
               }
               m_HitMouseArray.push(stMoveIntruder);
               a_4352(stMoveIntruder);
               SputterHurt(stFieldGrid,stMoveIntruder);
               m_isHited = true;
               if(a_1276.length > 0)
               {
                  gotoAndStop((a_1276[a_1587] as FrameLabel).frame);
               }
               return true;
            }
            if(!m_isPenetrate)
            {
               if(Boolean(a_1583) && a_1583.isOwnBattleField)
               {
                  BattleFieldView.a_1045.play();
               }
               a_4352(stMoveIntruder);
               SputterHurt(stFieldGrid,stMoveIntruder);
               m_isHited = true;
               if(a_1276.length > 0)
               {
                  gotoAndStop((a_1276[a_1587] as FrameLabel).frame);
               }
               return true;
            }
         }
         return false;
      }
   }
}

