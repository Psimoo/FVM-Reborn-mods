package com.aurora.ui.maogoutd.resource.defender
{
   import a_4718.b_183;
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.shot.a_4348;
   import flash.display.FrameLabel;
   
   public class a_4083 extends a_3953
   {
      
      private var m_isHighShot:Boolean;
      
      public function a_4083()
      {
         super();
         a_1095 = 125;
         a_1304 = b_183.b_191;
         a_1310 = 6;
         a_1337 = 0;
         a_1333 = true;
      }
      
      public static function a_3926() : a_3953
      {
         return PoolManager.getInstance().CheckOutOne(a_4083) as a_4083;
      }
      
      override protected function getBindMovie() : Class
      {
         return SausageHighAttackFighterMovie;
      }
      
      override public function a_1797(stFieldGrid:a_3491) : Boolean
      {
         this.m_isHighShot = false;
         return super.a_1797(stFieldGrid);
      }
      
      override public function a_3954(iCurrentTime:int) : Boolean
      {
         var stFieldGridVector:Array = null;
         var xIndex:int = 0;
         var arrMoveIntruder:Array = null;
         var stMoveIntruder:a_4206 = null;
         var stBaseShot:a_4348 = null;
         super.a_3954(iCurrentTime);
         if(a_1321 == iCurrentTime)
         {
            stFieldGridVector = a_1334.m_stCurrentBattbleFieldView.stFieldGridsVector;
            for(xIndex = 0; xIndex < BattleFieldView.a_1011; xIndex++)
            {
               arrMoveIntruder = stFieldGridVector[a_1334.m_iYGridNo][xIndex].a_1511.slice();
               for each(stMoveIntruder in arrMoveIntruder)
               {
                  if(3 == stMoveIntruder.iSpaceState)
                  {
                     this.m_isHighShot = true;
                     break;
                  }
               }
            }
            if(this.m_isHighShot)
            {
               a_1307 = a_1273;
               a_1275 = 0;
               gotoAndStop((a_1276[2] as FrameLabel).frame);
               a_1310 = 22;
               a_1309 = 50 - a_3966();
               for each(stBaseShot in a_1324)
               {
                  stBaseShot.m_isShotHighSkySpace = true;
               }
            }
         }
         return true;
      }
      
      override protected function a_3964() : int
      {
         return 70;
      }
      
      override public function a_3969(iRduceLifeValue:int) : Boolean
      {
         super.a_3969(iRduceLifeValue);
         return true;
      }
      
      override public function a_3957(iCurrentTime:int) : void
      {
         if(iCurrentTime % 2 == 0)
         {
            super.a_3957(iCurrentTime);
            if(a_1273 == 1)
            {
               a_1310 = 6;
               this.m_isHighShot = false;
               a_1309 = 26 - a_3966();
            }
         }
      }
      
      override protected function a_3955() : Number
      {
         return 0.7 * width;
      }
      
      override protected function a_3956() : Number
      {
         if(this.m_isHighShot)
         {
            return -20;
         }
         return 0.45 * height;
      }
   }
}

