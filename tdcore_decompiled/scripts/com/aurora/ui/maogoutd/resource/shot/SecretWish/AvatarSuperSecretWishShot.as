package com.aurora.ui.maogoutd.resource.shot.SecretWish
{
   import a_4718.b_180;
   import a_4718.b_182;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.energy.a_4157;
   import com.aurora.ui.maogoutd.resource.energy.a_4162;
   import com.aurora.ui.maogoutd.resource.shot.a_4348;
   import flash.display.FrameLabel;
   import flash.display.MovieClip;
   import flash.geom.Rectangle;
   
   public class AvatarSuperSecretWishShot extends a_4348
   {
      
      private static var ms_stAvatarSuperSecretWishShotVector:Array = new Array();
      
      private static const PRODUCE_ENERGY_NUM:uint = 1;
      
      public var m_GemoLevel:int = -1;
      
      private var hitMouseArray:Array = new Array();
      
      private var m_sprite01:MovieClip;
      
      private var m_sprite02:MovieClip;
      
      private var m_sprite03:MovieClip;
      
      public function AvatarSuperSecretWishShot()
      {
         super();
         a_1279 = -width * 0.5 - 74;
         m_iYDisplayCenterPos = -height * 0.5 - 170;
         a_1573 = 1;
         a_1576 = false;
         m_isHited = true;
         a_1275 = 1;
         a_1587 = 0;
         var m_sprite:MovieClip = a_3913();
         this.m_sprite01 = m_sprite.m_sprite01;
         this.m_sprite02 = m_sprite.m_sprite02;
         this.m_sprite03 = m_sprite.m_sprite03;
         this.m_sprite01.x = -3.1;
         this.m_sprite02.x = -4.4;
         this.m_sprite03.x = 0.65;
         this.m_sprite01.y = 29.7;
         this.m_sprite02.y = 31.3;
         this.m_sprite03.y = 35.9;
         this.addChild(this.m_sprite01);
         this.addChild(this.m_sprite02);
         this.addChild(this.m_sprite03);
      }
      
      public static function a_4344() : a_4348
      {
         var stBaseShot:AvatarSuperSecretWishShot = ms_stAvatarSuperSecretWishShotVector.pop();
         if(stBaseShot == null)
         {
            stBaseShot = new AvatarSuperSecretWishShot();
         }
         BattleFieldView.a_1017.play();
         return stBaseShot;
      }
      
      override protected function getBindMovie() : Class
      {
         return AvatarSuperSecretWishShotMovie;
      }
      
      override public function a_1797(param1:int, param2:Number, param3:int, param4:int, param5:int, param6:BattleFieldView, param7:a_3491, param8:Boolean = false, param9:Number = 1, param10:int = 0) : Boolean
      {
         param4 = a_3491.a_1080 * (0 + 0);
         param5 = a_3491.a_1081 * 3;
         param7 = param6.a_3438(0,3);
         this.hitMouseArray = new Array();
         if(param6.iIntruderMoveDirection > 0)
         {
            param4 = BattleFieldView.a_1013 - param4;
         }
         super.a_1797(param1,param2,param3,param4,param5,param6,param7,param8,param9);
         gotoAndStop((a_1276[a_1275] as FrameLabel).frame);
         m_isHited = true;
         a_1271 = true;
         return true;
      }
      
      override protected function a_4349() : Boolean
      {
         return true;
      }
      
      override protected function a_3940() : Boolean
      {
         super.a_3940();
         this.hitMouseArray = new Array();
         return true;
      }
      
      public function ForceRelease() : Boolean
      {
         return this.a_3940();
      }
      
      override public function a_4216(iCurrentTime:int) : void
      {
         if(iCurrentTime % 2 == 0)
         {
            if(a_1447 == 0)
            {
               a_1447 = iCurrentTime;
            }
            if(a_1273 == 15)
            {
               this.HitMouseMoveIntruderTest();
            }
            if(m_isHited)
            {
               if(a_1273 == a_1274)
               {
                  this.a_3940();
               }
               nextFrame();
               return;
            }
         }
      }
      
      private function HitMouseMoveIntruderTest() : void
      {
         var stMoveIntruder:a_4206 = null;
         var rect:Rectangle = null;
         for(var j:int = 0; j < a_1583.m_arrBaseMoveIntruderVector.length; j++)
         {
            stMoveIntruder = a_1583.m_arrBaseMoveIntruderVector[j];
            if(this.m_sprite01 != null && stMoveIntruder != null && stMoveIntruder.iLifeValue > 0)
            {
               rect = CollisionHit.complexIntersectionRectangle(this.m_sprite01,stMoveIntruder);
               if(rect.width != 0 && rect.height != 0)
               {
                  if(this.hitMouseArray.indexOf(stMoveIntruder) == -1)
                  {
                     this.hitMouseArray.push(stMoveIntruder);
                     a_4352(stMoveIntruder);
                     if(Math.random() * 100 <= this.GetXuanYun() && stMoveIntruder.iLifeValue > 0)
                     {
                        stMoveIntruder.a_4208(b_182.enm_shotEffectXuanYun,15);
                     }
                     else if(stMoveIntruder.iLifeValue <= 0)
                     {
                        this.ProdudeEnergy(stMoveIntruder);
                     }
                  }
               }
            }
            if(this.m_sprite02 != null && stMoveIntruder != null && stMoveIntruder.iLifeValue > 0)
            {
               rect = CollisionHit.complexIntersectionRectangle(this.m_sprite02,stMoveIntruder);
               if(rect.width != 0 && rect.height != 0)
               {
                  if(this.hitMouseArray.indexOf(stMoveIntruder) == -1)
                  {
                     this.hitMouseArray.push(stMoveIntruder);
                     a_4352(stMoveIntruder);
                     if(Math.random() * 100 <= this.GetXuanYun() && stMoveIntruder.iLifeValue > 0)
                     {
                        stMoveIntruder.a_4208(b_182.enm_shotEffectXuanYun,15);
                     }
                     else if(stMoveIntruder.iLifeValue <= 0)
                     {
                        this.ProdudeEnergy(stMoveIntruder);
                     }
                  }
               }
            }
            if(this.m_sprite03 != null && stMoveIntruder != null && stMoveIntruder.iLifeValue > 0)
            {
               rect = CollisionHit.complexIntersectionRectangle(this.m_sprite03,stMoveIntruder);
               if(rect.width != 0 && rect.height != 0)
               {
                  if(this.hitMouseArray.indexOf(stMoveIntruder) == -1)
                  {
                     this.hitMouseArray.push(stMoveIntruder);
                     a_4352(stMoveIntruder);
                     if(Math.random() * 100 <= this.GetXuanYun() && stMoveIntruder.iLifeValue > 0)
                     {
                        stMoveIntruder.a_4208(b_182.enm_shotEffectXuanYun,15);
                     }
                     else if(stMoveIntruder.iLifeValue <= 0)
                     {
                        this.ProdudeEnergy(stMoveIntruder);
                     }
                  }
               }
            }
         }
      }
      
      private function GetXuanYun() : int
      {
         var iEffectValue:int = 0;
         switch(this.m_GemoLevel)
         {
            case 0:
               iEffectValue = 3;
               break;
            case 1:
               iEffectValue = 3;
               break;
            case 2:
               iEffectValue = 4;
               break;
            case 3:
               iEffectValue = 5;
               break;
            case 4:
               iEffectValue = 6;
               break;
            case 5:
               iEffectValue = 7;
               break;
            case 6:
               iEffectValue = 8;
               break;
            case 7:
               iEffectValue = 9;
               break;
            case 8:
               iEffectValue = 10;
               break;
            case 9:
               iEffectValue = 11;
               break;
            case 10:
               iEffectValue = 12;
         }
         return iEffectValue;
      }
      
      private function GetEnergyValue() : int
      {
         var iEffectValue:int = 0;
         switch(this.m_GemoLevel)
         {
            case 0:
               iEffectValue = 1;
               break;
            case 1:
               iEffectValue = 1;
               break;
            case 2:
               iEffectValue = 2;
               break;
            case 3:
               iEffectValue = 2;
               break;
            case 4:
               iEffectValue = 3;
               break;
            case 5:
               iEffectValue = 3;
               break;
            case 6:
               iEffectValue = 4;
               break;
            case 7:
               iEffectValue = 5;
               break;
            case 8:
               iEffectValue = 6;
               break;
            case 9:
               iEffectValue = 7;
               break;
            case 10:
               iEffectValue = 8;
         }
         return iEffectValue;
      }
      
      private function ProdudeEnergy(stMoveIntruder:a_4206) : void
      {
         var stFreeEnergy:a_4157 = null;
         var iEnergyValue:int = 0;
         if(this.m_GemoLevel == -1)
         {
            return;
         }
         for(var iIndex:int = 0; iIndex < PRODUCE_ENERGY_NUM; iIndex++)
         {
            stFreeEnergy = a_4162.getInstance().a_4163(b_180.a_420);
            if(null != stFreeEnergy)
            {
               iEnergyValue = this.GetEnergyValue();
               stFreeEnergy.m_stCurrentBattleField = a_1584.m_stCurrentBattbleFieldView;
               stFreeEnergy.a_1797(0,iEnergyValue,stMoveIntruder.x - 15 * iIndex,stMoveIntruder.y);
               a_1584.m_stCurrentBattbleFieldView.AddToBattleView(stFreeEnergy,BattleLayerDefine.EFFECTS_TOP_TYPE);
            }
         }
      }
   }
}

