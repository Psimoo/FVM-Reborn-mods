package com.aurora.ui.maogoutd.resource.gamemap.newMap.DragonYear.MemPackStore
{
   import a_4718.b_182;
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.avatar.a_3924;
   import com.aurora.ui.maogoutd.resource.defender.a_3962;
   import com.aurora.ui.maogoutd.resource.effect.a_4108;
   import flash.display.FrameLabel;
   
   public class DayMemPackRopeEffect extends a_4206
   {
      
      private var createTick:int = -1;
      
      public var m_stTargetGrid:a_3491;
      
      public var m_bFind:Boolean;
      
      public var m_stGameMap:IMemPackMap;
      
      public var m_bUseSkill:Boolean = false;
      
      public var FULL_HP:int;
      
      public var m_bHasUSE:Boolean = false;
      
      public var m_bGiveGift:Boolean = false;
      
      public function DayMemPackRopeEffect()
      {
         super();
      }
      
      public static function a_3926() : DayMemPackRopeEffect
      {
         return PoolManager.getInstance().CheckOutOne(DayMemPackRopeEffect) as DayMemPackRopeEffect;
      }
      
      override protected function getBindMovie() : Class
      {
         return DayMemPackRopeEffectMovie;
      }
      
      override public function a_1797(iGlobalMoveFighterID:int, iIntruderMoveDirection:int) : Boolean
      {
         super.a_1797(iGlobalMoveFighterID,iIntruderMoveDirection);
         a_1465 = 1;
         a_1350 = 0;
         if(iIntruderMoveDirection < 0)
         {
            a_1350 *= -1;
         }
         a_1339 = 999999;
         a_1279 = 0;
         m_iYDisplayCenterPos = -160;
         a_1272 = 0;
         SetCannotSeeByFighter(true);
         a_1481 = false;
         a_1464 = true;
         a_1463 = true;
         BoomIsReduceLife = true;
         return true;
      }
      
      public function InitFiled(stTargetGrid:a_3491, bFind:Boolean, gameMap:IMemPackMap, hp:int) : void
      {
         this.m_stTargetGrid = stTargetGrid;
         this.m_bFind = bFind;
         this.m_stGameMap = gameMap;
         this.m_bUseSkill = false;
         this.FULL_HP = hp;
         this.createTick = 0;
         this.m_bHasUSE = false;
         this.SetFrameIndex2(0,1);
         this.m_bGiveGift = false;
         this.play();
      }
      
      override protected function a_3940() : Boolean
      {
         var eggIntruder:DayMemPackEggIntruder = null;
         if(this.m_bGiveGift == true || m_iDieType == 1 && this.createTick >= 15)
         {
            eggIntruder = DayMemPackEggIntruder.a_3926();
            eggIntruder.InitData(this.FULL_HP,this.m_stGameMap);
            eggIntruder.a_1797((1 << 16) + 5000 + this.m_stTargetGrid.m_iYGridNo * 100 + this.m_stTargetGrid.m_iXGridNo,-1);
            eggIntruder.m_stMoveIntruderTypeID = 8389127;
            this.m_stTargetGrid.m_stCurrentBattbleFieldView.a_3459(eggIntruder,this.m_stTargetGrid,false,BattleLayerDefine.INTRUDER_LAND_TYPE);
            eggIntruder.x = this.m_stTargetGrid.m_iXGridNo * a_3491.a_1080;
            eggIntruder.y = this.m_stTargetGrid.m_iYGridNo * a_3491.a_1081;
         }
         this.m_bGiveGift = false;
         super.a_3940();
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
         if(a_1339 <= 0)
         {
            if(a_1275 != 3)
            {
               a_1275 = 3;
               gotoAndStop((a_1276[3] as FrameLabel).frame);
            }
            a_3419();
            if(m_stCurrentFieldGrid)
            {
               m_stCurrentFieldGrid.a_3457(this);
               m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3457(this);
            }
            this.play();
         }
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
      
      override public function a_4215(stBaseDefense:a_3962) : Boolean
      {
         return true;
      }
      
      override public function a_4216(iCurrentTime:int) : Boolean
      {
         var arrMoveIntruder:Array = null;
         var i:int = 0;
         var j:int = 0;
         ++this.createTick;
         nextFrame();
         if(a_1278 != null)
         {
            gotoAndStop((a_1276[a_1275] as FrameLabel).frame);
         }
         if(a_1273 == a_1274)
         {
            this.a_3940();
         }
         trace("-----[m_iCurrentFrame]-----:" + a_1273);
         if(this.m_bFind == false && a_1273 == 6)
         {
            this.m_bGiveGift = false;
            a_3969(iLifeValue);
            return true;
         }
         if(a_1273 >= 7 && a_1273 <= 12)
         {
            if(this.createTick > 15 && !this.m_bUseSkill)
            {
               arrMoveIntruder = this.m_stTargetGrid.a_1511.slice();
               for(i = 0; i < arrMoveIntruder.length; i++)
               {
                  if(arrMoveIntruder[i].m_stMoveIntruderTypeID != 8389127 && arrMoveIntruder[i].m_stMoveIntruderTypeID != 8389129 && arrMoveIntruder[i].m_stMoveIntruderTypeID != 8389128 && arrMoveIntruder[i].iSpaceState == 0 && !this.IsBOSS(arrMoveIntruder[i]) && Math.abs(x - arrMoveIntruder[i].x) < 10)
                  {
                     this.m_bUseSkill = true;
                     arrMoveIntruder[i].a_4208(b_182.enm_shotEffectXuanYun,20);
                     break;
                  }
               }
               if(null != this.m_stTargetGrid.m_stProtector)
               {
                  this.m_bUseSkill = true;
               }
               if(null != this.m_stTargetGrid.m_stAttackFighter && !(this.m_stTargetGrid.m_stAttackFighter is a_3924))
               {
                  this.m_bUseSkill = true;
               }
               if(null != this.m_stTargetGrid.m_stFlowerDefense)
               {
                  this.m_bUseSkill = true;
               }
               if(null != this.m_stTargetGrid.m_stBaseAuxiliaryFighter)
               {
                  this.m_bUseSkill = true;
               }
               if(null != this.m_stTargetGrid.m_stTrayDefense)
               {
                  this.m_bUseSkill = true;
               }
               if(this.m_bUseSkill == true)
               {
                  this.SetFrameIndex(2);
               }
            }
         }
         if((a_1273 == 14 || a_1273 == 15) && this.m_bHasUSE == false)
         {
            this.m_bHasUSE = true;
            this.a_3502(this.m_stTargetGrid);
            arrMoveIntruder = this.m_stTargetGrid.a_1511.slice();
            for(j = 0; j < arrMoveIntruder.length; j++)
            {
               if(arrMoveIntruder[j].m_stMoveIntruderTypeID != 8389127 && arrMoveIntruder[j].m_stMoveIntruderTypeID != 8389129 && arrMoveIntruder[j].m_stMoveIntruderTypeID != 8389128 && arrMoveIntruder[j].iSpaceState == 0 && !this.IsBOSS(arrMoveIntruder[j]))
               {
                  arrMoveIntruder[j].a_3432();
                  break;
               }
            }
            this.m_bGiveGift = true;
            a_3969(iLifeValue);
         }
         return true;
      }
      
      override public function play() : void
      {
         super.play();
      }
      
      public function IsBOSS(stMoveIntruder:a_4206) : Boolean
      {
         return stMoveIntruder.IsBossIntruder;
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

