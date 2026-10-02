package com.aurora.ui.maogoutd.resource.Intruder.DragonYear.SummerLittleMouse
{
   import a_4718.b_181;
   import a_4752.a_2036;
   import com.adobe.utils.RandomSeed;
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.avatar.a_3924;
   import com.aurora.ui.maogoutd.resource.defender.a_3962;
   import flash.display.FrameLabel;
   import flash.utils.setTimeout;
   
   public class SpaceWormHoleMouseMoveIntruder extends a_4206
   {
      
      private static const MAX_LIFE:int = 900;
      
      private static const MAX_INJURED_LIFE:int = MAX_LIFE * 0.3;
      
      private static const ONE_GRID_SPEED:int = 4;
      
      protected var m_stRandomSeed:RandomSeed = new RandomSeed();
      
      private var m_stCreateGrid:a_3491;
      
      public function SpaceWormHoleMouseMoveIntruder()
      {
         super();
      }
      
      public static function a_3926() : a_4206
      {
         return PoolManager.getInstance().CheckOutOne(SpaceWormHoleMouseMoveIntruder) as SpaceWormHoleMouseMoveIntruder;
      }
      
      override protected function getBindMovie() : Class
      {
         return SpaceWormHoleMouseMoveIntruderMovie;
      }
      
      override public function a_1797(iGlobalMoveFighterID:int, iIntruderMoveDirection:int) : Boolean
      {
         super.a_1797(iGlobalMoveFighterID,iIntruderMoveDirection);
         a_1350 = a_3491.a_1080 / (20 * ONE_GRID_SPEED);
         if(iIntruderMoveDirection < 0)
         {
            a_1350 *= -1;
         }
         a_1339 = MAX_LIFE;
         m_SecondDieFrame = 46;
         a_1279 = -width * 0.2;
         a_1272 = 0;
         return true;
      }
      
      override protected function a_3940() : Boolean
      {
         var iYGridNo:int = 0;
         var lGrid:Array = null;
         var iXGridNo:* = 0;
         var stCreateGrid:a_3491 = null;
         this.m_stCreateGrid = null;
         if(m_stCurrentFieldGrid != null)
         {
            iYGridNo = m_stCurrentFieldGrid.m_iYGridNo;
            lGrid = new Array();
            for(iXGridNo = int(m_stCurrentFieldGrid.m_iXGridNo - 1); iXGridNo >= 0; iXGridNo--)
            {
               stCreateGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(iXGridNo,iYGridNo);
               if(stCreateGrid != null)
               {
                  if(this.IsCanLanuch(stCreateGrid))
                  {
                     if(!(iXGridNo == 0 && lGrid.length > 0))
                     {
                        lGrid.push(stCreateGrid);
                     }
                  }
               }
            }
            if(lGrid.length > 0)
            {
               this.m_stCreateGrid = lGrid[this.m_stRandomSeed.nextInt(lGrid.length)];
            }
         }
         setTimeout(this.CreateSpaceWormHole,1500);
         super.a_3940();
         return true;
      }
      
      public function IsCanLanuch(stFieldGrid:a_3491) : Boolean
      {
         if(null == stFieldGrid)
         {
            return false;
         }
         return null != stFieldGrid.m_stProtector || null != stFieldGrid.m_stTrayDefense || null != stFieldGrid.m_stBoomDefense || null != stFieldGrid.m_stFlowerDefense || null != stFieldGrid.m_stBaseAuxiliaryFighter || null != stFieldGrid.m_stAttackFighter && !(stFieldGrid.m_stAttackFighter is a_3924);
      }
      
      private function CreateSpaceWormHole() : void
      {
         var spaceWormHoleMoveIntruder:SpaceWormHoleMoveIntruder = null;
         if(a_2036.getInstance().m_bInBattleView == false)
         {
            return;
         }
         if(this.m_stCreateGrid == null)
         {
            return;
         }
         if(this.m_stCreateGrid.m_iXGridNo <= 1)
         {
            return;
         }
         spaceWormHoleMoveIntruder = SpaceWormHoleMoveIntruder.a_3926();
         spaceWormHoleMoveIntruder.a_1797((globalMoveFighterID << 16) + this.m_stCreateGrid.m_iYGridNo,-1);
         spaceWormHoleMoveIntruder.m_stMoveIntruderTypeID = 8389022;
         this.m_stCreateGrid.m_stCurrentBattbleFieldView.a_3459(spaceWormHoleMoveIntruder,this.m_stCreateGrid,false,BattleLayerDefine.INTRUDER_LAND_TYPE);
         spaceWormHoleMoveIntruder.x = this.m_stCreateGrid.m_iXGridNo * a_3491.a_1080;
         spaceWormHoleMoveIntruder.y = this.m_stCreateGrid.m_iYGridNo * a_3491.a_1081;
      }
      
      override protected function ResetMovieStatus() : Boolean
      {
         if(a_1339 > MAX_INJURED_LIFE)
         {
            if(a_1475)
            {
               if(a_1275 != 2)
               {
                  a_1275 = 2;
                  gotoAndStop((a_1276[2] as FrameLabel).frame);
               }
            }
            else if(a_1275 != 0)
            {
               a_1275 = 0;
               gotoAndStop((a_1276[0] as FrameLabel).frame);
            }
            a_3419();
         }
         else if(a_1339 > 0)
         {
            if(a_1475)
            {
               if(a_1275 != 3)
               {
                  a_1275 = 3;
                  gotoAndStop((a_1276[3] as FrameLabel).frame);
               }
            }
            else if(a_1275 != 1)
            {
               a_1275 = 1;
               gotoAndStop((a_1276[1] as FrameLabel).frame);
            }
            a_3419();
         }
         else if(a_1339 <= 0 && a_1275 != 5 && a_1275 != 4)
         {
            if(m_stCurrentFieldGrid.m_iXGridNo <= 1)
            {
               a_1275 = 5;
               gotoAndStop((a_1276[5] as FrameLabel).frame);
            }
            else
            {
               a_1275 = 4;
               gotoAndStop((a_1276[4] as FrameLabel).frame);
            }
            a_3419();
            if(m_stCurrentFieldGrid)
            {
               m_stCurrentFieldGrid.a_3457(this);
               m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3457(this);
            }
            this.play();
         }
         return true;
      }
      
      override public function a_3969(iRduceLifeValue:int) : Boolean
      {
         super.a_3969(iRduceLifeValue);
         return true;
      }
      
      override public function a_4210() : Boolean
      {
         super.a_4210();
         return true;
      }
      
      override public function a_4215(stBaseDefense:a_3962) : Boolean
      {
         super.a_4215(stBaseDefense);
         return true;
      }
      
      override public function a_4216(iCurrentTime:int) : Boolean
      {
         if(!a_1460)
         {
            a_1460 = true;
            this.m_stRandomSeed.setSeed(globalMoveFighterID - m_stCurrentFieldGrid.m_iYGridNo,globalMoveFighterID + m_stCurrentFieldGrid.m_iYGridNo);
         }
         var numOrigXPos:Number = x;
         super.a_4216(iCurrentTime);
         if(a_1457 == b_181.a_424 && (x > a_3491.a_1080 * 4 && a_1283 || x < a_3491.a_1080 * 5 && !a_1283))
         {
            y += Math.tan(15 * Math.PI / 180) * Math.abs(numOrigXPos - x);
         }
         return true;
      }
      
      override public function play() : void
      {
         super.play();
      }
   }
}

