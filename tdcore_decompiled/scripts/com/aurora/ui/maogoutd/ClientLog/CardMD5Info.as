package com.aurora.ui.maogoutd.ClientLog
{
   public class CardMD5Info
   {
      
      private var m_iID:int;
      
      private var a_4816:String;
      
      private var m_strID:String;
      
      public function CardMD5Info(iID:int)
      {
         super();
         this.m_iID = iID;
         this.m_strID = iID.toString();
      }
      
      public function CheckMD5() : Boolean
      {
         return true;
      }
      
      public function SimpleCheckID() : Boolean
      {
         return this.m_iID.toString() == this.m_strID;
      }
   }
}

