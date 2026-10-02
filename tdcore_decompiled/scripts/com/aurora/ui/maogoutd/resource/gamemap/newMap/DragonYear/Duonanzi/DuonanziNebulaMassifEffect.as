package com.aurora.ui.maogoutd.resource.gamemap.newMap.DragonYear.Duonanzi
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.a_3909;
   import com.aurora.ui.maogoutd.resource.defender.a_3962;
   import flash.display.FrameLabel;
   
   public class DuonanziNebulaMassifEffect extends a_3909
   {
      
      private var m_iStartTime:int;
      
      public var m_iRecycleState:int;
      
      private var m_iWaitTick:int;
      
      private var m_iGridState:int;
      
      private var a_1598:a_3491;
      
      private var m_iTick:int;
      
      private var m_iGridState2:int = 1;
      
      private var m_stEntity:a_3962;
      
      private var m_iSleepTime:int;
      
      public function DuonanziNebulaMassifEffect()
      {
         super();
         a_1279 = -3;
         m_iYDisplayCenterPos = 0;
      }
      
      public static function a_3926() : DuonanziNebulaMassifEffect
      {
         return PoolManager.getInstance().CheckOutOne(DuonanziNebulaMassifEffect) as DuonanziNebulaMassifEffect;
      }
      
      override protected function getBindMovie() : Class
      {
         return DuonanziNebulaMassifEffectMovie;
      }
      
      public function a_1797(isReseaved:Boolean) : Boolean
      {
         a_1283 = isReseaved;
         a_1275 = 0;
         this.visible = true;
         gotoAndStop(1);
         this.m_iStartTime = 0;
         this.SetFrameIndex(0);
         this.m_iRecycleState = 1;
         return true;
      }
      
      public function InitData(stTargetFieldGrid:a_3491, iWaitTick:int) : void
      {
         this.x = stTargetFieldGrid.m_iXGridNo * a_3491.a_1080;
         this.y = stTargetFieldGrid.m_iYGridNo * a_3491.a_1081;
         stTargetFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(this,BattleLayerDefine.EFFECTS_BASE_TYPE,stTargetFieldGrid);
         this.m_iGridState = 1;
         this.m_iWaitTick = iWaitTick;
         this.a_1598 = stTargetFieldGrid;
         this.m_iTick = 0;
         this.m_iGridState2 = 1;
         this.m_stEntity = null;
         this.Change2TargetType(1);
      }
      
      private function Change2TargetType(type:int) : void
      {
         this.m_iGridState2 = 1;
         this.m_iTick = 0;
         this.m_iGridState = type;
         if(this.m_iGridState == 1 || this.m_iGridState == 2 || this.m_iGridState == 3)
         {
            this.a_1598.m_iFieldGridType = 8;
         }
         else if(this.m_iGridState == 4)
         {
            this.a_1598.m_iFieldGridType = 0;
         }
         if(this.m_iGridState == 1)
         {
            this.visible = false;
         }
         else if(this.m_iGridState == 2)
         {
            this.visible = true;
            this.SetFrameIndex2(0,1);
         }
         else if(this.m_iGridState == 3)
         {
            this.visible = true;
            this.SetFrameIndex2(2,3);
         }
         else if(this.m_iGridState == 4)
         {
            this.visible = true;
            this.SetFrameIndex2(4,5);
         }
      }
      
      private function UpdateTick() : void
      {
         var entity:a_3962 = null;
         ++this.m_iTick;
         if(this.m_iGridState == 1 || this.m_iGridState == 2 || this.m_iGridState == 3)
         {
            if(this.m_iTick == 10 * this.m_iWaitTick)
            {
               this.Change2TargetType(this.m_iGridState + 1);
            }
         }
         else if(this.m_iGridState == 4)
         {
            if(this.m_iGridState2 == 1)
            {
               if(this.a_1598.m_stAttackFighter != null)
               {
                  this.m_stEntity = this.a_1598.m_stAttackFighter;
               }
               else if(this.a_1598.m_stProtector != null)
               {
                  this.m_stEntity = this.a_1598.m_stProtector;
               }
               else if(this.a_1598.m_stFlowerDefense != null)
               {
                  this.m_stEntity = this.a_1598.m_stFlowerDefense;
               }
               else if(this.a_1598.m_stBaseAuxiliaryFighter != null)
               {
                  this.m_stEntity = this.a_1598.m_stBaseAuxiliaryFighter;
               }
               else if(this.a_1598.m_stTrayDefense != null)
               {
                  this.m_stEntity = this.a_1598.m_stTrayDefense;
               }
               else if(this.a_1598.m_stBoomDefense != null)
               {
                  this.m_stEntity = this.a_1598.m_stBoomDefense;
               }
               if(this.m_stEntity != null)
               {
                  this.m_iGridState2 = 2;
               }
            }
            else if(this.m_iGridState2 == 2)
            {
               if(this.m_stEntity == null)
               {
                  this.m_iGridState2 = 1;
               }
               else
               {
                  entity = null;
                  if(this.a_1598.m_stAttackFighter != null)
                  {
                     entity = this.a_1598.m_stAttackFighter;
                  }
                  else if(this.a_1598.m_stProtector != null)
                  {
                     entity = this.a_1598.m_stProtector;
                  }
                  else if(this.a_1598.m_stFlowerDefense != null)
                  {
                     entity = this.a_1598.m_stFlowerDefense;
                  }
                  else if(this.a_1598.m_stBaseAuxiliaryFighter != null)
                  {
                     entity = this.a_1598.m_stBaseAuxiliaryFighter;
                  }
                  else if(this.a_1598.m_stTrayDefense != null)
                  {
                     entity = this.a_1598.m_stTrayDefense;
                  }
                  else if(this.a_1598.m_stBoomDefense != null)
                  {
                     entity = this.a_1598.m_stBoomDefense;
                  }
                  if(entity == null)
                  {
                     if(this.m_stEntity.m_iDieType == 1 || this.m_stEntity.m_iDieType == 3)
                     {
                        this.m_iGridState2 = 3;
                        this.a_1598.m_iFieldGridType = 8;
                        this.SetFrameIndex(6);
                     }
                     else
                     {
                        this.m_iGridState2 = 1;
                     }
                     this.m_stEntity = null;
                  }
               }
            }
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
         gotoAndStop(1);
         PoolManager.getInstance().CheckInOne(this);
         this.m_iRecycleState = 0;
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
         this.UpdateTick();
         nextFrame();
         if(a_1278 != null)
         {
            gotoAndStop((a_1276[a_1275] as FrameLabel).frame);
         }
         if(this.m_iGridState == 4 && a_1273 == a_1274)
         {
            this.Change2TargetType(1);
         }
         if(this.a_1598.m_iFieldGridType == 0)
         {
            if(this.m_iGridState == 1 || this.m_iGridState == 2 || this.m_iGridState == 3)
            {
               this.a_1598.m_iFieldGridType = 8;
            }
            else if(this.m_iGridState == 4)
            {
               this.a_1598.m_iFieldGridType = 0;
            }
         }
      }
   }
}

