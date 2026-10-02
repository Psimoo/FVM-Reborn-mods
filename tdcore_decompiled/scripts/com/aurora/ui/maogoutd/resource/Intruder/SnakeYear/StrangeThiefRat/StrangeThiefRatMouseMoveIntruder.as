package com.aurora.ui.maogoutd.resource.Intruder.SnakeYear.StrangeThiefRat
{
   import a_4718.b_182;
   import a_4754.a_2161;
   import com.adobe.utils.RandomSeed;
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.defender.a_3962;
   import com.aurora.ui.maogoutd.resource.effect.a_4108;
   import flash.display.Bitmap;
   import flash.display.FrameLabel;
   import flash.geom.Point;
   
   public class StrangeThiefRatMouseMoveIntruder extends a_4206
   {
      
      private static var globalCountID:int = 0;
      
      public var m_stStrangeThiefRatMouseRope:StrangeThiefRatMouseRope = new StrangeThiefRatMouseRope();
      
      public var m_stStrangeThiefRatTargetBrand:StrangeThiefRatTargetBrand = StrangeThiefRatTargetBrand.a_3926();
      
      public var m_stStrangeThiefRatDefenseBitmap:Bitmap = new Bitmap();
      
      private var a_1515:int = 0;
      
      private var a_1544:int = 0;
      
      private var a_1545:int = 0;
      
      private const FULL_HP:int = 1400;
      
      private const HURT_HP:int = 700;
      
      private const DEAD_HP:int = 0;
      
      private var bHasFlower:Boolean = false;
      
      private var bThiefSkill:Boolean = false;
      
      private var bFogfSkill:Boolean = false;
      
      private var bWatiteSkill:Boolean = false;
      
      private var m_stRandomSeed:RandomSeed = new RandomSeed();
      
      public function StrangeThiefRatMouseMoveIntruder()
      {
         super();
         a_1481 = false;
         a_1463 = true;
         SetCannotSeeByFighter(true);
         a_1279 = -50;
      }
      
      public static function a_3926() : a_4206
      {
         return PoolManager.getInstance().CheckOutOne(StrangeThiefRatMouseMoveIntruder) as StrangeThiefRatMouseMoveIntruder;
      }
      
      override protected function getBindMovie() : Class
      {
         return StrangeThiefRatMouseMoveIntruderMovie;
      }
      
      override public function a_1797(iGlobalMoveFighterID:int, iIntruderMoveDirection:int) : Boolean
      {
         super.a_1797(iGlobalMoveFighterID,iIntruderMoveDirection);
         a_1350 = a_3491.a_1080 / 60;
         if(iIntruderMoveDirection < 0)
         {
            a_1350 *= -1;
         }
         a_1339 = this.FULL_HP;
         a_1465 = 3;
         this.a_1515 = 0;
         this.m_stStrangeThiefRatDefenseBitmap.x = 0;
         this.m_stStrangeThiefRatDefenseBitmap.y = 0;
         this.m_stStrangeThiefRatDefenseBitmap.bitmapData = null;
         addChild(this.m_stStrangeThiefRatDefenseBitmap);
         this.bHasFlower = this.bThiefSkill = this.bFogfSkill = this.bWatiteSkill = false;
         ++globalCountID;
         var enterRoom:Object = a_2161.e.getEnterRoom();
         this.m_stRandomSeed.setSeed(enterRoom.m_RandomSeed,1000 + globalCountID);
         return true;
      }
      
      override protected function a_3940() : Boolean
      {
         super.a_3940();
         this.m_stStrangeThiefRatMouseRope.height = 0;
         if(Boolean(this.m_stStrangeThiefRatMouseRope.parent) && this.m_stStrangeThiefRatMouseRope.parent.contains(this.m_stStrangeThiefRatMouseRope))
         {
            this.m_stStrangeThiefRatMouseRope.parent.removeChild(this.m_stStrangeThiefRatMouseRope);
         }
         if(Boolean(this.m_stStrangeThiefRatTargetBrand.parent) && this.m_stStrangeThiefRatTargetBrand.parent.contains(this.m_stStrangeThiefRatTargetBrand))
         {
            this.m_stStrangeThiefRatTargetBrand.parent.removeChild(this.m_stStrangeThiefRatTargetBrand);
         }
         this.m_stStrangeThiefRatDefenseBitmap.bitmapData = null;
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
      
      override public function a_4210() : Boolean
      {
         return true;
      }
      
      override public function a_4212() : Boolean
      {
         return true;
      }
      
      override public function a_4216(iCurrentTime:int) : Boolean
      {
         var numShieftYHeight:Number = NaN;
         var numShieftYHeight1:Number = NaN;
         var numChangeHeight:Number = NaN;
         var stBaseDefense:a_3962 = null;
         var stPoint:Point = null;
         var stFieldGrid:a_3491 = null;
         if(this.a_1515 > 0)
         {
            if(!this.bWatiteSkill)
            {
               --this.a_1515;
            }
            numShieftYHeight = (m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.y + a_3491.a_1081 * this.a_1545) / 20;
            numShieftYHeight1 = (m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.y + a_3491.a_1081 * this.a_1545 - 36) / 20;
            if(this.a_1515 <= 158 && this.a_1515 >= 148)
            {
               this.m_stStrangeThiefRatTargetBrand.y += numShieftYHeight * 2;
               this.m_stStrangeThiefRatTargetBrand.nextFrame();
            }
            if(this.a_1515 <= 108 && this.a_1515 >= 98 && !this.bHasFlower)
            {
               y += numShieftYHeight1 * 2;
               this.m_stStrangeThiefRatMouseRope.height += numShieftYHeight1 * 2;
               if(98 == this.a_1515)
               {
                  numChangeHeight = a_3491.a_1081 * this.a_1545 - 15 - y;
                  y = a_3491.a_1081 * this.a_1545 - 15 - 36;
                  this.m_stStrangeThiefRatMouseRope.height += numChangeHeight;
               }
            }
            if(!this.bHasFlower && this.a_1515 <= 98 && this.a_1515 > 38)
            {
               this.CheckHasFlower(m_stCurrentFieldGrid);
            }
            if(this.a_1515 == 38)
            {
               if(a_1339 >= this.HURT_HP)
               {
                  a_1275 = 2;
                  this.gotoAndStop((a_1276[1] as FrameLabel).frame);
               }
               else
               {
                  a_1275 = 6;
                  this.gotoAndStop((a_1276[5] as FrameLabel).frame);
               }
               if(Boolean(this.m_stStrangeThiefRatTargetBrand.parent) && this.m_stStrangeThiefRatTargetBrand.parent.contains(this.m_stStrangeThiefRatTargetBrand))
               {
                  this.m_stStrangeThiefRatTargetBrand.parent.removeChild(this.m_stStrangeThiefRatTargetBrand);
               }
               a_1465 = 0;
            }
            if(this.a_1515 <= 12 && this.a_1515 >= 0)
            {
               y -= numShieftYHeight * 2;
               this.m_stStrangeThiefRatMouseRope.height -= numShieftYHeight * 2;
            }
            if(iCurrentTime % 2 == 0)
            {
               if(!this.bFogfSkill && (a_1273 == 16 || a_1273 == 55))
               {
                  this.AddBoomEffect(m_stCurrentFieldGrid);
                  this.bFogfSkill = true;
               }
               else if(!this.bThiefSkill && (a_1273 == 21 || a_1273 == 60))
               {
                  stop();
                  this.bThiefSkill = true;
                  stBaseDefense = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(this.a_1544,this.a_1545).a_3494();
                  if(stBaseDefense)
                  {
                     stPoint = globalToLocal(stBaseDefense.parent.localToGlobal(new Point(stBaseDefense.x,stBaseDefense.y)));
                     this.m_stStrangeThiefRatDefenseBitmap.x = stPoint.x;
                     this.m_stStrangeThiefRatDefenseBitmap.y = stPoint.y;
                     this.m_stStrangeThiefRatDefenseBitmap.bitmapData = stBaseDefense.stDisplayBitmap.bitmapData;
                     stBaseDefense.m_iDieType = 1;
                     stBaseDefense.a_3969(stBaseDefense.iLifeValue);
                  }
               }
               else if(this.bWatiteSkill && (a_1273 == 37 || a_1273 == 76))
               {
                  iCurrentFrame;
                  stop();
                  this.bWatiteSkill = false;
                  this.a_1515 = 12;
               }
            }
            if(this.a_1515 == 0)
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
            stFieldGrid = this.getThiefGrid();
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
            this.a_1515 = 158;
            x = a_3491.a_1080 * (this.a_1544 + 0.5);
            y = -m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.y - 20;
            this.m_stStrangeThiefRatMouseRope.x = a_3491.a_1080 * (this.a_1544 + 0.6);
            this.m_stStrangeThiefRatMouseRope.y = y;
            this.m_stStrangeThiefRatMouseRope.height = 50;
            m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(this.m_stStrangeThiefRatMouseRope,BattleLayerDefine.INTRUDER_WATER_TYPE,stFieldGrid);
            this.m_stStrangeThiefRatTargetBrand.a_1797();
            this.m_stStrangeThiefRatTargetBrand.x = a_3491.a_1080 * this.a_1544;
            this.m_stStrangeThiefRatTargetBrand.y = -m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.y + a_3491.a_1081 - this.m_stStrangeThiefRatTargetBrand.height;
            m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(this.m_stStrangeThiefRatTargetBrand,BattleLayerDefine.INTRUDER_WATER_TYPE,stFieldGrid);
            if(a_1283)
            {
               x = BattleFieldView.a_1013 - x;
               this.m_stStrangeThiefRatMouseRope.x = BattleFieldView.a_1013 - this.m_stStrangeThiefRatMouseRope.x - this.m_stStrangeThiefRatMouseRope.width;
               this.m_stStrangeThiefRatTargetBrand.x = BattleFieldView.a_1013 - this.m_stStrangeThiefRatTargetBrand.x - this.m_stStrangeThiefRatTargetBrand.width;
            }
            ChangeFieldGrid(stFieldGrid);
            if(Boolean(parent) && parent.contains(this))
            {
               parent.removeChild(this);
            }
            m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(this,BattleLayerDefine.INTRUDER_LAND_TYPE,stFieldGrid);
         }
         return true;
      }
      
      override public function gotoAndStop(frame:Object, scene:String = null) : void
      {
         super.gotoAndStop(frame,scene);
      }
      
      private function CheckHasFlower(a_1334:*) : Boolean
      {
         var xIndex:int = 0;
         var stFieldGrid:a_3491 = null;
         if(a_1334 == null)
         {
            return false;
         }
         var xStart:int = Math.max(a_1334.m_iXGridNo - 1,0);
         var xEnd:int = Math.min(a_1334.m_iXGridNo + 1,BattleFieldView.a_1011 - 1);
         var yStart:int = Math.max(a_1334.m_iYGridNo - 1,0);
         var yEnd:int = Math.min(a_1334.m_iYGridNo + 1,BattleFieldView.a_1012 - 1);
         loop0:
         for(var yIndex:int = yStart; yIndex <= yEnd; )
         {
            xIndex = xStart;
            while(true)
            {
               if(xIndex > xEnd)
               {
                  yIndex++;
                  continue loop0;
               }
               stFieldGrid = a_1334.m_stCurrentBattbleFieldView.a_3438(xIndex,yIndex);
               if(stFieldGrid.m_stFlowerDefense != null && (stFieldGrid.m_stFlowerDefense.iEnergyTypeID == 1 || stFieldGrid.m_stFlowerDefense.iEnergyTypeID == 3))
               {
                  break;
               }
               xIndex++;
            }
            this.bHasFlower = true;
            this.bWatiteSkill = true;
            if(a_1339 >= this.HURT_HP)
            {
               a_1275 = 3;
               this.gotoAndStop((a_1276[3] as FrameLabel).frame);
            }
            else
            {
               a_1275 = 7;
               this.gotoAndStop((a_1276[7] as FrameLabel).frame);
            }
            if(Boolean(this.m_stStrangeThiefRatTargetBrand.parent) && this.m_stStrangeThiefRatTargetBrand.parent.contains(this.m_stStrangeThiefRatTargetBrand))
            {
               this.m_stStrangeThiefRatTargetBrand.parent.removeChild(this.m_stStrangeThiefRatTargetBrand);
            }
            return true;
         }
         return false;
      }
      
      private function AddBoomEffect(stCenterGrid:a_3491) : void
      {
         var battleFieldView:BattleFieldView = null;
         var fogEffect:StrangeThiefRatBoomEffect = null;
         if(stCenterGrid == null)
         {
            return;
         }
         battleFieldView = stCenterGrid.m_stCurrentBattbleFieldView;
         fogEffect = StrangeThiefRatBoomEffect.a_3926() as StrangeThiefRatBoomEffect;
         if(fogEffect == null)
         {
            return;
         }
         fogEffect.m_MoveState = true;
         fogEffect.stOriginalFieldGrid = stCenterGrid;
         fogEffect.a_1797(false);
         fogEffect.x = (stCenterGrid.m_iXGridNo + 0.5) * a_3491.a_1080;
         fogEffect.y = (stCenterGrid.m_iYGridNo + 0.5) * a_3491.a_1081;
         battleFieldView.AddToBattleView(fogEffect,BattleLayerDefine.INTRUDER_LAND_TYPE,stCenterGrid);
         fogEffect.play();
      }
      
      private function getThiefGrid() : a_3491
      {
         var stTargetFieldGrid:a_3491 = null;
         var xIndex:int = 0;
         var randIndex:int = 0;
         var randX:int = 0;
         var randY:int = 0;
         var returnGrid:a_3491 = null;
         if(m_stCurrentFieldGrid == null)
         {
            return null;
         }
         var xStart:int = 1;
         var xEnd:int = BattleFieldView.a_1011 - 2;
         var yStart:int = 1;
         var yEnd:int = BattleFieldView.a_1012 - 2;
         var existArr:Array = [];
         for(var yIndex:int = yStart; yIndex <= yEnd; yIndex++)
         {
            for(xIndex = xStart; xIndex <= xEnd; xIndex++)
            {
               stTargetFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(xIndex,yIndex);
               if(Boolean(stTargetFieldGrid) && stTargetFieldGrid.a_3492())
               {
                  existArr.push(stTargetFieldGrid);
               }
            }
         }
         if(existArr.length > 0)
         {
            randIndex = int(this.m_stRandomSeed.nextInt(existArr.length));
            returnGrid = existArr[randIndex];
         }
         else
         {
            randX = this.m_stRandomSeed.nextInt(BattleFieldView.a_1011 - 2) + 1;
            randY = this.m_stRandomSeed.nextInt(BattleFieldView.a_1012 - 2) + 1;
            returnGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(randX,randY);
         }
         return returnGrid;
      }
      
      override public function a_4208(iEffectType:int, iEffectTime:int, stBaseEffect:a_4108 = null) : void
      {
         if(this.bWatiteSkill && b_182.enm_shotEffectXuanYun != iEffectType)
         {
            super.a_4208(iEffectType,iEffectTime,stBaseEffect);
         }
      }
      
      override public function play() : void
      {
         super.play();
      }
   }
}

