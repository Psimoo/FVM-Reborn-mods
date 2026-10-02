package com.aurora.ui.maogoutd.PayAward
{
   public class PayAwardStruct
   {
      
      public var m_iLevel:int;
      
      public var m_iAmount:int;
      
      public var m_szDesc:String;
      
      public var m_szPic:String;
      
      public var m_vAward:Vector.<PayAwardElementStruct>;
      
      public function PayAwardStruct()
      {
         super();
         this.m_vAward = new Vector.<PayAwardElementStruct>();
      }
   }
}

