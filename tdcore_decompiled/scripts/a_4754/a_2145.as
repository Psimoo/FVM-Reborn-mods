package a_4754
{
   import a_4739.a_1828;
   
   public class a_2145 extends a_1828
   {
      
      public static var e:a_2145 = new a_2145();
      
      public function a_2145()
      {
         super();
      }
      
      public function composeResponse(response:Object) : void
      {
         notify("composeResponse",response);
      }
      
      public function upgradeResponse(response:Object) : void
      {
         notify("upgradeResponse",response);
      }
      
      public function requestComposeItem(iComposeID:int, arrComposeMaterial:Array, arrAssMaterial:Array) : void
      {
         notify("requestComposeItem",iComposeID,arrComposeMaterial,arrAssMaterial);
      }
      
      public function requestUpgradeItem(stSrc:Object, arrSub:Array, arrAssMaterial:Array, insuranse:int) : void
      {
         notify("requestUpgradeItem",stSrc,arrSub,arrAssMaterial,insuranse);
      }
      
      public function onBuyCardPayTip(CardID:int) : void
      {
         notify("onBuyCardPayTip",CardID);
      }
      
      public function onShowConsortiaSign(b:Boolean = true, lv:int = 1) : void
      {
         notify("onShowConsortiaSign",b,lv);
      }
      
      public function setConsortiaComposeLevel(currentLv:int, availableLv:int) : void
      {
         notify("setConsortiaComposeLevel",currentLv,availableLv);
      }
   }
}

