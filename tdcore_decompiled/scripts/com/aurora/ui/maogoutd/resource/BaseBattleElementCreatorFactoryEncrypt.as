package com.aurora.ui.maogoutd.resource
{
   public class BaseBattleElementCreatorFactoryEncrypt
   {
      
      protected var m_iXorRandNum:uint;
      
      protected var m_arrCreatorVector:Array;
      
      public function BaseBattleElementCreatorFactoryEncrypt()
      {
         super();
         this.a_3923();
      }
      
      protected function GetXorRand(iDefenseTypeId:uint) : uint
      {
         return this.m_iXorRandNum ^ iDefenseTypeId;
      }
      
      public function GetObject(iTypeId:uint) : a_3909
      {
         iTypeId = this.GetXorRand(iTypeId);
         if(null != this.m_arrCreatorVector[iTypeId])
         {
            return this.m_arrCreatorVector[iTypeId]();
         }
         return null;
      }
      
      public function RegisterCreator(iTypeId:uint, funcCreator:Function) : Boolean
      {
         iTypeId = this.GetXorRand(iTypeId);
         if(null == funcCreator || null != this.m_arrCreatorVector[iTypeId])
         {
            trace("RegisterCreator failed::" + funcCreator);
            return false;
         }
         this.m_arrCreatorVector[iTypeId] = funcCreator;
         return true;
      }
      
      public function a_3923() : Boolean
      {
         this.m_arrCreatorVector = [];
         this.m_iXorRandNum = int(Math.ceil(11579568 + Math.random() * 1061109567));
         return true;
      }
      
      public function a_3922() : Array
      {
         var iTypeID:uint = 0;
         var strTypeID:String = null;
         var arrRegistedTypeID:Array = [];
         for(strTypeID in this.m_arrCreatorVector)
         {
            iTypeID = uint(parseInt(strTypeID));
            arrRegistedTypeID.push(this.GetXorRand(iTypeID));
         }
         return arrRegistedTypeID;
      }
   }
}

