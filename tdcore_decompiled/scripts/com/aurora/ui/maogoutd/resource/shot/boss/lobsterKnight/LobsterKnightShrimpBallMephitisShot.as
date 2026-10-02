package com.aurora.ui.maogoutd.resource.shot.boss.lobsterKnight
{
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.avatar.a_3924;
   import com.aurora.ui.maogoutd.resource.shot.boss.BaseBossShot;
   import flash.display.FrameLabel;
   
   public class LobsterKnightShrimpBallMephitisShot extends BaseBossShot
   {
      
      private static const MOVE_SPEED:Number = 20;
      
      private static const RUN_STATE_BEGIN:int = 0;
      
      private static const RUN_STATE_FIRE:int = 1;
      
      private static const RUN_STATE_END:int = 2;
      
      private static var m_vShotInst:Vector.<LobsterKnightShrimpBallMephitisShot> = new Vector.<LobsterKnightShrimpBallMephitisShot>();
      
      private var m_iRunState:int;
      
      private var m_iRunTick:int;
      
      private var a_1334:a_3491;
      
      private var m_iCurFrameLabelIndex:int;
      
      public function LobsterKnightShrimpBallMephitisShot()
      {
         super();
      }
      
      public static function a_4344() : LobsterKnightShrimpBallMephitisShot
      {
         var stShot:LobsterKnightShrimpBallMephitisShot = m_vShotInst.pop();
         if(stShot == null)
         {
            stShot = new LobsterKnightShrimpBallMephitisShot();
         }
         BattleFieldView.a_1017.play();
         return stShot;
      }
      
      override protected function getBindMovie() : Class
      {
         return LobsterKnightShrimpBallMephitisShotMovie;
      }
      
      override protected function a_3940() : Boolean
      {
         super.a_3940();
         if(-1 == m_vShotInst.indexOf(this))
         {
            m_vShotInst.push(this);
         }
         return true;
      }
      
      override protected function InitData() : void
      {
         super.InitData();
         a_1279 = -width * 0.5;
         this.RunState = RUN_STATE_BEGIN;
      }
      
      public function set TargetGrid(stFieldGrid:a_3491) : void
      {
         this.a_1334 = stFieldGrid;
      }
      
      override protected function GotoAndStopFrame(iFrame:uint, bIsNeed:Boolean = true) : void
      {
         if(!bIsNeed && this.m_iCurFrameLabelIndex == iFrame)
         {
            return;
         }
         this.m_iCurFrameLabelIndex = iFrame;
         var iFrameLabelStartIndex:int = (a_1276[iFrame] as FrameLabel).frame;
         gotoAndStop(iFrameLabelStartIndex);
         a_3419();
      }
      
      override public function a_4216(iCurrentTime:int) : void
      {
         if(0 == a_1447)
         {
            a_1447 = iCurrentTime;
         }
         if(this.m_iRunTick > 0)
         {
            --this.m_iRunTick;
            if(a_1273 == a_1274 || null != a_1278 && (a_1276[this.m_iCurFrameLabelIndex] as FrameLabel).frame != a_1273)
            {
               this.GotoAndStopFrame(this.RunState);
            }
            else
            {
               nextFrame();
            }
         }
         else
         {
            ++this.RunState;
         }
         if(iCurrentTime % 3 == 0)
         {
            this.PlayFireSkill();
         }
      }
      
      private function PlayFireSkill() : void
      {
         this.a_3502(this.a_1334);
      }
      
      private function get RunState() : int
      {
         return this.m_iRunState;
      }
      
      private function set RunState(iState:int) : void
      {
         this.m_iRunState = iState;
         m_numXSpeed = m_numYSpeed = 0;
         m_isShotHighSkySpace = false;
         switch(iState)
         {
            case RUN_STATE_BEGIN:
               this.m_iRunTick = 7 - 1;
               break;
            case RUN_STATE_FIRE:
               this.m_iRunTick = 15 - 1;
               break;
            case RUN_STATE_END:
               this.m_iRunTick = 8 - 1;
               break;
            default:
               this.a_3940();
               return;
         }
         this.GotoAndStopFrame(this.RunState);
      }
      
      override protected function a_3502(stFieldGrid:a_3491, isCleanTray:Boolean = false) : Boolean
      {
         if(null == stFieldGrid)
         {
            return false;
         }
         m_isHited = !m_bIsInvincible;
         if(null != stFieldGrid.m_stProtector)
         {
            stFieldGrid.m_stProtector.m_iDieType = 1;
            stFieldGrid.m_stProtector.a_3969(10);
         }
         if(null != stFieldGrid.m_stAttackFighter && !(stFieldGrid.m_stAttackFighter is a_3924))
         {
            stFieldGrid.m_stAttackFighter.m_iDieType = 1;
            stFieldGrid.m_stAttackFighter.a_3969(10);
         }
         if(null != stFieldGrid.m_stBoomDefense)
         {
            stFieldGrid.m_stBoomDefense.m_iDieType = 1;
            stFieldGrid.m_stBoomDefense.a_3969(10);
         }
         if(null != stFieldGrid.m_stFlowerDefense)
         {
            stFieldGrid.m_stFlowerDefense.m_iDieType = 1;
            stFieldGrid.m_stFlowerDefense.a_3969(10);
         }
         if(null != stFieldGrid.m_stBaseAuxiliaryFighter)
         {
            stFieldGrid.m_stBaseAuxiliaryFighter.m_iDieType = 1;
            stFieldGrid.m_stBaseAuxiliaryFighter.a_3969(10);
         }
         stFieldGrid.DamageNewSlot(true,0,false,10,1);
         if(isCleanTray && null != stFieldGrid.m_stTrayDefense)
         {
            stFieldGrid.m_stTrayDefense.m_iDieType = 1;
            stFieldGrid.m_stTrayDefense.a_3969(10);
         }
         return true;
      }
   }
}

