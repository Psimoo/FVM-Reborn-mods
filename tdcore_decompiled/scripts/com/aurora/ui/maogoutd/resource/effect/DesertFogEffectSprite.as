package com.aurora.ui.maogoutd.resource.effect
{
   import a_4728.a_1778;
   import a_4729.a_1789;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.gamemap.newMap.SnakeYear.DesertCross.DesertFog2Effect;
   import com.aurora.ui.maogoutd.resource.shot.a_4348;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.Sprite;
   
   public class DesertFogEffectSprite extends Sprite
   {
      
      public var a_1413:Boolean = false;
      
      public var ms_ClearWaiteTimes:int;
      
      public var ms_upDateTimes:int;
      
      private var a_1267:Bitmap;
      
      private var a_1414:BitmapData;
      
      private var m_stCurrentBattleFieldView:BattleFieldView;
      
      private var m_arrLastFog:Array = [];
      
      private var m_arrFieldGrid:Array = [];
      
      private var m_sNowTime:int;
      
      private var m_iLastGridNum:int;
      
      public var InitGridNum:int;
      
      public var clearSeconds:int = 0;
      
      private var m_isClearBoo:Boolean;
      
      private var fogEffectType:int = 0;
      
      public function DesertFogEffectSprite()
      {
         super();
         mouseEnabled = false;
      }
      
      public function a_1797(stCurrentBattleFieldView:BattleFieldView) : Boolean
      {
         this.m_stCurrentBattleFieldView = stCurrentBattleFieldView;
         return true;
      }
      
      public function get LastGridNum() : int
      {
         return this.m_iLastGridNum;
      }
      
      public function OnTimeInterval(iTimeNum:uint) : void
      {
         var e:BaseDesertFogEffect = null;
         var stFieldGrid:a_3491 = null;
         if(!this.a_1413)
         {
            return;
         }
         for each(e in this.m_arrLastFog)
         {
            e.a_3957(iTimeNum);
         }
         for each(stFieldGrid in this.m_arrFieldGrid)
         {
            if(stFieldGrid.m_stDesertFogEffect != null)
            {
               stFieldGrid.m_stDesertFogEffect.a_3957(iTimeNum);
            }
         }
         ++this.m_sNowTime;
         if(this.m_isClearBoo)
         {
            if(this.m_sNowTime == this.ms_ClearWaiteTimes * 20)
            {
               this.UpdateFog(this.InitGridNum);
               this.m_isClearBoo = false;
               this.m_sNowTime = 0;
            }
         }
         else if(this.m_sNowTime % (this.ms_upDateTimes * 20) == 0)
         {
            if(this.m_iLastGridNum <= 9)
            {
               this.UpdateFog(this.m_iLastGridNum + 1);
            }
         }
         if(iTimeNum % 2 == 0)
         {
            this.clearShot();
         }
      }
      
      public function initFog(iGridNum:int = 1, waiteTimes:int = 50, upDateTime:int = 15) : void
      {
         this.ms_ClearWaiteTimes = waiteTimes;
         this.ms_upDateTimes = upDateTime;
         this.m_sNowTime = 0;
         this.m_isClearBoo = false;
         this.InitGridNum = iGridNum;
         this.UpdateFog(iGridNum);
      }
      
      public function InitData(fogType:int, clearS:int) : void
      {
         this.fogEffectType = fogType;
         this.clearSeconds = clearS;
      }
      
      public function clearFog() : void
      {
         this.m_isClearBoo = true;
         this.m_sNowTime = 0;
         this.ReleaseFog(false);
         a_1789.getInstance().dispatchEvent(new a_1778("ClearFog_Desert"));
      }
      
      public function GetDesertFogEffect() : BaseDesertFogEffect
      {
         if(this.fogEffectType == 0)
         {
            return DesertFogEffect.a_3926();
         }
         if(this.fogEffectType == 1)
         {
            return DesertFog2Effect.a_3926();
         }
         return null;
      }
      
      public function UpdateFog(iGridNum:int = 1) : void
      {
         var stFieldGridsVector:Array;
         var i:int = 0;
         var j:int = 0;
         var stFieldGrid:a_3491 = null;
         var m_stDesertFogEffect:BaseDesertFogEffect = null;
         var index:int = 0;
         var e:BaseDesertFogEffect = null;
         if(!this.a_1413)
         {
            return;
         }
         stFieldGridsVector = this.m_stCurrentBattleFieldView.stFieldGridsVector;
         if(iGridNum > this.m_iLastGridNum)
         {
            for(i = 0; i < BattleFieldView.a_1012; i++)
            {
               for(j = BattleFieldView.a_1011 - this.m_iLastGridNum; j > BattleFieldView.a_1011 - iGridNum; j--)
               {
                  stFieldGrid = this.m_stCurrentBattleFieldView.a_3438(j,i);
                  if(stFieldGrid != null)
                  {
                     if(stFieldGrid.m_stDesertFogEffect == null)
                     {
                        m_stDesertFogEffect = this.GetDesertFogEffect();
                        m_stDesertFogEffect.a_1797(false);
                        m_stDesertFogEffect.InitData(stFieldGrid,this.clearSeconds * 20);
                        m_stDesertFogEffect.x = a_3491.a_1080 * j - 30;
                        m_stDesertFogEffect.y = a_3491.a_1081 * i + 30;
                        m_stDesertFogEffect.showFog();
                        stFieldGrid.m_stDesertFogEffect = m_stDesertFogEffect;
                        this.addChild(m_stDesertFogEffect);
                        this.m_arrFieldGrid.push(stFieldGrid);
                     }
                  }
                  else
                  {
                     m_stDesertFogEffect = this.GetDesertFogEffect();
                     m_stDesertFogEffect.a_1797(false);
                     m_stDesertFogEffect.InitData2(j,i,this.m_stCurrentBattleFieldView);
                     m_stDesertFogEffect.x = a_3491.a_1080 * j - 30;
                     m_stDesertFogEffect.y = a_3491.a_1081 * i + 30;
                     m_stDesertFogEffect.showFog();
                     this.m_arrLastFog.push(m_stDesertFogEffect);
                     this.addChild(m_stDesertFogEffect);
                  }
               }
            }
         }
         else if(iGridNum < this.m_iLastGridNum)
         {
            for(i = 0; i < BattleFieldView.a_1012; i++)
            {
               for(j = BattleFieldView.a_1011 - this.m_iLastGridNum; j < BattleFieldView.a_1011 - iGridNum; j++)
               {
                  stFieldGrid = this.m_stCurrentBattleFieldView.a_3438(j,i);
                  if(stFieldGrid != null && stFieldGrid.m_stDesertFogEffect != null)
                  {
                     try
                     {
                        stFieldGrid.m_stDesertFogEffect.clearFog();
                        this.removeChild(stFieldGrid.m_stDesertFogEffect);
                        stFieldGrid.m_stDesertFogEffect = null;
                        index = this.m_arrFieldGrid.indexOf(stFieldGrid.m_stDesertFogEffect);
                        delete this.m_arrFieldGrid[index];
                     }
                     catch(error:Error)
                     {
                        trace("找不到特效!");
                     }
                  }
                  else
                  {
                     trace("清楚最后一列沙尘暴！");
                     for each(e in this.m_arrLastFog)
                     {
                        e.clearFog();
                        this.removeChild(e);
                     }
                     while(this.m_arrLastFog.length > 0)
                     {
                        this.m_arrLastFog.pop();
                     }
                  }
               }
            }
         }
         this.m_iLastGridNum = iGridNum;
      }
      
      public function ReleaseFog(bReset:Boolean = true) : void
      {
         var stFieldGrid:a_3491 = null;
         var e:BaseDesertFogEffect = null;
         if(bReset)
         {
            this.fogEffectType = 0;
            this.clearSeconds = 0;
         }
         for each(stFieldGrid in this.m_arrFieldGrid)
         {
            if(stFieldGrid.m_stDesertFogEffect != null)
            {
               stFieldGrid.m_stDesertFogEffect.clearFog();
               this.removeChild(stFieldGrid.m_stDesertFogEffect);
               stFieldGrid.m_stDesertFogEffect = null;
            }
         }
         while(this.m_arrFieldGrid.length > 0)
         {
            this.m_arrFieldGrid.pop();
         }
         this.m_iLastGridNum = 0;
         for each(e in this.m_arrLastFog)
         {
            e.clearFog();
            this.removeChild(e);
         }
         while(this.m_arrLastFog.length > 0)
         {
            this.m_arrLastFog.pop();
         }
      }
      
      private function HasShadowMouse(iNoY:int) : Boolean
      {
         var grid:a_3491 = null;
         for(var j:int = 0; j < BattleFieldView.a_1011; j++)
         {
            grid = this.m_stCurrentBattleFieldView.a_3438(j,iNoY);
            if(grid.HasTag(31))
            {
               return true;
            }
         }
         return false;
      }
      
      public function clearShot() : void
      {
         var stBaseShot:a_4348 = null;
         for(var i:int = 0; i < BattleFieldView.a_1012; i++)
         {
            if(!this.HasShadowMouse(i))
            {
               for each(stBaseShot in this.m_stCurrentBattleFieldView.m_stBaseShotVector[i].slice())
               {
                  if(!stBaseShot.isParabolaPath && !stBaseShot.m_isShotHighSkySpace && !stBaseShot.m_FollowingShot() && stBaseShot.x > a_3491.a_1080 * (BattleFieldView.a_1011 - this.m_iLastGridNum) && stBaseShot.x < a_3491.a_1080 * 9)
                  {
                     stBaseShot.a_4350();
                  }
               }
            }
         }
      }
   }
}

