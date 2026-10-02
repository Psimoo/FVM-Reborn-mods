package a_4752
{
   public class GlobalVariables
   {
      
      private static var instance:GlobalVariables;
      
      public var m_iMonthCardVipService:int;
      
      public var m_iMoonMapID:int;
      
      public var m_iGodownMapID:int;
      
      public var m_iDieMapID:int;
      
      public var m_iLastDefender:int;
      
      public var m_iLastDefenderPosX:int;
      
      public var m_iLastDefenderPosY:int;
      
      public var m_iSecpwd:Boolean;
      
      public var m_iHasSecpwd:Boolean;
      
      public var m_iEatDieArr:Array;
      
      public function GlobalVariables()
      {
         super();
         this.m_iMonthCardVipService = 0;
         this.m_iMoonMapID = 0;
         this.m_iGodownMapID = 0;
         this.m_iDieMapID = 0;
         this.m_iSecpwd = false;
         this.m_iHasSecpwd = false;
         this.m_iEatDieArr = new Array();
      }
      
      public static function getInstance() : GlobalVariables
      {
         if(instance == null)
         {
            instance = new GlobalVariables();
         }
         return instance;
      }
   }
}

