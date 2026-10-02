package com.aurora.ui.maogoutd.resource.defender
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.effect.a_4111;
   import com.aurora.ui.maogoutd.resource.tools.a_4448;
   
   public class a_4009 extends a_3972
   {
      
      private var a_1363:a_4448;
      
      public function a_4009()
      {
         super();
         a_1095 = 0;
         a_1333 = true;
      }
      
      public static function a_3926() : a_3972
      {
         return PoolManager.getInstance().CheckOutOne(a_4009) as a_4009;
      }
      
      override protected function getBindMovie() : Class
      {
         return CrabCommonInsuranceDefenseMovie;
      }
      
      override public function a_1797(stFieldGrid:a_3491) : Boolean
      {
         return super.a_1797(stFieldGrid);
      }
      
      override public function a_3969(iRduceLifeValue:int) : Boolean
      {
         super.a_3969(iRduceLifeValue);
         return true;
      }
      
      override public function a_3973(iCurrentTime:int) : Boolean
      {
         var stCommonWaterSpray:a_4111 = null;
         var numOrigXPos:Number = x;
         super.a_3973(iCurrentTime);
         if(m_isGoHit && 3 != a_1275 && (x > 1 || a_1283 && x < BattleFieldView.a_1013 - 1))
         {
            a_1275 = 3;
            if(null == this.a_1363 && Boolean(parent))
            {
               this.a_1363 = a_4448.a_3926();
               this.a_1363.a_1797(a_1283);
               if(a_1283)
               {
                  this.a_1363.x = x - 0.5 * (stDisplayBitmap.width - this.a_1363.width) + 13;
               }
               else
               {
                  this.a_1363.x = x + 0.5 * (stDisplayBitmap.width - this.a_1363.width) - 13;
               }
               this.a_1363.y = y + stDisplayBitmap.height - 0.5 * this.a_1363.height - 20;
               parent.addChildAt(this.a_1363,1);
            }
            stCommonWaterSpray = a_4111.a_3926();
            stCommonWaterSpray.a_1797(a_1283);
            if(a_1283)
            {
               stCommonWaterSpray.x = x - 0.5 * (stDisplayBitmap.width - stCommonWaterSpray.width) - 23;
            }
            else
            {
               stCommonWaterSpray.x = x + 0.5 * (stDisplayBitmap.width - stCommonWaterSpray.width) + 23;
            }
            stCommonWaterSpray.y = a_3491.a_1081 * (a_1334.m_iYGridNo + 0.85);
            parent.addChild(stCommonWaterSpray);
         }
         if(this.a_1363)
         {
            this.a_1363.nextFrame();
            this.a_1363.x += x - numOrigXPos;
         }
         return false;
      }
      
      override public function a_3940() : Boolean
      {
         if(this.a_1363)
         {
            this.a_1363.a_3940();
            this.a_1363 = null;
         }
         super.a_3940();
         return true;
      }
   }
}

