package com.aurora.ui.maogoutd.resource.skill
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   
   public class BombBoomSkillEffectConch extends BaseSkillEffect
   {
      
      public var a_1334:a_3491;
      
      private var m_isBoomed:Boolean;
      
      public function BombBoomSkillEffectConch()
      {
         a_1271 = true;
         super();
      }
      
      public static function a_3926() : BombBoomSkillEffectConch
      {
         return PoolManager.getInstance().CheckOutOne(BombBoomSkillEffectConch) as BombBoomSkillEffectConch;
      }
      
      override protected function getBindMovie() : Class
      {
         return BombBoomSkillEffectConchMovie;
      }
      
      public function a_1797(isReseaved:Boolean = false) : Boolean
      {
         a_1283 = isReseaved;
         this.visible = true;
         gotoAndStop(1);
         this.m_isBoomed = false;
         return true;
      }
      
      public function a_3940() : Boolean
      {
         gotoAndStop(1);
         PoolManager.getInstance().CheckInOne(this);
         return true;
      }
      
      public function OnTimeInterval(iTimeNum:uint) : void
      {
         var stFieldGridVector:Array = null;
         var yStart:int = 0;
         var xStart:int = 0;
         var yEnd:int = 0;
         var xEnd:int = 0;
         var yIndex:int = 0;
         var xIndex:int = 0;
         var arrMoveIntruder:Array = null;
         var stMoveIntruder:a_4206 = null;
         if(iTimeNum % 2 == 0)
         {
            nextFrame();
         }
         if(!this.m_isBoomed && a_1273 == a_1274 - 2)
         {
            this.m_isBoomed = true;
            BattleFieldView.a_1048.play();
            this.a_1334.m_stCurrentBattbleFieldView.a_3466();
            stFieldGridVector = this.a_1334.m_stCurrentBattbleFieldView.stFieldGridsVector;
            yStart = this.a_1334.m_iYGridNo - 1 < 0 ? 0 : int(this.a_1334.m_iYGridNo - 1);
            xStart = this.a_1334.m_iXGridNo - 2 < 0 ? 0 : int(this.a_1334.m_iXGridNo - 2);
            yEnd = this.a_1334.m_iYGridNo + 1 >= BattleFieldView.a_1012 ? int(BattleFieldView.a_1012 - 1) : int(this.a_1334.m_iYGridNo + 1);
            xEnd = this.a_1334.m_iXGridNo + 1 >= BattleFieldView.a_1011 ? int(BattleFieldView.a_1011 - 1) : int(this.a_1334.m_iXGridNo + 1);
            for(yIndex = yStart; yIndex <= yEnd; yIndex++)
            {
               for(xIndex = xStart; xIndex <= xEnd; xIndex++)
               {
                  arrMoveIntruder = stFieldGridVector[yIndex][xIndex].a_1511.slice();
                  for each(stMoveIntruder in arrMoveIntruder)
                  {
                     stMoveIntruder.a_4210();
                  }
               }
            }
         }
      }
   }
}

