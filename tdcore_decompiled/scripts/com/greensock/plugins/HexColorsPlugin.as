package com.greensock.plugins
{
   import com.greensock.*;
   import flash.display.*;
   
   public class HexColorsPlugin extends TweenPlugin
   {
      
      public static const API:Number = 1;
      
      protected var _colors:Array;
      
      public function HexColorsPlugin()
      {
         super();
         this.propName = "hexColors";
         this.overwriteProps = [];
         this._colors = [];
      }
      
      override public function onInitTween(target:Object, value:*, tween:TweenLite) : Boolean
      {
         var p:String = null;
         for(p in value)
         {
            this.initColor(target,p,uint(target[p]),uint(value[p]));
         }
         return true;
      }
      
      public function initColor(target:Object, propName:String, start:uint, end:uint) : void
      {
         var r:Number = NaN;
         var g:Number = NaN;
         var b:Number = NaN;
         if(start != end)
         {
            r = start >> 16;
            g = start >> 8 & 0xFF;
            b = start & 0xFF;
            this._colors[this._colors.length] = [target,propName,r,(end >> 16) - r,g,(end >> 8 & 0xFF) - g,b,(end & 0xFF) - b];
            this.overwriteProps[this.overwriteProps.length] = propName;
         }
      }
      
      override public function killProps(lookup:Object) : void
      {
         for(var i:* = int(this._colors.length - 1); i > -1; i--)
         {
            if(lookup[this._colors[i][1]] != undefined)
            {
               this._colors.splice(i,1);
            }
         }
         super.killProps(lookup);
      }
      
      override public function set changeFactor(n:Number) : void
      {
         var i:* = 0;
         var a:Array = null;
         for(i = int(this._colors.length - 1); i > -1; i--)
         {
            a = this._colors[i];
            a[0][a[1]] = a[2] + n * a[3] << 16 | a[4] + n * a[5] << 8 | a[6] + n * a[7];
         }
      }
   }
}

