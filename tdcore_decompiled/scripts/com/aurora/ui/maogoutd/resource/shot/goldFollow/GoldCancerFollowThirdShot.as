package com.aurora.ui.maogoutd.resource.shot.goldFollow
{
   import a_4718.b_183;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.shot.a_4348;
   import flash.display.FrameLabel;
   
   public class GoldCancerFollowThirdShot extends a_4348
   {
      
      private static var ms_stCancerFollowShotVector:Array = new Array();
      
      public function GoldCancerFollowThirdShot()
      {
         super();
         a_1279 = -width * 0.5;
         a_1573 = 1;
         a_1578 = true;
         a_1588 = true;
         a_1304 = b_183.enm_CancerFollow;
      }
      
      public static function a_4344() : a_4348
      {
         var stBaseShot:a_4348 = ms_stCancerFollowShotVector.pop();
         if(stBaseShot == null)
         {
            stBaseShot = new GoldCancerFollowThirdShot();
         }
         BattleFieldView.a_1017.play();
         return stBaseShot;
      }
      
      override protected function a_3940() : Boolean
      {
         super.a_3940();
         ms_iCritFrameLable = 0;
         if(ms_stCancerFollowShotVector.indexOf(this) == -1)
         {
            ms_stCancerFollowShotVector.push(this);
         }
         return true;
      }
      
      override protected function getBindMovie() : Class
      {
         return GoldCancerFollowThirdShotMovie;
      }
      
      override public function a_1797(param1:int, param2:Number, param3:int, param4:int, param5:int, param6:BattleFieldView, param7:a_3491, param8:Boolean = false, param9:Number = 1, param10:int = 0) : Boolean
      {
         super.a_1797(param1,param2,param3,param4,param5,param6,param7,param8,param9,param10);
         a_1275 = ms_iCritFrameLable;
         gotoAndStop((a_1276[a_1275] as FrameLabel).frame);
         a_1587 = ms_iCritFrameLable;
         return true;
      }
      
      override public function a_4216(iCurrentTime:int) : void
      {
         super.a_4216(iCurrentTime);
      }
      
      override protected function a_4351() : void
      {
         var iXGridNoID:int = 0;
         var iYGridNoID:int = 0;
         var arrMouveIntruder:Array = null;
         var stMouseIntruder:a_4206 = null;
         var stIFieldGrid:a_3491 = null;
         if(x < 0 || x > BattleFieldView.a_1013)
         {
            this.a_3940();
            return;
         }
         var stFieldGrid:a_3491 = null;
         var stBaseMoveIntruder:a_4206 = a_1583.a_3431();
         if(Boolean(stBaseMoveIntruder) && hitTestObject(stBaseMoveIntruder))
         {
            a_4352(stBaseMoveIntruder);
            stFieldGrid = stBaseMoveIntruder.m_stCurrentFieldGrid;
            if(stFieldGrid != null && Boolean(ms_iCritFrameLable))
            {
               a_4352(stBaseMoveIntruder);
               iXGridNoID = 0;
               iYGridNoID = 0;
               arrMouveIntruder = null;
               stMouseIntruder = null;
               while(iXGridNoID <= stFieldGrid.m_iXGridNo + 1)
               {
                  iYGridNoID = stFieldGrid.m_iYGridNo - 1;
                  while(iYGridNoID <= stFieldGrid.m_iYGridNo + 1)
                  {
                     stIFieldGrid = a_1583.a_3438(iXGridNoID,iYGridNoID);
                     if(stIFieldGrid != null)
                     {
                        arrMouveIntruder = stIFieldGrid.a_1511.slice();
                        for each(stMouseIntruder in arrMouveIntruder)
                        {
                           if(!stMouseIntruder.isCannotSeeByFighter && (stMouseIntruder.iSpaceState == 0 || stMouseIntruder.iSpaceState == 2))
                           {
                              stMouseIntruder.a_4209(int(a_1579 * 3 * 0.25));
                           }
                        }
                     }
                     iYGridNoID++;
                  }
                  iXGridNoID++;
               }
            }
            m_isHited = true;
            gotoAndStop((a_1276[a_1587] as FrameLabel).frame);
         }
      }
   }
}

