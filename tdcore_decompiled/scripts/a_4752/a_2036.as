package a_4752
{
   import a_4715.EncrypBooleanEx;
   import flash.utils.ByteArray;
   
   public class a_2036
   {
      
      private static var instance:a_2036;
      
      private static var m_bIsChromeManufacturer:Boolean = false;
      
      public var a_783:String;
      
      public var m_iUin:int;
      
      public var m_bInBattleView:Boolean = false;
      
      private var m_isShowIntruderLife:Boolean = false;
      
      private var m_isGamReady:Boolean = false;
      
      private var m_isShowGrowTimes:Boolean = false;
      
      private var m_ConnectCloseType:int = 0;
      
      private var m_isFirstPlaceAvatarEx:EncrypBooleanEx;
      
      private var _tagCom:TagComponent;
      
      public function a_2036()
      {
         super();
      }
      
      public static function getInstance() : a_2036
      {
         if(instance == null)
         {
            instance = new a_2036();
         }
         return instance;
      }
      
      public function get isShowIntruderLife() : Boolean
      {
         return this.m_isShowIntruderLife;
      }
      
      public function set isShowIntruderLife(value:Boolean) : void
      {
         this.m_isShowIntruderLife = value;
      }
      
      public function get isGamReady() : Boolean
      {
         return this.m_isGamReady;
      }
      
      public function set isGamReady(value:Boolean) : void
      {
         this.m_isGamReady = value;
      }
      
      public function get isShowGrowTimes() : Boolean
      {
         return this.m_isShowGrowTimes;
      }
      
      public function set isShowGrowTimes(value:Boolean) : void
      {
         this.m_isShowGrowTimes = value;
      }
      
      public function get ConnectCloseType() : int
      {
         return this.m_ConnectCloseType;
      }
      
      public function set ConnectCloseType(value:int) : void
      {
         this.m_ConnectCloseType = value;
      }
      
      public function setSignature(signature:ByteArray) : void
      {
         this.a_783 = Base64.encode(signature);
      }
      
      public function get isChromeManufacturer() : Boolean
      {
         return m_bIsChromeManufacturer;
      }
      
      public function set isChromeManufacturer(value:Boolean) : void
      {
         m_bIsChromeManufacturer = value;
      }
      
      public function get m_isFirstPlaceAvatar() : Boolean
      {
         if(!this.m_isFirstPlaceAvatarEx)
         {
            this.m_isFirstPlaceAvatarEx = new EncrypBooleanEx();
         }
         return this.m_isFirstPlaceAvatarEx.Value;
      }
      
      public function set m_isFirstPlaceAvatar(value:Boolean) : void
      {
         if(!this.m_isFirstPlaceAvatarEx)
         {
            this.m_isFirstPlaceAvatarEx = new EncrypBooleanEx();
         }
         this.m_isFirstPlaceAvatarEx.Value = value;
      }
      
      public function get tagCom() : TagComponent
      {
         if(this._tagCom == null)
         {
            this._tagCom = new TagComponent();
         }
         return this._tagCom;
      }
   }
}

