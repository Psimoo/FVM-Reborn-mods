package a_4753
{
   import a_4759.b_151;
   import com.aurora.protocol.game.CPlayerDetail;
   import com.aurora.protocol.game.maogoutd.a_2700;
   import com.aurora.ui.maogoutd.TDGameCoreUI;
   import flash.utils.ByteArray;
   
   public class a_2178 implements b_151
   {
      
      private static var a_758:a_2178;
      
      private var a_759:a_2053;
      
      public function a_2178()
      {
         super();
         this.a_1797();
      }
      
      public static function getInstance() : a_2178
      {
         if(null == a_758)
         {
            a_758 = new a_2178();
         }
         return a_758;
      }
      
      private function a_1797() : Boolean
      {
         trace("TDGameImpl ok");
         this.a_759 = a_2053.getInstance();
         return true;
      }
      
      public function a_1833(eEnterTableMode:int) : void
      {
      }
      
      public function a_1834(pPlayerDetail:CPlayerDetail) : void
      {
         a_2179.getInstance().m_stMyPlayerDetail = pPlayerDetail;
         a_2179.getInstance().a_1675 = [];
         a_2179.getInstance().a_1675[pPlayerDetail.m_bySeat] = pPlayerDetail;
         if(null != TDGameCoreUI.a_1666)
         {
            TDGameCoreUI.a_1666.a_3721(pPlayerDetail);
            TDGameCoreUI.a_1666.a_3723(a_2179.getInstance().a_1675);
         }
      }
      
      public function a_1835(arrPlayerDetails:Array) : void
      {
         var stPlayeDetail:CPlayerDetail = null;
         trace("SetSittedPlayers=" + arrPlayerDetails.toString());
         for each(stPlayeDetail in arrPlayerDetails)
         {
            a_2179.getInstance().a_1675[stPlayeDetail.m_bySeat] = stPlayeDetail;
         }
         if(null != TDGameCoreUI.a_1666)
         {
         }
      }
      
      public function a_1836(pPlayerDetail:CPlayerDetail) : void
      {
         a_2179.getInstance().a_1675[pPlayerDetail.m_bySeat] = pPlayerDetail;
         if(null != TDGameCoreUI.a_1666)
         {
            TDGameCoreUI.a_1666.a_3724(pPlayerDetail);
         }
      }
      
      public function a_1838(seatID:int) : void
      {
      }
      
      public function a_1839(seatID:int) : void
      {
         a_2179.getInstance().a_1675.splice(seatID,1);
         var stPlayerAvatarBreakDownNotify:a_2700 = new a_2700();
         stPlayerAvatarBreakDownNotify.m_bySeatID = seatID;
         a_2179.getInstance().a_2097(stPlayerAvatarBreakDownNotify);
         if(null != TDGameCoreUI.a_1666)
         {
            TDGameCoreUI.a_1666.a_3725(seatID);
         }
      }
      
      public function a_1840(pPlayerDetail:CPlayerDetail) : void
      {
      }
      
      public function a_1841(uin:int) : void
      {
      }
      
      public function a_1837(list:Array) : void
      {
      }
      
      public function a_1842(pbyData:ByteArray) : void
      {
         this.a_759.a_2055(pbyData);
      }
      
      public function a_1843() : void
      {
      }
      
      public function a_1844(kicker:int, nReason:int, lpszReason:String) : void
      {
      }
      
      public function a_1845(pPlayerDetail:CPlayerDetail) : void
      {
      }
      
      public function a_1794() : void
      {
      }
      
      public function a_1846() : void
      {
      }
      
      public function a_1847() : void
      {
      }
   }
}

