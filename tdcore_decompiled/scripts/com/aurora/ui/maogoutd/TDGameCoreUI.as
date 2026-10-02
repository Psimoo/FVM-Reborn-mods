package com.aurora.ui.maogoutd
{
   import a_4715.EncrypString;
   import a_4728.a_1778;
   import a_4753.a_2178;
   import a_4753.a_2179;
   import a_4759.b_151;
   import a_4759.b_152;
   import a_4759.b_153;
   import flash.display.Loader;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.net.LocalConnection;
   
   public class TDGameCoreUI extends Sprite implements b_152
   {
      
      public static var a_921:TDGameCoreUI;
      
      public static var a_1666:b_148;
      
      public static var a_757:b_147;
      
      public static var a_1668:Loader;
      
      public static var ms_arrCardAndEnergyInfoArray:Array;
      
      public static var a_1667:Loader = new Loader();
      
      private static var ms_strKeyEncrypt:EncrypString = new EncrypString();
      
      private static var a_1669:Array = [];
      
      public static var a_1670:Array = [];
      
      public static var a_1671:Array = [];
      
      public var m_stTDGameReadyUILoader:Loader;
      
      public function TDGameCoreUI()
      {
         super();
         this.a_1797();
         a_2179.getInstance();
         a_921 = this;
         addEventListener(Event.REMOVED_FROM_STAGE,this.a_4535);
         addEventListener("AurPostIsEnterExtraStageEvent",this.a_4543);
         addEventListener("AurPostProduceBossIntruderTeamEvent",this.a_4544);
         addEventListener("AurRequestNewEnemyWaveEvent",this.OnRequestNewEnemyWave);
         addEventListener("AruPostRequestUseWeaponSkill",this.OnRequestUseWeaponSkill);
         addEventListener("AurSetCardAndEnergyForAntiPluginEvent",this.OnSetCardAndEnergyForAntiPluginEvent);
         addEventListener("AurPostPlayerEnergyValueEvent",this.OnPostPlayerEnergyValueEvent);
      }
      
      public static function get TDGameItemsResourceLoaderArray() : Array
      {
         return a_1669;
      }
      
      public static function GetItemsResourceByKey(strKey:String) : Loader
      {
         ms_strKeyEncrypt.Value = strKey;
         return a_1669[ms_strKeyEncrypt.EncrypValue];
      }
      
      public static function SetItemsResourceByKey(strKey:String, stValue:Loader) : void
      {
         ms_strKeyEncrypt.Value = strKey;
         a_1669[ms_strKeyEncrypt.EncrypValue] = stValue;
      }
      
      public function setLobby(lobby:b_153) : void
      {
         a_2179.getInstance().a_1797(lobby);
      }
      
      public function getGame() : b_151
      {
         return a_2178.getInstance();
      }
      
      public function a_1797() : Boolean
      {
         return true;
      }
      
      public function a_4540() : Boolean
      {
         addChild(a_1667);
         return true;
      }
      
      public function a_4541() : Boolean
      {
         if(a_1668)
         {
            a_1668.visible = true;
            addChild(a_1668);
         }
         if(Boolean(a_1667) && contains(a_1667))
         {
            removeChild(a_1667);
         }
         return true;
      }
      
      public function a_4542() : Boolean
      {
         var stLoader:Loader = null;
         a_757 = null;
         for each(stLoader in a_1669)
         {
            stLoader.unloadAndStop(true);
            stLoader.unload();
         }
         a_1669 = [];
         if(a_1668)
         {
            if(contains(a_1668))
            {
               removeChild(a_1668);
            }
            a_1668.unloadAndStop(true);
            a_1668.unload();
            a_1668 = null;
         }
         for each(stLoader in a_1670)
         {
            stLoader.unloadAndStop(true);
            stLoader.unload();
         }
         a_1670 = [];
         try
         {
            new LocalConnection().connect("gc");
            new LocalConnection().connect("gc");
         }
         catch(err:Error)
         {
         }
         return true;
      }
      
      private function a_4543(stAurDataEvent:a_1778) : void
      {
         var byIsEnter:int = stAurDataEvent.dataObject as int;
         a_2179.getInstance().a_2073(byIsEnter);
      }
      
      private function a_4544(stAurDataEvent:a_1778) : void
      {
         var byStartYGridNo:int = stAurDataEvent.dataObject as int;
         a_2179.getInstance().a_2074(byStartYGridNo);
      }
      
      private function OnRequestNewEnemyWave(stAurDataEvent:a_1778) : void
      {
         a_2179.getInstance().a_2077();
      }
      
      private function OnRequestUseWeaponSkill(stAurDataEvent:a_1778) : void
      {
         var uiSkillID:uint = uint(stAurDataEvent.dataObject[0]);
         var iUseTimeNum:int = int(stAurDataEvent.dataObject[1]);
         a_2179.getInstance().PostRequestUseWeaponSkill(uiSkillID,iUseTimeNum);
      }
      
      private function OnSetCardAndEnergyForAntiPluginEvent(stAurDataEvent:a_1778) : void
      {
         ms_arrCardAndEnergyInfoArray = stAurDataEvent.dataObject as Array;
      }
      
      private function a_4535(stEvent:Event) : void
      {
         a_2179.getInstance().m_stMyPlayerDetail = null;
         a_2179.getInstance().a_1675 = [];
      }
      
      private function OnPostPlayerEnergyValueEvent(a_4730:a_1778) : void
      {
         var _loc_2:* = a_4730.dataObject as Array;
         var _loc_3:* = _loc_2[0];
         var _loc_4:* = _loc_2[1];
         a_2179.getInstance().PostPlayerEnergyValue(_loc_3,_loc_4);
      }
   }
}

