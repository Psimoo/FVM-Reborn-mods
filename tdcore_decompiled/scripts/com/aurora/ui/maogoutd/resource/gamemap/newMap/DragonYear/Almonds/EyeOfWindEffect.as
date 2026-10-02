package com.aurora.ui.maogoutd.resource.gamemap.newMap.DragonYear.Almonds
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.a_3909;
   import com.aurora.ui.maogoutd.resource.effect.IPickFireObject;
   import com.aurora.ui.maogoutd.resource.energy.a_4157;
   import flash.display.FrameLabel;
   
   public class EyeOfWindEffect extends a_3909 implements IPickFireObject
   {
      
      private var m_iStartTime:int;
      
      public var m_iCheckRange:int = 0;
      
      private var m_iPickEnergyNum:int;
      
      private var m_iEyeState:int = 0;
      
      private var m_iLastEyeTick:int = 0;
      
      public var m_iState:int = 0;
      
      public var m_bUse:Boolean = false;
      
      private var m_stCurrentBattleFieldView:BattleFieldView;
      
      private var m_iGridNoX:int;
      
      private var m_iGridNoY:int;
      
      private var m_stTargetGrid:a_3491;
      
      private var m_iOldFieldGridType:int;
      
      private var m_TotalObstaclePos:Array = new Array([1,-1,10,null],[0,-1,20,null],[-1,-1,30,null],[-1,0,40,null],[-1,1,50,null],[0,1,60,null],[1,1,80,null],[1,0,100,null]);
      
      private var m_iSleepTime:int;
      
      public function EyeOfWindEffect()
      {
         super();
         a_1279 = -20;
         m_iYDisplayCenterPos = -20;
      }
      
      public static function a_3926() : EyeOfWindEffect
      {
         return PoolManager.getInstance().CheckOutOne(EyeOfWindEffect) as EyeOfWindEffect;
      }
      
      public function PickEnergyPower(iEnergy:int) : void
      {
         var item:Object = null;
         ++this.m_iPickEnergyNum;
         for(var i:int = 0; i < this.m_TotalObstaclePos.length; i++)
         {
            item = this.m_TotalObstaclePos[i];
            if(item[3] != null && this.m_iPickEnergyNum >= item[2])
            {
               this.m_TotalObstaclePos[i][3].ClearSelf();
               this.m_TotalObstaclePos[i][3] = null;
            }
         }
         if(this.m_iPickEnergyNum >= 150)
         {
            this.SetFrameIndex(3);
         }
      }
      
      private function SkillPickEnergy() : void
      {
         var stBaseEnergy:a_4157 = null;
         if(null != this.m_stCurrentBattleFieldView && Boolean(this.m_stCurrentBattleFieldView.m_arrBaseEnergyVector))
         {
            for each(stBaseEnergy in this.m_stCurrentBattleFieldView.m_arrBaseEnergyVector.slice())
            {
               if(this.m_iState == 1)
               {
                  if(stBaseEnergy.y < 220)
                  {
                     stBaseEnergy.a_4159(x,y,20,false);
                  }
               }
               else if(this.m_iState == 2)
               {
                  if(stBaseEnergy.y >= 220)
                  {
                     stBaseEnergy.a_4159(x,y,20,false);
                  }
               }
               else
               {
                  stBaseEnergy.a_4159(x,y,20,false);
               }
            }
         }
      }
      
      override protected function getBindMovie() : Class
      {
         return EyeOfWindEffectMovie;
      }
      
      public function a_1797(isReseaved:Boolean) : Boolean
      {
         a_1283 = isReseaved;
         a_1275 = 0;
         this.visible = true;
         gotoAndStop(1);
         this.m_iStartTime = 0;
         this.m_iPickEnergyNum = 0;
         this.SetFrameIndex2(0,1);
         this.m_iState = 0;
         this.m_bUse = true;
         this.m_iEyeState = 0;
         this.m_iLastEyeTick = 0;
         return true;
      }
      
      public function InitFiledGrid(battleView:BattleFieldView, gridX:int, gridY:int) : void
      {
         var stTargetGrid:a_3491 = null;
         this.m_stCurrentBattleFieldView = battleView;
         this.m_iGridNoX = gridX;
         this.m_iGridNoY = gridY;
         stTargetGrid = this.m_stCurrentBattleFieldView.a_3438(gridX,gridY);
         this.x = gridX * a_3491.a_1080 - 9;
         this.y = gridY * a_3491.a_1081 + 2;
         this.m_stCurrentBattleFieldView.AddToBattleView(this,BattleLayerDefine.EFFECTS_TOP_TYPE,stTargetGrid);
         this.m_stTargetGrid = stTargetGrid;
         if(stTargetGrid != null)
         {
            if(stTargetGrid != null)
            {
               this.m_iOldFieldGridType = stTargetGrid.m_iFieldGridType;
            }
            if(stTargetGrid != null && 0 == stTargetGrid.m_iFieldGridType)
            {
               stTargetGrid.m_iFieldGridType = 8;
            }
            this.a_3502(stTargetGrid);
            this.m_stTargetGrid.m_isSilent = false;
            this.m_stTargetGrid.m_iHurtRate = 0;
         }
         this.CreateMagnetic();
         this.m_stTargetGrid.m_stPickFireObject = this;
      }
      
      public function CreateMagnetic() : void
      {
         var j:int = 0;
         var effect:MagneticFieldEffect = null;
         var gridX:int = 0;
         var gridY:int = 0;
         var m_stTargetGrid:a_3491 = null;
         for(j = 0; j < this.m_TotalObstaclePos.length; j++)
         {
            effect = MagneticFieldEffect.a_3926();
            effect.a_1797(false);
            gridX = this.m_iGridNoX + this.m_TotalObstaclePos[j][0];
            gridY = this.m_iGridNoY + this.m_TotalObstaclePos[j][1];
            m_stTargetGrid = this.m_stCurrentBattleFieldView.a_3438(gridX,gridY);
            effect.x = gridX * a_3491.a_1080 - 9;
            effect.y = gridY * a_3491.a_1081 + 2;
            effect.InitFiledGrid(this.m_stCurrentBattleFieldView,this.m_iGridNoX + this.m_TotalObstaclePos[j][0],this.m_iGridNoY + this.m_TotalObstaclePos[j][1]);
            this.m_TotalObstaclePos[j][3] = effect;
         }
      }
      
      public function get a_3958() : int
      {
         return this.m_iSleepTime;
      }
      
      public function set a_3958(iSleepTime:int) : void
      {
         this.m_iSleepTime = iSleepTime;
      }
      
      public function a_3940() : Boolean
      {
         this.m_bUse = false;
         for(var j:int = 0; j < this.m_TotalObstaclePos.length; j++)
         {
            if(this.m_TotalObstaclePos[j][3] != null)
            {
               this.m_TotalObstaclePos[j][3].ReleaseSelf();
               this.m_TotalObstaclePos[j][3] = null;
            }
         }
         this.m_stTargetGrid.m_stPickFireObject = null;
         if(this.m_stTargetGrid != null)
         {
            if(this.m_iOldFieldGridType != -1)
            {
               this.m_stTargetGrid.m_iFieldGridType = this.m_iOldFieldGridType;
            }
            this.m_stTargetGrid.m_isSilent = false;
            this.m_stTargetGrid.m_iHurtRate = 1;
         }
         gotoAndStop(1);
         PoolManager.getInstance().CheckInOne(this);
         return true;
      }
      
      public function SetFrameIndex(frame:int) : void
      {
         if(a_1275 != frame)
         {
            a_1275 = frame;
            gotoAndStop((a_1276[frame] as FrameLabel).frame);
         }
      }
      
      public function SetFrameIndex2(once:int, loop:int) : void
      {
         a_1275 = loop;
         gotoAndStop((a_1276[once] as FrameLabel).frame);
      }
      
      public function OnLogicUpdate(iTimeNum:uint) : void
      {
         if(iTimeNum % 2 == 1)
         {
            this.a_4003();
         }
      }
      
      private function a_4003() : void
      {
         nextFrame();
         if(a_1278 != null)
         {
            gotoAndStop((a_1276[a_1275] as FrameLabel).frame);
         }
         ++this.m_iStartTime;
         if(this.m_iEyeState == 0)
         {
            if(this.m_iStartTime - this.m_iLastEyeTick == 90)
            {
               this.SetFrameIndex(2);
               this.m_iEyeState = 1;
               this.m_iLastEyeTick = this.m_iStartTime;
               this.SkillPickEnergy();
            }
         }
         else if(this.m_iEyeState == 1)
         {
            this.SkillPickEnergy();
            if(this.m_iStartTime - this.m_iLastEyeTick == 40)
            {
               this.m_iLastEyeTick = this.m_iStartTime;
               this.SetFrameIndex(1);
               this.m_iEyeState = 0;
            }
         }
         if(a_1273 == a_1274)
         {
            this.a_3940();
         }
      }
      
      protected function a_3502(stFieldGrid:a_3491) : Boolean
      {
         if(null == stFieldGrid)
         {
            return false;
         }
         return stFieldGrid.ClearFieldGridDefenseWithOption();
      }
   }
}

