package com.aurora.ui.maogoutd.resource.shot
{
   import a_4718.b_182;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   
   public class AvatarSuperDianCiCannonShot extends a_4348
   {
      
      private static var ms_stAvatarSuperDianCiCannonShotVector:Array = new Array();
      
      private var m_targetField:a_3491;
      
      public var m_SlowRate:Number;
      
      public var m_SlowTime:Number;
      
      public function AvatarSuperDianCiCannonShot()
      {
         super();
         a_1279 = -width * 0.5;
         a_1588 = true;
      }
      
      public static function a_4344() : a_4348
      {
         var stAvatarSuperDianCiCannonShot:AvatarSuperDianCiCannonShot = ms_stAvatarSuperDianCiCannonShotVector.pop();
         if(null == stAvatarSuperDianCiCannonShot)
         {
            stAvatarSuperDianCiCannonShot = new AvatarSuperDianCiCannonShot();
         }
         BattleFieldView.a_1017.play();
         return stAvatarSuperDianCiCannonShot;
      }
      
      override protected function getBindMovie() : Class
      {
         return AvatarSuperDianCiCannonShotMovie;
      }
      
      override public function a_1797(iGlobalID:int, numSpeed:Number, iHurtPower:int, iXpos:int, iYpos:int, stCurrentBattleView:BattleFieldView, stStartFieldGrid:a_3491, isBothWayShot:Boolean = false, numHotMultiplier:Number = 1, iThreeRowShotType:int = 0) : Boolean
      {
         var tempY:int = 0;
         super.a_1797(iGlobalID,numSpeed,iHurtPower,iXpos,iYpos,stCurrentBattleView,stStartFieldGrid,isBothWayShot,numHotMultiplier);
         a_1447 = 0;
         m_numXSpeed *= -1;
         this.m_targetField = stStartFieldGrid.m_stCurrentBattbleFieldView.a_3438(4,3);
         var tempX:int = this.m_targetField.m_iXGridNo * a_3491.a_1080 - this.width / 2 + 34;
         tempY = this.m_targetField.m_iYGridNo * a_3491.a_1081 - this.height / 2 + 40;
         x = tempX;
         y = tempY;
         a_1584 = this.m_targetField;
         a_1275 = 0;
         a_1587 = 0;
         gotoAndStop(1);
         return true;
      }
      
      override protected function a_3940() : Boolean
      {
         super.a_3940();
         if(-1 == ms_stAvatarSuperDianCiCannonShotVector.indexOf(this))
         {
            ms_stAvatarSuperDianCiCannonShotVector.push(this);
         }
         return true;
      }
      
      override public function a_4216(iCurrentTime:int) : void
      {
         trace("m_iCurrentFrame:" + a_1273);
         if(m_isHited)
         {
            if(a_1273 == a_1274)
            {
               this.a_3940();
            }
            nextFrame();
            return;
         }
         if(a_1588)
         {
            nextFrame();
            if(a_1273 == a_1274 - 18 || a_1278 != null)
            {
               this.a_4373(a_1584);
            }
            else if(a_1273 == a_1274 - 1 || a_1278 != null)
            {
               this.a_4373(a_1584);
            }
            if(a_1273 == a_1274 || a_1278 != null)
            {
               this.a_3940();
            }
         }
      }
      
      private function a_4373(a_1334:a_3491) : void
      {
         var xStart:int = 0;
         var xEnd:int = 0;
         var yStart:int = 0;
         var yEnd:int = 0;
         var stFieldGridVector:Array = null;
         var yIndex:int = 0;
         var xIndex:int = 0;
         var arrMoveIntruder:Array = null;
         var stMoveIntruder:a_4206 = null;
         if(a_1334 != null)
         {
            xStart = Math.max(a_1334.m_iXGridNo - 3,0);
            xEnd = Math.min(a_1334.m_iXGridNo + 3,BattleFieldView.a_1011 - 1);
            yStart = Math.max(a_1334.m_iYGridNo - 3,0);
            yEnd = Math.min(a_1334.m_iYGridNo + 3,BattleFieldView.a_1012 - 1);
            stFieldGridVector = a_1334.m_stCurrentBattbleFieldView.stFieldGridsVector;
            for(yIndex = yStart; yIndex <= yEnd; yIndex++)
            {
               for(xIndex = xStart; xIndex <= xEnd; xIndex++)
               {
                  arrMoveIntruder = stFieldGridVector[yIndex][xIndex].a_1511.slice();
                  for each(stMoveIntruder in arrMoveIntruder)
                  {
                     stMoveIntruder.a_3969(a_1579);
                     if(Math.random() * 100 <= this.m_SlowRate)
                     {
                        stMoveIntruder.a_4208(b_182.a_433,this.m_SlowTime);
                     }
                  }
               }
            }
         }
      }
   }
}

