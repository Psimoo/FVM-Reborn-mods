package com.aurora.ui.maogoutd.resource.defender.DragonYear.GoldChaos
{
   import a_4718.b_182;
   import a_4781.TimeoutManager;
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.Util.BitMapManager;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.defender.HorseYear.windrider.MouseScareHandler;
   import com.aurora.ui.maogoutd.resource.defender.a_3953;
   import flash.display.Bitmap;
   import flash.display.FrameLabel;
   import flash.geom.Point;
   
   public class GoldChaosSecondAttackFighter extends a_3953
   {
      
      private static var ms_arrMouseScareBitmapArray:Array = new Array();
      
      private var m_Range:int = 2;
      
      private var m_Xoffset:int = 1;
      
      private var m_Yoffset:int = 1;
      
      private var m_Skilling:Boolean;
      
      private var m_locked:Boolean;
      
      private var m_EateTimes:int;
      
      private var m_AirEateArr:Array = new Array();
      
      private var m_NormalChangeArr:Array = new Array();
      
      private var stTimeOutName:String;
      
      private var startPosition:Point;
      
      private var m_targetMouseArray:Array = new Array();
      
      private var gobackGrid:Array;
      
      public function GoldChaosSecondAttackFighter()
      {
         super();
         a_1312 = 20;
         a_1095 = GoldChaosDefence.DEFENSE_PRICE;
         a_1317 = 2;
         a_1310 = 10;
         a_1313 = true;
      }
      
      public static function a_3926() : a_3953
      {
         return PoolManager.getInstance().CheckOutOne(GoldChaosSecondAttackFighter) as GoldChaosSecondAttackFighter;
      }
      
      override protected function getBindMovie() : Class
      {
         return GoldChaosSecondAttackFighterMovie;
      }
      
      override public function a_1797(stFieldGrid:a_3491) : Boolean
      {
         super.a_1797(stFieldGrid);
         this.startPosition = new Point(stFieldGrid.m_iXGridNo * a_3491.a_1080 + 30,stFieldGrid.m_iYGridNo * a_3491.a_1081 + 30);
         this.stTimeOutName = a_3512().toString() + ">>" + m_iDefenseGlobalID + ">>";
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
         if(iCurrentTime % 2 == 0)
         {
            nextFrame();
            if(a_1273 == 17)
            {
               this.ReleaseSpiceSkill();
            }
            else if(a_1273 == 19 && this.m_targetMouseArray.length == 0)
            {
               if(a_1275 != 0)
               {
                  this.m_Skilling = false;
                  this.m_locked = false;
                  a_1275 = 0;
                  gotoAndStop((a_1276[0] as FrameLabel).frame);
               }
            }
            else if(a_1273 == 25)
            {
               this.KillMoveIntruder();
               this.UnlockMoveIntruder();
            }
            else if(a_1273 == 29)
            {
               if(a_1275 != 3)
               {
                  this.m_EateTimes = GoldChaosDefence.a_3965(a_1094);
                  a_1275 = 3;
                  gotoAndStop((a_1276[3] as FrameLabel).frame);
               }
            }
            else if(a_1273 == 49)
            {
               if(a_1275 != 0)
               {
                  a_1275 = 0;
                  gotoAndStop((a_1276[0] as FrameLabel).frame);
                  this.m_Skilling = false;
               }
            }
            else if(a_1273 == 60)
            {
               a_1334.m_stCurrentBattbleFieldView.AddToBattleView(this,BattleLayerDefine.EFFECTS_TOP_TYPE,a_1334);
               if(a_1336 != null)
               {
                  a_1336.visible = false;
               }
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
         if(m_bServerIssued)
         {
            this.UnlockMoveIntruder();
         }
         super.a_3940();
         return true;
      }
      
      override public function a_3954(iCurrentTime:int) : Boolean
      {
         if(a_1275 == 5)
         {
            return true;
         }
         if(a_1334 == null)
         {
            return false;
         }
         if(iCurrentTime > m_iPlaceTimeIntervals + a_1308 && !this.m_Skilling)
         {
            if(GoldChaosDefence.CanTriggerChangeYSkill(a_1334,-1,3,-3,3,2) && !this.m_Skilling)
            {
               this.m_Skilling = true;
               this.m_locked = true;
               a_1275 = 2;
               gotoAndStop((a_1276[1] as FrameLabel).frame);
            }
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
         return true;
      }
      
      public function UnlockMoveIntruder() : void
      {
         var stMoveIntruder:a_4206 = null;
         for(var i:int = 0; i < this.m_targetMouseArray.length; i++)
         {
            stMoveIntruder = this.m_targetMouseArray[i];
            if(stMoveIntruder.m_ChageMouseYLocked)
            {
               stMoveIntruder.m_ChageMouseYLocked = false;
            }
            if(stMoveIntruder.m_stCurrentFieldGrid != null)
            {
               if(stMoveIntruder.m_stMoveIntruderTypeID == 8389121 || stMoveIntruder.m_stMoveIntruderTypeID == 8389122)
               {
                  stMoveIntruder.iDIYLife = 0;
                  stMoveIntruder.a_3432();
               }
               else if(stMoveIntruder.iSpaceState == 3 || (!stMoveIntruder.IsElite || stMoveIntruder.iLifeValue <= 6000))
               {
                  stMoveIntruder.a_3969(stMoveIntruder.iLifeValue);
                  stMoveIntruder.a_3432();
               }
               else
               {
                  stMoveIntruder.a_3969(6000);
               }
            }
         }
         this.m_targetMouseArray = [];
      }
      
      public function KillMoveIntruder() : void
      {
         var stTargetFieldGrid:a_3491 = null;
         var arrMoveIntruder:Array = null;
         var stMoveIntruder:a_4206 = null;
         if(a_1334 != null)
         {
            stTargetFieldGrid = stFieldGrid.m_stCurrentBattbleFieldView.a_3438(Math.min(stFieldGrid.m_iXGridNo + 1,BattleFieldView.a_1011 - 1),stFieldGrid.m_iYGridNo);
            if(stTargetFieldGrid != null)
            {
               arrMoveIntruder = stTargetFieldGrid.IntruderArray;
               for each(stMoveIntruder in arrMoveIntruder)
               {
                  if(!stMoveIntruder.m_ChageMouseYLocked)
                  {
                     if(GoldChaosDefence.isValidMoveIntruder(stMoveIntruder,null,2))
                     {
                        if(stMoveIntruder.m_stMoveIntruderTypeID == 8389121 || stMoveIntruder.m_stMoveIntruderTypeID == 8389122)
                        {
                           stMoveIntruder.iDIYLife = 0;
                           stMoveIntruder.a_3432();
                        }
                        else if(stMoveIntruder.iSpaceState == 3 || (!stMoveIntruder.IsElite || stMoveIntruder.iLifeValue <= 6000))
                        {
                           stMoveIntruder.a_3969(stMoveIntruder.iLifeValue);
                           stMoveIntruder.a_3432();
                        }
                        else
                        {
                           stMoveIntruder.a_3969(6000);
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
         var stTempFieldGrid:a_3491 = null;
         var arrMoveIntruder:Array = null;
         var stMoveIntruder:a_4206 = null;
         var xStart:int = Math.max(a_1334.m_iXGridNo - this.m_Range,0);
         var xEnd:int = Math.min(a_1334.m_iXGridNo + this.m_Range,BattleFieldView.a_1011 - 1);
         var yStart:int = Math.max(a_1334.m_iYGridNo - this.m_Range,0);
         var yEnd:int = Math.min(a_1334.m_iYGridNo + this.m_Range,BattleFieldView.a_1012 - 1);
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
         var xIndex:int = 0;
         var tpFieldGrid:a_3491 = null;
         var stMoveIntruder:a_4206 = null;
         var offsetX:Number = NaN;
         if(!stFieldGrid)
         {
            return;
         }
         this.m_AirEateArr = [];
         this.m_NormalChangeArr = [];
         this.m_targetMouseArray = [];
         var returnMouse:Array = [];
         var xStart:int = Math.max(stFieldGrid.m_iXGridNo - this.m_Range + this.m_Xoffset,0);
         var xEnd:int = Math.min(stFieldGrid.m_iXGridNo + this.m_Range + this.m_Xoffset,BattleFieldView.a_1011 - 1);
         var yStart:int = Math.max(stFieldGrid.m_iYGridNo - this.m_Range - this.m_Yoffset,0);
         var yEnd:int = Math.min(stFieldGrid.m_iYGridNo + this.m_Range + this.m_Yoffset,BattleFieldView.a_1012 - 1);
         var stTargetFieldGrid:a_3491 = stFieldGrid.m_stCurrentBattbleFieldView.a_3438(Math.min(stFieldGrid.m_iXGridNo + 1,BattleFieldView.a_1011 - 1),stFieldGrid.m_iYGridNo);
         for(var yIndex:int = yStart; yIndex <= yEnd; yIndex++)
         {
            for(xIndex = xStart; xIndex <= xEnd; xIndex++)
            {
               tpFieldGrid = stFieldGrid.m_stCurrentBattbleFieldView.a_3438(xIndex,yIndex);
               for each(stMoveIntruder in tpFieldGrid.a_1511)
               {
                  if(GoldChaosDefence.isValidMoveIntruder(stMoveIntruder,stTargetFieldGrid,2))
                  {
                     if(stMoveIntruder.iSpaceState == 3)
                     {
                        this.m_AirEateArr.push(stMoveIntruder);
                     }
                     else
                     {
                        this.m_NormalChangeArr.push(stMoveIntruder);
                     }
                  }
               }
            }
         }
         this.m_AirEateArr.sort(this.OnSortToken);
         this.m_NormalChangeArr.sort(this.OnSortToken);
         returnMouse = returnMouse.concat(this.m_AirEateArr,this.m_NormalChangeArr);
         var index:int = 0;
         for(var i:int = 0; i < returnMouse.length; i++)
         {
            stMoveIntruder = returnMouse[i];
            stMoveIntruder.m_ChageMouseYLocked = true;
            this.m_targetMouseArray.push(stMoveIntruder);
            if(stMoveIntruder.iSpaceState != 3)
            {
               offsetX = stTargetFieldGrid.m_iXGridNo * a_3491.a_1080 + 10 - stMoveIntruder.x;
               MouseScareHandler.getInstance().scareMouse(stMoveIntruder,offsetX,stTargetFieldGrid,this.scareCallbackHandler);
               index++;
            }
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
      
      private function ChageMouseY(stMoveIntruder:a_4206, index:int) : Boolean
      {
         var stTargetFieldGrid:a_3491 = null;
         var arrBaseMoveIntruderVector:Array = null;
         var stScareBitmap:Bitmap = null;
         this.gobackGrid = [];
         stTargetFieldGrid = stFieldGrid.m_stCurrentBattbleFieldView.a_3438(Math.min(stFieldGrid.m_iXGridNo + 1,BattleFieldView.a_1011 - 1),stFieldGrid.m_iYGridNo);
         if(!stMoveIntruder.isFearCatHead && stMoveIntruder.m_stCurrentFieldGrid == null)
         {
            return false;
         }
         if(Boolean(stMoveIntruder) && stMoveIntruder.iLifeValue > 0)
         {
            arrBaseMoveIntruderVector = a_1334.m_stCurrentBattbleFieldView.m_arrBaseMoveIntruderVector;
            if(-1 == arrBaseMoveIntruderVector.indexOf(stMoveIntruder))
            {
               return false;
            }
            arrBaseMoveIntruderVector.splice(arrBaseMoveIntruderVector.indexOf(stMoveIntruder),1);
            a_1334.m_stCurrentBattbleFieldView.a_3457(stMoveIntruder);
            stMoveIntruder.m_stCurrentFieldGrid.a_3457(stMoveIntruder);
            this.gobackGrid = [stTargetFieldGrid.m_iYGridNo - stMoveIntruder.m_stCurrentFieldGrid.m_iYGridNo,stTargetFieldGrid.m_iXGridNo - stMoveIntruder.m_stCurrentFieldGrid.m_iXGridNo];
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
            TimeoutManager.getInstance().addTimeout(this.stTimeOutName + index.toString(),100,this.OnMouseScareTimeout,a_1334.m_stCurrentBattbleFieldView.a_3459,stMoveIntruder,stTargetFieldGrid,stScareBitmap,index);
         }
         return true;
      }
      
      private function OnMouseScareTimeout(stFunction:Function, stMoveIntruder:a_4206, stTempFieldGrid:a_3491, stMouseScareBitmap:Bitmap, index:*) : void
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
         TimeoutManager.getInstance().removeTimeout(this.stTimeOutName + index.toString());
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

