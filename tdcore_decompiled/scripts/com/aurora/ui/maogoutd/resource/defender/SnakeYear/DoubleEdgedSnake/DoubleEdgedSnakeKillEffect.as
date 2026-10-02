package com.aurora.ui.maogoutd.resource.defender.SnakeYear.DoubleEdgedSnake
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.effect.a_4108;
   import flash.events.Event;
   
   public class DoubleEdgedSnakeKillEffect extends a_4108
   {
      
      public var stTargetMouveIntruder:a_4206;
      
      public var m_targetField:a_3491;
      
      public function DoubleEdgedSnakeKillEffect()
      {
         a_1271 = true;
         super();
         a_1279 = -23;
         m_iYDisplayCenterPos = -22.5;
         scaleX = scaleY = 0.6;
      }
      
      public static function a_3926() : DoubleEdgedSnakeKillEffect
      {
         return PoolManager.getInstance().CheckOutOne(DoubleEdgedSnakeKillEffect) as DoubleEdgedSnakeKillEffect;
      }
      
      override protected function getBindMovie() : Class
      {
         return DoubleEdgedSnakeKillEffectMovie;
      }
      
      override public function a_1797(isReversed:Boolean) : Boolean
      {
         super.a_1797(isReversed);
         if(this.m_targetField)
         {
            this.m_targetField.m_stCurrentBattbleFieldView.m_arrEffectArray.push(this);
         }
         play();
         return true;
      }
      
      override protected function a_4109(a_4730:Event) : void
      {
         nextFrame();
         if(a_1273 == a_1274)
         {
            this.a_3940();
         }
      }
      
      override public function a_3940() : Boolean
      {
         var stVector:Array = null;
         if(this.m_targetField)
         {
            stVector = this.m_targetField.m_stCurrentBattbleFieldView.m_arrEffectArray;
            if(-1 != stVector.indexOf(this))
            {
               stVector.splice(stVector.indexOf(this),1);
            }
         }
         super.a_3940();
         return true;
      }
   }
}

