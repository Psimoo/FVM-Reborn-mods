package com.aurora.ui.maogoutd.resource.Intruder
{
   import a_4718.b_181;
   import com.adobe.utils.RandomSeed;
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.defender.a_3962;
   import com.aurora.ui.maogoutd.resource.tools.ThiefMouseRope;
   import com.aurora.ui.maogoutd.resource.tools.ThiefTargetBrand;
   import flash.display.Bitmap;
   import flash.display.FrameLabel;
   import flash.geom.Point;
   
   public class ThiefMouseFirstTransMoveIntruder extends a_4206
   {
      
      public var m_stThiefMouseRope:ThiefMouseRope = new ThiefMouseRope();
      
      public var m_stThiefTargetBrand:ThiefTargetBrand = ThiefTargetBrand.a_3926();
      
      public var m_stThiefDefenseBitmap:Bitmap = new Bitmap();
      
      private var a_1515:int = 0;
      
      private var a_1544:int = 0;
      
      private var a_1545:int = 0;
      
      protected var m_stRandomSeed:RandomSeed = new RandomSeed();
      
      public function ThiefMouseFirstTransMoveIntruder()
      {
         a_1481 = false;
         a_1463 = true;
         super();
      }
      
      public static function a_3926() : a_4206
      {
         return PoolManager.getInstance().CheckOutOne(ThiefMouseFirstTransMoveIntruder) as ThiefMouseFirstTransMoveIntruder;
      }
      
      override protected function getBindMovie() : Class
      {
         return ThiefMouseFirstTransMoveIntruderMovie;
      }
      
      override public function a_1797(iGlobalMoveFighterID:int, iIntruderMoveDirection:int) : Boolean
      {
         super.a_1797(iGlobalMoveFighterID,iIntruderMoveDirection);
         a_1350 = a_3491.a_1080 / 60;
         if(iIntruderMoveDirection < 0)
         {
            a_1350 *= -1;
         }
         a_1339 = 800;
         a_1279 = -width * 0.4;
         a_1465 = 3;
         a_1272 = 0;
         this.a_1515 = 0;
         this.m_stThiefDefenseBitmap.x = 0;
         this.m_stThiefDefenseBitmap.y = 0;
         this.m_stThiefDefenseBitmap.bitmapData = null;
         addChild(this.m_stThiefDefenseBitmap);
         return true;
      }
      
      override protected function a_3940() : Boolean
      {
         super.a_3940();
         this.m_stThiefMouseRope.height = 0;
         if(this.m_stThiefMouseRope.parent)
         {
            this.m_stThiefMouseRope.parent.removeChild(this.m_stThiefMouseRope);
         }
         if(this.m_stThiefTargetBrand.parent)
         {
            this.m_stThiefTargetBrand.parent.removeChild(this.m_stThiefTargetBrand);
         }
         this.m_stThiefDefenseBitmap.bitmapData = null;
         return true;
      }
      
      override protected function ResetMovieStatus() : Boolean
      {
         if(a_1339 <= 0)
         {
            m_stCurrentFieldGrid.a_3457(this);
            m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3457(this);
            this.a_3940();
         }
         return true;
      }
      
      override public function a_3969(iRduceLifeValue:int) : Boolean
      {
         super.a_3969(iRduceLifeValue);
         if(a_1339 <= 0)
         {
            if(m_stCurrentFieldGrid)
            {
               m_stCurrentFieldGrid.a_3457(this);
               m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3457(this);
            }
            this.a_3940();
         }
         return true;
      }
      
      override public function a_4210() : Boolean
      {
         m_stCurrentFieldGrid.a_3457(this);
         m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3457(this);
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
         var numShieftYHeight:Number = NaN;
         var numChangeHeight:Number = NaN;
         var stBaseDefense:a_3962 = null;
         var stPoint:Point = null;
         var stFieldGrid:a_3491 = null;
         var numOrigXPos:Number = x;
         if(this.a_1515 > 0)
         {
            --this.a_1515;
            numShieftYHeight = (m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.y + a_3491.a_1081 * this.a_1545) / 20;
            if(this.a_1515 <= 140 && this.a_1515 >= 130)
            {
               this.m_stThiefTargetBrand.y += numShieftYHeight * 2;
               this.m_stThiefTargetBrand.nextFrame();
            }
            if(this.a_1515 <= 100 && this.a_1515 >= 90)
            {
               y += numShieftYHeight * 2;
               this.m_stThiefMouseRope.height += numShieftYHeight * 2;
               if(90 == this.a_1515)
               {
                  numChangeHeight = a_3491.a_1081 * this.a_1545 - 15 - y;
                  y = a_3491.a_1081 * this.a_1545 - 15;
                  this.m_stThiefMouseRope.height += numChangeHeight;
               }
            }
            if(this.a_1515 == 26)
            {
               gotoAndStop((a_1276[1] as FrameLabel).frame);
               if(Boolean(this.m_stThiefTargetBrand.parent) && this.m_stThiefTargetBrand.parent.contains(this.m_stThiefTargetBrand))
               {
                  this.m_stThiefTargetBrand.parent.removeChild(this.m_stThiefTargetBrand);
               }
               a_1465 = 0;
            }
            if(a_1273 == a_1274 - 1)
            {
               stop();
               stBaseDefense = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(this.a_1544,this.a_1545).a_3494();
               if(stBaseDefense)
               {
                  stPoint = globalToLocal(stBaseDefense.parent.localToGlobal(new Point(stBaseDefense.x,stBaseDefense.y)));
                  this.m_stThiefDefenseBitmap.x = stPoint.x;
                  this.m_stThiefDefenseBitmap.y = stPoint.y;
                  this.m_stThiefDefenseBitmap.bitmapData = stBaseDefense.stDisplayBitmap.bitmapData;
                  stBaseDefense.m_iDieType = 1;
                  stBaseDefense.a_3969(stBaseDefense.iLifeValue);
               }
            }
            if(this.a_1515 <= 10 && this.a_1515 >= 0)
            {
               y -= numShieftYHeight * 2;
               this.m_stThiefMouseRope.height -= numShieftYHeight * 2;
            }
            if(this.a_1515 == 0)
            {
               m_stCurrentFieldGrid.a_3457(this);
               m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3457(this);
               this.a_3940();
               return true;
            }
         }
         if(this.a_1515 == 0)
         {
            this.m_stRandomSeed.setSeed(globalMoveFighterID - m_stCurrentFieldGrid.m_iYGridNo,globalMoveFighterID + m_stCurrentFieldGrid.m_iYGridNo);
            this.a_1544 = this.m_stRandomSeed.nextInt(BattleFieldView.a_1011);
            this.a_1545 = this.m_stRandomSeed.nextInt(BattleFieldView.a_1012);
            stFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(this.a_1544,this.a_1545);
            if(null == stFieldGrid)
            {
               this.a_3969(a_1339);
               return true;
            }
            this.a_1515 = 140;
            x = a_3491.a_1080 * (this.a_1544 + 0.5);
            y = -m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.y - 20;
            this.m_stThiefMouseRope.x = a_3491.a_1080 * (this.a_1544 + 0.6);
            this.m_stThiefMouseRope.y = y;
            this.m_stThiefMouseRope.height = 50;
            m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(this.m_stThiefMouseRope,BattleLayerDefine.INTRUDER_WATER_TYPE,stFieldGrid);
            this.m_stThiefTargetBrand.a_1797();
            this.m_stThiefTargetBrand.x = a_3491.a_1080 * this.a_1544;
            this.m_stThiefTargetBrand.y = -m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.y + a_3491.a_1081 - this.m_stThiefTargetBrand.height;
            m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(this.m_stThiefTargetBrand,BattleLayerDefine.INTRUDER_WATER_TYPE,stFieldGrid);
            if(a_1283)
            {
               x = BattleFieldView.a_1013 - x;
               this.m_stThiefMouseRope.x = BattleFieldView.a_1013 - this.m_stThiefMouseRope.x - this.m_stThiefMouseRope.width;
               this.m_stThiefTargetBrand.x = BattleFieldView.a_1013 - this.m_stThiefTargetBrand.x - this.m_stThiefTargetBrand.width;
            }
            ChangeFieldGrid(stFieldGrid);
            if(Boolean(parent) && parent.contains(this))
            {
               parent.removeChild(this);
            }
            m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(this,BattleLayerDefine.INTRUDER_LAND_TYPE,stFieldGrid);
         }
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

