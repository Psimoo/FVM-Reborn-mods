package com.aurora.ui.maogoutd.resource.Intruder.DragonYear.BuildNestMouse
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.avatar.a_3924;
   import com.aurora.ui.maogoutd.resource.defender.a_3962;
   import com.aurora.ui.maogoutd.resource.effect.AddBloodEffect;
   import flash.display.FrameLabel;
   import flash.utils.Dictionary;
   import flash.utils.clearTimeout;
   import flash.utils.setTimeout;
   
   public class TentMouseMoveIntruder extends a_4206
   {
      
      private const FULL_HP:int = 10000;
      
      private const HURT_HP:int = 2000;
      
      private const DEAD_HP:int = 0;
      
      private var m_hideMouseDic:Dictionary = new Dictionary();
      
      private var m_bIsBornSkill:Boolean;
      
      private var m_bIsHaseMouse:Boolean;
      
      public function TentMouseMoveIntruder()
      {
         super();
         a_1279 = 0;
         a_1467 = -54;
      }
      
      public static function a_3926() : a_4206
      {
         return PoolManager.getInstance().CheckOutOne(TentMouseMoveIntruder) as TentMouseMoveIntruder;
      }
      
      override protected function getBindMovie() : Class
      {
         return TentMouseMoveIntruderMovie;
      }
      
      override public function a_1797(iGlobalMoveFighterID:int, iIntruderMoveDirection:int) : Boolean
      {
         super.a_1797(iGlobalMoveFighterID,iIntruderMoveDirection);
         a_1350 = 0;
         if(iIntruderMoveDirection < 0)
         {
            a_1350 *= -1;
         }
         a_1339 = this.FULL_HP;
         a_1462 = true;
         a_1463 = true;
         this.m_bIsBornSkill = true;
         a_1481 = false;
         this.m_bIsHaseMouse = false;
         a_1465 = 1;
         return true;
      }
      
      override public function a_3969(iRduceLifeValue:int) : Boolean
      {
         super.a_3969(iRduceLifeValue);
         return true;
      }
      
      override public function a_4210() : Boolean
      {
         if(m_stCurrentFieldGrid)
         {
            m_stCurrentFieldGrid.a_3457(this);
            m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3457(this);
         }
         super.a_4210();
         return true;
      }
      
      override public function a_4215(stBaseDefense:a_3962) : Boolean
      {
         super.a_4215(stBaseDefense);
         return true;
      }
      
      override protected function ResetMovieStatus() : Boolean
      {
         if(a_1339 > this.HURT_HP)
         {
            if(!this.m_bIsBornSkill)
            {
               if(!this.m_bIsHaseMouse)
               {
                  if(a_1275 != 2)
                  {
                     a_1275 = 2;
                     gotoAndStop((a_1276[2] as FrameLabel).frame);
                  }
               }
               else if(a_1275 != 3)
               {
                  a_1275 = 3;
                  gotoAndStop((a_1276[3] as FrameLabel).frame);
               }
            }
            a_3419();
         }
         else if(a_1339 > this.DEAD_HP)
         {
            if(!this.m_bIsBornSkill)
            {
               if(!this.m_bIsHaseMouse)
               {
                  if(a_1275 != 4)
                  {
                     a_1275 = 4;
                     gotoAndStop((a_1276[4] as FrameLabel).frame);
                  }
               }
               else if(a_1275 != 5)
               {
                  a_1275 = 5;
                  gotoAndStop((a_1276[5] as FrameLabel).frame);
               }
            }
            a_3419();
         }
         else
         {
            a_1275 = 6;
            gotoAndStop((a_1276[6] as FrameLabel).frame);
            a_3419();
            if(m_stCurrentFieldGrid)
            {
               m_stCurrentFieldGrid.a_3457(this);
               m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3457(this);
            }
            play();
         }
         return true;
      }
      
      override public function a_4216(iCurrentTime:int) : Boolean
      {
         var stMoveIntruder:a_4206 = null;
         var stTargetFieldGrid:a_3491 = null;
         if(!a_1460)
         {
            a_1460 = true;
            this.m_bIsBornSkill = true;
            a_1275 = 2;
            gotoAndStop((a_1276[0] as FrameLabel).frame);
         }
         if(iCurrentTime % 2 == 0)
         {
            if(a_1273 == 3 || a_1273 == 13)
            {
               if(m_stCurrentFieldGrid.m_iFieldGridType != 0 || null != m_stCurrentFieldGrid.m_stAttackFighter && m_stCurrentFieldGrid.m_stAttackFighter is a_3924)
               {
                  this.m_bIsBornSkill = false;
                  this.a_3940();
               }
            }
            else if(a_1273 == 4 || a_1273 == 14)
            {
               this.addShield(m_stCurrentFieldGrid);
            }
            else if(a_1273 == 10 || a_1273 == 20)
            {
               this.m_bIsBornSkill = false;
            }
         }
         if(m_stCurrentFieldGrid == null || this.m_bIsBornSkill)
         {
            return false;
         }
         var arrMoveIntruder:Array = m_stCurrentFieldGrid.a_1511.slice();
         for each(stMoveIntruder in arrMoveIntruder)
         {
            stTargetFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(stMoveIntruder.m_stCurrentFieldGrid.m_iXGridNo - 1,m_stCurrentFieldGrid.m_iYGridNo);
            if(stTargetFieldGrid != null && stMoveIntruder != this && stMoveIntruder.m_stCurrentFieldGrid.m_isNeedTray == stTargetFieldGrid.m_isNeedTray)
            {
               if(stTargetFieldGrid != null && stMoveIntruder != this && stMoveIntruder.m_stCurrentFieldGrid.m_isNeedTray == stTargetFieldGrid.m_isNeedTray)
               {
                  this.ChageMouseY(stMoveIntruder);
               }
            }
         }
         return true;
      }
      
      private function ChageMouseY(stMoveIntruder:a_4206) : Boolean
      {
         var stTargetFieldGrid:a_3491 = null;
         var arrBaseMoveIntruderVector:Array = null;
         var a_1596:int = 0;
         var gobackGrid:int = 0;
         if(stMoveIntruder.iSpaceState == 1 || stMoveIntruder.iSpaceState == 3)
         {
            return false;
         }
         if(!stMoveIntruder.isFearCatHead || stMoveIntruder.IsBossIntruder)
         {
            return false;
         }
         if(8389124 == stMoveIntruder.m_stMoveIntruderTypeID)
         {
            stMoveIntruder.a_3432();
            return false;
         }
         if(Boolean(stMoveIntruder) && stMoveIntruder.iLifeValue > 0)
         {
            stTargetFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(m_stCurrentFieldGrid.m_iXGridNo - 1,m_stCurrentFieldGrid.m_iYGridNo);
            m_stCurrentFieldGrid.a_3457(stMoveIntruder);
            m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3457(stMoveIntruder);
            arrBaseMoveIntruderVector = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.m_arrBaseMoveIntruderVector;
            if(-1 == arrBaseMoveIntruderVector.indexOf(stMoveIntruder))
            {
               return false;
            }
            if(-1 != arrBaseMoveIntruderVector.indexOf(stMoveIntruder))
            {
               arrBaseMoveIntruderVector.splice(arrBaseMoveIntruderVector.indexOf(stMoveIntruder),1);
            }
            stMoveIntruder.visible = false;
            stMoveIntruder.m_lifeValueTxt.visible = false;
            stMoveIntruder.HideSkill(false);
            stMoveIntruder.ResetEffect();
            gobackGrid = stTargetFieldGrid.m_iXGridNo - stMoveIntruder.m_stCurrentFieldGrid.m_iXGridNo;
            BattleFieldView.a_1021.play();
            this.m_bIsHaseMouse = true;
            this.ResetMovieStatus();
            a_1596 = int(setTimeout(this.OnMouseScareTimeout,6000,m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3459,stMoveIntruder,stTargetFieldGrid,gobackGrid));
            this.m_hideMouseDic[stMoveIntruder] = a_1596;
            trace("吞噬老鼠:>>>" + a_1596);
         }
         return true;
      }
      
      private function OnMouseScareTimeout(stFunction:Function, stMoveIntruder:a_4206, stTempFieldGrid:a_3491, gobackGrid:int) : void
      {
         var stAddBloodEffect:AddBloodEffect = null;
         var key:* = undefined;
         if(this.m_hideMouseDic[stMoveIntruder] > 0)
         {
            trace("闪现老鼠:>>>" + this.m_hideMouseDic[stMoveIntruder]);
            this.m_hideMouseDic[stMoveIntruder] = null;
            delete this.m_hideMouseDic[stMoveIntruder];
         }
         stMoveIntruder.x += gobackGrid * a_3491.a_1080 - stMoveIntruder.width * 0.5;
         stMoveIntruder.visible = true;
         stMoveIntruder.m_lifeValueTxt.visible = true;
         stAddBloodEffect = AddBloodEffect.a_3926();
         stAddBloodEffect.a_1797(false);
         stAddBloodEffect.x = stMoveIntruder.x;
         stAddBloodEffect.y = stMoveIntruder.y;
         m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(stAddBloodEffect,BattleLayerDefine.EFFECTS_TOP_TYPE);
         stMoveIntruder.a_3969(-600);
         stFunction(stMoveIntruder,stTempFieldGrid,false);
         this.m_bIsHaseMouse = false;
         for(key in this.m_hideMouseDic)
         {
            if(this.m_hideMouseDic[key] > 0)
            {
               this.m_bIsHaseMouse = true;
               break;
            }
         }
         this.ResetMovieStatus();
      }
      
      protected function addShield(stFieldGrid:a_3491) : Boolean
      {
         if(stFieldGrid != null && 0 == stFieldGrid.m_iFieldGridType)
         {
            stFieldGrid.m_iFieldGridType = 8;
            if(null == stFieldGrid.m_stTentMouse)
            {
               stFieldGrid.m_stTentMouse = this;
               stFieldGrid.m_isLockBuildMouse = false;
            }
         }
         this.a_3502(stFieldGrid);
         return true;
      }
      
      protected function a_3502(stFieldGrid:a_3491) : Boolean
      {
         if(null == stFieldGrid)
         {
            return false;
         }
         return stFieldGrid.ClearFieldGridDefenseWithOption();
      }
      
      protected function ClearShield(stFieldGrid:a_3491) : Boolean
      {
         if(stFieldGrid != null && stFieldGrid.m_iFieldGridType == 8)
         {
            stFieldGrid.m_iFieldGridType = 0;
            if(null != stFieldGrid.m_stTentMouse)
            {
               stFieldGrid.m_stTentMouse.a_3432();
               stFieldGrid.m_stTentMouse = null;
            }
         }
         return true;
      }
      
      override public function a_4212() : Boolean
      {
         return true;
      }
      
      override public function a_4213() : Boolean
      {
         a_1339 = 0;
         if(m_stCurrentFieldGrid)
         {
            m_stCurrentFieldGrid.a_3457(this);
            m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3457(this);
         }
         this.a_3940();
         return true;
      }
      
      public function getFrameLables() : Array
      {
         return a_1276;
      }
      
      override protected function a_3940() : Boolean
      {
         var key:* = undefined;
         this.ClearShield(m_stCurrentFieldGrid);
         for(key in this.m_hideMouseDic)
         {
            if(key != null && this.m_hideMouseDic[key] > 0)
            {
               key.m_iDieType = 2;
               key.a_3432();
               clearTimeout(this.m_hideMouseDic[key]);
            }
            this.m_hideMouseDic[key] = null;
            delete this.m_hideMouseDic[key];
         }
         super.a_3940();
         return true;
      }
   }
}

