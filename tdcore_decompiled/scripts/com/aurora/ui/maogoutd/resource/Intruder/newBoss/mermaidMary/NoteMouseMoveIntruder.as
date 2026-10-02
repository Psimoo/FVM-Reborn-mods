package com.aurora.ui.maogoutd.resource.Intruder.newBoss.mermaidMary
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.BaseMoveIntruderRepaired;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.defender.a_3962;
   import com.aurora.ui.maogoutd.resource.effect.a_4108;
   import flash.utils.Dictionary;
   
   public class NoteMouseMoveIntruder extends BaseMoveIntruderRepaired
   {
      
      private static var m_vMouseInst:Vector.<NoteMouseMoveIntruder> = new Vector.<NoteMouseMoveIntruder>();
      
      private var m_bIsCanDead:Boolean;
      
      private var m_dicSleptAttackFighter:Dictionary;
      
      public function NoteMouseMoveIntruder()
      {
         super();
         this.m_bIsCanDead = false;
      }
      
      public static function a_3926() : a_4206
      {
         return PoolManager.getInstance().CheckOutOne(NoteMouseMoveIntruder) as NoteMouseMoveIntruder;
      }
      
      override protected function getBindMovie() : Class
      {
         return NoteMouseMoveIntruderMovie;
      }
      
      override protected function a_3940() : Boolean
      {
         super.a_3940();
         if(-1 == m_vMouseInst.indexOf(this))
         {
            this.m_bIsCanDead = false;
         }
         return true;
      }
      
      override public function get width() : Number
      {
         return 240;
      }
      
      override public function get height() : Number
      {
         return 50;
      }
      
      override public function a_1797(iGlobalMoveFighterID:int, iIntruderMoveDirection:int) : Boolean
      {
         super.a_1797(iGlobalMoveFighterID,iIntruderMoveDirection);
         a_1350 = a_3491.a_1080 / 10;
         if(iIntruderMoveDirection < 0)
         {
            a_1350 *= -1;
         }
         a_1339 = 500;
         a_1279 = 0;
         SetCannotSeeByFighter(true);
         a_1463 = true;
         a_1464 = true;
         return true;
      }
      
      public function SetSleptAttackFighterDictionary(dic:Dictionary) : void
      {
         this.m_dicSleptAttackFighter = dic;
      }
      
      override public function a_4216(iCurrentTime:int) : Boolean
      {
         super.a_4216(iCurrentTime);
         if(Boolean(m_stCurrentFieldGrid) && m_stCurrentFieldGrid.m_iXGridNo == BattleFieldView.a_1011 - 1)
         {
            this.m_bIsCanDead = true;
            this.a_3969(a_1339);
            this.m_bIsCanDead = false;
         }
         var iNeedSleepTime:int = 8;
         var iStartSleepTickNum:int = -1;
         if(Boolean(m_stCurrentFieldGrid) && Boolean(null != m_stCurrentFieldGrid.m_stAttackFighter) && this.m_dicSleptAttackFighter[m_stCurrentFieldGrid.m_stAttackFighter] != null)
         {
            iStartSleepTickNum = int(this.m_dicSleptAttackFighter[m_stCurrentFieldGrid.m_stAttackFighter][0]);
         }
         var iSleepTickNum:int = iCurrentTime - iStartSleepTickNum;
         var iSleepTime:int = iSleepTickNum / 20;
         if(iStartSleepTickNum == -1)
         {
            iSleepTime = -1;
         }
         if(Boolean(m_stCurrentFieldGrid) && null != m_stCurrentFieldGrid.m_stAttackFighter)
         {
            m_stCurrentFieldGrid.m_stAttackFighter.SleepTime2(15 * 20);
         }
         return true;
      }
      
      override public function nextFrame() : void
      {
         super.nextFrame();
         if(a_1278 != null || a_1273 == a_1274)
         {
            gotoAndStop(1);
         }
      }
      
      override public function a_3969(iRduceLifeValue:int) : Boolean
      {
         if(!this.m_bIsCanDead)
         {
            return false;
         }
         super.a_3969(iRduceLifeValue);
         return true;
      }
      
      override public function a_4210() : Boolean
      {
         return true;
      }
      
      override public function a_4208(iEffectType:int, iEffectTime:int, stBaseEffect:a_4108 = null) : void
      {
      }
      
      override public function a_4209(iRduceLifeValue:int) : Boolean
      {
         return false;
      }
      
      override public function a_4215(stBaseDefense:a_3962) : Boolean
      {
         return true;
      }
   }
}

