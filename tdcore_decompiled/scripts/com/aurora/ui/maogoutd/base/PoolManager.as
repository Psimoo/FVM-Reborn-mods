package com.aurora.ui.maogoutd.base
{
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4255;
   import com.aurora.ui.maogoutd.resource.a_3909;
   import com.aurora.ui.maogoutd.resource.effect.base.BaseOriginEffect;
   import flash.display.Sprite;
   import flash.utils.Dictionary;
   import flash.utils.getDefinitionByName;
   import flash.utils.getQualifiedClassName;
   
   public class PoolManager
   {
      
      private static var _instance:PoolManager;
      
      private var inRelease:Boolean = false;
      
      private var m_dictPool:Dictionary = new Dictionary();
      
      private var m_dictReg:Dictionary = new Dictionary();
      
      public function PoolManager()
      {
         super();
      }
      
      public static function getInstance() : PoolManager
      {
         if(_instance == null)
         {
            _instance = new PoolManager();
         }
         return _instance;
      }
      
      public function CheckOutOne(effectClass:Object, moveClipClass:Object = null) : Object
      {
         var effectClassName:String = getQualifiedClassName(effectClass);
         var poolName:String = "";
         if(moveClipClass == null)
         {
            poolName = effectClassName;
         }
         else
         {
            poolName = effectClassName + "_" + getQualifiedClassName(moveClipClass);
         }
         if(this.m_dictPool[poolName] == null)
         {
            this.m_dictPool[poolName] = [];
            this.m_dictReg[poolName] = [effectClass,moveClipClass];
         }
         var arr:Array = this.m_dictPool[poolName];
         var effect:Object = null;
         if(arr.length == 0)
         {
            if(this.inRelease)
            {
               return null;
            }
            a_3909.lastMovieClip = this.m_dictReg[poolName][1];
            effect = new this.m_dictReg[poolName][0]();
         }
         else
         {
            effect = arr.pop();
         }
         if(effect is a_3909 || effect is BaseOriginEffect)
         {
            effect.m_stBindMoveClip = this.m_dictReg[poolName][1];
         }
         if(effect is Sprite)
         {
            effect.visible = true;
         }
         return effect;
      }
      
      public function GetReleaseMoveIntruder(iTypeID:int) : a_4206
      {
         this.inRelease = true;
         var stBaseMoveIntruder:a_4206 = a_4255.getInstance().a_4256(iTypeID);
         this.inRelease = false;
         return stBaseMoveIntruder;
      }
      
      public function CheckInOne(effect:Object) : Boolean
      {
         var arr:Array = null;
         var poolName:String = getQualifiedClassName(effect);
         if(effect is a_3909 || effect is BaseOriginEffect)
         {
            if(effect.m_stBindMoveClip != null)
            {
               poolName = poolName + "_" + getQualifiedClassName(effect.m_stBindMoveClip);
            }
         }
         if(this.m_dictPool[poolName] == null)
         {
            return false;
         }
         arr = this.m_dictPool[poolName];
         if(arr.indexOf(effect) == -1)
         {
            arr.push(effect);
         }
         if(effect is Sprite)
         {
            effect.visible = false;
            if(Boolean(effect.parent) && Boolean(effect.parent.contains(effect)))
            {
               effect.parent.removeChild(effect);
            }
         }
         return true;
      }
   }
}

