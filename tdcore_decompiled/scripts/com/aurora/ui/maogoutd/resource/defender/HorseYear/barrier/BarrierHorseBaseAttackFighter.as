package com.aurora.ui.maogoutd.resource.defender.HorseYear.barrier
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.defender.a_3953;
   import flash.display.FrameLabel;
   
   public class BarrierHorseBaseAttackFighter extends a_3953
   {
      
      private var skillCom:BarrierHorseComponent;
      
      private var hasAddTag:Boolean = false;
      
      public function BarrierHorseBaseAttackFighter()
      {
         super();
         a_1095 = BarrierHorseDefine.DEFENSE_PRICE;
         a_1333 = true;
         a_1313 = true;
         a_1310 = 8;
         a_1338 = 5;
         a_1337 = -5;
         this.skillCom = new BarrierHorseComponent();
      }
      
      public static function a_3926() : BarrierHorseBaseAttackFighter
      {
         return PoolManager.getInstance().CheckOutOne(BarrierHorseBaseAttackFighter) as BarrierHorseBaseAttackFighter;
      }
      
      override protected function getBindMovie() : Class
      {
         return BarrierHorseBaseAttackFighterMovie;
      }
      
      override public function a_1797(stFieldGrid:a_3491) : Boolean
      {
         super.a_1797(stFieldGrid);
         a_1309 = 2 * 20;
         a_1311 = BarrierHorseDefine.a_3965(a_1094);
         a_1339 = 350;
         a_1307 = 0;
         this.hasAddTag = false;
         return true;
      }
      
      override public function a_3954(iCurrentTime:int) : Boolean
      {
         if(this.hasAddTag == false)
         {
            this.hasAddTag = true;
            tagCom.AddTag(20021);
            this.skillCom.InitData(this,1,0,0);
         }
         this.skillCom.a_3897(iCurrentTime);
         return true;
      }
      
      override public function a_3957(iCurrentTime:int) : void
      {
         if(iCurrentTime % 2 == 0)
         {
            nextFrame();
            if(a_1278 != null || a_1273 == a_1274)
            {
               gotoAndStop((a_1276[a_1275] as FrameLabel).frame);
            }
            ShowPlayOther(iCurrentTime);
         }
      }
      
      override protected function a_3964() : int
      {
         return BarrierHorseDefine.a_3964(m_iSkillDegree);
      }
      
      override public function a_3940() : Boolean
      {
         if(this.hasAddTag == true)
         {
            this.hasAddTag = false;
            this.skillCom.Remove();
         }
         super.a_3940();
         return true;
      }
   }
}

