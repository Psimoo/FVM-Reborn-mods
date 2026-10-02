package com.aurora.ui.maogoutd.resource.gamemap.newMap.SnakeYear.GreedyDemon
{
   import a_4718.b_179;
   import a_4718.b_181;
   import a_4718.b_182;
   import a_4728.a_1778;
   import a_4729.a_1789;
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.avatar.a_3924;
   import com.aurora.ui.maogoutd.resource.effect.a_4108;
   import flash.display.FrameLabel;
   import flash.geom.Point;
   
   public class StreetLamp2MoveIntruder extends a_4206
   {
      
      private var MAX_INJURED_LIFE:int = 100000;
      
      private var MAX_LIFE:int = 300000;
      
      public var m_iOldFieldGridType:int;
      
      private var _begin:Array;
      
      private var _times:int;
      
      private var _index:int;
      
      private var _stMap:SweetTrapAmusementParkGameMap;
      
      private var _realDie:Boolean = false;
      
      private var _iState:int = 0;
      
      private var m_iTimeNum:int = 0;
      
      private var m_iBirthTime:int = -1;
      
      private var m_iAttackTime:int = -1;
      
      private var m_iBeginTime:int = -1;
      
      private var m_targetMouseArray:Array = new Array();
      
      private var m_MouseArr:Array = new Array(8392723,8389315,8388773,8389220,8389219,8389116,8388743,8388727,8388642,8388627);
      
      private var startPosition:Point;
      
      public function StreetLamp2MoveIntruder()
      {
         super();
      }
      
      public static function a_3926() : StreetLamp2MoveIntruder
      {
         return PoolManager.getInstance().CheckOutOne(StreetLamp2MoveIntruder) as StreetLamp2MoveIntruder;
      }
      
      override protected function getBindMovie() : Class
      {
         return StreetLampMoveIntruderMovie;
      }
      
      override public function a_1797(iGlobalMoveFighterID:int, iIntruderMoveDirection:int) : Boolean
      {
         super.a_1797(iGlobalMoveFighterID,iIntruderMoveDirection);
         a_1350 = 0;
         if(iIntruderMoveDirection < 0)
         {
            a_1350 *= -1;
         }
         a_1279 = -30;
         m_iYDisplayCenterPos = -110;
         a_1272 = 0;
         a_1481 = false;
         a_1464 = true;
         a_1463 = true;
         BoomIsReduceLife = true;
         a_1339 = this.MAX_LIFE;
         m_SecondDieFrame = 136;
         this.m_iBeginTime = -1;
         tagCom.AddTag(40003);
         return true;
      }
      
      public function InitData(index:int, begin:Array, times:int, map:SweetTrapAmusementParkGameMap) : void
      {
         a_1271 = true;
         this._begin = begin;
         this._times = times;
         this._index = index;
         this._stMap = map;
         this._realDie = false;
         this._iState = 0;
         this.m_iOldFieldGridType = -1;
         this.SetAnimationOnce2Loop(0,1,0,1);
         this.m_iBeginTime = -1;
         this.m_iBirthTime = -1;
         this.m_iAttackTime = -1;
         if(m_stCurrentFieldGrid != null)
         {
            this.m_iOldFieldGridType = m_stCurrentFieldGrid.m_iFieldGridType;
            m_stCurrentFieldGrid.m_iFieldGridType = 8;
         }
         a_1789.getInstance().addEventListener("DefenseCardCountChange",this.a_3483);
         this.startPosition = new Point(m_stCurrentFieldGrid.m_iXGridNo * a_3491.a_1080 + 30,m_stCurrentFieldGrid.m_iYGridNo * a_3491.a_1081 + 30);
         m_stCurrentFieldGrid.tagCom.AddTag(23);
      }
      
      override protected function a_3940() : Boolean
      {
         a_1789.getInstance().removeEventListener("DefenseCardCountChange",this.a_3483);
         if(!this._realDie)
         {
            ++this._times;
            this._stMap.CreateLamp2(this._index,this._begin,this._times);
         }
         if(m_stCurrentFieldGrid != null && this.m_iOldFieldGridType != -1)
         {
            m_stCurrentFieldGrid.m_iFieldGridType = this.m_iOldFieldGridType;
            this.m_iOldFieldGridType = -1;
         }
         super.a_3940();
         return true;
      }
      
      private function a_3483(stDataEvent:a_1778) : void
      {
         var iDefenseTypeID:int = int(stDataEvent.dataObject[0]);
         var tempFieldGrid:Object = stDataEvent.dataObject.length >= 3 ? stDataEvent.dataObject[2] : null;
         if(tempFieldGrid == null)
         {
            return;
         }
         if(m_stCurrentFieldGrid == null)
         {
            return;
         }
         if(this._iState == 0)
         {
            return;
         }
         if(iDefenseTypeID == b_179.a_403 || iDefenseTypeID == b_179.enm_HelmetCopperScoop || iDefenseTypeID == b_179.enm_HelmetSilverScoop || iDefenseTypeID == b_179.enm_HelmetGoldenScoop)
         {
            if(m_stCurrentFieldGrid.m_iYGridNo == tempFieldGrid.m_iYGridNo && m_stCurrentFieldGrid.m_iXGridNo == tempFieldGrid.m_iXGridNo)
            {
               this.light2Gray();
            }
         }
      }
      
      public function CallDie() : void
      {
         this._realDie = true;
         if(m_stCurrentFieldGrid != null && this.m_iOldFieldGridType != -1)
         {
            m_stCurrentFieldGrid.m_iFieldGridType = this.m_iOldFieldGridType;
            this.m_iOldFieldGridType = -1;
         }
         this.a_3969(iLifeValue);
      }
      
      private function gray2Light() : void
      {
         this.SetAnimationOnce2Loop(3,4,8,9);
         this._iState = 1;
         this.m_iBeginTime = this.m_iTimeNum;
         this.m_iAttackTime = -1;
         m_stCurrentFieldGrid.tagCom.RemoveTag(23);
      }
      
      private function light2Gray() : void
      {
         this.SetAnimationOnce2Loop(5,1,10,6);
         this._iState = 0;
         this.m_iBeginTime = this.m_iTimeNum;
         this.m_iAttackTime = -1;
         m_stCurrentFieldGrid.tagCom.AddTag(23);
      }
      
      override public function a_4216(iCurrentTime:int) : Boolean
      {
         this.m_iTimeNum = iCurrentTime;
         if(this.m_iBirthTime == -1)
         {
            this.m_iBirthTime = iCurrentTime;
         }
         var birthTick:int = this.m_iTimeNum - this.m_iBirthTime;
         if(birthTick == 2)
         {
            this.a_3502(m_stCurrentFieldGrid);
         }
         if(this._iState == 0)
         {
            if(m_stCurrentFieldGrid.m_stFlowerDefense != null && BattleFieldView.m_lAlcoholLamp.indexOf(m_stCurrentFieldGrid.m_stFlowerDefense.a_3512()) != -1)
            {
               if(m_stCurrentFieldGrid.m_stFlowerDefense != null)
               {
                  m_stCurrentFieldGrid.m_stFlowerDefense.m_iDieType = 2;
                  m_stCurrentFieldGrid.m_stFlowerDefense.a_3969(m_stCurrentFieldGrid.m_stFlowerDefense.iLifeValue);
               }
               this.gray2Light();
            }
         }
         else if(iCurrentTime % 2 == 1)
         {
            if(this.m_iAttackTime == -1)
            {
               if(iCurrentTime - this.m_iBeginTime > 20 * 6)
               {
                  this.CheckAttack();
               }
            }
            else if(iCurrentTime - this.m_iAttackTime > 20 * 6)
            {
               this.CheckAttack();
            }
         }
         var numOrigXPos:Number = x;
         super.a_4216(iCurrentTime);
         if(a_1457 == b_181.a_424 && (x > a_3491.a_1080 * 4 && a_1283 || x < a_3491.a_1080 * 5 && !a_1283))
         {
            y += Math.tan(15 * Math.PI / 180) * Math.abs(numOrigXPos - x);
         }
         return true;
      }
      
      private function CheckAttack() : void
      {
         if(this.a_3431(m_stCurrentFieldGrid) <= 0)
         {
            return;
         }
         this.DoAttack();
      }
      
      private function DoAttack() : void
      {
         this.m_iAttackTime = this.m_iTimeNum;
         var stDataEvent:a_1778 = new a_1778("ReduceEnergy");
         stDataEvent.dataObject = 300;
         if(root)
         {
            root.dispatchEvent(stDataEvent);
         }
         var stLastWaitShot:ElectricTigerSecondAttackFighterShot = ElectricTigerSecondAttackFighterShot.a_4344() as ElectricTigerSecondAttackFighterShot;
         stLastWaitShot.stTargetMouse = this.m_targetMouseArray[0];
         stLastWaitShot.a_1797(0,0,0,x,y,m_stCurrentFieldGrid.m_stCurrentBattbleFieldView,m_stCurrentFieldGrid);
         parent.addChildAt(stLastWaitShot,m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3433());
      }
      
      public function a_3431(startFieldGrid:a_3491) : int
      {
         var tempFG:a_3491 = null;
         var xIndex:int = 0;
         var stMoveIntruder:a_4206 = null;
         if(startFieldGrid == null)
         {
            return 0;
         }
         while(this.m_targetMouseArray.length > 0)
         {
            this.m_targetMouseArray.pop();
         }
         var iTotalIntruderNum:int = 0;
         var numDistance:Number = -1;
         var bossArray:Array = new Array();
         var eliteArray:Array = new Array();
         var normalArray:Array = new Array();
         for(var yIndex:int = 0; yIndex < BattleFieldView.a_1012; yIndex++)
         {
            for(xIndex = 0; xIndex < BattleFieldView.a_1011; xIndex++)
            {
               tempFG = startFieldGrid.m_stCurrentBattbleFieldView.a_3438(xIndex,yIndex);
               if(tempFG)
               {
                  for each(stMoveIntruder in tempFG.a_1511)
                  {
                     if(!(stMoveIntruder is StreetLamp2MoveIntruder))
                     {
                        if(stMoveIntruder.iLifeValue > 0 && !stMoveIntruder.isCannotSeeByFighter && (stMoveIntruder.iSpaceState == 0 || stMoveIntruder.iSpaceState == 3))
                        {
                           if(stMoveIntruder.IsBossIntruder)
                           {
                              bossArray.push(stMoveIntruder);
                           }
                           else if(this.m_MouseArr.indexOf(stMoveIntruder.m_stMoveIntruderTypeID) != -1)
                           {
                              eliteArray.push(stMoveIntruder);
                           }
                           else
                           {
                              normalArray.push(stMoveIntruder);
                           }
                        }
                     }
                  }
               }
            }
         }
         bossArray.sort(this.OnSortToken);
         eliteArray.sort(this.OnSortToken);
         normalArray.sort(this.OnSortToken);
         this.m_targetMouseArray = this.m_targetMouseArray.concat(bossArray).concat(eliteArray).concat(normalArray);
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
      
      override protected function ResetMovieStatus() : Boolean
      {
         if(a_1339 <= 0)
         {
            if(this._iState == 0)
            {
               this.SetAnimation(11,11);
            }
            else
            {
               this.SetAnimation(12,12);
            }
            if(m_stCurrentFieldGrid)
            {
               m_stCurrentFieldGrid.a_3457(this);
               m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3457(this);
            }
            play();
         }
         return true;
      }
      
      override public function a_3969(iRduceLifeValue:int) : Boolean
      {
         if(this._iState == 1 && !this._realDie)
         {
            return true;
         }
         super.a_3969(iRduceLifeValue);
         return true;
      }
      
      override public function a_4209(iRduceLifeValue:int) : Boolean
      {
         if(this._iState == 1)
         {
            return true;
         }
         super.a_4209(iRduceLifeValue);
         return true;
      }
      
      override public function ReduceAllLife(iRduceLifeValue:int, bIsIgnoreArmor:Boolean = false, ishowHuijing:Boolean = false) : Boolean
      {
         if(this._iState == 1)
         {
            return true;
         }
         super.ReduceAllLife(iRduceLifeValue,bIsIgnoreArmor,ishowHuijing);
         return true;
      }
      
      public function InDamage() : Boolean
      {
         return a_1339 > 0 && a_1339 < this.MAX_INJURED_LIFE;
      }
      
      public function SetAnimation(animIdx:int, animIdx2:int) : void
      {
         if(this.InDamage())
         {
            animIdx = animIdx2;
         }
         if(a_1275 != animIdx)
         {
            a_1275 = animIdx;
            gotoAndStop((a_1276[animIdx] as FrameLabel).frame);
            a_3419();
         }
      }
      
      public function SetAnimationOnce2Loop(onceAnimIdx:int, loopAnimIdx:int, onceAnimIdx2:int, loopAnimIdx2:int) : void
      {
         if(this.InDamage())
         {
            onceAnimIdx = onceAnimIdx2;
            loopAnimIdx = loopAnimIdx2;
         }
         a_1275 = loopAnimIdx;
         gotoAndStop((a_1276[onceAnimIdx] as FrameLabel).frame);
         a_3419();
      }
      
      protected function a_3502(stFieldGrid:a_3491) : void
      {
         if(stFieldGrid == null)
         {
            return;
         }
         if(null != stFieldGrid.m_stAttackFighter)
         {
            if(stFieldGrid.m_stAttackFighter is a_3924)
            {
               return;
            }
            stFieldGrid.m_stAttackFighter.m_iDieType = 1;
            stFieldGrid.m_stAttackFighter.a_3969(stFieldGrid.m_stAttackFighter.iLifeValue);
         }
         if(null != stFieldGrid.m_stProtector)
         {
            stFieldGrid.m_stProtector.m_iDieType = 1;
            stFieldGrid.m_stProtector.a_3969(stFieldGrid.m_stProtector.iLifeValue);
         }
         if(null != stFieldGrid.m_stBoomDefense)
         {
            stFieldGrid.m_stBoomDefense.m_iDieType = 1;
            stFieldGrid.m_stBoomDefense.a_3969(stFieldGrid.m_stBoomDefense.iLifeValue);
         }
         if(null != stFieldGrid.m_stFlowerDefense)
         {
            stFieldGrid.m_stFlowerDefense.m_iDieType = 1;
            stFieldGrid.m_stFlowerDefense.a_3969(stFieldGrid.m_stFlowerDefense.iLifeValue);
         }
         if(null != stFieldGrid.m_stBaseAuxiliaryFighter)
         {
            stFieldGrid.m_stBaseAuxiliaryFighter.m_iDieType = 1;
            stFieldGrid.m_stBaseAuxiliaryFighter.a_3969(stFieldGrid.m_stBaseAuxiliaryFighter.iLifeValue);
         }
         stFieldGrid.DamageNewSlot(true,0,true,0,1);
         if(null != stFieldGrid.m_stTrayDefense)
         {
            stFieldGrid.m_stTrayDefense.m_iDieType = 1;
            stFieldGrid.m_stTrayDefense.a_3969(stFieldGrid.m_stTrayDefense.iLifeValue);
         }
      }
      
      override public function a_4213() : Boolean
      {
         this.a_3969(900);
         if(a_1339 <= 0)
         {
            this.a_4212();
         }
         return true;
      }
      
      override public function a_4212() : Boolean
      {
         if(m_stCurrentFieldGrid)
         {
            this.a_3969(900);
         }
         else
         {
            a_1339 = 0;
            this.a_3940();
         }
         return true;
      }
      
      override public function a_4208(iEffectType:int, iEffectTime:int, stBaseEffect:a_4108 = null) : void
      {
         if(b_182.a_432 == iEffectType)
         {
            super.a_4208(iEffectType,iEffectTime,stBaseEffect);
         }
      }
   }
}

