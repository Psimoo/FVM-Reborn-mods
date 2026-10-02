package com.aurora.ui.maogoutd.resource.defender.DragonYear.NaughtyDragon
{
   import a_4728.a_1778;
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.defender.a_3962;
   import com.aurora.ui.maogoutd.resource.defender.a_3976;
   import flash.display.FrameLabel;
   import flash.events.Event;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   
   public class NaughtyDragonFirstDefense extends a_3976
   {
      
      private var m_stTiemr:Timer;
      
      private var m_iAppearedTime:int;
      
      private var m_YPos:Number;
      
      private var m_XPos:Number;
      
      public function NaughtyDragonFirstDefense()
      {
         a_1271 = true;
         super();
         a_1095 = NaughtyDragonDefine.DEFENSE_PRICE;
         this.m_stTiemr = new Timer(100);
         m_iMoveByMap = true;
      }
      
      public static function a_3926() : NaughtyDragonFirstDefense
      {
         return PoolManager.getInstance().CheckOutOne(NaughtyDragonFirstDefense) as NaughtyDragonFirstDefense;
      }
      
      override protected function getBindMovie() : Class
      {
         return NaughtyDragonFirstDefenseMovie;
      }
      
      override public function a_1797(stFieldGrid:a_3491) : Boolean
      {
         super.a_1797(stFieldGrid);
         this.m_stTiemr.addEventListener(TimerEvent.TIMER,this.a_4003);
         this.visible = true;
         this.m_iAppearedTime = -1;
         this.play();
         a_1095 = NaughtyDragonDefine.DEFENSE_PRICE;
         return true;
      }
      
      override public function a_3957(iCurrentTime:int) : void
      {
         super.a_3957(iCurrentTime);
      }
      
      override protected function a_3964() : int
      {
         return NaughtyDragonDefine.a_3964(a_1094);
      }
      
      override public function a_3940() : Boolean
      {
         if(stFieldGrid != null && stFieldGrid.m_stCurrentBattbleFieldView.m_LockMoveDefense == this)
         {
            stFieldGrid.m_stCurrentBattbleFieldView.m_LockMoveDefense = null;
         }
         else if(stFieldGrid != null && stFieldGrid.m_stCurrentBattbleFieldView.m_UnLockMoveDefense == this)
         {
            stFieldGrid.m_stCurrentBattbleFieldView.m_UnLockMoveDefense = null;
         }
         else if(stFieldGrid != null && stFieldGrid.m_stCurrentBattbleFieldView.m_OtherLockMoveDefense == this)
         {
            stFieldGrid.m_stCurrentBattbleFieldView.m_OtherLockMoveDefense = null;
         }
         else if(stFieldGrid != null && stFieldGrid.m_stCurrentBattbleFieldView.m_OtherUnLockMoveDefense == this)
         {
            stFieldGrid.m_stCurrentBattbleFieldView.m_OtherUnLockMoveDefense = null;
         }
         this.m_stTiemr.removeEventListener(TimerEvent.TIMER,this.a_4003);
         this.m_stTiemr.stop();
         return super.a_3940();
      }
      
      public function play() : void
      {
         this.m_stTiemr.start();
      }
      
      public function stop() : void
      {
         this.m_stTiemr.stop();
      }
      
      private function a_4003(a_4730:Event) : void
      {
         var m_MoveDefense:a_3962 = null;
         var stAurDataEvent:a_1778 = null;
         if(this.m_iAppearedTime == -1)
         {
            if(m_iBeOtherPlaced)
            {
               if(stFieldGrid != null && stFieldGrid.m_stCurrentBattbleFieldView.m_OtherLockMoveDefense == null)
               {
                  stFieldGrid.m_stCurrentBattbleFieldView.m_OtherLockMoveDefense = this;
                  m_MoveDefense = stFieldGrid.getMoveDefense(a_1098,false);
                  if(m_MoveDefense != null && m_MoveDefense != stFieldGrid.m_stCurrentBattbleFieldView.m_OtherMoveDefense)
                  {
                     stFieldGrid.m_stCurrentBattbleFieldView.m_OtherMoveDefense = m_MoveDefense;
                  }
                  m_iMoveState = 1;
               }
               else if(stFieldGrid != null && stFieldGrid.m_stCurrentBattbleFieldView.m_OtherUnLockMoveDefense == null)
               {
                  stFieldGrid.m_stCurrentBattbleFieldView.m_OtherUnLockMoveDefense = this;
                  m_iMoveState = 2;
                  if(stFieldGrid.m_stCurrentBattbleFieldView.m_OtherLockMoveDefense != null)
                  {
                     m_MoveDefense = stFieldGrid.m_stCurrentBattbleFieldView.m_OtherLockMoveDefense.stFieldGrid.getMoveDefense(a_1098,false);
                     if(m_MoveDefense != null && m_MoveDefense != stFieldGrid.m_stCurrentBattbleFieldView.m_OtherMoveDefense)
                     {
                        stFieldGrid.m_stCurrentBattbleFieldView.m_OtherMoveDefense = m_MoveDefense;
                     }
                  }
               }
            }
            else
            {
               if(Boolean(a_1334.m_stCurrentBattbleFieldView.isOwnBattleField) && Boolean(root) && !m_iBeOtherPlaced)
               {
                  stAurDataEvent = new a_1778("GameCloseCopyCardProcess");
                  stAurDataEvent.dataObject = [a_1098,a_1334.m_iInitialXGridNo + "_" + a_1334.m_iInitialYGridNo + "_" + m_iPlaceTimeIntervals];
                  root.dispatchEvent(stAurDataEvent);
               }
               if(stFieldGrid != null && stFieldGrid.m_stCurrentBattbleFieldView.m_LockMoveDefense == null)
               {
                  stFieldGrid.m_stCurrentBattbleFieldView.m_LockMoveDefense = this;
                  m_iMoveState = 1;
               }
               else if(stFieldGrid != null && stFieldGrid.m_stCurrentBattbleFieldView.m_UnLockMoveDefense == null)
               {
                  stFieldGrid.m_stCurrentBattbleFieldView.m_UnLockMoveDefense = this;
                  m_iMoveState = 2;
                  if(stFieldGrid.m_stCurrentBattbleFieldView.m_LockMoveDefense != null)
                  {
                     m_MoveDefense = stFieldGrid.m_stCurrentBattbleFieldView.m_LockMoveDefense.stFieldGrid.getMoveDefense(a_1098);
                     if(m_MoveDefense != null && m_MoveDefense != stFieldGrid.m_stCurrentBattbleFieldView.m_MoveDefense)
                     {
                        stFieldGrid.m_stCurrentBattbleFieldView.m_MoveDefense = m_MoveDefense;
                     }
                  }
               }
            }
         }
         if(m_iMoveState == 1)
         {
            this.LockMoveAction();
         }
         else if(m_iMoveState == 2)
         {
            this.UnLockMoveAction();
         }
         ++this.m_iAppearedTime;
         if(a_1273 == a_1274)
         {
            if(this.parent)
            {
               this.parent.removeChild(this);
            }
            this.a_3940();
            return;
         }
         if(a_1336)
         {
            a_1336.a_3957(this.m_iAppearedTime);
         }
         if(m_stFrozenCardEffect)
         {
            m_stFrozenCardEffect.a_3957(this.m_iAppearedTime);
         }
         if(m_stShiHuaEffect)
         {
            m_stShiHuaEffect.a_3957(this.m_iAppearedTime);
         }
         nextFrame();
         if(a_1278 != null)
         {
            gotoAndStop((a_1276[a_1275] as FrameLabel).frame);
         }
      }
      
      private function LockMoveAction() : void
      {
         if(m_iBeOtherPlaced)
         {
            if(stFieldGrid.m_stCurrentBattbleFieldView.m_OtherMoveDefense == null)
            {
               this.a_3940();
               return;
            }
            if(this.m_iAppearedTime == -1)
            {
               if(stFieldGrid.m_stCurrentBattbleFieldView.m_OtherMoveDefense == null)
               {
                  this.y = stFieldGrid.m_stCurrentBattbleFieldView.m_OtherMoveDefense.y;
               }
               a_1275 = 1;
               gotoAndStop((a_1276[a_1275] as FrameLabel).frame);
               if(a_1336)
               {
                  a_1336.visible = false;
               }
            }
         }
         else
         {
            if(stFieldGrid.m_stCurrentBattbleFieldView.m_MoveDefense == null)
            {
               this.a_3940();
               return;
            }
            if(this.m_iAppearedTime == -1)
            {
               if(stFieldGrid.m_stCurrentBattbleFieldView.m_MoveDefense == null)
               {
                  this.y = stFieldGrid.m_stCurrentBattbleFieldView.m_MoveDefense.y;
               }
               a_1275 = 1;
               gotoAndStop((a_1276[a_1275] as FrameLabel).frame);
               if(a_1336)
               {
                  a_1336.visible = false;
               }
            }
         }
      }
      
      private function UnLockMoveAction() : void
      {
         if(this.m_iAppearedTime == -1)
         {
            a_1275 = 2;
            gotoAndStop((a_1276[0] as FrameLabel).frame);
         }
         if(m_iBeOtherPlaced)
         {
            if(a_1273 == 24)
            {
               if(stFieldGrid.m_stCurrentBattbleFieldView.m_OtherLockMoveDefense != null)
               {
                  stFieldGrid.m_stCurrentBattbleFieldView.m_OtherLockMoveDefense.gotoAndStop((a_1276[2] as FrameLabel).frame);
               }
            }
            else if(a_1273 == 45)
            {
               if(a_1336)
               {
                  a_1336.visible = false;
               }
            }
            else if(a_1273 == 52)
            {
               if(Boolean(a_1334.m_stCurrentBattbleFieldView.isOwnBattleField) && Boolean(root) && !m_iBeOtherPlaced)
               {
                  if(stFieldGrid.m_stCurrentBattbleFieldView.m_OtherMoveDefense != null && stFieldGrid.m_stCurrentBattbleFieldView.m_OtherLockMoveDefense != null)
                  {
                  }
               }
            }
         }
         else if(a_1273 == 24)
         {
            if(stFieldGrid.m_stCurrentBattbleFieldView.m_LockMoveDefense != null)
            {
               stFieldGrid.m_stCurrentBattbleFieldView.m_LockMoveDefense.gotoAndStop((a_1276[2] as FrameLabel).frame);
            }
         }
         else if(a_1273 == 45)
         {
            if(a_1336)
            {
               a_1336.visible = false;
            }
         }
         else if(a_1273 == 52)
         {
            if(Boolean(a_1334.m_stCurrentBattbleFieldView.isOwnBattleField) && Boolean(root) && !m_iBeOtherPlaced)
            {
               if(stFieldGrid.m_stCurrentBattbleFieldView.m_MoveDefense != null && stFieldGrid.m_stCurrentBattbleFieldView.m_UnLockMoveDefense != null)
               {
                  this.ChangeGride(stFieldGrid.m_stCurrentBattbleFieldView.m_MoveDefense,stFieldGrid.m_stCurrentBattbleFieldView.m_UnLockMoveDefense.stFieldGrid);
               }
            }
         }
      }
      
      private function ChangeGride(stBaseDefense:a_3962, newFieldGrid:a_3491) : void
      {
         var stInitialFieldGrid:a_3491 = null;
         if(stBaseDefense == null || stBaseDefense.stFieldGrid == null)
         {
            return;
         }
         var newStarDegree:int = stBaseDefense.a_1094;
         stBaseDefense.m_iDieType = 2;
         stBaseDefense.a_3969(stBaseDefense.iLifeValue);
         stBaseDefense.m_iPlaceTimeIntervals = a_1334.m_stCurrentBattbleFieldView.iTimeIntervalNum;
         var addResult:Boolean = newFieldGrid.CheckAddDefense(stBaseDefense);
         if(addResult)
         {
            stInitialFieldGrid = a_1334.m_stCurrentBattbleFieldView.a_3438(newFieldGrid.m_iXGridNo,newFieldGrid.m_iYGridNo);
            a_3962.a_1088.a_2059(stBaseDefense.m_iDefenseGlobalID,stBaseDefense.a_3512(),stInitialFieldGrid.m_iInitialXGridNo,stInitialFieldGrid.m_iInitialYGridNo,0,1,newStarDegree);
         }
      }
   }
}

