package com.aurora.ui.maogoutd.resource.defender.RabbitYear.ThreeFingRabbit
{
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.shot.SecretWish.CollisionHit;
   import com.aurora.ui.maogoutd.resource.shot.a_4348;
   import flash.display.FrameLabel;
   import flash.display.MovieClip;
   import flash.geom.Rectangle;
   
   public class ThreeFingRabbitBaseShot extends a_4348
   {
      
      private static var a_1589:Array = new Array();
      
      public var stTargetField:a_3491;
      
      private var m_HitSprite:MovieClip;
      
      private var appearedTimes:int = 0;
      
      public function ThreeFingRabbitBaseShot()
      {
         super();
         a_1279 = -20;
         m_iYDisplayCenterPos = -52;
         a_1588 = true;
         a_1275 = 0;
      }
      
      public static function a_4344() : a_4348
      {
         var stThreeFingRabbitBaseAttackFighterShot:ThreeFingRabbitBaseShot = a_1589.pop();
         if(null == stThreeFingRabbitBaseAttackFighterShot)
         {
            stThreeFingRabbitBaseAttackFighterShot = new ThreeFingRabbitBaseShot();
         }
         return stThreeFingRabbitBaseAttackFighterShot;
      }
      
      override protected function getBindMovie() : Class
      {
         return ThreeFingRabbitBaseShotMovie;
      }
      
      override protected function a_3940() : Boolean
      {
         var stDefense:ThreeFingRabbitBaseAttackFighter = null;
         super.a_3940();
         if(-1 == a_1589.indexOf(this))
         {
            a_1589.push(this);
         }
         if(this.stTargetField != null && this.stTargetField.m_stAttackFighter != null && this.stTargetField.m_stAttackFighter is ThreeFingRabbitBaseAttackFighter)
         {
            stDefense = this.stTargetField.m_stAttackFighter as ThreeFingRabbitBaseAttackFighter;
            if(stDefense.m_ReciveNum > 0)
            {
               --stDefense.m_ReciveNum;
            }
         }
         if(this.m_HitSprite != null && this.contains(this.m_HitSprite))
         {
            this.removeChild(this.m_HitSprite);
         }
         this.appearedTimes = 0;
         return true;
      }
      
      override public function a_1797(iGlobalID:int, numSpeed:Number, iHurtPower:int, iXpos:int, iYpos:int, stCurrentBattleView:BattleFieldView, stStartFieldGrid:a_3491, isBothWayShot:Boolean = false, numHotMultiplier:Number = 1, iThreeRowShotType:int = 0) : Boolean
      {
         a_3916();
         a_1271 = true;
         a_3910();
         this.m_HitSprite = a_3913().m_HitSprite;
         this.addChild(this.m_HitSprite);
         a_1271 = false;
         this.appearedTimes = 0;
         super.a_1797(iGlobalID,0,iHurtPower,iXpos,iYpos,stCurrentBattleView,stStartFieldGrid,isBothWayShot,numHotMultiplier,iThreeRowShotType);
         m_isPenetrate = true;
         return true;
      }
      
      override public function a_4216(iCurrentTime:int) : void
      {
         if(this.appearedTimes == 0)
         {
            this.appearedTimes = iCurrentTime;
         }
         if(iCurrentTime - this.appearedTimes >= 0.3 * 20)
         {
            this.a_3940();
            return;
         }
         if(iCurrentTime % 2 == 0)
         {
            return;
         }
         if(a_1588)
         {
            nextFrame();
            if(a_1273 == a_1274 || a_1278 != null)
            {
               gotoAndStop((a_1276[a_1275] as FrameLabel).frame);
            }
         }
         this.CaculateScale();
      }
      
      public function CaculateScale() : void
      {
         if(this.stTargetField != null && this.stTargetField.m_stAttackFighter != null && this.stTargetField.m_stAttackFighter is ThreeFingRabbitBaseAttackFighter)
         {
            this.a_4351();
         }
         else
         {
            this.a_3940();
         }
      }
      
      override protected function a_4351() : void
      {
         var stMoveIntruder:a_4206 = null;
         var rect:Rectangle = null;
         for(var j:int = 0; j < a_1583.m_arrBaseMoveIntruderVector.length; j++)
         {
            stMoveIntruder = a_1583.m_arrBaseMoveIntruderVector[j];
            if(stMoveIntruder != null && stMoveIntruder.iLifeValue > 0 && stMoveIntruder.iSpaceState != 1)
            {
               if(this.stTargetField != null && this.stTargetField.m_iYGridNo >= stMoveIntruder.m_stCurrentFieldGrid.m_iYGridNo)
               {
                  rect = CollisionHit.complexIntersectionRectangle(this.m_HitSprite,stMoveIntruder);
                  if(rect.width != 0 && rect.height != 0)
                  {
                     if(m_HitMouseArray.indexOf(stMoveIntruder) == -1)
                     {
                        m_HitMouseArray.push(stMoveIntruder);
                        stMoveIntruder.a_4210();
                     }
                  }
               }
            }
         }
      }
   }
}

