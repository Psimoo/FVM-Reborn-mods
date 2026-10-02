package com.aurora.ui.maogoutd.resource.gamemap.newMap.DragonYear.MemPackStore
{
   import a_4718.b_181;
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.defender.a_3962;
   import com.aurora.ui.maogoutd.resource.effect.a_4108;
   import flash.display.FrameLabel;
   
   public class MemPackBalerIntruder extends a_4206
   {
      
      protected var m_stGameMap:IMemPackMap;
      
      protected var FULL_HP:int = 1200;
      
      protected var m_bDay:Boolean = true;
      
      public function MemPackBalerIntruder()
      {
         super();
      }
      
      public static function a_3926() : MemPackBalerIntruder
      {
         return PoolManager.getInstance().CheckOutOne(MemPackBalerIntruder) as MemPackBalerIntruder;
      }
      
      override protected function getBindMovie() : Class
      {
         return MemPackBalerIntruderMovie;
      }
      
      override public function a_1797(iGlobalMoveFighterID:int, iIntruderMoveDirection:int) : Boolean
      {
         super.a_1797(iGlobalMoveFighterID,iIntruderMoveDirection);
         a_1350 = 0;
         if(iIntruderMoveDirection < 0)
         {
            a_1350 *= -1;
         }
         a_1339 = 999999;
         a_1279 = 0;
         m_iYDisplayCenterPos = -5;
         a_1272 = 0;
         a_1462 = true;
         a_1481 = false;
         a_1464 = true;
         a_1463 = true;
         BoomIsReduceLife = true;
         m_bPostEnemy = false;
         a_1465 = 2;
         this.SetAnimation(2,3);
         tagCom.AddTag(40003);
         return true;
      }
      
      override public function a_4208(iEffectType:int, iEffectTime:int, stBaseEffect:a_4108 = null) : void
      {
      }
      
      override public function a_4210() : Boolean
      {
         return true;
      }
      
      override protected function ResetMovieStatus() : Boolean
      {
         return true;
      }
      
      override public function a_4213() : Boolean
      {
         return true;
      }
      
      override public function a_4212() : Boolean
      {
         return true;
      }
      
      override public function a_3969(iRduceLifeValue:int) : Boolean
      {
         return true;
      }
      
      override public function a_4215(stBaseDefense:a_3962) : Boolean
      {
         return true;
      }
      
      public function IsBOSS(stMoveIntruder:a_4206) : Boolean
      {
         return stMoveIntruder.IsBossIntruder;
      }
      
      private function DoSkill() : void
      {
         this.SetAnimationOnce2Loop(1,2,3);
      }
      
      override public function a_4216(iCurrentTime:int) : Boolean
      {
         var stNextFieldGrid:a_3491 = null;
         var array:Array = null;
         var gridX:int = 0;
         var gridY:int = 0;
         var m_stTargetGrid:a_3491 = null;
         var ropeIntruder:DayMemPackRopeEffect = null;
         var rope2Intruder:NightMemPackRopeEffect = null;
         if((a_1273 == 19 || a_1273 == 44) && iCurrentTime % 2 == 1)
         {
            array = this.m_stGameMap.GetRandomUseGrid(m_stCurrentFieldGrid.m_iYGridNo);
            gridX = int(array[0]);
            gridY = int(array[1]);
            m_stTargetGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(gridX,gridY);
            if(this.m_bDay == true)
            {
               ropeIntruder = DayMemPackRopeEffect.a_3926();
               ropeIntruder.a_1797((1 << 16) + 5000 + m_stTargetGrid.m_iYGridNo * 100 + m_stTargetGrid.m_iXGridNo + 30000,-1);
               ropeIntruder.InitFiled(m_stTargetGrid,array[2] == 1,this.m_stGameMap,this.FULL_HP);
               ropeIntruder.m_stMoveIntruderTypeID = 8389129;
               m_stTargetGrid.m_stCurrentBattbleFieldView.a_3459(ropeIntruder,m_stTargetGrid,false,BattleLayerDefine.EFFECTS_BASE_TYPE);
               ropeIntruder.x = m_stTargetGrid.m_iXGridNo * a_3491.a_1080;
               ropeIntruder.y = m_stTargetGrid.m_iYGridNo * a_3491.a_1081;
            }
            else
            {
               rope2Intruder = NightMemPackRopeEffect.a_3926();
               rope2Intruder.a_1797((1 << 16) + 5000 + m_stTargetGrid.m_iYGridNo * 100 + m_stTargetGrid.m_iXGridNo + 30000,-1);
               rope2Intruder.InitFiled(m_stTargetGrid,array[2] == 1,this.m_stGameMap,this.FULL_HP);
               rope2Intruder.m_stMoveIntruderTypeID = 8389129;
               m_stTargetGrid.m_stCurrentBattbleFieldView.a_3459(rope2Intruder,m_stTargetGrid,false,BattleLayerDefine.EFFECTS_BASE_TYPE);
               rope2Intruder.x = m_stTargetGrid.m_iXGridNo * a_3491.a_1080;
               rope2Intruder.y = m_stTargetGrid.m_iYGridNo * a_3491.a_1081;
            }
         }
         var numOrigXPos:Number = x;
         var iYGridNo:int = int(y / a_3491.a_1081);
         var iXGridNo:int = int(x / a_3491.a_1080);
         if(a_1283)
         {
            iXGridNo = BattleFieldView.a_1011 - 1 - iXGridNo;
         }
         if(m_stCurrentFieldGrid.m_iXGridNo != iXGridNo || m_stCurrentFieldGrid.m_iYGridNo != iYGridNo)
         {
            stNextFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(iXGridNo,iYGridNo);
            ChangeFieldGrid(stNextFieldGrid);
            if(stNextFieldGrid.m_stBaseLander != null)
            {
               SetClarmLanderTime();
            }
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
      
      public function SetAnimation(animIdx:int, addIdx:int = 0) : void
      {
         if(this.m_bDay == false)
         {
            animIdx += addIdx;
         }
         if(a_1275 != animIdx)
         {
            a_1275 = animIdx;
            gotoAndStop((a_1276[animIdx] as FrameLabel).frame);
            a_3419();
         }
      }
      
      public function SetAnimationOnce2Loop(onceAnimIdx:int, loopAnimIdx:int, addIdx:int = 0) : void
      {
         if(this.m_bDay == false)
         {
            onceAnimIdx += addIdx;
            loopAnimIdx += addIdx;
         }
         a_1275 = loopAnimIdx;
         gotoAndStop((a_1276[onceAnimIdx] as FrameLabel).frame);
         a_3419();
      }
      
      public function InitData(gameMap:IMemPackMap, fullHp:int, bDay:Boolean = true) : void
      {
         this.m_stGameMap = gameMap;
         this.FULL_HP = fullHp;
         this.m_bDay = bDay;
      }
      
      override public function SpecialSkillCallBack(... args) : void
      {
         var state:int = 0;
         if(args[0] == 2)
         {
            state = int(args[1]);
            if(state == 1)
            {
               this.SetAnimation(0,3);
            }
            else
            {
               this.DoSkill();
            }
         }
         else
         {
            this.m_stGameMap = args[1] as IMemPackMap;
            this.FULL_HP = args[2];
            this.m_bDay = args[3];
            this.SetAnimation(2,3);
         }
      }
   }
}

