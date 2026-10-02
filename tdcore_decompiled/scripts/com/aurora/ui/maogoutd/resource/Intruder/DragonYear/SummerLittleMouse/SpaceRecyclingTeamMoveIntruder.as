package com.aurora.ui.maogoutd.resource.Intruder.DragonYear.SummerLittleMouse
{
   import a_4718.b_181;
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.defender.a_3962;
   import flash.display.Bitmap;
   import flash.display.FrameLabel;
   import flash.geom.Point;
   
   public class SpaceRecyclingTeamMoveIntruder extends a_4206
   {
      
      public var m_stCityWantedDefenseBitmap:Bitmap = new Bitmap();
      
      private var a_1515:int = 0;
      
      private var a_1544:int = 0;
      
      private var a_1545:int = 0;
      
      private var m_spaceRecyclingTargetBrand:SpaceRecyclingTargetBrand;
      
      public function SpaceRecyclingTeamMoveIntruder()
      {
         a_1481 = false;
         a_1463 = true;
         super();
      }
      
      public static function a_3926() : a_4206
      {
         return PoolManager.getInstance().CheckOutOne(SpaceRecyclingTeamMoveIntruder) as SpaceRecyclingTeamMoveIntruder;
      }
      
      override protected function getBindMovie() : Class
      {
         return SpaceRecyclingTeamMoveIntruderMovie;
      }
      
      override public function a_1797(iGlobalMoveFighterID:int, iIntruderMoveDirection:int) : Boolean
      {
         super.a_1797(iGlobalMoveFighterID,iIntruderMoveDirection);
         a_1350 = a_3491.a_1080 / 60;
         if(iIntruderMoveDirection < 0)
         {
            a_1350 *= -1;
         }
         a_1339 = 1500;
         a_1279 = -width * 0.4;
         m_iYDisplayCenterPos = -58;
         a_1465 = 3;
         a_1272 = 0;
         this.a_1515 = 0;
         this.m_stCityWantedDefenseBitmap.x = 0;
         this.m_stCityWantedDefenseBitmap.y = 0;
         this.m_stCityWantedDefenseBitmap.bitmapData = null;
         addChild(this.m_stCityWantedDefenseBitmap);
         return true;
      }
      
      override protected function a_3940() : Boolean
      {
         super.a_3940();
         this.m_stCityWantedDefenseBitmap.bitmapData = null;
         if(this.m_spaceRecyclingTargetBrand != null)
         {
            this.m_spaceRecyclingTargetBrand.a_3940();
            this.m_spaceRecyclingTargetBrand = null;
         }
         return true;
      }
      
      override protected function ResetMovieStatus() : Boolean
      {
         if(a_1339 <= 0)
         {
            if(m_stCurrentFieldGrid)
            {
               m_stCurrentFieldGrid.a_3457(this);
               m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3457(this);
            }
            this.a_3940();
         }
         else if(this.a_1515 > 80)
         {
            if(iLifeValue > 500)
            {
               gotoAndStop((a_1276[0] as FrameLabel).frame);
            }
            else
            {
               gotoAndStop((a_1276[2] as FrameLabel).frame);
            }
         }
         return true;
      }
      
      override public function a_3969(iRduceLifeValue:int) : Boolean
      {
         return true;
      }
      
      override public function a_4209(iRduceLifeValue:int) : Boolean
      {
         return true;
      }
      
      override public function a_4215(stBaseDefense:a_3962) : Boolean
      {
         super.a_4215(stBaseDefense);
         return true;
      }
      
      override public function a_4210() : Boolean
      {
         if(m_stCurrentFieldGrid != null && m_stCurrentFieldGrid.m_iHurtRate <= 0)
         {
            return true;
         }
         super.a_4210();
         return true;
      }
      
      override public function a_4216(iCurrentTime:int) : Boolean
      {
         var numShieftYHeight:Number = NaN;
         var numChangeHeight:Number = NaN;
         var stBaseDefense:a_3962 = null;
         var stPoint:Point = null;
         var stFieldGrid:a_3491 = null;
         var spaceRecyclingTargetBrand:SpaceRecyclingTargetBrand = null;
         if(!a_1460)
         {
            a_1460 = true;
         }
         var numOrigXPos:Number = x;
         if(this.a_1515 > 0)
         {
            --this.a_1515;
            numShieftYHeight = (m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.y + a_3491.a_1081 * this.a_1545) / 20;
            if(this.a_1515 <= 200 && this.a_1515 >= 190)
            {
               y += numShieftYHeight * 2;
               if(90 == this.a_1515)
               {
                  numChangeHeight = a_3491.a_1081 * this.a_1545 - 15 - y;
                  y = a_3491.a_1081 * this.a_1545 - 15;
               }
            }
            if(this.a_1515 == 80)
            {
               if(iLifeValue < 500)
               {
                  gotoAndStop((a_1276[3] as FrameLabel).frame);
               }
               else
               {
                  gotoAndStop((a_1276[1] as FrameLabel).frame);
               }
            }
            if(a_1273 == 22 || a_1273 == 46)
            {
               a_1465 = 0;
               stop();
               stBaseDefense = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(this.a_1544,this.a_1545).a_3494();
               if(stBaseDefense)
               {
                  stPoint = globalToLocal(stBaseDefense.parent.localToGlobal(new Point(stBaseDefense.x,stBaseDefense.y)));
                  this.m_stCityWantedDefenseBitmap.x = stPoint.x;
                  this.m_stCityWantedDefenseBitmap.y = stPoint.y - 128;
                  this.m_stCityWantedDefenseBitmap.bitmapData = stBaseDefense.stDisplayBitmap.bitmapData;
                  stBaseDefense.m_iDieType = 1;
                  stBaseDefense.a_3969(stBaseDefense.iLifeValue);
               }
            }
            if(this.a_1515 <= 10 + 54 && this.a_1515 >= 0 + 54)
            {
               y -= numShieftYHeight * 2;
            }
            if(this.a_1515 == 0 + 54)
            {
               if(m_stCurrentFieldGrid)
               {
                  m_stCurrentFieldGrid.a_3457(this);
                  m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3457(this);
               }
               this.a_3940();
               return true;
            }
         }
         if(this.a_1515 == 0)
         {
            stFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.GetFiledGrid2ThiefMouse(iCurrentTime);
            if(stFieldGrid)
            {
               this.a_1544 = stFieldGrid.m_iXGridNo;
               this.a_1545 = stFieldGrid.m_iYGridNo;
            }
            if(null == stFieldGrid)
            {
               this.a_3969(a_1339);
               return true;
            }
            this.a_1515 = 140 + 100;
            spaceRecyclingTargetBrand = SpaceRecyclingTargetBrand.a_3926();
            spaceRecyclingTargetBrand.a_1797(m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(this.a_1544,this.a_1545));
            this.m_spaceRecyclingTargetBrand = spaceRecyclingTargetBrand;
            if(Boolean(parent) && parent.contains(this))
            {
               parent.removeChild(this);
            }
            x = a_3491.a_1080 * (this.a_1544 + 0.5);
            y = -m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.y - 20;
            ChangeFieldGrid(stFieldGrid);
            m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(this,BattleLayerDefine.EFFECTS_TOP_TYPE,stFieldGrid);
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

