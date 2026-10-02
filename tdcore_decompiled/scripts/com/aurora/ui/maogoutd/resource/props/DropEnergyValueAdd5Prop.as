package com.aurora.ui.maogoutd.resource.props
{
   import com.aurora.ui.maogoutd.resource.props.movie.PropDisplay3Button;
   import com.aurora.ui.maogoutd.resource.props.movie.PropUseDisplay3Effect;
   
   public class DropEnergyValueAdd5Prop extends a_4321
   {
      
      public function DropEnergyValueAdd5Prop()
      {
         super();
         effectClass = PropUseDisplay3Effect;
         buttonClass = PropDisplay3Button;
         a_1558 = new EffectObjectValue();
         a_1558.m_iEffectTypeID = EnmPropEffectType.a_1567;
         a_1558.m_iEffectValue = 5;
      }
   }
}

