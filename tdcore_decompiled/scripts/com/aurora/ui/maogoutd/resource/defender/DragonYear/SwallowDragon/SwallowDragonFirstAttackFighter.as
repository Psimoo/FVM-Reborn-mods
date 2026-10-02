package com.aurora.ui.maogoutd.resource.defender.DragonYear.SwallowDragon
{
   import a_4718.b_182;
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.Util.BitMapManager;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.iface.IBossMoveIntruder;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.defender.a_3953;
   import flash.display.Bitmap;
   import flash.display.FrameLabel;
   import flash.utils.setTimeout;
   
   public class SwallowDragonFirstAttackFighter extends a_3953
   {
      
      private static var ms_arrMouseScareBitmapArray:Array = new Array();
      
      private var appearedTimes:int = 0;
      
      private var m_Range:int = 1;
      
      private var m_Xoffset:int = 1;
      
      private var m_Skilling:Boolean;
      
      private var m_locked:Boolean;
      
      private var m_EateTimes:int;
      
      private var gobackGrid:Array;
      
      public function SwallowDragonFirstAttackFighter()
      {
         super();
         a_1312 = 20;
         a_1095 = SwallowDragonDefence.DEFENSE_PRICE;
         a_1317 = 2;
         a_1310 = 10;
         a_1313 = true;
         a_1311 = SwallowDragonDefence.a_3965(a_1094);
         a_1309 = SwallowDragonDefence.a_3966(m_iSkillDegree);
      }
      
      public static function a_3926() : a_3953
      {
         return PoolManager.getInstance().CheckOutOne(SwallowDragonFirstAttackFighter) as SwallowDragonFirstAttackFighter;
      }
      
      override protected function getBindMovie() : Class
      {
         return SwallowDragonFirstAttackFighterMovie;
      }
      
      override public function a_1797(stFieldGrid:a_3491) : Boolean
      {
         super.a_1797(stFieldGrid);
         a_1311 = SwallowDragonDefence.a_3965(a_1094);
         a_1309 = SwallowDragonDefence.a_3966(m_iSkillDegree);
         this.appearedTimes = 0;
         this.m_Skilling = false;
         this.m_locked = false;
         a_1308 = 0;
         a_1339 = 50;
         a_1275 = 0;
         this.m_EateTimes = 0;
         return true;
      }
      
      override protected function a_3964() : int
      {
         return SwallowDragonDefence.a_3964(m_iSkillDegree);
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
         }
         else
         {
            super.a_3969(iRduceLifeValue);
         }
         return true;
      }
      
      override public function a_3957(iCurrentTime:int) : void
      {
         if(iCurrentTime % 2 == 0)
         {
            nextFrame();
            trace("m_iCurrentFrame::" + a_1273);
            if(a_1273 == 19)
            {
               this.ReleaseSpiceSkill();
            }
            else if(a_1273 == 27)
            {
               this.KillMoveIntruder();
            }
            else if(a_1273 == 34)
            {
               if(a_1275 != 3)
               {
                  this.UnlockMoveIntruder();
                  this.m_EateTimes = SwallowDragonDefence.a_3965(a_1094);
                  a_1275 = 3;
                  gotoAndStop((a_1276[3] as FrameLabel).frame);
               }
            }
            else if(a_1273 == 53)
            {
               if(a_1275 != 0)
               {
                  a_1275 = 0;
                  gotoAndStop((a_1276[0] as FrameLabel).frame);
                  this.m_Skilling = false;
               }
            }
            else if(a_1273 == 57)
            {
               this.a_4210();
            }
            else if(a_1273 == a_1274)
            {
               super.a_3969(a_1339);
               return;
            }
            if(a_1278 != null)
            {
               gotoAndStop((a_1276[a_1275] as FrameLabel).frame);
            }
            if(a_1336)
            {
               a_1336.a_3957(iCurrentTime);
            }
            if(m_stFrozenCardEffect)
            {
               m_stFrozenCardEffect.a_3957(iCurrentTime);
            }
            if(m_stShiHuaEffect)
            {
               m_stShiHuaEffect.a_3957(iCurrentTime);
            }
         }
      }
      
      override public function a_3940() : Boolean
      {
         this.UnlockMoveIntruder();
         super.a_3940();
         return true;
      }
      
      override public function a_3954(iCurrentTime:int) : Boolean
      {
         if(a_1334 == null)
         {
            return false;
         }
         if(this.m_EateTimes > 0)
         {
            --this.m_EateTimes;
            if(this.m_EateTimes == 0)
            {
               if(a_1275 != 4)
               {
                  a_1275 = 4;
                  gotoAndStop((a_1276[4] as FrameLabel).frame);
               }
            }
         }
         if(iCurrentTime > m_iPlaceTimeIntervals + a_1308 && !this.m_Skilling)
         {
            if(SwallowDragonDefence.CanTriggerChangeYSkill(a_1334,this.m_Range,this.m_Xoffset) && !this.m_Skilling)
            {
               this.m_Skilling = true;
               this.m_locked = true;
               a_1275 = 2;
               gotoAndStop((a_1276[1] as FrameLabel).frame);
            }
         }
         return true;
      }
      
      public function UnlockMoveIntruder() : void
      {
         var stTargetFieldGrid:a_3491 = null;
         var arrMoveIntruder:Array = null;
         var stMoveIntruder:a_4206 = null;
         if(a_1334 != null && this.m_locked)
         {
            this.m_locked = false;
            stTargetFieldGrid = a_1334.m_stCurrentBattbleFieldView.a_3438(a_1334.m_iXGridNo + 1,a_1334.m_iYGridNo);
            if(stTargetFieldGrid == null)
            {
               stTargetFieldGrid = stFieldGrid.m_stCurrentBattbleFieldView.a_3438(stFieldGrid.m_iXGridNo,stFieldGrid.m_iYGridNo);
            }
            if(stTargetFieldGrid != null)
            {
               arrMoveIntruder = stTargetFieldGrid.a_1511.slice();
               for each(stMoveIntruder in arrMoveIntruder)
               {
                  if(0 == stMoveIntruder.iSpaceState && !(stMoveIntruder as IBossMoveIntruder))
                  {
                     if(!(SwallowDragonDefence.m_MouseArr.indexOf(stMoveIntruder.m_stMoveIntruderTypeID) != -1 || stMoveIntruder.isCannotSeeByInsurance || stMoveIntruder.isGoHeadNotEatDefense || stMoveIntruder.tagCom.HasTag(401)))
                     {
                        if(stMoveIntruder.m_ChageMouseYLocked)
                        {
                           stMoveIntruder.m_ChageMouseYLocked = false;
                        }
                     }
                  }
               }
            }
         }
      }
      
      public function KillMoveIntruder() : void
      {
         var stTargetFieldGrid:a_3491 = null;
         var arrMoveIntruder:Array = null;
         var stMoveIntruder:a_4206 = null;
         if(a_1334 != null)
         {
            stTargetFieldGrid = a_1334.m_stCurrentBattbleFieldView.a_3438(a_1334.m_iXGridNo + 1,a_1334.m_iYGridNo);
            if(stTargetFieldGrid == null)
            {
               stTargetFieldGrid = stFieldGrid.m_stCurrentBattbleFieldView.a_3438(stFieldGrid.m_iXGridNo,stFieldGrid.m_iYGridNo);
            }
            if(stTargetFieldGrid != null)
            {
               arrMoveIntruder = stTargetFieldGrid.a_1511.slice();
               for each(stMoveIntruder in arrMoveIntruder)
               {
                  if(0 == stMoveIntruder.iSpaceState && !(stMoveIntruder as IBossMoveIntruder))
                  {
                     if(!(SwallowDragonDefence.m_MouseArr.indexOf(stMoveIntruder.m_stMoveIntruderTypeID) != -1 || stMoveIntruder.isCannotSeeByInsurance || stMoveIntruder.isGoHeadNotEatDefense || stMoveIntruder.tagCom.HasTag(401)))
                     {
                        if(stMoveIntruder.IsElite && stMoveIntruder.iLifeValue > 3000)
                        {
                           stMoveIntruder.a_3969(3000);
                        }
                        else
                        {
                           stMoveIntruder.a_3432();
                        }
                     }
                  }
               }
            }
         }
      }
      
      public function a_4210() : void
      {
         var xIndex:int = 0;
         var stTargetFieldGrid:a_3491 = null;
         var arrMoveIntruder:Array = null;
         var stMoveIntruder:a_4206 = null;
         var xStart:int = Math.max(a_1334.m_iXGridNo - 1,0);
         var xEnd:int = Math.min(a_1334.m_iXGridNo + 1,BattleFieldView.a_1011 - 1);
         var yStart:int = Math.max(a_1334.m_iYGridNo - 1,0);
         var yEnd:int = Math.min(a_1334.m_iYGridNo + 1,BattleFieldView.a_1012 - 1);
         for(var yIndex:int = yStart; yIndex <= yEnd; yIndex++)
         {
            for(xIndex = xStart; xIndex <= xEnd; xIndex++)
            {
               stTargetFieldGrid = a_1334.m_stCurrentBattbleFieldView.a_3438(xIndex,yIndex);
               arrMoveIntruder = stTargetFieldGrid.a_1511.slice();
               for each(stMoveIntruder in arrMoveIntruder)
               {
                  stMoveIntruder.a_4210();
               }
            }
         }
      }
      
      public function ReleaseSpiceSkill() : void
      {
         var xStart:int = 0;
         var xEnd:int = 0;
         var yStart:int = 0;
         var yEnd:int = 0;
         var yIndex:int = 0;
         var xIndex:int = 0;
         var tpFieldGrid:a_3491 = null;
         var arrMoveIntruder:Array = null;
         var stMoveIntruder:a_4206 = null;
         var stTargetFieldGrid:a_3491 = null;
         if(stFieldGrid)
         {
            xStart = Math.max(stFieldGrid.m_iXGridNo + this.m_Xoffset - this.m_Range,0);
            xEnd = Math.min(stFieldGrid.m_iXGridNo + this.m_Xoffset + this.m_Range,BattleFieldView.a_1011 - 1);
            yStart = Math.max(stFieldGrid.m_iYGridNo - this.m_Range,0);
            yEnd = Math.min(stFieldGrid.m_iYGridNo + this.m_Range,BattleFieldView.a_1012 - 1);
            for(yIndex = yStart; yIndex <= yEnd; yIndex++)
            {
               for(xIndex = xStart; xIndex <= xEnd; xIndex++)
               {
                  tpFieldGrid = stFieldGrid.m_stCurrentBattbleFieldView.a_3438(xIndex,yIndex);
                  arrMoveIntruder = tpFieldGrid.a_1511.slice();
                  for each(stMoveIntruder in arrMoveIntruder)
                  {
                     stTargetFieldGrid = stFieldGrid.m_stCurrentBattbleFieldView.a_3438(stFieldGrid.m_iXGridNo + 1,stFieldGrid.m_iYGridNo);
                     if(stTargetFieldGrid == null)
                     {
                        stTargetFieldGrid = stFieldGrid.m_stCurrentBattbleFieldView.a_3438(stFieldGrid.m_iXGridNo,stFieldGrid.m_iYGridNo);
                     }
                     if(stTargetFieldGrid != null && stMoveIntruder.isFearCatHead && 0 == stMoveIntruder.iSpaceState && !(stMoveIntruder as IBossMoveIntruder))
                     {
                        if(!(SwallowDragonDefence.m_MouseArr.indexOf(stMoveIntruder.m_stMoveIntruderTypeID) != -1 || stMoveIntruder.isCannotSeeByInsurance || stMoveIntruder.isGoHeadNotEatDefense || stMoveIntruder.tagCom.HasTag(401)))
                        {
                           if(stMoveIntruder.m_stCurrentFieldGrid.m_isNeedTray == stTargetFieldGrid.m_isNeedTray)
                           {
                              this.ChageMouseY(stMoveIntruder);
                           }
                        }
                     }
                  }
               }
            }
         }
      }
      
      private function ChageMouseY(stMoveIntruder:a_4206) : Boolean
      {
         var stTargetFieldGrid:a_3491 = null;
         var arrBaseMoveIntruderVector:Array = null;
         var stScareBitmap:Bitmap = null;
         this.gobackGrid = [];
         if(!stMoveIntruder.isFearCatHead && stMoveIntruder.m_stCurrentFieldGrid == null)
         {
            return false;
         }
         if(Boolean(stMoveIntruder) && stMoveIntruder.iLifeValue > 0)
         {
            stTargetFieldGrid = a_1334.m_stCurrentBattbleFieldView.a_3438(a_1334.m_iXGridNo + 1,a_1334.m_iYGridNo);
            if(stTargetFieldGrid == null)
            {
               stTargetFieldGrid = a_1334.m_stCurrentBattbleFieldView.a_3438(a_1334.m_iXGridNo,a_1334.m_iYGridNo);
            }
            arrBaseMoveIntruderVector = a_1334.m_stCurrentBattbleFieldView.m_arrBaseMoveIntruderVector;
            if(-1 == arrBaseMoveIntruderVector.indexOf(stMoveIntruder))
            {
               return false;
            }
            arrBaseMoveIntruderVector.splice(arrBaseMoveIntruderVector.indexOf(stMoveIntruder),1);
            a_1334.m_stCurrentBattbleFieldView.a_3457(stMoveIntruder);
            stMoveIntruder.m_stCurrentFieldGrid.a_3457(stMoveIntruder);
            this.gobackGrid = [stTargetFieldGrid.m_iYGridNo - stMoveIntruder.m_stCurrentFieldGrid.m_iYGridNo,stTargetFieldGrid.m_iXGridNo - a_1334.m_iXGridNo];
            stScareBitmap = ms_arrMouseScareBitmapArray.pop();
            if(null == stScareBitmap)
            {
               stScareBitmap = new Bitmap();
               stScareBitmap.bitmapData = BitMapManager.getInstance().GetMouseScareBitmapData();
            }
            stScareBitmap.visible = true;
            stScareBitmap.x = stMoveIntruder.x + stMoveIntruder.stDisplayBitmap.x;
            stScareBitmap.y = stMoveIntruder.y + stMoveIntruder.stDisplayBitmap.y;
            stMoveIntruder.parent.addChildAt(stScareBitmap,stMoveIntruder.parent.getChildIndex(stMoveIntruder) + 1);
            BattleFieldView.a_1021.play();
            setTimeout(this.OnMouseScareTimeout,100,a_1334.m_stCurrentBattbleFieldView.a_3459,stMoveIntruder,stTargetFieldGrid,stScareBitmap);
         }
         return true;
      }
      
      private function OnMouseScareTimeout(stFunction:Function, stMoveIntruder:a_4206, stTempFieldGrid:a_3491, stMouseScareBitmap:Bitmap) : void
      {
         stMoveIntruder.y += this.gobackGrid[0] * a_3491.a_1081;
         var goHead:int = this.gobackGrid[1] == 0 ? 1 : 0;
         stMoveIntruder.x = !stMoveIntruder.IsReversed() ? (stTempFieldGrid.m_iXGridNo + goHead) * a_3491.a_1080 + 10 : BattleFieldView.a_1013 - ((stTempFieldGrid.m_iXGridNo + goHead) * a_3491.a_1080 + 10);
         stFunction(stMoveIntruder,stTempFieldGrid,false);
         if(Boolean(stMoveIntruder) && stMoveIntruder.iLifeValue > 0)
         {
            stMoveIntruder.a_4208(b_182.a_435,10);
         }
         if(Boolean(stMouseScareBitmap.parent) && stMouseScareBitmap.parent.contains(stMouseScareBitmap))
         {
            stMouseScareBitmap.parent.removeChild(stMouseScareBitmap);
         }
         stMouseScareBitmap.visible = false;
         if(-1 == ms_arrMouseScareBitmapArray.indexOf(stMouseScareBitmap))
         {
            ms_arrMouseScareBitmapArray.push(stMouseScareBitmap);
         }
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

