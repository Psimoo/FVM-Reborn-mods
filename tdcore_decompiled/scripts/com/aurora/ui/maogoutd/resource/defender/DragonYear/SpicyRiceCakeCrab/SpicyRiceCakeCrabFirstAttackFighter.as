package com.aurora.ui.maogoutd.resource.defender.DragonYear.SpicyRiceCakeCrab
{
   import a_4718.b_182;
   import a_4781.TimeoutManager;
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.Util.BitMapManager;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.iface.IBossMoveIntruder;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.defender.a_3953;
   import com.aurora.ui.maogoutd.resource.effect.a_4108;
   import flash.display.Bitmap;
   import flash.display.FrameLabel;
   import flash.geom.Point;
   
   public class SpicyRiceCakeCrabFirstAttackFighter extends a_3953
   {
      
      private static var ms_arrMouseScareBitmapArray:Array = new Array();
      
      private var m_Range:int = 1;
      
      private var m_Skilling:Boolean;
      
      private var startPosition:Point;
      
      private var m_EateTimes:int;
      
      private var m_ShotFrame:int;
      
      private var stTargetFieldGrid:a_3491;
      
      private var stTimeOutName:String;
      
      private var m_MarkBuffEffect:a_4108;
      
      private var m_iEatSpecial:Boolean;
      
      private var m_bShotAddBuff:Boolean = false;
      
      private var m_targetMouseArray:Array = new Array();
      
      private var gobackGrid:Array;
      
      public function SpicyRiceCakeCrabFirstAttackFighter()
      {
         super();
         a_1095 = SpicyRiceCakeCrabDefence.DEFENSE_PRICE;
         a_1317 = 2;
         a_1310 = 10;
         a_1313 = true;
         a_1337 = -7;
      }
      
      public static function a_3926() : a_3953
      {
         return PoolManager.getInstance().CheckOutOne(SpicyRiceCakeCrabFirstAttackFighter) as SpicyRiceCakeCrabFirstAttackFighter;
      }
      
      override protected function getBindMovie() : Class
      {
         return SpicyRiceCakeCrabFirstAttackFighterMovie;
      }
      
      override public function a_1797(stFieldGrid:a_3491) : Boolean
      {
         super.a_1797(stFieldGrid);
         this.startPosition = new Point(stFieldGrid.m_iXGridNo * a_3491.a_1080 + 30,stFieldGrid.m_iYGridNo * a_3491.a_1081 + 30);
         this.stTargetFieldGrid = stFieldGrid.m_stCurrentBattbleFieldView.a_3438(Math.min(stFieldGrid.m_iXGridNo + 1,BattleFieldView.a_1011 - 1),stFieldGrid.m_iYGridNo);
         this.stTimeOutName = a_3512().toString() + ">>" + m_iDefenseGlobalID + ">>";
         this.m_Skilling = false;
         a_1308 = 0;
         a_1339 = 50;
         a_1275 = 0;
         this.m_EateTimes = 0;
         this.m_ShotFrame = 0;
         this.m_iEatSpecial = false;
         this.m_bShotAddBuff = false;
         if(a_1336)
         {
            a_1336.x += 7;
         }
         return true;
      }
      
      override protected function a_3964() : int
      {
         return SpicyRiceCakeCrabDefence.a_3964(m_iSkillDegree);
      }
      
      override public function a_3969(iRduceLifeValue:int) : Boolean
      {
         super.a_3969(iRduceLifeValue);
         return true;
      }
      
      override public function a_3957(iCurrentTime:int) : void
      {
         if(iCurrentTime % 2 == 0)
         {
            if(a_1278 == null)
            {
               a_1278 = "待机";
            }
            super.a_3957(iCurrentTime);
         }
      }
      
      override public function a_3940() : Boolean
      {
         while(this.m_targetMouseArray.length > 0)
         {
            this.m_targetMouseArray.pop();
         }
         if(this.m_MarkBuffEffect)
         {
            if(a_1334.m_stCurrentBattbleFieldView.GetGameMoveMap())
            {
               a_1334.m_stCurrentBattbleFieldView.GetGameMoveMap().RemoveMoveDisplayObject(this.m_MarkBuffEffect);
            }
            this.m_MarkBuffEffect.a_3940();
            this.m_MarkBuffEffect = null;
         }
         super.a_3940();
         return true;
      }
      
      override public function a_3954(iCurrentTime:int) : Boolean
      {
         if(this.m_MarkBuffEffect)
         {
            this.m_MarkBuffEffect.visible = this.m_iEatSpecial;
         }
         if(iCurrentTime > m_iPlaceTimeIntervals + a_1308 && !this.m_Skilling)
         {
            if(this.CanTriggerChangeYSkill(a_1334,this.m_Range) <= 0)
            {
               return false;
            }
            this.m_Skilling = true;
            a_1275 = this.m_ShotFrame;
            gotoAndStop((a_1276[1] as FrameLabel).frame);
         }
         if(this.m_EateTimes > 0)
         {
            --this.m_EateTimes;
            if(this.m_EateTimes == 0)
            {
               ++a_1275;
               gotoAndStop((a_1276[a_1275] as FrameLabel).frame);
            }
         }
         if(this.m_Skilling && iCurrentTime % 2 == 0)
         {
            if(a_1273 == 24)
            {
               this.KillMoveIntruder();
            }
            else if(a_1273 == 27)
            {
               if(this.m_bShotAddBuff == true)
               {
                  this.m_iEatSpecial = true;
                  m_iDefenseStateType = 1;
                  this.AddMarkBuffEffect();
               }
               this.m_EateTimes = SpicyRiceCakeCrabDefence.a_3965(a_1094);
            }
            else if(a_1273 == 55 || a_1273 == 83)
            {
               if(a_1275 != 0)
               {
                  a_1275 = 0;
                  gotoAndStop((a_1276[0] as FrameLabel).frame);
                  this.m_Skilling = false;
               }
            }
         }
         return true;
      }
      
      private function CanTriggerChangeYSkill(stFieldGrid:a_3491, m_Range:int) : int
      {
         var stMoveIntruder:a_4206 = null;
         var tpFieldGrid:a_3491 = null;
         var arrMoveIntruder:Array = null;
         var xStart:int = 0;
         var xEnd:int = 0;
         var yStart:int = 0;
         var yEnd:int = 0;
         var j:int = 0;
         var yIndex:int = 0;
         var xIndex:int = 0;
         while(this.m_targetMouseArray.length > 0)
         {
            this.m_targetMouseArray.pop();
         }
         var bubbleMouse:Array = new Array();
         var priorityMouse:Array = new Array();
         var normalMouse:Array = new Array();
         var returnMouse:Array = new Array();
         if(stFieldGrid != null)
         {
            xStart = Math.max(stFieldGrid.m_iXGridNo,0);
            xEnd = Math.min(stFieldGrid.m_iXGridNo + 2,BattleFieldView.a_1011 - 1);
            yStart = Math.max(stFieldGrid.m_iYGridNo - m_Range,0);
            yEnd = Math.min(stFieldGrid.m_iYGridNo + m_Range,BattleFieldView.a_1012 - 1);
            for(j = 0; j <= BattleFieldView.a_1011 - 1; j++)
            {
               tpFieldGrid = stFieldGrid.m_stCurrentBattbleFieldView.a_3438(j,stFieldGrid.m_iYGridNo);
               arrMoveIntruder = tpFieldGrid.a_1511.slice();
               for each(stMoveIntruder in arrMoveIntruder)
               {
                  if(stMoveIntruder.m_stMoveIntruderTypeID == 134235538 && stMoveIntruder.visible)
                  {
                     bubbleMouse.push(stMoveIntruder);
                  }
                  else if(this.stTargetFieldGrid != null && !stMoveIntruder.m_ChageMouseYLocked && 3 == stMoveIntruder.iSpaceState && !(stMoveIntruder as IBossMoveIntruder))
                  {
                     if(stMoveIntruder.m_stCurrentFieldGrid.m_isNeedTray == this.stTargetFieldGrid.m_isNeedTray)
                     {
                        if(stMoveIntruder.m_stMoveIntruderTypeID == 8389008 && stMoveIntruder.visible)
                        {
                           priorityMouse.push(stMoveIntruder);
                        }
                     }
                  }
               }
            }
            for(yIndex = yStart; yIndex <= yEnd; yIndex++)
            {
               for(xIndex = xStart; xIndex <= xEnd; xIndex++)
               {
                  tpFieldGrid = stFieldGrid.m_stCurrentBattbleFieldView.a_3438(xIndex,yIndex);
                  arrMoveIntruder = tpFieldGrid.a_1511.slice();
                  for each(stMoveIntruder in arrMoveIntruder)
                  {
                     if(stMoveIntruder.m_stMoveIntruderTypeID != 134235538)
                     {
                        if(this.stTargetFieldGrid != null && !stMoveIntruder.m_ChageMouseYLocked && 3 == stMoveIntruder.iSpaceState && !(stMoveIntruder as IBossMoveIntruder))
                        {
                           if(stMoveIntruder.m_stCurrentFieldGrid.m_isNeedTray == this.stTargetFieldGrid.m_isNeedTray)
                           {
                              if((stMoveIntruder.m_stMoveIntruderTypeID == 134224481 || stMoveIntruder.m_stMoveIntruderTypeID == 134224482 || stMoveIntruder.m_stMoveIntruderTypeID == 8389647) && stMoveIntruder.visible)
                              {
                                 normalMouse.push(stMoveIntruder);
                              }
                              if(stMoveIntruder.m_stMoveIntruderTypeID != 8389008 && stMoveIntruder.isFearCatHead && !stMoveIntruder.m_IsAirElite && !stMoveIntruder.isCannotSeeByInsurance && stMoveIntruder.visible)
                              {
                                 normalMouse.push(stMoveIntruder);
                              }
                           }
                        }
                     }
                  }
               }
            }
            priorityMouse.sort(this.OnSortToken);
            normalMouse.sort(this.OnSortToken);
         }
         if(bubbleMouse.length > 0)
         {
            this.m_bShotAddBuff = true;
            this.m_ShotFrame = 3;
         }
         else if(priorityMouse.length > 0)
         {
            this.m_bShotAddBuff = true;
            this.m_ShotFrame = 6;
         }
         else
         {
            this.m_bShotAddBuff = false;
            this.m_ShotFrame = 3;
         }
         returnMouse = returnMouse.concat(bubbleMouse).concat(priorityMouse).concat(normalMouse);
         var i:int = 0;
         var iCnt:int = 0;
         while(i < returnMouse.length && iCnt < 4)
         {
            stMoveIntruder = returnMouse[i];
            stMoveIntruder.m_ChageMouseYLocked = true;
            this.m_targetMouseArray.push(stMoveIntruder);
            iCnt++;
            i++;
         }
         return this.m_targetMouseArray.length;
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
      
      public function UnlockMoveIntruder() : void
      {
         var stMoveIntruder:a_4206 = null;
         for(var i:int = 0; i < this.m_targetMouseArray.length; i++)
         {
            stMoveIntruder = this.m_targetMouseArray[i];
            if(stMoveIntruder.iLifeValue > 0 && stMoveIntruder.m_ChageMouseYLocked)
            {
               stMoveIntruder.m_ChageMouseYLocked = false;
            }
            TimeoutManager.getInstance().removeTimeout(this.stTimeOutName + i.toString());
         }
      }
      
      private function AddMarkBuffEffect() : void
      {
         if(Boolean(a_1334) && this.m_MarkBuffEffect == null)
         {
            this.m_MarkBuffEffect = MarkBuffEffect.a_3926();
            this.m_MarkBuffEffect.a_1797(false);
            this.m_MarkBuffEffect.x = (a_1334.m_iXGridNo + 0.5) * a_3491.a_1080;
            this.m_MarkBuffEffect.y = (a_1334.m_iYGridNo + 1) * a_3491.a_1081;
            a_1334.m_stCurrentBattbleFieldView.AddToBattleView(this.m_MarkBuffEffect,BattleLayerDefine.EFFECTS_BASE_TYPE,a_1334);
            if(a_1334.m_stCurrentBattbleFieldView.GetGameMoveMap())
            {
               a_1334.m_stCurrentBattbleFieldView.GetGameMoveMap().AddMoveDisplayObject(this.m_MarkBuffEffect,a_1334.m_iXGridNo,a_1334.m_iYGridNo);
            }
            this.m_MarkBuffEffect.play();
         }
      }
      
      private function AddCrabBoomEffect() : void
      {
         var m_CrabBoomEffect:a_4108 = null;
         if(Boolean(a_1334) && m_CrabBoomEffect == null)
         {
            m_CrabBoomEffect = CrabBoomEffect.a_3926();
            m_CrabBoomEffect.a_1797(false);
            CrabBoomEffect(m_CrabBoomEffect).stOriginalFieldGrid = a_1334;
            m_CrabBoomEffect.x = (a_1334.m_iXGridNo + 0.5) * a_3491.a_1080;
            m_CrabBoomEffect.y = (a_1334.m_iYGridNo + 1) * a_3491.a_1081;
            a_1334.m_stCurrentBattbleFieldView.AddToBattleView(m_CrabBoomEffect,BattleLayerDefine.EFFECTS_TOP_TYPE,a_1334);
            stFieldGrid.m_stCurrentBattbleFieldView.m_arrEffectArray.push(this);
            if(a_1334.m_stCurrentBattbleFieldView.GetGameMoveMap())
            {
               a_1334.m_stCurrentBattbleFieldView.GetGameMoveMap().AddMoveDisplayObject(m_CrabBoomEffect,a_1334.m_iXGridNo,a_1334.m_iYGridNo);
            }
            m_CrabBoomEffect.play();
         }
      }
      
      override public function SpecialSkillCallBack(... args) : void
      {
         this.AddCrabBoomEffect();
         this.a_3969(this.iLifeValue);
      }
      
      public function KillMoveIntruder() : void
      {
         var stMoveIntruder:a_4206 = null;
         for(var i:int = 0; i < this.m_targetMouseArray.length; i++)
         {
            stMoveIntruder = this.m_targetMouseArray[i];
            stMoveIntruder.iDIYLife = 0;
            stMoveIntruder.a_3432();
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
         for(var i:int = 0; i < this.m_targetMouseArray.length; i++)
         {
            this.ChageMouseY(this.m_targetMouseArray[i],i);
         }
      }
      
      private function ChageMouseY(stMoveIntruder:a_4206, index:int) : Boolean
      {
         var arrBaseMoveIntruderVector:Array = null;
         var stScareBitmap:Bitmap = null;
         this.gobackGrid = [];
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
            this.gobackGrid = [this.stTargetFieldGrid.m_iYGridNo - stMoveIntruder.m_stCurrentFieldGrid.m_iYGridNo,this.stTargetFieldGrid.m_iXGridNo - a_1334.m_iXGridNo];
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
            TimeoutManager.getInstance().addTimeout(this.stTimeOutName + index.toString(),100,this.OnMouseScareTimeout,a_1334.m_stCurrentBattbleFieldView.a_3459,stMoveIntruder,this.stTargetFieldGrid,stScareBitmap);
         }
         return true;
      }
      
      private function OnMouseScareTimeout(stFunction:Function, stMoveIntruder:a_4206, stTempFieldGrid:a_3491, stMouseScareBitmap:Bitmap) : void
      {
         stMoveIntruder.x = !stMoveIntruder.IsReversed() ? (stTempFieldGrid.m_iXGridNo + 0.5) * a_3491.a_1080 : BattleFieldView.a_1013 - (stTempFieldGrid.m_iXGridNo + 0.5) * a_3491.a_1080;
         stFunction(stMoveIntruder,stTempFieldGrid,false);
         if(stMoveIntruder.m_stMoveIntruderTypeID == 8389008)
         {
            stMoveIntruder.y = (stTempFieldGrid.m_iYGridNo + 0.5) * a_3491.a_1081;
         }
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

