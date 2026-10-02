package com.aurora.ui.maogoutd.resource.avatar
{
   import com.aurora.ui.maogoutd.resource.shot.AladdinDivineLamp.Evolution.LampGodFiveAppearance;
   import com.aurora.ui.maogoutd.resource.shot.AladdinDivineLamp.Evolution.LampGodFourAppearance;
   import com.aurora.ui.maogoutd.resource.shot.AladdinDivineLamp.Evolution.LampGodSixAppearance;
   import com.aurora.ui.maogoutd.resource.shot.a_4348;
   import flash.display.Sprite;
   
   public class BattleAnim extends Sprite implements IBattleAnim
   {
      
      private var m_shotFactory:Object;
      
      public function BattleAnim()
      {
         super();
         this.m_shotFactory = {};
         this.RegisterShot(EnmBattAnimType.enm_LampGodFourAppearance,LampGodFourAppearance);
         this.RegisterShot(EnmBattAnimType.enm_LampGodFiveAppearance,LampGodFiveAppearance);
         this.RegisterShot(EnmBattAnimType.enm_LampGodSixAppearance,LampGodSixAppearance);
      }
      
      public function RegisterShot(type:int, shotCls:Class) : void
      {
         if(shotCls == null)
         {
            throw new Error("RegisterShot failed: shotCls is null for type " + type);
         }
         this.m_shotFactory[type] = shotCls;
      }
      
      public function a_4389(type:int) : a_4348
      {
         var cls:Class = this.m_shotFactory[type];
         if(cls == null)
         {
            return null;
         }
         if("a_4344" in cls && cls["a_4344"] is Function)
         {
            return cls["a_4344"]();
         }
         return null;
      }
      
      public function release() : void
      {
         var key:String = null;
         for(key in this.m_shotFactory)
         {
            delete this.m_shotFactory[key];
         }
         this.m_shotFactory = null;
      }
   }
}

