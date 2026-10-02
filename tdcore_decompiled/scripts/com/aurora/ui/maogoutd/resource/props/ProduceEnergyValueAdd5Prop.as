package com.aurora.ui.maogoutd.resource.props
{
   import com.aurora.ui.maogoutd.resource.props.movie.PropDisplay1Button;
   import com.aurora.ui.maogoutd.resource.props.movie.PropUseDisplay1Effect;
   
   public class ProduceEnergyValueAdd5Prop extends a_4321
   {
      
      public function ProduceEnergyValueAdd5Prop()
      {
         super();
         effectClass = PropUseDisplay1Effect;
         buttonClass = PropDisplay1Button;
         a_1558 = new EffectObjectValue();
         a_1558.m_iEffectTypeID = EnmPropEffectType.a_1566;
         a_1558.m_iEffectValue = 5;
      }
   }
}

