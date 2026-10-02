package com.aurora.ui.maogoutd.pet
{
   import flash.utils.Dictionary;
   
   public class PetConfig
   {
      
      private static var m_Instance:PetConfig = new PetConfig();
      
      private var m_dictPetList:Dictionary;
      
      private var m_arrSkillList:Array;
      
      private var m_arrPetExp:Array;
      
      private var m_dictPetExp:Dictionary;
      
      public function PetConfig()
      {
         super();
         if(m_Instance)
         {
            return;
         }
      }
      
      public static function GetInstance() : PetConfig
      {
         return m_Instance;
      }
      
      public function AnalyConfig(xml:XML) : void
      {
         var pet:PetAttr = null;
         var skill:PetSkill = null;
         var i:int = 0;
         var item:XML = null;
         var petExp:Object = null;
         var arrD:Array = null;
         var length:int = 0;
         var skillStr:String = null;
         var skill_arr:Array = null;
         var szid:String = null;
         var grade:String = null;
         var exp:int = 0;
         var lv:int = 0;
         this.m_dictPetList = new Dictionary();
         for each(item in xml.pet_list.pet)
         {
            pet = new PetAttr();
            pet.m_iPetID = int(item.@id);
            pet.m_szName = item.@name;
            pet.m_szGrade = item.@grade;
            pet.m_ifire = int(item.@fire);
            pet.m_szDesc = String(item.@desc);
            length = 13 - int("0x" + pet.m_szGrade) + 1;
            skillStr = item.@skill;
            skill_arr = skillStr.split(",");
            for each(szid in skill_arr)
            {
               skill = new PetSkill();
               skill.m_iSkillID = int(szid);
               pet.m_dictSkill[skill.m_iSkillID] = skill;
            }
            this.m_dictPetList[pet.m_iPetID] = pet;
         }
         this.m_arrSkillList = [];
         for each(item in xml.skill_list.skill)
         {
            skill = new PetSkill();
            skill.m_iSkillID = int(item.@id);
            skill.m_iAttr = int(item.@attr);
            skill.m_iLV = int(item.@lv);
            skill.m_szName = String(item.@name);
            skill.m_szTIPS = String(item.@tips);
            this.m_arrSkillList.push(skill);
         }
         this.m_arrPetExp = [];
         this.m_dictPetExp = new Dictionary();
         arrD = [];
         for each(item in xml.pet_lv.pet)
         {
            grade = String(item.@grade);
            exp = int(item.@exp);
            lv = int(item.@lv);
            if(!this.m_dictPetExp[grade])
            {
               this.m_dictPetExp[grade] = [];
               this.m_dictPetExp[grade][lv] = exp;
            }
            else
            {
               this.m_dictPetExp[grade][lv] = exp;
            }
         }
      }
      
      public function GetSkill(skillID:int, lv:int) : PetSkill
      {
         var skill:PetSkill = null;
         for each(skill in this.m_arrSkillList)
         {
            if(skillID == skill.m_iSkillID && lv == skill.m_iLV)
            {
               return skill;
            }
         }
         return null;
      }
      
      public function GetPetAttr(petID:int) : PetAttr
      {
         var pet:PetAttr = null;
         for each(pet in this.m_dictPetList)
         {
            if(petID == pet.m_iPetID)
            {
               return pet;
            }
         }
         return null;
      }
      
      public function GetPetExpToLv(grade:String, exp:int) : int
      {
         var lv:int = 0;
         var arr:Array = null;
         var i:int = 0;
         if(this.m_dictPetExp[grade])
         {
            arr = this.m_dictPetExp[grade];
            if(exp >= arr[10])
            {
               lv = 10;
            }
            else
            {
               for(i = 1; i <= 10; i++)
               {
                  if(exp >= arr[i] && arr[i] < arr[i + 1])
                  {
                     lv = i;
                  }
               }
            }
         }
         return lv;
      }
      
      public function GetPetLvToExp(grade:String, lv:int) : int
      {
         var exp:int = 0;
         if(lv > this.m_dictPetExp[grade].length)
         {
            exp = 0;
         }
         else
         {
            exp = int(this.m_dictPetExp[grade][lv]);
         }
         return exp;
      }
   }
}

