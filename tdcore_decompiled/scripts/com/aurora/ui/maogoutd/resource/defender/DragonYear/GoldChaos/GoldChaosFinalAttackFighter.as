package com.aurora.ui.maogoutd.resource.defender.DragonYear.GoldChaos
{
   import a_4718.b_182;
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.defender.HorseYear.windrider.MouseScareHandler;
   import com.aurora.ui.maogoutd.resource.defender.a_3953;
   import flash.display.FrameLabel;
   import flash.geom.Point;
   
   public class GoldChaosFinalAttackFighter extends a_3953
   {
      
      private static const ELITE_SWALLOW_HURT:int = 9000;
      
      private var m_Skilling:Boolean;
      
      private var m_EateTimes:int;
      
      private var startPosition:Point;
      
      private var m_targetMouseArray:Array = new Array();
      
      public function GoldChaosFinalAttackFighter()
      {
         super();
         a_1095 = GoldChaosDefence.DEFENSE_PRICE;
         a_1310 = 10;
         a_1313 = true;
      }
      
      public static function a_3926() : a_3953
      {
         return PoolManager.getInstance().CheckOutOne(GoldChaosFinalAttackFighter) as GoldChaosFinalAttackFighter;
      }
      
      override protected function getBindMovie() : Class
      {
         return GoldChaosFinalAttackFighterMovie;
      }
      
      override public function a_1797(stFieldGrid:a_3491) : Boolean
      {
         super.a_1797(stFieldGrid);
         this.startPosition = new Point(stFieldGrid.m_iXGridNo * a_3491.a_1080 + 30,stFieldGrid.m_iYGridNo * a_3491.a_1081 + 30);
         this.m_Skilling = false;
         a_1308 = 0;
         a_1339 = 50;
         a_1275 = 0;
         this.m_EateTimes = 0;
         return true;
      }
      
      override protected function a_3964() : int
      {
         return GoldChaosDefence.a_3964(m_iSkillDegree);
      }
      
      override public function a_3969(iRduceLifeValue:int) : Boolean
      {
         if(a_1339 - iRduceLifeValue <= 0)
         {
            if(m_iDieType == 1)
            {
               if(a_1275 != 5)
               {
                  a_1275 = 5;
                  gotoAndStop((a_1276[a_1275] as FrameLabel).frame);
               }
            }
            else
            {
               super.a_3969(iRduceLifeValue);
            }
            return false;
         }
         return super.a_3969(iRduceLifeValue);
      }
      
      override public function a_3957(iCurrentTime:int) : void
      {
         if(iCurrentTime % 2 != 0)
         {
            return;
         }
         nextFrame();
         switch(a_1273)
         {
            case 17:
               this.ReleaseSpiceSkill();
               break;
            case 19:
               if(this.m_targetMouseArray.length == 0 && a_1275 != 0)
               {
                  this.resetSkillState(0);
               }
               break;
            case 25:
               this.KillMoveIntruder();
               this.UnlockMoveIntruder();
               break;
            case 29:
               if(a_1275 != 3)
               {
                  this.m_EateTimes = GoldChaosDefence.a_3965(a_1094);
                  a_1275 = 3;
                  gotoAndStop((a_1276[3] as FrameLabel).frame);
               }
               break;
            case 49:
               if(a_1275 != 0)
               {
                  a_1275 = 0;
                  gotoAndStop((a_1276[0] as FrameLabel).frame);
                  this.m_Skilling = false;
               }
               break;
            case 60:
               a_1334.m_stCurrentBattbleFieldView.AddToBattleView(this,BattleLayerDefine.EFFECTS_TOP_TYPE,a_1334);
               if(a_1336 != null)
               {
                  a_1336.visible = false;
               }
               this.a_4210();
               break;
            default:
               if(a_1273 == a_1274)
               {
                  super.a_3969(a_1339);
                  return;
               }
         }
         if(a_1278 != null)
         {
            gotoAndStop((a_1276[a_1275] as FrameLabel).frame);
         }
         ShowPlayOther(iCurrentTime);
      }
      
      override public function a_3940() : Boolean
      {
         if(m_bServerIssued)
         {
            this.UnlockMoveIntruder();
         }
         super.a_3940();
         return true;
      }
      
      override public function a_3954(iCurrentTime:int) : Boolean
      {
         if(a_1275 == 5 || a_1334 == null)
         {
            return a_1275 == 5;
         }
         if(iCurrentTime > m_iPlaceTimeIntervals + a_1308 && !this.m_Skilling && GoldChaosDefence.CanTriggerChangeYSkill(a_1334,-2,4,-3,3,3))
         {
            this.m_Skilling = true;
            a_1275 = 2;
            gotoAndStop((a_1276[1] as FrameLabel).frame);
         }
         if(this.m_EateTimes > 0 && --this.m_EateTimes == 0 && a_1275 != 4)
         {
            a_1275 = 4;
            gotoAndStop((a_1276[4] as FrameLabel).frame);
         }
         return true;
      }
      
      public function UnlockMoveIntruder() : void
      {
         var stMoveIntruder:a_4206 = null;
         for(var i:int = 0; i < this.m_targetMouseArray.length; i++)
         {
            stMoveIntruder = this.m_targetMouseArray[i];
            stMoveIntruder.m_ChageMouseYLocked = false;
            this.applySwallowDamage(stMoveIntruder);
         }
         this.m_targetMouseArray = [];
      }
      
      public function KillMoveIntruder() : void
      {
         var stMoveIntruder:a_4206 = null;
         var stTargetFieldGrid:a_3491 = this.getAdjacentTargetGrid();
         if(stTargetFieldGrid == null)
         {
            return;
         }
         var arrMoveIntruder:Array = stTargetFieldGrid.a_1511.slice();
         for each(stMoveIntruder in arrMoveIntruder)
         {
            if(!stMoveIntruder.m_ChageMouseYLocked)
            {
               if(GoldChaosDefence.isValidMoveIntruder(stMoveIntruder,null,3))
               {
                  this.applySwallowDamage(stMoveIntruder);
               }
            }
         }
      }
      
      public function a_4210() : void
      {
         var xIndex:int = 0;
         var stTempFieldGrid:a_3491 = null;
         var arrMoveIntruder:Array = null;
         var stMoveIntruder:a_4206 = null;
         var xStart:int = Math.max(a_1334.m_iXGridNo - 2,0);
         var xEnd:int = Math.min(a_1334.m_iXGridNo + 2,BattleFieldView.a_1011 - 1);
         var yStart:int = Math.max(a_1334.m_iYGridNo - 2,0);
         var yEnd:int = Math.min(a_1334.m_iYGridNo + 2,BattleFieldView.a_1012 - 1);
         for(var yIndex:int = yStart; yIndex <= yEnd; yIndex++)
         {
            for(xIndex = xStart; xIndex <= xEnd; xIndex++)
            {
               stTempFieldGrid = a_1334.m_stCurrentBattbleFieldView.a_3438(xIndex,yIndex);
               arrMoveIntruder = stTempFieldGrid.IntruderArray;
               for each(stMoveIntruder in arrMoveIntruder)
               {
                  stMoveIntruder.a_4210();
               }
            }
         }
      }
      
      public function ReleaseSpiceSkill() : void
      {
         var stMoveIntruder:a_4206 = null;
         var offsetX:Number = NaN;
         if(!a_1334)
         {
            return;
         }
         this.m_targetMouseArray = this.collectSpiceTargets();
         var stTargetFieldGrid:a_3491 = this.getAdjacentTargetGrid();
         if(stTargetFieldGrid == null)
         {
            return;
         }
         for each(stMoveIntruder in this.m_targetMouseArray)
         {
            stMoveIntruder.m_ChageMouseYLocked = true;
            if(stMoveIntruder.iSpaceState != 3)
            {
               offsetX = stTargetFieldGrid.m_iXGridNo * a_3491.a_1080 + 10 - stMoveIntruder.x;
               MouseScareHandler.getInstance().scareMouse(stMoveIntruder,offsetX,stTargetFieldGrid,this.scareCallbackHandler);
            }
         }
      }
      
      private function resetSkillState(frameIndex:int) : void
      {
         this.m_Skilling = false;
         a_1275 = frameIndex;
         gotoAndStop((a_1276[frameIndex] as FrameLabel).frame);
      }
      
      private function getAdjacentTargetGrid() : a_3491
      {
         if(a_1334 == null)
         {
            return null;
         }
         return a_1334.m_stCurrentBattbleFieldView.a_3438(Math.min(a_1334.m_iXGridNo + 1,BattleFieldView.a_1011 - 1),a_1334.m_iYGridNo);
      }
      
      private function collectSpiceTargets() : Array
      {
         var xIndex:int = 0;
         var tpFieldGrid:a_3491 = null;
         var stMoveIntruder:a_4206 = null;
         var airArr:Array = [];
         var normalArr:Array = [];
         var stTargetFieldGrid:a_3491 = this.getAdjacentTargetGrid();
         if(stTargetFieldGrid == null || a_1334 == null)
         {
            return airArr.concat(normalArr);
         }
         var xStart:int = Math.max(a_1334.m_iXGridNo - 2,0);
         var xEnd:int = Math.min(a_1334.m_iXGridNo + 4,BattleFieldView.a_1011 - 1);
         var yStart:int = Math.max(a_1334.m_iYGridNo - 3,0);
         var yEnd:int = Math.min(a_1334.m_iYGridNo + 3,BattleFieldView.a_1012 - 1);
         for(var yIndex:int = yStart; yIndex <= yEnd; yIndex++)
         {
            for(xIndex = xStart; xIndex <= xEnd; xIndex++)
            {
               tpFieldGrid = a_1334.m_stCurrentBattbleFieldView.a_3438(xIndex,yIndex);
               for each(stMoveIntruder in tpFieldGrid.a_1511)
               {
                  if(GoldChaosDefence.isValidMoveIntruder(stMoveIntruder,stTargetFieldGrid,3))
                  {
                     if(stMoveIntruder.iSpaceState == 3)
                     {
                        airArr.push(stMoveIntruder);
                     }
                     else
                     {
                        normalArr.push(stMoveIntruder);
                     }
                  }
               }
            }
         }
         airArr.sort(this.OnSortToken);
         normalArr.sort(this.OnSortToken);
         return airArr.concat(normalArr);
      }
      
      private function applySwallowDamage(stMoveIntruder:a_4206) : void
      {
         if(stMoveIntruder.m_stCurrentFieldGrid == null)
         {
            return;
         }
         if(stMoveIntruder.m_stMoveIntruderTypeID == 8389121 || stMoveIntruder.m_stMoveIntruderTypeID == 8389122 || stMoveIntruder.m_stMoveIntruderTypeID == 8389647 || stMoveIntruder.m_stMoveIntruderTypeID == 8389649 || stMoveIntruder.m_stMoveIntruderTypeID == 8389646 || stMoveIntruder.m_stMoveIntruderTypeID == 8389641)
         {
            stMoveIntruder.iDIYLife = 0;
            stMoveIntruder.a_3432();
         }
         else if(stMoveIntruder.iSpaceState == 3 || !stMoveIntruder.IsElite || stMoveIntruder.iLifeValue <= ELITE_SWALLOW_HURT)
         {
            stMoveIntruder.a_3969(stMoveIntruder.iLifeValue);
            stMoveIntruder.a_3432();
         }
         else
         {
            stMoveIntruder.a_3969(ELITE_SWALLOW_HURT);
         }
      }
      
      private function scareCallbackHandler(intruder:a_4206) : void
      {
         if(Boolean(intruder) && intruder.iLifeValue > 0)
         {
            intruder.a_4208(b_182.a_435,10);
         }
      }
      
      private function OnSortToken(a:a_4206, b:a_4206) : int
      {
         var aMouseY:Number = a.y + a.stDisplayBitmap.y + a.height / 2;
         var aMouseX:Number = a.x + a.stDisplayBitmap.x + a.width / 2;
         var bMouseY:Number = b.y + b.stDisplayBitmap.y + b.height / 2;
         var bMouseX:Number = b.x + b.stDisplayBitmap.x + b.width / 2;
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
      
      override protected function a_3955() : Number
      {
         return width + 60;
      }
      
      override protected function a_3956() : Number
      {
         return -40;
      }
   }
}

