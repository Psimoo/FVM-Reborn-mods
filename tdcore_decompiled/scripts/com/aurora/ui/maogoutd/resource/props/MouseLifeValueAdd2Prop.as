package com.aurora.ui.maogoutd.resource.props
{
   import com.aurora.ui.maogoutd.resource.props.movie.PropDisplay6Button;
   import com.aurora.ui.maogoutd.resource.props.movie.PropUseDisplay6Effect;
   
   public class MouseLifeValueAdd2Prop extends a_4321
   {
      
      public function MouseLifeValueAdd2Prop()
      {
         super();
         effectClass = PropUseDisplay6Effect;
         buttonClass = PropDisplay6Button;
         a_1558 = new EffectObjectValue();
         a_1558.m_iEffectTypeID = EnmPropEffectType.a_1564;
         a_1558.m_iEffectValue = 2;
      }
   }
}

