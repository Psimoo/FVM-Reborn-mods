package com.aurora.ui.maogoutd.resource.avatar
{
   import a_4715.EncrypIntEx;
   import a_4715.EncrypNumber;
   import a_4718.b_180;
   import a_4718.b_182;
   import a_4718.b_183;
   import a_4724.AvatarDetailInfo;
   import a_4752.a_2036;
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.avatar.effects.GodsShieldBottomAdvancedEffect;
   import com.aurora.ui.maogoutd.resource.avatar.effects.GodsShieldBottomIntermediateEffect;
   import com.aurora.ui.maogoutd.resource.avatar.effects.GodsShieldBottomNoneEffect;
   import com.aurora.ui.maogoutd.resource.avatar.effects.GodsShieldBottomPrimaryEffect;
   import com.aurora.ui.maogoutd.resource.avatar.effects.GodsShieldTopAdvancedEffect;
   import com.aurora.ui.maogoutd.resource.avatar.effects.GodsShieldTopIntermediateEffect;
   import com.aurora.ui.maogoutd.resource.avatar.effects.GodsShieldTopPrimaryEffect;
   import com.aurora.ui.maogoutd.resource.defender.a_3953;
   import com.aurora.ui.maogoutd.resource.defender.a_3977;
   import com.aurora.ui.maogoutd.resource.effect.a_4108;
   import com.aurora.ui.maogoutd.resource.effect.a_4113;
   import com.aurora.ui.maogoutd.resource.energy.a_4157;
   import com.aurora.ui.maogoutd.resource.energy.a_4162;
   import com.aurora.ui.maogoutd.resource.shot.AladdinDivineLamp.AvatarSuperLampGodFiveShot;
   import com.aurora.ui.maogoutd.resource.shot.AladdinDivineLamp.AvatarSuperLampGodFourShot;
   import com.aurora.ui.maogoutd.resource.shot.AladdinDivineLamp.AvatarSuperLampGodOneShot;
   import com.aurora.ui.maogoutd.resource.shot.AladdinDivineLamp.AvatarSuperLampGodThreeShot;
   import com.aurora.ui.maogoutd.resource.shot.AladdinDivineLamp.AvatarSuperLampGodTwoShot;
   import com.aurora.ui.maogoutd.resource.shot.AladdinDivineLamp.LampGodOneAppearance;
   import com.aurora.ui.maogoutd.resource.shot.AladdinDivineLamp.LampGodThreeAppearance;
   import com.aurora.ui.maogoutd.resource.shot.AladdinDivineLamp.LampGodTwoAppearance;
   import com.aurora.ui.maogoutd.resource.shot.AvatarCircleRoundShot;
   import com.aurora.ui.maogoutd.resource.shot.AvatarIcePowerGunShot;
   import com.aurora.ui.maogoutd.resource.shot.AvatarMoonlitMeteorShot;
   import com.aurora.ui.maogoutd.resource.shot.AvatarSnowBallShot;
   import com.aurora.ui.maogoutd.resource.shot.AvatarStarFish7FollowFifthTransShot;
   import com.aurora.ui.maogoutd.resource.shot.AvatarStarFish7FollowFirstTransShot;
   import com.aurora.ui.maogoutd.resource.shot.AvatarStarFish7FollowForthTransShot;
   import com.aurora.ui.maogoutd.resource.shot.AvatarStarFish7FollowSecondTransShot;
   import com.aurora.ui.maogoutd.resource.shot.AvatarStarFish7FollowThirdTransShot;
   import com.aurora.ui.maogoutd.resource.shot.AvatarStarFishFollowFifthTransShot;
   import com.aurora.ui.maogoutd.resource.shot.AvatarStarFishFollowFirstTransShot;
   import com.aurora.ui.maogoutd.resource.shot.AvatarStarFishFollowForthTransShot;
   import com.aurora.ui.maogoutd.resource.shot.AvatarStarFishFollowSecondTransShot;
   import com.aurora.ui.maogoutd.resource.shot.AvatarStarFishFollowThirdTransShot;
   import com.aurora.ui.maogoutd.resource.shot.AvatarSuperBuzzShellShot;
   import com.aurora.ui.maogoutd.resource.shot.AvatarSuperDeathGodFiveShot;
   import com.aurora.ui.maogoutd.resource.shot.AvatarSuperDeathGodFourShot;
   import com.aurora.ui.maogoutd.resource.shot.AvatarSuperDeathGodOneShot;
   import com.aurora.ui.maogoutd.resource.shot.AvatarSuperDeathGodShot;
   import com.aurora.ui.maogoutd.resource.shot.AvatarSuperDeathGodThreeShot;
   import com.aurora.ui.maogoutd.resource.shot.AvatarSuperDeathGodTwoShot;
   import com.aurora.ui.maogoutd.resource.shot.AvatarSuperDeathScytheFiveShot;
   import com.aurora.ui.maogoutd.resource.shot.AvatarSuperDeathScytheFourShot;
   import com.aurora.ui.maogoutd.resource.shot.AvatarSuperDeathScytheOneShot;
   import com.aurora.ui.maogoutd.resource.shot.AvatarSuperDeathScytheShot;
   import com.aurora.ui.maogoutd.resource.shot.AvatarSuperDeathScytheThreeShot;
   import com.aurora.ui.maogoutd.resource.shot.AvatarSuperDeathScytheTwoShot;
   import com.aurora.ui.maogoutd.resource.shot.AvatarSuperDianCiCannonShot;
   import com.aurora.ui.maogoutd.resource.shot.AvatarSuperGrenadeShot;
   import com.aurora.ui.maogoutd.resource.shot.AvatarSuperNinthFlamesShot;
   import com.aurora.ui.maogoutd.resource.shot.AvatarSuperShotgunShot;
   import com.aurora.ui.maogoutd.resource.shot.Avater.Explosives.AvatarSuperExplosivesShot;
   import com.aurora.ui.maogoutd.resource.shot.Avater.Explosives.ExplosivesOutsideAvater;
   import com.aurora.ui.maogoutd.resource.shot.OctopusCannon.AvatarOctopusCannonShot;
   import com.aurora.ui.maogoutd.resource.shot.PlutoWarScythe.AvatarSuperDeathBulletFiveShot;
   import com.aurora.ui.maogoutd.resource.shot.PlutoWarScythe.AvatarSuperDeathBulletFourShot;
   import com.aurora.ui.maogoutd.resource.shot.PlutoWarScythe.AvatarSuperDeathBulletOneShot;
   import com.aurora.ui.maogoutd.resource.shot.PlutoWarScythe.AvatarSuperDeathBulletThreeShot;
   import com.aurora.ui.maogoutd.resource.shot.PlutoWarScythe.AvatarSuperDeathBulletTwoShot;
   import com.aurora.ui.maogoutd.resource.shot.PlutoWarScythe.AvatarSuperDogDeathGodOneShot;
   import com.aurora.ui.maogoutd.resource.shot.PlutoWarScythe.AvatarSuperDogDeathGodThreeShot;
   import com.aurora.ui.maogoutd.resource.shot.PlutoWarScythe.AvatarSuperDogDeathGodTwoShot;
   import com.aurora.ui.maogoutd.resource.shot.SecretWish.AvatarSuperSecretWishShot;
   import com.aurora.ui.maogoutd.resource.shot.SecretWish.SecretWishAvatar;
   import com.aurora.ui.maogoutd.resource.shot.ShadowMeow.AvatarSuperShadowMeowOneShot;
   import com.aurora.ui.maogoutd.resource.shot.ShadowMeow.AvatarSuperShadowMeowTwoShot;
   import com.aurora.ui.maogoutd.resource.shot.ShadowMeow.ShadowMeowFirstAvatar;
   import com.aurora.ui.maogoutd.resource.shot.ShadowMeow.ShadowMeowFourthAvatar;
   import com.aurora.ui.maogoutd.resource.shot.ShadowMeow.ShadowMeowSecondAvatar;
   import com.aurora.ui.maogoutd.resource.shot.ShadowMeow.ShadowMeowThirdAvatar;
   import com.aurora.ui.maogoutd.resource.shot.SonicGun.AvatarSuperSonicGunShot;
   import com.aurora.ui.maogoutd.resource.shot.SonicGun.SonicGunAvatar;
   import com.aurora.ui.maogoutd.resource.shot.StarStaff.AvatarStarStaffFirstShot;
   import com.aurora.ui.maogoutd.resource.shot.StarStaff.AvatarStarStaffFiveShot;
   import com.aurora.ui.maogoutd.resource.shot.StarStaff.AvatarStarStaffFourthShot;
   import com.aurora.ui.maogoutd.resource.shot.StarStaff.AvatarStarStaffSecondShot;
   import com.aurora.ui.maogoutd.resource.shot.StarStaff.AvatarStarStaffThirdShot;
   import com.aurora.ui.maogoutd.resource.shot.ThornRoseShield.ThornRoseShieldTopEffect;
   import com.aurora.ui.maogoutd.resource.shot.YouYouGun.AvatarYouYouGunShot;
   import com.aurora.ui.maogoutd.resource.shot.ZeusCrossbow.ZeusCrossbowFiveShot;
   import com.aurora.ui.maogoutd.resource.shot.ZeusCrossbow.ZeusCrossbowFourShot;
   import com.aurora.ui.maogoutd.resource.shot.ZeusCrossbow.ZeusCrossbowOneShot;
   import com.aurora.ui.maogoutd.resource.shot.ZeusCrossbow.ZeusCrossbowThreeShot;
   import com.aurora.ui.maogoutd.resource.shot.ZeusCrossbow.ZeusCrossbowTwoShot;
   import com.aurora.ui.maogoutd.resource.shot.a_4348;
   import com.aurora.ui.maogoutd.resource.shot.a_4388;
   import com.aurora.ui.maogoutd.resource.shot.rotateWaterGun.AvatarSuperRotateWaterGunWeaponShot;
   import flash.display.BitmapData;
   import flash.display.FrameLabel;
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.geom.Point;
   import flash.utils.clearInterval;
   import flash.utils.setTimeout;
   
   public class a_3927 extends a_3924
   {
      
      private var a_1291:Vector.<BitmapData> = new Vector.<BitmapData>(100);
      
      private var a_1292:Vector.<Point> = new Vector.<Point>(100);
      
      private var a_1293:GirlAvatarDefenseMovie = new GirlAvatarDefenseMovie();
      
      private var m_stBottomEffect:BaseAvatarEffect;
      
      private var m_stTopEffect:BaseAvatarEffect;
      
      private var m_BaseAutoPlayTopEffect:a_4108;
      
      private var m_iGodShowState:int;
      
      private var m_iShotGemLevel:int;
      
      private var m_iAttackGemLevel:int;
      
      private var m_iAttackAppearance:a_4348;
      
      private var m_SpecialGemLevel:int;
      
      private var m_FourthGemLevel:int;
      
      private var m_ShotNumPerGroup:int;
      
      protected var a_1294:a_4113;
      
      private var m_iIntervalNumEx:EncrypIntEx = new EncrypIntEx(-1);
      
      protected var a_1296:AvatarDetailInfo;
      
      private var m_numShotXRateEx:EncrypNumber = new EncrypNumber(1);
      
      private var m_numShotYRateEx:EncrypNumber = new EncrypNumber(1);
      
      public var m_iInitFlag:Boolean = false;
      
      private var m_GemoLevel:int;
      
      private var m_GemoFlag:Boolean;
      
      private var m_stAvatarSuperDeathGodShot:AvatarSuperDeathGodShot;
      
      private var m_stAvatarSuperDeathGodOneShot:AvatarSuperDeathGodOneShot;
      
      private var m_stAvatarSuperDeathGodTwoShot:AvatarSuperDeathGodTwoShot;
      
      private var m_stAvatarSuperDeathGodThreeShot:AvatarSuperDeathGodThreeShot;
      
      private var m_stAvatarSuperDeathGodFourShot:AvatarSuperDeathGodFourShot;
      
      private var m_stAvatarSuperDeathGodFiveShot:AvatarSuperDeathGodFiveShot;
      
      private var m_stAvatarSuperDogDeathGodOneShot:AvatarSuperDogDeathGodOneShot;
      
      private var m_stAvatarSuperDogDeathGodTwoShot:AvatarSuperDogDeathGodTwoShot;
      
      private var m_stAvatarSuperDogDeathGodThreeShot:AvatarSuperDogDeathGodThreeShot;
      
      private var m_stShadowMeowFirstAvatar:ShadowMeowFirstAvatar;
      
      private var m_stShadowMeowSecondAvatar:ShadowMeowSecondAvatar;
      
      private var m_stShadowMeowThirdAvatar:ShadowMeowThirdAvatar;
      
      private var m_stShadowMeowFourthAvatar:ShadowMeowFourthAvatar;
      
      private var m_stSecretWishAvatar:SecretWishAvatar;
      
      private var m_stSonicGunAvatar:SonicGunAvatar;
      
      private var m_stExplosivesOutsideAvater:ExplosivesOutsideAvater;
      
      private var m_iLastShotTime:EncrypIntEx = new EncrypIntEx();
      
      private var hitFieldGrid:Array = new Array();
      
      private var killFieldGrid:Array = new Array();
      
      public function a_3927()
      {
         super();
         a_1320 = 0;
         a_1304 = b_183.b_184;
         a_1310 = 4;
         a_1317 = 3;
         a_1280 = true;
         this.m_iInitFlag = false;
      }
      
      public static function a_3926() : a_3953
      {
         return PoolManager.getInstance().CheckOutOne(a_3927) as a_3927;
      }
      
      private function get m_numShotYRate() : Number
      {
         return this.m_numShotYRateEx.Value;
      }
      
      private function set m_numShotYRate(value:Number) : void
      {
         this.m_numShotYRateEx.Value = value;
      }
      
      private function get m_numShotXRate() : Number
      {
         return this.m_numShotXRateEx.Value;
      }
      
      private function set m_numShotXRate(value:Number) : void
      {
         this.m_numShotXRateEx.Value = value;
      }
      
      protected function get a_1295() : int
      {
         return this.m_iIntervalNumEx.Value;
      }
      
      protected function set a_1295(value:int) : void
      {
         this.m_iIntervalNumEx.Value = value;
      }
      
      private function SetBottomEffect() : void
      {
         var iPosID:int = 0;
         var iXShiftPos:Number = 0;
         var iYShiftPos:Number = 0;
         if(346097664 == this.a_1296.m_iShieldType)
         {
            if(FIGURATION_STATE_PRIMARY == m_iFigurationEffectState)
            {
               iXShiftPos = 10;
               this.m_stBottomEffect = GodsShieldBottomPrimaryEffect.a_3926();
            }
            else if(FIGURATION_STATE_INTERMEDIATE == m_iFigurationEffectState)
            {
               iXShiftPos = 15;
               this.m_stBottomEffect = GodsShieldBottomIntermediateEffect.a_3926();
            }
            else if(FIGURATION_STATE_ADVANCED == m_iFigurationEffectState)
            {
               this.m_stBottomEffect = GodsShieldBottomAdvancedEffect.a_3926();
            }
            else if(FIGURATION_STATE_NONE == m_iFigurationEffectState)
            {
               iXShiftPos = 15;
               this.m_stBottomEffect = GodsShieldBottomNoneEffect.a_3926();
            }
         }
         if(null != this.m_stBottomEffect)
         {
            if(null != parent)
            {
               this.m_stBottomEffect.a_1797(a_1283);
               this.m_stBottomEffect.x = a_3491.a_1080 * a_1334.m_iXGridNo + 0.5 * (a_3491.a_1080 - this.m_stBottomEffect.width) + iXShiftPos;
               if(a_1283)
               {
                  this.m_stBottomEffect.x = BattleFieldView.a_1013 - this.m_stBottomEffect.x;
               }
               this.m_stBottomEffect.y = a_3491.a_1081 * a_1334.m_iYGridNo + a_3491.a_1081 - this.m_stBottomEffect.height + iYShiftPos;
               iPosID = parent.getChildIndex(this);
               parent.addChildAt(this.m_stBottomEffect,iPosID);
               if(stFieldGrid.m_stCurrentBattbleFieldView.GetGameMoveMap())
               {
                  stFieldGrid.m_stCurrentBattbleFieldView.GetGameMoveMap().AddMoveDisplayObject(this.m_stBottomEffect,stFieldGrid.m_iXGridNo,stFieldGrid.m_iYGridNo);
               }
            }
         }
      }
      
      private function SetTopEffect() : void
      {
         var iPosID:int = 0;
         var iXShiftPos:Number = 0;
         var iYShiftPos:Number = 0;
         if(346097664 == this.a_1296.m_iShieldType)
         {
            iXShiftPos = 15;
            iYShiftPos = -15;
            if(FIGURATION_STATE_PRIMARY == m_iFigurationEffectState)
            {
               this.m_stTopEffect = GodsShieldTopPrimaryEffect.a_3926();
            }
            else if(FIGURATION_STATE_INTERMEDIATE == m_iFigurationEffectState)
            {
               this.m_stTopEffect = GodsShieldTopIntermediateEffect.a_3926();
            }
            else if(FIGURATION_STATE_ADVANCED == m_iFigurationEffectState)
            {
               this.m_stTopEffect = GodsShieldTopAdvancedEffect.a_3926();
            }
         }
         if(null != this.m_stTopEffect)
         {
            if(null != parent)
            {
               this.m_stTopEffect.a_1797(a_1283);
               this.m_stTopEffect.x = a_3491.a_1080 * a_1334.m_iXGridNo + 0.5 * (a_3491.a_1080 - this.m_stTopEffect.width) + iXShiftPos;
               if(a_1283)
               {
                  this.m_stTopEffect.x = BattleFieldView.a_1013 - this.m_stTopEffect.x;
               }
               this.m_stTopEffect.y = a_3491.a_1081 * a_1334.m_iYGridNo + 0.5 * (a_3491.a_1081 - this.m_stTopEffect.height) + iYShiftPos;
               iPosID = parent.getChildIndex(this);
               if(iPosID >= parent.numChildren - 1)
               {
                  parent.addChild(this.m_stTopEffect);
               }
               else
               {
                  parent.addChildAt(this.m_stTopEffect,iPosID + 1);
               }
               if(stFieldGrid.m_stCurrentBattbleFieldView.GetGameMoveMap())
               {
                  stFieldGrid.m_stCurrentBattbleFieldView.GetGameMoveMap().AddMoveDisplayObject(this.m_stTopEffect,stFieldGrid.m_iXGridNo,stFieldGrid.m_iYGridNo);
               }
            }
         }
      }
      
      public function addAvaterTopEffect() : void
      {
         var avaterPoY:int = 0;
         var stBaseTray:a_3977 = null;
         var iPosID:int = 0;
         var MaxHeight:int = 0;
         if(346162176 == this.a_1296.m_iShieldType)
         {
            this.m_BaseAutoPlayTopEffect = ThornRoseShieldTopEffect.a_3926();
         }
         if(null != this.m_BaseAutoPlayTopEffect && null != parent)
         {
            this.m_BaseAutoPlayTopEffect.a_1797(a_1283);
            this.m_BaseAutoPlayTopEffect.x = a_3491.a_1080 * (a_1334.m_iXGridNo + 0.5);
            if(a_1283)
            {
               this.m_BaseAutoPlayTopEffect.x = BattleFieldView.a_1013 - this.m_BaseAutoPlayTopEffect.x;
            }
            stBaseTray = a_1334.m_stTrayDefense;
            if(stBaseTray)
            {
               MaxHeight = stBaseTray.height > 55 ? 55 : int(stBaseTray.height);
               avaterPoY = stBaseTray.y + MaxHeight - this.height - 20 + stBaseTray.m_iOffsetByY;
            }
            else
            {
               avaterPoY = this.iYPosSheft + a_1334.m_iYGridNo * a_3491.a_1081 + (a_3491.a_1081 - this.height - 5);
            }
            avaterPoY -= this.stDisplayBitmap.y;
            this.m_BaseAutoPlayTopEffect.y = avaterPoY + 36;
            iPosID = parent.getChildIndex(this);
            if(iPosID >= parent.numChildren - 1)
            {
               parent.addChild(this.m_BaseAutoPlayTopEffect);
            }
            else
            {
               parent.addChildAt(this.m_BaseAutoPlayTopEffect,iPosID + 1);
            }
            if(stFieldGrid.m_stCurrentBattbleFieldView.GetGameMoveMap())
            {
               stFieldGrid.m_stCurrentBattbleFieldView.GetGameMoveMap().AddMoveDisplayObject(this.m_BaseAutoPlayTopEffect,stFieldGrid.m_iXGridNo,stFieldGrid.m_iYGridNo);
            }
         }
      }
      
      override public function a_3925(stAvatarDetailInfo:AvatarDetailInfo, stBattleAnim:IBattleAnim) : Boolean
      {
         var i:int = 0;
         this.a_1296 = stAvatarDetailInfo;
         m_iSexEx = (this.a_1296.m_iBodyType & 0xF0) == 16 ? 1 : 2;
         this.a_1293.a_3925(stAvatarDetailInfo);
         battleAnim = stBattleAnim;
         for(i = 0; i < this.a_1291.length; i++)
         {
            if(null != this.a_1291[i])
            {
               this.a_1291[i].dispose();
               this.a_1291[i] = null;
            }
         }
         for(i = 0; i < this.a_1292.length; i++)
         {
            if(null != this.a_1292[i])
            {
               this.a_1292[i] = null;
            }
         }
         a_3910();
         gotoAndStop(1);
         a_1315 = false;
         a_1314 = false;
         a_1316 = false;
         m_isFiveRowShot = false;
         a_1318 = false;
         a_1313 = false;
         m_iOnceShotNum = 0;
         a_1304 = b_183.b_184;
         m_isSuperFourShot = false;
         m_isSuperDoubleShot = false;
         m_isSuperThreeRowShot = false;
         m_isSuperFiveRowShot = false;
         m_isSuperBothWayShot = false;
         m_isSuperShotAllTheTime = false;
         m_iSuperOnceShotNum = 0;
         m_iSuperShotTypeID = b_183.b_184;
         m_iSuperShotIntervalTimeNum = 400;
         m_iSuperShotDelayTimeNum = 4;
         m_iSuperShotHurtForEach = 10;
         a_1309 = 26;
         a_1310 = 0;
         a_1311 = 10;
         this.m_numShotXRate = 1;
         this.m_numShotYRate = 1;
         m_iTransfigurationStatus = 0;
         m_iShotTransEnergyCount = 0;
         m_iShotBoundStopTime = 0;
         if(stAvatarDetailInfo.m_iGunType == 336658944)
         {
            a_1314 = true;
            a_1304 = b_183.b_202;
         }
         else if(stAvatarDetailInfo.m_iGunType == 336724224)
         {
            a_1315 = true;
            a_1304 = b_183.b_200;
         }
         else if(stAvatarDetailInfo.m_iGunType == 336661248)
         {
            a_1304 = b_183.b_199;
         }
         else if(stAvatarDetailInfo.m_iGunType == 336659456)
         {
            a_1316 = true;
            a_1304 = b_183.b_198;
            a_1313 = true;
         }
         else if(stAvatarDetailInfo.m_iGunType == 336659200)
         {
            a_1318 = true;
            a_1304 = b_183.b_198;
         }
         else if(stAvatarDetailInfo.m_iGunType == 336659712)
         {
            a_1304 = b_183.enm_CatHeadShot;
         }
         else if(stAvatarDetailInfo.m_iGunType == 336660224)
         {
            a_1304 = b_183.enm_DogHeadShot;
         }
         else if(stAvatarDetailInfo.m_iGunType == 336659968)
         {
            a_1304 = b_183.b_190;
         }
         else if(stAvatarDetailInfo.m_iGunType == 336724480)
         {
            a_1315 = true;
            a_1304 = b_183.enm_AvatarIcePowerGunShot;
         }
         else if(stAvatarDetailInfo.m_iGunType == 336660480)
         {
            a_1304 = b_183.enm_IceEggShot;
            this.m_numShotXRate = 1.1;
            this.m_numShotYRate = 0.7;
         }
         else if(stAvatarDetailInfo.m_iGunType == 336664832)
         {
            a_1304 = b_183.enm_NewFrostLiannuShot;
            a_1314 = true;
            this.m_numShotXRate = 1.1;
            this.m_numShotYRate = 0.7;
         }
         else if(stAvatarDetailInfo.m_iGunType == 336726016)
         {
            this.m_numShotXRate = 1.1;
            this.m_numShotYRate = 0.7;
         }
         else if(stAvatarDetailInfo.m_iGunType == 336724992)
         {
            a_1314 = true;
            a_1304 = b_183.b_202;
         }
         else if(stAvatarDetailInfo.m_iGunType == 336724736)
         {
            m_iOnceShotNum = 2;
            a_1304 = b_183.b_196;
         }
         else if(stAvatarDetailInfo.m_iGunType == 336725760)
         {
            m_iOnceShotNum = 2;
         }
         else if(stAvatarDetailInfo.m_iGunType == 336790016)
         {
            m_iOnceShotNum = 3;
         }
         else if(stAvatarDetailInfo.m_iGunType == 336664576)
         {
            m_iOnceShotNum = 2;
            a_1304 = b_183.b_196;
         }
         else if(stAvatarDetailInfo.m_iGunType == 336724784)
         {
            m_iOnceShotNum = 2;
            a_1304 = b_183.enm_GoldTakoyakiFollowShot;
         }
         else if(stAvatarDetailInfo.m_iGunType == 336725504)
         {
            this.m_numShotYRate = 0.5;
            a_1314 = true;
            a_1304 = b_183.enm_FireArrow;
         }
         return true;
      }
      
      private function OnAddToStageHandle(e:Event) : void
      {
         this.removeEventListener(Event.ADDED_TO_STAGE,this.OnAddToStageHandle);
         SetFigurationState(this.a_1296);
         if(a_1334 != null && m_bServerIssued)
         {
            this.SetBottomEffect();
            this.SetTopEffect();
            this.addAvaterTopEffect();
         }
      }
      
      override public function a_1797(stFieldGrid:a_3491) : Boolean
      {
         var GemLevel:int = 0;
         var GemFlag:Boolean = false;
         var FourthGemLevel:int = 0;
         var FourthGemFlag:Boolean = false;
         var Level:int = 0;
         var Flag:Boolean = false;
         var iSkillLevel:int = 0;
         var bSkillFlag:Boolean = false;
         this.m_iLastShotTime.Value = 0;
         var _loc_2:Number = NaN;
         var _loc_3:Number = NaN;
         var _loc_4:a_3491 = null;
         this.a_3929();
         super.a_1797(stFieldGrid);
         if(346162176 == this.a_1296.m_iShieldType && m_bServerIssued && a_2036.getInstance().m_isFirstPlaceAvatar)
         {
            a_2036.getInstance().m_isFirstPlaceAvatar = false;
            this.ProdudeEnergy();
         }
         this.addEventListener(Event.ADDED_TO_STAGE,this.OnAddToStageHandle);
         if(a_1324)
         {
            a_1324.length = 0;
         }
         if(this.a_1296)
         {
            a_1339 += 10 * this.a_1296.m_numDefenseForce;
         }
         if(m_isMyPlaced)
         {
            a_1334.m_stCurrentBattbleFieldView.m_isAutoPickUpEnergy = this.a_1296.m_isAutoPickUpEnergy;
            a_1334.m_stCurrentBattbleFieldView.m_isAutoPickUpProps = this.a_1296.m_isAutoPickUpProps;
         }
         this.m_ShotNumPerGroup = 1;
         if(this.a_1296.m_iGunType == 336660480)
         {
            a_1309 = 60;
            a_1310 = 2;
            a_1311 = 50;
            a_1304 = b_183.enm_IceEggShot;
         }
         else if(this.a_1296.m_iGunType == 336664832)
         {
            a_1309 = 60;
            a_1310 = 2;
            a_1311 = 50;
            a_1314 = true;
            a_1304 = b_183.enm_NewFrostLiannuShot;
         }
         else if(this.a_1296.m_iGunType == 336726016)
         {
            a_1309 = 70;
            a_1310 = 12;
            a_1311 = 20;
            a_1313 = true;
            a_1317 = 6;
            if(this.m_stSonicGunAvatar == null || !a_1334.m_stCurrentBattbleFieldView.contains(this.m_stSonicGunAvatar))
            {
               this.m_stSonicGunAvatar = SonicGunAvatar.a_4344() as SonicGunAvatar;
               this.m_stSonicGunAvatar.gotoAndStop(1);
               _loc_2 = a_3491.a_1080 * 0 + (a_3491.a_1080 - this.m_stSonicGunAvatar.width) + 30;
               _loc_3 = a_3491.a_1081 * a_1334.m_iYGridNo + (a_3491.a_1081 - this.m_stSonicGunAvatar.height) + 238;
               _loc_4 = a_1334.m_stCurrentBattbleFieldView.a_3438(0,3);
               if(a_1283)
               {
                  _loc_2 = BattleFieldView.a_1013 - _loc_2;
               }
               this.m_stSonicGunAvatar.iShotSequenceNum = m_iSuperFirstShotSequence;
               this.m_stSonicGunAvatar.a_1797(0,m_iSuperShotMoveSpeed,m_iSuperShotHurtForEach,_loc_2,_loc_3,a_1334.m_stCurrentBattbleFieldView,_loc_4);
               a_1334.m_stCurrentBattbleFieldView.addChildAt(this.m_stSonicGunAvatar,a_1334.m_stCurrentBattbleFieldView.a_3433());
            }
         }
         else if(this.a_1296.m_iGunType == 336724736)
         {
            a_1313 = true;
            a_1309 = 40;
            a_1310 = 10;
            a_1317 = 6;
            a_1311 = 50;
         }
         else if(this.a_1296.m_iGunType == 336725760)
         {
            a_1313 = true;
            a_1309 = 40;
            a_1310 = 10;
            a_1317 = 2;
            a_1311 = 45;
         }
         else if(this.a_1296.m_iGunType == 336790016)
         {
            a_1313 = true;
            a_1309 = 60;
            a_1310 = 6;
            a_1317 = 3;
            a_1311 = 125;
            m_numSputteringHurtRate = 0.1;
         }
         else if(this.a_1296.m_iGunType == 336664576)
         {
            a_1313 = true;
            a_1309 = 40;
            a_1310 = 10;
            a_1317 = 8;
            a_1311 = 65;
         }
         else if(this.a_1296.m_iGunType == 336660224)
         {
            a_1311 = 15;
         }
         else if(this.a_1296.m_iGunType == 336724784)
         {
            a_1313 = true;
            a_1309 = 40;
            a_1310 = 10;
            a_1317 = 6;
            a_1311 = 55;
         }
         else if(this.a_1296.m_iGunType == 336725504)
         {
            a_1313 = true;
            a_1309 = 30;
            a_1317 = 8;
            a_1311 = 30;
         }
         else if(this.a_1296.m_iGunType == 336726272)
         {
            a_1309 = 70;
            a_1310 = 10;
            a_1311 = 150;
            a_1313 = true;
            a_1317 = 4;
         }
         else if(this.a_1296.m_iGunType == 336789760)
         {
            a_1309 = 700;
            a_1310 = 10;
            a_1311 = 900;
            a_1313 = true;
            a_1317 = 2;
         }
         if(this.a_1296.m_iSuperGunType == 350224688)
         {
            m_iSuperShotHurtForEach = 200;
         }
         else if(this.a_1296.m_iSuperGunType == 350224944)
         {
            m_isSuperDoubleShot = true;
            m_iSuperShotHurtForEach = 200;
            m_iSuperContinueShotInterval = 4;
         }
         else if(this.a_1296.m_iSuperGunType == 350229296)
         {
            m_isSuperShotAllTheTime = true;
            m_numSputteringHurtRate = 0.2;
            m_iSuperShotHurtForEach = 250;
            m_iSuperShotIntervalTimeNum = 400;
            m_iSuperContinueShotInterval = 4;
            m_iSuperShotDelayTimeNum = 4;
         }
         if(this.a_1296.m_iSuperGunType == 350225712)
         {
            m_isSuperThreeRowShot = true;
            m_isSuperShotAllTheTime = true;
            m_iSuperShotHurtForEach = 200;
            m_iSuperContinueShotInterval = 1;
            m_iSuperShotIntervalTimeNum = 80;
         }
         else if(this.a_1296.m_iSuperGunType == 350225968)
         {
            m_isSuperFiveRowShot = true;
            m_isSuperShotAllTheTime = true;
            m_iSuperShotHurtForEach = 200;
            m_iSuperContinueShotInterval = 1;
            m_iSuperShotIntervalTimeNum = 80;
         }
         else if(this.a_1296.m_iSuperGunType == 350228784)
         {
            m_iSuperShotHurtForEach = 250;
            m_iSuperShotIntervalTimeNum = 400;
         }
         else if(this.a_1296.m_iSuperGunType == 350229040)
         {
            m_iSuperShotHurtForEach = 200;
            m_iSuperShotIntervalTimeNum = 500;
            m_iSuperShotMoveSpeed = 0;
            m_iSuperContinueShotInterval = 4;
            m_iSuperShotDelayTimeNum = 4;
         }
         else if(this.a_1296.m_iSuperGunType == 350229808)
         {
            m_isSuperShotAllTheTime = true;
            m_iSuperShotHurtForEach = 100;
            m_iSuperShotMoveSpeed = 0;
            m_iSuperContinueShotInterval = 12;
            m_iSuperShotIntervalTimeNum = 160;
            m_iSuperShotDelayTimeNum = 16;
            if(this.m_stSecretWishAvatar == null || !a_1334.m_stCurrentBattbleFieldView.contains(this.m_stSecretWishAvatar))
            {
               this.m_stSecretWishAvatar = SecretWishAvatar.a_4344() as SecretWishAvatar;
               this.m_stSecretWishAvatar.gotoAndStop(1);
               _loc_2 = a_3491.a_1080 * 0 + (a_3491.a_1080 - this.m_stSecretWishAvatar.width);
               _loc_3 = a_3491.a_1081 * 3 + (a_3491.a_1081 - this.m_stSecretWishAvatar.height) - 10;
               _loc_4 = a_1334.m_stCurrentBattbleFieldView.a_3438(0,3);
               if(a_1283)
               {
                  _loc_2 = BattleFieldView.a_1013 - _loc_2;
               }
               this.m_stSecretWishAvatar.iShotSequenceNum = m_iSuperFirstShotSequence;
               this.m_stSecretWishAvatar.a_1797(0,m_iSuperShotMoveSpeed,m_iSuperShotHurtForEach,_loc_2,_loc_3,a_1334.m_stCurrentBattbleFieldView,_loc_4);
               a_1334.m_stCurrentBattbleFieldView.addChildAt(this.m_stSecretWishAvatar,a_1334.m_stCurrentBattbleFieldView.a_3433());
            }
         }
         else if(this.a_1296.m_iSuperGunType == 350229552)
         {
            m_isSuperShotAllTheTime = true;
            m_iSuperShotHurtForEach = 180;
            m_iSuperShotMoveSpeed = 8;
            m_iSuperContinueShotInterval = 12;
            m_iSuperShotIntervalTimeNum = 300;
            m_iSuperShotDelayTimeNum = 16;
            GemLevel = GetGenDegree(344199953,this.a_1296.m_arrGenInfoArray);
            GemFlag = IsExitSkill([344199953],this.a_1296.m_arrGenInfoArray);
            this.m_FourthGemLevel = GemFlag ? GemLevel : -1;
            if(this.m_FourthGemLevel == -1)
            {
               this.m_iGodShowState = 1;
               if(this.m_stShadowMeowFirstAvatar == null || !a_1334.m_stCurrentBattbleFieldView.contains(this.m_stShadowMeowFirstAvatar))
               {
                  this.m_stShadowMeowFirstAvatar = ShadowMeowFirstAvatar.a_4344() as ShadowMeowFirstAvatar;
                  this.m_stShadowMeowFirstAvatar.gotoAndStop(1);
                  _loc_2 = a_3491.a_1080 * 0 + (a_3491.a_1080 - this.m_stShadowMeowFirstAvatar.width);
                  _loc_3 = a_3491.a_1081 * 3 + (a_3491.a_1081 - this.m_stShadowMeowFirstAvatar.height) + 50;
                  _loc_4 = a_1334.m_stCurrentBattbleFieldView.a_3438(0,3);
                  if(a_1283)
                  {
                     _loc_2 = BattleFieldView.a_1013 - _loc_2;
                  }
                  this.m_stShadowMeowFirstAvatar.iShotSequenceNum = m_iSuperFirstShotSequence;
                  this.m_stShadowMeowFirstAvatar.a_1797(0,m_iSuperShotMoveSpeed,m_iSuperShotHurtForEach,_loc_2,_loc_3,a_1334.m_stCurrentBattbleFieldView,_loc_4);
                  a_1334.m_stCurrentBattbleFieldView.addChildAt(this.m_stShadowMeowFirstAvatar,a_1334.m_stCurrentBattbleFieldView.a_3433());
               }
            }
            else if(this.m_FourthGemLevel <= 5)
            {
               this.m_iGodShowState = 2;
               if(this.m_stShadowMeowSecondAvatar == null || !a_1334.m_stCurrentBattbleFieldView.contains(this.m_stShadowMeowSecondAvatar))
               {
                  this.m_stShadowMeowSecondAvatar = ShadowMeowSecondAvatar.a_4344() as ShadowMeowSecondAvatar;
                  this.m_stShadowMeowSecondAvatar.gotoAndStop(1);
                  _loc_2 = a_3491.a_1080 * 0 + (a_3491.a_1080 - this.m_stShadowMeowSecondAvatar.width);
                  _loc_3 = a_3491.a_1081 * 3 + (a_3491.a_1081 - this.m_stShadowMeowSecondAvatar.height) + 50;
                  _loc_4 = a_1334.m_stCurrentBattbleFieldView.a_3438(0,3);
                  if(a_1283)
                  {
                     _loc_2 = BattleFieldView.a_1013 - _loc_2;
                  }
                  this.m_stShadowMeowSecondAvatar.iShotSequenceNum = m_iSuperFirstShotSequence;
                  this.m_stShadowMeowSecondAvatar.a_1797(0,m_iSuperShotMoveSpeed,m_iSuperShotHurtForEach,_loc_2,_loc_3,a_1334.m_stCurrentBattbleFieldView,_loc_4);
                  a_1334.m_stCurrentBattbleFieldView.addChildAt(this.m_stShadowMeowSecondAvatar,a_1334.m_stCurrentBattbleFieldView.a_3433());
               }
            }
            else if(this.m_FourthGemLevel <= 9)
            {
               this.m_iGodShowState = 3;
               if(this.m_stShadowMeowThirdAvatar == null || !a_1334.m_stCurrentBattbleFieldView.contains(this.m_stShadowMeowThirdAvatar))
               {
                  this.m_stShadowMeowThirdAvatar = ShadowMeowThirdAvatar.a_4344() as ShadowMeowThirdAvatar;
                  this.m_stShadowMeowThirdAvatar.gotoAndStop(1);
                  _loc_2 = a_3491.a_1080 * 0 + (a_3491.a_1080 - this.m_stShadowMeowThirdAvatar.width);
                  _loc_3 = a_3491.a_1081 * 3 + (a_3491.a_1081 - this.m_stShadowMeowThirdAvatar.height) + 50;
                  _loc_4 = a_1334.m_stCurrentBattbleFieldView.a_3438(0,3);
                  if(a_1283)
                  {
                     _loc_2 = BattleFieldView.a_1013 - _loc_2;
                  }
                  this.m_stShadowMeowThirdAvatar.iShotSequenceNum = m_iSuperFirstShotSequence;
                  this.m_stShadowMeowThirdAvatar.a_1797(0,m_iSuperShotMoveSpeed,m_iSuperShotHurtForEach,_loc_2,_loc_3,a_1334.m_stCurrentBattbleFieldView,_loc_4);
                  a_1334.m_stCurrentBattbleFieldView.addChildAt(this.m_stShadowMeowThirdAvatar,a_1334.m_stCurrentBattbleFieldView.a_3433());
               }
            }
            else if(this.m_FourthGemLevel >= 10)
            {
               this.m_iGodShowState = 4;
               if(this.m_stShadowMeowFourthAvatar == null || !a_1334.m_stCurrentBattbleFieldView.contains(this.m_stShadowMeowFourthAvatar))
               {
                  this.m_stShadowMeowFourthAvatar = ShadowMeowFourthAvatar.a_4344() as ShadowMeowFourthAvatar;
                  this.m_stShadowMeowFourthAvatar.gotoAndStop(1);
                  _loc_2 = a_3491.a_1080 * 0 + (a_3491.a_1080 - this.m_stShadowMeowFourthAvatar.width);
                  _loc_3 = a_3491.a_1081 * 3 + (a_3491.a_1081 - this.m_stShadowMeowFourthAvatar.height) + 50;
                  _loc_4 = a_1334.m_stCurrentBattbleFieldView.a_3438(0,3);
                  if(a_1283)
                  {
                     _loc_2 = BattleFieldView.a_1013 - _loc_2;
                  }
                  this.m_stShadowMeowFourthAvatar.iShotSequenceNum = m_iSuperFirstShotSequence;
                  this.m_stShadowMeowFourthAvatar.a_1797(0,m_iSuperShotMoveSpeed,m_iSuperShotHurtForEach,_loc_2,_loc_3,a_1334.m_stCurrentBattbleFieldView,_loc_4);
                  a_1334.m_stCurrentBattbleFieldView.addChildAt(this.m_stShadowMeowFourthAvatar,a_1334.m_stCurrentBattbleFieldView.a_3433());
               }
            }
         }
         else if(this.a_1296.m_iSuperGunType == 350230064)
         {
            m_isSuperShotAllTheTime = true;
            m_iSuperShotHurtForEach = 350;
            m_iSuperShotMoveSpeed = 10;
            m_iSuperContinueShotInterval = 2;
            m_iSuperShotIntervalTimeNum = 360;
            m_iSuperShotDelayTimeNum = 17;
            m_numSputteringHurtRate = 0.5;
            if(this.m_stExplosivesOutsideAvater == null || !a_1334.m_stCurrentBattbleFieldView.contains(this.m_stExplosivesOutsideAvater))
            {
               this.m_stExplosivesOutsideAvater = ExplosivesOutsideAvater.a_4344() as ExplosivesOutsideAvater;
               this.m_stExplosivesOutsideAvater.gotoAndStop(1);
               _loc_2 = a_3491.a_1080 * 0 + (a_3491.a_1080 - this.m_stExplosivesOutsideAvater.width) - 4;
               _loc_3 = a_3491.a_1081 * 3 + (a_3491.a_1081 - this.m_stExplosivesOutsideAvater.height);
               _loc_4 = a_1334.m_stCurrentBattbleFieldView.a_3438(0,3);
               if(a_1283)
               {
                  _loc_2 = BattleFieldView.a_1013 - _loc_2;
               }
               this.m_stExplosivesOutsideAvater.iShotSequenceNum = m_iSuperFirstShotSequence;
               this.m_stExplosivesOutsideAvater.a_1797(0,m_iSuperShotMoveSpeed,m_iSuperShotHurtForEach,_loc_2,_loc_3,a_1334.m_stCurrentBattbleFieldView,_loc_4);
               a_1334.m_stCurrentBattbleFieldView.addChildAt(this.m_stExplosivesOutsideAvater,a_1334.m_stCurrentBattbleFieldView.a_3433());
            }
         }
         else if(this.a_1296.m_iSuperGunType == 350226736)
         {
            m_isSuperShotAllTheTime = true;
            m_iSuperShotHurtForEach = 230;
            m_iSuperShotMoveSpeed = 10;
            m_iSuperContinueShotInterval = 4;
            m_iSuperShotIntervalTimeNum = 300;
            m_iSuperShotDelayTimeNum = 16;
            FourthGemLevel = GetGenDegree(344141841,this.a_1296.m_arrGenInfoArray);
            FourthGemFlag = IsExitSkill([344141841],this.a_1296.m_arrGenInfoArray);
            this.m_FourthGemLevel = FourthGemFlag ? FourthGemLevel : -1;
            Level = GetGenDegree(344129553,this.a_1296.m_arrGenInfoArray);
            Flag = IsExitSkill([344129553],this.a_1296.m_arrGenInfoArray);
            if(Level < 12 && Flag)
            {
               if(Level >= 0 && Level < 5)
               {
                  this.m_iGodShowState = 1;
               }
               else if(Level >= 6 && Level < 9)
               {
                  this.m_iGodShowState = 2;
               }
               else if(Level >= 10 && Level < 12)
               {
                  this.m_iGodShowState = 3;
               }
               if(this.m_stAvatarSuperDogDeathGodOneShot == null || !a_1334.m_stCurrentBattbleFieldView.contains(this.m_stAvatarSuperDogDeathGodOneShot))
               {
                  this.m_stAvatarSuperDogDeathGodOneShot = AvatarSuperDogDeathGodOneShot.a_4344() as AvatarSuperDogDeathGodOneShot;
                  this.m_stAvatarSuperDogDeathGodOneShot.gotoAndStop(1);
                  _loc_2 = a_3491.a_1080 * 0 + (a_3491.a_1080 - this.m_stAvatarSuperDogDeathGodOneShot.width);
                  _loc_3 = a_3491.a_1081 * 3 + (a_3491.a_1081 - this.m_stAvatarSuperDogDeathGodOneShot.height) + 50;
                  _loc_4 = a_1334.m_stCurrentBattbleFieldView.a_3438(0,3);
                  if(a_1283)
                  {
                     _loc_2 = BattleFieldView.a_1013 - _loc_2;
                  }
                  this.m_stAvatarSuperDogDeathGodOneShot.iShotSequenceNum = m_iSuperFirstShotSequence;
                  this.m_stAvatarSuperDogDeathGodOneShot.a_1797(0,m_iSuperShotMoveSpeed,m_iSuperShotHurtForEach,_loc_2,_loc_3,a_1334.m_stCurrentBattbleFieldView,_loc_4);
                  a_1334.m_stCurrentBattbleFieldView.addChildAt(this.m_stAvatarSuperDogDeathGodOneShot,a_1334.m_stCurrentBattbleFieldView.a_3433());
               }
            }
            else if(Level >= 12 && Level < 14 && Flag)
            {
               this.m_iGodShowState = 4;
               if(this.m_stAvatarSuperDogDeathGodTwoShot == null || !a_1334.m_stCurrentBattbleFieldView.contains(this.m_stAvatarSuperDogDeathGodTwoShot))
               {
                  this.m_stAvatarSuperDogDeathGodTwoShot = AvatarSuperDogDeathGodTwoShot.a_4344() as AvatarSuperDogDeathGodTwoShot;
                  this.m_stAvatarSuperDogDeathGodTwoShot.gotoAndStop(1);
                  _loc_2 = a_3491.a_1080 * 0 + (a_3491.a_1080 - this.m_stAvatarSuperDogDeathGodTwoShot.width);
                  _loc_3 = a_3491.a_1081 * 3 + (a_3491.a_1081 - this.m_stAvatarSuperDogDeathGodTwoShot.height) + 50;
                  _loc_4 = a_1334.m_stCurrentBattbleFieldView.a_3438(0,3);
                  if(a_1283)
                  {
                     _loc_2 = BattleFieldView.a_1013 - _loc_2;
                  }
                  this.m_stAvatarSuperDogDeathGodTwoShot.iShotSequenceNum = m_iSuperFirstShotSequence;
                  this.m_stAvatarSuperDogDeathGodTwoShot.a_1797(0,m_iSuperShotMoveSpeed,m_iSuperShotHurtForEach,_loc_2,_loc_3,a_1334.m_stCurrentBattbleFieldView,_loc_4);
                  a_1334.m_stCurrentBattbleFieldView.addChildAt(this.m_stAvatarSuperDogDeathGodTwoShot,a_1334.m_stCurrentBattbleFieldView.a_3433());
               }
            }
            else if(Level >= 14 && Flag)
            {
               this.m_iGodShowState = 5;
               if(this.m_stAvatarSuperDogDeathGodThreeShot == null || !a_1334.m_stCurrentBattbleFieldView.contains(this.m_stAvatarSuperDogDeathGodThreeShot))
               {
                  this.m_stAvatarSuperDogDeathGodThreeShot = AvatarSuperDogDeathGodThreeShot.a_4344() as AvatarSuperDogDeathGodThreeShot;
                  this.m_stAvatarSuperDogDeathGodThreeShot.gotoAndStop(1);
                  _loc_2 = a_3491.a_1080 * 0 + (a_3491.a_1080 - this.m_stAvatarSuperDogDeathGodThreeShot.width);
                  _loc_3 = a_3491.a_1081 * 3 + (a_3491.a_1081 - this.m_stAvatarSuperDogDeathGodThreeShot.height) + 50;
                  _loc_4 = a_1334.m_stCurrentBattbleFieldView.a_3438(0,3);
                  if(a_1283)
                  {
                     _loc_2 = BattleFieldView.a_1013 - _loc_2;
                  }
                  this.m_stAvatarSuperDogDeathGodThreeShot.iShotSequenceNum = m_iSuperFirstShotSequence;
                  this.m_stAvatarSuperDogDeathGodThreeShot.a_1797(0,m_iSuperShotMoveSpeed,m_iSuperShotHurtForEach,_loc_2,_loc_3,a_1334.m_stCurrentBattbleFieldView,_loc_4);
                  a_1334.m_stCurrentBattbleFieldView.addChildAt(this.m_stAvatarSuperDogDeathGodThreeShot,a_1334.m_stCurrentBattbleFieldView.a_3433());
               }
            }
            else if(!bSkillFlag)
            {
               this.m_iGodShowState = 0;
               if(this.m_stAvatarSuperDogDeathGodOneShot == null || !a_1334.m_stCurrentBattbleFieldView.contains(this.m_stAvatarSuperDogDeathGodOneShot))
               {
                  this.m_stAvatarSuperDogDeathGodOneShot = AvatarSuperDogDeathGodOneShot.a_4344() as AvatarSuperDogDeathGodOneShot;
                  this.m_stAvatarSuperDogDeathGodOneShot.gotoAndStop(1);
                  _loc_2 = a_3491.a_1080 * 0 + (a_3491.a_1080 - this.m_stAvatarSuperDogDeathGodOneShot.width);
                  _loc_3 = a_3491.a_1081 * 3 + (a_3491.a_1081 - this.m_stAvatarSuperDogDeathGodOneShot.height) + 50;
                  _loc_4 = a_1334.m_stCurrentBattbleFieldView.a_3438(0,3);
                  if(a_1283)
                  {
                     _loc_2 = BattleFieldView.a_1013 - _loc_2;
                  }
                  this.m_stAvatarSuperDogDeathGodOneShot.iShotSequenceNum = m_iSuperFirstShotSequence;
                  this.m_stAvatarSuperDogDeathGodOneShot.a_1797(0,m_iSuperShotMoveSpeed,m_iSuperShotHurtForEach,_loc_2,_loc_3,a_1334.m_stCurrentBattbleFieldView,_loc_4);
                  a_1334.m_stCurrentBattbleFieldView.addChildAt(this.m_stAvatarSuperDogDeathGodOneShot,a_1334.m_stCurrentBattbleFieldView.a_3433());
               }
            }
         }
         else if(this.a_1296.m_iSuperGunType == 350230320)
         {
            m_isSuperShotAllTheTime = true;
            m_iSuperShotHurtForEach = 500;
            m_iSuperShotIntervalTimeNum = 300;
            m_iSuperShotMoveSpeed = 10;
            m_iSuperContinueShotInterval = 4;
            m_iSuperShotDelayTimeNum = 16;
            m_numSputteringHurtRate = 0.05;
            this.m_iShotGemLevel = GetGenDegree(344205585,this.a_1296.m_arrGenInfoArray);
            this.m_iShotGemLevel = IsExitSkill([344205585],this.a_1296.m_arrGenInfoArray) ? this.m_iShotGemLevel : -1;
            this.m_FourthGemLevel = GetGenDegree(344205329,this.a_1296.m_arrGenInfoArray);
            this.m_FourthGemLevel = IsExitSkill([344205329],this.a_1296.m_arrGenInfoArray) ? this.m_FourthGemLevel : -1;
            if(this.m_iShotGemLevel < 0)
            {
               this.m_iGodShowState = 1;
            }
            else if(this.m_iShotGemLevel <= 5)
            {
               this.m_iGodShowState = 2;
            }
            else if(this.m_iShotGemLevel <= 10)
            {
               this.m_iGodShowState = 3;
            }
            else if(this.m_iShotGemLevel <= 14)
            {
               this.m_iGodShowState = 4;
            }
            else
            {
               this.m_iGodShowState = 5;
            }
            if(this.m_FourthGemLevel < 0)
            {
               this.m_SpecialGemLevel = 1;
               this.m_ShotNumPerGroup = 1;
            }
            else if(this.m_FourthGemLevel <= 3)
            {
               this.m_SpecialGemLevel = 2;
               this.m_ShotNumPerGroup = 1;
            }
            else if(this.m_FourthGemLevel <= 7)
            {
               this.m_SpecialGemLevel = 3;
               this.m_ShotNumPerGroup = 2;
            }
            else if(this.m_FourthGemLevel <= 10)
            {
               this.m_SpecialGemLevel = 4;
               this.m_ShotNumPerGroup = 2;
            }
            else if(this.m_FourthGemLevel <= 13)
            {
               this.m_SpecialGemLevel = 5;
               this.m_ShotNumPerGroup = 3;
            }
            else if(this.m_FourthGemLevel <= 14)
            {
               this.m_SpecialGemLevel = 6;
               this.m_ShotNumPerGroup = 3;
            }
            else if(this.m_FourthGemLevel <= 15)
            {
               this.m_SpecialGemLevel = 7;
               this.m_ShotNumPerGroup = 3;
            }
            this.m_iAttackAppearance = this.getLampGodAttackAppearanceByGemLev(this.a_1296.m_arrGenInfoArray);
            if(this.m_iAttackAppearance)
            {
               this.m_iAttackAppearance.gotoAndStop(1);
               _loc_2 = a_3491.a_1080 * 0 + (a_3491.a_1080 - this.m_iAttackAppearance.width);
               _loc_3 = a_3491.a_1081 * 4;
               _loc_4 = a_1334.m_stCurrentBattbleFieldView.a_3438(0,3);
               if(a_1283)
               {
                  _loc_2 = BattleFieldView.a_1013 - _loc_2;
               }
               this.m_iAttackAppearance.iShotSequenceNum = m_iSuperFirstShotSequence;
               this.m_iAttackAppearance.a_1797(0,m_iSuperShotMoveSpeed,m_iSuperShotHurtForEach,_loc_2,_loc_3,a_1334.m_stCurrentBattbleFieldView,_loc_4);
               a_1334.m_stCurrentBattbleFieldView.addChildAt(this.m_iAttackAppearance,a_1334.m_stCurrentBattbleFieldView.a_3433());
            }
         }
         else if(this.a_1296.m_iSuperGunType == 350226992)
         {
            m_iSuperShotHurtForEach = 60;
            m_iSuperShotMoveSpeed = 0;
            m_iSuperContinueShotInterval = 4;
            m_iSuperShotIntervalTimeNum = 300;
            m_iSuperShotDelayTimeNum = 4;
         }
         else if(this.a_1296.m_iSuperGunType == 350226224)
         {
            m_isSuperShotAllTheTime = true;
            m_iSuperShotHurtForEach = 200;
            m_iSuperContinueShotInterval = 4;
            m_iSuperShotIntervalTimeNum = 300;
            m_iSuperShotDelayTimeNum = 4;
            iSkillLevel = GetGenDegree(344138000,this.a_1296.m_arrGenInfoArray);
            bSkillFlag = IsExitSkill([344138000],this.a_1296.m_arrGenInfoArray);
            if(iSkillLevel >= 14 && bSkillFlag)
            {
               this.m_iGodShowState = 5;
               if(this.m_stAvatarSuperDeathGodFiveShot == null || !a_1334.m_stCurrentBattbleFieldView.contains(this.m_stAvatarSuperDeathGodFiveShot))
               {
                  this.m_stAvatarSuperDeathGodFiveShot = AvatarSuperDeathGodFiveShot.a_4344() as AvatarSuperDeathGodFiveShot;
                  this.m_stAvatarSuperDeathGodFiveShot.gotoAndStop(1);
                  _loc_2 = a_3491.a_1080 * 0 + (a_3491.a_1080 - this.m_stAvatarSuperDeathGodFiveShot.width);
                  _loc_3 = a_3491.a_1081 * 3 + (a_3491.a_1081 - this.m_stAvatarSuperDeathGodFiveShot.height) + 50;
                  _loc_4 = a_1334.m_stCurrentBattbleFieldView.a_3438(0,3);
                  if(a_1283)
                  {
                     _loc_2 = BattleFieldView.a_1013 - _loc_2;
                  }
                  this.m_stAvatarSuperDeathGodFiveShot.iShotSequenceNum = m_iSuperFirstShotSequence;
                  this.m_stAvatarSuperDeathGodFiveShot.a_1797(0,m_iSuperShotMoveSpeed,m_iSuperShotHurtForEach,_loc_2,_loc_3,a_1334.m_stCurrentBattbleFieldView,_loc_4);
                  a_1334.m_stCurrentBattbleFieldView.addChildAt(this.m_stAvatarSuperDeathGodFiveShot,a_1334.m_stCurrentBattbleFieldView.a_3433());
               }
            }
            else if(iSkillLevel >= 12 && iSkillLevel < 14 && bSkillFlag)
            {
               this.m_iGodShowState = 4;
               if(this.m_stAvatarSuperDeathGodFourShot == null || !a_1334.m_stCurrentBattbleFieldView.contains(this.m_stAvatarSuperDeathGodFourShot))
               {
                  this.m_stAvatarSuperDeathGodFourShot = AvatarSuperDeathGodFourShot.a_4344() as AvatarSuperDeathGodFourShot;
                  this.m_stAvatarSuperDeathGodFourShot.gotoAndStop(1);
                  _loc_2 = a_3491.a_1080 * 0 + (a_3491.a_1080 - this.m_stAvatarSuperDeathGodFourShot.width);
                  _loc_3 = a_3491.a_1081 * 3 + (a_3491.a_1081 - this.m_stAvatarSuperDeathGodFourShot.height) + 50;
                  _loc_4 = a_1334.m_stCurrentBattbleFieldView.a_3438(0,3);
                  if(a_1283)
                  {
                     _loc_2 = BattleFieldView.a_1013 - _loc_2;
                  }
                  this.m_stAvatarSuperDeathGodFourShot.iShotSequenceNum = m_iSuperFirstShotSequence;
                  this.m_stAvatarSuperDeathGodFourShot.a_1797(0,m_iSuperShotMoveSpeed,m_iSuperShotHurtForEach,_loc_2,_loc_3,a_1334.m_stCurrentBattbleFieldView,_loc_4);
                  a_1334.m_stCurrentBattbleFieldView.addChildAt(this.m_stAvatarSuperDeathGodFourShot,a_1334.m_stCurrentBattbleFieldView.a_3433());
               }
            }
            else if(iSkillLevel >= 10 && iSkillLevel < 12 && bSkillFlag)
            {
               this.m_iGodShowState = 3;
               if(this.m_stAvatarSuperDeathGodThreeShot == null || !a_1334.m_stCurrentBattbleFieldView.contains(this.m_stAvatarSuperDeathGodThreeShot))
               {
                  this.m_stAvatarSuperDeathGodThreeShot = AvatarSuperDeathGodThreeShot.a_4344() as AvatarSuperDeathGodThreeShot;
                  this.m_stAvatarSuperDeathGodThreeShot.gotoAndStop(1);
                  _loc_2 = a_3491.a_1080 * 0 + (a_3491.a_1080 - this.m_stAvatarSuperDeathGodThreeShot.width);
                  _loc_3 = a_3491.a_1081 * 3 + (a_3491.a_1081 - this.m_stAvatarSuperDeathGodThreeShot.height) + 50;
                  _loc_4 = a_1334.m_stCurrentBattbleFieldView.a_3438(0,3);
                  if(a_1283)
                  {
                     _loc_2 = BattleFieldView.a_1013 - _loc_2;
                  }
                  this.m_stAvatarSuperDeathGodThreeShot.iShotSequenceNum = m_iSuperFirstShotSequence;
                  this.m_stAvatarSuperDeathGodThreeShot.a_1797(0,m_iSuperShotMoveSpeed,m_iSuperShotHurtForEach,_loc_2,_loc_3,a_1334.m_stCurrentBattbleFieldView,_loc_4);
                  a_1334.m_stCurrentBattbleFieldView.addChildAt(this.m_stAvatarSuperDeathGodThreeShot,a_1334.m_stCurrentBattbleFieldView.a_3433());
               }
            }
            else if(iSkillLevel >= 6 && iSkillLevel < 10 && bSkillFlag)
            {
               this.m_iGodShowState = 2;
               if(this.m_stAvatarSuperDeathGodTwoShot == null || !a_1334.m_stCurrentBattbleFieldView.contains(this.m_stAvatarSuperDeathGodTwoShot))
               {
                  this.m_stAvatarSuperDeathGodTwoShot = AvatarSuperDeathGodTwoShot.a_4344() as AvatarSuperDeathGodTwoShot;
                  this.m_stAvatarSuperDeathGodTwoShot.gotoAndStop(1);
                  _loc_2 = a_3491.a_1080 * 0 + (a_3491.a_1080 - this.m_stAvatarSuperDeathGodTwoShot.width);
                  _loc_3 = a_3491.a_1081 * 3 + (a_3491.a_1081 - this.m_stAvatarSuperDeathGodTwoShot.height) + 50;
                  _loc_4 = a_1334.m_stCurrentBattbleFieldView.a_3438(0,3);
                  if(a_1283)
                  {
                     _loc_2 = BattleFieldView.a_1013 - _loc_2;
                  }
                  this.m_stAvatarSuperDeathGodTwoShot.iShotSequenceNum = m_iSuperFirstShotSequence;
                  this.m_stAvatarSuperDeathGodTwoShot.a_1797(0,m_iSuperShotMoveSpeed,m_iSuperShotHurtForEach,_loc_2,_loc_3,a_1334.m_stCurrentBattbleFieldView,_loc_4);
                  a_1334.m_stCurrentBattbleFieldView.addChildAt(this.m_stAvatarSuperDeathGodTwoShot,a_1334.m_stCurrentBattbleFieldView.a_3433());
               }
            }
            else if(iSkillLevel < 6 && bSkillFlag)
            {
               this.m_iGodShowState = 1;
               if(this.m_stAvatarSuperDeathGodOneShot == null || !a_1334.m_stCurrentBattbleFieldView.contains(this.m_stAvatarSuperDeathGodOneShot))
               {
                  this.m_stAvatarSuperDeathGodOneShot = AvatarSuperDeathGodOneShot.a_4344() as AvatarSuperDeathGodOneShot;
                  this.m_stAvatarSuperDeathGodOneShot.gotoAndStop(1);
                  _loc_2 = a_3491.a_1080 * 0 + (a_3491.a_1080 - this.m_stAvatarSuperDeathGodOneShot.width);
                  _loc_3 = a_3491.a_1081 * 3 + (a_3491.a_1081 - this.m_stAvatarSuperDeathGodOneShot.height) + 50;
                  _loc_4 = a_1334.m_stCurrentBattbleFieldView.a_3438(0,3);
                  if(a_1283)
                  {
                     _loc_2 = BattleFieldView.a_1013 - _loc_2;
                  }
                  this.m_stAvatarSuperDeathGodOneShot.iShotSequenceNum = m_iSuperFirstShotSequence;
                  this.m_stAvatarSuperDeathGodOneShot.a_1797(0,m_iSuperShotMoveSpeed,m_iSuperShotHurtForEach,_loc_2,_loc_3,a_1334.m_stCurrentBattbleFieldView,_loc_4);
                  a_1334.m_stCurrentBattbleFieldView.addChildAt(this.m_stAvatarSuperDeathGodOneShot,a_1334.m_stCurrentBattbleFieldView.a_3433());
               }
            }
            else if(!bSkillFlag)
            {
               this.m_iGodShowState = 0;
               if(this.m_stAvatarSuperDeathGodShot == null || !a_1334.m_stCurrentBattbleFieldView.contains(this.m_stAvatarSuperDeathGodShot))
               {
                  this.m_stAvatarSuperDeathGodShot = AvatarSuperDeathGodShot.a_4344() as AvatarSuperDeathGodShot;
                  this.m_stAvatarSuperDeathGodShot.gotoAndStop(1);
                  _loc_2 = a_3491.a_1080 * 0 + (a_3491.a_1080 - this.m_stAvatarSuperDeathGodShot.width);
                  _loc_3 = a_3491.a_1081 * 3 + (a_3491.a_1081 - this.m_stAvatarSuperDeathGodShot.height) + 50;
                  _loc_4 = a_1334.m_stCurrentBattbleFieldView.a_3438(0,3);
                  if(a_1283)
                  {
                     _loc_2 = BattleFieldView.a_1013 - _loc_2;
                  }
                  this.m_stAvatarSuperDeathGodShot.iShotSequenceNum = m_iSuperFirstShotSequence;
                  this.m_stAvatarSuperDeathGodShot.a_1797(0,m_iSuperShotMoveSpeed,m_iSuperShotHurtForEach,_loc_2,_loc_3,a_1334.m_stCurrentBattbleFieldView,_loc_4);
                  a_1334.m_stCurrentBattbleFieldView.addChildAt(this.m_stAvatarSuperDeathGodShot,a_1334.m_stCurrentBattbleFieldView.a_3433());
               }
            }
         }
         return true;
      }
      
      protected function a_3928() : void
      {
         if(null == this.a_1294)
         {
            this.a_1294 = a_4113.a_3926();
         }
         this.a_1294.a_1797(a_1283);
         if(a_1334)
         {
            this.a_1294.x = a_3491.a_1080 * a_1334.m_iXGridNo + 0.5 * (a_3491.a_1080 - this.a_1294.width);
            if(a_1283)
            {
               this.a_1294.x = BattleFieldView.a_1013 - this.a_1294.x;
            }
         }
         if(this.a_1293.m_stCoverallMovie)
         {
            this.a_1294.y = y;
         }
         else
         {
            this.a_1294.y = y + 15;
         }
         if(parent)
         {
            parent.addChild(this.a_1294);
         }
         a_1321 = 20 * 3600 * 24;
         if(this.a_1295 >= 0)
         {
            clearInterval(this.a_1295);
         }
         this.a_1295 = setTimeout(this.a_3929,30000);
      }
      
      private function ProdudeEnergy() : void
      {
         var stFreeEnergy:a_4157 = null;
         var iEnergyValue:int = 0;
         for(var iIndex:int = 0; iIndex < 1; iIndex++)
         {
            stFreeEnergy = a_4162.getInstance().a_4163(b_180.a_420);
            if(null != stFreeEnergy)
            {
               iEnergyValue = a_1334.m_stCurrentBattbleFieldView.isOwnBattleField ? 100 : 5;
               stFreeEnergy.m_stCurrentBattleField = a_1334.m_stCurrentBattbleFieldView;
               stFreeEnergy.a_1797(0,iEnergyValue,x - 15 * iIndex,y);
               stFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(stFreeEnergy,BattleLayerDefine.EFFECTS_TOP_TYPE);
            }
         }
      }
      
      protected function a_3929() : void
      {
         this.killFieldGrid = [];
         if(this.a_1294)
         {
            if(this.a_1294.parent)
            {
               this.a_1294.parent.removeChild(this.a_1294);
            }
            this.a_1294.a_3940();
            this.a_1294 = null;
         }
         this.removeEventListener(Event.ADDED_TO_STAGE,this.OnAddToStageHandle);
         if(null != this.m_stBottomEffect)
         {
            this.m_stBottomEffect.a_3940();
            this.m_stBottomEffect = null;
         }
         if(null != this.m_stTopEffect)
         {
            this.m_stTopEffect.a_3940();
            this.m_stTopEffect = null;
         }
         if(null != this.m_BaseAutoPlayTopEffect)
         {
            this.m_BaseAutoPlayTopEffect.a_3940();
            this.m_BaseAutoPlayTopEffect = null;
         }
         if(a_1334)
         {
            a_1321 = a_1334.m_stCurrentBattbleFieldView.iTimeIntervalNum;
         }
         else
         {
            a_1321 = 0;
         }
         a_1339 += 50;
         if(this.a_1295 >= 0)
         {
            clearInterval(this.a_1295);
            this.a_1295 = -1;
         }
      }
      
      override protected function a_3911() : Vector.<BitmapData>
      {
         return this.a_1291;
      }
      
      override protected function a_3912() : Vector.<Point>
      {
         return this.a_1292;
      }
      
      override protected function a_3913() : MovieClip
      {
         return this.a_1293;
      }
      
      override public function a_3969(iRduceLifeValue:int) : Boolean
      {
         if(m_iDieType == 3 && iRduceLifeValue >= a_1339)
         {
            iRduceLifeValue = a_1339 - 10;
         }
         super.a_3969(iRduceLifeValue);
         if(a_1339 <= 10)
         {
            this.a_3928();
         }
         return true;
      }
      
      override public function a_3954(iCurrentTime:int) : Boolean
      {
         var stLastWaitShot:a_4348 = null;
         var numShotXpos:Number = NaN;
         var i:int = 0;
         var stStartField:a_3491 = null;
         var m_iSkillLevel:int = 0;
         var m_bSkillFlag:Boolean = false;
         var m_iSecondGemLevel:int = 0;
         var m_iSecondGemValue:int = 0;
         var m_iSecondGemFlag:Boolean = false;
         var HitIndex:int = 0;
         var xx:Array = null;
         var radius:int = 0;
         var len:int = 0;
         var iWaitShotCnt:int = 0;
         if(a_1324.length == 0 && iCurrentTime > m_iPlaceTimeIntervals + a_1308 && iCurrentTime >= a_1321 + a_1309)
         {
            if(Boolean(a_1324) && a_1324.length != 0)
            {
               a_1324.length = 0;
            }
            if(this.a_1296.m_iGunType == 336724480)
            {
               stLastWaitShot = AvatarIcePowerGunShot.a_4344();
            }
            else if(this.a_1296.m_iGunType == 336724992)
            {
               stLastWaitShot = AvatarSnowBallShot.a_4344();
            }
            else if(this.a_1296.m_iGunType == 336725760)
            {
               if(null == a_1334.m_stCurrentBattbleFieldView.a_3431(0))
               {
                  a_1321 = iCurrentTime - 0.3 * a_1309;
                  return true;
               }
               this.a_3431(a_1334);
               stLastWaitShot = AvatarMoonlitMeteorShot.a_4344();
               (stLastWaitShot as AvatarMoonlitMeteorShot).m_numSputteringRate = m_numSputteringHurtRate;
               (stLastWaitShot as AvatarMoonlitMeteorShot).a_1607 = this.hitFieldGrid[0];
            }
            else if(this.a_1296.m_iGunType == 336790016)
            {
               if(null == a_1334.m_stCurrentBattbleFieldView.a_3431())
               {
                  return true;
               }
               this.a_3431(a_1334);
               m_iSkillLevel = GetGenDegree(344204561,this.a_1296.m_arrGenInfoArray);
               m_bSkillFlag = IsExitSkill([344204561],this.a_1296.m_arrGenInfoArray);
               m_iSecondGemValue = 1;
               if(IsExitSkill([344208913],this.a_1296.m_arrGenInfoArray))
               {
                  m_iSecondGemLevel = GetGenDegree(344208913,this.a_1296.m_arrGenInfoArray);
                  m_iSecondGemValue = m_iSecondGemLevel >= 15 ? 2 : 1;
               }
               else if(IsExitSkill([344203793],this.a_1296.m_arrGenInfoArray))
               {
                  m_iSecondGemLevel = GetGenDegree(344203793,this.a_1296.m_arrGenInfoArray);
                  m_iSecondGemValue = m_iSecondGemLevel >= 15 ? 2 : 1;
               }
               if(m_iSkillLevel >= 15)
               {
                  stLastWaitShot = AvatarStarStaffFiveShot.a_4344();
                  (stLastWaitShot as AvatarStarStaffFiveShot).m_numSputteringRate = m_numSputteringHurtRate;
                  (stLastWaitShot as AvatarStarStaffFiveShot).m_range = m_iSecondGemValue;
                  (stLastWaitShot as AvatarStarStaffFiveShot).m_GemFlag = m_bSkillFlag;
                  (stLastWaitShot as AvatarStarStaffFiveShot).stTargetMouseMoveIntruder = this.hitFieldGrid[0];
               }
               else if(m_iSkillLevel >= 11)
               {
                  stLastWaitShot = AvatarStarStaffFourthShot.a_4344();
                  (stLastWaitShot as AvatarStarStaffFourthShot).m_numSputteringRate = m_numSputteringHurtRate;
                  (stLastWaitShot as AvatarStarStaffFourthShot).m_range = m_iSecondGemValue;
                  (stLastWaitShot as AvatarStarStaffFourthShot).m_GemFlag = m_bSkillFlag;
                  (stLastWaitShot as AvatarStarStaffFourthShot).stTargetMouseMoveIntruder = this.hitFieldGrid[0];
               }
               else if(m_iSkillLevel >= 6)
               {
                  stLastWaitShot = AvatarStarStaffThirdShot.a_4344();
                  (stLastWaitShot as AvatarStarStaffThirdShot).m_numSputteringRate = m_numSputteringHurtRate;
                  (stLastWaitShot as AvatarStarStaffThirdShot).m_range = m_iSecondGemValue;
                  (stLastWaitShot as AvatarStarStaffThirdShot).m_GemFlag = m_bSkillFlag;
                  (stLastWaitShot as AvatarStarStaffThirdShot).stTargetMouseMoveIntruder = this.hitFieldGrid[0];
               }
               else if(m_bSkillFlag)
               {
                  stLastWaitShot = AvatarStarStaffSecondShot.a_4344();
                  (stLastWaitShot as AvatarStarStaffSecondShot).m_numSputteringRate = m_numSputteringHurtRate;
                  (stLastWaitShot as AvatarStarStaffSecondShot).m_range = m_iSecondGemValue;
                  (stLastWaitShot as AvatarStarStaffSecondShot).m_GemFlag = m_bSkillFlag;
                  (stLastWaitShot as AvatarStarStaffSecondShot).stTargetMouseMoveIntruder = this.hitFieldGrid[0];
               }
               else
               {
                  stLastWaitShot = AvatarStarStaffFirstShot.a_4344();
                  (stLastWaitShot as AvatarStarStaffFirstShot).m_numSputteringRate = m_numSputteringHurtRate;
                  (stLastWaitShot as AvatarStarStaffFirstShot).m_range = m_iSecondGemValue;
                  (stLastWaitShot as AvatarStarStaffFirstShot).m_GemFlag = m_bSkillFlag;
                  (stLastWaitShot as AvatarStarStaffFirstShot).stTargetMouseMoveIntruder = this.hitFieldGrid[0];
               }
            }
            else if(this.a_1296.m_iGunType == 336724736)
            {
               if(null == a_1334.m_stCurrentBattbleFieldView.a_3431())
               {
                  a_1321 = iCurrentTime - 0.3 * a_1309;
                  return true;
               }
               if(m_iTransfigurationStatus == 1)
               {
                  this.m_numShotXRate = 0.6;
                  this.m_numShotYRate = 0.9;
                  a_1317 = 4;
                  stLastWaitShot = AvatarStarFishFollowFirstTransShot.a_4344();
               }
               else if(m_iTransfigurationStatus == 2)
               {
                  this.m_numShotXRate = 0.6;
                  this.m_numShotYRate = 0.8;
                  a_1317 = 4;
                  stLastWaitShot = AvatarStarFishFollowSecondTransShot.a_4344();
               }
               else if(m_iTransfigurationStatus == 3)
               {
                  this.m_numShotXRate = 0.5;
                  this.m_numShotYRate = 0.55;
                  a_1317 = 4;
                  stLastWaitShot = AvatarStarFishFollowThirdTransShot.a_4344();
               }
               else if(m_iTransfigurationStatus == 4)
               {
                  this.m_numShotXRate = 0.5;
                  this.m_numShotYRate = 0.55;
                  a_1317 = 4;
                  stLastWaitShot = AvatarStarFishFollowForthTransShot.a_4344();
               }
               else if(m_iTransfigurationStatus == 5)
               {
                  this.m_numShotXRate = 0.5;
                  this.m_numShotYRate = 0.55;
                  a_1317 = 4;
                  stLastWaitShot = AvatarStarFishFollowFifthTransShot.a_4344();
               }
               else
               {
                  this.m_numShotXRate = 1;
                  this.m_numShotYRate = 1;
                  stLastWaitShot = a_4388.getInstance().a_4389(a_1304);
               }
            }
            else if(this.a_1296.m_iGunType == 336664576)
            {
               if(null == a_1334.m_stCurrentBattbleFieldView.a_3431())
               {
                  a_1321 = iCurrentTime - 0.3 * a_1309;
                  return true;
               }
               m_iShotBoundStopTime = 30;
               if(m_iTransfigurationStatus == 1)
               {
                  this.m_numShotXRate = 0.6;
                  this.m_numShotYRate = 0.9;
                  a_1317 = 3;
                  stLastWaitShot = ZeusCrossbowOneShot.a_4344();
                  (stLastWaitShot as ZeusCrossbowOneShot).m_iShotBoundStopTime = m_iShotBoundStopTime;
               }
               else if(m_iTransfigurationStatus == 2)
               {
                  this.m_numShotXRate = 0.6;
                  this.m_numShotYRate = 0.8;
                  a_1317 = 3;
                  stLastWaitShot = ZeusCrossbowTwoShot.a_4344();
                  (stLastWaitShot as ZeusCrossbowTwoShot).m_iShotBoundStopTime = m_iShotBoundStopTime;
               }
               else if(m_iTransfigurationStatus == 3)
               {
                  this.m_numShotXRate = 0.5;
                  this.m_numShotYRate = 0.55;
                  a_1317 = 3;
                  stLastWaitShot = ZeusCrossbowThreeShot.a_4344();
                  (stLastWaitShot as ZeusCrossbowThreeShot).m_iShotBoundStopTime = m_iShotBoundStopTime;
               }
               else if(m_iTransfigurationStatus == 4)
               {
                  this.m_numShotXRate = 0.5;
                  this.m_numShotYRate = 0.55;
                  a_1317 = 3;
                  stLastWaitShot = ZeusCrossbowFourShot.a_4344();
                  (stLastWaitShot as ZeusCrossbowFourShot).m_iShotBoundStopTime = m_iShotBoundStopTime;
               }
               else if(m_iTransfigurationStatus == 5)
               {
                  this.m_numShotXRate = 0.5;
                  this.m_numShotYRate = 0.55;
                  a_1317 = 3;
                  stLastWaitShot = ZeusCrossbowFiveShot.a_4344();
                  (stLastWaitShot as ZeusCrossbowFiveShot).m_iShotBoundStopTime = m_iShotBoundStopTime;
               }
               else
               {
                  this.m_numShotXRate = 0.6;
                  this.m_numShotYRate = 0.9;
                  a_1317 = 3;
                  stLastWaitShot = ZeusCrossbowOneShot.a_4344();
                  (stLastWaitShot as ZeusCrossbowOneShot).m_iShotBoundStopTime = m_iShotBoundStopTime;
               }
            }
            else if(this.a_1296.m_iGunType == 336724784)
            {
               if(null == a_1334.m_stCurrentBattbleFieldView.a_3431())
               {
                  a_1321 = iCurrentTime - 0.3 * a_1309;
                  return true;
               }
               if(m_iTransfigurationStatus == 1)
               {
                  this.m_numShotXRate = 0.6;
                  this.m_numShotYRate = 0.9;
                  a_1317 = 4;
                  stLastWaitShot = AvatarStarFish7FollowFirstTransShot.a_4344();
               }
               else if(m_iTransfigurationStatus == 2)
               {
                  this.m_numShotXRate = 0.6;
                  this.m_numShotYRate = 0.8;
                  a_1317 = 4;
                  stLastWaitShot = AvatarStarFish7FollowSecondTransShot.a_4344();
               }
               else if(m_iTransfigurationStatus == 3)
               {
                  this.m_numShotXRate = 0.5;
                  this.m_numShotYRate = 0.55;
                  a_1317 = 4;
                  stLastWaitShot = AvatarStarFish7FollowThirdTransShot.a_4344();
               }
               else if(m_iTransfigurationStatus == 4)
               {
                  this.m_numShotXRate = 0.5;
                  this.m_numShotYRate = 0.55;
                  a_1317 = 4;
                  stLastWaitShot = AvatarStarFish7FollowForthTransShot.a_4344();
               }
               else if(m_iTransfigurationStatus == 5)
               {
                  this.m_numShotXRate = 0.5;
                  this.m_numShotYRate = 0.55;
                  a_1317 = 4;
                  stLastWaitShot = AvatarStarFish7FollowFifthTransShot.a_4344();
               }
               else
               {
                  this.m_numShotXRate = 1;
                  this.m_numShotYRate = 1;
                  stLastWaitShot = a_4388.getInstance().a_4389(a_1304);
               }
            }
            else if(this.a_1296.m_iGunType == 336725504)
            {
               if(a_1334.m_stCurrentBattbleFieldView.IsExistMouse())
               {
                  stLastWaitShot = AvatarCircleRoundShot.a_4344();
                  (stLastWaitShot as AvatarCircleRoundShot).m_iSupperingRate = m_numSputteringHurtRate;
               }
            }
            else if(this.a_1296.m_iGunType == 336726016)
            {
               if(a_1334.m_stCurrentBattbleFieldView.a_3430(a_1334.m_iYGridNo) <= 0)
               {
                  return true;
               }
               stLastWaitShot = AvatarSuperSonicGunShot.a_4344();
               if(this.m_stSonicGunAvatar)
               {
                  this.m_stSonicGunAvatar.a_3973();
               }
            }
            else if(this.a_1296.m_iGunType == 336726272)
            {
               if(!a_1334.m_stCurrentBattbleFieldView.IsExistMouse())
               {
                  return true;
               }
               stLastWaitShot = AvatarOctopusCannonShot.a_4344();
            }
            else if(this.a_1296.m_iGunType == 336789760)
            {
               stLastWaitShot = AvatarYouYouGunShot.a_4344();
               stLastWaitShot.m_isSpecial = 0;
            }
            if(stLastWaitShot)
            {
               a_1321 = iCurrentTime;
               a_1323 = 1;
               a_1307 = a_1273;
               a_1275 = 0;
               gotoAndStop((a_1276[1] as FrameLabel).frame);
               if(this.a_1296.m_iGunType == 336726016)
               {
                  stStartField = a_1334.m_stCurrentBattbleFieldView.a_3438(0,a_1334.m_iYGridNo - 1);
                  if(stStartField != null)
                  {
                     stLastWaitShot = AvatarSuperSonicGunShot.a_4344();
                     (stLastWaitShot as AvatarSuperSonicGunShot).stStartField = stStartField;
                     a_1324.push(stLastWaitShot);
                  }
                  stStartField = a_1334.m_stCurrentBattbleFieldView.a_3438(0,a_1334.m_iYGridNo);
                  if(stStartField != null)
                  {
                     stLastWaitShot = AvatarSuperSonicGunShot.a_4344();
                     (stLastWaitShot as AvatarSuperSonicGunShot).stStartField = stStartField;
                     a_1324.push(stLastWaitShot);
                  }
                  stStartField = a_1334.m_stCurrentBattbleFieldView.a_3438(0,a_1334.m_iYGridNo + 1);
                  if(stStartField != null)
                  {
                     stLastWaitShot = AvatarSuperSonicGunShot.a_4344();
                     (stLastWaitShot as AvatarSuperSonicGunShot).stStartField = stStartField;
                     a_1324.push(stLastWaitShot);
                  }
               }
               if(this.a_1296.m_iGunType == 336726272)
               {
                  a_1323 = 0;
                  if(a_1334.m_iYGridNo > 0)
                  {
                     stLastWaitShot = AvatarOctopusCannonShot.a_4344();
                     a_1324.push(stLastWaitShot);
                  }
                  if(a_1334.m_iYGridNo > 0 && a_1334.m_iXGridNo < BattleFieldView.a_1011 - 1)
                  {
                     stLastWaitShot = AvatarOctopusCannonShot.a_4344();
                     a_1324.push(stLastWaitShot);
                  }
                  if(a_1334.m_iXGridNo < BattleFieldView.a_1011 - 1)
                  {
                     stLastWaitShot = AvatarOctopusCannonShot.a_4344();
                     a_1324.push(stLastWaitShot);
                  }
                  if(a_1334.m_iYGridNo < BattleFieldView.a_1012 - 1 && a_1334.m_iXGridNo < BattleFieldView.a_1011 - 1)
                  {
                     stLastWaitShot = AvatarOctopusCannonShot.a_4344();
                     a_1324.push(stLastWaitShot);
                  }
                  if(a_1334.m_iYGridNo < BattleFieldView.a_1012 - 1)
                  {
                     stLastWaitShot = AvatarOctopusCannonShot.a_4344();
                     a_1324.push(stLastWaitShot);
                  }
                  if(a_1334.m_iYGridNo < BattleFieldView.a_1012 - 1 && a_1334.m_iXGridNo > 0)
                  {
                     stLastWaitShot = AvatarOctopusCannonShot.a_4344();
                     a_1324.push(stLastWaitShot);
                  }
                  if(a_1334.m_iXGridNo > 0)
                  {
                     stLastWaitShot = AvatarOctopusCannonShot.a_4344();
                     a_1324.push(stLastWaitShot);
                  }
                  if(a_1334.m_iYGridNo > 0 && a_1334.m_iXGridNo > 0)
                  {
                     stLastWaitShot = AvatarOctopusCannonShot.a_4344();
                     a_1324.push(stLastWaitShot);
                  }
               }
               else
               {
                  a_1324.push(stLastWaitShot);
               }
               if(a_1315)
               {
                  for(i = 0; i < 3; i++)
                  {
                     if(this.a_1296.m_iGunType == 336724480)
                     {
                        stLastWaitShot = AvatarIcePowerGunShot.a_4344();
                     }
                     a_1324.push(stLastWaitShot);
                  }
               }
               else if(a_1314)
               {
                  if(a_1334.m_stCurrentBattbleFieldView.IsExistMouse())
                  {
                     stLastWaitShot = AvatarCircleRoundShot.a_4344();
                     (stLastWaitShot as AvatarCircleRoundShot).m_iSupperingRate = m_numSputteringHurtRate;
                  }
                  if(this.a_1296.m_iGunType == 336724992)
                  {
                     stLastWaitShot = AvatarSnowBallShot.a_4344();
                  }
                  a_1324.push(stLastWaitShot);
               }
               else if(m_iOnceShotNum > 0)
               {
                  HitIndex = 0;
                  for(i = 0; i < m_iOnceShotNum - 1; i++)
                  {
                     if(this.a_1296.m_iGunType == 336725760)
                     {
                        stLastWaitShot = AvatarMoonlitMeteorShot.a_4344();
                        (stLastWaitShot as AvatarMoonlitMeteorShot).m_numSputteringRate = m_numSputteringHurtRate;
                        if(this.hitFieldGrid.length >= m_iOnceShotNum)
                        {
                           (stLastWaitShot as AvatarMoonlitMeteorShot).a_1607 = this.hitFieldGrid[i + 1];
                        }
                        else
                        {
                           HitIndex = i + 1;
                           if(HitIndex >= this.hitFieldGrid.length)
                           {
                              HitIndex = 0;
                           }
                           (stLastWaitShot as AvatarMoonlitMeteorShot).a_1607 = this.hitFieldGrid[HitIndex];
                        }
                     }
                     if(this.a_1296.m_iGunType == 336790016)
                     {
                        HitIndex = i + 1;
                        if(HitIndex >= this.hitFieldGrid.length)
                        {
                           HitIndex = 0;
                        }
                        m_iSkillLevel = GetGenDegree(344204561,this.a_1296.m_arrGenInfoArray);
                        m_bSkillFlag = IsExitSkill([344204561],this.a_1296.m_arrGenInfoArray);
                        m_iSecondGemValue = 1;
                        if(IsExitSkill([344208913],this.a_1296.m_arrGenInfoArray))
                        {
                           m_iSecondGemLevel = GetGenDegree(344208913,this.a_1296.m_arrGenInfoArray);
                           m_iSecondGemValue = m_iSecondGemLevel >= 15 ? 2 : 1;
                        }
                        else if(IsExitSkill([344203793],this.a_1296.m_arrGenInfoArray))
                        {
                           m_iSecondGemLevel = GetGenDegree(344203793,this.a_1296.m_arrGenInfoArray);
                           m_iSecondGemValue = m_iSecondGemLevel >= 15 ? 2 : 1;
                        }
                        if(m_iSkillLevel >= 15)
                        {
                           stLastWaitShot = AvatarStarStaffFiveShot.a_4344();
                           (stLastWaitShot as AvatarStarStaffFiveShot).m_numSputteringRate = m_numSputteringHurtRate;
                           (stLastWaitShot as AvatarStarStaffFiveShot).m_range = m_iSecondGemValue;
                           (stLastWaitShot as AvatarStarStaffFiveShot).m_GemFlag = m_bSkillFlag;
                           (stLastWaitShot as AvatarStarStaffFiveShot).stTargetMouseMoveIntruder = this.hitFieldGrid[HitIndex];
                        }
                        else if(m_iSkillLevel >= 11)
                        {
                           stLastWaitShot = AvatarStarStaffFourthShot.a_4344();
                           (stLastWaitShot as AvatarStarStaffFourthShot).m_numSputteringRate = m_numSputteringHurtRate;
                           (stLastWaitShot as AvatarStarStaffFourthShot).m_range = m_iSecondGemValue;
                           (stLastWaitShot as AvatarStarStaffFourthShot).m_GemFlag = m_bSkillFlag;
                           (stLastWaitShot as AvatarStarStaffFourthShot).stTargetMouseMoveIntruder = this.hitFieldGrid[HitIndex];
                        }
                        else if(m_iSkillLevel >= 6)
                        {
                           stLastWaitShot = AvatarStarStaffThirdShot.a_4344();
                           (stLastWaitShot as AvatarStarStaffThirdShot).m_numSputteringRate = m_numSputteringHurtRate;
                           (stLastWaitShot as AvatarStarStaffThirdShot).m_range = m_iSecondGemValue;
                           (stLastWaitShot as AvatarStarStaffThirdShot).m_GemFlag = m_bSkillFlag;
                           (stLastWaitShot as AvatarStarStaffThirdShot).stTargetMouseMoveIntruder = this.hitFieldGrid[HitIndex];
                        }
                        else if(m_bSkillFlag)
                        {
                           stLastWaitShot = AvatarStarStaffSecondShot.a_4344();
                           (stLastWaitShot as AvatarStarStaffSecondShot).m_numSputteringRate = m_numSputteringHurtRate;
                           (stLastWaitShot as AvatarStarStaffSecondShot).m_range = m_iSecondGemValue;
                           (stLastWaitShot as AvatarStarStaffSecondShot).m_GemFlag = m_bSkillFlag;
                           (stLastWaitShot as AvatarStarStaffSecondShot).stTargetMouseMoveIntruder = this.hitFieldGrid[HitIndex];
                        }
                        else
                        {
                           stLastWaitShot = AvatarStarStaffFirstShot.a_4344();
                           (stLastWaitShot as AvatarStarStaffFirstShot).m_numSputteringRate = m_numSputteringHurtRate;
                           (stLastWaitShot as AvatarStarStaffFirstShot).m_range = m_iSecondGemValue;
                           (stLastWaitShot as AvatarStarStaffFirstShot).m_GemFlag = m_bSkillFlag;
                           (stLastWaitShot as AvatarStarStaffFirstShot).stTargetMouseMoveIntruder = this.hitFieldGrid[HitIndex];
                        }
                     }
                     if(this.a_1296.m_iGunType == 336724736)
                     {
                        if(m_iTransfigurationStatus == 1)
                        {
                           stLastWaitShot = AvatarStarFishFollowFirstTransShot.a_4344();
                           (stLastWaitShot as AvatarStarFishFollowFirstTransShot).m_numSputteringRate = m_numSputteringHurtRate;
                        }
                        else if(m_iTransfigurationStatus == 2)
                        {
                           stLastWaitShot = AvatarStarFishFollowSecondTransShot.a_4344();
                           (stLastWaitShot as AvatarStarFishFollowSecondTransShot).m_numSputteringRate = m_numSputteringHurtRate;
                        }
                        else if(m_iTransfigurationStatus == 3)
                        {
                           stLastWaitShot = AvatarStarFishFollowThirdTransShot.a_4344();
                           (stLastWaitShot as AvatarStarFishFollowThirdTransShot).m_numSputteringRate = m_numSputteringHurtRate;
                        }
                        else if(m_iTransfigurationStatus == 4)
                        {
                           stLastWaitShot = AvatarStarFishFollowForthTransShot.a_4344();
                           (stLastWaitShot as AvatarStarFishFollowForthTransShot).m_numSputteringRate = m_numSputteringHurtRate;
                        }
                        else if(m_iTransfigurationStatus == 5)
                        {
                           stLastWaitShot = AvatarStarFishFollowFifthTransShot.a_4344();
                           (stLastWaitShot as AvatarStarFishFollowFifthTransShot).m_numSputteringRate = m_numSputteringHurtRate;
                        }
                        else
                        {
                           stLastWaitShot = a_4388.getInstance().a_4389(a_1304);
                        }
                     }
                     if(this.a_1296.m_iGunType == 336664576)
                     {
                        if(m_iTransfigurationStatus == 1)
                        {
                           stLastWaitShot = ZeusCrossbowOneShot.a_4344();
                           (stLastWaitShot as ZeusCrossbowOneShot).m_numSputteringRate = m_numSputteringHurtRate;
                        }
                        else if(m_iTransfigurationStatus == 2)
                        {
                           stLastWaitShot = ZeusCrossbowTwoShot.a_4344();
                           (stLastWaitShot as ZeusCrossbowTwoShot).m_numSputteringRate = m_numSputteringHurtRate;
                        }
                        else if(m_iTransfigurationStatus == 3)
                        {
                           stLastWaitShot = ZeusCrossbowThreeShot.a_4344();
                           (stLastWaitShot as ZeusCrossbowThreeShot).m_numSputteringRate = m_numSputteringHurtRate;
                        }
                        else if(m_iTransfigurationStatus == 4)
                        {
                           stLastWaitShot = ZeusCrossbowFourShot.a_4344();
                           (stLastWaitShot as ZeusCrossbowFourShot).m_numSputteringRate = m_numSputteringHurtRate;
                        }
                        else if(m_iTransfigurationStatus == 5)
                        {
                           stLastWaitShot = ZeusCrossbowFiveShot.a_4344();
                           (stLastWaitShot as ZeusCrossbowFiveShot).m_numSputteringRate = m_numSputteringHurtRate;
                        }
                        else
                        {
                           stLastWaitShot = ZeusCrossbowOneShot.a_4344();
                           (stLastWaitShot as ZeusCrossbowOneShot).m_numSputteringRate = m_numSputteringHurtRate;
                        }
                     }
                     if(this.a_1296.m_iGunType == 336724784)
                     {
                        if(m_iTransfigurationStatus == 1)
                        {
                           stLastWaitShot = AvatarStarFish7FollowFirstTransShot.a_4344();
                           (stLastWaitShot as AvatarStarFish7FollowFirstTransShot).m_numSputteringRate = m_numSputteringHurtRate;
                        }
                        else if(m_iTransfigurationStatus == 2)
                        {
                           stLastWaitShot = AvatarStarFish7FollowSecondTransShot.a_4344();
                           (stLastWaitShot as AvatarStarFish7FollowSecondTransShot).m_numSputteringRate = m_numSputteringHurtRate;
                        }
                        else if(m_iTransfigurationStatus == 3)
                        {
                           stLastWaitShot = AvatarStarFish7FollowThirdTransShot.a_4344();
                           (stLastWaitShot as AvatarStarFish7FollowThirdTransShot).m_numSputteringRate = m_numSputteringHurtRate;
                        }
                        else if(m_iTransfigurationStatus == 4)
                        {
                           stLastWaitShot = AvatarStarFish7FollowForthTransShot.a_4344();
                           (stLastWaitShot as AvatarStarFish7FollowForthTransShot).m_numSputteringRate = m_numSputteringHurtRate;
                        }
                        else if(m_iTransfigurationStatus == 5)
                        {
                           stLastWaitShot = AvatarStarFish7FollowFifthTransShot.a_4344();
                           (stLastWaitShot as AvatarStarFish7FollowFifthTransShot).m_numSputteringRate = m_numSputteringHurtRate;
                        }
                        else
                        {
                           stLastWaitShot = a_4388.getInstance().a_4389(a_1304);
                        }
                     }
                     if(this.a_1296.m_iGunType == 336726016)
                     {
                        stStartField = a_1334.m_stCurrentBattbleFieldView.a_3438(0,a_1334.m_iYGridNo - 1);
                        if(stStartField != null)
                        {
                           stLastWaitShot = AvatarSuperSonicGunShot.a_4344();
                           (stLastWaitShot as AvatarSuperSonicGunShot).stStartField = stStartField;
                           a_1324.push(stLastWaitShot);
                        }
                        stStartField = a_1334.m_stCurrentBattbleFieldView.a_3438(0,a_1334.m_iYGridNo);
                        if(stStartField != null)
                        {
                           stLastWaitShot = AvatarSuperSonicGunShot.a_4344();
                           (stLastWaitShot as AvatarSuperSonicGunShot).stStartField = stStartField;
                           a_1324.push(stLastWaitShot);
                        }
                        stStartField = a_1334.m_stCurrentBattbleFieldView.a_3438(0,a_1334.m_iYGridNo + 1);
                        if(stStartField != null)
                        {
                           stLastWaitShot = AvatarSuperSonicGunShot.a_4344();
                           (stLastWaitShot as AvatarSuperSonicGunShot).stStartField = stStartField;
                           a_1324.push(stLastWaitShot);
                        }
                     }
                     else if(this.a_1296.m_iGunType == 336726272)
                     {
                        if(a_1334.m_iYGridNo > 0)
                        {
                           stLastWaitShot = AvatarOctopusCannonShot.a_4344();
                           a_1324.push(stLastWaitShot);
                        }
                        if(a_1334.m_iYGridNo > 0 && a_1334.m_iXGridNo < BattleFieldView.a_1011 - 1)
                        {
                           stLastWaitShot = AvatarOctopusCannonShot.a_4344();
                           a_1324.push(stLastWaitShot);
                        }
                        if(a_1334.m_iXGridNo < BattleFieldView.a_1011 - 1)
                        {
                           stLastWaitShot = AvatarOctopusCannonShot.a_4344();
                           a_1324.push(stLastWaitShot);
                        }
                        if(a_1334.m_iYGridNo < BattleFieldView.a_1012 - 1 && a_1334.m_iXGridNo < BattleFieldView.a_1011 - 1)
                        {
                           stLastWaitShot = AvatarOctopusCannonShot.a_4344();
                           a_1324.push(stLastWaitShot);
                        }
                        if(a_1334.m_iYGridNo < BattleFieldView.a_1012 - 1)
                        {
                           stLastWaitShot = AvatarOctopusCannonShot.a_4344();
                           a_1324.push(stLastWaitShot);
                        }
                        if(a_1334.m_iYGridNo < BattleFieldView.a_1012 - 1 && a_1334.m_iXGridNo > 0)
                        {
                           stLastWaitShot = AvatarOctopusCannonShot.a_4344();
                           a_1324.push(stLastWaitShot);
                        }
                        if(a_1334.m_iXGridNo > 0)
                        {
                           stLastWaitShot = AvatarOctopusCannonShot.a_4344();
                           a_1324.push(stLastWaitShot);
                        }
                        if(a_1334.m_iYGridNo > 0 && a_1334.m_iXGridNo > 0)
                        {
                           stLastWaitShot = AvatarOctopusCannonShot.a_4344();
                           a_1324.push(stLastWaitShot);
                        }
                     }
                     else if(this.a_1296.m_iGunType == 336789760)
                     {
                        if(i == 0)
                        {
                           stStartField = a_1334.m_stCurrentBattbleFieldView.a_3438(0,a_1334.m_iYGridNo - 1);
                           if(stStartField != null)
                           {
                              stLastWaitShot = AvatarYouYouGunShot.a_4344();
                              stLastWaitShot.m_isSpecial = 1;
                              a_1324.push(stLastWaitShot);
                           }
                        }
                        else if(i == 1)
                        {
                           stStartField = a_1334.m_stCurrentBattbleFieldView.a_3438(0,a_1334.m_iYGridNo + 1);
                           if(stStartField != null)
                           {
                              stLastWaitShot = AvatarYouYouGunShot.a_4344();
                              stLastWaitShot.m_isSpecial = 2;
                              a_1324.push(stLastWaitShot);
                           }
                        }
                     }
                     else
                     {
                        a_1324.push(stLastWaitShot);
                     }
                  }
               }
            }
         }
         if(this.a_1296.m_iGunType == 336726016)
         {
            xx = a_1324;
            if(iCurrentTime - a_1321 == a_1310 + a_1317 * a_1323 && a_1324.length > 0)
            {
               if(a_1334.m_iYGridNo > 0)
               {
                  stLastWaitShot = a_1324.pop();
                  stStartField = a_1334.m_stCurrentBattbleFieldView.a_3438(0,a_1334.m_iYGridNo - 1);
                  if(stLastWaitShot != null && stStartField != null)
                  {
                     stLastWaitShot.iShotSequenceNum = 2;
                     stLastWaitShot.a_1797(0,a_1312,a_1311,x + numShotXpos,y + this.a_3956() - 5,a_1334.m_stCurrentBattbleFieldView,stStartField,false,1,2);
                     parent.addChildAt(stLastWaitShot,a_1334.m_stCurrentBattbleFieldView.a_3433());
                  }
               }
               stLastWaitShot = a_1324.pop();
               stStartField = a_1334.m_stCurrentBattbleFieldView.a_3438(0,a_1334.m_iYGridNo);
               if(stLastWaitShot != null && stStartField != null)
               {
                  stLastWaitShot.iShotSequenceNum = 1;
                  stLastWaitShot.a_1797(0,a_1312,a_1311,x + numShotXpos,y + this.a_3956(),a_1334.m_stCurrentBattbleFieldView,stStartField);
                  parent.addChildAt(stLastWaitShot,a_1334.m_stCurrentBattbleFieldView.a_3433());
               }
               if(a_1334.m_iYGridNo < BattleFieldView.a_1012 - 1)
               {
                  stLastWaitShot = a_1324.pop();
                  stStartField = a_1334.m_stCurrentBattbleFieldView.a_3438(0,a_1334.m_iYGridNo + 1);
                  if(stLastWaitShot != null && stStartField != null)
                  {
                     stLastWaitShot.iShotSequenceNum = 3;
                     stLastWaitShot.a_1797(0,a_1312,a_1311,x + numShotXpos,y + this.a_3956() + 5,a_1334.m_stCurrentBattbleFieldView,stStartField,false,1,3);
                     parent.addChildAt(stLastWaitShot,a_1334.m_stCurrentBattbleFieldView.a_3433());
                  }
               }
               if(a_1324.length > 0)
               {
                  ++a_1323;
               }
            }
         }
         else if(this.a_1296.m_iGunType == 336726272)
         {
            radius = 40;
            len = Math.sqrt(0.5 * radius * radius);
            if(iCurrentTime - a_1321 == a_1310 + a_1317 * a_1323 && a_1324.length > 0)
            {
               if(a_1334.m_iYGridNo > 0 && a_1334.m_iXGridNo > 0)
               {
                  stLastWaitShot = a_1324.pop();
                  stLastWaitShot.m_isSpecial = 8;
                  stLastWaitShot.a_1797(0,a_1312,a_1311,x + 59 - len,y + 105 - len,a_1334.m_stCurrentBattbleFieldView,a_1334);
                  parent.addChildAt(stLastWaitShot,a_1334.m_stCurrentBattbleFieldView.a_3433());
               }
               if(a_1334.m_iXGridNo > 0)
               {
                  stLastWaitShot = a_1324.pop();
                  stLastWaitShot.m_isSpecial = 4;
                  stLastWaitShot.a_1797(0,a_1312,a_1311,x + 59 - radius,y + 105,a_1334.m_stCurrentBattbleFieldView,a_1334);
                  parent.addChildAt(stLastWaitShot,a_1334.m_stCurrentBattbleFieldView.a_3433());
               }
               if(a_1334.m_iYGridNo < BattleFieldView.a_1012 - 1 && a_1334.m_iXGridNo > 0)
               {
                  stLastWaitShot = a_1324.pop();
                  stLastWaitShot.m_isSpecial = 6;
                  stLastWaitShot.a_1797(0,a_1312,a_1311,x + 59 - len,y + 105 + len,a_1334.m_stCurrentBattbleFieldView,a_1334);
                  parent.addChildAt(stLastWaitShot,a_1334.m_stCurrentBattbleFieldView.a_3433());
               }
               if(a_1334.m_iYGridNo < BattleFieldView.a_1012 - 1)
               {
                  stLastWaitShot = a_1324.pop();
                  stLastWaitShot.m_isSpecial = 2;
                  stLastWaitShot.a_1797(0,a_1312,a_1311,x + 59 + 7,y + 105 + radius,a_1334.m_stCurrentBattbleFieldView,a_1334);
                  parent.addChildAt(stLastWaitShot,a_1334.m_stCurrentBattbleFieldView.a_3433());
               }
               if(a_1334.m_iYGridNo < BattleFieldView.a_1012 - 1 && a_1334.m_iXGridNo < BattleFieldView.a_1011 - 1)
               {
                  stLastWaitShot = a_1324.pop();
                  stLastWaitShot.m_isSpecial = 7;
                  stLastWaitShot.a_1797(0,a_1312,a_1311,x + 59 + len,y + 105 + len,a_1334.m_stCurrentBattbleFieldView,a_1334);
                  parent.addChildAt(stLastWaitShot,a_1334.m_stCurrentBattbleFieldView.a_3433());
               }
               if(a_1334.m_iXGridNo < BattleFieldView.a_1011 - 1)
               {
                  stLastWaitShot = a_1324.pop();
                  stLastWaitShot.m_isSpecial = 3;
                  stLastWaitShot.a_1797(0,a_1312,a_1311,x + 59 + radius,y + 105,a_1334.m_stCurrentBattbleFieldView,a_1334);
                  parent.addChildAt(stLastWaitShot,a_1334.m_stCurrentBattbleFieldView.a_3433());
               }
               if(a_1334.m_iYGridNo > 0 && a_1334.m_iXGridNo < BattleFieldView.a_1011 - 1)
               {
                  stLastWaitShot = a_1324.pop();
                  stLastWaitShot.m_isSpecial = 5;
                  stLastWaitShot.a_1797(0,a_1312,a_1311,x + 59 + len,y + 105 - len,a_1334.m_stCurrentBattbleFieldView,a_1334);
                  parent.addChildAt(stLastWaitShot,a_1334.m_stCurrentBattbleFieldView.a_3433());
               }
               if(a_1334.m_iYGridNo > 0)
               {
                  stLastWaitShot = a_1324.pop();
                  stLastWaitShot.m_isSpecial = 1;
                  stLastWaitShot.a_1797(0,a_1312,a_1311,x + 59 + 7,y + 105 - radius,a_1334.m_stCurrentBattbleFieldView,a_1334);
                  parent.addChildAt(stLastWaitShot,a_1334.m_stCurrentBattbleFieldView.a_3433());
               }
               if(a_1324.length > 0)
               {
                  ++a_1323;
               }
            }
         }
         else if(this.a_1296.m_iGunType == 336789760)
         {
            if(iCurrentTime - a_1321 == a_1310 + a_1317 * a_1323 && a_1324.length > 0)
            {
               numShotXpos = this.a_3955();
               if(a_1283)
               {
                  numShotXpos = -numShotXpos;
               }
               stLastWaitShot = a_1324.pop();
               if(stLastWaitShot)
               {
                  stLastWaitShot.m_isSpecial = 0;
                  stLastWaitShot.a_1797(0,a_1312,a_1311,x + numShotXpos,y + this.a_3956(),a_1334.m_stCurrentBattbleFieldView,a_1334);
                  parent.addChildAt(stLastWaitShot,a_1334.m_stCurrentBattbleFieldView.a_3433());
               }
               stStartField = a_1334.m_stCurrentBattbleFieldView.a_3438(0,a_1334.m_iYGridNo - 1);
               if(stStartField != null)
               {
                  stLastWaitShot = a_1324.pop();
                  if(stLastWaitShot)
                  {
                     stLastWaitShot.m_isSpecial = 1;
                     stLastWaitShot.a_1797(0,a_1312,a_1311,x + numShotXpos,y + this.a_3956(),a_1334.m_stCurrentBattbleFieldView,a_1334);
                     parent.addChildAt(stLastWaitShot,a_1334.m_stCurrentBattbleFieldView.a_3433());
                  }
               }
               stStartField = a_1334.m_stCurrentBattbleFieldView.a_3438(0,a_1334.m_iYGridNo + 1);
               if(stStartField != null)
               {
                  stLastWaitShot = a_1324.pop();
                  if(stLastWaitShot)
                  {
                     stLastWaitShot.m_isSpecial = 2;
                     stLastWaitShot.a_1797(0,a_1312,a_1311,x + numShotXpos,y + this.a_3956(),a_1334.m_stCurrentBattbleFieldView,a_1334);
                     parent.addChildAt(stLastWaitShot,a_1334.m_stCurrentBattbleFieldView.a_3433());
                  }
               }
            }
         }
         else
         {
            super.a_3954(iCurrentTime);
            iWaitShotCnt = int(a_1324.length);
            if(m_iOnceShotNum > 0 && iCurrentTime - a_1321 == a_1310 + a_1317 * a_1323 && a_1324.length > 0)
            {
               numShotXpos = this.a_3955();
               if(a_1283)
               {
                  numShotXpos = -numShotXpos;
               }
               stLastWaitShot = a_1324.pop();
               stLastWaitShot.iShotSequenceNum = a_1323;
               stLastWaitShot.a_1797(0,a_1312,a_1311,x + numShotXpos,y + this.a_3956(),a_1334.m_stCurrentBattbleFieldView,a_1334);
               if(stLastWaitShot.GetCurrentBattleFieldView() != null && stLastWaitShot.visible == true)
               {
                  parent.addChildAt(stLastWaitShot,a_1334.m_stCurrentBattbleFieldView.a_3433());
               }
               if(a_1324.length > 0)
               {
                  ++a_1323;
                  if(a_1324.length > 20)
                  {
                     a_1324.length = 0;
                  }
               }
            }
         }
         return true;
      }
      
      public function SuperShot(iCurrentTime:int) : Boolean
      {
         var stLastWaitShot:a_4348 = null;
         var numShotXpos:Number = NaN;
         var i:int = 0;
         var stStartField:a_3491 = null;
         var iSkillLevel:int = 0;
         var bSkillFlag:Boolean = false;
         var j:int = 0;
         var k:int = 0;
         if(m_stSuperLastWaitShotArray.length == 0 && iCurrentTime > m_iPlaceTimeIntervals + a_1308 && iCurrentTime >= m_iSuperLastShotTimeNum + m_iSuperShotIntervalTimeNum)
         {
            if(m_stSuperLastWaitShotArray.length > 20)
            {
               m_stSuperLastWaitShotArray.length = 0;
            }
            if(m_isSuperThreeRowShot && a_1334.m_stCurrentBattbleFieldView.a_3430(a_1334.m_iYGridNo) <= 0)
            {
               return true;
            }
            if(m_isSuperFiveRowShot && a_1334.m_stCurrentBattbleFieldView.GetFieldRowIntruderNumForFiveRow(a_1334.m_iYGridNo) <= 0)
            {
               return true;
            }
            stLastWaitShot = null;
            if(this.a_1296.m_iSuperGunType == 350224688)
            {
               stLastWaitShot = AvatarSuperGrenadeShot.a_4344();
               (stLastWaitShot as AvatarSuperGrenadeShot).a_1598 = a_1334.m_stCurrentBattbleFieldView.stFieldGridsVector[a_1334.m_iYGridNo][BattleFieldView.a_1011 - 2];
               (stLastWaitShot as AvatarSuperGrenadeShot).m_iTransEnergyCount = m_iShotTransEnergyCount;
            }
            else if(this.a_1296.m_iSuperGunType == 350224944)
            {
               stLastWaitShot = AvatarSuperGrenadeShot.a_4344();
               (stLastWaitShot as AvatarSuperGrenadeShot).a_1598 = a_1334.m_stCurrentBattbleFieldView.stFieldGridsVector[a_1334.m_iYGridNo][BattleFieldView.a_1011 - 2];
               (stLastWaitShot as AvatarSuperGrenadeShot).m_iTransEnergyCount = m_iShotTransEnergyCount;
            }
            else if(this.a_1296.m_iSuperGunType == 350229296)
            {
               stLastWaitShot = AvatarSuperBuzzShellShot.a_4344();
               (stLastWaitShot as AvatarSuperBuzzShellShot).m_numSputteringRate = m_numSputteringHurtRate;
            }
            else if(this.a_1296.m_iSuperGunType == 350226992)
            {
               stLastWaitShot = AvatarSuperRotateWaterGunWeaponShot.a_4344();
            }
            else if(this.a_1296.m_iSuperGunType == 350228784)
            {
               stLastWaitShot = AvatarSuperDianCiCannonShot.a_4344();
               (stLastWaitShot as AvatarSuperDianCiCannonShot).m_SlowRate = m_iSuperShotSlowRate;
               (stLastWaitShot as AvatarSuperDianCiCannonShot).m_SlowTime = m_iSuperShotSlowTime;
            }
            else if(this.a_1296.m_iSuperGunType == 350229040)
            {
               stLastWaitShot = AvatarSuperNinthFlamesShot.a_4344();
               iSkillLevel = GetGenDegree(344199441,this.a_1296.m_arrGenInfoArray);
               bSkillFlag = IsExitSkill([344199441],this.a_1296.m_arrGenInfoArray);
               (stLastWaitShot as AvatarSuperNinthFlamesShot).m_GemoLevel = bSkillFlag ? iSkillLevel : -1;
            }
            else if(this.a_1296.m_iSuperGunType != 350225456)
            {
               if(this.a_1296.m_iSuperGunType == 350225712)
               {
                  stLastWaitShot = AvatarSuperShotgunShot.a_4344();
                  (stLastWaitShot as AvatarSuperShotgunShot).m_iShotBoundStopTime = m_iShotBoundStopTime;
               }
               else if(this.a_1296.m_iSuperGunType == 350225968)
               {
                  stLastWaitShot = AvatarSuperShotgunShot.a_4344();
                  (stLastWaitShot as AvatarSuperShotgunShot).m_iShotBoundStopTime = m_iShotBoundStopTime;
               }
               else if(this.a_1296.m_iSuperGunType == 350226224 && a_1334.m_stCurrentBattbleFieldView.IsExistMouse())
               {
                  if(this.m_iGodShowState == 0)
                  {
                     stLastWaitShot = AvatarSuperDeathScytheShot.a_4344();
                     if(this.m_stAvatarSuperDeathGodShot)
                     {
                        this.m_stAvatarSuperDeathGodShot.a_3973();
                     }
                  }
                  else if(this.m_iGodShowState == 1)
                  {
                     stLastWaitShot = AvatarSuperDeathScytheOneShot.a_4344();
                     if(this.m_stAvatarSuperDeathGodOneShot)
                     {
                        this.m_stAvatarSuperDeathGodOneShot.a_3973();
                     }
                  }
                  else if(this.m_iGodShowState == 2)
                  {
                     stLastWaitShot = AvatarSuperDeathScytheTwoShot.a_4344();
                     if(this.m_stAvatarSuperDeathGodTwoShot)
                     {
                        this.m_stAvatarSuperDeathGodTwoShot.a_3973();
                     }
                  }
                  else if(this.m_iGodShowState == 3)
                  {
                     stLastWaitShot = AvatarSuperDeathScytheThreeShot.a_4344();
                     if(this.m_stAvatarSuperDeathGodThreeShot)
                     {
                        this.m_stAvatarSuperDeathGodThreeShot.a_3973();
                     }
                  }
                  else if(this.m_iGodShowState == 4)
                  {
                     stLastWaitShot = AvatarSuperDeathScytheFourShot.a_4344();
                     if(this.m_stAvatarSuperDeathGodFourShot)
                     {
                        this.m_stAvatarSuperDeathGodFourShot.a_3973();
                     }
                  }
                  else if(this.m_iGodShowState == 5)
                  {
                     stLastWaitShot = AvatarSuperDeathScytheFiveShot.a_4344();
                     if(this.m_stAvatarSuperDeathGodFiveShot)
                     {
                        this.m_stAvatarSuperDeathGodFiveShot.a_3973();
                     }
                  }
               }
               else if(this.a_1296.m_iSuperGunType == 350226736 && a_1334.m_stCurrentBattbleFieldView.IsExistMouse())
               {
                  if(this.m_iGodShowState == 0)
                  {
                     stLastWaitShot = AvatarSuperDeathBulletOneShot.a_4344();
                     if(this.m_stAvatarSuperDogDeathGodOneShot)
                     {
                        this.m_stAvatarSuperDogDeathGodOneShot.a_3973();
                     }
                  }
                  else if(this.m_iGodShowState == 1)
                  {
                     stLastWaitShot = AvatarSuperDeathBulletOneShot.a_4344();
                     if(this.m_stAvatarSuperDogDeathGodOneShot)
                     {
                        this.m_stAvatarSuperDogDeathGodOneShot.a_3973();
                     }
                  }
                  else if(this.m_iGodShowState == 2)
                  {
                     stLastWaitShot = AvatarSuperDeathBulletTwoShot.a_4344();
                     if(this.m_stAvatarSuperDogDeathGodOneShot)
                     {
                        this.m_stAvatarSuperDogDeathGodOneShot.a_3973();
                     }
                  }
                  else if(this.m_iGodShowState == 3)
                  {
                     stLastWaitShot = AvatarSuperDeathBulletThreeShot.a_4344();
                     if(this.m_stAvatarSuperDogDeathGodOneShot)
                     {
                        this.m_stAvatarSuperDogDeathGodOneShot.a_3973();
                     }
                  }
                  else if(this.m_iGodShowState == 4)
                  {
                     stLastWaitShot = AvatarSuperDeathBulletFourShot.a_4344();
                     if(this.m_stAvatarSuperDogDeathGodTwoShot)
                     {
                        this.m_stAvatarSuperDogDeathGodTwoShot.a_3973();
                     }
                  }
                  else if(this.m_iGodShowState == 5)
                  {
                     stLastWaitShot = AvatarSuperDeathBulletFiveShot.a_4344();
                     if(this.m_stAvatarSuperDogDeathGodThreeShot)
                     {
                        this.m_stAvatarSuperDogDeathGodThreeShot.a_3973();
                     }
                  }
               }
               else if(this.a_1296.m_iSuperGunType == 350230320 && a_1334.m_stCurrentBattbleFieldView.IsExistMouse())
               {
                  if(this.m_iGodShowState == 1)
                  {
                     stLastWaitShot = AvatarSuperLampGodOneShot.a_4344();
                     AvatarSuperLampGodOneShot(stLastWaitShot).m_SpecialGemLevel = this.m_SpecialGemLevel;
                     AvatarSuperLampGodOneShot(stLastWaitShot).m_numSputteringRate = m_numSputteringHurtRate;
                  }
                  else if(this.m_iGodShowState == 2)
                  {
                     stLastWaitShot = AvatarSuperLampGodTwoShot.a_4344();
                     AvatarSuperLampGodTwoShot(stLastWaitShot).m_SpecialGemLevel = this.m_SpecialGemLevel;
                     AvatarSuperLampGodTwoShot(stLastWaitShot).m_numSputteringRate = m_numSputteringHurtRate;
                  }
                  else if(this.m_iGodShowState == 3)
                  {
                     stLastWaitShot = AvatarSuperLampGodThreeShot.a_4344();
                     AvatarSuperLampGodThreeShot(stLastWaitShot).m_SpecialGemLevel = this.m_SpecialGemLevel;
                     AvatarSuperLampGodThreeShot(stLastWaitShot).m_numSputteringRate = m_numSputteringHurtRate;
                  }
                  else if(this.m_iGodShowState == 4)
                  {
                     stLastWaitShot = AvatarSuperLampGodFourShot.a_4344();
                     AvatarSuperLampGodFourShot(stLastWaitShot).m_SpecialGemLevel = this.m_SpecialGemLevel;
                     AvatarSuperLampGodFourShot(stLastWaitShot).m_numSputteringRate = m_numSputteringHurtRate;
                  }
                  else if(this.m_iGodShowState == 5)
                  {
                     stLastWaitShot = AvatarSuperLampGodFiveShot.a_4344();
                     AvatarSuperLampGodFiveShot(stLastWaitShot).m_SpecialGemLevel = this.m_SpecialGemLevel;
                     AvatarSuperLampGodFiveShot(stLastWaitShot).m_numSputteringRate = m_numSputteringHurtRate;
                  }
                  if(this.m_iAttackAppearance)
                  {
                     this.m_iAttackAppearance.AvaterAttack();
                  }
               }
               else if(this.a_1296.m_iSuperGunType == 350229808)
               {
                  this.m_GemoLevel = GetGenDegree(344200465,this.a_1296.m_arrGenInfoArray);
                  this.m_GemoFlag = IsExitSkill([344200465],this.a_1296.m_arrGenInfoArray);
                  stLastWaitShot = AvatarSuperSecretWishShot.a_4344();
                  (stLastWaitShot as AvatarSuperSecretWishShot).m_GemoLevel = this.m_GemoFlag ? this.m_GemoLevel : -1;
                  if(this.m_stSecretWishAvatar)
                  {
                     this.m_stSecretWishAvatar.a_3973();
                  }
               }
               else if(this.a_1296.m_iSuperGunType == 350229552)
               {
                  if(this.m_iGodShowState == 1)
                  {
                     stLastWaitShot = AvatarSuperShadowMeowOneShot.a_4344();
                     if(this.m_stShadowMeowFirstAvatar)
                     {
                        this.m_stShadowMeowFirstAvatar.a_3973();
                     }
                  }
                  else if(this.m_iGodShowState == 2)
                  {
                     stLastWaitShot = AvatarSuperShadowMeowTwoShot.a_4344();
                     if(this.m_stShadowMeowSecondAvatar)
                     {
                        this.m_stShadowMeowSecondAvatar.a_3973();
                     }
                  }
                  else if(this.m_iGodShowState == 3)
                  {
                     stLastWaitShot = AvatarSuperShadowMeowTwoShot.a_4344();
                     if(this.m_stShadowMeowThirdAvatar)
                     {
                        this.m_stShadowMeowThirdAvatar.a_3973();
                     }
                  }
                  else if(this.m_iGodShowState == 4)
                  {
                     stLastWaitShot = AvatarSuperShadowMeowTwoShot.a_4344();
                     if(this.m_stShadowMeowFourthAvatar)
                     {
                        this.m_stShadowMeowFourthAvatar.a_3973();
                     }
                  }
               }
               else if(this.a_1296.m_iSuperGunType == 350230064)
               {
                  if(this.m_stExplosivesOutsideAvater)
                  {
                     this.m_stExplosivesOutsideAvater.a_3973();
                  }
                  this.m_GemoLevel = GetGenDegree(344203537,this.a_1296.m_arrGenInfoArray);
                  this.m_GemoFlag = IsExitSkill([344203537],this.a_1296.m_arrGenInfoArray);
                  stLastWaitShot = AvatarSuperExplosivesShot.a_4344();
                  (stLastWaitShot as AvatarSuperExplosivesShot).m_numSputteringRate = m_numSputteringHurtRate;
                  stLastWaitShot.m_isSpecial = this.m_GemoFlag ? this.m_GemoLevel : -1;
               }
            }
            if(stLastWaitShot)
            {
               if(this.m_iLastShotTime.Value == 0 || iCurrentTime - this.m_iLastShotTime.Value >= m_iSuperShotIntervalTimeNum)
               {
                  this.m_iLastShotTime.Value = iCurrentTime;
               }
               m_iSuperLastShotTimeNum = iCurrentTime;
               m_iSuperContinueShotTimes = 1;
               m_stSuperLastWaitShotArray.push(stLastWaitShot);
               if(m_isSuperFourShot)
               {
                  for(i = 0; i < 3; i++)
                  {
                     if(this.a_1296.m_iSuperGunType == 350225456)
                     {
                     }
                     m_stSuperLastWaitShotArray.push(stLastWaitShot);
                  }
               }
               else if(m_isSuperDoubleShot)
               {
                  if(this.a_1296.m_iSuperGunType == 350224944)
                  {
                     stLastWaitShot = AvatarSuperGrenadeShot.a_4344();
                     (stLastWaitShot as AvatarSuperGrenadeShot).a_1598 = a_1334.m_stCurrentBattbleFieldView.stFieldGridsVector[a_1334.m_iYGridNo][BattleFieldView.a_1011 - 2];
                     (stLastWaitShot as AvatarSuperGrenadeShot).m_iTransEnergyCount = m_iShotTransEnergyCount;
                  }
                  else if(this.a_1296.m_iSuperGunType == 350226992)
                  {
                     stLastWaitShot = AvatarSuperRotateWaterGunWeaponShot.a_4344();
                  }
                  m_stSuperLastWaitShotArray.push(stLastWaitShot);
               }
               else if(m_iSuperOnceShotNum > 0)
               {
                  for(i = 0; i < m_iSuperOnceShotNum - 1; i++)
                  {
                     if(this.a_1296.m_iSuperGunType == 350226224)
                     {
                        if(this.m_iGodShowState == 0)
                        {
                           stLastWaitShot = AvatarSuperDeathScytheShot.a_4344();
                           m_stSuperLastWaitShotArray.push(stLastWaitShot);
                        }
                        else if(this.m_iGodShowState == 1)
                        {
                           stLastWaitShot = AvatarSuperDeathScytheOneShot.a_4344();
                           m_stSuperLastWaitShotArray.push(stLastWaitShot);
                        }
                        else if(this.m_iGodShowState == 2)
                        {
                           stLastWaitShot = AvatarSuperDeathScytheTwoShot.a_4344();
                           m_stSuperLastWaitShotArray.push(stLastWaitShot);
                        }
                        else if(this.m_iGodShowState == 3)
                        {
                           stLastWaitShot = AvatarSuperDeathScytheThreeShot.a_4344();
                           m_stSuperLastWaitShotArray.push(stLastWaitShot);
                        }
                        else if(this.m_iGodShowState == 4)
                        {
                           stLastWaitShot = AvatarSuperDeathScytheFourShot.a_4344();
                           m_stSuperLastWaitShotArray.push(stLastWaitShot);
                        }
                        else if(this.m_iGodShowState == 5)
                        {
                           stLastWaitShot = AvatarSuperDeathScytheFiveShot.a_4344();
                           m_stSuperLastWaitShotArray.push(stLastWaitShot);
                        }
                     }
                     else if(this.a_1296.m_iSuperGunType == 350226736)
                     {
                        if(this.m_iGodShowState == 0)
                        {
                           stLastWaitShot = AvatarSuperDeathBulletOneShot.a_4344();
                           AvatarSuperDeathBulletOneShot(stLastWaitShot).m_FourthGemLevel = this.m_FourthGemLevel;
                           m_stSuperLastWaitShotArray.push(stLastWaitShot);
                        }
                        else if(this.m_iGodShowState == 1)
                        {
                           stLastWaitShot = AvatarSuperDeathBulletOneShot.a_4344();
                           AvatarSuperDeathBulletOneShot(stLastWaitShot).m_FourthGemLevel = this.m_FourthGemLevel;
                           m_stSuperLastWaitShotArray.push(stLastWaitShot);
                        }
                        else if(this.m_iGodShowState == 2)
                        {
                           stLastWaitShot = AvatarSuperDeathBulletTwoShot.a_4344();
                           AvatarSuperDeathBulletTwoShot(stLastWaitShot).m_FourthGemLevel = this.m_FourthGemLevel;
                           m_stSuperLastWaitShotArray.push(stLastWaitShot);
                        }
                        else if(this.m_iGodShowState == 3)
                        {
                           stLastWaitShot = AvatarSuperDeathBulletThreeShot.a_4344();
                           AvatarSuperDeathBulletThreeShot(stLastWaitShot).m_FourthGemLevel = this.m_FourthGemLevel;
                           m_stSuperLastWaitShotArray.push(stLastWaitShot);
                        }
                        else if(this.m_iGodShowState == 4)
                        {
                           stLastWaitShot = AvatarSuperDeathBulletFourShot.a_4344();
                           AvatarSuperDeathBulletFourShot(stLastWaitShot).m_FourthGemLevel = this.m_FourthGemLevel;
                           m_stSuperLastWaitShotArray.push(stLastWaitShot);
                        }
                        else if(this.m_iGodShowState == 5)
                        {
                           stLastWaitShot = AvatarSuperDeathBulletFiveShot.a_4344();
                           AvatarSuperDeathBulletFiveShot(stLastWaitShot).m_FourthGemLevel = this.m_FourthGemLevel;
                           m_stSuperLastWaitShotArray.push(stLastWaitShot);
                        }
                     }
                     else if(this.a_1296.m_iSuperGunType == 350230320)
                     {
                        if(this.m_iGodShowState == 1)
                        {
                           stLastWaitShot = AvatarSuperLampGodOneShot.a_4344();
                           AvatarSuperLampGodOneShot(stLastWaitShot).m_SpecialGemLevel = this.m_SpecialGemLevel;
                           AvatarSuperLampGodOneShot(stLastWaitShot).m_numSputteringRate = m_numSputteringHurtRate;
                           m_stSuperLastWaitShotArray.push(stLastWaitShot);
                        }
                        else if(this.m_iGodShowState == 2)
                        {
                           stLastWaitShot = AvatarSuperLampGodTwoShot.a_4344();
                           AvatarSuperLampGodTwoShot(stLastWaitShot).m_SpecialGemLevel = this.m_SpecialGemLevel;
                           AvatarSuperLampGodTwoShot(stLastWaitShot).m_numSputteringRate = m_numSputteringHurtRate;
                           m_stSuperLastWaitShotArray.push(stLastWaitShot);
                        }
                        else if(this.m_iGodShowState == 3)
                        {
                           stLastWaitShot = AvatarSuperLampGodThreeShot.a_4344();
                           AvatarSuperLampGodThreeShot(stLastWaitShot).m_SpecialGemLevel = this.m_SpecialGemLevel;
                           AvatarSuperLampGodThreeShot(stLastWaitShot).m_numSputteringRate = m_numSputteringHurtRate;
                           m_stSuperLastWaitShotArray.push(stLastWaitShot);
                        }
                        else if(this.m_iGodShowState == 4)
                        {
                           stLastWaitShot = AvatarSuperLampGodFourShot.a_4344();
                           AvatarSuperLampGodFourShot(stLastWaitShot).m_SpecialGemLevel = this.m_SpecialGemLevel;
                           AvatarSuperLampGodFourShot(stLastWaitShot).m_numSputteringRate = m_numSputteringHurtRate;
                           m_stSuperLastWaitShotArray.push(stLastWaitShot);
                        }
                        else if(this.m_iGodShowState == 5)
                        {
                           stLastWaitShot = AvatarSuperLampGodFiveShot.a_4344();
                           AvatarSuperLampGodFiveShot(stLastWaitShot).m_SpecialGemLevel = this.m_SpecialGemLevel;
                           AvatarSuperLampGodFiveShot(stLastWaitShot).m_numSputteringRate = m_numSputteringHurtRate;
                           m_stSuperLastWaitShotArray.push(stLastWaitShot);
                        }
                     }
                     else if(this.a_1296.m_iSuperGunType == 350229296)
                     {
                        stLastWaitShot = AvatarSuperBuzzShellShot.a_4344();
                        (stLastWaitShot as AvatarSuperBuzzShellShot).m_numSputteringRate = m_numSputteringHurtRate;
                        m_stSuperLastWaitShotArray.push(stLastWaitShot);
                     }
                     else if(this.a_1296.m_iSuperGunType == 350229552)
                     {
                        if(this.m_iGodShowState == 1)
                        {
                           stLastWaitShot = AvatarSuperShadowMeowOneShot.a_4344();
                           m_stSuperLastWaitShotArray.push(stLastWaitShot);
                        }
                        else
                        {
                           stLastWaitShot = AvatarSuperShadowMeowTwoShot.a_4344();
                           m_stSuperLastWaitShotArray.push(stLastWaitShot);
                        }
                     }
                  }
               }
               else if(m_isSuperThreeRowShot)
               {
                  if(a_1334.m_iYGridNo > 0)
                  {
                     if(this.a_1296.m_iSuperGunType == 350225712 || this.a_1296.m_iSuperGunType == 350225968)
                     {
                        stLastWaitShot = AvatarSuperShotgunShot.a_4344();
                        (stLastWaitShot as AvatarSuperShotgunShot).m_iShotBoundStopTime = m_iShotBoundStopTime;
                        m_stSuperLastWaitShotArray.push(stLastWaitShot);
                     }
                  }
                  if(a_1334.m_iYGridNo < BattleFieldView.a_1012 - 1)
                  {
                     if(this.a_1296.m_iSuperGunType == 350225712 || this.a_1296.m_iSuperGunType == 350225968)
                     {
                        stLastWaitShot = AvatarSuperShotgunShot.a_4344();
                        (stLastWaitShot as AvatarSuperShotgunShot).m_iShotBoundStopTime = m_iShotBoundStopTime;
                        m_stSuperLastWaitShotArray.push(stLastWaitShot);
                     }
                  }
               }
               else if(m_isSuperFiveRowShot)
               {
                  if(a_1334.m_iYGridNo > 0)
                  {
                     if(this.a_1296.m_iSuperGunType == 350225712 || this.a_1296.m_iSuperGunType == 350225968)
                     {
                        stLastWaitShot = AvatarSuperShotgunShot.a_4344();
                        (stLastWaitShot as AvatarSuperShotgunShot).m_iShotBoundStopTime = m_iShotBoundStopTime;
                        m_stSuperLastWaitShotArray.push(stLastWaitShot);
                     }
                  }
                  if(a_1334.m_iYGridNo < BattleFieldView.a_1012 - 1)
                  {
                     if(this.a_1296.m_iSuperGunType == 350225712 || this.a_1296.m_iSuperGunType == 350225968)
                     {
                        stLastWaitShot = AvatarSuperShotgunShot.a_4344();
                        (stLastWaitShot as AvatarSuperShotgunShot).m_iShotBoundStopTime = m_iShotBoundStopTime;
                        m_stSuperLastWaitShotArray.push(stLastWaitShot);
                     }
                  }
                  if(a_1334.m_iYGridNo > 1)
                  {
                     if(this.a_1296.m_iSuperGunType == 350225712 || this.a_1296.m_iSuperGunType == 350225968)
                     {
                        stLastWaitShot = AvatarSuperShotgunShot.a_4344();
                        (stLastWaitShot as AvatarSuperShotgunShot).m_iShotBoundStopTime = m_iShotBoundStopTime;
                        m_stSuperLastWaitShotArray.push(stLastWaitShot);
                     }
                  }
                  if(a_1334.m_iYGridNo < BattleFieldView.a_1012 - 2)
                  {
                     if(this.a_1296.m_iSuperGunType == 350225712 || this.a_1296.m_iSuperGunType == 350225968)
                     {
                        stLastWaitShot = AvatarSuperShotgunShot.a_4344();
                        (stLastWaitShot as AvatarSuperShotgunShot).m_iShotBoundStopTime = m_iShotBoundStopTime;
                        m_stSuperLastWaitShotArray.push(stLastWaitShot);
                     }
                  }
               }
            }
         }
         if(iCurrentTime - m_iSuperLastShotTimeNum == m_iSuperShotDelayTimeNum && m_stSuperLastWaitShotArray.length > 0)
         {
            numShotXpos = this.GetSuperShotXpos();
            if(a_1283)
            {
               numShotXpos = -numShotXpos;
            }
            for(j = 0; j < this.m_ShotNumPerGroup; j++)
            {
               stLastWaitShot = m_stSuperLastWaitShotArray.pop();
               if(stLastWaitShot)
               {
                  stLastWaitShot.m_iSuperShotType = j + 1;
                  stLastWaitShot.iShotGroupIndex = 0;
                  stLastWaitShot.iShotSequenceNum = m_iSuperFirstShotSequence;
                  stLastWaitShot.a_1797(0,m_iSuperShotMoveSpeed,m_iSuperShotHurtForEach,x + numShotXpos,y + this.GetSuperShotYPos(),a_1334.m_stCurrentBattbleFieldView,a_1334);
                  parent.addChildAt(stLastWaitShot,a_1334.m_stCurrentBattbleFieldView.a_3433());
               }
            }
         }
         if(m_iSuperOnceShotNum > 0 && iCurrentTime - m_iSuperLastShotTimeNum == m_iSuperShotDelayTimeNum + m_iSuperContinueShotInterval * m_iSuperContinueShotTimes && m_stSuperLastWaitShotArray.length > 0)
         {
            numShotXpos = this.GetSuperShotXpos();
            if(a_1283)
            {
               numShotXpos = -numShotXpos;
            }
            for(k = 0; k < this.m_ShotNumPerGroup; k++)
            {
               stLastWaitShot = m_stSuperLastWaitShotArray.pop();
               if(stLastWaitShot)
               {
                  stLastWaitShot.m_iSuperShotType = k + 1;
                  stLastWaitShot.iShotGroupIndex = m_iSuperContinueShotTimes;
                  stLastWaitShot.iShotSequenceNum = m_iSuperContinueShotTimes;
                  stLastWaitShot.a_1797(0,m_iSuperShotMoveSpeed,m_iSuperShotHurtForEach,x + numShotXpos,y + this.GetSuperShotYPos(),a_1334.m_stCurrentBattbleFieldView,a_1334);
                  parent.addChildAt(stLastWaitShot,a_1334.m_stCurrentBattbleFieldView.a_3433());
               }
            }
            if(m_stSuperLastWaitShotArray.length > 0)
            {
               ++m_iSuperContinueShotTimes;
            }
         }
         if(m_isSuperDoubleShot && iCurrentTime - m_iSuperLastShotTimeNum == m_iSuperShotDelayTimeNum + m_iSuperContinueShotInterval && m_stSuperLastWaitShotArray.length > 0)
         {
            numShotXpos = this.GetSuperShotXpos();
            if(a_1283)
            {
               numShotXpos = -numShotXpos;
            }
            stLastWaitShot = m_stSuperLastWaitShotArray.pop();
            stLastWaitShot.iShotSequenceNum = 1;
            stLastWaitShot.a_1797(0,m_iSuperShotMoveSpeed,m_iSuperShotHurtForEach,x + numShotXpos,y + this.GetSuperShotYPos(),a_1334.m_stCurrentBattbleFieldView,a_1334);
            parent.addChildAt(stLastWaitShot,a_1334.m_stCurrentBattbleFieldView.a_3433());
         }
         if(m_isSuperThreeRowShot && iCurrentTime - m_iSuperLastShotTimeNum == m_iSuperShotDelayTimeNum + m_iSuperContinueShotInterval * m_iSuperContinueShotTimes && m_stSuperLastWaitShotArray.length > 0)
         {
            numShotXpos = this.GetSuperShotXpos();
            if(a_1283)
            {
               numShotXpos = -numShotXpos;
            }
            if(1 == m_iSuperContinueShotTimes && a_1334.m_iYGridNo > 0)
            {
               stLastWaitShot = m_stSuperLastWaitShotArray.pop();
               stStartField = a_1334.m_stCurrentBattbleFieldView.a_3438(a_1334.m_iXGridNo,a_1334.m_iYGridNo - 1);
               stLastWaitShot.iShotSequenceNum = a_1323;
               stLastWaitShot.a_1797(0,m_iSuperShotMoveSpeed,m_iSuperShotHurtForEach,x + numShotXpos,y + this.GetSuperShotYPos() - 5,a_1334.m_stCurrentBattbleFieldView,stStartField,false,1,2);
               parent.addChildAt(stLastWaitShot,a_1334.m_stCurrentBattbleFieldView.a_3433());
            }
            else if(2 == m_iSuperContinueShotTimes && a_1334.m_iYGridNo < BattleFieldView.a_1012 - 1)
            {
               stLastWaitShot = m_stSuperLastWaitShotArray.pop();
               stStartField = a_1334.m_stCurrentBattbleFieldView.a_3438(a_1334.m_iXGridNo,a_1334.m_iYGridNo + 1);
               stLastWaitShot.iShotSequenceNum = m_iSuperContinueShotTimes;
               stLastWaitShot.a_1797(0,m_iSuperShotMoveSpeed,m_iSuperShotHurtForEach,x + numShotXpos,y + this.GetSuperShotYPos() + 5,a_1334.m_stCurrentBattbleFieldView,stStartField,false,1,3);
               parent.addChildAt(stLastWaitShot,a_1334.m_stCurrentBattbleFieldView.a_3433());
            }
            if(m_stSuperLastWaitShotArray.length > 0)
            {
               ++m_iSuperContinueShotTimes;
            }
         }
         if(m_isSuperFiveRowShot && iCurrentTime - m_iSuperLastShotTimeNum == m_iSuperShotDelayTimeNum + m_iSuperContinueShotInterval * m_iSuperContinueShotTimes && m_stSuperLastWaitShotArray.length > 0)
         {
            numShotXpos = this.GetSuperShotXpos();
            if(a_1283)
            {
               numShotXpos = -numShotXpos;
            }
            if(1 == m_iSuperContinueShotTimes && a_1334.m_iYGridNo > 0)
            {
               stLastWaitShot = m_stSuperLastWaitShotArray.pop();
               stStartField = a_1334.m_stCurrentBattbleFieldView.a_3438(a_1334.m_iXGridNo,a_1334.m_iYGridNo - 1);
               stLastWaitShot.iShotSequenceNum = m_iSuperContinueShotTimes;
               stLastWaitShot.a_1797(0,m_iSuperShotMoveSpeed,m_iSuperShotHurtForEach,x + numShotXpos,y + this.GetSuperShotYPos() - 5,a_1334.m_stCurrentBattbleFieldView,stStartField,false,1,2);
               parent.addChildAt(stLastWaitShot,a_1334.m_stCurrentBattbleFieldView.a_3433());
            }
            else if(2 == m_iSuperContinueShotTimes && a_1334.m_iYGridNo < BattleFieldView.a_1012 - 1)
            {
               stLastWaitShot = m_stSuperLastWaitShotArray.pop();
               stStartField = a_1334.m_stCurrentBattbleFieldView.a_3438(a_1334.m_iXGridNo,a_1334.m_iYGridNo + 1);
               stLastWaitShot.iShotSequenceNum = m_iSuperContinueShotTimes;
               stLastWaitShot.a_1797(0,m_iSuperShotMoveSpeed,m_iSuperShotHurtForEach,x + numShotXpos,y + this.GetSuperShotYPos() + 5,a_1334.m_stCurrentBattbleFieldView,stStartField,false,1,3);
               parent.addChildAt(stLastWaitShot,a_1334.m_stCurrentBattbleFieldView.a_3433());
            }
            if(3 == m_iSuperContinueShotTimes && a_1334.m_iYGridNo > 1)
            {
               stLastWaitShot = m_stSuperLastWaitShotArray.pop();
               stStartField = a_1334.m_stCurrentBattbleFieldView.a_3438(a_1334.m_iXGridNo,a_1334.m_iYGridNo - 2);
               stLastWaitShot.iShotSequenceNum = m_iSuperContinueShotTimes;
               stLastWaitShot.a_1797(0,m_iSuperShotMoveSpeed,m_iSuperShotHurtForEach,x + numShotXpos,y + this.GetSuperShotYPos() - 5,a_1334.m_stCurrentBattbleFieldView,stStartField,false,1,7);
               parent.addChildAt(stLastWaitShot,a_1334.m_stCurrentBattbleFieldView.a_3433());
            }
            else if(4 == m_iSuperContinueShotTimes && a_1334.m_iYGridNo < BattleFieldView.a_1012 - 2)
            {
               stLastWaitShot = m_stSuperLastWaitShotArray.pop();
               stStartField = a_1334.m_stCurrentBattbleFieldView.a_3438(a_1334.m_iXGridNo,a_1334.m_iYGridNo + 2);
               stLastWaitShot.iShotSequenceNum = m_iSuperContinueShotTimes;
               stLastWaitShot.a_1797(0,m_iSuperShotMoveSpeed,m_iSuperShotHurtForEach,x + numShotXpos,y + this.GetSuperShotYPos() + 5,a_1334.m_stCurrentBattbleFieldView,stStartField,false,1,8);
               parent.addChildAt(stLastWaitShot,a_1334.m_stCurrentBattbleFieldView.a_3433());
            }
            if(m_stSuperLastWaitShotArray.length > 0)
            {
               ++m_iSuperContinueShotTimes;
            }
         }
         if(m_isSuperFourShot && iCurrentTime - m_iSuperLastShotTimeNum == m_iSuperShotDelayTimeNum + m_iSuperContinueShotInterval * m_iSuperContinueShotTimes && m_stSuperLastWaitShotArray.length > 0)
         {
            numShotXpos = this.GetSuperShotXpos();
            if(a_1283)
            {
               numShotXpos = -numShotXpos;
            }
            stLastWaitShot = m_stSuperLastWaitShotArray.pop();
            stLastWaitShot.iShotSequenceNum = m_iSuperContinueShotTimes;
            stLastWaitShot.a_1797(0,m_iSuperShotMoveSpeed,m_iSuperShotHurtForEach,x + numShotXpos,y + this.GetSuperShotYPos(),a_1334.m_stCurrentBattbleFieldView,a_1334);
            parent.addChildAt(stLastWaitShot,a_1334.m_stCurrentBattbleFieldView.a_3433());
            if(m_stSuperLastWaitShotArray.length > 0)
            {
               ++m_iSuperContinueShotTimes;
            }
         }
         if(m_isSuperBothWayShot && iCurrentTime - m_iSuperLastShotTimeNum == m_iSuperShotDelayTimeNum + m_iSuperContinueShotInterval * m_iSuperContinueShotTimes && m_stSuperLastWaitShotArray.length > 0)
         {
            numShotXpos = this.GetSuperShotXpos();
            if(a_1283)
            {
               numShotXpos = -numShotXpos;
            }
            numShotXpos = width - numShotXpos;
            stLastWaitShot = m_stSuperLastWaitShotArray.pop();
            stLastWaitShot.iShotSequenceNum = m_iSuperContinueShotTimes;
            stLastWaitShot.a_1797(0,m_iSuperShotMoveSpeed,m_iSuperShotHurtForEach,x + numShotXpos,y + this.GetSuperShotYPos() + 10,a_1334.m_stCurrentBattbleFieldView,a_1334,true);
            parent.addChildAt(stLastWaitShot,a_1334.m_stCurrentBattbleFieldView.a_3433());
            if(m_stSuperLastWaitShotArray.length > 0)
            {
               ++m_iSuperContinueShotTimes;
            }
         }
         return true;
      }
      
      public function a_3431(stFieldGrid:a_3491) : void
      {
         var stNearestMoveIntruder:a_4206 = null;
         var stMoveIntruder:a_4206 = null;
         this.hitFieldGrid = new Array();
         var m_arrBaseMoveIntruderVector:Array = a_1334.m_stCurrentBattbleFieldView.m_arrBaseMoveIntruderVector;
         var a_1011:int = BattleFieldView.a_1011;
         for each(stMoveIntruder in m_arrBaseMoveIntruderVector)
         {
            if(stMoveIntruder.iLifeValue > 0 && !stMoveIntruder.isCannotSeeByFighter && 1 != stMoveIntruder.iSpaceState)
            {
               if(stMoveIntruder.m_stCurrentFieldGrid.m_iXGridNo >= 0 && stMoveIntruder.m_stCurrentFieldGrid.m_iXGridNo <= 8)
               {
                  this.hitFieldGrid.push(stMoveIntruder);
               }
            }
         }
      }
      
      private function actionSkill() : void
      {
         var xStart:int = 0;
         var xEnd:int = 0;
         var yStart:int = 0;
         var yEnd:int = 0;
         var stFieldGridVector:Array = null;
         var yIndex:int = 0;
         var xIndex:int = 0;
         var arrMoveIntruder:Array = null;
         var stMoveIntruder:a_4206 = null;
         if(346162176 == this.a_1296.m_iShieldType)
         {
            xStart = Math.max(a_1334.m_iXGridNo - 1,0);
            xEnd = Math.min(a_1334.m_iXGridNo + 1,BattleFieldView.a_1011 - 1);
            yStart = Math.max(a_1334.m_iYGridNo - 1,0);
            yEnd = Math.min(a_1334.m_iYGridNo + 1,BattleFieldView.a_1012 - 1);
            stFieldGridVector = a_1334.m_stCurrentBattbleFieldView.stFieldGridsVector;
            for(yIndex = yStart; yIndex <= yEnd; yIndex++)
            {
               for(xIndex = xStart; xIndex <= xEnd; xIndex++)
               {
                  arrMoveIntruder = stFieldGridVector[yIndex][xIndex].a_1511.slice();
                  for each(stMoveIntruder in arrMoveIntruder)
                  {
                     if(this.killFieldGrid.indexOf(stMoveIntruder) == -1 && stMoveIntruder.iLifeValue > 0)
                     {
                        stMoveIntruder.a_4208(b_182.a_435,20);
                        this.killFieldGrid.push(stMoveIntruder);
                     }
                  }
               }
            }
         }
      }
      
      override public function a_3957(iCurrentTime:int) : void
      {
         this.SuperShot(iCurrentTime);
         if((iCurrentTime & 1) == 0)
         {
            super.a_3957(iCurrentTime);
            this.actionSkill();
            if(this.a_1294)
            {
               this.a_1294.a_4003(null);
            }
            if(null != this.m_stBottomEffect)
            {
               this.m_stBottomEffect.OnTimeInterval(iCurrentTime);
            }
            if(null != this.m_stTopEffect)
            {
               this.m_stTopEffect.OnTimeInterval(iCurrentTime);
            }
         }
      }
      
      private function getLampGodAttackAppearanceByGemLev(genInfoArray:Array) : a_4348
      {
         if(!battleAnim)
         {
            return null;
         }
         if(IsExitSkill([344208401],genInfoArray))
         {
            this.m_iAttackGemLevel = GetGenDegree(344208401,genInfoArray);
            if(this.m_iAttackGemLevel <= 8)
            {
               return battleAnim.a_4389(EnmBattAnimType.enm_LampGodFourAppearance);
            }
            if(this.m_iAttackGemLevel <= 14)
            {
               return battleAnim.a_4389(EnmBattAnimType.enm_LampGodFiveAppearance);
            }
            return battleAnim.a_4389(EnmBattAnimType.enm_LampGodSixAppearance);
         }
         if(IsExitSkill([344204817],genInfoArray))
         {
            this.m_iAttackGemLevel = GetGenDegree(344204817,genInfoArray);
            if(this.m_iAttackGemLevel <= 8)
            {
               return LampGodOneAppearance.a_4344();
            }
            if(this.m_iAttackGemLevel <= 14)
            {
               return LampGodTwoAppearance.a_4344();
            }
            return LampGodThreeAppearance.a_4344();
         }
         return LampGodOneAppearance.a_4344();
      }
      
      override public function a_3940() : Boolean
      {
         if(this.m_iAttackAppearance)
         {
            this.m_iAttackAppearance.a_4350();
            this.m_iAttackAppearance = null;
         }
         this.a_3929();
         this.killFieldGrid = [];
         battleAnim = null;
         super.a_3940();
         return true;
      }
      
      override protected function a_3955() : Number
      {
         return width * 0.8 * this.m_numShotXRate;
      }
      
      override protected function a_3956() : Number
      {
         return 0.75 * height * this.m_numShotYRate;
      }
      
      protected function GetSuperShotXpos() : Number
      {
         return width * 0.7;
      }
      
      protected function GetSuperShotYPos() : Number
      {
         return 0.1 * height;
      }
   }
}

