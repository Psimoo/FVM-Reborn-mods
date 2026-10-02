package com.aurora.ui.maogoutd.game.Util
{
   import com.aurora.ui.maogoutd.resource.Intruder.a_4255;
   import com.aurora.ui.maogoutd.resource.avatar.a_3919;
   import com.aurora.ui.maogoutd.resource.defender.a_4012;
   import com.aurora.ui.maogoutd.resource.energy.a_4162;
   import com.aurora.ui.maogoutd.resource.shot.a_4388;
   
   public class BattleRegisterUtil
   {
      
      public function BattleRegisterUtil()
      {
         super();
      }
      
      public static function RegisterCreator(iCardID:int, createFunc:Function) : void
      {
         if(iCardID > 268435456 && iCardID < 536936448)
         {
            a_4012.getInstance().RegisterCreator(iCardID,createFunc);
         }
         else if(iCardID > 65536 && iCardID < 131072)
         {
            a_4388.getInstance().RegisterCreator(iCardID,createFunc);
         }
         else if(iCardID > 131072 && iCardID < 196608)
         {
            a_4162.getInstance().RegisterCreator(iCardID,createFunc);
         }
         else if(iCardID > 8388608 && iCardID < 8454144)
         {
            a_4255.getInstance().RegisterCreator(iCardID,createFunc);
         }
         else if(iCardID > 15728640 && iCardID < 15794176)
         {
            a_3919.getInstance().RegisterCreator(iCardID,createFunc);
            a_4012.getInstance().RegisterCreator(iCardID,createFunc);
         }
      }
   }
}

