package a_4724
{
   import com.aurora.ui.maogoutd.role.a_4461;
   import flash.utils.Dictionary;
   
   public class AvatarDetailInfo
   {
      
      public var m_iCoverallType:int = 0;
      
      public var m_iGunType:int = 0;
      
      public var m_iSuperGunType:int = 0;
      
      public var m_iGunSequence:int = 0;
      
      public var m_iShieldType:int = 0;
      
      public var m_iHatType:int = 0;
      
      public var m_iEyeGlassesType:int = 0;
      
      public var m_iFaceType:int = 0;
      
      public var m_iFaceDecorationType:int = 0;
      
      public var m_iEyeType:int = 0;
      
      public var m_iHairType:int = 0;
      
      public var m_iBodyType:int = 0;
      
      public var m_iAureolaType:int = 0;
      
      public var m_iWingType:int = 0;
      
      public var m_iLandInsuranceType:int = 0;
      
      public var m_iWaterInsuranceType:int = 0;
      
      public var m_numAttackForce:Number = 1;
      
      public var m_numDefenseForce:Number = 0;
      
      public var m_numAddExperience:Number = 0;
      
      public var m_numAddProps:Number = 0;
      
      public var m_numAddSkill:Number = 0;
      
      public var m_numAddGold:Number = 0;
      
      public var m_byShovelType:int = 1;
      
      public var m_isAutoPickUpEnergy:Boolean = false;
      
      public var m_isAutoPickUpProps:Boolean = false;
      
      public var m_arrCardInfoArray:Array = [];
      
      public var m_arrGenInfoArray:Array = [];
      
      public var m_arrCardEffectAddArray:Array = [];
      
      public var m_arrPetInfoArray:Array = [];
      
      private var dictNotVisible:Dictionary;
      
      public function AvatarDetailInfo()
      {
         super();
         this.dictNotVisible = new Dictionary();
         this.dictNotVisible[344981504] = 1;
         this.dictNotVisible[346030080] = 1;
         this.dictNotVisible[350224384] = 1;
         this.dictNotVisible[348127232] = 1;
         this.dictNotVisible[335544320] = 1;
      }
      
      public static function getCardEffectValueArray(packed:Array, iCardID:int, iEffectTypeID:int) : Array
      {
         var cid:int = 0;
         var at:int = 0;
         var v:Number = NaN;
         if(packed == null || packed.length < 3 || packed.length % 3 != 0)
         {
            return [];
         }
         var out:Array = [];
         var i:* = 0;
         var n:int = int(packed.length);
         while(i + 2 < n)
         {
            cid = int(packed[i++]);
            at = int(packed[i++]);
            v = Number(packed[i++]);
            if(cid == iCardID && at == iEffectTypeID)
            {
               out.push(v);
            }
         }
         return out;
      }
      
      public function setAvaterDeatil(arrAvatarID:Array, iGender:int, iSuitShowType:int) : void
      {
         var heroItem:Object = null;
         var itemID:int = 0;
         var type:int = 0;
         var dict:Dictionary = null;
         var id:int = 0;
         var gemoSuit:int = 0;
         this.m_iEyeType = iGender == 1 ? 342884624 : 342884640;
         this.m_iBodyType = iGender == 1 ? 341836048 : 341836064;
         this.m_iHairType = iGender == 1 ? 339738896 : 339738912;
         this.m_iFaceType = iGender == 1 ? 340787216 : 340787232;
         this.m_iGunType = 336658688;
         this.m_numDefenseForce = 0;
         if(arrAvatarID != null)
         {
            for each(heroItem in arrAvatarID)
            {
               itemID = int(heroItem.m_iItemID);
               type = (itemID & 0xF00000) >> 20;
               if(type != 1)
               {
                  this.m_numDefenseForce += heroItem.m_iTypeValue;
               }
               dict = heroItem.m_dictExtraAttr as Dictionary;
               if(dict != null)
               {
                  this.m_numAddExperience += Number(dict[3] == null ? 0 : dict[3]);
                  this.m_numAddProps += Number(dict[4] == null ? 0 : dict[4]);
                  this.m_numAddSkill += Number(dict[5] == null ? 0 : dict[5]);
               }
               if(!(type == 13 && this.m_iCoverallType != 0))
               {
                  switch(type)
                  {
                     case 0:
                        break;
                     case 1:
                        this.m_iGunType = itemID;
                        this.m_numAttackForce = heroItem.m_iTypeValue;
                        this.m_iGunSequence = heroItem.m_iItemSeq;
                        break;
                     case 2:
                        this.m_iHatType = itemID;
                        break;
                     case 3:
                        this.m_iEyeGlassesType = itemID;
                        break;
                     case 4:
                        this.m_iHairType = itemID;
                        break;
                     case 5:
                        this.m_iFaceDecorationType = itemID;
                        break;
                     case 6:
                        this.m_iBodyType = itemID;
                        break;
                     case 7:
                        this.m_iEyeType = itemID;
                        break;
                     case 8:
                     case 9:
                        break;
                     case 10:
                        this.m_iShieldType = itemID;
                        break;
                     case 11:
                        this.m_iWingType = itemID;
                        break;
                     case 12:
                        break;
                     case 13:
                        if(iSuitShowType == 1)
                        {
                           this.m_iCoverallType = itemID;
                        }
                        break;
                     case 14:
                        this.m_iSuperGunType = itemID;
                  }
                  id = itemID & 0xFFF00000;
                  if(this.dictNotVisible[id] == null || id == 336592896 && heroItem.m_arrExtraAttr != null)
                  {
                     if(iSuitShowType >= 2)
                     {
                        gemoSuit = this.getSuitIDbyGemo(heroItem as a_4461,iSuitShowType,iGender);
                     }
                     if(gemoSuit > 0)
                     {
                        this.m_iCoverallType = gemoSuit;
                     }
                  }
               }
            }
         }
         if(this.m_numDefenseForce >= 30)
         {
            this.m_numAddGold += 20;
         }
         if(this.m_numDefenseForce >= 50)
         {
            this.m_numAddExperience += 10;
         }
         if(this.m_numDefenseForce >= 70)
         {
            this.m_numAddSkill += 10;
         }
         if(this.m_numDefenseForce >= 100)
         {
            this.m_numAddProps += 20;
         }
      }
      
      private function getSuitIDbyGemo(cardAttr:a_4461, type:int, iGender:int) : int
      {
         var gemoLevel:int = 0;
         var gemoID:int = 0;
         var gem:int = 0;
         var m_iCoverallType:int = -1;
         if(cardAttr != null && cardAttr.m_arrExtraAttr != null)
         {
            for(gem = 0; gem < cardAttr.m_arrExtraAttr.length; gem++)
            {
               gemoLevel = int(cardAttr.m_arrExtraAttr[gem].m_iItemAdd);
               gemoID = int(cardAttr.m_arrExtraAttr[gem].m_iSkillID);
               if(type == 2)
               {
                  if(344006928 == gemoID)
                  {
                     m_iCoverallType = iGender == 1 ? 349197584 : 349197600;
                  }
               }
               else if(type == 3)
               {
                  if(343998480 == gemoID)
                  {
                     if(gemoLevel >= 10)
                     {
                        m_iCoverallType = iGender == 1 ? 349186064 : 349186080;
                     }
                     else if(gemoLevel >= 6)
                     {
                        m_iCoverallType = iGender == 1 ? 349185808 : 349185824;
                     }
                     else
                     {
                        m_iCoverallType = iGender == 1 ? 349185552 : 349185568;
                     }
                  }
                  else if(343998481 == gemoID)
                  {
                     if(gemoLevel >= 15)
                     {
                        m_iCoverallType = iGender == 1 ? 349205776 : 349205792;
                     }
                     else if(gemoLevel >= 9 && gemoLevel <= 14)
                     {
                        m_iCoverallType = iGender == 1 ? 349205520 : 349205536;
                     }
                     else
                     {
                        m_iCoverallType = iGender == 1 ? 349205264 : 349205280;
                     }
                  }
                  else if(344203793 == gemoID)
                  {
                     if(gemoLevel >= 15)
                     {
                        m_iCoverallType = iGender == 1 ? 349257744 : 349257760;
                     }
                     else if(gemoLevel >= 9 && gemoLevel <= 14)
                     {
                        m_iCoverallType = iGender == 1 ? 349255952 : 349255968;
                     }
                     else
                     {
                        m_iCoverallType = iGender == 1 ? 349255696 : 349255712;
                     }
                  }
                  else if(344208913 == gemoID)
                  {
                     if(gemoLevel >= 15)
                     {
                        m_iCoverallType = iGender == 1 ? 349270800 : 349270816;
                     }
                     else if(gemoLevel >= 9 && gemoLevel <= 14)
                     {
                        m_iCoverallType = iGender == 1 ? 349270544 : 349270560;
                     }
                     else
                     {
                        m_iCoverallType = iGender == 1 ? 349270288 : 349270304;
                     }
                  }
               }
            }
         }
         return m_iCoverallType;
      }
   }
}

