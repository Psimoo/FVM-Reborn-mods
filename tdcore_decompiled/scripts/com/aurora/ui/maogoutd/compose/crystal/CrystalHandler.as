package com.aurora.ui.maogoutd.compose.crystal
{
   import a_4729.EventType;
   import a_4729.a_1789;
   import a_4754.a_2161;
   import a_4789.a_4657;
   import com.aurora.event.charm.CharmEvent;
   import com.aurora.protocol.hallserver.crystal.CCSResponseCrystoneCompose;
   import com.aurora.protocol.hallserver.crystal.CCSResponseCrystoneDecompose;
   import com.aurora.protocol.hallserver.crystal.CCSResponseCrystoneEquip;
   import com.aurora.protocol.hallserver.crystal.CCSResponseCrystoneUpgrade;
   import com.aurora.ui.maogoutd.role.a_4463;
   
   public class CrystalHandler
   {
      
      private static var m_pInstance:CrystalHandler;
      
      public static var m_iShowType:int;
      
      public static const TYPE_DEFAULT:int = 0;
      
      public static const TYPE_CRYSTAL:int = 1;
      
      private var m_iSelfUin:int = -1;
      
      private var m_pCallBackFunc:Function;
      
      public var m_stCCSResponseCrystoneCompose:CCSResponseCrystoneCompose;
      
      public var m_stCCSResponseCrystoneDecompose:CCSResponseCrystoneDecompose;
      
      public var m_stCCSResponseCrystoneUpgrade:CCSResponseCrystoneUpgrade;
      
      public var m_stCCSResponseCrystoneEquip:CCSResponseCrystoneEquip;
      
      public function CrystalHandler()
      {
         super();
      }
      
      public static function Get() : CrystalHandler
      {
         if(!m_pInstance)
         {
            m_pInstance = new CrystalHandler();
            m_pInstance.a_3014(null);
         }
         return m_pInstance;
      }
      
      public function a_3014(pFunc:Function) : void
      {
         if(null != pFunc && null == this.m_pCallBackFunc)
         {
            this.m_pCallBackFunc = pFunc;
            a_4657.getInstance().addListener(this);
         }
         var stRole:a_4463 = a_2161.e.GetCurrentRole() as a_4463;
         this.m_iSelfUin = stRole.m_iRoleUin;
         a_1789.getInstance().addEventListener(EventType.CHARM_CRYSTAL_EQUIP,this.OnCCSResponseCrystoneEquip);
      }
      
      public function OnCCSRequestCrystoneCompose(iRecipeID:int) : void
      {
         a_2161.e.notify("OnCCSRequestCrystoneCompose",this.m_iSelfUin,iRecipeID);
      }
      
      public function OnCCSRequestCrystoneDecompose(iCrystoneID:int, iSeq:int) : void
      {
         a_2161.e.notify("OnCCSRequestCrystoneDecompose",this.m_iSelfUin,iCrystoneID,iSeq);
      }
      
      public function OnCCSRequestCrystoneUpgrade(iCrystoneID:int, iSeq:int, iSafe:int) : void
      {
         a_2161.e.notify("OnCCSRequestCrystoneUpgrade",this.m_iSelfUin,iCrystoneID,iSeq,iSafe);
      }
      
      public function OnCCSRequestCrystoneEquip(iCrystoneID:int, iType:int) : void
      {
         a_2161.e.notify("OnCCSRequestCrystoneEquip",this.m_iSelfUin,iCrystoneID,iType);
      }
      
      private function OnCCSResponseCrystoneEquip(e:CharmEvent) : void
      {
         var response:CCSResponseCrystoneEquip = e.Data as CCSResponseCrystoneEquip;
         if(0 != response.m_nResultID)
         {
            trace("结晶信息拉取失败 CCSResponseCrystoneEquip.m_nResultID:" + response.m_nResultID);
            return;
         }
         this.m_stCCSResponseCrystoneEquip = response;
         if(null != this.m_pCallBackFunc)
         {
            this.m_pCallBackFunc();
         }
      }
   }
}

