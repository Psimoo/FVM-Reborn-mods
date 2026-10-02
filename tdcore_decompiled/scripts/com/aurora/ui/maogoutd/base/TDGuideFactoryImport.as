package com.aurora.ui.maogoutd.base
{
   import a_4718.b_179;
   import com.aurora.ui.maogoutd.game.Util.BattleRegisterUtil;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4203;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4223;
   import com.aurora.ui.maogoutd.resource.avatar.a_3919;
   import com.aurora.ui.maogoutd.resource.avatar.a_3927;
   import com.aurora.ui.maogoutd.resource.defender.a_3978;
   import com.aurora.ui.maogoutd.resource.defender.a_3984;
   import com.aurora.ui.maogoutd.resource.defender.a_4012;
   import com.aurora.ui.maogoutd.resource.defender.a_4030;
   import com.aurora.ui.maogoutd.resource.defender.a_4103;
   import com.aurora.ui.maogoutd.resource.defender.flourPackage.a_4033;
   import com.aurora.ui.maogoutd.resource.energy.a_4166;
   import com.aurora.ui.maogoutd.resource.shot.a_4345;
   import com.aurora.ui.maogoutd.resource.tools.a_4421;
   
   public class TDGuideFactoryImport
   {
      
      private static var bInstance:Boolean = false;
      
      public function TDGuideFactoryImport()
      {
         super();
      }
      
      public static function ImportAll() : void
      {
         if(bInstance == false)
         {
            bInstance = true;
            _ImportAll();
         }
      }
      
      private static function RegisterCreator(iCardID:int, createFunc:Function) : void
      {
         BattleRegisterUtil.RegisterCreator(iCardID,createFunc);
      }
      
      private static function _ImportAll() : void
      {
         a_4012.getInstance().RegisterCreator(b_179.a_403,a_4421.a_3926);
         RegisterCreator(285212673,a_3978.a_3926);
         RegisterCreator(286457876,a_4103.a_3926);
         RegisterCreator(286458064,a_4033.a_3926);
         RegisterCreator(286326804,a_4030.a_3926);
         RegisterCreator(286523412,a_3984.a_3926);
         a_3919.getInstance().RegisterCreator(15728641,a_3927.a_3926);
         a_4012.getInstance().RegisterCreator(15728641,a_3927.a_3926);
         RegisterCreator(131073,a_4166.a_4165);
         RegisterCreator(65537,a_4345.a_4344);
         RegisterCreator(8388609,a_4223.a_3926);
         RegisterCreator(8388610,a_4203.a_3926);
      }
   }
}

