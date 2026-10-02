package com.aurora.ui.maogoutd.ClientLog
{
   import a_4717.EnmStandUpMode;
   import a_4753.b_150;
   
   public class a_4812
   {
      
      private static var m_pInstance:a_4812 = new a_4812();
      
      private var a_1088:b_150;
      
      private var a_4813:Function;
      
      public function a_4812()
      {
         super();
      }
      
      public static function Get() : a_4812
      {
         return m_pInstance;
      }
      
      public function a_3014(stILobbyLogic:b_150, stGameEnd:Function) : void
      {
         this.a_1088 = stILobbyLogic;
         this.a_4813 = stGameEnd;
      }
      
      public function a_2116() : void
      {
         this.a_1088.a_2116(EnmStandUpMode.enmStandUpMode_Force);
         this.a_4813(null);
      }
   }
}

