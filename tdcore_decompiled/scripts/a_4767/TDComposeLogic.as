package a_4767
{
   import a_4728.a_1778;
   import a_4729.EventType;
   import a_4729.a_1779;
   import a_4729.a_1789;
   import a_4763.a_2439;
   import a_4765.ComposeServerDataProtocol;
   import a_4789.IModulesBridge;
   import a_4789.a_4657;
   import flash.events.EventDispatcher;
   
   public class TDComposeLogic extends EventDispatcher
   {
      
      private static var sign:Boolean;
      
      private static var _instance:TDComposeLogic;
      
      private var mBridge:IModulesBridge;
      
      private var serverDataProtocol:ComposeServerDataProtocol;
      
      private var a_841:a_1779;
      
      public function TDComposeLogic()
      {
         super(null);
         if(!sign)
         {
            throw new Error("请通过getInstance()方法获取引用！");
         }
      }
      
      public static function getInstance() : TDComposeLogic
      {
         if(null == _instance)
         {
            sign = true;
            _instance = new TDComposeLogic();
            sign = false;
         }
         return _instance;
      }
      
      public function a_1797(serverDataProtocol:ComposeServerDataProtocol) : void
      {
         this.serverDataProtocol = serverDataProtocol;
         if(!this.mBridge)
         {
            this.mBridge = a_4657.getInstance();
            this.mBridge.addListener(this);
         }
         if(!this.a_841)
         {
            this.initEvents();
         }
      }
      
      public function a_2391(iComposeID:int, arrComposeMaterial:Array, arrAssMaterial:Array, iDisableConsortiaExtra:int = 1) : Boolean
      {
         var roleUin:int = a_2439.getInstance().m_currentRoleUin;
         return this.serverDataProtocol.a_2391(roleUin,iComposeID,arrComposeMaterial,arrAssMaterial,iDisableConsortiaExtra);
      }
      
      public function a_2393(stSrc:Object, arrSub:Array, arrAssMaterial:Array, iDisableConsortiaExtra:int = 1) : Boolean
      {
         var roleUin:int = a_2439.getInstance().m_currentRoleUin;
         return this.serverDataProtocol.a_2393(roleUin,stSrc,arrSub,arrAssMaterial,iDisableConsortiaExtra);
      }
      
      public function RequestSlottingItem(obj:Object) : Boolean
      {
         var roleUin:int = a_2439.getInstance().m_currentRoleUin;
         return this.serverDataProtocol.RequestSlottingItem(roleUin,obj);
      }
      
      public function RequestItemGemUnload(obj:Object) : Boolean
      {
         var roleUin:int = a_2439.getInstance().m_currentRoleUin;
         return this.serverDataProtocol.RequestItemGemUnload(roleUin,obj);
      }
      
      public function RequestItemGemInlay(obj:Object) : Boolean
      {
         var roleUin:int = a_2439.getInstance().m_currentRoleUin;
         return this.serverDataProtocol.RequestItemGemInlay(roleUin,obj);
      }
      
      public function RequestGenDecompose(obj:Object) : Boolean
      {
         var roleUin:int = a_2439.getInstance().m_currentRoleUin;
         return this.serverDataProtocol.RequestGenDecompose(roleUin,obj);
      }
      
      public function RequestTransferItem(obj:Object) : Boolean
      {
         var roleUin:int = a_2439.getInstance().m_currentRoleUin;
         return this.serverDataProtocol.RequestTransferItem(roleUin,obj.card,obj.arrMaterial,obj.m_cInsurance);
      }
      
      private function initEvents() : void
      {
         this.a_841 = a_1789.getInstance();
         this.a_841.addEventListener(EventType.a_609,this.composeResponseHandler);
         this.a_841.addEventListener(EventType.a_610,this.upgradeResponseHandler);
         this.a_841.addEventListener(EventType.ITEM_GEM_UNLOAD,this.genUnloadResponseHandler);
         this.a_841.addEventListener(EventType.SLOT_ITEM,this.slotItemResponseHandler);
         this.a_841.addEventListener(EventType.ITEM_GEM_IN_LAY,this.genInlayResponseHandler);
         this.a_841.addEventListener(EventType.ITEM_GEM_DECOMPOSE,this.genDecomposeResponseHandler);
         this.a_841.addEventListener(EventType.CARD_TRANSLATE_RESPONSE,this.transferResponseHandler);
         this.a_841.addEventListener(EventType.CARD_FUSION_BACK,this.fusionCardResponseHandler);
         this.a_841.addEventListener(EventType.CARD_UPGRADE_BACK,this.fusionCardUpGradeResponseHandler);
      }
      
      private function composeResponseHandler(a_4730:a_1778) : void
      {
         this.mBridge.execute("a_2581",this,a_4730.dataObject);
      }
      
      private function upgradeResponseHandler(a_4730:a_1778) : void
      {
         this.mBridge.execute("a_2582",this,a_4730.dataObject);
      }
      
      private function genUnloadResponseHandler(a_4730:a_1778) : void
      {
         this.mBridge.execute("OnGenUnloadResponse",this,a_4730.dataObject);
      }
      
      private function slotItemResponseHandler(a_4730:a_1778) : void
      {
         this.mBridge.execute("OnSlotItemResponse",this,a_4730.dataObject);
      }
      
      private function genInlayResponseHandler(a_4730:a_1778) : void
      {
         this.mBridge.execute("OnGenInlayResponse",this,a_4730.dataObject);
      }
      
      private function genDecomposeResponseHandler(a_4730:a_1778) : void
      {
         this.mBridge.execute("OnGenDecomposeResponse",this,a_4730.dataObject);
      }
      
      private function transferResponseHandler(a_4730:a_1778) : void
      {
         this.mBridge.execute("a_2378",this,a_4730.dataObject);
      }
      
      private function fusionCardResponseHandler(a_4730:a_1778) : void
      {
         this.mBridge.execute("OnFusionCardResponse",this,a_4730.dataObject);
      }
      
      private function fusionCardUpGradeResponseHandler(a_4730:a_1778) : void
      {
         this.mBridge.execute("OnFusionCardUpGradeResponse",this,a_4730.dataObject);
      }
   }
}

