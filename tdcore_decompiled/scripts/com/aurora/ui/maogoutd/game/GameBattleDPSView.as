package com.aurora.ui.maogoutd.game
{
   import a_4723.a_1767;
   import a_4728.a_1778;
   import a_4729.a_1789;
   import a_4747.TweenMax;
   import com.aurora.ui.maogoutd.TDGame2V2BattleUI;
   import com.aurora.ui.maogoutd.component.dg.DgHurtNums;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.utils.clearInterval;
   import flash.utils.setInterval;
   
   public class GameBattleDPSView extends Sprite
   {
      
      private var _ui:DgHurtNums;
      
      private var _dps:int = 0;
      
      private var _intervalId:int = -1;
      
      private var _damageChange:Boolean = false;
      
      private var _timeEnd:Boolean = false;
      
      private var _lastPlay:int;
      
      public var worldMC:MovieClip;
      
      public var bgMc:MovieClip;
      
      public function GameBattleDPSView()
      {
         super();
      }
      
      public function a_3014() : void
      {
         this._dps = 0;
         if(this._ui == null)
         {
            this._ui = new DgHurtNums();
            this._ui.x = -20;
            this._ui.y = -14;
            this._ui.setSize(140,25,-1);
            this.worldMC.addChild(this._ui);
         }
         if(this._intervalId != -1)
         {
            clearInterval(this._intervalId);
         }
         this._intervalId = setInterval(this.SubmitDamage,4999);
         this.SetValue(0);
         this._damageChange = true;
         this._timeEnd = false;
         if(root)
         {
            root.addEventListener("WorldBossBloodProgress",this.OnBossBloodProgressEvent);
         }
         a_1789.getInstance().addEventListener("FastFoodStepChange",this.ReportImmediately);
         a_1789.getInstance().addEventListener("a_2062",this.ReportImmediately);
         a_1789.getInstance().addEventListener("a_2063",this.ReportImmediately);
         a_1789.getInstance().addEventListener("ReportImmediately",this.ReportImmediately);
         a_1789.getInstance().addEventListener("TimeEnd",this.OnTimeEnd);
         this.onComplete();
      }
      
      private function OnTimeEnd(stDataEvent:a_1778) : void
      {
         this._timeEnd = true;
      }
      
      private function ReportImmediately(stDataEvent:a_1778) : void
      {
         this._damageChange = true;
         this.SubmitDamage();
      }
      
      public function SubmitDamage() : void
      {
         if(this._timeEnd)
         {
            return;
         }
         if(this._damageChange == false)
         {
            return;
         }
         TDGame2V2BattleUI.a_1088.PostBOSSDamage(this._dps);
         this._damageChange = false;
      }
      
      public function a_4158() : void
      {
         if(root)
         {
            root.removeEventListener("WorldBossBloodProgress",this.OnBossBloodProgressEvent);
         }
         a_1789.getInstance().removeEventListener("FastFoodStepChange",this.ReportImmediately);
         a_1789.getInstance().removeEventListener("a_2062",this.ReportImmediately);
         a_1789.getInstance().removeEventListener("a_2063",this.ReportImmediately);
         a_1789.getInstance().removeEventListener("ReportImmediately",this.ReportImmediately);
         a_1789.getInstance().removeEventListener("TimeEnd",this.OnTimeEnd);
         if(this._intervalId != -1)
         {
            clearInterval(this._intervalId);
         }
         this._intervalId = -1;
         this._timeEnd = true;
      }
      
      private function startTween() : void
      {
         var curTime:int = a_1767.getInstance().TimeMs;
         if(this._lastPlay != -1 && curTime - this._lastPlay < 200)
         {
            return;
         }
         this._lastPlay = curTime;
         TweenMax.to(this.worldMC,0.1,{
            "scaleX":1.3,
            "scaleY":1.3,
            "onComplete":this.onTweenNext
         });
      }
      
      public function onTweenNext() : void
      {
         TweenMax.to(this.worldMC,0.06,{
            "scaleX":1,
            "scaleY":1,
            "onComplete":this.onComplete
         });
      }
      
      public function onComplete() : void
      {
         this.worldMC.scaleX = 1;
         this.worldMC.scaleY = 1;
      }
      
      private function SetValue(value:int) : void
      {
         var addSize:int = 0;
         this._ui.setValue(this._dps);
         var ss:String = value.toString();
         addSize = 0;
         addSize = ss.length * 14;
         x = 746 - addSize;
         this.bgMc.width = 110 + addSize;
         y = 544;
      }
      
      private function OnBossBloodProgressEvent(stAurDataEvent:a_1778) : void
      {
         if(this._timeEnd)
         {
            return;
         }
         var dataObj:Object = stAurDataEvent.dataObject;
         var damage:int = int(dataObj.damage);
         if(damage <= 0)
         {
            return;
         }
         if(dataObj.bDouble == true)
         {
            this.startTween();
         }
         this._dps += damage;
         this.SetValue(this._dps);
         this._damageChange = true;
      }
   }
}

