package com.aurora.ui.maogoutd.resource.gamemap.newMap.SnakeYear.LazyBoss
{
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.Util.BattleEffectUtil;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4255;
   import com.aurora.ui.maogoutd.resource.effect.BaseGameEffect;
   import flash.display.FrameLabel;
   import flash.events.Event;
   
   public class WBBaseFansEffect extends BaseGameEffect
   {
      
      private var m_iOldFieldGridType:int;
      
      private var m_iTick:int = 0;
      
      private var m_stGrid:a_3491;
      
      private var m_stBattleView:BattleFieldView;
      
      private var m_stMap:HoneyJellyFactoryGameMap;
      
      private var m_iMaxSize:int = 0;
      
      private var m_iTickMax:int = 0;
      
      private var m_iType:int = 0;
      
      public function WBBaseFansEffect()
      {
         super();
      }
      
      public function InitData(grid:a_3491, map:HoneyJellyFactoryGameMap, maxSize:int, type:int, tick:int, maxTick:int) : void
      {
         this.m_stGrid = grid;
         this.m_stMap = map;
         this.m_stBattleView = grid.m_stCurrentBattbleFieldView;
         this.m_iMaxSize = maxSize;
         this.m_iTick = tick;
         if(this.m_iTick <= 0)
         {
            this.m_iTick = 60;
         }
         this.m_iType = type;
         play();
         a_1275 = 0;
         gotoAndStop((a_1276[0] as FrameLabel).frame);
         this.m_iTickMax = maxTick;
         if(this.m_stGrid != null)
         {
            this.m_iOldFieldGridType = this.m_stGrid.m_iFieldGridType;
            this.m_stGrid.m_iFieldGridType = 8;
         }
      }
      
      override protected function a_4109(a_4730:Event) : void
      {
         ++this.m_iTick;
         if(this.m_iType == 0)
         {
            if(this.m_iTick == this.m_iTickMax)
            {
               PlayAnimation(3);
            }
            else if(this.m_iTick == this.m_iTickMax + 30)
            {
               PlayAnimation(4);
            }
            else if(this.m_iTick == this.m_iTickMax + 40)
            {
               this.BreatheIn();
            }
         }
         else if(this.m_iTick == this.m_iTickMax)
         {
            PlayAnimation(1);
         }
         else if(this.m_iTick == this.m_iTickMax + 30)
         {
            PlayAnimation(2);
         }
         else if(this.m_iTick == this.m_iTickMax + 40)
         {
            this.BreatheOut();
         }
         if(this.m_iTick == this.m_iTickMax + 60)
         {
            this.m_iTick = 60;
            PlayAnimation(0);
         }
         super.a_4109(a_4730);
      }
      
      private function BreatheInOne(iNoX:int, iNoY:int) : void
      {
         var stMoveIntruder:a_4206 = null;
         var newGrid:a_3491 = null;
         var stTempFieldGrid:a_3491 = this.m_stBattleView.a_3438(iNoX,iNoY);
         if(stTempFieldGrid == null)
         {
            return;
         }
         var arrBaseMoveIntruderVector:Array = this.m_stBattleView.m_arrBaseMoveIntruderVector;
         var moveGridSize:Number = Math.min(iNoX - this.m_stGrid.m_iXGridNo,this.m_iMaxSize);
         for each(stMoveIntruder in stTempFieldGrid.a_1511.slice())
         {
            if(!stMoveIntruder.IsBossIntruder && !stMoveIntruder.isGoHeadNotEatDefense)
            {
               stTempFieldGrid.a_3457(stMoveIntruder);
               stTempFieldGrid.m_stCurrentBattbleFieldView.a_3457(stMoveIntruder);
               if(-1 != arrBaseMoveIntruderVector.indexOf(stMoveIntruder))
               {
                  arrBaseMoveIntruderVector.splice(arrBaseMoveIntruderVector.indexOf(stMoveIntruder),1);
               }
               newGrid = this.m_stBattleView.a_3438(stTempFieldGrid.m_iXGridNo - moveGridSize,stTempFieldGrid.m_iYGridNo);
               this.m_stBattleView.a_3459(stMoveIntruder,newGrid,false);
               stMoveIntruder.x = a_3491.a_1080 * (stTempFieldGrid.m_iXGridNo - (moveGridSize - 0.5));
            }
         }
      }
      
      private function BreatheIn() : void
      {
         BattleEffectUtil.CreateGameEffect2(WBLazyFansBreathInMovie,this.m_stGrid).SetAnimation(0,true);
         for(var i:int = this.m_stGrid.m_iXGridNo + 1; i < BattleFieldView.a_1011; i++)
         {
            this.BreatheInOne(i,this.m_stGrid.m_iYGridNo);
         }
      }
      
      private function BreatheOut() : void
      {
         var mouse:a_4206 = null;
         var mouseID:int = this.m_stMap.GetOneMouseID();
         if(mouseID == 0)
         {
            return;
         }
         BattleEffectUtil.CreateGameEffect2(WBLazyFansBreathOutMovie,this.m_stGrid).SetAnimation(0,true);
         mouse = a_4255.getInstance().a_4256(mouseID);
         mouse.a_1797((1 << 16) + this.m_stGrid.m_iYGridNo * 50 + (mouseID - 8389632),-1);
         mouse.m_stMoveIntruderTypeID = 8389008;
         mouse.x = this.m_stGrid.m_iXGridNo * a_3491.a_1080;
         mouse.y = this.m_stGrid.m_iYGridNo * a_3491.a_1081;
         this.m_stBattleView.a_3459(mouse,this.m_stGrid,true,BattleLayerDefine.INTRUDER_LAND_TYPE);
      }
      
      override public function a_3940() : Boolean
      {
         if(this.m_stGrid != null)
         {
            this.m_stGrid.m_iFieldGridType = this.m_iOldFieldGridType;
         }
         super.a_3940();
         return true;
      }
   }
}

