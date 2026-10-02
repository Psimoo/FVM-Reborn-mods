package com.aurora.ui.maogoutd.pet
{
   import a_4728.a_1778;
   import a_4729.EventType;
   import a_4729.a_1789;
   import a_4754.a_2161;
   import com.aurora.ui.maogoutd.component.a_3228;
   import com.aurora.ui.maogoutd.role.a_4463;
   import flash.utils.Dictionary;
   
   public class PetDataHandler
   {
      
      private static var m_Instance:PetDataHandler = new PetDataHandler();
      
      private static const m_arrMoney:Array = [0,2000,4000,8000,16000,32000,64000];
      
      private static const m_arrBuyCount:Array = [100,500,1000];
      
      private var m_iSlotCount:int = 1;
      
      private var m_arrCardList:Array;
      
      public var m_iUin:int;
      
      public var m_iFreeChallengeCount:int;
      
      public var m_iPurchaseCount:int;
      
      public var m_iChallengeCountAlready:int;
      
      public var m_iCurrentTall:int;
      
      public function PetDataHandler()
      {
         super();
         if(m_Instance)
         {
            return;
         }
         this.m_iFreeChallengeCount = 1;
         this.m_iCurrentTall = 0;
         var role:a_4463 = a_2161.e.GetCurrentRole() as a_4463;
         this.m_iUin = role.m_iRoleUin;
         a_2161.e.GetPetSoltCount(this.m_iUin);
         a_1789.getInstance().addEventListener(EventType.GET_PET_ACCOUNT,this.OnPetAccount);
         a_1789.getInstance().addEventListener(EventType.BUY_CHALLENGE_COUNT,this.OnBuyChallengeCount);
         a_1789.getInstance().addEventListener(EventType.OPEN_SOLT,this.OnOpenSolt);
         a_1789.getInstance().addEventListener(EventType.NOTIFY_PET_INFO,this.OnNotifyPetAccount);
      }
      
      public static function GetInstance() : PetDataHandler
      {
         return m_Instance;
      }
      
      public function get iSlotCount() : int
      {
         return this.m_iSlotCount;
      }
      
      public function get arrPetGenInfoArray() : Array
      {
         var OneCard:a_3228 = null;
         var pet:PetAttr = null;
         var iFire:int = 0;
         var petSkill:PetSkill = null;
         var lv:int = 0;
         var i:int = 0;
         var petlist:Array = this.GetPetList();
         var tmp:Array = [];
         var arrPet:Array = [];
         var arrSkill:Array = [];
         var m_dictPetSkills:Dictionary = new Dictionary();
         for each(pet in petlist)
         {
            tmp = [];
            tmp.push(pet.m_iPetID,this.GradeToInt(pet.m_szGrade),pet.m_iLv + 1);
            arrPet.push(tmp);
            iFire += pet.m_ifire * pet.m_iLv;
            for each(petSkill in pet.m_dictSkill)
            {
               if(!m_dictPetSkills[petSkill.m_iSkillID])
               {
                  m_dictPetSkills[petSkill.m_iSkillID] = 1;
               }
               else
               {
                  m_dictPetSkills[petSkill.m_iSkillID] += 1;
               }
            }
         }
         i = 0;
         for(i = 1; i < 5; i++)
         {
            lv = int(m_dictPetSkills[i]);
            if(lv > 0)
            {
               tmp = [];
               tmp.push(i,lv);
               arrSkill.push(tmp);
            }
         }
         tmp = [];
         tmp.push(arrPet,arrSkill,[iFire]);
         return tmp;
      }
      
      public function GetMoney() : int
      {
         var iSolt:int = this.m_iSlotCount;
         if(iSolt < 1 || iSolt > 7)
         {
            return -1;
         }
         return m_arrMoney[iSolt];
      }
      
      public function GetPetList() : Array
      {
         var card:a_3228 = null;
         var pet:PetAttr = null;
         var role:a_4463 = a_2161.e.GetCurrentRole() as a_4463;
         this.m_arrCardList = this.showPropsPackageCards(role.a_951);
         var arr:Array = [];
         for each(card in this.m_arrCardList)
         {
            pet = null;
            pet = this.getPetAttr(card.CardID,card.CardSeq);
            arr.push(pet);
         }
         return arr;
      }
      
      private function OnPetAccount(a_4730:a_1778) : void
      {
         var response:Object = a_4730.dataObject;
         if(response.m_nResultID == 0)
         {
            this.m_iSlotCount = response.m_iPetSlotCount;
            this.m_iFreeChallengeCount = response.m_iFreeChallengeCount;
            this.m_iPurchaseCount = response.m_iPurchaseCount;
            this.m_iChallengeCountAlready = response.m_iChallengeCountAlready;
            this.m_iCurrentTall = response.m_iCurrentTall;
         }
      }
      
      private function showPropsPackageCards(arrPropsPackageCards:Array) : Array
      {
         var obj:Object = null;
         var oneCard:a_3228 = null;
         var arrList:Array = [];
         arrPropsPackageCards.sortOn(["CardID"],Array.NUMERIC);
         var i:int = 0;
         if(arrPropsPackageCards != null && arrPropsPackageCards.length > 0)
         {
            for each(oneCard in arrPropsPackageCards)
            {
               if(oneCard.CardID != 0 && (oneCard.CardID & 0xFFF00000) == 351272960)
               {
                  for each(obj in oneCard.m_arrExtraAttr)
                  {
                     if(obj.m_cItemType == 14)
                     {
                        if(obj.m_iItemAdd == 1)
                        {
                           if(++i > 7)
                           {
                              break;
                           }
                           trace(oneCard.CardID);
                           arrList.push(oneCard);
                        }
                     }
                  }
               }
            }
         }
         return arrList;
      }
      
      public function getPetAttr(id:int, seq:int) : PetAttr
      {
         var pet:PetAttr = null;
         var tmpPet:PetAttr = null;
         var oneCard:a_3228 = null;
         var attr:Object = null;
         var exp:int = 0;
         var grade:String = null;
         var role:a_4463 = a_2161.e.GetCurrentRole() as a_4463;
         this.m_arrCardList = this.showPropsPackageCards(role.a_951);
         for each(oneCard in this.m_arrCardList)
         {
            if(oneCard.CardID == id && oneCard.CardSeq == seq)
            {
               tmpPet = new PetAttr();
               pet = PetConfig.GetInstance().GetPetAttr(oneCard.CardID);
               for each(attr in oneCard.m_arrExtraAttr)
               {
                  if(attr.m_cItemType == 13)
                  {
                     exp = int(attr.m_iItemAdd);
                  }
                  if(attr.m_cItemType == 12)
                  {
                     if(attr.m_iItemAdd == 1)
                     {
                        grade = "D";
                     }
                     else if(attr.m_iItemAdd == 2)
                     {
                        grade = "C";
                     }
                     else if(attr.m_iItemAdd == 3)
                     {
                        grade = "B";
                     }
                     else if(attr.m_iItemAdd == 4)
                     {
                        grade = "A";
                     }
                  }
               }
               pet.m_iExp = exp;
               pet.m_iLv = PetConfig.GetInstance().GetPetExpToLv(grade,exp);
               tmpPet.m_dictSkill = pet.m_dictSkill;
               tmpPet.m_iExp = pet.m_iExp;
               tmpPet.m_ifire = pet.m_ifire;
               tmpPet.m_iLv = pet.m_iLv;
               tmpPet.m_iPetID = pet.m_iPetID;
               tmpPet.m_szDesc = pet.m_szDesc;
               tmpPet.m_szGrade = pet.m_szGrade;
               tmpPet.m_szName = pet.m_szName;
               return tmpPet;
            }
         }
         return null;
      }
      
      public function GetBuyMoney() : int
      {
         return m_arrBuyCount[this.m_iPurchaseCount];
      }
      
      public function GetRemainCount() : int
      {
         var count:int = 0;
         return int(this.m_iPurchaseCount + this.m_iFreeChallengeCount - this.m_iChallengeCountAlready);
      }
      
      public function OnNotifyPetAccount(a_4730:a_1778) : void
      {
         var response:Object = a_4730.dataObject;
         this.m_iSlotCount = response.m_iPetSlotCount;
         this.m_iFreeChallengeCount = response.m_iFreeChallengeCount;
         this.m_iPurchaseCount = response.m_iPurchaseCount;
         this.m_iChallengeCountAlready = response.m_iChallengeCountAlready;
         this.m_iCurrentTall = response.m_iCurrentTall;
         var dataEvent:a_1778 = new a_1778(EventType.PET_UPDATA);
         dataEvent.dataObject = null;
         a_1789.getInstance().dispatchEvent(dataEvent);
      }
      
      public function OnBuyChallengeCount(a_4730:a_1778) : void
      {
         var response:Object = a_4730.dataObject;
         this.m_iPurchaseCount = response.m_iPurchaseCount;
         var dataEvent:a_1778 = new a_1778(EventType.PET_UPDATA);
         dataEvent.dataObject = null;
         a_1789.getInstance().dispatchEvent(dataEvent);
      }
      
      private function OnOpenSolt(a_4730:a_1778) : void
      {
         var response:Object = a_4730.dataObject;
         response.m_nResultID == 0;
         this.m_iSlotCount = response.m_iPetSlotCount;
         var dataEvent:a_1778 = new a_1778(EventType.PET_UPDATA);
         dataEvent.dataObject = null;
         a_1789.getInstance().dispatchEvent(dataEvent);
      }
      
      private function GradeToInt(grade:String) : int
      {
         var igrade:int = 1;
         if(grade == "D")
         {
            igrade = 1;
         }
         else if(grade == "C")
         {
            igrade = 2;
         }
         else if(grade == "B")
         {
            igrade = 3;
         }
         else if(grade == "A")
         {
            igrade = 4;
         }
         else if(grade == "S")
         {
            igrade = 5;
         }
         else if(grade == "SS")
         {
            igrade = 6;
         }
         else if(grade == "SSS")
         {
            igrade = 7;
         }
         return igrade;
      }
   }
}

