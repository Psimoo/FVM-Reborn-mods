package com.aurora.ui.maogoutd.resource.defender.DragonYear.SugarChestnuts
{
   import a_4718.b_182;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.shot.a_4348;
   import flash.display.FrameLabel;
   
   public class SugarChestnutsSecondShot extends a_4348
   {
      
      private static var ms_arrShot:Array = new Array();
      
      private static const CONTINUE_TIME:int = 36 + 6;
      
      private var m_iStartAttckTime:int;
      
      private var m_iLoopFrame:int;
      
      private var m_iDisappearFrame:int;
      
      private var m_iCurrentShowFrameLable:int = -1;
      
      private var m_stTargetGrid:a_3491;
      
      private var m_iCount:int;
      
      public function SugarChestnutsSecondShot()
      {
         super();
         a_1573 = 5;
         a_1576 = true;
         a_1588 = true;
         a_1275 = 0;
         a_1587 = 1;
         this.m_iLoopFrame = 2;
         this.m_iDisappearFrame = 3;
         m_iYDisplayCenterPos = -15;
         a_1279 = -14;
      }
      
      public static function a_4344() : SugarChestnutsSecondShot
      {
         var stShot:SugarChestnutsSecondShot = ms_arrShot.pop();
         if(null == stShot)
         {
            stShot = new SugarChestnutsSecondShot();
         }
         BattleFieldView.a_1018.play();
         return stShot;
      }
      
      public function set TargetGrid(stFieldGrid:a_3491) : void
      {
         if(stFieldGrid == null)
         {
            throw new Error("错误格子类型");
         }
         this.m_stTargetGrid = stFieldGrid;
      }
      
      public function get TargetGrid() : a_3491
      {
         return this.m_stTargetGrid;
      }
      
      override protected function getBindMovie() : Class
      {
         return SugarChestnutsSecondShotMovie;
      }
      
      override protected function a_4349() : Boolean
      {
         var iXGridNo:int = 0;
         var stFieldGrid:a_3491 = null;
         var stMoveIntrude:a_4206 = null;
         var numDistance:Number = NaN;
         if(a_1283)
         {
            iXGridNo = BattleFieldView.a_1011 - 1 - int(x / a_3491.a_1080);
         }
         else
         {
            iXGridNo = int(x / a_3491.a_1080);
         }
         if(null != this.TargetGrid)
         {
            numDistance = Math.abs(this.TargetGrid.m_iXGridNo - iXGridNo) * a_3491.a_1080;
            if(numDistance < 20)
            {
               numDistance = 20;
            }
            a_1581 = Math.abs(int(numDistance / m_numXSpeed));
            if(numDistance < 1.5 * a_3491.a_1080)
            {
               if(a_1581 < 2)
               {
                  a_1581 = 2;
                  m_numXSpeed = 5;
               }
               m_numYSpeed = a_3491.a_1081 * 0.5 / a_1581;
            }
            else
            {
               m_numYSpeed = 3 * a_3491.a_1081 / a_1581;
            }
         }
         return true;
      }
      
      override public function a_4216(iCurrentTime:int) : void
      {
         var numYMove:Number = NaN;
         if(m_isHited)
         {
            nextFrame();
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
         x += m_numXSpeed;
         if(a_1576)
         {
            numYMove = 2 * m_numYSpeed * (iCurrentTime - a_1447) / a_1581 - m_numYSpeed;
            y += numYMove > 30 ? 30 : numYMove;
         }
         this.CheckIsTarget(iCurrentTime);
      }
      
      private function CheckIsTarget(iCurrentTime:int) : void
      {
         if(iCurrentTime - a_1447 >= a_1581)
         {
            this.ChangeToAttackState(iCurrentTime);
         }
      }
      
      private function ChangeToAttackState(iCurrentTime:int) : void
      {
         a_1583.AddToBattleView(this,BattleLayerDefine.EFFECTS_BASE_TYPE);
         m_isHited = true;
         a_1588 = false;
         this.m_iStartAttckTime = iCurrentTime;
         this.m_iCount = 0;
         this.ChangeToFrameLable(a_1587);
         this.x = this.TargetGrid.m_iXGridNo * a_3491.a_1080 + 15;
         this.y = this.TargetGrid.m_iYGridNo * a_3491.a_1081 + 40;
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
         var lx:int = Math.max(0,this.TargetGrid.m_iXGridNo - 1);
         var rx:int = Math.min(BattleFieldView.a_1011 - 1,this.TargetGrid.m_iXGridNo + 1);
         var dy:int = Math.max(0,this.TargetGrid.m_iYGridNo - 1);
         var uy:int = Math.min(BattleFieldView.a_1012 - 1,this.TargetGrid.m_iYGridNo + 1);
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
                        this.HitMoveIntruder3(stMoveIntruder,this.TargetGrid.m_iXGridNo == i || this.TargetGrid.m_iYGridNo == j ? 1.2 : 1);
                        if(stMoveIntruder.iLifeValue <= 0 && Boolean(stMoveIntruder.m_stCurrentFieldGrid))
                        {
                           stMoveIntruder.a_4210();
                        }
                     }
                  }
               }
            }
         }
      }
      
      public function HitMoveIntruder3(baseMoveIntruder:a_4206, hurtRate:Number = 1) : Boolean
      {
         if(!m_isPenetrate)
         {
            m_bActive.Value = false;
         }
         if(a_1576 || a_1575)
         {
            baseMoveIntruder.a_4209(GetFinalDamage() * hurtRate);
         }
         else
         {
            baseMoveIntruder.a_3969(GetFinalDamage() * hurtRate);
         }
         if(baseMoveIntruder.m_stCurrentFieldGrid == null || baseMoveIntruder.iLifeValue <= 0 || baseMoveIntruder.parent == null)
         {
            return false;
         }
         if(a_1573 > 0)
         {
            baseMoveIntruder.a_4208(b_182.a_432,a_1573);
         }
         if(a_1574 > 0)
         {
            if(baseMoveIntruder.iArmorLifeValue <= 0 || a_1576)
            {
               baseMoveIntruder.a_4208(b_182.a_433,a_1574 * a_1326);
            }
         }
         if(a_1325 > 5)
         {
            baseMoveIntruder.a_4208(b_182.a_433,0);
         }
         if(m_isShowColdSlow)
         {
            baseMoveIntruder.a_4208(b_182.a_433,150);
         }
         if(m_isShowPoisonGas)
         {
            baseMoveIntruder.PoisonHurtPower = PoisonHurtPower;
            baseMoveIntruder.a_4208(b_182.enm_shotEffectPoisonGas,3);
         }
         return true;
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

