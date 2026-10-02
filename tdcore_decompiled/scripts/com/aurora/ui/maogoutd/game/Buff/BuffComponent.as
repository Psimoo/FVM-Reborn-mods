package com.aurora.ui.maogoutd.game.Buff
{
   import a_4752.TagComponent;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.EffectManager;
   import com.aurora.ui.maogoutd.resource.a_3909;
   import com.aurora.ui.maogoutd.resource.effect.BaseGameEffect;
   import flash.utils.Dictionary;
   
   public class BuffComponent
   {
      
      public static var BUFF_TAG_BEGIN:int = 10000000;
      
      private var _tagCom:TagComponent;
      
      private var _display:a_3909;
      
      private var _grid:a_3491;
      
      private var _dictBuff:Dictionary = new Dictionary();
      
      private var _arrDeleteCache:Array = [];
      
      public function BuffComponent()
      {
         super();
      }
      
      public function a_3014(tagCom:TagComponent, display:a_3909) : void
      {
         this._tagCom = tagCom;
         this._display = display;
         this._grid = null;
      }
      
      public function InitByGrid(tagCom:TagComponent, grid:a_3491) : void
      {
         this._tagCom = tagCom;
         this._grid = grid;
         this._display = null;
      }
      
      public function GetBuff(tag:int) : BattleBuffData
      {
         tag += BUFF_TAG_BEGIN;
         return this._dictBuff[tag];
      }
      
      public function GetFirstBuff(arr:Array) : BattleBuffData
      {
         var buffData:BattleBuffData = null;
         for(var i:int = 0; i < arr.length; i++)
         {
            buffData = this.GetBuff(arr[i]);
            if(buffData != null)
            {
               return buffData;
            }
         }
         return null;
      }
      
      public function AddBuff(tag:int, duration:int, params:BattleBuffParams = null) : BattleBuffData
      {
         var stEffect:BaseGameEffect = null;
         tag += BUFF_TAG_BEGIN;
         var buffData:BattleBuffData = this._dictBuff[tag];
         if(this._tagCom.HasTag(tag) && buffData != null)
         {
            if(buffData.duration < duration)
            {
               buffData.duration = duration;
            }
            ++buffData.value;
            return null;
         }
         this._tagCom.AddTag(tag);
         buffData = new BattleBuffData();
         if(params != null)
         {
            if(params.gameMoveClipClass != null)
            {
               stEffect = EffectManager.getInstance().CheckOutOne(params.effectClass,params.gameMoveClipClass);
               if(params.startAnim != -1 && params.loopAnim != -1)
               {
                  stEffect.SetAnimationOnce2Loop(params.startAnim,params.loopAnim);
               }
               else if(params.loopAnim != -1)
               {
                  stEffect.SetAnimation(params.loopAnim);
               }
               else
               {
                  stEffect.SetAnimation(0);
               }
               buffData.stEffect = stEffect;
               buffData.endAnim = params.endAnim;
               this.UpdateBuffPos(stEffect,params);
            }
            else
            {
               buffData.stEffect = null;
            }
         }
         buffData.duration = duration;
         buffData.params = params;
         buffData.tag = tag;
         this._dictBuff[tag] = buffData;
         return buffData;
      }
      
      public function UpdateBuff(removeTick:int = 1) : void
      {
         var buffData:BattleBuffData = null;
         var i:int = 0;
         this._arrDeleteCache.length = 0;
         for each(buffData in this._dictBuff)
         {
            if(buffData != null)
            {
               buffData.duration -= removeTick;
               if(buffData.duration <= 0)
               {
                  this._arrDeleteCache.push(buffData.tag);
                  this._RemoveBuff(buffData);
               }
               else
               {
                  this.UpdateBuffPos(buffData.stEffect,buffData.params);
               }
            }
         }
         if(this._arrDeleteCache.length > 0)
         {
            for(i = 0; i < this._arrDeleteCache.length; i++)
            {
               this._dictBuff[this._arrDeleteCache[i]] = null;
            }
         }
      }
      
      private function UpdateBuffPos(stEffect:BaseGameEffect, params:BattleBuffParams) : void
      {
         if(stEffect == null)
         {
            return;
         }
         if(this._display != null)
         {
            if(params == null)
            {
               stEffect.x = this._display.x;
               stEffect.y = this._display.y;
            }
            else if(params.offsetType != -1)
            {
               if(params.offsetType == 0)
               {
                  stEffect.x = this._display.x + params.x;
                  stEffect.y = this._display.y + params.y;
               }
               else if(params.offsetType == 1)
               {
                  stEffect.x = this._display.x + 0.5 * (this._display.width - stEffect.width) + this._display.stDisplayBitmap.x + params.x;
                  stEffect.y = this._display.y + stEffect.height + this._display.stDisplayBitmap.y + params.y;
               }
               else if(params.offsetType == 2)
               {
                  stEffect.x = this._display.x + this._display.width * 0.5 + params.x;
                  stEffect.y = this._display.y + params.y;
               }
               else if(params.offsetType == 3)
               {
                  stEffect.x = params.x;
                  stEffect.y = params.y;
               }
               else if(params.offsetType == 4)
               {
                  stEffect.x = this._display.x + this._display.stDisplayBitmap.x + 0.5 * this._display.width + params.x;
                  stEffect.y = this._display.y + this._display.stDisplayBitmap.y + params.y;
               }
               else if(params.offsetType == 5)
               {
                  stEffect.x = this._display.x + this._display.stDisplayBitmap.x + 0.5 * this._display.width + params.x;
                  stEffect.y = this._display.y + this._display.stDisplayBitmap.y + 0.5 * this._display.height + params.y;
               }
            }
         }
         else if(this._grid != null)
         {
            stEffect.x = 60 * this._grid.m_iXGridNo + 30;
            stEffect.y = 64 * this._grid.m_iYGridNo + 32;
         }
      }
      
      private function _RemoveBuff(buffData:BattleBuffData) : void
      {
         this._tagCom.RemoveTag(buffData.tag);
         if(buffData.stEffect != null)
         {
            if(buffData.endAnim != -1)
            {
               buffData.stEffect.SetAnimation(buffData.endAnim,true);
            }
            else
            {
               buffData.stEffect.a_3940();
            }
            buffData.stEffect = null;
         }
         if(buffData.params == null)
         {
            return;
         }
         if(buffData.params.endCallBack != null)
         {
            buffData.params.endCallBack();
         }
      }
      
      public function RemoveBuff(tag:int) : Boolean
      {
         tag += BUFF_TAG_BEGIN;
         if(this._dictBuff[tag] == null)
         {
            return false;
         }
         this._RemoveBuff(this._dictBuff[tag]);
         this._dictBuff[tag] = null;
         return true;
      }
      
      public function RemoveLayer(tag:int) : void
      {
         tag += BUFF_TAG_BEGIN;
         if(this._dictBuff[tag] == null)
         {
            return;
         }
         var buffObj:BattleBuffData = this._dictBuff[tag];
         if(buffObj.value > 0)
         {
            --buffObj.value;
         }
         if(buffObj.value <= 0)
         {
            this._RemoveBuff(this._dictBuff[tag]);
            this._dictBuff[tag] = null;
         }
      }
      
      public function ClearAll() : void
      {
         var buffData:BattleBuffData = null;
         for each(buffData in this._dictBuff)
         {
            if(buffData != null && buffData.stEffect != null)
            {
               buffData.stEffect.a_3940();
            }
         }
         this._dictBuff = new Dictionary();
      }
   }
}

