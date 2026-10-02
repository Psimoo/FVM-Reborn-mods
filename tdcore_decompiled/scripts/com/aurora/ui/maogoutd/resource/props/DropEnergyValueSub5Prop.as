package com.aurora.ui.maogoutd.resource.props
{
   import com.aurora.ui.maogoutd.resource.props.movie.PropDisplay4Button;
   import com.aurora.ui.maogoutd.resource.props.movie.PropUseDisplay4Effect;
   
   public class DropEnergyValueSub5Prop extends a_4321
   {
      
      public function DropEnergyValueSub5Prop()
      {
         super();
         effectClass = PropUseDisplay4Effect;
         buttonClass = PropDisplay4Button;
         a_1558 = new EffectObjectValue();
         a_1558.m_iEffectTypeID = EnmPropEffectType.a_1567;
         a_1558.m_iEffectValue = -5;
      }
   }
}

