package com.aurora.ui.maogoutd.resource.gamemap.newMap.SnakeYear.FallenEden
{
   import a_4718.b_183;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.effect.a_4108;
   import com.aurora.ui.maogoutd.resource.shot.a_4348;
   import flash.display.FrameLabel;
   import flash.events.Event;
   
   public class FallenEdenHolyBaseGrailEffect extends a_4108
   {
      
      public var stFieldGrid:a_3491;
      
      private var leaveTime:int = 0;
      
      protected var damageMAX:int = 10000;
      
      private var m_arrTempArr:Array = new Array();
      
      private var baseRate:Number = 0;
      
      private var addCount:Number = 0;
      
      public function FallenEdenHolyBaseGrailEffect()
      {
         super();
      }
      
      override public function a_1797(isReseaved:Boolean) : Boolean
      {
         super.a_1797(isReseaved);
         PlayAnimation(0);
         this.leaveTime = 0;
         a_1279 = -35;
         m_iYDisplayCenterPos = -33;
         this.stFieldGrid.tagCom.AddTag(21);
         this.baseRate = 0;
         this.addCount = 0;
         return true;
      }
      
      override protected function a_4109(a_4730:Event) : void
      {
         if(null == this.stFieldGrid)
         {
            return;
         }
         nextFrame();
         if(a_1278 != null)
         {
            gotoAndStop((a_1276[a_1275] as FrameLabel).frame);
         }
         if(this.leaveTime > 0)
         {
            --this.leaveTime;
            if(this.leaveTime == 10 * 10)
            {
               this.AddEffect(FallenEdenNearExtinguishTextEffect.a_3926(),-6);
            }
            if(this.leaveTime <= 0)
            {
               this.ExitFire();
            }
         }
         this.BarrierClearShot(this.stFieldGrid.m_iXGridNo,this.stFieldGrid.m_iYGridNo);
         if(this.stFieldGrid.m_stBaseAuxiliaryFighter != null && BattleFieldView.m_lAuxCard.indexOf(this.stFieldGrid.m_stBaseAuxiliaryFighter.a_3512()) != -1)
         {
            this.BurnFire(this.stFieldGrid.m_stBaseAuxiliaryFighter.numHotMultiplier);
            this.stFieldGrid.m_stBaseAuxiliaryFighter.m_iDieType = 2;
            this.stFieldGrid.m_stBaseAuxiliaryFighter.a_3969(this.stFieldGrid.m_stBaseAuxiliaryFighter.iLifeValue);
         }
         this.stFieldGrid.DamageNewSlot(true,0,true,0,2);
      }
      
      public function BarrierClearShot(iNoX:int, iNoY:int) : void
      {
         var stBaseShot:a_4348 = null;
         var shot1:a_4348 = null;
         var i:int = 0;
         var addDamage:int = 0;
         var damage:Number = NaN;
         var shot:GoldFireTowerShot = null;
         var shotArr:Array = this.stFieldGrid.m_stCurrentBattbleFieldView.m_stBaseShotVector;
         this.m_arrTempArr.length = 0;
         for each(shot1 in shotArr[iNoY])
         {
            this.m_arrTempArr.push(shot1);
         }
         for(i = 0; i < this.m_arrTempArr.length; i++)
         {
            stBaseShot = this.m_arrTempArr[i];
            if(stBaseShot.GetShotTypeID() != b_183.enm_FireGrailShot)
            {
               if(stBaseShot.x > a_3491.a_1080 * (iNoX - 0.5) && stBaseShot.x < a_3491.a_1080 * (iNoX + 1.3) && (stBaseShot.y > a_3491.a_1081 * (iNoY - 0.5) && stBaseShot.y < a_3491.a_1081 * (iNoY + 1.5)))
               {
                  if(stBaseShot.tagCom.HasTag(30))
                  {
                     stBaseShot.a_4350();
                  }
                  else if(this.leaveTime > 0 && (!stBaseShot.isParabolaPath && stBaseShot.getCanAddAuxiliary() && stBaseShot.GetCanCrossFireAuxiliary() || stBaseShot.GetShotTypeID() == b_183.enm_HighFireShot || stBaseShot.GetShotTypeID() == b_183.b_189))
                  {
                     if(stBaseShot.m_bActive.Value == true && stBaseShot.visible == true)
                     {
                        addDamage = Math.min(this.addCount * 1000,this.damageMAX);
                        damage = stBaseShot.iHurtPower2 * this.baseRate + addDamage;
                        shot = GoldFireTowerShot.a_4344();
                        shot.damage = damage;
                        stBaseShot.addFireShot2(shot,this.stFieldGrid);
                     }
                  }
                  else if(!stBaseShot.isParabolaPath && !stBaseShot.m_FollowingShot() && !stBaseShot.m_isShotHighSkySpace)
                  {
                     stBaseShot.a_4350();
                  }
               }
            }
         }
      }
      
      private function AddEffect(stEffect:a_4108, offset:int = 0) : void
      {
         stEffect.a_1797(a_1283);
         this.stFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(stEffect,BattleLayerDefine.SHOT_TYPE,this.stFieldGrid);
         this.stFieldGrid.m_stCurrentBattbleFieldView.m_arrEffectArray.push(stEffect);
         stEffect.x = this.stFieldGrid.m_iXGridNo * a_3491.a_1080 + offset;
         stEffect.y = this.stFieldGrid.m_iYGridNo * a_3491.a_1081 + 15;
      }
      
      private function BurnFire(addRate:Number) : void
      {
         if(this.leaveTime <= 0)
         {
            ShowPlayAnimation(1,2);
            this.baseRate = addRate;
         }
         else
         {
            if(this.addCount * 1000 >= this.damageMAX)
            {
               this.AddEffect(FallenEdenMaxLimitTextEffect.a_3926());
            }
            else
            {
               this.AddEffect(FallenEdenDamageUpTextEffect.a_3926(),-6);
            }
            this.addCount += addRate;
         }
         this.leaveTime = 30 * 10;
         this.stFieldGrid.tagCom.AddTag(20);
         this.stFieldGrid.m_iFieldGridType = 8;
      }
      
      private function ExitFire() : void
      {
         ShowPlayAnimation(3,0);
         this.leaveTime = 0;
         this.baseRate = 0;
         this.addCount = 0;
         this.stFieldGrid.tagCom.RemoveTag(20);
         this.stFieldGrid.m_iFieldGridType = 1;
      }
      
      override public function a_3940() : Boolean
      {
         this.stFieldGrid.tagCom.RemoveTag(21);
         super.a_3940();
         return true;
      }
   }
}

