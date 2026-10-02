package com.aurora.ui.maogoutd.resource.shot.boss.baby
{
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4255;
   import com.aurora.ui.maogoutd.resource.shot.a_4348;
   import com.aurora.ui.maogoutd.resource.shot.boss.BaseBossShot;
   
   public class BabyBandageShot extends BaseBossShot
   {
      
      private static var ms_arrShot:Array = new Array();
      
      private var m_iMoveIntruderSequence:int;
      
      public function BabyBandageShot()
      {
         super();
         this.m_iMoveIntruderSequence = 0;
      }
      
      public static function a_4344() : a_4348
      {
         var stBaseShot:a_4348 = null;
         stBaseShot = ms_arrShot.pop();
         if(null == stBaseShot)
         {
            stBaseShot = new BabyBandageShot();
         }
         stBaseShot.visible = true;
         return stBaseShot;
      }
      
      override protected function getBindMovie() : Class
      {
         return BabyBandageShotMovie;
      }
      
      override public function a_1797(iGlobalID:int, numSpeed:Number, iHurtPower:int, iXpos:int, iYpos:int, stCurrentBattleView:BattleFieldView, stStartFieldGrid:a_3491, isBothWayShot:Boolean = false, numHotMultiplier:Number = 1, iThreeRowShotType:int = 0) : Boolean
      {
         super.a_1797(iGlobalID,numSpeed,iHurtPower,iXpos,iYpos,stCurrentBattleView,stStartFieldGrid,isBothWayShot,numHotMultiplier);
         return true;
      }
      
      override public function a_4216(iCurrentTime:int) : void
      {
         var stNextFieldGrid:a_3491 = null;
         var iFineMoveIntruderTypeID:int = 0;
         var stBaseMoveIntruder:a_4206 = null;
         var iGlobalMoveFighterID:int = 0;
         if(iCurrentTime & 1)
         {
            return;
         }
         nextFrame();
         if(15 == a_1273 && Boolean(a_1584))
         {
            a_3502(a_1584,true);
            stNextFieldGrid = a_1584.m_stCurrentBattbleFieldView.a_3438(a_1584.m_iXGridNo + 1,a_1584.m_iYGridNo);
            if(null == stNextFieldGrid)
            {
               stNextFieldGrid = a_1584.m_stCurrentBattbleFieldView.a_3438(a_1584.m_iXGridNo - 1,a_1584.m_iYGridNo);
            }
            if(a_1584.m_isNeedTray && (null == stNextFieldGrid || stNextFieldGrid.m_isNeedTray))
            {
               iFineMoveIntruderTypeID = 8388867;
            }
            else
            {
               iFineMoveIntruderTypeID = 8388755;
            }
            stBaseMoveIntruder = a_4255.getInstance().a_4256(iFineMoveIntruderTypeID);
            if(!stBaseMoveIntruder)
            {
               return;
            }
            iGlobalMoveFighterID = (m_iGlobalID << 16) + ++this.m_iMoveIntruderSequence;
            stBaseMoveIntruder.a_1797(iGlobalMoveFighterID,-1);
            stBaseMoveIntruder.m_stMoveIntruderTypeID = iFineMoveIntruderTypeID;
            stBaseMoveIntruder.x = a_1584.m_iXGridNo * a_3491.a_1080;
            stBaseMoveIntruder.y = stBaseMoveIntruder.iYPosSkewing + (a_1584.m_iYGridNo + 1) * a_3491.a_1081 - stBaseMoveIntruder.height;
            a_1584.m_stCurrentBattbleFieldView.AddToBattleView(stBaseMoveIntruder,BattleLayerDefine.INTRUDER_LAND_TYPE,a_1584);
            a_1584.m_stCurrentBattbleFieldView.a_3459(stBaseMoveIntruder,a_1584,false);
         }
         else if(a_1273 == a_1274)
         {
            this.a_3940();
         }
      }
      
      override protected function a_3940() : Boolean
      {
         super.a_3940();
         if(-1 == ms_arrShot.indexOf(this))
         {
            ms_arrShot.push(this);
         }
         return true;
      }
   }
}

