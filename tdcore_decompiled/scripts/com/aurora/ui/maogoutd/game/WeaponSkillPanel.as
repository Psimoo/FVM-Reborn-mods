package com.aurora.ui.maogoutd.game
{
   import a_4728.a_1778;
   import com.aurora.ui.maogoutd.resource.effect.WeaponSkillReadyButtonEffect;
   import com.aurora.ui.maogoutd.resource.skill.BaseSkill;
   import com.aurora.ui.maogoutd.resource.skill.IWeaponSkill;
   import flash.display.InteractiveObject;
   import flash.display.MovieClip;
   import flash.display.SimpleButton;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.text.TextField;
   import flash.text.TextFieldAutoSize;
   
   public class WeaponSkillPanel extends Sprite
   {
      
      public static var ms_arrLocalizedDataArray:Array = [];
      
      public var m_stAddDefenseAttackSkillButton:MovieClip;
      
      public var m_stGuardCardSkillButton:MovieClip;
      
      public var m_stSuperBoundStopSkillButton:MovieClip;
      
      public var m_stSuperDeathScytheAddAttackEnhanceSkillButton:MovieClip;
      
      public var m_stSuperDeathScytheAddAttackSpeedSkillButton:MovieClip;
      
      public var m_stSuperDeathScytheAddScytheNumberSkillButton:MovieClip;
      
      public var m_stSuperDeathScytheAddHurtNumberSkillButton:MovieClip;
      
      public var m_stSuperCircleSputteringSkillButton:MovieClip;
      
      public var m_stWeaponSkill:IWeaponSkill;
      
      public var m_stLaserSkillButton:SimpleButton;
      
      public var m_stIceLaserSkillButton:SimpleButton;
      
      public var m_stBombBoomSkillButton:SimpleButton;
      
      public var m_stWangWangSkillButton:SimpleButton;
      
      public var m_stBattleBoomSkillButton:SimpleButton;
      
      public var m_stInvincibleAuraSkillButton:SimpleButton;
      
      public var m_stFogSkillButton:SimpleButton;
      
      public var m_stSuperStarSkillButton:SimpleButton;
      
      public var m_stBlisterBlockSkillButton:SimpleButton;
      
      public var m_stPoisonGasSkillButton:SimpleButton;
      
      public var m_stSummonInsuranceSkillButton:SimpleButton;
      
      public var m_stSummonDogInsuranceSkillButton:SimpleButton;
      
      public var m_stCokeBoomSkillButton:SimpleButton;
      
      public var m_stDropEnergySkillButton:Sprite;
      
      public var m_stAttackEnhanceSkillButton:Sprite;
      
      public var m_stMoYingChaoRenSkillButton:Sprite;
      
      public var m_stMoYingManLiSkillButton:Sprite;
      
      public var m_stMoYingShengYiSkillButton:Sprite;
      
      public var m_stMoYingXunJiSkillButton:Sprite;
      
      public var m_stSourceOfLightSkillButton:Sprite;
      
      public var m_stSourceOfTearingSkillButton:Sprite;
      
      public var m_stSourceOfEternalSkillButton:Sprite;
      
      public var m_stSourceOfLifeSkillButton:Sprite;
      
      public var m_stGodBlessEyeSkillButton:Sprite;
      
      public var m_stGodHuEyeSkillButton:Sprite;
      
      public var m_stGodJiEyeSkillButton:Sprite;
      
      public var m_stGodShenEyeSkillButton:Sprite;
      
      public var m_stGhostStormSkillButton:Sprite;
      
      public var m_stGhostStarFireSkillButton:Sprite;
      
      public var m_stGhostContractSkillButton:Sprite;
      
      public var m_stGhostAdjudicationSkillButton:Sprite;
      
      public var m_stGodShadowSkillButton:Sprite;
      
      public var m_stGodPowerSkillButton:Sprite;
      
      public var m_stGodAngerSkillButton:Sprite;
      
      public var m_stGodEdgeSkillButton:Sprite;
      
      public var m_stGemstoneSkillButton:Sprite;
      
      public var m_stSlowGemsSkillButton:Sprite;
      
      public var m_stFlameGemsSkillButton:Sprite;
      
      public var m_stBuzzGemsSkillButton:Sprite;
      
      public var m_stShadowGemsSkillButton:Sprite;
      
      public var m_stSpiritGemsSkillButton:Sprite;
      
      public var m_stMeteorGemsSkillButton:Sprite;
      
      public var m_stSonicGemsSkillButton:Sprite;
      
      public var m_stHeartSeaGemsSkillButton:Sprite;
      
      public var m_stPepperGemsSkillButton:Sprite;
      
      public var m_stBerryGemsSkillButton:Sprite;
      
      public var m_stYouYouGemsSkillButton:Sprite;
      
      public var m_stExplosivesGemsSkillButton:Sprite;
      
      public var m_stStarRadianceSkillButton:Sprite;
      
      public var m_stStarKissSkillButton:Sprite;
      
      public var m_stStarRainSkillButton:Sprite;
      
      public var m_stStarFlashSkillButton:Sprite;
      
      public var m_stStarShinesSkillButton:Sprite;
      
      public var m_stLampGodForceSkillButton:Sprite;
      
      public var m_stLampGodNirvanaSkillButton:Sprite;
      
      public var m_stLampGodSpeedSkillButton:Sprite;
      
      public var m_stLampGodSummonSkillButton:Sprite;
      
      public var m_stLampGodMistSkillButton:Sprite;
      
      public var m_PhotosynthesisSkillButton:Sprite;
      
      public var m_ThornThornsSkillButton:Sprite;
      
      public var m_RosesProtectionSkillButton:Sprite;
      
      public var m_RosesHeartSkillButton:Sprite;
      
      public var m_CunningDisguiseSkillButton:Sprite;
      
      public var m_stAntiInjurySkillButton:Sprite;
      
      public var m_stMouseBleedSkillButton:Sprite;
      
      public var m_stDecelerateSkillButton:Sprite;
      
      public var m_stAddAvatarLifeSkillButton:Sprite;
      
      public var m_stAddEnergySkillButton:Sprite;
      
      public var m_stSuperTransEnergySkillButton:Sprite;
      
      public var m_stSuperAttackEnhanceSkillButton:Sprite;
      
      public var m_stSuperAddAttackSpeedSkillButton:Sprite;
      
      public var m_stMaskSprite0:Sprite;
      
      public var m_stCoolMaskSprite0:Sprite;
      
      public var m_stMaskSprite1:Sprite;
      
      public var m_stCoolMaskSprite1:Sprite;
      
      public var m_stMaskSprite2:Sprite;
      
      public var m_stCoolMaskSprite2:Sprite;
      
      public var m_stSkillDegreeMovie0:MovieClip;
      
      public var m_stSkillDegreeMovie1:MovieClip;
      
      public var m_stSkillDegreeMovie2:MovieClip;
      
      public var m_stSkillDegreeMovie3:MovieClip;
      
      public var m_stSkillDegreeMovie4:MovieClip;
      
      public var m_stSkillDegreeMovie5:MovieClip;
      
      public var m_stSkillDegreeMovie6:MovieClip;
      
      public var m_stSkillDegreeMovie7:MovieClip;
      
      public var m_stSkillDegreeMovie8:MovieClip;
      
      public var m_stSkillDegreeMovie9:MovieClip;
      
      public var m_stSkillDegreeMovie10:MovieClip;
      
      public var m_stSkillDegreeMovie11:MovieClip;
      
      private var a_1093:TextField;
      
      private var m_arrBaseSkillArray:Array = [];
      
      private var m_arrWeaponSkillReadyButtonEffect:Array = [];
      
      private var m_isTwoTeamBattle:Boolean = false;
      
      private var m_iCurrentTimeNum:int;
      
      private var m_arrSkillDesc:Array = [];
      
      private var m_SkillbindSet:Array = [];
      
      public function WeaponSkillPanel()
      {
         super();
         this.m_SkillbindSet.push([344207377,this.m_PhotosynthesisSkillButton]);
         this.m_SkillbindSet.push([344207633,this.m_ThornThornsSkillButton]);
         this.m_SkillbindSet.push([344207889,this.m_RosesProtectionSkillButton]);
         this.m_SkillbindSet.push([344208657,this.m_RosesHeartSkillButton]);
         this.m_SkillbindSet.push([344208145,this.m_CunningDisguiseSkillButton]);
         this.m_SkillbindSet.push([344203793,this.m_stStarRadianceSkillButton]);
         this.m_SkillbindSet.push([344204049,this.m_stStarKissSkillButton]);
         this.m_SkillbindSet.push([344204305,this.m_stStarRainSkillButton]);
         this.m_SkillbindSet.push([344204561,this.m_stStarFlashSkillButton]);
         this.m_SkillbindSet.push([344208913,this.m_stStarShinesSkillButton]);
         this.m_SkillbindSet.push([344208401,this.m_stLampGodNirvanaSkillButton]);
         this.m_arrSkillDesc[343937040] = ms_arrLocalizedDataArray["激光：发射清行激光"] ? ms_arrLocalizedDataArray["激光：发射清行激光"] : "激光：发射清行激光";
         this.m_arrSkillDesc[343941136] = ms_arrLocalizedDataArray["冰山：发射冷冻冰柱"] ? ms_arrLocalizedDataArray["冰山：发射冷冻冰柱"] : "冰山：发射冷冻冰柱";
         this.m_arrSkillDesc[343945232] = ms_arrLocalizedDataArray["轰炸：发射轰炸炮弹"] ? ms_arrLocalizedDataArray["轰炸：发射轰炸炮弹"] : "轰炸：发射轰炸炮弹";
         this.m_arrSkillDesc[343949328] = ms_arrLocalizedDataArray["对战轰炸：轰炸对方阵地"] ? ms_arrLocalizedDataArray["对战轰炸：轰炸对方阵地"] : "对战轰炸：轰炸对方阵地";
         this.m_arrSkillDesc[343953424] = ms_arrLocalizedDataArray["无敌：回复卡片体力"] ? ms_arrLocalizedDataArray["无敌：回复卡片体力"] : "无敌：回复卡片体力";
         this.m_arrSkillDesc[343957520] = ms_arrLocalizedDataArray["迷雾：让对方阵地出现雾"] ? ms_arrLocalizedDataArray["迷雾：让对方阵地出现雾"] : "迷雾：让对方阵地出现雾";
         this.m_arrSkillDesc[343961616] = ms_arrLocalizedDataArray["星星之火：召唤星星雨"] ? ms_arrLocalizedDataArray["星星之火：召唤星星雨"] : "星星之火：召唤星星雨";
         this.m_arrSkillDesc[343965712] = ms_arrLocalizedDataArray["水墙："] ? ms_arrLocalizedDataArray["水墙："] : "水墙：";
         this.m_arrSkillDesc[343969808] = ms_arrLocalizedDataArray["毒雾：散发毒气"] ? ms_arrLocalizedDataArray["毒雾：散发毒气"] : "毒雾：散发毒气";
         this.m_arrSkillDesc[343973904] = ms_arrLocalizedDataArray["召唤猫猫：召唤猫猫攻击"] ? ms_arrLocalizedDataArray["召唤猫猫：召唤猫猫攻击"] : "召唤猫猫：召唤猫猫攻击";
         this.m_arrSkillDesc[343973905] = ms_arrLocalizedDataArray["召唤狗狗：召唤狗狗攻击"] ? ms_arrLocalizedDataArray["召唤狗狗：召唤狗狗攻击"] : "召唤狗狗：召唤狗狗攻击";
         this.m_arrSkillDesc[343978000] = ms_arrLocalizedDataArray["面粉阵：空地上种上面粉袋"] ? ms_arrLocalizedDataArray["面粉阵：空地上种上面粉袋"] : "面粉阵：空地上种上面粉袋";
         this.m_arrSkillDesc[343982096] = ms_arrLocalizedDataArray["火苗雨：掉落额外火苗"] ? ms_arrLocalizedDataArray["火苗雨：掉落额外火苗"] : "火苗雨：掉落额外火苗";
         this.m_arrSkillDesc[343986192] = ms_arrLocalizedDataArray["武器增加：提升武器基础攻击"] ? ms_arrLocalizedDataArray["武器增加：提升武器基础攻击"] : "武器增加：提升武器基础攻击";
         this.m_arrSkillDesc[344006672] = ms_arrLocalizedDataArray["魔影超刃：增加子弹数量"] ? ms_arrLocalizedDataArray["魔影超刃：增加子弹数量"] : "魔影超刃：增加子弹数量";
         this.m_arrSkillDesc[344002576] = ms_arrLocalizedDataArray["魔影蛮力：提升武器攻击力"] ? ms_arrLocalizedDataArray["魔影蛮力：提升武器攻击力"] : "魔影蛮力：提升武器攻击力";
         this.m_arrSkillDesc[343998480] = ms_arrLocalizedDataArray["魔影圣衣：战斗变身战力提升"] ? ms_arrLocalizedDataArray["魔影圣衣：战斗变身战力提升"] : "魔影圣衣：战斗变身战力提升";
         this.m_arrSkillDesc[344006928] = ms_arrLocalizedDataArray["魔影迅疾：增加攻击速率和攻击力"] ? ms_arrLocalizedDataArray["魔影迅疾：增加攻击速率和攻击力"] : "魔影迅疾：增加攻击速度和攻击力";
         this.m_arrSkillDesc[344010768] = ms_arrLocalizedDataArray["反伤：反弹伤害"] ? ms_arrLocalizedDataArray["反伤：反弹伤害"] : "反伤：反弹伤害";
         this.m_arrSkillDesc[344014864] = ms_arrLocalizedDataArray["流血：范围持续流血"] ? ms_arrLocalizedDataArray["流血：范围持续流血"] : "流血：范围持续流血";
         this.m_arrSkillDesc[344018960] = ms_arrLocalizedDataArray["迟缓：范围降低速度"] ? ms_arrLocalizedDataArray["迟缓：范围降低速度"] : "迟缓：范围降低速度";
         this.m_arrSkillDesc[344023056] = ms_arrLocalizedDataArray["守护：范围持续回血"] ? ms_arrLocalizedDataArray["守护：范围持续回血"] : "守护：范围持续回血";
         this.m_arrSkillDesc[344027152] = ms_arrLocalizedDataArray["蓄力：增加卡片范围攻击"] ? ms_arrLocalizedDataArray["蓄力：增加卡片范围攻击"] : "蓄力：增加卡片范围攻击";
         this.m_arrSkillDesc[344031248] = ms_arrLocalizedDataArray["定身：定住老鼠"] ? ms_arrLocalizedDataArray["定身：定住老鼠"] : "定身：定住老鼠";
         this.m_arrSkillDesc[344129552] = ms_arrLocalizedDataArray["死神收割：增加死神攻速"] ? ms_arrLocalizedDataArray["死神收割：增加死神攻速"] : "死神收割：增加死神攻速";
         this.m_arrSkillDesc[344133648] = ms_arrLocalizedDataArray["死神爆击：增加死神攻击"] ? ms_arrLocalizedDataArray["死神爆击：增加死神攻击"] : "死神爆击：增加死神攻击";
         this.m_arrSkillDesc[344137744] = ms_arrLocalizedDataArray["死神进化：增加镰刀数量"] ? ms_arrLocalizedDataArray["死神进化：增加镰刀数量"] : "死神进化：增加镰刀数量";
         this.m_arrSkillDesc[344138000] = ms_arrLocalizedDataArray["死神卐解：增加死神攻击力"] ? ms_arrLocalizedDataArray["死神卐解：增加死神攻击力"] : "死神卐解：增加死神攻击力";
         this.m_arrSkillDesc[344084496] = ms_arrLocalizedDataArray["体力：增加体力"] ? ms_arrLocalizedDataArray["体力：增加体力"] : "体力：增加体力";
         this.m_arrSkillDesc[344088592] = ms_arrLocalizedDataArray["生产：生产能量"] ? ms_arrLocalizedDataArray["生产：生产能量"] : "生产：生产能量";
         this.m_arrSkillDesc[344064016] = ms_arrLocalizedDataArray["转化：转化能量"] ? ms_arrLocalizedDataArray["转化：转化能量"] : "转化：转化能量";
         this.m_arrSkillDesc[344068112] = ms_arrLocalizedDataArray["强力：增加攻击"] ? ms_arrLocalizedDataArray["强力：增加攻击"] : "强力：增加攻击";
         this.m_arrSkillDesc[344072208] = ms_arrLocalizedDataArray["疾风：增加攻速"] ? ms_arrLocalizedDataArray["疾风：增加攻速"] : "疾风：增加攻速";
         this.m_arrSkillDesc[344154128] = ms_arrLocalizedDataArray["光能：生产能量"] ? ms_arrLocalizedDataArray["光能：生产能量"] : "光能：生产能量";
         this.m_arrSkillDesc[344158224] = ms_arrLocalizedDataArray["撕裂：流血反伤"] ? ms_arrLocalizedDataArray["撕裂：流血反伤"] : "撕裂：流血反伤";
         this.m_arrSkillDesc[344162320] = ms_arrLocalizedDataArray["永恒：大范围增加卡片攻击"] ? ms_arrLocalizedDataArray["永恒：大范围增加卡片攻击"] : "永恒：大范围增加卡片攻击";
         this.m_arrSkillDesc[344162576] = ms_arrLocalizedDataArray["生命：给角色和卡片加生命"] ? ms_arrLocalizedDataArray["生命：给角色和卡片加生命"] : "生命：给角色和卡片加生命";
         this.m_arrSkillDesc[344035344] = ms_arrLocalizedDataArray["溅射：增加火箭炮范围伤害"] ? ms_arrLocalizedDataArray["溅射：增加火箭炮范围伤害"] : "溅射：增加火箭炮范围伤害";
         this.m_arrSkillDesc[344129553] = ms_arrLocalizedDataArray["亡灵强袭：大幅提升武器的攻击力"] ? ms_arrLocalizedDataArray["亡灵强袭：大幅提升武器的攻击力"] : "亡灵强袭：大幅提升武器的攻击力";
         this.m_arrSkillDesc[344133649] = ms_arrLocalizedDataArray["亡灵星火：大幅提升武器的攻击速度"] ? ms_arrLocalizedDataArray["亡灵星火：大幅提升武器的攻击速度"] : "亡灵星火：大幅提升武器的攻击速度";
         this.m_arrSkillDesc[344137745] = ms_arrLocalizedDataArray["亡灵契约：增加亡灵幻影的子弹数量"] ? ms_arrLocalizedDataArray["亡灵契约：增加亡灵幻影的子弹数量"] : "亡灵契约：增加亡灵幻影的子弹数量";
         this.m_arrSkillDesc[344141841] = ms_arrLocalizedDataArray["亡灵裁决：子弹攻击附加溅射效果"] ? ms_arrLocalizedDataArray["亡灵裁决：子弹攻击附加溅射效果"] : "亡灵裁决：子弹攻击附加溅射效果";
         this.m_arrSkillDesc[344154129] = ms_arrLocalizedDataArray["神佑：自动产能"] ? ms_arrLocalizedDataArray["神佑：自动产能"] : "神佑：自动产能";
         this.m_arrSkillDesc[344158225] = ms_arrLocalizedDataArray["神忌：3*3范围内老鼠受到流血伤害和反弹伤害"] ? ms_arrLocalizedDataArray["神忌：3*3范围内老鼠受到流血伤害和反弹伤害"] : "神忌：3*3范围内老鼠受到流血伤害和反弹伤害";
         this.m_arrSkillDesc[344162321] = ms_arrLocalizedDataArray["神护：提升5*5范围内卡片的攻击力"] ? ms_arrLocalizedDataArray["神护：提升5*5范围内卡片的攻击力"] : "神护：提升5*5范围内卡片的攻击力";
         this.m_arrSkillDesc[344166417] = ms_arrLocalizedDataArray["神圣之眼：使周围老鼠减速并降低生命值"] ? ms_arrLocalizedDataArray["神圣之眼：使周围老鼠减速并降低生命值"] : "神圣之眼：使周围老鼠减速并降低生命值";
         this.m_arrSkillDesc[344207377] = ms_arrLocalizedDataArray["光合作用：自动产能"] ? ms_arrLocalizedDataArray["光合作用：自动产能"] : "光合作用：自动产能";
         this.m_arrSkillDesc[344207633] = ms_arrLocalizedDataArray["荆棘之刺：全屏发射荆棘之刺"] ? ms_arrLocalizedDataArray["荆棘之刺：全屏发射荆棘之刺"] : "荆棘之刺：全屏发射荆棘之刺";
         this.m_arrSkillDesc[344207889] = ms_arrLocalizedDataArray["玫瑰之护：提升5*5范围卡片攻击力"] ? ms_arrLocalizedDataArray["玫瑰之护：提升5*5范围卡片攻击力"] : "玫瑰之护：提升5*5范围卡片攻击力";
         this.m_arrSkillDesc[344208657] = ms_arrLocalizedDataArray["玫瑰之心：提升5*7范围卡片攻击力"] ? ms_arrLocalizedDataArray["玫瑰之心：提升5*7范围卡片攻击力"] : "玫瑰之心：提升5*7范围卡片攻击力";
         this.m_arrSkillDesc[344208145] = ms_arrLocalizedDataArray["狡诈伪装：降低范围内老鼠生命，并持续流血"] ? ms_arrLocalizedDataArray["狡诈伪装：降低范围内老鼠生命，并持续流血"] : "狡诈伪装：降低范围内老鼠生命，并持续流血";
         this.m_arrSkillDesc[343998481] = ms_arrLocalizedDataArray["天神之影：攻击附加溅射伤害"] ? ms_arrLocalizedDataArray["天神之影：攻击附加溅射伤害"] : "天神之影：攻击附加溅射伤害";
         this.m_arrSkillDesc[344002577] = ms_arrLocalizedDataArray["天神之力：提升武器攻击力百分比"] ? ms_arrLocalizedDataArray["天神之力：提升武器攻击力百分比"] : "天神之力：提升武器攻击力百分比";
         this.m_arrSkillDesc[344006673] = ms_arrLocalizedDataArray["天神之怒：增加子弹数量"] ? ms_arrLocalizedDataArray["天神之怒：增加子弹数量"] : "天神之怒：增加子弹数量";
         this.m_arrSkillDesc[344010769] = ms_arrLocalizedDataArray["天神之刃：提高基础攻击力和攻速"] ? ms_arrLocalizedDataArray["天神之刃：提高基础攻击力和攻速"] : "天神之刃：提高基础攻击力和攻速";
         this.m_arrSkillDesc[344203793] = ms_arrLocalizedDataArray["星之焕：换装，并增加攻击溅射伤害"] ? ms_arrLocalizedDataArray["星之焕：换装，并增加攻击溅射伤害"] : "星之焕：换装，并增加攻击溅射伤害";
         this.m_arrSkillDesc[344204049] = ms_arrLocalizedDataArray["星之吻：提升武器攻击力百分比"] ? ms_arrLocalizedDataArray["星之吻：提升武器攻击力百分比"] : "星之吻：提升武器攻击力百分比";
         this.m_arrSkillDesc[344204305] = ms_arrLocalizedDataArray["星之雨：增加子弹数量"] ? ms_arrLocalizedDataArray["星之雨：增加子弹数量"] : "星之雨：增加子弹数量";
         this.m_arrSkillDesc[344204561] = ms_arrLocalizedDataArray["星之闪：攻速提升"] ? ms_arrLocalizedDataArray["星之闪：攻速提升"] : "星之闪：攻速提升";
         this.m_arrSkillDesc[344208913] = ms_arrLocalizedDataArray["星之耀：换装，并提高溅射范围和伤害"] ? ms_arrLocalizedDataArray["星之耀：换装，并提高溅射范围和伤害"] : "星之耀：换装，并提高溅射范围和伤害";
         this.m_arrSkillDesc[344204817] = ms_arrLocalizedDataArray["灯神原力：幻影效果升级并提升攻击力"] ? ms_arrLocalizedDataArray["灯神原力：幻影效果升级并提升攻击力"] : "灯神原力：幻影效果升级并提升攻击力";
         this.m_arrSkillDesc[344208401] = ms_arrLocalizedDataArray["灯神涅槃: 幻影外显突破升级,攻击力提升"] ? ms_arrLocalizedDataArray["灯神涅槃: 幻影外显突破升级,攻击力提升"] : "灯神涅槃: 幻影外显突破升级,攻击力提升";
         this.m_arrSkillDesc[344205073] = ms_arrLocalizedDataArray["灯神疾速：攻速提升"] ? ms_arrLocalizedDataArray["灯神疾速：攻速提升"] : "灯神疾速：攻速提升";
         this.m_arrSkillDesc[344205329] = ms_arrLocalizedDataArray["灯神召唤：增加子弹数量"] ? ms_arrLocalizedDataArray["灯神召唤：增加子弹数量"] : "灯神召唤：增加子弹数量";
         this.m_arrSkillDesc[344205585] = ms_arrLocalizedDataArray["灯神迷雾：提升溅射伤害和子弹效果"] ? ms_arrLocalizedDataArray["灯神迷雾：提升溅射伤害和子弹效果"] : "灯神迷雾：提升溅射伤害和子弹效果";
         this.m_arrSkillDesc[343982097] = ms_arrLocalizedDataArray["产能：自动生产火苗"] ? ms_arrLocalizedDataArray["产能：自动生产火苗"] : "产能：自动生产火苗";
         this.m_arrSkillDesc[344199185] = ms_arrLocalizedDataArray["磁力吸引：减速几率和减速时间"] ? ms_arrLocalizedDataArray["磁力吸引：减速几率和减速时间"] : "磁力吸引：减速几率和减速时间";
         this.m_arrSkillDesc[344199441] = ms_arrLocalizedDataArray["烈焰燎原：延长燃烧时间"] ? ms_arrLocalizedDataArray["烈焰燎原：延长燃烧时间"] : "烈焰燎原：延长燃烧时间";
         this.m_arrSkillDesc[344199697] = ms_arrLocalizedDataArray["蜂毒：增加溅射伤害和炮弹数量"] ? ms_arrLocalizedDataArray["蜂毒：增加溅射伤害和炮弹数量"] : "蜂毒：增加溅射伤害和炮弹数量";
         this.m_arrSkillDesc[344199953] = ms_arrLocalizedDataArray["影子宝石：增加子弹数量"] ? ms_arrLocalizedDataArray["影子宝石：增加子弹数量"] : "影子宝石：增加子弹数量";
         this.m_arrSkillDesc[344200209] = ms_arrLocalizedDataArray["流星宝石：增加流星子弹数量和溅射伤害"] ? ms_arrLocalizedDataArray["流星宝石：增加流星子弹数量和溅射伤害"] : "流星宝石：增加流星子弹数量和溅射伤害";
         this.m_arrSkillDesc[344200465] = ms_arrLocalizedDataArray["精灵宝石：增加眩晕和生产能量"] ? ms_arrLocalizedDataArray["精灵宝石：增加眩晕和生产能量"] : "精灵宝石：增加眩晕和生产能量";
         this.m_arrSkillDesc[344200721] = ms_arrLocalizedDataArray["音速：增加子弹数量和速度"] ? ms_arrLocalizedDataArray["音速：增加子弹数量和速度"] : "音速：增加子弹数量和速度";
         this.m_arrSkillDesc[344200977] = ms_arrLocalizedDataArray["海之祝福：增加子弹数量和速度"] ? ms_arrLocalizedDataArray["海之祝福：增加子弹数量和速度"] : "海之祝福：增加子弹数量和速度";
         this.m_arrSkillDesc[344201233] = ms_arrLocalizedDataArray["变态辣：伤害范围内老鼠，并提升直线子弹攻击力"] ? ms_arrLocalizedDataArray["变态辣：伤害范围内老鼠，并提升直线子弹攻击力"] : "变态辣：伤害范围内老鼠，并提升直线子弹攻击力";
         this.m_arrSkillDesc[344201489] = ms_arrLocalizedDataArray["甜蜜陷阱：每隔一段时间给老鼠放置伤害陷阱"] ? ms_arrLocalizedDataArray["甜蜜陷阱：每隔一段时间给老鼠放置伤害陷阱"] : "甜蜜陷阱：每隔一段时间给老鼠放置伤害陷阱";
         this.m_arrSkillDesc[344203281] = ms_arrLocalizedDataArray["悠悠宝石：增加攻速和子弹数量"] ? ms_arrLocalizedDataArray["悠悠宝石：增加攻速和子弹数量"] : "悠悠宝石：增加攻速和子弹数量";
         this.m_arrSkillDesc[344203537] = ms_arrLocalizedDataArray["爆破宝石：增加爆弹数量和溅射伤害"] ? ms_arrLocalizedDataArray["爆破宝石：增加爆弹数量和溅射伤害"] : "爆破宝石：增加爆弹数量和溅射伤害";
         this.m_stLaserSkillButton.addEventListener(MouseEvent.CLICK,this.OnSkillButtonClickEvent);
         this.m_stIceLaserSkillButton.addEventListener(MouseEvent.CLICK,this.OnSkillButtonClickEvent);
         this.m_stBombBoomSkillButton.addEventListener(MouseEvent.CLICK,this.OnSkillButtonClickEvent);
         this.m_stWangWangSkillButton.addEventListener(MouseEvent.CLICK,this.OnSkillButtonClickEvent);
         this.m_stBattleBoomSkillButton.addEventListener(MouseEvent.CLICK,this.OnSkillButtonClickEvent);
         this.m_stInvincibleAuraSkillButton.addEventListener(MouseEvent.CLICK,this.OnSkillButtonClickEvent);
         this.m_stFogSkillButton.addEventListener(MouseEvent.CLICK,this.OnSkillButtonClickEvent);
         this.m_stSuperStarSkillButton.addEventListener(MouseEvent.CLICK,this.OnSkillButtonClickEvent);
         this.m_stBlisterBlockSkillButton.addEventListener(MouseEvent.CLICK,this.OnSkillButtonClickEvent);
         this.m_stPoisonGasSkillButton.addEventListener(MouseEvent.CLICK,this.OnSkillButtonClickEvent);
         this.m_stSummonInsuranceSkillButton.addEventListener(MouseEvent.CLICK,this.OnSkillButtonClickEvent);
         this.m_stCokeBoomSkillButton.addEventListener(MouseEvent.CLICK,this.OnSkillButtonClickEvent);
         this.m_stDropEnergySkillButton.addEventListener(MouseEvent.CLICK,this.OnSkillButtonClickEvent);
         this.m_stAttackEnhanceSkillButton.addEventListener(MouseEvent.CLICK,this.OnSkillButtonClickEvent);
         this.m_stMoYingChaoRenSkillButton.addEventListener(MouseEvent.CLICK,this.OnSkillButtonClickEvent);
         this.m_stMoYingManLiSkillButton.addEventListener(MouseEvent.CLICK,this.OnSkillButtonClickEvent);
         this.m_stMoYingShengYiSkillButton.addEventListener(MouseEvent.CLICK,this.OnSkillButtonClickEvent);
         this.m_stMoYingXunJiSkillButton.addEventListener(MouseEvent.CLICK,this.OnSkillButtonClickEvent);
         this.m_stCoolMaskSprite0.addEventListener(MouseEvent.MOUSE_OVER,this.OnSkillButtonMouseOverEvent);
         this.m_stCoolMaskSprite1.addEventListener(MouseEvent.MOUSE_OVER,this.OnSkillButtonMouseOverEvent);
         this.m_stCoolMaskSprite2.addEventListener(MouseEvent.MOUSE_OVER,this.OnSkillButtonMouseOverEvent);
         this.m_stMaskSprite0.addEventListener(MouseEvent.MOUSE_OVER,this.OnSkillButtonMouseOverEvent);
         this.m_stMaskSprite1.addEventListener(MouseEvent.MOUSE_OVER,this.OnSkillButtonMouseOverEvent);
         this.m_stMaskSprite2.addEventListener(MouseEvent.MOUSE_OVER,this.OnSkillButtonMouseOverEvent);
         this.m_stLaserSkillButton.addEventListener(MouseEvent.MOUSE_OVER,this.OnSkillButtonMouseOverEvent);
         this.m_stIceLaserSkillButton.addEventListener(MouseEvent.MOUSE_OVER,this.OnSkillButtonMouseOverEvent);
         this.m_stBombBoomSkillButton.addEventListener(MouseEvent.MOUSE_OVER,this.OnSkillButtonMouseOverEvent);
         this.m_stWangWangSkillButton.addEventListener(MouseEvent.MOUSE_OVER,this.OnSkillButtonMouseOverEvent);
         this.m_stBattleBoomSkillButton.addEventListener(MouseEvent.MOUSE_OVER,this.OnSkillButtonMouseOverEvent);
         this.m_stInvincibleAuraSkillButton.addEventListener(MouseEvent.MOUSE_OVER,this.OnSkillButtonMouseOverEvent);
         this.m_stFogSkillButton.addEventListener(MouseEvent.MOUSE_OVER,this.OnSkillButtonMouseOverEvent);
         this.m_stSuperStarSkillButton.addEventListener(MouseEvent.MOUSE_OVER,this.OnSkillButtonMouseOverEvent);
         this.m_stBlisterBlockSkillButton.addEventListener(MouseEvent.MOUSE_OVER,this.OnSkillButtonMouseOverEvent);
         this.m_stPoisonGasSkillButton.addEventListener(MouseEvent.MOUSE_OVER,this.OnSkillButtonMouseOverEvent);
         this.m_stSummonInsuranceSkillButton.addEventListener(MouseEvent.MOUSE_OVER,this.OnSkillButtonMouseOverEvent);
         this.m_stCokeBoomSkillButton.addEventListener(MouseEvent.MOUSE_OVER,this.OnSkillButtonMouseOverEvent);
         this.m_stDropEnergySkillButton.addEventListener(MouseEvent.MOUSE_OVER,this.OnSkillButtonMouseOverEvent);
         this.m_stAttackEnhanceSkillButton.addEventListener(MouseEvent.MOUSE_OVER,this.OnSkillButtonMouseOverEvent);
         this.m_stMoYingChaoRenSkillButton.addEventListener(MouseEvent.MOUSE_OVER,this.OnSkillButtonMouseOverEvent);
         this.m_stMoYingManLiSkillButton.addEventListener(MouseEvent.MOUSE_OVER,this.OnSkillButtonMouseOverEvent);
         this.m_stMoYingShengYiSkillButton.addEventListener(MouseEvent.MOUSE_OVER,this.OnSkillButtonMouseOverEvent);
         this.m_stMoYingXunJiSkillButton.addEventListener(MouseEvent.MOUSE_OVER,this.OnSkillButtonMouseOverEvent);
         this.m_stSourceOfLightSkillButton.addEventListener(MouseEvent.MOUSE_OVER,this.OnSkillButtonMouseOverEvent);
         this.m_stSourceOfTearingSkillButton.addEventListener(MouseEvent.MOUSE_OVER,this.OnSkillButtonMouseOverEvent);
         this.m_stSourceOfEternalSkillButton.addEventListener(MouseEvent.MOUSE_OVER,this.OnSkillButtonMouseOverEvent);
         this.m_stSourceOfLifeSkillButton.addEventListener(MouseEvent.MOUSE_OVER,this.OnSkillButtonMouseOverEvent);
         this.m_stGodBlessEyeSkillButton.addEventListener(MouseEvent.MOUSE_OVER,this.OnSkillButtonMouseOverEvent);
         this.m_stGodHuEyeSkillButton.addEventListener(MouseEvent.MOUSE_OVER,this.OnSkillButtonMouseOverEvent);
         this.m_stGodJiEyeSkillButton.addEventListener(MouseEvent.MOUSE_OVER,this.OnSkillButtonMouseOverEvent);
         this.m_stGodShenEyeSkillButton.addEventListener(MouseEvent.MOUSE_OVER,this.OnSkillButtonMouseOverEvent);
         this.m_stGhostStormSkillButton.addEventListener(MouseEvent.MOUSE_OVER,this.OnSkillButtonMouseOverEvent);
         this.m_stGhostStarFireSkillButton.addEventListener(MouseEvent.MOUSE_OVER,this.OnSkillButtonMouseOverEvent);
         this.m_stGhostContractSkillButton.addEventListener(MouseEvent.MOUSE_OVER,this.OnSkillButtonMouseOverEvent);
         this.m_stGhostAdjudicationSkillButton.addEventListener(MouseEvent.MOUSE_OVER,this.OnSkillButtonMouseOverEvent);
         this.m_stGodPowerSkillButton.addEventListener(MouseEvent.MOUSE_OVER,this.OnSkillButtonMouseOverEvent);
         this.m_stGodAngerSkillButton.addEventListener(MouseEvent.MOUSE_OVER,this.OnSkillButtonMouseOverEvent);
         this.m_stGodShadowSkillButton.addEventListener(MouseEvent.MOUSE_OVER,this.OnSkillButtonMouseOverEvent);
         this.m_stMeteorGemsSkillButton.addEventListener(MouseEvent.MOUSE_OVER,this.OnSkillButtonMouseOverEvent);
         this.m_stGodEdgeSkillButton.addEventListener(MouseEvent.MOUSE_OVER,this.OnSkillButtonMouseOverEvent);
         this.m_stLampGodForceSkillButton.addEventListener(MouseEvent.MOUSE_OVER,this.OnSkillButtonMouseOverEvent);
         this.m_stLampGodSpeedSkillButton.addEventListener(MouseEvent.MOUSE_OVER,this.OnSkillButtonMouseOverEvent);
         this.m_stLampGodSummonSkillButton.addEventListener(MouseEvent.MOUSE_OVER,this.OnSkillButtonMouseOverEvent);
         this.m_stLampGodMistSkillButton.addEventListener(MouseEvent.MOUSE_OVER,this.OnSkillButtonMouseOverEvent);
         this.m_stGemstoneSkillButton.addEventListener(MouseEvent.MOUSE_OVER,this.OnSkillButtonMouseOverEvent);
         this.m_stSlowGemsSkillButton.addEventListener(MouseEvent.MOUSE_OVER,this.OnSkillButtonMouseOverEvent);
         this.m_stFlameGemsSkillButton.addEventListener(MouseEvent.MOUSE_OVER,this.OnSkillButtonMouseOverEvent);
         this.m_stBuzzGemsSkillButton.addEventListener(MouseEvent.MOUSE_OVER,this.OnSkillButtonMouseOverEvent);
         this.m_stShadowGemsSkillButton.addEventListener(MouseEvent.MOUSE_OVER,this.OnSkillButtonMouseOverEvent);
         this.m_stSpiritGemsSkillButton.addEventListener(MouseEvent.MOUSE_OVER,this.OnSkillButtonMouseOverEvent);
         this.m_stSonicGemsSkillButton.addEventListener(MouseEvent.MOUSE_OVER,this.OnSkillButtonMouseOverEvent);
         this.m_stHeartSeaGemsSkillButton.addEventListener(MouseEvent.MOUSE_OVER,this.OnSkillButtonMouseOverEvent);
         this.m_stPepperGemsSkillButton.addEventListener(MouseEvent.MOUSE_OVER,this.OnSkillButtonMouseOverEvent);
         this.m_stBerryGemsSkillButton.addEventListener(MouseEvent.MOUSE_OVER,this.OnSkillButtonMouseOverEvent);
         this.m_stYouYouGemsSkillButton.addEventListener(MouseEvent.MOUSE_OVER,this.OnSkillButtonMouseOverEvent);
         this.m_stExplosivesGemsSkillButton.addEventListener(MouseEvent.MOUSE_OVER,this.OnSkillButtonMouseOverEvent);
         this.m_stAntiInjurySkillButton.addEventListener(MouseEvent.MOUSE_OVER,this.OnSkillButtonMouseOverEvent);
         this.m_stMouseBleedSkillButton.addEventListener(MouseEvent.MOUSE_OVER,this.OnSkillButtonMouseOverEvent);
         this.m_stDecelerateSkillButton.addEventListener(MouseEvent.MOUSE_OVER,this.OnSkillButtonMouseOverEvent);
         this.m_stAddAvatarLifeSkillButton.addEventListener(MouseEvent.MOUSE_OVER,this.OnSkillButtonMouseOverEvent);
         this.m_stAddEnergySkillButton.addEventListener(MouseEvent.MOUSE_OVER,this.OnSkillButtonMouseOverEvent);
         this.m_stGuardCardSkillButton.addEventListener(MouseEvent.MOUSE_OVER,this.OnSkillButtonMouseOverEvent);
         this.m_stAddDefenseAttackSkillButton.addEventListener(MouseEvent.MOUSE_OVER,this.OnSkillButtonMouseOverEvent);
         this.m_stSuperBoundStopSkillButton.addEventListener(MouseEvent.MOUSE_OVER,this.OnSkillButtonMouseOverEvent);
         this.m_stSuperDeathScytheAddAttackSpeedSkillButton.addEventListener(MouseEvent.MOUSE_OVER,this.OnSkillButtonMouseOverEvent);
         this.m_stSuperDeathScytheAddAttackEnhanceSkillButton.addEventListener(MouseEvent.MOUSE_OVER,this.OnSkillButtonMouseOverEvent);
         this.m_stSuperDeathScytheAddScytheNumberSkillButton.addEventListener(MouseEvent.MOUSE_OVER,this.OnSkillButtonMouseOverEvent);
         this.m_stSuperDeathScytheAddHurtNumberSkillButton.addEventListener(MouseEvent.MOUSE_OVER,this.OnSkillButtonMouseOverEvent);
         this.m_stSuperCircleSputteringSkillButton.addEventListener(MouseEvent.MOUSE_OVER,this.OnSkillButtonMouseOverEvent);
         this.m_stGuardCardSkillButton.addEventListener(MouseEvent.MOUSE_OUT,this.OnSkillButtonMouseOutEvent);
         this.m_stAddDefenseAttackSkillButton.addEventListener(MouseEvent.MOUSE_OUT,this.OnSkillButtonMouseOutEvent);
         this.m_stSuperBoundStopSkillButton.addEventListener(MouseEvent.MOUSE_OUT,this.OnSkillButtonMouseOutEvent);
         this.m_stSuperDeathScytheAddAttackSpeedSkillButton.addEventListener(MouseEvent.MOUSE_OUT,this.OnSkillButtonMouseOutEvent);
         this.m_stSuperDeathScytheAddAttackEnhanceSkillButton.addEventListener(MouseEvent.MOUSE_OUT,this.OnSkillButtonMouseOutEvent);
         this.m_stSuperDeathScytheAddScytheNumberSkillButton.addEventListener(MouseEvent.MOUSE_OUT,this.OnSkillButtonMouseOutEvent);
         this.m_stSuperDeathScytheAddHurtNumberSkillButton.addEventListener(MouseEvent.MOUSE_OUT,this.OnSkillButtonMouseOutEvent);
         this.m_stSuperCircleSputteringSkillButton.addEventListener(MouseEvent.MOUSE_OUT,this.OnSkillButtonMouseOutEvent);
         this.m_stSuperTransEnergySkillButton.addEventListener(MouseEvent.MOUSE_OVER,this.OnSkillButtonMouseOverEvent);
         this.m_stSuperAttackEnhanceSkillButton.addEventListener(MouseEvent.MOUSE_OVER,this.OnSkillButtonMouseOverEvent);
         this.m_stSuperAddAttackSpeedSkillButton.addEventListener(MouseEvent.MOUSE_OVER,this.OnSkillButtonMouseOverEvent);
         this.m_stCoolMaskSprite0.addEventListener(MouseEvent.MOUSE_OUT,this.OnSkillButtonMouseOutEvent);
         this.m_stCoolMaskSprite1.addEventListener(MouseEvent.MOUSE_OUT,this.OnSkillButtonMouseOutEvent);
         this.m_stCoolMaskSprite2.addEventListener(MouseEvent.MOUSE_OUT,this.OnSkillButtonMouseOutEvent);
         this.m_stMaskSprite0.addEventListener(MouseEvent.MOUSE_OUT,this.OnSkillButtonMouseOutEvent);
         this.m_stMaskSprite1.addEventListener(MouseEvent.MOUSE_OUT,this.OnSkillButtonMouseOutEvent);
         this.m_stMaskSprite2.addEventListener(MouseEvent.MOUSE_OUT,this.OnSkillButtonMouseOutEvent);
         this.m_stLaserSkillButton.addEventListener(MouseEvent.MOUSE_OUT,this.OnSkillButtonMouseOutEvent);
         this.m_stIceLaserSkillButton.addEventListener(MouseEvent.MOUSE_OUT,this.OnSkillButtonMouseOutEvent);
         this.m_stBombBoomSkillButton.addEventListener(MouseEvent.MOUSE_OUT,this.OnSkillButtonMouseOutEvent);
         this.m_stWangWangSkillButton.addEventListener(MouseEvent.MOUSE_OUT,this.OnSkillButtonMouseOutEvent);
         this.m_stBattleBoomSkillButton.addEventListener(MouseEvent.MOUSE_OUT,this.OnSkillButtonMouseOutEvent);
         this.m_stInvincibleAuraSkillButton.addEventListener(MouseEvent.MOUSE_OUT,this.OnSkillButtonMouseOutEvent);
         this.m_stFogSkillButton.addEventListener(MouseEvent.MOUSE_OUT,this.OnSkillButtonMouseOutEvent);
         this.m_stSuperStarSkillButton.addEventListener(MouseEvent.MOUSE_OUT,this.OnSkillButtonMouseOutEvent);
         this.m_stBlisterBlockSkillButton.addEventListener(MouseEvent.MOUSE_OUT,this.OnSkillButtonMouseOutEvent);
         this.m_stPoisonGasSkillButton.addEventListener(MouseEvent.MOUSE_OUT,this.OnSkillButtonMouseOutEvent);
         this.m_stSummonInsuranceSkillButton.addEventListener(MouseEvent.MOUSE_OUT,this.OnSkillButtonMouseOutEvent);
         this.m_stCokeBoomSkillButton.addEventListener(MouseEvent.MOUSE_OUT,this.OnSkillButtonMouseOutEvent);
         this.m_stDropEnergySkillButton.addEventListener(MouseEvent.MOUSE_OUT,this.OnSkillButtonMouseOutEvent);
         this.m_stAttackEnhanceSkillButton.addEventListener(MouseEvent.MOUSE_OUT,this.OnSkillButtonMouseOutEvent);
         this.m_stMoYingChaoRenSkillButton.addEventListener(MouseEvent.MOUSE_OUT,this.OnSkillButtonMouseOutEvent);
         this.m_stMoYingManLiSkillButton.addEventListener(MouseEvent.MOUSE_OUT,this.OnSkillButtonMouseOutEvent);
         this.m_stMoYingShengYiSkillButton.addEventListener(MouseEvent.MOUSE_OUT,this.OnSkillButtonMouseOutEvent);
         this.m_stMoYingXunJiSkillButton.addEventListener(MouseEvent.MOUSE_OUT,this.OnSkillButtonMouseOutEvent);
         this.m_stSourceOfLightSkillButton.addEventListener(MouseEvent.MOUSE_OUT,this.OnSkillButtonMouseOutEvent);
         this.m_stSourceOfTearingSkillButton.addEventListener(MouseEvent.MOUSE_OUT,this.OnSkillButtonMouseOutEvent);
         this.m_stSourceOfEternalSkillButton.addEventListener(MouseEvent.MOUSE_OUT,this.OnSkillButtonMouseOutEvent);
         this.m_stSourceOfLifeSkillButton.addEventListener(MouseEvent.MOUSE_OUT,this.OnSkillButtonMouseOutEvent);
         this.m_stGodBlessEyeSkillButton.addEventListener(MouseEvent.MOUSE_OUT,this.OnSkillButtonMouseOutEvent);
         this.m_stGodHuEyeSkillButton.addEventListener(MouseEvent.MOUSE_OUT,this.OnSkillButtonMouseOutEvent);
         this.m_stGodJiEyeSkillButton.addEventListener(MouseEvent.MOUSE_OUT,this.OnSkillButtonMouseOutEvent);
         this.m_stGodShenEyeSkillButton.addEventListener(MouseEvent.MOUSE_OUT,this.OnSkillButtonMouseOutEvent);
         this.m_stGhostStormSkillButton.addEventListener(MouseEvent.MOUSE_OUT,this.OnSkillButtonMouseOutEvent);
         this.m_stGhostStarFireSkillButton.addEventListener(MouseEvent.MOUSE_OUT,this.OnSkillButtonMouseOutEvent);
         this.m_stGhostContractSkillButton.addEventListener(MouseEvent.MOUSE_OUT,this.OnSkillButtonMouseOutEvent);
         this.m_stGhostAdjudicationSkillButton.addEventListener(MouseEvent.MOUSE_OUT,this.OnSkillButtonMouseOutEvent);
         this.m_stGodPowerSkillButton.addEventListener(MouseEvent.MOUSE_OUT,this.OnSkillButtonMouseOutEvent);
         this.m_stGodAngerSkillButton.addEventListener(MouseEvent.MOUSE_OUT,this.OnSkillButtonMouseOutEvent);
         this.m_stGodShadowSkillButton.addEventListener(MouseEvent.MOUSE_OUT,this.OnSkillButtonMouseOutEvent);
         this.m_stMeteorGemsSkillButton.addEventListener(MouseEvent.MOUSE_OUT,this.OnSkillButtonMouseOutEvent);
         this.m_stGodEdgeSkillButton.addEventListener(MouseEvent.MOUSE_OUT,this.OnSkillButtonMouseOutEvent);
         this.m_stLampGodForceSkillButton.addEventListener(MouseEvent.MOUSE_OUT,this.OnSkillButtonMouseOutEvent);
         this.m_stLampGodSpeedSkillButton.addEventListener(MouseEvent.MOUSE_OUT,this.OnSkillButtonMouseOutEvent);
         this.m_stLampGodSummonSkillButton.addEventListener(MouseEvent.MOUSE_OUT,this.OnSkillButtonMouseOutEvent);
         this.m_stLampGodMistSkillButton.addEventListener(MouseEvent.MOUSE_OUT,this.OnSkillButtonMouseOutEvent);
         this.m_stGemstoneSkillButton.addEventListener(MouseEvent.MOUSE_OUT,this.OnSkillButtonMouseOutEvent);
         this.m_stSlowGemsSkillButton.addEventListener(MouseEvent.MOUSE_OUT,this.OnSkillButtonMouseOutEvent);
         this.m_stFlameGemsSkillButton.addEventListener(MouseEvent.MOUSE_OUT,this.OnSkillButtonMouseOutEvent);
         this.m_stBuzzGemsSkillButton.addEventListener(MouseEvent.MOUSE_OUT,this.OnSkillButtonMouseOutEvent);
         this.m_stShadowGemsSkillButton.addEventListener(MouseEvent.MOUSE_OUT,this.OnSkillButtonMouseOutEvent);
         this.m_stSpiritGemsSkillButton.addEventListener(MouseEvent.MOUSE_OUT,this.OnSkillButtonMouseOutEvent);
         this.m_stSonicGemsSkillButton.addEventListener(MouseEvent.MOUSE_OUT,this.OnSkillButtonMouseOutEvent);
         this.m_stHeartSeaGemsSkillButton.addEventListener(MouseEvent.MOUSE_OUT,this.OnSkillButtonMouseOutEvent);
         this.m_stPepperGemsSkillButton.addEventListener(MouseEvent.MOUSE_OUT,this.OnSkillButtonMouseOutEvent);
         this.m_stBerryGemsSkillButton.addEventListener(MouseEvent.MOUSE_OUT,this.OnSkillButtonMouseOutEvent);
         this.m_stYouYouGemsSkillButton.addEventListener(MouseEvent.MOUSE_OUT,this.OnSkillButtonMouseOutEvent);
         this.m_stExplosivesGemsSkillButton.addEventListener(MouseEvent.MOUSE_OUT,this.OnSkillButtonMouseOutEvent);
         this.m_stAntiInjurySkillButton.addEventListener(MouseEvent.MOUSE_OUT,this.OnSkillButtonMouseOutEvent);
         this.m_stMouseBleedSkillButton.addEventListener(MouseEvent.MOUSE_OUT,this.OnSkillButtonMouseOutEvent);
         this.m_stDecelerateSkillButton.addEventListener(MouseEvent.MOUSE_OUT,this.OnSkillButtonMouseOutEvent);
         this.m_stAddAvatarLifeSkillButton.addEventListener(MouseEvent.MOUSE_OUT,this.OnSkillButtonMouseOutEvent);
         this.m_stAddEnergySkillButton.addEventListener(MouseEvent.MOUSE_OUT,this.OnSkillButtonMouseOutEvent);
         this.m_stSuperTransEnergySkillButton.addEventListener(MouseEvent.MOUSE_OUT,this.OnSkillButtonMouseOutEvent);
         this.m_stSuperAttackEnhanceSkillButton.addEventListener(MouseEvent.MOUSE_OUT,this.OnSkillButtonMouseOutEvent);
         this.m_stSuperAddAttackSpeedSkillButton.addEventListener(MouseEvent.MOUSE_OUT,this.OnSkillButtonMouseOutEvent);
         for(var i:int = 0; i < this.m_SkillbindSet.length; i++)
         {
            this.m_SkillbindSet[i][1].addEventListener(MouseEvent.MOUSE_OUT,this.OnSkillButtonMouseOutEvent);
            this.m_SkillbindSet[i][1].addEventListener(MouseEvent.MOUSE_OVER,this.OnSkillButtonMouseOverEvent);
         }
         this.a_1093 = new TextField();
         this.a_1093.background = true;
         this.a_1093.backgroundColor = 16764006;
         this.a_1093.border = true;
         this.a_1093.borderColor = 3355443;
         this.a_1093.textColor = 0;
      }
      
      public function Initialze(arrWeaponSkillInfos:Array, isTwoTeamBattle:Boolean) : void
      {
         var iIndex:int = 0;
         var stReadyButtonEffect:WeaponSkillReadyButtonEffect = null;
         var iSkillLen:int = 0;
         var stWeaponSkillInfo:Array = null;
         var j:int = 0;
         this.m_isTwoTeamBattle = isTwoTeamBattle;
         this.m_stLaserSkillButton.visible = false;
         this.m_stIceLaserSkillButton.visible = false;
         this.m_stBombBoomSkillButton.visible = false;
         this.m_stWangWangSkillButton.visible = false;
         this.m_stBattleBoomSkillButton.visible = false;
         this.m_stInvincibleAuraSkillButton.visible = false;
         this.m_stFogSkillButton.visible = false;
         this.m_stSuperStarSkillButton.visible = false;
         this.m_stBlisterBlockSkillButton.visible = false;
         this.m_stPoisonGasSkillButton.visible = false;
         this.m_stSummonInsuranceSkillButton.visible = false;
         this.m_stCokeBoomSkillButton.visible = false;
         this.m_stDropEnergySkillButton.visible = false;
         this.m_stAttackEnhanceSkillButton.visible = false;
         this.m_stMoYingChaoRenSkillButton.visible = false;
         this.m_stMoYingManLiSkillButton.visible = false;
         this.m_stMoYingShengYiSkillButton.visible = false;
         this.m_stMoYingXunJiSkillButton.visible = false;
         this.m_stSourceOfLightSkillButton.visible = false;
         this.m_stSourceOfTearingSkillButton.visible = false;
         this.m_stSourceOfEternalSkillButton.visible = false;
         this.m_stSourceOfLifeSkillButton.visible = false;
         this.m_stGodBlessEyeSkillButton.visible = false;
         this.m_stGodHuEyeSkillButton.visible = false;
         this.m_stGodJiEyeSkillButton.visible = false;
         this.m_stGodShenEyeSkillButton.visible = false;
         this.m_stGhostStormSkillButton.visible = false;
         this.m_stGhostStarFireSkillButton.visible = false;
         this.m_stGhostContractSkillButton.visible = false;
         this.m_stGhostAdjudicationSkillButton.visible = false;
         this.m_stGodPowerSkillButton.visible = false;
         this.m_stGodAngerSkillButton.visible = false;
         this.m_stGodShadowSkillButton.visible = false;
         this.m_stMeteorGemsSkillButton.visible = false;
         this.m_stGodEdgeSkillButton.visible = false;
         this.m_stLampGodForceSkillButton.visible = false;
         this.m_stLampGodSpeedSkillButton.visible = false;
         this.m_stLampGodSummonSkillButton.visible = false;
         this.m_stLampGodMistSkillButton.visible = false;
         this.m_stGemstoneSkillButton.visible = false;
         this.m_stSlowGemsSkillButton.visible = false;
         this.m_stFlameGemsSkillButton.visible = false;
         this.m_stBuzzGemsSkillButton.visible = false;
         this.m_stShadowGemsSkillButton.visible = false;
         this.m_stSpiritGemsSkillButton.visible = false;
         this.m_stSonicGemsSkillButton.visible = false;
         this.m_stHeartSeaGemsSkillButton.visible = false;
         this.m_stPepperGemsSkillButton.visible = false;
         this.m_stBerryGemsSkillButton.visible = false;
         this.m_stYouYouGemsSkillButton.visible = false;
         this.m_stExplosivesGemsSkillButton.visible = false;
         this.m_stAntiInjurySkillButton.visible = false;
         this.m_stMouseBleedSkillButton.visible = false;
         this.m_stDecelerateSkillButton.visible = false;
         this.m_stAddAvatarLifeSkillButton.visible = false;
         this.m_stAddEnergySkillButton.visible = false;
         this.m_stSuperTransEnergySkillButton.visible = false;
         this.m_stSuperAttackEnhanceSkillButton.visible = false;
         this.m_stSuperAddAttackSpeedSkillButton.visible = false;
         this.m_stLaserSkillButton.mouseEnabled = false;
         this.m_stIceLaserSkillButton.mouseEnabled = false;
         this.m_stBombBoomSkillButton.mouseEnabled = false;
         this.m_stWangWangSkillButton.mouseEnabled = false;
         this.m_stBattleBoomSkillButton.mouseEnabled = false;
         this.m_stInvincibleAuraSkillButton.mouseEnabled = false;
         this.m_stFogSkillButton.mouseEnabled = false;
         this.m_stSuperStarSkillButton.mouseEnabled = false;
         this.m_stBlisterBlockSkillButton.mouseEnabled = false;
         this.m_stPoisonGasSkillButton.mouseEnabled = false;
         this.m_stSummonInsuranceSkillButton.mouseEnabled = false;
         this.m_stCokeBoomSkillButton.mouseEnabled = false;
         this.m_stDropEnergySkillButton.mouseEnabled = false;
         this.m_stAttackEnhanceSkillButton.mouseEnabled = false;
         this.m_stMoYingChaoRenSkillButton.mouseEnabled = false;
         this.m_stMoYingManLiSkillButton.mouseEnabled = false;
         this.m_stMoYingShengYiSkillButton.mouseEnabled = false;
         this.m_stMoYingXunJiSkillButton.mouseEnabled = false;
         this.m_stGuardCardSkillButton.visible = false;
         this.m_stAddDefenseAttackSkillButton.visible = false;
         this.m_stSuperBoundStopSkillButton.visible = false;
         this.m_stSuperDeathScytheAddAttackSpeedSkillButton.visible = false;
         this.m_stSuperDeathScytheAddAttackEnhanceSkillButton.visible = false;
         this.m_stSuperDeathScytheAddScytheNumberSkillButton.visible = false;
         this.m_stSuperDeathScytheAddHurtNumberSkillButton.visible = false;
         this.m_stSuperCircleSputteringSkillButton.visible = false;
         for(var i:int = 0; i < this.m_SkillbindSet.length; i++)
         {
            this.m_SkillbindSet[i][1].visible = false;
         }
         this.m_stSkillDegreeMovie0.visible = false;
         this.m_stSkillDegreeMovie1.visible = false;
         this.m_stSkillDegreeMovie2.visible = false;
         this.m_stSkillDegreeMovie3.visible = false;
         this.m_stSkillDegreeMovie4.visible = false;
         this.m_stSkillDegreeMovie5.visible = false;
         this.m_stSkillDegreeMovie6.visible = false;
         this.m_stSkillDegreeMovie7.visible = false;
         this.m_stSkillDegreeMovie8.visible = false;
         this.m_stSkillDegreeMovie9.visible = false;
         this.m_stSkillDegreeMovie10.visible = false;
         this.m_stSkillDegreeMovie11.visible = false;
         this.m_stSkillDegreeMovie0.gotoAndStop(1);
         this.m_stSkillDegreeMovie1.gotoAndStop(1);
         this.m_stSkillDegreeMovie2.gotoAndStop(1);
         this.m_stSkillDegreeMovie3.gotoAndStop(1);
         this.m_stSkillDegreeMovie4.gotoAndStop(1);
         this.m_stSkillDegreeMovie5.gotoAndStop(1);
         this.m_stSkillDegreeMovie6.gotoAndStop(1);
         this.m_stSkillDegreeMovie7.gotoAndStop(1);
         this.m_stSkillDegreeMovie8.gotoAndStop(1);
         this.m_stSkillDegreeMovie9.gotoAndStop(1);
         this.m_stSkillDegreeMovie10.gotoAndStop(1);
         this.m_stSkillDegreeMovie11.gotoAndStop(1);
         this.m_stMaskSprite0.x = 4;
         this.m_stMaskSprite0.y = 4;
         this.m_stMaskSprite0.visible = false;
         this.m_stCoolMaskSprite0.x = 4;
         this.m_stCoolMaskSprite0.y = 4;
         this.m_stCoolMaskSprite0.visible = false;
         this.m_stMaskSprite1.x = 4;
         this.m_stMaskSprite1.y = 49;
         this.m_stMaskSprite1.visible = false;
         this.m_stCoolMaskSprite1.x = 4;
         this.m_stCoolMaskSprite1.y = 49;
         this.m_stCoolMaskSprite1.visible = false;
         this.m_stMaskSprite2.x = 4;
         this.m_stMaskSprite2.y = 94;
         this.m_stMaskSprite2.visible = false;
         this.m_stCoolMaskSprite2.x = 4;
         this.m_stCoolMaskSprite2.y = 94;
         this.m_stCoolMaskSprite2.visible = false;
         iIndex = 0;
         this.m_arrBaseSkillArray.length = 0;
         for each(stReadyButtonEffect in this.m_arrWeaponSkillReadyButtonEffect)
         {
            stReadyButtonEffect.a_3940();
         }
         this.m_arrWeaponSkillReadyButtonEffect = [];
         iSkillLen = 0;
         for each(stWeaponSkillInfo in arrWeaponSkillInfos)
         {
            if(343937040 == stWeaponSkillInfo[0])
            {
               this.m_stLaserSkillButton.visible = true;
               this.m_stLaserSkillButton.x = 45 * int(iIndex / 6);
               this.m_stLaserSkillButton.y = 45 * (iIndex % 6);
               this.m_arrBaseSkillArray.push([343937040,this.m_stLaserSkillButton]);
            }
            else if(343941136 == stWeaponSkillInfo[0])
            {
               this.m_stIceLaserSkillButton.visible = true;
               this.m_stIceLaserSkillButton.x = 45 * int(iIndex / 6);
               this.m_stIceLaserSkillButton.y = 45 * (iIndex % 6);
               this.m_arrBaseSkillArray.push([343941136,this.m_stIceLaserSkillButton]);
            }
            else if(343945232 == stWeaponSkillInfo[0])
            {
               this.m_stBombBoomSkillButton.visible = true;
               this.m_stBombBoomSkillButton.x = 45 * int(iIndex / 6);
               this.m_stBombBoomSkillButton.y = 45 * (iIndex % 6);
               this.m_arrBaseSkillArray.push([343945232,this.m_stBombBoomSkillButton]);
            }
            else if(343973905 == stWeaponSkillInfo[0])
            {
               this.m_stWangWangSkillButton.visible = true;
               this.m_stWangWangSkillButton.x = 45 * int(iIndex / 6);
               this.m_stWangWangSkillButton.y = 45 * (iIndex % 6);
               this.m_arrBaseSkillArray.push([343973905,this.m_stWangWangSkillButton]);
            }
            else if(343949328 == stWeaponSkillInfo[0])
            {
               this.m_stBattleBoomSkillButton.visible = true;
               this.m_stBattleBoomSkillButton.x = 45 * int(iIndex / 6);
               this.m_stBattleBoomSkillButton.y = 45 * (iIndex % 6);
               this.m_arrBaseSkillArray.push([343949328,this.m_stBattleBoomSkillButton]);
            }
            else if(343953424 == stWeaponSkillInfo[0])
            {
               this.m_stInvincibleAuraSkillButton.visible = true;
               this.m_stInvincibleAuraSkillButton.x = 45 * int(iIndex / 6);
               this.m_stInvincibleAuraSkillButton.y = 45 * (iIndex % 6);
               this.m_arrBaseSkillArray.push([343953424,this.m_stInvincibleAuraSkillButton]);
            }
            else if(343957520 == stWeaponSkillInfo[0])
            {
               this.m_stFogSkillButton.visible = true;
               this.m_stFogSkillButton.x = 45 * int(iIndex / 6);
               this.m_stFogSkillButton.y = 45 * (iIndex % 6);
               this.m_arrBaseSkillArray.push([343957520,this.m_stFogSkillButton]);
            }
            else if(343961616 == stWeaponSkillInfo[0])
            {
               this.m_stSuperStarSkillButton.visible = true;
               this.m_stSuperStarSkillButton.x = 45 * int(iIndex / 6);
               this.m_stSuperStarSkillButton.y = 45 * (iIndex % 6);
               this.m_arrBaseSkillArray.push([343961616,this.m_stSuperStarSkillButton]);
            }
            else if(343965712 == stWeaponSkillInfo[0])
            {
               this.m_stBlisterBlockSkillButton.visible = true;
               this.m_stBlisterBlockSkillButton.x = 45 * int(iIndex / 6);
               this.m_stBlisterBlockSkillButton.y = 45 * (iIndex % 6);
               this.m_arrBaseSkillArray.push([343965712,this.m_stBlisterBlockSkillButton]);
            }
            else if(343969808 == stWeaponSkillInfo[0])
            {
               this.m_stPoisonGasSkillButton.visible = true;
               this.m_stPoisonGasSkillButton.x = 45 * int(iIndex / 6);
               this.m_stPoisonGasSkillButton.y = 45 * (iIndex % 6);
               this.m_arrBaseSkillArray.push([343969808,this.m_stPoisonGasSkillButton]);
            }
            else if(343973904 == stWeaponSkillInfo[0])
            {
               this.m_stSummonInsuranceSkillButton.visible = true;
               this.m_stSummonInsuranceSkillButton.x = 45 * int(iIndex / 6);
               this.m_stSummonInsuranceSkillButton.y = 45 * (iIndex % 6);
               this.m_arrBaseSkillArray.push([343973904,this.m_stSummonInsuranceSkillButton]);
            }
            else if(343973905 == stWeaponSkillInfo[0])
            {
               this.m_stSummonDogInsuranceSkillButton.visible = true;
               this.m_stSummonDogInsuranceSkillButton.x = 45 * int(iIndex / 6);
               this.m_stSummonDogInsuranceSkillButton.y = 45 * (iIndex % 6);
               this.m_arrBaseSkillArray.push([343973905,this.m_stSummonInsuranceSkillButton]);
            }
            else if(343978000 == stWeaponSkillInfo[0])
            {
               this.m_stCokeBoomSkillButton.visible = true;
               this.m_stCokeBoomSkillButton.x = 45 * int(iIndex / 6);
               this.m_stCokeBoomSkillButton.y = 45 * (iIndex % 6);
               this.m_arrBaseSkillArray.push([343978000,this.m_stCokeBoomSkillButton]);
            }
            else if(343982096 == stWeaponSkillInfo[0])
            {
               this.m_stDropEnergySkillButton.visible = true;
               this.m_stDropEnergySkillButton.x = 45 * int(iIndex / 6);
               this.m_stDropEnergySkillButton.y = 45 * (iIndex % 6);
               this.m_arrBaseSkillArray.push([343982096,this.m_stDropEnergySkillButton]);
            }
            else if(343986192 == stWeaponSkillInfo[0])
            {
               this.m_stAttackEnhanceSkillButton.visible = true;
               this.m_stAttackEnhanceSkillButton.x = 45 * int(iIndex / 6);
               this.m_stAttackEnhanceSkillButton.y = 45 * (iIndex % 6);
               this.m_arrBaseSkillArray.push([343986192,this.m_stAttackEnhanceSkillButton]);
            }
            else if(344006672 == stWeaponSkillInfo[0])
            {
               this.m_stMoYingChaoRenSkillButton.visible = true;
               this.m_stMoYingChaoRenSkillButton.x = 45 * int(iIndex / 6);
               this.m_stMoYingChaoRenSkillButton.y = 45 * (iIndex % 6);
               this.m_arrBaseSkillArray.push([344006672,this.m_stMoYingChaoRenSkillButton]);
            }
            else if(344002576 == stWeaponSkillInfo[0])
            {
               this.m_stMoYingManLiSkillButton.visible = true;
               this.m_stMoYingManLiSkillButton.x = 45 * int(iIndex / 6);
               this.m_stMoYingManLiSkillButton.y = 45 * (iIndex % 6);
               this.m_arrBaseSkillArray.push([344002576,this.m_stMoYingManLiSkillButton]);
            }
            else if(343998480 == stWeaponSkillInfo[0])
            {
               this.m_stMoYingShengYiSkillButton.visible = true;
               this.m_stMoYingShengYiSkillButton.x = 45 * int(iIndex / 6);
               this.m_stMoYingShengYiSkillButton.y = 45 * (iIndex % 6);
               this.m_arrBaseSkillArray.push([343998480,this.m_stMoYingShengYiSkillButton]);
            }
            else if(344006928 == stWeaponSkillInfo[0])
            {
               this.m_stMoYingXunJiSkillButton.visible = true;
               this.m_stMoYingXunJiSkillButton.x = 45 * int(iIndex / 6);
               this.m_stMoYingXunJiSkillButton.y = 45 * (iIndex % 6);
               this.m_arrBaseSkillArray.push([344006928,this.m_stMoYingXunJiSkillButton]);
            }
            else if(344154128 == stWeaponSkillInfo[0])
            {
               this.m_stSourceOfLightSkillButton.visible = true;
               this.m_stSourceOfLightSkillButton.x = 45 * int(iIndex / 6);
               this.m_stSourceOfLightSkillButton.y = 45 * (iIndex % 6);
               this.m_arrBaseSkillArray.push([344154128,this.m_stSourceOfLightSkillButton]);
            }
            else if(344158224 == stWeaponSkillInfo[0])
            {
               this.m_stSourceOfTearingSkillButton.visible = true;
               this.m_stSourceOfTearingSkillButton.x = 45 * int(iIndex / 6);
               this.m_stSourceOfTearingSkillButton.y = 45 * (iIndex % 6);
               this.m_arrBaseSkillArray.push([344158224,this.m_stSourceOfTearingSkillButton]);
            }
            else if(344162320 == stWeaponSkillInfo[0])
            {
               this.m_stSourceOfEternalSkillButton.visible = true;
               this.m_stSourceOfEternalSkillButton.x = 45 * int(iIndex / 6);
               this.m_stSourceOfEternalSkillButton.y = 45 * (iIndex % 6);
               this.m_arrBaseSkillArray.push([344162320,this.m_stSourceOfEternalSkillButton]);
            }
            else if(344162576 == stWeaponSkillInfo[0])
            {
               this.m_stSourceOfLifeSkillButton.visible = true;
               this.m_stSourceOfLifeSkillButton.x = 45 * int(iIndex / 6);
               this.m_stSourceOfLifeSkillButton.y = 45 * (iIndex % 6);
               this.m_arrBaseSkillArray.push([344162576,this.m_stSourceOfLifeSkillButton]);
            }
            else if(344010768 == stWeaponSkillInfo[0] && !this.m_isTwoTeamBattle)
            {
               this.m_stAntiInjurySkillButton.visible = true;
               this.m_stAntiInjurySkillButton.x = 45 * int(iIndex / 6);
               this.m_stAntiInjurySkillButton.y = 45 * (iIndex % 6);
               this.m_arrBaseSkillArray.push([344010768,this.m_stAntiInjurySkillButton]);
            }
            else if(344014864 == stWeaponSkillInfo[0] && !this.m_isTwoTeamBattle)
            {
               this.m_stMouseBleedSkillButton.visible = true;
               this.m_stMouseBleedSkillButton.x = 45 * int(iIndex / 6);
               this.m_stMouseBleedSkillButton.y = 45 * (iIndex % 6);
               this.m_arrBaseSkillArray.push([344014864,this.m_stMouseBleedSkillButton]);
            }
            else if(344018960 == stWeaponSkillInfo[0] && !this.m_isTwoTeamBattle)
            {
               this.m_stDecelerateSkillButton.visible = true;
               this.m_stDecelerateSkillButton.x = 45 * int(iIndex / 6);
               this.m_stDecelerateSkillButton.y = 45 * (iIndex % 6);
               this.m_arrBaseSkillArray.push([344018960,this.m_stDecelerateSkillButton]);
            }
            else if(stWeaponSkillInfo[0] == 344023056 && !this.m_isTwoTeamBattle)
            {
               this.m_stGuardCardSkillButton.visible = true;
               this.m_stGuardCardSkillButton.x = 45 * int(iIndex / 6);
               this.m_stGuardCardSkillButton.y = 45 * (iIndex % 6);
               this.m_arrBaseSkillArray.push([344023056,this.m_stGuardCardSkillButton]);
            }
            else if(stWeaponSkillInfo[0] == 344027152 && !this.m_isTwoTeamBattle)
            {
               this.m_stAddDefenseAttackSkillButton.visible = true;
               this.m_stAddDefenseAttackSkillButton.x = 45 * int(iIndex / 6);
               this.m_stAddDefenseAttackSkillButton.y = 45 * (iIndex % 6);
               this.m_arrBaseSkillArray.push([344027152,this.m_stAddDefenseAttackSkillButton]);
            }
            else if(344084496 == stWeaponSkillInfo[0] && !this.m_isTwoTeamBattle)
            {
               this.m_stAddAvatarLifeSkillButton.visible = true;
               this.m_stAddAvatarLifeSkillButton.x = 45 * int(iIndex / 6);
               this.m_stAddAvatarLifeSkillButton.y = 45 * (iIndex % 6);
               this.m_arrBaseSkillArray.push([344084496,this.m_stAddAvatarLifeSkillButton]);
            }
            else if(344088592 == stWeaponSkillInfo[0] && !this.m_isTwoTeamBattle)
            {
               this.m_stAddEnergySkillButton.visible = true;
               this.m_stAddEnergySkillButton.x = 45 * int(iIndex / 6);
               this.m_stAddEnergySkillButton.y = 45 * (iIndex % 6);
               this.m_arrBaseSkillArray.push([344088592,this.m_stAddEnergySkillButton]);
            }
            else if(344031248 == stWeaponSkillInfo[0] && !this.m_isTwoTeamBattle)
            {
               this.m_stSuperBoundStopSkillButton.visible = true;
               this.m_stSuperBoundStopSkillButton.x = 45 * int(iIndex / 6);
               this.m_stSuperBoundStopSkillButton.y = 45 * (iIndex % 6);
               this.m_arrBaseSkillArray.push([344031248,this.m_stSuperBoundStopSkillButton]);
            }
            else if(344064016 == stWeaponSkillInfo[0] && !this.m_isTwoTeamBattle)
            {
               this.m_stSuperTransEnergySkillButton.visible = true;
               this.m_stSuperTransEnergySkillButton.x = 45 * int(iIndex / 6);
               this.m_stSuperTransEnergySkillButton.y = 45 * (iIndex % 6);
               this.m_arrBaseSkillArray.push([344064016,this.m_stSuperTransEnergySkillButton]);
            }
            else if(344068112 == stWeaponSkillInfo[0] && !this.m_isTwoTeamBattle)
            {
               this.m_stSuperAttackEnhanceSkillButton.visible = true;
               this.m_stSuperAttackEnhanceSkillButton.x = 45 * int(iIndex / 6);
               this.m_stSuperAttackEnhanceSkillButton.y = 45 * (iIndex % 6);
               this.m_arrBaseSkillArray.push([344068112,this.m_stSuperAttackEnhanceSkillButton]);
            }
            else if(344072208 == stWeaponSkillInfo[0] && !this.m_isTwoTeamBattle)
            {
               this.m_stSuperAddAttackSpeedSkillButton.visible = true;
               this.m_stSuperAddAttackSpeedSkillButton.x = 45 * int(iIndex / 6);
               this.m_stSuperAddAttackSpeedSkillButton.y = 45 * (iIndex % 6);
               this.m_arrBaseSkillArray.push([344072208,this.m_stSuperAddAttackSpeedSkillButton]);
            }
            else if(stWeaponSkillInfo[0] == 344129552 && !this.m_isTwoTeamBattle)
            {
               this.m_stSuperDeathScytheAddAttackSpeedSkillButton.visible = true;
               this.m_stSuperDeathScytheAddAttackSpeedSkillButton.x = 45 * int(iIndex / 6);
               this.m_stSuperDeathScytheAddAttackSpeedSkillButton.y = 45 * (iIndex % 6);
               this.m_arrBaseSkillArray.push([344129552,this.m_stSuperDeathScytheAddAttackSpeedSkillButton]);
            }
            else if(stWeaponSkillInfo[0] == 344133648 && !this.m_isTwoTeamBattle)
            {
               this.m_stSuperDeathScytheAddAttackEnhanceSkillButton.visible = true;
               this.m_stSuperDeathScytheAddAttackEnhanceSkillButton.x = 45 * int(iIndex / 6);
               this.m_stSuperDeathScytheAddAttackEnhanceSkillButton.y = 45 * (iIndex % 6);
               this.m_arrBaseSkillArray.push([344133648,this.m_stSuperDeathScytheAddAttackEnhanceSkillButton]);
            }
            else if(stWeaponSkillInfo[0] == 344137744 && !this.m_isTwoTeamBattle)
            {
               this.m_stSuperDeathScytheAddScytheNumberSkillButton.visible = true;
               this.m_stSuperDeathScytheAddScytheNumberSkillButton.x = 45 * int(iIndex / 6);
               this.m_stSuperDeathScytheAddScytheNumberSkillButton.y = 45 * (iIndex % 6);
               this.m_arrBaseSkillArray.push([344137744,this.m_stSuperDeathScytheAddScytheNumberSkillButton]);
            }
            else if(stWeaponSkillInfo[0] == 344138000 && !this.m_isTwoTeamBattle)
            {
               this.m_stSuperDeathScytheAddHurtNumberSkillButton.visible = true;
               this.m_stSuperDeathScytheAddHurtNumberSkillButton.x = 45 * int(iIndex / 6);
               this.m_stSuperDeathScytheAddHurtNumberSkillButton.y = 45 * (iIndex % 6);
               this.m_arrBaseSkillArray.push([344138000,this.m_stSuperDeathScytheAddHurtNumberSkillButton]);
            }
            else if(stWeaponSkillInfo[0] == 344035344 && !this.m_isTwoTeamBattle)
            {
               this.m_stSuperCircleSputteringSkillButton.visible = true;
               this.m_stSuperCircleSputteringSkillButton.x = 45 * int(iIndex / 6);
               this.m_stSuperCircleSputteringSkillButton.y = 45 * (iIndex % 6);
               this.m_arrBaseSkillArray.push([344035344,this.m_stSuperCircleSputteringSkillButton]);
            }
            else if(344154129 == stWeaponSkillInfo[0])
            {
               this.m_stGodBlessEyeSkillButton.visible = true;
               this.m_stGodBlessEyeSkillButton.x = 45 * int(iIndex / 6);
               this.m_stGodBlessEyeSkillButton.y = 45 * (iIndex % 6);
               this.m_arrBaseSkillArray.push([344154129,this.m_stGodBlessEyeSkillButton]);
            }
            else if(344158225 == stWeaponSkillInfo[0])
            {
               this.m_stGodJiEyeSkillButton.visible = true;
               this.m_stGodJiEyeSkillButton.x = 45 * int(iIndex / 6);
               this.m_stGodJiEyeSkillButton.y = 45 * (iIndex % 6);
               this.m_arrBaseSkillArray.push([344158225,this.m_stGodJiEyeSkillButton]);
            }
            else if(344166417 == stWeaponSkillInfo[0])
            {
               this.m_stGodShenEyeSkillButton.visible = true;
               this.m_stGodShenEyeSkillButton.x = 45 * int(iIndex / 6);
               this.m_stGodShenEyeSkillButton.y = 45 * (iIndex % 6);
               this.m_arrBaseSkillArray.push([344166417,this.m_stGodShenEyeSkillButton]);
            }
            else if(344162321 == stWeaponSkillInfo[0])
            {
               this.m_stGodHuEyeSkillButton.visible = true;
               this.m_stGodHuEyeSkillButton.x = 45 * int(iIndex / 6);
               this.m_stGodHuEyeSkillButton.y = 45 * (iIndex % 6);
               this.m_arrBaseSkillArray.push([344162321,this.m_stGodHuEyeSkillButton]);
            }
            else if(344129553 == stWeaponSkillInfo[0] && !this.m_isTwoTeamBattle)
            {
               this.m_stGhostStormSkillButton.visible = true;
               this.m_stGhostStormSkillButton.x = 45 * int(iIndex / 6);
               this.m_stGhostStormSkillButton.y = 45 * (iIndex % 6);
               this.m_arrBaseSkillArray.push([344129553,this.m_stGhostStormSkillButton]);
            }
            else if(344133649 == stWeaponSkillInfo[0] && !this.m_isTwoTeamBattle)
            {
               this.m_stGhostStarFireSkillButton.visible = true;
               this.m_stGhostStarFireSkillButton.x = 45 * int(iIndex / 6);
               this.m_stGhostStarFireSkillButton.y = 45 * (iIndex % 6);
               this.m_arrBaseSkillArray.push([344133649,this.m_stGhostStarFireSkillButton]);
            }
            else if(344137745 == stWeaponSkillInfo[0] && !this.m_isTwoTeamBattle)
            {
               this.m_stGhostContractSkillButton.visible = true;
               this.m_stGhostContractSkillButton.x = 45 * int(iIndex / 6);
               this.m_stGhostContractSkillButton.y = 45 * (iIndex % 6);
               this.m_arrBaseSkillArray.push([344137745,this.m_stGhostContractSkillButton]);
            }
            else if(344141841 == stWeaponSkillInfo[0] && !this.m_isTwoTeamBattle)
            {
               this.m_stGhostAdjudicationSkillButton.visible = true;
               this.m_stGhostAdjudicationSkillButton.x = 45 * int(iIndex / 6);
               this.m_stGhostAdjudicationSkillButton.y = 45 * (iIndex % 6);
               this.m_arrBaseSkillArray.push([344141841,this.m_stGhostAdjudicationSkillButton]);
            }
            else if(343998481 == stWeaponSkillInfo[0])
            {
               this.m_stGodShadowSkillButton.visible = true;
               this.m_stGodShadowSkillButton.x = 45 * int(iIndex / 6);
               this.m_stGodShadowSkillButton.y = 45 * (iIndex % 6);
               this.m_arrBaseSkillArray.push([343998481,this.m_stGodShadowSkillButton]);
            }
            else if(344204817 == stWeaponSkillInfo[0])
            {
               this.m_stLampGodForceSkillButton.visible = true;
               this.m_stLampGodForceSkillButton.x = 45 * int(iIndex / 6);
               this.m_stLampGodForceSkillButton.y = 45 * (iIndex % 6);
               this.m_arrBaseSkillArray.push([344204817,this.m_stLampGodForceSkillButton]);
            }
            else if(344205073 == stWeaponSkillInfo[0])
            {
               this.m_stLampGodSpeedSkillButton.visible = true;
               this.m_stLampGodSpeedSkillButton.x = 45 * int(iIndex / 6);
               this.m_stLampGodSpeedSkillButton.y = 45 * (iIndex % 6);
               this.m_arrBaseSkillArray.push([344205073,this.m_stLampGodSpeedSkillButton]);
            }
            else if(344205329 == stWeaponSkillInfo[0])
            {
               this.m_stLampGodSummonSkillButton.visible = true;
               this.m_stLampGodSummonSkillButton.x = 45 * int(iIndex / 6);
               this.m_stLampGodSummonSkillButton.y = 45 * (iIndex % 6);
               this.m_arrBaseSkillArray.push([344205329,this.m_stLampGodSummonSkillButton]);
            }
            else if(344205585 == stWeaponSkillInfo[0])
            {
               this.m_stLampGodMistSkillButton.visible = true;
               this.m_stLampGodMistSkillButton.x = 45 * int(iIndex / 6);
               this.m_stLampGodMistSkillButton.y = 45 * (iIndex % 6);
               this.m_arrBaseSkillArray.push([344205585,this.m_stLampGodMistSkillButton]);
            }
            else if(344200209 == stWeaponSkillInfo[0])
            {
               this.m_stMeteorGemsSkillButton.visible = true;
               this.m_stMeteorGemsSkillButton.x = 45 * int(iIndex / 6);
               this.m_stMeteorGemsSkillButton.y = 45 * (iIndex % 6);
               this.m_arrBaseSkillArray.push([344200209,this.m_stMeteorGemsSkillButton]);
            }
            else if(344010769 == stWeaponSkillInfo[0])
            {
               this.m_stGodEdgeSkillButton.visible = true;
               this.m_stGodEdgeSkillButton.x = 45 * int(iIndex / 6);
               this.m_stGodEdgeSkillButton.y = 45 * (iIndex % 6);
               this.m_arrBaseSkillArray.push([344010769,this.m_stGodEdgeSkillButton]);
            }
            else if(344002577 == stWeaponSkillInfo[0])
            {
               this.m_stGodPowerSkillButton.visible = true;
               this.m_stGodPowerSkillButton.x = 45 * int(iIndex / 6);
               this.m_stGodPowerSkillButton.y = 45 * (iIndex % 6);
               this.m_arrBaseSkillArray.push([344002577,this.m_stGodPowerSkillButton]);
            }
            else if(344006673 == stWeaponSkillInfo[0])
            {
               this.m_stGodAngerSkillButton.visible = true;
               this.m_stGodAngerSkillButton.x = 45 * int(iIndex / 6);
               this.m_stGodAngerSkillButton.y = 45 * (iIndex % 6);
               this.m_arrBaseSkillArray.push([344006673,this.m_stGodAngerSkillButton]);
            }
            else if(343982097 == stWeaponSkillInfo[0])
            {
               this.m_stGemstoneSkillButton.visible = true;
               this.m_stGemstoneSkillButton.x = 45 * int(iIndex / 6);
               this.m_stGemstoneSkillButton.y = 45 * (iIndex % 6);
               this.m_arrBaseSkillArray.push([343982097,this.m_stGemstoneSkillButton]);
            }
            else if(344199441 == stWeaponSkillInfo[0])
            {
               this.m_stFlameGemsSkillButton.visible = true;
               this.m_stFlameGemsSkillButton.x = 45 * int(iIndex / 6);
               this.m_stFlameGemsSkillButton.y = 45 * (iIndex % 6);
               this.m_arrBaseSkillArray.push([344199441,this.m_stFlameGemsSkillButton]);
            }
            else if(344199697 == stWeaponSkillInfo[0])
            {
               this.m_stBuzzGemsSkillButton.visible = true;
               this.m_stBuzzGemsSkillButton.x = 45 * int(iIndex / 6);
               this.m_stBuzzGemsSkillButton.y = 45 * (iIndex % 6);
               this.m_arrBaseSkillArray.push([344199697,this.m_stBuzzGemsSkillButton]);
            }
            else if(344199953 == stWeaponSkillInfo[0])
            {
               this.m_stShadowGemsSkillButton.visible = true;
               this.m_stShadowGemsSkillButton.x = 45 * int(iIndex / 6);
               this.m_stShadowGemsSkillButton.y = 45 * (iIndex % 6);
               this.m_arrBaseSkillArray.push([344199953,this.m_stShadowGemsSkillButton]);
            }
            else if(344200465 == stWeaponSkillInfo[0])
            {
               this.m_stSpiritGemsSkillButton.visible = true;
               this.m_stSpiritGemsSkillButton.x = 45 * int(iIndex / 6);
               this.m_stSpiritGemsSkillButton.y = 45 * (iIndex % 6);
               this.m_arrBaseSkillArray.push([344200465,this.m_stSpiritGemsSkillButton]);
            }
            else if(344200721 == stWeaponSkillInfo[0])
            {
               this.m_stSonicGemsSkillButton.visible = true;
               this.m_stSonicGemsSkillButton.x = 45 * int(iIndex / 6);
               this.m_stSonicGemsSkillButton.y = 45 * (iIndex % 6);
               this.m_arrBaseSkillArray.push([344200721,this.m_stSonicGemsSkillButton]);
            }
            else if(344200977 == stWeaponSkillInfo[0])
            {
               this.m_stHeartSeaGemsSkillButton.visible = true;
               this.m_stHeartSeaGemsSkillButton.x = 45 * int(iIndex / 6);
               this.m_stHeartSeaGemsSkillButton.y = 45 * (iIndex % 6);
               this.m_arrBaseSkillArray.push([344200977,this.m_stHeartSeaGemsSkillButton]);
            }
            else if(344201233 == stWeaponSkillInfo[0])
            {
               this.m_stPepperGemsSkillButton.visible = true;
               this.m_stPepperGemsSkillButton.x = 45 * int(iIndex / 6);
               this.m_stPepperGemsSkillButton.y = 45 * (iIndex % 6);
               this.m_arrBaseSkillArray.push([344201233,this.m_stPepperGemsSkillButton]);
            }
            else if(344201489 == stWeaponSkillInfo[0])
            {
               this.m_stBerryGemsSkillButton.visible = true;
               this.m_stBerryGemsSkillButton.x = 45 * int(iIndex / 6);
               this.m_stBerryGemsSkillButton.y = 45 * (iIndex % 6);
               this.m_arrBaseSkillArray.push([344201489,this.m_stBerryGemsSkillButton]);
            }
            else if(344203281 == stWeaponSkillInfo[0])
            {
               this.m_stYouYouGemsSkillButton.visible = true;
               this.m_stYouYouGemsSkillButton.x = 45 * int(iIndex / 6);
               this.m_stYouYouGemsSkillButton.y = 45 * (iIndex % 6);
               this.m_arrBaseSkillArray.push([344203281,this.m_stYouYouGemsSkillButton]);
            }
            else if(344203537 == stWeaponSkillInfo[0])
            {
               this.m_stExplosivesGemsSkillButton.visible = true;
               this.m_stExplosivesGemsSkillButton.x = 45 * int(iIndex / 6);
               this.m_stExplosivesGemsSkillButton.y = 45 * (iIndex % 6);
               this.m_arrBaseSkillArray.push([344203537,this.m_stExplosivesGemsSkillButton]);
            }
            else if(344199185 == stWeaponSkillInfo[0])
            {
               this.m_stSlowGemsSkillButton.visible = true;
               this.m_stSlowGemsSkillButton.x = 45 * int(iIndex / 6);
               this.m_stSlowGemsSkillButton.y = 45 * (iIndex % 6);
               this.m_arrBaseSkillArray.push([344199185,this.m_stSlowGemsSkillButton]);
            }
            else
            {
               for(j = 0; j < this.m_SkillbindSet.length; j++)
               {
                  if(this.m_SkillbindSet[j][0] == stWeaponSkillInfo[0])
                  {
                     this.m_SkillbindSet[j][1].visible = true;
                     this.m_SkillbindSet[j][1].x = 45 * int(iIndex / 6);
                     this.m_SkillbindSet[j][1].y = 45 * (iIndex % 6);
                     this.m_arrBaseSkillArray.push([this.m_SkillbindSet[j][0],this.m_SkillbindSet[j][1]]);
                     break;
                  }
               }
            }
            if(iSkillLen != this.m_arrBaseSkillArray.length)
            {
               iSkillLen = int(this.m_arrBaseSkillArray.length);
               if(++iIndex == 1)
               {
                  this.m_stMaskSprite0.visible = true;
                  this.m_stCoolMaskSprite0.visible = true;
                  if(stWeaponSkillInfo[1] > 0)
                  {
                     this.m_stSkillDegreeMovie0.visible = true;
                     this.m_stSkillDegreeMovie0.gotoAndStop(stWeaponSkillInfo[1]);
                  }
               }
               if(iIndex == 2)
               {
                  this.m_stMaskSprite1.visible = true;
                  this.m_stCoolMaskSprite1.visible = true;
                  if(stWeaponSkillInfo[1] > 0)
                  {
                     this.m_stSkillDegreeMovie1.visible = true;
                     this.m_stSkillDegreeMovie1.gotoAndStop(stWeaponSkillInfo[1]);
                  }
               }
               if(iIndex == 3)
               {
                  this.m_stMaskSprite2.visible = true;
                  this.m_stCoolMaskSprite2.visible = true;
                  if(stWeaponSkillInfo[1] > 0)
                  {
                     this.m_stSkillDegreeMovie2.visible = true;
                     this.m_stSkillDegreeMovie2.gotoAndStop(stWeaponSkillInfo[1]);
                  }
               }
               if(iIndex == 4)
               {
                  if(stWeaponSkillInfo[1] > 0 && !this.m_isTwoTeamBattle)
                  {
                     this.m_stSkillDegreeMovie3.visible = true;
                     this.m_stSkillDegreeMovie3.gotoAndStop(stWeaponSkillInfo[1]);
                  }
               }
               if(iIndex == 5)
               {
                  if(stWeaponSkillInfo[1] > 0 && !this.m_isTwoTeamBattle)
                  {
                     this.m_stSkillDegreeMovie4.visible = true;
                     this.m_stSkillDegreeMovie4.gotoAndStop(stWeaponSkillInfo[1]);
                  }
               }
               if(iIndex == 6)
               {
                  if(stWeaponSkillInfo[1] > 0 && !this.m_isTwoTeamBattle)
                  {
                     this.m_stSkillDegreeMovie5.visible = true;
                     this.m_stSkillDegreeMovie5.gotoAndStop(stWeaponSkillInfo[1]);
                  }
               }
               if(iIndex == 7)
               {
                  if(stWeaponSkillInfo[1] > 0 && !this.m_isTwoTeamBattle)
                  {
                     this.m_stSkillDegreeMovie6.visible = true;
                     this.m_stSkillDegreeMovie6.gotoAndStop(stWeaponSkillInfo[1]);
                  }
               }
               if(iIndex == 8)
               {
                  if(stWeaponSkillInfo[1] > 0 && !this.m_isTwoTeamBattle)
                  {
                     this.m_stSkillDegreeMovie7.visible = true;
                     this.m_stSkillDegreeMovie7.gotoAndStop(stWeaponSkillInfo[1]);
                  }
               }
               if(iIndex == 9)
               {
                  if(stWeaponSkillInfo[1] > 0 && !this.m_isTwoTeamBattle)
                  {
                     this.m_stSkillDegreeMovie8.visible = true;
                     this.m_stSkillDegreeMovie8.gotoAndStop(stWeaponSkillInfo[1]);
                  }
               }
               if(iIndex == 10)
               {
                  if(stWeaponSkillInfo[1] > 0 && !this.m_isTwoTeamBattle)
                  {
                     this.m_stSkillDegreeMovie9.visible = true;
                     this.m_stSkillDegreeMovie9.gotoAndStop(stWeaponSkillInfo[1]);
                  }
               }
               if(iIndex == 11)
               {
                  if(stWeaponSkillInfo[1] > 0 && !this.m_isTwoTeamBattle)
                  {
                     this.m_stSkillDegreeMovie10.visible = true;
                     this.m_stSkillDegreeMovie10.gotoAndStop(stWeaponSkillInfo[1]);
                  }
               }
               if(iIndex == 12)
               {
                  if(stWeaponSkillInfo[1] > 0 && !this.m_isTwoTeamBattle)
                  {
                     this.m_stSkillDegreeMovie11.visible = true;
                     this.m_stSkillDegreeMovie11.gotoAndStop(stWeaponSkillInfo[1]);
                  }
               }
            }
         }
      }
      
      public function OnTimeInterval(iTimeNum:uint) : void
      {
         var stSkillInfoArray:Array = null;
         var stSkillButton:InteractiveObject = null;
         var stBaseSkill:BaseSkill = null;
         var numRate:Number = NaN;
         var stWeaponSkillReadyButtonEffect:WeaponSkillReadyButtonEffect = null;
         this.m_iCurrentTimeNum = iTimeNum;
         for(var iIndex:int = 0; iIndex < this.m_arrBaseSkillArray.length; iIndex++)
         {
            stSkillInfoArray = this.m_arrBaseSkillArray[iIndex];
            stSkillButton = stSkillInfoArray[1] as InteractiveObject;
            stBaseSkill = this.m_stWeaponSkill.GetSkill(stSkillInfoArray[0]);
            if(stBaseSkill == null)
            {
               return;
            }
            numRate = stBaseSkill.GetSkillCostCoolingTime() / stBaseSkill.GetSkillCoolingTime();
            if((stBaseSkill.m_uiSkillID == 343949328 || stBaseSkill.m_uiSkillID == 343957520) && !this.m_isTwoTeamBattle)
            {
               numRate = 0;
            }
            if(numRate < 1)
            {
               if(iIndex == 0)
               {
                  this.m_stMaskSprite0.height = 35;
                  this.m_stCoolMaskSprite0.height = 35 * (1 - numRate);
                  this.m_stCoolMaskSprite0.y = 4 + 35 * numRate;
               }
               else if(iIndex == 1)
               {
                  this.m_stMaskSprite1.height = 35;
                  this.m_stCoolMaskSprite1.height = 35 * (1 - numRate);
                  this.m_stCoolMaskSprite1.y = 49 + 35 * numRate;
               }
               else if(iIndex == 2)
               {
                  this.m_stMaskSprite2.height = 35;
                  this.m_stCoolMaskSprite2.height = 35 * (1 - numRate);
                  this.m_stCoolMaskSprite2.y = 94 + 35 * numRate;
               }
            }
            else if(numRate >= 1)
            {
               if(iIndex == 0)
               {
                  this.m_stMaskSprite0.height = 0;
                  this.m_stMaskSprite0.y = 4;
                  this.m_stCoolMaskSprite0.height = 0;
                  this.m_stCoolMaskSprite0.y = 4;
               }
               else if(iIndex == 1)
               {
                  this.m_stMaskSprite1.height = 0;
                  this.m_stMaskSprite1.y = 49;
                  this.m_stCoolMaskSprite1.height = 0;
                  this.m_stCoolMaskSprite1.y = 49;
               }
               else if(iIndex == 2)
               {
                  this.m_stMaskSprite2.height = 0;
                  this.m_stMaskSprite2.y = 94;
                  this.m_stCoolMaskSprite2.height = 0;
                  this.m_stCoolMaskSprite2.y = 94;
               }
               if(!stSkillButton.mouseEnabled)
               {
                  this.m_stWeaponSkill.ShowSkillReady();
                  if(null == this.m_arrWeaponSkillReadyButtonEffect[iIndex])
                  {
                     this.m_arrWeaponSkillReadyButtonEffect[iIndex] = WeaponSkillReadyButtonEffect.a_3926();
                  }
                  stWeaponSkillReadyButtonEffect = this.m_arrWeaponSkillReadyButtonEffect[iIndex];
                  stWeaponSkillReadyButtonEffect.a_1797(false);
                  stWeaponSkillReadyButtonEffect.x = stSkillButton.x;
                  stWeaponSkillReadyButtonEffect.y = stSkillButton.y;
                  addChild(stWeaponSkillReadyButtonEffect);
                  this.m_arrWeaponSkillReadyButtonEffect[stSkillInfoArray[0]] = stWeaponSkillReadyButtonEffect;
               }
               stSkillButton.mouseEnabled = true;
            }
         }
      }
      
      private function OnSkillButtonClickEvent(stMouseEvent:MouseEvent) : void
      {
         var uiSkillID:uint = 0;
         var stAurDataEvent:a_1778 = null;
         if(stMouseEvent.currentTarget == this.m_stLaserSkillButton)
         {
            uiSkillID = 343937040;
         }
         else if(stMouseEvent.currentTarget == this.m_stIceLaserSkillButton)
         {
            uiSkillID = 343941136;
         }
         else if(stMouseEvent.currentTarget == this.m_stBombBoomSkillButton)
         {
            uiSkillID = 343945232;
         }
         else if(stMouseEvent.currentTarget == this.m_stWangWangSkillButton)
         {
            uiSkillID = 343973905;
         }
         else if(stMouseEvent.currentTarget == this.m_stBattleBoomSkillButton)
         {
            uiSkillID = 343949328;
         }
         else if(stMouseEvent.currentTarget == this.m_stInvincibleAuraSkillButton)
         {
            uiSkillID = 343953424;
         }
         else if(stMouseEvent.currentTarget == this.m_stFogSkillButton)
         {
            uiSkillID = 343957520;
         }
         else if(stMouseEvent.currentTarget == this.m_stSuperStarSkillButton)
         {
            uiSkillID = 343961616;
         }
         else if(stMouseEvent.currentTarget == this.m_stBlisterBlockSkillButton)
         {
            uiSkillID = 343965712;
         }
         else if(stMouseEvent.currentTarget == this.m_stPoisonGasSkillButton)
         {
            uiSkillID = 343969808;
         }
         else if(stMouseEvent.currentTarget == this.m_stSummonInsuranceSkillButton)
         {
            uiSkillID = 343973904;
         }
         else if(stMouseEvent.currentTarget == this.m_stSummonDogInsuranceSkillButton)
         {
            uiSkillID = 343973905;
         }
         else if(stMouseEvent.currentTarget == this.m_stCokeBoomSkillButton)
         {
            uiSkillID = 343978000;
         }
         if(uiSkillID > 0)
         {
            if(Boolean(this.m_stWeaponSkill) && Boolean(this.m_stWeaponSkill.GetSkill(uiSkillID)))
            {
               this.m_stWeaponSkill.GetSkill(uiSkillID).PreUseSkill();
            }
            if(Boolean(parent) && Boolean(parent.parent) && Boolean(parent.parent.parent))
            {
               stAurDataEvent = new a_1778("AruPostRequestUseWeaponSkill");
               stAurDataEvent.dataObject = [uiSkillID,this.m_iCurrentTimeNum];
               parent.parent.parent.dispatchEvent(stAurDataEvent);
            }
            if(this.m_arrWeaponSkillReadyButtonEffect[uiSkillID])
            {
               (this.m_arrWeaponSkillReadyButtonEffect[uiSkillID] as WeaponSkillReadyButtonEffect).a_3940();
            }
         }
         (stMouseEvent.currentTarget as InteractiveObject).mouseEnabled = false;
      }
      
      private function OnSkillButtonMouseOverEvent(stMouseEvent:MouseEvent) : void
      {
         var uiSkillID:uint = 0;
         var i:int = 0;
         var isPassiveSkill:Boolean = false;
         var stTargetInteractiveObject:InteractiveObject = stMouseEvent.currentTarget as InteractiveObject;
         if(stMouseEvent.currentTarget == this.m_stMaskSprite0 || stMouseEvent.currentTarget == this.m_stCoolMaskSprite0)
         {
            if(Boolean(this.m_arrBaseSkillArray[0]) && Boolean(this.m_arrBaseSkillArray[0][0]))
            {
               uiSkillID = uint(this.m_arrBaseSkillArray[0][0]);
            }
            stTargetInteractiveObject = this.m_stMaskSprite0;
         }
         else if(stMouseEvent.currentTarget == this.m_stMaskSprite1 || stMouseEvent.currentTarget == this.m_stCoolMaskSprite1)
         {
            if(Boolean(this.m_arrBaseSkillArray[0]) && Boolean(this.m_arrBaseSkillArray[1][0]))
            {
               uiSkillID = uint(this.m_arrBaseSkillArray[1][0]);
            }
            stTargetInteractiveObject = this.m_stMaskSprite1;
         }
         else if(stMouseEvent.currentTarget == this.m_stMaskSprite2 || stMouseEvent.currentTarget == this.m_stCoolMaskSprite2)
         {
            if(Boolean(this.m_arrBaseSkillArray[0]) && Boolean(this.m_arrBaseSkillArray[2][0]))
            {
               uiSkillID = uint(this.m_arrBaseSkillArray[2][0]);
            }
            stTargetInteractiveObject = this.m_stMaskSprite2;
         }
         else if(stMouseEvent.currentTarget == this.m_stLaserSkillButton)
         {
            uiSkillID = 343937040;
         }
         else if(stMouseEvent.currentTarget == this.m_stIceLaserSkillButton)
         {
            uiSkillID = 343941136;
         }
         else if(stMouseEvent.currentTarget == this.m_stBombBoomSkillButton)
         {
            uiSkillID = 343945232;
         }
         else if(stMouseEvent.currentTarget == this.m_stWangWangSkillButton)
         {
            uiSkillID = 343973905;
         }
         else if(stMouseEvent.currentTarget == this.m_stBattleBoomSkillButton)
         {
            uiSkillID = 343949328;
         }
         else if(stMouseEvent.currentTarget == this.m_stInvincibleAuraSkillButton)
         {
            uiSkillID = 343953424;
         }
         else if(stMouseEvent.currentTarget == this.m_stFogSkillButton)
         {
            uiSkillID = 343957520;
         }
         else if(stMouseEvent.currentTarget == this.m_stSuperStarSkillButton)
         {
            uiSkillID = 343961616;
         }
         else if(stMouseEvent.currentTarget == this.m_stBlisterBlockSkillButton)
         {
            uiSkillID = 343965712;
         }
         else if(stMouseEvent.currentTarget == this.m_stPoisonGasSkillButton)
         {
            uiSkillID = 343969808;
         }
         else if(stMouseEvent.currentTarget == this.m_stSummonInsuranceSkillButton)
         {
            uiSkillID = 343973904;
         }
         else if(stMouseEvent.currentTarget == this.m_stSummonDogInsuranceSkillButton)
         {
            uiSkillID = 343973905;
         }
         else if(stMouseEvent.currentTarget == this.m_stCokeBoomSkillButton)
         {
            uiSkillID = 343978000;
         }
         else if(stMouseEvent.currentTarget == this.m_stDropEnergySkillButton)
         {
            uiSkillID = 343982096;
         }
         else if(stMouseEvent.currentTarget == this.m_stAttackEnhanceSkillButton)
         {
            uiSkillID = 343986192;
         }
         else if(stMouseEvent.currentTarget == this.m_stMoYingChaoRenSkillButton)
         {
            uiSkillID = 344006672;
         }
         else if(stMouseEvent.currentTarget == this.m_stMoYingManLiSkillButton)
         {
            uiSkillID = 344002576;
         }
         else if(stMouseEvent.currentTarget == this.m_stMoYingShengYiSkillButton)
         {
            uiSkillID = 343998480;
         }
         else if(stMouseEvent.currentTarget == this.m_stMoYingXunJiSkillButton)
         {
            uiSkillID = 344006928;
         }
         else if(stMouseEvent.currentTarget == this.m_stSourceOfLightSkillButton)
         {
            uiSkillID = 344154128;
         }
         else if(stMouseEvent.currentTarget == this.m_stSourceOfTearingSkillButton)
         {
            uiSkillID = 344158224;
         }
         else if(stMouseEvent.currentTarget == this.m_stSourceOfEternalSkillButton)
         {
            uiSkillID = 344162320;
         }
         else if(stMouseEvent.currentTarget == this.m_stSourceOfLifeSkillButton)
         {
            uiSkillID = 344162576;
         }
         else if(stMouseEvent.currentTarget == this.m_stGodBlessEyeSkillButton)
         {
            uiSkillID = 344154129;
         }
         else if(stMouseEvent.currentTarget == this.m_stGodJiEyeSkillButton)
         {
            uiSkillID = 344158225;
         }
         else if(stMouseEvent.currentTarget == this.m_stGodShenEyeSkillButton)
         {
            uiSkillID = 344166417;
         }
         else if(stMouseEvent.currentTarget == this.m_stGodHuEyeSkillButton)
         {
            uiSkillID = 344162321;
         }
         else if(stMouseEvent.currentTarget == this.m_stGhostStormSkillButton)
         {
            uiSkillID = 344129553;
         }
         else if(stMouseEvent.currentTarget == this.m_stGhostStarFireSkillButton)
         {
            uiSkillID = 344133649;
         }
         else if(stMouseEvent.currentTarget == this.m_stGhostContractSkillButton)
         {
            uiSkillID = 344137745;
         }
         else if(stMouseEvent.currentTarget == this.m_stGhostAdjudicationSkillButton)
         {
            uiSkillID = 344141841;
         }
         else if(stMouseEvent.currentTarget == this.m_stGodShadowSkillButton)
         {
            uiSkillID = 343998481;
         }
         else if(stMouseEvent.currentTarget == this.m_stLampGodForceSkillButton)
         {
            uiSkillID = 344204817;
         }
         else if(stMouseEvent.currentTarget == this.m_stLampGodSpeedSkillButton)
         {
            uiSkillID = 344205073;
         }
         else if(stMouseEvent.currentTarget == this.m_stLampGodSummonSkillButton)
         {
            uiSkillID = 344205329;
         }
         else if(stMouseEvent.currentTarget == this.m_stLampGodMistSkillButton)
         {
            uiSkillID = 344205585;
         }
         else if(stMouseEvent.currentTarget == this.m_stMeteorGemsSkillButton)
         {
            uiSkillID = 344200209;
         }
         else if(stMouseEvent.currentTarget == this.m_stGodEdgeSkillButton)
         {
            uiSkillID = 344010769;
         }
         else if(stMouseEvent.currentTarget == this.m_stGodPowerSkillButton)
         {
            uiSkillID = 344002577;
         }
         else if(stMouseEvent.currentTarget == this.m_stGodAngerSkillButton)
         {
            uiSkillID = 344006673;
         }
         else if(stMouseEvent.currentTarget == this.m_stGemstoneSkillButton)
         {
            uiSkillID = 343982097;
         }
         else if(stMouseEvent.currentTarget == this.m_stFlameGemsSkillButton)
         {
            uiSkillID = 344199441;
         }
         else if(stMouseEvent.currentTarget == this.m_stBuzzGemsSkillButton)
         {
            uiSkillID = 344199697;
         }
         else if(stMouseEvent.currentTarget == this.m_stShadowGemsSkillButton)
         {
            uiSkillID = 344199953;
         }
         else if(stMouseEvent.currentTarget == this.m_stSpiritGemsSkillButton)
         {
            uiSkillID = 344200465;
         }
         else if(stMouseEvent.currentTarget == this.m_stSonicGemsSkillButton)
         {
            uiSkillID = 344200721;
         }
         else if(stMouseEvent.currentTarget == this.m_stHeartSeaGemsSkillButton)
         {
            uiSkillID = 344200977;
         }
         else if(stMouseEvent.currentTarget == this.m_stPepperGemsSkillButton)
         {
            uiSkillID = 344201233;
         }
         else if(stMouseEvent.currentTarget == this.m_stBerryGemsSkillButton)
         {
            uiSkillID = 344201489;
         }
         else if(stMouseEvent.currentTarget == this.m_stYouYouGemsSkillButton)
         {
            uiSkillID = 344203281;
         }
         else if(stMouseEvent.currentTarget == this.m_stExplosivesGemsSkillButton)
         {
            uiSkillID = 344203537;
         }
         else if(stMouseEvent.currentTarget == this.m_stSlowGemsSkillButton)
         {
            uiSkillID = 344199185;
         }
         else if(stMouseEvent.currentTarget == this.m_stAntiInjurySkillButton)
         {
            uiSkillID = 344010768;
         }
         else if(stMouseEvent.currentTarget == this.m_stMouseBleedSkillButton)
         {
            uiSkillID = 344014864;
         }
         else if(stMouseEvent.currentTarget == this.m_stDecelerateSkillButton)
         {
            uiSkillID = 344018960;
         }
         else if(stMouseEvent.currentTarget == this.m_stGuardCardSkillButton)
         {
            uiSkillID = 344023056;
         }
         else if(stMouseEvent.currentTarget == this.m_stAddDefenseAttackSkillButton)
         {
            uiSkillID = 344027152;
         }
         else if(stMouseEvent.currentTarget == this.m_stAddAvatarLifeSkillButton)
         {
            uiSkillID = 344084496;
         }
         else if(stMouseEvent.currentTarget == this.m_stAddEnergySkillButton)
         {
            uiSkillID = 344088592;
         }
         else if(stMouseEvent.currentTarget == this.m_stSuperBoundStopSkillButton)
         {
            uiSkillID = 344031248;
         }
         else if(stMouseEvent.currentTarget == this.m_stSuperTransEnergySkillButton)
         {
            uiSkillID = 344064016;
         }
         else if(stMouseEvent.currentTarget == this.m_stSuperAttackEnhanceSkillButton)
         {
            uiSkillID = 344068112;
         }
         else if(stMouseEvent.currentTarget == this.m_stSuperAddAttackSpeedSkillButton)
         {
            uiSkillID = 344072208;
         }
         else if(stMouseEvent.currentTarget == this.m_stSuperDeathScytheAddAttackSpeedSkillButton)
         {
            uiSkillID = 344129552;
         }
         else if(stMouseEvent.currentTarget == this.m_stSuperDeathScytheAddAttackEnhanceSkillButton)
         {
            uiSkillID = 344133648;
         }
         else if(stMouseEvent.currentTarget == this.m_stSuperDeathScytheAddScytheNumberSkillButton)
         {
            uiSkillID = 344137744;
         }
         else if(stMouseEvent.currentTarget == this.m_stSuperDeathScytheAddHurtNumberSkillButton)
         {
            uiSkillID = 344138000;
         }
         else if(stMouseEvent.currentTarget == this.m_stSuperCircleSputteringSkillButton)
         {
            uiSkillID = 344035344;
         }
         else
         {
            for(i = 0; i < this.m_SkillbindSet.length; i++)
            {
               if(this.m_SkillbindSet[i][1] == stMouseEvent.currentTarget)
               {
                  uiSkillID = uint(this.m_SkillbindSet[i][0]);
                  isPassiveSkill = true;
                  break;
               }
            }
         }
         var numRate:Number = 1;
         var stBaseSkill:BaseSkill = this.m_stWeaponSkill.GetSkill(uiSkillID);
         if(stBaseSkill)
         {
            numRate = stBaseSkill.GetSkillCostCoolingTime() / stBaseSkill.GetSkillCoolingTime();
         }
         this.a_1093.width = 100;
         this.a_1093.height = 35;
         this.a_1093.multiline = true;
         this.a_1093.autoSize = TextFieldAutoSize.CENTER;
         var szAlertText:String = "";
         if(uiSkillID == 343982096 || uiSkillID == 343982097 || uiSkillID == 344199441 || uiSkillID == 344199697 || uiSkillID == 344199185 || uiSkillID == 343986192 || uiSkillID == 344199953 || uiSkillID == 344199953 || uiSkillID == 344200721 || uiSkillID == 344200977 || uiSkillID == 344201233 || uiSkillID == 344201489 || uiSkillID == 344203281 || uiSkillID == 344203537 || uiSkillID >= 343998480 && uiSkillID <= 344190992 || isPassiveSkill)
         {
            szAlertText += "<font color=\'#FF0000\'>" + (ms_arrLocalizedDataArray["被动技能不需要点击使用"] ? ms_arrLocalizedDataArray["被动技能不需要点击使用"] : "被动技能不需要点击使用") + "</font><br>";
         }
         else if((uiSkillID == 343949328 || uiSkillID == 343957520) && !this.m_isTwoTeamBattle)
         {
            szAlertText += "<font color=\'#FF0000\'>" + (ms_arrLocalizedDataArray["对战技能通关中不能使用"] ? ms_arrLocalizedDataArray["对战技能通关中不能使用"] : "对战技能通关中不能使用") + "</font><br>";
         }
         else if(numRate < 1)
         {
            szAlertText += "<font color=\'#FF0000\'>" + (ms_arrLocalizedDataArray["正在冷却中"] ? ms_arrLocalizedDataArray["正在冷却中"] : "正在冷却中") + "</font><br>";
         }
         if(this.m_arrSkillDesc[uiSkillID])
         {
            this.a_1093.htmlText = szAlertText + "<font color=\'0x000000\'>" + (ms_arrLocalizedDataArray[this.m_arrSkillDesc[uiSkillID]] ? ms_arrLocalizedDataArray[this.m_arrSkillDesc[uiSkillID]] : this.m_arrSkillDesc[uiSkillID]) + "</font>";
         }
         else
         {
            this.a_1093.htmlText = szAlertText;
         }
         this.a_1093.x = stTargetInteractiveObject.x + 42;
         this.a_1093.y = stTargetInteractiveObject.y;
         addChild(this.a_1093);
      }
      
      private function OnSkillButtonMouseOutEvent(a_4730:MouseEvent) : void
      {
         if(contains(this.a_1093))
         {
            removeChild(this.a_1093);
         }
      }
   }
}

