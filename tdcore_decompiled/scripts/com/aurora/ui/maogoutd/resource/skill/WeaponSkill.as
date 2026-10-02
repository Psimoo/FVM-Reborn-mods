package com.aurora.ui.maogoutd.resource.skill
{
   import a_4718.b_180;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.avatar.a_3924;
   import com.aurora.ui.maogoutd.resource.avatar.effects.masterShield.GodBlessEyeSkill;
   import com.aurora.ui.maogoutd.resource.avatar.effects.masterShield.GodHuEyeSkill;
   import com.aurora.ui.maogoutd.resource.avatar.effects.masterShield.GodJiEyeSkill;
   import com.aurora.ui.maogoutd.resource.energy.a_4157;
   import com.aurora.ui.maogoutd.resource.energy.a_4162;
   import com.aurora.ui.maogoutd.resource.pet.BasePet;
   import com.aurora.ui.maogoutd.resource.pet.GradeAPet;
   import com.aurora.ui.maogoutd.resource.pet.GradeBPet;
   import com.aurora.ui.maogoutd.resource.pet.GradeCPet;
   import com.aurora.ui.maogoutd.resource.pet.GradeDPet;
   import com.aurora.ui.maogoutd.resource.pet.GradeSPet;
   import com.aurora.ui.maogoutd.resource.pet.GradeSSPet;
   import com.aurora.ui.maogoutd.resource.pet.GradeSSSPet;
   import com.aurora.ui.maogoutd.resource.shot.AladdinDivineLamp.LampGodForceSkill;
   import com.aurora.ui.maogoutd.resource.shot.AladdinDivineLamp.LampGodMistSkill;
   import com.aurora.ui.maogoutd.resource.shot.AladdinDivineLamp.LampGodNirvanaSkill;
   import com.aurora.ui.maogoutd.resource.shot.AladdinDivineLamp.LampGodSpeedSkill;
   import com.aurora.ui.maogoutd.resource.shot.AladdinDivineLamp.LampGodSummonSkill;
   import com.aurora.ui.maogoutd.resource.shot.Avater.Explosives.ExplosivesGemSkill;
   import com.aurora.ui.maogoutd.resource.shot.OctopusCannon.BerryGemsSkill;
   import com.aurora.ui.maogoutd.resource.shot.OctopusCannon.OctopusCannonGunSkill;
   import com.aurora.ui.maogoutd.resource.shot.OctopusCannon.PepperGemsSkill;
   import com.aurora.ui.maogoutd.resource.shot.SecretWish.SpiritSkill;
   import com.aurora.ui.maogoutd.resource.shot.ShadowMeow.ShadowMeowSkill;
   import com.aurora.ui.maogoutd.resource.shot.SonicGun.SonicGunSkill;
   import com.aurora.ui.maogoutd.resource.shot.StarStaff.StarFlashGemSkill;
   import com.aurora.ui.maogoutd.resource.shot.StarStaff.StarKissGemSkill;
   import com.aurora.ui.maogoutd.resource.shot.StarStaff.StarRadianceGemSkill;
   import com.aurora.ui.maogoutd.resource.shot.StarStaff.StarRainGemSkill;
   import com.aurora.ui.maogoutd.resource.shot.StarStaff.StarShinesGemoSkill;
   import com.aurora.ui.maogoutd.resource.shot.ThornRoseShield.CunningDisguiseSkill;
   import com.aurora.ui.maogoutd.resource.shot.ThornRoseShield.PhotosynthesisSkill;
   import com.aurora.ui.maogoutd.resource.shot.ThornRoseShield.RosesHeartSkill;
   import com.aurora.ui.maogoutd.resource.shot.ThornRoseShield.RosesProtectionSkill;
   import com.aurora.ui.maogoutd.resource.shot.ThornRoseShield.ThornThornsSkill;
   import com.aurora.ui.maogoutd.resource.shot.YouYouGun.YouYouGunSkill;
   import com.aurora.ui.maogoutd.resource.shot.ZeusCrossbow.GodAngerSkill;
   import com.aurora.ui.maogoutd.resource.shot.ZeusCrossbow.GodPowerSkill;
   import com.aurora.ui.maogoutd.resource.shot.ZeusCrossbow.GodShadowSkill;
   import com.aurora.ui.maogoutd.resource.shot.ZeusCrossbow.MeteorSkill;
   import com.aurora.ui.maogoutd.resource.shot.ZeusCrossbow.SlowGemSkill;
   import flash.display.Sprite;
   
   public class WeaponSkill extends Sprite implements IWeaponSkill
   {
      
      private static var ms_stWeaponSkillVector:Array = new Array();
      
      private var m_stOwnBattleFieldView:BattleFieldView;
      
      private var m_stMyAvatar:a_3924;
      
      private var m_uiStartTimeNum:uint;
      
      private var m_arrBaseSkills:Array = [];
      
      private var m_arrPetSkills:Array = [];
      
      private var m_stSkillReadyEffect:SkillReadyEffect;
      
      public function WeaponSkill()
      {
         super();
      }
      
      public function CreateWeaponSkill() : IWeaponSkill
      {
         var stWeaponSkill:WeaponSkill = ms_stWeaponSkillVector.pop();
         if(null == stWeaponSkill)
         {
            stWeaponSkill = new WeaponSkill();
         }
         return stWeaponSkill;
      }
      
      public function a_4330() : void
      {
         if(-1 == ms_stWeaponSkillVector.indexOf(this))
         {
            ms_stWeaponSkillVector.push(this);
         }
      }
      
      public function GetSkill(uiSkillID:uint) : BaseSkill
      {
         return this.m_arrBaseSkills[uiSkillID];
      }
      
      public function OnTimeInterval(iTimeNum:uint) : void
      {
         var _loc_3:BasePet = null;
         var stBaseSkill:BaseSkill = null;
         for each(stBaseSkill in this.m_arrBaseSkills)
         {
            if(!((stBaseSkill.m_uiSkillID == 343949328 || stBaseSkill.m_uiSkillID == 343957520) && !this.m_stOwnBattleFieldView.m_stOpponentBattleFieldInstance.visible))
            {
               stBaseSkill.OnTimeInterval(iTimeNum);
            }
         }
         if(Boolean(this.m_stSkillReadyEffect) && this.m_stSkillReadyEffect.visible)
         {
            this.m_stSkillReadyEffect.OnTimeInterval(iTimeNum);
         }
         for each(_loc_3 in this.m_arrPetSkills)
         {
            _loc_3.OnTimeInterval(iTimeNum);
         }
      }
      
      public function a_2088(arrWeaponSkillInfos:Array, arrPets:Array, iCoverallType:int) : void
      {
         var stBaseSkill:BaseSkill = null;
         var stWeaponSkillInfo:Array = null;
         var _loc_8:BaseSkill = null;
         var _loc_9:Array = null;
         var _loc_10:BasePet = null;
         var _loc_11:int = 0;
         var _loc_12:Array = null;
         var _loc_13:a_4157 = null;
         var _loc_3:* = undefined;
         var _loc_4:* = undefined;
         var _loc_5:* = undefined;
         var _loc_6:* = undefined;
         var _loc_7:* = undefined;
         this.m_uiStartTimeNum = this.m_stOwnBattleFieldView.iTimeIntervalNum;
         for each(stWeaponSkillInfo in arrWeaponSkillInfos)
         {
            stBaseSkill = null;
            if(stWeaponSkillInfo[0] == 343937040)
            {
               stBaseSkill = LaserSkill.a_3926();
            }
            else if(stWeaponSkillInfo[0] == 343941136)
            {
               stBaseSkill = IceLaserSkill.a_3926();
            }
            else if(stWeaponSkillInfo[0] == 343945232)
            {
               stBaseSkill = BombBoomSkill.a_3926();
            }
            else if(stWeaponSkillInfo[0] == 343949328)
            {
               stBaseSkill = BattleBoomSkill.a_3926();
            }
            else if(stWeaponSkillInfo[0] == 343953424)
            {
               stBaseSkill = InvincibleAuraSkill.a_3926();
            }
            else if(stWeaponSkillInfo[0] == 343957520)
            {
               stBaseSkill = FogSkill.a_3926();
            }
            else if(stWeaponSkillInfo[0] == 343961616)
            {
               stBaseSkill = SuperStarSkill.a_3926();
            }
            else if(stWeaponSkillInfo[0] == 343965712)
            {
               stBaseSkill = BlisterBlockSkill.a_3926();
            }
            else if(stWeaponSkillInfo[0] == 343969808)
            {
               stBaseSkill = PoisonGasSkill.a_3926();
            }
            else if(stWeaponSkillInfo[0] == 343973904)
            {
               stBaseSkill = SummonInsuranceSkill.a_3926();
            }
            else if(stWeaponSkillInfo[0] == 343973905)
            {
               stBaseSkill = WangWangSkill.a_3926();
            }
            else if(stWeaponSkillInfo[0] == 343978000)
            {
               stBaseSkill = FlourPackageSkill.a_3926();
            }
            else if(stWeaponSkillInfo[0] == 343982096)
            {
               stBaseSkill = DropEnergySkill.a_3926();
            }
            else if(stWeaponSkillInfo[0] == 343986192)
            {
               stBaseSkill = AttackEnhanceSkill.a_3926();
            }
            else if(stWeaponSkillInfo[0] == 344006672)
            {
               stBaseSkill = MoYingChaoRenSkill.a_3926();
            }
            else if(stWeaponSkillInfo[0] == 344002576)
            {
               stBaseSkill = MoYingManLiSkill.a_3926();
            }
            else if(stWeaponSkillInfo[0] == 343998480)
            {
               stBaseSkill = MoYingShengYiSkill.a_3926(this.IsGemCoverallMatched(stWeaponSkillInfo[0],iCoverallType));
            }
            else if(stWeaponSkillInfo[0] == 344154128)
            {
               stBaseSkill = SourceOfLightSkill.a_3926();
            }
            else if(stWeaponSkillInfo[0] == 344158224)
            {
               stBaseSkill = SourceOfTearingSkill.a_3926();
            }
            else if(stWeaponSkillInfo[0] == 344162320)
            {
               stBaseSkill = SourceOfEternalSkill.a_3926();
            }
            else if(stWeaponSkillInfo[0] == 344162576)
            {
               stBaseSkill = SourceOfLifeSkill.a_3926();
            }
            else if(stWeaponSkillInfo[0] == 344006928)
            {
               stBaseSkill = MoYingXunJiSkill.a_3926(this.IsGemCoverallMatched(stWeaponSkillInfo[0],iCoverallType));
            }
            else if(stWeaponSkillInfo[0] == 344010768)
            {
               stBaseSkill = AntiInjurySkill.a_3926();
            }
            else if(stWeaponSkillInfo[0] == 344014864)
            {
               stBaseSkill = MouseBleedSkill.a_3926();
            }
            else if(stWeaponSkillInfo[0] == 344018960)
            {
               stBaseSkill = DecelerateSkill.a_3926();
            }
            else if(stWeaponSkillInfo[0] == 344023056)
            {
               stBaseSkill = GuardCardSkill.a_3926();
            }
            else if(stWeaponSkillInfo[0] == 344027152)
            {
               stBaseSkill = AddDefenseAttackSkill.a_3926();
            }
            else if(stWeaponSkillInfo[0] == 344084496)
            {
               stBaseSkill = AddAvatarLifeSkill.a_3926();
            }
            else if(stWeaponSkillInfo[0] == 344088592)
            {
               stBaseSkill = AddEnergySkill.a_3926();
            }
            else if(stWeaponSkillInfo[0] == 343982097)
            {
               stBaseSkill = ChanNengGemSkill.a_3926();
            }
            else if(stWeaponSkillInfo[0] == 344129553)
            {
               stBaseSkill = WangLingQiangXiSkill.a_3926();
            }
            else if(stWeaponSkillInfo[0] == 344133649)
            {
               stBaseSkill = WangLingXingHuoSkill.a_3926();
            }
            else if(stWeaponSkillInfo[0] == 344137745)
            {
               stBaseSkill = WangLingQieYueSkill.a_3926();
            }
            else if(stWeaponSkillInfo[0] == 344141841)
            {
               stBaseSkill = GhostAdjudicationSkill.a_3926();
            }
            else if(stWeaponSkillInfo[0] == 343998481)
            {
               stBaseSkill = GodShadowSkill.a_3926(this.IsGemCoverallMatched(stWeaponSkillInfo[0],iCoverallType));
            }
            else if(stWeaponSkillInfo[0] == 344002577)
            {
               stBaseSkill = GodPowerSkill.a_3926();
            }
            else if(stWeaponSkillInfo[0] == 344006673)
            {
               stBaseSkill = GodAngerSkill.a_3926();
            }
            else if(stWeaponSkillInfo[0] == 344010769)
            {
               stBaseSkill = GodEdgeSkill.a_3926();
            }
            else if(stWeaponSkillInfo[0] == 344154129)
            {
               stBaseSkill = GodBlessEyeSkill.a_3926();
            }
            else if(stWeaponSkillInfo[0] == 344158225)
            {
               stBaseSkill = GodJiEyeSkill.a_3926();
            }
            else if(stWeaponSkillInfo[0] == 344162321)
            {
               stBaseSkill = GodHuEyeSkill.a_3926();
            }
            else if(stWeaponSkillInfo[0] == 344166417)
            {
               stBaseSkill = GodShenEyeSkill.a_3926();
            }
            else if(stWeaponSkillInfo[0] == 344199185)
            {
               stBaseSkill = SlowGemSkill.a_3926();
            }
            else if(stWeaponSkillInfo[0] == 344199441)
            {
               stBaseSkill = FlameGemsSkill.a_3926();
            }
            else if(stWeaponSkillInfo[0] == 344199697)
            {
               stBaseSkill = BuzzSkill.a_3926();
            }
            else if(stWeaponSkillInfo[0] == 344199953)
            {
               stBaseSkill = ShadowMeowSkill.a_3926();
            }
            else if(stWeaponSkillInfo[0] == 344200209)
            {
               stBaseSkill = MeteorSkill.a_3926();
            }
            else if(stWeaponSkillInfo[0] == 344200465)
            {
               stBaseSkill = SpiritSkill.a_3926();
            }
            else if(stWeaponSkillInfo[0] == 344200721)
            {
               stBaseSkill = SonicGunSkill.a_3926();
            }
            else if(stWeaponSkillInfo[0] == 344200977)
            {
               stBaseSkill = OctopusCannonGunSkill.a_3926();
            }
            else if(stWeaponSkillInfo[0] == 344201233)
            {
               stBaseSkill = PepperGemsSkill.a_3926();
            }
            else if(stWeaponSkillInfo[0] == 344201489)
            {
               stBaseSkill = BerryGemsSkill.a_3926();
            }
            else if(stWeaponSkillInfo[0] == 344203281)
            {
               stBaseSkill = YouYouGunSkill.a_3926();
            }
            else if(stWeaponSkillInfo[0] == 344203537)
            {
               stBaseSkill = ExplosivesGemSkill.a_3926();
            }
            else if(stWeaponSkillInfo[0] == 344203793)
            {
               stBaseSkill = StarRadianceGemSkill.a_3926(this.IsGemCoverallMatched(stWeaponSkillInfo[0],iCoverallType));
            }
            else if(stWeaponSkillInfo[0] == 344208913)
            {
               stBaseSkill = StarShinesGemoSkill.a_3926(this.IsGemCoverallMatched(stWeaponSkillInfo[0],iCoverallType));
            }
            else if(stWeaponSkillInfo[0] == 344204049)
            {
               stBaseSkill = StarKissGemSkill.a_3926();
            }
            else if(stWeaponSkillInfo[0] == 344204305)
            {
               stBaseSkill = StarRainGemSkill.a_3926();
            }
            else if(stWeaponSkillInfo[0] == 344204561)
            {
               stBaseSkill = StarFlashGemSkill.a_3926();
            }
            else if(stWeaponSkillInfo[0] == 344204817)
            {
               stBaseSkill = LampGodForceSkill.a_3926();
            }
            else if(stWeaponSkillInfo[0] == 344208401)
            {
               stBaseSkill = LampGodNirvanaSkill.a_3926();
            }
            else if(stWeaponSkillInfo[0] == 344205073)
            {
               stBaseSkill = LampGodSpeedSkill.a_3926();
            }
            else if(stWeaponSkillInfo[0] == 344205329)
            {
               stBaseSkill = LampGodSummonSkill.a_3926();
            }
            else if(stWeaponSkillInfo[0] == 344205585)
            {
               stBaseSkill = LampGodMistSkill.a_3926();
            }
            else if(stWeaponSkillInfo[0] == 344207377)
            {
               stBaseSkill = PhotosynthesisSkill.a_3926();
            }
            else if(stWeaponSkillInfo[0] == 344207633)
            {
               stBaseSkill = ThornThornsSkill.a_3926();
            }
            else if(stWeaponSkillInfo[0] == 344207889)
            {
               stBaseSkill = RosesProtectionSkill.a_3926();
            }
            else if(stWeaponSkillInfo[0] == 344208657)
            {
               stBaseSkill = RosesHeartSkill.a_3926();
            }
            else if(stWeaponSkillInfo[0] == 344208145)
            {
               stBaseSkill = CunningDisguiseSkill.a_3926();
            }
            else if(stWeaponSkillInfo[0] == 344031248)
            {
               stBaseSkill = SuperBoundStopSkill.a_3926();
            }
            else if(stWeaponSkillInfo[0] == 344064016)
            {
               stBaseSkill = SuperTransEnergySkill.a_3926();
            }
            else if(stWeaponSkillInfo[0] == 344068112)
            {
               stBaseSkill = SuperAttackEnhanceSkill.a_3926();
            }
            else if(stWeaponSkillInfo[0] == 344072208)
            {
               stBaseSkill = SuperAddAttackSpeedSkill.a_3926();
            }
            else if(stWeaponSkillInfo[0] == 344129552)
            {
               stBaseSkill = SuperDeathScytheAddAttackSpeedSKill.a_3926();
            }
            else if(stWeaponSkillInfo[0] == 344133648)
            {
               stBaseSkill = SuperDeathScytheAttackEnhanceSkill.a_3926();
            }
            else if(stWeaponSkillInfo[0] == 344137744)
            {
               stBaseSkill = SuperDeathScytheAddScytheNumberSkill.a_3926();
            }
            else if(stWeaponSkillInfo[0] == 344138000)
            {
               stBaseSkill = SuperDeathScytheAddHurtNumberSkill.a_3926();
            }
            else if(stWeaponSkillInfo[0] == 344035344)
            {
               stBaseSkill = SuperCircleSputteringSkill.a_3926();
            }
            if(stBaseSkill)
            {
               stBaseSkill.m_uiSkillID = stWeaponSkillInfo[0];
               stBaseSkill.m_iSkillDegree = stWeaponSkillInfo[1];
               this.m_arrBaseSkills[stWeaponSkillInfo[0]] = stBaseSkill;
            }
         }
         for each(stBaseSkill in this.m_arrBaseSkills)
         {
            stBaseSkill.m_stBattleFieldView = this.m_stOwnBattleFieldView;
            stBaseSkill.m_stBaseAvatar = this.m_stMyAvatar;
            stBaseSkill.a_1797();
         }
         _loc_8 = null;
         _loc_9 = null;
         _loc_10 = null;
         _loc_11 = 0;
         _loc_12 = null;
         _loc_13 = null;
         _loc_3 = arrPets[0];
         _loc_4 = arrPets[1];
         _loc_5 = arrPets[2][0];
         _loc_6 = arrPets[3][0];
         _loc_7 = arrPets[3][1];
         while(_loc_11 < _loc_3.length)
         {
            _loc_12 = _loc_3[_loc_11];
            _loc_10 = null;
            if(_loc_12[1] == 1)
            {
               _loc_10 = GradeDPet.a_3926();
            }
            else if(_loc_12[1] == 2)
            {
               _loc_10 = GradeCPet.a_3926();
            }
            else if(_loc_12[1] == 3)
            {
               _loc_10 = GradeBPet.a_3926();
            }
            else if(_loc_12[1] == 4)
            {
               _loc_10 = GradeAPet.a_3926();
            }
            else if(_loc_12[1] == 5)
            {
               _loc_10 = GradeSPet.a_3926();
            }
            else if(_loc_12[1] == 6)
            {
               _loc_10 = GradeSSPet.a_3926();
            }
            else if(_loc_12[1] == 7)
            {
               _loc_10 = GradeSSSPet.a_3926();
            }
            if(_loc_10)
            {
               this.m_arrPetSkills[_loc_11] = _loc_10;
               _loc_10.scaleX = 0.7;
               _loc_10.scaleY = 0.7;
               _loc_10.a_1334 = this.m_stOwnBattleFieldView.a_3438(_loc_7,_loc_11);
               _loc_10.a_1094 = _loc_12[2];
            }
            _loc_11++;
         }
         for each(_loc_10 in this.m_arrPetSkills)
         {
            _loc_10.m_stBattleFieldView = this.m_stOwnBattleFieldView;
            _loc_10.m_stBaseAvatar = this.m_stMyAvatar;
            _loc_10.a_1797();
         }
         if(_loc_5 > 0 && this.m_stOwnBattleFieldView.isOwnBattleField && ((_loc_6 & 0xF0000000) == 805306368 || this.m_stOwnBattleFieldView.m_stOpponentBattleFieldInstance.visible))
         {
            _loc_13 = a_4162.getInstance().a_4163(b_180.a_420);
            if(_loc_13 != null)
            {
               _loc_13.m_stCurrentBattleField = this.m_stOwnBattleFieldView;
               _loc_13.a_1797(0,_loc_5,a_3491.a_1080 * 3 + Math.random() * 30 - 30,a_3491.a_1081 * 2 + Math.random() * 20 - 30);
               this.m_stOwnBattleFieldView.AddToBattleView(_loc_13,BattleLayerDefine.EFFECTS_TOP_TYPE);
            }
         }
      }
      
      public function a_2098() : void
      {
         var stBaseSkill:BaseSkill = null;
         if(this.m_arrBaseSkills)
         {
            for each(stBaseSkill in this.m_arrBaseSkills)
            {
               stBaseSkill.a_4330();
            }
         }
         if(this.m_stSkillReadyEffect != null)
         {
            this.m_stSkillReadyEffect.visible = false;
         }
         this.m_arrBaseSkills = [];
         var _loc_2:BasePet = null;
         if(this.m_arrPetSkills is Array)
         {
            for each(_loc_2 in this.m_arrPetSkills)
            {
               _loc_2.a_4330();
            }
         }
         this.m_arrPetSkills = [];
         this.m_stMyAvatar = null;
      }
      
      private function IsGemCoverallMatched(uiSkillID:uint, iCoverallType:int) : Boolean
      {
         if(iCoverallType <= 0)
         {
            return false;
         }
         switch(uiSkillID)
         {
            case 343998480:
               if(iCoverallType == 349185552 || iCoverallType == 349185568 || iCoverallType == 349185808 || iCoverallType == 349185824 || iCoverallType == 349186064 || iCoverallType == 349186080)
               {
                  return true;
               }
               break;
            case 344006928:
               if(iCoverallType == 349197584 || iCoverallType == 349197600)
               {
                  return true;
               }
               break;
            case 343998481:
               if(iCoverallType == 349205264 || iCoverallType == 349205280 || iCoverallType == 349205520 || iCoverallType == 349205536 || iCoverallType == 349205776 || iCoverallType == 349205792)
               {
                  return true;
               }
               break;
            case 344203793:
               if(iCoverallType == 349255696 || iCoverallType == 349255712 || iCoverallType == 349255952 || iCoverallType == 349255968 || iCoverallType == 349257744 || iCoverallType == 349257760)
               {
                  return true;
               }
               break;
            case 344208913:
               if(iCoverallType == 349270288 || iCoverallType == 349270304 || iCoverallType == 349270544 || iCoverallType == 349270560 || iCoverallType == 349270800 || iCoverallType == 349270816)
               {
                  return true;
               }
         }
         return false;
      }
      
      public function SetOwnBattleFieldView(stBattleFieldView:BattleFieldView) : void
      {
         var stBaseSkill:BaseSkill = null;
         var _loc_3:BasePet = null;
         this.m_stOwnBattleFieldView = stBattleFieldView;
         for each(stBaseSkill in this.m_arrBaseSkills)
         {
            stBaseSkill.m_stBattleFieldView = this.m_stOwnBattleFieldView;
            if(stBaseSkill.m_stBaseAvatar)
            {
               stBaseSkill.a_1797();
            }
         }
         _loc_3 = null;
         for each(_loc_3 in this.m_arrPetSkills)
         {
            _loc_3.m_stBattleFieldView = this.m_stOwnBattleFieldView;
            if(_loc_3.m_stBaseAvatar)
            {
               _loc_3.a_1797();
            }
         }
      }
      
      public function SetMyAvater(stAvatar:a_3924) : void
      {
         var stBaseSkill:BaseSkill = null;
         var _loc_3:BasePet = null;
         if(!stAvatar)
         {
            return;
         }
         this.m_stMyAvatar = stAvatar;
         for each(stBaseSkill in this.m_arrBaseSkills)
         {
            stBaseSkill.m_stBaseAvatar = this.m_stMyAvatar;
            stBaseSkill.m_stBattleFieldView = this.m_stOwnBattleFieldView;
            if(stBaseSkill.m_stBattleFieldView)
            {
               stBaseSkill.a_1797();
            }
         }
         for each(_loc_3 in this.m_arrPetSkills)
         {
            _loc_3.m_stBattleFieldView = this.m_stOwnBattleFieldView;
            _loc_3.m_stBaseAvatar = this.m_stMyAvatar;
            _loc_3.a_1797();
         }
      }
      
      public function ShowSkillReady() : void
      {
         if(Boolean(this.m_stMyAvatar) && Boolean(this.m_stMyAvatar.stFieldGrid))
         {
            if(null == this.m_stSkillReadyEffect)
            {
               this.m_stSkillReadyEffect = SkillReadyEffect.a_3926();
            }
            this.m_stSkillReadyEffect.a_1797(!this.m_stOwnBattleFieldView.isOwnBattleField);
            this.m_stSkillReadyEffect.x = a_3491.a_1080 * this.m_stMyAvatar.stFieldGrid.m_iXGridNo + 0.5 * (a_3491.a_1080 - this.m_stSkillReadyEffect.width);
            this.m_stSkillReadyEffect.y = a_3491.a_1081 * this.m_stMyAvatar.stFieldGrid.m_iYGridNo + 0.5 * (a_3491.a_1081 - this.m_stSkillReadyEffect.height);
            this.m_stOwnBattleFieldView.AddToBattleView(this.m_stSkillReadyEffect,BattleLayerDefine.EFFECT_LAYER_TOP_TYPE,this.m_stMyAvatar.stFieldGrid);
         }
      }
   }
}

