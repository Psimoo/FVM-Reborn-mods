package com.aurora.ui.maogoutd.resource.defender.SnakeYear.rainbowSnake
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.defender.a_3975;
   import com.aurora.ui.maogoutd.resource.shot.a_4348;
   import flash.display.FrameLabel;
   
   public class RainbowSnakeFirstTransProtector extends a_3975
   {
      
      private var a_1398:RainbowSnakeFirstTransProtectorBackside;
      
      private var m_TatalLifeValue:int;
      
      private var a_1310:int;
      
      private var a_1309:int;
      
      private var a_1311:int;
      
      private var a_1307:int;
      
      private var a_1321:int;
      
      private var a_1323:int;
      
      private var a_1317:int = 4;
      
      protected var a_1324:Array = [];
      
      private var m_iShotSkill:Boolean;
      
      private var m_iRange:int = 1;
      
      private var m_iBoomDie:Boolean;
      
      private var m_isPlaced:Boolean = false;
      
      public function RainbowSnakeFirstTransProtector()
      {
         super();
         a_1095 = RainbowSnakeDefine.DEFENSE_PRICE;
         a_1338 = 4;
         this.a_1310 = 8;
         a_1279 = -4;
      }
      
      public static function a_3926() : a_3975
      {
         return PoolManager.getInstance().CheckOutOne(RainbowSnakeFirstTransProtector) as RainbowSnakeFirstTransProtector;
      }
      
      override protected function getBindMovie() : Class
      {
         return RainbowSnakeFirstTransProtectorMovie;
      }
      
      override public function a_1797(stFieldGrid:a_3491) : Boolean
      {
         super.a_1797(stFieldGrid);
         this.m_TatalLifeValue = a_1339 = RainbowSnakeDefine.GetLifeValueByStarDegree(a_1094);
         this.a_1311 = RainbowSnakeDefine.a_3965(a_1094);
         this.a_1309 = RainbowSnakeDefine.a_3966(m_iSkillDegree);
         this.a_1321 = 0;
         this.m_iShotSkill = false;
         this.m_iBoomDie = false;
         if(a_1336)
         {
            a_1336.x += 2;
         }
         this.m_isPlaced = false;
         return true;
      }
      
      override public function set m_isShowFrozen(value:Boolean) : void
      {
         if(this.a_1398 != null)
         {
            this.a_1398.visible = !value;
         }
         super.m_isShowFrozen = value;
      }
      
      override public function set m_isShihua(value:Boolean) : void
      {
         if(this.a_1398 != null)
         {
            this.a_1398.visible = !value;
         }
         super.m_isShihua = value;
      }
      
      override protected function a_3964() : int
      {
         return RainbowSnakeDefine.a_3964(m_iSkillDegree);
      }
      
      override public function a_3969(iRduceLifeValue:int) : Boolean
      {
         if(iRduceLifeValue > 0)
         {
            if(Boolean(a_1334) && m_iDieType == 1)
            {
               this.calcMouseBiteBackDamage(iRduceLifeValue);
            }
            if(a_1339 - iRduceLifeValue <= 0 && m_iDieType == 1)
            {
               if(a_1275 != 4)
               {
                  this.m_iBoomDie = true;
                  a_1275 = 4;
                  this.gotoAndStop((a_1276[a_1275] as FrameLabel).frame);
               }
            }
            else
            {
               super.a_3969(iRduceLifeValue);
               if(0 != iRduceLifeValue && Boolean(stFieldGrid))
               {
                  this.ResetMovieStatus();
               }
            }
         }
         return true;
      }
      
      public function get IsInjured() : Boolean
      {
         return Boolean(a_1339 / this.m_TatalLifeValue <= 0.3);
      }
      
      protected function ResetMovieStatus() : Boolean
      {
         var targetFrame:int = 0;
         if(this.m_iBoomDie)
         {
            return false;
         }
         var lifeRatio:Number = a_1339 / this.m_TatalLifeValue;
         var targetFrameIndex:int = -1;
         if(lifeRatio > 0.3)
         {
            targetFrameIndex = this.m_iShotSkill ? 2 : 0;
         }
         else if(lifeRatio > 0)
         {
            targetFrameIndex = this.m_iShotSkill ? 3 : 1;
         }
         if(a_1275 != targetFrameIndex && targetFrameIndex >= 0)
         {
            a_1275 = targetFrameIndex;
            targetFrame = (a_1276[a_1275] as FrameLabel).frame;
            this.gotoAndStop(targetFrame);
            if(this.a_1398 != null)
            {
               this.a_1398.gotoAndStop(targetFrame);
            }
         }
         return true;
      }
      
      override public function a_3957(iCurrentTime:int) : void
      {
         if(iCurrentTime % 2 == 0)
         {
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
         if(!this.m_isPlaced)
         {
            this.addProtectBackSideEffect();
         }
         if(this.a_1398)
         {
            this.a_1398.nextFrame();
         }
         nextFrame();
         if(a_1273 == 41 || a_1273 == 54)
         {
            this.m_iShotSkill = false;
            this.ResetMovieStatus();
         }
         else if(a_1273 == 66)
         {
            if(a_1336)
            {
               a_1336.visible = false;
            }
            if(this.a_1398)
            {
               this.a_1398.visible = false;
            }
            this.a_4210();
         }
         else if(a_1273 == a_1274)
         {
            super.a_3969(a_1339);
         }
         else if(a_1278 != null)
         {
            this.gotoAndStop((a_1276[a_1275] as FrameLabel).frame);
            this.a_1398.gotoAndStop((a_1276[a_1275] as FrameLabel).frame);
         }
         if(!this.m_iBoomDie)
         {
            this.a_3954(iCurrentTime);
         }
      }
      
      public function a_3954(iCurrentTime:int) : Boolean
      {
         var stLastWaitShot:a_4348 = null;
         var numShotXpos:Number = NaN;
         var i:int = 0;
         if(iCurrentTime >= this.a_1321 + this.a_1309)
         {
            if(this.IsExistIntruder(stFieldGrid) <= 0)
            {
               return true;
            }
            while(this.a_1324.length > 0)
            {
               stLastWaitShot = this.a_1324.pop();
               stLastWaitShot.a_4350();
            }
            for(i = 0; i < 1; i++)
            {
               stLastWaitShot = RainbowSnakeFirstShot.a_4344();
               if(null == stLastWaitShot)
               {
                  return false;
               }
               this.a_1324.push(stLastWaitShot);
            }
            this.a_1321 = iCurrentTime;
            this.a_1323 = 0;
            this.m_iShotSkill = true;
            a_1275 = this.IsInjured ? 3 : 2;
            this.gotoAndStop((a_1276[a_1275] as FrameLabel).frame);
            if(this.a_1398 != null)
            {
               this.a_1398.gotoAndStop((a_1276[a_1275] as FrameLabel).frame);
            }
         }
         if(iCurrentTime - this.a_1321 == this.a_1310 + this.a_1317 * this.a_1323 && this.a_1324.length > 0)
         {
            stLastWaitShot = this.a_1324.pop();
            if(stLastWaitShot != null && stFieldGrid != null)
            {
               numShotXpos = 100;
               if(a_1283)
               {
                  numShotXpos = -numShotXpos;
               }
               stLastWaitShot.a_1797(0,10,this.a_1311,x + 100,y + 22,a_1334.m_stCurrentBattbleFieldView,stFieldGrid);
               stFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(stLastWaitShot,BattleLayerDefine.SHOT_TYPE,stFieldGrid);
            }
            if(this.a_1324.length > 0)
            {
               ++this.a_1323;
            }
         }
         return true;
      }
      
      override public function gotoAndStop(frame:Object, scene:String = null) : void
      {
         super.gotoAndStop(frame,scene);
      }
      
      public function IsExistIntruder(stFieldGrid:a_3491) : int
      {
         var stTargetFieldGrid:a_3491 = null;
         var i:int = 0;
         var intruder:a_4206 = null;
         if(stFieldGrid)
         {
            loop0:
            for(i = stFieldGrid.m_iXGridNo; i < BattleFieldView.a_1011; )
            {
               stTargetFieldGrid = stFieldGrid.m_stCurrentBattbleFieldView.a_3438(i,stFieldGrid.m_iYGridNo);
               var _loc5_:int = 0;
               var _loc6_:* = stTargetFieldGrid.a_1511;
               do
               {
                  for each(intruder in _loc6_)
                  {
                  }
                  i++;
                  continue loop0;
               }
               while(intruder.iSpaceState != 0);
               return 1;
            }
         }
         return 0;
      }
      
      public function addProtectBackSideEffect() : void
      {
         if(Boolean(a_1334) && this.a_1398 == null)
         {
            this.a_1398 = RainbowSnakeFirstTransProtectorBackside.a_3926();
            this.a_1398.a_1797(a_1283);
            this.a_1398.x = x - 4;
            this.a_1398.y = y;
            a_1334.m_stCurrentBattbleFieldView.AddToBattleView(this.a_1398,BattleLayerDefine.DEFENSE_PROTECTOR_BEFORE_TYPE,a_1334);
            if(stFieldGrid.m_stCurrentBattbleFieldView.GetGameMoveMap())
            {
               stFieldGrid.m_stCurrentBattbleFieldView.GetGameMoveMap().AddMoveDisplayObject(this.a_1398,stFieldGrid.m_iXGridNo,stFieldGrid.m_iYGridNo);
            }
            this.m_isPlaced = true;
         }
      }
      
      private function calcMouseBiteBackDamage(iRduceLifeValue:int) : void
      {
         var arrMoveIntruder:Array = null;
         var stMoveIntruder:a_4206 = null;
         if(a_1334 != null)
         {
            arrMoveIntruder = a_1334.a_1511.slice();
            for each(stMoveIntruder in arrMoveIntruder)
            {
               if(stMoveIntruder.isEatingDefense)
               {
                  stMoveIntruder.a_3969(iRduceLifeValue);
               }
            }
         }
      }
      
      public function a_4210() : void
      {
         var xIndex:int = 0;
         var stFieldGrid:a_3491 = null;
         var arrMoveIntruder:Array = null;
         var stMoveIntruder:a_4206 = null;
         var xStart:int = Math.max(a_1334.m_iXGridNo - this.m_iRange,0);
         var xEnd:int = Math.min(a_1334.m_iXGridNo + this.m_iRange,BattleFieldView.a_1011 - 1);
         var yStart:int = Math.max(a_1334.m_iYGridNo - this.m_iRange,0);
         var yEnd:int = Math.min(a_1334.m_iYGridNo + this.m_iRange,BattleFieldView.a_1012 - 1);
         for(var yIndex:int = yStart; yIndex <= yEnd; yIndex++)
         {
            for(xIndex = xStart; xIndex <= xEnd; xIndex++)
            {
               stFieldGrid = a_1334.m_stCurrentBattbleFieldView.a_3438(xIndex,yIndex);
               if(stFieldGrid != null)
               {
                  arrMoveIntruder = stFieldGrid.a_1511.slice();
                  for each(stMoveIntruder in arrMoveIntruder)
                  {
                     stMoveIntruder.a_4210();
                  }
               }
            }
         }
      }
      
      override public function a_3940() : Boolean
      {
         if(Boolean(this.a_1398) && stFieldGrid != null)
         {
            if(stFieldGrid.m_stCurrentBattbleFieldView.GetGameMoveMap())
            {
               stFieldGrid.m_stCurrentBattbleFieldView.GetGameMoveMap().RemoveMoveDisplayObject(this.a_1398);
            }
            this.a_1398.a_3940();
            this.a_1398 = null;
         }
         super.a_3940();
         return true;
      }
   }
}

