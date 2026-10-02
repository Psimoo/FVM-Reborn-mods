package com.aurora.ui.maogoutd.resource.shot.ThornRoseShield
{
   import a_4718.b_180;
   import a_4728.a_1778;
   import a_4729.a_1789;
   import a_4781.TimeoutManager;
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.Util.BattleEffectUtil;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.defender.a_3971;
   import com.aurora.ui.maogoutd.resource.effect.base.BaseOriginEffect;
   import com.aurora.ui.maogoutd.resource.energy.a_4157;
   import com.aurora.ui.maogoutd.resource.energy.a_4162;
   import com.aurora.ui.maogoutd.resource.skill.BaseSkill;
   import flash.events.MouseEvent;
   
   public class CunningDisguiseSkill extends BaseSkill
   {
      
      private var m_iAttackRange:int = 0;
      
      private var m_iAttackyOffect:int = 0;
      
      private var m_iAppearedTime:int = 0;
      
      private var m_isSkillUsed:Boolean = false;
      
      public var m_HitMouseArray:Array = new Array();
      
      private var stFieldGrid:a_3491;
      
      private var m_BomPro:Number;
      
      private var m_stSkillEffect:BaseOriginEffect;
      
      public function CunningDisguiseSkill()
      {
         super();
      }
      
      public static function a_3926() : CunningDisguiseSkill
      {
         return PoolManager.getInstance().CheckOutOne(CunningDisguiseSkill) as CunningDisguiseSkill;
      }
      
      override public function a_4330() : void
      {
         this.ClearSkillEffect();
         a_1789.getInstance().removeEventListener("DefenseCardCountChange",this.a_3483);
         while(this.m_HitMouseArray.length > 0)
         {
            this.m_HitMouseArray.pop();
         }
         super.a_4330();
      }
      
      private function ClearSkillEffect() : void
      {
         if(null != this.m_stSkillEffect)
         {
            if(m_stBattleFieldView.GetGameMoveMap())
            {
               m_stBattleFieldView.GetGameMoveMap().RemoveMoveDisplayObject(this.m_stSkillEffect);
            }
            this.m_stSkillEffect.a_3940();
            this.m_stSkillEffect = null;
         }
      }
      
      override public function a_1797() : void
      {
         super.a_1797();
         m_uiSkillCoolingTime = 50;
         this.m_isSkillUsed = false;
         if(m_stBaseAvatar != null && this.stFieldGrid != m_stBaseAvatar.stFieldGrid)
         {
            this.stFieldGrid = m_stBaseAvatar.stFieldGrid;
            this.ClearSkillEffect();
            while(this.m_HitMouseArray.length > 0)
            {
               this.m_HitMouseArray.pop();
            }
         }
      }
      
      override public function OnTimeInterval(iTimeNum:uint) : void
      {
         super.OnTimeInterval(iTimeNum);
         if(!this.m_isSkillUsed)
         {
            if(Boolean(m_stBaseAvatar) && Boolean(m_stBaseAvatar.stFieldGrid))
            {
               this.m_isSkillUsed = true;
               this.m_BomPro = this.GetBoomEnergyProbValue();
               if(a_1789.getInstance().hasEventListener("DefenseCardCountChange"))
               {
                  a_1789.getInstance().removeEventListener("DefenseCardCountChange",this.a_3483);
               }
               a_1789.getInstance().addEventListener("DefenseCardCountChange",this.a_3483);
            }
         }
         if(null == this.m_stSkillEffect && iTimeNum >= 20 && AvatarIsOk)
         {
            this.m_iAppearedTime = iTimeNum;
            this.RealeaseSkillEffect();
         }
         if((iTimeNum - this.m_iAppearedTime) % GetSkillCoolingTime() == 0 && AvatarIsOk && null != m_stBattleFieldView && this.m_stSkillEffect != null)
         {
            this.RealeaseSkillAttack();
         }
      }
      
      private function RealeaseSkillEffect() : void
      {
         var stFieldGrid:a_3491 = m_stBaseAvatar.stFieldGrid;
         if(this.m_stSkillEffect == null && stFieldGrid != null)
         {
            if(m_iSkillDegree <= 8)
            {
               this.m_stSkillEffect = BattleEffectUtil.CreateOriginEffect(null,CunningDisguiseOneSkillEffectMovie,stFieldGrid);
               this.m_iAttackRange = 1;
               this.m_iAttackyOffect = 0;
            }
            else if(m_iSkillDegree <= 13)
            {
               this.m_stSkillEffect = BattleEffectUtil.CreateOriginEffect(null,CunningDisguiseTwoSkillEffectMovie,stFieldGrid);
               this.m_iAttackRange = 2;
               this.m_iAttackyOffect = 0;
            }
            else if(m_iSkillDegree <= 15)
            {
               this.m_stSkillEffect = BattleEffectUtil.CreateOriginEffect(null,CunningDisguiseThreeSkillEffectMovie,stFieldGrid);
               this.m_iAttackRange = 2;
               this.m_iAttackyOffect = 1;
            }
            if(this.m_stSkillEffect)
            {
               this.m_stSkillEffect.SetReversed(!m_stBattleFieldView.isOwnBattleField);
               this.m_stSkillEffect.SetAnimation(0);
               if(m_stBattleFieldView.GetGameMoveMap())
               {
                  m_stBattleFieldView.GetGameMoveMap().AddMoveDisplayObject(this.m_stSkillEffect,stFieldGrid.m_iXGridNo,stFieldGrid.m_iYGridNo);
               }
            }
         }
      }
      
      private function RealeaseSkillAttack() : void
      {
         var iYGridNo:int = 0;
         var arrMoveIntruder:Array = null;
         var stBaseMoveIntruder:a_4206 = null;
         var iReduceLife:int = 0;
         var BleedDamage:int = 0;
         var power:int = 0;
         var iCellEnergyValue:int = 0;
         var stFieldGrid:a_3491 = m_stBaseAvatar.stFieldGrid;
         var iStartXGridNo:int = Math.max(stFieldGrid.m_iXGridNo - this.m_iAttackRange,0);
         var iStartYGridNo:int = Math.max(stFieldGrid.m_iYGridNo - this.m_iAttackRange - this.m_iAttackyOffect,0);
         var iEndXGridNo:int = Math.min(stFieldGrid.m_iXGridNo + this.m_iAttackRange,BattleFieldView.a_1011 - 1);
         var iEndYGridNo:int = Math.min(stFieldGrid.m_iYGridNo + this.m_iAttackRange + this.m_iAttackyOffect,BattleFieldView.a_1012 - 1);
         var stFieldGridsVector:Array = m_stBattleFieldView.stFieldGridsVector;
         for(var iXGridNo:int = iStartXGridNo; iXGridNo <= iEndXGridNo; iXGridNo++)
         {
            for(iYGridNo = iStartYGridNo; iYGridNo <= iEndYGridNo; iYGridNo++)
            {
               arrMoveIntruder = stFieldGridsVector[iYGridNo][iXGridNo].a_1511.slice();
               for each(stBaseMoveIntruder in arrMoveIntruder)
               {
                  if(stBaseMoveIntruder.iLifeValue > 0)
                  {
                     iReduceLife = 0;
                     if(this.m_HitMouseArray.indexOf(stBaseMoveIntruder) == -1)
                     {
                        iReduceLife = this.GetSkillReduceLifeValue();
                        this.m_HitMouseArray.push(stBaseMoveIntruder);
                     }
                     BleedDamage = this.GetSkillBleedDamageRateValue(stBaseMoveIntruder.iLifeValue);
                     power = 0;
                     if(m_iSkillDegree <= 10)
                     {
                        power = Math.min(3500,BleedDamage) + iReduceLife;
                     }
                     else if(m_iSkillDegree <= 14)
                     {
                        power = Math.min(4000,BleedDamage) + iReduceLife;
                     }
                     else
                     {
                        power = Math.min(9000,BleedDamage) + iReduceLife;
                     }
                     if(stBaseMoveIntruder.iLifeValue - power <= 0)
                     {
                        stBaseMoveIntruder.PowerfulBombReduceLifeRate(power / 900,true);
                     }
                     else
                     {
                        stBaseMoveIntruder.a_4209(power);
                     }
                     if(stBaseMoveIntruder.iLifeValue <= 0)
                     {
                        iCellEnergyValue = this.GetDieEnergyValue();
                        this.ProdudeEnergy(iCellEnergyValue,stBaseMoveIntruder.x,stBaseMoveIntruder.y,0);
                     }
                     else if(power > 0)
                     {
                        this.addHitEffect(stBaseMoveIntruder);
                     }
                  }
               }
            }
         }
      }
      
      private function addHitEffect(baseMoveIntruder:a_4206) : void
      {
         var buff:ThornRoseShieldHitEffect = null;
         if(!baseMoveIntruder.m_stCurrentFieldGrid || baseMoveIntruder.iLifeValue <= 0 || baseMoveIntruder.parent == null)
         {
            return;
         }
         buff = ThornRoseShieldHitEffect.a_3926();
         buff.a_1797(baseMoveIntruder.IsReversed());
         buff.x = baseMoveIntruder.x + 0.5 * baseMoveIntruder.width + baseMoveIntruder.stDisplayBitmap.x;
         buff.y = baseMoveIntruder.y + 0.5 * baseMoveIntruder.height + baseMoveIntruder.stDisplayBitmap.y;
         baseMoveIntruder.m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(buff,BattleLayerDefine.EFFECTS_TOP_TYPE,baseMoveIntruder.m_stCurrentFieldGrid);
      }
      
      override public function UseSkill(iRandomNum:int) : void
      {
         super.UseSkill(iRandomNum);
      }
      
      override public function GetSkillCostCoolingTime() : uint
      {
         return 0;
      }
      
      private function a_3483(stDataEvent:a_1778) : void
      {
         var tempFieldGrid:a_3491 = null;
         var cardID:int = 0;
         var stBaseDefense:a_3971 = null;
         var randomNum:int = 0;
         if(this.stFieldGrid == null || stDataEvent.dataObject.length <= 3)
         {
            return;
         }
         if(stDataEvent.dataObject[3].hasOwnProperty("m_LockedBySkill"))
         {
            tempFieldGrid = this.stFieldGrid.m_stCurrentBattbleFieldView.a_3438(stDataEvent.dataObject[2].m_iXGridNo,stDataEvent.dataObject[2].m_iYGridNo);
            if(tempFieldGrid != null && tempFieldGrid.m_stFlowerDefense != null)
            {
               cardID = tempFieldGrid.m_stFlowerDefense.a_3512();
               if(cardID == 286855534 || cardID == 286855520)
               {
                  return;
               }
               stBaseDefense = tempFieldGrid.m_stFlowerDefense;
               if(stBaseDefense.m_bServerIssued && this.CheckIsInRange(this.stFieldGrid,stBaseDefense.stFieldGrid,1) && !stBaseDefense.m_LockedBySkill)
               {
                  randomNum = BattleFieldView.m_stRandomSeed.nextInt(100) + 1;
                  if(randomNum <= this.m_BomPro)
                  {
                     stBaseDefense.m_LockedBySkill = true;
                     TimeoutManager.getInstance().addTimeout(stBaseDefense.m_iDefenseGlobalID.toString(),5 * 1000,this.BoomEnergy,stBaseDefense);
                  }
               }
            }
         }
      }
      
      private function BoomEnergy(stBaseDefense:a_3971) : void
      {
         var iCellEnergyValue:int = 0;
         if(stBaseDefense.stFieldGrid != null && stBaseDefense.m_bServerIssued)
         {
            stBaseDefense.a_3969(stBaseDefense.iLifeValue);
            TimeoutManager.getInstance().removeTimeout(stBaseDefense.m_iDefenseGlobalID.toString());
            this.ProdudeEnergy(stBaseDefense.iDefensePrice,stBaseDefense.x,stBaseDefense.y,0,true);
            iCellEnergyValue = this.GetBoomEnergyValue();
            this.ProdudeEnergy(iCellEnergyValue,stBaseDefense.x,stBaseDefense.y,-10);
            this.ProdudeEnergy(iCellEnergyValue,stBaseDefense.x,stBaseDefense.y,10);
         }
      }
      
      private function ProdudeEnergy(iCellEnergyValue:int, PosX:int, PosY:int, offextX:int, isCapture:Boolean = false) : void
      {
         var stFreeEnergy:a_4157 = a_4162.getInstance().a_4163(b_180.a_420);
         if(null != stFreeEnergy)
         {
            stFreeEnergy.m_stCurrentBattleField = this.stFieldGrid.m_stCurrentBattbleFieldView;
            stFreeEnergy.a_1797(0,iCellEnergyValue,PosX + offextX,PosY);
            this.stFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(stFreeEnergy,BattleLayerDefine.EFFECTS_TOP_TYPE);
            if(isCapture)
            {
               stFreeEnergy.dispatchEvent(new MouseEvent(MouseEvent.MOUSE_OVER));
            }
         }
      }
      
      private function CheckIsInRange(checkFieldGrid:a_3491, targetFieldGrid:Object, range:int) : Boolean
      {
         if(checkFieldGrid != null && targetFieldGrid != null)
         {
            if(checkFieldGrid.m_iXGridNo > targetFieldGrid.m_iXGridNo + range || checkFieldGrid.m_iXGridNo < targetFieldGrid.m_iXGridNo - range || checkFieldGrid.m_iYGridNo > targetFieldGrid.m_iYGridNo + range || checkFieldGrid.m_iYGridNo < targetFieldGrid.m_iYGridNo - range)
            {
               return false;
            }
         }
         return true;
      }
      
      protected function GetSkillReduceLifeValue() : Number
      {
         var numEffectValue:Number = 0;
         switch(m_iSkillDegree)
         {
            case 0:
               numEffectValue = 3500;
               break;
            case 1:
               numEffectValue = 3500;
               break;
            case 2:
               numEffectValue = 3500;
               break;
            case 3:
               numEffectValue = 3500;
               break;
            case 4:
               numEffectValue = 3500;
               break;
            case 5:
               numEffectValue = 3500;
               break;
            case 6:
               numEffectValue = 3500;
               break;
            case 7:
               numEffectValue = 3500;
               break;
            case 8:
               numEffectValue = 3500;
               break;
            case 9:
               numEffectValue = 3500;
               break;
            case 10:
               numEffectValue = 3500;
               break;
            case 11:
               numEffectValue = 4000;
               break;
            case 12:
               numEffectValue = 4000;
               break;
            case 13:
               numEffectValue = 4000;
               break;
            case 14:
               numEffectValue = 4000;
               break;
            case 15:
               numEffectValue = 4500;
         }
         return numEffectValue;
      }
      
      protected function GetSkillBleedDamageRateValue(iLifeValue:int) : Number
      {
         var numEffectValue:Number = 0;
         switch(m_iSkillDegree)
         {
            case 0:
               numEffectValue = iLifeValue * 0.25 + 20;
               break;
            case 1:
               numEffectValue = iLifeValue * 0.26 + 25;
               break;
            case 2:
               numEffectValue = iLifeValue * 0.27 + 30;
               break;
            case 3:
               numEffectValue = iLifeValue * 0.28 + 35;
               break;
            case 4:
               numEffectValue = iLifeValue * 0.29 + 40;
               break;
            case 5:
               numEffectValue = iLifeValue * 0.3 + 50;
               break;
            case 6:
               numEffectValue = iLifeValue * 0.31 + 60;
               break;
            case 7:
               numEffectValue = iLifeValue * 0.32 + 70;
               break;
            case 8:
               numEffectValue = iLifeValue * 0.33 + 80;
               break;
            case 9:
               numEffectValue = iLifeValue * 0.34 + 90;
               break;
            case 10:
               numEffectValue = iLifeValue * 0.35 + 100;
               break;
            case 11:
               numEffectValue = iLifeValue * 0.36 + 120;
               break;
            case 12:
               numEffectValue = iLifeValue * 0.37 + 140;
               break;
            case 13:
               numEffectValue = iLifeValue * 0.38 + 160;
               break;
            case 14:
               numEffectValue = iLifeValue * 0.39 + 180;
               break;
            case 15:
               numEffectValue = iLifeValue * 0.4 + 220;
         }
         return numEffectValue;
      }
      
      protected function GetBoomEnergyValue() : Number
      {
         var numEffectValue:Number = 0;
         switch(m_iSkillDegree)
         {
            case 0:
               numEffectValue = 100;
               break;
            case 1:
               numEffectValue = 115;
               break;
            case 2:
               numEffectValue = 130;
               break;
            case 3:
               numEffectValue = 145;
               break;
            case 4:
               numEffectValue = 150;
               break;
            case 5:
               numEffectValue = 165;
               break;
            case 6:
               numEffectValue = 180;
               break;
            case 7:
               numEffectValue = 195;
               break;
            case 8:
               numEffectValue = 210;
               break;
            case 9:
               numEffectValue = 225;
               break;
            case 10:
               numEffectValue = 240;
               break;
            case 11:
               numEffectValue = 270;
               break;
            case 12:
               numEffectValue = 300;
               break;
            case 13:
               numEffectValue = 350;
               break;
            case 14:
               numEffectValue = 400;
               break;
            case 15:
               numEffectValue = 450;
         }
         return numEffectValue;
      }
      
      protected function GetBoomEnergyProbValue() : Number
      {
         var numEffectValue:Number = 0;
         switch(m_iSkillDegree)
         {
            case 0:
               numEffectValue = 10;
               break;
            case 1:
               numEffectValue = 10;
               break;
            case 2:
               numEffectValue = 10;
               break;
            case 3:
               numEffectValue = 11;
               break;
            case 4:
               numEffectValue = 11;
               break;
            case 5:
               numEffectValue = 11;
               break;
            case 6:
               numEffectValue = 12;
               break;
            case 7:
               numEffectValue = 13;
               break;
            case 8:
               numEffectValue = 14;
               break;
            case 9:
               numEffectValue = 16;
               break;
            case 10:
               numEffectValue = 18;
               break;
            case 11:
               numEffectValue = 20;
               break;
            case 12:
               numEffectValue = 25;
               break;
            case 13:
               numEffectValue = 30;
               break;
            case 14:
               numEffectValue = 35;
               break;
            case 15:
               numEffectValue = 40;
         }
         return numEffectValue;
      }
      
      protected function GetDieEnergyValue() : Number
      {
         var numEffectValue:Number = 0;
         switch(m_iSkillDegree)
         {
            case 0:
               numEffectValue = 9;
               break;
            case 1:
               numEffectValue = 10;
               break;
            case 2:
               numEffectValue = 11;
               break;
            case 3:
               numEffectValue = 12;
               break;
            case 4:
               numEffectValue = 13;
               break;
            case 5:
               numEffectValue = 14;
               break;
            case 6:
               numEffectValue = 15;
               break;
            case 7:
               numEffectValue = 16;
               break;
            case 8:
               numEffectValue = 17;
               break;
            case 9:
               numEffectValue = 18;
               break;
            case 10:
               numEffectValue = 20;
               break;
            case 11:
               numEffectValue = 22;
               break;
            case 12:
               numEffectValue = 25;
               break;
            case 13:
               numEffectValue = 30;
               break;
            case 14:
               numEffectValue = 35;
               break;
            case 15:
               numEffectValue = 40;
         }
         return numEffectValue;
      }
   }
}

